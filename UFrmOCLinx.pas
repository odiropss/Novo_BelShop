unit UFrmOCLinx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, ExtCtrls,
  dxStatusBar, Grids, DBGrids, DBGridJul, JvXPCheckCtrls, JvExStdCtrls,
  JvEdit, JvValidateEdit, ToolEdit, DBCtrls, JvRadioButton, JvCheckBox,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Mask, CurrEdit,
  JvExControls, JvXPCore, JvXPButtons, ComCtrls, Menus, dxGDIPlusClasses,
  DBXpress, Math, AppEvnts, cxLocalization;

type
  TFrmOCLinx = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    PopM_GeraOCLinx: TPopupMenu;
    PopM_GeraOCVoltar1: TMenuItem;
    N29: TMenuItem;
    PopM_GeraOCExportaParaOutroDocto: TMenuItem;
    N26: TMenuItem;
    PopM_GeraOCComparaPedidos: TMenuItem;
    N30: TMenuItem;
    PopM_GeraOCValorUnitario: TMenuItem;
    PopM_GeraOCPercDesconto: TMenuItem;
    N42: TMenuItem;
    PopM_GeraOCNecessidadedeCompra: TMenuItem;
    DiasInformados: TMenuItem;
    N43: TMenuItem;
    ZeraQuantidadeAComprar: TMenuItem;
    N31: TMenuItem;
    PopM_GeraOCLegendaCores: TMenuItem;
    N33: TMenuItem;
    PopM_GeraOCVoltar2: TMenuItem;
    N37: TMenuItem;
    PopM_OCRomaneioLinx: TPopupMenu;
    PopM_OCRomaneioVoltar: TMenuItem;
    N32: TMenuItem;
    PopM_OCRomaneioMarcarOCsAbertas: TMenuItem;
    PopM_OCRomaneioDesmarcarRomaneiosDesmarcar: TMenuItem;
    N35: TMenuItem;
    PopM_OCRomaneioVoltar1: TMenuItem;
    N36: TMenuItem;
    PC_OrdemCompra: TPageControl;
    Ts_OCBuscaProdutos: TTabSheet;
    Pan_OC: TPanel;
    Panel22: TPanel;
    Bt_OCFechar: TJvXPButton;
    Bt_OCBuscaProdutos: TJvXPButton;
    Panel8: TPanel;
    Label70: TLabel;
    Edt_OCTotProdutos: TCurrencyEdit;
    Pan_CalculoOC: TPanel;
    GB_CalculoMeses: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Bevel1: TBevel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Bevel2: TBevel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Bevel3: TBevel;
    Label34: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Bevel4: TBevel;
    Bevel13: TBevel;
    CB_Mes1: TComboBox;
    ME_Ano2: TMaskEdit;
    CB_Mes2: TComboBox;
    ME_Ano3: TMaskEdit;
    CB_Mes3: TComboBox;
    ME_Ano4: TMaskEdit;
    CB_Mes4: TComboBox;
    CB_Mes5: TComboBox;
    ME_Ano5: TMaskEdit;
    CB_Mes6: TComboBox;
    ME_Ano6: TMaskEdit;
    ME_Ano1: TMaskEdit;
    CB_Mes7: TComboBox;
    ME_Ano7: TMaskEdit;
    CB_Mes8: TComboBox;
    ME_Ano8: TMaskEdit;
    Ts_OCGeraOrdemCompra: TTabSheet;
    Panel33: TPanel;
    Gb_GeraOCItem: TGroupBox;
    Dbe_GeraOCCodItem: TDBEdit;
    Dbe_GeraOCDescItem: TDBEdit;
    Dbe_GeraOCDescFilial: TDBEdit;
    Gb_GeraOCDocto: TGroupBox;
    EdtGeraOCBuscaDocto: TCurrencyEdit;
    DtEdt_GeraOCDataDocto: TDateEdit;
    Bt_GeraOCBuscaDocto: TJvXPButton;
    Bt_GeraOCExcluir: TJvXPButton;
    Gb_GeraOCCalculaCompra: TGroupBox;
    Label48: TLabel;
    EdtGeraOCDias: TJvValidateEdit;
    Bt_GeraOCCalcular: TJvXPButton;
    Gb_GeraOCEstoqueTransito: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Ckb_GeraOCCalculoEstoque: TJvXPCheckbox;
    Ckb_GeraOCCalculoTransito: TJvXPCheckbox;
    PC_GeraOCProduto: TPageControl;
    Ts_GeraOCProdutos: TTabSheet;
    Dbg_GeraOCProdutos: TDBGridJul;
    Panel4: TPanel;
    PC_GeraOCFiliais: TPageControl;
    Ts_GeraOCFiliais: TTabSheet;
    Dbg_GeraOCFiliais: TDBGridJul;
    Panel3: TPanel;
    PC_GeraOCApresentacao: TPageControl;
    Ts_GeraOCGrid: TTabSheet;
    Dbg_GeraOCGrid: TDBGridJul;
    Ts_GeraOCOrdensCompra: TTabSheet;
    Panel35: TPanel;
    Label39: TLabel;
    Lab_ItensOC: TLabel;
    Lab_Qtds_OC: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    EdtGeraOCTotalGeral: TCurrencyEdit;
    Bt_GeraOCGeraOC: TJvXPButton;
    Bt_GeraOCImpEditOC: TJvXPButton;
    DbeGeraOCTotalProdutos: TDBEdit;
    DbeGeraOCQtdOCs: TDBEdit;
    Bt_GeraOCGraficoImprime: TJvXPButton;
    Bt_GeraOCGraficoEdit: TJvXPButton;
    Dbg_GeraOCTotalGeral: TDBGridJul;
    Sb_GeraOC: TdxStatusBar;
    PC_Filtros: TPageControl;
    TS_FiltroFornecedor: TTabSheet;
    Gb_FiltroFornecedor: TGroupBox;
    Label188: TLabel;
    EdtFiltroCodForn: TCurrencyEdit;
    Bt_FiltroBuscaForn: TJvXPButton;
    Painel_FiltroOC: TPanel;
    Gb_CalculoCurvaABC: TGroupBox;
    Ckb_CalculoCurvaTodas: TJvXPCheckbox;
    Ckb_CalculoCurvaA: TJvXPCheckbox;
    Ckb_CalculoCurvaB: TJvXPCheckbox;
    Ckb_CalculoCurvaC: TJvXPCheckbox;
    Ckb_CalculoCurvaD: TJvXPCheckbox;
    Ckb_CalculoCurvaE: TJvXPCheckbox;
    Gb_CalculoTpCurvaABC: TGroupBox;
    Rb_CalculoTpCurvaABCMix: TJvRadioButton;
    Rb_CalculoTpCurvaABCMpms: TJvRadioButton;
    Rb_CalculoTpCurvaABCLoja: TJvRadioButton;
    Gb_CalculoApresCurva: TGroupBox;
    Lb_CalculoApresCurva: TLabel;
    Rb_CalculoApresCurvaEstCom: TJvRadioButton;
    Rb_CalculoApresCurvaEstSem: TJvRadioButton;
    Ckb_CalculoApresCurvaFora: TJvXPCheckbox;
    Rb_CalculoApresCurvaEstAmbos: TJvRadioButton;
    Dbg_FiltroFornecedores: TDBGridJul;
    TS_FiltroProdutos: TTabSheet;
    Gb_FiltroProduto: TGroupBox;
    Label3: TLabel;
    EdtFiltroCodProduto: TCurrencyEdit;
    Bt_FiltroBuscaProdtudo: TJvXPButton;
    Painel_FiltroNaoCompra: TPanel;
    Gb_CalculoUtilizarProdNaoCompra: TGroupBox;
    Label190: TLabel;
    Ckb_FiltroProdNaoCompra: TJvXPCheckbox;
    Gb_CalculoFiltroNome: TGroupBox;
    Label186: TLabel;
    Label203: TLabel;
    Label204: TLabel;
    Label205: TLabel;
    EdtCalculoFiltroNome1: TEdit;
    EdtCalculoFiltroNome4: TEdit;
    EdtCalculoFiltroNome3: TEdit;
    EdtCalculoFiltroNome2: TEdit;
    Dbg_FiltroProduto: TDBGridJul;
    TS_FiltroGrupos: TTabSheet;
    Gb_FiltroGrupos: TGroupBox;
    EdtFiltroCodGrupo: TCurrencyEdit;
    Bt_FiltroBuscaGrupo: TJvXPButton;
    Panel27: TPanel;
    Dbg_FiltroGruposProdutos: TDBGridJul;
    Gb_FiltroSubGrupos: TGroupBox;
    Panel32: TPanel;
    Dbg_FiltroSubGruposProdutos: TDBGridJul;
    EdtFiltroCodSubGrupo: TCurrencyEdit;
    Bt_FiltroBuscaSubGrupo: TJvXPButton;
    TS_FiltroAplicacao: TTabSheet;
    Gb_OCAplicacao: TGroupBox;
    Label4: TLabel;
    EdtOCCodAplicacao: TCurrencyEdit;
    Bt_OCBuscaAplicacao: TJvXPButton;
    Dbg_OCAplicacao: TDBGridJul;
    TS_FiltroFamiliaPreco: TTabSheet;
    Gb_OCFamiliaPrecos: TGroupBox;
    Label5: TLabel;
    EdtOCCodFamiliaPrecos: TCurrencyEdit;
    Bt_OCBuscaFamiliaPrecos: TJvXPButton;
    Dbg_OCFamiliaPrecos: TDBGridJul;
    TS_FiltroGrupoST: TTabSheet;
    Gb_FiltroGruposST: TGroupBox;
    Label6: TLabel;
    EdtFiltroCodGrupoST: TCurrencyEdit;
    Bt_FiltroBuscaGrupoST: TJvXPButton;
    Dbg_FiltroGrupoST: TDBGridJul;
    TS_FiltroComprovantes: TTabSheet;
    Gb_FiltroComprov: TGroupBox;
    Label14: TLabel;
    EdtFiltroCodComprov: TCurrencyEdit;
    Bt_FiltroBuscaComprov: TJvXPButton;
    Dbg_FiltroComprov: TDBGridJul;
    Panel1: TPanel;
    Panel5: TPanel;
    Gb_CalculoProdNovos: TGroupBox;
    DtEdt_CalculoProdNovos: TcxDateEdit;
    Gb_CalculoTransito: TGroupBox;
    DtEdt_CalculoTransito: TcxDateEdit;
    CkB_CalculoTransito: TJvCheckBox;
    Gb_EmpresaProc: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Lb_EmpAprocessar: TLabel;
    Lb_EmpProcessadas: TLabel;
    OdirPanApres: TPanel;
    Image1: TImage;
    ApplicationEvents1: TApplicationEvents;
    Trad_Localizer: TcxLocalizer;
    Label73: TLabel;
    Ckb_FiltroProdSoNaoCompra: TJvXPCheckbox;
    Label1: TLabel;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_OCFecharClick(Sender: TObject);

    // Odir ====================================================================

    Procedure InicializaMesesLinx;
    Procedure MontaSelectFornecedoresLinx;
    Procedure NomeMesesGridLinx;

    Procedure TotaisOCLinx(sNrDoc: String);

    // Desabilita e Habilita Scroll do Mouse no DBGrid
    Procedure DesabilitaScrollMouse(var Msg: TMsg; var Handled: Boolean);
    Procedure HabilitaScrollMouse(var Msg: TMsg; var Handled: Boolean);

    // ORDEM DE COMPRA /////////////////////////////////////////////////////////
    Function  ConsisteBuscaProdutos: Boolean;

    Function  BuscaProdutosAnalise: Boolean;

    Procedure CriaPedidoOC;
    Procedure AtualizaNumeroDosMeses;
    Procedure MontaDemandasNovo(sFilial: String);

    Procedure BuscaDemanda(sCodProduto: String; var iNrDias: Integer; Var iNrMeses: Integer);

    Procedure OCCalculaSugTransfExc(sNrDoc, sDtaDoc: String); // Calcula Sugestões / Transferencias / Estoque Excedente
    ////////////////////////////////////////////////////////////////////////////

    // DIVERSOS ////////////////////////////////////////////////////////////////
    Procedure SelecionaProdutos(bProd, bLike: Boolean);
                             // bProd = True - Seleciona Produto (Codigo)
                             // bLike = True - Seleciona Produto (Nome)
                             // Like Montado com Alias < pr. >
                             //      USAR: MySql:=MySql+f_Troca('pr.','p.',sgLikeProdutos);
    ////////////////////////////////////////////////////////////////////////////

    // Odir ====================================================================

    procedure PC_GeraOCApresentacaoChange(Sender: TObject);
    procedure PC_OrdemCompraChange(Sender: TObject);
    procedure PC_FiltrosChange(Sender: TObject);
    procedure Ckb_CalculoCurvaTodasClick(Sender: TObject);
    procedure Ckb_CalculoCurvaTodasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Rb_CalculoTpCurvaABCLojaClick(Sender: TObject);
    procedure Ckb_CalculoApresCurvaForaClick(Sender: TObject);
    procedure Ts_OCBuscaProdutosEnter(Sender: TObject);
    procedure CkB_CalculoTransitoClick(Sender: TObject);
    procedure CkB_CalculoTransitoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ts_OCGeraOrdemCompraExit(Sender: TObject);
    procedure EdtGeraOCBuscaDoctoChange(Sender: TObject);
    procedure EdtGeraOCBuscaDoctoEnter(Sender: TObject);
    procedure EdtGeraOCBuscaDoctoExit(Sender: TObject);
    procedure Bt_GeraOCBuscaDoctoClick(Sender: TObject);
    procedure Bt_GeraOCExcluirClick(Sender: TObject);
    procedure Ckb_GeraOCCalculoEstoqueClick(Sender: TObject);
    procedure Ckb_GeraOCCalculoEstoqueKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_GeraOCCalculoTransitoClick(Sender: TObject);
    procedure Ckb_GeraOCCalculoTransitoKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Bt_GeraOCCalcularClick(Sender: TObject);
    procedure Bt_GeraOCGeraOCClick(Sender: TObject);
    procedure Dbg_GeraOCProdutosEnter(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_GeraOCProdutosExit(Sender: TObject);
    procedure Dbg_GeraOCProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PC_GeraOCProdutoChange(Sender: TObject);
    procedure PC_GeraOCFiliaisChange(Sender: TObject);
    procedure Dbg_GeraOCFiliaisDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_GeraOCFiliaisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_GeraOCGridColEnter(Sender: TObject);
    procedure Dbg_GeraOCGridColExit(Sender: TObject);
    procedure Dbg_GeraOCGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_GeraOCGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_GeraOCImpEditOCClick(Sender: TObject);
    procedure Dbg_GeraOCTotalGeralDblClick(Sender: TObject);
    procedure Dbg_GeraOCTotalGeralDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_OCBuscaProdutosClick(Sender: TObject);
    procedure EdtFiltroCodFornExit(Sender: TObject);
    procedure Bt_FiltroBuscaFornClick(Sender: TObject);
    procedure EdtFiltroCodProdutoExit(Sender: TObject);
    procedure Dbg_FiltroFornecedoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_FiltroProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_FiltroBuscaProdtudoClick(Sender: TObject);
    procedure PopM_GeraOCVoltar1Click(Sender: TObject);
    procedure PopM_GeraOCExportaParaOutroDoctoClick(Sender: TObject);
    procedure Ckb_FiltroProdNaoCompraClick(Sender: TObject);
    procedure Ckb_FiltroProdNaoCompraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopM_GeraOCComparaPedidosClick(Sender: TObject);
    procedure PopM_GeraOCValorUnitarioClick(Sender: TObject);
    procedure PopM_GeraOCPercDescontoClick(Sender: TObject);
    procedure DiasInformadosClick(Sender: TObject);
    procedure ZeraQuantidadeAComprarClick(Sender: TObject);
    procedure PopM_GeraOCLegendaCoresClick(Sender: TObject);
    procedure PopM_OCRomaneioMarcarOCsAbertasClick(Sender: TObject);
    procedure PopM_OCRomaneioDesmarcarRomaneiosDesmarcarClick(
      Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    sEmpTelefone, sEmpCcontato, sEmpEmail,
    sFornEndereco, sFornCidade, sFornEstado, sFornCodCep, sFornFone1,
    sFornFoneFax, sFornEmail, sFornContato: String;
  end;

var
  FrmOCLinx: TFrmOCLinx;

  sgCodEmp, sgDesLoja: String;

  wgDiaH, wgMesH, wgAnoH: Word;

  bgSairLinx, bgEnterTab: Boolean;

  sgOrderGrid,
  sgFornecedoresLinx,
  sgLikeProdutosLinx, sgProdutosLinx: String;

  igNumSeqPed: Integer;
  sgNumPed: String;

implementation

uses DK_Procs1, UDMBelShop, UDMRelatorio, UDMVirtual, UPesquisa,
  UFrmBelShop, UFrmOCObservacao, DB, UFrmSelectEmpProcessamento, UDMLinx,
  UFrmSolicitacoes;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// ORDEM DE COMPRA - Calcula Sugestões / Transferencias / Estoque Excedente >>>>
Procedure TFrmOCLinx.OCCalculaSugTransfExc(sNrDoc, sDtaDoc: String);
Var
  MySql: String;
  cQtdSugerida: Currency; // EST_MINIMO - cQtdSugerida Se Zero Utiliza Qtd_Sugerida
Begin

  OdirPanApres.Caption:='AGUARDE !! Gerando Sugestões de Compras...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmOCLinx.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmOCLinx.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmOCLinx;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  Try
    sDtaDoc:=DateToStr(StrToDateTime(sDtaDoc));
  Except
    Try
      sDtaDoc:=DateToStr(StrToDateTime(f_Troca('.','/',f_Troca('-','/',sDtaDoc))));
    Except
      sDtaDoc:=DateToStr(StrToDateTime(f_Troca('/','.',f_Troca('-','.',sDtaDoc))));
    End;
  End;

  Try // IBQ_OC_ComprarAdd
   If Not DMBelShop.IBT_BelShop.Active Then
   Begin
     DMBelShop.IBT_BelShop.StartTransaction;
   End;

    // Calcula Matriz ==========================================================
    FrmBelShop.MontaProgressBar(True, FrmOCLinx);

    // Busca Pedido -------------------------------------------------
    MySql:=' SELECT *'+
           ' FROM  OC_COMPRAR OC'+
           ' WHERE oc.num_documento='+sNrDoc+
           ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaDoc)))+
           ' AND   oc.ind_oc_gerada=''N'''+
           ' ORDER BY oc.Des_Item';
    DMBelShop.IBQ_OC_ComprarAdd.Close;
    DMBelShop.IBQ_OC_ComprarAdd.SQL.Clear;
    DMBelShop.IBQ_OC_ComprarAdd.SQL.Add(MySql);
    DMBelShop.IBQ_OC_ComprarAdd.Open;

    DMBelShop.IBQ_OC_ComprarAdd.Last;
    pgProgBar.Properties.Max:=DMBelShop.IBQ_OC_ComprarAdd.RecordCount;
    pgProgBar.Position:=0;
    DMBelShop.IBQ_OC_ComprarAdd.First;
    While not DMBelShop.IBQ_OC_ComprarAdd.Eof do
    Begin
      Application.ProcessMessages;
      pgProgBar.Position:=DMBelShop.IBQ_OC_ComprarAdd.RecNo;

      cQtdSugerida:=-1;

      DMBelShop.IBQ_OC_ComprarAdd.Edit;

      // QTD_SUGERIDA
      DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency:=RoundTo(
             (DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_MEDIA_DIA').AsCurrency*
              DMBelShop.IBQ_OC_ComprarAdd.FieldByName('DIAS_ESTOCAGEM').AsInteger),0);

      // Analisa Estoque Minimo
      If DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency<DMBelShop.IBQ_OC_ComprarAdd.FieldByName('EST_MINIMO').AsCurrency Then
      Begin
        cQtdSugerida:=DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency;

        DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency:=
               DMBelShop.IBQ_OC_ComprarAdd.FieldByName('EST_MINIMO').AsCurrency;
      End;

      DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency:=RoundTo(
         (DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency-
          DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_DISPONIVEL').AsCurrency),0);

      If DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency<0 Then
      Begin
        DMBelShop.IBQ_OC_ComprarAdd.FieldByName('IND_QTD_ACIMA').AsCurrency:=Abs(
              DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency);

        DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency:=0;
      End;

      // QTD_SUGERIDA_ANO
      DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA_ANO').AsCurrency:=RoundTo(
               (DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_DEMANDA_DIA').AsCurrency*
                DMBelShop.IBQ_OC_ComprarAdd.FieldByName('DIAS_ESTOCAGEM').AsInteger),0);

      If DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA_ANO').AsCurrency<
         DMBelShop.IBQ_OC_ComprarAdd.FieldByName('EST_MINIMO').AsCurrency Then
       DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA_ANO').AsCurrency:=
               DMBelShop.IBQ_OC_ComprarAdd.FieldByName('EST_MINIMO').AsCurrency;

      DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA_ANO').AsCurrency:=
         DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA_ANO').AsCurrency-
           DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_DISPONIVEL').AsCurrency;

      If DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA_ANO').AsCurrency<0 Then
       DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA_ANO').AsCurrency:=0;

      // QTD_ACOMPRAR
      If cQtdSugerida<0 Then // Não Processa Pelo estoque Minimo
       DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_ACOMPRAR').AsCurrency:=
              DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency
      Else
       DMBelShop.IBQ_OC_ComprarAdd.FieldByName('QTD_ACOMPRAR').AsCurrency:=cQtdSugerida;

      DMBelShop.IBQ_OC_ComprarAdd.Post;

      DMBelShop.IBQ_OC_ComprarAdd.Next;
    End; // While not DMBelShop.IBQ_OC_ComprarAdd.Eof do

    // Atualiza Transacao ======================================================
    DMBelShop.IBQ_OC_ComprarAdd.ApplyUpdates;
    DMBelShop.IBT_BelShop.CommitRetaining;
    DMBelShop.IBT_BelShop.Commit;

    DMBelShop.IBQ_OC_ComprarAdd.Close;

    // Atualiza OC_COMPRAR_DOCS ================================================
    OC_COMPRAR_DOCS('I', sNrDoc, 'Linx');

    // Atualiza Totais ----------------------------------
    DMBelShop.Doc_CalculaValores(sNrDoc, sDtaDoc);

    FrmBelShop.MontaProgressBar(False, FrmOCLinx);
    OdirPanApres.Visible:=False;
  Except // Try // IBQ_OC_ComprarAdd
    On e : Exception do
    Begin
      // Abandona Transacao ====================================================
      OdirPanApres.Visible:=False;
      FrmBelShop.MontaProgressBar(False, FrmOCLinx);

      DMBelShop.IBT_BelShop.Rollback;

      DMBelShop.IBQ_OC_ComprarAdd.Close;

      msg('Erro na Geração das Sugestões de Compra !!'+cr+cr+'Filial: '+sCodMatriz +' !!','A');
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // On e : Exception do
  End; // Try // IBQ_OC_ComprarAdd
End; // ORDEM DE COMPRA - Calcula Sugestões / Transferencias / Estoque Excedente

// ORDEM DE COMPRA - Busca Demanda e Numeros de Dias e Meses >>>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.BuscaDemanda(sCodProduto: String; var iNrDias: Integer; Var iNrMeses: Integer);
Var
  ii: Integer;
  sDta, MySql: String;
  sDem1, sDem2, sDem3, sDem4, sDem5, sDem6, sDem7, sDem8: String;

  dDta: TDateTime;

  sCase, sCaseDiasMeses, sIN: String;
  sDateSeparator: String;
Begin

  // Busca de Demandas =========================================================
  DMBelShop.CDS_DemandasNovo.Filter:='CodProduto='+QuotedStr(sCodProduto);
  DMBelShop.CDS_DemandasNovo.Filtered:=True;

  sDem1:='0';
  If DMBelShop.CDS_DemandasNovo.Locate('Demanda','Dem1',[]) Then
   sDem1:=DMBelShop.CDS_DemandasNovo.FieldByName('Dem').AsString;

  If StrToIntDef(sMes2,0)<>0 Then
  Begin
    sDem2:='0';
    If DMBelShop.CDS_DemandasNovo.Locate('Demanda','Dem2',[]) Then
     sDem2:=DMBelShop.CDS_DemandasNovo.FieldByName('Dem').AsString;
  End;

  If StrToIntDef(sMes3,0)<>0 Then
  Begin
    sDem3:='0';
    If DMBelShop.CDS_DemandasNovo.Locate('Demanda','Dem3',[]) Then
     sDem3:=DMBelShop.CDS_DemandasNovo.FieldByName('Dem').AsString;
  End;

  If StrToIntDef(sMes4,0)<>0 Then
  Begin
    sDem4:='0';
    If DMBelShop.CDS_DemandasNovo.Locate('Demanda','Dem4',[]) Then
     sDem4:=DMBelShop.CDS_DemandasNovo.FieldByName('Dem').AsString;
  End;

  If StrToIntDef(sMes5,0)<>0 Then
  Begin
    sDem5:='0';
    If DMBelShop.CDS_DemandasNovo.Locate('Demanda','Dem5',[]) Then
     sDem5:=DMBelShop.CDS_DemandasNovo.FieldByName('Dem').AsString;
  End;

  If StrToIntDef(sMes6,0)<>0 Then
  Begin
    sDem6:='0';
    If DMBelShop.CDS_DemandasNovo.Locate('Demanda','Dem6',[]) Then
     sDem6:=DMBelShop.CDS_DemandasNovo.FieldByName('Dem').AsString;
  End;

  If StrToIntDef(sMes7,0)<>0 Then
  Begin
    sDem7:='0';
    If DMBelShop.CDS_DemandasNovo.Locate('Demanda','Dem7',[]) Then
     sDem7:=DMBelShop.CDS_DemandasNovo.FieldByName('Dem').AsString;
  End;

  If StrToIntDef(sMes8,0)<>0 Then
  Begin
    sDem8:='0';
    If DMBelShop.CDS_DemandasNovo.Locate('Demanda','Dem8',[]) Then
     sDem8:=DMBelShop.CDS_DemandasNovo.FieldByName('Dem').AsString;
  End;

  // Calculo numero de Dias e Meses ==========================================
  iNrDias:=0;
  iNrMeses:=0;
  DecodeDate(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor), wgAnoH, wgMesH, wgDiaH);

  sDateSeparator:=DateSeparator;
  DateSeparator:='/';

  cgDemAno:=0;
  cgDemAnoDia:=0;
  DMBelShop.CDS_DemandasNovo.First;
  While Not DMBelShop.CDS_DemandasNovo.Eof do
  Begin
    ii:=StrToInt(copy(DMBelShop.CDS_DemandasNovo.FieldByName('dta_ref').AsString,4,2));

    // Demandas Meses -------------------------------------------
    If Trim(DMBelShop.CDS_DemandasNovo.FieldByName('Demanda').AsString)<>'ANO' Then
    Begin
      // NÃO Conta Mês Atual ------------------------------------
      If AnsiUpperCase(ShortMonthNames[wgMesH])+IntToStr(wgAnoH)<>
         AnsiUpperCase(ShortMonthNames[ii])+copy(DMBelShop.CDS_DemandasNovo.FieldByName('dta_ref').AsString,7,4) Then
      Begin
        Inc(iNrMeses);
      End;

      If Trim(DMBelShop.CDS_DemandasNovo.FieldByName('Demanda').AsString)<>'ANO' Then
      Begin
         iNrDias:=iNrDias+DMBelShop.CDS_DemandasNovo.FieldByName('Num_Dias').AsInteger;
      End;
    End; // If Trim(DMBelShop.CDS_DemandasNovo.FieldByName('Demanda').AsString)<>'ANO' Then

    // Demandas Ano ---------------------------------------------
    If Trim(DMBelShop.CDS_DemandasNovo.FieldByName('Demanda').AsString)='ANO' Then
    Begin
      cgDemAno   :=DMBelShop.CDS_DemandasNovo.FieldByName('Dem').AsCurrency;

      // Verifica Dias Uteis ------------------------------------
      If (Trim(DMBelShop.CDS_DemandasNovo.FieldByName('dta_ref').AsString)='') Or
         (DMBelShop.CDS_DemandasNovo.FieldByName('dta_ref').AsDateTime<=StrToDate(sgDtaIniAno)) Then
       Begin
         igNrDiasAno:=DMBelShop.CDS_DemandasNovo.FieldByName('Num_Dias').AsInteger;
       End
      Else if (DMBelShop.CDS_DemandasNovo.FieldByName('dta_ref').AsDateTime>StrToDate(sgDtaFimAno)) Then
       Begin
        igNrDiasAno:=1;
       End
      Else
       Begin
         igNrDiasAno:=DiasUteisBelShop(DMBelShop.CDS_DemandasNovo.FieldByName('dta_ref').AsDateTime, StrToDate(sgDtaFimAno)-1, False, True);
       End; // If Trim(DMVirtual.CDS_V_EstoquesDTA_INCLUSAO.AsString)='' Then

      cgDemAnoDia:=cgDemAno/igNrDiasAno;
    End; // If Trim(DMBelShop.CDS_DemandasNovo.FieldByName('Demanda').AsString)='ANO' Then

    DMBelShop.CDS_DemandasNovo.Next;
  End; // While Not DMBelShop.CDS_DemandasNovo.Eof do

  If sDateSeparator='/' Then DateSeparator:='/' Else DateSeparator:='.';

  // Monta SQL com as Demandas ===============================================
  MySql:='Select '+sDem1+' Dem1';
         If sDem2<>'' Then MySql:=MySql+', '+sDem2+' Dem2';
         If sDem3<>'' Then MySql:=MySql+', '+sDem3+' Dem3';
         If sDem4<>'' Then MySql:=MySql+', '+sDem4+' Dem4';
         If sDem5<>'' Then MySql:=MySql+', '+sDem5+' Dem5';
         If sDem6<>'' Then MySql:=MySql+', '+sDem6+' Dem6';
         If sDem7<>'' Then MySql:=MySql+', '+sDem7+' Dem7';
         If sDem8<>'' Then MySql:=MySql+', '+sDem8+' Dem8';
  MySql:=
   MySql+' From RDB$DATABASE';
  DMBelShop.CDS_Demandas.Close;
  DMBelShop.SDS_Demandas.CommandText:=MySql;
  DMBelShop.CDS_Demandas.Open;

  // Busca de Demandas Novo - Limpa Filtra ===================================
  DMBelShop.CDS_DemandasNovo.Filtered:=False;
  DMBelShop.CDS_DemandasNovo.Filter:='';

