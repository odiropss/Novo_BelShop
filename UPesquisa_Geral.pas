// Olha Como Funciona em TFrmSeparacaoDoctos.UsuarioCorredorSeparacao;
unit UPesquisa_Geral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, Grids, DBGrids, StdCtrls,
  Clipbrd, // PrintScreen
  Qt, ExtCtrls, DBXpress, FMTBcd, Provider, DBClient, DB, SqlExpr, AppEvnts;
//  Último: DBXpress,;

type
  TFrmPesquisaGeral = class(TForm)
    Panel1: TPanel;
    EdtDescricao: TEdit;
    Lab_Pesquisa: TLabel;
    Dbg_Pesquisa: TDBGrid;
    Panel2: TPanel;
    EdtCodigo: TEdit;
    Bt_PesquisaOK: TJvXPButton;
    Bt_PesquisaRetorna: TJvXPButton;
    Bt_PesquisaNovo: TJvXPButton;
    SDS_Geral: TSQLDataSet;
    DS_Geral: TDataSource;
    CDS_Geral: TClientDataSet;
    DSP_Geral: TDataSetProvider;
    SQLC: TSQLConnection;
    procedure EdtDescricaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Dbg_PesquisaTitleClick(Column: TColumn);
    procedure Dbg_PesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_PesquisaDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_PesquisaOKClick(Sender: TObject);
    procedure Bt_PesquisaRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    // Odir ====================================================================
    Procedure ConectaBanco;
    // Odir ====================================================================

    procedure Bt_PesquisaNovoClick(Sender: TObject);
  private
    { Private declarations }
    // Rolagem no Grid com Mouse
    procedure MouseAppEventsMessage(var Msg: TMsg; var Handled: Boolean);

  public
    { Public declarations }
    Campo_Pesquisa: String;
    Campo_Codigo: String;
    Campo_Descricao: String;
    Campo_Retorno1: String;
    Campo_Retorno2: String;
    Campo_Retorno3: String;
    Retorno1: String;
    Retorno2: String;
    Retorno3: String;

    sgBt_PesquisaNovo: String;
    // Bt_PesquisaNovo.Visible:=True;
    //          1 = 29 => LOGISTICA - Cadastro de Separadores de Mercadorias
  end;

Const
   sUser_Name: String='SYSDBA';
   sPassword: String='masterkey';
   cr = #13#10;

var
  FrmPesquisaGeral: TFrmPesquisaGeral;

  // Cria Ponteiro de Transacão Geral
  TDG: TTransactionDesc;

  sgPath_Local: String;
  bgConexaoLocal: Boolean;

implementation

uses DK_Procs1;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPesquisaGeral.ConectaBanco;
Var
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
End; // Conecta Bancos de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Rolagem no Grid com Mouse >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmPesquisaGeral.MouseAppEventsMessage(var Msg: TMsg; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
 // primeiramente verificamos se é o evento a ser tratado...
 if Msg.message = WM_MOUSEWHEEL then
 Begin
   if ActiveControl is TDBGrid then   // <=== AQUI você testa se classe é TDBGRID
   begin
     Msg.message := WM_KEYDOWN;
     Msg.lParam := 0;
     Sentido := HiWord(Msg.wParam);
     if Sentido > 0 then
      Msg.wParam := VK_UP
     else
      Msg.wParam := VK_DOWN;
   end; // if ActiveControl is TDBGrid then
 End; // if Msg.message = WM_MOUSEWHEEL then
end; // // Rolagem no Grid com Mouse >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmPesquisaGeral.EdtDescricaoChange(Sender: TObject);
begin
  Try
    CDS_Geral.Filtered:=False;
    CDS_Geral.Filter:=Campo_Pesquisa+' LIKE ''%'+EdtDescricao.Text+'%''';
    CDS_Geral.Filtered:=True;
  Except
    CDS_Geral.Filtered:=False;
    CDS_Geral.Filter:=Campo_Pesquisa+'='+QuotedStr(EdtDescricao.Text);
    CDS_Geral.Filtered:=True;
  End;

  CDS_Geral.Locate(Campo_pesquisa,EdtDescricao.Text,[]);
end;

procedure TFrmPesquisaGeral.FormShow(Sender: TObject);
begin

  EdtCodigo.Clear;
  EdtDescricao.SetFocus;

  Lab_Pesquisa.Caption:='Campo de Pesquisa: '+Campo_Pesquisa;
