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
  dxSkinsdxStatusBarPainter, dxStatusBar, Mask, ToolEdit, CurrEdit, Shellapi;

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
    SubMenuProducaoVendas: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuSAIRClick(Sender: TObject);
    procedure SubMenuUnidadeCadastroClick(Sender: TObject);
    procedure SubMenuMateriaPrimaCadastroClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MenuCalculadoraClick(Sender: TObject);
    procedure MenuVersaoClick(Sender: TObject);
    procedure SubMenuProducaoCadastroClick(Sender: TObject);
    procedure SubMenuProdutoCadastroClick(Sender: TObject);

    // Odir ====================================================================

    // Odir ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmArtesanalis: TFrmArtesanalis;

implementation

uses UDMArtesanalis, DK_Procs1, SysConst, UFrmUnidades, UFrmMateriaPrimaCadastro,
     UFrmProducaoCadastro, UFrmProdutoCadastro;

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

  // Cria Memo para Guardar Forms Abertos ======================================
  mgMemo:=TMemo.Create(Self);
  mgMemo.Visible:=False;
  mgMemo.Parent:=FrmArtesanalis;
  mgMemo.Width:=500;
  mgMemo.Lines.Clear;

end;

procedure TFrmArtesanalis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if mgMemo.Lines.Count>0 Then
  Begin
    MessageBox(Handle, pChar('Existe(m) Janela(s) Aberta(s):'+cr+cr+
                             mgMemo.Lines.Text+cr+cr+
                             'Antes de Encerrar Feche Todas Primeiro...'), 'ATENÇÃO !!', MB_ICONERROR);
    Action := caNone;
    Exit;
  End;

  FreeAndNil(mgMemo);
  DMArtesanalis.FechaTudo;

  Application.Terminate;
end;

procedure TFrmArtesanalis.MenuSAIRClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmArtesanalis.SubMenuUnidadeCadastroClick(Sender: TObject);
begin
  DMArtesanalis.MemoAdicionaNomeForm('Cadastro de Unidades');

  DMArtesanalis.CDS_Unidade.Open;

  FrmUnidades.Show;

end;

procedure TFrmArtesanalis.SubMenuMateriaPrimaCadastroClick(Sender: TObject);
begin
  DMArtesanalis.MemoAdicionaNomeForm('Cadastro de Matéria-Prima');

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

procedure TFrmArtesanalis.MenuCalculadoraClick(Sender: TObject);
begin
  shellexecute(handle, 'open', 'calc.exe', '', nil, sw_shownormal);
end;

procedure TFrmArtesanalis.MenuVersaoClick(Sender: TObject);
begin
  msg('Data da Última Alteração: '+Copy(DateTimeToStr(FileDateToDateTime(
      FileAge(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+
      ExtractFileName(Application.ExeName)))),1,19),'A');

end;

procedure TFrmArtesanalis.SubMenuProducaoCadastroClick(Sender: TObject);
begin
  DMArtesanalis.MemoAdicionaNomeForm('Cadastro de Produção');

  DMArtesanalis.CDS_Producao.Open;
  DMArtesanalis.CDS_ProducaoMatPrima.Open;

  FrmProducaoCadastro.Show;

end;

procedure TFrmArtesanalis.SubMenuProdutoCadastroClick(Sender: TObject);
begin
  DMArtesanalis.MemoAdicionaNomeForm('Cadastro de Produto');

  DMArtesanalis.CDS_Produto.Open;

  FrmProdutoCadastro.Show;

end;

end.