End; // ORDEM DE COMPRA - Busca Demanda e Numeros de Dias e Meses >>>>>>>>>>>>>>

// ORDEM DE COMPRA - Monta Demandas para Novo Calculo do Compras >>>>>>>>>>>>>>>
Procedure TFrmOCLinx.MontaDemandasNovo(sFilial: String);
Var
  sDta, MySql: String;
  dDta: TDateTime;
  sCase, sIN, sCaseDiasMeses: String;
Begin
  // Monta Scripts para Buscar Demandas ======================================
  dDta:=DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor);
  sCaseDiasMeses:=' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
                  '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) ='+
                  '      ''01.''||Cast(lpad(extract(month from current_date),2,''0'') as varchar(2))||''.''||'+
                  '               Cast(lpad(extract(Year  from current_date),4,''0'') as varchar(4)) Then '+
                  IntToStr(DiasUteisBelShop(PrimUltDia(dDta,'P'), dDta, False, True));

  sDta:='';
  If StrToIntDef(sMes1,0)<>0 Then
  Begin
    sDta:=QuotedStr('01.'+sMes1+'.'+ME_Ano1.Text);

    sCase:=
     sCase+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
           '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then ''Dem1''';

    dDta:=EncodeDate(StrToInt(ME_Ano1.Text), StrToInt(sMes1), 1);
    sCaseDiasMeses:=
     sCaseDiasMeses+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
                    '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then '+IntToStr(DiasUteisBelShop(dDta, PrimUltDia(dDta,'U'), False, True));

    If sIN='' Then sIN:=sDta Else sIN:=sIN+', '+sDta;
  End;

  If StrToIntDef(sMes2,0)<>0 Then
  Begin
    sDta:=QuotedStr('01.'+sMes2+'.'+ME_Ano2.Text);

    sCase:=
     sCase+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
           '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then ''Dem2''' ;

    dDta:=EncodeDate(StrToInt(ME_Ano2.Text), StrToInt(sMes2), 1);
    sCaseDiasMeses:=
     sCaseDiasMeses+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
                    '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then '+IntToStr(DiasUteisBelShop(dDta, PrimUltDia(dDta,'U'), False, True));

    If sIN='' Then sIN:=sDta Else sIN:=sIN+', '+sDta;
  End;

  If StrToIntDef(sMes3,0)<>0 Then
  Begin
    sDta:=QuotedStr('01.'+sMes3+'.'+ME_Ano3.Text);

    sCase:=
     sCase+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
           '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then ''Dem3''';

    dDta:=EncodeDate(StrToInt(ME_Ano3.Text), StrToInt(sMes3), 1);
    sCaseDiasMeses:=
     sCaseDiasMeses+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
                    '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then '+IntToStr(DiasUteisBelShop(dDta, PrimUltDia(dDta,'U'), False, True));

    If sIN='' Then sIN:=sDta Else sIN:=sIN+', '+sDta;
  End;

  If StrToIntDef(sMes4,0)<>0 Then
  Begin
    sDta:=QuotedStr('01.'+sMes4+'.'+ME_Ano4.Text);

    sCase:=
     sCase+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
           '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then ''Dem4''';

    dDta:=EncodeDate(StrToInt(ME_Ano4.Text), StrToInt(sMes4), 1);
    sCaseDiasMeses:=
     sCaseDiasMeses+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
                    '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then '+IntToStr(DiasUteisBelShop(dDta, PrimUltDia(dDta,'U'), False, True));

    If sIN='' Then sIN:=sDta Else sIN:=sIN+', '+sDta;
  End;

  If StrToIntDef(sMes5,0)<>0 Then
  Begin
    sDta:=QuotedStr('01.'+sMes5+'.'+ME_Ano5.Text);

    sCase:=
     sCase+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
           '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then ''Dem5''';

    dDta:=EncodeDate(StrToInt(ME_Ano5.Text), StrToInt(sMes5), 1);
    sCaseDiasMeses:=
     sCaseDiasMeses+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
                    '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then '+IntToStr(DiasUteisBelShop(dDta, PrimUltDia(dDta,'U'), False, True));

    If sIN='' Then sIN:=sDta Else sIN:=sIN+', '+sDta;
  End;

  If StrToIntDef(sMes6,0)<>0 Then
  Begin
    sDta:=QuotedStr('01.'+sMes6+'.'+ME_Ano6.Text);

    sCase:=
     sCase+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
           '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then ''Dem6''';

    dDta:=EncodeDate(StrToInt(ME_Ano6.Text), StrToInt(sMes6), 1);
    sCaseDiasMeses:=
     sCaseDiasMeses+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
                    '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then '+IntToStr(DiasUteisBelShop(dDta, PrimUltDia(dDta,'U'), False, True));

    If sIN='' Then sIN:=sDta Else sIN:=sIN+', '+sDta;
  End;

  If StrToIntDef(sMes7,0)<>0 Then
  Begin
    sDta:=QuotedStr('01.'+sMes7+'.'+ME_Ano7.Text);

    sCase:=
     sCase+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
           '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then ''Dem7''';

    dDta:=EncodeDate(StrToInt(ME_Ano7.Text), StrToInt(sMes7), 1);
    sCaseDiasMeses:=
     sCaseDiasMeses+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
                    '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then '+IntToStr(DiasUteisBelShop(dDta, PrimUltDia(dDta,'U'), False, True));

    If sIN='' Then sIN:=sDta Else sIN:=sIN+', '+sDta;
  End;

  If StrToIntDef(sMes8,0)<>0 Then
  Begin
    sDta:=QuotedStr('01.'+sMes8+'.'+ME_Ano8.Text);

    sCase:=
     sCase+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
           '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then ''Dem8''';

    dDta:=EncodeDate(StrToInt(ME_Ano8.Text), StrToInt(sMes8), 1);
    sCaseDiasMeses:=
     sCaseDiasMeses+' When ''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
                    '               Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) = '+sDta+' Then '+IntToStr(DiasUteisBelShop(dDta, PrimUltDia(dDta,'U'), False, True));

    If sIN='' Then sIN:=sDta Else sIN:=sIN+', '+sDta;
  End;

  sIN:='('+sIN+')';

  // Busca Demandas ==========================================================
  MySql:=' Select CAST(LPAD(ml.cod_produto,6,'''') AS VARCHAR(6)) CodProduto,'+
         ' CAST(''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
         '          Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) as Date) Dta_Ref,'+
         ' Case '+sCase+' End Demanda,'+
         ' Case '+sCaseDiasMeses+' End Num_Dias,'+
         ' CAST(SUM(ml.quantidade) AS NUMERIC(12,2)) DEM'+

         ' FROM LINXMOVIMENTO ml, LINXPRODUTOS pr'+
         ' WHERE ml.cod_produto=pr.cod_produto'+
         ' AND   ml.operacao=''S'''+
         ' AND   ((ml.tipo_transacao=''V'') OR (ml.tipo_transacao IS NULL))'+
         ' AND   ml.cancelado=''N'''+
         ' AND   ml.excluido=''N'''+
         ' AND   pr.desativado=''N'''+
         ' AND   cast(''01.''||Cast(lpad(extract(month from ml.data_documento),2,''0'') as varchar(2))||''.''||'+
         '                     Cast(lpad(extract(Year  from ml.data_documento),4,''0'') as varchar(4)) as Date) in '+sIN+
         ' AND   ml.empresa='+sFilial;

         // Fornecedores --------------------------------------------
         If Trim(sgFornecedoresLinx)<>'' Then
          MySql:=
           MySql+' AND pr.cod_fornecedor in ('+sgFornecedoresLinx+')';

         If Not Ckb_FiltroProdNaoCompra.Checked Then
          MySql:=
           MySql+' AND NOT ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))'
         Else If (Ckb_FiltroProdNaoCompra.Checked) And (Ckb_FiltroProdSoNaoCompra.Checked)  Then
          MySql:=
           MySql+' AND ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))';

         // Produtos Codigos e/ou Produtos Like ---------------------
         If (Trim(sgProdutosLinx)<>'') And (Trim(sgLikeProdutosLinx)<>'') Then
          MySql:=
           MySql+' AND (pr.Cod_Produto in ('+sgProdutosLinx+') Or '+sgLikeProdutosLinx+')'
         Else If Trim(sgProdutosLinx)<>'' Then
          MySql:=
           MySql+' AND pr.Cod_Produto in ('+sgProdutosLinx+')'
         Else If Trim(sgLikeProdutosLinx)<>'' Then
          MySql:=
           MySql+' AND '+sgLikeProdutosLinx;

  MySql:=
   MySql+' Group by 1,2,3,4'+

         ' UNION';

  MySql:=
   MySql+' SELECT CAST(LPAD(pr.cod_produto,6,'''') AS VARCHAR(6)) CodProduto,'+
         ' CAST(''01.''||Cast(lpad(extract(month from pr.dta_atualizacao),2,''0'') as varchar(2))||''.''||'+
         '          Cast(lpad(extract(Year  from pr.dta_atualizacao),4,''0'') as varchar(4)) AS DATE) Dta_Ref,'+
         ' ''ANO'' Demanda,'+
         IntToStr(igNrDiasAno)+' Num_Dias,'+
         ' SUM(COALESCE(ma.quantidade,0)) dem'+

         ' FROM LINXMOVIMENTO ma, LINXPRODUTOS pr'+
         ' WHERE ma.cod_produto=pr.cod_produto'+
         ' AND   ma.operacao=''S'''+
         ' AND   ((ma.tipo_transacao=''V'') OR (ma.tipo_transacao IS NULL))'+
         ' AND   ma.cancelado=''N'''+
         ' AND   ma.excluido=''N'''+
         ' AND   pr.desativado=''N'''+
         ' AND   ma.data_documento Between '+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaIniAno)))+
                                     ' AND '+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaFimAno)))+
          ' AND   ma.empresa='+sFilial;

         // Fornecedores --------------------------------------------
         If Trim(sgFornecedoresLinx)<>'' Then
          MySql:=
           MySql+' AND pr.cod_fornecedor in ('+sgFornecedoresLinx+')';

         If Not Ckb_FiltroProdNaoCompra.Checked Then
          MySql:=
           MySql+' AND NOT ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))'
         Else If (Ckb_FiltroProdNaoCompra.Checked) And (Ckb_FiltroProdSoNaoCompra.Checked)  Then
          MySql:=
           MySql+' AND ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))';

         // Produtos Codigos e/ou Produtos Like ---------------------
         If (Trim(sgProdutosLinx)<>'') And (Trim(sgLikeProdutosLinx)<>'') Then
          MySql:=
           MySql+' AND (pr.Cod_Produto in ('+sgProdutosLinx+') Or '+sgLikeProdutosLinx+')'
         Else If Trim(sgProdutosLinx)<>'' Then
          MySql:=
           MySql+' AND pr.Cod_Produto in ('+sgProdutosLinx+')'
         Else If Trim(sgLikeProdutosLinx)<>'' Then
          MySql:=
           MySql+' AND '+sgLikeProdutosLinx;

  MySql:=
   MySql+' Group by 1, 2'+
         ' ORDER BY 1, 2';
  DMBelShop.CDS_DemandasNovo.Close;
  DMBelShop.CDS_DemandasNovo.Filtered:=False;
  DMBelShop.CDS_DemandasNovo.Filter:='';
  DMBelShop.SDS_DemandasNovo.CommandText:=MySql;
  DMBelShop.CDS_DemandasNovo.Open;

End; // ORDEM DE COMPRA - Monta Demandas para Novo Calculo do Compras >>>>>>>>>>

// ORDEM DE COMPRA - Atualiza Numero dos Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.AtualizaNumeroDosMeses;
Var
  MySql: String;
Begin
  sMes1:='0';
  sMes2:='0';
  sMes3:='0';
  sMes4:='0';
  sMes5:='0';
  sMes6:='0';
  sMes7:='0';
  sMes8:='0';

  sMes1:=FormatFloat('00',CB_Mes1.ItemIndex+1);
  sAno1:=Trim(ME_Ano1.Text);

  sMes2:=FormatFloat('00',CB_Mes2.ItemIndex);
  sAno2:=Trim(ME_Ano2.Text);

  sMes3:=FormatFloat('00',CB_Mes3.ItemIndex);
  sAno3:=Trim(ME_Ano3.Text);

  sMes4:=FormatFloat('00',CB_Mes4.ItemIndex);
  sAno4:=Trim(ME_Ano4.Text);

  sMes5:=FormatFloat('00',CB_Mes5.ItemIndex);
  sAno5:=Trim(ME_Ano5.Text);

  sMes6:=FormatFloat('00',CB_Mes6.ItemIndex);
  sAno6:=Trim(ME_Ano6.Text);

  sMes7:=FormatFloat('00',CB_Mes7.ItemIndex);
  sAno7:=Trim(ME_Ano7.Text);

  sMes8:=FormatFloat('00',CB_Mes8.ItemIndex);
  sAno8:=Trim(ME_Ano8.Text);

  // Guarde Mese para Demonstratrar no Grid ====================================
  MySql:='Insert Into OC_COMPRAR_MESES'+
         ' Values('+sgNumPed+', '+
         QuotedStr(CB_Mes1.Text+'/'+ME_Ano1.Text)+', ';

         If CB_Mes2.ItemIndex<>0 Then
          MySql:=MySql+QuotedStr(CB_Mes2.Text+'/'+ME_Ano2.Text)+', '
         Else
          MySql:=MySql+'Null, ';

         If CB_Mes3.ItemIndex<>0 Then
          MySql:=MySql+QuotedStr(CB_Mes3.Text+'/'+ME_Ano3.Text)+', '
         Else
          MySql:=MySql+'Null, ';

         If CB_Mes4.ItemIndex<>0 Then
          MySql:=MySql+QuotedStr(CB_Mes4.Text+'/'+ME_Ano4.Text)+', '
         Else
          MySql:=MySql+'Null, ';

         If CB_Mes5.ItemIndex<>0 Then
          MySql:=MySql+QuotedStr(CB_Mes5.Text+'/'+ME_Ano5.Text)+', '
         Else
          MySql:=MySql+'Null, ';

         If CB_Mes6.ItemIndex<>0 Then
          MySql:=MySql+QuotedStr(CB_Mes6.Text+'/'+ME_Ano6.Text)+', '
         Else
          MySql:=MySql+'Null, ';

         If CB_Mes7.ItemIndex<>0 Then
          MySql:=MySql+QuotedStr(CB_Mes7.Text+'/'+ME_Ano7.Text)+', '
         Else
          MySql:=MySql+'Null, ';

         If CB_Mes8.ItemIndex<>0 Then
          MySql:=MySql+QuotedStr(CB_Mes8.Text+'/'+ME_Ano8.Text)+')'
         Else
          MySql:=MySql+'Null)';
  DMBelShop.SQLC.Execute(MySql,nil,nil);

End; // ORDEM DE COMPRA - Atualiza Numero dos Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>

// ORDEM DE COMPRA - Novo Calculode Pedido de Compra do Linx >>>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.CriaPedidoOC;
Var
  s, ss, MySql: String;
  b: Boolean;
  i: Integer;

  iQtdMediaDia, iQtdMediaMes: Integer; // Indices dos Campos para Calcular Depois

  sDta_Ref, sCodForn,  sNomeForn: String;
  cQuant_Ref, cPreco, cPrecoUnit, cVlr_Total_Ref, cQtdTransito,
  cMediaMes, cDemanda: Currency;

  // Tributação
  sCOD_ICMS, sEstado, sTIP_PESSOA,
  sCodICM, sSittributaria, sSomaIPIBase, sSomaFreteBase, sSomaDespesaBase,
  sSubstituicao, sSubstValPer, sSomaIPIBaseSubst, sSomaFreteBaseST,
  sSomaDespesaBaseST: String;
  cAliquota, cReducao, cSubstMargem, cSubstAliquota, cAliqRepasse: Currency;
Begin
  // Atualiza Numero dos Meses =================================================
  AtualizaNumeroDosMeses;

  //============================================================================
  // Novo Processo de Calculo Usando IBQ_OC_ComprarAdd =========================
  //============================================================================
  Try // IBQ_OC_ComprarAdd
    If Not DMBelShop.IBT_BelShop.Active Then
     DMBelShop.IBT_BelShop.StartTransaction;

    pgProgBar.Properties.Max:=DMLinx.CDS_OCProdLinx.RecordCount;
    pgProgBar.Position:=0;
    Edt_OCTotProdutos.Value:=DMLinx.CDS_OCProdLinx.RecordCount;

    // Monta Demandas ==========================================================
    MontaDemandasNovo(IntToStr(igCodLojaLinx));

    // Efetua o Calculo Para Analise Matriz ====================================
    sCOD_ICMS  :='';
    sEstado    :='';
    sTIP_PESSOA:='';

    DMBelShop.IBQ_OC_ComprarAdd.Close;
    DMBelShop.IBQ_OC_ComprarAdd.SQL.Clear;
    DMBelShop.IBQ_OC_ComprarAdd.SQL.Add(' Select *');
    DMBelShop.IBQ_OC_ComprarAdd.SQL.Add(' From oc_comprar oc');
    DMBelShop.IBQ_OC_ComprarAdd.SQL.Add(' Where oc.num_documento<1');
    DMBelShop.IBQ_OC_ComprarAdd.Open;

    DMLinx.CDS_OCProdLinx.First;
    While not DMLinx.CDS_OCProdLinx.Eof do
    Begin
      Application.ProcessMessages;
      pgProgBar.Position:=DMLinx.CDS_OCProdLinx.RecNo;

// CURVA ABC - OdirApagar
//      bgProcCurva:=True;
//      b:=False;
//      While Not b do // Verifica se Existe na Tabela ES_FINAN_CURVA_ABC
//      Begin
//        If DMBelShop.CDS_Join.Locate('COD_PRODUTO',DMLinx.CDS_OCProdLinx.FieldByName('COD_ITEM').AsString,[]) Then
//         Begin
//           b:=True;
//
//           // Curvas Por Loja ou Por MPMS
//           If ((Gb_CalculoTpCurvaABC.Visible) Or (Gb_CalculoApresCurva.Visible)) and (Gb_CalculoApresCurva.Visible) Then
//           Begin
//             If (DMBelShop.CDS_Join.FieldByName('Usar_Curva').AsString='NAO') and (Not Ckb_CalculoApresCurvaFora.Checked) Then
//              Begin
//                bgProcCurva:=False;
//              End
//             Else If (DMBelShop.CDS_Join.FieldByName('Usar_Curva').AsString='NAO') and (Ckb_CalculoApresCurvaFora.Checked) Then
//              Begin
//                If (Rb_CalculoApresCurvaEstCom.Checked) and (DMLinx.CDS_OCProdLinx.FieldByName('QTD_SALDO').AsInteger=0) Then
//                  bgProcCurva:=False
//                Else If (Rb_CalculoApresCurvaEstSem.Checked) and (DMLinx.CDS_OCProdLinx.FieldByName('QTD_SALDO').AsInteger<>0) Then
//                  bgProcCurva:=False
//              End;
//           End; // If Gb_CalculoTpCurvaABC.Visible Then
//         End
//        Else // If DMBelShop.CDS_Join.Locate('COD_PRODUTO',DMLinx.CDS_OCProdLinx.FieldByName('COD_ITEM').AsString,[]) Then
//         Begin
//           If (StrToDate(DMLinx.CDS_OCProdLinx.FieldByName('DATAINCLUSAO').AsString)>=StrToDate(f_Troca('.','/',f_Troca('-','/',sgDtaInicio)))) Or
//              (StrToDate(DMLinx.CDS_OCProdLinx.FieldByName('DATAALTERACAO').AsString)>=StrToDate(f_Troca('.','/',f_Troca('-','/',sgDtaInicio)))) Then
//            Begin
//              DMBelShop.CDS_Join.Locate('IND_CURVA','E',[]);
//              MySql:=DMBelShop.CDS_Join.FieldByName('DIAS_ESTOCAGEM').AsString;
//              DMBelShop.CDS_Join.Insert;
//              DMBelShop.CDS_Join.FieldByName('COD_LOJA').AsString:=sCodMatriz;
//              DMBelShop.CDS_Join.FieldByName('COD_PRODUTO').AsString:=DMLinx.CDS_OCProdLinx.FieldByName('COD_ITEM').AsString;
//              DMBelShop.CDS_Join.FieldByName('IND_CURVA').AsString:='E';
//              DMBelShop.CDS_Join.FieldByName('DATAINCLUSAO').AsString:=DMLinx.CDS_OCProdLinx.FieldByName('DATAINCLUSAO').AsString;
//              DMBelShop.CDS_Join.FieldByName('EST_MINIMO').AsString:='3';
//              DMBelShop.CDS_Join.FieldByName('USAR_CURVA').AsString:='SIM';
//              DMBelShop.CDS_Join.FieldByName('DIAS_ESTOCAGEM').AsString:=MySql;
//            End
//           Else
//            Begin
//              bgProcCurva:=False;
//              b:=True;
//            End;
//         End;
//      End; // While Not b do // Verifica se Existe na Tabela ES_FINAN_CURVA_ABC

