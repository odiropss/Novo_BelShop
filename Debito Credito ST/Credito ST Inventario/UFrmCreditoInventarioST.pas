unit UFrmCreditoInventarioST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, ExtCtrls, Grids, DBGrids,
  StdCtrls, ComCtrls, DBXpress, Mask, ToolEdit, CurrEdit;

type
  TFrmCreditoInventarioST = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Bt_BuscaProdutos: TJvXPButton;
    Bt_AtualizaUltCompra: TJvXPButton;
    Bt_SalvaMemoria: TJvXPButton;
    Dbg_CreditoST: TDBGrid;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Bt_LinxProdDetBusca: TJvXPButton;
    Dbg_LinxProdDet: TDBGrid;
    Bt_AtualizaUltCustoMedio: TJvXPButton;
    Bt_AtualizaCustoICMS: TJvXPButton;
    EdtCod_Loja: TCurrencyEdit;
    Label5: TLabel;
    OdirPanApres: TPanel;
    procedure Bt_BuscaProdutosClick(Sender: TObject);
    procedure Bt_AtualizaUltCompraClick(Sender: TObject);
    procedure Bt_SalvaMemoriaClick(Sender: TObject);
    procedure Bt_LinxProdDetBuscaClick(Sender: TObject);
    procedure Bt_AtualizaUltCustoMedioClick(Sender: TObject);
    procedure Bt_AtualizaCustoICMSClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCreditoInventarioST: TFrmCreditoInventarioST;

  // Cria Ponteiro de Transacão
  TD: TTransactionDesc;

implementation

uses DK_Procs1, UDMCreditoInventarioST, DBClient, DB;

{$R *.dfm}

procedure TFrmCreditoInventarioST.Bt_BuscaProdutosClick(Sender: TObject);
Var
  MySql: String;
begin
  DMCreditoInventarioST.CDS_CreditoST_CM.Close;
  DMCreditoInventarioST.CDS_CreditoST_CI.Close;

  Label1.Caption:='0';
  Label2.Caption:='0';

  If EdtCod_Loja.AsInteger<1 Then
  Begin
    msg('Favor Informar a Loja !!', 'A');
    EdtCod_Loja.SetFocus;
    Exit;
  End; // If EdtCod_Loja.AsInteger<1 Then

  Dbg_CreditoST.SetFocus;

  // Tira Data Source
  Dbg_CreditoST.DataSource:=nil;

  MySql:=' SELECT'+
         ' p.cod_produto COD_PRODUTO,'+
         ' p.ncm DES_NCM,'+
         ' p.nome DES_PRODUTO,'+
         ' 0.00 VLR_CUSTO,'+
         ' i.qtd_estoque QTD_ESTOQUE,'+
         ' 0.00 VLR_CUSTO_TOTAL,'+
         ' 0.00 VLR_BC_ST_ENTRADA,'+
         ' 0.00 VLR_BC_ST_TOTAL,'+
         ' 0.00 VLR_CRED_PRES_ST,'+
         ' ''               '' LOCALIZACAO'+

         ' FROM ODIR_INVENTARIO_DEZ i, LINXPRODUTOS p, DEB_CRED_ICMS_NCM n'+
         ' WHERE i.cod_produto=p.cod_produto'+
         ' AND p.ncm=n.des_ncm'+
         ' AND n.per_icms_efetivo=27'+
         ' AND i.qtd_estoque>0'+
         ' AND i.empresa='+VarToStr(EdtCod_Loja.AsInteger);
  DMCreditoInventarioST.CDS_Busca.Close;
  DMCreditoInventarioST.SDS_Busca.CommandText:=MySql;
  DMCreditoInventarioST.CDS_Busca.Open;

  If DMCreditoInventarioST.CDS_CreditoST.Active Then
   DMCreditoInventarioST.CDS_CreditoST.Close;

  DMCreditoInventarioST.CDS_CreditoST.CreateDataSet;
  DMCreditoInventarioST.CDS_CreditoST.IndexFieldNames:='';
  DMCreditoInventarioST.CDS_CreditoST.Open;

  DMCreditoInventarioST.CDS_CreditoST.Data:=DMCreditoInventarioST.CDS_Busca.Data;

  DMCreditoInventarioST.CDS_Busca.Close;

  // Acerta Data Source
  Dbg_CreditoST.DataSource:=DMCreditoInventarioST.DS_CreditoST;

  Label1.Caption:=IntToStr(DMCreditoInventarioST.CDS_CreditoST.RecordCount);
