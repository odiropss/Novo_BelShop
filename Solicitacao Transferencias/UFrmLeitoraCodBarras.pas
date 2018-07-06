unit UFrmLeitoraCodBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExControls, JvXPCore, JvXPButtons, JvExStdCtrls,
  JvEdit, StdCtrls, Mask, ToolEdit, CurrEdit, MMSystem, DBXpress;

type
  TFrmLeitoraCodBarras = class(TForm)
    Label1: TLabel;
    EdtQtdEmbalagem: TCurrencyEdit;
    Label2: TLabel;
    EdtCodBarras: TJvEdit;
    Bt_Processar: TJvXPButton;
    Panel1: TPanel;
    Bt_Retornar: TJvXPButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_RetornarClick(Sender: TObject);
    procedure EdtQtdEmbalagemEnter(Sender: TObject);
    procedure EdtQtdEmbalagemExit(Sender: TObject);
    procedure EdtCodBarrasChange(Sender: TObject);
    procedure EdtCodBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ProcessarClick(Sender: TObject);

    // ODIR - INICO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    Function BuscaProdutoLinx(sCodBarras: String): Boolean;
    Function CheckProcessa: Boolean;

    // ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  private
    { Private declarations }
  public
    { Public declarations }
    bgCheckOutSimples: Boolean;
    sgNumNFe: String;
  end;

var
  FrmLeitoraCodBarras: TFrmLeitoraCodBarras;

  // Cria Ponteiro de Transacão
  TD: TTransactionDesc;

  sgProdLinx: String;

implementation

uses UDMSolicTransf, DK_Procs1, DB;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Processa Scaneamento do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmLeitoraCodBarras.CheckProcessa: Boolean;
Var
  MySql: String;
  iNumItens, iQtdCkOut: Integer;
  sNumSeqOC, sNumSeqItem: String;
