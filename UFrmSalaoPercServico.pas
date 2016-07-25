unit UFrmSalaoPercServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvXPCheckCtrls, JvExStdCtrls, JvRadioButton,
  Mask, ToolEdit, CurrEdit, JvExControls, JvXPCore, JvXPButtons,
  Clipbrd; // PrintScreen
  // Ultimo: Clipbrd;

type
  TFrmSalaoPercServico = class(TForm)
    Pan_SalaoPercServ: TPanel;
    Gb_SalaoPercServLoja: TGroupBox;
    EdtSalaoPercServCodLoja: TEdit;
    EdtSalaoPercServDesLoja: TEdit;
    Gb_SalaoPercServProf: TGroupBox;
    EdtSalaoPercServCodProf: TEdit;
    Gb_SalaoPercServHab: TGroupBox;
    EdtSalaoPercServCodHab: TEdit;
    EdtSalaoPercServDesHab: TEdit;
    Gb_SalaoPercServServ: TGroupBox;
    EdtSalaoPercServCodServ: TEdit;
    EdtSalaoPercServDesServ: TEdit;
    Pan_SalaoPercServAtual: TPanel;
    Bt_SalaoPercServAtualiza: TJvXPButton;
    Gb_SalaoPercServPerCom: TGroupBox;
    EdtSalaoPercServPerCom: TCurrencyEdit;
    Pan_SalaoPercServSolic: TPanel;
    Rb_SalaoPercServTodos: TJvRadioButton;
    Rb_SalaoPercServEste: TJvRadioButton;
    Ckb_SalaoPercServAtivo: TJvXPCheckbox;
    EdtSalaoPercServDesProf: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Bt_SalaoPercServAtualizaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rb_SalaoPercServTodosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Rb_SalaoPercServTodosClick(Sender: TObject);
    procedure Ckb_SalaoPercServAtivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSalaoPercServico: TFrmSalaoPercServico;

  bgSairSalao: Boolean;
  bEnterTab:   Boolean;

implementation

uses DK_Procs1;

{$R *.dfm}

procedure TFrmSalaoPercServico.FormKeyPress(Sender: TObject;var Key: Char);
begin
  If bEnterTab Then
  Begin
    If Key = #13 Then
    Begin
      Key:=#0;
      SelectNext(ActiveControl,True,True);
    End;
  End;

end;

procedure TFrmSalaoPercServico.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmSalaoPercServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairSalao Then
   Action := caFree
  Else
   Action := caNone;
end;

procedure TFrmSalaoPercServico.FormShow(Sender: TObject);
begin
  bgSairSalao:=False;

end;

procedure TFrmSalaoPercServico.Bt_SalaoPercServAtualizaClick(Sender: TObject);
begin
  If EdtSalaoPercServPerCom.Value=0 Then
   Begin
     if msg('SEM Percentual de Comissão !!'+cr+cr+'Esta CORRETO ??','C')=2 Then
     Begin
       EdtSalaoPercServPerCom.SetFocus;
       Exit;
     End
   End
  Else // If EdtSalaoPercServPerCom.Value=0 Then
   Begin
     if msg('O Percentual de Comissão !!'+cr+cr+'Esta CORRETO ??','C')=2 Then
     Begin
       EdtSalaoPercServPerCom.SetFocus;
       Exit;
     End;
   End; // If EdtSalaoPercServPerCom.Value=0 Then

  bgSairSalao:=True;
  Close;

end;

procedure TFrmSalaoPercServico.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

procedure TFrmSalaoPercServico.Rb_SalaoPercServTodosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Rb_SalaoPercServTodosClick(Self);
end;

procedure TFrmSalaoPercServico.Rb_SalaoPercServTodosClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_SalaoPercServTodos);
  AcertaRb_Style(Rb_SalaoPercServEste);

end;

procedure TFrmSalaoPercServico.Ckb_SalaoPercServAtivoClick(
  Sender: TObject);
begin
  AcertaCkb_Style(Ckb_SalaoPercServAtivo);

end;

end.
