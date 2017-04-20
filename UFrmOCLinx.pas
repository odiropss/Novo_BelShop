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
    PopM_GeraOC: TPopupMenu;
    PopM_GeraOCVoltar1: TMenuItem;
    N34: TMenuItem;
    PopM_GeraOCApresentaPedido: TMenuItem;
    N29: TMenuItem;
    PopM_GeraOCVerTransito: TMenuItem;
    PopM_GeraOCOCsOrigem: TMenuItem;
    N28: TMenuItem;
    PopM_GeraOCCalculaTransfernciasCD: TMenuItem;
    N25: TMenuItem;
    PopM_GeraOCExportaParaOutroDocto: TMenuItem;
    N26: TMenuItem;
    PopM_GeraOCImportaSolicitcoesLojas: TMenuItem;
    N27: TMenuItem;
    PopM_GeraOCComparaPedidos: TMenuItem;
    PopM_GeraOCAComprarSugANO: TMenuItem;
    PopM_GeraOCAComparSugMESES: TMenuItem;
    N30: TMenuItem;
    PopM_GeraOCValorUnitario: TMenuItem;
    PopM_GeraOCPercDesconto: TMenuItem;
    PopM_GeraOCPercelDescMIX: TMenuItem;
    N42: TMenuItem;
    PopM_GeraOCNecessidadedeCompra: TMenuItem;
    DiasEstocagemParametro: TMenuItem;
    DiasInformados: TMenuItem;
    N43: TMenuItem;
    ZeraQuantidadeAComprar: TMenuItem;
    N31: TMenuItem;
    PopM_GeraOCLegendaCores: TMenuItem;
    N33: TMenuItem;
    PopM_GeraOCVoltar2: TMenuItem;
    N37: TMenuItem;
    PopM_OCRomaneio: TPopupMenu;
    PopM_OCRomaneioVoltar: TMenuItem;
    N32: TMenuItem;
    PopM_OCRomaneioMarcarOCsAbertas: TMenuItem;
    N19: TMenuItem;
    PopM_OCRomaneioMarcarRomaneiosAbertos: TMenuItem;
    N20: TMenuItem;
    PopM_OCRomaneioMarcarRomaneiosFechados: TMenuItem;
    N21: TMenuItem;
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
  sgFornecedores: String;

implementation

uses DK_Procs1, UDMBelShop, UDMRelatorio, UDMVirtual, UPesquisa,
  UFrmBelShop, UFrmOCObservacao, DB;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
           ' CASE'+
           '    WHEN em.cod_linx <> 0 THEN'+
           '      em.cod_linx'+
           ' END cod_linx,'+
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

           ' FROM OC_COMPRAR oc, EMP_CONEXOES em, OC_COMPRAR_DOCS dc'+

           ' WHERE oc.cod_empresa = em.cod_filial'+
           ' AND   oc.num_documento = dc.num_docto'+
           ' AND   CAST(oc.dta_documento AS DATE) = dc.dta_docto'+
           ' AND   oc.cod_comprador = dc.cod_comprador'+
           ' AND   dc.origem='+QuotedStr('Linx')+
           ' AND   oc.num_documento='+sNrDoc+

           ' GROUP BY tipo, em.cod_linx, oc.des_empresa, oc.cod_empresa,'+
           '          oc.ind_oc_gerada, oc.cod_fornecedor, oc.des_fornecedor,'+
           '          oc.num_documento, oc.num_oc_gerada,'+
           '          CAST(oc.dta_oc_gerada AS DATE), oc.cod_comprovante_icms'+

           ' ORDER BY em.cod_linx, oc.des_fornecedor, oc.num_oc_gerada';
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
  sgFornecedores:='';
  If Not DMVirtual.CDS_V_Fornecedores.IsEmpty Then
  Begin
    DMVirtual.CDS_V_Fornecedores.First;
    While Not DMVirtual.CDS_V_Fornecedores.Eof do
    Begin
      If sgFornecedores='' Then
       sgFornecedores:=
                  QuotedStr(DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString)
      Else
       sgFornecedores:=sgFornecedores+', '+
                 QuotedStr(DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString);

      DMVirtual.CDS_V_Fornecedores.Next;
    End; // While Not DMVirtual.CDS_V_Fornecedores.Eof do
    DMVirtual.CDS_V_Fornecedores.First;

  End; // If Not DMVirtual.CDS_V_Fornecedores.IsEmpty Then
