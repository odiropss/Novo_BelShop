unit UArtesanalis;

// Cor Form/Painel Principal:  $00FFE4CA
// Cort Componete Desabilitado: clMoneyGreen
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
    MenuMateriaPrima: TMenuItem;
    CorCaptionForm: TJvGradientCaption;
    MenuProduto: TMenuItem;
    SubMenuMateriaPrimaCadastro: TMenuItem;
    SubMenuMateriaPrimaEntrada: TMenuItem;
    SubMenuProdutoCadastro: TMenuItem;
    SubMenuProdutoVendas: TMenuItem;
    SubMenuMateriaPrimaSaldo: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuSAIRClick(Sender: TObject);
    procedure SubMenuMateriaPrimaCadastroClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MenuCalculadoraClick(Sender: TObject);
    procedure MenuVersaoClick(Sender: TObject);
    procedure SubMenuProdutoCadastroClick(Sender: TObject);
    procedure SubMenuMateriaPrimaEntradaClick(Sender: TObject);

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

uses UDMArtesanalis, DK_Procs1, SysConst, UFrmMateriaPrimaCadastro,
     UFrmProdutoCadastro, UFrmMovimentos;

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
  mgMemoForms:=TMemo.Create(Self);
  mgMemoForms.Visible:=False;
  mgMemoForms.Parent:=FrmArtesanalis;
  mgMemoForms.Width:=500;
  mgMemoForms.Lines.Clear;
end;

procedure TFrmArtesanalis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if mgMemoForms.Lines.Count>0 Then
  Begin
    MessageBox(Handle, pChar('Existe(m) Janela(s) Aberta(s):'+cr+cr+
                             mgMemoForms.Lines.Text+cr+cr+
                             'Antes de Encerrar Feche Todas Primeiro...'), 'ATENÇÃO !!', MB_ICONERROR);
    Action := caNone;
    Exit;
  End;

  FreeAndNil(mgMemoForms);

  DMArtesanalis.FechaTudo;

  Application.Terminate;
end;

procedure TFrmArtesanalis.MenuSAIRClick(Sender: TObject);
begin
  Close;
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

procedure TFrmArtesanalis.SubMenuProdutoCadastroClick(Sender: TObject);
begin
  DMArtesanalis.MemoAdicionaNomeForm('Cadastro de Produto');

  DMArtesanalis.CDS_ProdutoMatPrima.Open;

  FrmProdutoCadastro.Show;

end;

procedure TFrmArtesanalis.SubMenuMateriaPrimaEntradaClick(Sender: TObject);
begin
  DMArtesanalis.MemoAdicionaNomeForm('Movimentos de Entrada');

  FrmMovimentos.Gb_Principal.Caption:='Movimentos de ENTRADA';

  FrmMovimentos.Show;

end;

end.

