unit UFrmVerProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, ToolEdit, CurrEdit, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFrmVerProducao = class(TForm)
    Gb_Produto: TGroupBox;
    Gb_CodProduto: TGroupBox;
    Gb_DescProduto: TGroupBox;
    Gb_QtdProduto: TGroupBox;
    EdtCodProduto: TCurrencyEdit;
    EdtDescProduto: TEdit;
    EdtQtdProduto: TCurrencyEdit;
    GroupBox3: TGroupBox;
    Dbg_Producao: TDBGrid;
    Gb_NumDocto: TGroupBox;
    EdtNumDocto: TCurrencyEdit;
    Gb_DtaDocto: TGroupBox;
    DtEdt_DtaDocto: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Dbg_ProducaoEnter(Sender: TObject);
    procedure Dbg_ProducaoExit(Sender: TObject);
    procedure Dbg_ProducaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVerProducao: TFrmVerProducao;

implementation

uses UDMArtesanalis;

{$R *.dfm}

procedure TFrmVerProducao.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

procedure TFrmVerProducao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;


end;

procedure TFrmVerProducao.Dbg_ProducaoEnter(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clMoneyGreen;

end;

procedure TFrmVerProducao.Dbg_ProducaoExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clWindow;

end;

procedure TFrmVerProducao.Dbg_ProducaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Não Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmVerProducao.FormShow(Sender: TObject);
begin
  Dbg_Producao.SetFocus;
end;

procedure TFrmVerProducao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key=VK_Escape Then
   Close;

end;

end.
