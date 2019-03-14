unit UDMBelShopPedidos;

interface

uses
  Windows, Forms, SysUtils, Classes, DBXpress, FMTBcd, SqlExpr, DB, DBClient,
  Provider, StdCtrls, WinInet, ExtCtrls, // IBDatabase, IBCustomDataSet, IBQuery,
  RelVisual, Variants;

type
  TDMBelShopPedidos = class(TDataModule)
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
    CDS_OCItensCheckDES_PRODUTO: TStringField;
    CDS_OCItensCheckQTD_PRODUTO: TIntegerField;
    CDS_OCItensCheckQTD_CHECKOUT: TIntegerField;
    CDS_OCItensCheckDTA_CHECKOUT: TDateField;
    CDS_OCItensCheckHRA_CHECKOUT: TTimeField;
    CDS_OCItensCheckIND_OC: TStringField;
    SQLQuery2: TSQLQuery;
    CDS_OCItensCheckNUM_SEQ_OC: TIntegerField;
    CDS_OCItensCheckNUM_OC: TIntegerField;
    SQLQuery3: TSQLQuery;
    CDS_OCItensCheckENDERECO: TStringField;
    CDS_OCItensCheckCOD_PRODUTO_SIDI: TStringField;
    CDS_OCItensCheckCOD_PRODUTO_LINX: TFMTBCDField;
    RelVisual: TRelVisualJul;
    SQLQ_Relatorio: TSQLQuery;
    DSP_Relatorio: TDataSetProvider;
    CDS_Relatorio: TClientDataSet;
    CDS_OCItensCheckREFERENCIA: TStringField;
    CDS_OCItensCheckCOD_BARRA: TStringField;
    SQLSP: TSQLStoredProc;
    DSP_ProdNegativos: TDataSetProvider;
    CDS_ProdNegativos: TClientDataSet;
    DS_ProdNegativos: TDataSource;
    SQLQ_ProdNegativos: TSQLQuery;
    CDS_ProdNegativosCOD_PRODUTO: TFMTBCDField;
    CDS_ProdNegativosNOME: TStringField;
    CDS_ProdNegativosQTD_ESTOQUE: TFMTBCDField;
    CDS_ProdNegativosATIVO: TStringField;

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    Procedure ConectaBanco;
    Procedure FechaTudo;

    // Busca Numero da Ordem de Compra - SIDICOM / LINX 
    Function OCBuscaNumeroOC(sCodLjSIDI: String; iCodLjLINX: Integer): String;

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
  DMBelShopPedidos: TDMBelShopPedidos;

  sgDtaHoje,
  sgFBConect,
  sgPastaExecutavel,
  sgNomeComputador, sgNomeUsuario  // Usuario e Windows
  : String;

  dgDtaHoje: TDateTime;

  sgNrsOCs, sgNrsSeqOCs: String; // Usado na CheckOut OC / NFe

  tsgArquivo: TStringList;

  sgLojaLinx, sgLojaSidicom, sgNomeLoja: String;

  bgOCNova: Boolean;

implementation

uses DK_Procs1, UFrmBelShopPedidos;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Numero da Ordem de Compra - SIDICOM / LINX >>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TDMBelShopPedidos.OCBuscaNumeroOC(sCodLjSIDI: String; iCodLjLINX: Integer): String;
Begin
  SQLSP.Prepared:=False;
  SQLSP.StoredProcName:='SP_BUSCA_NUMERO_OC';
  SQLSP.ParamByName('par_CodLojaSIDI').AsString:=sCodLjSIDI;
  SQLSP.ParamByName('par_CodLojaLINX').AsInteger:=iCodLjLINX;
  SQLSP.Prepared:=True;

  SQLSP.ExecProc;
  Result:=SQLSP.ParamByName('Ret_NumOC').AsString;
  SQLSP.Prepared:=False;
  SQLSP.Close;
  SQLSP.Params.Clear;
  SQLSP.StoredProcName:='';
End; // // Busca Numero da Ordem de Compra - SIDICOM / LINX >>>>>>>>>>>>>>>>>>>>

// Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBelShopPedidos.FechaTudo;
Var
  i: Integer;
