unit UFrmWebServicesImporta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvXPButtons, JvExControls, JvXPCore, JvXPCheckCtrls, StdCtrls,
  ExtCtrls;

type
  TFrmWebServicesImporta = class(TForm)
    Panel1: TPanel;
    GroupBox4: TGroupBox;
    Ckb_ImportaLinx: TJvXPCheckbox;
    Ckb_ImportaGeoBeauty: TJvXPCheckbox;
    Bt_ReposDivAlterarQtd: TJvXPButton;
    JvXPButton1: TJvXPButton;
    procedure Bt_ReposDivAlterarQtdClick(Sender: TObject);
    procedure JvXPButton1Click(Sender: TObject);
    procedure Ckb_ImportaLinxClick(Sender: TObject);
    procedure Ckb_ImportaLinxKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmWebServicesImporta: TFrmWebServicesImporta;

  bgSairWeb: Boolean;
  
implementation

uses DK_Procs1;

{$R *.dfm}

procedure TFrmWebServicesImporta.Bt_ReposDivAlterarQtdClick(Sender: TObject);
begin
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

  bgSairWeb:=True;
  Close;

end;

procedure TFrmWebServicesImporta.JvXPButton1Click(Sender: TObject);
begin
  bgSairWeb:=True;

  Ckb_ImportaLinx.Checked:=False;
  Ckb_ImportaGeoBeauty.Checked:=False;

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
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  bgSairWeb:=False;

end;

procedure TFrmWebServicesImporta.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  If Not bgSairWeb Then
   Action := caNone;
end;

end.
