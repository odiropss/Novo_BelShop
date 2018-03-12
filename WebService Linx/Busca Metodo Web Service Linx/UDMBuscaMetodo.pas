unit UDMBuscaMetodo;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DBClient, Provider, DB, SqlExpr, Forms;

type
  TDMBuscaMetodo = class(TDataModule)
    SQLC: TSQLConnection;
    SDS_DtaHoraServidor: TSQLDataSet;
    SDS_Busca: TSQLDataSet;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
    SDS_BuscaRapida: TSQLDataSet;
    DSP_BuscaRapida: TDataSetProvider;
    CDS_BuscaRapida: TClientDataSet;
    DS_Busca: TDataSource;
    DS_BuscaRapida: TDataSource;

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
  DMBuscaMetodo: TDMBuscaMetodo;

  sgPath_Local,
  sgPastaWebService, // Pasta WebService
  sgPastaExecutavelServer, // Pasta e Executável no Servidor (FrmBelShop)
  sgPastaBancoBelShop: String; // Pasta do Banco de Dados BelShop.FDB

implementation

{$R *.dfm}


// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBuscaMetodo.ConectaBanco;
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
  end;

  // ===========================================================================
  // Conexão IBDatabase BelShop ================================================
  // ===========================================================================
  AssignFile(Arq,IncludeTrailingPathDelimiter(sgPath_Local)+'PCTConect_IB.ini');

  Reset(Arq);
  While not Eof(Arq) do
  Begin
   Readln(Arq,s);

   sBancoIB:='';
   i:=pos('Database=localhost/3050:', Trim(s));
   If i<>0 Then
    sBancoIB:=copy(Trim(s),i+24,length(Trim(s)));

   If (i=0) and (sBancoIB='') Then
   Begin
     i:=pos('Database=', Trim(s));
     If i<>0 Then
      sBancoIB:=copy(Trim(s),i+9,length(Trim(s)));
   End;

   If sBancoIB<>'' Then
   Begin
     sgPastaExecutavelServer:=ExtractFilePath(sBancoIB);
     sgPastaBancoBelShop    :=ExtractFilePath(sBancoIB);

     i:=Pos('\BelShop\',Trim(sgPastaExecutavelServer));
     sgPastaExecutavelServer:=Copy(sgPastaExecutavelServer,1, i+8);

     i:=Pos(AnsiUpperCase('\\localhost\'),Trim(AnsiUpperCase(sgPastaExecutavelServer)));
     If i>0 Then
     Begin
       sgPastaExecutavelServer:=Copy(sgPastaExecutavelServer, i+12, Length(sgPastaExecutavelServer));
     End;

     Break;
   End; // If sBancoIB<>'' Then

  End;
  CloseFile(Arq);

  sgPastaWebService:=sgPastaExecutavelServer;
  if DirectoryExists(IncludeTrailingPathDelimiter(sgPastaWebService)+'WebService Linx\') then
   sgPastaWebService:=IncludeTrailingPathDelimiter(sgPastaWebService)+'WebService Linx\'
  Else
   sgPastaWebService:=IncludeTrailingPathDelimiter(sgPastaWebService)+'Fontes\WebService Linx\';

  if Not DirectoryExists(sgPastaWebService) then
   sgPastaWebService:='\\192.168.0.252\Projetos\BelShop\WebService Linx\';

End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMBuscaMetodo.DataModuleCreate(Sender: TObject);
begin
  sgPath_Local:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

  SQLC.Connected:=False;

  ConectaBanco;

end;

end.
