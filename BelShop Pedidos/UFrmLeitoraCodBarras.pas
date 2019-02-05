unit UFrmLeitoraCodBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExControls, JvXPCore, JvXPButtons, JvExStdCtrls,
  JvEdit, StdCtrls, Mask, ToolEdit, CurrEdit, MMSystem, DBXpress,
  JvCheckBox;

type
  TFrmLeitoraCodBarras = class(TForm)
    Label1: TLabel;
    EdtQtdEmbalagem: TCurrencyEdit;
    Label2: TLabel;
    EdtCodBarras: TJvEdit;
    Bt_Processar: TJvXPButton;
    Panel1: TPanel;
    Bt_Retornar: TJvXPButton;
    Ckb_Referencia: TJvCheckBox;
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

    procedure Ckb_ReferenciaClick(Sender: TObject);
    procedure Ckb_ReferenciaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
    bgCheckOutSimples: Boolean;
    sgNumNFe: String;
  end;

var
  FrmLeitoraCodBarras: TFrmLeitoraCodBarras;

  // Cria Ponteiro de Transac�o
  TD: TTransactionDesc;

  sgProdLinx: String;

implementation

uses UDMBelShopPedidos, DK_Procs1, DB, UFrmBelShopPedidos;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Processa Scaneamento do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmLeitoraCodBarras.CheckProcessa: Boolean;
Var
  MySql, MySql1: String;
  iNumItens, iQtdCkOut: Integer;
  sNumSeqOC, sNumSeqItem: String;
