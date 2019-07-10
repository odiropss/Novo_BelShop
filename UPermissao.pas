unit UPermissao;
{
Form Original:
  - ClientHeight = 241
  - ClientWidth  = 411

Form Seleciona Loja:
  - ClientHeight = 400
  - ClientWidth  = 411

 // Variaveis <<<==========================
 Login: String;
 Cod_Usuario: String;

 // Show do Form <<<=======================

  // Encerra Entrada ===========================================================
  FrmEntrada.Free;

  // Login =====================================================================
  Login:='';  

  FrmLogin.Caption:= NOME DO SISTEMA
  FrmLogin.ShowModal;

  Login:=FrmLogin.Login;

  // Verifica Encerramento  ====================================================
  If Login='' Then
   Application.Terminate;

  // Guarda Codigo do Usuario ==================================================
  If Login<>'' Then
   Cod_Usuario:=FrmLogin.SQLDS_Busca.FieldByName('Cod_Usuario').AsString;

  // Permissoes ( Faça Qualquer Coisa ) ========================================
  Permissao;

  FrmLogin.Close;

}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, ExtCtrls, RXCtrls, cxGroupBox, JvExControls,
  JvXPCore, JvXPButtons, StdCtrls, JvGIF, DBXpress, dxGDIPlusClasses;
//  Último: DBXpress;
//          JvGIF;

{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Buttons, ExtCtrls, DB, ADODB, DBXpress, FMTBcd,
  SqlExpr, jpeg, JvGIF, JvExControls, JvXPCore, JvXPButtons, Qt,
  StdCtrls, Dialogs;
}

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    EdtSenha: TEdit;
    Label1: TLabel;
    EdtLogin: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BT_Entrar: TJvXPButton;
    BT_Sair: TJvXPButton;
    Image2: TImage;
    Image3: TImage;
    Lb_CapsLock: TLabel;
    Timer1: TTimer;
    Image4: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtLoginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BT_EntrarClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Login: String;
    PainelApresLogin: TPanel;

  end;

var
  FrmLogin: TFrmLogin;

  bgOnActivate: Boolean; // Se Ja Executou o Evento do Form OnActivate

  Num_Vezes: Integer;

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;
  
implementation

uses DK_Procs1, UEntrada, UDMBelShop, UFrmBelShop;

{$R *.dfm}
//==============================================================================
// Odir INICIO =================================================================
//==============================================================================

//==============================================================================
// Odir FIM ====================================================================
//==============================================================================

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmLogin.FormShow(Sender: TObject);
Var
  MySql: String;
begin

  EdtLogin.SetFocus;

  Login:='';

  EdtLogin.Clear;
  EdtSenha.Clear;

  EdtLogin.SetFocus;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  bgOnActivate:=False;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Cria Painel de Informa em Tempo de Execucao ===============================
  PainelApresLogin:=TPanel.Create(PainelApresLogin);
  PainelApresLogin.BevelInner:=bvRaised;
  PainelApresLogin.BevelOuter:=bvLowered;
  PainelApresLogin.BevelWidth:=2;
  PainelApresLogin.Color:=$00F3F3F3;
  PainelApresLogin.Height:=42;

end;

