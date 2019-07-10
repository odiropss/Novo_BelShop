{///////////////////////////////
ATENÇÃO !!!
================================================================================
         Este DataModulo é USADO TAMBÉM pelo Projeto: PCurvasDemandas
================================================================================
///////////////////////////////}


unit UDMMovtosEmpresas;
{
Retirei do IBQ_ProdutoMPMS:
  - or Cast(fo.dataalteracao as Date)>= :Dta3)
}
interface

uses
  Windows, SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, DBClient, Provider,
  Forms, IBDatabase, DBLocal, DBLocalI, IBCustomDataSet, IBQuery,
  IBStoredProc, RpRenderRTF, RpRenderHTML, RpRender, RpRenderPDF, RpDefine,
  RpBase, RpSystem, Math, IBUpdateSQL, WinInet, SimpleDS;

type
  TDMMovtosEmpresas = class(TDataModule)
    SQLC: TSQLConnection;
    SDS_Busca: TSQLDataSet;
    CDS_Busca: TClientDataSet;
    DSP_Busca: TDataSetProvider;
    SDS_EmpProcessa: TSQLDataSet;
    CDS_EmpProcessa: TClientDataSet;
    DSP_EmpProcessa: TDataSetProvider;
    CDS_EmpProcessaCOD_FILIAL: TStringField;
    CDS_EmpProcessaENDERECO_IP: TStringField;
    CDS_EmpProcessaPASTA_BASE_DADOS: TStringField;
    CDS_EmpProcessaDES_BASE_DADOS: TStringField;
    CDS_EmpProcessaCOD_EMP: TStringField;
    CDS_EmpProcessaRAZAO_SOCIAL: TStringField;
    CDS_EmpProcessaTIP_EMP: TStringField;
    CDS_EmpProcessaIND_ATIVO: TStringField;
    CDS_EmpProcessaDATABASE: TStringField;
    CDS_EmpProcessaTRANSACAO: TStringField;
    SDS_DtaHoraServidor: TSQLDataSet;
    CDS_EmpProcessaENDERECO_IP_EXTERNO: TStringField;
    SDS_Produto: TSQLDataSet;
    DSP_Produto: TDataSetProvider;
    CDS_Produto: TClientDataSet;
    IBQ_ProdutoMPMS: TIBQuery;
    IBQ_ListaPrecosMPMS: TIBQuery;
    SDS_ListaPrecos: TSQLDataSet;
    DSP_ListaPrecos: TDataSetProvider;
    CDS_ListaPrecos: TClientDataSet;
    CDS_ListaPrecosCODLISTA: TStringField;
    CDS_ListaPrecosCODPRODUTO: TStringField;
    CDS_ListaPrecosPRECOCOMPRA: TFMTBCDField;
    CDS_ListaPrecosMARGEM: TFMTBCDField;
    CDS_ListaPrecosPRECOVENDA: TFMTBCDField;
    CDS_ListaPrecosPRECOANTERIOR: TFMTBCDField;
    CDS_ListaPrecosDATAALTERACAO: TDateField;
    CDS_ListaPrecosHORAALTERACAO: TTimeField;
    CDS_ListaPrecosDESCONTO: TFMTBCDField;
    CDS_ListaPrecosDESCONTOMAX: TFMTBCDField;
    CDS_ListaPrecosDESATIVADO: TStringField;
    CDS_ListaPrecosPRECODOLAR: TFMTBCDField;
    CDS_ListaPrecosACRECIMOLISTA: TFMTBCDField;
    CDS_ListaPrecosCUSTOSLISTA: TFMTBCDField;
    CDS_ListaPrecosDTA_ATUALIZACAO: TDateField;
    IBQ_ListaPrecosMPMSCODLISTA: TIBStringField;
    IBQ_ListaPrecosMPMSCODPRODUTO: TIBStringField;
    IBQ_ListaPrecosMPMSPRECOCOMPRA: TIBBCDField;
    IBQ_ListaPrecosMPMSMARGEM: TIBBCDField;
    IBQ_ListaPrecosMPMSPRECOVENDA: TIBBCDField;
    IBQ_ListaPrecosMPMSPRECOANTERIOR: TIBBCDField;
    IBQ_ListaPrecosMPMSDATAALTERACAO: TDateField;
    IBQ_ListaPrecosMPMSHORAALTERACAO: TTimeField;
    IBQ_ListaPrecosMPMSDESCONTO: TIBBCDField;
    IBQ_ListaPrecosMPMSDESCONTOMAX: TIBBCDField;
    IBQ_ListaPrecosMPMSDESATIVADO: TIBStringField;
    IBQ_ListaPrecosMPMSPRECODOLAR: TIBBCDField;
    IBQ_ListaPrecosMPMSACRECIMOLISTA: TIBBCDField;
    IBQ_ListaPrecosMPMSCUSTOSLISTA: TIBBCDField;
    IBQ_ListaPrecosMPMSDTA_ATUALIZACAO: TDateField;
    IBQ_FornecedoresMPMS: TIBQuery;
    SDS_Fornecedores: TSQLDataSet;
    DSP_Fornecedores: TDataSetProvider;
    CDS_Fornecedores: TClientDataSet;
    CDS_FornecedoresCODFORNECEDOR: TStringField;
    CDS_FornecedoresNOMEFORNECEDOR: TStringField;
    CDS_FornecedoresEFILIAL: TStringField;
    CDS_FornecedoresCODTIPOFOR: TStringField;
    CDS_FornecedoresCIDADE: TStringField;
    CDS_FornecedoresESTADO: TStringField;
    CDS_FornecedoresCODIGOPOSTAL: TStringField;
    CDS_FornecedoresNUMEROCGCMF: TStringField;
    CDS_FornecedoresNUMEROINSC: TStringField;
    CDS_FornecedoresNUMEROISSQN: TStringField;
    CDS_FornecedoresNUMEROCPF: TStringField;
    CDS_FornecedoresPESSOA: TStringField;
    CDS_FornecedoresFONE1: TStringField;
    CDS_FornecedoresFONE2: TStringField;
    CDS_FornecedoresFONEFAX: TStringField;
    CDS_FornecedoresINTERNET: TStringField;
    CDS_FornecedoresEMAIL: TStringField;
    CDS_FornecedoresCLASSEFOR: TStringField;
    CDS_FornecedoresCONTATO: TStringField;
    CDS_FornecedoresOBSERVACAO: TMemoField;
    CDS_FornecedoresBAIRRO: TStringField;
    CDS_FornecedoresSIMPLESESTADUAL: TStringField;
    CDS_FornecedoresCODCENTROCUSTO: TStringField;
    CDS_FornecedoresLOGRADOURO: TStringField;
    CDS_FornecedoresLOGNUMERO: TStringField;
    CDS_FornecedoresLOGCOMPL: TStringField;
    CDS_FornecedoresCODPAIS: TStringField;
    CDS_FornecedoresRAZAOSOCIAL: TStringField;
    CDS_FornecedoresDATAALTERACAO: TSQLTimeStampField;
    CDS_FornecedoresFORISENTOICM: TStringField;
    CDS_FornecedoresFORISENTOIPI: TStringField;
    CDS_FornecedoresFORISENTOSUBST: TStringField;
    CDS_FornecedoresFORISENTOPISCOFINS: TStringField;
    CDS_FornecedoresUSAICMCOMPRA2_SN: TStringField;
    CDS_FornecedoresDTA_ATUALIZACAO: TSQLTimeStampField;
    IBQ_FornecedoresMPMSCODFORNECEDOR: TIBStringField;
    IBQ_FornecedoresMPMSNOMEFORNECEDOR: TIBStringField;
    IBQ_FornecedoresMPMSEFILIAL: TIBStringField;
    IBQ_FornecedoresMPMSCODTIPOFOR: TIBStringField;
    IBQ_FornecedoresMPMSCIDADE: TIBStringField;
    IBQ_FornecedoresMPMSESTADO: TIBStringField;
    IBQ_FornecedoresMPMSCODIGOPOSTAL: TIBStringField;
    IBQ_FornecedoresMPMSNUMEROCGCMF: TIBStringField;
    IBQ_FornecedoresMPMSNUMEROINSC: TIBStringField;
    IBQ_FornecedoresMPMSNUMEROISSQN: TIBStringField;
    IBQ_FornecedoresMPMSNUMEROCPF: TIBStringField;
    IBQ_FornecedoresMPMSPESSOA: TIBStringField;
    IBQ_FornecedoresMPMSFONE1: TIBStringField;
    IBQ_FornecedoresMPMSFONE2: TIBStringField;
    IBQ_FornecedoresMPMSFONEFAX: TIBStringField;
    IBQ_FornecedoresMPMSINTERNET: TIBStringField;
    IBQ_FornecedoresMPMSEMAIL: TIBStringField;
    IBQ_FornecedoresMPMSCLASSEFOR: TIBStringField;
    IBQ_FornecedoresMPMSCONTATO: TIBStringField;
    IBQ_FornecedoresMPMSOBSERVACAO: TMemoField;
    IBQ_FornecedoresMPMSBAIRRO: TIBStringField;
    IBQ_FornecedoresMPMSSIMPLESESTADUAL: TIBStringField;
    IBQ_FornecedoresMPMSCODCENTROCUSTO: TIBStringField;
    IBQ_FornecedoresMPMSLOGRADOURO: TIBStringField;
    IBQ_FornecedoresMPMSLOGNUMERO: TIBStringField;
    IBQ_FornecedoresMPMSLOGCOMPL: TIBStringField;
    IBQ_FornecedoresMPMSCODPAIS: TIBStringField;
    IBQ_FornecedoresMPMSRAZAOSOCIAL: TIBStringField;
    IBQ_FornecedoresMPMSDATAALTERACAO: TDateTimeField;
    IBQ_FornecedoresMPMSFORISENTOICM: TIBStringField;
    IBQ_FornecedoresMPMSFORISENTOIPI: TIBStringField;
    IBQ_FornecedoresMPMSFORISENTOSUBST: TIBStringField;
    IBQ_FornecedoresMPMSFORISENTOPISCOFINS: TIBStringField;
    IBQ_FornecedoresMPMSUSAICMCOMPRA2_SN: TIBStringField;
    IBQ_FornecedoresMPMSDTA_ATUALIZACAO: TDateField;
    SDS_BuscaRapida: TSQLDataSet;
    CDS_BuscaRapida: TClientDataSet;
    DSP_BuscaRapida: TDataSetProvider;
    SDS_Pesquisa: TSQLDataSet;
    CDS_Pesquisa: TClientDataSet;
    DSP_Pesquisa: TDataSetProvider;
    IBQ_EstoqueLoja: TIBQuery;
    IBQ_EstoqueLojaCODFILIAL: TIBStringField;
    IBQ_EstoqueLojaCODPRODUTO: TIBStringField;
    IBQ_EstoqueLojaSALDOATUAL: TIBBCDField;
    IBQ_EstoqueLojaPEDIDOPENDENTE: TIBBCDField;
    IBQ_EstoqueLojaCUSMEDVALOR: TIBBCDField;
    IBQ_EstoqueLojaCUSTOMEDIO: TIBBCDField;
    IBQ_EstoqueLojaLASTPRECOCOMPRA: TIBBCDField;
    IBQ_EstoqueLojaLASTCUSTOMEDIO: TIBBCDField;
    IBQ_EstoqueLojaESTOQUEIDEAL: TIBBCDField;
    IBQ_EstoqueLojaESTOQUEMAXIMO: TIBBCDField;
    IBQ_EstoqueLojaDATAALTERACADASTRO: TDateTimeField;
    IBQ_EstoqueLojaDATAALTERAESTOQUE: TDateTimeField;
    IBQ_EstoqueLojaDATAALTERAESTOQUE_PED: TDateTimeField;
    IBQ_EstoqueLojaDTA_ATUALIZACAO: TDateField;
    IBQ_EstoqueLojaHRA_ATUALIZACAO: TIBStringField;
    SQLQ: TSQLQuery;
    SDS_UnicoBusca: TSQLDataSet;
    SimpleDS: TSimpleDataSet;
    SDS: TSQLDataSet;
    IBQ_ProdutoMPMSUPDATE_INSERT: TIBStringField;
    IBQ_EstoqueLojaZONAENDERECO: TIntegerField;
    IBQ_EstoqueLojaCORREDOR: TIBStringField;
    IBQ_EstoqueLojaPRATELEIRA: TIBStringField;
    IBQ_EstoqueLojaGAVETA: TIBStringField;
    IBQ_EstoqueLojaPRINCIPALFOR: TIBStringField;
    SDS_LojaLinx: TSQLDataSet;
    CDS_LojaLinx: TClientDataSet;
    DSP_LojaLinx: TDataSetProvider;
    DS_EmpProcessa: TDataSource;
    CDS_EmpProcessaCOD_LINX: TIntegerField;
    SQLQ_Linx: TSQLQuery;
    SQLQuery1: TSQLQuery;
    CDS_EmpProcessaDTA_INICIO_LINX: TDateField;
    CDS_EmpProcessaIND_DOMINGO: TStringField;
    IBQ_Busca: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);

    // Odir
    Procedure ConectaBanco;
    Procedure MontaConexaoEmpresas;

    // Tipo de Conexão
    Procedure BuscaTipoConexao;

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
  DMMovtosEmpresas: TDMMovtosEmpresas;

  sgPath_Local: String;
  sgNomeServidor, sgTpConexao: String;
  sgCompMaster, sgCompServer: String; // Dados dos Servidores, Computador Local
  sgIPServer, sgIPInternetServer: String; // Ips do Servidor

  // Dias Uteis para BelShop
  function DiasUteisBelShop(dDataI, dDataF: TDateTime; bDomingo, bSabado: Boolean): Integer;

