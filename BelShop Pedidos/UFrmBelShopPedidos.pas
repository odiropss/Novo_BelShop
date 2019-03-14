{
-- Instalador em:
        - C:\Program Files (x86)\Inno Setup 5\Compil32.exe"
Pasta para Instalação em:
        - C:\SolicitacaoTransferencias\
}

unit UFrmBelShopPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, StdCtrls, ExtCtrls, Grids, DBGrids,
  DBGridJul, AppEvnts, JvExControls, JvXPCore, JvXPButtons, Mask, ToolEdit,
  CurrEdit, DBXpress, ComCtrls, Commctrl, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Shellapi, DB,
  jpeg, RelVisual, cxLocalization, Menus, Buttons, dxGDIPlusClasses,
  JvExStdCtrls, JvBehaviorLabel, JvSpeedButton, DBClient, SqlExpr;

type
  TFrmBelShopPedidos = class(TForm)
    Pan_Loja: TPanel;
    ApplicationEvents1: TApplicationEvents;
    PC_Principal: TPageControl;
    Ts_SolicitacaoProdutos: TTabSheet;
    Ts_SolicitacaoConsulta: TTabSheet;
    Ts_NFeCheckOut: TTabSheet;
    Dbg_NFeProdutosOC: TDBGrid;
    Panel7: TPanel;
    Gb_NFe_Solicitacoes: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdtNFeCodFornLinx: TCurrencyEdit;
    EdtNFeDesFornLinx: TEdit;
    Bt_NFeBuscaFornLinx: TJvXPButton;
    EdtNFeNumNFe: TCurrencyEdit;
    EdtNFeNumOC: TCurrencyEdit;
    Bt_NFeBuscaOC: TJvXPButton;
    Bt_NFeEscanear: TJvXPButton;
    Lbx_NFeNumOCs: TListBox;
    dxStatusBar2: TdxStatusBar;
    dxStatusBar3: TdxStatusBar;
    Ts_ProdNegativos: TTabSheet;
    Gb_ProdNegativos: TGroupBox;
    Dbg_ProdNegativos: TDBGrid;
    Pan_ProdNegativos: TPanel;
    Bt_ProdNegativosBusca: TJvXPButton;
    Bt_ProdNegativosMemoria: TJvXPButton;
    OdirPanApres: TPanel;
    EdtVersao: TJvBehaviorLabel;
    Image1: TImage;
    Mem_Odir: TMemo;
    SBt_Sair: TSpeedButton;
    MainMenu1: TMainMenu;
    MenuCentroDistribuicao: TMenuItem;
    SubMenuCD_SolicitacaoReposicao: TMenuItem;
    N13: TMenuItem;
    SubMenuCD_VerificarProdutosSolicitados: TMenuItem;
    N17: TMenuItem;
    SubMenuCD_ProdutosSaldoNegativo: TMenuItem;
    MenuEntradaNotas: TMenuItem;
    SubMenuEN_CheckOutNFeEntrada: TMenuItem;
    MenuCalculadora: TMenuItem;
    MenuVersao: TMenuItem;
    MenuSAIR: TMenuItem;
    Trad_Localizer: TcxLocalizer;
    CorCaptionForm: TJvGradientCaption;
    SBt_Voltar: TJvSpeedButton;
    N7: TMenuItem;
    Pan_SolicitacaoProdutos: TPanel;
    Gb_Solicitacao: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Lab_Unidade: TLabel;
    EdtQtdTransf: TCurrencyEdit;
    Bt_Incluir: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    EdtQtdEstoque: TCurrencyEdit;
    Gb_Produto: TGroupBox;
    Label5: TLabel;
    Lab_UnidadeCD: TLabel;
    EdtCodProdLinx: TCurrencyEdit;
    Bt_BuscaProdtudo: TJvXPButton;
    EdtDescProduto: TEdit;
    EdtQtdEstoqueCD: TCurrencyEdit;
    Dbg_Produtos: TDBGridJul;
    Stb_ParamTransf: TdxStatusBar;
    Dbg_VerificaProdutos: TDBGridJul;
    Dbg_VerificaProdutosOBS: TDBGridJul;
    dxStatusBar1: TdxStatusBar;
    Pan_SolicitacaoConsulta: TPanel;
    Gb_Verifica: TGroupBox;
    Label75: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DtEdt_DtaInicio: TcxDateEdit;
    DtEdt_DtaFim: TcxDateEdit;
    Bt_Verificar: TJvXPButton;
    MenuPedidosCentralCompras: TMenuItem;
    SubMenuPCC_PedidoCompras: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_ProdutosEnter(Sender: TObject);
    procedure EdtCodProdLinxExit(Sender: TObject);
    procedure EdtCodProdLinxChange(Sender: TObject);
    procedure Bt_BuscaProdtudoClick(Sender: TObject);
    procedure PC_PrincipalChange(Sender: TObject);

    // ODIR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    // Hint em Fortma de Balão =================================================
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl);

    // Controle de TabSheet ====================================================
    Procedure SelecionaTabSheet(ts:TTabSheet); // Abre TabSheet Principal
    Procedure AbreFechaTabSheet(bFechar, bMenu: Boolean);
    Procedure LiberaMenu(b: Boolean);
    Procedure LiberaSubMenu(bLibera: Boolean = True);
    Function  MandaFechar: Boolean; // Verifica se Existe TabSheet em Aberto

    // Fecha Tudo no DataModule ================================================
    Procedure FechaTudo;

    // Solicitação de Transferencias ===========================================
    Function  CriaLimitesLoja: Boolean;
    Procedure LimpaEdts;

    // Verifica Versão do Sistema ==============================================
    Function  NovaVersao: Boolean;

    // CheckOut NFe Entrada ==================================================== 
    Procedure CheckOutBuscaOC;
    Procedure CheckOutRetiraQtdCheckout;
    Procedure CheckOutRelatorio;

    // ODIR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_IncluirClick(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
    procedure Dbg_ProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQtdTransfExit(Sender: TObject);
    procedure Dbg_VerificaProdutosEnter(Sender: TObject);
    procedure Bt_VerificarClick(Sender: TObject);
    procedure Dbg_VerificaProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_VerificaProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtNFeCodFornLinxExit(Sender: TObject);
    procedure Bt_NFeBuscaFornLinxClick(Sender: TObject);
    procedure Bt_NFeBuscaOCClick(Sender: TObject);
    procedure EdtNFeNumNFeChange(Sender: TObject);
    procedure EdtNFeNumOCExit(Sender: TObject);
    procedure EdtNFeCodFornLinxChange(Sender: TObject);
    procedure Bt_NFeEscanearClick(Sender: TObject);
    procedure Lbx_NFeNumOCsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtNFeCodFornLinxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtNFeNumOCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_NFeProdutosOCDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure EdtNFeNumNFeExit(Sender: TObject);
    procedure Dbg_NFeProdutosOCEnter(Sender: TObject);
    procedure Dbg_NFeProdutosOCTitleClick(Column: TColumn);
    procedure Bt_ProdNegativosBuscaClick(Sender: TObject);
    procedure Bt_ProdNegativosMemoriaClick(Sender: TObject);
    procedure MenuVersaoClick(Sender: TObject);
    procedure EdtVersaoStop(Sender: TObject);
    procedure SubMenuCD_SairClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure SBt_VoltarClick(Sender: TObject);
    procedure SubMenuCD_SolicitacaoReposicaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SubMenuCD_VerificarProdutosSolicitadosClick(Sender: TObject);
    procedure SubMenuCD_ProdutosSaldoNegativoClick(Sender: TObject);
    procedure SubMenuEN_CheckOutNFeEntradaClick(Sender: TObject);
    procedure SubMenuPCC_PedidoComprasClick(Sender: TObject); // Posiciona no Componente

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  // Show Hint em Forma de Balão
  TTS_BALLOON = $40;
  TTM_SETTITLE = (WM_USER + 32);
  //////////////////////////////

var
  FrmBelShopPedidos: TFrmBelShopPedidos;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;

  bEnterTab: Boolean;

  sgNumSolicitacao,
  sgCodProdLinx, sgCodProdSidicom
  : String;

//  sgCodLojaVersaoOK: String;

  igNumMaxProd, igQtdMaxProd: Integer;

  sgNrOCNova, sgNumSeqOCNova: String;

implementation

uses DK_Procs1, UPesquisa, UFrmLeitoraCodBarras, UDMBelShopPedidos;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBelShopPedidos.FechaTudo;
Var
  i: Integer;
Begin

  // Fecha Componentes DMBelShop ===============================================
  For i:=0 to DMBelShopPedidos.ComponentCount-1 do
  Begin
    If DMBelShopPedidos.Components[i] is TClientDataSet Then
     If (DMBelShopPedidos.Components[i] as TClientDataSet).Active Then
     (DMBelShopPedidos.Components[i] as TClientDataSet).Close;

    If DMBelShopPedidos.Components[i] is TSQLQuery Then
     If (DMBelShopPedidos.Components[i] as TSQLQuery).Active Then
     (DMBelShopPedidos.Components[i] as TSQLQuery).Close;
  End;

//  // Fecha Componentes UDMVirtual ==============================================
//  For i:=0 to DMVirtual.ComponentCount-1 do
//  Begin
//    If DMVirtual.Components[i] is TClientDataSet Then
//     If (DMVirtual.Components[i] as TClientDataSet).Name<>'CDS_V_EmpConexoes' Then
//      If (DMVirtual.Components[i] as TClientDataSet).Active Then
//       (DMVirtual.Components[i] as TClientDataSet).Close;
//
//    If DMVirtual.Components[i] is TIBQuery Then
//     If (DMVirtual.Components[i] as TIBQuery).Active Then
//     (DMVirtual.Components[i] as TIBQuery).Close;
//  End;

//  // Fecha Series dos Graficos =================================================
//  FechaSeriesGraficos;
//
//  DbGrafico_FinanObjetivosGrafico.SeriesList.Clear;

end; // Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Libera Opções de Menu >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBelShopPedidos.LiberaMenu(b: Boolean);
Begin
  MenuCentroDistribuicao.Enabled:=b;
  MenuEntradaNotas.Enabled:=b;
End; // Libera Opções de Menu >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Libera Opções de SubMenu >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBelShopPedidos.LiberaSubMenu(bLibera: Boolean = True);
Var
 mPos: integer;
Begin
  mpos := 0;
  While mpos <= FrmBelShopPedidos.ComponentCount-1 Do
  Begin
    If FrmBelShopPedidos.Components[mpos] is TMenuItem then
    Begin
      (FrmBelShopPedidos.Components[mpos] as TMenuItem).Enabled:=True;

      //========================================================================
      // DESABILITADO para o CD ================================================
      //========================================================================
      // MENU: CENTRO DE DISTRIBUIÇÃO
      // If ((FrmBelShopPedidos.Components[mpos] as TMenuItem).Name='MenuCentroDistribuicao') And (sgLojaLinx='2') Then
      //  (FrmBelShopPedidos.Components[mpos] as TMenuItem).Visible:=False;

      If ((FrmBelShopPedidos.Components[mpos] as TMenuItem).Name='SubMenuCD_SolicitacaoReposicao') And (sgLojaLinx='2') Then
       (FrmBelShopPedidos.Components[mpos] as TMenuItem).Visible:=False;

      If ((FrmBelShopPedidos.Components[mpos] as TMenuItem).Name='SubMenuCD_VerificarProdutosSolicitados') And (sgLojaLinx='2') Then
       (FrmBelShopPedidos.Components[mpos] as TMenuItem).Visible:=False;

      // If ((FrmBelShopPedidos.Components[mpos] as TMenuItem).Name='SubMenuCD_ProdutosSaldoNegativo') And (sgLojaLinx='2') Then
      //  (FrmBelShopPedidos.Components[mpos] as TMenuItem).Enabled:=False;

      // DESABILITADO para o CD ================================================
      //========================================================================

      //========================================================================
      // DASABILIDADO para Todas as Lojas ======================================
      //========================================================================
      // MENU: ENTRADA DE NOTAS -------------------------------------
      If ((FrmBelShopPedidos.Components[mpos] as TMenuItem).Name='MenuEntradaNotas') And (sgLojaLinx<>'2') Then
       (FrmBelShopPedidos.Components[mpos] as TMenuItem).Visible:=False;

      If ((FrmBelShopPedidos.Components[mpos] as TMenuItem).Name='SubMenuEN_CheckOutNFeEntrada') And (sgLojaLinx<>'2') Then
       (FrmBelShopPedidos.Components[mpos] as TMenuItem).Visible:=False;
      // DASABILIDADO para Todas as Lojas ======================================
      //========================================================================

      //========================================================================
      // DASABILIDADO para Toda a Empresa ======================================
      //========================================================================
      // MENU: PEDIDOS CENTRAL DE COMPRAS ---------------------------
      If ((FrmBelShopPedidos.Components[mpos] as TMenuItem).Name='MenuPedidosCentralCompras') Then
       (FrmBelShopPedidos.Components[mpos] as TMenuItem).Visible:=False;

      If ((FrmBelShopPedidos.Components[mpos] as TMenuItem).Name='SubMenuPCC_PedidoCompras') Then
       (FrmBelShopPedidos.Components[mpos] as TMenuItem).Visible:=False;
      // Desabilitado para Todas as Lojas ======================================
      //========================================================================

      {
      mtag   := TMenuItem(Form.Components[mpos]).Tag;
      mHelpC := TMenuItem(Form.Components[mpos]).HelpContext;

      If bAdmin Then
       Begin
         TMenuItem(Form.Components[mpos]).Visible := True;
       End
      Else // If bAdmin Then
       Begin
         If mtag > 0 Then
         Begin
            If CDS_Seguranca.Locate('TAG',mtag,[loCaseInsensitive]) Then
             Begin
               TMenuItem(Form.Components[mpos]).Visible := TMenuItem(Form.Components[mpos]).Enabled;
             End
            Else If mHelpC=3 Then
             Begin
               MySql:=' Select s.Tag'+
                      ' From seguranca s'+
                      ' Where s.usuario='+QuotedStr(sUsuario)+
                      ' and s.tag like '+QuotedStr('%'+IntToStr(mtag)+'%');
               SDS_Busca.Close;
               SDS_Busca.CommandText:=MySql;
               SDS_Busca.Open;

               If Trim(SDS_Busca.FieldByName('Tag').AsString)<>'' Then
                TMenuItem(Form.Components[mpos]).Visible := TMenuItem(Form.Components[mpos]).Enabled
               Else
                TMenuItem(Form.Components[mpos]).Visible := False;

               SDS_Busca.Close;

             End
            Else
             Begin
               TMenuItem(Form.Components[mpos]).Visible := False;
             End; // If CDS_Seguranca.Locate('TAG',mtag,[loCaseInsensitive]) Then
         End; // If mtag > 0 Then
       End; //If bAdmin Then
    }
    End; // If FrmBelShopPedidos.Components[mpos] is TMenuItem then

    Inc(mpos);
  End; // While mpos <= FrmBelShopPedidos.ComponentCount-1 Do

