unit UDMComissaoVendedor;

interface

uses
  SysUtils, Classes, FMTBcd, DB, Provider, SqlExpr, DBClient, DBXpress, Dialogs,
  IBCustomDataSet, IBQuery;

type
  TDMComissaoVendedor = class(TDataModule)
    DS_V_UltimaAtualizacao: TDataSource;
    CDS_V_UltimaAtualizacao: TClientDataSet;
    CDS_V_UltimaAtualizacaoIMP: TStringField;
    CDS_V_UltimaAtualizacaoCODIGO: TStringField;
    CDS_V_UltimaAtualizacaoLOJA: TStringField;
    CDS_V_UltimaAtualizacaoDATA: TDateField;
    DS_V_Produtos: TDataSource;
    CDS_V_Produtos: TClientDataSet;
    CDS_V_ProdutosCOD_PRODUTO: TStringField;
    CDS_V_ProdutosFAT_CONVERSAO: TFMTBCDField;
    CDS_V_ProdutosDTA_VALIDADE_INI: TDateField;
    CDS_V_ProdutosDTA_VALIDADE_FIM: TDateField;
    CDS_V_ProdutosAPRESENTACAO: TStringField;
    CDS_V_Aplicacao: TClientDataSet;
    CDS_V_AplicacaoDES_APLICACAO: TStringField;
    CDS_V_AplicacaoCOD_APLICACAO: TStringField;
    DS_V_Aplicacao: TDataSource;
    CDS_V_FamiliaPrecos: TClientDataSet;
    CDS_V_FamiliaPrecosDES_FAMILIA: TStringField;
    CDS_V_FamiliaPrecosCOD_FAMILIA: TStringField;
    DS_V_FamiliaPrecos: TDataSource;
    CDS_V_FamiliaPrecosFAT_CONVERSAO: TFMTBCDField;
    IBQ_ProdutoMPMS: TIBQuery;
    IBQ_ProdutoMPMSUPDATE_INSERT: TIBStringField;
    SDS_ComisVendedores: TSQLDataSet;
    DSP_ComisVendedores: TDataSetProvider;
    CDS_ComisVendedores: TClientDataSet;
    DS_ComisVendedores: TDataSource;
    CDS_ComisVendedoresCOD_LOJA: TStringField;
    CDS_ComisVendedoresLOJA: TStringField;
    CDS_ComisVendedoresCOD_VENDEDOR: TStringField;
    CDS_ComisVendedoresDES_VENDEDOR: TStringField;
    CDS_ComisVendedoresQTD_NOTAS: TIntegerField;
    CDS_ComisVendedoresQTD_VENDA: TFMTBCDField;
    CDS_ComisVendedoresVLR_CONVERSAO: TFMTBCDField;
    CDS_ComisVendedoresVLR_COMISSAO: TFMTBCDField;
    procedure CDS_V_ProdutosAfterPost(DataSet: TDataSet);
    procedure CDS_V_FamiliaPrecosAfterPost(DataSet: TDataSet);
    procedure CDS_V_AplicacaoAfterPost(DataSet: TDataSet);
    procedure CDS_V_FamiliaPrecosBeforeDelete(DataSet: TDataSet);
    procedure CDS_V_AplicacaoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMComissaoVendedor: TDMComissaoVendedor;

  bgGravar: Boolean;

implementation

uses UDMBelShop, DK_Procs1, UFrmComissaoVendedor;

{$R *.dfm}

procedure TDMComissaoVendedor.CDS_V_ProdutosAfterPost(DataSet: TDataSet);
Var
  MySql: String;
  sDtaI, sDtaF, sVlr: String;
begin
  bgGravar:=True;
  If ((Trim(CDS_V_ProdutosDTA_VALIDADE_INI.AsString)='') And
      (Trim(CDS_V_ProdutosDTA_VALIDADE_FIM.AsString)<>''))
     Or
     ((Trim(CDS_V_ProdutosDTA_VALIDADE_INI.AsString)<>'') And
      (Trim(CDS_V_ProdutosDTA_VALIDADE_FIM.AsString)='')) Then
  Begin
    bgGravar:=False;
    msg('Per�odo de Validade Inv�lido !!'+cr+'Altera��o N�O Ser� Salva !!','A');
  End;

  If Trim(CDS_V_ProdutosFAT_CONVERSAO.AsString)='' Then
  Begin
    bgGravar:=False;
    msg('Valor de Convers�o Inv�lido !!'+cr+'Altera��o N�O Ser� Salva !!','A');
  End;

  If Not bgGravar Then
  Begin
    Exit;
  End;

  // Altera Comiss�o Vendedores ================================================
  sDtaI:=Trim(CDS_V_ProdutosDTA_VALIDADE_INI.AsString);
  sDtaF:=Trim(CDS_V_ProdutosDTA_VALIDADE_FIM.AsString);
  sVlr :=Trim(CDS_V_ProdutosFAT_CONVERSAO.AsString);

  // Verifica se Transa��o esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE FIN_VEND_COMISSAO_PROD vp'+
           ' SET vp.fat_conversao='+QuotedStr(f_Troca(',','.',sVlr));

           If sDtaI<>'' Then
            MySql:=
             MySql+',  vp.dta_validade_ini='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaI)));

           If sDtaF<>'' Then
            MySql:=
             MySql+',  vp.dta_validade_fim='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaF)));

    MySql:=
     MySql+' WHERE vp.cod_produto='+QuotedStr(Trim(CDS_V_ProdutosCOD_PRODUTO.AsString));
    DMBelShop.SQLC.Execute(MySql,nil,nil);


    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      msg(e.Message, 'X');
    End; // on e : Exception do
  End; // Try

  DateSeparator:='/';
  DecimalSeparator:=',';