implementation

uses DK_Procs1, UDMConexoes, UMovtosEmpresas;

{$R *.dfm}

// Dias Uteis para BelShop >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
function DiasUteisBelShop(dDataI, dDataF: TDateTime; bDomingo, bSabado: Boolean): Integer;
Var
  MySql, sDiaSemanaMes: String;
  sDateSeparator: string;
begin
  Result:=0;

  sDateSeparator:=DateSeparator;

  DateSeparator:='/';
  MySql:=' Select f.Dta_Feriado'+
         ' From FIN_FERIADOS_ANO f'+
         ' Where f.Ind_Ativo=''SIM'''+
         ' And f.Dta_Feriado between '+
         QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dDataI))))+' AND '+
         QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dDataF))))+
         ' Order by f.Dta_Feriado';
  DMMovtosEmpresas.CDS_BuscaRapida.Close;
  DMMovtosEmpresas.SDS_BuscaRapida.CommandText:=MySql;
  DMMovtosEmpresas.CDS_BuscaRapida.Open;

  While dDataI<=dDataF do
  Begin
    sDiaSemanaMes:=DateToStr(dDataI);
    sDiaSemanaMes:='1';
    If DMMovtosEmpresas.CDS_BuscaRapida.Locate('Dta_Feriado',dDataI,[]) Then
     Begin
       sDiaSemanaMes:='0';
     End
    Else If (DiaSemanaAbrev(dDataI)='Dom') and (Not bDomingo) Then
     Begin
       sDiaSemanaMes:='0';
     End
    Else If (DiaSemanaAbrev(dDataI)='Sab') and (Not bSabado) Then
     Begin
       sDiaSemanaMes:='0';
     End; // If (DiaSemanaAbrev(StrToDateTime(sgDtaInicio))='Dom') Then

    If sDiaSemanaMes<>'0' Then
    Begin
      Inc(Result);
    End; // If sDiaSemana<>'0' Then

    dDataI:=dDataI+1;
  End; // While dDataI<=dDataF do
  DMMovtosEmpresas.CDS_BuscaRapida.Close;

  If sDateSeparator='/' Then DateSeparator:='/' Else DateSeparator:='.';