Begin
  // Busca Produto na(s) OC(s) =================================================
  MySql:=' SELECT io.num_seq_oc, io.num_seq_item, io.cod_produto_linx,'+
         '        io.qtd_produto, io.qtd_checkout,'+
         '        (io.qtd_produto-io.qtd_checkout) Qtd_Saldo'+
         ' FROM OC_LOJAS_ITENS io'+
         ' WHERE io.num_seq_oc IN ('+sgNrsSeqOCs+')'+
         ' AND   io.cod_produto_linx='+sgProdLinx+
         ' ORDER BY Qtd_Saldo DESC';
  DMSolicTransf.CDS_BuscaRapida.Close;
  DMSolicTransf.SQLQ_BuscaRapida.Close;
  DMSolicTransf.SQLQ_BuscaRapida.SQL.Clear;
  DMSolicTransf.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMSolicTransf.CDS_BuscaRapida.Open;
  iNumItens:=DMSolicTransf.CDS_BuscaRapida.RecordCount;

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMSolicTransf.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    //==========================================================================
    // Quando Não Existe o Produto =============================================
    //==========================================================================
    If iNumItens<1 Then
    Begin
      DMSolicTransf.CDS_BuscaRapida.Close;

      // Guarda Num_Seq_OC Posicionada Atualmente ==============================
      sNumSeqOC:=DMSolicTransf.CDS_OCItensCheckNUM_SEQ_OC.AsString;

      // Busca Produto LINX/SIDICOM ============================================
      MySql:=' SELECT pr.cod_produto, pr.nome, TRIM(pr.cod_auxiliar) COD_PRODUTO_SIDI'+
             ' FROM LINXPRODUTOS pr'+
             ' WHERE pr.cod_produto='+sgProdLinx; // Código do produto LINX
      DMSolicTransf.SQLQuery2.Close;
      DMSolicTransf.SQLQuery2.SQL.Clear;
      DMSolicTransf.SQLQuery2.SQL.Add(MySql);
      DMSolicTransf.SQLQuery2.Open;

      // Insere na OC Produto Não Encontrado ===================================
      MySql:=' INSERT INTO OC_LOJAS_ITENS ('+
             ' NUM_SEQ_OC, NUM_SEQ_ITEM, COD_PRODUTO_SIDI, COD_PRODUTO_LINX,'+
             ' DES_PRODUTO, QTD_PRODUTO, VLR_UNI_COMPRA, VLR_TOT_COMPRA,'+
             ' QTD_CHECKOUT, DTA_CHECKOUT, HRA_CHECKOUT)'+

             ' VALUES ('+
             sNumSeqOC+', '+ // NUM_SEQ_OC da OC Onde Estiver Posicionado

             ' (SELECT COALESCE(MAX(oi.num_seq_item)+1 ,1) SEQ'+
             '  FROM OC_LOJAS_ITENS oi'+
             '  WHERE oi.num_seq_oc='+sNumSeqOC+'),'; // NUM_SEQ_ITEM da OC Onde Estiver Posicionado

             // COD_PRODUTO_SIDI
             If Trim(DMSolicTransf.SQLQuery2.FieldByName('COD_PRODUTO_SIDI').AsString)='' Then
              MySql:=
               MySql+' NULL, '
             Else
              MySql:=
               MySql+QuotedStr(DMSolicTransf.SQLQuery2.FieldByName('COD_PRODUTO_SIDI').AsString)+', ';

      MySql:=
       MySql+sgProdLinx+', '+ // COD_PRODUTO_LINX
             QuotedStr(Trim(DMSolicTransf.SQLQuery2.FieldByName('Nome').AsString))+', '+ // DES_PRODUTO
             IntToStr(EdtQtdEmbalagem.AsInteger)+', '+ // QTD_PRODUTO - Quantidade da Empbagem
             ' NULL, '+ // VLR_UNI_COMPRA
             ' NULL, '+ // NULL VLR_TOT_COMPRA
             IntToStr(EdtQtdEmbalagem.AsInteger)+', '+ // QTD_CHECKOUT - Quantidade da Empbagem
             ' CURRENT_DATE, '+ // DTA_CHECKOUT
             ' CURRENT_TIME)'; //  HRA_CHECKOUT
      DMSolicTransf.SQLC.Execute(MySql,nil,nil);

      DMSolicTransf.SQLQuery2.Close;

      // Insere Produto Não Encontrado no Controle de OC/NFe ===================
      MySql:=' INSERT INTO OC_LOJAS_ITENS_NFE ('+
             ' NUM_SEQ_OC, NUM_SEQ_ITEM, NUM_NFE, QTD_CHECKOUT,'+
             ' DTA_CHECKOUT, HRA_CHECKOUT, IND_OC)'+
             ' VALUES ('+
             sNumSeqOC+', '+ // NUM_SEQ_OC

             ' (SELECT MAX(oi.num_seq_item) FROM OC_LOJAS_ITENS oi WHERE oi.num_seq_oc='+sNumSeqOC+'), '+ // NUM_SEQ_ITEM
             sgNumNFe+', '+ // NUM_NFE,
             IntToStr(EdtQtdEmbalagem.AsInteger)+', '+ // QTD_CHECKOUT
             ' CURRENT_DATE, '+ // DTA_CHECKOUT
             ' CURRENT_TIME, '+ //  HRA_CHECKOUT
             QuotedStr('N')+')'; // IND_OC
      DMSolicTransf.SQLC.Execute(MySql,nil,nil);
    End; // If iNumItens<1 Then
    // Quando Não Existe o Produto =============================================
    //==========================================================================

    //==========================================================================
    // Quando Encontra Um Produto ==============================================
    //==========================================================================
    If iNumItens=1 Then
    Begin
      DMSolicTransf.CDS_BuscaRapida.Close;

      // Posiciona no Produto ==================================================
      DMSolicTransf.CDS_OCItensCheck.Locate('COD_PRODUTO_LINX',sgProdLinx,[]);

      // Guarda Num_Seq_OC Posicionada Atualmente ==================================
      sNumSeqOC:=DMSolicTransf.CDS_OCItensCheckNUM_SEQ_OC.AsString;

      // Atualiza Produto ======================================================
      MySql:=' UPDATE OC_LOJAS_ITENS io'+
             ' SET  io.qtd_checkout=qtd_checkout+'+IntToStr(EdtQtdEmbalagem.AsInteger)+
             ', io.dta_checkout=CURRENT_DATE'+
             ', io.hra_checkout=CURRENT_TIME'+

             ' WHERE io.num_seq_oc='+DMSolicTransf.CDS_OCItensCheckNUM_SEQ_OC.AsString+
             ' AND   io.num_seq_item='+DMSolicTransf.CDS_OCItensCheckNUM_SEQ_ITEM.AsString;
      DMSolicTransf.SQLC.Execute(MySql,nil,nil);

      // Insere Produto Não Encontrado no Controle de OC/NFe ===================
      MySql:=' INSERT INTO OC_LOJAS_ITENS_NFE ('+
             ' NUM_SEQ_OC, NUM_SEQ_ITEM, NUM_NFE, QTD_CHECKOUT,'+
             ' DTA_CHECKOUT, HRA_CHECKOUT, IND_OC)'+
             ' VALUES ('+
             sNumSeqOC+', '+ // NUM_SEQ_OC
             DMSolicTransf.CDS_OCItensCheckNUM_SEQ_ITEM.AsString+', '+ // NUM_SEQ_ITEM
             sgNumNFe+', '+ // NUM_NFE,
             IntToStr(EdtQtdEmbalagem.AsInteger)+', '+ // QTD_CHECKOUT
             ' CURRENT_DATE, '+ // DTA_CHECKOUT
             ' CURRENT_TIME, '+ //  HRA_CHECKOUT
             QuotedStr(DMSolicTransf.CDS_OCItensCheckIND_OC.AsString)+')'; // IND_OC
      DMSolicTransf.SQLC.Execute(MySql,nil,nil);
    End; // If iNumItens=1 Then
    // Quando Encontra Um Produto ==============================================
    //==========================================================================

    //==========================================================================
    // Quando Encontra Mais de Um Produto ======================================
    //==========================================================================
    If iNumItens>1 Then
    Begin
      iQtdCkOut:=EdtQtdEmbalagem.AsInteger;

      While iQtdCkOut>0 do
      Begin
        While Not DMSolicTransf.CDS_BuscaRapida.Eof do
        Begin
          sNumSeqOC  :=DMSolicTransf.CDS_BuscaRapida.FieldByName('num_seq_oc').AsString;
          sNumSeqItem:=DMSolicTransf.CDS_BuscaRapida.FieldByName('num_seq_item').AsString;

          // Posiciona no Produto ======================================================
           DMSolicTransf.CDS_OCItensCheck.Locate('NUM_SEQ_OC; NUM_SEQ_ITEM; COD_PRODUTO_LINX',
                                                 VarArrayOf([sNumSeqOC, sNumSeqItem, sgProdLinx]),[]);

          //====================================================================
          // Quando Saldo Igual ou Maior que Quandidade de CheckOut ============
          //====================================================================
          If DMSolicTransf.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsInteger>=iQtdCkOut Then
          Begin
            MySql:=' UPDATE OC_LOJAS_ITENS io'+
                   ' SET  io.qtd_checkout=qtd_checkout+'+IntToStr(iQtdCkOut)+
                   ', io.dta_checkout=CURRENT_DATE'+
                   ', io.hra_checkout=CURRENT_TIME'+

                   ' WHERE io.num_seq_oc='+sNumSeqOC+
                   ' AND   io.num_seq_item='+sNumSeqItem;
            DMSolicTransf.SQLC.Execute(MySql,nil,nil);

            // Insere Produto Não Encontrado no Controle de OC/NFe ===================
            MySql:=' INSERT INTO OC_LOJAS_ITENS_NFE ('+
                   ' NUM_SEQ_OC, NUM_SEQ_ITEM, NUM_NFE, QTD_CHECKOUT,'+
                   ' DTA_CHECKOUT, HRA_CHECKOUT, IND_OC)'+
                   ' VALUES ('+
                   sNumSeqOC+', '+ // NUM_SEQ_OC
                   sNumSeqItem+', '+ // NUM_SEQ_ITEM
                   sgNumNFe+', '+ // NUM_NFE,
                   IntToStr(iQtdCkOut)+', '+ // QTD_CHECKOUT
                   ' CURRENT_DATE, '+ // DTA_CHECKOUT
                   ' CURRENT_TIME, '+ //  HRA_CHECKOUT
                   QuotedStr(DMSolicTransf.CDS_OCItensCheckIND_OC.AsString)+')'; // IND_OC
            DMSolicTransf.SQLC.Execute(MySql,nil,nil);

            iQtdCkOut:=0;
            Break;
          End; // If DMSolicTransf.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsInteger>=iQtdCkOut Then
          // Quando Saldo Igual ou Maior que Quandidade de CheckOut ============
          //====================================================================

          //====================================================================
          // Quando Saldo Menor que Quandidade de CheckOut =====================
          //====================================================================
          If (DMSolicTransf.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsInteger<iQtdCkOut) Then
          Begin
            MySql:=' UPDATE OC_LOJAS_ITENS io';

                   // Ultimo Registro Recebe o Resto da Qtd CheckOut ===========
                   If DMSolicTransf.CDS_BuscaRapida.RecNo=DMSolicTransf.CDS_BuscaRapida.RecordCount Then
                   Begin
                     MySql:=
                      MySql+' SET  io.qtd_checkout=qtd_checkout+'+IntToStr(iQtdCkOut);
                   End; // If DMSolicTransf.CDS_BuscaRapida.RecNo=DMSolicTransf.CDS_BuscaRapida.RecordCount Then

                   // Não Ultimo Registro Recebe da Qtd CheckOut-Saldo =========
                   If DMSolicTransf.CDS_BuscaRapida.RecNo<>DMSolicTransf.CDS_BuscaRapida.RecordCount Then
                   Begin
                     iQtdCkOut:=iQtdCkOut-DMSolicTransf.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsInteger;

                     MySql:=
                      MySql+' SET  io.qtd_checkout=qtd_checkout+'+DMSolicTransf.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsString;
                   End; // If DMSolicTransf.CDS_BuscaRapida.RecNo<>DMSolicTransf.CDS_BuscaRapida.RecordCount Then

            MySql:=
             MySql+', io.dta_checkout=CURRENT_DATE'+
                   ', io.hra_checkout=CURRENT_TIME'+

                   ' WHERE io.num_seq_oc='+sNumSeqOC+
                   ' AND   io.num_seq_item='+sNumSeqItem;
            DMSolicTransf.SQLC.Execute(MySql,nil,nil);

            // Insere Produto Não Encontrado no Controle de OC/NFe ===================
            MySql:=' INSERT INTO OC_LOJAS_ITENS_NFE ('+
                   ' NUM_SEQ_OC, NUM_SEQ_ITEM, NUM_NFE, QTD_CHECKOUT,'+
                   ' DTA_CHECKOUT, HRA_CHECKOUT, IND_OC)'+
                   ' VALUES ('+
                   sNumSeqOC+', '+ // NUM_SEQ_OC
                   sNumSeqItem+', '+ // NUM_SEQ_ITEM
                   sgNumNFe+', '; // NUM_NFE

                   // QTD_CHECKOUT
                   // Ultimo Registro Recebe o Resto da Qtd CheckOut ===========
                   If DMSolicTransf.CDS_BuscaRapida.RecNo=DMSolicTransf.CDS_BuscaRapida.RecordCount Then
                    Begin
                      MySql:=
                       MySql+IntToStr(iQtdCkOut)+', ';
                       iQtdCkOut:=0;
                    End
                   Else
                    Begin
                      MySql:=
                       MySql+DMSolicTransf.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsString+', ';
                    End;

            MySql:=
             MySql+' CURRENT_DATE, '+ // DTA_CHECKOUT
                   ' CURRENT_TIME, '+ //  HRA_CHECKOUT
                   QuotedStr(DMSolicTransf.CDS_OCItensCheckIND_OC.AsString)+')'; // IND_OC
            DMSolicTransf.SQLC.Execute(MySql,nil,nil);
          End; // If DMSolicTransf.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsInteger<iQtdCkOut Then
          // Quando Saldo Menor que Quandidade de CheckOut =====================
          //====================================================================

          DMSolicTransf.CDS_BuscaRapida.Next;
        End; // While Not DMSolicTransf.CDS_BuscaRapida.Eof do
      End; // While iQtdCkOut>0 do

      DMSolicTransf.CDS_BuscaRapida.Close;
    End; // If iNumItens>1 Then
    // Quando Encontra Mais de Um Produto ======================================
    //==========================================================================

    // Atualiza Transacao ======================================================
    DMSolicTransf.SQLC.Commit(TD);
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMSolicTransf.SQLC.Rollback(TD);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação
  DateSeparator:='/';
  DecimalSeparator:=',';

  // Reabre Client dos Produtos da OC ==========================================
  DMSolicTransf.CDS_OCItensCheck.DisableControls;
  DMSolicTransf.CDS_OCItensCheck.Close;
  DMSolicTransf.CDS_OCItensCheck.Open;
  DMSolicTransf.CDS_OCItensCheck.EnableControls;

  // Posiciona no Produto ======================================================
  DMSolicTransf.CDS_OCItensCheck.Locate('NUM_SEQ_OC; COD_PRODUTO_LINX',VarArrayOf([sNumSeqOC, sgProdLinx]),[]);

  Screen.Cursor:=crDefault;
