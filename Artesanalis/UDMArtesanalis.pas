unit UDMArtesanalis;

interface

uses
  Windows, Forms, SysUtils, Classes, DBXpress, FMTBcd, DB, DBClient, Provider, SqlExpr,
  WinInet;

type
  TDMArtesanalis = class(TDataModule)
    SQLC: TSQLConnection;
    SQLQ_Busca: TSQLQuery;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
    DS_Busca: TDataSource;
    SQLQ_Unidade: TSQLQuery;
    DSP_Unidade: TDataSetProvider;
    CDS_Unidade: TClientDataSet;
    DS_Unidade: TDataSource;
    CDS_UnidadeCOD_UNIDADE: TIntegerField;
    CDS_UnidadeQTD_UNIDADE: TIntegerField;
    CDS_UnidadeDES_UNIDADE: TStringField;
    SQLQ_BuacaRapida: TSQLQuery;
    DSP_BuacaRapida: TDataSetProvider;
    CDS_BuacaRapida: TClientDataSet;
    SQLQ_MateriaPrima: TSQLQuery;
    DSP_MateriaPrima: TDataSetProvider;
    CDS_MateriaPrima: TClientDataSet;
    DS_MateriaPrima: TDataSource;
    CDS_MateriaPrimaCOD_MATERIAPRIMA: TIntegerField;
    CDS_MateriaPrimaDES_MATERIAPRIMA: TStringField;
    CDS_MateriaPrimaVLR_UNITATIO: TFMTBCDField;
    CDS_MateriaPrimaQTD_CONVERSAO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    Procedure ConectaBanco;

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
  DMArtesanalis: TDMArtesanalis;

  sgPastaExecutavel, sgPCTConect_FB: String;

  bgSair: Boolean;

implementation

uses  DK_Procs1;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMArtesanalis.ConectaBanco;
Var
  Arq: TextFile;
  s, sBancoIB: String;
  i: Integer;
  b: Boolean;
  Flags : Cardinal;
begin

  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    If msg('Você não está conectado à Internet !!'+cr+cr+'Deseja Continuar Assim Mesmo ??','C')=2 Then
    Begin
      Application.Terminate;
      Exit;
    End;
  End; // if not InternetGetConnectedState(@Flags, 0) then

  If Not (FileExists(sgPastaExecutavel+sgPCTConect_FB)) Then
  Begin
    msg('Arquivo de Configuração Não Existe...'+cr+'O Sistema será Encerrado !!','A');
    Application.Terminate;
    Exit;
  End; // If Not (FileExists(sgPastaExecutavel+sgPCTConect_FB)) Then

  If SQLC.Connected Then
   SQLC.Connected:=False;

  InicializaFormatos; // define as configurações regionais para ignorar a configuração do windows

  // ===========================================================================
  // Conexão DBExpress =========================================================
  // ===========================================================================
  with SQLC do
  Begin
    try
      SQLC.Params.Clear;
      LoadParamsFromIniFile(sgPastaExecutavel+sgPCTConect_FB);

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
        End;
      End;
    Except // finally
    End;
  End; // with SQLC do

End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMArtesanalis.DataModuleCreate(Sender: TObject);
Var
  i: Integer;
  Arq: TextFile;
  sArquivo: TStringList;
  sLinha: String;
  sNewIP: String;
  b, bTestaConexao: Boolean;
begin
   bgSair:=True;

  // Pasta Executavel ==========================================================
  sgPastaExecutavel:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

//  // Adiciona PBelShop no FireWall =============================================
//  Try
//    addApplicationToFirewall('Artesanalis', IncludeTrailingPathDelimiter(sgPastaExecutavel)+'PArtesanalis.exe');
//  Except
//  End;

  // Verifica Existencia do Arquivo de Configuração de Conexão =================
  sgPCTConect_FB:='PCTConect_FB.ini';
  If not(fileexists(IncludeTrailingPathDelimiter(sgPastaExecutavel)+sgPCTConect_FB)) then
  Begin
    msg('Arquivo '+sgPCTConect_FB+' Não Encontrado !!','A');
    Application.Terminate;
    Exit;
  End;

  // Conecta Banco BelShop.FDB =================================================
  SQLC.Connected:=False;

  ConectaBanco;
end;

end.
