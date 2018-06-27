unit UDMAcceraLoreal;

interface

uses
  SysUtils, Classes, Forms, WinInet, DBXpress, DB, SqlExpr, Windows, FMTBcd;

type
  TDMAcceraLoreal = class(TDataModule)
    SQLC: TSQLConnection;
    SDS_Arquivo: TSQLDataSet;
    procedure DataModuleCreate(Sender: TObject);


    //==========================================================================
    // Odir ====================================================================
    //==========================================================================
    Function ConectaBanco: Boolean;
    //==========================================================================
    // Odir ====================================================================
    //==========================================================================
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
  sgPCTConect_IB  : String='PCTConect_IB.ini';   // Arquivo Configuração de Conexão com Banco de Dados
  sgMultiBelConfig: String='MultiBelConfig.ini'; // Arquivo Configuração MultiBel

var
  DMAcceraLoreal: TDMAcceraLoreal;

  sgPastaExecutavel, // Pasta do Executável
  sgVendorLib,       // DLL do Banco de Dados
  sgPastaBancoDados,  // Pasta e Nome do Banco de Dados
  sgDialect,         // Dialect
  sgPastaSalvarArq   // Pasta para Salvar Arquivo do Projeto Accera Loreal
  : String;

implementation

uses DK_Procs1, UFrmAcceraLoreal;

{$R *.dfm}

//==============================================================================
// ODIR - INICIO ===============================================================
//==============================================================================

// Conecta Banco de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TDMAcceraLoreal.ConectaBanco: Boolean;
Var
  Flags : Cardinal;

  ArqINI: TextFile;
  i, iLinha: Integer;
  s: String;

  b: Boolean;
Begin
  Result:=True;

  // Define as Configurações Regionais para Ignorar a Configuração do Windows
  InicializaFormatos;

  Try
    if not InternetGetConnectedState(@Flags, 0) then
    Begin
      msg('Computador não está conectado à Internet !!','A');
      Application.Terminate;
      Exit;
    End; // if not InternetGetConnectedState(@Flags, 0) then

    //==========================================================================
    // Configurações MultiBel ==================================================
    //==========================================================================
    AssignFile(ArqINI,IncludeTrailingPathDelimiter(sgPastaExecutavel)+sgMultiBelConfig);

    iLinha:=0;
    Reset(ArqINI);
    While not Eof(ArqINI) do
    Begin
      Inc(iLinha);

      // DLL do Banco de Dados
      If iLinha=1 Then
       Readln(ArqINI,sgVendorLib);

      // Pasta para Salvar Arquivo do Projeto Accera Loreal
      If iLinha=2 Then
      Begin
        Readln(ArqINI,sgPastaSalvarArq);
        sgPastaSalvarArq:=IncludeTrailingPathDelimiter(sgPastaSalvarArq);
      End;

      // Pasta e Banco de Dados
      If iLinha=3 Then
       Readln(ArqINI,sgPastaBancoDados);
    End; // While not Eof(ArqINI) do
    CloseFile(ArqINI);

    // Verifica Existencia do Arquivo DLL do Banco de Dados ====================
    If not(FileExists(sgVendorLib)) then
    Begin
      msg('Arquivo DLL do Banco de Dados'+cr+' Não Existe !!','A');
      Application.Terminate;
      Exit;
    End;

    // Verifica Existencia da Pasta Destino para os Arquvios ===================
    If not DirectoryExists(IncludeTrailingPathDelimiter(sgPastaSalvarArq)) Then
    Begin
      msg('Pasta de Destino para os'+cr+'Arquivos da L´ORÉAL Não Existe !!','A');
      Application.Terminate;
      Exit;
    End;
    // Configurações MultiBel ==================================================
    //==========================================================================

    //==========================================================================
    // Busca Dialect do Banco de Dados  ========================================
    //==========================================================================
    AssignFile(ArqINI,IncludeTrailingPathDelimiter(sgPastaExecutavel)+sgPCTConect_IB);

    sgDialect:='';
    Reset(ArqINI);
    While not Eof(ArqINI) do
    Begin
      Readln(ArqINI,s);

      i:=pos('SQLDialect=', Trim(s));
      If i<>0 Then
      Begin
        i:=pos('=', Trim(s));
        sgDialect:=copy(Trim(s),i+1,1);
        Break;
      End;
    End; //While not Eof(Arq) do
    CloseFile(ArqINI);
    // Busca Dialect do Banco de Dados  ========================================
    //==========================================================================

    //==========================================================================
    // Conecta Banco de Dados ==================================================
    //==========================================================================
    If SQLC.Connected Then
     SQLC.Connected:=False;

    With SQLC do
    Begin
      try
        VendorLib:=sgVendorLib;
        SQLC.Params.Clear;
        LoadParamsFromIniFile(sgPastaExecutavel+sgPCTConect_IB);

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
              Result:=False;
              MessageBox(Application.Handle, pChar('Erro no Banco de Dados'+#13+e.message), 'Erro', MB_ICONERROR);
              Application.Terminate;
              Exit;
            End; // on e : Exception do
          End; // Try
        End; // While Not b do
      Except // finally
      End; // Try
    End; // With SQLC do
  Except
    Result:=False;
  End;

End; // Conecta Banco de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//==============================================================================
// ODIR - FIM ==================================================================
//==============================================================================

procedure TDMAcceraLoreal.DataModuleCreate(Sender: TObject);
begin
  // Pasta Executavel ==========================================================
  sgPastaExecutavel:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

  // Verifica Existencia do Arquivo de Configuração de Conexão =================
  If not(fileexists(IncludeTrailingPathDelimiter(sgPastaExecutavel)+sgPCTConect_IB)) then
  Begin
    msg('Arquivo '+sgPCTConect_IB+' Não Encontrado !!','A');
    Application.Terminate;
    Exit;
  End;

  // Verifica Existencia do Arquivo de Configuração MultiBel ===================
  If not(fileexists(sgPastaExecutavel+sgMultiBelConfig)) then
  Begin
    msg('Arquivo '+sgMultiBelConfig+' Não Encontrado !!','A');
    Application.Terminate;
    Exit;
  End;

  // Conecta Banco de Dados ====================================================
  If Not ConectaBanco Then
  Begin
    msg('Erro de Conexão ao Banco de Dados !!','A');
    Application.Terminate;
    Exit;
  End; // If Not ConectaBanco Then

end;

end.
