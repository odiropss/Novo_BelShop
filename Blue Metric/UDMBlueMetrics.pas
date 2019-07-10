unit UDMBlueMetrics;

interface

uses
  SysUtils, Classes, DB, ADODB, DBXpress, FMTBcd, SqlExpr, Forms, DBClient,
  Provider;

type
  TDMBlueMetrics = class(TDataModule)
    ADOC: TADOConnection;
    SQLC: TSQLConnection;
    SQLQ_Clientes: TSQLQuery;
    SDS_Lojas: TSQLDataSet;
    DSP_Lojas: TDataSetProvider;
    CDS_Lojas: TClientDataSet;
    DS_Lojas: TDataSource;
    CDS_LojasCOD_FILIAL: TStringField;
    CDS_LojasCOD_LINX: TIntegerField;
    CDS_LojasRAZAO_SOCIAL: TStringField;
    CDS_LojasDTA_INICIO_LINX: TDateField;
    CDS_LojasIND_DOMINGO: TStringField;
    SQLQ_ClientesCELULAR: TStringField;
    SQLQ_ClientesCEP: TStringField;
    SQLQ_ClientesCIDADE: TStringField;
    SQLQ_ClientesCODIGO: TIntegerField;
    SQLQ_ClientesCODIGO_TIPO: TStringField;
    SQLQ_ClientesDATA_CADASTRO: TSQLTimeStampField;
    SQLQ_ClientesDATA_NASCIMENTO: TSQLTimeStampField;
    SQLQ_ClientesDDD_FIXO: TStringField;
    SQLQ_ClientesDDD_CELULAR: TStringField;
    SQLQ_ClientesEMAIL: TStringField;
    SQLQ_ClientesFILIAL_CADASTRO: TStringField;
    SQLQ_ClientesFONE: TStringField;
    SQLQ_ClientesNOME: TStringField;
    SQLQ_ClientesPAIS: TStringField;
    SQLQ_ClientesSEXO: TStringField;
    SQLQ_ClientesUF: TStringField;
    SQLQ_Empresas: TSQLQuery;
    SQLQ_EmpresasAREA_LOJA: TIntegerField;
    SQLQ_EmpresasATIVA: TStringField;
    SQLQ_EmpresasBAIRRO: TStringField;
    SQLQ_EmpresasCANAL: TStringField;
    SQLQ_EmpresasCEP: TStringField;
    SQLQ_EmpresasCIDADE: TStringField;
    SQLQ_EmpresasCODIGO_FILIAL: TIntegerField;
    SQLQ_EmpresasCOMPLEMENTO: TStringField;
    SQLQ_EmpresasDATA_ABERTURA: TSQLTimeStampField;
    SQLQ_EmpresasDATA_FECHAMENTO: TStringField;
    SQLQ_EmpresasDDD1: TStringField;
    SQLQ_EmpresasDDD2: TStringField;
    SQLQ_EmpresasEMAIL: TStringField;
    SQLQ_EmpresasENDERECO: TStringField;
    SQLQ_EmpresasESTADO: TStringField;
    SQLQ_EmpresasLATITUDE: TIntegerField;
    SQLQ_EmpresasLONGITUDE: TIntegerField;
    SQLQ_EmpresasNOME: TStringField;
    SQLQ_EmpresasNOME_REDUZIDO: TStringField;
    SQLQ_EmpresasNUMERO: TStringField;
    SQLQ_EmpresasPAIS: TStringField;
    SQLQ_EmpresasRAZAO_SOCIAL: TStringField;
    SQLQ_EmpresasREDE_LOJA: TStringField;
    SQLQ_EmpresasREGIAO: TStringField;
    SQLQ_EmpresasTELEFONE_1: TStringField;
    SQLQ_EmpresasTELEFONE_2: TStringField;
    SQLQ_EmpresasTIPO_LOJA: TStringField;
    SQLQ_Fornecedores: TSQLQuery;
    SQLQ_FornecedoresCIDADE: TStringField;
    SQLQ_FornecedoresCODIGO: TIntegerField;
    SQLQ_FornecedoresDATA_CADASTRO: TSQLTimeStampField;
    SQLQ_FornecedoresNOME: TStringField;
    SQLQ_FornecedoresSTATUS: TStringField;
    SQLQ_FornecedoresUF: TStringField;
    SQLQ_Produtos: TSQLQuery;
    SQLQ_ProdutosCODIGO: TFMTBCDField;
    SQLQ_ProdutosCOLECAO: TStringField;
    SQLQ_ProdutosFORNECEDOR: TIntegerField;
    SQLQ_ProdutosGRADE: TStringField;
    SQLQ_ProdutosGRIFE: TStringField;
    SQLQ_ProdutosGRUPO: TStringField;
    SQLQ_ProdutosLINHA: TStringField;
    SQLQ_ProdutosMARCA: TStringField;
    SQLQ_ProdutosNOME: TStringField;
    SQLQ_ProdutosSEXO: TStringField;
    SQLQ_ProdutosSUBGRUPO: TStringField;
    SQLQ_ProdutosULTIMO_CUSTO: TFMTBCDField;
    SQLQ_ProdutosURL_IMAGEM: TStringField;
    SQLQ_Vendedores: TSQLQuery;
    SQLQ_VendedoresCIDADE: TStringField;
    SQLQ_VendedoresCODIGO: TIntegerField;
    SQLQ_VendedoresCODIGO_EMPRESA: TIntegerField;
    SQLQ_VendedoresDATA_CADASTRO: TDateField;
    SQLQ_VendedoresNOME: TStringField;
    SQLQ_VendedoresSTATUS: TStringField;
    SQLQ_VendedoresUF: TStringField;
    SQLQ_Estoques: TSQLQuery;
    SQLQ_EstoquesCODIGO_EMPRESA: TIntegerField;
    SQLQ_EstoquesCODIGO_PRODUTO: TFMTBCDField;
    SQLQ_EstoquesDATA_PRIMEIRA_ENTRADA: TSQLTimeStampField;
    SQLQ_EstoquesDATA_ULTIMA_ENTRADA: TSQLTimeStampField;
    SQLQ_EstoquesDATA_ULTIMA_SAIDA: TSQLTimeStampField;
    SQLQ_Busca: TSQLQuery;
    SQLQ_EstoquesQUANTIDADE: TIntegerField;
    SQLQ_EstoquesULTIMO_CUSTO: TFMTBCDField;
    SQLQ_EstoquesEntradas: TSQLQuery;
    SQLQ_EstoquesVendas: TSQLQuery;
    SQLQ_EstoquesEntradasEMPRESA: TIntegerField;
    SQLQ_EstoquesEntradasCOD_PRODUTO: TFMTBCDField;
    SQLQ_EstoquesEntradasPRIMERIA: TSQLTimeStampField;
    SQLQ_EstoquesEntradasULTIMA: TSQLTimeStampField;
    SQLQ_EstoquesVendasEMPRESA: TIntegerField;
    SQLQ_EstoquesVendasCOD_PRODUTO: TFMTBCDField;
    SQLQ_EstoquesVendasPRIMERIA: TSQLTimeStampField;
    SQLQ_EstoquesVendasULTIMA: TSQLTimeStampField;
    SQLQ_Vendas: TSQLQuery;
    SQLQ_VendasTrocas: TSQLQuery;
    SQLQ_VendasCODIGO_EMPRESA: TIntegerField;
    SQLQ_VendasCODIGO_VENDA: TIntegerField;
    SQLQ_VendasCODIGO_CLIENTE: TIntegerField;
    SQLQ_VendasCODIGO_VENDEDOR: TIntegerField;
    SQLQ_VendasCUSTO_VENDA_TOTAL: TFMTBCDField;
    SQLQ_VendasCUSTO_TROCA_TOTAL: TFMTBCDField;
    SQLQ_VendasDATA_VENDA: TSQLTimeStampField;
    SQLQ_VendasDESCONTO_TOTAL: TFMTBCDField;
    SQLQ_VendasFRETE: TFMTBCDField;
    SQLQ_VendasQTDE_TROCA_TOTAL: TIntegerField;
    SQLQ_VendasQTDE_VENDA_BRUTA_TOTAL: TIntegerField;
    SQLQ_VendasQTDE_VENDA_LIQUIDA_TOTAL: TIntegerField;
    SQLQ_VendasSERIE: TStringField;
    SQLQ_VendasVALOR_VENDA_BRUTA_TOTAL: TFMTBCDField;
    SQLQ_VendasVALOR_VENDA_LIQUIDA_TOTAL: TFMTBCDField;
    SQLQ_VendasTrocasEMPRESA: TIntegerField;
    SQLQ_VendasTrocasNOTA_ORIGEM: TIntegerField;
    SQLQ_VendasTrocasCOD_VENDEDOR: TIntegerField;
    SQLQ_VendasTrocasCUSTO_TROCA_TOTAL: TFMTBCDField;
    SQLQ_VendasTrocasQTDE_TROCA_TOTAL: TIntegerField;
    SQLQ_VendasTrocasVALOR_TROCA_TOTAL: TFMTBCDField;
    SQLQ_ItensVendas: TSQLQuery;
    SQLQ_ItensVendasCODIGO_EMPRESA: TIntegerField;
    SQLQ_ItensVendasCODIGO_VENDA: TIntegerField;
    SQLQ_ItensVendasCODIGO_PRODUTO: TFMTBCDField;
    SQLQ_ItensVendasCUSTO_VENDA_ITENS: TFMTBCDField;
    SQLQ_ItensVendasDATA: TSQLTimeStampField;
    SQLQ_ItensVendasQUANTIDADE_VENDA_ITENS: TFMTBCDField;
    SQLQ_ItensVendasSERIE: TStringField;
    SQLQ_ItensVendasVALOR_VENDA_ITENS: TFMTBCDField;
    SQLQ_ItensVendasVALOR_DESCONTO_ITENS: TFMTBCDField;
    SQLQ_ItensTrocas: TSQLQuery;
    SQLQ_ItensTrocasCODIGO_EMPRESA: TIntegerField;
    SQLQ_ItensTrocasCODIGO_VENDA: TIntegerField;
    SQLQ_ItensTrocasSERIE: TStringField;
    SQLQ_ItensTrocasCODIGO_TROCA: TIntegerField;
    SQLQ_ItensTrocasCODIGO_PRODUTO: TFMTBCDField;
    SQLQ_ItensTrocasCUSTO_TROCA_ITENS: TFMTBCDField;
    SQLQ_ItensTrocasDATA: TSQLTimeStampField;
    SQLQ_ItensTrocasQUANTIDADE_TROCA_ITENS: TFMTBCDField;
    SQLQ_ItensTrocasVALOR_TROCA_ITENS: TFMTBCDField;
    SQLQ_Pagamentos: TSQLQuery;
    SQLQ_PagamentosADMINISTRADORA: TStringField;
    SQLQ_PagamentosCODIGO_FILIAL: TIntegerField;
    SQLQ_PagamentosCODIGOLANCAMENTO: TStringField;
    SQLQ_PagamentosCODIGO_TERMINAL: TStringField;
    SQLQ_PagamentosDATA_LANCAMENTO: TSQLTimeStampField;
    SQLQ_PagamentosMODALIDADE_PAGAMENTO: TStringField;
    SQLQ_PagamentosNOME_FILIAL: TStringField;
    SQLQ_PagamentosPARCELAS: TIntegerField;
    SQLQ_PagamentosTIPO_PAGAMENTO: TStringField;
    SQLQ_PagamentosVALOR: TFMTBCDField;
    SQLQ_VendasVALOR_TROCA_TOTAL: TFMTBCDField;
    SQLQ_VendasTrocasCODIGO_CLIENTE: TIntegerField;
    SQLQ_VendasTrocasSERIE: TStringField;
    SQLQ_ContasApagar: TSQLQuery;
    SQLQ_ContasApagarCODIGO_EMPRESA: TIntegerField;
    SQLQ_ContasApagarNUM_FATURA: TFMTBCDField;
    SQLQ_ContasApagarDATA_EMISSAO: TDateField;
    SQLQ_ContasApagarDATA_VENCIMENTO: TDateField;
    SQLQ_ContasApagarDATA_BAIXA: TDateField;
    SQLQ_ContasApagarVALOR_FATURA: TFMTBCDField;
    SQLQ_ContasApagarVALOR_JUROS: TFMTBCDField;
    SQLQ_ContasApagarVALOR_DESCONTO: TFMTBCDField;
    SQLQ_ContasApagarVALOR_PAGO: TFMTBCDField;
    SQLQ_ContasApagarCOD_FORNECEDOR: TIntegerField;
    SQLQ_ContasApagarDOC_ORIGEM: TIntegerField;
    SQLQ_ContasApagarSERIE_ORIGEM: TStringField;
    SQLQ_ContasApagarECF_ORIGEM: TIntegerField;
    SQLQ_ContasApagarQTDE_PARCELAS: TIntegerField;
    SQLQ_ContasApagarORDEM_PARCELA: TIntegerField;
    SQLQ_ContasApagarCOD_VENDEDOR: TIntegerField;
    SQLQ_ContasApagarDOC_EXCLUIDO: TStringField;
    SQLQ_ContasApagarDOC_CANCELADO: TStringField;
    SQLQ_ContasApagarCONTA_CREDITO: TIntegerField;
    SQLQ_ContasApagarCONTA_DEBITO: TIntegerField;
    SQLQ_ContasApagarCONTA_FLUXO: TIntegerField;
    SQLQ_ContasApagarCOD_HISTORICO: TIntegerField;
    SQLQ_ContasApagarCOD_FORMA_PGTO: TIntegerField;
    SQLQ_ContasApagarFORMA_PGTO: TStringField;
    SQLQ_ContasApagarORDEM_CARTAO: TIntegerField;
    SQLQ_ContasApagarBANCO_CODIGO: TIntegerField;
    SQLQ_ContasApagarBANCO_AGENCIA: TIntegerField;
    SQLQ_ContasApagarBANCO_CONTA: TStringField;
    SQLQ_ContasApagarBANCO_AUTORIZACAO_GARANTIDORA: TStringField;
    SQLQ_ContasApagarNUMERO_BILHETE_SEGURO: TIntegerField;
    SQLQ_ContasApagarCOD_PLANO: TIntegerField;
    SQLQ_ContasApagarDESC_PLANO: TStringField;
    SQLQ_ContasApagarTIPO_PLANO: TStringField;
    SQLQ_ContasApagarINDICE_PLANO: TFMTBCDField;
    SQLQ_ContasApagarCONTA_CENTRAL: TIntegerField;
    SQLQ_ContasApagarTIPO_TRANSACAO: TStringField;
    SQLQ_ContasApagarTAXA_FINANCEIRA: TFMTBCDField;
    SQLQ_ContasApagarOBSERVACAO: TStringField;
    SQLQ_VendasTrocas_ANTERIOR: TSQLQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    FMTBCDField1: TFMTBCDField;
    IntegerField5: TIntegerField;
    FMTBCDField2: TFMTBCDField;
    SQLQ_Vendas_ANTERIOR: TSQLQuery;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    FMTBCDField3: TFMTBCDField;
    FMTBCDField4: TFMTBCDField;
    SQLTimeStampField1: TSQLTimeStampField;
    FMTBCDField5: TFMTBCDField;
    FMTBCDField6: TFMTBCDField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    StringField2: TStringField;
    FMTBCDField7: TFMTBCDField;
    FMTBCDField8: TFMTBCDField;
    FMTBCDField9: TFMTBCDField;
    SQLQ_VendasIDENTIFICADOR: TStringField;
    SQLQ_ItensTrocas_ANTERIOR: TSQLQuery;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    StringField3: TStringField;
    IntegerField15: TIntegerField;
    FMTBCDField10: TFMTBCDField;
    FMTBCDField11: TFMTBCDField;
    SQLTimeStampField2: TSQLTimeStampField;
    FMTBCDField12: TFMTBCDField;
    FMTBCDField13: TFMTBCDField;

    // Odir ====================================================================
    Procedure ConectaBanco;
    // Odir ====================================================================

    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
   sUser_Name: String='SYSDBA';
   sPassword: String='masterkey';
   cr = #13#10;