End; // Libera Opções de SubMenu >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Controle TabSheet's e Menu >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBelShopPedidos.AbreFechaTabSheet(bFechar, bMenu: Boolean);
Var
  i: Integer;
Begin

  For i:=0 to ComponentCount-1 do
  Begin
    If Components[i] is TTabSheet Then
    Begin
      If (Components[i] as TTabSheet).Tag>99 Then // Somente TabSheet Principal
      Begin
        If (Components[i] as TTabSheet).TabVisible Then
        Begin
          (Components[i] as TTabSheet).TabVisible:=bFechar;
          (Components[i] as TTabSheet).Highlighted:=False;
          Refresh;
        End; // If (Components[i] as TTabSheet).TabVisible Then
      End; // If (Components[i] as TTabSheet).Tag>99 Then // Somente TabSheet Principal
    End; // If Components[i] is TTabSheet Then
  End; // For i:=0 to ComponentCount-1 do

  For i:=0 to MainMenu1.Items.Count-1 do
  Begin
    If (MainMenu1.Items.Items[i].Name<>'MenuVersao') and
       (MainMenu1.Items.Items[i].Name<>'MenuCalculadora') Then
     MainMenu1.Items.Items[i].Enabled:=bMenu
  End; // For i:=0 to MainMenu1.Items.Count-1 do

  If PC_Principal.Visible Then
  Begin
    Try
      PC_Principal.Visible:=False;
    Except
    End;
  End;

  SBt_Voltar.Visible:=PC_Principal.Visible;
end; // Controle TabSheet's e Menu >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Abre Determinada TabSheet >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBelShopPedidos.SelecionaTabSheet(ts:TTabSheet);
Var
  i: Integer;
Begin
  bEnterTab:=True;

  For i:=0 to ComponentCount-1 do
  Begin
    If Components[i] is TTabSheet Then
    Begin
      If (Components[i] as TTabSheet).Tag>99 Then // Somente TabSheet Principal
      Begin
        If (Components[i] as TTabSheet).Name=ts.Name Then
         Begin
           (Components[i] as TTabSheet).TabVisible:=True;
           ts.Refresh;
         End
        Else
         Begin
           (Components[i] as TTabSheet).TabVisible:=False;
         End;
      End;
    End;
  End;

  For i:=0 to MainMenu1.Items.Count-1 do
  Begin
    If (MainMenu1.Items.Items[i].Name<>'MenuVersao') and
       (MainMenu1.Items.Items[i].Name<>'MenuCalculadora') Then
     MainMenu1.Items.Items[i].Enabled:=False;
  End;

  If Not PC_Principal.Visible Then
   PC_Principal.Visible:=True;

  SBt_Voltar.Visible:=PC_Principal.Visible;

  PC_PrincipalChange(Self);
  
  Refresh;
End; // Abre Determinada TabSheet >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manda Fechar TabSheet Aberta >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmBelShopPedidos.MandaFechar: Boolean;
Var
  i: Integer;
Begin
  Result:=True;
  For i:=0 to ComponentCount-1 do
  Begin
    If (Components[i] is TTabSheet) and ((Components[i] as TTabSheet).Tag>99) Then
    Begin
      If (Components[i] as TTabSheet).TabVisible=True Then
      Begin
        msg('Favor Fechar o Módulo '+cr+cr+(Components[i] as TTabSheet).Caption+cr+cr+
            'Tecle em <Voltar ao Menu> !!','A');
        Result:=False;
      End;
    End;
  End;
End; // Manda Fechar TabSheet Aberta >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// CHECKOUT NFeE - Emissão do Relatório >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBelShopPedidos.CheckOutRelatorio;
Var
  MySql: String;
  sNotas: String;
Begin
  // Burca Produtos Checados ===================================================
  MySql:=' SELECT DISTINCT'+
         ' oc.num_oc,'+
         ' oi.cod_produto_linx, oi.cod_produto_sidi,'+

         ' CASE'+
         '   WHEN TRIM(COALESCE(ps.referencia,''''))<>'''' THEN'+
         '     TRIM(ps.referencia)'+
         '   ELSE'+
         '     TRIM(pl.referencia)'+
         ' END REFERENCIA,'+

         ' oi.des_produto,'+
         ' oi.qtd_checkout,'+
         ' TRIM(COALESCE(en.zonaendereco,0))||''.''||COALESCE(en.corredor,''000'')||''.''||'+
         '      COALESCE(en.prateleira,''000'')||''.''||COALESCE(en.gaveta,''0000'') ENDERECO'+

         ' FROM OC_LOJAS_ITENS oi'+
         '     LEFT JOIN OC_LOJAS_NFE oc        ON oc.num_seq_oc=oi.num_seq_oc'+
         '     LEFT JOIN LINXPRODUTOS pl        ON pl.cod_produto=oi.cod_produto_linx'+
         '     LEFT JOIN PRODUTO ps             ON ps.codproduto=oi.cod_produto_sidi'+
         '     LEFT JOIN ESTOQUE en             ON en.codproduto=oi.cod_produto_sidi'+
         '                                     AND en.codfilial='+sgLojaSidicom+

         ' WHERE oc.cod_loja_linx='+sgLojaLinx+
         ' AND   oi.num_seq_oc in ('+sgNrsSeqOCs+')'+
         ' AND   oi.qtd_checkout>0'+

         ' ORDER BY oi.des_produto';
  DMBelShopPedidos.CDS_Relatorio.Close;
  DMBelShopPedidos.SQLQ_Relatorio.Close;
  DMBelShopPedidos.SQLQ_Relatorio.SQL.Clear;
  DMBelShopPedidos.SQLQ_Relatorio.SQL.Add(MySql);
  DMBelShopPedidos.CDS_Relatorio.Open;

  If Not DMBelShopPedidos.CDS_Relatorio.IsEmpty Then
   Begin
     // Notas Fiscais Envolvidas nas OCs =======================================
     MySql:=' SELECT DISTINCT nf.num_nfe'+
            ' FROM OC_LOJAS_ITENS_NFE nf'+
            ' WHERE nf.num_seq_oc in ('+sgNrsSeqOCs+')';
     DMBelShopPedidos.CDS_BuscaRapida.Close;
     DMBelShopPedidos.SQLQ_BuscaRapida.Close;
     DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
     DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
     DMBelShopPedidos.CDS_BuscaRapida.Open;
     sNotas:='';
     While Not DMBelShopPedidos.CDS_BuscaRapida.Eof do
     Begin
       If Trim(sNotas)='' Then
        sNotas:=DMBelShopPedidos.CDS_BuscaRapida.FieldByName('num_nfe').AsString
       Else
        sNotas:=sNotas+', '+DMBelShopPedidos.CDS_BuscaRapida.FieldByName('num_nfe').AsString;

       DMBelShopPedidos.CDS_BuscaRapida.Next;
     End; // While Not DMBelShopPedidos.CDS_BuscaRapida.Eof do
     DMBelShopPedidos.CDS_BuscaRapida.Close;

     // Imprime Relatório ======================================================
     With DMBelShopPedidos.RelVisual do
     Begin
       ClientDataSet:=DMBelShopPedidos.CDS_Relatorio;
       Destino:=toVisualiza;
       Orientacao:=toRetrato;

       RodapeGrupo:=True;

       TextoRodape:='';
       TextoRodapeGrupo:='';
       Zoom:=140;

       ImprimirTarjaCinza:=False;
       ImprimirVisto:=False;

       Cabecalho1Esquerda:=sgNomeLoja;
       Cabecalho1Direita:='#Data';
       Cabecalho1Centro:='RELATÓRIO DE ENTRADA DE PRODUTOS';

       Cabecalho2Esquerda:='Fornecedor: '+EdtNFeCodFornLinx.Text+' - '+EdtNFeDesFornLinx.Text;
       Cabecalho2Direita:=EmptyStr;
       Cabecalho2Centro:=EmptyStr;

       Cabecalho3Esquerda:='Nº OC(s): '+sgNrsOCs;
       Cabecalho3Direita:='Nº NFeE(s): '+sNotas;
       Cabecalho3Centro:=EmptyStr;

       DefinicaoCampos.Clear;
       DefinicaoCampos.Add('D0;12;D;;NUM_OC;Nº OC');
       DefinicaoCampos.Add('D0;14;D;;COD_PRODUTO_SIDI;Cod Sidi');
       DefinicaoCampos.Add('D0;14;D;;COD_PRODUTO_LINX;Cod Linx');
       DefinicaoCampos.Add('D0;100;E;;DES_PRODUTO;Nome Produto');
       DefinicaoCampos.Add('D0;24;D;;QTD_CHECKOUT;Qtd CheckOut');
       DefinicaoCampos.Add('D0;26;C;;ENDERECO;Endereçamento');
       DefinicaoCampos.Add('D0;48;E;;REFERENCIA;Referência');

       Execute;
      End; // With DMRelatorio.RelVisual do
   End
  Else // If Not DMBelShopPedidos.CDS_Relatorio.IsEmpty Then
   Begin
     msg('Sem Produto com'+cr+cr+'CheckOut Efetuado !!','A');
   End; // If Not DMBelShopPedidos.CDS_Relatorio.IsEmpty Then
  DMBelShopPedidos.CDS_Relatorio.Close;
End; // CHECKOUT NFeE - Emissão do Relatório >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// CHECKOUT NFeE - Retira Quantidade de CheckOut na Nota Fiscal >>>>>>>>>>>>>>>>
Procedure TFrmBelShopPedidos.CheckOutRetiraQtdCheckout;
Var
  MySql: String;
  iRecNo: Integer;
Begin
  iRecNo:=DMBelShopPedidos.CDS_OCItensCheck.RecNo;

  // Verifia se Existe Lançamento da Nota Fiscal ===============================
  MySql:=' SELECT nf.num_seq_oc, nf.num_seq_item, nf.num_nfe,'+
         '        sum(nf.qtd_checkout) qtd_checkout'+
         ' FROM OC_LOJAS_ITENS_NFE nf'+
         ' WHERE nf.num_seq_oc='+DMBelShopPedidos.CDS_OCItensCheckNUM_SEQ_OC.AsString+
         ' AND nf.num_seq_item='+DMBelShopPedidos.CDS_OCItensCheckNUM_SEQ_ITEM.AsString+
         ' AND nf.num_nfe='+IntToStr(EdtNFeNumNFe.AsInteger)+
         ' GROUP BY 1,2,3';
  DMBelShopPedidos.CDS_BuscaRapida.Close;
  DMBelShopPedidos.SQLQ_BuscaRapida.Close;
  DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
  DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMBelShopPedidos.CDS_BuscaRapida.Open;                        

  If Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Num_Seq_Oc').AsString)<>'' Then
   Begin
     OdirPanApres.Caption:='AGUARDE !! Retirando CheCkOut Efetuada Nesta Nota...';
     OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
     OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShopPedidos.Width-OdirPanApres.Width)/2));
     OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShopPedidos.Height-OdirPanApres.Height)/2))-20;
     OdirPanApres.Font.Style:=[fsBold];
     OdirPanApres.Parent:=FrmBelShopPedidos;
     OdirPanApres.BringToFront();
     OdirPanApres.Visible:=True;
     Refresh;

     // Verifica se Transação esta Ativa
     If DMBelShopPedidos.SQLC.InTransaction Then
      DMBelShopPedidos.SQLC.Rollback(TD);

     // Monta Transacao ========================================================
     TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
     TD.IsolationLevel:=xilREADCOMMITTED;
     DMBelShopPedidos.SQLC.StartTransaction(TD);
     Try // Try da Transação
       Screen.Cursor:=crAppStart;
       DateSeparator:='.';
       DecimalSeparator:='.';

       // Atualiza Produto =====================================================
       MySql:=' UPDATE OC_LOJAS_ITENS io'+
              ' SET  io.qtd_checkout=qtd_checkout-'+IntToStr(
              DMBelShopPedidos.CDS_BuscaRapida.FieldByName('qtd_checkout').AsInteger);

              If DMBelShopPedidos.CDS_BuscaRapida.FieldByName('qtd_checkout').AsInteger=DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
               Begin
                 MySql:=
                  MySql+', io.dta_checkout=NULL'+
                        ', io.hra_checkout=NULL'
               End
              Else
               Begin
                 MySql:=
                  MySql+', io.dta_checkout=CURRENT_DATE'+
                        ', io.hra_checkout=CURRENT_TIME'
               End; // If DMBelShopPedidos.CDS_BuscaRapida.FieldByName('qtd_checkout').AsInteger=DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

       MySql:=
        MySql+' WHERE io.num_seq_oc='+DMBelShopPedidos.CDS_OCItensCheckNUM_SEQ_OC.AsString+
              ' AND   io.num_seq_item='+DMBelShopPedidos.CDS_OCItensCheckNUM_SEQ_ITEM.AsString;
       DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

       // Retira Controle de Checkou da NFe ====================================
       MySql:=' DELETE FROM OC_LOJAS_ITENS_NFE nf'+
              ' WHERE nf.num_seq_oc='+DMBelShopPedidos.CDS_OCItensCheckNUM_SEQ_OC.AsString+
              ' AND nf.num_seq_item='+DMBelShopPedidos.CDS_OCItensCheckNUM_SEQ_ITEM.AsString+
              ' AND nf.num_nfe='+IntToStr(EdtNFeNumNFe.AsInteger);
       DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

       // Atualiza Transacao ===================================================
       DMBelShopPedidos.SQLC.Commit(TD);
     Except // Except da Transação
       on e : Exception do
       Begin
         // Abandona Transacao =================================================
         DMBelShopPedidos.SQLC.Rollback(TD);

          MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        End; // on e : Exception do
      End; // Try da Transação
      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
      OdirPanApres.Visible:=False;
   End
  Else // If Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Num_Seq_Oc').AsString)<>'' Then
   Begin
     msg('Quantidade de ChekOut'+cr+'Não Efetuada por Esta Nota !!','A')
   End; // If Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Num_Seq_Oc').AsString)<>'' Then
  DMBelShopPedidos.CDS_BuscaRapida.Close;

  // Reabre Client dos Produtos da OC ==========================================
  DMBelShopPedidos.CDS_OCItensCheck.DisableControls;
  DMBelShopPedidos.CDS_OCItensCheck.Close;
  DMBelShopPedidos.CDS_OCItensCheck.Open;

  DMBelShopPedidos.CDS_OCItensCheck.EnableControls;

  // Posiciona no Produto ======================================================
  DMBelShopPedidos.CDS_OCItensCheck.RecNo:=iRecNo;

