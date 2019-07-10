unit UPermissao;

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

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdtLogin: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BT_Entrar: TJvXPButton;
    BT_Sair: TJvXPButton;
    Image2: TImage;
    Lb_CapsLock: TLabel;
    Timer1: TTimer;
    Image4: TImage;
    Label2: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_EntrarClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    PainelApresLogin: TPanel;
  end;

var
  FrmLogin: TFrmLogin;

  bgOnActivate: Boolean; // Se Ja Executou o Evento do Form OnActivate

  Num_Vezes: Integer;

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;
  
implementation

uses DK_Procs1, UEntrada, UDMBelShopPedidos;

{$R *.dfm}
procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  EdtLogin.Clear;
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

procedure TFrmLogin.BT_EntrarClick(Sender: TObject);
Var
  MySql: String;
begin

  EdtLogin.SetFocus;
  If Trim(EdtLogin.Text)='' Then
  Begin
    msg('Favor Informar o Código da Loja !!','A');
    Exit;
  End;

  PainelApresLogin.Caption:='AGUARDE !! Inicializando A Loja ...';
  PainelApresLogin.Width:=Length(PainelApresLogin.Caption)*10;
  PainelApresLogin.Left:=ParteInteiro(FloatToStr((FrmLogin.Width-PainelApresLogin.Width)/2));
  PainelApresLogin.Top:=ParteInteiro(FloatToStr((FrmLogin.Height-PainelApresLogin.Height)/2));
  PainelApresLogin.Font.Style:=[fsBold];
  PainelApresLogin.Parent:=FrmLogin;
  PainelApresLogin.Visible:=True;
  Refresh;

  // ===========================================================================
  // Verifica Loja =============================================================
  // ===========================================================================
  MySql:=' SELECT u.cod_usuario, u.des_senha,'+
         '        CAST((u.COD_USUARIO/1000) AS INTEGER) COD_LJLINX'+
         ' FROM PS_USUARIOS u'+
         ' WHERE u.cod_usuario> 1000'+
         ' AND   UPPER(u.des_login)='+QuotedStr(AnsiUpperCase(EdtLogin.Text));
  DMBelShopPedidos.SQLQuery1.Close;
  DMBelShopPedidos.SQLQuery1.SQL.Clear;
  DMBelShopPedidos.SQLQuery1.SQL.Add(MySql);
  DMBelShopPedidos.SQLQuery1.Open;

  If Trim(DMBelShopPedidos.SQLQuery1.FieldByName('Cod_Usuario').AsString)='' Then
  Begin
    DMBelShopPedidos.SQLQuery1.Close;
    msg('Loja Inexistente !!','A');

    Inc(Num_Vezes);
    Label6.Caption:=IntToStr(Num_Vezes);

    If Num_Vezes=5 Then
     Application.Terminate;

    EdtLogin.SetFocus;
    PainelApresLogin.Visible:=False;
    Exit;
  End;
  // Verifica Loja =============================================================
  // ===========================================================================

  // ===========================================================================
  // Verifica se Permite a Loja ================================================
  // ===========================================================================
  sgSenhaLj:=DecriptaSTR(DMBelShopPedidos.SQLQuery1.FieldByName('Des_Senha').AsString,40,30,20);
  sgLojaLinx     :=DMBelShopPedidos.SQLQuery1.FieldByName('Cod_LjLinx').AsString;

  DMBelShopPedidos.SQLQuery1.Close;

  If Not DMBelShopPedidos.LiberaLojaWork Then
  Begin
    msg('Loja Não Autorizada !!','A');

    Inc(Num_Vezes);
    Label6.Caption:=IntToStr(Num_Vezes);

    If Num_Vezes=5 Then
     Application.Terminate;

    EdtLogin.SetFocus;
    PainelApresLogin.Visible:=False;
    Exit;
  End; // If Not DMBelShopPedidos.LiberaLojaWork Then
  // Verifica se Permite a Loja ================================================
  // ===========================================================================

  // ===========================================================================
  // Atualiza Definições da Loja no Banco de Dados =============================
  // ===========================================================================
  MySql:=' SELECT l.cod_loja, l.nome_emp, l.estado_emp'+
         ' FROM LINXLOJAS l'+
         ' WHERE l.empresa='+sgLojaLinx;
  DMBelShopPedidos.SQLQuery1.Close;
  DMBelShopPedidos.SQLQuery1.SQL.Clear;
  DMBelShopPedidos.SQLQuery1.SQL.Add(MySql);
  DMBelShopPedidos.SQLQuery1.Open;

  sgLojaSidicom:=Trim(DMBelShopPedidos.SQLQuery1.FieldByName('Cod_Loja').AsString);
  sgNomeLoja   :=Trim(DMBelShopPedidos.SQLQuery1.FieldByName('Nome_Emp').AsString);
  sgUfLoja     :=Trim(DMBelShopPedidos.SQLQuery1.FieldByName('Estado_Emp').AsString);

  DMBelShopPedidos.SQLQuery1.SQL.Clear;
  DMBelShopPedidos.SQLQuery1.Close;

  // COD_USUARIO (Milhar do Código da Loja) ====================================
  sgCodUsuLoja:=IntToStr(StrToInt(sgLojaLinx)*1000);

  // Cadastro de Loja como Usuário =============================================
  MySql:=' UPDATE OR INSERT INTO PS_USUARIOS'+
         ' (COD_USUARIO, DES_USUARIO, DES_LOGIN, DES_SENHA, IND_ADMIN,'+
         '  IND_ATIVO, USU_INCLUI, USU_ALTERA, DTA_ALTERA)'+ // DTA_INCLUI,
         ' VALUES ('+
         sgCodUsuLoja+', '+ // COD_USUARIO
         QuotedStr(sgNomeLoja)+', '+ // DES_USUARIO
         QuotedStr(Copy(sgNomeLoja,1,30))+', '+ // DES_LOGIN
         QuotedStr(EncriptaSTR(sgUfLoja+sgLojaLinx,40,30,20))+', '+ // DES_SENHA
         QuotedStr('NAO')+', '+ // IND_ADMIN
         QuotedStr('SIM')+', '+ // IND_ATIVO
         '0, '+ // USU_INCLUI
         sgCodUsuLoja+', '+ // USU_ALTERA
         ' CURRENT_TIMESTAMP)'+ // DTA_ALTERA

         ' MATCHING (COD_USUARIO)';
  DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);
  // Atualiza Definições da Loja no Banco de Dados =============================
  // ===========================================================================

  PainelApresLogin.Visible:=False;

  Close;

end;

procedure TFrmLogin.BT_SairClick(Sender: TObject);
begin
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

procedure TFrmLogin.FormActivate(Sender: TObject);
begin
  // Coloca BitMaps em Componentes =============================================
  If Not bgOnActivate Then
  Begin
    bgOnActivate:=True;
  End;

end;

end.