end;

procedure TFrmPesquisaGeral.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If (Key=#13) Then
   Bt_PesquisaOKClick(Sender);
end;

procedure TFrmPesquisaGeral.Dbg_PesquisaTitleClick(Column: TColumn);
begin
  Campo_Pesquisa:=Column.FieldName;
  Lab_Pesquisa.Caption:='Campo de Pesquisa: '+Campo_Pesquisa;
  EdtDescricao.SetFocus;

end;

procedure TFrmPesquisaGeral.Dbg_PesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If key=Key_Enter Then
   Bt_PesquisaOKClick(Sender);
end;

procedure TFrmPesquisaGeral.Dbg_PesquisaDblClick(Sender: TObject);
begin
  Bt_PesquisaOKClick(Sender);
end;

procedure TFrmPesquisaGeral.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key=VK_Escape Then
  Begin
    EdtDescricao.Text:='';
    EdtCodigo.Text:='';
    Close;
  End;
end;

procedure TFrmPesquisaGeral.Bt_PesquisaOKClick(Sender: TObject);
begin

  EdtCodigo.Text   :=CDS_Geral.FieldByName(Campo_Codigo).AsString;
  EdtDescricao.Text:=CDS_Geral.FieldByName(Campo_Descricao).AsString;

  If Campo_Retorno1<>'' Then
   Retorno1:=CDS_Geral.FieldByName(Campo_Retorno1).AsString;

  If Campo_Retorno2<>'' Then
   Retorno2:=CDS_Geral.FieldByName(Campo_Retorno2).AsString;

  If Campo_Retorno3<>'' Then
   Retorno3:=CDS_Geral.FieldByName(Campo_Retorno3).AsString;

  Close;
end;

procedure TFrmPesquisaGeral.Bt_PesquisaRetornaClick(Sender: TObject);
begin
  EdtDescricao.Text:='';
  EdtCodigo.Text:='0';

  Close;
end;

procedure TFrmPesquisaGeral.FormCreate(Sender: TObject);
Var
  i: Integer;
  Arq: TextFile;
  sArquivo: TStringList;
  sLinha: String;
  sNewIP: String;
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  Application.OnMessage := MouseAppEventsMessage;

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

procedure TFrmPesquisaGeral.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmPesquisaGeral.Bt_PesquisaNovoClick(Sender: TObject);
Var
  i: Integer;

  MySql: String;
  sNome: String;
begin
  Dbg_Pesquisa.SetFocus;

  //============================================================================
  // 1 = 29 => LOGISTICA - Cadastro de Separadores de Mercadorias ==============
  //============================================================================
  If sgBt_PesquisaNovo='1' Then
  Begin
    sNome:='';
    sNome:=InputBox('Separador de Mercadoria ', 'Informe o Nome do Usuário',sNome);

    If Trim(sNome)='' Then
     Exit;

    // Cadastra Usuário ========================================================
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    If SQLC.InTransaction Then
     SQLC.Rollback(TDG);

    // Monta Transacao =========================================================
    TDG.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TDG.IsolationLevel:=xilREADCOMMITTED;
    SQLC.StartTransaction(TDG);
    Try // Try da Transação

      MySql:=' INSERT INTO TAB_AUXILIAR'+
             ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
             ' VALUES ('+
             ' 29,'+ // TIP_AUX - 29 => LOGISTICA - CADASTRO DE SEPARADORES DE MERCADORIAS
             ' (SELECT COALESCE(MAX(c.cod_aux)+1 ,1) FROM tab_auxiliar c WHERE c.tip_aux=29),'+ // COD_AUX
             QuotedStr(AnsiUpperCase(sNome))+', '+ // DES_AUX
             ' NULL,'+ // DES_AUX1
             ' NULL,'+ // VLR_AUX
             ' NULL)'; // VLR_AUX1
      SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ====================================================
      SQLC.Commit(TDG);

      CDS_Geral.Close;
      CDS_Geral.Open;

      EdtDescricao.Text:=sNome;
      Bt_PesquisaOKClick(Self);

    Except // Except da Transação
      on e : Exception do
      Begin
        // Abandona Transacao ====================================================
        SQLC.Rollback(TDG);

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try da Transação
    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

  End; // If sgBt_PesquisaNovo='1' Then
  // 1 = 29 => LOGISTICA - Cadastro de Separadores de Mercadorias ==============
  //============================================================================
end;

end.