Begin
  Result:=False;

  if bgOCNova Then
   sgNrsSeqOCs:=sgNumSeqOCNova;

  // Busca Produto na(s) OC(s) =================================================
  MySql:=' SELECT io.num_seq_oc, io.num_seq_item, io.cod_produto_linx,'+
         '        io.qtd_produto, io.qtd_checkout,'+
         '        (io.qtd_produto-io.qtd_checkout) Qtd_Saldo'+
         ' FROM OC_LOJAS_ITENS io'+
         ' WHERE io.num_seq_oc IN ('+sgNrsSeqOCs+')'+
         ' AND   io.cod_produto_linx='+sgProdLinx+
         ' ORDER BY Qtd_Saldo DESC';
  DMBelShopPedidos.CDS_BuscaRapida.Close;
  DMBelShopPedidos.SQLQ_BuscaRapida.Close;
  DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
  DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMBelShopPedidos.CDS_BuscaRapida.Open;
  iNumItens:=DMBelShopPedidos.CDS_BuscaRapida.RecordCount;

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShopPedidos.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    //==========================================================================
    // Quando N�o Existe o Produto =============================================
    //==========================================================================
    If iNumItens<1 Then
    Begin
      DMBelShopPedidos.CDS_BuscaRapida.Close;

      // Guarda Num_Seq_OC Posicionada Atualmente ==============================
      If bgOCNova Then
       sNumSeqOC:=sgNumSeqOCNova
      Else
       sNumSeqOC:=DMBelShopPedidos.CDS_OCItensCheckNUM_SEQ_OC.AsString;

      // Insere Ordem de Compra Nova ===========================================
      If bgOCNova Then
      Begin
        MySql:=' INSERT INTO OC_LOJAS_NFE'+
               ' (NUM_SEQ_OC, COD_LOJA_LINX, COD_LOJA_SIDI, DES_LOJA,'+
               '  COD_FORN_SIDI, DES_FORN_SIDI, COD_FORN_LINX, DES_FORN_LINX,'+
               '  NUM_OC, DTA_OC, COD_COMPRADOR, DES_COMPRADOR, DOC_ORIGEM,'+
               '  DTA_ORIGEM, SIS_ORIGEM)'+
               ' VALUES ('+
               sgNumSeqOCNova+', '+ //  NUM_SEQ_OC
               sgLojaLinx+', '+ // COD_LOJA_LINX
               sgLojaSidicom+', '+ // COD_LOJA_SIDI
               QuotedStr(sgNomeLoja)+', '; // DES_LOJA

               // Busca Dados do Fornecedor SIDICOM
               MySql1:=' SELECT fs.codfornecedor, fs.nomefornecedor'+
                       ' FROM FORNECEDOR fs'+
                       ' WHERE EXISTS (SELECT 1'+
                       '               FROM LINXCLIENTESFORNEC fl'+
                       '               WHERE TRIM(fl.doc_cliente)=TRIM(fs.numerocgcmf)'+
                       '               AND   fl.cod_cliente='+IntToStr(FrmBelShopPedidos.EdtNFeCodFornLinx.AsInteger)+')';
               DMBelShopPedidos.CDS_BuscaRapida.Close;
               DMBelShopPedidos.SQLQ_BuscaRapida.Close;
               DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
               DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql1);
               DMBelShopPedidos.CDS_BuscaRapida.Open;

               If Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('codfornecedor').AsString)<>'' Then
                Begin
                  MySql:=
                   MySql+QuotedStr(Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('codfornecedor').AsString))+', '+ // COD_FORN_SIDI
                         QuotedStr(Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('nomefornecedor').AsString))+',' // DES_FORN_SIDI
                End
               Else
                Begin
                  MySql:=
                   MySql+' NULL,'+ // COD_FORN_SIDI
                         ' NULL, '; // DES_FORN_SIDI
                End; // If Trim DMBelShopPedidos.CDS_BuscaRapida.FieldByName('codfornecedor').AsString<>'' Then
               DMBelShopPedidos.CDS_BuscaRapida.Close;

        MySql:=                        
         MySql+IntToStr(FrmBelShopPedidos.EdtNFeCodFornLinx.AsInteger)+', '+ // COD_FORN_LINX
               QuotedStr(FrmBelShopPedidos.EdtNFeDesFornLinx.Text)+', '+ // DES_FORN_LINX
               sgNrOCNova+','+ // NUM_OC
               ' CURRENT_DATE,'+ // DTA_OC
               ' NULL,'+ // COD_COMPRADOR
               ' NULL,'+ // DES_COMPRADOR
               ' 0,'+ // DOC_ORIGEM
               ' NULL,'+ // DTA_ORIGEM
               ' ''SEM-OC'')'; // SIS_ORIGEM
        DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);
      End; // If bgOCNova Then

      // Busca Produto LINX/SIDICOM ============================================
      MySql:=' SELECT pr.cod_produto, pr.nome, TRIM(pr.cod_auxiliar) COD_PRODUTO_SIDI'+
             ' FROM LINXPRODUTOS pr'+
             ' WHERE pr.cod_produto='+sgProdLinx; // C�digo do produto LINX
      DMBelShopPedidos.SQLQuery2.Close;
      DMBelShopPedidos.SQLQuery2.SQL.Clear;
      DMBelShopPedidos.SQLQuery2.SQL.Add(MySql);
      DMBelShopPedidos.SQLQuery2.Open;

      // Insere na OC Produto N�o Encontrado ===================================
      MySql:=' INSERT INTO OC_LOJAS_ITENS ('+
             ' NUM_SEQ_OC, NUM_SEQ_ITEM, COD_PRODUTO_SIDI, COD_PRODUTO_LINX,'+
             ' DES_PRODUTO, QTD_PRODUTO, VLR_UNI_COMPRA, VLR_TOT_COMPRA,'+
             ' QTD_CHECKOUT, DTA_CHECKOUT, HRA_CHECKOUT)'+

             ' VALUES ('+
             sNumSeqOC+', '+ // NUM_SEQ_OC da OC Onde Estiver Posicionado

             // NUM_SEQ_ITEM da OC Onde Estiver Posicionado
             ' (SELECT COALESCE(MAX(oi.num_seq_item)+1 ,1) SEQ'+
             '  FROM OC_LOJAS_ITENS oi'+
             '  WHERE oi.num_seq_oc='+sNumSeqOC+'),';

             // COD_PRODUTO_SIDI
             If Trim(DMBelShopPedidos.SQLQuery2.FieldByName('COD_PRODUTO_SIDI').AsString)='' Then
              MySql:=
               MySql+' NULL, '
             Else
              MySql:=
               MySql+QuotedStr(DMBelShopPedidos.SQLQuery2.FieldByName('COD_PRODUTO_SIDI').AsString)+', ';

      MySql:=
       MySql+sgProdLinx+', '+ // COD_PRODUTO_LINX
             QuotedStr(Trim(DMBelShopPedidos.SQLQuery2.FieldByName('Nome').AsString))+', '+ // DES_PRODUTO
             IntToStr(EdtQtdEmbalagem.AsInteger)+', '+ // QTD_PRODUTO - Quantidade da Empbagem
             ' NULL, '+ // VLR_UNI_COMPRA
             ' NULL, '+ // NULL VLR_TOT_COMPRA
             IntToStr(EdtQtdEmbalagem.AsInteger)+', '+ // QTD_CHECKOUT - Quantidade da Empbagem
             ' CURRENT_DATE, '+ // DTA_CHECKOUT
             ' CURRENT_TIME)'; //  HRA_CHECKOUT
      DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

      DMBelShopPedidos.SQLQuery2.Close;

      // Insere Produto N�o Encontrado no Controle de OC/NFe ===================
      MySql:=' INSERT INTO OC_LOJAS_ITENS_NFE ('+
             ' NUM_SEQ_OC, NUM_SEQ_ITEM, NUM_NFE, QTD_CHECKOUT,'+
             ' DTA_CHECKOUT, HRA_CHECKOUT, IND_OC)'+
             ' VALUES ('+
             sNumSeqOC+', '+ // NUM_SEQ_OC

             // NUM_SEQ_ITEM do Ultima Item Incluido
             ' (SELECT MAX(oi.num_seq_item) FROM OC_LOJAS_ITENS oi WHERE oi.num_seq_oc='+sNumSeqOC+'), '+

             sgNumNFe+', '+ // NUM_NFE,
             IntToStr(EdtQtdEmbalagem.AsInteger)+', '+ // QTD_CHECKOUT
             ' CURRENT_DATE, '+ // DTA_CHECKOUT
             ' CURRENT_TIME, '+ //  HRA_CHECKOUT
             QuotedStr('N')+')'; // IND_OC
      DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);
    End; // If iNumItens<1 Then
    // Quando N�o Existe o Produto =============================================
    //==========================================================================

    //==========================================================================
    // Quando Encontra Um Produto ==============================================
    //==========================================================================
    If iNumItens=1 Then
    Begin
      DMBelShopPedidos.CDS_BuscaRapida.Close;

      // Posiciona no Produto ==================================================
      If Not DMBelShopPedidos.CDS_OCItensCheck.IsEmpty Then
       DMBelShopPedidos.CDS_OCItensCheck.Locate('COD_PRODUTO_LINX',sgProdLinx,[]);

      // Guarda Num_Seq_OC Posicionada Atualmente ==================================
      sNumSeqOC:=DMBelShopPedidos.CDS_OCItensCheckNUM_SEQ_OC.AsString;

      // Atualiza Produto ======================================================
      MySql:=' UPDATE OC_LOJAS_ITENS io'+
             ' SET  io.qtd_checkout=qtd_checkout+'+IntToStr(EdtQtdEmbalagem.AsInteger)+
             ', io.dta_checkout=CURRENT_DATE'+
             ', io.hra_checkout=CURRENT_TIME'+

             ' WHERE io.num_seq_oc='+DMBelShopPedidos.CDS_OCItensCheckNUM_SEQ_OC.AsString+
             ' AND   io.num_seq_item='+DMBelShopPedidos.CDS_OCItensCheckNUM_SEQ_ITEM.AsString;
      DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

      // Insere Produto no Controle de OC/NFe ==================================
      MySql:=' INSERT INTO OC_LOJAS_ITENS_NFE ('+
             ' NUM_SEQ_OC, NUM_SEQ_ITEM, NUM_NFE, QTD_CHECKOUT,'+
             ' DTA_CHECKOUT, HRA_CHECKOUT, IND_OC)'+
             ' VALUES ('+
             sNumSeqOC+', '+ // NUM_SEQ_OC
             DMBelShopPedidos.CDS_OCItensCheckNUM_SEQ_ITEM.AsString+', '+ // NUM_SEQ_ITEM
             sgNumNFe+', '+ // NUM_NFE,
             IntToStr(EdtQtdEmbalagem.AsInteger)+', '+ // QTD_CHECKOUT
             ' CURRENT_DATE, '+ // DTA_CHECKOUT
             ' CURRENT_TIME, '+ //  HRA_CHECKOUT
             QuotedStr(DMBelShopPedidos.CDS_OCItensCheckIND_OC.AsString)+')'; // IND_OC
      DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);
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
        While Not DMBelShopPedidos.CDS_BuscaRapida.Eof do
        Begin
          sNumSeqOC  :=DMBelShopPedidos.CDS_BuscaRapida.FieldByName('num_seq_oc').AsString;
          sNumSeqItem:=DMBelShopPedidos.CDS_BuscaRapida.FieldByName('num_seq_item').AsString;

          // Posiciona no Produto ======================================================
           DMBelShopPedidos.CDS_OCItensCheck.Locate('NUM_SEQ_OC; NUM_SEQ_ITEM; COD_PRODUTO_LINX',
                                                 VarArrayOf([sNumSeqOC, sNumSeqItem, sgProdLinx]),[]);

          //====================================================================
          // Quando Saldo Igual ou Maior que Quandidade de CheckOut ============
          //====================================================================
          If DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsInteger>=iQtdCkOut Then
          Begin
            MySql:=' UPDATE OC_LOJAS_ITENS io'+
                   ' SET  io.qtd_checkout=qtd_checkout+'+IntToStr(iQtdCkOut)+
                   ', io.dta_checkout=CURRENT_DATE'+
                   ', io.hra_checkout=CURRENT_TIME'+

                   ' WHERE io.num_seq_oc='+sNumSeqOC+
                   ' AND   io.num_seq_item='+sNumSeqItem;
            DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

            // Insere Produto no Controle de OC/NFe ============================
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
                   QuotedStr(DMBelShopPedidos.CDS_OCItensCheckIND_OC.AsString)+')'; // IND_OC
            DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

            iQtdCkOut:=0;
            Break;
          End; // If DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsInteger>=iQtdCkOut Then
          // Quando Saldo Igual ou Maior que Quandidade de CheckOut ============
          //====================================================================

          //====================================================================
          // Quando Saldo Menor que Quandidade de CheckOut =====================
          //====================================================================
          If (DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsInteger<iQtdCkOut) Then
          Begin
            MySql:=' UPDATE OC_LOJAS_ITENS io';

                   // Ultimo Registro Recebe o Resto da Qtd CheckOut ===========
                   If DMBelShopPedidos.CDS_BuscaRapida.RecNo=DMBelShopPedidos.CDS_BuscaRapida.RecordCount Then
                   Begin
                     MySql:=
                      MySql+' SET  io.qtd_checkout=qtd_checkout+'+IntToStr(iQtdCkOut);
                   End; // If DMBelShopPedidos.CDS_BuscaRapida.RecNo=DMBelShopPedidos.CDS_BuscaRapida.RecordCount Then

                   // N�o Ultimo Registro Recebe da Qtd CheckOut-Saldo =========
                   If DMBelShopPedidos.CDS_BuscaRapida.RecNo<>DMBelShopPedidos.CDS_BuscaRapida.RecordCount Then
                   Begin
                     iQtdCkOut:=iQtdCkOut-DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsInteger;

                     MySql:=
                      MySql+' SET  io.qtd_checkout=qtd_checkout+'+DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsString;
                   End; // If DMBelShopPedidos.CDS_BuscaRapida.RecNo<>DMBelShopPedidos.CDS_BuscaRapida.RecordCount Then

            MySql:=
             MySql+', io.dta_checkout=CURRENT_DATE'+
                   ', io.hra_checkout=CURRENT_TIME'+

                   ' WHERE io.num_seq_oc='+sNumSeqOC+
                   ' AND   io.num_seq_item='+sNumSeqItem;
            DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

            // Insere Produto no Controle de OC/NFe ============================
            MySql:=' INSERT INTO OC_LOJAS_ITENS_NFE ('+
                   ' NUM_SEQ_OC, NUM_SEQ_ITEM, NUM_NFE, QTD_CHECKOUT,'+
                   ' DTA_CHECKOUT, HRA_CHECKOUT, IND_OC)'+
                   ' VALUES ('+
                   sNumSeqOC+', '+ // NUM_SEQ_OC
                   sNumSeqItem+', '+ // NUM_SEQ_ITEM
                   sgNumNFe+', '; // NUM_NFE

                   // QTD_CHECKOUT
                   // Ultimo Registro Recebe o Resto da Qtd CheckOut ===========
                   If DMBelShopPedidos.CDS_BuscaRapida.RecNo=DMBelShopPedidos.CDS_BuscaRapida.RecordCount Then
                    Begin
                      MySql:=
                       MySql+IntToStr(iQtdCkOut)+', ';
                       iQtdCkOut:=0;
                    End
                   Else
                    Begin
                      MySql:=
                       MySql+DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsString+', ';
                    End;

            MySql:=
             MySql+' CURRENT_DATE, '+ // DTA_CHECKOUT
                   ' CURRENT_TIME, '+ //  HRA_CHECKOUT
                   QuotedStr(DMBelShopPedidos.CDS_OCItensCheckIND_OC.AsString)+')'; // IND_OC
            DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);
          End; // If DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Qtd_Saldo').AsInteger<iQtdCkOut Then
          // Quando Saldo Menor que Quandidade de CheckOut =====================
          //====================================================================

          DMBelShopPedidos.CDS_BuscaRapida.Next;
        End; // While Not DMBelShopPedidos.CDS_BuscaRapida.Eof do
      End; // While iQtdCkOut>0 do

      DMBelShopPedidos.CDS_BuscaRapida.Close;
    End; // If iNumItens>1 Then
    // Quando Encontra Mais de Um Produto ======================================
    //==========================================================================

    // Atualiza Transacao ======================================================
    DMBelShopPedidos.SQLC.Commit(TD);
  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShopPedidos.SQLC.Rollback(TD);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transa��o
  DateSeparator:='/';
  DecimalSeparator:=',';

  // Busca OC NOVA =============================================================
  If bgOCNova Then
  Begin
    FrmBelShopPedidos.CheckOutBuscaOC;
  End; // If bgOCNova Then

  // Reabre Client dos Produtos da OC ==========================================
  If Not bgOCNova Then
  Begin
    DMBelShopPedidos.CDS_OCItensCheck.DisableControls;
    DMBelShopPedidos.CDS_OCItensCheck.Close;
    DMBelShopPedidos.CDS_OCItensCheck.Open;
  End; // If Not bgOCNova Then

