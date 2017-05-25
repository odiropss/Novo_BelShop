unit UDMArtesanalis;

interface

uses
  Windows, Forms, SysUtils, Classes, DBXpress, FMTBcd, DB, DBClient, Provider, SqlExpr,
  WinInet, StdCtrls;

type
  TDMArtesanalis = class(TDataModule)
    SQLC: TSQLConnection;
    SQLQ_Busca: TSQLQuery;
    DSP_Busca: TDataSetProvider;
    CDS_Busca: TClientDataSet;
    DS_Busca: TDataSource;
    SQLQ_BuscaRapida: TSQLQuery;
    DSP_BuscaRapida: TDataSetProvider;
    CDS_BuscaRapida: TClientDataSet;
    SQLQ_MateriaPrima: TSQLQuery;
    DSP_MateriaPrima: TDataSetProvider;
    CDS_MateriaPrima: TClientDataSet;
    DS_MateriaPrima: TDataSource;
    CDS_MateriaPrimaCOD_MATERIAPRIMA: TIntegerField;
    CDS_MateriaPrimaDES_MATERIAPRIMA: TStringField;
    SDS_Pesquisa: TSQLDataSet;
    DSP_Pesquisa: TDataSetProvider;
    CDS_Pesquisa: TClientDataSet;
    DS_Pesquisa: TDataSource;
    SQLQ_ProdutoProducao: TSQLQuery;
    DSP_ProdutoProducao: TDataSetProvider;
    CDS_ProdutoProducao: TClientDataSet;
    DS_ProdutoProducao: TDataSource;
    CDS_MateriaPrimaDES_UNIDADE: TStringField;
    CDS_MateriaPrimaPRECO_CUSTO: TFMTBCDField;
    CDS_MateriaPrimaCUSTO_MEDIO: TFMTBCDField;
    CDS_MateriaPrimaQTD_ESTOQUE: TFMTBCDField;
    SQLQ_ProdutoMatPrima: TSQLQuery;
    DSP_ProdutoMatPrima: TDataSetProvider;
    CDS_ProdutoMatPrima: TClientDataSet;
    DS_ProdutoMatPrima: TDataSource;
    CDS_ProdutoMatPrimaCOD_MATERIAPRIMA: TIntegerField;
    CDS_ProdutoMatPrimaDES_MATERIAPRIMA: TStringField;
    CDS_ProdutoMatPrimaDES_UNIDADE: TStringField;
    CDS_ProdutoMatPrimaPRECO_CUSTO: TFMTBCDField;
    CDS_ProdutoMatPrimaCUSTO_MEDIO: TFMTBCDField;
    CDS_ProdutoMatPrimaQTD_ESTOQUE: TFMTBCDField;
    CDS_ProdutoProducaoCOD_MATERIAPRIMA: TIntegerField;
    CDS_ProdutoProducaoDES_MATERIAPRIMA: TStringField;
    CDS_ProdutoProducaoPER_UTILIZACAO: TFMTBCDField;
    CDS_ProdutoProducaoPRECO_CUSTO: TFMTBCDField;
    CDS_ProdutoProducaoCUSTO_MEDIO: TFMTBCDField;
    CDS_ProdutoProducaoPRECO_VENDA: TFMTBCDField;
    CDS_ProdutoProducaoPER_MARGEM: TFMTBCDField;
    CDS_ProdutoProducaoVLR_MARGEM: TFMTBCDField;
    CDS_V_DoctoItens: TClientDataSet;
    DS_V_DoctoItens: TDataSource;
    CDS_V_DoctoItensNUM_SEQ_DOCTO: TIntegerField;
    CDS_V_DoctoItensNUM_SEQ: TIntegerField;
    CDS_V_DoctoItensCOD_PRODUTO: TIntegerField;
    CDS_V_DoctoItensDES_PRODUTO: TStringField;
    CDS_V_DoctoItensQTD_MOVTO: TFMTBCDField;
    CDS_V_DoctoItensVLR_UNITATIO: TFMTBCDField;
    CDS_V_DoctoItensVLR_TOTAL: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    Procedure ConectaBanco;
    Procedure FechaTudo;

    Procedure MemoAdicionaNomeForm(sNome: String);
    Procedure MemoRetiraNomeForm(sNome: String);

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

  sgPastaExecutavel, sgFBConect: String;

  mgMemoForms: TMemo; // Guarda Forms Abertos

  bgSair: Boolean;

implementation

uses  DK_Procs1;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Adiciona Nome do Form na Relação de Forms Abertos >>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMArtesanalis.MemoAdicionaNomeForm(sNome: String);
Var
  i: Integer;
  b: Boolean;
Begin
  b:=True;
  For i:=0 to mgMemoForms.Lines.Count-1 do
  Begin
    If AnsiUpperCase(mgMemoForms.Lines[i])=AnsiUpperCase(sNome) Then
    Begin
      b:=False;
      Break;
    End;
  End; // For i:=0 to mgMemoForms.Lines.Count-1 do

  If b Then
   mgMemoForms.Lines.Add(sNome);
End; // Adiciona Nome do Form na Relação de Forms Abertos >>>>>>>>>>>>>>>>>>>>>>

// Retira Nome do Form da Relação de Forms Abertos >>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMArtesanalis.MemoRetiraNomeForm(sNome: String);
Var
  i: Integer;
Begin
  For i:=0 to mgMemoForms.Lines.Count-1 do
  Begin
    If AnsiUpperCase(mgMemoForms.Lines[i])=AnsiUpperCase(sNome) Then
    Begin
      mgMemoForms.Lines.Delete(i);
      Break;
    End;
  End; // For i:=0 to mgMemoForms.Lines.Count-1 do
End; // Retira Nome do Form da Relação de Formes Abertos >>>>>>>>>>>>>>>>>>>>>>>

// Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMArtesanalis.FechaTudo;
Var
  i: Integer;
Begin

  // Fecha Componentes DMArtesanalis ===============================================
  For i:=0 to DMArtesanalis.ComponentCount-1 do
  Begin
    If DMArtesanalis.Components[i] is TClientDataSet Then
     If (DMArtesanalis.Components[i] as TClientDataSet).Active Then
     (DMArtesanalis.Components[i] as TClientDataSet).Close;

    If DMArtesanalis.Components[i] is TSQLQuery Then
     If (DMArtesanalis.Components[i] as TSQLQuery).Active Then
     (DMArtesanalis.Components[i] as TSQLQuery).Close;
  End;
end; // Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TDMArtesanalis.ConectaBanco;
Var
  i: Integer;
  bConecta: Boolean;
  Flags : Cardinal;
  s, sErroLocal, sErroIntraNet, sErroInterNet: String;
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
    If i=1 Then sgFBConect:='FBConect_Local.ini';
    If i=2 Then sgFBConect:='FBConect_IntraNet.ini';
    If i=3 Then sgFBConect:='FBConect_InterNet.ini';

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

procedure TDMArtesanalis.DataModuleCreate(Sender: TObject);
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

  // Conecta Banco BelShop.FDB =================================================
  SQLC.Connected:=False;

  ConectaBanco;
end;

end.