end;

procedure TFrmCreditoInventarioST.Bt_AtualizaUltCompraClick(Sender: TObject);
Var
  MySql: String;
  sLocalizacao: String;

  bCustoMedio: Boolean;

  cVlr_Custo, cBC_ST_Unit,
  cVlrCM, cVlrUE: Currency;
begin
  Dbg_CreditoST.SetFocus;

  If DMCreditoInventarioST.CDS_CreditoST.IsEmpty Then
  Begin
    msg('Favor Buscae os Produtos !!', 'A');
    Exit;
  End; // If DMCreditoInventarioST.CDS_CreditoST.IsEmpty Then

  cVlrCM:=0.00;
  cVlrUE:=0.00;
  DMCreditoInventarioST.CDS_CreditoST.First;
  While Not DMCreditoInventarioST.CDS_CreditoST.Eof do
  Begin
    Application.ProcessMessages;

    bCustoMedio:=False;

    // Busca Ultima Compra
    MySql:=' SELECT FIRST 1'+
//           ' mv.data_lancamento,'+
           ' mv.quantidade,'+
           ' CAST(COALESCE(mv.preco_custo, 0.00) AS NUMERIC(12,2)) PRECO_CUSTO,'+
           ' CAST(COALESCE(mv.valor_liquido, 0.00) AS NUMERIC(12,2)) VALOR_LIQUIDO,'+ // CDS_CreditoSTVLR_CUSTO
           ' CAST(COALESCE(mv.base_icms_st, 0.00) AS NUMERIC(12,2)) BASE_ICMS_ST,'+
           ' CAST((COALESCE(mv.base_icms_st, 0.00)/ mv.quantidade) AS NUMERIC(12,2)) BC_ST_UNIT'+ // CDS_CreditoSTVLR_BC_ST_ENTRADA

           ' FROM LINXMOVIMENTO mv'+
           ' WHERE mv.operacao=''E'''+
//           ' AND   (COALESCE(mv.tipo_transacao,'''')='''')'+
           ' AND   mv.excluido=''N'''+
           ' AND   mv.cancelado=''N'''+
           ' AND   mv.codigo_cliente<>13'+
//           ' AND   CAST(mv.data_lancamento AS DATE) > ''30.11.2016'''+
//           ' AND   mv.data_lancamento<''01.01.2019'''+

//           ' AND   ( (UPPER(mv.desc_cfop) LIKE ''%COMPRA%'')'+
//           '         OR'+
//           '         (Trim(mv.id_cfop) IN (''1401'', ''2401'', ''1403'', ''2403'')) )'+
//           ' AND   mv.base_icms_st<>0'+

//           ' AND   Trim(mv.id_cfop) IN (''1401'', ''2401'', ''1403'', ''2403'')'+
           '  AND   ( (mv.id_cfop=''1401'') OR (mv.id_cfop=''2401'') OR'+
           '          (mv.id_cfop=''1403'') OR (mv.id_cfop=''2403'') OR'+
           '          (mv.id_cfop=''1102'') OR (mv.id_cfop=''2102'') )'+

           ' AND   mv.cod_produto='+DMCreditoInventarioST.CDS_CreditoSTCOD_PRODUTO.AsString+