End; // CHECKOUT NFeE - Retira Quantidade de CheckOut na Nota Fiscal >>>>>>>>>>>

// CHECKOUT NFeE - Busca Ordens de Compra para CheckOut >>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBelShopPedidos.CheckOutBuscaOC;
Var
  MySql: String;
  i: Integer;
Begin
  DMBelShopPedidos.CDS_OCItensCheck.Close;

  sgNrsOCs:='';
  sgNrsSeqOCs:='';

  For i:=0 to Lbx_NFeNumOCs.Items.Count-1 do
  Begin
    If sgNrsOCs='' Then
     sgNrsOCs:=Lbx_NFeNumOCs.Items[i]
    Else
     sgNrsOCs:=sgNrsOCs+', '+Lbx_NFeNumOCs.Items[i];
  End; // For i:=0 to Lbx_NFeNumOCs.Items.Count-1 do

  If Trim(sgNrsOCs)='' Then
   Exit;

  // Busca Num_Seq_NFe da OCs ==================================================
  MySql:=' SELECT DISTINCT o.num_seq_oc'+
         ' FROM OC_LOJAS_NFE o'+
         ' WHERE o.cod_loja_linx='+sgLojaLinx+
         ' AND   o.num_oc IN ('+sgNrsOCs+')';
  DMBelShopPedidos.SQLQuery2.Close;
  DMBelShopPedidos.SQLQuery2.SQL.Clear;
  DMBelShopPedidos.SQLQuery2.SQL.Add(MySql);
  DMBelShopPedidos.SQLQuery2.Open;
  While Not DMBelShopPedidos.SQLQuery2.Eof do
  Begin
    If sgNrsSeqOCs='' Then
     sgNrsSeqOCs:=DMBelShopPedidos.SQLQuery2.FieldByName('num_seq_oc').AsString
    Else
     sgNrsSeqOCs:=sgNrsSeqOCs+', '+DMBelShopPedidos.SQLQuery2.FieldByName('num_seq_oc').AsString;

    DMBelShopPedidos.SQLQuery2.Next;
  End; // While Not DMBelShopPedidos.SQLQuery2.Eof do
  DMBelShopPedidos.SQLQuery2.Close;

  // Itens das OCs =============================================================
  MySql:=' SELECT DISTINCT'+
         ' oi.num_seq_oc, oi.num_seq_item, oc.num_oc,'+
         ' oi.cod_produto_linx, oi.cod_produto_sidi,'+

         ' TRIM(pl.referencia) REFERENCIA,'+

         ' oi.des_produto,'+
         ' oi.qtd_produto, oi.qtd_checkout,'+
         ' pl.cod_barra,'+
         ' TRIM(COALESCE(en.zonaendereco,0))||''.''||COALESCE(en.corredor,''000'')||''.''||'+
         '      COALESCE(en.prateleira,''000'')||''.''||COALESCE(en.gaveta,''0000'') ENDERECO,'+

         ' CASE'+
         '   WHEN ni.ind_oc IS NULL THEN'+
         '     ''S'''+
         '   ELSE'+
         '     ni.ind_oc'+
         ' END IND_OC,'+
         ' oi.dta_checkout, oi.hra_checkout'+

         ' FROM OC_LOJAS_ITENS oi'+
         '     LEFT JOIN OC_LOJAS_NFE oc        ON oc.num_seq_oc=oi.num_seq_oc'+
         '     LEFT JOIN OC_LOJAS_ITENS_NFE ni  ON ni.num_seq_oc=oi.num_seq_oc'+
         '                                     AND ni.num_seq_item=oi.num_seq_item'+
         '     LEFT JOIN LINXPRODUTOS pl        ON pl.cod_produto=oi.cod_produto_linx'+
         '     LEFT JOIN ESTOQUE en             ON en.codproduto=oi.cod_produto_sidi'+
         '                                     AND en.codfilial=oc.cod_loja_sidi'+

         ' WHERE oc.cod_loja_linx='+sgLojaLinx+
         ' AND   oi.num_seq_oc in ('+sgNrsSeqOCs+')'+
         ' ORDER BY oi.des_produto';
  DMBelShopPedidos.CDS_OCItensCheck.DisableControls;
  DMBelShopPedidos.CDS_OCItensCheck.Close;
  DMBelShopPedidos.CDS_OCItensCheck.Filtered:=False;
  DMBelShopPedidos.CDS_OCItensCheck.Filter:='';
  DMBelShopPedidos.SQLQ_OCItensCheck.SQL.Clear;
  DMBelShopPedidos.SQLQ_OCItensCheck.SQL.Add(MySql);
  DMBelShopPedidos.CDS_OCItensCheck.Open;

  DMBelShopPedidos.CDS_OCItensCheck.EnableControls;
End; // CHECKOUT NFeE - Busca Ordens de Compra para CheckOut >>>>>>>>>>>>>>>>>>>

// Atualiza Nova Versão do Sistema >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmBelShopPedidos.NovaVersao:Boolean;
Var
  MySql: String;

  sDtaAplicativo, sDtaVersao: String;
Begin
  Result:=True;

  sDtaAplicativo:=Copy(DateTimeToStr(FileDateToDateTime(
                       FileAge(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+
                       ExtractFileName(Application.ExeName)))),1,16);

  // Verifica se é Para Atualizar ==============================================
  MySql:=' SELECT *'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux=20';
  DMBelShopPedidos.CDS_BuscaRapida.Close;
  DMBelShopPedidos.SQLQ_BuscaRapida.Close;
  DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
  DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMBelShopPedidos.CDS_BuscaRapida.Open;
  sDtaVersao:=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Des_Aux').AsString);
  DMBelShopPedidos.CDS_BuscaRapida.Close;

  // Analisa Nova Versão =======================================================
  If Copy(sDtaAplicativo,1,13)<>Copy(sDtaVersao,1,13) Then
   Result:=False;
End; // Atualiza Nova Versão do Sistema >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Todos os Edts e Datas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBelShopPedidos.LimpaEdts;
Begin
  EdtCodProdLinx.Clear;
  EdtDescProduto.Clear;
  EdtQtdEstoqueCD.Clear;
  EdtQtdEstoque.Clear;
  EdtQtdTransf.Clear;
  Lab_UnidadeCD.Caption:='';
  Lab_Unidade.Caption:='';

End; // Limpa Todos os Edts e Datas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Cria Limites da Loja em Tab_Auxiliar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmBelShopPedidos.CriaLimitesLoja: Boolean;
Var
  MySql: String;
Begin

  Result:=True;

  // Verifica se Transação esta Ativa
  If DMBelShopPedidos.SQLC.InTransaction Then
   DMBelShopPedidos.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShopPedidos.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR'+
           ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
           ' VALUES ('+
           ' 19, '+ // TIP_AUX
           sgLojaLinx+', '+ // COD_AUX
           '25, '+ // DES_AUX
           '24, '+ // DES_AUX1
           ' NULL, '+ // VLR_AUX
           ' NULL)'+ // VLR_AUX1
           ' MATCHING (TIP_AUX, COD_AUX)';
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShopPedidos.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      Result:=False;

      DMBelShopPedidos.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação
End; // Cria Limites da Loja em Tab_Auxiliar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmBelShopPedidos.CreateToolTips(hWnd: Cardinal);
begin
  hToolTip := CreateWindowEx(0, 'Tooltips_Class32', nil, TTS_ALWAYSTIP or TTS_BALLOON,
  Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),Integer(CW_USEDEFAULT),
  Integer(CW_USEDEFAULT), hWnd, 0, hInstance, nil);

  if hToolTip <> 0 then
  begin
    SetWindowPos(hToolTip, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or  SWP_NOSIZE or SWP_NOACTIVATE);
    ti.cbSize := SizeOf(TToolInfo);
    ti.uFlags := TTF_SUBCLASS;
    ti.hInst := hInstance;
  end;
end; // Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure AddToolTip(hwnd: dword; lpti: PToolInfo; IconType: Integer; Text, Title: PChar);
var
  Item: THandle;
  Rect: TRect;
begin

  Item := hWnd;

  if (Item <> 0) and (GetClientRect(Item, Rect)) then
  begin
    lpti.hwnd := Item;
    lpti.Rect := Rect;
    lpti.lpszText := Text;
    SendMessage(hToolTip, TTM_ADDTOOL, 0, Integer(lpti));
    FillChar(buffer, sizeof(buffer), #0);
    lstrcpy(buffer, Title);

    if (IconType > 3) or (IconType < 0) then
      IconType := 0;

    SendMessage(hToolTip, TTM_SETTITLE, IconType, Integer(@buffer));
  end;
end; // Show Hint em Forma de Balão - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>

procedure TFrmBelShopPedidos.EdtNFeCodFornLinxChange(Sender: TObject);
begin
  DMBelShopPedidos.CDS_OCItensCheck.Close;
  EdtNFeDesFornLinx.Clear;
  Lbx_NFeNumOCs.Items.Clear;
  EdtNFeNumNFe.Clear;
end;

// Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBelShopPedidos.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmBelShopPedidos.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  bEnterTab:= True;

  // ===========================================================================
  // Apresentação da Versão do Sistema =========================================
  // ===========================================================================
  EdtVersao.Visible:=False;
  // Apresentação da Versão do Sistema =========================================
  // ===========================================================================

  // ===========================================================================
  // Pasta Executavel ==========================================================
  // ===========================================================================
  sgPastaExecutavel:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  // Pasta Executavel ==========================================================
  // ===========================================================================


  If not(fileexists(IncludeTrailingPathDelimiter(sgPastaExecutavel)+'Loja.ini')) then
  Begin
    msg('Definição da Loja Não Encontrada !!'+cr+'Entrar em Contato com o ODIR'+cr+'Celcular:  999-578-234','A');
    Application.Terminate;
    Exit;
  End;

  // Verifica Parametro Enviado ================================================
//  sgCodLojaVersaoOK:='';
//  for i:=1 to ParamCount do
//   sgCodLojaVersaoOK:=ParamStr(i);

  // ===========================================================================
  // Coloca Icone no Form ======================================================
  // ===========================================================================
  Icon:=Application.Icon;
  // Coloca Icone no Form ======================================================
  // ===========================================================================

  // ===========================================================================
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  // ===========================================================================
  Application.OnMessage := ApplicationEvents1Message;
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  // ===========================================================================

  // ===========================================================================
  // Não Permite Movimentar o Formulário =======================================
  // ===========================================================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
  // Não Permite Movimentar o Formulário =======================================
  // ===========================================================================

  // ===========================================================================
  // Show Hint em Forma de Balão ===============================================
  // ===========================================================================
  CreateToolTips(Self.Handle);
  AddToolTip(EdtCodProdLinx.Handle, @ti, TipoDoIcone, 'Informar Código Linx', 'CÓDIGO DO PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaProdtudo.Handle, @ti, TipoDoIcone, 'Busca Produtos Linx', 'SELECIONA PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(EdtQtdTransf.Handle, @ti, TipoDoIcone, 'Informar Quantidade a Transferir', 'QUANTIDADE !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Incluir.Handle, @ti, TipoDoIcone, 'Inclui/Sobscreve'+cr+'Produto da Solicitação', 'INCLUIR PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Excluir.Handle, @ti, TipoDoIcone, 'Exclui Produto Selecionado'+cr+'na Solicitação', 'EXCLUIR PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NFeBuscaFornLinx.Handle, @ti, TipoDoIcone, 'Busca Fornecedore', 'CHECKOUT PRODUTOS !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NFeBuscaOC.Handle, @ti, TipoDoIcone, 'Busca Ordem de Compra', 'CHECKOUT PRODUTOS !!');


  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NFeEscanear.Handle, @ti, TipoDoIcone, 'Orcanear Produtos', 'CHECKOUT PRODUTOS !!');
  // Show Hint em Forma de Balão ===============================================
  // ===========================================================================

  // ===========================================================================
  // Tradução DevExpress =======================================================
  // ===========================================================================
  if FileExists(sgPastaExecutavel+'TradDevExpBr.ini') then {Verifica se existe o arquivo dentro da pasta}
  begin
    Trad_Localizer.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'TradDevExpBr.ini');
    Trad_Localizer.LanguageIndex := 1; {Muda o idioma / linguagem}
    Trad_Localizer.Active := TRUE;     {Ativa o componente / a tradução}
  end;
  // Tradução DevExpress =======================================================
  // ===========================================================================

end;

procedure TFrmBelShopPedidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If bEnterTab Then
  Begin
    If Key = #13 Then
    Begin
      Key:=#0;
      SelectNext(ActiveControl,True,True);
    End;
  End; // If bEnterTab Then
end;

procedure TFrmBelShopPedidos.FormShow(Sender: TObject);
Var
  MySql: String;
  b: Boolean;
  iIndexCol: Integer;
