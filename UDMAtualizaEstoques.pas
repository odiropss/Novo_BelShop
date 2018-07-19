unit UDMAtualizaEstoques;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, IBCustomDataSet, IBQuery,
  SqlExpr, DBClient, Provider, IBDatabase, WinInet, Forms, Menus;

type
  TDMAtualizaEstoques = class(TDataModule)
    SQLC: TSQLConnection;
    SDS_DtaHoraServidor: TSQLDataSet;
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
    SDS_EmpProcessa: TSQLDataSet;
    DSP_EmpProcessa: TDataSetProvider;
    CDS_EmpProcessa: TClientDataSet;
    CDS_EmpProcessaCOD_FILIAL: TStringField;
    CDS_EmpProcessaENDERECO_IP: TStringField;
    CDS_EmpProcessaENDERECO_IP_EXTERNO: TStringField;
    CDS_EmpProcessaPASTA_BASE_DADOS: TStringField;
    CDS_EmpProcessaDES_BASE_DADOS: TStringField;
    CDS_EmpProcessaCOD_EMP: TStringField;
    CDS_EmpProcessaRAZAO_SOCIAL: TStringField;
    CDS_EmpProcessaTIP_EMP: TStringField;
    CDS_EmpProcessaIND_ATIVO: TStringField;
    CDS_EmpProcessaDATABASE: TStringField;
    CDS_EmpProcessaTRANSACAO: TStringField;
    IBQ_EstoqueLojaHRA_ATUALIZACAO: TIBStringField;
    IBQ_EstoqueLojaPRINCIPALFOR: TIBStringField;
    IBQ_EstoqueLojaZONAENDERECO: TIntegerField;
    IBQ_EstoqueLojaCORREDOR: TIBStringField;
    IBQ_EstoqueLojaPRATELEIRA: TIBStringField;
    IBQ_EstoqueLojaGAVETA: TIBStringField;
    SDS_LojaLinx: TSQLDataSet;
    CDS_LojaLinx: TClientDataSet;
    DSP_LojaLinx: TDataSetProvider;
    CDS_EmpProcessaCOD_LINX: TIntegerField;
    CDS_EmpProcessaDTA_INICIO_LINX: TDateField;
    CDS_EmpProcessaDTA_INVENTARIO_LINX: TDateField;
    IBQ_EstoqueLojaSALDO_FINAL_SIDICOM: TIBBCDField;
    CDS_BuscaRapida: TClientDataSet;
    DSP_BuscaRapida: TDataSetProvider;
    SQLQ_BuscaRapida: TSQLQuery;
    SQLQuery1: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);

    // Odir ====================================================================
    Procedure ConectaBanco;
    Procedure MontaConexaoEmpresas;

    // Tipo de Conexão
    Procedure BuscaTipoConexao;
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
  DMAtualizaEstoques: TDMAtualizaEstoques;

  sgPath_Local: String;
  sgTpConexao   : String;

  Flags : Cardinal; // Verifica Internet Ativo - Encerra Necessario

implementation

uses UDMConexoes, UAtualizaEstoques, DK_Procs1, uj_002, uj_001;

{$R *.dfm}
// Odir ========================================================================

// Tipo de Conexão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMAtualizaEstoques.BuscaTipoConexao;
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
    sgTpConexao   :='';
    For i := 0 to tsArquivo.Count - 1 do
    Begin
      s:=tsArquivo[i];

      If Trim(s)<>'' Then
      Begin
        If i=2 Then sgTpConexao:=Trim(s);
      End;
    End; // For i := 0 to tsArquivo.Count - 1 do
  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsArquivo);
  End; // Try
  tsArquivo.Free;
End; // Tipo de Conexão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta Empresas a Conectar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMAtualizaEstoques.MontaConexaoEmpresas;
Var
  s: String;
  sEndIP: String;
  i: Integer;
Begin

  CDS_EmpProcessa.Close;
  CDS_EmpProcessa.Open;

  // Inicializa Conexoes
  While Not CDS_EmpProcessa.Eof do
  Begin
    For i:=0 to DMConexoes.ComponentCount-1 do
    Begin
      If DMConexoes.Components[i] is TIBDatabase Then
      Begin
        If (DMConexoes.Components[i] as TIBDatabase).Name=CDS_EmpProcessaDATABASE.AsString Then
        Begin
          (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

          sEndIP:=CDS_EmpProcessaENDERECO_IP.AsString;

          //Tipo de Conexão: TCP/IP NetBEUI
          If (Trim(sgTpConexao)='') Or (Trim(sgTpConexao)='NetBEUI') Then
           s:='\\'+IncludeTrailingPathDelimiter(sEndIP)+
                   IncludeTrailingPathDelimiter(CDS_EmpProcessaPASTA_BASE_DADOS.AsString)+
                                               CDS_EmpProcessaDES_BASE_DADOS.AsString;

          If Trim(sgTpConexao)='TCP/IP' Then
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
Procedure TDMAtualizaEstoques.ConectaBanco;
Var
  Arq: TextFile;
  s, sBancoIB: String;
  i: Integer;
  b: Boolean;
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
  End; // While not Eof(Arq) do
  CloseFile(Arq);

End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMAtualizaEstoques.DataModuleCreate(Sender: TObject);
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
{

Select
c.cod_filial, c.cod_linx, c.endereco_ip,
c.endereco_ip_externo,
c.pasta_base_dados, c.des_base_dados, c.cod_emp, c.razao_social, c.tip_emp,
c.ind_ativo, c.dta_inicio_linx, c.dta_inventario_linx,
'IBDB_'||c.cod_filial "DATABASE",
'IBT_'||c.cod_filial  "TRANSACAO"

From emp_conexoes  c
Where ((c.ind_ativo='SIM')
       or
       (c.cod_filial=99)
       or
       (c.cod_filial=50)
      )
order by c.cod_filial

}