procedure TFrmLogin.EdtLoginKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  MySql: String;
begin
{
== PEDRO - Logistica
  If (Shift = [ssCtrl, ssAlt])   And (Key=VK_F9)  Then

== MANUELLA
  If (Shift = [ssCtrl, ssShift]) And (Key=VK_F5)  Then

== ZILANDRA
  If (Shift = [ssAlt, ssShift])  And (Key=VK_F12) Then

== RENATO
  If (Shift = [ssCtrl, ssShift]) and (Key=VK_F11)  Then ->> Vale até 10/04/2049
  If (Shift = [ssAlt, ssShift]) and (Key=82)  Then // 82 = R

== ODIR
  If (Shift = [ssCtrl, ssShift]) and (Key=VK_F9)  Then
}
  //============================================================================
  // PEDRO - LOGISTICA =========================================================
  //============================================================================
  if (Shift = [ssCtrl, ssAlt])   and (Key=VK_F9) then
  Begin
    bgSiga:=True;

    If Not bgSiga Then
    Begin
      Des_Login:=Login;
      sgTpConexao:='';
      DMBelShop.MontaConexaoEmpresas;
    End; // If Not bgSiga Then

    // Apresenta o Processamento ===============================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando Empresa Matriz ...';
    PainelApresLogin.Width:=Length(PainelApresLogin.Caption)*10;
    PainelApresLogin.Left:=ParteInteiro(FloatToStr((FrmLogin.Width-PainelApresLogin.Width)/2));
    PainelApresLogin.Top:=ParteInteiro(FloatToStr((FrmLogin.Height-PainelApresLogin.Height)/2));
    PainelApresLogin.Font.Style:=[fsBold];
    PainelApresLogin.Parent:=FrmLogin;
    PainelApresLogin.Visible:=True;
    Refresh;

    // Conecta Matriz ==========================================================
    If Not FrmBelShop.ConectaMatriz Then
    Begin
      msg('Impossível Continuar...'+cr+'Banco de Dados MATRIZ'+cr+cr+'Não CONECTADO !!','A');
      ShowMessage('Odir@2');
      Application.Terminate;
      Exit;
    End;

    // Conecta MPMS ============================================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando CD - BelShop_CD ...';
    Refresh;
    If Not FrmBelShop.ConectaMPMS Then
    Begin
      msg('Impossível Continuar...'+cr+'Banco de Dados BelShop CD'+cr+cr+'Não CONECTADO !!','A');
      ShowMessage('Odir@3');
      Application.Terminate;
      Exit;
    End;

    // Busca Usuario ===========================================================
    MySql:=' SELECT p.COD_USUARIO, p.DES_USUARIO, p.DES_SENHA, p.DES_LOGIN,'+
           ' p.IND_ADMIN, p.IND_ATIVO'+
           ' FROM PS_USUARIOS p'+
           ' WHERE p.COD_USUARIO = 213';
    DMBelShop.IBQ_Busca.Close;
    DMBelShop.IBQ_Busca.SQL.Clear;
    DMBelShop.IBQ_Busca.SQL.Add(MySql);
    DMBelShop.IBQ_Busca.Open;

    Login:=DMBelShop.IBQ_Busca.FieldByName('Des_Login').AsString;

    PainelApresLogin.Visible:=False;

    Close;
  End; // if (Shift = [ssAlt, ssShift]) and (Key=VK_F12) then
  // PEDRO - LOGISTICA =========================================================
  //============================================================================

  //============================================================================
  // ZILANDRA - COMPRAS ========================================================
  //============================================================================
  if (Shift = [ssAlt, ssShift]) and (Key=VK_F12) then
  Begin
    bgSiga:=True;

    If Not bgSiga Then
    Begin
      Des_Login:=Login;
      sgTpConexao:='';
      DMBelShop.MontaConexaoEmpresas;
    End; // If Not bgSiga Then

    // Apresenta o Processamento ===============================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando Empresa Matriz ...';
    PainelApresLogin.Width:=Length(PainelApresLogin.Caption)*10;
    PainelApresLogin.Left:=ParteInteiro(FloatToStr((FrmLogin.Width-PainelApresLogin.Width)/2));
    PainelApresLogin.Top:=ParteInteiro(FloatToStr((FrmLogin.Height-PainelApresLogin.Height)/2));
    PainelApresLogin.Font.Style:=[fsBold];
    PainelApresLogin.Parent:=FrmLogin;
    PainelApresLogin.Visible:=True;
    Refresh;

    // Conecta Matriz ==========================================================
    If Not FrmBelShop.ConectaMatriz Then
    Begin
      msg('Impossível Continuar...'+cr+'Banco de Dados MATRIZ'+cr+cr+'Não CONECTADO !!','A');
      ShowMessage('Odir@4');
      Application.Terminate;
      Exit;
    End;

    // Conecta MPMS ============================================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando CD - BelShop_CD ...';
    Refresh;
    If Not FrmBelShop.ConectaMPMS Then
    Begin
      msg('Impossível Continuar...'+cr+'Banco de Dados BelShop CD'+cr+cr+'Não CONECTADO !!','A');
      ShowMessage('Odir@5');
      Application.Terminate;
      Exit;
    End;

    // Busca Usuario ===========================================================
    MySql:=' SELECT p.COD_USUARIO, p.DES_USUARIO, p.DES_SENHA, p.DES_LOGIN,'+
           ' p.IND_ADMIN, p.IND_ATIVO'+
           ' FROM PS_USUARIOS p'+
           ' WHERE p.COD_USUARIO = 11';
    DMBelShop.IBQ_Busca.Close;
    DMBelShop.IBQ_Busca.SQL.Clear;
    DMBelShop.IBQ_Busca.SQL.Add(MySql);
    DMBelShop.IBQ_Busca.Open;

    Login:=DMBelShop.IBQ_Busca.FieldByName('Des_Login').AsString;

    PainelApresLogin.Visible:=False;

    Close;
  End; // if (Shift = [ssAlt, ssShift]) and (Key=VK_F12) then
  // ZILANDRA - COMPRAS ========================================================
  //============================================================================

  //============================================================================
  // MANUELA ===================================================================
  //============================================================================
  if (Shift = [ssCtrl, ssShift]) and (Key=VK_F5) then
  Begin
    bgSiga:=True;

    If Not bgSiga Then
    Begin
      Des_Login:=Login;
      sgTpConexao:='';
      DMBelShop.MontaConexaoEmpresas;
    End; // If Not bgSiga Then

    // Apresenta o Processamento ===============================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando Empresa Matriz ...';
    PainelApresLogin.Width:=Length(PainelApresLogin.Caption)*10;
    PainelApresLogin.Left:=ParteInteiro(FloatToStr((FrmLogin.Width-PainelApresLogin.Width)/2));
    PainelApresLogin.Top:=ParteInteiro(FloatToStr((FrmLogin.Height-PainelApresLogin.Height)/2));
    PainelApresLogin.Font.Style:=[fsBold];
    PainelApresLogin.Parent:=FrmLogin;
    PainelApresLogin.Visible:=True;
    Refresh;

    // Conecta Matriz ==========================================================
    If Not FrmBelShop.ConectaMatriz Then
    Begin
      msg('Impossível Continuar...'+cr+'Banco de Dados MATRIZ'+cr+cr+'Não CONECTADO !!','A');
      ShowMessage('Odir@6');
      Application.Terminate;
      Exit;
    End;

    // Conecta MPMS ============================================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando BelShop CD ...';
    Refresh;
    If Not FrmBelShop.ConectaMPMS Then
    Begin
      msg('Impossível Continuar...'+cr+'Banco de Dados BelShop CD (Administração)'+cr+cr+'Não CONECTADO !!','A');
      ShowMessage('Odir@7');
      Application.Terminate;
      Exit;
    End;

    // Busca Usuario ===========================================================
    MySql:=' SELECT p.COD_USUARIO, p.DES_USUARIO, p.DES_SENHA, p.DES_LOGIN,'+
           ' p.IND_ADMIN, p.IND_ATIVO'+
           ' FROM PS_USUARIOS p'+
           ' WHERE p.COD_USUARIO = 205';
    DMBelShop.IBQ_Busca.Close;
    DMBelShop.IBQ_Busca.SQL.Clear;
    DMBelShop.IBQ_Busca.SQL.Add(MySql);
    DMBelShop.IBQ_Busca.Open;

    Login:=DMBelShop.IBQ_Busca.FieldByName('Des_Login').AsString;

    PainelApresLogin.Visible:=False;

    Close;
  End; // if (Shift = [ssCtrl, ssShift]) and (Key=VK_F5) then
  // MANUELA ===================================================================
  //============================================================================

  //============================================================================
  // RENATO ====================================================================
  //============================================================================
  bgSiga:=False;
  If ((Shift = [ssCtrl, ssShift]) And (Key=VK_F11)) And (Date<StrToDate('11/04/2019')) Then
  Begin
    bgSiga:=True;
  End;

  If (Shift = [ssAlt, ssShift]) And (Key=82)  Then // 82 = R
   bgSiga:=True;

  If bgSiga Then
  Begin
    bgSiga:=True;

    If Not bgSiga Then
    Begin
      Des_Login:=Login;
      sgTpConexao:='';
      DMBelShop.MontaConexaoEmpresas;
    End; // If Not bgSiga Then

    // Apresenta o Processamento ===============================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando Empresa Matriz ...';
    PainelApresLogin.Width:=Length(PainelApresLogin.Caption)*10;
    PainelApresLogin.Left:=ParteInteiro(FloatToStr((FrmLogin.Width-PainelApresLogin.Width)/2));
    PainelApresLogin.Top:=ParteInteiro(FloatToStr((FrmLogin.Height-PainelApresLogin.Height)/2));
    PainelApresLogin.Font.Style:=[fsBold];
    PainelApresLogin.Parent:=FrmLogin;
    PainelApresLogin.Visible:=True;
    Refresh;

    // Conecta Matriz ==========================================================
    If Not FrmBelShop.ConectaMatriz Then
    Begin
      msg('Impossível Continuar...'+cr+'Banco de Dados MATRIZ'+cr+cr+'Não CONECTADO !!','A');
      ShowMessage('Odir@8');
      Application.Terminate;
      Exit;
    End;

    // Conecta MPMS ============================================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando BelShop CD ...';
    Refresh;
    If Not FrmBelShop.ConectaMPMS Then
    Begin
      msg('Impossível Continuar...'+cr+'Banco de Dados BelShop CD'+cr+cr+'Não CONECTADO !!','A');
      ShowMessage('Odir@9');
      Application.Terminate;
      Exit;
    End;

    // Busca Usuario ===========================================================
    MySql:=' SELECT p.COD_USUARIO, p.DES_USUARIO, p.DES_SENHA, p.DES_LOGIN,'+
           ' p.IND_ADMIN, p.IND_ATIVO'+
           ' FROM PS_USUARIOS p'+
           ' WHERE p.COD_USUARIO = 1';
    DMBelShop.IBQ_Busca.Close;
    DMBelShop.IBQ_Busca.SQL.Clear;
    DMBelShop.IBQ_Busca.SQL.Add(MySql);
    DMBelShop.IBQ_Busca.Open;

    Login:=DMBelShop.IBQ_Busca.FieldByName('Des_Login').AsString;

    PainelApresLogin.Visible:=False;

    Close;
  End; // if (Shift = [ssCtrl, ssShift]) and (Key=VK_F11) then
  // RENATO ====================================================================
  //============================================================================

  //============================================================================
  // ODIR ======================================================================
  //============================================================================
  if (Shift = [ssCtrl, ssShift]) and (Key=VK_F9) then // Odir
  Begin
    bgSiga:=True;
    If Not bgSiga Then
    Begin
      Des_Login:=Login;
      sgTpConexao:='';
      DMBelShop.MontaConexaoEmpresas;
    End; // If Not bgSiga Then

    // Apresenta o Processamento ===============================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando Empresa Matriz ...';
    PainelApresLogin.Width:=Length(PainelApresLogin.Caption)*10;
    PainelApresLogin.Left:=ParteInteiro(FloatToStr((FrmLogin.Width-PainelApresLogin.Width)/2));
    PainelApresLogin.Top:=ParteInteiro(FloatToStr((FrmLogin.Height-PainelApresLogin.Height)/2));
    PainelApresLogin.Font.Style:=[fsBold];
    PainelApresLogin.Parent:=FrmLogin;
    PainelApresLogin.Visible:=True;
    Refresh;

    // Conecta Matriz ==========================================================
    If Not FrmBelShop.ConectaMatriz Then
    Begin
      msg('Impossível Continuar...'+cr+'Banco de Dados BelShop CD'+cr+cr+'Não CONECTADO !!','A');
      ShowMessage('Odir@10');
      Application.Terminate;
      Exit;
    End;

    // Conecta MPMS ============================================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando BelShop CD...';
    Refresh;
    If Not FrmBelShop.ConectaMPMS Then
    Begin
      msg('Impossível Continuar...'+cr+'Banco de Dados BelShop CD'+cr+cr+'Não CONECTADO !!','A');
      ShowMessage('Odir@11');
      Application.Terminate;
      Exit;
    End;

    // Busca Usuario ===========================================================
    MySql:=' SELECT COD_USUARIO, DES_USUARIO, DES_SENHA, DES_LOGIN, IND_ADMIN, IND_ATIVO'+
           ' FROM PS_USUARIOS'+
           ' WHERE DES_LOGIN = ''ODIR''';
    DMBelShop.IBQ_Busca.Close;
    DMBelShop.IBQ_Busca.SQL.Clear;
    DMBelShop.IBQ_Busca.SQL.Add(MySql);
    DMBelShop.IBQ_Busca.Open;

    Login:=DMBelShop.IBQ_Busca.FieldByName('Des_Login').AsString;

    PainelApresLogin.Visible:=False;

    Close;
  End; // if (Shift = [ssCtrl, ssShift]) and (Key=VK_F9) then // Odir
  // ODIR ======================================================================
  //============================================================================