begin
  If sgLojaLinx<>'2' Then
   Ts_NFeCheckOut.TabVisible:=False;

  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  // Atualiza Novca Versão do Sistema ==========================================
  If sgLojaLinx<>'2' Then // Não Verifica Versão para o CD
  Begin
    If Not NovaVersao Then
    Begin
      msg('== TECNONOLOGIA DA INFORMAÇÃO =='+cr+
          ' BelShop-CD ADVERTE !!'+cr+
          'Versão do Sistema esta Incorreta !!'+cr+
          'Solicite Atualização Imediata'+cr+'para ODIR / ALINE...','A');
    End; // If not NovaVersao Then
  End; // If sgLojaLinx<>2 Then // Não Verifica Versão para o CD

  // ===========================================================================
  // Descrição do Loja =========================================================
  // ===========================================================================
  Pan_Loja.Caption:=sgNomeLoja;
  // Descrição do Loja =========================================================
  // ===========================================================================

  // ===========================================================================
  // Verifica Conexão ==========================================================
  // ===========================================================================
  If Not DMBelShopPedidos.SQLC.Connected Then
   DMBelShopPedidos.SQLC.Connected:=True;
  // Verifica Conexão ==========================================================
  // ===========================================================================

  // ===========================================================================
  // Apresentação dos Parametros de Conexão ====================================
  // ===========================================================================
  Mem_Odir.Lines.Add(DMBelShopPedidos.SQLC.Params.GetText);
  If DMBelShopPedidos.SQLC.Connected Then
   Mem_Odir.Lines.Add('CONNECTED=True')
  Else
   Mem_Odir.Lines.Add('CONNECTED=False');
  // Apresentação dos Parametros de Conexão ====================================
  // ===========================================================================

  // ===========================================================================
  // Busca Informações para Lojas ==============================================
  // ===========================================================================
  If sgLojaLinx<>'2' Then
  Begin
    // ===========================================================================
    // Busca Numero/Quantidade Máxima de Transferencia ===========================
    // ===========================================================================
    b:=True;
    While b do
    Begin
      MySql:=' SELECT t.des_aux Num_Prod, t.des_aux1 Qtd_Prod'+
             ' FROM TAB_AUXILIAR t'+
             ' WHERE t.tip_aux=19'+
             ' AND   t.cod_aux='+sgLojaLinx;
      DMBelShopPedidos.CDS_Busca.Close;
      DMBelShopPedidos.SQLQ_Busca.Close;
      DMBelShopPedidos.SQLQ_Busca.SQL.Clear;
      DMBelShopPedidos.SQLQ_Busca.SQL.Add(MySql);
      DMBelShopPedidos.CDS_Busca.Open;
      If Trim(DMBelShopPedidos.CDS_Busca.FieldByName('Num_Prod').AsString)='' Then
       Begin
         // Cria Limites da Loja em Tab_Auxiliar
         If Not CriaLimitesLoja Then
         Begin
           msg('Erro ao Criar Limites da Loja !!','A');
           Application.Terminate;
           Exit;
         End;
       End
      Else
       Begin
         Break;
       End; // If Trim(DMBelShopPedidos.CDS_Busca.FieldByName('Num_Prod').AsString)='' Then
    End; // While b do
    igNumMaxProd:=DMBelShopPedidos.CDS_Busca.FieldByName('Num_Prod').AsInteger;
    igQtdMaxProd:=DMBelShopPedidos.CDS_Busca.FieldByName('Qtd_Prod').AsInteger;
    DMBelShopPedidos.CDS_Busca.Close;
    Stb_ParamTransf.Panels[2].Text:='Nº Maximo de Produtos/Dia: '+IntToStr(igNumMaxProd);
    Stb_ParamTransf.Panels[3].Text:='Quantidade Maxima Por Produto: '+IntToStr(igQtdMaxProd);
    // Busca Numero/Quantidade Máxima de Transferencia ===========================
    // ===========================================================================
  End; // If sgLojaLinx<>'2' Then
  // Busca Informações para Lojas ==============================================
  // ===========================================================================

 //odirapagar 
//  // ===========================================================================
//  // Acerta Apresentação para o CD =============================================
//  // ===========================================================================
//  If sgLojaLinx='2' Then
//  Begin
//    // =========================================================================
//    // Inicializa TabSheets para o CD ==========================================
//    // =========================================================================
//    FrmBelShopPedidos.AutoSize:=False;
//    Ts_SolicitacaoConsulta.TabVisible:=False;
//    Ts_SolicitacaoProdutos.TabVisible:=False;
//    FrmBelShopPedidos.Align:=alClient;
//    FrmBelShopPedidos.AutoSize:=True;
//    // Inicializa TabSheets para o CD ==========================================
//    // =========================================================================
//
//    // =========================================================================
//    // Coluna de Endereçamento VISIVEL para CD =================================
//    // =========================================================================
//    Dbg_NFeProdutosOC.Columns[iIndexCol].Visible:=True;
//    // Coluna de Endereçamento VISIVEL para CD =================================
//    // =========================================================================
//  End;
//  // Acerta Apresentação para o CD =============================================
//  // ===========================================================================

  // ===========================================================================
  // Inicializa Menu ===========================================================
  // ===========================================================================
  LiberaSubMenu(True);
  // Inicializa Menu ===========================================================
  // ===========================================================================

  PC_Principal.TabIndex:=0;
  PC_PrincipalChange(Self);
  Mem_Odir.Visible:=False;

end;

procedure TFrmBelShopPedidos.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // primeiramente verificamos se é o evento a ser tratado...
  If Msg.message = WM_MOUSEWHEEL then
  Begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;
    Sentido := HiWord(Msg.wParam);
    if Sentido > 0 then
     Msg.wParam := VK_UP
    else
     Msg.wParam := VK_DOWN;
  End; // if Msg.message = WM_MOUSEWHEEL then
end;

procedure TFrmBelShopPedidos.Dbg_ProdutosEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ProdutosEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmBelShopPedidos.EdtCodProdLinxExit(Sender: TObject);
Var
  MySql,
  sDesAtivado: String;
