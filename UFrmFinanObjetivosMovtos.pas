unit UFrmFinanObjetivosMovtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, JvExControls, JvXPCore, JvXPButtons,
  Clipbrd, // PrintScreen
  ExtCtrls;
//  Último: ExtCtrls;

{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, JvExControls, JvXPCore, JvXPButtons,
  Clipbrd, // PrintScreen
  ExtCtrls;
}

type
  TFrmFinanObjetivosMovtos = class(TForm)
    Gb_FinanObjetivosMovtos: TGroupBox;
    Pan_FinanObjetivosMovtos: TPanel;
    Gb_FinanObjetivosMovtosLoja: TGroupBox;
    EdtFinanObjetivosMovtosLoja: TEdit;
    Gb_FinanObjetivosMovtosObjetivo: TGroupBox;
    EdtFinanObjetivosMovtosObjetivo: TEdit;
    Bt_FinanObjetivosMovtosSalvar: TJvXPButton;
    Bt_FinanObjetivosMovtosVoltar: TJvXPButton;
    Memo1: TMemo;
    Dbg_FinanObjetivosMovtos: TDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_FinanObjetivosMovtosSalvarClick(Sender: TObject);
    procedure Bt_FinanObjetivosMovtosVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFinanObjetivosMovtos: TFrmFinanObjetivosMovtos;

implementation

uses UDMVirtual, DK_Procs1;

{$R *.dfm}

procedure TFrmFinanObjetivosMovtos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmFinanObjetivosMovtos.Bt_FinanObjetivosMovtosSalvarClick(
  Sender: TObject);
begin
  If DMVirtual.CDS_V_ObjetivosMovtos.IsEmpty Then
   Exit;

  Dbg_FinanObjetivosMovtos.SetFocus;
  SalvaResultado_CLI(DMVirtual.CDS_V_ObjetivosMovtos, Dbg_FinanObjetivosMovtos, Memo1);

end;

procedure TFrmFinanObjetivosMovtos.Bt_FinanObjetivosMovtosVoltarClick(
  Sender: TObject);
begin
  DMVirtual.CDS_V_ApresComprovantes.Close;
  Close;

end;

procedure TFrmFinanObjetivosMovtos.FormShow(Sender: TObject);
begin
  Dbg_FinanObjetivosMovtos.Columns[0].Color:=$00C1FFFF; 
  
end;

procedure TFrmFinanObjetivosMovtos.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmFinanObjetivosMovtos.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

end.