//           ' ORDER BY mv.data_documento DESC,  mv.hora_lancamento DESC';
           ' ORDER BY mv.data_documento DESC';
    DMCreditoInventarioST.SQLQ_Busca.Close;
    DMCreditoInventarioST.SQLQ_Busca.SQL.Clear;
    DMCreditoInventarioST.SQLQ_Busca.SQL.Add(MySql);
    DMCreditoInventarioST.SQLQ_Busca.Open;

    sLocalizacao:='Última Entrada';
    cVlr_Custo :=0;
    cBC_ST_Unit:=0;
    If Not DMCreditoInventarioST.SQLQ_Busca.IsEmpty Then
    Begin
      cVlr_Custo :=DMCreditoInventarioST.SQLQ_Busca.FieldByName('VALOR_LIQUIDO').AsCurrency;
      cBC_ST_Unit:=DMCreditoInventarioST.SQLQ_Busca.FieldByName('BC_ST_UNIT').AsCurrency;
    End; // If Not DMCreditoInventarioST.SQLQ_Busca.IsEmpty Then

    // Custo Médio
    If DMCreditoInventarioST.SQLQ_Busca.IsEmpty Then
     bCustoMedio:=True;

    If (Not bCustoMedio) And (cVlr_Custo=00) Then
     bCustoMedio:=True;

    If bCustoMedio Then
    Begin
      MySql:=' SELECT FIRST 1 CAST(COALESCE(d.custo_medio, 0.00) as Numeric(12,2)) CUSTO_MEDIO'+
             ' FROM LINXPRODUTOSDETALHES d'+
             ' WHERE COALESCE(d.custo_medio, 0.00)<>0'+
             ' AND d.cod_produto='+DMCreditoInventarioST.CDS_CreditoSTCOD_PRODUTO.AsString;
      DMCreditoInventarioST.SQLQ_Busca.Close;
      DMCreditoInventarioST.SQLQ_Busca.SQL.Clear;
      DMCreditoInventarioST.SQLQ_Busca.SQL.Add(MySql);
      DMCreditoInventarioST.SQLQ_Busca.Open;

      sLocalizacao:='Não Encontrado';
      If Trim(DMCreditoInventarioST.SQLQ_Busca.FieldByName('CUSTO_MEDIO').AsString)<>'' Then
      Begin
        cVlr_Custo :=DMCreditoInventarioST.SQLQ_Busca.FieldByName('CUSTO_MEDIO').AsCurrency;
        sLocalizacao:='Custo Médio';
      End;
    End; // If bCustoMedio Then
    DMCreditoInventarioST.SQLQ_Busca.Close;

    If cBC_ST_Unit=0 Then
     cBC_ST_Unit:=cVlr_Custo;

    // Atualiza Produto ========================================================
    DMCreditoInventarioST.CDS_CreditoST.Edit;
    DMCreditoInventarioST.CDS_CreditoSTVLR_CUSTO.AsCurrency:=cVlr_Custo;
    DMCreditoInventarioST.CDS_CreditoSTVLR_CUSTO_TOTAL.AsCurrency:=
        (cVlr_Custo * DMCreditoInventarioST.CDS_CreditoSTQTD_ESTOQUE.AsInteger);
    DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_ENTRADA.AsCurrency:=cBC_ST_Unit;
    DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_TOTAL.AsCurrency:=
       (cBC_ST_Unit * DMCreditoInventarioST.CDS_CreditoSTQTD_ESTOQUE.AsInteger);
    DMCreditoInventarioST.CDS_CreditoSTVLR_CRED_PRES_ST.AsCurrency:=
     ((DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_TOTAL.AsCurrency * 27)/100);
    DMCreditoInventarioST.CDS_CreditoSTLOCALIZACAO.AsString:=sLocalizacao;

    If sLocalizacao='Última Entrada' Then
     cVlrUE:=cVlrUE+DMCreditoInventarioST.CDS_CreditoSTVLR_CRED_PRES_ST.AsCurrency;
    If sLocalizacao='Custo Médio'    Then
     cVlrCM:=cVlrCM+DMCreditoInventarioST.CDS_CreditoSTVLR_CRED_PRES_ST.AsCurrency;

    DMCreditoInventarioST.CDS_CreditoST.Post;

    Label2.Caption:=IntToStr(DMCreditoInventarioST.CDS_CreditoST.RecNo);

    DMCreditoInventarioST.CDS_CreditoST.Next;
  End; // While Not DMCreditoInventarioST.CDS_CreditoST.Eof do

  DMCreditoInventarioST.CDS_CreditoST.Append;
  DMCreditoInventarioST.CDS_CreditoSTLOCALIZACAO.AsString:='Última Entrada';
  DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_TOTAL.AsCurrency:=cVlrUE;
  DMCreditoInventarioST.CDS_CreditoSTVLR_CRED_PRES_ST.AsCurrency:=(cVlrUE * 100) / (cVlrUE+cVlrCM);

  DMCreditoInventarioST.CDS_CreditoSTVLR_CUSTO.AsCurrency:=0.00;
  DMCreditoInventarioST.CDS_CreditoSTQTD_ESTOQUE.AsCurrency:=0;
  DMCreditoInventarioST.CDS_CreditoSTVLR_CUSTO_TOTAL.AsCurrency:=0.00;
  DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_ENTRADA.AsCurrency:=0.00;
  DMCreditoInventarioST.CDS_CreditoST.Post;


  DMCreditoInventarioST.CDS_CreditoST.Append;
  DMCreditoInventarioST.CDS_CreditoSTLOCALIZACAO.AsString:='Custo Médio';
  DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_TOTAL.AsCurrency:=cVlrCM;
  DMCreditoInventarioST.CDS_CreditoSTVLR_CRED_PRES_ST.AsCurrency:=(cVlrCM * 100) / (cVlrUE+cVlrCM);

  DMCreditoInventarioST.CDS_CreditoSTVLR_CUSTO.AsCurrency:=0.00;
  DMCreditoInventarioST.CDS_CreditoSTQTD_ESTOQUE.AsCurrency:=0;
  DMCreditoInventarioST.CDS_CreditoSTVLR_CUSTO_TOTAL.AsCurrency:=0.00;
  DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_ENTRADA.AsCurrency:=0.00;
  DMCreditoInventarioST.CDS_CreditoST.Post;

  msg('FIM','A');