end;

procedure TFrmLogin.BT_EntrarClick(Sender: TObject);
Var
  s, MySql: String;
  b, bTestaConexao: Boolean;
begin
  EdtLogin.SetFocus;
  If Trim(EdtLogin.Text)='' Then
  Begin
    msg('Favor Informar o Login !!','A');
    Exit;
  End;

  PainelApresLogin.Caption:='AGUARDE !! Inicializando Usuário ...';
  PainelApresLogin.Width:=Length(PainelApresLogin.Caption)*10;
  PainelApresLogin.Left:=ParteInteiro(FloatToStr((FrmLogin.Width-PainelApresLogin.Width)/2));
  PainelApresLogin.Top:=ParteInteiro(FloatToStr((FrmLogin.Height-PainelApresLogin.Height)/2));
  PainelApresLogin.Font.Style:=[fsBold];
  PainelApresLogin.Parent:=FrmLogin;
  PainelApresLogin.Visible:=True;
  Refresh;

  // Verifica Senha
  MySql:=' SELECT COD_USUARIO, DES_USUARIO, DES_SENHA, DES_LOGIN, IND_ADMIN, IND_ATIVO'+
         ' FROM PS_USUARIOS'+
         ' WHERE DES_LOGIN = '+QuotedStr(EdtLogin.Text);
  DMBelShop.IBQ_Busca.Close;
  DMBelShop.IBQ_Busca.SQL.Clear;
  DMBelShop.IBQ_Busca.SQL.Add(MySql);
  DMBelShop.IBQ_Busca.Open;

  // Verifica se Existe Usuário ================================================
  If Trim(DMBelShop.IBQ_Busca.FieldByName('Cod_Usuario').AsString)='' Then
  Begin
    DMBelShop.IBQ_Busca.Close;
    msg('Usuário Inexistente !!','A');

    Inc(Num_Vezes);
    Label6.Caption:=IntToStr(Num_Vezes);

    If Num_Vezes=5 Then
     Application.Terminate;

    EdtLogin.SetFocus;
    PainelApresLogin.Visible:=False;
    Exit;
  End;

  // Verifica Senha ============================================================
  s:=DecriptaSTR(DMBelShop.IBQ_Busca.FieldByName('Des_Senha').AsString,40,30,20);
  If s<>Trim(EdtSenha.Text) Then
  Begin
    DMBelShop.IBQ_Busca.Close;
    msg('Senha Inválida !!','A');

    Inc(Num_Vezes);
    Label6.Caption:=IntToStr(Num_Vezes);

    If Num_Vezes=5 Then
     Application.Terminate;

    EdtLogin.SetFocus;
    PainelApresLogin.Visible:=False;
    Exit;
  End;

  // Verifica se Ativo =========================================================
  If Trim(DMBelShop.IBQ_Busca.FieldByName('Ind_Ativo').AsString)='NAO'Then
  Begin
    DMBelShop.IBQ_Busca.Close;
    msg('Usuário INATIVO !!','A');

    Inc(Num_Vezes);
    Label6.Caption:=IntToStr(Num_Vezes);

    If Num_Vezes=5 Then
     Application.Terminate;

    EdtLogin.SetFocus;
    PainelApresLogin.Visible:=False;
    Exit;
  End;

  Login:=DMBelShop.IBQ_Busca.FieldByName('Des_Login').AsString;

  bgSiga:=True;

  If Not bgSiga Then
  Begin
    Des_Login:=Login;
    sgTpConexao:='';
    DMBelShop.MontaConexaoEmpresas;
  End; // If Not bgSiga Then

  // Apresenta o Processamento =================================================
  PainelApresLogin.Caption:='AGUARDE !! Conectando MATRIZ ...';

  Refresh;

  // Conecta MPMS ============================================================
  If Not FrmBelShop.ConectaMatriz Then
  Begin
    msg('Impossível Continuar...'+cr+'Banco de Dados MATRIZ (Adiminitração)'+cr+cr+'Não CONECTADO !!','A');
    ShowMessage('Odir@12');
    Application.Terminate;
    Exit;
  End;

  // Conecta MPMS ============================================================
  // Apresenta o Processamento =================================================
  PainelApresLogin.Caption:='AGUARDE !! Conectando BelShop CD...';

  Refresh;
  If Not FrmBelShop.ConectaMPMS Then
  Begin
    msg('Impossível Continuar...'+cr+'Banco de Dados BelShop CD'+cr+cr+'Não CONECTADO !!','A');
    ShowMessage('Odir@13');
    Application.Terminate;
    Exit;
  End;

  PainelApresLogin.Visible:=False;

  Close;