End; // Dias Uteis para BelShop >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Tipo de Conexão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMMovtosEmpresas.BuscaTipoConexao;
Var
  tsArquivo: TStringList;
  s: String;
  i: Integer;
Begin
  tsArquivo:= TStringList.Create;
  Try
    { Carrega o conteúdo do arquivo texto para a   memória }
    tsArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sgPath_Local)+'Servidor_Adm.ini');

    { Realiza um loop em toda a lista }
    s:='';
    sgNomeServidor:='';
    sgTpConexao   :='';
    For i := 0 to tsArquivo.Count - 1 do
    Begin
      s:=tsArquivo[i];

      If Trim(s)<>'' Then
      Begin
        If i=0 Then sgNomeServidor:=Trim(s);
        If i=2 Then sgTpConexao:=Trim(s);
      End;
    End; // For i := 0 to tsArquivo.Count - 1 do
  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsArquivo);
  End; // Try
  tsArquivo.Free;
End;

// Monta Empresas a Conectar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMMovtosEmpresas.MontaConexaoEmpresas;
Var
  MySql, s: String;
  sEndIP: String;
  i: Integer;
Begin
  MySql:=' SELECT p.computer_master, p.computer_server, IP_Server, IP_Internet_Server'+
         ' FROM PARAMETROS p';
  CDS_BuscaRapida.Close;
  SDS_BuscaRapida.CommandText:=MySql;
  CDS_BuscaRapida.Open;

  sgCompMaster      :=AnsiUpperCase(CDS_BuscaRapida.FieldByName('computer_master').AsString);
  sgCompServer       :=AnsiUpperCase(CDS_BuscaRapida.FieldByName('computer_server').AsString);
  sgIPServer        :=AnsiUpperCase(CDS_BuscaRapida.FieldByName('IP_Server').AsString);
  sgIPInternetServer:=AnsiUpperCase(CDS_BuscaRapida.FieldByName('IP_Internet_Server').AsString);

  CDS_BuscaRapida.Close;


  CDS_EmpProcessa.Close;
  CDS_EmpProcessa.Open;

  // Inicializa Conexoes
  While Not CDS_EmpProcessa.Eof do
  Begin

    For i:=0 to DMConexoes.ComponentCount-1 do
    Begin
      If DMConexoes.Components[i] is TIBDatabase Then
      Begin
        If CDS_EmpProcessaDATABASE.AsString='IBDB_99' Then
        sEndIP:='';

        If (DMConexoes.Components[i] as TIBDatabase).Name=CDS_EmpProcessaDATABASE.AsString Then
        Begin
          (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

          sEndIP:=CDS_EmpProcessaENDERECO_IP.AsString;

          // Tipo de Conexão: NetBEUI
          If (Trim(sgTpConexao)='')              Or (Trim(sgTpConexao)='NetBEUI') Or
             (AnsiUpperCase(sEndIP)='LOCALHOST') Or (AnsiUpperCase(sEndIP)=sgCompServer) Or
             (AnsiUpperCase(sEndIP)=sgIPServer) Then
           s:='\\'+IncludeTrailingPathDelimiter(sEndIP)+
                   IncludeTrailingPathDelimiter(CDS_EmpProcessaPASTA_BASE_DADOS.AsString)+
                                               CDS_EmpProcessaDES_BASE_DADOS.AsString;

          // Tipo de Conexão: TCP/IP
          If (Trim(sgTpConexao)='TCP/IP')          and (AnsiUpperCase(sEndIP)<>'LOCALHOST') and
             (AnsiUpperCase(sEndIP)<>sgCompServer) and (AnsiUpperCase(sEndIP)<>sgIPServer) Then
           s:=sEndIP+':'+
              IncludeTrailingPathDelimiter(CDS_EmpProcessaPASTA_BASE_DADOS.AsString)+
                                           CDS_EmpProcessaDES_BASE_DADOS.AsString;

          //==============================================================================
          // Acerta Conexao com a Loja 08 - 201.86.212.9:C:\SIDICOM.NEW\BIGNEW.FDB - TCPIP
          //==============================================================================
          If CDS_EmpProcessaCOD_FILIAL.AsString='08' Then
           s:=sEndIP+':'+
              IncludeTrailingPathDelimiter(CDS_EmpProcessaPASTA_BASE_DADOS.AsString)+
                                           CDS_EmpProcessaDES_BASE_DADOS.AsString;

//           s:=CDS_EmpProcessaENDERECO_IP.AsString+':'+
//              IncludeTrailingPathDelimiter(CDS_EmpProcessaPASTA_BASE_DADOS.AsString)+
//                                           CDS_EmpProcessaDES_BASE_DADOS.AsString;

          If (CDS_EmpProcessaENDERECO_IP.AsString='192.168.0.252') AND (CDS_EmpProcessaDATABASE.AsString='IBDB_99') Then
           s:='192.168.0.252:E:\sidicom.new\BELSHOP_CD.FDB';

          (DMConexoes.Components[i] as TIBDatabase).DatabaseName:=s;
          Break;
        End;
      End; // If DMConexoes.Components[i] is TIBDatabase Then
    End; // For i:=0 to DMConexoes.ComponentCount-1 do

    CDS_EmpProcessa.Next;
  End; // While Not CDS_EmpProcessa.Eof do
  CDS_EmpProcessa.First;

End; // Monta Empresas a Conectar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMMovtosEmpresas.ConectaBanco;
Var
  Arq: TextFile;
  s, sBancoIB: String;
  i: Integer;
  b: Boolean;

  Flags : Cardinal;
begin

  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    Application.Terminate;
    Exit;
  End;

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
    Break;

  End;
  CloseFile(Arq);

End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMMovtosEmpresas.DataModuleCreate(Sender: TObject);
Var
  i: Integer;
  Arq: TextFile;
  sArquivo: TStringList;
  sLinha: String;
  sNewIP: String;
begin
  // Pasta Executavel ==========================================================
  sgPath_Local:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

  // Tipo de Conexão ===========================================================
  BuscaTipoConexao;

  // Verifica a Existencia do Arquivo "ConexaoExterna.ini" =====================
  sNewIP:='';
  bgConexaoLocal:=True;
  If fileexists(sgPath_Local+'ConexaoExterna.ini') then
  Begin
    bgConexaoLocal:=False;

    // Busca Novo IP do Banco de Dados BelShop.FDB ------------------
    AssignFile(Arq,sgPath_Local+'ConexaoExterna.ini');

    Reset(Arq);
    While not Eof(Arq) do
    Begin
     Readln(Arq,sLinha);

     If Trim(Copy(sLinha,1,33))='IP do Banco de Dados BELSHOP.FDB:' Then
     Begin
       i:=pos(':', sLinha);
       sNewIP:=Trim(Copy(sLinha,i+1,Length(sLinha)));
       Break
     End; // If i=2 Then
    End; // While not Eof(Arq) do
    CloseFile(Arq);

    // Acerta Caminho do Banco BelShop.FDB em PCTConect_IB.ini ------
    If sNewIP<>'' Then
    Begin
      sArquivo:=TStringList.Create;

      Try
        sArquivo.LoadFromFile(sgPath_Local+'PCTConect_IB.ini');

        For i:=0 to sArquivo.Count - 1 do
        Begin
          If AnsiUpperCase(Copy(sArquivo[i],1,8))='DATABASE' Then
          Begin
            sArquivo[i]:='Database=\\'+sNewIP+'\C:\Projetos\BelShop\Dados\BELSHOP.FDB';
            Break;
          End; // If Copy(s,1,2)=Edit1.Text Then
        End; // For i:=0 to sArquivo.Count - 1 do

       sArquivo.SaveToFile(sgPath_Local+'PCTConect_IB.ini');
      Finally // Try
        { Libera a instancia da lista da memória }
        FreeAndNil(sArquivo);
      End; // Try

      sArquivo.Free;
    End; // If sNewIP<>'' Then
  End; // If fileexists(sgPath_Local+'ConexaoExterna.ini') then

  SQLC.Connected:=False;

  ConectaBanco;

  MontaConexaoEmpresas;

end;

end.