end;


procedure TFrmCreditoInventarioST.Bt_SalvaMemoriaClick(Sender: TObject);
begin
  Dbg_CreditoST.SetFocus;

  If Not DMCreditoInventarioST.CDS_CreditoST.IsEmpty Then
  Begin
    DBGridClipboard(Dbg_CreditoST);
  End;

  If Not DMCreditoInventarioST.CDS_CreditoST_CM.IsEmpty Then
  Begin
    DBGridClipboard(Dbg_CreditoST);
  End;

  If Not DMCreditoInventarioST.CDS_CreditoST_CI.IsEmpty Then
  Begin
    DBGridClipboard(Dbg_CreditoST);
  End;

end;

procedure TFrmCreditoInventarioST.Bt_LinxProdDetBuscaClick(Sender: TObject);
Var
  MySql: String;
  sCodProd: String;
begin
  Dbg_LinxProdDet.SetFocus;

  Dbg_LinxProdDet.DataSource:=DMCreditoInventarioST.DS_Busca;

  MySql:=' select *'+
         ' from linxprodutosdetalhes d'+
         ' order by d.cod_produto,'+
         ' d.dta_atualizacao desc,  d.hra_atualizacao Desc,'+
         ' d.id_config_tributaria desc';
  DMCreditoInventarioST.CDS_Busca.Close;
  DMCreditoInventarioST.SDS_Busca.CommandText:=MySql;
  DMCreditoInventarioST.CDS_Busca.Open;

  Label3.Caption:=IntToStr(DMCreditoInventarioST.CDS_Busca.RecordCount);
  Label4.Caption:='0';

  // Verifica se Transação esta Ativa
  If DMCreditoInventarioST.SQLC.InTransaction Then
   DMCreditoInventarioST.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMCreditoInventarioST.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    sCodProd:='';
    DMCreditoInventarioST.CDS_Busca.DisableControls;
    While Not DMCreditoInventarioST.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      If sCodProd<>Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('cod_produto').AsString) Then
      Begin
        MySql:=' UPDATE LinxProdutosDetalhes d'+
               ' SET d.cod_barra='+QuotedStr(Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('cod_barra').AsString))+
               ', d.preco_custo='+f_Troca(',','.',Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('preco_custo').AsString))+
               ', d.preco_venda='+f_Troca(',','.',Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('preco_venda').AsString))+
               ', d.custo_medio='+f_Troca(',','.',Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('custo_medio').AsString));

               If Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('id_config_tributaria').AsString)<>'' Then
                MySql:=
                 MySql+', d.id_config_tributaria='+QuotedStr(Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('id_config_tributaria').AsString));

               If Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('desc_config_tributaria').AsString)<>'' Then
                MySql:=
                 MySql+', d.desc_config_tributaria='+QuotedStr(Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('desc_config_tributaria').AsString));

        MySql:=
         MySql+', d.despesas1='+f_Troca(',','.',Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('despesas1').AsString))+
               ', d.dta_atualizacao='+QuotedStr(f_Troca('/','.',f_Troca('-','.',Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('dta_atualizacao').AsString))))+
               ', d.hra_atualizacao='+QuotedStr(f_Troca('/','.',f_Troca('-','.',Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('hra_atualizacao').AsString))))+

               ' WHERE d.empresa<>'+Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('empresa').AsString)+
               ' AND   d.cod_produto='+Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('cod_produto').AsString);
        DMCreditoInventarioST.SQLC.Execute(MySql, nil, nil);
      End; // If sCodProd<>Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('cod_produto').AsString) Then

      sCodProd:=Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('cod_produto').AsString);

      if DMCreditoInventarioST.CDS_Busca.RecNo mod 1000 = 0 Then
      Begin
        DMCreditoInventarioST.SQLC.Commit(TD);

        TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
        TD.IsolationLevel:=xilREADCOMMITTED;
        DMCreditoInventarioST.SQLC.StartTransaction(TD);
      End; // if DMCreditoInventarioST.CDS_Busca.RecNo mod 1000 = 0 Then

      Label4.Caption:=IntToStr(DMCreditoInventarioST.CDS_Busca.RecNo);

      DMCreditoInventarioST.CDS_Busca.Next;
    End; // While Not DMCreditoInventarioST.CDS_Busca.Eof do
    DMCreditoInventarioST.CDS_Busca.EnableControls;
    DMCreditoInventarioST.CDS_Busca.Close;
    Dbg_LinxProdDet.DataSource:=nil;

    // Atualiza Transacao ======================================================
    DMCreditoInventarioST.SQLC.Commit(TD);

    ShowMessage('FIM');

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMCreditoInventarioST.SQLC.Rollback(TD);
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação

  DateSeparator:='/';
  DecimalSeparator:=',';
  Screen.Cursor:=crDefault;

