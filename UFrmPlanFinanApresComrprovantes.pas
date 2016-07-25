unit UFrmPlanFinanApresComrprovantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, JvExControls, JvXPCore, JvXPButtons,
  Clipbrd, // PrintScreen
  ExtCtrls;
//  Último: ExtCtrls;

{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, JvExControls, JvXPCore,
  Clipbrd, // PrintScreen
  JvXPButtons;
}

type
  TFrmPlanFinanApresComrprovantes = class(TForm)
    Gr_PlanFinanApresComprovantes: TGroupBox;
    Pan_PlanFinanApresComprovantes: TPanel;
    Gb_PlanFinanApresComprovLoja: TGroupBox;
    Gb_PlanFinanApresComprovComrpovante: TGroupBox;
    EdtPlanFinanApresComprovEmpresa: TEdit;
    EdtPlanFinanApresComprovComprovante: TEdit;
    Bt_PlanFinanApresComprovSalvar: TJvXPButton;
    Dbg_PlanFinanApresComprovantes: TDBGrid;
    Bt_PlanFinanApresComprovVoltar: TJvXPButton;
    Memo1: TMemo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_PlanFinanApresComprovSalvarClick(Sender: TObject);
    procedure Dbg_PlanFinanApresComprovantesTitleClick(Column: TColumn);
    procedure Bt_PlanFinanApresComprovVoltarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPlanFinanApresComrprovantes: TFrmPlanFinanApresComrprovantes;

  OrderGrid: String;

implementation

uses UDMVirtual, DK_Procs1;

{$R *.dfm}

procedure TFrmPlanFinanApresComrprovantes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmPlanFinanApresComrprovantes.Bt_PlanFinanApresComprovSalvarClick(
  Sender: TObject);
begin
  If DMVirtual.CDS_V_ApresComprovantes.IsEmpty Then
   Exit;

  Dbg_PlanFinanApresComprovantes.SetFocus; 
  SalvaResultado_CLI(DMVirtual.CDS_V_ApresComprovantes, Dbg_PlanFinanApresComprovantes, Memo1);
end;

procedure TFrmPlanFinanApresComrprovantes.Dbg_PlanFinanApresComprovantesTitleClick(Column: TColumn);
begin
  If (OrderGrid='') or (OrderGrid='Crescente') Then
   Begin
     OrderByGrid(DMVirtual.CDS_V_ApresComprovantes, Dbg_PlanFinanApresComprovantes, Column.FieldName, False);
     OrderGrid:='Decrescente';
   End
  Else
   Begin
     OrderByGrid(DMVirtual.CDS_V_ApresComprovantes, Dbg_PlanFinanApresComprovantes, Column.FieldName, True);
     OrderGrid:='Crescente';
   End

end;

procedure TFrmPlanFinanApresComrprovantes.Bt_PlanFinanApresComprovVoltarClick(Sender: TObject);
begin
  DMVirtual.CDS_V_ApresComprovantes.Close;
  Close;

end;

procedure TFrmPlanFinanApresComrprovantes.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmPlanFinanApresComrprovantes.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

end.
