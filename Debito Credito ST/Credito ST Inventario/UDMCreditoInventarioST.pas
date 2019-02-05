unit UDMCreditoInventarioST;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, Forms, DBClient,
  Provider;

type
  TDMCreditoInventarioST = class(TDataModule)
    SQLC: TSQLConnection;
    SQLQ_Busca: TSQLQuery;
    CDS_CreditoST: TClientDataSet;
    DS_CreditoST: TDataSource;
    SDS_Busca: TSQLDataSet;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
    CDS_CreditoSTCOD_PRODUTO: TFMTBCDField;
    CDS_CreditoSTDES_NCM: TStringField;
    CDS_CreditoSTDES_PRODUTO: TStringField;
    CDS_CreditoSTVLR_CUSTO: TFMTBCDField;
    CDS_CreditoSTQTD_ESTOQUE: TIntegerField;
    CDS_CreditoSTVLR_CUSTO_TOTAL: TFMTBCDField;
    CDS_CreditoSTVLR_BC_ST_ENTRADA: TFMTBCDField;
    CDS_CreditoSTVLR_BC_ST_TOTAL: TFMTBCDField;
    CDS_CreditoSTVLR_CRED_PRES_ST: TFMTBCDField;
    DS_Busca: TDataSource;
    CDS_CreditoSTLOCALIZACAO: TStringField;
    SDS_CreditoST_CM: TSQLDataSet;
    DSP_CreditoST_CM: TDataSetProvider;
    CDS_CreditoST_CM: TClientDataSet;
    DS_CreditoST_CM: TDataSource;
    SDS_CreditoST_CI: TSQLDataSet;
    DSP_CreditoST_CI: TDataSetProvider;
    CDS_CreditoST_CI: TClientDataSet;
    DS_CreditoST_CI: TDataSource;
    CDS_CreditoST_CMCOD_PRODUTO: TFMTBCDField;
    CDS_CreditoST_CMDES_NCM: TStringField;
    CDS_CreditoST_CMDES_PRODUTO: TStringField;
    CDS_CreditoST_CMVLR_CUSTO: TFMTBCDField;
    CDS_CreditoST_CMQTD_ESTOQUE: TIntegerField;
    CDS_CreditoST_CMVLR_CUSTO_TOTAL: TFMTBCDField;
    CDS_CreditoST_CMVLR_BC_ST_ENTRADA: TFMTBCDField;
    CDS_CreditoST_CMVLR_BC_ST_TOTAL: TFMTBCDField;
    CDS_CreditoST_CMVLR_CRED_PRES_ST: TFMTBCDField;
    CDS_CreditoST_CICOD_PRODUTO: TFMTBCDField;
    CDS_CreditoST_CIDES_NCM: TStringField;
    CDS_CreditoST_CIDES_PRODUTO: TStringField;
    CDS_CreditoST_CIVLR_CUSTO: TFMTBCDField;
    CDS_CreditoST_CIQTD_ESTOQUE: TIntegerField;
    CDS_CreditoST_CIVLR_CUSTO_TOTAL: TFMTBCDField;
    CDS_CreditoST_CIVLR_BC_ST_ENTRADA: TFMTBCDField;
    CDS_CreditoST_CIVLR_BC_ST_TOTAL: TFMTBCDField;
    CDS_CreditoST_CIVLR_CRED_PRES_ST: TFMTBCDField;
    CDS_CreditoST_CMLOCALIZACAO: TStringField;
    CDS_CreditoST_CILOCALIZACAO: TStringField;

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
  DMCreditoInventarioST: TDMCreditoInventarioST;

  sgPath_Local: String;

implementation

uses DK_Procs1;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMCreditoInventarioST.ConectaBanco;
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
          msg('CONECTOU','A');
          Break;
        Except
        End;
      End;
    Except // finally
    End;
  End;

End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


procedure TDMCreditoInventarioST.DataModuleCreate(Sender: TObject);
begin
  // Pasta Executavel ==========================================================
  sgPath_Local:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

  ConectaBanco;

end;

end.
