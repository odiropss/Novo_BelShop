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
    SQLQ_ProdEntrada: TSQLQuery;
    SQLQ_ProdVendas: TSQLQuery;
    SQLQ_ProdEntradaEMPRESA: TIntegerField;
    SQLQ_ProdEntradaCOD_PRODUTO: TFMTBCDField;
    SQLQ_ProdEntradaPRIMERIA: TSQLTimeStampField;
    SQLQ_ProdEntradaULTIMA: TSQLTimeStampField;
    SQLQ_ProdVendasEMPRESA: TIntegerField;
    SQLQ_ProdVendasCOD_PRODUTO: TFMTBCDField;
    SQLQ_ProdVendasPRIMERIA: TSQLTimeStampField;
    SQLQ_ProdVendasULTIMA: TSQLTimeStampField;


    // Odir ====================================================================
    Procedure ConectaBanco;
    procedure DataModuleCreate(Sender: TObject);
    // Odir ====================================================================

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
