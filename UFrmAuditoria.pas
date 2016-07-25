unit UFrmAuditoria;

interface

uses
  Windows, StdCtrls, DBCtrls, Forms, Graphics, JvExControls, JvXPCore,
  Clipbrd, // PrintScreen
  JvXPButtons, Classes, Controls, ExtCtrls;
//  Último: ExtCtrls;

type
  TFrmAuditoria = class(TForm)
    Panel1: TPanel;
    Bt_AuditoriaFecha: TJvXPButton;
    DBMemo1: TDBMemo;
    procedure Bt_AuditoriaFechaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAuditoria: TFrmAuditoria;

implementation

{$R *.dfm}

procedure TFrmAuditoria.Bt_AuditoriaFechaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAuditoria.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmAuditoria.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

end.

 