end;

procedure TFrmLogin.BT_SairClick(Sender: TObject);
Var
  b: Boolean;
begin
  Login:='';

  b:=False;
  FormCloseQuery(Sender, b);

  FrmBelShop.FechaTudo;

  Application.Terminate;

end;

procedure TFrmLogin.Timer1Timer(Sender: TObject);
begin

  If getkeystate(vk_CAPITAL) = 0 then // Caps lock está OFF
   Begin
     Lb_CapsLock.Caption:='Caps Lock Desativado';
     Lb_CapsLock.Font.Color:=clRed;
   End
  Else
   Begin
     Lb_CapsLock.Caption:='Caps Lock Ativado';
     Lb_CapsLock.Font.Color:=clTeal;
   End

end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key=VK_Escape Then
   BT_SairClick(Self);
end;

procedure TFrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Var
  Arq: TextFile;
  s: String;
  i: Integer;
  sPasta: String;
  b: Boolean;
  sOrigem, sDestino: String;
begin
  // Copia Programa EXECEUTAR.EXE ==============================================
  sPasta:=IncludeTrailingPathDelimiter(ExtractFilePAth(Application.ExeName));

  If fileexists(sPasta+'ExecutarRedeLocal.ini') then
   Begin
     AssignFile(Arq,sPasta+'ExecutarRedeLocal.ini');
   End
  Else If fileexists(sPasta+'ExecutarRedeExterna.ini') then
   Begin
     AssignFile(Arq,sPasta+'ExecutarRedeExterna.ini');
   End
  Else
   Exit;

  Reset(Arq);
  Readln(Arq,s);
  While not Eof(Arq) do
  Begin
    Readln(Arq,s);

    i:=pos('=', s);
    sOrigem:=IncludeTrailingPathDelimiter(Trim(Copy(s,(i+1),length(s)-1)))+'PExecutar_OK.exe';
    Readln(Arq,s);

    i:=pos('=', s);
    sDestino:=IncludeTrailingPathDelimiter(Trim(Copy(s,(i+1),length(s)-1)))+'PExecutar.exe';
    Break;
  End; // While not Eof(Arq) do
  CloseFile(Arq);

  If (AnsiUpperCase(sgNomeComputador)<>AnsiUpperCase(sgCompServer)) and (AnsiUpperCase(sgNomeComputador)<>'ODIR-PC') Then
  Begin
    b:=False;
    i:=0;
    While Not b do
    Begin
      If fileexists(sDestino) then
       Begin
         Inc(i);
         If DeleteFile(sDestino) Then
         Begin
           If CopyFile(PChar(sOrigem), PChar(sDestino), False) Then
           Begin
             Break;
           End;
         End;
       End
      Else // If fileexists(EdtDestino.Text+'PBelShop.exe') then
       Begin
         If CopyFile(PChar(sOrigem), PChar(sDestino), False) Then
         Begin
           Break;
         End;
       End; // If fileexists(EdtDestino.Text+'PBelShop.exe') then

      If i>10 Then
      Begin
        msg('Problema de Execução do'+cr+'Gerencaidor BelShop !!'+cr+cr+'Avisar o ODIR - 9957-8234','A');
        Application.Terminate;
        Exit;
      End;
    End; // While Not b do
  End; // If AnsiUpperCase(sgNomeComputador)<>AnsiUpperCase(sgCompServer) Then
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
Var
  MySql, sOrigem, sDestino: String;