End; // Processa Scaneamento do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produto pelo Codigo de Barras >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmLeitoraCodBarras.BuscaProdutoLinx(sCodBarras: String): Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  // Busca Produto Linx ========================================================
  MySql:=' SELECT pr.cod_produto'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE pr.cod_barra='+sCodBarras+

         'UNION'+

         ' SELECT cb.cod_produto'+
         ' FROM LINXPRODUTOSCODBAR cb'+
         ' WHERE cb.cod_barra='+sCodBarras;
  DMSolicTransf.CDS_BuscaRapida.Close;
  DMSolicTransf.SQLQ_BuscaRapida.SQL.Clear;
  DMSolicTransf.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMSolicTransf.CDS_BuscaRapida.Open;
  sgProdLinx:=Trim(DMSolicTransf.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString);
  DMSolicTransf.CDS_BuscaRapida.Close;

  If Trim(sgProdLinx)<>'' Then
   Result:=True;

End; // Busca Produto pelo Codigo de Barras >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmLeitoraCodBarras.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

procedure TFrmLeitoraCodBarras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmLeitoraCodBarras.Bt_RetornarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLeitoraCodBarras.EdtQtdEmbalagemEnter(Sender: TObject);
begin
  EdtCodBarras.Text:='0';

end;

procedure TFrmLeitoraCodBarras.EdtQtdEmbalagemExit(Sender: TObject);
begin
  EdtCodBarras.SetFocus;

