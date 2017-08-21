unit UFrmLeitoraCodBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, StdCtrls, ExtCtrls, Mask,
  ToolEdit, CurrEdit, MMSystem, JvGradientCaption, JvProgressBar;

type
  TFrmLeitoraCodBarras = class(TForm)
    Panel1: TPanel;
    Bt_Processar: TJvXPButton;
    Bt_Fechar: TJvXPButton;
    EdtCodBarras: TCurrencyEdit;
    CorCaptionForm: TJvGradientCaption;
    EdtQtdEmbalagem: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Gb_CheckOut_Erro: TGroupBox;
    Gb_CheckOut_OK: TGroupBox;
    PBar_CheckOut_OK: TJvGradientProgressBar;
    PBar_CheckOut_Erro: TJvGradientProgressBar;
    Lab_CheckOut_OK: TLabel;
    Lab_CheckOut_Erro: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_FecharClick(Sender: TObject);
    procedure Bt_ProcessarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCodBarrasChange(Sender: TObject);
    procedure EdtQtdEmbalagemEnter(Sender: TObject);
    procedure EdtQtdEmbalagemExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bgProcessar: Boolean;
  end;

var
  FrmLeitoraCodBarras: TFrmLeitoraCodBarras;

implementation

uses DK_Procs1;

{$R *.dfm}

procedure TFrmLeitoraCodBarras.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;
end;

procedure TFrmLeitoraCodBarras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmLeitoraCodBarras.Bt_FecharClick(Sender: TObject);
begin
  bgProcessar:=False;
  Close;
end;

procedure TFrmLeitoraCodBarras.Bt_ProcessarClick(Sender: TObject);
begin
  If EdtCodBarras.AsInteger<>0 Then
  Begin
    bgProcessar:=True;
    Close;
  End;
end;

procedure TFrmLeitoraCodBarras.FormShow(Sender: TObject);
begin
  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmLeitoraCodBarras);

  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  EdtCodBarras.SetFocus;
  
end;

procedure TFrmLeitoraCodBarras.EdtCodBarrasChange(Sender: TObject);
begin
  If Length(EdtCodBarras.Text)=13 Then
   Bt_ProcessarClick(Self);

end;

procedure TFrmLeitoraCodBarras.EdtQtdEmbalagemEnter(Sender: TObject);
begin
  EdtCodBarras.Value:=0;
end;

procedure TFrmLeitoraCodBarras.EdtQtdEmbalagemExit(Sender: TObject);
begin
  EdtCodBarras.SetFocus;

end;

end.