begin

  MySql:=' SELECT p.FTP_Usar, p.computer_master, p.computer_server,'+
         ' p.IP_Server, p.IP_Internet_Server,'+
         ' p.FTP_User, p.FTP_Password'+
         ' FROM PARAMETROS p';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  sgFTPUsar         :=DMBelShop.CDS_BuscaRapida.FieldByName('FTP_Usar').AsString;
  sgCompMaster      :=AnsiUpperCase(DMBelShop.CDS_BuscaRapida.FieldByName('computer_master').AsString);
  sgCompServer      :=AnsiUpperCase(DMBelShop.CDS_BuscaRapida.FieldByName('computer_server').AsString);

  sgIPServer        :=AnsiUpperCase(DMBelShop.CDS_BuscaRapida.FieldByName('IP_Server').AsString);
  sgIPInternetServer:=AnsiUpperCase(DMBelShop.CDS_BuscaRapida.FieldByName('IP_Internet_Server').AsString);

  sgFTPUser         :=AnsiUpperCase(DMBelShop.CDS_BuscaRapida.FieldByName('FTP_User').AsString);
  sgFTPSenha        :=AnsiUpperCase(DMBelShop.CDS_BuscaRapida.FieldByName('FTP_Password').AsString);
  sgPastaAreaFTP    :='C:\Projetos\BelShop\AreaFTP\';

  DMBelShop.CDS_BuscaRapida.Close;
end;

procedure TFrmLogin.FormActivate(Sender: TObject);
begin
  // Coloca BitMaps em Componentes =============================================
  If Not bgOnActivate Then
  Begin
    BitMaps(FrmLogin);
    bgOnActivate:=True;
  End;

end;

end.
