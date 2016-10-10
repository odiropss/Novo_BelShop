unit UDMComissaoVendedor;

interface

uses
  SysUtils, Classes, FMTBcd, DB, Provider, SqlExpr, DBClient, DBXpress, Dialogs;

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
    procedure CDS_V_ProdutosAfterPost(DataSet: TDataSet);
    procedure CDS_V_FamiliaPrecosAfterPost(DataSet: TDataSet);
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
    msg('Período de Validade Inválido !!'+cr+'Alteração NÃO Será Salva !!','A');
  End;

  If Trim(CDS_V_ProdutosFAT_CONVERSAO.AsString)='' Then
  Begin
    bgGravar:=False;
    msg('Valor de Conversão Inválido !!'+cr+'Alteração NÃO Será Salva !!','A');
  End;

  If Not bgGravar Then
  Begin
    Exit;
  End;

  // Altera Comissão Vendedores ================================================
  sDtaI:=Trim(CDS_V_ProdutosDTA_VALIDADE_INI.AsString);
  sDtaF:=Trim(CDS_V_ProdutosDTA_VALIDADE_FIM.AsString);
  sVlr :=Trim(CDS_V_ProdutosFAT_CONVERSAO.AsString);

  // Verifica se Transação esta Ativa
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
    msg('Valor de Conversão Inválido !!'+cr+'Alteração NÃO Será Salva !!','A');
    exit;
  End;

  // Altera Comissão Vendedores ================================================
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
           QuotedStr('16')+', '+ // TIP_AUX
           IntToStr(CDS_V_FamiliaPrecosCOD_FAMILIA.AsInteger)+', '+ // COD_AUX
           QuotedStr(CDS_V_FamiliaPrecosCOD_FAMILIA.AsString)+', '+ // DES_AUX
           ' NULL, '+ // DES_AUX1
           QuotedStr(f_Troca(',','.',Trim(CDS_V_FamiliaPrecosFAT_CONVERSAO.AsString)))+', '+ // VLR_AUX
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

end.