//  // Acerta Endere�amento Quando For CD ========================================
//  If sgLojaLinx='2' Then
//  Begin
//    FrmBelShopPedidos.CheckOutColocaEnderecamento;
//  End; // If sgLojaLinx='2' Then
  DMBelShopPedidos.CDS_OCItensCheck.EnableControls;

  // Posiciona no Produto ======================================================
  DMBelShopPedidos.CDS_OCItensCheck.Locate('NUM_SEQ_OC; COD_PRODUTO_LINX',VarArrayOf([sNumSeqOC, sgProdLinx]),[]);

  bgOCNova:=False;
  Screen.Cursor:=crDefault;

  Result:=True;
End; // Processa Scaneamento do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produto pelo Codigo de Barras >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmLeitoraCodBarras.BuscaProdutoLinx(sCodBarras: String): Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  //============================================================================
  // Busca Produto Linx pelo Codigo de Barras ==================================
  //============================================================================
  If Not Ckb_Referencia.Checked Then
  Begin
    MySql:=' SELECT pr.cod_produto'+
           ' FROM LINXPRODUTOS pr'+
           ' WHERE pr.cod_barra='+QuotedStr(sCodBarras)+

           ' UNION'+

           ' SELECT cb.cod_produto'+
           ' FROM LINXPRODUTOSCODBAR cb'+
           ' WHERE cb.cod_barra='+QuotedStr(sCodBarras);
    DMBelShopPedidos.CDS_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMBelShopPedidos.CDS_BuscaRapida.Open;
    sgProdLinx:=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString);
    DMBelShopPedidos.CDS_BuscaRapida.Close;
  End; // If Not Ckb_Referencia.Checked Then
  // Busca Produto Linx pelo Codigo de Barras ==================================
  //============================================================================

  //============================================================================
  // Busca Produto Linx pelo Codigo de Referencia ==============================
  //============================================================================
  If Ckb_Referencia.Checked Then
  Begin
    MySql:=' SELECT p.cod_produto'+
           ' FROM LINXPRODUTOS p'+
           ' WHERE p.cod_fornecedor='+IntToStr(FrmBelShopPedidos.EdtNFeCodFornLinx.AsInteger)+
           ' AND   TRIM(UPPER(p.referencia))='+QuotedStr(sCodBarras);
    DMBelShopPedidos.CDS_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMBelShopPedidos.CDS_BuscaRapida.Open;
    sgProdLinx:=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString);
    DMBelShopPedidos.CDS_BuscaRapida.Close;
  End; // If Ckb_Referencia.Checked Then
  // Busca Produto Linx pelo Codigo de Referencia ==============================
  //============================================================================

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
  If Not Ckb_Referencia.Checked Then
  Begin
    If Length(EdtCodBarras.Text)=13 Then
     Bt_ProcessarClick(Self);
  End; // If Not Ckb_Referencia.Checked Then