end;

procedure TFrmLeitoraCodBarras.EdtCodBarrasChange(Sender: TObject);
begin
  If Length(EdtCodBarras.Text)=13 Then
   Bt_ProcessarClick(Self);

end;

procedure TFrmLeitoraCodBarras.EdtCodBarrasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If (key=Vk_Return) And (StrToInt64Def(EdtCodBarras.Text,0)<>0) Then
   Bt_ProcessarClick(Self);

end;

procedure TFrmLeitoraCodBarras.Bt_ProcessarClick(Sender: TObject);
Var
  MySql: String;
begin
  //============================================================================
  // Leitora de Codigo de Barras SIMPLE ========================================
  //============================================================================
  If bgCheckOutSimples Then
  Begin
    If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
     Begin
       Screen.Cursor:=crAppStart;

       // Busca Produtos =======================================================
       If Not BuscaProdutoLinx(EdtCodBarras.Text) Then
       Begin
         Screen.Cursor:=crDefault;

         PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
         msg('Não Foi Encontrado Produto com'+cr+cr+'Código de Barras'+cr+'Informado !!','A');
         EdtCodBarras.SetFocus;
         Exit;
       End;

       // Processa Scaneamento do Produto ======================================
       CheckProcessa;
     End
    Else // If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
     Begin
       msg('Código de Barras Inválido !!','A');
     End; // If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
     Screen.Cursor:=crDefault;
     EdtQtdEmbalagem.AsInteger:=1;
     EdtCodBarras.Text:='0';
     EdtQtdEmbalagem.SetFocus;
     SelectNext(ActiveControl,True,True);
  End; // If bgCheckOutSimples Then
  // Leitora de Codigo de Barras SIMPLE ========================================
  //============================================================================

end;

end.
