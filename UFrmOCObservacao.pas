unit UFrmOCObservacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, JvExControls, JvXPCore, JvXPButtons,
  Clipbrd, // PrintScreen
  ExtCtrls;
//  Último: ExtCtrls;

{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, ExtCtrls, StdCtrls,
  Clipbrd, // PrintScreen
  DBCtrls, Mask;
}

type
  TFrmOCObservacao = class(TForm)
    Panel1: TPanel;
    Panel7: TPanel;
    Bt_OCObsAbandonar: TJvXPButton;
    Bt_OCObsOK: TJvXPButton;
    Gb_OCObsApresenta: TGroupBox;
    Dbe_OCObsCodEmpresa: TDBEdit;
    Dbe_OCObsDesEmpresa: TDBEdit;
    Dbe_OCObsDesFornecedor: TDBEdit;
    DBEdit4: TDBEdit;
    Dbe_OCObsCodFornecedor: TDBEdit;
    Pan_OCObsObservacao: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Lab_Vlr_OC: TLabel;
    Mem_OCObsObservacao: TMemo;
    procedure Bt_OCObsAbandonarClick(Sender: TObject);
    procedure Bt_OCObsOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOCObservacao: TFrmOCObservacao;

implementation

// Odirapagar 22/05/2014
// Retira do Uses: uj_001, uj_002,

uses DK_Procs1, UDMBelShop, UFrmBelShop;

{$R *.dfm}

procedure TFrmOCObservacao.Bt_OCObsAbandonarClick(Sender: TObject);
begin
  sgMensagemERRO:='Ordens de Compra';
  If Gb_OCObsApresenta.Caption='Romaneio de Separação' Then
   sgMensagemERRO:='Romaneios';

  If msg('Deseja Realmente ABANDONAR a'+cr+cr+'GERAÇÃO de '+sgMensagemERRO+' ??','C')=2 Then
  Begin
    Mem_OCObsObservacao.SetFocus;
    Exit;
  End;

  bgProcessar:=False;

  Close;
end;

procedure TFrmOCObservacao.Bt_OCObsOKClick(Sender: TObject);
begin
  If msg('A Observação Esta CORRETA ??','C')=2 Then
  Begin
    Mem_OCObsObservacao.SetFocus;
    Exit;
  End;

  bgProcessar:=True;

  Close;

end;

procedure TFrmOCObservacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmOCObservacao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmOCObservacao.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

end.