begin

  If EdtCodProdLinx.Value<>0 Then
  Begin
    If DMBelShopPedidos.CDS_Solicitacao.RecNo>=igNumMaxProd Then
    Begin
      msg('Número Máximo de Produtos por'+cr+'Transferêcia Diária Esta Completo !!'+cr+IntToStr(igNumMaxProd)+' Produtos por Dia !!','A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End; // If Not bMultiplo Then

    Screen.Cursor:=crAppStart;

    // Verifica Conexão ========================================================
    If Not DMBelShopPedidos.SQLC.Connected Then
     DMBelShopPedidos.SQLC.Connected:=True;

    // Buaca Saldo do Produto no CD ============================================
    MySql:=' SELECT pr.Cod_Produto, pr.Nome, pr.Cod_Auxiliar,'+
           '        pr.DesAtivado, pr.Unidade,'+
           '        COALESCE(pd.Quantidade,0) Quantidade'+
           ' FROM LINXPRODUTOS pr, LINXPRODUTOSDETALHES pd'+
           ' WHERE pr.cod_produto=pd.cod_produto'+
           ' AND   pd.empresa=2'+
           ' AND   pr.cod_produto='+IntToStr(EdtCodProdLinx.AsInteger);
    DMBelShopPedidos.CDS_Busca.Close;
    DMBelShopPedidos.SQLQ_Busca.Close;
    DMBelShopPedidos.SQLQ_Busca.SQL.Clear;
    DMBelShopPedidos.SQLQ_Busca.SQL.Add(MySql);
    DMBelShopPedidos.CDS_Busca.Open;

    EdtDescProduto.Text      :=Trim(DMBelShopPedidos.CDS_Busca.FieldByName('Nome').AsString);
    EdtQtdEstoqueCD.AsInteger:=DMBelShopPedidos.CDS_Busca.FieldByName('Quantidade').AsInteger;
    sDesAtivado              :=Trim(DMBelShopPedidos.CDS_Busca.FieldByName('DesAtivado').AsString);
    sgCodProdLinx            :=DMBelShopPedidos.CDS_Busca.FieldByName('Cod_Produto').AsString;
    sgCodProdSidicom         :=Trim(DMBelShopPedidos.CDS_Busca.FieldByName('Cod_Auxiliar').AsString);
    Lab_Unidade.Caption      :=Trim(DMBelShopPedidos.CDS_Busca.FieldByName('Unidade').AsString);
    Lab_UnidadeCD.Caption    :=Trim(DMBelShopPedidos.CDS_Busca.FieldByName('Unidade').AsString);

    DMBelShopPedidos.CDS_Busca.Close;

    // Acerta Quantidade para Separação ========================================
    If EdtQtdEstoqueCD.AsInteger>0 Then
    Begin
      // Verifica se Produto tem Quantidade de Reposição no CD a Separar =======
      MySql:=' SELECT SUM(Prod_Solic.Qtd_Solic) QTD_SOLIC'+
             ' FROM (SELECT SUM(l.Qtd_a_transf) QTD_SOLIC'+
             '       FROM ES_ESTOQUES_LOJAS l, LINXPRODUTOS p'+
             '       WHERE l.cod_produto=p.cod_auxiliar'+
             '       AND   l.dta_movto=CURRENT_DATE'+
             '       AND   l.ind_transf=''SIM'''+
             '       AND   l.num_pedido=''000000'''+
             '       AND   COALESCE(l.rel_separacao,0)<>0'+
             '       AND   l.qtd_a_transf>0.00'+
             '       AND   p.cod_produto='+IntToStr(EdtCodProdLinx.AsInteger)+

      // Verifica Produto Solicitados pelas Lojas Ainda não Enviado para o CD ==
             '       UNION'+

             '       SELECT SUM(c.Qtd_Transf) QTD_SOLIC'+
             '       FROM SOL_TRANSFERENCIA_CD c'+
             '       WHERE c.doc_gerado=0'+
             '       AND   c.cod_prod_linx='+IntToStr(EdtCodProdLinx.AsInteger);

      // Saldo de Transferencias do Compras em Aberto ==========================
             If Trim(sgCodProdSidicom)<>'' Then
             Begin
               MySql:=
                MySql+'       UNION'+

                     ' SELECT SUM(oc.qtd_transf) QTD_SOLIC'+
                     ' FROM OC_COMPRAR oc'+
                     ' WHERE oc.num_oc_gerada>20160300'+ // Documentos de Transferencias
                     ' AND   oc.ind_transf_cd=''N'''+
                     ' AND   oc.cod_item='+QuotedStr(sgCodProdSidicom);
             End; // If Trim(sgCodProdSidicom)<>'' Then
      MySql:=
       MySql+') Prod_Solic';
      DMBelShopPedidos.CDS_Busca.Close;
      DMBelShopPedidos.SQLQ_Busca.Close;
      DMBelShopPedidos.SQLQ_Busca.SQL.Clear;
      DMBelShopPedidos.SQLQ_Busca.SQL.Add(MySql);
      DMBelShopPedidos.CDS_Busca.Open;

      // Acerta Quantidade para Separação ======================================
      EdtQtdEstoqueCD.AsInteger:=EdtQtdEstoqueCD.AsInteger - DMBelShopPedidos.CDS_Busca.FieldByName('Qtd_Solic').AsInteger;

      DMBelShopPedidos.CDS_Busca.Close;
    End; // If EdtQtdEstoqueCD.AsInteger>0 Then

    If EdtQtdEstoqueCD.AsInteger<0 Then
     EdtQtdEstoqueCD.AsInteger:=0;

    Screen.Cursor:=crDefault;
    If EdtDescProduto.Text='' Then
    Begin
      msg('Produto (Linx) NÃO Encontrado !!!', 'A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If sDesAtivado='S' Then
    Begin
      msg('Produto (Linx) Desativado !!!', 'A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If Trim(sgCodProdSidicom)='' Then
    Begin
      msg('Produto Não Encontrado no CD !!!', 'A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If EdtQtdEstoqueCD.AsInteger<=0 Then
    Begin
      msg('Produto SEM ESTOQUE no CD !!!', 'A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If EdtQtdEstoque.CanFocus   Then EdtQtdEstoque.SetFocus;
    If DtEdt_DtaInicio.CanFocus Then DtEdt_DtaInicio.SetFocus;
  End; // If EdtFiltroCodProdLinx.Value<>0 Then
end;

procedure TFrmBelShopPedidos.EdtCodProdLinxChange(Sender: TObject);
begin
  EdtDescProduto.Clear;
  Lab_Unidade.Caption:='';
  Lab_UnidadeCD.Caption:='';
  EdtQtdEstoque.Clear;
  EdtQtdEstoqueCD.Clear;
  EdtQtdTransf.Clear;
end;

procedure TFrmBelShopPedidos.Bt_BuscaProdtudoClick(Sender: TObject);
Var
  MySql: String;
  b:Boolean;
  sNome: String;
Begin
  Dbg_Produtos.SetFocus;

  LimpaEdts;
  b:=True;
  While b do
  Begin
    If InputQuery('Informe Parte do Nome','',sNome) then
     Begin
       Try
         If Trim(sNome)='' Then
          msg('Informe Parte'+cr+'do Nome do Produto !!','A')
         Else
          Break;
       Except
       End;
     End
    Else // If InputQuery('Informe o Desconto','',sVlrDesc) then
     Begin
       Exit;
     End; // If InputQuery('Informe o Desconto','',sVlrDesc) then
  End; // While b do

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  OdirPanApres.Caption:='AGUARDE !! Localizando Produtos no Servidor BelShop ...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShopPedidos.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShopPedidos.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmBelShopPedidos;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica Conexão ==========================================================
  If Not DMBelShopPedidos.SQLC.Connected Then
   DMBelShopPedidos.SQLC.Connected:=True;

  MySql:=' SELECT TRIM(pr.nome) nome, pr.cod_produto'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE pr.desativado=''N'''+
         ' AND pr.Nome LIKE ''%'+AnsiUpperCase(sNome)+'%'''+
         ' ORDER BY pr.nome';
  DMBelShopPedidos.CDS_Pesquisa.Close;
  DMBelShopPedidos.SQLQ_Pesquisa.Close;
  DMBelShopPedidos.SQLQ_Pesquisa.SQL.Clear;
  DMBelShopPedidos.SQLQ_Pesquisa.SQL.Add(MySql);
  DMBelShopPedidos.CDS_Pesquisa.Filtered:=False;
  DMBelShopPedidos.CDS_Pesquisa.Filter:='';
  DMBelShopPedidos.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShopPedidos.CDS_Pesquisa.FieldByName('Nome').AsString)='' Then
  Begin
    msg('Sem Produto a Listar !!','A');
    DMBelShopPedidos.CDS_Pesquisa.Close;
    FreeAndNil(FrmPesquisa);
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Nome';
  FrmPesquisa.Campo_Codigo:='Cod_Produto';
  FrmPesquisa.Campo_Descricao:='Nome';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShopPedidos.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtCodProdLinx.AsInteger:=StrToInt(FrmPesquisa.EdtCodigo.Text);
    EdtCodProdLinxExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmBelShopPedidos.PC_PrincipalChange(Sender: TObject);
Var
  bFocar_Gb_Produto: Boolean;
begin
  CorSelecaoTabSheet(PC_Principal);

  LimpaEdts;

  If DMBelShopPedidos.CDS_ProdNegativos.Active Then
   DMBelShopPedidos.CDS_ProdNegativos.Close;

  bFocar_Gb_Produto:=False;

  If (PC_Principal.ActivePage=Ts_SolicitacaoProdutos) And (Ts_SolicitacaoProdutos.CanFocus) Then
  Begin
    Gb_Produto.Parent:=Gb_Solicitacao;
    bFocar_Gb_Produto:=True;
  End;

  If (PC_Principal.ActivePage=Ts_SolicitacaoConsulta) And (Ts_SolicitacaoConsulta.CanFocus) Then
  Begin
    bFocar_Gb_Produto:=True;
    Gb_Produto.Parent:=Gb_Verifica;
  End;

  If (PC_Principal.ActivePage=Ts_NFeCheckOut) And (Ts_NFeCheckOut.CanFocus) Then
  Begin
    EdtNFeCodFornLinx.SetFocus;
  End;

  If (PC_Principal.ActivePage=Ts_ProdNegativos) And (Ts_ProdNegativos.CanFocus) Then
  Begin
    Dbg_ProdNegativos.SetFocus;
  End;

  If bFocar_Gb_Produto Then
  Begin
    Gb_Produto.TabOrder:=0;
    EdtCodProdLinx.SetFocus;
  End; //   If bFocar_Gb_Produto Then
end;

procedure TFrmBelShopPedidos.Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Usado em:
  //=====================
  // Dbg_Produtos
  // Dbg_VerificaProdutos
  // Dbg_NFeProdutosOC
  //=====================
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

  //============================================================================
  // Dbg_NFeProdutosOC =========================================================
  //============================================================================
  If (Sender as TDBGrid).Name='Dbg_NFeProdutosOC' Then
  Begin
    If DMBelShopPedidos.CDS_OCItensCheck.IsEmpty Then
     Exit;

    // CHECKOUT NFeE - Retira Quantidade de CheckOut na Nota Fiscal ============
    If Key=Vk_Delete Then
    Begin
      If DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger=0 Then
      Begin
        msg('Produto SEM Quantidade de CheckOut !!','A');
        Exit;
      End;

      // Retira Quantidade de Checkou da NFe
      CheckOutRetiraQtdCheckout;
    End; // If Key=Vk_Delete Then

    // Impressão do Relatório do Produtos Checados =============================
    If Key=Vk_F3 Then
    Begin
      CheckOutRelatorio;
    End; // If Key=Vk_F3 Then
  End; // If (Sender as TDBGrid).Name='Dbg_NFeProdutosOC' Then
  // Dbg_NFeProdutosOC =========================================================
  //============================================================================
end;

procedure TFrmBelShopPedidos.Bt_IncluirClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_Produtos.SetFocus;

  If DMBelShopPedidos.CDS_Solicitacao.RecNo>=igNumMaxProd Then
  Begin
    msg('Número Máximo de Produtos por'+cr+'Transferêcia Diária Esta Completo !!'+cr+IntToStr(igNumMaxProd)+' Produtos por Dia !!','A');
    LimpaEdts;
    EdtCodProdLinx.SetFocus;
    Exit;
  End; // If Not bMultiplo Then

  // Consiste ==================================================================
  If EdtCodProdLinx.AsInteger=0 Then
  Begin
    msg('Favor Informar o Produto !!','A');
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  If EdtQtdEstoque.AsInteger<0 Then
  Begin
    msg('Estoque Físico Inválido (Negativo) !!','A');
    EdtQtdEstoque.SetFocus;
    Exit;
  End;

  If EdtQtdTransf.AsInteger>EdtQtdEstoqueCD.AsInteger Then
  Begin
    msg('Quantidade Solicitada é Maior'+cr+cr+'Que Estoque Disponível no CD !!','X');
    EdtQtdTransf.SetFocus;
    Exit;
  End;

  If EdtQtdTransf.AsInteger=0 Then
  Begin
    msg('Quantidade Solicita'+cr+cr+'NÃO pode ser Igual a 0 <ZERO> !!','A');
    Exit;
  End;

  OdirPanApres.Caption:='AGUARDE !! Incluindo Produto na Solicitação';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShopPedidos.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShopPedidos.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmBelShopPedidos;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // ===========================================================================
  // Busca Numero da Solicitação ===============================================
  // ===========================================================================
  If Trim(sgNumSolicitacao)='' Then
  Begin
    MySql:=' SELECT GEN_ID(GEN_SOLIC_TRANSFERENCIAS,1) Numero'+
           ' FROM RDB$DATABASE';
    DMBelShopPedidos.CDS_Busca.Close;
    DMBelShopPedidos.SQLQ_Busca.Close;
    DMBelShopPedidos.SQLQ_Busca.SQL.Clear;
    DMBelShopPedidos.SQLQ_Busca.SQL.Add(MySql);
    DMBelShopPedidos.CDS_Busca.Open;
    sgNumSolicitacao:=DMBelShopPedidos.CDS_Busca.FieldByName('Numero').AsString;
    DMBelShopPedidos.CDS_Busca.Close;
  End; // If Trim(sgNumSolicitacao)='' Then
  // Busca Numero da Solicitação ===============================================
  // ===========================================================================

  // Verifica Conexão ==========================================================
  If Not DMBelShopPedidos.SQLC.Connected Then
   DMBelShopPedidos.SQLC.Connected:=True;

  // Verifica se Transação esta Ativa
  If DMBelShopPedidos.SQLC.InTransaction Then
   DMBelShopPedidos.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShopPedidos.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;

    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE OR INSERT INTO SOL_TRANSFERENCIA_CD'+
           ' (DTA_SOLICITACAO, NUM_SOLICITACAO, COD_LOJA_SIDI, COD_LOJA_LINX,'+
           '  COD_PROD_LINX, COD_PROD_SIDI, QTD_ESTOQUE, QTD_TRANSF)'+
           ' VALUES (CURRENT_DATE,'+ // DTA_SOLICITACAO
           sgNumSolicitacao+', '+ // NUM_SOLICITACAO
           QuotedStr(sgLojaSidicom)+', '+ // COD_LOJA_SIDI
           sgLojaLinx+', '+ // COD_LOJA_LINX
           sgCodProdLinx+', '; // COD_PROD_LINX

           // COD_PROD_SIDI
           If Trim(sgCodProdSidicom)<>'' Then
            MySql:=
             MySql+QuotedStr(sgCodProdSidicom)+', '
           Else
            MySql:=
             MySql+'NULL , ';

    MySql:=
     MySql+IntToStr(EdtQtdEstoque.AsInteger)+', '+ // QTD_ESTOQUE
           IntToStr(EdtQtdTransf.AsInteger)+')'+ // QTD_TRANSF
           ' MATCHING (DTA_SOLICITACAO, NUM_SOLICITACAO, COD_LOJA_LINX, COD_PROD_LINX)';
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

    DMBelShopPedidos.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

    DMBelShopPedidos.CDS_Solicitacao.Close;
    DMBelShopPedidos.CDS_Solicitacao.Open;
    DMBelShopPedidos.CDS_Solicitacao.Locate('COD_PROD_LINX', sgCodProdLinx,[]);
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShopPedidos.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try da Transação

  LimpaEdts;
  
  EdtCodProdLinx.SetFocus;
end;

procedure TFrmBelShopPedidos.Bt_ExcluirClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_Produtos.SetFocus;

  If DMBelShopPedidos.CDS_Solicitacao.IsEmpty Then
   Exit;

  If msg('Excluir o Produto Selecionado ?'+cr+DMBelShopPedidos.CDS_SolicitacaoNOME.AsString,'C')=2 Then
   Exit;

  EdtCodProdLinxChange(Self);
  EdtCodProdLinx.Clear;

  OdirPanApres.Caption:='AGUARDE !! Excluindo Produto da Solicitação...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShopPedidos.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShopPedidos.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmBelShopPedidos;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica Conexão ==========================================================
  If Not DMBelShopPedidos.SQLC.Connected Then
   DMBelShopPedidos.SQLC.Connected:=True;

  // Verifica se Transação esta Ativa
  If DMBelShopPedidos.SQLC.InTransaction Then
   DMBelShopPedidos.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShopPedidos.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' DELETE FROM SOL_TRANSFERENCIA_CD so'+
           ' WHERE so.dta_solicitacao=CURRENT_DATE'+
           ' AND   so.num_solicitacao='+DMBelShopPedidos.CDS_SolicitacaoNUM_SOLICITACAO.AsString+
           ' AND   so.cod_prod_linx='+DMBelShopPedidos.CDS_SolicitacaoCOD_PROD_LINX.AsString;
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

    DMBelShopPedidos.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

    DMBelShopPedidos.CDS_Solicitacao.Close;
    DMBelShopPedidos.CDS_Solicitacao.Open;

    msg('Exclusão Efetuada com SUCESSO !!','A');

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShopPedidos.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação

  EdtCodProdLinx.SetFocus;
end;

procedure TFrmBelShopPedidos.Dbg_ProdutosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sValor, sCodProd: String;
  b: Boolean;
begin
  If DMBelShopPedidos.CDS_Solicitacao.IsEmpty Then
   Exit;

  // Localizar Produto =========================================================
  If Key=Vk_F4 Then
  Begin
    sCodProd:= DMBelShopPedidos.CDS_SolicitacaoCOD_PROD_LINX.AsString;
    
    sValor:='';
    b:=True;
    While b do
    Begin
      If InputQuery('Localizar Produto','',sValor) then
       Begin
         Try
           StrToInt(sValor);

           If Not DMBelShopPedidos.CDS_Solicitacao.Locate('COD_PROD_LINX', sValor,[]) Then
           Begin
            If Not LocalizaRegistro(DMBelShopPedidos.CDS_Solicitacao, 'COD_PROD_LINX', sValor) Then
             b:=False;
           End; // If Not DMBelShopPedidos.CDS_Solicitacao.Locate('COD_PROD_LINX', sValor,[]) Then

           Break;
         Except
           If Not DMBelShopPedidos.CDS_Solicitacao.Locate('NOME', sValor,[]) Then
           Begin
             If Not LocalizaRegistro(DMBelShopPedidos.CDS_Solicitacao, 'NOME', sValor) Then
              b:=False;
           End; // If Not DMBelShopPedidos.CDS_Solicitacao.Locate('NOME', sValor,[]) Then

           Break;
         End;
       End
      Else // If InputQuery('Localizar Produto','',sValor) then
       Begin
         Break;
       End; // If InputQuery('Localizar Produto','',sValor) then
    End; // While b do

    If Not b Then
    Begin
      DMBelShopPedidos.CDS_Solicitacao.Locate('COD_PROD_LINX',sCodProd,[]);
      msg('Produto Não Localizado !!','A');
    End;
  End; // If Key=Vk_F4 Then

end;

procedure TFrmBelShopPedidos.EdtQtdTransfExit(Sender: TObject);
Var
  MySql: String;
  sCodGrupo, sCodSubGrupo, sQtdCaixa: String;
  iQtdMultiplo: Integer;
  bMultiplo: Boolean;
begin

  If (EdtCodProdLinx.AsInteger=0) and (EdtQtdTransf.AsInteger=0) Then
  Begin
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  If EdtQtdTransf.AsInteger=0 Then
  Begin
    Exit;
  End;

  If EdtCodProdLinx.AsInteger=0 Then
  Begin
    msg('Favor Informar o Produto !!','A');
    EdtQtdTransf.AsInteger:=0;
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  // Verifica Conexão ==========================================================
  If Not DMBelShopPedidos.SQLC.Connected Then
   DMBelShopPedidos.SQLC.Connected:=True;

  bMultiplo:=False;

// Retirado Controle de Qtd/Cx - 27/09/2018 ====================================
//  // Busca Produto Caixa Embarque ==============================================
//  MySql:=' SELECT Trim(pr.codgrupo) CodGrupo, Trim(pr.codsubgrupo) CodSubGrupo'+
//         ' FROM PRODUTO pr'+
//         ' WHERE pr.codproduto='+QuotedStr(sgCodProdSidicom);
//  DMBelShopPedidos.CDS_Busca.Close;
//  DMBelShopPedidos.SQLQ_Busca.Close;
//  DMBelShopPedidos.SQLQ_Busca.SQL.Clear;
//  DMBelShopPedidos.SQLQ_Busca.SQL.Add(MySql);
//  DMBelShopPedidos.CDS_Busca.Open;
//  sCodGrupo   :=DMBelShopPedidos.CDS_Busca.FieldByName('CodGrupo').AsString;
//  sCodSubGrupo:=DMBelShopPedidos.CDS_Busca.FieldByName('CodSubGrupo').AsString;
//  DMBelShopPedidos.CDS_Busca.Close;
//
//  MySql:=' SELECT cp.Cod_Produto, cp.Cod_Grupo, cp.Cod_Subgrupo,'+
//         '        cp.Qtd_Caixa, cp.Per_Corte'+
//         ' FROM PROD_CAIXA_CD cp'+
//         ' WHERE ((cp.cod_produto='+QuotedStr(sgCodProdSidicom)+')'+
//         '        OR'+
//         '        ((cp.cod_grupo='+QuotedStr(sCodGrupo)+') and (cp.cod_subgrupo is null))'+
//         '        OR'+
//         '        ((cp.cod_grupo='+QuotedStr(sCodGrupo)+') and (cp.cod_subgrupo='+QuotedStr(sCodSubGrupo)+')))'+
//         ' ORDER BY 1 desc, 4 desc';
//  DMBelShopPedidos.CDS_Busca.Close;
//  DMBelShopPedidos.SQLQ_Busca.Close;
//  DMBelShopPedidos.SQLQ_Busca.SQL.Clear;
//  DMBelShopPedidos.SQLQ_Busca.SQL.Add(MySql);
//  DMBelShopPedidos.CDS_Busca.Open;
//
//  sQtdCaixa:=DMBelShopPedidos.CDS_Busca.FieldByName('Qtd_Caixa').AsString;
//  DMBelShopPedidos.CDS_Busca.Close;
//
//  If Trim(sQtdCaixa)<>'' Then
//  Begin
//    bMultiplo:=True;
//    If StrToInt(sQtdCaixa)<>igQtdMaxProd Then
//    Begin
//      MessageBox(Application.Handle, Pchar('PRODUTO com CAIXA de Transferência'+cr+
//                                           'com '+sQtdCaixa+' Produtos por Caixa'), 'Aviso', MB_ICONEXCLAMATION);
//
//      If EdtQtdTransf.AsInteger<StrToInt(sQtdCaixa) Then
//       Begin
//         EdtQtdTransf.AsInteger:=StrToInt(sQtdCaixa)
//       End
//      Else If EdtQtdTransf.AsInteger>StrToInt(sQtdCaixa) Then // Calcula Multiplo
//       Begin
//         iQtdMultiplo:=StrToInt(sQtdCaixa);
//         While bMultiplo do
//         Begin
//           If iQtdMultiplo>igQtdMaxProd Then
//           Begin
//             EdtQtdTransf.AsInteger:=iQtdMultiplo;
//             Break;
//           End;
//
//           If EdtQtdTransf.AsInteger<iQtdMultiplo Then
//           Begin
//             EdtQtdTransf.AsInteger:=iQtdMultiplo;
//             Break;
//           End;
//
//           If EdtQtdTransf.AsInteger=iQtdMultiplo Then
//            Begin
//              Break;
//            End
//           Else
//            Begin
//              iQtdMultiplo:=iQtdMultiplo+StrToInt(sQtdCaixa);
//            End;
//         End; // While bMultiplo do
//       End; // If EdtQtdTransf.AsInteger<StrToInt(sQtdCaixa) Then
//    End; // If StrToInt(sQtdCaixa)<>igQtdMaxProd Then
//    Bt_Incluir.SetFocus;
//  End; // If Trim(sQtdCaixa)<>'' Then

  If (Not bMultiplo) And (EdtQtdTransf.AsInteger>igQtdMaxProd) Then
  Begin
    msg('Quantidade de Transferência Inválida !!'+cr+'Superior ao Maximo de '+IntToStr(igQtdMaxProd)+' por Produto','A');
    EdtQtdTransf.AsInteger:=0;
    EdtQtdTransf.SetFocus;
    Exit;
  End; // If Not bMultiplo Then

end;

procedure TFrmBelShopPedidos.Dbg_VerificaProdutosEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_VerificaProdutosEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmBelShopPedidos.Bt_VerificarClick(Sender: TObject);
Var
  MySql: String;
begin
  DtEdt_DtaInicio.SetFocus;

  Try
    StrToDate(DtEdt_DtaInicio.Text);
  Except
    msg('Data Inicial Inválida !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_DtaFim.Text);
  Except
    msg('Data Final Inválida !!','A');
    DtEdt_DtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_DtaFim.Date>=dgDtaHoje Then
  Begin
    msg('Data Final Deve Ser'+cr+cr+'MENOR que Hoje !!','A');
    DtEdt_DtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_DtaFim.Date<DtEdt_DtaInicio.Date Then
  Begin
    msg('Período Inválido !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  If (DtEdt_DtaFim.Date-DtEdt_DtaInicio.Date)>10 Then
  Begin
    msg('Período a Verificar deve Conter'+cr+cr+'no Máximo 10 (DEZ) Dias !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  MySql:=' SELECT so.dta_solicitacao, pl.nome,'+

         ' CASE'+
         '   WHEN so.doc_gerado=0 THEN'+
         '     ''NÃO'''+
         '   ELSE'+
         '     ''SIM'''+
         ' END enviado_cd,'+

         ' CASE'+
         '   WHEN (COALESCE(el.num_pedido,''000000'')<>''000000'') AND (CAST(COALESCE(el.num_pedido,''0'') AS INTEGER)<999990) THEN'+
         '     ''SIM'''+
         '   ELSE'+
         '     ''NÃO'''+
         ' END transf_loja,'+

         ' so.qtd_transf Qtd_Solicitada,'+
         ' el.qtd_transf Qtd_De_Transf,'+

         ' CASE'+
         '   WHEN (COALESCE(el.num_pedido,''000000'')<>''000000'') AND (CAST(COALESCE(el.num_pedido,''0'') AS INTEGER)<999990) THEN'+
         '     el.qtd_a_transf'+
         '   ELSE'+
         '     0'+
         ' END qtd_a_transf,'+

         ' so.cod_prod_sidi, so.cod_prod_linx,'+
         ' so.dta_processamento, so.doc_gerado, el.obs_docto, so.num_solicitacao'+

         ' FROM SOL_TRANSFERENCIA_CD so'+
         '    LEFT JOIN LINXPRODUTOS      pl  ON pl.cod_produto=so.cod_prod_linx'+
         '    LEFT JOIN ES_ESTOQUES_LOJAS el  ON el.dta_movto  =so.dta_processamento'+
         '                                   AND el.num_docto  =so.doc_gerado'+
         '                                   AND el.cod_produto=so.cod_prod_sidi'+
         '                                   AND el.cod_loja   =so.cod_loja_sidi'+

         ' WHERE so.dta_solicitacao BETWEEN '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaInicio.Date))))+' AND '+
                                              QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaFim.Date))))+
         ' AND   so.cod_loja_linx='+sgLojaLinx;

         If EdtCodProdLinx.AsInteger<>0 Then
          MySql:=
           MySql+' AND   so.cod_prod_linx='+IntToStr(EdtCodProdLinx.AsInteger);

  MySql:=
   MySql+' ORDER BY 2, 1';
  DMBelShopPedidos.CDS_Verifica.Close;
  DMBelShopPedidos.SQLQ_Verifica.Close;
  DMBelShopPedidos.SQLQ_Verifica.SQL.Clear;
  DMBelShopPedidos.SQLQ_Verifica.SQL.Add(MySql);
  DMBelShopPedidos.CDS_Verifica.Open;

  If Trim(DMBelShopPedidos.CDS_VerificaCOD_PROD_LINX.AsString)='' Then
  Begin
    msg('Sem Solicitação a'+cr+cr+'Listar no Período !!','A');
    DMBelShopPedidos.CDS_Verifica.Close;
    LimpaEdts;
    EdtCodProdLinx.SetFocus;
    Exit;
  End;
  Dbg_VerificaProdutos.SetFocus;
