unit UFrmLeitoraCodBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, StdCtrls, ExtCtrls, Mask,
  ToolEdit, CurrEdit, MMSystem, JvGradientCaption, JvProgressBar,
  JvExStdCtrls, JvEdit;

type
  TFrmLeitoraCodBarras = class(TForm)
    Panel1: TPanel;
    Bt_Processar: TJvXPButton;
    Bt_Fechar: TJvXPButton;
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
    EdtCodBarras: TJvEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtQtdEmbalagemEnter(Sender: TObject);
    procedure EdtQtdEmbalagemExit(Sender: TObject);
    procedure EdtCodBarrasChange(Sender: TObject);
    procedure Bt_ProcessarClick(Sender: TObject);
    procedure EdtCodBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    bgProcessar: Boolean;
  end;

var
  FrmLeitoraCodBarras: TFrmLeitoraCodBarras;

implementation

uses DK_Procs1, UFrmCentralTrocas;

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
  Panel1.SetFocus;

  bgProcessar:=False;
  Close;
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

procedure TFrmLeitoraCodBarras.EdtQtdEmbalagemEnter(Sender: TObject);
begin
  EdtCodBarras.Text:='0';
end;

procedure TFrmLeitoraCodBarras.EdtQtdEmbalagemExit(Sender: TObject);
begin
  EdtCodBarras.SetFocus;

end;

procedure TFrmLeitoraCodBarras.EdtCodBarrasChange(Sender: TObject);
begin
  If Length(EdtCodBarras.Text)=13 Then
   Bt_ProcessarClick(Self);

end;

procedure TFrmLeitoraCodBarras.Bt_ProcessarClick(Sender: TObject);
begin
  Panel1.SetFocus;

  If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then
  Begin
    // Processa Reposição ======================================================
    FrmCentralTrocas.CheckOut_BuscaProdCodBarras_AtualizaQtd(Trim(EdtCodBarras.Text),EdtQtdEmbalagem.AsInteger);

    // Acerta Controle de Processamento ==========================================
    FrmCentralTrocas.ReCalculaPosicaoLeitora;

    // Reposiciona =============================================================
    EdtQtdEmbalagem.AsInteger:=1;
    EdtCodBarras.Text:='0';
    EdtCodBarras.SetFocus;
  End; // If StrToInt64Def(EdtCodBarras.Text,0)<>0 Then

end;

procedure TFrmLeitoraCodBarras.EdtCodBarrasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If (key=Vk_Return) And (StrToInt64Def(EdtCodBarras.Text,0)<>0) Then
   Bt_ProcessarClick(Self);

end;

end.
