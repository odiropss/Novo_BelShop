unit UDMRelatorio;

interface

uses
  SysUtils, Classes, FR_BarC, frxClass, frxExportPDF, FR_Class, RelVisual,
  Dialogs, frexpimg, FR_DSet, FR_DBSet, frOLEExl, frRtfExp, FR_E_HTML2,
  FR_E_HTM, FR_E_CSV, FR_E_RTF, FR_E_TXT;

type
  TDMRelatorio = class(TDataModule)
    frTextExport1: TfrTextExport;
    frRTFExport1: TfrRTFExport;
    frCSVExport1: TfrCSVExport;
    frHTMExport1: TfrHTMExport;
    frHTML2Export1: TfrHTML2Export;
    frRtfAdvExport1: TfrRtfAdvExport;
    frTIFFExport1: TfrTIFFExport;
    frJPEGExport1: TfrJPEGExport;
    frOLEExcelExport1: TfrOLEExcelExport;
    frDBDataSet1: TfrDBDataSet;
    frBMPExport1: TfrBMPExport;
    FontDialog: TFontDialog;
    RelVisual: TRelVisualJul;
    frReport1: TfrReport;
    frxPDFExport1: TfrxPDFExport;
    frxReport1: TfrxReport;
    frBarCodeObject1: TfrBarCodeObject;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelatorio: TDMRelatorio;

implementation

uses DK_Procs1, UDMBelShopPedidos, UDMOCLinx, UDMVirtual, UFrmBelShopPedidos,
     UFrmOCLinx;

{$R *.dfm}

end.