End; // Monta sgFornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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

     //FechaTudoModelo;
   End
  Else
   Begin
     msg('Para Fechar Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmOCLinx.FormCreate(Sender: TObject);
begin
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

  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;


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
  End;

  If (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCOrdensCompra) And (Ts_GeraOCOrdensCompra.CanFocus) Then
  Begin
    PC_GeraOCProduto.Visible:=False;
    PC_GeraOCFiliais.Visible:=False;
    Dbg_GeraOCTotalGeral.SetFocus;
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
         '                 oc.dta_documento, oc.cod_comprador, us.des_usuario'+
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
  DMBelShop.IBQ_AComprar.Open;

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

    // Vai para o Proximo Produto ---------------------------------------------
    Screen.Cursor:=crAppStart;

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

  If not (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCOrdensCompra) Then
   Exit;

  Dbg_GeraOCTotalGeral.SetFocus;

  // Cria Componente Memo ======================================================
  mMemo:=TMemo.Create(Self);
  mMemo.Visible:=False;
  mMemo.Parent:=FrmBelShop; 
  mMemo.Width:=500;
  mMemo.Lines.Clear;

  If DMBelShop.CDS_AComprarOCs.IsEmpty Then
   Exit;

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

  // Monta Busca OC para Gerar OC ==============================================
  MySql:=' Select *'+
         ' From OC_COMPRAR oc'+
         ' Where oc.qtd_acomprar>0'+
         ' And   oc.qtd_transf=0'+
         ' And   oc.ind_oc_gerada=''N'''+
         ' And   oc.num_documento=:NumDocto'+
         ' And   Cast(oc.dta_documento as Date)=:Dta'+
         ' And   oc.cod_empresa=:CodFilial'+
         ' And   oc.cod_fornecedor=:CodFornecedor'+
         ' Order By oc.cod_item';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;

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
             ' WHERE oc.cod_empresa='+QuotedStr(IntToStr(igCodLojaLinx))+
             ' AND   oc.num_oc_gerada<1000000'+
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

      // Busca OC ==========================================================
      DMBelShop.CDS_Busca.Close;
      DMBelShop.SDS_Busca.Params.ParamByName('NumDocto').Value     :=DMBelShop.CDS_AComprarOCsNUM_DOCUMENTO.AsString;
      DMBelShop.SDS_Busca.Params.ParamByName('Dta').AsDate         :=DtEdt_GeraOCDataDocto.Date;
      DMBelShop.SDS_Busca.Params.ParamByName('CodFilial').Value    :=DMBelShop.CDS_AComprarOCsCOD_EMP_FIL.AsString;
      DMBelShop.SDS_Busca.Params.ParamByName('CodFornecedor').Value:=DMBelShop.CDS_AComprarOCsCOD_FORNECEDOR.AsString;
      DMBelShop.CDS_Busca.Open;

      // Verifica se Transação esta Ativa
      If DMBelShop.SQLC.InTransaction Then
       DMBelShop.SQLC.Rollback(TD);

      // Monta Transacao ===========================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMBelShop.SQLC.StartTransaction(TD);
      Try // Try da Transação
        Screen.Cursor:=crAppStart;
        DateSeparator:='.';
        DecimalSeparator:='.';

        FrmBelShop.MontaProgressBar(True, FrmOCLinx);
        pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
        pgProgBar.Position:=0;
        DMBelShop.CDS_Busca.DisableControls;
        While Not DMBelShop.CDS_Busca.Eof do
        Begin
          Application.ProcessMessages;

          // Atualiza OC_COMPRAR ----------------------------------
          MySql:=' Update OC_COMPRAR oc'+
                 ' Set oc.IND_OC_GERADA=''S'''+
                 ', oc.DTA_OC_GERADA='+QuotedStr(f_Troca('/','.',sDtaGeracao))+
                 ', oc.NUM_OC_GERADA='+sNrOC+

                 ', oc.OBS_OC=oc.OBS_OC||ascii_char(13)||'+QuotedStr('OC Gerada em '+sDtaGeracao+
                                                           ' Pelo Usuário: '+Des_Usuario)+

                 ', oc.BLOB_TEXTO=oc.BLOB_TEXTO||ascii_char(13)||'+QuotedStr('Aberturta do Aplicativo: '+sgDataHoraAplicativo)+
                               '|| ascii_char(13) ||'+QuotedStr('OC Nº '+sNrOC+' Gerada em: '+
                               DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor))+' por '+Des_Usuario)+
                 ' Where oc.Num_Seq='+DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString+
                 ' And   oc.Num_Documento='+QuotedStr(IntToStr(EdtGeraOCBuscaDocto.AsInteger))+
                 ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date))));
          DMBelShop.SQLC.Execute(MySql,nil,nil);

          pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

          DMBelShop.CDS_Busca.Next;
        End; // While Not DMBelShop.CDS_Busca.Eof do
        DMBelShop.CDS_Busca.Close;
        DMBelShop.CDS_Busca.EnableControls;

        FrmBelShop.MontaProgressBar(False, FrmOCLinx);

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
          FrmBelShop.MontaProgressBar(False, FrmOCLinx);

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
     Dbg_GeraOCGrid.Canvas.Font.Style:=[]
    Else
     Dbg_GeraOCGrid.Canvas.Font.Style:=[fsBold];
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