end;

procedure TFrmBelShopPedidos.Dbg_VerificaProdutosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If (Column.FieldName='ENVIADO_CD') Then // Este comando altera cor da Celula
  Begin
    If DMBelShopPedidos.CDS_VerificaENVIADO_CD.AsString='SIM' Then
    Begin
      Dbg_VerificaProdutos.Canvas.Font.Style:=[fsBold];
      Dbg_VerificaProdutos.Canvas.Font.Color:=clBlue; // Cor da Fonte
    End;
  End;

  If (Column.FieldName='TRANSF_LOJA') Then // Este comando altera cor da Celula
  Begin
    If DMBelShopPedidos.CDS_VerificaTRANSF_LOJA.AsString='SIM' Then
    Begin
      Dbg_VerificaProdutos.Canvas.Font.Style:=[fsBold];
      Dbg_VerificaProdutos.Canvas.Font.Color:=clBlue; // Cor da Fonte
    End;
  End;

  If (Column.FieldName='QTD_A_TRANSF') Then // Este comando altera cor da Celula
  Begin
    If DMBelShopPedidos.CDS_VerificaQTD_A_TRANSF.AsCurrency<>0.00 Then
    Begin
      Dbg_VerificaProdutos.Canvas.Font.Style:=[fsBold];
      Dbg_VerificaProdutos.Canvas.Font.Color:=clBlue; // Cor da Fonte
    End;
  End;
  Dbg_VerificaProdutos.Canvas.FillRect(Rect);
  Dbg_VerificaProdutos.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMBelShopPedidos.CDS_VerificaDTA_SOLICITACAO.Alignment:=taCenter;
  DMBelShopPedidos.CDS_VerificaENVIADO_CD.Alignment:=taCenter;
  DMBelShopPedidos.CDS_VerificaTRANSF_LOJA.Alignment:=taCenter;
  DMBelShopPedidos.CDS_VerificaQTD_DE_TRANSF.Alignment:=taRightJustify;
  DMBelShopPedidos.CDS_VerificaQTD_A_TRANSF.Alignment:=taRightJustify;
  DMBelShopPedidos.CDS_VerificaCOD_PROD_LINX.Alignment:=taRightJustify;
  DMBelShopPedidos.CDS_VerificaCOD_PROD_SIDI.Alignment:=taRightJustify;
  DMBelShopPedidos.CDS_VerificaDTA_PROCESSAMENTO.Alignment:=taCenter;
  DMBelShopPedidos.CDS_VerificaDOC_GERADO.Alignment:=taRightJustify;
  DMBelShopPedidos.CDS_VerificaNUM_SOLICITACAO.Alignment:=taRightJustify;
end;

procedure TFrmBelShopPedidos.Dbg_VerificaProdutosKeyUp(Sender: TObject; Var Key: Word; Shift: TShiftState);
Var
  sValor, sCodProd: String;
  b: Boolean;
begin

  If DMBelShopPedidos.CDS_Verifica.IsEmpty Then
   Exit;

  // Localizar Produto =========================================================
  If Key=Vk_F4 Then
  Begin
    sCodProd:= DMBelShopPedidos.CDS_VerificaCOD_PROD_LINX.AsString;

    sValor:='';
    b:=True;
    While b do
    Begin
      If InputQuery('Localizar Produto','',sValor) then
       Begin
         Try
           StrToInt(sValor);

           If Not DMBelShopPedidos.CDS_Verifica.Locate('COD_PROD_LINX', sValor,[]) Then
           Begin
            If Not LocalizaRegistro(DMBelShopPedidos.CDS_Verifica, 'COD_PROD_LINX', sValor) Then
             b:=False;
           End; // If Not DMBelShopPedidos.CDS_Verifica.Locate('COD_PROD_LINX', sValor,[]) Then

           Break;
         Except
           If Not DMBelShopPedidos.CDS_Verifica.Locate('NOME', sValor,[]) Then
           Begin
             If Not LocalizaRegistro(DMBelShopPedidos.CDS_Verifica, 'NOME', sValor) Then
              b:=False;
           End; // If Not DMBelShopPedidos.CDS_Verifica.Locate('NOME', sValor,[]) Then

           Break;
         End;
       End
      Else // If InputQuery('Localizar Produto','',sValor) then
       Begin
         Break;
       End; // If InputQuery('Localizar Produto','',sValor) then
    End; // While b do

    If Not b Then
    Begin
      DMBelShopPedidos.CDS_Verifica.Locate('COD_PROD_LINX',sCodProd,[]);
      msg('Produto Não Localizado !!','A');
    End;
  End; // If Key=Vk_F4 Then
end;

procedure TFrmBelShopPedidos.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Versão do Sistema =========================================================
  If Key=Vk_F1 Then
  Begin
    msg('Data da Última Alteração: '+cr+cr+Copy(DateTimeToStr(FileDateToDateTime(
        FileAge(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+
        ExtractFileName(Application.ExeName)))),1,19),'A');
  End;

end;

procedure TFrmBelShopPedidos.EdtNFeCodFornLinxExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtNFeDesFornLinx.Clear;
  EdtNFeNumNFe.Clear;
  EdtNFeNumOC.Clear;

  sgNumSeqOCNova:='';
  sgNrOCNova:='';
  bgOCNova:=False;
  EdtNFeNumOC.Enabled:=True;
  Bt_NFeBuscaOC.Enabled:=True;
  Lbx_NFeNumOCs.Enabled:=True;

  If EdtNFeCodFornLinx.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Fornecedores ========================================================
    MySql:=' SELECT fo.nome_cliente des_forn_linx, fo.cod_cliente cod_forn_linx'+
           ' FROM LINXCLIENTESFORNEC fo'+
           ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
           ' AND   TRIM(COALESCE(fo.nome_cliente,''''))<>'''''+
           ' AND   EXISTS(SELECT 1'+
           '              FROM LINXPRODUTOS pr'+
           '              WHERE pr.cod_fornecedor = fo.cod_cliente)'+
           ' AND   fo.cod_cliente='+VarToStr(EdtNFeCodFornLinx.AsInteger)+

           ' UNION '+

           ' SELECT be.nome_cliente, be.cod_cliente'+
           ' FROM LINXCLIENTESFORNEC be'+
           ' WHERE UPPER(be.nome_cliente) LIKE ''%BELSHOP%'''+
           ' AND   be.cod_cliente='+VarToStr(EdtNFeCodFornLinx.AsInteger);
    DMBelShopPedidos.SQLQuery1.Close;
    DMBelShopPedidos.SQLQuery1.SQL.Clear;
    DMBelShopPedidos.SQLQuery1.SQL.Add(MySql);
    DMBelShopPedidos.SQLQuery1.Open;

    // ============== Verifica Existencia de Dados ===============================
    If Trim(DMBelShopPedidos.SQLQuery1.FieldByName('des_forn_linx').AsString)='' Then
    Begin
      DMBelShopPedidos.SQLQuery1.Close;
      msg('Fornecedor Não Encontrado !!','A');
      EdtNFeCodFornLinx.SetFocus;
      Exit;
    End;
    EdtNFeDesFornLinx.Text:=DMBelShopPedidos.SQLQuery1.FieldByName('des_forn_linx').AsString;

    // Busca OC do Fornecedor ==================================================
    MySql:=' SELECT FIRST 1 fo.des_forn_linx, fo.cod_forn_linx'+
           ' FROM OC_LOJAS_NFE fo'+
           ' WHERE fo.cod_loja_linx='+sgLojaLinx+
           ' AND   fo.cod_forn_linx='+VarToStr(EdtNFeCodFornLinx.AsInteger);
    DMBelShopPedidos.SQLQuery1.Close;
    DMBelShopPedidos.SQLQuery1.SQL.Clear;
    DMBelShopPedidos.SQLQuery1.SQL.Add(MySql);
    DMBelShopPedidos.SQLQuery1.Open;

    If Trim(DMBelShopPedidos.SQLQuery1.FieldByName('des_forn_linx').AsString)='' Then
    Begin
      If msg('Fornecedor Sem Ordem de Compra !'+cr+cr+'Deseja Continuar ??', 'C')=2 Then
      Begin
        Screen.Cursor:=crDefault;
        EdtNFeCodFornLinx.Clear;
        EdtNFeCodFornLinx.SetFocus;
        DMBelShopPedidos.SQLQuery1.Close;
        Exit;
      End; // If msg('Fornecedor Sem Ordem de Compra !'+cr+cr+'Deseja Continuar ??', 'C')=2 Then
    End;
    DMBelShopPedidos.SQLQuery1.Close;

    EdtNFeNumNFe.SetFocus;

    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmBelShopPedidos.Bt_NFeBuscaFornLinxClick(Sender: TObject);
Var
  MySql: String;
