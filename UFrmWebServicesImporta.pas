unit UFrmWebServicesImporta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvXPButtons, JvExControls, JvXPCore, JvXPCheckCtrls, StdCtrls,
  ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFrmWebServicesImporta = class(TForm)
    Panel1: TPanel;
    GroupBox4: TGroupBox;
    Ckb_ImportaLinx: TJvXPCheckbox;
    Ckb_ImportaGeoBeauty: TJvXPCheckbox;
    Bt_Importar: TJvXPButton;
    Bt_NaoImportar: TJvXPButton;
    Bt_Voltar: TJvXPButton;
    Panel2: TPanel;
    Label1: TLabel;
    DtEdt_DtaInicio: TcxDateEdit;
    DtEdt_DtaFim: TcxDateEdit;
    Label75: TLabel;
    procedure Bt_ImportarClick(Sender: TObject);
    procedure Ckb_ImportaLinxClick(Sender: TObject);
    procedure Ckb_ImportaLinxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    bgProcWebServices: Boolean;
  end;

var
  FrmWebServicesImporta: TFrmWebServicesImporta;

  bgSairWeb: Boolean;
  
implementation

uses DK_Procs1;

{$R *.dfm}

procedure TFrmWebServicesImporta.Bt_ImportarClick(Sender: TObject);
begin
  // Usando nos Botões:
  // Bt_Importar
  // Bt_NaoImportar
  // Bt_Voltar

  If (Sender is TJvXPButton) Then
  Begin
    If (Sender as TJvXPButton).Name='Bt_Importar' Then
    Begin
      If (Not Ckb_ImportaGeoBeauty.Checked) and (Not Ckb_ImportaLinx.Checked) Then
      Begin
        msg('Favor Selecionar o Quê Importar...','A');
        Ckb_ImportaLinx.SetFocus;
        Exit;
      End;

      If (Ckb_ImportaGeoBeauty.Checked) and (Ckb_ImportaLinx.Checked) Then
      Begin
        If msg('Deseja Realmente Importar'+cr+cr+'Linx e GeoBeauty ??','C')=2 Then
        Begin
          Ckb_ImportaLinx.SetFocus;
          Exit;
        End;
      End;

      If (Not Ckb_ImportaGeoBeauty.Checked) and (Ckb_ImportaLinx.Checked) Then
      Begin
        If msg('Deseja Realmente Importar'+cr+cr+'Somente Linx ??','C')=2 Then
        Begin
          Ckb_ImportaLinx.SetFocus;
          Exit;
        End;
      End;

      If (Ckb_ImportaGeoBeauty.Checked) and (Not Ckb_ImportaLinx.Checked) Then
      Begin
        If msg('Deseja Realmente Importar'+cr+cr+'Somente GeoBeauty ??','C')=2 Then
        Begin
          Ckb_ImportaGeoBeauty.SetFocus;
          Exit;
        End;
      End;
    End; // If (Sender as TJvXPButton).Name='Bt_Importar' Then

    If (Sender as TJvXPButton).Name='Bt_NaoImportar' Then
    Begin
      Ckb_ImportaLinx.Checked:=False;
      Ckb_ImportaGeoBeauty.Checked:=False;
    End;

    If (Sender as TJvXPButton).Name='Bt_Voltar' Then
    Begin
      Ckb_ImportaLinx.Checked:=False;
      Ckb_ImportaGeoBeauty.Checked:=False;
      bgProcWebServices:=False;
    End;
  End; // If (Sender is TJvXPButton) Then


  bgSairWeb:=True;
  Close;

end;

procedure TFrmWebServicesImporta.Ckb_ImportaLinxClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_ImportaGeoBeauty);
  AcertaCkb_Style(Ckb_ImportaLinx);
end;

procedure TFrmWebServicesImporta.Ckb_ImportaLinxKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ImportaLinxClick(Self);
end;

procedure TFrmWebServicesImporta.FormCreate(Sender: TObject);
begin
  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  bgSairWeb:=False;
  bgProcWebServices:=True;

end;

procedure TFrmWebServicesImporta.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  If Not bgSairWeb Then
   Action := caNone;
end;

procedure TFrmWebServicesImporta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

end.