Begin

  // Fecha Componentes DMBelShopPedidos ===========================================
  For i:=0 to DMBelShopPedidos.ComponentCount-1 do
  Begin
    If DMBelShopPedidos.Components[i] is TClientDataSet Then
     If (DMBelShopPedidos.Components[i] as TClientDataSet).Active Then
     (DMBelShopPedidos.Components[i] as TClientDataSet).Close;

    If DMBelShopPedidos.Components[i] is TSQLQuery Then
     If (DMBelShopPedidos.Components[i] as TSQLQuery).Active Then
     (DMBelShopPedidos.Components[i] as TSQLQuery).Close;
  End;
end; // Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMBelShopPedidos.ConectaBanco;
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

    // Se Loja Cd = 99-SIDICOM e/ou 2-Linx Utiliza FBConect_IntraNet.ini =======
    If sgLojaLinx='2' Then
     If i=2 Then sgFBConect:='FBConect_IntraNet.ini';

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
  // Conexão DBExpress =========================================================
  // ===========================================================================
End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMBelShopPedidos.DataModuleCreate(Sender: TObject);
Var
  sErro,
  sPastaFonte: String;
begin
  // ===========================================================================
  // Pasta Executavel ==========================================================
  // ===========================================================================
  sgPastaExecutavel:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  // Pasta Executavel ==========================================================
  // ===========================================================================