begin

  EdtNFeCodFornLinx.SetFocus;
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtNFeCodFornLinx.Clear;
  EdtNFeDesFornLinx.Clear;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ========================================================
  MySql:=' SELECT fo.nome_cliente DES_FORN_LINX,'+
         '        CASE'+
         '          WHEN char_length(TRIM(fo.doc_cliente))=14 THEN'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 1 FOR 2) || ''.'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 3 for 3) || ''.'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 6 for 3) || ''/'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 9 for 4) || ''-'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 13 for 2)'+
         '          WHEN char_length(TRIM(fo.doc_cliente))=11 THEN'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 1 for 3) || ''.'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 4 for 3) || ''.'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 7 for 3) || ''-'' ||'+
         '            SUBSTRING(TRIM(fo.doc_cliente) FROM 10 for 2)'+
         '          ELSE'+
         '            TRIM(fo.doc_cliente)'+
         '        End CNPJ_CPF,'+
         '        fo.razao_cliente RAXAO_SOCIAL,'+
         '        fo.cod_cliente COD_FORN_LINX'+
         ' FROM LINXCLIENTESFORNEC fo'+
         ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
         ' AND   TRIM(COALESCE(fo.nome_cliente,''''))<>'''''+
         ' AND   EXISTS(SELECT 1'+
         '              FROM LINXPRODUTOS pr'+
         '              WHERE pr.cod_fornecedor = fo.cod_cliente)'+

         ' UNION'+

         ' SELECT be.nome_cliente,'+
         '        CASE'+
         '          WHEN char_length(TRIM(be.doc_cliente))=14 THEN'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 1 FOR 2) || ''.'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 3 for 3) || ''.'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 6 for 3) || ''/'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 9 for 4) || ''-'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 13 for 2)'+
         '          WHEN char_length(TRIM(be.doc_cliente))=11 THEN'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 1 for 3) || ''.'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 4 for 3) || ''.'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 7 for 3) || ''-'' ||'+
         '            SUBSTRING(TRIM(be.doc_cliente) FROM 10 for 2)'+
         '          ELSE'+
         '            TRIM(be.doc_cliente)'+
         '        End CNPJ_CPF,'+
         '        be.razao_cliente RAXAO_SOCIAL,'+
         '        be.cod_cliente COD_FORN_LINX'+

         ' FROM LINXCLIENTESFORNEC be'+
         ' WHERE UPPER(be.nome_cliente) LIKE ''%BELSHOP%'''+

         ' ORDER BY 1';
  DMBelShopPedidos.CDS_Pesquisa.Close;
  DMBelShopPedidos.SQLQ_Pesquisa.Close;
  DMBelShopPedidos.SQLQ_Pesquisa.SQL.Clear;
  DMBelShopPedidos.SQLQ_Pesquisa.SQL.Add(MySql);
  DMBelShopPedidos.CDS_Pesquisa.Filtered:=False;
  DMBelShopPedidos.CDS_Pesquisa.Filter:='';
  DMBelShopPedidos.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShopPedidos.CDS_Pesquisa.FieldByName('des_forn_linx').AsString)='' Then
  Begin
    DMBelShopPedidos.CDS_Pesquisa.Close;
    msg('Sem Fornecedor a Listar !!','A');
    EdtNFeCodFornLinx.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='des_forn_linx';
  FrmPesquisa.Campo_Codigo:='cod_forn_linx';
  FrmPesquisa.Campo_Descricao:='des_forn_linx';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShopPedidos.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtNFeCodFornLinx.Text:=FrmPesquisa.EdtCodigo.Text;
     DMBelShopPedidos.CDS_OCItensCheck.Close;
     EdtNFeCodFornLinx.SetFocus;
     EdtNFeNumNFe.SetFocus;
   End
  Else
   Begin
     EdtNFeCodFornLinx.Clear;
     EdtNFeDesFornLinx.Clear;
     EdtNFeCodFornLinx.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmBelShopPedidos.Bt_NFeBuscaOCClick(Sender: TObject);
Var
  MySql: String;
begin
  EdtNFeNumOC.SetFocus;

  If EdtNFeCodFornLinx.AsInteger=0 Then
  Begin
    msg('Favor Informar o Fornecedor !!','A');
    EdtNFeCodFornLinx.SetFocus;
    Exit;
  End; // If EdtNFeCodFornLinx.AsInteger=0 Then

  If EdtNFeNumNFe.AsInteger=0 Then
  Begin
    msg('Favor Informar o Nº da NFE !!','A');
    EdtNFeNumNFe.SetFocus;
    Exit;
  End; // If EdtNFeNumNFe.AsInteger=0 Then Then

  EdtNFeNumOC.SetFocus;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtNFeNumOC.Clear;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT oc.num_oc, oc.dta_oc, oe.num_nfe,'+
         '        COUNT(oi.cod_produto_linx) Tot_Itens'+

         ' FROM OC_LOJAS_NFE oc'+
         '    LEFT JOIN OC_LOJAS_ITENS oi      ON oi.num_seq_oc=oc.num_seq_oc'+
         '    LEFT JOIN oc_lojas_itens_nfe oe  ON oe.num_seq_oc=oc.num_seq_oc'+
         '                                    AND oe.num_seq_item=oi.num_seq_item'+

         ' WHERE oc.cod_loja_linx='+sgLojaLinx+
         ' AND   oc.cod_forn_linx='+IntToStr(EdtNFeCodFornLinx.AsInteger)+
         ' GROUP BY 1, 2, 3'+
         ' ORDER BY 1 DESC';
  DMBelShopPedidos.CDS_Pesquisa.Close;
  DMBelShopPedidos.SQLQ_Pesquisa.Close;
  DMBelShopPedidos.SQLQ_Pesquisa.SQL.Clear;
  DMBelShopPedidos.SQLQ_Pesquisa.SQL.Add(MySql);
  DMBelShopPedidos.CDS_Pesquisa.Filtered:=False;
  DMBelShopPedidos.CDS_Pesquisa.Filter:='';
  DMBelShopPedidos.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShopPedidos.CDS_Pesquisa.FieldByName('Num_OC').AsString)='' Then
  Begin
    DMBelShopPedidos.CDS_Pesquisa.Close;
    msg('Sem Ordem de Compra a Listar !!','A');
    EdtNFeNumOC.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='num_oc';
  FrmPesquisa.Campo_Codigo:='num_oc';
  FrmPesquisa.Campo_Descricao:='num_oc';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShopPedidos.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtNFeNumOC.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtNFeNumOCExit(Self);
   End
  Else
   Begin
     EdtNFeNumOC.Clear;
     EdtNFeNumOC.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);

end;

procedure TFrmBelShopPedidos.EdtNFeNumNFeChange(Sender: TObject);
begin
  DMBelShopPedidos.CDS_OCItensCheck.Close;

  Lbx_NFeNumOCs.Items.Clear;
end;

procedure TFrmBelShopPedidos.EdtNFeNumOCExit(Sender: TObject);
Var
  MySql: String;
  i: Integer;
  bInfomado: Boolean;
begin
  If EdtNFeNumOC.Value<>0 Then
  Begin
    If EdtNFeCodFornLinx.AsInteger=0 Then
    Begin
      msg('Favor Informar o Fornecedor !!','A');
      EdtNFeNumOC.Clear;
      EdtNFeCodFornLinx.SetFocus;
      Exit;
    End; // If EdtNFeCodFornLinx.AsInteger=0 Then

    If EdtNFeNumNFe.AsInteger=0 Then
    Begin
      msg('Favor Informar o Nº da NFE !!','A');
      EdtNFeNumOC.Clear;
      EdtNFeNumNFe.SetFocus;
      Exit;
    End; // If EdtNFeNumNFe.AsInteger=0 Then Then

    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' SELECT oc.num_seq_oc, oc.dta_oc, oc.des_comprador, oc.sis_origem'+
           ' FROM OC_LOJAS_NFE oc'+
           ' WHERE oc.cod_loja_linx='+sgLojaLinx+
           ' AND   oc.cod_forn_linx='+IntToStr(EdtNFeCodFornLinx.AsInteger)+
           ' AND   oc.num_oc='+IntToStr(EdtNFeNumOC.AsInteger);
    DMBelShopPedidos.SQLQuery1.Close;
    DMBelShopPedidos.SQLQuery1.SQL.Clear;
    DMBelShopPedidos.SQLQuery1.SQL.Add(MySql);
    DMBelShopPedidos.SQLQuery1.Open;

    If Trim(DMBelShopPedidos.SQLQuery1.FieldByName('num_seq_oc').AsString)='' Then
    Begin
      msg('Ordem de Compra Não Encontrada!!!', 'A');
      Screen.Cursor:=crDefault;
      EdtNFeNumOC.Clear;
      EdtNFeNumOC.SetFocus;
      DMBelShopPedidos.SQLQuery1.Close;
      Exit;
    End;

    // Verifica se Já Informnado ===============================================
    bInfomado:=False;
    For i:=0 to Lbx_NFeNumOCs.Items.Count-1 do
    Begin
      If StrToInt(Lbx_NFeNumOCs.Items[i])=EdtNFeNumOC.AsInteger Then
      Begin
        bInfomado:=True;
        Break;
      End;
    End; // For i:=0 to Lbx_NFeNumOCs.Items.Count-1 do

    If Not bInfomado Then
    Begin
      Lbx_NFeNumOCs.Items.Add(EdtNFeNumOC.Text);
    End; // If Not bInfomado Then
    DMBelShopPedidos.SQLQuery1.Close;

    // Busca Ordens de Compra para CheckOut ==================================
    CheckOutBuscaOC;

    EdtNFeNumOC.Clear;
    EdtNFeNumOC.SetFocus;

    Screen.Cursor:=crDefault;
  End; // If EdtNFeNumOC.Value<>0 Then
end;

procedure TFrmBelShopPedidos.Bt_NFeEscanearClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_NFeProdutosOC.SetFocus;

  If EdtNFeCodFornLinx.AsInteger=0 Then
  Begin
    msg('Favor Informar o Fornecedor !!','A');
    EdtNFeNumOC.Clear;
    EdtNFeCodFornLinx.SetFocus;
    Exit;
  End; // If EdtNFeCodFornLinx.AsInteger=0 Then

  If EdtNFeNumNFe.AsInteger=0 Then
  Begin
    msg('Favor Informar o Nº da NFE !!','A');
    EdtNFeNumOC.Clear;
    EdtNFeNumNFe.SetFocus;
    Exit;
  End; // If EdtNFeNumNFe.AsInteger=0 Then Then

  // Cria OC NOVA ==============================================================
  If Lbx_NFeNumOCs.Items.Count<1 Then
  Begin
    If msg('Deseja Criar ORDEM DE COMPRA ??', 'C')=2 Then
     Exit;

    EdtNFeNumOC.Enabled:=False;
    Bt_NFeBuscaOC.Enabled:=False;
    Lbx_NFeNumOCs.Enabled:=False;

    // Busca Numero da Ordem de Compra Nova =======================================
    sgNrOCNova:=DMBelShopPedidos.OCBuscaNumeroOC(sgLojaSidicom, StrToInt(sgLojaLinx));
                                 //SIDICOM  // LINX
    Lbx_NFeNumOCs.Items.Add(sgNrOCNova);

    // Busca Num_Seq da OC =======================================================
    MySql:=' SELECT GEN_ID(GEN_OC_LOJAS,1) Num_Seq'+
           ' FROM RDB$DATABASE';
    DMBelShopPedidos.SQLQuery1.Close;
    DMBelShopPedidos.SQLQuery1.SQL.Clear;
    DMBelShopPedidos.SQLQuery1.SQL.Add(MySql);
    DMBelShopPedidos.SQLQuery1.Open;
    sgNumSeqOCNova:=DMBelShopPedidos.SQLQuery1.FieldByName('Num_Seq').AsString;
    DMBelShopPedidos.SQLQuery1.Close;

    bgOCNova:=True;
  End; // If Lbx_NFeNumOCs.Items.Count<1 Then

  Dbg_NFeProdutosOC.SetFocus;

  FrmLeitoraCodBarras:=TFrmLeitoraCodBarras.Create(Self);
  FrmLeitoraCodBarras.bgCheckOutSimples:=True;
  FrmLeitoraCodBarras.sgNumNFe:=IntToStr(EdtNFeNumNFe.AsInteger);

  FrmLeitoraCodBarras.ShowModal;
  FreeAndNil(FrmLeitoraCodBarras);

  // Se Oc foi Criada no Caso de Sem OC ========================================
  If Not Lbx_NFeNumOCs.Enabled Then
  Begin
    MySql:=' SELECT oc.num_seq_oc'+
           ' FROM OC_LOJAS_NFE oc'+
           ' WHERE oc.num_oc='+Lbx_NFeNumOCs.Items[0]+
           ' AND   oc.cod_forn_linx='+VarToStr(EdtNFeCodFornLinx.AsInteger)+
           ' AND   oc.cod_loja_linx='+sgLojaLinx;
    DMBelShopPedidos.CDS_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMBelShopPedidos.CDS_BuscaRapida.Open;

    If Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('num_seq_oc').AsString)='' Then
     Lbx_NFeNumOCs.Items.Clear;

    DMBelShopPedidos.CDS_BuscaRapida.Close;

    EdtNFeNumOC.Enabled:=True;
    Bt_NFeBuscaOC.Enabled:=True;
    Lbx_NFeNumOCs.Enabled:=True;
  End; // If Not Lbx_NFeNumOCs.Enabled Then

  Dbg_NFeProdutosOC.SetFocus;

end;

procedure TFrmBelShopPedidos.Lbx_NFeNumOCsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
Var
  bSelect: Boolean;
  i: Integer;
begin
  If Lbx_NFeNumOCs.Items.Count<1 Then
   Exit;

  // Exclui OC da Lista ========================================================
  If Key=Vk_Delete Then
  Begin
    bSelect:=False;
    For i:=0 to Lbx_NFeNumOCs.Items.Count-1 do
    Begin
      If Lbx_NFeNumOCs.Selected[i] Then
      Begin
        bSelect:=True;
        Break;
      End;
    End; // For i:=0 to Lbx_NFeNumOCs.Items.Count-1 do

    If Not bSelect Then
    Begin
      msg('Favor Selecionar a Ordem de Compra'+cr+cr+'a Excluir da Lista !!','A');
      Lbx_NFeNumOCs.SetFocus;
      Exit;
    End;

    If msg('Deseja Retira da Lista'+cr+cr+'a Ordem de Compra Selecionada !!','C')=2 Then
     Exit;

    Lbx_NFeNumOCs.DeleteSelected;

    // Busca Ordens de Compra para CheckOut ====================================
    CheckOutBuscaOC;
  End; // If Key=Vk_Delete Then

