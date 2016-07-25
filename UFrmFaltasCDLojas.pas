unit UFrmFaltasCDLojas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, JvExControls, JvXPCore, JvXPButtons,
  StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  Mask, ToolEdit, CurrEdit;
//  Último: ExtCtrls;

{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExControls, JvXPCore, JvXPButtons, StdCtrls,
  ExtCtrls, Grids, DBGrids;
}

type
  TFrmFaltasCDLojas = class(TForm)
    Pan_Opcoes: TPanel;
    Lb_Obs: TLabel;
    Bt_Sair: TJvXPButton;
    Dbg_FaltasCDLojas: TDBGrid;
    Pan_FaltasCDLojas: TPanel;
    Pan_FaltasCDLojas1: TPanel;
    Label136: TLabel;
    EdtFaltasCDLojasCodLoja: TCurrencyEdit;
    Bt_FaltasCDLojasBuscaLoja: TJvXPButton;
    EdtFaltasCDLojasDesLoja: TEdit;
    DtEdt_FaltasCDLojasDtaInicio: TcxDateEdit;
    Label2: TLabel;
    DtEdt_FaltasCDLojasDtaFim: TcxDateEdit;
    Label3: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_SairClick(Sender: TObject);

    // Odir


    // Odir

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFaltasCDLojas: TFrmFaltasCDLojas;

implementation

// Odirapagar 22/05/2014
// Retira do Uses: Uf_Conecta, uj_001, uj_002,

uses UDMBelShop, UFrmBelShop, DK_Procs1;

{$R *.dfm}

procedure TFrmFaltasCDLojas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FrmBelShop.FechaTudo;
end;

procedure TFrmFaltasCDLojas.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

end;

procedure TFrmFaltasCDLojas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmFaltasCDLojas.Bt_SairClick(Sender: TObject);
begin
  Close;
end;

end.