end;

procedure TFrmLeitoraCodBarras.EdtCodBarrasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If (key=Vk_Return) And (StrToInt64Def(EdtCodBarras.Text,0)<>0) Then
   Bt_ProcessarClick(Self);

end;

procedure TFrmLeitoraCodBarras.Bt_ProcessarClick(Sender: TObject);
Var
  bSiga: Boolean;
begin
  //============================================================================
  // Leitora de Codigo de Barras SIMPLE ========================================
  //============================================================================
  If bgCheckOutSimples Then
  Begin
    Screen.Cursor:=crAppStart;

    //==========================================================================
    // Busca Pelo Codigo de Barras =============================================
    //==========================================================================
    If Not Ckb_Referencia.Checked Then
    Begin
      If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
       Begin

         // Busca Produtos =======================================================
         If Not BuscaProdutoLinx(EdtCodBarras.Text) Then
         Begin
           Screen.Cursor:=crDefault;

           PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
           msg('N�o Foi Encontrado Produto com'+cr+'C�digo de Barras Informado !!','A');
           EdtCodBarras.SetFocus;
           Exit;
         End;

         // Processa Scaneamento do Produto ======================================
         CheckProcessa;
       End
      Else // If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
       Begin
         msg('C�digo de Barras Inv�lido !!','A');
       End; // If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
    End; // If Not Ckb_Referencia.Checked Then
    // Busca Pelo Codigo de Barras =============================================
    //==========================================================================

    //==========================================================================
    // Busca Pelo Codigo de Referencia =========================================
    //==========================================================================
    If Ckb_Referencia.Checked Then
    Begin
      bSiga:=True;
      Try
        If StrToInt(EdtCodBarras.Text)=0 Then
        Begin
          msg('C�digo de Refer�ncia Inv�lido !!','A');
          bSiga:=False;
        End; // If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
      Except
      End;

      // Busca Produtos ========================================================
      If bSiga Then
      Begin
        If Not BuscaProdutoLinx(EdtCodBarras.Text) Then
        Begin
          Screen.Cursor:=crDefault;

          PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
          msg('N�o Foi Encontrado Produto com'+cr+'C�digo de Refer�ncia Informado !!','A');
          EdtCodBarras.SetFocus;
          Exit;
        End; // If Not BuscaProdutoLinx(EdtCodBarras.Text) Then

        // Processa Scaneamento do Produto ======================================
        CheckProcessa;
      End; // If bSiga Then
    End; // If Ckb_Referencia.Checked Then
    // Busca Pelo Codigo de referencia =========================================
    //==========================================================================

    Screen.Cursor:=crDefault;
    Ckb_Referencia.Checked:=False;
    EdtQtdEmbalagem.AsInteger:=1;
    EdtCodBarras.Text:='0';
    EdtQtdEmbalagem.SetFocus;
    SelectNext(ActiveControl,True,True);
  End; // If bgCheckOutSimples Then
  // Leitora de Codigo de Barras SIMPLE ========================================
  //============================================================================

end;

procedure TFrmLeitoraCodBarras.Ckb_ReferenciaClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_Referencia);
  EdtCodBarras.SetFocus;
end;

procedure TFrmLeitoraCodBarras.Ckb_ReferenciaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Ckb_ReferenciaClick(Self);
end;

end.