//Ultima Compra e Transito - OdirApagar
//      // Ultima Compra ----------------------------------------------
//      sDta_Ref:='';
//      sCodForn:='';
//      sNomeForn:='';
//      cQuant_Ref:=0;
//      cPreco:=0;
//      cPrecoUnit:=0;
//      cVlr_Total_Ref:=0;
//
//      s :=Trim(DMLinx.CDS_OCProdLinx.FieldByName('COD_EMPRESA').AsString)(;
//      ss:=Trim(DMLinx.CDS_OCProdLinx.FieldByName('COD_ITEM').AsString);
//      If DMBelShop.CDS_UltCompraTransito.Locate('CodFilial;CodProduto;Tipo',VarArrayOf([s, ss, 'UC']),[]) Then
//       Begin
//         sDta_Ref      :=DMBelShop.CDS_UltCompraTransito.FieldByName('Dta_Ref').AsString;
//         sCodForn      :=DMBelShop.CDS_UltCompraTransito.FieldByName('CodFornecedor').AsString;
//         sNomeForn     :=DMBelShop.CDS_UltCompraTransito.FieldByName('NomeFornecedor').AsString;
//         cQuant_Ref    :=DMBelShop.CDS_UltCompraTransito.FieldByName('Quant_Ref').AsCurrency;
//         cPreco        :=DMBelShop.CDS_UltCompraTransito.FieldByName('Preco').AsCurrency;
//         cPrecoUnit    :=DMBelShop.CDS_UltCompraTransito.FieldByName('Preco').AsCurrency;
//         cVlr_Total_Ref:=DMBelShop.CDS_UltCompraTransito.FieldByName('Vlr_Total_Ref').AsCurrency;
//       End
//      Else If DMBelShop.CDS_UltCompraTransito.Locate('CodProduto;Tipo',VarArrayOf([ss, 'UC']),[]) Then
//       Begin
//         cPrecoUnit    :=DMBelShop.CDS_UltCompraTransito.FieldByName('Preco').AsCurrency;
//       End;// If DMBelShop.CDS_UltCompraTransito.Locate('CodFilial;CodProduto;Tipo',VarArrayOf([s, ss, 'UC']),[]) Then
//
//      // Transito ---------------------------------------------------
//      cQtdTransito:=0;
//      If DMBelShop.CDS_UltCompraTransito.Locate('CodFilial;CodProduto;Tipo',VarArrayOf([s, ss, 'TR']),[]) Then
//      Begin
//        cQtdTransito  :=DMBelShop.CDS_UltCompraTransito.FieldByName('Quant_Ref').AsCurrency;
//      End; // If DMBelShop.CDS_UltCompraTransito.Locate('CodFilial;CodProduto;Tipo',VarArrayOf([s, ss, 'TR']),[]) Then

      // Inicializa Variaveis de Demanda ---------------------------------------
      igNrDias:=0;
      igNrMeses:=0;
      cgOutras_Demandas:=0;
      cgTotal_Demandas:=0;

      // Busca Demandas e Totais Dias para Mes 1 -------------------------------
      BuscaDemanda(DMLinx.CDS_OCProdLinx.FieldByName('Cod_Item').AsString,igNrDias, igNrMeses);

      // Tributação ------------------------------------------------------------
      If (sCOD_ICMS  <>DMLinx.CDS_OCProdLinx.FieldByName('COD_ICMS').AsString) Or
         (sEstado    <>DMLinx.CDS_OCProdLinx.FieldByName('Estado').AsString)   Or
         (sTIP_PESSOA<>DMLinx.CDS_OCProdLinx.FieldByName('TIP_PESSOA').AsString) Then
      Begin
        sCodICM           :='';
        sSittributaria    :='';
        sSubstituicao     :='';
        sSomaIPIBase      :='N';
        sSomaFreteBase    :='N';
        sSomaDespesaBase  :='N';
        sSomaIPIBaseSubst :='N';
        sSomaFreteBaseST  :='N';
        sSomaDespesaBaseST:='N';
        cReducao          :=0;
        cAliquota         :=0;
        cSubstMargem      :=0;
        sSubstValPer      :='P';
        cSubstAliquota    :=0;
        cAliqRepasse      :=0;

        sCOD_ICMS  :=DMLinx.CDS_OCProdLinx.FieldByName('COD_ICMS').AsString;
        sEstado    :=DMLinx.CDS_OCProdLinx.FieldByName('Estado').AsString;
        sTIP_PESSOA:=DMLinx.CDS_OCProdLinx.FieldByName('TIP_PESSOA').AsString;

