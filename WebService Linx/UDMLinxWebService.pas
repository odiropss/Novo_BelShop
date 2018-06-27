unit UDMLinxWebService;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, DBClient, Provider, Dialogs;

type
  TDMLinxWebService = class(TDataModule)
    SQLC: TSQLConnection;
    SDS_DtaHoraServidor: TSQLDataSet;
    SDS_Busca: TSQLDataSet;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
    SDS_Lojas: TSQLDataSet;
    DSP_Lojas: TDataSetProvider;
    CDS_Lojas: TClientDataSet;
    CDS_LojasCOD_FILIAL: TStringField;
    CDS_LojasNUM_CNPJ: TStringField;
    CDS_LojasCOD_LINX: TIntegerField;
    CDS_LojasDTA_INICIO_LINX: TDateField;
    SDS_BuscaRapida: TSQLDataSet;
    DSP_BuscaRapida: TDataSetProvider;
    CDS_BuscaRapida: TClientDataSet;
    SDS_ProdutosZerados: TSQLDataSet;
    DSP_ProdutosZerados: TDataSetProvider;
    CDS_ProdutosZerados: TClientDataSet;
    SQLQ_Busca: TSQLQuery;

    // Odir
    Function ConectaBanco: Boolean;
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

var
  DMLinxWebService: TDMLinxWebService;

implementation

uses UWebServiceLinx;

{$R *.dfm}

//==============================================================================
// Odir - Inicio ===============================================================
//==============================================================================

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TDMLinxWebService.ConectaBanco: Boolean;
Var
  Arq: TextFile;
  s, sBancoIB: String;
  i: Integer;
  b: Boolean;
  Flags : Cardinal;
begin
  Result:=True;
  If SQLC.Connected Then
   SQLC.Connected:=False;

  // ===========================================================================
  // Conexão DBExpress BelShop =================================================
  // ===========================================================================
  with SQLC do
  Begin
    try
      SQLC.Params.Clear;
      LoadParamsFromIniFile(sgPastaBelShop+'PCTConect_IB.ini');

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
            sgMensagem:='Mensagem de erro do sistema:'+#13+e.message;
            Result:=False;
            exit;
          End; // on e : Exception do
        End;
      End;
    Except // finally
    End;
  end; // with SQLC do

End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//==============================================================================
// Odir - Fim ==================================================================
//==============================================================================

end.
