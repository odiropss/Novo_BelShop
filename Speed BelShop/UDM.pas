unit UDM;

interface

uses
  Windows, SysUtils, Classes, DB, DBClient, DBXpress, SqlExpr, Forms,
  FMTBcd, Provider;

type
  TDM = class(TDataModule)
    CDS_Pessoas: TClientDataSet;
    CDS_PessoasCODIGO: TStringField;
    CDS_PessoasCODIGO_IBGE: TIntegerField;
    DS_Pessoas: TDataSource;
    CDS_Prod: TClientDataSet;
    CDS_ProdCODIGO: TStringField;
    DS_Prod: TDataSource;
    CDS_ST: TClientDataSet;
    CDS_STCOD_PART: TStringField;
    CDS_STNUM_DOC: TStringField;
    CDS_STDT_DOC: TStringField;
    CDS_STDT_E_S: TStringField;
    CDS_STVL_DOC: TStringField;
    DS_ST: TDataSource;
    CDS_NatOperacao: TClientDataSet;
    CDS_NatOperacaoCOD_NATOPERACAO: TStringField;
    CDS_NatOperacaoDES_NATOPERACAO: TStringField;
    DS_NatOperacao: TDataSource;
    CDS_CFopProd: TClientDataSet;
    CDS_CFopProdUF_EMIT: TStringField;
    CDS_CFopProdUF_DEST: TStringField;
    CDS_CFopProdCOD_NATOPER: TStringField;
    CDS_CFopProdDES_NATOPER: TStringField;
    CDS_CFopProdCST_ICMS: TStringField;
    CDS_CFopProdCST_IPI: TStringField;
    CDS_CFopProdCST_PIS: TStringField;
    CDS_CFopProdCST_COFINS: TStringField;
    CDS_CFopProdCFOP: TStringField;
    DS_CFopProd: TDataSource;
    DS_C190: TDataSource;
    CDS_C190: TClientDataSet;
    CDS_C190CST_ICMS: TStringField;
    CDS_C190CFOP: TStringField;
    CDS_C190ALIQ_ICMS: TFloatField;
    CDS_C190VL_OPR: TFloatField;
    CDS_C190VL_BC_ICMS: TFloatField;
    CDS_C190VL_ICMS: TFloatField;
    CDS_C190VL_BC_ICMS_ST: TFloatField;
    CDS_C190VL_ICMS_ST: TFloatField;
    CDS_C190VL_RED_BC: TFloatField;
    CDS_C190VL_IPI: TFloatField;
    CDS_STSERIE: TStringField;
    CDS_Nota_ST_Errada: TClientDataSet;
    DS_Nota_ST_Errada: TDataSource;
    CDS_Nota_ST_ErradaCOD_PART: TStringField;
    CDS_Nota_ST_ErradaNUM_DOC: TStringField;
    CDS_Nota_ST_ErradaSERIE: TStringField;
    CDS_Nota_ST_ErradaVL_DOC: TStringField;
    CDS_Nota_ST_ErradaDT_DOC: TStringField;
    CDS_Nota_ST_ErradaDT_E_S: TStringField;
    CDS_CFopZerados: TClientDataSet;
    CDS_CFopZeradosCOD_NAT: TStringField;
    CDS_CFopZeradosCST_ICMS: TStringField;
    CDS_CFopZeradosCFOP: TStringField;
    CDS_CFopZeradosOPER_ESTADO: TStringField;
    CDS_IBGE_UF: TClientDataSet;
    CDS_IBGE_UFUF: TStringField;
    CDS_IBGE_UFMUN: TStringField;
    CDS_Nota_ST_ErradaVL_ST: TStringField;
    SQLC: TSQLConnection;
    SDS_Busca: TSQLDataSet;
    CDS_Busca: TClientDataSet;
    DSP_Busca: TDataSetProvider;
    DS_Busca: TDataSource;
    CDS_STNUM_DOC_ORIGINAL: TStringField;
    CDS_PessoasMOVTO: TStringField;
    CDS_PessoasINDEX: TIntegerField;
    SDS_DtaHoraServidor: TSQLDataSet;
    CDS_CFopProdCOD_CODOPER: TStringField;
    CDS_CFopProdDES_CODOPER: TStringField;
    CDS_CFopProdCST_ICMS_OK: TStringField;
    CDS_CFopProdCST_IPI_OK: TStringField;
    CDS_CFopProdCST_PIS_OK: TStringField;
    CDS_CFopProdCST_COFINS_OK: TStringField;
    CDS_CFopZeradosCOD_OPER: TIntegerField;
    CDS_CFopZeradosCST_PIS: TStringField;
    CDS_CFopZeradosCST_COFINS: TStringField;
    CDS_CFopZeradosIND_ST: TStringField;
    CDS_CFopZeradosCST_IPI: TStringField;
    DS_CFopZerados: TDataSource;
    procedure DataModuleCreate(Sender: TObject);


    // Odir
    Procedure ConectaBanco;
    // Odir
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
   sUser_Name: String='SYSDBA';
   sPassword: String='masterkey';
   cr = #13#10;
   Tab =#9;

var
  DM: TDM;

  sgPCTConect_IB: String;
  sPath_Local   : String;


implementation

uses DK_Procs1;

{$R *.dfm}

//Odir

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDM.ConectaBanco;
Var
  Arq: TextFile;
  s, sBancoIB: String;
  i: Integer;
  b: Boolean;
  Flags : Cardinal;
begin
  If SQLC.Connected Then
   SQLC.Connected:=False;

  InicializaFormatos; // define as configurações regionais para ignorar a configuração do windows

  // ===========================================================================
  // Conexão DBExpress MPPS ====================================================
  // ===========================================================================
  with SQLC do
  Begin
    try
      SQLC.Params.Clear;
      LoadParamsFromIniFile(sPath_Local+sgPCTConect_IB);

      Params.Add('User_Name='+sUser_Name);
      Params.Add('Password='+sPassword);
      b:=False;
      While Not b do
      Begin
        Try
          Connected:=True;
          Break;
        Except
          on e : Exception do
          Begin
            MessageBox(Application.Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
            Application.Terminate;
            exit;
          End; // on e : Exception do
        End; // Try
      End; // While Not b do
    Except // finally
    End; // Try
  end; // with SQLC do

End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


procedure TDM.DataModuleCreate(Sender: TObject);
begin
  sgPCTConect_IB:='PCTConect_IB.ini';

  // Pasta Executavel ==========================================================
  sPath_Local:=IncludeTrailingPathDelimiter(ExtractFilePAth(Application.ExeName));

  If not(fileexists(IncludeTrailingPathDelimiter(sPath_Local)+sgPCTConect_IB)) then
  Begin
    msg('Arquivo '+sgPCTConect_IB+' Não Encontrado !!','A');
    Application.Terminate;
    Exit;
  End;

  ConectaBanco;

end;

end.
