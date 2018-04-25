unit UDMRelatorios;

interface

uses
  SysUtils, Classes, FR_Class, RelVisual, Dialogs, frexpimg, FR_DSet,
  FR_DBSet, frOLEExl, frRtfExp, FR_E_HTML2, FR_E_HTM, FR_E_CSV, FR_E_RTF,
  FR_E_TXT, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDMRelatorios = class(TDataModule)
    RelVisual: TRelVisualJul;
    FontDialog: TFontDialog;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frTextExport1: TfrTextExport;
    frRTFExport1: TfrRTFExport;
    frCSVExport1: TfrCSVExport;
    frHTMExport1: TfrHTMExport;
    frHTML2Export1: TfrHTML2Export;
    frOLEExcelExport1: TfrOLEExcelExport;
    frBMPExport1: TfrBMPExport;
    frJPEGExport1: TfrJPEGExport;
    frTIFFExport1: TfrTIFFExport;
    frRtfAdvExport1: TfrRtfAdvExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelatorios: TDMRelatorios;

implementation

uses UDMArtesanalis;

{$R *.dfm}

end.
