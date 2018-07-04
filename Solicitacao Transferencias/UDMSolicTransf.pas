unit UDMSolicTransf;

interface

uses
  Windows, Forms, SysUtils, Classes, DBXpress, FMTBcd, SqlExpr, DB, DBClient,
  Provider, StdCtrls, WinInet, ExtCtrls;

type
  TDMSolicTransf = class(TDataModule)
    SQLC: TSQLConnection;
    SQLQ_Busca: TSQLQuery;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
    DS_Busca: TDataSource;
    DSP_Pesquisa: TDataSetProvider;
    CDS_Pesquisa: TClientDataSet;
    DS_Pesquisa: TDataSource;
    SQLQ_Pesquisa: TSQLQuery;
    DSP_Solicitacao: TDataSetProvider;
    CDS_Solicitacao: TClientDataSet;
    DS_Solicitacao: TDataSource;
    SQLQ_Solicitacao: TSQLQuery;
    CDS_SolicitacaoDTA_SOLICITACAO: TDateField;
    CDS_SolicitacaoNUM_SOLICITACAO: TIntegerField;
    CDS_SolicitacaoCOD_PROD_LINX: TIntegerField;
    CDS_SolicitacaoNOME: TStringField;
    CDS_SolicitacaoQTD_ESTOQUE: TFMTBCDField;
    CDS_SolicitacaoQTD_TRANSF: TFMTBCDField;
    Timer1: TTimer;
    SDS_DtaHoraServidor: TSQLDataSet;
    DSP_Verifica: TDataSetProvider;
    CDS_Verifica: TClientDataSet;
    DS_Verifica: TDataSource;
    SQLQ_Verifica: TSQLQuery;
    CDS_VerificaNUM_SOLICITACAO: TIntegerField;
    CDS_VerificaDTA_SOLICITACAO: TDateField;
    CDS_VerificaCOD_PROD_SIDI: TStringField;
    CDS_VerificaCOD_PROD_LINX: TIntegerField;
    CDS_VerificaNOME: TStringField;
    CDS_VerificaENVIADO_CD: TStringField;
    CDS_VerificaTRANSF_LOJA: TStringField;
    CDS_VerificaQTD_SOLICITADA: TFMTBCDField;
    CDS_VerificaQTD_DE_TRANSF: TFMTBCDField;
    CDS_VerificaQTD_A_TRANSF: TFMTBCDField;
    CDS_VerificaOBS_DOCTO: TStringField;
    CDS_VerificaDTA_PROCESSAMENTO: TDateField;
    CDS_VerificaDOC_GERADO: TIntegerField;
    SQLQ_BuscaRapida: TSQLQuery;
    DSP_BuscaRapida: TDataSetProvider;
    CDS_BuscaRapida: TClientDataSet;
    SQLQuery1: TSQLQuery;
    DSP_OCItensCheck: TDataSetProvider;
    CDS_OCItensCheck: TClientDataSet;
    DS_OCItensCheck: TDataSource;
    SQLQ_OCItensCheck: TSQLQuery;
    CDS_OCItensCheckNUM_SEQ_ITEM: TIntegerField;
    CDS_OCItensCheckCOD_PRODUTO_LINX: TFMTBCDField;
    CDS_OCItensCheckDES_PRODUTO: TStringField;
    CDS_OCItensCheckQTD_PRODUTO: TIntegerField;
    CDS_OCItensCheckQTD_CHECKOUT: TIntegerField;
    CDS_OCItensCheckDTA_CHECKOUT: TDateField;
    CDS_OCItensCheckHRA_CHECKOUT: TTimeField;
    CDS_OCItensCheckIND_OC: TStringField;

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    Procedure ConectaBanco;
    Procedure FechaTudo;

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

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
  DMSolicTransf: TDMSolicTransf;

  sgDtaHoje,
  sgPastaExecutavel, sgFBConect,
  sgNomeComputador, sgNomeUsuario: String; // Usuario e Windows

  dgDtaHoje: TDateTime;


implementation

uses DK_Procs1;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMSolicTransf.FechaTudo;
Var
  i: Integer;
Begin

  // Fecha Componentes DMSolicTransf ===========================================
  For i:=0 to DMSolicTransf.ComponentCount-1 do
  Begin
    If DMSolicTransf.Components[i] is TClientDataSet Then
     If (DMSolicTransf.Components[i] as TClientDataSet).Active Then
     (DMSolicTransf.Components[i] as TClientDataSet).Close;

    If DMSolicTransf.Components[i] is TSQLQuery Then
     If (DMSolicTransf.Components[i] as TSQLQuery).Active Then
     (DMSolicTransf.Components[i] as TSQLQuery).Close;
  End;
end; // Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMSolicTransf.ConectaBanco;
Var
  i: Integer;
  bConecta: Boolean;
  Flags : Cardinal;
  sErroLocal, sErroIntraNet, sErroInterNet: String;
begin

  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    If msg('Você não está conectado à Internet !!'+cr+cr+'Deseja Continuar Assim Mesmo ??','C')=2 Then
    Begin
      Application.Terminate;
      Exit;
    End;
  End; // if not InternetGetConnectedState(@Flags, 0) then

  InicializaFormatos; // define as configurações regionais para ignorar a configuração do windows

  // ===========================================================================
  // Conexão DBExpress =========================================================
  // ===========================================================================
  i:=0;
  bConecta:=True;
  While bConecta do
  Begin
    inc(i);

    If i=1 Then sgFBConect:='FBConect_InterNet.ini';
    If i=2 Then sgFBConect:='FBConect_IntraNet.ini';
    If i=3 Then sgFBConect:='FBConect_Local.ini';

    If AnsiUpperCase(sgNomeUsuario)='ODIR' Then
    Begin
      If msg('DB Local ??','C')=1 Then
       If i=1 Then sgFBConect:='FBConect_Local.ini';
    End; // If AnsiUpperCase(sgNomeUsuario)='ODIR' Then

    If i=4 Then
    Begin
      MessageBox(Application.Handle, pChar('ERRO DE CONEXÃO !!'+cr+
                                           'Entrar em Contato com o Odir'+cr+
                                           '============================'+cr+cr+
                                           'LOCAL: '+cr+sErroLocal+cr+cr+
                                           'INTRANET: '+cr+sErroIntraNet+cr+cr+
                                           'INTERNET: '+cr+sErroInterNet+cr+cr+
                                           'SQLC: '+SQLC.Params.GetText), 'ATENÇÃO !!', MB_ICONERROR);

      Application.Terminate;
      Exit;
    End; // If i=4 Then

    If SQLC.Connected Then
     SQLC.Connected:=False;

    Try
      With SQLC do
      Begin
        Params.Clear;
        Params.LoadFromFile(sgPastaExecutavel+sgFBConect);
//        LoadParamsFromIniFile(sgPastaExecutavel+sgFBConect);

        Params.Add('User_Name='+sUser_Name);
        Params.Add('Password='+sPassword);

        Connected:=True;
        Break;
      End; // with SQLC do
    Except // finally
      on e : Exception do
      Begin
        If i=1 Then sErroLocal   :=e.message;
        If i=2 Then sErroIntraNet:=e.message;
        If i=3 Then sErroInterNet:=e.message;
      End;
    End; // try
  End; // While bConecta do
End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMSolicTransf.DataModuleCreate(Sender: TObject);
begin

  // Pasta Executavel ==========================================================
  sgPastaExecutavel:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

  // Verifica Existencia do Arquivo de Configuração de Conexão =================
  sgFBConect:='FBConect_Local.ini';
  If not(fileexists(IncludeTrailingPathDelimiter(sgPastaExecutavel)+sgFBConect)) then
  Begin
    msg('Arquivo '+sgFBConect+' Não Encontrado !!','A');
    Application.Terminate;
    Exit;
  End;

  sgFBConect:='FBConect_IntraNet.ini';
  If not(fileexists(IncludeTrailingPathDelimiter(sgPastaExecutavel)+sgFBConect)) then
  Begin
    msg('Arquivo '+sgFBConect+' Não Encontrado !!','A');
    Application.Terminate;
    Exit;
  End;

  sgFBConect:='FBConect_InterNet.ini';
  If not(fileexists(IncludeTrailingPathDelimiter(sgPastaExecutavel)+sgFBConect)) then
  Begin
    msg('Arquivo '+sgFBConect+' Não Encontrado !!','A');
    Application.Terminate;
    Exit;
  End;

  // Windows: Nome do Usuario e do Computador ==================================
  UsuarioComputadorWindows(sgNomeUsuario, sgNomeComputador);

  // Conecta Banco BelShop.FDB =================================================
  SQLC.Connected:=False;

  ConectaBanco;

  // Date da Inicialização do Sistema ==========================================
  sgDtaHoje:=DateToStr(DataHoraServidorFI(DMSolicTransf.SQLQ_BuscaRapida));
  dgDtaHoje:=StrToDate(sgDtaHoje);

end;

procedure TDMSolicTransf.Timer1Timer(Sender: TObject);
Var
  sDtaAgora: String;
begin
  sDtaAgora:=DateToStr(DataHoraServidorFI(DMSolicTransf.SQLQ_BuscaRapida));

  If dgDtaHoje<>StrToDate(sDtaAgora) Then
  Begin
    Application.Terminate;
    Exit;
  End;
end;

end.
