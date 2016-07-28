unit UFrmAlertaST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, JvExControls, JvXPCore, JvXPButtons, Grids, DBGrids,
  ExtCtrls, StdCtrls;

type
  TFrmAlertaST = class(TForm)
    Pan_Notas_ST_Erradas: TPanel;
    DBGrid7: TDBGrid;
    Panel1: TPanel;
    Bt_Parar: TJvXPButton;
    JvXPButton2: TJvXPButton;
    Bt_KitSalvaExcel: TJvXPButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    procedure JvXPButton2Click(Sender: TObject);
    procedure Bt_KitSalvaExcelClick(Sender: TObject);
    procedure Bt_PararClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlertaST: TFrmAlertaST;

implementation

uses UDM, USpedFiscalAcerta, DK_Procs1, uj_001, uj_002;

{$R *.dfm}

procedure TFrmAlertaST.JvXPButton2Click(Sender: TObject);
begin
  bgParar:=True;
  Close;
end;

procedure TFrmAlertaST.Bt_KitSalvaExcelClick(Sender: TObject);
begin
  ExportDBGridExcel(True, DBGrid7, FrmAlertaST);

end;

procedure TFrmAlertaST.Bt_PararClick(Sender: TObject);
begin
  Close;

end;

end.