end;

procedure TFrmBelShopPedidos.EdtNFeCodFornLinxKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  If Key=VK_F9 Then
   Bt_NFeBuscaFornLinxClick(Self);
end;

procedure TFrmBelShopPedidos.EdtNFeNumOCKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  If Key=VK_F9 Then
   Bt_NFeBuscaOCClick(Self);

end;

procedure TFrmBelShopPedidos.Dbg_NFeProdutosOCDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  If (Column.FieldName='QTD_CHECKOUT') Then // Este comando altera cor da Celula
  Begin
    If DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger<>0 Then
    Begin
      // Checkout Fechado ======================================================
      If DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.AsInteger = DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWindowText; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clLime; // Cor da Celula
      End; // If DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

      // Checkout a Menor ======================================================
      If DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWindowText; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clAqua; // Cor da Celula
      End; // If DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

      // Checkout a Maior ======================================================
      If DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.AsInteger < DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWindowText; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clYellow; // Cor da Celula
      End; // If DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

      // Checkout de Produto Não Pertencente a OC ==============================
      If DMBelShopPedidos.CDS_OCItensCheckIND_OC.AsString='N' Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWhite; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clRed; // Cor da Celula
      End; // If DMBelShopPedidos.CDS_OCItensCheckIND_OC.AsString='N' Then

      Dbg_NFeProdutosOC.Canvas.FillRect(Rect);
      Dbg_NFeProdutosOC.DefaultDrawDataCell(Rect,Column.Field,state);
    End; // If DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger<>0 Then
  End;


{
  If (Column.FieldName='IND_OC') Or (Column.FieldName='COD_PRODUTO_LINX') Then // Este comando altera cor da Celula
  Begin
    If DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger<>0 Then
    Begin
      // Checkout Igual ========================================================
      If DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.AsInteger = DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWindowText; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clYellow; // Cor da Celula
      End; // If DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

      // Checkout a Menor ======================================================
      If DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWhite; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clBlue; // Cor da Celula
      End; // If DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

      // Checkout a Maior ======================================================
      If DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.AsInteger < DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWindowText; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clLime; // Cor da Celula
      End; // If DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.AsInteger > DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger Then

      // Checkout de produto Não Pertencente a OC ==============================
      If DMBelShopPedidos.CDS_OCItensCheckIND_OC.AsString='N' Then
      Begin
        Dbg_NFeProdutosOC.Canvas.Font.Style:=[fsBold];
        Dbg_NFeProdutosOC.Canvas.Font.Color:=clWhite; // Cor da Fonte
        Dbg_NFeProdutosOC.Canvas.Brush.Color:=clRed; // Cor da Celula
      End; // If DMBelShopPedidos.CDS_OCItensCheckIND_OC.AsString='N' Then

      Dbg_NFeProdutosOC.Canvas.FillRect(Rect);
      Dbg_NFeProdutosOC.DefaultDrawDataCell(Rect,Column.Field,state);
    End; // If DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.AsInteger<>0 Then
  End; // If (Column.FieldName='IND_OC') Then // Este comando altera cor da Celula
}
  // Alinhamento
  DMBelShopPedidos.CDS_OCItensCheckNUM_OC.Alignment:=taRightJustify;
  DMBelShopPedidos.CDS_OCItensCheckCOD_PRODUTO_LINX.Alignment:=taRightJustify;
  DMBelShopPedidos.CDS_OCItensCheckQTD_PRODUTO.Alignment:=taRightJustify;
  DMBelShopPedidos.CDS_OCItensCheckQTD_CHECKOUT.Alignment:=taRightJustify;
  DMBelShopPedidos.CDS_OCItensCheckDTA_CHECKOUT.Alignment:=taCenter;
  DMBelShopPedidos.CDS_OCItensCheckHRA_CHECKOUT.Alignment:=taCenter;
  DMBelShopPedidos.CDS_OCItensCheckIND_OC.Alignment:=taCenter;

end;

procedure TFrmBelShopPedidos.EdtNFeNumNFeExit(Sender: TObject);
Var
  MySql: String;
begin
  If (Trim(EdtNFeNumNFe.Text)<>'') and (Trim(EdtNFeCodFornLinx.Text)<>'') Then
  Begin
    MySql:=' SELECT DISTINCT o.num_oc'+
           ' FROM OC_LOJAS_NFE o, OC_LOJAS_ITENS_NFE n'+
           ' WHERE o.num_seq_oc=n.num_seq_oc'+
           ' AND   o.cod_loja_linx='+sgLojaLinx+
           ' AND   o.cod_forn_linx='+IntToStr(EdtNFeCodFornLinx.AsInteger)+
           ' AND   n.num_nfe='+IntToStr(EdtNFeNumNFe.AsInteger);
    DMBelShopPedidos.SQLQuery3.Close;
    DMBelShopPedidos.SQLQuery3.SQL.Clear;
    DMBelShopPedidos.SQLQuery3.SQL.Add(MySql);
    DMBelShopPedidos.SQLQuery3.Open;
    While Not DMBelShopPedidos.SQLQuery3.Eof do
    Begin
      EdtNFeNumOC.AsInteger:=DMBelShopPedidos.SQLQuery3.FieldByName('num_oc').AsInteger;
      EdtNFeNumOCExit(Self);

      DMBelShopPedidos.SQLQuery3.Next;
    End; // While Not DMBelShopPedidos.SQLQuery3.Eof do

    DMBelShopPedidos.SQLQuery3.Close;
  End; // If (Trim(EdtNFeNumNFe.Text)<>'')) and (Trim(EdtNFeCodFornLinx.Text)<>'')) Then
end;

procedure TFrmBelShopPedidos.Dbg_NFeProdutosOCEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_NFeProdutosOCEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmBelShopPedidos.Dbg_NFeProdutosOCTitleClick(Column: TColumn);
Var
  s, sPesquisa: String;
  b: Boolean;
  i: Integer;
begin

  If Not DMBelShopPedidos.CDS_OCItensCheck.IsEmpty Then
  Begin
    If (Column.FieldName<>'COD_PRODUTO_LINX') And (Column.FieldName<>'REFERENCIA') And (Column.FieldName<>'COD_PRODUTO_SIDI') Then
     Exit;

    i:=DMBelShopPedidos.CDS_OCItensCheck.RecNo;
    sPesquisa:='';
    b:=True;
    While b do
    Begin
      s:=DMBelShopPedidos.CDS_OCItensCheck.FieldByName(Column.FieldName).DisplayLabel;
      If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Try
           If Not DMBelShopPedidos.CDS_OCItensCheck.Locate(Column.FieldName, sPesquisa,[]) Then
           Begin
             If Not LocalizaRegistro(DMBelShopPedidos.CDS_OCItensCheck, Column.FieldName, sPesquisa) Then
             Begin
               DMBelShopPedidos.CDS_OCItensCheck.RecNo:=i;
               msg('Não Localizado !!','A');
               Exit;
             End;
           End; // If Not DMBelShopPedidos.CDS_OCItensCheck.Locate(Column.FieldName, sPesquisa,[]) Then
           Break;
         Except
           msg('Informação Inválida !!','A');
           Break;
         End;
       End
      Else // If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Break;
       End; // If InputQuery('Localizar: '+s,'',sPesquisa) then
    End; // While b do
  End; // If Not DMBelShopPedidos.CDS_OCItensCheck.IsEmpty Then
end;

procedure TFrmBelShopPedidos.Bt_ProdNegativosBuscaClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_ProdNegativos.SetFocus;

  OdirPanApres.Caption:='AGUARDE !! Localizando Produtos com Saldos Negativos...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShopPedidos.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShopPedidos.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmBelShopPedidos;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.cod_produto, p.nome , COALESCE(d.quantidade,0) QTD_ESTOQUE,'+
         ' CASE'+
         '   WHEN COALESCE(p.desativado,''N'')=''N'' THEN'+
         '    ''SIM'''+
         '   ELSE'+
         '    ''NÃO'''+
         ' END ATIVO'+
         ' FROM LINXPRODUTOS p, LINXPRODUTOSDETALHES d'+
         ' WHERE p.cod_produto=d.cod_produto'+
         ' AND   d.quantidade<0'+
         ' AND   d.empresa='+sgLojaLinx+
         ' ORDER BY 2';
  DMBelShopPedidos.CDS_ProdNegativos.Close;
  DMBelShopPedidos.SQLQ_ProdNegativos.Close;
  DMBelShopPedidos.SQLQ_ProdNegativos.SQL.Clear;
  DMBelShopPedidos.SQLQ_ProdNegativos.SQL.Add(MySql);
  DMBelShopPedidos.CDS_ProdNegativos.Open;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  If DMBelShopPedidos.CDS_ProdNegativos.IsEmpty Then
  Begin
    msg('SEM Produto Com'+cr+cr+'Saldo Negativo a Listar...','A');
    DMBelShopPedidos.CDS_ProdNegativos.Close;
  End; // If DMBelShopPedidos.CDS_ProdNegativos.IsEmpty Then

end;

procedure TFrmBelShopPedidos.Bt_ProdNegativosMemoriaClick(Sender: TObject);
begin
  Dbg_ProdNegativos.SetFocus;

  If DMBelShopPedidos.CDS_ProdNegativos.IsEmpty Then
   Exit;

  DBGridClipboard(Dbg_ProdNegativos);

end;

procedure TFrmBelShopPedidos.MenuVersaoClick(Sender: TObject);
begin
  EdtVersao.Transparent:=False;

  msg('Data da Última Alteração: '+Copy(DateTimeToStr(FileDateToDateTime(
      FileAge(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+
      ExtractFileName(Application.ExeName)))),1,19)+cr+cr+
      'Usuário Windows Atual'+cr+cr+sgNomeUsuario,'A');

end;

procedure TFrmBelShopPedidos.EdtVersaoStop(Sender: TObject);
begin
  EdtVersao.Transparent:=True;
end;

procedure TFrmBelShopPedidos.SubMenuCD_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBelShopPedidos.Image1DblClick(Sender: TObject);
begin
  If Mem_Odir.Visible Then
   Mem_Odir.Visible:=False
  Else
   Mem_Odir.Visible:=True;
end;

procedure TFrmBelShopPedidos.SBt_VoltarClick(Sender: TObject);
begin
  FechaTudo;
  AbreFechaTabSheet(False, True);

end;

procedure TFrmBelShopPedidos.SubMenuCD_SolicitacaoReposicaoClick(Sender: TObject);
Var
  MySql: String;
begin
  // ===========================================================================
  // Busca Solicitação do Dia ==================================================
  // ===========================================================================
  MySql:=' SELECT tr.dta_solicitacao, tr.num_solicitacao,'+
         '        tr.cod_prod_linx, TRIM(pr.nome) nome,'+
         '        tr.qtd_estoque, tr.qtd_transf'+
         ' FROM SOL_TRANSFERENCIA_CD tr, LINXPRODUTOS pr'+
         ' WHERE tr.cod_prod_linx=pr.cod_produto'+
         ' AND  tr.dta_solicitacao=CURRENT_DATE'+
         ' AND  tr.cod_loja_linx='+sgLojaLinx+
         ' ORDER BY pr.nome';
  DMBelShopPedidos.CDS_Solicitacao.Close;
  DMBelShopPedidos.CDS_Solicitacao.Filtered:=False;
  DMBelShopPedidos.CDS_Solicitacao.Filter:='';
  DMBelShopPedidos.SQLQ_Solicitacao.Close;
  DMBelShopPedidos.SQLQ_Solicitacao.SQL.Clear;
  DMBelShopPedidos.SQLQ_Solicitacao.SQL.Add(MySql);
  DMBelShopPedidos.CDS_Solicitacao.Open;
  sgNumSolicitacao:=DMBelShopPedidos.CDS_SolicitacaoNUM_SOLICITACAO.AsString;
  // Busca Solicitação do Dia ==================================================
  // ===========================================================================

  SelecionaTabSheet(Ts_SolicitacaoProdutos);
end;

procedure TFrmBelShopPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If PC_Principal.Visible Then
  Begin
    If Not MandaFechar Then
    Begin
      Action:=caNone;
      Exit;
    End;
  End; // If PC_Principal.Visible Then

  If msg('Deseja Realmente SAIR do SISTEMA ???', 'C')=2 Then
  Begin
    Action:=caNone;
    Exit;
  End;

  // Encerra Conexão ===========================================================
  If DMBelShopPedidos.SQLC.Connected Then
   DMBelShopPedidos.SQLC.Connected:=False;

end;

procedure TFrmBelShopPedidos.SubMenuCD_VerificarProdutosSolicitadosClick(Sender: TObject);
begin
  SelecionaTabSheet(Ts_SolicitacaoConsulta);

end;

procedure TFrmBelShopPedidos.SubMenuCD_ProdutosSaldoNegativoClick(Sender: TObject);
begin
  SelecionaTabSheet(Ts_ProdNegativos);

end;

procedure TFrmBelShopPedidos.SubMenuEN_CheckOutNFeEntradaClick(Sender: TObject);
Var
  iIndexCol: integer;
begin
  // ===========================================================================
  // Coluna de Endereçamento INVISIVEL para Lojas ==============================
  // ===========================================================================
  For iIndexCol:=0 to Dbg_NFeProdutosOC.Columns.Count-1 do
  Begin
    If Dbg_NFeProdutosOC.Columns[iIndexCol].FieldName='ENDERECO' Then
     Break;
  End; // For iIndexCol:=0 to Dbg_NFeProdutosOC.Columns.Count-1 do

  Dbg_NFeProdutosOC.Columns[iIndexCol].Visible:=True;
  If sgLojaLinx<>'2' Then
  Begin
    Dbg_NFeProdutosOC.Columns[iIndexCol].Visible:=False;
  End; // If sgLojaLinx<>'2' Then
  // Coluna de Endereçamento INVISIVEL para Lojas ==============================
  // ===========================================================================
  SelecionaTabSheet(Ts_NFeCheckOut);
end;

procedure TFrmBelShopPedidos.SubMenuPCC_PedidoComprasClick(Sender: TObject);
begin
  msg('Opção em Desenvolvimento !!','A');
  Exit;
end;

end.
