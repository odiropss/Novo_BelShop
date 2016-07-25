unit UDMSolicitacaoLojas;

interface

uses
  Windows, SysUtils, Classes, DBXpress, FMTBcd, DB, DBClient, Provider, SqlExpr,
  Forms;

type
  TDMSolicitacaoLojas = class(TDataModule)
    SQLC: TSQLConnection;
    SDS_Busca: TSQLDataSet;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
    SDS_DtaHoraServidor: TSQLDataSet;
    SDS_AcomprarLoja: TSQLDataSet;
    DSP_AcomprarLoja: TDataSetProvider;
    CDS_AcomprarLoja: TClientDataSet;
    CDS_AcomprarLojaNUM_SEQ: TIntegerField;
    CDS_AcomprarLojaNUM_DOCUMENTO: TIntegerField;
    CDS_AcomprarLojaDTA_DOCUMENTO: TSQLTimeStampField;
    CDS_AcomprarLojaIND_OC_GERADA: TStringField;
    CDS_AcomprarLojaDTA_OC_GERADA: TSQLTimeStampField;
    CDS_AcomprarLojaNUM_OC_GERADA: TIntegerField;
    CDS_AcomprarLojaOBS_OC: TStringField;
    CDS_AcomprarLojaCOD_EMPRESA: TStringField;
    CDS_AcomprarLojaDES_EMPRESA: TStringField;
    CDS_AcomprarLojaCOD_ITEM: TStringField;
    CDS_AcomprarLojaDES_ITEM: TStringField;
    CDS_AcomprarLojaQTD_SUGERIDA: TFMTBCDField;
    CDS_AcomprarLojaQTD_ACOMPRAR: TFMTBCDField;
    CDS_AcomprarLojaQTD_SALDO: TFMTBCDField;
    CDS_AcomprarLojaQTD_TRANSITO: TFMTBCDField;
    CDS_AcomprarLojaQTD_DISPONIVEL: TFMTBCDField;
    CDS_AcomprarLojaQTD_MEDIA_MES: TFMTBCDField;
    CDS_AcomprarLojaQTD_MEDIA_DIA: TFMTBCDField;
    CDS_AcomprarLojaQTD_DEM_MES1: TFMTBCDField;
    CDS_AcomprarLojaQTD_DEM_MES2: TFMTBCDField;
    CDS_AcomprarLojaQTD_DEM_MES3: TFMTBCDField;
    CDS_AcomprarLojaQTD_DEM_MES4: TFMTBCDField;
    CDS_AcomprarLojaQTD_DEM_MES5: TFMTBCDField;
    CDS_AcomprarLojaQTD_DEM_MES6: TFMTBCDField;
    CDS_AcomprarLojaQTD_DEM_MES7: TFMTBCDField;
    CDS_AcomprarLojaQTD_DEM_MES8: TFMTBCDField;
    CDS_AcomprarLojaUNI_COMPRA: TIntegerField;
    CDS_AcomprarLojaUNI_VENDA: TIntegerField;
    CDS_AcomprarLojaCOD_BARRAS: TStringField;
    CDS_AcomprarLojaCOD_GRUPO: TStringField;
    CDS_AcomprarLojaDES_GRUPO: TStringField;
    CDS_AcomprarLojaCOD_SUBGRUPO: TStringField;
    CDS_AcomprarLojaDES_SUBGRUPO: TStringField;
    CDS_AcomprarLojaDES_GENERICO: TStringField;
    CDS_AcomprarLojaCOD_APLICACAO: TStringField;
    CDS_AcomprarLojaDES_APLICACAO: TStringField;
    CDS_AcomprarLojaCOD_REFERENCIA: TStringField;
    CDS_AcomprarLojaCLA_CURVA_ABC: TStringField;
    CDS_AcomprarLojaCOD_FAMILIA_PRECO: TStringField;
    CDS_AcomprarLojaDES_FAMILIA_PRECO: TStringField;
    CDS_AcomprarLojaDTA_ULT_COMPRA: TDateField;
    CDS_AcomprarLojaCOD_FOR_ULT_COMPRA: TStringField;
    CDS_AcomprarLojaDES_FOR_ULT_COMPRA: TStringField;
    CDS_AcomprarLojaQTD_ULT_COMPRA: TFMTBCDField;
    CDS_AcomprarLojaVLR_UNI_ULT_COMPRA: TFMTBCDField;
    CDS_AcomprarLojaVLR_TOT_ULT_COMPRA: TFMTBCDField;
    CDS_AcomprarLojaVLR_UNI_COMPRA: TFMTBCDField;
    CDS_AcomprarLojaPER_DESCONTO: TFMTBCDField;
    CDS_AcomprarLojaDTA_ULT_VENDA: TDateField;
    CDS_AcomprarLojaCOD_CLI_ULT_VENDA: TStringField;
    CDS_AcomprarLojaDES_CLI_ULT_VENDA: TStringField;
    CDS_AcomprarLojaQTD_ULT_VENDA: TFMTBCDField;
    CDS_AcomprarLojaVLR_UNI_ULT_VENDA: TFMTBCDField;
    CDS_AcomprarLojaVLR_TOT_ULT_VENDA: TFMTBCDField;
    CDS_AcomprarLojaVLR_UNI_VENDA: TFMTBCDField;
    CDS_AcomprarLojaCOD_LISTA_VENDA: TStringField;
    CDS_AcomprarLojaDES_LISTA_VENDA: TStringField;
    CDS_AcomprarLojaCOD_LISTA_COMPRA: TStringField;
    CDS_AcomprarLojaDES_LISTA_COMPRA: TStringField;
    CDS_AcomprarLojaVLR_CUSTO_MEDIO: TFMTBCDField;
    CDS_AcomprarLojaVLR_TOT_VENDA: TFMTBCDField;
    CDS_AcomprarLojaVLR_TOT_COMPRA: TFMTBCDField;
    CDS_AcomprarLojaVLR_BRUTO: TFMTBCDField;
    CDS_AcomprarLojaVLR_DESCONTOS: TFMTBCDField;
    CDS_AcomprarLojaVLR_DESPESAS: TFMTBCDField;
    CDS_AcomprarLojaVLR_FRETE: TFMTBCDField;
    CDS_AcomprarLojaIND_SOMA_IPI_BASE_ICMS: TStringField;
    CDS_AcomprarLojaIND_SOMA_FRETE_BASE_ICMS: TStringField;
    CDS_AcomprarLojaIND_SOMA_DESPESA_BASE_ICMS: TStringField;
    CDS_AcomprarLojaIND_SOMA_IPI_BASE_ST: TStringField;
    CDS_AcomprarLojaIND_SOMA_FRETE_BASE_ST: TStringField;
    CDS_AcomprarLojaIND_SOMA_DESPESA_BASE_ST: TStringField;
    CDS_AcomprarLojaCOD_SIT_TRIBUTARIA: TStringField;
    CDS_AcomprarLojaCOD_IPI: TStringField;
    CDS_AcomprarLojaIND_IPI: TStringField;
    CDS_AcomprarLojaPER_IPI: TFMTBCDField;
    CDS_AcomprarLojaVLR_IPI: TFMTBCDField;
    CDS_AcomprarLojaCOD_ICMS: TStringField;
    CDS_AcomprarLojaPER_REDUCAO_ICMS: TFMTBCDField;
    CDS_AcomprarLojaVLR_REDUCAO_ICMS: TFMTBCDField;
    CDS_AcomprarLojaVLR_BASE_ICMS: TFMTBCDField;
    CDS_AcomprarLojaPER_ICMS: TFMTBCDField;
    CDS_AcomprarLojaVLR_ICMS: TFMTBCDField;
    CDS_AcomprarLojaCOD_GRUPO_ST: TIntegerField;
    CDS_AcomprarLojaDES_GRUPO_ST: TStringField;
    CDS_AcomprarLojaPER_MARGEM_ST: TFMTBCDField;
    CDS_AcomprarLojaIND_ST: TStringField;
    CDS_AcomprarLojaVLR_BASE_ST: TFMTBCDField;
    CDS_AcomprarLojaPER_ST: TFMTBCDField;
    CDS_AcomprarLojaVLR_ST: TFMTBCDField;
    CDS_AcomprarLojaPER_REPASSE: TFMTBCDField;
    CDS_AcomprarLojaVLR_REPASSE: TFMTBCDField;
    CDS_AcomprarLojaCOD_COMPROVANTE_ICMS: TStringField;
    CDS_AcomprarLojaCOD_REFERENCIA_FORN: TStringField;
    CDS_AcomprarLojaCOD_FORNECEDOR: TStringField;
    CDS_AcomprarLojaDES_FORNECEDOR: TStringField;
    CDS_AcomprarLojaTIP_PESSOA: TStringField;
    CDS_AcomprarLojaDES_EMAIL: TStringField;
    CDS_AcomprarLojaQTD_NR_DIAS: TIntegerField;
    CDS_AcomprarLojaQTD_NR_MESES: TIntegerField;
    CDS_AcomprarLojaQTD_TOT_MESES: TIntegerField;
    CDS_AcomprarLojaCOD_COMPRADOR: TIntegerField;
    CDS_AcomprarLojaBLOB_TEXTO: TMemoField;
    CDS_AcomprarLojaIND_TRANSF: TStringField;
    CDS_AcomprarLojaDTA_LIM_TRANSF: TDateField;
    CDS_AcomprarLojaQTD_TRANSF: TFMTBCDField;
    CDS_AcomprarLojaIND_USAR: TStringField;
    CDS_AcomprarLojaIND_QTD_ACIMA: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);

    // Odir ====================================================================
    Procedure ConectaBanco;
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
  DMSolicitacaoLojas: TDMSolicitacaoLojas;

  sgPath_Local: String;

implementation

uses UFrmSolicitacaoLojas, DK_Procs1;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMSolicitacaoLojas.ConectaBanco;
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

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TDMSolicitacaoLojas.DataModuleCreate(Sender: TObject);
Var
  i: Integer;
  Arq: TextFile;
  sArquivo: TStringList;
  sLinha: String;
  sNewIP: String;
begin
  // Pasta Executavel ==========================================================
  sgPath_Local:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

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

end;

end.