end;

procedure TFrmCreditoInventarioST.Bt_AtualizaUltCustoMedioClick(Sender: TObject);
Var
  MySql: String;
  sLocalizacao: String;

  cVlr_Custo, cBC_ST_Unit: Currency;
begin
  DMCreditoInventarioST.CDS_CreditoST_CM.Close;
  DMCreditoInventarioST.CDS_CreditoST_CI.Close;
  DMCreditoInventarioST.CDS_CreditoST.Close;

  Label1.Caption:='0';
  Label2.Caption:='0';

  If EdtCod_Loja.AsInteger<1 Then
  Begin
    msg('Favor Informar a Loja !!', 'A');
    EdtCod_Loja.SetFocus;
    Exit;
  End; // If EdtCod_Loja.AsInteger<1 Then

  Dbg_CreditoST.SetFocus;

  // Tira Data Source
  Dbg_CreditoST.DataSource:=nil;

  OdirPanApres.Caption:='AGUARDE !! Calculando Crédito ST por Custo Médio...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCreditoInventarioST.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCreditoInventarioST.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCreditoInventarioST;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  DMCreditoInventarioST.SDS_CreditoST_CM.Params.ParamByName('Loja').Value:=EdtCod_Loja.AsInteger;
  DMCreditoInventarioST.CDS_CreditoST_CM.Open;

  // Acerta Data Source
  Dbg_CreditoST.DataSource:=DMCreditoInventarioST.DS_CreditoST_CM;

  Label1.Caption:=IntToStr(DMCreditoInventarioST.CDS_CreditoST_CM.RecordCount);

  OdirPanApres.Visible:=False;
  msg('FIM','A');