end;

procedure TFrmOCLinx.Dbg_GeraOCGridKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
Var
  MySql, s: String;
begin
  If DMBelShop.CDS_AComprarItens.IsEmpty Then
   Exit;

  If key=Vk_Return Then
  Begin
    DMBelShop.IBQ_AComprar.Next;
    Dbg_GeraOCGrid.SetFocus;
    If Dbg_GeraOCGrid.SelectedIndex<>9 Then
    Begin
      Dbg_GeraOCGrid.SelectedIndex:=0;
      Dbg_GeraOCGrid.SelectedIndex:=3;
    End;
    bgEnterTab:=False;
    Exit;
  End;

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
  // Imprime OC ================================================================
  If Bt_GeraOCImpEditOC.Caption='Imprimir OC' Then
  Begin
    Screen.Cursor:=crAppStart;

    OdirPanApres.Caption:='AGUARDE !! Montando Relatório...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShop.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShop.Height-OdirPanApres.Height)/2));
    OdirPanApres.Visible:=True;
    Refresh;

    // Busca OC -----------------------------------------------------
    MySql:='SELECT oc.des_empresa, oc.num_oc_gerada,'+
           ' Case co.compl_endereco'+
           '   when '''' Then'+
           '      co.des_endereco ||'', ''|| co.num_endereco'+
           '   Else'+
           '      co.des_endereco ||'', ''|| co.num_endereco ||'' - ''|| co.compl_endereco'+
           ' End Endereco,'+
           ' co.des_bairro, co.des_cidade, co.cod_uf,'+

           ' (substring(co.cod_cep from 1 for 5) ||''-''|| substring(co.cod_cep from 6 for 3)) cod_cep,'+

           ' (substring(co.num_cnpj from 1 for 2) ||''.''||'+
           '  substring(co.num_cnpj from 3 for 3) ||''.''||'+
           '  substring(co.num_cnpj from 6 for 3) ||''/''||'+
           '  substring(co.num_cnpj from 9 for 4) ||''-''||'+
           '  substring(co.num_cnpj from 13 for 2)) num_cnpj,'+

           ' co.inscr_estadual,'+
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
           '    LEFT JOIN EMP_CONEXOES co ON oc.cod_empresa=co.cod_filial'+
           '    LEFT JOIN PS_USUARIOS  us ON oc.cod_comprador=us.cod_usuario'+

           ' WHERE oc.num_documento='+QuotedStr(IntToStr(EdtGeraOCBuscaDocto.AsInteger))+
           ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date))))+
           ' and   oc.cod_empresa='+QuotedStr(DMBelShop.CDS_AComprarOCsCOD_EMP_FIL.AsString)+
           ' and   oc.num_oc_gerada='+ QuotedStr(DMBelShop.CDS_AComprarOCsNUM_OC_GERADA.AsString)+

           ' order by oc.des_item';
    DMBelShop.IBQ_OrdemCompra.Close;
    DMBelShop.IBQ_OrdemCompra.SQL.Clear;
    DMBelShop.IBQ_OrdemCompra.SQL.Add(MySql);
    DMBelShop.IBQ_OrdemCompra.Open;

    // Dados da Filial ----------------------------------------------
    MySql:=' SELECT lo.fone_emp, null contato, lo.email_emp'+
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

end;

end.