//  sPastaFonte:=sgPastaExecutavel;
//
//  If sPastaFonte='C:\Projetos\BelShop\Fontes\BelShop Pedidos\' Then
//   sPastaFonte:='C:\BelShop_Odir\BelShop-Pedidos\';
//
//  // ===========================================================================
//  // Copia Arquivos: Loja.ini Anterior
//  // Exclui Pasta do Sistema Anterior
//  // ===========================================================================
//  If DirectoryExists('C:\BelShop_Odir\Solicitação de Transferêncis CD Lojas BelShop') Then
//  Begin
//    // Copia Arquivo Loja.ini Original
//    // True=Não Sobrescreve / False=Sobrescreve
//    CopyFile(PChar('C:\BelShop_Odir\Solicitação de Transferêncis CD Lojas BelShop\Loja.ini'),PChar(sPastaFonte+'Loja.ini'),False);
//    CopyFile(PChar('C:\BelShop_Odir\Solicitação de Transferêncis CD Lojas BelShop\Loja.ini'),PChar(sPastaFonte+'Loja.ORIGINAL'),False);
//
//    // Excluia Pasta do Sistema Anterior
//    ExcluiPastaWindows('C:\BelShop_Odir\Solicitação de Transferêncis CD Lojas BelShop');
//
//  End; // If DirectoryExists('C:\BelShop_Odir\Solicitação de Transferêncis CD Lojas BelShop') Then
//  // Copia Arquivos: Loja.ini Anterior
//  // Exclui Pasta do Sistema Anterior
//  // ===========================================================================
//
//  // ===========================================================================
//  // Transfere DLLs para o Windows - True=Não Sobrescreve ======================
//  // ===========================================================================
//  If DirectoryExists('C:\Windows\System32\') Then
//  Begin
//    CopyFile(PChar(sPastaFonte+'dbexpint.dll'),      PChar('C:\Windows\System32\dbexpint.dll'),True);
//    CopyFile(PChar(sPastaFonte+'dbexpUIBfire15.dll'),PChar('C:\Windows\System32\dbexpUIBfire15.dll'),True);
//    CopyFile(PChar(sPastaFonte+'FBCLIENT.DLL'),      PChar('C:\Windows\System32\FBCLIENT.DLL'),True);
//    CopyFile(PChar(sPastaFonte+'GDS32.DLL'),         PChar('C:\Windows\System32\GDS32.DLL'),True);
//    CopyFile(PChar(sPastaFonte+'midas.dll'),         PChar('C:\Windows\System32\midas.dll'),True);
//    CopyFile(PChar(sPastaFonte+'qtintf70.dll'),      PChar('C:\Windows\System32\qtintf70.dll'),True);
//  End; // If DirectoryExists('C:\Windows\System32\') Then
//
//  If DirectoryExists('C:\Windows\SysWOW64\') Then
//  Begin
//    CopyFile(PChar(sPastaFonte+'dbexpint.dll'),      PChar('C:\Windows\SysWOW64\dbexpint.dll'),True);
//    CopyFile(PChar(sPastaFonte+'dbexpUIBfire15.dll'),PChar('C:\Windows\SysWOW64\dbexpUIBfire15.dll'),True);
//    CopyFile(PChar(sPastaFonte+'FBCLIENT.DLL'),      PChar('C:\Windows\SysWOW64\FBCLIENT.DLL'),True);
//    CopyFile(PChar(sPastaFonte+'GDS32.DLL'),         PChar('C:\Windows\SysWOW64\GDS32.DLL'),True);
//    CopyFile(PChar(sPastaFonte+'midas.dll'),         PChar('C:\Windows\SysWOW64\midas.dll'),True);
//    CopyFile(PChar(sPastaFonte+'qtintf70.dll'),      PChar('C:\Windows\SysWOW64\qtintf70.dll'),True);
//  End; // If DirectoryExists('C:\Windows\SysWOW64\') Then
//  // Transfere DLLs para o Windows - True=Não Sobrescreve ======================
//  // ===========================================================================

  // ===========================================================================
  // Descrição do Loja =========================================================
  // Loja.Ini = Cod_Loja_Sidicom ; Cod_Loja_Linx ; Descriçãso do Loja ;
  // ===========================================================================
  tsgArquivo:=TStringList.Create;
  tsgArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sgPastaExecutavel)+'Loja.ini');

  sgLojaLinx     :='';
  sgLojaSidicom  :='';
  sgNomeLoja     :='';
  sErro          :='';
  Try
    If Trim(tsgArquivo[0])='' Then
     sErro:='SIM';

    If sErro='' Then
    Begin
      sgLojaSidicom  :=Separa_String(tsgArquivo[0],1);
      sgLojaLinx     :=Separa_String(tsgArquivo[0],2);
      sgNomeLoja     :=Separa_String(tsgArquivo[0],3);

      StrToInt(sgLojaLinx);
      StrToInt(sgLojaSidicom);

      If Trim(sgNomeLoja)='' Then
       sErro:='SIM';
    End; // If sErro='' Then
  Except
    sErro:='SIM'
  End;

  If (Trim(sErro)<>'') or (Trim(sgNomeLoja)='Limite Superado') Then
  Begin
    msg('Definição da Loja Inválida !!'+cr+'Entrar em Contato com o ODIR'+cr+'Celcular:  999-578-234','A');
    Application.Terminate;
    Exit;
  End;
  FreeAndNil(tsgArquivo);

  // Descrição do Loja =========================================================
  // Loja.Ini = Cod_Loja_Sidicom ; Cod_Loja_Linx ; Descriçãso do Loja ;
  // ===========================================================================

  // ===========================================================================
  // Verifica Existencia do Arquivo de Configuração de Conexão =================
  // ===========================================================================
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
  // ===========================================================================
  // Verifica Existencia do Arquivo de Configuração de Conexão =================
  // ===========================================================================

  // ===========================================================================
  // Windows: Nome do Usuario e do Computador ==================================
  // ===========================================================================
  UsuarioComputadorWindows(sgNomeUsuario, sgNomeComputador);
  // Windows: Nome do Usuario e do Computador ==================================
  // ===========================================================================

  // ===========================================================================
  // Conecta Banco BelShop.FDB =================================================
  // ===========================================================================
  SQLC.Connected:=False;

  ConectaBanco;
  // Conecta Banco BelShop.FDB =================================================
  // ===========================================================================

  // ===========================================================================
  // Date da Inicialização do Sistema ==========================================
  // ===========================================================================
  sgDtaHoje:=DateToStr(DataHoraServidorFI(DMBelShopPedidos.SQLQ_BuscaRapida));
  dgDtaHoje:=StrToDate(sgDtaHoje);
  // Date da Inicialização do Sistema ==========================================
  // ===========================================================================

end;

procedure TDMBelShopPedidos.Timer1Timer(Sender: TObject);
Var
  sDtaAgora: String;
begin
  sDtaAgora:=DateToStr(DataHoraServidorFI(DMBelShopPedidos.SQLQ_BuscaRapida));

  If dgDtaHoje<>StrToDate(sDtaAgora) Then
  Begin
    Application.Terminate;
    Exit;
  End;
end;

end.