// OdirApagar - 22/01/2019
//
//  Dbg_CreditoST.SetFocus;
//
//  DMCreditoInventarioST.CDS_CreditoST.First;
//  While Not DMCreditoInventarioST.CDS_CreditoST.Eof do
//  Begin
//    Application.ProcessMessages;
//
//    cVlr_Custo :=0;
//    cBC_ST_Unit:=0;
//
//    // Busca Custo Medio
//    MySql:=' SELECT FIRST 1 CAST(COALESCE(d.custo_medio, 0.00) as Numeric(12,2)) CUSTO_MEDIO'+
//           ' FROM LINXPRODUTOSDETALHES d'+
//           ' WHERE COALESCE(d.custo_medio, 0.00)<>0'+
//           ' AND d.cod_produto='+DMCreditoInventarioST.CDS_CreditoSTCOD_PRODUTO.AsString;
//    DMCreditoInventarioST.CDS_Busca.Close;
//    DMCreditoInventarioST.SDS_Busca.CommandText:=MySql;
//    DMCreditoInventarioST.CDS_Busca.Open;
//
//    sLocalizacao:='Não Encontrado';
//    If Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('CUSTO_MEDIO').AsString)<>'' Then
//    Begin
//      cVlr_Custo :=DMCreditoInventarioST.CDS_Busca.FieldByName('CUSTO_MEDIO').AsCurrency;
//      cBC_ST_Unit:=cVlr_Custo;
//      sLocalizacao:='Custo Médio';
//    End;
//    DMCreditoInventarioST.CDS_Busca.Close;
//
//    // Atualiza Produto ========================================================
//    DMCreditoInventarioST.CDS_CreditoST.Edit;
//    DMCreditoInventarioST.CDS_CreditoSTVLR_CUSTO.AsCurrency:=cVlr_Custo;
//    DMCreditoInventarioST.CDS_CreditoSTVLR_CUSTO_TOTAL.AsCurrency:=
//        (cVlr_Custo * DMCreditoInventarioST.CDS_CreditoSTQTD_ESTOQUE.AsInteger);
//    DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_ENTRADA.AsCurrency:=cBC_ST_Unit;
//    DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_TOTAL.AsCurrency:=
//       (cBC_ST_Unit * DMCreditoInventarioST.CDS_CreditoSTQTD_ESTOQUE.AsInteger);
//    DMCreditoInventarioST.CDS_CreditoSTVLR_CRED_PRES_ST.AsCurrency:=
//    ((DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_TOTAL.AsCurrency * 27)/100);
//    DMCreditoInventarioST.CDS_CreditoSTLOCALIZACAO.AsString:=sLocalizacao;
//    DMCreditoInventarioST.CDS_CreditoST.Post;
//
//    Label2.Caption:=IntToStr(DMCreditoInventarioST.CDS_CreditoST.RecNo);
//
//    DMCreditoInventarioST.CDS_CreditoST.Next;
//  End; // While Not DMCreditoInventarioST.CDS_CreditoST.Eof do
end;

procedure TFrmCreditoInventarioST.Bt_AtualizaCustoICMSClick(Sender: TObject);
Var
  MySql: String;
  sLocalizacao: String;

  cVlr_Custo, cBC_ST_Unit: Currency;