// OdirApagar
//        If IBQ_ConsultaMatriz.Locate('CODICM;CODESTADO;REVENDACONSUMOFJ',VarArrayOf([sCOD_ICMS,sEstado,sTIP_PESSOA]),[]) Then
//        Begin
//          sCodICM           :=IBQ_ConsultaMatriz.FieldByName('CODICM').AsString;
//          sSittributaria    :=IBQ_ConsultaMatriz.FieldByName('SITTRIBUTARIA').AsString;
//          sSomaIPIBase      :=IBQ_ConsultaMatriz.FieldByName('SOMAIPIBASE').AsString;
//          sSomaFreteBase    :=IBQ_ConsultaMatriz.FieldByName('SOMAFRETEBASE').AsString;
//          sSomaDespesaBase  :=IBQ_ConsultaMatriz.FieldByName('SOMADESPESABASE').AsString;
//          sSubstituicao     :=IBQ_ConsultaMatriz.FieldByName('SUBSTITUICAO').AsString;
//          sSubstValPer      :=IBQ_ConsultaMatriz.FieldByName('SUBSTVALPER').AsString;
//          sSomaIPIBaseSubst :=IBQ_ConsultaMatriz.FieldByName('SOMAIPIBASESUBST').AsString;
//          sSomaFreteBaseST  :=IBQ_ConsultaMatriz.FieldByName('SOMAFRETEBASEST').AsString;
//          sSomaDespesaBaseST:=IBQ_ConsultaMatriz.FieldByName('SOMADESPESABASEST').AsString;
//          cAliquota         :=IBQ_ConsultaMatriz.FieldByName('ALIQUOTA').AsCurrency;
//          cReducao          :=IBQ_ConsultaMatriz.FieldByName('REDUCAO').AsCurrency;
//          cSubstMargem      :=IBQ_ConsultaMatriz.FieldByName('SUBSTMARGEM').AsCurrency;
//          cSubstAliquota    :=IBQ_ConsultaMatriz.FieldByName('SUBSTALIQUOTA').AsCurrency;
//          cAliqRepasse      :=IBQ_ConsultaMatriz.FieldByName('ALIQREPASSE').AsCurrency;
//        End; // If IBQ_ConsultaMatriz.Locate('CODICM;CODESTADO;REVENDACONSUMOFJ',VarArrayOf([sCOD_ICMS,sEstado,sTIP_PESSOA]),[]) Then
      End; // If (sCOD_ICMS  <>DMLinx.CDS_OCProdLinx.FieldByName('COD_ICMS').AsString) Or

      // Num_Seq de Documento --------------------------------------------------
      Inc(igNumSeqPed);

      // Insere Documento OC_COMPRAR -------------------------------------------
      DMBelShop.IBQ_OC_ComprarAdd.Insert;
      For i:=0 to DMLinx.CDS_OCProdLinx.FieldCount-1 do
      Begin
        // Trata Campos =============================================

        If AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='NUM_SEQ' Then
         DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsInteger:=igNumSeqPed

        Else If AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='NUM_DOCUMENTO' Then
         DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsInteger:=StrToInt(sgNumPed)

        Else if (AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_DEM_MES1') And (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem1').AsString)<>'') Then
         Begin
           cgTotal_Demandas:=cgTotal_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem1').AsCurrency;

           DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsCurrency:=DMBelShop.CDS_Demandas.FieldByName('Dem1').AsCurrency;
         End

        Else if (AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_DEM_MES2') And (StrToIntDef(sMes2,0)<>0) And
                (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem2').AsString)<>'') Then
         Begin
           cgOutras_Demandas:=cgOutras_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem2').AsCurrency;
           cgTotal_Demandas:=cgTotal_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem2').AsCurrency;

           DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsCurrency:=DMBelShop.CDS_Demandas.FieldByName('Dem2').AsCurrency;
         End

        Else if (AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_DEM_MES3') And (StrToIntDef(sMes3,0)<>0) And
                (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem3').AsString)<>'') Then
         Begin
           cgOutras_Demandas:=cgOutras_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem3').AsCurrency;
           cgTotal_Demandas:=cgTotal_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem3').AsCurrency;

           DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsCurrency:=DMBelShop.CDS_Demandas.FieldByName('Dem3').AsCurrency;
         End

        Else if (AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_DEM_MES4') And (StrToIntDef(sMes4,0)<>0) And
                (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem4').AsString)<>'') Then
         Begin
           cgOutras_Demandas:=cgOutras_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem4').AsCurrency;
           cgTotal_Demandas:=cgTotal_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem4').AsCurrency;

           DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsCurrency:=DMBelShop.CDS_Demandas.FieldByName('Dem4').AsCurrency;
         End

        Else if (AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_DEM_MES5') And (StrToIntDef(sMes5,0)<>0) And
                (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem5').AsString)<>'') Then
         Begin
           cgOutras_Demandas:=cgOutras_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem5').AsCurrency;
           cgTotal_Demandas:=cgTotal_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem5').AsCurrency;

           DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsCurrency:=DMBelShop.CDS_Demandas.FieldByName('Dem5').AsCurrency;
         End

        Else if (AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_DEM_MES6') And (StrToIntDef(sMes6,0)<>0) And
                (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem6').AsString)<>'') Then
         Begin
           cgOutras_Demandas:=cgOutras_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem6').AsCurrency;
           cgTotal_Demandas:=cgTotal_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem6').AsCurrency;

           DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsCurrency:=DMBelShop.CDS_Demandas.FieldByName('Dem6').AsCurrency;
         End

        Else if (AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_DEM_MES7') And (StrToIntDef(sMes7,0)<>0) And
                (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem7').AsString)<>'') Then
         Begin
           cgOutras_Demandas:=cgOutras_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem7').AsCurrency;
           cgTotal_Demandas:=cgTotal_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem7').AsCurrency;

           DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsCurrency:=DMBelShop.CDS_Demandas.FieldByName('Dem7').AsCurrency;
         End

        Else if (AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_DEM_MES8') And (StrToIntDef(sMes8,0)<>0) And
                (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem8').AsString)<>'') Then
         Begin
           cgOutras_Demandas:=cgOutras_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem8').AsCurrency;
           cgTotal_Demandas:=cgTotal_Demandas+DMBelShop.CDS_Demandas.FieldByName('Dem8').AsCurrency;

           DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsCurrency:=DMBelShop.CDS_Demandas.FieldByName('Dem8').AsCurrency;
         End

        Else if AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_NR_DIAS' Then
         DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsInteger:=igNrDias

        Else if AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_NR_MESES' Then
         DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsInteger:=igNrMeses

        Else if AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_TOT_MESES' Then
         DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsInteger:=igTotMeses

        Else if AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_MEDIA_MES' Then
         iQtdMediaMes:=i

        Else if (AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_MEDIA_DIA') Then
         iQtdMediaDia:=i

        Else If AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_DEMANDA_DIA' Then
         DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsCurrency:=cgDemAnoDia

        Else If AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_DEMANDA_ANO' Then
         DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsCurrency:=cgDemAno

        Else If AnsiUpperCase(DMLinx.CDS_OCProdLinx.Fields[i].FieldName)='QTD_DIAS_ANO' Then
         DMBelShop.IBQ_OC_ComprarAdd.Fields[i].AsInteger:=igNrDiasAno

        Else
         DMBelShop.IBQ_OC_ComprarAdd.Fields[i].Assign(DMLinx.CDS_OCProdLinx.Fields[i]);

      End; // For i:=0 to DMLinx.CDS_OCProdLinx.FieldCount-1 do

      // Acerta Media (QTD_MEDIA_MES) ============================================
      If igNrMeses<igTotMeses Then
       Begin
         If igNrMeses<>0 Then
          cMediaMes:=RoundTo((cgOutras_Demandas/igNrMeses),-4)
         Else
          cMediaMes:=0;
       End
      Else
       Begin
         cMediaMes:=RoundTo((cgTotal_Demandas/igTotMeses),-4);
       End; // If igNrMeses<igTotMeses Then

       DMBelShop.IBQ_OC_ComprarAdd.Fields[iQtdMediaMes].AsCurrency:=cMediaMes;

      // Acerta Media (QTD_MEDIA_DIA) ============================================
      If igNrDias<>0 Then
       DMBelShop.IBQ_OC_ComprarAdd.Fields[iQtdMediaDia].AsCurrency:=RoundTo((cgTotal_Demandas/igNrDias),-4)
      Else
       DMBelShop.IBQ_OC_ComprarAdd.Fields[iQtdMediaDia].AsCurrency:=0;

      DMBelShop.IBQ_OC_ComprarAdd.Post;

      DMLinx.CDS_OCProdLinx.Next;
    End; // While not DMLinx.CDS_OCProdLinx.Eof do

    // Atualiza Transacao ======================================================
    DMBelShop.IBQ_OC_ComprarAdd.ApplyUpdates;
    DMBelShop.IBT_BelShop.CommitRetaining;
    DMBelShop.IBT_BelShop.Commit;

    DMBelShop.CDS_DemandasNovo.Close;
    DMBelShop.IBQ_OC_ComprarAdd.Close;
    DMLinx.CDS_OCProdLinx.Close;

    // Atualiza OC_COMPRAR_DOCS ================================================
    OC_COMPRAR_DOCS('I', sgNumPed, 'Linx');

  Except // Try // IBQ_OC_ComprarAdd
    On e : Exception do
    Begin
      // Abandona Transacao ====================================================
      OdirPanApres.Visible:=False;
      DMBelShop.IBT_BelShop.Rollback;

      DMBelShop.CDS_DemandasNovo.Close;
      DMBelShop.IBQ_OC_ComprarAdd.Close;
      DMLinx.CDS_OCProdLinx.Close;

//odirapagar      msg('Erro na Geração dos Produtos !!'+cr+cr+'Filial: '+sCodMatriz +' !!','A');
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // On e : Exception do
  End; // Try // IBQ_OC_ComprarAdd

End; // ORDEM DE COMPRA - Novo Calculode Pedido de Compra do Linx >>>>>>>>>>>>>>

// ORDEM DE COMPRA - Busca Produtos para Analise >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmOCLinx.BuscaProdutosAnalise: Boolean;
Begin
  Result:=False;

  // ODIR 1
  // Busca Produtos MPMS =======================================================
  MySqlSelect:=' SELECT 0 NUM_SEQ, 0 NUM_DOCUMENTO, current_timestamp DTA_DOCUMENTO,'+
               ' ''N'' IND_OC_GERADA, NULL DTA_OC_GERADA, NULL NUM_OC_GERADA,'+
               QuotedStr('Calculado em: '+DateTimeToStr(DataHoraServidorFI(
                                          DMBelShop.SDS_DtaHoraServidor))+' por '+Des_Usuario)+' OBS_OC,'+
               ' fi.empresa COD_EMPRESA, TRIM(fi.nome_emp) DES_EMPRESA,'+
               ' pr.cod_produto COD_ITEM, TRIM(pr.nome) DES_ITEM,'+
               ' 0 QTD_SUGERIDA, 0 QTD_ACOMPRAR, COALESCE(es.quantidade,0) QTD_SALDO,'+
               ' 0 QTD_TRANSITO, COALESCE(es.quantidade,0) QTD_DISPONIVEL,'+
               ' 0 QTD_MEDIA_MES, 0 QTD_MEDIA_DIA, 0 QTD_DEM_MES1, 0 QTD_DEM_MES2, 0 QTD_DEM_MES3,'+
               ' 0 QTD_DEM_MES4, 0 QTD_DEM_MES5, 0 QTD_DEM_MES6, 0 QTD_DEM_MES7, 0 QTD_DEM_MES8,'+
               ' 1 UNI_COMPRA,'+ // LINX ?
               ' 1 UNI_VENDA,'+ // LINX ?
               ' TRIM(pr.cod_barra) COD_BARRAS,'+
               ' pr.id_setor COD_GRUPO, TRIM(pr.desc_setor) DES_GRUPO,'+
               ' pr.id_linha COD_SUBGRUPO, TRIM(pr.desc_linha) DES_SUBGRUPO,'+
               ' NULL DES_GENERICO, pr.id_classificacao COD_APLICACAO,'+
               ' pr.desc_classificacao DES_APLICACAO, TRIM(pr.referencia) COD_REFERENCIA,'+
               ' NULL CLA_CURVA_ABC,'+
               ' NULL COD_FAMILIA_PRECO, NULL DES_FAMILIA_PRECO,'+

               ' uc.DTA_ULT_COMPRA, uc.COD_FOR_ULT_COMPRA, uc.DES_FOR_ULT_COMPRA,'+
               ' COALESCE(uc.QTD_ULT_COMPRA,0.00) QTD_ULT_COMPRA,'+
               ' COALESCE(uc.VLR_UNI_ULT_COMPRA,0.00) VLR_UNI_ULT_COMPRA,'+
               ' COALESCE(uc.VLR_TOT_ULT_COMPRA, 0.00) VLR_TOT_ULT_COMPRA,'+

               ' CASE'+
               '   WHEN CAST(ROUND(COALESCE(es.PRECO_CUSTO,0.00),2) AS NUMERIC(12,2))<>0.00 Then'+
               '     CAST(ROUND(COALESCE(es.PRECO_CUSTO,0.00),2) AS NUMERIC(12,2))'+
               '   ELSE'+
               '     COALESCE((SELECT lp.precocompra'+
               '               FROM LISTAPRE lp'+
               '               WHERE lp.codlista=''0006'''+
               '               AND   lp.codproduto=pr.cod_auxiliar),0.00)'+
               ' END VLR_UNI_COMPRA,'+

               ' 0 PER_DESCONTO,'+
               ' NULL DTA_ULT_VENDA, NULL COD_CLI_ULT_VENDA, NULL DES_CLI_ULT_VENDA,'+
               ' NULL QTD_ULT_VENDA, NULL VLR_UNI_ULT_VENDA, NULL VLR_TOT_ULT_VENDA,'+

               ' CAST(ROUND(COALESCE(es.PRECO_VENDA,0.00),2) AS NUMERIC(12,2)) VLR_UNI_VENDA,'+
               ' NULL COD_LISTA_VENDA, NULL DES_LISTA_VENDA,'+
               ' NULL COD_LISTA_COMPRA, NULL DES_LISTA_COMPRA,'+

               ' COALESCE(es.CUSTO_MEDIO,0.00) VLR_CUSTO_MEDIO,'+

               ' 0.00 VLR_TOT_VENDA, 0.00 VLR_TOT_COMPRA, 0.00 VLR_BRUTO,'+
               ' 0.00 VLR_DESCONTOS, 0.00 VLR_DESPESAS, 0.00 VLR_FRETE,'+

               ' ''N'' IND_SOMA_IPI_BASE_ICMS, ''N'' IND_SOMA_FRETE_BASE_ICMS,'+
               ' ''N'' IND_SOMA_DESPESA_BASE_ICMS, ''N'' IND_SOMA_IPI_BASE_ST,'+
               ' ''N'' IND_SOMA_FRETE_BASE_ST, ''N'' IND_SOMA_DESPESA_BASE_ST,'+
               ' NULL COD_SIT_TRIBUTARIA, ''00'' COD_IPI, ''P'' IND_IPI,'+
               ' 0.00 PER_IPI, 0.00 VLR_IPI, null COD_ICMS,'+
               ' 0.00 PER_REDUCAO_ICMS, 0.00 VLR_REDUCAO_ICMS, 0.00 VLR_BASE_ICMS,'+
               ' 0.00 PER_ICMS, 0.00 VLR_ICMS, NULL COD_GRUPO_ST, NULL DES_GRUPO_ST,'+
               ' 0.00 PER_MARGEM_ST, NULL IND_ST, 0.00 VLR_BASE_ST, 0.00 PER_ST,'+
               ' 0.00 VLR_ST, 0.00 PER_REPASSE, 0.00 VLR_REPASSE,'+
               ' NULL COD_COMPROVANTE_ICMS,'+
               ' SUBSTRING(TRIM(pr.referencia) FROM 1 FOR 30) COD_REFERENCIA_FORN,'+
               ' pr.cod_fornecedor COD_FORNECEDOR, TRIM(fo.nome_cliente) DES_FORNECEDOR,'+
               ' fo.tipo_cliente TIP_PESSOA, TRIM(fo.email_cliente) DES_EMAIL,'+
               ' 0 QTD_NR_DIAS,'+
               ' 0 QTD_NR_MESES,'+
               ' 0 QTD_TOT_MESES,'+
               ' 0 COD_COMPRADOR,'+
               QuotedStr('Calculado em: '+DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor))+
                                          ' por '+Des_Usuario)+' BLOB_TEXTO,'+
               ' ''N'' IND_TRANSF, NULL DTA_LIM_TRANSF, 0 QTD_TRANSF,'+
               ' ''SIM'' IND_USAR, 0 IND_QTD_ACIMA, 0 QTD_SUGERIDA_ANO,'+
               ' 0 QTD_TRANSF_PERIODO, 0 QTD_TRANSF_ANO,'+
               ' 0 EST_MINIMO, 0 DIAS_ESTOCAGEM, 0 QTD_DEMANDA_DIA,'+
               ' 0 QTD_DEMANDA_ANO, 0 QTD_DIAS_ANO,'+
               ' pr.dt_update DATAINCLUSAO,'+
               ' TRIM(fo.uf_cliente) ESTADO,'+
               ' pr.dt_update DATAALTERACAO';

  MySqlClausula1:=' FROM LINXPRODUTOS pr'+
                  '          LEFT JOIN LINXLOJAS fi              on fi.empresa='+IntToStr(igCodLojaLinx)+
                  '          LEFT JOIN linxprodutosdetalhes es   on es.cod_produto=pr.cod_produto'+
                  '                                             and es.empresa = fi.empresa'+
                  '          LEFT JOIN linxclientesfornec fo     on fo.cod_cliente=pr.cod_fornecedor'+
                  '                                             AND fo.tipo_cliente in (''F'', ''A'')'+
                  '          LEFT JOIN (select ml.cod_produto, ml.empresa,'+  // Ultima Compra
                  '                     cast(ml.data_documento as Date) DTA_ULT_COMPRA,'+
                  '                     ml.codigo_cliente COD_FOR_ULT_COMPRA,'+
                  '                     cl.nome_cliente DES_FOR_ULT_COMPRA,'+
                  '                     cast(ml.quantidade as Numeric(12,2)) QTD_ULT_COMPRA,'+
                  '                     Cast(COALESCE(ml.preco_unitario,0.00) as Numeric(12,2)) VLR_UNI_ULT_COMPRA,'+
                  '                     Cast(ml.valor_total as Numeric(12,2)) VLR_TOT_ULT_COMPRA'+
                  '                     FROM LINXMOVIMENTO ml, LINXCLIENTESFORNEC cl'+
                  '                     WHERE ml.codigo_cliente=cl.cod_cliente'+
                  '                     AND   cl.tipo_cliente in (''F'', ''A'')'+
                  '                     AND   ml.operacao=''E'''+
                  '                     AND   ((ml.tipo_transacao=''E'') OR (ml.tipo_transacao IS NULL))'+
                  '                     AND   ml.cancelado=''N'''+
                  '                     AND   ml.excluido=''N'''+
                  '                     AND   ml.data_lancamento=(SELECT max(ml1.data_lancamento)'+
                  '                                               FROM LINXMOVIMENTO ml1'+
                  '                                               WHERE ml1.cod_produto=ml.cod_produto'+
                  '                                               AND   ml1.empresa = ml.empresa'+
                  '                                               AND   ml1.operacao = ml.operacao'+
                  '                                               AND   ((ml1.tipo_transacao=''E'') OR (ml1.tipo_transacao IS NULL))'+
                  '                                               AND   ml1.cancelado=ml.cancelado'+
                  '                                               AND   ml1.excluido=ml.excluido)) uc  on uc.cod_produto=pr.cod_produto'+
                  '                                                                                   AND uc.empresa=fi.empresa'+

                  ' WHERE pr.desativado=''N''';

                 If Not Ckb_FiltroProdNaoCompra.Checked Then
                  MySqlClausula1:=
                   MySqlClausula1+' AND NOT ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))'
                 Else If (Ckb_FiltroProdNaoCompra.Checked) And (Ckb_FiltroProdSoNaoCompra.Checked)  Then
                  MySqlClausula1:=
                   MySqlClausula1+' AND ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))';

                 // Produtos Codigos e/ou Produtos Like ---------------------
                 If (Trim(sgProdutosLinx)<>'') And (Trim(sgLikeProdutosLinx)<>'') Then
                  MySqlClausula1:=
                   MySqlClausula1+' AND (pr.cod_produto in ('+sgProdutosLinx+') Or '+sgLikeProdutosLinx+')'
                 Else If Trim(sgProdutosLinx)<>'' Then
                  MySqlClausula1:=
                   MySqlClausula1+' and pr.cod_produto in ('+sgProdutosLinx+')'
                 Else If Trim(sgLikeProdutosLinx)<>'' Then
                  MySqlClausula1:=
                   MySqlClausula1+' AND'+sgLikeProdutosLinx;

                 // Fornecedores --------------------------------------------
                 If Trim(sgFornecedoresLinx)<>'' Then
                  MySqlClausula1:=
                   MySqlClausula1+' and pr.cod_fornecedor in ('+sgFornecedoresLinx+')';

  MySqlOrderGrup:=' ORDER BY pr.nome';
  DMLinx.CDS_OCProdLinx.Close;
  DMLinx.SQLQ_OCProdLinx.SQL.Clear;
  DMLinx.SQLQ_OCProdLinx.SQL.Add(MySqlSelect+MySqlClausula1+MySqlOrderGrup);
  DMLinx.CDS_OCProdLinx.Open;

  sgDtaDoc:=DateToStr(DMLinx.CDS_OCProdLinx.FieldByName('DTA_DOCUMENTO').AsDateTime);
  Try
    sgDtaDoc:=DateToStr(StrToDateTime(sgDtaDoc));
  Except
    Try
      sgDtaDoc:=DateToStr(StrToDateTime(f_Troca('.','/',f_Troca('-','/',sgDtaDoc))));
    Except
      sgDtaDoc:=DateToStr(StrToDateTime(f_Troca('/','.',f_Troca('-','.',sgDtaDoc))));
    End;
  End;

  If DMLinx.CDS_OCProdLinx.IsEmpty Then
  Begin
    DMLinx.CDS_OCProdLinx.Close;
    Exit;
  End; // If DMLinx.CDS_OCProdLinx.IsEmpty Then

  Result:=True;
End; // ORDEM DE COMPRA - Busca Produtos para Analise >>>>>>>>>>>>>>>>>>>>>>>>>>

// DIVERSOS - Seleciona Produtos TS_Filtros >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.SelecionaProdutos(bProd, bLike: Boolean);
Begin
  // bProd = True - Seleciona Produto (Codigo)
  // bLike = True - Seleciona Produto (Nome)
  // Like Montado com Alias < pr. >
  //       SE NECESSARIO USAR: MySql:=MySql+' AND '+f_Troca('pr.','p.',sgLikeProdutosLinx);

  // Seleção Produtos ==========================================================
  sgProdutosLinx:='';
  If bProd Then
  Begin
    If Not DMVirtual.CDS_V_Produtos.IsEmpty Then
    Begin

      DMVirtual.CDS_V_Produtos.First;
      While Not DMVirtual.CDS_V_Produtos.Eof do
      Begin
        Refresh;

        If sgProdutosLinx='' Then
         sgProdutosLinx:=QuotedStr(DMVirtual.CDS_V_ProdutosCod_Produto.AsString)
        Else
         sgProdutosLinx:=sgProdutosLinx+', '+
                          QuotedStr(DMVirtual.CDS_V_ProdutosCod_Produto.AsString);

        DMVirtual.CDS_V_Produtos.Next;
      End; // While Not DMVirtual.CDS_V_Produtos.Eof do
      DMVirtual.CDS_V_Produtos.First;

    End; // If Not DMVirtual.CDS_V_Produtos.IsEmpty Then
  End; // If bProd Then

  // Like Produtos =============================================================
  sgLikeProdutosLinx:='';
  If bLike Then
  Begin
    If Trim(EdtCalculoFiltroNome1.Text)<>'' Then
     sgLikeProdutosLinx:=' pr.nome like ''%'+Trim(EdtCalculoFiltroNome1.Text)+'%''';

    If (Trim(EdtCalculoFiltroNome2.Text)<>'') And (sgLikeProdutosLinx='') Then
     sgLikeProdutosLinx:=' pr.nome like ''%'+Trim(EdtCalculoFiltroNome2.Text)+'%'''
    Else If (Trim(EdtCalculoFiltroNome2.Text)<>'') Then
     sgLikeProdutosLinx:=sgLikeProdutosLinx+' OR pr.nome like ''%'+Trim(EdtCalculoFiltroNome2.Text)+'%''';

    If (Trim(EdtCalculoFiltroNome3.Text)<>'') And (sgLikeProdutosLinx='') Then
     sgLikeProdutosLinx:=' pr.nome like ''%'+Trim(EdtCalculoFiltroNome3.Text)+'%'''
    Else If (Trim(EdtCalculoFiltroNome3.Text)<>'') Then
     sgLikeProdutosLinx:=sgLikeProdutosLinx+' OR pr.nome like ''%'+Trim(EdtCalculoFiltroNome3.Text)+'%''';

    If (Trim(EdtCalculoFiltroNome4.Text)<>'') And (sgLikeProdutosLinx='') Then
     sgLikeProdutosLinx:=' pr.nome like ''%'+Trim(EdtCalculoFiltroNome4.Text)+'%'''
    Else If (Trim(EdtCalculoFiltroNome4.Text)<>'') Then
     sgLikeProdutosLinx:=sgLikeProdutosLinx+' OR pr.nome like ''%'+Trim(EdtCalculoFiltroNome4.Text)+'%''';

    If sgLikeProdutosLinx<>'' Then
     sgLikeProdutosLinx:='('+sgLikeProdutosLinx+')';
  End; // If bLike Then
End; // DIVERSOS - Seleciona Produtos TS_Filtros >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// ORDEM DE COMPRA - Verifica se Existe Meses Iguais >>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmOCLinx.ConsisteBuscaProdutos: Boolean;
Begin
  DecimalSeparator:=',';
  DateSeparator:='/';

  Result:=False;

  // Analisa Mes Inválido =================================================
  If not CB_Mes1.ItemIndex in [0..11] Then
  Begin
    msg('Informação do Mes 1 Inválida !!','A');
    CB_Mes1.SetFocus;
    Exit;
  End;

  If not CB_Mes2.ItemIndex in [0..12] Then
  Begin
    msg('Informação do Mes 2 Inválida !!','A');
    CB_Mes2.SetFocus;
    Exit;
  End;

  If not CB_Mes3.ItemIndex in [0..12] Then
  Begin
    msg('Informação do Mes 3 Inválida !!','A');
    CB_Mes3.SetFocus;
    Exit;
  End;

  If not CB_Mes4.ItemIndex in [0..12] Then
  Begin
    msg('Informação do Mes 4 Inválida !!','A');
    CB_Mes4.SetFocus;
    Exit;
  End;

  If not CB_Mes5.ItemIndex in [0..12] Then
  Begin
    msg('Informação do Mes 5 Inválida !!','A');
    CB_Mes5.SetFocus;
    Exit;
  End;

  If not CB_Mes6.ItemIndex in [0..12] Then
  Begin
    msg('Informação do Mes 6 Inválida !!','A');
    CB_Mes6.SetFocus;
    Exit;
  End;

  If not CB_Mes7.ItemIndex in [0..12] Then
  Begin
    msg('Informação do Mes 7 Inválida !!','A');
    CB_Mes7.SetFocus;
    Exit;
  End;

  If not CB_Mes8.ItemIndex in [0..12] Then
  Begin
    msg('Informação do Mes 8 Inválida !!','A');
    CB_Mes8.SetFocus;
    Exit;
  End;

  // Analisa Mes em Duplicidde =================================================
  If CB_Mes1.Text+ME_Ano1.Text=CB_Mes2.Text+ME_Ano2.Text Then
  Begin
    CB_Mes2.SetFocus;
    msg('Mês 1 Igual a Mês 2 !!','A');
    Exit;
  End;

  If CB_Mes1.Text+ME_Ano1.Text=CB_Mes3.Text+ME_Ano3.Text Then
  Begin
    CB_Mes3.SetFocus;
    msg('Mês 1 Igual a Mês 3 !!','A');
    Exit;
  End;

  If CB_Mes1.Text+ME_Ano1.Text=CB_Mes4.Text+ME_Ano4.Text Then
  Begin
    CB_Mes4.SetFocus;
    msg('Mês 1 Igual a Mês 4!!','A');
    Exit;
  End;

  If CB_Mes1.Text+ME_Ano1.Text=CB_Mes5.Text+ME_Ano5.Text Then
  Begin
    CB_Mes5.SetFocus;
    msg('Mês 1 Igual a Mês 5 !!','A');
    Exit;
  End;

  If CB_Mes1.Text+ME_Ano1.Text=CB_Mes6.Text+ME_Ano6.Text Then
  Begin
    CB_Mes6.SetFocus;
    msg('Mês 1 Igual a Mês 6 !!','A');
    Exit;
  End;

  If CB_Mes1.Text+ME_Ano1.Text=CB_Mes7.Text+ME_Ano7.Text Then
  Begin
    CB_Mes7.SetFocus;
    msg('Mês 1 Igual a Mês 7 !!','A');
    Exit;
  End;

  If CB_Mes1.Text+ME_Ano1.Text=CB_Mes8.Text+ME_Ano8.Text Then
  Begin
    CB_Mes8.SetFocus;
    msg('Mês 1 Igual a Mês 8 !!','A');
    Exit;
  End;

  If CB_Mes2.ItemIndex<>0 Then
  Begin
    If CB_Mes2.Text+ME_Ano2.Text=CB_Mes3.Text+ME_Ano3.Text Then
    Begin
      CB_Mes3.SetFocus;
      msg('Mês 2 Igual a Mês 3 !!','A');
      Exit;
    End;

    If CB_Mes2.Text+ME_Ano2.Text=CB_Mes4.Text+ME_Ano4.Text Then
    Begin
      CB_Mes4.SetFocus;
      msg('Mês 2 Igual a Mês 4 !!','A');
      Exit;
    End;

    If CB_Mes2.Text+ME_Ano2.Text=CB_Mes5.Text+ME_Ano5.Text Then
    Begin
      CB_Mes5.SetFocus;
      msg('Mês 2 Igual a Mês 5 !!','A');
      Exit;
    End;

    If CB_Mes2.Text+ME_Ano2.Text=CB_Mes6.Text+ME_Ano6.Text Then
    Begin
      CB_Mes6.SetFocus;
      msg('Mês 2 Igual a Mês 6 !!','A');
      Exit;
    End;

    If CB_Mes2.Text+ME_Ano2.Text=CB_Mes7.Text+ME_Ano7.Text Then
    Begin
      CB_Mes7.SetFocus;
      msg('Mês 2 Igual a Mês 7 !!','A');
      Exit;
    End;

    If CB_Mes2.Text+ME_Ano2.Text=CB_Mes8.Text+ME_Ano8.Text Then
    Begin
      CB_Mes8.SetFocus;
      msg('Mês 2 Igual a Mês 8 !!','A');
      Exit;
    End;
  End; // If CB_Mes2.ItemIndex<>0 Then

  If CB_Mes3.ItemIndex<>0 Then
  Begin
    If CB_Mes3.Text+ME_Ano3.Text=CB_Mes4.Text+ME_Ano4.Text Then
    Begin
      CB_Mes4.SetFocus;
      msg('Mês 3 Igual a Mês 4 !!','A');
      Exit;
    End;

    If CB_Mes3.Text+ME_Ano3.Text=CB_Mes5.Text+ME_Ano5.Text Then
    Begin
      CB_Mes5.SetFocus;
      msg('Mês 3 Igual a Mês 5 !!','A');
      Exit;
    End;

    If CB_Mes3.Text+ME_Ano3.Text=CB_Mes6.Text+ME_Ano6.Text Then
    Begin
      CB_Mes6.SetFocus;
      msg('Mês 3 Igual a Mês 6 !!','A');
      Exit;
    End;

    If CB_Mes3.Text+ME_Ano3.Text=CB_Mes7.Text+ME_Ano7.Text Then
    Begin
      CB_Mes7.SetFocus;
      msg('Mês 3 Igual a Mês 7 !!','A');
      Exit;
    End;

    If CB_Mes3.Text+ME_Ano3.Text=CB_Mes8.Text+ME_Ano8.Text Then
    Begin
      CB_Mes8.SetFocus;
      msg('Mês 3 Igual a Mês 8 !!','A');
      Exit;
    End;
  End; // If CB_Mes3.ItemIndex<>0 Then

  If CB_Mes4.ItemIndex<>0 Then
  Begin
    If CB_Mes4.Text+ME_Ano4.Text=CB_Mes5.Text+ME_Ano5.Text Then
    Begin
      CB_Mes5.SetFocus;
      msg('Mês 4 Igual a Mês 5 !!','A');
      Exit;
    End;

    If CB_Mes4.Text+ME_Ano4.Text=CB_Mes6.Text+ME_Ano6.Text Then
    Begin
      CB_Mes6.SetFocus;
      msg('Mês 4 Igual a Mês 6 !!','A');
      Exit;
    End;

    If CB_Mes4.Text+ME_Ano4.Text=CB_Mes7.Text+ME_Ano7.Text Then
    Begin
      CB_Mes7.SetFocus;
      msg('Mês 4 Igual a Mês 7 !!','A');
      Exit;
    End;

    If CB_Mes4.Text+ME_Ano4.Text=CB_Mes8.Text+ME_Ano8.Text Then
    Begin
      CB_Mes8.SetFocus;
      msg('Mês 4 Igual a Mês 8 !!','A');
      Exit;
    End;
  End; // If CB_Mes4.ItemIndex<>0 Then

  If CB_Mes5.ItemIndex<>0 Then
  Begin
    If CB_Mes5.Text+ME_Ano5.Text=CB_Mes6.Text+ME_Ano6.Text Then
    Begin
      CB_Mes6.SetFocus;
      msg('Mês 5 Igual a Mês 6 !!','A');
      Exit;
    End;

    If CB_Mes5.Text+ME_Ano5.Text=CB_Mes7.Text+ME_Ano7.Text Then
    Begin
      CB_Mes7.SetFocus;
      msg('Mês 5 Igual a Mês 7 !!','A');
      Exit;
    End;

    If CB_Mes5.Text+ME_Ano5.Text=CB_Mes8.Text+ME_Ano8.Text Then
    Begin
      CB_Mes8.SetFocus;
      msg('Mês 5 Igual a Mês 8 !!','A');
      Exit;
    End;
  End; // If CB_Mes5.ItemIndex<>0 Then

  If CB_Mes6.ItemIndex<>0 Then
  Begin
    If CB_Mes6.Text+ME_Ano6.Text=CB_Mes7.Text+ME_Ano7.Text Then
    Begin
      CB_Mes7.SetFocus;
      msg('Mês 6 Igual a Mês 7 !!','A');
      Exit;
    End;

    If CB_Mes6.Text+ME_Ano6.Text=CB_Mes8.Text+ME_Ano8.Text Then
    Begin
      CB_Mes8.SetFocus;
      msg('Mês 6 Igual a Mês 8 !!','A');
      Exit;
    End;
  End; // If CB_Mes6.ItemIndex<>0 Then

  If CB_Mes7.ItemIndex<>0 Then
  Begin
    If CB_Mes7.Text+ME_Ano7.Text=CB_Mes8.Text+ME_Ano8.Text Then
    Begin
      CB_Mes8.SetFocus;
      msg('Mês 7 Igual a Mês 8 !!','A');
      Exit;
    End;
  End; // If CB_Mes7.ItemIndex<>0 Then

  // Analisa Ano Inválido =======================================================
  If (CB_Mes1.ItemIndex in [0..11]) and (ME_Ano1.Text='20  ') Then
  Begin
    ME_Ano1.SetFocus;
    msg('Ano Inválido em Mês 1 !!','A');
    Exit;
  End;

  If (CB_Mes2.ItemIndex in [1..12]) and (ME_Ano2.Text='20  ') Then
  Begin
    ME_Ano2.SetFocus;
    msg('Ano Inválido em Mês 2 !!','A');
    Exit;
  End;

  If (CB_Mes3.ItemIndex in [1..12]) and (ME_Ano3.Text='20  ') Then
  Begin
    ME_Ano3.SetFocus;
    msg('Ano Inválido em Mês 3 !!','A');
    Exit;
  End;

  If (CB_Mes4.ItemIndex in [1..12]) and (ME_Ano4.Text='20  ') Then
  Begin
    ME_Ano4.SetFocus;
    msg('Ano Inválido em Mês 4 !!','A');
    Exit;
  End;

  If (CB_Mes5.ItemIndex in [1..12]) and (ME_Ano5.Text='20  ') Then
  Begin
    ME_Ano5.SetFocus;
    msg('Ano Inválido em Mês 5 !!','A');
    Exit;
  End;

  If (CB_Mes6.ItemIndex in [1..12]) and (ME_Ano6.Text='20  ') Then
  Begin
    ME_Ano6.SetFocus;
    msg('Ano Inválido em Mês 6 !!','A');
    Exit;
  End;

  If (CB_Mes7.ItemIndex in [1..12]) and (ME_Ano7.Text='20  ') Then
  Begin
    ME_Ano7.SetFocus;
    msg('Ano Inválido em Mês 7 !!','A');
    Exit;
  End;

  If (CB_Mes8.ItemIndex in [1..12]) and (ME_Ano8.Text='20  ') Then
  Begin
    ME_Ano8.SetFocus;
    msg('Ano Inválido em Mês 8 !!','A');
    Exit;
  End;

  // Verifica Limite Para Busca de Transito ====================================
  If (CkB_CalculoTransito.Checked) and (Trim(DtEdt_CalculoTransito.Text)<>'') Then
   Begin
     Try
       StrToDate(DtEdt_CalculoTransito.Text);
     Except
       msg('Data Limite para Transito Inválida !!','A');
       DtEdt_CalculoTransito.SetFocus;
       Exit;
     End;
   End
  Else If (CkB_CalculoTransito.Checked) and (Trim(DtEdt_CalculoTransito.Text)='') Then
   Begin
     msg('Data Limite para Transito Inválida !!','A');
     DtEdt_CalculoTransito.SetFocus;
     Exit;
   End; // If (CkB_CalculoTransito.Checked) and Trim(DtEdt_CalculoTransito.Text)<>'' Then

  If DtEdt_CalculoTransito.Date<StrToDate('01/01/2011') Then
  Begin
    msg('Data Limite para Transito'+cr+'deve Ser MAIOR que 31/12/2010 !!','A');
    DtEdt_CalculoTransito.SetFocus;
    Exit;
  End; // If DtEdt_CalculoInicio.Date<StrToDate('01/01/2011') Then

  Result:=True;

End; // ORDEM DE COMPRA - Verifica se Existe Meses Iguais >>>>>>>>>>>>>>>>>>>>>>

// DIVERSOS - Desbilita o Scroll do Mouse no DbGrid >>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.DesabilitaScrollMouse(var Msg: TMsg; var Handled: Boolean);
var
  i: SmallInt;
begin
  //NAO rolagem do scroll do mouse no DBGrid
  if Msg.message = WM_MOUSEWHEEL then
  begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;

    i := HiWord(Msg.wParam);

    if i <> 0 then
    Handled := False;
  End;
End; // // DIVERSOS - Desbilita o Scroll do Mouse no DbGrid >>>>>>>>>>>>>>>>>>>>

// DIVERSOS - Habilita o Scroll do Mouse no DBGrid >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmOCLinx.HabilitaScrollMouse(var Msg: TMsg; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // primeiramente verificamos se é o evento a ser tratado...
  if Msg.message = WM_MOUSEWHEEL then
  if ActiveControl is TDBGrid then // *** <=== AQUI você testa se classe é TDBGRID
  begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;
    Sentido := HiWord(Msg.wParam);

    if Sentido > 0 then
     Msg.wParam := VK_UP
    else
     Msg.wParam := VK_DOWN;
  end;
end; // DIVERSOS - Habilita o Scroll do Mouse no DBGrid >>>>>>>>>>>>>>>>>>>>>>>>

// Busca Totais das OCs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.TotaisOCLinx(sNrDoc: String);
Var
  MySql: String;
Begin

  EdtGeraOCTotalGeral.Value:=0;
  DMBelShop.CDS_AComprarOCs.Close;
  If EdtGeraOCBuscaDocto.Value<>0 Then
  Begin
    MySql:=' SELECT'+
           ' ''N'' gerar,'+
           ' CASE'+
           '    WHEN COALESCE(oc.qtd_transf, 0) > 0 THEN'+
           '      ''TR'''+
           '    ELSE'+
           '      ''OC'''+
           ' END tipo,'+
           ' oc.cod_empresa cod_emp_fil,'+
           ' oc.des_empresa des_emp_fil,'+
           ' Cast(oc.cod_empresa as integer) cod_linx,'+
           ' oc.ind_oc_gerada,'+
           ' oc.cod_fornecedor,'+
           ' oc.des_fornecedor fornecedor,'+
           ' SUM(COALESCE(oc.vlr_bruto, 0.00)) total_bruto,'+
           ' SUM(COALESCE(oc.vlr_descontos, 0.00)) total_descontos,'+
           ' SUM(COALESCE(oc.vlr_ipi, 0.00)) total_ipi,'+
           ' SUM(COALESCE(oc.vlr_despesas, 0.00)) total_despesas,'+
           ' SUM(COALESCE(oc.vlr_st, 0.00)) total_st,'+
           ' SUM(COALESCE(oc.vlr_frete, 0.00)) total_frete,'+
           ' SUM(COALESCE(oc.vlr_icms, 0.00)) total_icms,'+
           ' SUM(COALESCE(oc.vlr_repasse, 0.00)) total_repasse,'+
           ' SUM(CASE'+
           '        WHEN oc.qtd_transf = 0 THEN'+
           '          COALESCE(oc.vlr_tot_compra, 0.00)'+
           '        ELSE'+
           '          0'+
           ' END) total_ocs,'+
           ' SUM(COALESCE(oc.vlr_tot_compra, 0.00)) total_oc,'+
           ' SUM(COALESCE(oc.vlr_tot_venda, 0.00)) total_venda,'+
           ' oc.num_documento,'+
           ' oc.num_oc_gerada,'+
           ' CAST(oc.dta_oc_gerada AS DATE) dta_oc_gerada,'+
           ' oc.cod_comprovante_icms,'+
           ' COUNT(oc.cod_item) total_itens,'+
           ' SUM(COALESCE(oc.qtd_acomprar, 0)) total_qtd,'+
           ' SUM(COALESCE(oc.qtd_transf, 0)) total_qtd_transf,'+
           ' SUM(CASE'+
           '        WHEN oc.qtd_acomprar > 0 THEN'+
           '          1'+
           '        ELSE'+
           '          0'+
           ' END) total_itens_acomprar'+

           ' FROM OC_COMPRAR oc, OC_COMPRAR_DOCS dc'+

           ' WHERE oc.num_documento = dc.num_docto'+
           ' AND   CAST(oc.dta_documento AS DATE) = dc.dta_docto'+
           ' AND   oc.cod_comprador = dc.cod_comprador'+
           ' AND   dc.origem='+QuotedStr('Linx')+
           ' AND   oc.num_documento='+sNrDoc+

           ' GROUP BY tipo, oc.cod_empresa, oc.des_empresa,'+
           '          oc.ind_oc_gerada, oc.cod_fornecedor, oc.des_fornecedor,'+
           '          oc.num_documento, oc.num_oc_gerada,'+
           '          CAST(oc.dta_oc_gerada AS DATE), oc.cod_comprovante_icms'+

           ' ORDER BY oc.cod_empresa, oc.des_fornecedor, oc.num_oc_gerada';
    DMBelShop.CDS_AComprarOCs.Close;                                     
    DMBelShop.SDS_AComprarOCs.CommandText:=MySql;
    DMBelShop.CDS_AComprarOCs.Open;

    EdtGeraOCTotalGeral.Value:=DMBelShop.CDS_AComprarOCsTOTALGERAL.AsVariant;
  End; // If EdtGeraOCBuscaDocto.Value<>0 Then
End; // Busca Totais das OCs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Acerta Nome dos Meses de Demandas no Grid >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.NomeMesesGridLinx;
Var
  i: Integer;
  MySql: String;
Begin
  MySql:=' SELECT om.*'+
         ' FROM OC_COMPRAR_MESES om, OC_COMPRAR_DOCS od'+
         ' WHERE om.num_documento=od.num_docto'+
         ' AND   od.origem='+QuotedStr('Linx')+
         ' AND   om.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value);
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  For i:=0 to Dbg_GeraOCGrid.Columns.Count-1 do
  Begin

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES1' Then
    Begin
      If Trim(DMBelShop.CDS_Busca.FieldByName('Mes1').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes1').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=DMBelShop.CDS_Busca.FieldByName('Mes1').AsString;
       End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes1').AsString)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES1' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES2' Then
    Begin
      If Trim(DMBelShop.CDS_Busca.FieldByName('Mes2').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes2').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=DMBelShop.CDS_Busca.FieldByName('Mes2').AsString;
       End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes2').AsString)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES2' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES3' Then
    Begin
      If Trim(DMBelShop.CDS_Busca.FieldByName('Mes3').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes3').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=DMBelShop.CDS_Busca.FieldByName('Mes3').AsString;
       End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes3').AsString)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES3' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES4' Then
    Begin
      If Trim(DMBelShop.CDS_Busca.FieldByName('Mes4').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes4').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=DMBelShop.CDS_Busca.FieldByName('Mes4').AsString;
       End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes4').AsString)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES4' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES5' Then
    Begin
      If Trim(DMBelShop.CDS_Busca.FieldByName('Mes5').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes5').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=DMBelShop.CDS_Busca.FieldByName('Mes5').AsString;
       End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes5').AsString)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES5' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES6' Then
    Begin
      If Trim(DMBelShop.CDS_Busca.FieldByName('Mes6').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes6').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=DMBelShop.CDS_Busca.FieldByName('Mes6').AsString;
       End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes6').AsString)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES6' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES7' Then
    Begin
      If Trim(DMBelShop.CDS_Busca.FieldByName('Mes7').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes7').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=DMBelShop.CDS_Busca.FieldByName('Mes7').AsString;
       End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes7').AsString)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES7' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES8' Then
    Begin
      If Trim(DMBelShop.CDS_Busca.FieldByName('Mes8').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes8').AsString)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=DMBelShop.CDS_Busca.FieldByName('Mes8').AsString;
       End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes8').AsString)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES8' Then

  End; // For i:=0 to Dbg_GeraOCGrid.Columns.Count-1 do
  DMBelShop.CDS_Busca.Close;

End; // Acerta Nome dos Meses de Demandas no Grid >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta sgFornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.MontaSelectFornecedoresLinx;
Begin
  // Fornecedores Selecionados =================================================
  sgFornecedoresLinx:='';
  If Not DMVirtual.CDS_V_Fornecedores.IsEmpty Then
  Begin
    DMVirtual.CDS_V_Fornecedores.First;
    While Not DMVirtual.CDS_V_Fornecedores.Eof do
    Begin
      If sgFornecedoresLinx='' Then
       sgFornecedoresLinx:=
                  QuotedStr(DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString)
      Else
       sgFornecedoresLinx:=sgFornecedoresLinx+', '+
                 QuotedStr(DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString);

      DMVirtual.CDS_V_Fornecedores.Next;
    End; // While Not DMVirtual.CDS_V_Fornecedores.Eof do
    DMVirtual.CDS_V_Fornecedores.First;

  End; // If Not DMVirtual.CDS_V_Fornecedores.IsEmpty Then
End; // Monta sgFornecedoresLinx >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Inicializa Meses para Busca de Demandas para Calculo de Médias >>>>>>>>>>>>>>
Procedure TFrmOCLinx.InicializaMesesLinx;
Var
  Dt1: TDate;
  i, Index:Integer;
begin

  sgOrderGrid:='';

  // Acerta Meses de Calculo ===================================================
  DecodeDate(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor), wgAnoH, wgMesH, wgDiaH);

  // Pega Mes Corrente só se mais de 14 Dias ===================================
  If (wgDiaH<15) and (wgMesH>1) Then
   wgMesH:=wgMesH-1;

  For i:=1 to 4 do
  Begin
    Dt1:=EncodeDate(wgAnoH, wgMesH, 1);

    if wgMesH=1  Then Index:= 0;
    if wgMesH=2  Then Index:= 1;
    if wgMesH=3  Then Index:= 2;
    if wgMesH=4  Then Index:= 3;
    if wgMesH=5  Then Index:= 4;
    if wgMesH=6  Then Index:= 5;
    if wgMesH=7  Then Index:= 6;
    if wgMesH=8  Then Index:= 7;
    if wgMesH=9  Then Index:= 8;
    if wgMesH=10 Then Index:= 9;
    if wgMesH=11 Then Index:=10;
    if wgMesH=12 Then Index:=11;

    If i=1 Then
    Begin
      CB_Mes1.ItemIndex:=Index;
      ME_Ano1.Text:=IntToStr(wgAnoH)
    End;

    If i=2 Then
    Begin
      CB_Mes2.ItemIndex:=Index+1;
      ME_Ano2.Text:=IntToStr(wgAnoH);
    End;

    If i=3 Then
    Begin
      CB_Mes3.ItemIndex:=Index+1;
      ME_Ano3.Text:=IntToStr(wgAnoH);
    End;

    If i=4 Then
    Begin
      CB_Mes4.ItemIndex:=Index+1;
      ME_Ano4.Text:=IntToStr(wgAnoH);
    End;

    Dt1:=Dt1-1;
    DecodeDate(Dt1, wgAnoH, wgMesH, wgDiaH);
  End;
End; // Inicializa Meses para Busca de Demandas para Calculo de Médias >>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmOCLinx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairLinx Then
   Begin
     Action := caFree;

     FrmBelShop.FechaTudo;
   End
  Else
   Begin
     msg('Para Fechar Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmOCLinx.FormCreate(Sender: TObject);
begin
  bgEnterTab:=True;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Acertar Erro na Rolagem do Mouse ==========================================
  Application.OnMessage := ApplicationEvents1Message;

  // Tradução DevExpress =======================================================
  if FileExists(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'TradDevExpBr.ini') then {Verifica se existe o arquivo dentro da pasta}
  begin
    Trad_Localizer.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'TradDevExpBr.ini');
    Trad_Localizer.LanguageIndex := 1; {Muda o idioma / linguagem}
    Trad_Localizer.Active := TRUE;     {Ativa o componente / a tradução}
  end;

end;

procedure TFrmOCLinx.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmOCLinx.FormShow(Sender: TObject);
begin
  sgOrderGrid:='';

  // Acerta Meses de Calculo ===================================================
  InicializaMesesLinx;

  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmOCLinx);

  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairLinx:=False;

  // Visible=False para Componetes Não Usados ==================================
  Painel_FiltroOC.Visible:=False;
  Gb_CalculoCurvaABC.Visible:=False;
  Gb_CalculoTpCurvaABC.Visible:=False;
  Gb_CalculoApresCurva.Visible:=False;

  // Inicializa Tabelas Virtuais para Filtros ==================================
  try
    DMVirtual.CDS_V_Produtos.CreateDataSet;
    DMVirtual.CDS_V_Produtos.Open;
  Except
    DMVirtual.CDS_V_Produtos.EmptyDataSet;
    DMVirtual.CDS_V_Produtos.Open;
  End;

  try
    DMVirtual.CDS_V_Fornecedores.CreateDataSet;
    DMVirtual.CDS_V_Fornecedores.Open;
  Except
    DMVirtual.CDS_V_Fornecedores.EmptyDataSet;
    DMVirtual.CDS_V_Fornecedores.Open;
  End;
  MontaSelectFornecedoresLinx;

  // Inicializa Variaveis ======================================================
  Lb_EmpAprocessar.Caption:='0';
  Lb_EmpProcessadas.Caption:='0';
  Edt_OCTotProdutos.Value:=0;

  EdtGeraOCBuscaDocto.Value:=0;
  EdtGeraOCDias.Value:=0;

  // Inicializa Data de Pesquisa ===============================================
  DtEdt_GeraOCDataDocto.Date:=DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor);

  // Limite para Transito dos Produtos =========================================
  DtEdt_CalculoTransito.Text:=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)-30);

  // Limite para Produtos Novos ================================================
  DtEdt_CalculoProdNovos.Date:=PrimUltDia(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor),'P');
  DtEdt_CalculoProdNovos.Date:=DtEdt_CalculoProdNovos.Date-1;
  DtEdt_CalculoProdNovos.Date:=PrimUltDia(DtEdt_CalculoProdNovos.Date,'P');
  DtEdt_CalculoProdNovos.Date:=DtEdt_CalculoProdNovos.Date-1;
  DtEdt_CalculoProdNovos.Date:=PrimUltDia(DtEdt_CalculoProdNovos.Date,'P');
  DtEdt_CalculoProdNovos.Date:=DtEdt_CalculoProdNovos.Date-1;
  DtEdt_CalculoProdNovos.Date:=PrimUltDia(DtEdt_CalculoProdNovos.Date,'P');

  // Posiciona PageControl's / TabSheet's ======================================
  TS_FiltroAplicacao.TabVisible:=False;
  TS_FiltroComprovantes.TabVisible:=False;
  TS_FiltroFamiliaPreco.TabVisible:=False;
  TS_FiltroGrupos.TabVisible:=False;
  TS_FiltroGrupoST.TabVisible:=False;

  PC_GeraOCApresentacao.TabIndex:=0;
  PC_GeraOCApresentacaoChange(Self);

  PC_OrdemCompra.TabIndex:=0;
  PC_OrdemCompraChange(Self);

  PC_Filtros.TabIndex:=1;
  PC_FiltrosChange(Self);
  PC_Filtros.TabIndex:=0;
  PC_FiltrosChange(Self);

  // Curva ABC =================================================================
  Rb_CalculoApresCurvaEstCom.Checked:=True;
  Ckb_CalculoCurvaTodas.Checked:=True;
  Ckb_CalculoCurvaTodasClick(Self);
  Rb_CalculoTpCurvaABCLoja.Checked:=True;
  Rb_CalculoTpCurvaABCLojaClick(Self);

  Gb_CalculoTpCurvaABC.Enabled:=False;
  Gb_CalculoApresCurva.Enabled:=False;
  Painel_FiltroOC.Height:=53;

end;

procedure TFrmOCLinx.Bt_OCFecharClick(Sender: TObject);
begin
  bgSairLinx:=True;

  EdtGeraOCBuscaDocto.AsInteger:=0;
  DtEdt_GeraOCDataDocto.Clear;
  
  Close;
end;

procedure TFrmOCLinx.PC_GeraOCApresentacaoChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_GeraOCApresentacao);

  If (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCGrid) And (Ts_GeraOCGrid.CanFocus) Then
  Begin
    PC_GeraOCFiliais.Visible:=True;
    PC_GeraOCProduto.Visible:=True;

    If Not DMBelShop.IBQ_AComprar.IsEmpty Then
    Begin
      Dbg_GeraOCGrid.SelectedIndex:=0;
      Dbg_GeraOCGrid.SelectedIndex:=3;
      Dbg_GeraOCGrid.SetFocus;
    End;

    Sb_GeraOC.Panels[2].Visible:=True;
  End;

  If (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCOrdensCompra) And (Ts_GeraOCOrdensCompra.CanFocus) Then
  Begin
    PC_GeraOCProduto.Visible:=False;
    PC_GeraOCFiliais.Visible:=False;
    Dbg_GeraOCTotalGeral.SetFocus;

    Sb_GeraOC.Panels[2].Visible:=False;
  End;

end;

procedure TFrmOCLinx.PC_OrdemCompraChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_OrdemCompra);

  If (PC_OrdemCompra.ActivePage=Ts_OCBuscaProdutos) And (Ts_OCBuscaProdutos.CanFocus) Then
   CB_Mes1.SetFocus;

  If (PC_OrdemCompra.ActivePage=Ts_OCGeraOrdemCompra) And (Ts_OCGeraOrdemCompra.CanFocus) Then
  Begin
    PC_GeraOCApresentacaoChange(Self);
    If EdtGeraOCBuscaDocto.AsInteger=0 Then
      EdtGeraOCBuscaDocto.SetFocus
    Else
     PC_GeraOCApresentacaoChange(Self);
  End;

end;

procedure TFrmOCLinx.PC_FiltrosChange(Sender: TObject);
begin
  Try
    CorSelecaoTabSheet(PC_Filtros);

    If (PC_Filtros.ActivePage=TS_FiltroFornecedor) and (TS_FiltroFornecedor.CanFocus) Then
     EdtFiltroCodForn.SetFocus;

    If (PC_Filtros.ActivePage=TS_FiltroProdutos) and (TS_FiltroProdutos.CanFocus) Then
     EdtFiltroCodProduto.SetFocus;

    If (PC_Filtros.ActivePage=TS_FiltroGrupos) and (TS_FiltroGrupos.CanFocus) Then
     EdtFiltroCodGrupo.SetFocus;

    If (PC_Filtros.ActivePage=TS_FiltroAplicacao) and (TS_FiltroAplicacao.CanFocus) Then
     EdtOCCodAplicacao.SetFocus;

    If (PC_Filtros.ActivePage=TS_FiltroFamiliaPreco) and (TS_FiltroFamiliaPreco.CanFocus) Then
     EdtOCCodFamiliaPrecos.SetFocus;

    If (PC_Filtros.ActivePage=TS_FiltroGrupoST) and (TS_FiltroGrupoST.CanFocus) Then
     EdtFiltroCodGrupoST.SetFocus;

    If (PC_Filtros.ActivePage=TS_FiltroComprovantes) and (TS_FiltroComprovantes.CanFocus) Then
     EdtFiltroCodComprov.SetFocus;
  Except
  End;

end;

procedure TFrmOCLinx.Ckb_CalculoCurvaTodasClick(Sender: TObject);
begin
  If Ckb_CalculoCurvaTodas.Checked Then
   Begin
     Ckb_CalculoCurvaA.Checked:=True;
     Ckb_CalculoCurvaB.Checked:=True;
     Ckb_CalculoCurvaC.Checked:=True;
     Ckb_CalculoCurvaD.Checked:=True;
     Ckb_CalculoCurvaE.Checked:=True;

     Ckb_CalculoCurvaA.Enabled:=False;
     Ckb_CalculoCurvaB.Enabled:=False;
     Ckb_CalculoCurvaC.Enabled:=False;
     Ckb_CalculoCurvaD.Enabled:=False;
     Ckb_CalculoCurvaE.Enabled:=False;

     Gb_CalculoApresCurva.Visible:=False;
     Ckb_CalculoApresCurvaForaClick(Self);
   End
  Else
   Begin
     Ckb_CalculoCurvaA.Checked:=True;
     Ckb_CalculoCurvaB.Checked:=False;
     Ckb_CalculoCurvaC.Checked:=False;
     Ckb_CalculoCurvaD.Checked:=False;
     Ckb_CalculoCurvaE.Checked:=False;

     Ckb_CalculoCurvaA.Enabled:=True;
     Ckb_CalculoCurvaB.Enabled:=True;
     Ckb_CalculoCurvaC.Enabled:=True;
     Ckb_CalculoCurvaD.Enabled:=True;
     Ckb_CalculoCurvaE.Enabled:=True;

     Gb_CalculoApresCurva.Visible:=True;
     Ckb_CalculoApresCurvaForaClick(Self);
   End;

  AcertaCkb_Style(Ckb_CalculoCurvaTodas);
  AcertaCkb_Style(Ckb_CalculoCurvaA);
  AcertaCkb_Style(Ckb_CalculoCurvaB);
  AcertaCkb_Style(Ckb_CalculoCurvaC);
  AcertaCkb_Style(Ckb_CalculoCurvaD);
  AcertaCkb_Style(Ckb_CalculoCurvaE);
end;

procedure TFrmOCLinx.Ckb_CalculoCurvaTodasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_CalculoCurvaTodasClick(Self);

end;

procedure TFrmOCLinx.Rb_CalculoTpCurvaABCLojaClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_CalculoTpCurvaABCLoja);
  AcertaRb_Style(Rb_CalculoTpCurvaABCMix);
  AcertaRb_Style(Rb_CalculoTpCurvaABCMpms);
  Gb_CalculoCurvaABC.Visible:=True;

  Gb_CalculoApresCurva.Visible:=True;
  If Ckb_CalculoCurvaTodas.Checked Then
   Gb_CalculoApresCurva.Visible:=False;

end;

procedure TFrmOCLinx.Ckb_CalculoApresCurvaForaClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_CalculoApresCurvaFora);

  Lb_CalculoApresCurva.Visible:=True;
  Rb_CalculoApresCurvaEstCom.Visible:=True;
  Rb_CalculoApresCurvaEstSem.Visible:=True;
  Rb_CalculoApresCurvaEstAmbos.Visible:=True;
  If Not Ckb_CalculoApresCurvaFora.Checked Then
  Begin
    Lb_CalculoApresCurva.Visible:=False;
    Rb_CalculoApresCurvaEstCom.Visible:=False;
    Rb_CalculoApresCurvaEstSem.Visible:=False;
    Rb_CalculoApresCurvaEstAmbos.Visible:=False;
  End;

end;

procedure TFrmOCLinx.Ts_OCBuscaProdutosEnter(Sender: TObject);
begin
  bgEnterTab:=True;

end;

procedure TFrmOCLinx.CkB_CalculoTransitoClick(Sender: TObject);
begin
  AcertaCkb_SN(CkB_CalculoTransito);
  DtEdt_CalculoTransito.Enabled:=(CkB_CalculoTransito.Checked);

end;

procedure TFrmOCLinx.CkB_CalculoTransitoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CkB_CalculoTransitoClick(Self);

end;

procedure TFrmOCLinx.Ts_OCGeraOrdemCompraExit(Sender: TObject);
begin
  bgEnterTab:=True;

end;

procedure TFrmOCLinx.EdtGeraOCBuscaDoctoChange(Sender: TObject);
begin
  bEnterTab:=True;

  DMBelShop.IBQ_AComprar.Close;
  DMBelShop.CDS_AComprarItens.Close;
  DMBelShop.CDS_AComprarOCs.Close;

  PC_GeraOCApresentacao.TabIndex:=0;
  PC_GeraOCApresentacaoChange(Self);

  Bt_GeraOCCalcular.Visible:=False;

end;

procedure TFrmOCLinx.EdtGeraOCBuscaDoctoEnter(Sender: TObject);
begin
  bgEnterTab:=True;
end;

procedure TFrmOCLinx.EdtGeraOCBuscaDoctoExit(Sender: TObject);
Var
  b: Boolean;
  MySql: String;
  i: Integer;
begin
  If (EdtGeraOCBuscaDocto.Value=0) Or (PC_OrdemCompra.ActivePage<>Ts_OCGeraOrdemCompra) Then
   Exit;

  If PC_GeraOCApresentacao.ActivePage=Ts_GeraOCGrid Then
   Dbg_GeraOCGrid.SetFocus;

  If PC_GeraOCApresentacao.ActivePage=Ts_GeraOCOrdensCompra Then
   Dbg_GeraOCTotalGeral.SetFocus;

  DecimalSeparator:=',';

  Screen.Cursor:=crAppStart;

  Bt_GeraOCCalcular.Visible:=False;

  b:=False;
  DMBelShop.IBDB_BelShop.Connected:=False;
  While Not b do
  Begin
    Try
      DMBelShop.IBDB_BelShop.Connected:=True;
      b:=True;
    Except
    End;
  End; // While Not b do
  DMBelShop.IBQ_AComprar.Close;
  DMBelShop.CDS_AComprarOCs.Close;           

  OdirPanApres.Caption:='AGUARDE !! Localizando Documento...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmOCLinx.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmOCLinx.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmOCLinx;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Busca Itens do Documento --------------------------------------------------
  MySql:=' SELECT DISTINCT oc.cod_item, oc.des_item, oc.num_documento,'+
         '                 cast(oc.dta_documento as Date) dta_documento,'+
         '                 oc.cod_comprador, us.des_usuario'+
         ' FROM OC_COMPRAR oc'+
         '       LEFT JOIN PS_USUARIOS us     ON us.cod_usuario = oc.cod_comprador'+
         '       LEFT JOIN OC_COMPRAR_DOCS od ON od.num_docto = oc.num_documento'+
         ' WHERE od.origem='+QuotedStr('Linx')+
         ' AND   oc.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value)+
         ' ORDER BY oc.des_item';
  DMBelShop.CDS_AComprarItens.Close;
  DMBelShop.SDS_AComprarItens.CommandText:=MySql;
  DMBelShop.CDS_AComprarItens.Open;

  OdirPanApres.Visible:=False;

  If DMBelShop.CDS_AComprarItens.IsEmpty Then
  Begin
    msg('Documento Número: '+VarToStr(EdtGeraOCBuscaDocto.Value)+cr+cr+'Não Encontrado !!','A');

    EdtGeraOCBuscaDocto.Clear;
    EdtGeraOCBuscaDocto.SetFocus;
    Screen.Cursor:=crDefault;
    Exit;
  End; // If DMBelShop.CDS_AComprarItens.IsEmpty Then

  // Inicailiza Data ===========================================================
  DtEdt_GeraOCDataDocto.Date:=DMBelShop.CDS_AComprarItensDTA_DOCUMENTO.AsDateTime;

  // Botao de Calculo ==========================================================
  Bt_GeraOCCalcular.Visible:=True;

  // Busca Dados dos Itens do Documento ========================================
  i:=0;
  b:=False;
  While Not b do
  Begin
    Inc(i);
    DMBelShop.IBQ_AComprar.Close;
    DMBelShop.IBQ_AComprar.Open;
    If DMBelShop.IBQ_AComprar.IsEmpty Then
     Begin
       DMBelShop.CDS_AComprarItens.Close;
       EdtGeraOCBuscaDoctoExit(Self);
       Break;
     End
    Else
     Begin
       Break;;
     End;

     If i=3 Then
     Begin
       DMBelShop.CDS_AComprarItens.Close;
       EdtGeraOCBuscaDocto.AsInteger:=0;
       EdtGeraOCBuscaDocto.SetFocus;
       Exit;
     End;
  End; // While Not b do

  // Acerta Nome dos Meses de Demandas no Grid =================================
  NomeMesesGridLinx;

  // Busca Totais das OCs ======================================================
  TotaisOCLinx(IntToStr(EdtGeraOCBuscaDocto.AsInteger));

  // Posiciona na Empresa ======================================================
  If Trim(sgCodEmp)<>'' Then
  Begin
    DMBelShop.IBQ_AComprar.Locate('Cod_Empresa',sgCodEmp,[]);
    DMBelShop.CDS_AComprarOCs.Locate('COD_EMP_FIL',sgCodEmp,[]);
  End;
  Screen.Cursor:=crDefault;
end;

procedure TFrmOCLinx.Bt_GeraOCBuscaDoctoClick(Sender: TObject);
Var
  MySql: String;
begin
  PC_GeraOCApresentacao.TabIndex:=0;
  PC_GeraOCApresentacaoChange(Self);
  Dbg_GeraOCGrid.SetFocus;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtGeraOCBuscaDocto.Clear;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT CAST(d.num_docto AS VARCHAR(15)) Num_Documento,'+
         '        d.des_comprador, d.origem, d.dta_docto Dta_Documento, d.cod_comprador'+
         ' FROM OC_COMPRAR_DOCS d'+
         ' WHERE d.dta_docto='+QuotedStr(f_Troca('/','.',(f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date)))))+
         ' AND   d.Origem='+QuotedStr('Linx')+
         ' AND   EXISTS (SELECT 1'+
         ' FROM  OC_COMPRAR c'+
         ' WHERE c.num_documento=d.num_docto)'+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Num_Documento').AsString)='' Then
  Begin
    msg('Sem Documento a Listar !!','A');
    DMBelShop.CDS_Pesquisa.Close;
    FreeAndNil(FrmPesquisa);
    EdtGeraOCBuscaDocto.SetFocus;
    Exit;
  End;

  // Dbg_Pesquisa para Pesquisa de Documentos de OC ============================
  FrmPesquisa.Dbg_PesquisaPesquisaDoctosOC;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Num_Documento';
  FrmPesquisa.Campo_Codigo:='Num_Documento';
  FrmPesquisa.Campo_Descricao:='Num_Documento';//Dta_Documento';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtGeraOCBuscaDocto.Text:=FrmPesquisa.EdtCodigo.Text;
   End
  Else
   Begin
     FreeAndNil(FrmPesquisa);
     EdtGeraOCBuscaDocto.Clear;
     EdtGeraOCBuscaDocto.SetFocus;
     Exit;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);

  EdtGeraOCBuscaDoctoExit(self);
end;

procedure TFrmOCLinx.Bt_GeraOCExcluirClick(Sender: TObject);
Var
  MySql: String;
begin
  PC_GeraOCApresentacao.TabIndex:=0;
  PC_GeraOCApresentacaoChange(Self);
  Dbg_GeraOCGrid.SetFocus;

  If DMBelShop.IBQ_AComprar.IsEmpty Then
   Exit;

  // Verifica se Existe OC Gerada ==============================================
  MySql:=' SELECT FIRST 1 o.num_oc_gerada'+
         ' FROM OC_COMPRAR o, OC_COMPRAR_DOCS d'+
         ' WHERE o.num_documento=d.num_docto'+
         ' AND   o.num_oc_gerada is not null'+
         ' AND   d.origem='+QuotedStr('Linx')+
         ' and   o.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('num_oc_gerada').AsString)<>'' Then
  Begin
    msg('Impossível Excluir Este Docto !!'+cr+cr+'Contém Transferência/Ordem Compra'+cr+'já Gerada(s) !!','A');
    DMBelShop.CDS_BuscaRapida.Close;
    Dbg_GeraOCGrid.SetFocus;
    Exit;
  end;
  DMBelShop.CDS_BuscaRapida.Close;

  If msg('Deseja Realmente Excluir o'+cr+cr+'Documento Selecionado ??','C')=2 Then
  Begin
    Dbg_GeraOCGrid.SetFocus;
    Exit;
  End;

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Exclui Docto ============================================================
    MySql:=' DELETE FROM OC_COMPRAR o'+
           ' WHERE o.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value)+
           ' AND   EXISTS (SELECT 1'+
           '               FROM OC_COMPRAR_DOCS d'+
           '               WHERE d.num_docto=o.num_documento'+
           '               AND   d.origem='+QuotedStr('Linx')+')';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    MySql:=' DELETE FROM OC_COMPRAR_MESES m'+
           ' WHERE m.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value)+
           ' AND   EXISTS (SELECT 1'+
           '               FROM OC_COMPRAR_DOCS d'+
           '               WHERE d.num_docto=m.num_documento'+
           '               AND   d.origem='+QuotedStr('Linx')+')';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Deleta OC_COMPRAR_DOCS ==================================================
    OC_COMPRAR_DOCS('D', VarToStr(EdtGeraOCBuscaDocto.Value), '=''Linx''');

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    End; // on e : Exception do
  End; // Try

  EdtGeraOCBuscaDocto.Value:=0;
  EdtGeraOCBuscaDocto.SetFocus;

  msg('Documento Excluido com SUCESSO !!','A');
end;

procedure TFrmOCLinx.Ckb_GeraOCCalculoEstoqueClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_GeraOCCalculoEstoque);
end;

procedure TFrmOCLinx.Ckb_GeraOCCalculoEstoqueKeyUp(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  Ckb_GeraOCCalculoEstoqueClick(Self);
end;

procedure TFrmOCLinx.Ckb_GeraOCCalculoTransitoClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_GeraOCCalculoTransito);

end;

procedure TFrmOCLinx.Ckb_GeraOCCalculoTransitoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_GeraOCCalculoTransitoClick(Self);
end;

procedure TFrmOCLinx.Bt_GeraOCCalcularClick(Sender: TObject);
Var
  cQtdACompra: Currency;
  MySql: String;
begin

  If DMBelShop.IBQ_AComprar.IsEmpty Then
   Exit;

  DtEdt_GeraOCDataDocto.SetFocus;
  If EdtGeraOCDias.Value<1 Then
  Begin
    msg('Número de Dias Para Cálculo Inválido !!', 'A');
    EdtGeraOCDias.SetFocus;
    Exit;
  End;

  If msg('Deseja Realmente Calcular'+cr+cr+'Necessidade de COMPRA ??','C')=2 Then
   Exit;

  PC_GeraOCApresentacao.TabIndex:=1;
  PC_GeraOCApresentacaoChange(Self);

  If msg('Produtos Sem Preço Unitário'+cr+'Ficarão COM SUGESTÃO de COMPRA e'+cr+
         'SEM QUANTIDADE a COMPRAR !!'+cr+cr+'Deseja Realmente Continuar ??','C')=2 Then
   Exit;

  Screen.Cursor:=crAppStart;

  // Busca Produtos ===========================================================
  DMBelShop.CDS_Sugestao.Close;
  DMBelShop.SDS_Sugestao.Params.ParamByName('NumDocto').Value:=EdtGeraOCBuscaDocto.Value;
  DMBelShop.SDS_Sugestao.Params.ParamByName('Dta').AsDate:=DtEdt_GeraOCDataDocto.Date;
  DMBelShop.CDS_Sugestao.Open;

  // Inicia Processamento =====================================================
  FrmBelShop.MontaProgressBar(True, FrmOCLinx);
  pgProgBar.Properties.Max:=DMBelShop.CDS_Sugestao.RecordCount;
  pgProgBar.Position:=0;

  While Not DMBelShop.CDS_Sugestao.Eof do
  Begin
    Application.ProcessMessages;

    pgProgBar.Position:=DMBelShop.CDS_Sugestao.RecNo;
    Refresh;

    If (DMBelShop.CDS_SugestaoIND_OC_GERADA.AsString<>'S') and (DMBelShop.CDS_SugestaoQTD_TRANSF.AsCurrency=0) Then
    Begin
      // Calcula Acomprar ------------------------------------------
      cQtdACompra:=RoundTo(DMBelShop.CDS_Sugestao.FieldByName('QTD_MEDIA_DIA').AsCurrency*EdtGeraOCDias.Value,0);

      // Verifica Se Utiliza Saldo ---------------------------------
      If Ckb_GeraOCCalculoEstoque.Checked Then
       cQtdACompra:=cQtdACompra-DMBelShop.CDS_Sugestao.FieldByName('QTD_SALDO').AsCurrency;

      // Verifica Se Utiliza Transito ------------------------------
      If Ckb_GeraOCCalculoTransito.Checked Then
       cQtdACompra:=cQtdACompra-DMBelShop.CDS_Sugestao.FieldByName('QTD_TRANSITO').AsCurrency;

      If cQtdACompra<0 Then
       cQtdACompra:=0;

      // Atulaiza Necessidade de Compra ----------------------------
      DMBelShop.CDS_Sugestao.Edit;
      DMBelShop.CDS_Sugestao.FieldByName('QTD_ACOMPRAR').AsCurrency:=cQtdACompra;

      If DMBelShop.CDS_Sugestao.FieldByName('VLR_UNI_COMPRA').AsCurrency>0 Then
       DMBelShop.CDS_Sugestao.FieldByName('QTD_SUGERIDA').AsCurrency:=cQtdACompra
      Else
       DMBelShop.CDS_Sugestao.FieldByName('QTD_SUGERIDA').AsCurrency:=0;

      // Calcula Totais do Produto ------------------------------
      If (DMBelShop.CDS_Sugestao.FieldByName('QTD_ACOMPRAR').AsCurrency<>0) and
         (DMBelShop.CDS_Sugestao.FieldByName('VLR_UNI_COMPRA').AsCurrency<>0) Then
      Begin
        // Valor Bruto --------------------------------
        DMBelShop.CDS_Sugestao.FieldByName('VLR_BRUTO').AsCurrency:=
                 (DMBelShop.CDS_Sugestao.FieldByName('QTD_ACOMPRAR').AsCurrency*
               DMBelShop.CDS_Sugestao.FieldByName('VLR_UNI_COMPRA').AsCurrency);

        // Valor Base ICMS ----------------------------
        DMBelShop.CDS_Sugestao.FieldByName('VLR_BASE_ICMS').AsCurrency:=
                     DMBelShop.CDS_Sugestao.FieldByName('VLR_BRUTO').AsCurrency;

        // Valor ICMS ---------------------------------
        If DMBelShop.CDS_Sugestao.FieldByName('PER_ICMS').AsCurrency<>0 Then
         DMBelShop.CDS_Sugestao.FieldByName('VLR_ICMS').AsCurrency:=Roundto(
                (DMBelShop.CDS_Sugestao.FieldByName('VLR_BASE_ICMS').AsCurrency*
             DMBelShop.CDS_Sugestao.FieldByName('PER_ICMS').AsCurrency)/100,-2);

        // Valor IPI ----------------------------------
        If DMBelShop.CDS_Sugestao.FieldByName('PER_IPI').AsCurrency<>0 Then
         DMBelShop.CDS_Sugestao.FieldByName('VLR_IPI').AsCurrency:=Roundto(
                    (DMBelShop.CDS_Sugestao.FieldByName('VLR_BRUTO').AsCurrency*
              DMBelShop.CDS_Sugestao.FieldByName('PER_IPI').AsCurrency)/100,-2);

        // Valores ST ---------------------------------
        If DMBelShop.CDS_Sugestao.FieldByName('PER_ST').AsCurrency<>0 Then
        Begin
          // Valor Base ST ----------------------------
          If DMBelShop.CDS_Sugestao.FieldByName('PER_MARGEM_ST').AsCurrency=0 Then
           DMBelShop.CDS_Sugestao.FieldByName('VLR_BASE_ST').AsCurrency:=
                      DMBelShop.CDS_Sugestao.FieldByName('VLR_BRUTO').AsCurrency
          Else
           DMBelShop.CDS_Sugestao.FieldByName('VLR_BASE_ST').AsCurrency:=
                     DMBelShop.CDS_Sugestao.FieldByName('VLR_BRUTO').AsCurrency+
                     (Roundto(((DMBelShop.CDS_Sugestao.FieldByName('VLR_BRUTO').AsCurrency*
                     DMBelShop.CDS_Sugestao.FieldByName('PER_MARGEM_ST').AsCurrency)/100),-2));

          // Valor ST ---------------------------------
          DMBelShop.CDS_Sugestao.FieldByName('VLR_ST').AsCurrency:=(Roundto(
                 ((DMBelShop.CDS_Sugestao.FieldByName('VLR_BASE_ST').AsCurrency*
              DMBelShop.CDS_Sugestao.FieldByName('PER_ST').AsCurrency)/100),-2)-
                     DMBelShop.CDS_Sugestao.FieldByName('VLR_ICMS').AsCurrency);

        End; // If DMBelShop.CDS_Sugestao.FieldByName('PER_ST').AsCurrency<>0 Then

        // Valor Total do Item
        DMBelShop.CDS_Sugestao.FieldByName('VLR_TOT_COMPRA').AsCurrency:=
                     DMBelShop.CDS_Sugestao.FieldByName('VLR_BRUTO').AsCurrency+
                        DMBelShop.CDS_Sugestao.FieldByName('VLR_ST').AsCurrency+
                       DMBelShop.CDS_Sugestao.FieldByName('VLR_IPI').AsCurrency;

       End
      Else //        If (DMBelShop.CDS_Sugestao.FieldByName('QTD_ACOMPRAR').AsCurrency<>0) and (DMBelShop.CDS_Sugestao.FieldByName('VLR_UNI_COMPRA').AsCurrency<>0) Then
       Begin
         // Zera todo
         // Valor Bruto --------------------------------
         DMBelShop.CDS_Sugestao.FieldByName('VLR_BRUTO').AsCurrency:=0;

         // Valor Base ICMS ----------------------------
         DMBelShop.CDS_Sugestao.FieldByName('VLR_BASE_ICMS').AsCurrency:=0;

         // Valor ICMS ---------------------------------
         DMBelShop.CDS_Sugestao.FieldByName('VLR_ICMS').AsCurrency:=0;

         // Valor IPI ----------------------------------
         DMBelShop.CDS_Sugestao.FieldByName('VLR_IPI').AsCurrency:=0;

         // Valor Base ST ----------------------------
         DMBelShop.CDS_Sugestao.FieldByName('VLR_BASE_ST').AsCurrency:=0;

         // Valor ST ---------------------------------
         DMBelShop.CDS_Sugestao.FieldByName('VLR_ST').AsCurrency:=0;

         // Valor Total do Item
         DMBelShop.CDS_Sugestao.FieldByName('VLR_TOT_COMPRA').AsCurrency:=0;
       End; // If (DMBelShop.CDS_Sugestao.FieldByName('QTD_ACOMPRAR').AsCurrency<>0) and


      DecimalSeparator:='.';
      MySql:='UpDate OC_COMPRAR oc'+
             ' Set oc.Qtd_AComprar='+QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('QTD_ACOMPRAR').AsString)+', '+
             ' oc.Qtd_Sugerida='+QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('QTD_SUGERIDA').AsString)+', '+
             ' oc.Vlr_Uni_Compra='+QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_UNI_COMPRA').AsString)+', '+
             ' oc.Vlr_Bruto='+QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_BRUTO').AsString)+', '+
             ' oc.Vlr_Base_ICMS='+QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_BASE_ICMS').AsString)+', '+
             ' oc.Vlr_ICMS='+QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_ICMS').AsString)+', '+
             ' oc.Vlr_IPI='+QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_IPI').AsString)+', '+
             ' oc.Vlr_Base_ST='+QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_BASE_ST').AsString)+', '+
             ' oc.Vlr_ST='+QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_ST').AsString)+', '+
             ' oc.Vlr_Tot_Compra='+QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_TOT_COMPRA').AsString)+

             ' Where oc.Num_Documento='+DMBelShop.CDS_SugestaoNUM_DOCUMENTO.AsString+
             ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DMBelShop.CDS_SugestaoDTA_DOCUMENTO.AsDateTime))))+
             ' And   oc.Num_Seq='+DMBelShop.CDS_Sugestao.FieldByName('NUM_SEQ').AsString;
      DMBelShop.SQLC.Execute(MySql,nil,nil);
      DecimalSeparator:=',';

      // Busca Totais das OCs ======================================================
      TotaisOCLinx(DMBelShop.CDS_Sugestao.FieldByName('NUM_DOCUMENTO').AsString);
    End; // If DMBelShop.CDS_SugestaoIND_OC_GERADA.AsString<>'S' Then

    DMBelShop.CDS_Sugestao.Next
  End; // While Not DMBelShop.CDS_Sugestao.Eof do
  FrmBelShop.MontaProgressBar(False, FrmOCLinx);

  bgSiga:=True;
  EdtGeraOCBuscaDoctoExit(Self);
  bgSiga:=False;

  // Encerra Processamento ====================================================
  Screen.Cursor:=crDefault;
  msg('Processmento Efetuado com Sucesso !!','A');
  EdtGeraOCDias.Value:=0;

  DMBelShop.IBT_BelShop.Commit;

  DMBelShop.IBQ_AComprar.Close;
  DMBelShop.IBQ_AComprar.Open;

  Gb_GeraOCCalculaCompra.Visible:=False;
  Gb_GeraOCEstoqueTransito.Visible:=False;

  PC_GeraOCApresentacao.TabIndex:=0;
  PC_GeraOCApresentacaoChange(Self);

  Dbg_GeraOCGrid.SelectedIndex:=0;
  Dbg_GeraOCGrid.SelectedIndex:=3;
  Dbg_GeraOCGrid.SetFocus;

  Bt_GeraOCGeraOCClick(Self);
end;

procedure TFrmOCLinx.Bt_GeraOCGeraOCClick(Sender: TObject);
Var
  MySql: String;
  sNrOC, sDtaGeracao: String;
  i: Integer;
  mMemo: TMemo;
begin

  Dbg_GeraOCTotalGeral.SetFocus;

  If not (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCOrdensCompra) Then
   Exit;

  If DMBelShop.CDS_AComprarOCs.IsEmpty Then
   Exit;

  // Cria Componente Memo ======================================================
  mMemo:=TMemo.Create(Self);
  mMemo.Visible:=False;
  mMemo.Parent:=FrmOCLinx;
  mMemo.Width:=500;
  mMemo.Lines.Clear;

  // Verifica se Existe OC para Gerar ==========================================
  i:=0;
  DMBelShop.CDS_AComprarOCs.First;
  While Not DMBelShop.CDS_AComprarOCs.Eof do
  Begin
    If (DMBelShop.CDS_AComprarOCsGERAR.AsString='S') And (DMBelShop.CDS_AComprarOCsTIPO.AsString='OC') Then
    Begin
      i:=1;
      Break;
    End;

    DMBelShop.CDS_AComprarOCs.Next;
  End;
  DMBelShop.CDS_AComprarOCs.First;

  If i=0 Then
  Begin
    msg('Favor Selecionar a Empresa/Filial a Gerar OCs !!','A');
    Dbg_GeraOCTotalGeral.SetFocus;
    Exit;
  End;

  If msg('Deseja Realmente'+cr+cr+'Gerar Ordem de Compra ??','C')=2 Then
   Exit;

  If msg('Deseja Informar OBSERVAÇÕES'+cr+cr+'Na(s) Ordem(ns) de Compra ??','C')=1 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Observação nas Ordens de Compra ===========================================
    While Not DMBelShop.CDS_AComprarOCs.Eof do
    Begin
      Refresh;

      If (DMBelShop.CDS_AComprarOCsGERAR.AsString='S') And (DMBelShop.CDS_AComprarOCsTIPO.AsString='OC') Then
      Begin
        bgProcessar:=False;

        MySql:='Select First 1 oc.OBS_OC'+
               ' From OC_COMPRAR oc'+
               ' Where oc.qtd_acomprar>0'+
               ' And   oc.qtd_transf=0'+
               ' And   oc.ind_oc_gerada=''N'''+
               ' And   oc.num_documento='+QuotedStr(IntToStr(EdtGeraOCBuscaDocto.AsInteger))+
               ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date))))+
               ' And   oc.cod_empresa='+QuotedStr(DMBelShop.CDS_AComprarOCsCOD_EMP_FIL.AsString)+
               ' And   oc.cod_fornecedor='+QuotedStr(DMBelShop.CDS_AComprarOCsCOD_FORNECEDOR.AsString);
        DMBelShop.CDS_Busca.Close;
        DMBelShop.SDS_Busca.CommandText:=MySql;
        DMBelShop.CDS_Busca.Open;

        // Apresenta Observação ---------------------------------------
        FrmOCObservacao:=TFrmOCObservacao.Create(Self);
        FrmOCObservacao.Mem_OCObsObservacao.Lines.Add(Trim(DMBelShop.CDS_Busca.FieldByName('OBS_OC').AsString));
        DMBelShop.CDS_Busca.Close;

        FrmOCObservacao.ShowModal;

        // Atualiza Observação ----------------------------------------
        If bgProcessar Then
         Begin

           Try
             If DMBelShop.IBT_BelShop.Active Then
             Begin
               DMBelShop.IBT_BelShop.Rollback;
             End;
             DMBelShop.IBT_BelShop.StartTransaction;

             MySql:=' Update OC_COMPRAR oc'+
                    ' Set oc.OBS_OC='+QuotedStr(FrmOCObservacao.Mem_OCObsObservacao.Text)+
                    ' Where oc.qtd_acomprar>0'+
                    ' And   oc.qtd_transf=0'+
                    ' And   oc.ind_oc_gerada=''N'''+
                    ' And   oc.num_documento='+QuotedStr(IntToStr(EdtGeraOCBuscaDocto.AsInteger))+
                    ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date))))+
                    ' And   oc.cod_empresa='+QuotedStr(DMBelShop.CDS_AComprarOCsCOD_EMP_FIL.AsString)+
                    ' And   oc.cod_fornecedor='+QuotedStr(DMBelShop.CDS_AComprarOCsCOD_FORNECEDOR.AsString);
             DMBelShop.IBQ_Executa.Close;
             DMBelShop.IBQ_Executa.SQL.Clear;
             DMBelShop.IBQ_Executa.SQL.Add(MySql);
             DMBelShop.IBQ_Executa.ExecSQL;

             DMBelShop.IBT_BelShop.CommitRetaining;
           except
             on e : Exception do
             Begin
               DMBelShop.IBT_BelShop.Rollback;

               Screen.Cursor:=crDefault;
               MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);

               FreeAndNil(FrmOCObservacao);
               exit;
             End;
           End; // Try
         End // If bgProcessar Then
        Else
         Begin
           FreeAndNil(FrmOCObservacao);
           Exit;
         End; // If bgProcessar Then
        FreeAndNil(FrmOCObservacao);

        bgProcessar:=False;
      End; // If (DMBelShop.CDS_AComprarOCsGERAR.AsString='S') And (DMBelShop.CDS_AComprarOCsTIPO.AsString='OC') Then

      DMBelShop.CDS_AComprarOCs.Next;
    End; // While Not DMBelShop.CDS_AComprarOCs.Eof do
  End; // If msg('Deseja Informar OBSERVAÇÕES'+cr+cr+'Na(s) Ordem(ns) de Compra ??','C')=1 Then

  // Cria OC's =================================================================
  DMBelShop.CDS_AComprarOCs.First;
  While Not DMBelShop.CDS_AComprarOCs.Eof do
  Begin
    Application.ProcessMessages;
    Refresh;

    igCodLojaLinx:=DMBelShop.CDS_AComprarOCsCOD_EMP_FIL.AsInteger;

    If (DMBelShop.CDS_AComprarOCsGERAR.AsString='S') And (DMBelShop.CDS_AComprarOCsTIPO.AsString='OC') Then
    Begin
      OdirPanApres.Caption:='AGUARDE !! Processando Loja: '+DMBelShop.CDS_AComprarOCsCOD_EMP_FIL.AsString+' - '+
                                                            DMBelShop.CDS_AComprarOCsDES_EMP_FIL.AsString;
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmOCLinx.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmOCLinx.Height-OdirPanApres.Height)/2))-20;
      OdirPanApres.Font.Style:=[fsBold];
      OdirPanApres.Parent:=FrmOCLinx;
      OdirPanApres.BringToFront();
      OdirPanApres.Visible:=True;
      Refresh;

      // Dta da Geração -----------------------------------
      sDtaGeracao:=DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

      // Busca Numero da Ordem de Compra =======================================
      MySql:=' SELECT COALESCE(MAX(oc.num_oc_gerada)+1 ,1) Num_Docto'+
             ' FROM OC_COMPRAR oc'+
             ' WHERE oc.num_oc_gerada<1000000'+
             ' AND   oc.ind_oc_gerada=''S'''+
             ' AND   EXISTS (SELECT 1'+
             '               FROM OC_COMPRAR_DOCS d'+
             '               WHERE d.num_docto=oc.num_documento'+
             '               AND   d.origem='+QuotedStr('Linx')+
             '               )';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      sNrOC:=DMBelShop.CDS_BuscaRapida.fieldByName('Num_Docto').AsString;
      DMBelShop.CDS_BuscaRapida.Close;

      // Verifica se Transação esta Ativa
      If DMBelShop.SQLC.InTransaction Then
       DMBelShop.SQLC.Rollback(TD);

      // Monta Transacao ===========================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMBelShop.SQLC.StartTransaction(TD);
      Try // Try da Transação
        DateSeparator:='.';
        DecimalSeparator:='.';

        MySql:=' UPDATE OC_COMPRAR oc'+
               ' Set oc.IND_OC_GERADA=''S'''+
               ', oc.DTA_OC_GERADA='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaGeracao)))+
               ', oc.NUM_OC_GERADA='+sNrOC+

               ', oc.OBS_OC=oc.OBS_OC||ascii_char(13)||'+QuotedStr('OC Gerada em '+sDtaGeracao+
                                                        ' Pelo Usuário: '+Des_Usuario)+

               ', oc.BLOB_TEXTO=oc.BLOB_TEXTO||ascii_char(13)||'+QuotedStr('Aberturta do Aplicativo: '+sgDataHoraAplicativo)+
                                            '|| ascii_char(13) ||'+QuotedStr('OC Nº '+sNrOC+' Gerada em: '+
                                            DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor))+' por '+Des_Usuario)+
               ' WHERE oc.qtd_acomprar>0'+
               ' And   oc.qtd_transf=0'+
  //             ' -- And   oc.vlr_tot_compra>0.00
               ' And   oc.ind_oc_gerada=''N'''+
               ' And   oc.num_documento='+DMBelShop.CDS_AComprarOCsNUM_DOCUMENTO.AsString+
               ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date))))+
               ' And   oc.cod_empresa='+DMBelShop.CDS_AComprarOCsCOD_EMP_FIL.AsString+
               ' And   oc.cod_fornecedor='+DMBelShop.CDS_AComprarOCsCOD_FORNECEDOR.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        // Atualiza Transacao ======================================================
        DMBelShop.SQLC.Commit(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';

        OdirPanApres.Visible:=False;

        Screen.Cursor:=crDefault;

      Except // Except da Transação
        on e : Exception do
        Begin
          // Abandona Transacao ====================================================
          DMBelShop.SQLC.Rollback(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';

          OdirPanApres.Visible:=False;

          Screen.Cursor:=crDefault;
          mMemo.Lines.Add(DMBelShop.CDS_AComprarOCsCOD_EMP_FIL.AsString);
        End; // on e : Exception do
      End; // Try da Transação

      OdirPanApres.Visible:=False;
    End; // If (DMBelShop.CDS_AComprarOCsGERAR.AsString='S') And (DMBelShop.CDS_AComprarOCsTIPO.AsString='OC') Then

    // Proxima Empresa =========================================================
    DMBelShop.CDS_AComprarOCs.Next;
  End; // While Not DMBelShop.CDS_AComprarOCs.Eof do

  If mMemo.Lines.Count>0 Then
   msg('Hoveram Ordens de Compra Não Geradas !!'+cr+cr+'Tende Novamente !!','A')
  Else
   msg('Geração de Ordens de Compra'+cr+cr+'Efetuada com SUCESSO !!','A');

  // Busca Ordem de Compra =====================================================
  EdtGeraOCBuscaDoctoExit(Self);

  TotaisOCLinx(IntToStr(EdtGeraOCBuscaDocto.AsInteger));

  // Marca Empresas Não Geradas ================================================
  For i:=0 to mMemo.Lines.Count-1 do
  Begin
    If DMBelShop.CDS_AComprarOCs.Locate('COD_EMP_FIL', Trim(mMemo.Lines[i]),[]) Then
    Begin
      DMBelShop.CDS_AComprarOCs.Edit;
      DMBelShop.CDS_AComprarOCsGERAR.AsString:='S';
      DMBelShop.CDS_AComprarOCs.Post;
    End;
  End; // For i:=0 to mMemo.Lines.Count-1 do
  DMBelShop.CDS_AComprarOCs.First;
  FreeAndNil(mMemo);

  Screen.Cursor:=crDefault;
end;

procedure TFrmOCLinx.Dbg_GeraOCProdutosEnter(Sender: TObject);
begin
  {
   Usado em:
   - Dbg_GeraOCFiliais
   - Dbg_GeraOCGrid
  }

  // Desabilita Mouse No Grid ===================================================
  Application.OnMessage:=DesabilitaScrollMouse;

end;

procedure TFrmOCLinx.ApplicationEvents1Message(var Msg: tagMSG;var Handled: Boolean);
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

procedure TFrmOCLinx.Dbg_GeraOCProdutosExit(Sender: TObject);
begin
  {
   Usado em:
   - Dbg_GeraOCFiliais
   - Dbg_GeraOCGrid
  }

  // Habilita Mouse No Grid ===================================================
  Application.OnMessage:=HabilitaScrollMouse;

end;

procedure TFrmOCLinx.Dbg_GeraOCProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
begin
  If DMBelShop.CDS_AComprarItens.IsEmpty Then
   Exit;

  If key=Vk_Return Then
   Ts_GeraOCFiliais.SetFocus;

  // Localiza Produto ==========================================================
  If (Key=VK_F4) And (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCGrid) Then
  Begin
    s:='';
    If InputQuery('Localizar Produto','',s) then
    Begin
      if Trim(s)<>'' then
      Begin
        Try
          StrToInt(s);
          DMBelShop.CDS_AComprarItens.Locate('Cod_Item',s,[]);
        Except
          s:=AnsiUpperCase(s);
          DMBelShop.CDS_AComprarItens.Locate('Des_Item',s,[loPartialKey]);
        End;
      End; // if Trim(s)<>'' then
    End; // If InputQuery('Localizar Produto','',s) then
  End; // If Key=VK_F4 Then
end;

procedure TFrmOCLinx.PC_GeraOCProdutoChange(Sender: TObject);
begin
  If PC_GeraOCProduto.ActivePage=Ts_GeraOCProdutos Then
   Dbg_GeraOCProdutos.SetFocus;

end;

procedure TFrmOCLinx.PC_GeraOCFiliaisChange(Sender: TObject);
begin
  If PC_GeraOCFiliais.ActivePage=Ts_GeraOCFiliais Then
   Dbg_GeraOCFiliais.SetFocus;

end;

procedure TFrmOCLinx.Dbg_GeraOCFiliaisDrawColumnCell(Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    // Se Lina do Produto no CD
    if DMBelShop.IBQ_AComprarCOD_EMPRESA.AsInteger=2 Then
      Dbg_GeraOCFiliais.Canvas.Brush.Color:=$0080FFFF; //$00DDFFDD;

    Dbg_GeraOCFiliais.Canvas.FillRect(Rect);
    Dbg_GeraOCFiliais.DefaultDrawDataCell(Rect,Column.Field,state);
  End;

  // Alinhamento
  DMBelShop.IBQ_AComprarCOD_EMPRESA.Alignment:=taCenter;
  
end;

procedure TFrmOCLinx.Dbg_GeraOCFiliaisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
begin
  If DMBelShop.CDS_AComprarItens.IsEmpty Then
   Exit;

  If key=Vk_Return Then
   Ts_GeraOCGrid.SetFocus;

  // Localiza Produto ==========================================================
  If (Key=VK_F4) And (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCGrid) Then
  Begin
    s:='';
    If InputQuery('Localizar Produto','',s) then
    Begin
      if Trim(s)<>'' then
      Begin
        Try
          StrToInt(s);
          DMBelShop.CDS_AComprarItens.Locate('Cod_Item',s,[]);
        Except
          s:=AnsiUpperCase(s);
          DMBelShop.CDS_AComprarItens.Locate('Des_Item',s,[loPartialKey]);
        End;
      End; // if Trim(s)<>'' then
    End; // If InputQuery('Localizar Produto','',s) then
  End; // If Key=VK_F4 Then

end;

procedure TFrmOCLinx.Dbg_GeraOCGridColEnter(Sender: TObject);
begin
  bEnterTab:=False;

end;

procedure TFrmOCLinx.Dbg_GeraOCGridColExit(Sender: TObject);
begin
  bEnterTab:=True;

end;

procedure TFrmOCLinx.Dbg_GeraOCGridDrawColumnCell(Sender: TObject; const Rect: TRect;
              DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If (Column.FieldName='QTD_SALDO') Or (Column.FieldName='IND_QTD_ACIMA')Then
  Begin
    If DMBelShop.IBQ_AComprarIND_QTD_ACIMA.AsCurrency>0 Then
     Dbg_GeraOCGrid.Canvas.Font.Color:=clRed;

  End; // If (Column.FieldName='QTD_SALDO') Or (Column.FieldName='IND_QTD_ACIMA')Then

  If (Column.FieldName='QTD_ACOMPRAR') Then
  Begin
     Dbg_GeraOCGrid.Canvas.Font.Style:=[fsBold];

    If DMBelShop.IBQ_AComprarQTD_ACOMPRAR.AsCurrency=0 Then
     Dbg_GeraOCGrid.Canvas.Font.Style:=[]
    Else If (DMBelShop.IBQ_AComprarQTD_ACOMPRAR.AsCurrency<>0) and (DMBelShop.IBQ_AComprarQTD_TRANSF.AsCurrency<>0) Then
     Begin
       Dbg_GeraOCGrid.Canvas.Font.Color:=clRed;
     End;
  End; // If (Column.FieldName='QTD_ACOMPRAR') Then

  If (Column.FieldName='QTD_TRANSF') Then
  Begin
    If DMBelShop.IBQ_AComprarQTD_TRANSF.AsCurrency=0 Then
     Dbg_GeraOCGrid.Canvas.Font.Style:=[]
    Else
     Dbg_GeraOCGrid.Canvas.Font.Style:=[fsBold];
  End; // If (Column.FieldName='QTD_TRANSF') Then

  If (Column.FieldName='VLR_UNI_COMPRA') Then
  Begin
    If DMBelShop.IBQ_AComprarVLR_UNI_COMPRA.AsCurrency=0 Then
     Begin
       Dbg_GeraOCGrid.Canvas.Font.Style:=[];

       If DMBelShop.IBQ_AComprarIND_OC_GERADA.AsString='N' Then
       Begin
         Dbg_GeraOCGrid.Canvas.Font.Color:=clWhite;
         Dbg_GeraOCGrid.Canvas.Brush.Color:=clRed;
       End; // If DMBelShop.IBQ_AComprarIND_OC_GERADA.AsString='N' Then
     End
    Else
     Begin
       Dbg_GeraOCGrid.Canvas.Font.Style:=[fsBold];
     End; // If DMBelShop.IBQ_AComprarVLR_UNI_COMPRA.AsCurrency=0 Then
  End; // If (Column.FieldName='VLR_UNI_COMPRA') Then

  if not (gdSelected in State) Then
  Begin
    if DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString='99' Then
      Dbg_GeraOCGrid.Canvas.Brush.Color:=$0080FFFF; //$00DDFFDD;

    If DMBelShop.IBQ_AComprarIND_USAR.AsString='NAO'  Then
     Dbg_GeraOCGrid.Canvas.Brush.Color:=$00C6FFC6;

    if DMBelShop.IBQ_AComprarIND_OC_GERADA.AsString='S' Then
      Dbg_GeraOCGrid.Canvas.Brush.Color:=clSkyBlue;
  End; // if not (gdSelected in State) Then

  Dbg_GeraOCGrid.Canvas.FillRect(Rect);
  Dbg_GeraOCGrid.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMBelShop.IBQ_AComprarUNI_COMPRA.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarCLA_CURVA_ABC.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarDTA_ULT_COMPRA.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarIND_SOMA_IPI_BASE_ICMS.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarIND_SOMA_FRETE_BASE_ICMS.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarIND_SOMA_DESPESA_BASE_ICMS.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarIND_SOMA_IPI_BASE_ST.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarIND_SOMA_FRETE_BASE_ST.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarIND_SOMA_DESPESA_BASE_ST.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarIND_SOMA_FRETE_BASE_ICMS.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarCOD_IPI.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarCOD_ICMS.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarCOD_GRUPO_ST.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarTIP_PESSOA.Alignment:=taCenter;
  DMBelShop.IBQ_AComprarDTA_OC_GERADA.Alignment:=taCenter;
end;

procedure TFrmOCLinx.Dbg_GeraOCGridKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
Var
  MySql, s: String;
begin
  If DMBelShop.CDS_AComprarItens.IsEmpty Then
   Exit;

  // Altera Seta Para Baixo para Enter/Return ==================================
  If (key=Vk_Down) Then
   key:=Vk_Return;

  // Executa Enter/Return ======================================================
  If (key=Vk_Return) Then
  Begin
    If DMBelShop.IBQ_AComprar.RecordCount=1 Then
     Begin
       If DMBelShop.CDS_AComprarItens.RecNo=DMBelShop.CDS_AComprarItens.RecordCount Then
        DMBelShop.CDS_AComprarItens.First
       Else
        DMBelShop.CDS_AComprarItens.Next;
     End
    Else
     Begin
       DMBelShop.IBQ_AComprar.Next;
     End; // If DMBelShop.IBQ_AComprar.RecordCount=1 Then

    If Dbg_GeraOCGrid.SelectedIndex<>9 Then
    Begin
      Dbg_GeraOCGrid.SelectedIndex:=0;
      Dbg_GeraOCGrid.SelectedIndex:=3;
    End;

    Dbg_GeraOCGrid.SetFocus;
    bgEnterTab:=False;
    Exit;
  End; // If (key=Vk_Return) Then

  // Executa Seta Para Cima ====================================================
  If (key=VK_UP) and (DMBelShop.IBQ_AComprar.RecordCount=1) Then
  Begin
    If DMBelShop.CDS_AComprarItens.RecNo<>1 Then
     DMBelShop.CDS_AComprarItens.Prior;
  End; // If (key=Key_Down) and (DMBelShop.IBQ_AComprar.RecordCount=1) Then

  // Localiza Produto ==========================================================
  If (Key=VK_F4) And ((PC_GeraOCApresentacao.ActivePage=Ts_GeraOCGrid) And (Ts_GeraOCGrid.CanFocus)) Then
  Begin
    s:='';
    If InputQuery('Localizar Produto','',s) then
    Begin
      if Trim(s)<>'' then
      Begin
        Try
          StrToInt(s);
          DMBelShop.CDS_AComprarItens.Locate('Cod_Item',s,[]);
        Except
          s:=AnsiUpperCase(s);
          DMBelShop.CDS_AComprarItens.Locate('Des_Item',s,[loPartialKey]);
        End;
      End; // if Trim(s)<>'' then
    End; // If InputQuery('Localizar Produto','',s) then
  End; // If Key=VK_F4 Then
end;

procedure TFrmOCLinx.Bt_GeraOCImpEditOCClick(Sender: TObject);
Var
  MySql, dir_relat: String;
  sTotal_Valor, sTotal_Itens, sTotal_Qtd: String;
  s: String;
begin
  Dbg_GeraOCTotalGeral.SetFocus;

  If DMBelShop.CDS_AComprarOCs.IsEmpty Then
   Exit;

   If DMBelShop.CDS_AComprarOCsIND_OC_GERADA.AsString='N' Then
   Begin
     If msg('Ordem de Compra Ainda Não Gerada !!'+cr+cr+'Deseja Continuar ??','C')=2 Then
      Exit;
   End;

  // Imprime OC ================================================================
  If Bt_GeraOCImpEditOC.Caption='Imprimir OC' Then
  Begin
    Screen.Cursor:=crAppStart;

    OdirPanApres.Caption:='AGUARDE !! Montando Relatório...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmOCLinx.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmOCLinx.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmOCLinx;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;

    // Busca OC -----------------------------------------------------
    MySql:=' SELECT oc.des_empresa, oc.num_oc_gerada,'+
           ' Case co.complement_emp'+
           '   when '''' Then'+
           '      co.endereco_emp ||'', ''|| co.num_emp'+
           '   Else'+
           '      co.endereco_emp ||'', ''|| co.num_emp ||'' - ''|| co.complement_emp'+
           ' End Endereco,'+
           ' co.bairro_emp des_bairro,'+
           ' Cast(co.cidade_emp as varchar(60)) des_cidade,'+
           ' co.estado_emp cod_uf,'+
           ' cast(co.cep_emp as varchar(9)) cod_cep,'+

           ' CAST(('+
           ' substring(co.cnpj_emp from 1 for 2) ||''.''||'+
           ' substring(co.cnpj_emp from 3 for 3) ||''.''||'+
           ' substring(co.cnpj_emp from 6 for 3) ||''/''||'+
           ' substring(co.cnpj_emp from 9 for 4) ||''-''||'+
           ' substring(co.cnpj_emp from 13 for 2'+
           ' )) AS VARCHAR(18)) num_cnpj,'+

           ' co.inscricao_emp inscr_estadual,'+
           ' case oc.ind_oc_gerada'+
           '   When ''N'' Then'+
           '      ''ABERTA'''+
           '   Else'+
           '      ''ABERTA - PENDENTE FORNECEDOR'''+
           ' End Situacao,'+
           ' Cast(oc.dta_oc_gerada as Date) Dta_Pedido,'+
           ' Cast(oc.dta_oc_gerada as Date) Dta_Entrega,'+
           ' oc.cod_fornecedor, oc.des_fornecedor,'+
           ' oc.cod_item, oc.cod_barras, oc.cod_referencia_forn,'+
           ' oc.des_item, oc.uni_compra, oc.uni_venda,'+
           ' oc.qtd_acomprar, oc.vlr_uni_compra, oc.per_desconto,'+
           ' oc.vlr_tot_compra, oc.obs_oc, oc.cod_comprador, us.des_usuario,'+
           ' ''000.000.000.0000'' Enderecamento'+

           ' FROM OC_COMPRAR oc'+
           '    LEFT JOIN LINXLOJAS    co ON co.empresa=oc.cod_empresa'+
           '    LEFT JOIN PS_USUARIOS  us ON us.cod_usuario=oc.cod_comprador'+

           ' WHERE oc.num_documento='+QuotedStr(IntToStr(EdtGeraOCBuscaDocto.AsInteger))+
           ' AND   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date))))+
           ' AND   oc.cod_empresa='+QuotedStr(DMBelShop.CDS_AComprarOCsCOD_EMP_FIL.AsString);

           If Trim(DMBelShop.CDS_AComprarOCsNUM_OC_GERADA.AsString)<>'' Then
            MySql:=
             MySql+' AND   oc.num_oc_gerada='+QuotedStr(DMBelShop.CDS_AComprarOCsNUM_OC_GERADA.AsString)
           Else
            MySql:=
             MySql+' AND   oc.num_oc_gerada IS NULL';
    MySql:=
     MySql+' ORDER BY oc.des_item';
    DMBelShop.IBQ_OrdemCompra.Close;
    DMBelShop.IBQ_OrdemCompra.SQL.Clear;
    DMBelShop.IBQ_OrdemCompra.SQL.Add(MySql);
    DMBelShop.IBQ_OrdemCompra.Open;

    // Dados da Filial ----------------------------------------------
    MySql:=' SELECT lo.fone_emp telefone, null contato, lo.email_emp email'+
           ' FROM LINXLOJAS lo'+
           ' WHERE lo.empresa='+DMBelShop.CDS_AComprarOCsCOD_EMP_FIL.AsString;
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    sEmpTelefone  :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Telefone').AsString);
    sEmpCcontato  :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Contato').AsString);
    sEmpEmail     :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Email').AsString);
    DMBelShop.CDS_BuscaRapida.Close;

    // Dados do Fornecedor ------------------------------------------
    MySql:=' SELECT'+
           ' CASE'+
           '   WHEN TRIM(fo.complement_end_cli) <> '''' THEN'+
           '     fo.endereco_cliente || '', '' || fo.numero_rua_cliente || ''/'' || fo.complement_end_cli'+
           '   ELSE'+
           '     fo.endereco_cliente || '','' || fo.numero_rua_cliente'+
           ' END Endereco,'+
           ' fo.cidade_cliente cidade, fo.uf_cliente estado, fo.cep_cliente cod_cep,'+
           ' fo.fone_cliente fone1, NULL fonefax, fo.email_cliente email, NULL contato'+

           ' FROM LINXCLIENTESFORNEC fo'+
           ' WHERE fo.tipo_cliente IN (''F'', ''A'')'+
           ' AND   fo.cod_cliente='+DMBelShop.CDS_AComprarOCsCOD_FORNECEDOR.AsString;
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    sFornEndereco :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Endereco').AsString);
    sFornCidade   :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cidade').AsString);
    sFornEstado   :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Estado').AsString);
    sFornCodCep   :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Cep').AsString);
    sFornFone1    :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Fone1').AsString);
    sFornFoneFax  :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('FoneFax').AsString);
    sFornEmail    :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('EMail').AsString);
    sFornContato  :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Contato').AsString);
    DMBelShop.CDS_BuscaRapida.Close;

    // Imprime Ordem de Compra --------------------------------------
    sgTipoImpressao:='ImpOC';

    // Diretorio dos Relatórios -------------------------------------
    {$IFDEF MSWINDOWS}
      dir_relat       :=  ExtractFilePath(Application.ExeName)+'Relatorios\';
    {$ENDIF}

    DMRelatorio.frDBDataSet1.DataSet:=DMBelShop.IBQ_OrdemCompra;
    DMRelatorio.frReport1.LoadFromFile(Dir_Relat+'OrdemCompra.frf');

    // Atualiza Variaveis -------------------------------------------
    DMRelatorio.frReport1.Dictionary.Variables.Variable['Telefone']:=#39+sEmpTelefone+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['Contato']:=#39+sEmpCcontato+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['EMail']:=#39+sEmpEmail+#39;

    DMRelatorio.frReport1.Dictionary.Variables.Variable['EnderecoForn']:=#39+sFornEndereco+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['CidadeForn']:=#39+sFornCidade+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['EstadoForn']:=#39+sFornEstado+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['CepForn']:=#39+sFornCodCep+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['FoneForn']:=#39+sFornFone1+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['FoneFaxForn']:=#39+sFornFonefax+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['EmailForn']:=#39+sFornEmail+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['ContatoForn']:=#39+sFornContato+#39;

    DMRelatorio.frReport1.PrepareReport;
    DMRelatorio.frReport1.ShowReport;

    Screen.Cursor:=crDefault;
    OdirPanApres.Visible:=False;
    Refresh;
  End; // If Bt_GeraOCImpEditOC.Caption='Imprimir OC' Then
end;

procedure TFrmOCLinx.Dbg_GeraOCTotalGeralDblClick(Sender: TObject);
Var
  bGrava: Boolean;
begin
  bGrava:=True;
  If (Trim(DMBelShop.CDS_AComprarOCsIND_OC_GERADA.AsString)='S') And (DMBelShop.CDS_AComprarOCsTIPO.AsString='OC') Then
  Begin
    msg('Ordem de Compra já Gerada !!','A');
    bGrava:=False;
  End;

  If DMBelShop.CDS_AComprarOCsTOTAL_OC.AsCurrency=0 Then
  Begin
    msg('Valor do Documento Igual a Zero !!','A');
    bGrava:=False;
  End;

  If Not bGrava Then
  Begin
    DMBelShop.CDS_AComprarOCs.Edit;
    DMBelShop.CDS_AComprarOCsGERAR.AsString:='N';
    DMBelShop.CDS_AComprarOCs.Post;
    Exit;
  End; // If Not bGrava Then

  If DMBelShop.CDS_AComprarOCsGERAR.AsString='S' Then
  Begin
    DMBelShop.CDS_AComprarOCs.Edit;
    DMBelShop.CDS_AComprarOCsGERAR.AsString:='N';
    DMBelShop.CDS_AComprarOCs.Post;

    If igQtd_Tipo>0 Then
     igQtd_Tipo:=igQtd_Tipo-1;

    If igQtd_Tipo<0 Then
     igQtd_Tipo:=0;

    Exit;
  End; // If DMBelShop.CDS_AComprarOCsGERAR.AsString='S' Then

  If igQtd_Tipo=0 Then
   Begin
     DMBelShop.CDS_AComprarOCs.Edit;
     DMBelShop.CDS_AComprarOCsGERAR.AsString:='S';
     DMBelShop.CDS_AComprarOCs.Post;

     sgIndOCGerada:=DMBelShop.CDS_AComprarOCsIND_OC_GERADA.AsString;
     sgTipo :=DMBelShop.CDS_AComprarOCsTIPO.AsString;
     igQtd_Tipo:=1;
   End
  Else // If igQtd_Tipo=0 Then
   Begin
     If (sgIndOCGerada=DMBelShop.CDS_AComprarOCsIND_OC_GERADA.AsString) And (sgTipo =DMBelShop.CDS_AComprarOCsTIPO.AsString) Then
      Begin
        igQtd_Tipo:=igQtd_Tipo+1;

        DMBelShop.CDS_AComprarOCs.Edit;
        DMBelShop.CDS_AComprarOCsGERAR.AsString:='S';
        DMBelShop.CDS_AComprarOCs.Post;
      End
     Else // If (sgIndOCGerada=DMBelShop.CDS_AComprarOCsIND_OC_GERADA.AsString) And...
      Begin
        DMBelShop.CDS_AComprarOCs.Edit;
        DMBelShop.CDS_AComprarOCsGERAR.AsString:='N';
        DMBelShop.CDS_AComprarOCs.Post;

        msg('Selecione Somente Um Tipo de Documento:'+cr+cr+'(OC)=Ordem de Compra ou'+cr+'(TR)=Romaneio de Transferência)'+cr+'(Aberto ou Fechado) !!','A');
      End; // If (sgIndOCGerada=DMBelShop.CDS_AComprarOCsIND_OC_GERADA.AsString) And...
   End; // If igQtd_Tipo=0 Then
end;

procedure TFrmOCLinx.Dbg_GeraOCTotalGeralDrawColumnCell(Sender: TObject; const Rect: TRect;
          DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if Trim(DMBelShop.CDS_AComprarOCsIND_OC_GERADA.AsString)='S' Then
     Dbg_GeraOCTotalGeral.Canvas.Brush.Color:=clSkyBlue;

    If DMBelShop.CDS_AComprarOCsGERAR.AsString='S' Then
     Dbg_GeraOCTotalGeral.Canvas.Brush.Color:=clAqua;
  End;

  If (Column.FieldName='NUM_OC_GERADA') or (Column.FieldName='DTA_OC_GERADA') Then
   Dbg_GeraOCTotalGeral.Canvas.Font.Color:=clBlue;

  If (Column.FieldName='TIPO') Then
  Begin
    If DMBelShop.CDS_AComprarOCsTIPO.AsString='TR' Then
     Begin
       Dbg_GeraOCTotalGeral.Canvas.Brush.Color:=clRed;
       Dbg_GeraOCTotalGeral.Canvas.Font.Color:=clWhite;
     End
    Else If DMBelShop.CDS_AComprarOCsTIPO.AsString='OC' Then
     Begin
       Dbg_GeraOCTotalGeral.Canvas.Font.Style:=[fsBold];
     End
  End;

  // Funciona Somente com Isto
  Dbg_GeraOCTotalGeral.Canvas.FillRect(Rect);
  Dbg_GeraOCTotalGeral.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMBelShop.CDS_AComprarOCsGERAR.Alignment:=taCenter;
  DMBelShop.CDS_AComprarOCsCOD_EMP_FIL.Alignment:=taCenter;
  DMBelShop.CDS_AComprarOCsCOD_LINX.Alignment:=taCenter;
  DMBelShop.CDS_AComprarOCsDTA_OC_GERADA.Alignment:=taCenter;

end;

procedure TFrmOCLinx.Bt_OCBuscaProdutosClick(Sender: TObject);
Var
  MySql: String;

  hHrInicio, hHrFim,
  sDtaDocto: String;

  bCriaPedidoOC: Boolean;
begin

  Lb_EmpAprocessar.Caption:='0';

  sgOutrasEmpresa:='';
  bgSelectSoLinx:=True;
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False;
  FrmSelectEmpProcessamento.Pan_SelectEmpProcECommerce.Visible:=False;

  FrmSelectEmpProcessamento.ShowModal;
  bgSelectSoLinx:=False;

  // Se Processa Produtos E-Commerce ===========================================
  bgECommerce:=FrmSelectEmpProcessamento.Ckb_SelectEmpProcECommerce.Checked;
  Lb_EmpAprocessar.Caption:=IntToStr(FrmSelectEmpProcessamento.iNrEmpProc);

  FreeAndNil(FrmSelectEmpProcessamento);

  // Verifica se Processa Todas as Empresas ====================================
  sgEmpresas:='';
  bgTodasEmpresas:=True;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
     Begin
       // Atualiza sgEmpresa para Sql ---------------------------------
       If sgEmpresas='' Then
        sgEmpresas:=QuotedStr(DMBelShop.CDS_EmpProcessaCOD_LINX.AsString)
       Else
        sgEmpresas:=sgEmpresas+', '+QuotedStr(DMBelShop.CDS_EmpProcessaCOD_LINX.AsString);
     End
    Else // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
     Begin
       bgTodasEmpresas:=False;
     End; // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do

  If sgEmpresas='' Then
  Begin
    CB_Mes1.SetFocus;
    Exit;
  End; // If sgEmpresas='' Then

  If msg('Deseja Realmente Iniciar o Calculo ??','C')=2 Then
  Begin
    Lb_EmpAprocessar.Caption:='0';
    CB_Mes1.SetFocus;
    Exit;
  End;

  // Inicia o Processameto =====================================================
  hHrInicio:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
  hHrFim:='';

  CB_Mes1.SetFocus;
  Lb_EmpProcessadas.Caption:='0';

  If Not ConsisteBuscaProdutos Then
   Exit;
  
  OdirPanApres.Caption:='AGUARDE !! Inicializando Processos...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmOCLinx.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmOCLinx.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmOCLinx;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Numero de Meses Total -------------------------------------------------
  igTotMeses:=1; // CB_Mes1 - Sempre Soma
  If CB_Mes2.Text<>'NAO USAR' Then igTotMeses:=igTotMeses+1;
  If CB_Mes3.Text<>'NAO USAR' Then igTotMeses:=igTotMeses+1;
  If CB_Mes4.Text<>'NAO USAR' Then igTotMeses:=igTotMeses+1;
  If CB_Mes5.Text<>'NAO USAR' Then igTotMeses:=igTotMeses+1;
  If CB_Mes6.Text<>'NAO USAR' Then igTotMeses:=igTotMeses+1;
  If CB_Mes7.Text<>'NAO USAR' Then igTotMeses:=igTotMeses+1;
  If CB_Mes8.Text<>'NAO USAR' Then igTotMeses:=igTotMeses+1;

  Screen.Cursor:=crAppStart;

  // Produtos Selecionados =====================================================
  SelecionaProdutos(True, True);

  // Calcula Dias Uteis no Ultimo Ano ==========================================
  DecodeDate(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor), wgAnoH, wgMesH, wgDiaH);
  sgDtaIniAno:=DateToStr(EncodeDate(wgAnoH-1, wgMesH, 1));
  sgDtaFimAno:=DateToStr(EncodeDate(wgAnoH, wgMesH, wgDiaH));

  igNrDiasAno:=DiasUteisBelShop(StrToDateTime(sgDtaIniAno),StrToDateTime(sgDtaFimAno)-1, False, True);

  //============================================================================
  // PROCESSA LOJAS ============================================================
  //============================================================================
  DecimalSeparator:='.';
  DateSeparator:='.';
  igNumSeqPed:=0;
  sgNumPed:='0';

  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    Refresh;

    if DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
    Begin
      // Busca Numero de Documento =================================================
      If sgNumPed='0' Then
      Begin
        MySql:=' SELECT GEN_ID(GEN_NUM_DOC_CALCULO_LINX,1) Codigo'+
               ' FROM RDB$DATABASE';
        DMBelShop.CDS_Busca.Close;
        DMBelShop.SDS_Busca.CommandText:=MySql;
        DMBelShop.CDS_Busca.Open;
        sgNumPed:=DMBelShop.CDS_Busca.FieldByName('Codigo').AsString;
        DMBelShop.SDS_Busca.Close;
      End; // If sgNumPed='0' Then

      sCodFilial   :=DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString;
      igCodLojaLinx:=DMBelShop.CDS_EmpProcessaCOD_LINX.AsInteger;

      FrmBelShop.MontaProgressBar(True, FrmOCLinx);

      OdirPanApres.Caption:='AGUARDE !! Processando Loja (Linx): '+IntToStr(igCodLojaLinx)+' - '+DMBelShop.CDS_EmpProcessaRAZAO_SOCIAL.AsString;
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmOCLinx.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmOCLinx.Height-OdirPanApres.Height)/2))-20;
      OdirPanApres.Font.Style:=[fsBold];
      OdirPanApres.Parent:=FrmOCLinx;
      OdirPanApres.BringToFront();
      OdirPanApres.Visible:=True;
      Refresh;

      // Busca Produtos ========================================================
      bCriaPedidoOC:=True;
      If Not BuscaProdutosAnalise Then
       bCriaPedidoOC:=False;

       If bCriaPedidoOC Then
        CriaPedidoOC;

      FrmBelShop.MontaProgressBar(False, FrmOCLinx);
    End; // if DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    OdirPanApres.Visible:=False;
    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do

  // Odirapagar
  // DMBelShop.CDS_UltCompraTransito.Close;

  DecimalSeparator:=',';
  DateSeparator:='/';

  // Calcula Sugestões / Transferencias / Estoque Excedente ====================
  OCCalculaSugTransfExc(sgNumPed, sgDtaDoc);

  // Busca Totais das OCs ======================================================
  TotaisOCLinx(sgNumPed);

  Screen.Cursor:=crDefault;

  // Encerramento ==============================================================
  hHrFim:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

  Edt_OCTotProdutos.Value:=0;

  msg('Analise dos Produtos'+cr+'Efetuada com SUCESSO !!'+cr+cr+
      ' TEMPO: '+TimeToStr(StrToTime(hHrFim)-StrToTime(hHrInicio)),'A');

  Lb_EmpAprocessar.Caption:='0';
  Lb_EmpProcessadas.Caption:='0';

  PC_OrdemCompra.TabIndex:=1;
  PC_OrdemCompraChange(Self);

  EdtGeraOCBuscaDocto.Value:=StrToInt(sgNumPed);
  EdtGeraOCBuscaDoctoExit(Sender);

end;

procedure TFrmOCLinx.EdtFiltroCodFornExit(Sender: TObject);
Var
  MySql: String;
  bSiga: Boolean;
begin

  If EdtFiltroCodForn.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Fornecedores ======================================================
    MySql:=' SELECT fo.nome_cliente nomefornecedor, fo.cod_cliente codfornecedor'+
           ' FROM LINXCLIENTESFORNEC fo'+
           ' WHERE fo.tipo_cliente IN (''F'', ''A'')'+
           ' AND   EXISTS(SELECT 1'+
           '              FROM LINXPRODUTOS pr'+
           '              WHERE pr.cod_fornecedor = fo.cod_cliente'+
           '              AND   pr.desativado = ''N''';

           If Not Ckb_FiltroProdNaoCompra.Checked Then
            MySql:=
             MySql+' AND NOT ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))'
           Else If (Ckb_FiltroProdNaoCompra.Checked) And (Ckb_FiltroProdSoNaoCompra.Checked)  Then
            MySql:=
             MySql+' AND ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))';

     MySql:=
      MySql+')'+
            ' AND fo.cod_cliente = '+EdtFiltroCodForn.Text;
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    Screen.Cursor:=crDefault;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('codfornecedor').AsString)='' Then
    Begin
      msg('Fornecedor NÃO Encontrado !!!', 'A');
      DMBelShop.CDS_BuscaRapida.Close;
      EdtFiltroCodForn.Clear;
      EdtFiltroCodForn.SetFocus;
      Exit;
    End;

    If DMVirtual.CDS_V_Fornecedores.Locate('Cod_Fornecedor',DMBelShop.CDS_BuscaRapida.FieldByName('CodFornecedor').AsString,[]) Then
    Begin
      Begin
        msg('Fornecedor Já Informado !!','A');
        DMBelShop.CDS_BuscaRapida.Close;
        EdtFiltroCodForn.Clear;
        EdtFiltroCodForn.SetFocus;
        Exit;
      End;
    End;

    DMVirtual.CDS_V_Fornecedores.Insert;
    DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString:=DMBelShop.CDS_BuscaRapida.FieldByName('CodFornecedor').AsString;
    DMVirtual.CDS_V_FornecedoresDes_Fornecedor.AsString:=DMBelShop.CDS_BuscaRapida.FieldByName('NomeFornecedor').AsString;
    DMVirtual.CDS_V_Fornecedores.Post;

    // Monta sFornecedore
    MontaSelectFornecedoresLinx;

    DMBelShop.CDS_BuscaRapida.Close;
    EdtFiltroCodForn.Text:='0';
    EdtFiltroCodForn.SetFocus;
  End;
end;

procedure TFrmOCLinx.Bt_FiltroBuscaFornClick(Sender: TObject);
Var
  MySql: String;
  bSiga: Boolean;
begin

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ======================================================
  MySql:=' SELECT fo.nome_cliente nomefornecedor, fo.cod_cliente codfornecedor'+
         ' FROM LINXCLIENTESFORNEC fo'+
         ' WHERE fo.tipo_cliente IN (''F'', ''A'')'+
         ' AND   EXISTS(SELECT 1'+
         '              FROM LINXPRODUTOS pr'+
         '              WHERE pr.cod_fornecedor = fo.cod_cliente'+
         '              AND   pr.desativado = ''N''';

         If Not Ckb_FiltroProdNaoCompra.Checked Then
          MySql:=
           MySql+' AND NOT ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))'
         Else If (Ckb_FiltroProdNaoCompra.Checked) And (Ckb_FiltroProdSoNaoCompra.Checked)  Then
          MySql:=
           MySql+' AND ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))';

  MySql:=
   MySql+')'+
         ' order by fo.nome_cliente';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('codfornecedor').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    EdtFiltroCodForn.Clear;
    FreeAndNil(FrmPesquisa);
    EdtFiltroCodForn.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='NomeFornecedor';
  FrmPesquisa.Campo_Codigo:='CodFornecedor';
  FrmPesquisa.Campo_Descricao:='NomeFornecedor';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    If DMVirtual.CDS_V_Fornecedores.Locate('Cod_Fornecedor',FrmPesquisa.EdtCodigo.Text,[]) Then
    Begin
      Begin
        msg('Fornecedor Já Informado !!','A');
        EdtFiltroCodForn.Clear;
        FreeAndNil(FrmPesquisa);
        EdtFiltroCodForn.SetFocus;
        Exit;
      End;
    End;

    DMVirtual.CDS_V_Fornecedores.Insert;
    DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString:=FrmPesquisa.EdtCodigo.Text;
    DMVirtual.CDS_V_FornecedoresDes_Fornecedor.AsString:=FrmPesquisa.EdtDescricao.Text;
    DMVirtual.CDS_V_Fornecedores.Post;

    // Monta sFornecedore
    MontaSelectFornecedoresLinx;
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);

end;

procedure TFrmOCLinx.EdtFiltroCodProdutoExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtFiltroCodProduto.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Produtos ==========================================================
    MySql:=' SELECT pr.nome Des_Produto, pr.cod_produto, pr.cod_fornecedor'+
           ' FROM LINXPRODUTOS pr'+
           ' WHERE pr.desativado = ''N'''+
           ' AND   pr.cod_produto='+IntToStr(EdtFiltroCodProduto.AsInteger);

           If Not Ckb_FiltroProdNaoCompra.Checked Then
            MySql:=
             MySql+' AND NOT ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))'
           Else If (Ckb_FiltroProdNaoCompra.Checked) And (Ckb_FiltroProdSoNaoCompra.Checked)  Then
            MySql:=
             MySql+' AND ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))';

           If Trim(sgFornecedoresLinx)<>'' Then
            MySql:=
             MySql+' And pr.cod_fornecedor in ('+sgFornecedoresLinx+')';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    Screen.Cursor:=crDefault;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString)='' Then
    Begin
      msg('Produto NÃO Encontrado !!!', 'A');
      DMBelShop.CDS_BuscaRapida.Close;
      EdtFiltroCodProduto.Clear;
      EdtFiltroCodProduto.SetFocus;
      Exit;
    End;

    If DMVirtual.CDS_V_Produtos.Locate('Cod_Produto',DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString,[]) Then
    Begin
      msg('Produto Já Informado !!','A');
      DMBelShop.CDS_BuscaRapida.Close;
      EdtFiltroCodProduto.Clear;
      EdtFiltroCodProduto.SetFocus;
      Exit;
    End;

    DMVirtual.CDS_V_Produtos.Insert;
    DMVirtual.CDS_V_ProdutosCod_Produto.AsString:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString;
    DMVirtual.CDS_V_ProdutosDes_Produto.AsString:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Produto').AsString;
    DMVirtual.CDS_V_ProdutosCod_Fornecedor.AsString:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Fornecedor').AsString;
    DMVirtual.CDS_V_Produtos.Post;

    DMBelShop.CDS_BuscaRapida.Close;
    EdtFiltroCodProduto.Text:='0';
    EdtFiltroCodProduto.SetFocus;
  End;
end;

procedure TFrmOCLinx.Dbg_FiltroFornecedoresKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Not DMVirtual.CDS_V_Fornecedores.IsEmpty Then
  Begin
    // Excluir os Itens --------------------------------------------
    If Not DMVirtual.CDS_V_Produtos.IsEmpty Then
    Begin
      DMVirtual.CDS_V_Produtos.Filtered:=False;
      DMVirtual.CDS_V_Produtos.Filter:='Cod_Fornecedor='+DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString;
      DMVirtual.CDS_V_Produtos.Filtered:=True;

      DMVirtual.CDS_V_Produtos.First;
      While Not DMVirtual.CDS_V_Produtos.Eof do
       DMVirtual.CDS_V_Produtos.Delete;

      DMVirtual.CDS_V_Produtos.Filtered:=False;
      DMVirtual.CDS_V_Produtos.First;
    End; // If Not DMVirtual.CDS_V_Produtos.IsEmpty Then

    // Excluir o Fornecedor ----------------------------------------
    DMVirtual.CDS_V_Fornecedores.Delete;

    // Monta sFornecedore
    MontaSelectFornecedoresLinx;
  End; // If Not DMVirtual.CDS_V_Fornecedores.IsEmpty Then
  Dbg_FiltroFornecedores.SetFocus;

end;

procedure TFrmOCLinx.Dbg_FiltroProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key=VK_Delete Then
  Begin
    If Not DMVirtual.CDS_V_Produtos.IsEmpty Then
     DMVirtual.CDS_V_Produtos.Delete;
  End; // If Key=VK_Delete Then

  Dbg_FiltroProduto.SetFocus;

end;

procedure TFrmOCLinx.Bt_FiltroBuscaProdtudoClick(Sender: TObject);
Var
  MySql: String;
begin

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT pr.nome Des_Produto, pr.cod_produto, pr.cod_fornecedor'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE pr.desativado = ''N''';

         If Not Ckb_FiltroProdNaoCompra.Checked Then
          MySql:=
           MySql+' AND NOT ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))'
         Else If (Ckb_FiltroProdNaoCompra.Checked) And (Ckb_FiltroProdSoNaoCompra.Checked)  Then
          MySql:=
           MySql+' AND ((COALESCE(pr.id_colecao,0) = 197) OR (UPPER(COALESCE(pr.desc_colecao, ''SEM INFORMACAO'')) = ''NAO COMPRA''))';

         If Trim(sgFornecedoresLinx)<>'' Then
          MySql:=
           MySql+' And pr.cod_fornecedor in ('+sgFornecedoresLinx+')';

  MySql:=
   MySql+' Order by pr.Nome';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim( DMBelShop.CDS_Pesquisa.FieldByName('Cod_Fornecedor').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    EdtFiltroCodProduto.Clear;
    FreeAndNil(FrmPesquisa);
    EdtFiltroCodProduto.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Produto';
  FrmPesquisa.Campo_Codigo:='Cod_Produto';
  FrmPesquisa.Campo_Descricao:='Des_Produto';
  FrmPesquisa.EdtDescricao.Clear;
  FrmPesquisa.Campo_Retorno1:='Cod_Fornecedor';

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    If DMVirtual.CDS_V_Produtos.Locate('Cod_Produto',FrmPesquisa.EdtCodigo.Text,[]) Then
    Begin
      Begin
        msg('Produto Já Informado !!','A');
        EdtFiltroCodProduto.Clear;
        FreeAndNil(FrmPesquisa);
        EdtFiltroCodProduto.SetFocus;
        Exit;
      End;
    End;

    DMVirtual.CDS_V_Produtos.Insert;
    DMVirtual.CDS_V_ProdutosCod_Produto.AsString:=FrmPesquisa.EdtCodigo.Text;
    DMVirtual.CDS_V_ProdutosDes_Produto.AsString:=FrmPesquisa.EdtDescricao.Text;
    DMVirtual.CDS_V_ProdutosCod_Fornecedor.AsString:=FrmPesquisa.Retorno1;
    DMVirtual.CDS_V_Produtos.Post;
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmOCLinx.PopM_GeraOCVoltar1Click(Sender: TObject);
begin
  PC_GeraOCApresentacao.TabIndex:=0;
  PC_GeraOCApresentacaoChange(Self);

  PC_OrdemCompra.TabIndex:=0;
  PC_OrdemCompraChange(Sender);

  PC_Filtros.ActivePage:=TS_FiltroFornecedor;
  PC_FiltrosChange(Sender);
  EdtFiltroCodForn.SetFocus;
end;

procedure TFrmOCLinx.PopM_GeraOCExportaParaOutroDoctoClick(Sender: TObject);
begin
  Dbg_GeraOCGrid.SetFocus;

  If DMBelShop.IBQ_AComprar.IsEmpty Then
   Exit;

  If msg('A Empresa Selecionda Esta CORRETA ???','C')=2 Then
  Begin
    Dbg_GeraOCFiliais.SetFocus;
    Exit;
  End;

  PC_GeraOCApresentacao.TabIndex:=0;
  PC_GeraOCApresentacaoChange(Self);

  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  bgLinxChamada:=True;
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(0);

  FrmSolicitacoes.EdtSolicExpDoctoOrigem.Value:=EdtGeraOCBuscaDocto.Value;
  FrmSolicitacoes.EdtSolicExpLoja.Text:=DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString+' - '+
                                        DMBelShop.IBQ_AComprarDES_EMPRESA.AsString;

  FrmSolicitacoes.EdtSolicExpDoctoDestino.Value:=0;
  FrmSolicitacoes.EdtSolicExpTpExportacao.Text:='TODOS OS PRODUTOS';
  FrmSolicitacoes.EdtSolicExpTpExportacao.Color:=clRed;

  FrmSolicitacoes.Ckb_SolicExpExcProduto.Checked:=True;
  FrmSolicitacoes.Ckb_SolicExpExcProdutoClick(Self);

  FrmSolicitacoes.Ckb_SolicExpSoProduto.Checked:=False;
  FrmSolicitacoes.Ckb_SolicExpSoProdutoClick(Self);

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  FreeAndNil(FrmSolicitacoes);
  bgLinxChamada:=False;

  If bgProcessar Then
  Begin
    EdtGeraOCBuscaDoctoExit(Self);
  End; // If bgProcessar Then

end;

procedure TFrmOCLinx.Ckb_FiltroProdNaoCompraClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_FiltroProdNaoCompra);

  If Not Ckb_FiltroProdNaoCompra.Checked Then
   Ckb_FiltroProdSoNaoCompra.Checked:=False;

  AcertaCkb_SN(Ckb_FiltroProdSoNaoCompra);

end;

procedure TFrmOCLinx.Ckb_FiltroProdNaoCompraKeyUp(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  Ckb_FiltroProdNaoCompraClick(Self);
end;

procedure TFrmOCLinx.PopM_GeraOCComparaPedidosClick(Sender: TObject);
begin
  Dbg_GeraOCGrid.SetFocus;

  If DMBelShop.CDS_AComprarItens.IsEmpty Then
   Exit;

  Screen.Cursor:=crAppStart;

  // Monta Compração de Pedidos ================================================
  DMBelShop.CDS_OCComparaPedidos.Close;
  DMBelShop.SDS_OCComparaPedidos.Params.ParamByName('NumDoc').AsInteger:=EdtGeraOCBuscaDocto.AsInteger;
  DMBelShop.SDS_OCComparaPedidos.Params.ParamByName('DtaDoc').AsDate   :=DtEdt_GeraOCDataDocto.Date;
  DMBelShop.CDS_OCComparaPedidos.Open;

  If DMBelShop.CDS_OCComparaPedidos.IsEmpty Then
  Begin
    DMBelShop.CDS_OCComparaPedidos.Close;
    msg('Sem Pedido para Comparação !!','A');
    Exit;
  End; // If DMBelShop.CDS_OCComparaPedidos.IsEmpty Then

  Screen.Cursor:=crDefault;

  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(19);

  bgProcessar:=False;
  FrmSolicitacoes.GridNewCriar(DMBelShop.DS_OCComparaPedidos, 'PopM_GeraOC', False);
  FrmSolicitacoes.Caption:='C O M P R A S';
  FrmSolicitacoes.Ts_QualquerCoisa.Caption:='Comparativo de Pedidos de Compra';

  FrmSolicitacoes.AutoSize:=False;
  FrmSolicitacoes.Width:=1000;
  FrmSolicitacoes.AutoSize:=True;
  FrmSolicitacoes.ShowModal;

  DMBelShop.CDS_OCComparaPedidos.Close;
  FreeAndNil(FrmSolicitacoes);

end;

procedure TFrmOCLinx.PopM_GeraOCValorUnitarioClick(Sender: TObject);
begin
  Dbg_GeraOCGrid.SetFocus;

  If DMBelShop.CDS_AComprarItens.IsEmpty Then
   Exit;

  // Altera Preco Unitário =====================================================
  FrmBelShop.AlteraAComprar(DMBelShop.IBQ_AComprar, 'P', VarToStr(EdtGeraOCBuscaDocto.Value), DateToStr(DtEdt_GeraOCDataDocto.Date));

end;

procedure TFrmOCLinx.PopM_GeraOCPercDescontoClick(Sender: TObject);
begin
  Dbg_GeraOCGrid.SetFocus;

  If DMBelShop.CDS_AComprarItens.IsEmpty Then
   Exit;

  // Altera Desconto Individual ================================================
  FrmBelShop.AlteraAComprar(DMBelShop.IBQ_AComprar, 'DI', VarToStr(EdtGeraOCBuscaDocto.Value), DateToStr(DtEdt_GeraOCDataDocto.Date));

end;

procedure TFrmOCLinx.DiasInformadosClick(Sender: TObject);
begin
  If Not Gb_GeraOCCalculaCompra.Visible Then
   Begin
     Gb_GeraOCCalculaCompra.Visible:=True;
     Gb_GeraOCEstoqueTransito.Visible:=True;

     PC_GeraOCApresentacao.TabIndex:=0;
     PC_GeraOCApresentacaoChange(Self);

     Dbg_GeraOCGrid.SelectedIndex:=0;
     Dbg_GeraOCGrid.SelectedIndex:=3;
     EdtGeraOCDias.SetFocus;
   End
  Else
   Begin
     Gb_GeraOCCalculaCompra.Visible:=False;
     Gb_GeraOCEstoqueTransito.Visible:=False;

     Dbg_GeraOCGrid.SetFocus;;
   End
end;

procedure TFrmOCLinx.ZeraQuantidadeAComprarClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_GeraOCGrid.SetFocus;

  If DMBelShop.CDS_AComprarItens.IsEmpty Then
   Exit;

  If msg('Deseja Realmente ZERAR '+cr+cr+'as Quantidade A Comnpar ??','C')=2 Then
   Exit;

  sgNumPed:=IntToStr(EdtGeraOCBuscaDocto.AsInteger);
  sgDtaDoc:=DateToStr(DtEdt_GeraOCDataDocto.Date);

  OdirPanApres.Caption:='AGUARDE !! ReCalculando Ordem de Compra Número: '+sgNumPed;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmOCLinx.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmOCLinx.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmOCLinx;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' Update OC_COMPRAR o'+
           ' SET o.qtd_acomprar=0'+
           ', o.vlr_descontos=0'+
           ', o.vlr_bruto=0'+
           ', o.vlr_base_icms=0'+
           ', o.vlr_icms=0'+
           ', o.vlr_ipi=0'+
           ', o.vlr_base_st=0'+
           ', o.vlr_st=0'+
           ', o.vlr_tot_compra=0'+
           ', o.vlr_tot_venda=0'+

           ' WHERE Ind_OC_Gerada=''N'''+
           ' AND   o.qtd_transf=0'+
           ' AND   o.qtd_acomprar<>0'+
           ' And   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaDoc)))+
           ' AND   o.Num_Documento='+sgNumPed;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try

  // Busca Totais das OCs ======================================================
  TotaisOCLinx(sgNumPed);

  Edt_OCTotProdutos.Value:=0;

  Lb_EmpAprocessar.Caption:='0';
  Lb_EmpProcessadas.Caption:='0';

  EdtGeraOCBuscaDocto.Value:=StrToInt(sgNumPed);
  EdtGeraOCBuscaDoctoExit(Sender);

  msg('Calculo Efetuado com SUCESSO !!','A');

end;

procedure TFrmOCLinx.PopM_GeraOCLegendaCoresClick(Sender: TObject);
begin
  FrmBelShop.PopM_GeraOCLegendaCoresClick(Self);
end;

procedure TFrmOCLinx.PopM_OCRomaneioMarcarOCsAbertasClick(Sender: TObject);
begin
  FrmBelShop.PopM_OCRomaneioMarcarOCsAbertasClick(Self);
end;

procedure TFrmOCLinx.PopM_OCRomaneioDesmarcarRomaneiosDesmarcarClick(Sender: TObject);
begin
  FrmBelShop.PopM_OCRomaneioDesmarcarRomaneiosDesmarcarClick(Self);
end;

end.
