unit UArtesanalis;
{
- Cor Form/Painel Principal:  $00FFE4CA
- Cor Componete Desabilitado: clMoneyGreen

//==============================================================================
// ======== ALTERAÇÕES NOS DBGrid's = INICIO ====================================
//==============================================================================

  // Não Permite Excluir Registro Pelo Grid ====================================
  =============>>>> Dbg_MateriaPrimaKeyDown(
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

procedure TFrmMateriaPrimaCadastro.Dbg_MateriaPrimaEnter(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clMoneyGreen;
end;

procedure TFrmMateriaPrimaCadastro.Dbg_MateriaPrimaExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clWindow;
end;

//==============================================================================
// ======== ALTERAÇÕES NOS DBGrid's = FIM ======================================
//==============================================================================
}

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
  dxSkinsdxStatusBarPainter, dxStatusBar, Mask, ToolEdit, CurrEdit, Shellapi,
  ComObj, // Alterar Resolução do Video
  cxLocalization;

type
  TFrmArtesanalis = class(TForm)
    MainMenu1: TMainMenu;
    MenuCalculadora: TMenuItem;
    MenuVersao: TMenuItem;
    MenuSAIR: TMenuItem;
    CorCaptionForm: TJvGradientCaption;
    Trad_Localizer: TcxLocalizer;
    MenuResolucaoVideo: TMenuItem;
    SubMenuResolucaoMudar: TMenuItem;
    N1: TMenuItem;
    SubMenuResolucaoRetornar: TMenuItem;
    MenuCADASTROS: TMenuItem;
    SubMenuCadastroMateriasPrimas: TMenuItem;
    SubMenuCadastroPessoasEntidades: TMenuItem;
    SubMenuCadastroProdutos: TMenuItem;
    N2: TMenuItem;
    SubMenuCadastroDespesas: TMenuItem;
    N3: TMenuItem;
    MenuCOMPRAS: TMenuItem;
    MenuVendasPedidos: TMenuItem;
    SubMenuEntradasSaidasLancamentoNotas: TMenuItem;
    SubMenuVendasPedidosPedidosVenda: TMenuItem;
    SubMenuEntradasSaidasMateriasPrimas: TMenuItem;
    N4: TMenuItem;
    SubMenuEntradasSaidasOutrosInsumos: TMenuItem;
    MenuRELATORIOS: TMenuItem;
    Panel1: TPanel;
    Image1: TImage;
    SBt_Sair: TSpeedButton;
    MenuFINANCEIRO: TMenuItem;
    MenuFinanceiroComtasPagar: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuSAIRClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MenuCalculadoraClick(Sender: TObject);
    procedure MenuVersaoClick(Sender: TObject);
    procedure SubMenuResolucaoMudarClick(Sender: TObject);
    procedure SubMenuResolucaoRetornarClick(Sender: TObject);
    procedure SubMenuCadastroDespesasClick(Sender: TObject);
    procedure SubMenuEntradasSaidasOutrosInsumosClick(Sender: TObject);
    procedure MenuRELATORIOSClick(Sender: TObject);
    procedure SubMenuCadastroMateriasPrimasClick(Sender: TObject);
    procedure SubMenuCadastroProdutosClick(Sender: TObject);
    procedure SubMenuCadastroPessoasEntidadesClick(Sender: TObject);
    procedure SubMenuEntradasSaidasMateriasPrimasClick(Sender: TObject);
    procedure SubMenuVendasPedidosPedidosVendaClick(Sender: TObject);
    procedure SBt_SairClick(Sender: TObject);
    procedure MenuFinanceiroComtasPagarClick(Sender: TObject);

    // Odir ====================================================================

    // Odir ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmArtesanalis: TFrmArtesanalis;

  // Alterar Resolução do Video ///////////////////////////
  OldWidth, OldHeight : Integer;
  a, b: word;
  function TrocaResolucao(X, Y, a , b: word): Boolean;
  function VoltaResolucao(a , b: word): Boolean;
  ////////////////////////////////////////////////////////


implementation

uses UDMArtesanalis, DK_Procs1, SysConst, UFrmMateriaPrimaCadastro,
     UFrmProdutoCadastro, UFrmMovimentos, UFrmPessoaCadastro, UFrmPedidoVenda,
  UFrmRelatorios, UFrmContasPagar;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function TrocaResolucao(X, Y, a , b: word): Boolean;
var
  lpDevMode: TDeviceMode;
begin
  if EnumDisplaySettings(nil, 0, lpDevMode) then
  begin
    lpDevMode.dmFields := DM_PELSWIDTH Or DM_PELSHEIGHT;
    a:= lpDevMode.dmPelsWidth;  // pega a resolução atual (horizontal)
    b:= lpDevMode.dmPelsHeight; // pega a resolução atual  (vertical)
    lpDevMode.dmPelsWidth := x;  // altera a resolução para a que voce voce desejou
    lpDevMode.dmPelsHeight:= y;  // altera a resolução para a que voce voce desejou
    Result := ChangeDisplaySettings(lpDevMode, 0) = DISP_CHANGE_SUCCESSFUL;
  end;
end;

function VoltaResolucao(a , b: word): Boolean;
var
  lpDevMode: TDeviceMode;
begin
  Result:=False;
  if EnumDisplaySettings(nil, 0, lpDevMode) then
  begin
    lpDevMode.dmFields := DM_PELSWIDTH Or DM_PELSHEIGHT;
    lpDevMode.dmPelsWidth := a;  // ao fechar o programa recupera a resolução que vinha sendo usada
    lpDevMode.dmPelsHeight:= b;  // ao fechar o programa recupera a resolução que vinha sendo usada
    Result := ChangeDisplaySettings(lpDevMode, 0) = DISP_CHANGE_SUCCESSFUL;
  end;
end;

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmArtesanalis.FormShow(Sender: TObject);
begin
//  FrmArtesanalis.ClientHeight:=0;
//  FrmArtesanalis.Align:=alTop; // alNone;
//  FrmArtesanalis.Height:=64;
//  FrmArtesanalis.AutoSize:=True;

  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

end;

procedure TFrmArtesanalis.FormCreate(Sender: TObject);
begin

  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  // Tradução DevExpress =======================================================
  if FileExists(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'TradDevExpBr.ini') then {Verifica se existe o arquivo dentro da pasta}
  begin
    Trad_Localizer.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'TradDevExpBr.ini');
    Trad_Localizer.LanguageIndex := 1; {Muda o idioma / linguagem}
    Trad_Localizer.Active := TRUE;     {Ativa o componente / a tradução}
  end;

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

  If SubMenuResolucaoRetornar.Enabled Then
   VoltaResolucao(a , b);

  FreeAndNil(mgMemoForms);

  DMArtesanalis.FechaTudo;

  Application.Terminate;
end;

procedure TFrmArtesanalis.MenuSAIRClick(Sender: TObject);
begin
  Close;
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

procedure TFrmArtesanalis.SubMenuResolucaoMudarClick(Sender: TObject);
begin

  if mgMemoForms.Lines.Count>0 Then
  Begin
    MessageBox(Handle, pChar('Existe(m) Janela(s) Aberta(s):'+cr+cr+
                             mgMemoForms.Lines.Text+cr+cr+
                             'Antes da ALTERAÇÃO Feche Todas Primeiro...'), 'ATENÇÃO !!', MB_ICONERROR);
    Exit;
  End;

  If msg('Deseja Realmente Mudar a'+cr+' Resolução do Video ?','C')=2 Then
   Exit;

  TrocaResolucao(1024, 768, a , b);

  SubMenuResolucaoMudar.Enabled   :=False;
  SubMenuResolucaoRetornar.Enabled:=True;

end;

procedure TFrmArtesanalis.SubMenuResolucaoRetornarClick(Sender: TObject);
begin
  VoltaResolucao(a , b);

  SubMenuResolucaoMudar.Enabled   :=True;
  SubMenuResolucaoRetornar.Enabled:=False;

end;

procedure TFrmArtesanalis.SubMenuCadastroDespesasClick(Sender: TObject);
begin
  msg('Opção em Desenvolvimento !!','A');
  Exit;

end;

procedure TFrmArtesanalis.SubMenuEntradasSaidasOutrosInsumosClick(Sender: TObject);
begin
  msg('Opção em Desenvolvimento !!','A');
  Exit;

end;

procedure TFrmArtesanalis.MenuRELATORIOSClick(Sender: TObject);
begin

  FrmRelatorios:=TFrmRelatorios.Create(Self);
  FrmRelatorios.ShowModal;

  FreeAndNil(FrmRelatorios);

end;

procedure TFrmArtesanalis.SubMenuCadastroMateriasPrimasClick(Sender: TObject);
begin
  DMArtesanalis.MemoAdicionaNomeForm('Cadastro de Matéria-Prima');

  DMArtesanalis.CDS_MateriaPrima.Open;

  FrmMateriaPrimaCadastro.ShowModal;

end;

procedure TFrmArtesanalis.SubMenuCadastroProdutosClick(Sender: TObject);
begin
  DMArtesanalis.MemoAdicionaNomeForm('Cadastro de Produto');

  DMArtesanalis.CDS_ProdutoMatPrima.Open;

  FrmProdutoCadastro.ShowModal;
end;

procedure TFrmArtesanalis.SubMenuCadastroPessoasEntidadesClick(Sender: TObject);
begin
  DMArtesanalis.MemoAdicionaNomeForm('Cadastro - PESSOAS');

  FrmCadastroPessoa.sgTipoPessoa:='';
  FrmCadastroPessoa.ShowModal;

end;

procedure TFrmArtesanalis.SubMenuEntradasSaidasMateriasPrimasClick(Sender: TObject);
begin
  DMArtesanalis.MemoAdicionaNomeForm('MATÉRIA-PRIMA - Movimentações');

  FrmMovimentos.Gb_Principal.Caption:=' MATÉRIA-PRIMA - Movimentações ';

  FrmMovimentos.CBx_TipoDocto.Items.Clear;
  FrmMovimentos.CBx_TipoDocto.Items.Add('Documento   de Entrada');
  FrmMovimentos.CBx_TipoDocto.Items.Add('Documento   de Saída');
  FrmMovimentos.CBx_TipoDocto.Items.Add('Devolução   de Entrada');
  FrmMovimentos.CBx_TipoDocto.Items.Add('Devolução   de Saída');
  FrmMovimentos.CBx_TipoDocto.Items.Add('Bonificação de Entrada');
  FrmMovimentos.CBx_TipoDocto.Items.Add('Bonificação de Saída');
  FrmMovimentos.CBx_TipoDocto.ItemIndex:=-1;

  FrmMovimentos.sgOrigem:='M'; // Materia-Prima
  FrmMovimentos.ShowModal;
end;

procedure TFrmArtesanalis.SubMenuVendasPedidosPedidosVendaClick(Sender: TObject);
begin
  DMArtesanalis.MemoAdicionaNomeForm('PRODUTO - Pedido de Vendas');

  FrmPedidoVenda.sgOrigem:='P'; // Pedido de Venda
  FrmPedidoVenda.ShowModal;
end;

procedure TFrmArtesanalis.SBt_SairClick(Sender: TObject);
begin
  MenuSAIRClick(Self);
end;

procedure TFrmArtesanalis.MenuFinanceiroComtasPagarClick(Sender: TObject);
begin

  DMArtesanalis.MemoAdicionaNomeForm('FINANCEIRO - Contas a Pagar - Lançamentos');

  FrmContasPagar:=TFrmContasPagar.Create(Self);
  FrmContasPagar.Caption:='FINANCEIRO - Contas a Pagar - Lançamentos';
  FrmContasPagar.ShowModal;

  FreeAndNil(FrmContasPagar);

end;

end.