begin
  DMCreditoInventarioST.CDS_CreditoST_CM.Close;
  DMCreditoInventarioST.CDS_CreditoST_CI.Close;
  DMCreditoInventarioST.CDS_CreditoST.Close;

  Label1.Caption:='0';
  Label2.Caption:='0';

  If EdtCod_Loja.AsInteger<1 Then
  Begin
    msg('Favor Informar a Loja !!', 'A');
    EdtCod_Loja.SetFocus;
    Exit;
  End; // If EdtCod_Loja.AsInteger<1 Then

  Dbg_CreditoST.SetFocus;

  // Tira Data Source
  Dbg_CreditoST.DataSource:=nil;

  OdirPanApres.Caption:='AGUARDE !! Calculando Crédito ST por Custo ICMS...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCreditoInventarioST.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCreditoInventarioST.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCreditoInventarioST;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  DMCreditoInventarioST.SDS_CreditoST_CI.Params.ParamByName('Loja').Value:=EdtCod_Loja.AsInteger;
  DMCreditoInventarioST.CDS_CreditoST_CI.Open;

  // Acerta Data Source
  Dbg_CreditoST.DataSource:=DMCreditoInventarioST.DS_CreditoST_CI;

  Label1.Caption:=IntToStr(DMCreditoInventarioST.CDS_CreditoST_CI.RecordCount);

  OdirPanApres.Visible:=False;
  msg('FIM','A');


// OdirApagar - 22/01/2019
//  DMCreditoInventarioST.CDS_CreditoST.First;
//  While Not DMCreditoInventarioST.CDS_CreditoST.Eof do
//  Begin
//    Application.ProcessMessages;
//
//    cVlr_Custo :=0;
//    cBC_ST_Unit:=0;
//
//    // Busca Custo Medio
//    MySql:=' SELECT FIRST 1 CAST(COALESCE(d.preco_custo, 0.00) as Numeric(12,2)) CUSTO_ICMS'+
//           ' FROM LINXPRODUTOSDETALHES d'+
//           ' WHERE COALESCE(d.preco_custo, 0.00)<>0'+
//           ' AND d.cod_produto='+DMCreditoInventarioST.CDS_CreditoSTCOD_PRODUTO.AsString;
//    DMCreditoInventarioST.CDS_Busca.Close;
//    DMCreditoInventarioST.SDS_Busca.CommandText:=MySql;
//    DMCreditoInventarioST.CDS_Busca.Open;
//
//    sLocalizacao:='Não Encontrado';
//    If Trim(DMCreditoInventarioST.CDS_Busca.FieldByName('CUSTO_ICMS').AsString)<>'' Then
//    Begin
//      cVlr_Custo :=DMCreditoInventarioST.CDS_Busca.FieldByName('CUSTO_ICMS').AsCurrency;
//      cBC_ST_Unit:=cVlr_Custo;
//      sLocalizacao:='Custo ICMS';
//    End;
//    DMCreditoInventarioST.CDS_Busca.Close;
//
//    // Atualiza Produto ========================================================
//    DMCreditoInventarioST.CDS_CreditoST.Edit;
//    DMCreditoInventarioST.CDS_CreditoSTVLR_CUSTO.AsCurrency:=cVlr_Custo;
//    DMCreditoInventarioST.CDS_CreditoSTVLR_CUSTO_TOTAL.AsCurrency:=
//        (cVlr_Custo * DMCreditoInventarioST.CDS_CreditoSTQTD_ESTOQUE.AsInteger);
//    DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_ENTRADA.AsCurrency:=cBC_ST_Unit;
//    DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_TOTAL.AsCurrency:=
//       (cBC_ST_Unit * DMCreditoInventarioST.CDS_CreditoSTQTD_ESTOQUE.AsInteger);
//    DMCreditoInventarioST.CDS_CreditoSTVLR_CRED_PRES_ST.AsCurrency:=
//    ((DMCreditoInventarioST.CDS_CreditoSTVLR_BC_ST_TOTAL.AsCurrency * 27)/100);
//    DMCreditoInventarioST.CDS_CreditoSTLOCALIZACAO.AsString:=sLocalizacao;
//    DMCreditoInventarioST.CDS_CreditoST.Post;
//
//    Label2.Caption:=IntToStr(DMCreditoInventarioST.CDS_CreditoST.RecNo);
//
//    DMCreditoInventarioST.CDS_CreditoST.Next;
//  End; // While Not DMCreditoInventarioST.CDS_CreditoST.Eof do
//
//  msg('FIM','A');

end;

procedure TFrmCreditoInventarioST.FormShow(Sender: TObject);
begin
  PageControl1.TabIndex:=0;
  EdtCod_Loja.SetFocus;
end;

end.
