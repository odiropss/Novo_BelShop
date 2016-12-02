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
    Gb_SuaLoja: TcxGroupBox;
    Cklb_Lojas: TRxCheckListBox;
    Panel2: TPanel;
    Bt_SelecionaLoja: TJvXPButton;
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

    // Odir

    // Codigo da Loja Se Unica =================================================
    procedure Bt_SelecionaLojaClick(Sender: TObject);
    procedure Cklb_LojasClickCheck(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    // Odir
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

  // Nome do Servidor e Codigo da Loja Se Unica ================================
  If sgCodLojaUnica='999999' Then
  Begin
    MySql:=' SELECT ''Bel_''||e.cod_filial Loja, e.razao_social, e.num_cnpj'+
           ' FROM emp_conexoes e'+
           ' ORDER BY 1';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    While not DMBelShop.CDS_BuscaRapida.Eof do
    Begin
      Cklb_Lojas.Items.Add(DMBelShop.CDS_BuscaRapida.FieldByName('Loja').AsString+' - '+
                           DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString);

      DMBelShop.CDS_BuscaRapida.Next;
    End; // While not DMBelShop.CDS_BuscaRapida.Eof do
    DMBelShop.CDS_BuscaRapida.Close;

    FrmLogin.ClientHeight:=400;
    FrmLogin.ClientWidth:=411;

    Gb_SuaLoja.Align:=alClient;
    Gb_SuaLoja.Visible:=True;
    Cklb_Lojas.SetFocus;
    Exit;
  End;
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

  //============================================================================
  // THAISE - MARKETING ========================================================
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
      If sgCodLojaUnica='' Then
       msg('Impossível Continuar...'+cr+'Banco de Dados MATRIZ'+cr+cr+'Não CONECTADO !!','A')
      Else
       msg('Impossível Continuar...'+cr+'Banco de Dados SIDICOM'+cr+cr+'Não CONECTADO !!','A');
      Application.Terminate;
      Exit;
    End;

    // Conecta MPMS ============================================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando Empresa MPMS ...';
    Refresh;
    If Not FrmBelShop.ConectaMPMS Then
    Begin
      If sgCodLojaUnica='' Then
       msg('Impossível Continuar...'+cr+'Banco de Dados MPMS (Administração)'+cr+cr+'Não CONECTADO !!','A')
      Else
       msg('Impossível Continuar...'+cr+'Banco de Dados SIDICOM'+cr+cr+'Não CONECTADO !!','A');
      Application.Terminate;
      Exit;
    End;

    // Busca Usuario ===========================================================
    MySql:=' SELECT p.COD_USUARIO, p.DES_USUARIO, p.DES_SENHA, p.DES_LOGIN,'+
           ' p.IND_ADMIN, p.IND_ATIVO'+
           ' FROM PS_USUARIOS p'+
           ' WHERE p.COD_USUARIO = 31';
    DMBelShop.IBQ_Busca.Close;
    DMBelShop.IBQ_Busca.SQL.Clear;
    DMBelShop.IBQ_Busca.SQL.Add(MySql);
    DMBelShop.IBQ_Busca.Open;

    Login:=DMBelShop.IBQ_Busca.FieldByName('Des_Login').AsString;

    PainelApresLogin.Visible:=False;

    Close;
  End; // if (Shift = [ssAlt, ssShift]) and (Key=VK_F12) then
  // THAISE - MARKETING ========================================================

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
      If sgCodLojaUnica='' Then
       msg('Impossível Continuar...'+cr+'Banco de Dados MATRIZ'+cr+cr+'Não CONECTADO !!','A')
      Else
       msg('Impossível Continuar...'+cr+'Banco de Dados SIDICOM'+cr+cr+'Não CONECTADO !!','A');
      Application.Terminate;
      Exit;
    End;

    // Conecta MPMS ============================================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando Empresa MPMS ...';
    Refresh;
    If Not FrmBelShop.ConectaMPMS Then
    Begin
      If sgCodLojaUnica='' Then
       msg('Impossível Continuar...'+cr+'Banco de Dados MPMS (Administração)'+cr+cr+'Não CONECTADO !!','A')
      Else
       msg('Impossível Continuar...'+cr+'Banco de Dados SIDICOM'+cr+cr+'Não CONECTADO !!','A');
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
  // RENATO ====================================================================
  //============================================================================
  if (Shift = [ssCtrl, ssShift]) and (Key=VK_F11) then
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
      If sgCodLojaUnica='' Then
       msg('Impossível Continuar...'+cr+'Banco de Dados MATRIZ'+cr+cr+'Não CONECTADO !!','A')
      Else
       msg('Impossível Continuar...'+cr+'Banco de Dados SIDICOM'+cr+cr+'Não CONECTADO !!','A');
      Application.Terminate;
      Exit;
    End;

    // Conecta MPMS ============================================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando Empresa MPMS ...';
    Refresh;
    If Not FrmBelShop.ConectaMPMS Then
    Begin
      If sgCodLojaUnica='' Then
       msg('Impossível Continuar...'+cr+'Banco de Dados MPMS (Administração)'+cr+cr+'Não CONECTADO !!','A')
      Else
       msg('Impossível Continuar...'+cr+'Banco de Dados SIDICOM'+cr+cr+'Não CONECTADO !!','A');
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
      If sgCodLojaUnica='' Then
       msg('Impossível Continuar...'+cr+'Banco de Dados MPMS (Administração)'+cr+cr+'Não CONECTADO !!','A')
      Else
       msg('Impossível Continuar...'+cr+'Banco de Dados SIDICOM'+cr+cr+'Não CONECTADO !!','A');
      Application.Terminate;
      Exit;
    End;

    // Conecta MPMS ============================================================
    PainelApresLogin.Caption:='AGUARDE !! Conectando Empresa MPMS ...';
    Refresh;
    If Not FrmBelShop.ConectaMPMS Then
    Begin
      If sgCodLojaUnica='' Then
       msg('Impossível Continuar...'+cr+'Banco de Dados MPMS (Administração)'+cr+cr+'Não CONECTADO !!','A')
      Else
       msg('Impossível Continuar...'+cr+'Banco de Dados SIDICOM'+cr+cr+'Não CONECTADO !!','A');
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

end;

procedure TFrmLogin.BT_EntrarClick(Sender: TObject);
Var
  s, MySql: String;
  b, bTestaConexao: Boolean;
begin
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
  If sgCodLojaUnica='' Then
   PainelApresLogin.Caption:='AGUARDE !! Conectando MATRIZ ...'
  Else
   PainelApresLogin.Caption:='AGUARDE !! Conectando SIDICOM ...';

  Refresh;

  // Conecta MPMS ============================================================
  If Not FrmBelShop.ConectaMatriz Then
  Begin
    If sgCodLojaUnica='' Then
     msg('Impossível Continuar...'+cr+'Banco de Dados MATRIZ (Adiminitração)'+cr+cr+'Não CONECTADO !!','A')
    Else
     msg('Impossível Continuar...'+cr+'Banco de Dados SIDICOM'+cr+cr+'Não CONECTADO !!','A');

    Application.Terminate;
    Exit;
  End;

  // Conecta MPMS ============================================================
  // Apresenta o Processamento =================================================
  If sgCodLojaUnica='' Then
   PainelApresLogin.Caption:='AGUARDE !! Conectando MPMS ...'
  Else
   PainelApresLogin.Caption:='AGUARDE !! Conectando SIDICOM ...';

  Refresh;
  If Not FrmBelShop.ConectaMPMS Then
  Begin
    If sgCodLojaUnica='' Then
     msg('Impossível Continuar...'+cr+'Banco de Dados MPMS (Adiminitração)'+cr+cr+'Não CONECTADO !!','A')
    Else
     msg('Impossível Continuar...'+cr+'Banco de Dados SIDICOM'+cr+cr+'Não CONECTADO !!','A');
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

//opss - 06/10/2014 - INICIO
  // Acerta Loja Unica Como Matriz =============================================
  If Trim(sgCodLojaUnica)<>'' Then
  Begin
    // Verificva se Transação esta Ativa
    If DMBelShop.SQLC.InTransaction Then
     DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      MySql:=' UPDATE emp_conexoes ec'+
             ' SET ec.tip_emp=''F'''+
             ' WHERE ec.tip_emp=''M''';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      MySql:=' UPDATE emp_conexoes ec'+
             ' SET ec.tip_emp=''M'''+
             ' where ec.cod_filial='+QuotedStr(sgCodLojaUnica);
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

    Except
      on e : Exception do
      Begin
        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        Application.Terminate;
        Exit;
      End; // on e : Exception do
    End; // Try
  End; // If Trim(sgCodLojaUnica)<>'' Then
//opss - 06/10/2014 - FIM

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

//ODIROPSS - INICIO - Comentar para Passar por Usuário Diferente de Odir
  If (Login<>'ODIR') And (sgCodLojaUnica='') Then
  Begin
    If (Trim(sgParamAplicativo)='') and ((AnsiUpperCase(sgNomeComputador)<>sgCompMaster) And (AnsiUpperCase(sgNomeComputador)<>sgCompServer)) Then
    Begin
      ShowMessage('Versão do Sistema Não Autorizada !!'+cr+cr+'Ligue para o ODIR...');

      Application.Terminate;
      Exit;
    End; // If (Trim(sgParamAplicativo)='') and ((AnsiUpperCase(sgNomeComputador)<>sgCompMaster) And (AnsiUpperCase(sgNomeComputador)<>sgCompServer)) Then

    If (AnsiUpperCase(sgNomeComputador)<>sgCompMaster) And (AnsiUpperCase(sgNomeComputador)<>sgCompServer) Then
    Begin
      sOrigem:=Copy(DateTimeToStr(FileDateToDateTime(
                    FileAge(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+
                    ExtractFileName(Application.ExeName)))),1,19);

      sDestino:=Copy(DateTimeToStr(FileDateToDateTime(FileAge(sgParamAplicativo))),1,19);

      If sDestino<>sOrigem Then
      Begin
        If MessageDlg('Versão do Sistema Diferente da Atual !!'+cr+cr+
                      'Existe uma Nova Versão !'+cr+cr+
                      '- Para usar a Nova  Versão Feche Todos os Gerenciador BelShop'+cr+
                      '  Abertos em seu Computador e Entre Novamente !!'+cr+cr+
                      '- Deseja Continuar na Versão que estas Usando ??', mtConfirmation, [mbYes, mbAbort], 0)=mrAbort Then
        Begin
          Application.Terminate;
          Exit;
        End;
      End;
    End; // If (AnsiUpperCase(sgNomeComputador)<>sgCompMaster) And (AnsiUpperCase(sgNomeComputador)<>sgCompServer) Then
  End; // If Login<>'ODIR' Then
//ODIROPSS - FIM - Comentar para Passar por Usuário Diferente de Odir

  DMBelShop.CDS_BuscaRapida.Close;
end;

procedure TFrmLogin.Bt_SelecionaLojaClick(Sender: TObject);
Var
  tsArquivo: TStringList;
  iPos, i, ii: Integer;
  MySql: String;
begin

  bgSiga:=False;

  // Apresenta Lojas Para Seleção de Loja Unica ================================
  for i:=0 to Cklb_Lojas.Items.Count - 1 do
  Begin
   If Cklb_Lojas.Checked[i] Then
   Begin
     If Application.MessageBox(PChar('A Loja de Trabalho Selecionada esta CORRETA ??'+cr+cr+Cklb_Lojas.Items[i]), 'ATENÇÃO !!', 292) = IdNo Then
     Begin
       Exit;
     End;

     bgSiga:=True;
     iPos:=pos('-',Cklb_Lojas.Items[i]);
     sgCodLojaUnica:=Trim(copy(Cklb_Lojas.Items[i],5,(iPos-1)-5));

     tsArquivo:= TStringList.Create;
     Try
       { Carrega o conteúdo do arquivo texto para a   memória }
       tsArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sPath_Local)+'Servidor_Adm.ini');

       { Realiza um loop em toda a lista }
       For ii:=0 to tsArquivo.Count-1 do
       Begin
         If ii=1 Then
         Begin
           tsArquivo[ii]:=sgCodLojaUnica;
           tsArquivo.SaveToFile(IncludeTrailingPathDelimiter(sPath_Local)+'Servidor_Adm.ini');
           Break;
         End;
       End; // For ii := 0 to tsArquivo.Count - 1 do
     Finally // Try
       { Libera a instancia da lista da memória }
       FreeAndNil(tsArquivo);
     End; // Try
     tsArquivo.Free;

     Break;
   End; // If Cklb_Lojas.Checked[i] Then
  End; // for i:=0 to Cklb_Lojas.Items.Count - 1 do

  If Not bgSiga Then
  Begin
    msg('Favor Seleciona a Loja'+cr+cr+'de Trabalho...','A');
    Cklb_Lojas.SetFocus;
    Exit;
  End;

  If sgCodLojaUnica<>'' Then
   FrmLogin.Caption:='Gerenciador Belshop - Bel_'+sgCodLojaUnica;

  // Atualiza EMP_CONEXOES =====================================================
  // Verificva se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE emp_conexoes ec'+
           ' SET ec.tip_emp='+QuotedStr('F')+
           ' WHERE ec.tip_emp='+QuotedStr('M');
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    MySql:=' UPDATE emp_conexoes ec'+
           ' SET ec.tip_emp='+QuotedStr('M')+
           ', ec.endereco_ip_externo=ec.endereco_ip'+
           ', ec.endereco_ip='+QuotedStr(sgNomeServidor)+
           ' WHERE ec.cod_filial='+QuotedStr(sgCodLojaUnica);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    MySql:=' DELETE FROM PARAMETROS_LOJAS p'+
           ' WHERE NOT ((p.cod_loja IS NULL) OR (p.cod_loja='+QuotedStr(sgCodLojaUnica)+'))';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Application.Terminate;
      Exit;
    End; // on e : Exception do
  End; // Try

  FrmLogin.ClientHeight:=241;
  FrmLogin.ClientWidth:=411;
  Gb_SuaLoja.Visible:=False;

  msg(' O Sistema Será Encerrado !!'+cr+cr+'Entre Novamente para'+cr+'Atualização de Parâmetros...','A');
  Application.Terminate;
  Exit;

end;

procedure TFrmLogin.Cklb_LojasClickCheck(Sender: TObject);
Var
  iIndex, i: Integer;
begin
  iIndex:=Cklb_Lojas.ItemIndex;

  for i:=0 to Cklb_Lojas.Items.Count - 1 do
   Cklb_Lojas.Checked[i]:=False;

  Cklb_Lojas.Items[iIndex];
  Cklb_Lojas.Checked[iIndex]:=True;
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