end;

procedure TDMComissaoVendedor.CDS_V_FamiliaPrecosAfterPost(DataSet: TDataSet);
Var
  MySql: String;
begin
  If Trim(CDS_V_FamiliaPrecosFAT_CONVERSAO.AsString)='' Then
  Begin
    msg('Valor de Convers�o Inv�lido !!'+cr+'Altera��o N�O Ser� Salva !!','A');
    exit;
  End;

  // Altera Comiss�o Vendedores ================================================
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Atualiza Familia Preco ---------------------------------------
    MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR'+
           ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
           ' VALUES ('+
           QuotedStr('16')+', '+ // TIP_AUX
           IntToStr(StrToInt(Trim(CDS_V_FamiliaPrecosCOD_FAMILIA.AsString)))+', '+ // COD_AUX
           QuotedStr(CDS_V_FamiliaPrecosCOD_FAMILIA.AsString)+', '+ // DES_AUX
           ' NULL, '+ // DES_AUX1
           QuotedStr(f_Troca(',','.',Trim(CDS_V_FamiliaPrecosFAT_CONVERSAO.AsString)))+', '+ // VLR_AUX
           ' NULL)'+ // VLR_AUX1
           ' MATCHING (TIP_AUX, COD_AUX)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Produtos da Familia Preco ---------------------------
    MySql:=' UPDATE FIN_VEND_COMISSAO_PROD vp'+
           ' SET   vp.fat_conversao='+QuotedStr(f_Troca(',','.',Trim(CDS_V_FamiliaPrecosFAT_CONVERSAO.AsString)))+
           ' where vp.cod_familia_preco='+QuotedStr(Trim(CDS_V_FamiliaPrecosCOD_FAMILIA.AsString));
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      msg(e.Message, 'X');
    End; // on e : Exception do
  End; // Try

  DateSeparator:='/';
  DecimalSeparator:=',';
end;

procedure TDMComissaoVendedor.CDS_V_AplicacaoAfterPost(DataSet: TDataSet);
Var
  MySql: String;
begin
  // Altera Comiss�o Vendedores ================================================
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR'+
           ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
           ' VALUES ('+
           QuotedStr('15')+', '+ // TIP_AUX
           IntToStr(StrToInt(Trim(CDS_V_AplicacaoCOD_APLICACAO.AsString)))+', '+ // COD_AUX
           QuotedStr(CDS_V_AplicacaoCOD_APLICACAO.AsString)+', '+ // DES_AUX
           ' NULL, '+ // DES_AUX1
           ' NULL, '+ // VLR_AUX
           ' NULL)'+ // VLR_AUX1
           ' MATCHING (TIP_AUX, COD_AUX)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      msg(e.Message, 'X');
    End; // on e : Exception do
  End; // Try

  DateSeparator:='/';
  DecimalSeparator:=',';
end;

procedure TDMComissaoVendedor.CDS_V_FamiliaPrecosBeforeDelete(DataSet: TDataSet);
Var
  MySql: String;
begin
  // Altera Comiss�o Vendedores ================================================
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    MySql:=' DELETE FROM TAB_AUXILIAR ap'+
           ' WHERE ap.tip_aux=16'+
           ' AND ap.des_aux='+QuotedStr(DMComissaoVendedor.CDS_V_FamiliaPrecosCOD_FAMILIA.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      msg(e.Message, 'X');
    End; // on e : Exception do
  End; // Try
end;

procedure TDMComissaoVendedor.CDS_V_AplicacaoBeforeDelete(DataSet: TDataSet);
Var
  MySql: String;
begin
  // Altera Comiss�o Vendedores ================================================
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    MySql:=' DELETE FROM TAB_AUXILIAR ap'+
           ' WHERE ap.tip_aux=15'+
           ' AND ap.des_aux='+QuotedStr(DMComissaoVendedor.CDS_V_AplicacaoCOD_APLICACAO.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      msg(e.Message, 'X');
    End; // on e : Exception do
  End; // Try
end;

end.
