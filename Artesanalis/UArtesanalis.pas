unit UArtesanalis;

// Cor Form/Painel Principal:  $00FFE4CA

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons, JvExButtons,
  JvBitBtn, DBXpress, FMTBcd, Grids, DBGrids, DB, Provider, SqlExpr,
  DBClient, JvGradientCaption, JvExControls, JvXPCore, JvXPButtons,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinsdxStatusBarPainter, dxStatusBar, Mask, ToolEdit, CurrEdit;

type
  TFrmArtesanalis = class(TForm)
    MainMenu1: TMainMenu;
    MenuCalculadora: TMenuItem;
    MenuVersao: TMenuItem;
    MenuSAIR: TMenuItem;
    MenuProducao: TMenuItem;
    MenuMateriaPrima: TMenuItem;
    CorCaptionForm: TJvGradientCaption;
    MenuProduto: TMenuItem;
    MenuUnidade: TMenuItem;
    SubMenuMateriaPrimaCadastro: TMenuItem;
    SubMenuMateriaPrimaEntrada: TMenuItem;
    SubMenuProdutoCadastro: TMenuItem;
    SubMenuProdutoSaldo: TMenuItem;
    SubMenuMateriaPrimaSaldo: TMenuItem;
    SubMenuUnidadeCadastro: TMenuItem;
    SubMenuProducaoCadastro: TMenuItem;
    SubMenuProducaoProducao: TMenuItem;
    OdirPanApres: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuSAIRClick(Sender: TObject);
    procedure SubMenuUnidadeCadastroClick(Sender: TObject);
    procedure SubMenuMateriaPrimaCadastroClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmArtesanalis: TFrmArtesanalis;

implementation

uses UDMArtesanalis, DK_Procs1, SysConst, UFrmUnidades, UFrmMateriaPrimaCadastro;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmArtesanalis.FormShow(Sender: TObject);
begin
  FrmArtesanalis.ClientHeight:=0;
  FrmArtesanalis.Align:=alNone;
  FrmArtesanalis.Height:=57;

  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

end;

procedure TFrmArtesanalis.FormCreate(Sender: TObject);
begin
  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

procedure TFrmArtesanalis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSair Then
   Begin
     Action := caFree;

     DMArtesanalis.FechaTudo;
   End
  Else
   Begin
     msg('Para Fechar Tecle Primeiro'+cr+cr+'no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmArtesanalis.MenuSAIRClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmArtesanalis.SubMenuUnidadeCadastroClick(Sender: TObject);
begin
  DMArtesanalis.CDS_Unidade.Open;

  FrmUnidades.Show;

end;

procedure TFrmArtesanalis.SubMenuMateriaPrimaCadastroClick(Sender: TObject);
begin

  DMArtesanalis.CDS_MateriaPrima.Open;

  FrmMateriaPrimaCadastro.Show;
end;

procedure TFrmArtesanalis.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

end.

