unit UFrmConfirmacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, ExtCtrls, StdCtrls;

type
  TFrmConfirmacao = class(TForm)
    Panel1: TPanel;
    Bt_ConfirmarBotaoUm: TJvXPButton;
    Bt_ConfirmarBotaoDois: TJvXPButton;
    Bt_Abandonar: TJvXPButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Bt_ConfirmarBotaoUmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bgConfimarBotaoUm, bgConfimarBotaoDois, bgAbandonar: Boolean;
  end;

var
  FrmConfirmacao: TFrmConfirmacao;


implementation

uses DK_Procs1;

{$R *.dfm}

procedure TFrmConfirmacao.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  bgConfimarBotaoUm  :=False;
  bgConfimarBotaoDois:=False;
  bgAbandonar:=False;
end;

procedure TFrmConfirmacao.Bt_ConfirmarBotaoUmClick(Sender: TObject);
begin
  bgConfimarBotaoUm  :=False;
  bgConfimarBotaoDois:=False;
  bgAbandonar:=False;

  If (Sender is TJvXPButton) Then
  Begin
    If Trim((Sender as TJvXPButton).Name)='Bt_ConfirmarBotaoUm' Then
    Begin
      If msg('Confirma '+Trim((Sender as TJvXPButton).Caption)+' ??','C')=2 Then
       Begin
         Exit;
       End
      Else
       Begin
         bgConfimarBotaoUm  :=True;
         bgConfimarBotaoDois:=False;
         bgAbandonar:=False;
       End; // If msg('Confirma '+Trim((Sender as TJvXPButton).Caption)+' ??','C')=1 Then
    End; // If Trim((Sender as TJvXPButton).Name)='Bt_ConfirmarBotaoUm' Then

    If Trim((Sender as TJvXPButton).Name)='Bt_ConfirmarBotaoDois' Then
    Begin
      If msg('Confirma '+Trim((Sender as TJvXPButton).Caption)+' ??','C')=2 Then
       Begin
         Exit;
       End
      Else
       Begin
         bgConfimarBotaoUm  :=False;
         bgConfimarBotaoDois:=True;
         bgAbandonar:=False;
       End; // If msg('Confirma '+Trim((Sender as TJvXPButton).Caption)+' ??','C')=1 Then
    End; // If Trim((Sender as TJvXPButton).Name)='Bt_ConfirmarBotaoDois' Then

    If Trim((Sender as TJvXPButton).Name)='Bt_Abandonar' Then
    Begin
      bgConfimarBotaoUm  :=False;
      bgConfimarBotaoDois:=False;
      bgAbandonar:=True;
    End; // If Trim((Sender as TJvXPButton).Name)='Bt_ConfirmarBotaoDois' Then
  End; // If (Sender is TComboBoxJul) Then

  Close;

end;

end.