var
  DMBlueMetrics: TDMBlueMetrics;

  sgPath_Local: String;

implementation

uses DK_Procs1;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBlueMetrics.ConectaBanco;
Var
  Arq: TextFile;
  s, sBancoIB: String;
  i: Integer;
  b: Boolean;
begin

  If not(fileexists(IncludeTrailingPathDelimiter(sgPath_Local)+'PCTConect_IB.ini')) then
  Begin
    Application.Terminate;
    Exit;
  End;

  If SQLC.Connected Then
   SQLC.Connected:=False;

  InicializaFormatos; // define as configurações regionais para ignorar a configuração do windows

  // ===========================================================================
  // Conexão DBExpress BelShop =================================================
  // ===========================================================================
  with SQLC do
  Begin
    try
      SQLC.Params.Clear;
      LoadParamsFromIniFile(sgPath_Local+'PCTConect_IB.ini');
      Params.Add('User_Name='+sUser_Name);
      Params.Add('Password='+sPassword);
      Connected:=True;
      b:=False;
      While Not b do
      Begin
        Try
          Connected:=True;
          Break;
        Except
        End;
      End;
    Except // finally
    End;
  End;

  ADOC.Connected:=True;

  CDS_Lojas.Open
End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMBlueMetrics.DataModuleCreate(Sender: TObject);
begin
  // Pasta Executavel ==========================================================
  sgPath_Local:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

  ConectaBanco;

end;

end.
