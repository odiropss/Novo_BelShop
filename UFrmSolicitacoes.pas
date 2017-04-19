{                ok
 Height = 470 - 432
 Width  = 649 - 633
===============================================
TABSHEET NÃO UTILIZADOS:
  - Ts_ParamIRRF
  - Ts_ParamINSS
  - Ts_ParamConsisNFeOC
===============================================
  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  AbreSolicitacoes(0);

  // Cria ClientDataSet Virtual - CDS_V_ProfSeleciona ========================
  If DMSalao.CDS_V_ProfSeleciona.Active Then
   DMSalao.CDS_V_ProfSeleciona.Close;

  DMSalao.CDS_V_ProfSeleciona.CreateDataSet;
  DMSalao.CDS_V_ProfSeleciona.Open;

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

  If bgProcessar Then
  Begin
    EdtGeraOCBuscaDoctoExit(Self);
  End; // If bgProcessar Then
  FreeAndNil(FrmSolicitacoes);
}
{
TabIndex:
   0 = Exporta OC Para Outra - Ts_SolicitacoesExporta
   1 = Habilita/Desabilita Linha nos Objetivos/Metas - Ts_FinanObjetivosHabilitaDesabilita
   2 = Importa Arquivo para ProSoft - Ts_ProSoftImpArquivo
   3 = Viculos de Códigos Loja - CANOAS - Ts_SalaoCodigosViculados
   4 = Legenda de Cores no Pedido OC - Ts_GeraOCLegendaCores
   5 = Calendario de Fechamento de Caixas - Ts_FinanFechaCaixaLanctos
   6 = Calculo de Margem de Lucro - Ts_MargemLucro
   7 = Mostra Formulas Utilizadas no Calclo de Margem de Lucro - Ts_MargemLucroFormulas
   8 = Habilidades e Serviços - Ts_HabServ
   9 = Localiza Endereço IBGE - Ts_IBGE
  10 = Manutenções Diversas - Ts_ManutDiversas
  11 = Parametros do Gerenciador - Ts_ParametrosGerenciador
  12 = Manutenção de Consistencias - Ts_Consistencias
  13 = Manutenção de Vales - Ts_Vales
  14 = Fornecedores a Importar de Solicitações de Lojas - Ts_SolicitFornLojas
  15 = Seleciona Profissional de Qualquer Loja - Ts_ProfSelecina
  16 = Movimento com Códigos TecBiz  NÃO Encontrados (Apresenta Grid) - Ts_ApresentaGrid
  17 = Planilha Financeira - Periodo de Apropriação - Ts_PlanilhaFinanceira
  18 = Apresenta Qualquer Coisa para Selecionar (USAR DMBelShop.CDS_Busca) - Ts_Selecionar
  19 = Usar com Qualquer Coisa - Ts_QualquerCoisa
  20 = Excel Importa Arquivo - Ts_ExcelImportar
  21 = Digitação de Reposições de Lojas
  22 = Transfere Permissões Usuários SIDICOM
  23 = Salão - Relatórios
}
unit UFrmSolicitacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, DB, DBClient, dxStatusBar,
  cxCurrencyEdit, DBCtrls, Mask, MaskEditJul, CurrEditJul, ExtCtrls,
  JvExMask, JvToolEdit, JvMaskEdit, JvExStdCtrls, JvEdit, JvValidateEdit,
  JvEditorCommon, JvEditor, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, StdCtrls, Grids, sPanel, DBGrids, DBGridJul, JvCheckBox,
  cxGroupBox, JvXPButtons, JvExControls, JvXPCore, JvXPCheckCtrls,
  ToolEdit, CurrEdit, DBXpress, Commctrl, ComCtrls, Math, StrUtils, DateUtils,
  Clipbrd, jpeg, cxSpinEdit, JvRadioButton, ADODB, Menus, IBQuery,
  JvOutlookBar, RelVisual, AppEvnts, MMSystem;
//  Último: MMSystem 

type
  TFrmSolicitacoes = class(TForm)
    PC_Principal: TPageControl;
    Ts_SolicitacoesExporta: TTabSheet;
    Ts_FinanObjetivosHabilitaDesabilita: TTabSheet;
    Ts_SalaoCodigosViculados: TTabSheet;
    Ts_GeraOCLegendaCores: TTabSheet;
    Ts_ProfSelecina: TTabSheet;
    Ts_FinanFechaCaixaLanctos: TTabSheet;
    CDS_: TClientDataSet;
    Ts_MargemLucro: TTabSheet;
    Ts_MargemLucroFormulas: TTabSheet;
    EditorMargemLucro: TJvEditor;
    Panel25: TPanel;
    Bt_FormulaVoltar: TJvXPButton;
    Ts_HabServ: TTabSheet;
    Ts_IBGE: TTabSheet;
    Ts_ManutDiversas: TTabSheet;
    Ts_ParametrosGerenciador: TTabSheet;
    Ts_Consistencias: TTabSheet;
    Ts_Vales: TTabSheet;
    Gb_ValesFiltroLoja: TGroupBox;
    EdtValesCodLoja: TCurrencyEdit;
    Bt_ValesBuscaLoja: TJvXPButton;
    EdtValesDesLoja: TEdit;
    Gb_ValesFiltroProf: TGroupBox;
    EdtValesCodProf: TCurrencyEdit;
    Bt_ValesBuscaProf: TJvXPButton;
    EdtValesDesProf: TEdit;
    Gb_ValesDocto: TGroupBox;
    Label28: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Panel35: TPanel;
    Bt_ValesVoltar: TJvXPButton;
    Bt_ValesSalvar: TJvXPButton;
    Gb_ValesParcelas: TGroupBox;
    Bt_ValesGeraParc: TJvXPButton;
    Gb_ValesParcelasAltera: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    DtEdt_ValesPagto: TcxDateEdit;
    Bt_ValesAlterar: TJvXPButton;
    Bt_ValesAbandonar: TJvXPButton;
    EdtValesVlrDesc: TcxCurrencyEdit;
    EdtValesVlrAcresc: TcxCurrencyEdit;
    EdtValesVlrPago: TcxCurrencyEdit;
    EdtValesDoctoPagto: TcxCurrencyEdit;
    EdtValesDocto: TcxCurrencyEdit;
    EdtValesTotalParc: TcxCurrencyEdit;
    EdtValesVlrDocto: TcxCurrencyEdit;
    DtEdt_ValesPrimVencto: TcxDateEdit;
    Dbg_ValesParcelas: TDBGridJul;
    Gb_ValesFiltroSitProf: TGroupBox;
    Ckb_ValesAtivos: TJvXPCheckbox;
    Ckb_ValesInativos: TJvXPCheckbox;
    Label41: TLabel;
    EdtValesPrazo: TcxCurrencyEdit;
    Label42: TLabel;
    Ts_SolicitFornLojas: TTabSheet;
    Dbg_SolicitFornLojas: TDBGridJul;
    Panel43: TPanel;
    Bt_SolicitFornLojasVoltar: TJvXPButton;
    Bt_SolicitFornLojasImportar: TJvXPButton;
    Panel12: TPanel;
    Bt_EdtProfSelecionaVoltar: TJvXPButton;
    Bt_EdtProfSelecionaSelecionar: TJvXPButton;
    Gb_MargemLucroApres: TGroupBox;
    Cbx_MargemLucroApres: TComboBox;
    Gb_MargemLucroPeriodoVendas: TGroupBox;
    Label74: TLabel;
    Label75: TLabel;
    DtEdt_MargemLucroDtaInicioVen: TcxDateEdit;
    DtEdt_MargemLucroDtaFimVen: TcxDateEdit;
    Gb_MargemLucroPeriodoEntradas: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    DtEdt_MargemLucroDtaInicioEnt: TcxDateEdit;
    DtEdt_MargemLucroDtaFimEnt: TcxDateEdit;
    Panel24: TPanel;
    Bt_MargemLucroVoltar: TJvXPButton;
    Bt_MargemLucroOK: TJvXPButton;
    Pan_MargemLucroPcCustoTE: TPanel;
    Lb_MargemLucroPcCustoTE: TLabel;
    Ckb_MargemLucroPcCustoTE: TJvXPCheckbox;
    Sb_SelectEmpProc2: TdxStatusBar;
    Pan_SolicitFornLojasMostraLoja: TPanel;
    Ckb_SolicitFornLojasMostraLoja: TJvCheckBox;
    Bt_SolicitFornLojasLixeira: TJvXPButton;
    Gb_SolicExpLoja: TGroupBox;
    EdtSolicExpLoja: TEdit;
    Label1: TLabel;
    EdtSolicExpDoctoOrigem: TCurrencyEdit;
    Label2: TLabel;
    EdtSolicExpDoctoDestino: TCurrencyEdit;
    Label3: TLabel;
    Ckb_SolicExpSoProduto: TJvXPCheckbox;
    Label4: TLabel;
    Ckb_SolicExpExcProduto: TJvXPCheckbox;
    Gb_SolicExpTpExportacao: TGroupBox;
    EdtSolicExpTpExportacao: TEdit;
    Gb_SolicExpObs: TGroupBox;
    Panel13: TPanel;
    Mem_SolicExpObs: TMemo;
    Panel6: TPanel;
    Bt_SolicExpVoltar: TJvXPButton;
    Bt_SoliciExpExportar: TJvXPButton;
    Gb_FinanObjetivosHabilitaDesabilita: TcxGroupBox;
    Bv_FinanObjetivosHabilitaDesabilita: TBevel;
    Label10: TLabel;
    Lb_FinanObjetivosHabDesPercentuais: TLabel;
    Lb_FinanObjetivosHabDesResultados: TLabel;
    Lb_FinanObjetivosHabDesRealizados: TLabel;
    Lb_FinanObjetivosHabDesDiarios: TLabel;
    Lb_FinanObjetivosHabDesObjetivos: TLabel;
    Ckb_FinanObjetivosHabDesPercentuais: TJvCheckBox;
    Ckb_FinanObjetivosHabDesResultados: TJvCheckBox;
    Ckb_FinanObjetivosHabDesObjetivos: TJvCheckBox;
    Ckb_FinanObjetivosHabDesDiarios: TJvCheckBox;
    Ckb_FinanObjetivosHabDesRealizados: TJvCheckBox;
    Panel2: TPanel;
    Bt_FinanObjetivosHabDeVoltar: TJvXPButton;
    Bt_FinanObjetivosHabDeOK: TJvXPButton;
    Panel8: TPanel;
    Bt_QtdCaixaCDVoltar: TJvXPButton;
    Pan_Cor1: TPanel;
    Pan_Cor2: TPanel;
    Pan_Cor3: TPanel;
    Pan_Cor4: TPanel;
    Pan_Cor5: TPanel;
    Pan_Cor6: TPanel;
    Pan_Cor7: TPanel;
    Panel10: TPanel;
    Bt_GeraOCLegendaCoresVoltar: TJvXPButton;
    Gb_FinanFechaCaixaLegenda: TcxGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sPanel4: TsPanel;
    sPanel5: TsPanel;
    Pan_FinanFechaCaixaCalandario: TPanel;
    Pan_FinanFechaCaixa: TPanel;
    Bt_FinanFechaCaixaAnterior: TJvXPButton;
    Bt_FinanFechaCaixaProximo: TJvXPButton;
    Stg_FinanFechaCaixaCalendario: TStringGrid;
    Panel22: TPanel;
    Bt_FinanFechaCaixaVoltar: TJvXPButton;
    mem_FinanFechaCaixa: TMemo;
    Gb_HabServDesc: TGroupBox;
    EdtHabServDesc: TEdit;
    Gb_HabServCodigo: TGroupBox;
    EdtHabServCodigo: TCurrencyEdit;
    Gb_HabServPreco: TGroupBox;
    EdtHabServPreco: TCurrencyEdit;
    Gb_HabServCodSidicom: TGroupBox;
    EdtHabServCodSidicom: TEdit;
    Bt_HabServLocalizaSidicom: TJvXPButton;
    Gb_HabServAtivo: TGroupBox;
    Ckb_HabServAtivo: TJvXPCheckbox;
    Gb_HabServAtivoAltera: TGroupBox;
    Lb_HabServAtivoAltera: TLabel;
    Ckb_HabServAtivoAltera: TJvXPCheckbox;
    Panel27: TPanel;
    Bt_HabServVoltar: TJvXPButton;
    Bt_HabServSalvar: TJvXPButton;
    Gb_Desc1: TGroupBox;
    EdtDesc1: TJvValidateEdit;
    Gb_Desc2: TGroupBox;
    EdtDesc2: TEdit;
    Gb_Desc3: TGroupBox;
    EdtDesc3: TEdit;
    Gb_Desc4: TGroupBox;
    EdtDesc4: TEdit;
    Gb_Desc5: TGroupBox;
    EdtDesc5: TEdit;
    Gb_Desc6: TGroupBox;
    EdtDesc6: TEdit;
    Gb_Desc7: TGroupBox;
    MeDesc7: TJvMaskEdit;
    Gb_Desc8: TGroupBox;
    CkbDesc8: TJvCheckBox;
    Gb_Desc9: TGroupBox;
    EdtDesc9: TCurrencyEdit;
    Gb_Desc10: TGroupBox;
    EdtDesc10: TCurrencyEdit;
    Panel30: TPanel;
    Label17: TLabel;
    Bt_ManutDiversosVoltar: TJvXPButton;
    Bt_ManutDiversosDML: TJvXPButton;
    PC_Parametros: TPageControl;
    Ts_ParamComissaoProf: TTabSheet;
    Shape1: TShape;
    Gb_ParamPeriodoCalCom: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Cbx_ParamComProfDiaFim: TComboBox;
    Cbx_ParamComProfDiaIni: TComboBox;
    Ts_ParamConsisNFeOC: TTabSheet;
    Shape2: TShape;
    Gb_ParamConsisNFeOC: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label30: TLabel;
    Ckb_ParamConsNfeOCSolic: TJvCheckBox;
    Dbe_ParamConsNfeOCHora: TDBEdit;
    Ts_ParamConcBancaria: TTabSheet;
    Shape3: TShape;
    Gb_ParamConcBancaria: TGroupBox;
    Label18: TLabel;
    Dbe_ParamConcBancoDiaNao: TDBEdit;
    Ts_ParamSalarioMinimo: TTabSheet;
    Shape4: TShape;
    Gb_ParamSalMinimo: TGroupBox;
    Label23: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    DtEdtParamVigFimSalMinino: TcxDateEdit;
    DtEdtParamVigIniSalMinino: TcxDateEdit;
    Panel42: TPanel;
    Bt_ParamSalMinNovo: TJvXPButton;
    Bt_ParamSalMinAlterar: TJvXPButton;
    Bt_ParamSalMinExcluir: TJvXPButton;
    Dbg_ParamSalMinino: TDBGridJul;
    EdtParamVlrSalMinimo: TCurrEditJul;
    Ts_ParamINSS: TTabSheet;
    Shape5: TShape;
    Ts_ParamIRRF: TTabSheet;
    Shape6: TShape;
    Ts_ParamTaxaSindicato: TTabSheet;
    Shape7: TShape;
    Gb_ParamTaxaSindDtaCobranca: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    DBCBx_ParamTaxaSindMes: TDBComboBox;
    DBCBx_ParamTaxaSindPosicao: TDBComboBox;
    DBCBx_ParamTaxaSindDia: TDBComboBox;
    Dbe_ParamTaxaSindVlrTaxa: TDBEdit;
    Ckb_ParamTaxaSindVlrTaxa: TJvXPCheckbox;
    Pan_ParamSis: TPanel;
    Bt_ParamSisVoltar: TJvXPButton;
    Bt_ParamSisSalvar: TJvXPButton;
    Dbg_Consistencias: TDBGridJul;
    Panel34: TPanel;
    Bt_ConsistenciasVoltar: TJvXPButton;
    Bt_ConsistenciasSalvar: TJvXPButton;
    Gb_EdtProfSeleciona: TGroupBox;
    EdtProfSelecionaNome: TEdit;
    Bt_EdtProfSelecionaLocaliza: TJvXPButton;
    Dbg_ProfSeleciona: TDBGridJul;
    Gb_ProfSelecionaSituacao: TGroupBox;
    Cbx_ProfSelecionaSituacao: TComboBox;
    Gb_HabServAbrev: TGroupBox;
    EdtHabServAbrev: TEdit;
    Ts_ApresentaGrid: TTabSheet;
    Pan_ApresGrid: TPanel;
    Dbg_ApresGrid: TDBGridJul;
    Panel3: TPanel;
    Bt_ApresGridVoltar: TJvXPButton;
    Bt_ApresGridSalvaExcel: TJvXPButton;
    Bt_ApresGridClipboard: TJvXPButton;
    Ts_PlanilhaFinanceira: TTabSheet;
    PC_FinanPlanFinanceiraSolicita: TPageControl;
    Ts_FinanPlanFinanceiraSolicitaDatas: TTabSheet;
    Panel52: TPanel;
    Panel56: TPanel;
    Bt_FinanPlanFinanceiraPeriodoVoltar: TJvXPButton;
    Bt_FinanPlanFinanceiraPeriodoOK: TJvXPButton;
    Gb_FinanPlanFinanceiraUsar: TGroupBox;
    Rb_FinanPlanFinanceiraUsarMesAno: TJvRadioButton;
    Rb_FinanPlanFinanceiraUsarDtaDocto: TJvRadioButton;
    Rb_FinanPlanFinanceiraUsarDtaComprov: TJvRadioButton;
    PC_FinanPlanFinanceiraPeriodo: TPageControl;
    Ts_FinanPlanFinanceiraPeriodoMesAno: TTabSheet;
    Pan_FinanPlanFinanceiraPeriodo: TPanel;
    Label66: TLabel;
    Label468: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label183: TLabel;
    Label185: TLabel;
    Cbx_FinanPlanFinanceiraMes1: TComboBox;
    Cbx_FinanPlanFinanceiraMes2: TComboBox;
    EdtFinanPlanFinanceiraAno1: TcxSpinEdit;
    EdtFinanPlanFinanceiraAno2: TcxSpinEdit;
    Ts_FinanPlanFinanceiraPeriodoData: TTabSheet;
    Label31: TLabel;
    Label43: TLabel;
    DtEdt_FinanPlanFinanceiraPeriodoDtaInicio: TcxDateEdit;
    DtEdt_FinanPlanFinanceiraPeriodoDtaFim: TcxDateEdit;
    Ts_FinanPlanFinanceiraSolicitaTamColunas: TTabSheet;
    Pan_FinanPlanFinanceiraTamColunas: TPanel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label73: TLabel;
    EdtFinanPlanFinanceiraTamColunas3: TCurrencyEdit;
    EdtFinanPlanFinanceiraTamColunas2: TCurrencyEdit;
    EdtFinanPlanFinanceiraTamColunas1: TCurrencyEdit;
    EdtFinanPlanFinanceiraTamColunasNaoFixadas: TCurrencyEdit;
    Panel55: TPanel;
    Bt_FinanPlanFinanceiraTamColunasVoltar: TJvXPButton;
    Bt_FinanPlanFinanceiraTamColunasOK: TJvXPButton;
    Ts_ProSoftImpArquivo: TTabSheet;
    Gb_ProSoftImpArquivo: TGroupBox;
    Bt_ProSoftImpArquivo: TJvXPButton;
    EdtProSoftImpPastaArquivo: TEdit;
    Pan_ProSoftImpArquivo: TPanel;
    Bt_ProSoftImpVoltar: TJvXPButton;
    Bt_ProSoftImpArqImporta: TJvXPButton;
    Gb_ProSoftImpArquivoSalvar: TGroupBox;
    Bt_ProSoftImpArquivoSalvar: TJvXPButton;
    EdtProSoftImpArquivoSalvar: TEdit;
    EditorProSoftImpArquivo: TJvEditor;
    Label5: TLabel;
    DtEdt_ProSoftImpDtaLimite: TcxDateEdit;
    sPanel7: TsPanel;
    Label6: TLabel;
    sPanel6: TsPanel;
    Label14: TLabel;
    Ts_Selecionar: TTabSheet;
    Dbg_Selecionar: TDBGridJul;
    Panel4: TPanel;
    Bt_SelecionarValtar: TJvXPButton;
    Bt_SelecionarOK: TJvXPButton;
    Dbg_IBGE1: TDBGridJul;
    Dbg_IBGE2: TDBGridJul;
    Panel28: TPanel;
    Bt_IBGEVoltar: TJvXPButton;
    Bt_IBGESelecionar: TJvXPButton;
    Bt_SelectEmpProcMarcaTodos: TJvXPButton;
    Bt_SelectEmpProcDesMarcaTodos: TJvXPButton;
    Ts_ParamCurvaABC: TTabSheet;
    Ts_QualquerCoisa: TTabSheet;
    Pan_QualquerCoisa: TPanel;
    Bt_QualquerCoisaVoltar: TJvXPButton;
    Bt_QualquerCoisaSalvar: TJvXPButton;
    Ts_ExcelImportar: TTabSheet;
    Gb_ExcelImporta: TGroupBox;
    Bt_ExcelBusca: TJvXPButton;
    EdtExcelArquivo: TEdit;
    Label54: TLabel;
    EdtExcelPlanilha: TEdit;
    Bt_ExcelBuscaPlanilha: TJvXPButton;
    Label55: TLabel;
    Label56: TLabel;
    Lb_Processar: TLabel;
    Lb_Processados: TLabel;
    Dbg_ExcelImportar: TDBGrid;
    Bt_ExcelImportaPlanilha: TJvXPButton;
    Panel1: TPanel;
    Bt_ExcelVoltar: TJvXPButton;
    Bt_ExcelSalvar: TJvXPButton;
    ADOC_Excel: TADOConnection;
    ADOT_Dcto: TADOTable;
    Ts_ParamLojaReposicoes: TTabSheet;
    Pan_ParamLojaNeces: TPanel;
    Cbx_ParamLojaNeces: TComboBox;
    Label52: TLabel;
    EdtParamLojaNecesCodLoja: TCurrencyEdit;
    Bt_ParamLojaNecesBuscaLoja: TJvXPButton;
    EdtParamLojaNecesDesLoja: TEdit;
    Label57: TLabel;
    Ckb_ParamLojaNecesA: TCheckBox;
    Ckb_ParamLojaNecesB: TCheckBox;
    Ckb_ParamLojaNecesD: TCheckBox;
    Ckb_ParamLojaNecesC: TCheckBox;
    Ckb_ParamLojaNecesE: TCheckBox;
    Label58: TLabel;
    Gb_ParamLojaNeces: TGroupBox;
    Bt_ParamLojaNecesIncluir: TJvXPButton;
    Dbg_ParamLojaNeces: TDBGridJul;
    Shape8: TShape;
    Shape9: TShape;
    Bt_ParamLojaNecesExcluir: TJvXPButton;
    Ts_ReposLojasDigita: TTabSheet;
    Gb_ReposLojasProduto: TGroupBox;
    EdtReposLojasProduto: TEdit;
    Panel5: TPanel;
    Bt_ReposLojasVoltar: TJvXPButton;
    Panel7: TPanel;
    Gb_ReposLojasSeq: TGroupBox;
    EdtReposLojasSeq: TJvValidateEdit;
    Gb_ReposLojasQtdReposicao: TGroupBox;
    EdtReposLojasQtdReposicao: TCurrencyEdit;
    Bt_ReposLojasAlterar: TJvXPButton;
    Ts_Odir: TTabSheet;
    Panel9: TPanel;
    GroupBox1: TGroupBox;
    Label62: TLabel;
    EdtUsuarioModelo: TEdit;
    Label59: TLabel;
    EdtLojaModelo: TEdit;
    GroupBox2: TGroupBox;
    Label63: TLabel;
    Bt_Voltar: TJvXPButton;
    Lbx_Usuarios: TListBox;
    Bt_Atualiza: TJvXPButton;
    Bt_LimpaLista: TJvXPButton;
    Sb_GeraOC: TdxStatusBar;
    Ts_SalaoRelatorios: TTabSheet;
    Pan_SalaoRelatorios: TPanel;
    Bt_SalaoRelVoltar: TJvXPButton;
    Bt_SalaoRelImprime: TJvXPButton;
    Panel21: TPanel;
    Gb_SalaoRelLoja: TGroupBox;
    EdtSalaoRelCodLoja: TCurrencyEdit;
    Bt_SalaoRelBuscaLoja: TJvXPButton;
    EdtSalaoRelDesLoja: TEdit;
    Gb_SalaoRelSituacao: TGroupBox;
    Cbx_SalaoRelSituacao: TComboBox;
    Pan_ProfOutLookRH: TPanel;
    OutLook_SalaoRelatorios: TJvOutlookBar;
    OdirPanApres: TPanel;
    Ts_ParamLojaReposFornec: TTabSheet;
    Shape10: TShape;
    Label60: TLabel;
    Shape11: TShape;
    Bt_ParamSisReposFornec: TJvXPButton;
    EdtParamLojaReposCodForn: TCurrencyEdit;
    Bt_ParamLojaReposBuscaForn: TJvXPButton;
    Dbg_ParamLojaReposFornec: TDBGridJul;
    Label61: TLabel;
    dxStatusBar1: TdxStatusBar;
    Lab_Conta: TLabel;
    Panel11: TPanel;
    Gb_ParamCurvaDiaUteis: TGroupBox;
    Label85: TLabel;
    Label48: TLabel;
    Label50: TLabel;
    Label67: TLabel;
    DtEdt_EdtParamCurvaInicio: TcxDateEdit;
    DtEdt_EdtParamCurvaFim: TcxDateEdit;
    Bt_ParamCurvaDiasUteis: TJvXPButton;
    EdtParamCurvaDiasTotal: TCurrencyEdit;
    EdtParamCurvaDiasUteis: TCurrencyEdit;
    Ckb_ParamCurvaSabado: TJvCheckBox;
    Ckb_ParamCurvaDomingo: TJvCheckBox;
    Gb_ParamCurvaABCDados: TGroupBox;
    Lab_ParamCurvaA: TLabel;
    Label81: TLabel;
    Label64: TLabel;
    Label46: TLabel;
    Label45: TLabel;
    Label44: TLabel;
    Lab_ParamCurvaB: TLabel;
    Lab_ParamCurvaC: TLabel;
    Label83: TLabel;
    Label51: TLabel;
    Lab_ParamCurvaE: TLabel;
    Lab_ParamCurvaD: TLabel;
    Ckb_ParamCurvaSelectA: TJvCheckBox;
    EdtParamCurvaALimite: TCurrencyEdit;
    EdtParamCurvaADiasEst: TCurrencyEdit;
    EdtParamCurvaAEstMinino: TCurrencyEdit;
    EdtParamCurvaBEstMinino: TCurrencyEdit;
    EdtParamCurvaBDiasEst: TCurrencyEdit;
    EdtParamCurvaBLimite: TCurrencyEdit;
    Ckb_ParamCurvaSelectB: TJvCheckBox;
    Ckb_ParamCurvaSelectC: TJvCheckBox;
    EdtParamCurvaCLimite: TCurrencyEdit;
    EdtParamCurvaCDiasEst: TCurrencyEdit;
    EdtParamCurvaCEstMinino: TCurrencyEdit;
    EdtParamCurvaDEstMinino: TCurrencyEdit;
    EdtParamCurvaEEstMinino: TCurrencyEdit;
    EdtParamCurvaDDiasEst: TCurrencyEdit;
    EdtParamCurvaEDiasEst: TCurrencyEdit;
    EdtParamCurvaDLimite: TCurrencyEdit;
    EdtParamCurvaELimite: TCurrencyEdit;
    Ckb_ParamCurvaSelectD: TJvCheckBox;
    Ckb_ParamCurvaSelectE: TJvCheckBox;
    Label47: TLabel;
    Label49: TLabel;
    Label53: TLabel;
    ApplicationEvents1: TApplicationEvents;
    PainelApresExp: TPanel;
    Label82: TLabel;
    Label187: TLabel;
    Label189: TLabel;
    Bt_ReposLojasPreco: TJvXPButton;
    Label65: TLabel;
    EdtParamCurvaACorte: TCurrencyEdit;
    Label76: TLabel;
    Label77: TLabel;
    EdtParamCurvaBCorte: TCurrencyEdit;
    EdtParamCurvaCCorte: TCurrencyEdit;
    Label78: TLabel;
    EdtParamCurvaDCorte: TCurrencyEdit;
    Label79: TLabel;
    Label80: TLabel;
    EdtParamCurvaECorte: TCurrencyEdit;
    Dbg_CodigosViculados: TDBGrid;
    JvXPButton1: TJvXPButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PC_PrincipalChange(Sender: TObject);
    procedure Bt_SolicExpVoltarClick(Sender: TObject);
    procedure Ckb_SolicExpSoProdutoClick(Sender: TObject);
    procedure Bt_SoliciExpExportarClick(Sender: TObject);
    procedure Ckb_SolicExpSoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    //==========================================================================
    // Odir ====================================================================
    //==========================================================================

    // CRIA GRIDNEW em Ts_QualquerCoisa ////////////////////////////////////////
    Procedure GridNewCriar(Dts: TDataSource; sNomeObjeto: String; bSalvar: Boolean = True);
    ////////////////////////////////////////////////////////////////////////////

    // EVENTOS EM TEMPO DE EXCUÇÂO /////////////////////////////////////////////
    // OCComparaPedidos
    procedure OCComparaPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    ////////////////////////////////////////////////////////////////////////////

    // ORDEM DE COMPRA /////////////////////////////////////////////////////////
    Function  OcExportaDocumento: Boolean;
    ////////////////////////////////////////////////////////////////////////////

    // MOVIMENTO DE CAIXA DIA //////////////////////////////////////////////////
    procedure MovtoCaixaDiaDesenharCalendario;
    Procedure MovtoCaixaDiaSituacao(dDt: TDateTime);
    Procedure MovtoCaixaDiaMemo;
    ////////////////////////////////////////////////////////////////////////////

    // MANUTENÇÕES DIVERSAS ////////////////////////////////////////////////////
    Function ConsisteComponentesManutDiversas: Boolean;
    ////////////////////////////////////////////////////////////////////////////

    // MANUTENÇÕES VALES ///////////////////////////////////////////////////////
    Procedure ValesAcertaComponentes(iTipo:Integer; tCor:TColor; bReadOnly, bEnabled, bVisible:Boolean);
                             // iTipo=
                             //       1 = TFrmSalao.Bt_ValesAlterarClick
                             //       2 = TFrmSolicitacoes.Bt_ValesAbandonarClick
                             //       3 = TFrmSolicitacoes.Bt_ValesAlterarClick
                             //       4 = TFrmSolicitacoes.Dbg_ValesParcelasDblClick

    Function ConsisteVales(sTipo: String): Boolean;
                        // sTipo = (A)ltera Parcela
                        //       = (G)era Parcelas
    ////////////////////////////////////////////////////////////////////////////

    // DIVERSOS ////////////////////////////////////////////////////////////////
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente
    ////////////////////////////////////////////////////////////////////////////

    // PARAMETROS do SISTEMA ///////////////////////////////////////////////////
    Function ConsisteParametrosSIS(sTipo: String): Boolean;
                                // sTipo = (SM) Salario Mínimo
                                // sTipo = (INSS) Tabela INSS
                                // sTipo = (IRRF) Tabela IRRF

    ////////////////////////////////////////////////////////////////////////////

    // ATUALIZA PERMISSOES USUARIOS ////////////////////////////////////////////
    Procedure AtualizaPermissoesUsuarios;

    Function ExcutaQueryUsuario(MySql: String): Boolean;

    // BUSCA ESTOQUES DAS LOJAS ////////////////////////////////////////////////
    Procedure BuscaEstoquesLojas;
    ////////////////////////////////////////////////////////////////////////////

    // SALÃO - RELATÓRIOS //////////////////////////////////////////////////////
    Procedure SalaoRelatorios;
    ////////////////////////////////////////////////////////////////////////////

    //==========================================================================
    // Odir ====================================================================
    //==========================================================================

    procedure EdtSolicExpDoctoDestinoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ckb_SolicExpExcProdutoClick(Sender: TObject);
    procedure Ckb_SolicExpExcProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_FinanObjetivosHabDeVoltarClick(Sender: TObject);
    procedure Ckb_FinanObjetivosHabDesObjetivosClick(Sender: TObject);
    procedure Ckb_FinanObjetivosHabDesDiariosClick(Sender: TObject);
    procedure Ckb_FinanObjetivosHabDesRealizadosClick(Sender: TObject);
    procedure Ckb_FinanObjetivosHabDesResultadosClick(Sender: TObject);
    procedure Ckb_FinanObjetivosHabDesPercentuaisClick(Sender: TObject);
    procedure Ckb_FinanObjetivosHabDesPercentuaisKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Ckb_FinanObjetivosHabDesResultadosKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Ckb_FinanObjetivosHabDesRealizadosKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Ckb_FinanObjetivosHabDesDiariosKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Ckb_FinanObjetivosHabDesObjetivosKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Bt_FinanObjetivosHabDeOKClick(Sender: TObject);
    procedure Bt_QtdCaixaCDVoltarClick(Sender: TObject);
    procedure Bt_AtualizaSIDICOMCurvaABCEnderecoOKClick(Sender: TObject);
    procedure Bt_GeraOCLegendaCoresVoltarClick(Sender: TObject);
    procedure Bt_FinanFechaCaixaVoltarClick(Sender: TObject);
    procedure mem_FinanFechaCaixaChange(Sender: TObject);
    procedure Bt_FinanFechaCaixaAnteriorClick(Sender: TObject);
    procedure Bt_FinanFechaCaixaProximoClick(Sender: TObject);
    procedure Stg_FinanFechaCaixaCalendarioDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure Ts_FinanFechaCaixaLanctosShow(Sender: TObject);
    procedure Bt_MargemLucroOKClick(Sender: TObject);
    procedure Bt_MargemLucroVoltarClick(Sender: TObject);
    procedure Cbx_MargemLucroApresChange(Sender: TObject);
    procedure Ts_MargemLucroShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Bt_FormulaVoltarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtEdt_MargemLucroDtaFimVenPropertiesEditValueChanged(Sender: TObject);
    procedure Bt_HabServVoltarClick(Sender: TObject);
    procedure Bt_HabServSalvarClick(Sender: TObject);
    procedure Ckb_HabServAtivoClick(Sender: TObject);
    procedure Ckb_HabServAtivoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_HabServLocalizaSidicomClick(Sender: TObject);
    procedure EdtHabServCodSidicomExit(Sender: TObject);
    procedure EdtHabServCodSidicomEnter(Sender: TObject);
    procedure Bt_IBGEVoltarClick(Sender: TObject);
    procedure Bt_IBGESelecionarClick(Sender: TObject);
    procedure Dbg_IBGE1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ManutDiversosVoltarClick(Sender: TObject);
    procedure Bt_ManutDiversosDMLClick(Sender: TObject);
    procedure CkbDesc8Click(Sender: TObject);
    procedure CkbDesc8KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ts_HabServEnter(Sender: TObject);
    procedure Ckb_HabServAtivoAlteraClick(Sender: TObject);
    procedure Ckb_HabServAtivoAlteraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ParamSisVoltarClick(Sender: TObject);
    procedure Ckb_ParamConsNfeOCSolicClick(Sender: TObject);
    procedure Ckb_ParamConsNfeOCSolicKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ParamSisSalvarClick(Sender: TObject);
    procedure Bt_ConsistenciasSalvarClick(Sender: TObject);
    procedure Bt_ConsistenciasVoltarClick(Sender: TObject);
    procedure Dbg_ConsistenciasDblClick(Sender: TObject);
    procedure Dbg_ConsistenciasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_ValesVoltarClick(Sender: TObject);
    procedure Bt_ValesSalvarClick(Sender: TObject);
    procedure Dbg_ValesParcelasDblClick(Sender: TObject);
    procedure EdtValesCodLojaExit(Sender: TObject);
    procedure Bt_ValesBuscaLojaClick(Sender: TObject);
    procedure EdtValesCodProfExit(Sender: TObject);
    procedure Bt_ValesBuscaProfClick(Sender: TObject);
    procedure Bt_ValesGeraParcClick(Sender: TObject);
    procedure Bt_ValesAlterarClick(Sender: TObject);
    procedure Bt_ValesAbandonarClick(Sender: TObject);
    procedure EdtValesDoctoPagtoExit(Sender: TObject);
    procedure EdtValesCodLojaEnter(Sender: TObject);
    procedure PC_ParametrosChange(Sender: TObject);
    procedure Bt_ParamSalMinNovoClick(Sender: TObject);
    procedure Bt_ParamSalMinAlterarClick(Sender: TObject);
    procedure Dbg_ParamSalMininoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_ParamSalMinExcluirClick(Sender: TObject);
    procedure DtEdtParamVigFimSalMininoExit(Sender: TObject);
    procedure Bt_SolicitFornLojasVoltarClick(Sender: TObject);
    procedure Bt_SolicitFornLojasImportarClick(Sender: TObject);
    procedure Dbg_SolicitFornLojasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_SolicitFornLojasDblClick(Sender: TObject);
    procedure Ckb_SolicitFornLojasMostraLojaClick(Sender: TObject);
    procedure Ckb_ValesAtivosClick(Sender: TObject);
    procedure Ckb_ValesInativosClick(Sender: TObject);
    procedure Ckb_ValesAtivosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_ValesInativosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_SolicitFornLojasMostraLojaKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Dbg_SolicitFornLojasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_ParamTaxaSindVlrTaxaClick(Sender: TObject);
    procedure Ckb_ParamTaxaSindVlrTaxaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_MargemLucroPcCustoTEClick(Sender: TObject);
    procedure Ckb_MargemLucroPcCustoTEKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_SolicitFornLojasLixeiraClick(Sender: TObject);
    procedure Bt_EdtProfSelecionaVoltarClick(Sender: TObject);
    procedure Bt_EdtProfSelecionaLocalizaClick(Sender: TObject);
    procedure Dbg_ProfSelecionaDblClick(Sender: TObject);
    procedure Dbg_ProfSelecionaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_EdtProfSelecionaSelecionarClick(Sender: TObject);
    procedure Bt_ApresGridSalvaExcelClick(Sender: TObject);
    procedure Bt_ApresGridClipboardClick(Sender: TObject);
    procedure PC_FinanPlanFinanceiraSolicitaChange(Sender: TObject);
    procedure Rb_FinanPlanFinanceiraUsarDtaDoctoClick(Sender: TObject);
    procedure Rb_FinanPlanFinanceiraUsarDtaComprovClick(Sender: TObject);
    procedure Rb_FinanPlanFinanceiraUsarMesAnoClick(Sender: TObject);
    procedure Cbx_FinanPlanFinanceiraMes1Exit(Sender: TObject);
    procedure Cbx_FinanPlanFinanceiraMes2Exit(Sender: TObject);
    procedure Bt_FinanPlanFinanceiraPeriodoOKClick(Sender: TObject);
    procedure Bt_FinanPlanFinanceiraPeriodoVoltarClick(Sender: TObject);
    procedure Bt_ProSoftImpArquivoClick(Sender: TObject);
    procedure Bt_ProSoftImpArquivoSalvarClick(Sender: TObject);
    procedure Bt_ProSoftImpArqImportaClick(Sender: TObject);
    procedure PC_FinanPlanFinanceiraPeriodoChange(Sender: TObject);
    procedure Bt_FinanPlanFinanceiraTamColunasOKClick(Sender: TObject);
    procedure EdtProSoftImpPastaArquivoChange(Sender: TObject);
    procedure Bt_SelecionarOKClick(Sender: TObject);
    procedure Bt_SelecionarValtarClick(Sender: TObject);
    procedure Dbg_SelecionarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_SelectEmpProcMarcaTodosClick(Sender: TObject);
    procedure Bt_SelectEmpProcDesMarcaTodosClick(Sender: TObject);
    procedure Dbg_SelecionarDblClick(Sender: TObject);
    procedure Bt_ParamCurvaDiasUteisClick(Sender: TObject);
    procedure DtEdt_EdtParamCurvaInicioPropertiesChange(Sender: TObject);
    procedure Ckb_ParamCurvaSabadoClick(Sender: TObject);
    procedure Bt_QualquerCoisaSalvarClick(Sender: TObject);
    procedure Bt_QualquerCoisaVoltarClick(Sender: TObject);
    procedure Bt_ExcelBuscaClick(Sender: TObject);
    procedure Bt_ExcelBuscaPlanilhaClick(Sender: TObject);
    procedure EdtParamLojaNecesCodLojaChange(Sender: TObject);
    procedure Bt_ParamLojaNecesIncluirClick(Sender: TObject);
    procedure EdtParamLojaNecesCodLojaExit(Sender: TObject);
    procedure Bt_ParamLojaNecesBuscaLojaClick(Sender: TObject);
    procedure Cbx_ParamLojaNecesChange(Sender: TObject);
    procedure Dbg_ParamLojaNecesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Ckb_ParamLojaNecesAClick(Sender: TObject);
    procedure Ckb_ParamLojaNecesAKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ParamLojaNecesExcluirClick(Sender: TObject);
    procedure EditorProSoftImpArquivoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Bt_ReposLojasVoltarClick(Sender: TObject);
    procedure EdtReposLojasSeqExit(Sender: TObject);
    procedure Bt_ReposLojasAlterarClick(Sender: TObject);
    procedure Bt_LimpaListaClick(Sender: TObject);
    procedure Lbx_UsuariosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_AtualizaClick(Sender: TObject);
    procedure EdtLojaModeloKeyPress(Sender: TObject; var Key: Char);
    procedure OutLook_SalaoRelatoriosButtonClick(Sender: TObject;
      Index: Integer);
    procedure EdtSalaoRelCodLojaExit(Sender: TObject);
    procedure Bt_SalaoRelBuscaLojaClick(Sender: TObject);
    procedure Bt_ParamSisReposFornecClick(Sender: TObject);
    procedure Dbg_ParamLojaReposFornecKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtParamLojaReposCodFornExit(Sender: TObject);
    procedure Bt_ParamLojaReposBuscaFornClick(Sender: TObject);
    procedure Dbg_ParamLojaNecesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_ApresGridEnter(Sender: TObject);
    procedure Cbx_ParamLojaNecesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Cbx_ParamLojaNecesClick(Sender: TObject);
    procedure Bt_ReposLojasPrecoClick(Sender: TObject);
    procedure JvXPButton1Click(Sender: TObject);
  private
    { Private declarations }

    // Não Permite Sair com Ctrl+F4
    procedure AppMessage(var Msg: TMSG; var HAndled: Boolean);

  public
    { Public declarations }

    bgFechaRepos, // Se Deve Fechar Digitação de Alteração de Qtd de reposição Depois de Salvar...
    bgOK: Boolean;

    sgCodLoja, sgCodContabil: String;
    sgComponentesConsiste: String; // Componentes a Consistir no Ts_ManutDiversas (Separados por <;>)
    bgCkbChecado: Boolean; // Como Inicializa o CheckBox;

    // ClientDateSet Virtuais ==================================================
    gCDS_V1: TClientDataSet;
    gDS_V1: TDataSource;
    gCDS_V2: TClientDataSet;
    gDS_V2: TDataSource;

    dgDtaCalendario: TDate;

    sgTpFechaCaixa: String;
    // sgTpFechaCaixa:
    // (D) Fechamento do Caixa Dia
    // (C) Conciliação do Caixa Dias
  end;

const
  // Show Hint em Forma de Balão
  TTS_BALLOON = $40;
  TTM_SETTITLE = (WM_USER + 32);
  //////////////////////////////

var
  FrmSolicitacoes: TFrmSolicitacoes;

  TD: TTransactionDesc;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  GridNew: TDBGrid;

  iTipo: Integer;
  PrimeiroDiaMes: TDateTime;

  sgDtaI, sgDtaF: String;

  sgMensagem: String;
  sgNomeArq: String;

  sgTipoDML: String;
  sgCodProd: String;

  igDiaSemana: Integer;

  bRelSimples: Boolean;

  IBQ_ConsultaFilial  : TIBQuery;

implementation

uses DK_Procs1, UDMBelShop, UFrmBelShop, UDMSalao, UPesquisa, UFrmSalao,
     UDMVirtual, UDMLojaUnica, UDMCentralTrocas, UDMConexoes,
     UFrmSelectEmpProcessamento, IBCustomDataSet, UDMRelatorio,
  UPesquisaIB;

{$R *.dfm}

//==============================================================================
// Odir ========================================================================
//==============================================================================

// Relatórios do Salão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.SalaoRelatorios;
Var
  MySql: String;
  mMemo: TMemo;
  i: Integer;
Begin
  sgTipoImpressao:=Pan_SalaoRelatorios.Caption;

  If Cbx_SalaoRelSituacao.ItemIndex=0 Then
   sgTipo:='SIM'
  Else If Cbx_SalaoRelSituacao.ItemIndex=1 Then
   sgTipo:='NAO';

  sgCodEmp:=FormatFloat('00',EdtSalaoRelCodLoja.AsInteger);

  If sgTipoImpressao='Endereços de E-Mails' Then
  Begin
    MySql:=' SELECT p.cod_loja, e.razao_social,'+
           ' p.cod_profissional, p.des_profissional, p.des_apelido,'+
           ' p.blob_localizacoes'+
           ' FROM SAL_PROFISSIONAIS p, EMP_CONEXOES e'+
           ' WHERE p.cod_loja=e.cod_filial'+
           ' AND   p.blob_localizacoes CONTAINING '';'''+
           ' AND   p.TIP_PESSOA=''P''';

           If (Trim(sgCodEmp)<>'') and (Trim(sgCodEmp)<>'00') Then
            MySql:=
             MySql+' AND p.cod_loja='+QuotedStr(sgCodEmp);

           If Trim(sgTipo)<>'' Then
            MySql:=
             MySql+' AND p.ind_ativo='+QuotedStr(sgTipo);

           MySql:=
            MySql+' ORDER BY p.cod_loja, p.des_profissional';
    DMBelShop.SQLQ_Busca.Close;
    DMBelShop.SQLQ_Busca.SQL.Clear;
    DMBelShop.SQLQ_Busca.SQL.Add(MySql);
    DMBelShop.SQLQ_Busca.Open;

    If Trim(DMBelShop.SQLQ_Busca.FieldByName('Cod_Loja').AsString)='' Then
    Begin
      OdirPanApres.Visible:=False;
      msg('Sem Profissional com Registro de E-Mail !!','A');
      Exit;
    End;

    // Cria Client para Relatório ==============================================
    gCDS_V1:=TClientDataSet.Create(Self);
    gCDS_V1.FieldDefs.Clear;
    gCDS_V1.FieldDefs.Add('COD_LOJA',ftString,2);
    gCDS_V1.FieldDefs.Add('RAZAO_SOCIAL',ftString,60);
    gCDS_V1.FieldDefs.Add('COD_PROF',ftString,6);
    gCDS_V1.FieldDefs.Add('NOME_PROF',ftString,60);
    gCDS_V1.FieldDefs.Add('APELIDO_PROF',ftString,60);
    gCDS_V1.FieldDefs.Add('IDENTIFICA',ftString,30);
    gCDS_V1.FieldDefs.Add('EMAIL',ftString,100);
    gCDS_V1.CreateDataSet;
    gCDS_V1.Open;

    mMemo:=TMemo.Create(Self);
    mMemo.Visible:=False;
    mMemo.Parent:=FrmSolicitacoes;
    mMemo.Width:=500;
    mMemo.Lines.Clear;

    // Atualiza Client para Relatório ==========================================
    While Not DMBelShop.SQLQ_Busca.Eof do
    Begin
      mmemo.Text:=DMBelShop.SQLQ_Busca.FieldByName('BLOB_LOCALIZACOES').AsString;

      sgCodigo:='';
      For i:=0 to mMemo.Lines.Count-1 do
      Begin
        // Localizações E-Mail's --------------------------------------
        If Separa_String(mMemo.Lines[i], 1)='2' Then
        Begin
          gCDS_V1.Append;
          gCDS_V1.FieldByName('COD_LOJA').AsString    :=DMBelShop.SQLQ_Busca.FieldByName('Cod_Loja').AsString;
          gCDS_V1.FieldByName('RAZAO_SOCIAL').AsString:=DMBelShop.SQLQ_Busca.FieldByName('Razao_Social').AsString;
          gCDS_V1.FieldByName('COD_PROF').AsString    :=DMBelShop.SQLQ_Busca.FieldByName('Cod_Profissional').AsString;
          If sgCodigo='' Then
           gCDS_V1.FieldByName('NOME_PROF').AsString   :=DMBelShop.SQLQ_Busca.FieldByName('Des_Profissional').AsString;
          sgCodigo:='ok';
          gCDS_V1.FieldByName('APELIDO_PROF').AsString:=DMBelShop.SQLQ_Busca.FieldByName('Des_Apelido').AsString;
          gCDS_V1.FieldByName('IDENTIFICA').AsString  :=Separa_String(mMemo.Lines[i], 2);
          gCDS_V1.FieldByName('EMAIL').AsString       :=Separa_String(mMemo.Lines[i], 3);
          gCDS_V1.Post;
        End; // If Separa_String(mMemo.Lines[i], 1)='1' Then
      End; // For i:=0 to mMemo.Lines.Count-1 do
      sgCodigo:='';

      DMBelShop.SQLQ_Busca.Next;
    End; // While Not DMBelShop.SQLQ_Busca.Eof do
    FreeAndNil(mMemo);

    With DMRelatorio.RelVisual do
    Begin
      gCDS_V1.First;
      ClientDataSet:=gCDS_V1;
      Destino:=toVisualiza;
      Orientacao:=toRetrato;
      RodapeGrupo:=True;
      TextoRodape:='';
      TextoRodapeGrupo:='';

      ImprimirTarjaCinza:=False;
      ImprimirVisto:=False;
      Cabecalho1Esquerda:='';
      Cabecalho1Esquerda:='LOJAS BELSHOP';

      Cabecalho2Esquerda:='TODAS AS LOJAS';
      If (Trim(sgCodEmp)<>'') and (Trim(sgCodEmp)<>'00') Then
       Cabecalho2Esquerda:='';

      Cabecalho3Centro:='RELATÓRIO DE E-MAILs';

      DefinicaoCampos.Clear;
      DefinicaoCampos.Add('D0;10;E;;COD_PROF;Cód');
      DefinicaoCampos.Add('D0;90;E;;NOME_PROF;Nome Profissional');
//      DefinicaoCampos.Add('D0;50;E;;APELIDO_PROF;Apelido');
      DefinicaoCampos.Add('D0;50;E;;IDENTIFICA;Identificação');
      DefinicaoCampos.Add('D0;200;E;;EMAIL;E-Mail');

      // Quebra de Grupo
      DefinicaoCampos.Add('G1;8;E;;COD_LOJA;LOJA:');
      DefinicaoCampos.Add('G1;4;E;;COD_LOJA;');
      DefinicaoCampos.Add('G1;100;E;;RAZAO_SOCIAL;');


      OdirPanApres.Visible:=False;
      Execute;
    End; // With DMRelatorio.RelVisual do

    gCDS_V1.Close;;
    FreeAndNil(gCDS_V1);
  End; // If sgTipoImpressao='Endereços de E-Mails' Then
End; // Relatórios do Salão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Executa Query do Usuario >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSolicitacoes.ExcutaQueryUsuario(MySql: String): Boolean;
Begin
  Result:=False;

  IBQ_ConsultaFilial.Close;
  IBQ_ConsultaFilial.SQL.Clear;
  IBQ_ConsultaFilial.SQL.Add(MySql);

  Try
    IBQ_ConsultaFilial.ExecSQL;
    Result:=True;
  Except
  End; // Try

  FrmSolicitacoes.Refresh;
  Application.ProcessMessages;

End; // Executa Query do Usuario >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// ATUALIZA PERMISSOES USUARIOS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.AtualizaPermissoesUsuarios;
Var
  b, bProcOK, bSiga: Boolean;

  MySql,
  sTabela,
  sCodUsuModelo,
  //Loja a Atualizar
  sCodUltimo, sCodUsuario,
  sNomeUsuario, sSenhaUsuario,
  sNomeCompleto, sEmail, sDtaNasc,
  sSexo, sSetor, sCargo, sTelefone: String;

  // Memos
  mCodUsuarios,
  mUsuario, mUsuarioComprv, mUsuarioFilial,
  mUsuarioP, mUsuarioLista, mUsuario_Monitor,
  memDML : TMemo;

  ii, i: Integer;
  iCodNovo: Integer;
begin
  Screen.Cursor:=crAppStart;

  // Cria Componente Memo ======================================================
  mCodUsuarios:=TMemo.Create(Self);
  mCodUsuarios.Visible:=False;
  mCodUsuarios.Parent:=FrmSolicitacoes;
  mCodUsuarios.Width:=5000;
  mCodUsuarios.Lines.Clear;

  mUsuario:=TMemo.Create(Self);
  mUsuario.Visible:=False;
  mUsuario.Parent:=FrmSolicitacoes;
  mUsuario.Width:=5000;
  mUsuario.Lines.Clear;

  mUsuarioComprv:=TMemo.Create(Self);
  mUsuarioComprv.Visible:=False;
  mUsuarioComprv.Parent:=FrmSolicitacoes;
  mUsuarioComprv.Width:=5000;
  mUsuarioComprv.Lines.Clear;

  mUsuarioFilial:=TMemo.Create(Self);
  mUsuarioFilial.Visible:=False;
  mUsuarioFilial.Parent:=FrmSolicitacoes;
  mUsuarioFilial.Width:=5000;
  mUsuarioFilial.Lines.Clear;

  mUsuarioP:=TMemo.Create(Self);
  mUsuarioP.Visible:=False;
  mUsuarioP.Parent:=FrmSolicitacoes;
  mUsuarioP.Width:=5000;
  mUsuarioP.Lines.Clear;

  mUsuarioLista:=TMemo.Create(Self);
  mUsuarioLista.Visible:=False;
  mUsuarioLista.Parent:=FrmSolicitacoes;
  mUsuarioLista.Width:=5000;
  mUsuarioLista.Lines.Clear;

  mUsuario_Monitor:=TMemo.Create(Self);
  mUsuario_Monitor.Visible:=False;
  mUsuario_Monitor.Parent:=FrmSolicitacoes;
  mUsuario_Monitor.Width:=5000;
  mUsuario_Monitor.Lines.Clear;

  memDML:=TMemo.Create(Self);
  memDML.Visible:=False;
  memDML.Parent:=FrmSolicitacoes;
  memDML.Width:=5000;
  memDML.Lines.Clear;

  sgMensagemERRO:=''; // Erro ao Consultar Usuario
  sgMensagem:='';     // Erro ao Atualizar Tabela
  sgLojasNConectadas:='';

  // Conecta Empresa =======================================================
  sgCodEmp:=FormatFloat('00',StrToInt(EdtLojaModelo.Text));

  bSiga:=False;
  Try
    If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
     Begin
       bSiga:=True;
     End
  Except
    msg('Loja Modelo Sem Conexão !!'+cr+cr+'Tente Mais Tarde !!','A');
    Exit;
  End; // Try

  If Not bSiga Then
  Begin
    msg('Loja Modelo Sem Conexão !!'+cr+cr+'Tente Mais Tarde !!','A');
    Exit;
  End;

  // Cria Query da Empresa ------------------------------------
  FrmBelShop.CriaQueryIB('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True, True);

  // Busca Codigo do Usuario Modelo ============================================
  MySql:=' SELECT u.codusuario'+
         ' FROM usuario u'+
         ' WHERE UPPER(u.nomeusuario)= UPPER('+QuotedStr(EdtUsuarioModelo.Text)+')';
  IBQ_ConsultaFilial.Close;
  IBQ_ConsultaFilial.SQL.Clear;
  IBQ_ConsultaFilial.SQL.Add(MySql);
  IBQ_ConsultaFilial.Open;
  sCodUsuModelo:=IBQ_ConsultaFilial.FieldByName('CodUsuario').AsString;
  IBQ_ConsultaFilial.Close;

  If Trim(sCodUsuModelo)='' Then
  Begin
    // Fecha Conexão Loja Modelo =================================================
    ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

    msg('Usuário modelo Não Existe !!','A');
    EdtUsuarioModelo.SetFocus;
    Exit;
  End; // If Trim(sCodUsuModelo)='' Then

  // Acerta IBQuery de Campos de Tabelas de Usuarios ===========================
  If DMVirtual.IBQ_UsuarioTable.Active Then
   DMVirtual.IBQ_UsuarioTable.Close;

  DMVirtual.IBQ_UsuarioTable.Database:=IBQ_ConsultaFilial.Database;
  DMVirtual.IBQ_UsuarioTable.Transaction:=IBQ_ConsultaFilial.Transaction;

  // Monta UPDATE OR INSERT da Tabelas
  For ii:=1 to 6 do
  Begin
    If ii=1 Then sTabela:='Usuario';
    If ii=2 Then sTabela:='UsuarioComprv';
    If ii=3 Then sTabela:='UsuarioFilial';
    If ii=4 Then sTabela:='UsuarioP';
    If ii=5 Then sTabela:='UsuarioLista';
    If ii=6 Then sTabela:='Usuario_Monitor';

    DMVirtual.IBQ_UsuarioTable.Close;
    DMVirtual.IBQ_UsuarioTable.Params.ParamByName('Tabela').AsString:=sTabela;

    i:=0;
    bSiga:=False;
    While Not bSiga do
    Begin
      Try
        DMVirtual.IBQ_UsuarioTable.Open;
        bSiga:=True;
      Except
        Inc(i);
      End; // Try

      If i>2 Then
       Break;
    End; // While Not bSiga do

    MySql:='';
    If bSiga Then
    Begin
      While not DMVirtual.IBQ_UsuarioTable.Eof do
      Begin
        If sTabela='Usuario'         Then mUsuario.Lines.Add(DMVirtual.IBQ_UsuarioTableNOME_CAMPO.AsString);
        If sTabela='UsuarioComprv'   Then mUsuarioComprv.Lines.Add(DMVirtual.IBQ_UsuarioTableNOME_CAMPO.AsString);
        If sTabela='UsuarioFilial'   Then mUsuarioFilial.Lines.Add(DMVirtual.IBQ_UsuarioTableNOME_CAMPO.AsString);
        If sTabela='UsuarioP'        Then mUsuarioP.Lines.Add(DMVirtual.IBQ_UsuarioTableNOME_CAMPO.AsString);
        If sTabela='UsuarioLista'    Then mUsuarioLista.Lines.Add(DMVirtual.IBQ_UsuarioTableNOME_CAMPO.AsString);
        If sTabela='Usuario_Monitor' Then mUsuario_Monitor.Lines.Add(DMVirtual.IBQ_UsuarioTableNOME_CAMPO.AsString);

        DMVirtual.IBQ_UsuarioTable.Next;
      End; // While not DMVirtual.IBQ_UsuarioTable.Eof do
    End; // If bSiga Then
  End; // For ii:=1 to 6 do

  //============================================================================
  // USUARIO - Busca Dados do Usuário Modelo ===================================
  //============================================================================
  IBQ_ConsultaFilial.Close;
  IBQ_ConsultaFilial.SQL.Clear;
  IBQ_ConsultaFilial.SQL.Add(mUsuario.Text+' DML FROM USUARIO WHERE CODUSUARIO='+QuotedStr(sCodUsuModelo));
  IBQ_ConsultaFilial.Open;

  mUsuario.Lines.Clear;
  While Not IBQ_ConsultaFilial.Eof do
  Begin
    mUsuario.Lines.Add(IBQ_ConsultaFilial.FieldByName('DML').AsString);

    IBQ_ConsultaFilial.Next;
  End; // While Not IBQ_ConsultaFilial.Eof do
  IBQ_ConsultaFilial.Close;

  //============================================================================
  // USUARIOCOMPRV - Busca Dados do Usuário Modelo =============================
  //============================================================================
  IBQ_ConsultaFilial.Close;
  IBQ_ConsultaFilial.SQL.Clear;
  IBQ_ConsultaFilial.SQL.Add(mUsuarioComprv.Text+' DML FROM USUARIOCOMPRV WHERE CODUSUARIO='+QuotedStr(sCodUsuModelo));
  IBQ_ConsultaFilial.Open;

  mUsuarioComprv.Lines.Clear;
  While Not IBQ_ConsultaFilial.Eof do
  Begin
    mUsuarioComprv.Lines.Add(IBQ_ConsultaFilial.FieldByName('DML').AsString);

    IBQ_ConsultaFilial.Next;
  End; // While Not IBQ_ConsultaFilial.Eof do
  IBQ_ConsultaFilial.Close;

  //============================================================================
  // USUARIOFILIAL - Busca Dados do Usuário Modelo =============================
  //============================================================================
  IBQ_ConsultaFilial.Close;
  IBQ_ConsultaFilial.SQL.Clear;
  IBQ_ConsultaFilial.SQL.Add(mUsuarioFilial.Text+' DML FROM USUARIOFILIAL WHERE CODUSUARIO='+QuotedStr(sCodUsuModelo));
  IBQ_ConsultaFilial.Open;

  mUsuarioFilial.Lines.Clear;
  While Not IBQ_ConsultaFilial.Eof do
  Begin
    mUsuarioFilial.Lines.Add(IBQ_ConsultaFilial.FieldByName('DML').AsString);

    IBQ_ConsultaFilial.Next;
  End; // While Not IBQ_ConsultaFilial.Eof do
  IBQ_ConsultaFilial.Close;

  //============================================================================
  // USUARIOP - Busca Dados do Usuário Modelo ==================================
  //============================================================================
  IBQ_ConsultaFilial.Close;
  IBQ_ConsultaFilial.SQL.Clear;
  IBQ_ConsultaFilial.SQL.Add(mUsuarioP.Text+' DML FROM USUARIOP WHERE CODUSUARIO='+QuotedStr(sCodUsuModelo));
  IBQ_ConsultaFilial.Open;

  mUsuarioP.Lines.Clear;
  While Not IBQ_ConsultaFilial.Eof do
  Begin
    mUsuarioP.Lines.Add(IBQ_ConsultaFilial.FieldByName('DML').AsString);

    IBQ_ConsultaFilial.Next;
  End; // While Not IBQ_ConsultaFilial.Eof do
  IBQ_ConsultaFilial.Close;

  //============================================================================
  // USUARIOLISTA - Busca Dados do Usuário Modelo ==============================
  //============================================================================
  IBQ_ConsultaFilial.Close;
  IBQ_ConsultaFilial.SQL.Clear;
  IBQ_ConsultaFilial.SQL.Add(mUsuarioLista.Text+' DML FROM USUARIOLISTA WHERE CODUSUARIO='+QuotedStr(sCodUsuModelo));
  IBQ_ConsultaFilial.Open;

  mUsuarioLista.Lines.Clear;
  While Not IBQ_ConsultaFilial.Eof do
  Begin
    mUsuarioLista.Lines.Add(IBQ_ConsultaFilial.FieldByName('DML').AsString);

    IBQ_ConsultaFilial.Next;
  End; // While Not IBQ_ConsultaFilial.Eof do
  IBQ_ConsultaFilial.Close;

  //============================================================================
  // USUARIO_MONITOR - Busca Dados do Usuário Modelo ===========================
  //============================================================================
  IBQ_ConsultaFilial.Close;
  IBQ_ConsultaFilial.SQL.Clear;
  IBQ_ConsultaFilial.SQL.Add(mUsuario_Monitor.Text+' DML FROM USUARIO_MONITOR WHERE CODUSUARIO='+QuotedStr(sCodUsuModelo));
  IBQ_ConsultaFilial.Open;

  mUsuario_Monitor.Lines.Clear;
  While Not IBQ_ConsultaFilial.Eof do
  Begin
    mUsuario_Monitor.Lines.Add(IBQ_ConsultaFilial.FieldByName('DML').AsString);

    IBQ_ConsultaFilial.Next;
  End; // While Not IBQ_ConsultaFilial.Eof do
  IBQ_ConsultaFilial.Close;


  //============================================================================
  // Fecha Conexão Loja Modelo =================================================
  //============================================================================
  ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

  // Atualiza Lojas ============================================================
  sgLojasNConectadas:='';
  bProcOK:=False;

  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    Refresh;

    if DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
    Begin
      sgCodEmp:=DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString;

      PainelApresExp.Caption:='AGUARDE !! Atualizando Permissões: Bel_'+sgCodEmp;
      PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
      PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
      PainelApresExp.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-PainelApresExp.Height)/2))-20;
      PainelApresExp.Color:=clSilver;
      PainelApresExp.Font.Style:=[fsBold];
      PainelApresExp.Parent:=FrmSolicitacoes;
      PainelApresExp.Visible:=True;
      Refresh;

      sgDesLoja:=DMBelShop.CDS_EmpProcessaRAZAO_SOCIAL.AsString;

      // Conecta Empresa =======================================================
      If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
       Begin
         bSiga:=True;
       End
      Else
       Begin
         Refresh;
         bSiga:=False;

         If sgLojasNConectadas='' Then
          sgLojasNConectadas:='Bel_'+sgCodEmp
         Else
          sgLojasNConectadas:=sgLojasNConectadas+', Bel_'+sgCodEmp;
       End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

      // Inicia Processamento ==================================================
      If bSiga Then // Empresa Conectada
      Begin
        Try
          bProcOK:=True;

          // Abre Transacao ----------------------------------------------
          b:=False;
          While Not b do
          Begin
            b:=IBTransacao('S','IBT_'+sgCodEmp);
          End; // While Not b do

          // Cria Query da Empresa ------------------------------------
          FrmBelShop.CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True, True);

          // Busca Ultimo Codigo de Usuario =====================================
          MySql:=' SELECT LPAD(COALESCE(MAX(CAST(u.codusuario AS INTEGER)),1),3,0) CodUltimo'+
                 ' FROM USUARIO u';
          IBQ_ConsultaFilial.Close;
          IBQ_ConsultaFilial.SQL.Clear;
          IBQ_ConsultaFilial.SQL.Add(MySql);

          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              IBQ_ConsultaFilial.Open;
              bSiga:=True;
            Except
              Inc(i);
            End; // Try

            If i>2 Then
             Break;
          End; // While Not bSiga do

          If Not bSiga Then
          Begin
            If sgLojasNConectadas='' Then
             sgLojasNConectadas:='Bel_'+sgCodEmp
            Else
             sgLojasNConectadas:=sgLojasNConectadas+', Bel_'+sgCodEmp;
          End; // If Not bSiga Then

          If bSiga Then
          Begin
            sCodUltimo:=IBQ_ConsultaFilial.FieldByName('CodUltimo').AsString;
            If Trim(sCodUltimo)='' Then
             sCodUltimo:='001';

            // Busca Codigo de Usuarios a Alterar ==============================
            mCodUsuarios.Lines.Clear;
            For i:=0 to Lbx_Usuarios.Items.Count-1 do
            Begin
              MySql:=' SELECT TRIM(u.codusuario) codusuario,'+
                     '        TRIM(u.senhausuario) senhausuario,'+
                     '        TRIM(u.nome_completo) nome_completo,'+
                     '        TRIM(u.email) email,'+
                     '        TRIM(u.data_nascimento) data_nascimento,'+
                     '        TRIM(u.sexo) sexo,'+
                     '        TRIM(u.setor) setor,'+
                     '        TRIM(u.cargo) cargo,'+
                     '        TRIM(u.telefone) telefone'+
                     ' FROM USUARIO u'+
                     ' WHERE UPPER(TRIM(u.nomeusuario))= UPPER('+QuotedStr(Trim(Lbx_Usuarios.Items[i]))+')';
              IBQ_ConsultaFilial.Close;
              IBQ_ConsultaFilial.SQL.Clear;
              IBQ_ConsultaFilial.SQL.Add(MySql);

              ii:=0;
              bSiga:=False;
              While Not bSiga do
              Begin
                Try
                  IBQ_ConsultaFilial.Open;
                  bSiga:=True;
                Except
                  Inc(ii);
                End; // Try

                If ii>2 Then
                 Break;
              End; // While Not bSiga do

              If Not bSiga Then
              Begin
                If sgMensagemERRO='' Then
                 sgMensagemERRO:='Bel_'+sgCodEmp+' - '+Trim(Lbx_Usuarios.Items[i])
                Else
                 sgMensagemERRO:=sgMensagemERRO+cr+'Bel_'+sgCodEmp+' - '+Trim(Lbx_Usuarios.Items[i]);
              End; // If Not bSiga Then

              If bSiga Then
              Begin
               // Codigo e Nome do Usuario a Atualizar
               If (Trim(IBQ_ConsultaFilial.FieldByName('CodUsuario').AsString)<>'') and
                  (Trim(IBQ_ConsultaFilial.FieldByName('SenhaUsuario').AsString)<>'') Then
                Begin
                  mCodUsuarios.Lines.Add(Trim(IBQ_ConsultaFilial.FieldByName('CodUsuario').AsString)+
                                         '|'+Trim(Lbx_Usuarios.Items[i])+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('SenhaUsuario').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Nome_Completo').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Email').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Data_Nascimento').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Sexo').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Setor').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Cargo').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Telefone').AsString)+'|');
                End
               Else If (Trim(IBQ_ConsultaFilial.FieldByName('CodUsuario').AsString)<>'') and
                       (Trim(IBQ_ConsultaFilial.FieldByName('SenhaUsuario').AsString)='') Then
                Begin
                  mCodUsuarios.Lines.Add(Trim(IBQ_ConsultaFilial.FieldByName('CodUsuario').AsString)+
                                         '|'+Trim(Lbx_Usuarios.Items[i])+
                                         '|10151A1B'+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Nome_Completo').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Email').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Data_Nascimento').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Sexo').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Setor').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Cargo').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Telefone').AsString)+'|');
                End
               Else
                Begin
                  iCodNovo:=StrToInt(sCodUltimo);
                  inc(iCodNovo);
                  sCodUltimo:=FormatFloat('000',iCodNovo);
                  mCodUsuarios.Lines.Add(sCodUltimo+
                                         '|'+Trim(Lbx_Usuarios.Items[i])+
                                         '|10151A1B'+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Nome_Completo').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Email').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Data_Nascimento').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Sexo').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Setor').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Cargo').AsString)+
                                         '|'+Trim(IBQ_ConsultaFilial.FieldByName('Telefone').AsString)+'|');
                End;
              End; // If bSiga Then
            End; // For i:=0 to Lbx_Usuarios.Items.Count-1 do

            //==================================================================
            // Atualiza Usuarios ===============================================
            //==================================================================
            For i:=0 to mCodUsuarios.Lines.Count-1 do
            Begin
              Application.ProcessMessages;

              sCodUsuario  :=Separa_String(mCodUsuarios.Lines[i],1,'|');
              sNomeUsuario :=Separa_String(mCodUsuarios.Lines[i],2,'|');
              sSenhaUsuario:=Separa_String(mCodUsuarios.Lines[i],3,'|');

              sNomeCompleto:=Separa_String(mCodUsuarios.Lines[i],4,'|');
              If Trim(sNomeCompleto)='' Then
               sNomeCompleto:=sNomeUsuario;

              sEmail       :=Separa_String(mCodUsuarios.Lines[i],5,'|');

              sDtaNasc     :=Separa_String(mCodUsuarios.Lines[i],6,'|');
              If Trim(sDtaNasc)='' Then
               sDtaNasc:=f_Troca('/','.',f_Troca('-','.',DateToStr(Now)));

              sSexo        :=Separa_String(mCodUsuarios.Lines[i],7,'|');
              sSetor       :=Separa_String(mCodUsuarios.Lines[i],8,'|');
              sCargo       :=Separa_String(mCodUsuarios.Lines[i],9,'|');
              sTelefone    :=Separa_String(mCodUsuarios.Lines[i],10,'|');

              //================================================================
              // Atualiza Tabela: USUARIO
              //================================================================
              PainelApresExp.Caption:='AGUARDE !! Atualizando Permissões: Bel_'+sgCodEmp+' - Usuario: '+sNomeUsuario;
              PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
              PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
              Refresh;

              memDML.Lines.Clear;
              If Trim(mUsuario.Lines.Text)='' Then
               Begin
                 memDML.Lines.Text:=' DELETE FROM USUARIO WHERE CODUSUARIO='+QuotedStr(sCodUsuario);
               End
              Else // If Trim(mUsuario.Lines.Text)='' Then
               Begin
                 memDML.Lines.Text:=mUsuario.Lines.Text;
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'CODODIR',       sCodUsuario,   [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'NOMEODIR',      sNomeUsuario,  [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'SENHAODIR',     sSenhaUsuario, [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'NOMECOMPLODIR', sNomeCompleto, [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'EMAILODIR',     sEmail,        [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'DTNASCODIR',    sDtaNasc,      [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'SEXOODIR',      sSexo,         [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'SETORODIR',     sSetor,        [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'CARGOODIR',     sCargo,        [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'FONEODIR',      sTelefone,     [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, '''NULL''',      'NULL',        [rfReplaceAll]);
               End; // If Trim(mUsuario.Lines.Text)='' Then

              // Executa Query =================================================
              MySql:='';
              For ii:=0 to memDML.Lines.Count-1 do
              Begin
                If (AnsiContainsStr(memDML.Lines[ii], 'UPDATE OR INSERT INTO')) And (MySql<>'') Then
                 Begin
                   If not ExcutaQueryUsuario(MySql) Then
                   Begin
                     If sgMensagem='' Then
                      sgMensagem:=Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIO'
                     Else
                      sgMensagem:=sgMensagem+cr+Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIO'
                   End;

                   MySql:=memDML.Lines[ii];

                 End
                Else
                 Begin
                   MySql:=MySql+memDML.Lines[ii];
                 End;
              End; // For ii:=0 to memDML.Lines.Count-1 do

              If not ExcutaQueryUsuario(MySql) Then
              Begin
                If sgMensagem='' Then
                 sgMensagem:=Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIO'
                Else
                 sgMensagem:=sgMensagem+cr+Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIO'
              End;

              //================================================================
              // Atualiza Tabela: USUARIOCOMPRV
              //================================================================
              PainelApresExp.Caption:='AGUARDE !! Atualizando Permissões: Bel_'+sgCodEmp+' - UsuarioComprv: '+sNomeUsuario;
              PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
              PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
              Refresh;

              memDML.Lines.Clear;
              If Trim(mUsuarioComprv.Lines.Text)='' Then
               Begin
                 memDML.Lines.Text:=' DELETE FROM USUARIOCOMPRV WHERE CODUSUARIO='+QuotedStr(sCodUsuario);
               End
              Else // If Trim(mUsuarioComprv.Lines.Text)='' Then
               Begin
                 memDML.Lines.Text:=mUsuarioComprv.Lines.Text;
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'CODODIR',  sCodUsuario, [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, '''NULL''', 'NULL',      [rfReplaceAll]);
               End; // If Trim(mUsuarioComprv.Lines.Text)='' Then

              // Executa Query =================================================
              MySql:='';
              For ii:=0 to memDML.Lines.Count-1 do
              Begin
                If (AnsiContainsStr(memDML.Lines[ii], 'UPDATE OR INSERT INTO')) And (MySql<>'') Then
                 Begin
                   If not ExcutaQueryUsuario(MySql) Then
                   Begin
                     If sgMensagem='' Then
                      sgMensagem:=Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOCOMPRV'
                     Else
                      sgMensagem:=sgMensagem+cr+Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOCOMPRV'
                   End;

                   MySql:=memDML.Lines[ii];

                 End
                Else
                 Begin
                   MySql:=MySql+memDML.Lines[ii];
                 End;
              End; // For ii:=0 to memDML.Lines.Count-1 do

              If not ExcutaQueryUsuario(MySql) Then
              Begin
                If sgMensagem='' Then
                 sgMensagem:=Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOCOMPRV'
                Else
                 sgMensagem:=sgMensagem+cr+Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOCOMPRV'
              End;

              //================================================================
              // Atualiza Tabela: USUARIOFILIAL
              //================================================================
              PainelApresExp.Caption:='AGUARDE !! Atualizando Permissões: Bel_'+sgCodEmp+' - UsuarioFilial: '+sNomeUsuario;
              PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
              PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
              Refresh;

              memDML.Lines.Clear;
              If Trim(mUsuarioFilial.Lines.Text)='' Then
               Begin
                 memDML.Lines.Text:=' DELETE FROM USUARIOFILIAL WHERE CODUSUARIO='+QuotedStr(sCodUsuario);
               End
              Else // If Trim(mUsuarioFilial.Lines.Text)='' Then
               Begin
                 memDML.Lines.Text:=mUsuarioFilial.Lines.Text;
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'CODODIR',  sCodUsuario, [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, '''NULL''', 'NULL',      [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, ','''+sgCodEmp+''',''N'')', ','''+sgCodEmp+''',''S'')', [rfReplaceAll]);
               End; // If Trim(mUsuarioFilial.Lines.Text)='' Then

              // Executa Query =================================================
              MySql:='';
              For ii:=0 to memDML.Lines.Count-1 do
              Begin
                If (AnsiContainsStr(memDML.Lines[ii], 'UPDATE OR INSERT INTO')) And (MySql<>'') Then
                 Begin
                   If not ExcutaQueryUsuario(MySql) Then
                   Begin
                     If sgMensagem='' Then
                      sgMensagem:=Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOFILIAL'
                     Else
                      sgMensagem:=sgMensagem+cr+Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOFILIAL'
                   End;

                   MySql:=memDML.Lines[ii];

                 End
                Else
                 Begin
                   MySql:=MySql+memDML.Lines[ii];
                 End;
              End; // For ii:=0 to memDML.Lines.Count-1 do

              If not ExcutaQueryUsuario(MySql) Then
              Begin
                If sgMensagem='' Then
                 sgMensagem:=Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOFILIAL'
                Else
                 sgMensagem:=sgMensagem+cr+Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOFILIAL'
              End;

              //================================================================
              // Atualiza Tabela: USUARIOP
              //================================================================
              PainelApresExp.Caption:='AGUARDE !! Atualizando Permissões: Bel_'+sgCodEmp+' - UsuarioP: '+sNomeUsuario;
              PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
              PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
              Refresh;

              memDML.Lines.Clear;
              If Trim(mUsuarioP.Lines.Text)='' Then
               Begin
                 memDML.Lines.Text:=' DELETE FROM USUARIOP WHERE CODUSUARIO='+QuotedStr(sCodUsuario);
               End
              Else // If Trim(mUsuarioP.Lines.Text)='' Then
               Begin
                 memDML.Lines.Text:=mUsuarioP.Lines.Text;
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'CODODIR',  sCodUsuario, [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, '''NULL''', 'NULL',      [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'VALUES ('''+sCodUsuModelo, 'VALUES ('''+sCodUsuario, [rfReplaceAll]);
               End; // If Trim(mUsuarioP.Lines.Text)='' Then

              // Executa Query =================================================
              MySql:='';
              For ii:=0 to memDML.Lines.Count-1 do
              Begin
                If (AnsiContainsStr(memDML.Lines[ii], 'UPDATE OR INSERT INTO')) And (MySql<>'') Then
                 Begin
                   If not ExcutaQueryUsuario(MySql) Then
                   Begin
                     If sgMensagem='' Then
                      sgMensagem:=Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOP'
                     Else
                      sgMensagem:=sgMensagem+cr+Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOP'
                   End;

                   MySql:=memDML.Lines[ii];

                 End
                Else
                 Begin
                   MySql:=MySql+memDML.Lines[ii];
                 End;
              End; // For ii:=0 to memDML.Lines.Count-1 do

              If not ExcutaQueryUsuario(MySql) Then
              Begin
                If sgMensagem='' Then
                 sgMensagem:=Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOP'
                Else
                 sgMensagem:=sgMensagem+cr+Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOP'
              End;

              //================================================================
              // Atualiza Tabela: USUARIOLISTA
              //================================================================
              PainelApresExp.Caption:='AGUARDE !! Atualizando Permissões: Bel_'+sgCodEmp+' - UsuarioLista: '+sNomeUsuario;
              PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
              PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
              Refresh;

              memDML.Lines.Clear;
              If Trim(mUsuarioLista.Lines.Text)='' Then
               Begin
                 memDML.Lines.Text:=' DELETE FROM USUARIOLISTA WHERE CODUSUARIO='+QuotedStr(sCodUsuario);
               End
              Else // If Trim(mUsuarioLista.Lines.Text)='' Then
               Begin
                 memDML.Lines.Text:=mUsuarioLista.Lines.Text;
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'CODODIR',  sCodUsuario, [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, '''NULL''', 'NULL',      [rfReplaceAll]);
               End; // If Trim(mUsuarioLista.Lines.Text)='' Then

              // Executa Query =================================================
              MySql:='';
              For ii:=0 to memDML.Lines.Count-1 do
              Begin
                If (AnsiContainsStr(memDML.Lines[ii], 'UPDATE OR INSERT INTO')) And (MySql<>'') Then
                 Begin
                   If not ExcutaQueryUsuario(MySql) Then
                   Begin
                     If sgMensagem='' Then
                      sgMensagem:=Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOLISTA'
                     Else
                      sgMensagem:=sgMensagem+cr+Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOLISTA'
                   End;

                   MySql:=memDML.Lines[ii];

                 End
                Else
                 Begin
                   MySql:=MySql+memDML.Lines[ii];
                 End;
              End; // For ii:=0 to memDML.Lines.Count-1 do

              If not ExcutaQueryUsuario(MySql) Then
              Begin
                If sgMensagem='' Then
                 sgMensagem:=Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOLISTA'
                Else
                 sgMensagem:=sgMensagem+cr+Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIOLISTA'
              End;

              //================================================================
              // Atualiza Tabela: USUARIO_MONITOR
              //================================================================
              PainelApresExp.Caption:='AGUARDE !! Atualizando Permissões: Bel_'+sgCodEmp+' - Usuario_Monitor: '+sNomeUsuario;
              PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
              Refresh;

              memDML.Lines.Clear;
              If Trim(mUsuario_Monitor.Lines.Text)='' Then
               Begin
                 memDML.Lines.Text:=' DELETE FROM USUARIO_MONITOR WHERE CODUSUARIO='+QuotedStr(sCodUsuario);
               End
              Else // If Trim(mUsuario_Monitor.Lines.Text)='' Then
               Begin
                 memDML.Lines.Text:=mUsuario_Monitor.Lines.Text;
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, 'CODODIR',  sCodUsuario, [rfReplaceAll]);
                 memDML.Lines.Text:=StringReplace(memDML.Lines.Text, '''NULL''', 'NULL',      [rfReplaceAll]);
               End; // If Trim(mUsuarioLista.Lines.Text)='' Then

              // Executa Query =================================================
              MySql:='';
              For ii:=0 to memDML.Lines.Count-1 do
              Begin
                If (AnsiContainsStr(memDML.Lines[ii], 'UPDATE OR INSERT INTO')) And (MySql<>'') Then
                 Begin
                   If not ExcutaQueryUsuario(MySql) Then
                   Begin
                     If sgMensagem='' Then
                      sgMensagem:=Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIO_MONITOR'
                     Else
                      sgMensagem:=sgMensagem+cr+Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIO_MONITOR'
                   End;

                   MySql:=memDML.Lines[ii];

                 End
                Else
                 Begin
                   MySql:=MySql+memDML.Lines[ii];
                 End;
              End; // For ii:=0 to memDML.Lines.Count-1 do

              If not ExcutaQueryUsuario(MySql) Then
              Begin
                If sgMensagem='' Then
                 sgMensagem:=Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIO_MONITOR'
                Else
                 sgMensagem:=sgMensagem+cr+Trim(Lbx_Usuarios.Items[i])+' - Tabela: USUARIO_MONITOR'
              End;
            End; // For i:=0 to mCodUsuarios.Lines.Count-1 do

            // Commit ------------------------------------------------------
            b:=False;
            While Not b do
            Begin
              b:=IBTransacao('C', 'IBT_'+sgCodEmp);
            End; // While Not b do
          End; // If bSiga Then

        Except
          on e : Exception do
          Begin
            // Rollback Transacao -----------------------------------------
            b:=False;
            While Not b do
            Begin
              b:=IBTransacao('R', 'IBT_'+sgCodEmp);
            End; // While Not b do

           PainelApresExp.Visible:=False;
           Refresh;

           If sgLojasNConectadas='' Then
             sgLojasNConectadas:='Bel_'+sgCodEmp
            Else
             sgLojasNConectadas:=sgLojasNConectadas+', Bel_'+sgCodEmp;

          End; // on e : Exception do
        End; // Try
      End; // If bSiga Then // Empresa Conectada

      // Fecha Conexão =========================================================
      ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

    End; // if DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do
  PainelApresExp.Visible:=False;
  Refresh;

  Screen.Cursor:=crDefault;

  If bProcOK Then
   Begin
     msg('Processamento'+cr+'Efetuada com SUCESSO !!','A');
   End // If bProcOK Then
  Else
   Begin
     Screen.Cursor:=crDefault;
     msg('Erro no Processamento !!','A');
   End; //  // If bProcOK Then

  If sgLojasNConectadas<>'' Then
   msg('Lojas Não Conectadas: '+cr+cr+sgLojasNConectadas,'A');

  // Erro ao Consultar Usuario
  If Trim(sgMensagemERRO)<>'' Then
   MessageBox(Handle, pChar('ERRO ao Consultar Usuário:'+cr+sgMensagemERRO), 'ATENÇÃO !!', MB_ICONINFORMATION);

  // Erro ao Atualizar Tabela
  If Trim(sgMensagem)<>'' Then
   MessageBox(Handle, pChar('ERRO ao Atualizar Usuário:'+cr+sgMensagem), 'ATENÇÃO !!', MB_ICONINFORMATION);

  FreeAndNil(mCodUsuarios);
  FreeAndNil(mUsuario);
  FreeAndNil(mUsuarioComprv);
  FreeAndNil(mUsuarioFilial);
  FreeAndNil(mUsuarioLista);
  FreeAndNil(mUsuarioP);
  FreeAndNil(mUsuario_Monitor);

End; // ATUALIZA PERMISSOES USUARIOS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// BUSCA ESTOQUES DAS LOJAS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.BuscaEstoquesLojas;
Var
  bSiga: Boolean;

  MySql,
  sHora,sgDML, sgValues: String;

  i: Integer;         
begin
  Screen.Cursor:=crAppStart;

  Bt_SelecionarOK.Enabled:=False;
  Bt_SelectEmpProcMarcaTodos.Enabled:=False;
  Bt_SelectEmpProcDesMarcaTodos.Enabled:=False;
  Bt_SelecionarValtar.Enabled:=False;

  Dbg_Selecionar.SetFocus;

  sgMensagemERRO:='';
  sgMensagem:='';

  // Inicia Processamento ======================================================
  DMBelShop.CDS_Busca.First;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    Lab_Conta.Caption:='NAO';
    If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then
    Begin
      sgCodEmp:=DMBelShop.CDS_Busca.FieldByName('COD_FILIAL').AsString;

      sHora:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

      // Conecta Empresa =======================================================
      Try
        If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
         Begin
           Lab_Conta.Caption:='CON';
           bSiga:=True;
         End
        Else
         Begin
           Lab_Conta.Caption:='NCON';
           bSiga:=False;
         End; // If ConexaoEmpIndividual(DMVirtual.CDS_V_EmpConexoesDATABASE.AsString, DMVirtual.CDS_V_EmpConexoesTRANSACAO.AsString, 'A') Then
      Except
        Lab_Conta.Caption:='NCON';
        bSiga:=False;
      End; // Try

      If not bSiga Then
      Begin
        If sgMensagemERRO='' Then
         sgMensagemERRO:='Bel_'+sgCodEmp
        else
         sgMensagemERRO:=sgMensagemERRO+', Bel_'+sgCodEmp;
      End; // If not bSiga Then

      If bSiga Then // Conexão
      Begin
        PainelApresExp.Caption:='AGUARDE !! Importando Estoque Loja: Bel_'+sgCodEmp;
        PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
        PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
        PainelApresExp.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-PainelApresExp.Height)/2))-20;
        PainelApresExp.Color:=clSilver;
        PainelApresExp.Font.Style:=[fsBold];
        PainelApresExp.Parent:=FrmSolicitacoes;
        PainelApresExp.Visible:=True;
        Refresh;

        // ============================================================
        // Busca ESTOQUE ==============================================
        // ============================================================
        DateSeparator:='.';
        DecimalSeparator:='.';

        // Cria Query da Empresa ------------------------------------
        FrmBelShop.CriaQueryIB('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True, True);

        If DMVirtual.IBQ_EstoqueLoja.Active Then
         DMVirtual.IBQ_EstoqueLoja.Close;

        DMVirtual.IBQ_EstoqueLoja.Database:=IBQ_ConsultaFilial.Database;
        DMVirtual.IBQ_EstoqueLoja.Transaction:=IBQ_ConsultaFilial.Transaction;

        MySql:=' SELECT'+
               ' e.codfilial, e.codproduto, e.saldoatual, e.pedidopendente,'+
               ' e.zonaendereco, e.corredor, e.prateleira, e.gaveta,'+
               ' e.cusmedvalor, e.customedio, e.lastprecocompra, e.lastcustomedio,'+
               ' e.estoqueideal, e.estoquemaximo,'+
               ' e.dataalteracadastro, e.dataalteraestoque, e.dataalteraestoque_ped,'+
               ' coalesce(p.principalfor,''000000'') principalfor,'+
               ' current_date DTA_ATUALIZACAO, '+QuotedStr(sHora)+' HRA_ATUALIZACAO'+
               ' FROM ESTOQUE e'+
               '      LEFT JOIN PRODUTO p on e.codproduto=p.codproduto'+
               ' WHERE e.codfilial='+QuotedStr(sgCodEmp);
        DMVirtual.IBQ_EstoqueLoja.Close;
        DMVirtual.IBQ_EstoqueLoja.SQL.Clear;
        DMVirtual.IBQ_EstoqueLoja.SQL.Add(MySql);

        // Abre Query da no Banco de Dados da Loja -----------------
        i:=0;
        bSiga:=False;
        While Not bSiga do
        Begin
          Try
            DMVirtual.IBQ_EstoqueLoja.Open;
            bSiga:=True;
            Lab_Conta.Caption:='Abriu';
          Except
            on e : Exception do
            Begin
              Inc(i);
              // MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
            End; // on e : Exception do
          End; // Try

          If i>2 Then
          Begin
            Break;
            Lab_Conta.Caption:='NAbriu';
          End;
        End; // While Not bSiga do

        If not bSiga Then
        Begin
          If sgMensagemERRO='' Then
           sgMensagemERRO:='Bel_'+sgCodEmp
          else
           sgMensagemERRO:=sgMensagemERRO+', Bel_'+sgCodEmp;
        End; // If not bSiga Then

        // Processamento  -------------------------------------------
        // UTILIZA TRANSAÇOES CURTAS --------------------------------
        If bSiga Then // Processa Estoques
        Begin
          Try
            // Monta Transacao  ---------------------------------------
            TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
            TD.IsolationLevel:=xilREADCOMMITTED;
            DMBelShop.SQLC.StartTransaction(TD);

            DateSeparator:='.';
            DecimalSeparator:='.';

            // Atualiza Estoques da Loja --------------------------------
            sgDML:=' UPDATE OR INSERT INTO ESTOQUE ('+
                   ' CODFILIAL, CODPRODUTO, SALDOATUAL, PEDIDOPENDENTE,'+
                   ' ZONAENDERECO, CORREDOR, PRATELEIRA, GAVETA,'+
                   ' CUSMEDVALOR, CUSTOMEDIO, LASTPRECOCOMPRA, LASTCUSTOMEDIO,'+
                   ' ESTOQUEIDEAL, ESTOQUEMAXIMO,'+
                   ' DATAALTERACADASTRO, DATAALTERAESTOQUE, DATAALTERAESTOQUE_PED,'+
                   ' PRINCIPALFOR,'+
                   ' DTA_ATUALIZACAO, HRA_ATUALIZACAO)'+

                  ' VALUES (';

            While Not DMVirtual.IBQ_EstoqueLoja.Eof do
            Begin
              sgValues:='';
              For i:=0 to DMVirtual.IBQ_EstoqueLoja.FieldCount-1 do
              Begin
                // ULTIMO CAMPO - HRA_ATUALIZACAO ==================================
                If Trim(DMVirtual.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
                Begin
                  sgValues:=sgValues+QuotedStr(DMVirtual.IBQ_EstoqueLoja.Fields[i].AsString)+')';
                End // If Trim(DMVirtual.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then

                // Grava Resto do Registro =========================================
                Else
                 Begin
                   If Trim(DMVirtual.IBQ_EstoqueLoja.Fields[i].AsString)<>'' Then
                    sgValues:=sgValues+QuotedStr(DMVirtual.IBQ_EstoqueLoja.Fields[i].AsString)+', '
                   Else
                    sgValues:=sgValues+'NULL, ';
                 End;
              End; // For i:=0 to DMVirtual.IBQ_EstoqueLoja.FieldCount-1 do

              // UPDATE OR INSERT INTO MCLI ========================================
              MySql:=sgDML+sgValues+' MATCHING (CODFILIAL, CODPRODUTO)';
              DMBelShop.SQLC.Execute(MySql,nil,nil);

              DMVirtual.IBQ_EstoqueLoja.Next;
            End; // While Not DMVirtual.IBQ_EstoqueLoja.Eof do
            DMVirtual.IBQ_EstoqueLoja.Close;

            DMBelShop.SQLC.Commit(TD);

            If sgMensagem='' Then
             sgMensagem:='Bel_'+sgCodEmp
            else
             sgMensagem:=sgMensagem+', Bel_'+sgCodEmp;

            DMBelShop.CDS_Busca.Edit;
            DMBelShop.CDS_Busca.FieldByName('PROC').AsString:='NAO';
            DMBelShop.CDS_Busca.Post;

            DateSeparator:='/';
            DecimalSeparator:=',';
          Except
            on e : Exception do
            Begin
              // MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
              PainelApresExp.Visible:=False;
              DMBelShop.SQLC.Rollback(TD);
              DMVirtual.IBQ_EstoqueLoja.Close;

              If sgMensagemERRO='' Then
               sgMensagemERRO:='Bel_'+sgCodEmp
              else
               sgMensagemERRO:=sgMensagemERRO+', Bel_'+sgCodEmp;

              DateSeparator:='/';
              DecimalSeparator:=',';

            End; // on e : Exception do
          End; // Try
        End; // If bSiga Then // Processa Estoques

        DateSeparator:='/';
        DecimalSeparator:=',';
        PainelApresExp.Visible:=False;
        // ============================================================
        // Busca ESTOQUE ==============================================
        // ============================================================

        // Fecha Conexão =========================================================
        ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');
      End; // If bSiga Then // Conexão
    End; // If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do

  Screen.Cursor:=crDefault;
  PainelApresExp.Visible:=False;

  If Trim(sgMensagem)='' Then
  Begin
    msg('Sem Loja a Processar ou'+cr+' Lojas Sem Conexão no Momento !!','A');
    Bt_SelecionarOK.Enabled:=True;
    Bt_SelectEmpProcMarcaTodos.Enabled:=True;
    Bt_SelectEmpProcDesMarcaTodos.Enabled:=True;
    Bt_SelecionarValtar.Enabled:=True;

    DMBelShop.CDS_Busca.First;
    Exit;
  End;

  MessageBox(Handle, pChar('Lojas Processadas:'+cr+sgMensagem+cr+cr+'Loja(s) Não Conectadas:'+cr+sgMensagemERRO), 'ATENÇÃO !!', MB_ICONINFORMATION);

  Screen.Cursor:=crArrow;

  PainelApresExp.Caption:='AGUARDE !! Localizando Nova Posição de Importação !!';
  PainelApresExp.Visible:=True;
  Refresh;

  DMBelShop.CDS_Busca.Close;
  DMBelShop.CDS_Busca.Open;

  Screen.Cursor:=crDefault;
  PainelApresExp.Visible:=False;

  Bt_SelecionarOK.Enabled:=True;
  Bt_SelectEmpProcMarcaTodos.Enabled:=True;
  Bt_SelectEmpProcDesMarcaTodos.Enabled:=True;
  Bt_SelecionarValtar.Enabled:=True;

// =============================================================================
// FIM DO PROCESSO =============================================================
// =============================================================================
End; // BUSCA ESTOQUES DAS LOJAS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Não Permite Sair com Ctrl+F4 ////////////////////////////////////////////////
procedure TFrmSolicitacoes.AppMessage(var Msg: TMSG; var HAndled: Boolean);
Begin
  Handled := False;

  case Msg.Message of
  WM_SYSKEYDOWN:
   if Msg.wParam = VK_F4 then
   Begin
     Handled := True; // Bloqueia o ALT+F4
   End;
  End;
End;

// EVENTOS EM TEMPO DE EXCUÇÂO - INICIO ////////////////////////////////////////
// OCComparaPedidos ============================================================
procedure TFrmSolicitacoes.OCComparaPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
Begin
  If (Column.FieldName='COD_LOJA') or (Column.FieldName='TOTAL_PEDIDO') Then
   Begin
     GridNew.Canvas.Brush.Color:=clYellow;
     GridNew.Canvas.Font.Style:=[fsBold];
     GridNew.Canvas.Font.Color:=clBlue;
   End
  Else // If (Column.FieldName='COD_LOJA') or (Column.FieldName='TOTAL_PEDIDO') Then
   Begin
     GridNew.Canvas.Brush.Color:=clWindow;
     GridNew.Canvas.Font.Color:=clWindowText;
     GridNew.Canvas.Font.Style:=[];
   End; // If (Column.FieldName='COD_LOJA') or (Column.FieldName='TOTAL_PEDIDO') Then

  if not (gdSelected in State) Then
  Begin
    if Trim(DMBelShop.CDS_OCComparaPedidos.FieldByName('Pedidos').AsString)='A COMPRAR' Then
     GridNew.Canvas.Brush.Color:=clYellow;

    if Trim(DMBelShop.CDS_OCComparaPedidos.FieldByName('DES_LOJA').AsString)='TOTAL GERAL' Then
    Begin
      GridNew.Canvas.Brush.Color:=clYellow;
      GridNew.Canvas.Font.Style:=[fsBold];
      GridNew.Canvas.Font.Color:=clBlue;
    End;
  End;

  GridNew.Canvas.FillRect(Rect);
  GridNew.DefaultDrawDataCell(Rect,Column.Field,state);

End; // OCComparaPedidos =======================================================
// EVENTOS EM TEMPO DE EXCUÇÂO - FIM ///////////////////////////////////////////

// PARAMETROS do SISTEMA - Consiste Parametros do Sistema //////////////////////
Function TFrmSolicitacoes.ConsisteParametrosSIS(sTipo: String): Boolean;
Var
  bSalMinExiste, bPerSMExiste: Boolean;
Begin
  // sTipo = (SM) Salario Mínimo
  // sTipo = (INSS) Tabela INSS
  // sTipo = (IRRF) Tabela IRRF
  Result:=False;

  // Salario Minimo ============================================================
  If sTipo='SM' Then
  Begin
    // Zerado -------------------------------------------------------
    If EdtParamVlrSalMinimo.Value<1 Then
    Begin
      msg('Salário Mínimo Inválido !!','A');
      EdtParamVlrSalMinimo.SetFocus;
      Exit;
    End;

    // Já Existente -------------------------------------------------
    DMVirtual.CDS_V_ParamSalMinimo.First;
    bSalMinExiste:=True;
    bPerSMExiste:=True;
    While Not DMVirtual.CDS_V_ParamSalMinimo.Eof do
    Begin
      If DMVirtual.CDS_V_ParamSalMinimoIND_SIT.AsString<>'Excluido' Then
      Begin
        if (EdtParamVlrSalMinimo.Value<=DMVirtual.CDS_V_ParamSalMinimoVLR_INICIAL.AsCurrency) And
           (sgNumSeq<>DMVirtual.CDS_V_ParamSalMinimoNUM_SEQ.AsString) And (sgTipoDML<>'Alterado') Then
        Begin
          bSalMinExiste:=False;
          Break;
        End; // if EdtParamVlrSalMinimo.Value<=DMVirtual.CDS_V_ParamSalMinimoVLR_INICIAL.AsCurrency And ...

        If (((DtEdtParamVigIniSalMinino.Date>=DMVirtual.CDS_V_ParamSalMinimoDTA_VIGENCIA_INICIO.AsDateTime) And
            (DtEdtParamVigIniSalMinino.Date<=DMVirtual.CDS_V_ParamSalMinimoDTA_VIGENCIA_FINAL.AsDateTime))
             Or
            ((DtEdtParamVigFimSalMinino.Date>=DMVirtual.CDS_V_ParamSalMinimoDTA_VIGENCIA_INICIO.AsDateTime) And
            (DtEdtParamVigFimSalMinino.Date<=DMVirtual.CDS_V_ParamSalMinimoDTA_VIGENCIA_FINAL.AsDateTime)))
            And
           (sgNumSeq<>DMVirtual.CDS_V_ParamSalMinimoNUM_SEQ.AsString)  Then
        Begin
          bPerSMExiste:=False;
          Break;
        End; // if EdtParamVlrSalMinimo.Value<=DMVirtual.CDS_V_ParamSalMinimoVLR_INICIAL.AsCurrency And ...
      End; // If DMVirtual.CDS_V_ParamSalMinimoIND_SIT.AsString<>'Excluido' Then
      DMVirtual.CDS_V_ParamSalMinimo.Next;
    End;

    If Not bSalMinExiste Then
    Begin
      msg('Salário Mínimo Existente'+cr+'ou Menor ao Existente !!','A');
      EdtParamVlrSalMinimo.SetFocus;
      Exit;
    End;

    If Not bPerSMExiste Then
    Begin
      msg('Período de Vigência Existente !!','A');
      DtEdtParamVigIniSalMinino.SetFocus;
      Exit;
    End;

    // Periodo de Vigencia ------------------------------------------
    Try
      StrToDate(DtEdtParamVigIniSalMinino.Text);
    Except
      msg('Vigência Inicial Inválida !!','A');
      DtEdtParamVigIniSalMinino.SetFocus;
      Exit;
    End;

    Try
      StrToDate(DtEdtParamVigFimSalMinino.Text);
    Except
      msg('Vigência Final Inválida !!','A');
      DtEdtParamVigFimSalMinino.SetFocus;
      Exit;
    End;

    If DtEdtParamVigFimSalMinino.Date<=DtEdtParamVigIniSalMinino.Date Then
    Begin
      msg('Período de Vigência Inválido !!','A');
      DtEdtParamVigIniSalMinino.SetFocus;
      Exit;
    End;
  End; // If sTipo='SM' Then

  Result:=True;

End; // PARAMETROS do SISTEMA - Consiste Parametros do Sistema /////////////////

// MANUTENÇÕES VALES - Acerta Componentes //////////////////////////////////////
Procedure TFrmSolicitacoes.ValesAcertaComponentes(iTipo:Integer; tCor:TColor; bReadOnly, bEnabled, bVisible:Boolean);
Begin
// iTipo=
//       1 = TFrmSalao.Bt_ValesAlterarClick

//       2 = TFrmSolicitacoes.Bt_ValesAbandonarClick
//       3 = TFrmSolicitacoes.Bt_ValesAlterarClick
//       4 = TFrmSolicitacoes.Dbg_ValesParcelasDblClick

//       5 = TFrmSalao.Bt_ValesNovoClick

  if (iTipo in [1, 5]) then
  Begin
    EdtValesCodLoja.Color:=tCor;
    EdtValesCodLoja.ReadOnly:=bReadOnly;
    EdtValesCodLoja.TabStop:=Not EdtValesCodLoja.ReadOnly;

    Bt_ValesBuscaLoja.Enabled:=bEnabled;

    EdtValesCodProf.Color:=tCor;
    EdtValesCodProf.ReadOnly:=bReadOnly;
    EdtValesCodProf.TabStop:=Not EdtValesCodProf.ReadOnly;

    Bt_ValesBuscaProf.Enabled:=bEnabled;

    EdtValesDocto.Style.Color:=tCor;
    EdtValesDocto.Properties.ReadOnly:=bReadOnly;
    EdtValesDocto.TabStop:=Not EdtValesDocto.Properties.ReadOnly;

    EdtValesVlrDocto.Style.Color:=tCor;
    EdtValesVlrDocto.Properties.ReadOnly:=bReadOnly;
    EdtValesVlrDocto.TabStop:=Not EdtValesVlrDocto.Properties.ReadOnly;

    EdtValesTotalParc.Style.Color:=tCor;
    EdtValesTotalParc.Properties.ReadOnly:=bReadOnly;
    EdtValesTotalParc.TabStop:=Not EdtValesTotalParc.Properties.ReadOnly;

    EdtValesPrazo.Style.Color:=tCor;
    EdtValesPrazo.Properties.ReadOnly:=bReadOnly;
    EdtValesPrazo.TabStop:=Not EdtValesPrazo.Properties.ReadOnly;

    DtEdt_ValesPrimVencto.Style.Color:=tCor;
    DtEdt_ValesPrimVencto.Properties.ReadOnly:=bReadOnly;
    DtEdt_ValesPrimVencto.TabStop:=Not DtEdt_ValesPrimVencto.Properties.ReadOnly;

    Ckb_ValesAtivos.Enabled:=Not bEnabled;
    Ckb_ValesInativos.Enabled:=Not bEnabled;

    Bt_ValesGeraParc.Visible:=bVisible;
    Bt_ValesSalvar.Enabled:=bEnabled;
  End; // if (iTipo in [1, 5]) then

  if (iTipo in [2, 3, 4]) then
  Begin
    EdtValesVlrDesc.Style.Color:=tCor;
    EdtValesVlrDesc.Properties.ReadOnly:=bReadOnly;
    EdtValesVlrDesc.TabStop:=Not EdtValesVlrDesc.Properties.ReadOnly;

    EdtValesVlrAcresc.Style.Color:=tCor;
    EdtValesVlrAcresc.Properties.ReadOnly:=bReadOnly;
    EdtValesVlrAcresc.TabStop:=Not EdtValesVlrAcresc.Properties.ReadOnly;

    EdtValesVlrPago.Style.Color:=tCor;
    EdtValesVlrPago.Properties.ReadOnly:=bReadOnly;
    EdtValesVlrPago.TabStop:=Not EdtValesVlrPago.Properties.ReadOnly;

    DtEdt_ValesPagto.Style.Color:=tCor;
    DtEdt_ValesPagto.Properties.ReadOnly:=bReadOnly;
    DtEdt_ValesPagto.TabStop:=Not DtEdt_ValesPagto.Properties.ReadOnly;

    EdtValesDoctoPagto.Style.Color:=tCor;
    EdtValesDoctoPagto.Properties.ReadOnly:=bReadOnly;
    EdtValesDoctoPagto.TabStop:=Not EdtValesDoctoPagto.Properties.ReadOnly;

    Bt_ValesSalvar.Enabled:=Not bEnabled;
  End; // if (iTipo in [2, 3, 4]) then

  if iTipo=5 then
  Begin
    EdtValesVlrDesc.Enabled:=Not bEnabled;
    EdtValesVlrDesc.TabStop:=Not EdtValesVlrDesc.Properties.ReadOnly;

    EdtValesVlrAcresc.Enabled:=Not bEnabled;
    EdtValesVlrAcresc.TabStop:=Not EdtValesVlrAcresc.Properties.ReadOnly;

    EdtValesVlrPago.Enabled:=Not bEnabled;
    EdtValesVlrPago.TabStop:=Not EdtValesVlrPago.Properties.ReadOnly;

    DtEdt_ValesPagto.Enabled:=Not bEnabled;
    DtEdt_ValesPagto.TabStop:=Not DtEdt_ValesPagto.Properties.ReadOnly;

    EdtValesDoctoPagto.Enabled:=Not bEnabled;
    EdtValesDoctoPagto.TabStop:=Not EdtValesDoctoPagto.Properties.ReadOnly;

    Bt_ValesSalvar.Enabled:=Not bEnabled;
    Bt_ValesAlterar.Visible:=Not bVisible;
    Bt_ValesAbandonar.Visible:=Not bVisible;
  End; // if iTipo=5 then

  Bt_ValesAlterar.Enabled:=bEnabled;
  Bt_ValesAbandonar.Enabled:=bEnabled;
End; // MANUTENÇÕES VALES - Acerta Componentes /////////////////////////////////

// DIVERSOS - Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmSolicitacoes.CreateToolTips(hWnd: Cardinal);
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
end; // DIVERSOS - Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// DIVERSOS - Show Hint em Forma de Balão - Usado no FormCreate >>>>>>>>>>>>>>>>
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

end; // DIVERSOS - Show Hint em Forma de Balão - Usado no FormCreate >>>>>>>>>>>

// DIVERSOS - Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>
Procedure TFrmSolicitacoes.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // DIVERSOS - Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>

// MANUTENÇÕES VALES - CONSISTENCIAS DE VALES //////////////////////////////////
Function TFrmSolicitacoes.ConsisteVales(sTipo: String): Boolean;
Var
  cVlr: Currency;
Begin
// sTipo = (A)ltera Parcela
//       = (G)era Parcelas

  Result:=False;

  If EdtValesCodLoja.Value=0 Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtValesCodLoja.SetFocus;
    Exit;
  End;

  If EdtValesCodProf.Value=0 Then
  Begin
    msg('Favor Informar o Profissional !!','A');
    EdtValesCodProf.SetFocus;
    Exit;
  End;

  If EdtValesDocto.Value=0 Then
  Begin
    msg('Favor Informar o Nº Docto !!','A');
    EdtValesDocto.SetFocus;
    Exit;
  End;

  If EdtValesVlrDocto.Value=0 Then
  Begin
    msg('Favor Informar o Valor do Docto !!','A');
    EdtValesVlrDocto.SetFocus;
    Exit;
  End;

  If EdtValesTotalParc.Value=0 Then
  Begin
    msg('Favor Informar o'+cr+cr+'Total de Parcelas !!','A');
    EdtValesTotalParc.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_ValesPrimVencto.Text);
  Except
    msg('Data do 1º Vencimento Inválida !!','A');
    DtEdt_ValesPrimVencto.SetFocus;
    Exit;
  End;

  If sTipo='A' Then // Somente para Alteração de Parcela
  Begin
    If Trim(DtEdt_ValesPagto.Text)<>'' Then
    Begin
      Try
        StrToDate(DtEdt_ValesPagto.Text);
      Except
        msg('Data de Pagto Inválida !!','A');
        DtEdt_ValesPagto.SetFocus;
        Exit;
      End;

      If DtEdt_ValesPagto.Date<DMSalao.CDS_ValesDTA_VENCIMENTO.AsDateTime Then
      Begin
        msg('Data de Pagamento Inferior'+cr+cr+'a Data de Vencimento !!','A');
        DtEdt_ValesPagto.SetFocus;
        Exit;
      End;
    End; // If Trim(DtEdt_ValesPagto.Text)<>'' Then

    If (EdtValesVlrPago.Value<>0) and (Trim(DtEdt_ValesPagto.Text)='') Then
    Begin
      msg('Favor Informar a Data de Pagamento !!','A');
      DtEdt_ValesPagto.SetFocus;
      Exit;
    End;

    If (EdtValesVlrPago.Value=0) and (Trim(DtEdt_ValesPagto.Text)<>'') Then
    Begin
      msg('Existe Data de Pagto'+cr+'Sem Valor Pago !!'+cr+cr+'Favor Informar o Valor Pago !!','A');
      EdtValesVlrPago.SetFocus;
      Exit;
    End;

    If (EdtValesVlrPago.Value<>0) and (EdtValesDoctoPagto.Value=0) Then
    Begin
      msg('Favor Informar o'+cr+cr+'Nº do Docto de Pagto !!','A');
      EdtValesDoctoPagto.SetFocus;
      Exit;
    End;

    cVlr:=RoundTo(((DMSalao.CDS_ValesVLR_PRESTACAO.AsCurrency+EdtValesVlrAcresc.Value)-EdtValesVlrDesc.Value),-2);
    If (EdtValesVlrPago.Value<>0) and (RoundTo(cVlr-EdtValesVlrPago.Value,-2)<>0) Then
    Begin
      msg('Valor PAGO Não Fecha'+cr+'com o Valor A PAGAR !!'+cr+cr+
          '- Vlr A PAGAR: '+CurrToStr(cVlr)+' - Vlr PAGO: '+EdtValesVlrPago.Text,'A');
      EdtValesVlrDesc.SetFocus;
      Exit;
    End;
  End; // If sTipo='A' Then // Somente para Alteração de Parcela

  Result:=True;

End; // MANUTENÇÕES VALES - CONSISTENCIAS DE VALES /////////////////////////////

// MANUTENÇÕES DIVERSAS - Consiste Componetes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSolicitacoes.ConsisteComponentesManutDiversas: Boolean;
Var
  bEdtDesc1, bEdtDesc2, bEdtDesc3, bEdtDesc4, bEdtDesc5,
  bEdtDesc6, bMeDesc7,  bEdtDesc9, bEdtDesc10: Boolean;
Begin
  Result    :=False;

  bEdtDesc1 :=False;
  bEdtDesc2 :=False;
  bEdtDesc3 :=False;
  bEdtDesc4 :=False;
  bEdtDesc5 :=False;
  bEdtDesc6 :=False;
  bMeDesc7  :=False;
//  bEdtDesc8 :=False; CheckBox Não Precisa
  bEdtDesc9 :=False;
  bEdtDesc10:=False;

  If AnsiContainsStr(sgComponentesConsiste, 'EdtDesc1')  Then bEdtDesc1 :=True;
  If AnsiContainsStr(sgComponentesConsiste, 'EdtDesc2')  Then bEdtDesc2 :=True;
  If AnsiContainsStr(sgComponentesConsiste, 'EdtDesc3')  Then bEdtDesc3 :=True;
  If AnsiContainsStr(sgComponentesConsiste, 'EdtDesc4')  Then bEdtDesc4 :=True;
  If AnsiContainsStr(sgComponentesConsiste, 'EdtDesc5')  Then bEdtDesc5 :=True;
  If AnsiContainsStr(sgComponentesConsiste, 'EdtDesc6')  Then bEdtDesc6 :=True;
  If AnsiContainsStr(sgComponentesConsiste, 'MeDesc7')   Then bMeDesc7  :=True;
  If AnsiContainsStr(sgComponentesConsiste, 'EdtDesc9')  Then bEdtDesc9 :=True;
  If AnsiContainsStr(sgComponentesConsiste, 'EdtDesc10') Then bEdtDesc10:=True;

  If (bEdtDesc1) And (EdtDesc1.AsInteger=0) Then
  Begin
    msg('Favor Informar: '+cr+Gb_Desc1.Caption,'A');
    EdtDesc1.SetFocus;
    Exit;
  End;

  If (bEdtDesc2) And (Trim(EdtDesc2.Text)='') Then
  Begin
    msg('Favor Informar: '+cr+Gb_Desc2.Caption,'A');
    EdtDesc2.SetFocus;
    Exit;
  End;

  If (bEdtDesc3) And (Trim(EdtDesc3.Text)='') Then
  Begin
    msg('Favor Informar: '+cr+Gb_Desc3.Caption,'A');
    EdtDesc3.SetFocus;
    Exit;
  End;

  If (bEdtDesc4) And (Trim(EdtDesc4.Text)='') Then
  Begin
    msg('Favor Informar: '+cr+Gb_Desc4.Caption,'A');
    EdtDesc4.SetFocus;
    Exit;
  End;

  If (bEdtDesc5) And (Trim(EdtDesc5.Text)='') Then
  Begin
    msg('Favor Informar: '+cr+Gb_Desc5.Caption,'A');
    EdtDesc5.SetFocus;
    Exit;
  End;

  If (bEdtDesc6) And (Trim(EdtDesc6.Text)='') Then
  Begin
    msg('Favor Informar: '+cr+Gb_Desc6.Caption,'A');
    EdtDesc6.SetFocus;
    Exit;
  End;

  If (bMeDesc7) Then
  Begin
    If MeDesc7.Text='  /  /    ' Then
    Begin
      msg('Favor Informar: '+cr+Gb_Desc7.Caption,'A');
      MeDesc7.SetFocus;
      Exit;
    End;

    Try
      StrToDate(MeDesc7.Text);
    Except
      Begin
        msg(Gb_Desc7.Caption+cr+'é Inválido !!','A');
        MeDesc7.SetFocus;
        Exit;
      End;
    End;
  End;

  If (bEdtDesc9) And (EdtDesc9.Value=0) Then
  Begin
    msg('Favor Informar: '+cr+Gb_Desc9.Caption,'A');
    EdtDesc9.SetFocus;
    Exit;
  End;

  If (bEdtDesc10) And (EdtDesc10.Value=0) Then
  Begin
    msg('Favor Informar: '+cr+Gb_Desc10.Caption,'A');
    EdtDesc10.SetFocus;
    Exit;
  End;

  Result:=True;

End; // MANUTENÇÕES DIVERSAS - Consiste Componetes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// MOVIMENTO DE CAIXA DIA - Coloca no Memo para Apresentação >>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.MovtoCaixaDiaMemo;
Begin

  mem_FinanFechaCaixa.Lines.Clear;
  CDS_.First;
  While Not CDS_.Eof do
  Begin
    mem_FinanFechaCaixa.Lines.Add(CDS_.FieldByName('DATA').AsString);
    CDS_.Next;
  End; // While Not CDS_.Eof do

End; // MOVIMENTO DE CAIXA DIA - Coloca no Memo para Apresentação >>>>>>>>>>>>>>

// MOVIMENTO DE CAIXA DIA - Gera Situaçoes do Caixa do Mes >>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.MovtoCaixaDiaSituacao(dDt: TDateTime) ;
Var
  MySql: String;
Begin
  // 0 = clRed     = Importador e Não Lançado
  // 1 = $0000A600 = Importado e Lancado
  // 2 = $00FF8000 =  Fechado Sem Diferença
  // 3 = 00FFC794  =  Fechado Com Diferença
  // 4 = $0004FFFF =  Sem Vendas

  // Acerta Periodo ============================================================
  sgDtaI:=DateToStr(PrimeiroUltimoDia(dDt,'P'));
  sgDtaF:=DateToStr(PrimeiroUltimoDia(dDt,'U'));
  sgDtaI:=f_Troca('/','.',sgDtai);
  sgDtaI:=f_Troca('-','.',sgDtai);
  sgDtaF:=f_Troca('/','.',sgDtaF);
  sgDtaF:=f_Troca('-','.',sgDtaF);

  If CDS_.Active Then
   CDS_.Close;

  CDS_.FieldDefs.Clear;
  CDS_.FieldDefs.Add('DATA',ftString,10);
  CDS_.FieldDefs.Add('COR',ftString,1);
  CDS_.CreateDataSet;

  CDS_.Open;

  // Busca Caixa SEM VENDA =====================================================
  MySql:=' SELECT d.dta_caixa';

         If sgTpFechaCaixa='D' Then
          MySql:=MySql+' FROM FIN_FECHAMENTO_CAIXA d';

         If sgTpFechaCaixa='C' Then
          MySql:=MySql+' FROM FIN_CONCILIACAO_CAIXA d';

  MySql:=
   MySql+' WHERE ((d.ind_fechado IS NULL) or (d.ind_fechado=''NAO''))'+
         ' AND d.ind_informado='+QuotedStr('NAO')+
         ' AND d.cod_loja='+QuotedStr(sgCodLoja)+
         ' AND d.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF)+
         ' GROUP BY d.dta_caixa'+
         ' HAVING SUM(d.vlr_diferenca)=0';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    // 4 = $0004FFFF =  Sem Vendas
    CDS_.Insert;
    CDS_.FieldByName('DATA').AsString:=f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString);
    CDS_.FieldByName('COR').AsInteger:=4;
    CDS_.Post;

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.Close;

  // Busca Caixa Fechado Sem Diferença =========================================
  MySql:=' SELECT d.dta_caixa, d.ind_fechado';

         If sgTpFechaCaixa='D' Then
          MySql:=MySql+' FROM FIN_FECHAMENTO_CAIXA d';

         If sgTpFechaCaixa='C' Then
          MySql:=MySql+' FROM FIN_CONCILIACAO_CAIXA d';

  MySql:=
   MySql+' WHERE d.cod_credito=9999'+
         ' AND d.vlr_diferenca=0'+
         ' AND d.ind_fechado='+QuotedStr('SIM')+
         ' AND d.cod_loja='+QuotedStr(sgCodLoja)+
         ' AND d.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    // 2 = $00FF8000 =  Fechado Sem Diferença
    If Not CDS_.Locate('DATA',f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString),[]) Then
    Begin
      CDS_.Insert;
      CDS_.FieldByName('DATA').AsString:=f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString);
      CDS_.FieldByName('COR').AsInteger:=2;
      CDS_.Post;
    End;

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.Close;

  // Busca Caixa Fechado Com Diferença =========================================
  MySql:=' SELECT d.dta_caixa, d.ind_fechado';

         If sgTpFechaCaixa='D' Then
          MySql:=MySql+' FROM FIN_FECHAMENTO_CAIXA d';

         If sgTpFechaCaixa='C' Then
          MySql:=MySql+' FROM FIN_CONCILIACAO_CAIXA d';

  MySql:=
   MySql+' WHERE d.cod_credito=9999'+
         ' AND d.vlr_diferenca<>0'+
         ' AND d.ind_fechado='+QuotedStr('SIM')+
         ' AND d.cod_loja='+QuotedStr(sgCodLoja)+
         ' AND d.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    // 3 = 00FFC794 =  Fechado Com Diferença
    If Not CDS_.Locate('DATA',f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString),[]) Then
    Begin
      CDS_.Insert;
      CDS_.FieldByName('DATA').AsString:=f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString);
      CDS_.FieldByName('COR').AsInteger:=3;
      CDS_.Post;
    End;

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.Close;

  // Busca Caixa Não Fechado Com Lancamentos ===================================
  MySql:=' SELECT d.dta_caixa';

         If sgTpFechaCaixa='D' Then
          MySql:=MySql+' FROM FIN_FECHAMENTO_CAIXA d';

         If sgTpFechaCaixa='C' Then
          MySql:=MySql+' FROM FIN_CONCILIACAO_CAIXA d';

  MySql:=
   MySql+' WHERE ((d.ind_fechado IS NULL) or (d.ind_fechado=''NAO''))'+
         ' AND d.ind_informado='+QuotedStr('SIM')+
         ' AND d.cod_loja='+QuotedStr(sgCodLoja)+
         ' AND d.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF)+
         ' GROUP BY d.dta_caixa';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    // 1 = $0000A600 = Não Fechado Com Lancamentos
    If Not CDS_.Locate('DATA',f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString),[]) Then
    Begin
      CDS_.Insert;
      CDS_.FieldByName('DATA').AsString:=f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString);
      CDS_.FieldByName('COR').AsInteger:=1;
      CDS_.Post;
    End;

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

  // Busca Caixa Não Fechado e Sem Lancamentos =================================
  MySql:=' SELECT d.dta_caixa';

         If sgTpFechaCaixa='D' Then
          MySql:=MySql+' FROM FIN_FECHAMENTO_CAIXA d';

         If sgTpFechaCaixa='C' Then
          MySql:=MySql+' FROM FIN_CONCILIACAO_CAIXA d';

  MySql:=
   MySql+' WHERE ((d.ind_fechado IS NULL) or (d.ind_fechado=''NAO''))'+
         ' AND d.ind_informado='+QuotedStr('NAO')+
         ' AND d.cod_loja='+QuotedStr(sgCodLoja)+
         ' AND d.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF)+
         ' GROUP BY d.dta_caixa';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    // 0 = clRed     = Nãi Fechado e Sem Lançamentos
    If Not CDS_.Locate('DATA',f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString),[]) Then
    Begin
      CDS_.Insert;
      CDS_.FieldByName('DATA').AsString:=f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString);
      CDS_.FieldByName('COR').AsInteger:=0;
      CDS_.Post;
    End;

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

End; // MOVIMENTO DE CAIXA DIA - Gera Situaçoes do Caixa do Mes >>>>>>>>>>>>>>>>

// MOVIMENTO DE CAIXA DIA - Desenha Calendário >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmSolicitacoes.MovtoCaixaDiaDesenharCalendario;
var
  Linha, Coluna: Integer;
  DiaPrimeiroMes: TDateTime;
  i : Integer;
  RecCalendar: TGridRect;
begin
  Pan_FinanFechaCaixa.Caption :=FormatDateTime('MMMM "de" yyyy', PrimeiroDiaMes);

  MovtoCaixaDiaSituacao(PrimeiroDiaMes);
  MovtoCaixaDiaMemo;

  DiaPrimeiroMes := PrimeiroDiaMes - 1;

  If DayOfWeek(DiaPrimeiroMes) = 1 Then
  Begin
    DiaPrimeiroMes := DiaPrimeiroMes - 1;

    i := 0;
    with Stg_FinanFechaCaixaCalendario do
    begin
      for Linha := 1 to Pred(RowCount) do
      begin
        for Coluna := 0 to Pred(ColCount) do
        begin
          Cells[Coluna, Linha]  := DateToStr(DiaPrimeiroMes + i);
          if DiaPrimeiroMes + i = Date then
          begin
            RecCalendar.Left    := Coluna;
            RecCalendar.Right   := Coluna;
            RecCalendar.Top     := Linha;
            RecCalendar.Bottom  := Linha;
            // Seleciona o dia corrente
            Selection := RecCalendar;
          end; // if DiaPrimeiroMes + i = Date then
          Inc(i);
        end; // for Coluna := 0 to Pred(ColCount) do
      end; // for Linha := 1 to Pred(RowCount) do
    end; // with CalendarGrid do
  End; // If DayOfWeek(DiaPrimeiroMes) = 1 Then

  while DayOfWeek(DiaPrimeiroMes) <> 1 do
  begin
    DiaPrimeiroMes := DiaPrimeiroMes - 1;
    i := 0;
    with Stg_FinanFechaCaixaCalendario do
    begin
      for Linha := 1 to Pred(RowCount) do
      begin
        for Coluna := 0 to Pred(ColCount) do
        begin
          Cells[Coluna, Linha]  := DateToStr(DiaPrimeiroMes + i);
          if DiaPrimeiroMes + i = Date then
          begin
            RecCalendar.Left    := Coluna;
            RecCalendar.Right   := Coluna;
            RecCalendar.Top     := Linha;
            RecCalendar.Bottom  := Linha;
            // Seleciona o dia corrente
            Selection := RecCalendar;
          end; // if DiaPrimeiroMes + i = Date then
          Inc(i);
        end; // for Coluna := 0 to Pred(ColCount) do
      end; // for Linha := 1 to Pred(RowCount) do
    end; // with CalendarGrid do begin
  End; // while DayOfWeek(DiaPrimeiroMes) <> 1 do

end; // MOVIMENTO DE CAIXA DIA - Desenha Calendário >>>>>>>>>>>>>>>>>>>>>>>>>>>>

// CRIA GRIDNEW em Ts_QualquerCoisa >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.GridNewCriar(Dts: TDataSource; sNomeObjeto: String; bSalvar: Boolean = True);
Begin
  GridNew:=TDBGrid.Create(Self);
  GridNew.Visible:=True;
  GridNew.Parent:=Ts_QualquerCoisa;
  GridNew.Align:=alClient;
  GridNew.Options:=[dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
  GridNew.DataSource:=Dts;

  If sNomeObjeto='PopM_GeraOC' Then
  Begin
    GridNew.OnDrawColumnCell:=OCComparaPedidosDrawColumnCell;
    GridNew.Columns[1].Width:=250;
    GridNew.Columns[2].Width:=80;
    GridNew.Columns[3].Title.Alignment:=taRightJustify;
    GridNew.Columns[3].Width:=60;
    GridNew.Columns[4].Width:=250;
    GridNew.Columns[5].Title.Alignment:=taRightJustify;
    GridNew.Columns[5].Width:=90;
    GridNew.Columns[6].Title.Alignment:=taRightJustify;
    GridNew.Columns[6].Width:=110;
    GridNew.Columns[7].Title.Alignment:=taRightJustify;
    GridNew.Columns[7].Width:=100;
    GridNew.Columns[8].Title.Alignment:=taRightJustify;
    GridNew.Columns[8].Width:=80;
    GridNew.Columns[9].Title.Alignment:=taRightJustify;
    GridNew.Columns[9].Width:=80;
    GridNew.Columns[10].Title.Alignment:=taRightJustify;
    GridNew.Columns[10].Width:=80;
    GridNew.Columns[11].Title.Alignment:=taRightJustify;
    GridNew.Columns[11].Width:=80;
    GridNew.Columns[12].Title.Alignment:=taRightJustify;
    GridNew.Columns[12].Width:=80;
    GridNew.Columns[13].Title.Alignment:=taRightJustify;
    GridNew.Columns[13].Width:=80;
    GridNew.Columns[14].Title.Alignment:=taRightJustify;
    GridNew.Columns[14].Width:=100;
    GridNew.Columns[15].Title.Alignment:=taRightJustify;
    GridNew.Columns[15].Width:=66;
    GridNew.Columns[16].Title.Alignment:=taRightJustify;
    GridNew.Columns[16].Width:=90;
    GridNew.Columns[17].Title.Alignment:=taRightJustify;
    GridNew.Columns[17].Width:=70;
    GridNew.Columns[18].Title.Alignment:=taRightJustify;
    GridNew.Columns[18].Width:=130;
  End;

  If Not bSalvar Then
   Bt_QualquerCoisaSalvar.Visible:=False;

End; // CRIA GRIDNEW em Ts_QualquerCoisa >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Ordem de Compra - Exporta Documento para Outros >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSolicitacoes.OcExportaDocumento: Boolean;
Var
  sCodEmp, sDta, sCodComprador: String;
  iNumSeq: Integer;
  MySql: String;

  // Procedure Interna /////////////////////////////////////////////////////////
  Procedure InsereProduto;
  Begin
    // Insere Produto no Documento DESTINO -------------------------------------
    MySql:=' Insert Into OC_COMPRAR ('+
           ' NUM_SEQ, NUM_DOCUMENTO, DTA_DOCUMENTO, IND_OC_GERADA, DTA_OC_GERADA, NUM_OC_GERADA,'+
           ' OBS_OC, COD_EMPRESA, DES_EMPRESA, COD_ITEM, DES_ITEM, QTD_SUGERIDA, QTD_ACOMPRAR,'+
           ' QTD_SALDO, QTD_TRANSITO, QTD_DISPONIVEL, QTD_MEDIA_MES, QTD_MEDIA_DIA, QTD_DEM_MES1,'+
           ' QTD_DEM_MES2, QTD_DEM_MES3, QTD_DEM_MES4, QTD_DEM_MES5, QTD_DEM_MES6, QTD_DEM_MES7,'+
           ' QTD_DEM_MES8, UNI_COMPRA, UNI_VENDA, COD_BARRAS, COD_GRUPO, DES_GRUPO, COD_SUBGRUPO,'+
           ' DES_SUBGRUPO, DES_GENERICO, COD_APLICACAO, DES_APLICACAO, COD_REFERENCIA, CLA_CURVA_ABC,'+
           ' COD_FAMILIA_PRECO, DES_FAMILIA_PRECO, DTA_ULT_COMPRA, COD_FOR_ULT_COMPRA,'+
           ' DES_FOR_ULT_COMPRA, QTD_ULT_COMPRA, VLR_UNI_ULT_COMPRA, VLR_TOT_ULT_COMPRA, VLR_UNI_COMPRA,'+
           ' PER_DESCONTO, DTA_ULT_VENDA, COD_CLI_ULT_VENDA, DES_CLI_ULT_VENDA, QTD_ULT_VENDA,'+
           ' VLR_UNI_ULT_VENDA, VLR_TOT_ULT_VENDA, VLR_UNI_VENDA, COD_LISTA_VENDA, DES_LISTA_VENDA,'+
           ' COD_LISTA_COMPRA, DES_LISTA_COMPRA, VLR_CUSTO_MEDIO, VLR_TOT_VENDA, VLR_TOT_COMPRA,'+
           ' VLR_BRUTO, VLR_DESCONTOS, VLR_DESPESAS, VLR_FRETE, IND_SOMA_IPI_BASE_ICMS,'+
           ' IND_SOMA_FRETE_BASE_ICMS, IND_SOMA_DESPESA_BASE_ICMS, IND_SOMA_IPI_BASE_ST,'+
           ' IND_SOMA_FRETE_BASE_ST, IND_SOMA_DESPESA_BASE_ST, COD_SIT_TRIBUTARIA, COD_IPI,'+
           ' IND_IPI, PER_IPI, VLR_IPI, COD_ICMS, PER_REDUCAO_ICMS, VLR_REDUCAO_ICMS, VLR_BASE_ICMS,'+
           ' PER_ICMS, VLR_ICMS, COD_GRUPO_ST, DES_GRUPO_ST, PER_MARGEM_ST, IND_ST, VLR_BASE_ST,'+
           ' PER_ST, VLR_ST, PER_REPASSE, VLR_REPASSE, COD_COMPROVANTE_ICMS, COD_REFERENCIA_FORN,'+
           ' COD_FORNECEDOR, DES_FORNECEDOR, TIP_PESSOA, DES_EMAIL, QTD_NR_DIAS, QTD_NR_MESES,'+
           ' QTD_TOT_MESES, COD_COMPRADOR, BLOB_TEXTO, IND_TRANSF, DTA_LIM_TRANSF, QTD_TRANSF,'+
           ' IND_USAR, IND_QTD_ACIMA, QTD_SUGERIDA_ANO, QTD_TRANSF_PERIODO, QTD_TRANSF_ANO,'+
           ' EST_MINIMO, DIAS_ESTOCAGEM, QTD_DEMANDA_DIA, QTD_DEMANDA_ANO, QTD_DIAS_ANO,'+
           ' DATAINCLUSAO, ESTADO, DATAALTERACAO)'+

           ' Select '+
           IntToStr(iNumSeq)+' NUM_SEQ,'+
           VarToStr(EdtSolicExpDoctoDestino.Value)+' NUM_DOCUMENTO,'+
           QuotedStr(sDta)+' DTA_DOCUMENTO,'+
           ' IND_OC_GERADA, DTA_OC_GERADA, NUM_OC_GERADA, OBS_OC, COD_EMPRESA,'+
           ' DES_EMPRESA, COD_ITEM, DES_ITEM, QTD_SUGERIDA, QTD_ACOMPRAR, QTD_SALDO,'+
           ' QTD_TRANSITO, QTD_DISPONIVEL, QTD_MEDIA_MES, QTD_MEDIA_DIA, QTD_DEM_MES1,'+
           ' QTD_DEM_MES2, QTD_DEM_MES3, QTD_DEM_MES4, QTD_DEM_MES5, QTD_DEM_MES6,'+
           ' QTD_DEM_MES7, QTD_DEM_MES8, UNI_COMPRA, UNI_VENDA, COD_BARRAS,'+
           ' COD_GRUPO, DES_GRUPO, COD_SUBGRUPO, DES_SUBGRUPO, DES_GENERICO,'+
           ' COD_APLICACAO, DES_APLICACAO, COD_REFERENCIA, CLA_CURVA_ABC,'+
           ' COD_FAMILIA_PRECO, DES_FAMILIA_PRECO, DTA_ULT_COMPRA,'+
           ' COD_FOR_ULT_COMPRA, DES_FOR_ULT_COMPRA, QTD_ULT_COMPRA,'+
           ' VLR_UNI_ULT_COMPRA, VLR_TOT_ULT_COMPRA, VLR_UNI_COMPRA,'+
           ' PER_DESCONTO, DTA_ULT_VENDA, COD_CLI_ULT_VENDA, DES_CLI_ULT_VENDA,'+
           ' QTD_ULT_VENDA, VLR_UNI_ULT_VENDA, VLR_TOT_ULT_VENDA, VLR_UNI_VENDA,'+
           ' COD_LISTA_VENDA, DES_LISTA_VENDA, COD_LISTA_COMPRA, DES_LISTA_COMPRA,'+
           ' VLR_CUSTO_MEDIO, VLR_TOT_VENDA, VLR_TOT_COMPRA, VLR_BRUTO,'+
           ' VLR_DESCONTOS, VLR_DESPESAS, VLR_FRETE, IND_SOMA_IPI_BASE_ICMS,'+
           ' IND_SOMA_FRETE_BASE_ICMS, IND_SOMA_DESPESA_BASE_ICMS,'+
           ' IND_SOMA_IPI_BASE_ST, IND_SOMA_FRETE_BASE_ST,'+
           ' IND_SOMA_DESPESA_BASE_ST, COD_SIT_TRIBUTARIA, COD_IPI, IND_IPI,'+
           ' PER_IPI, VLR_IPI, COD_ICMS, PER_REDUCAO_ICMS, VLR_REDUCAO_ICMS,'+
           ' VLR_BASE_ICMS, PER_ICMS, VLR_ICMS, COD_GRUPO_ST, DES_GRUPO_ST,'+
           ' PER_MARGEM_ST, IND_ST, VLR_BASE_ST, PER_ST, VLR_ST, PER_REPASSE,'+
           ' VLR_REPASSE, COD_COMPROVANTE_ICMS, COD_REFERENCIA_FORN, COD_FORNECEDOR,'+
           ' DES_FORNECEDOR, TIP_PESSOA, DES_EMAIL, QTD_NR_DIAS, QTD_NR_MESES,'+
           ' QTD_TOT_MESES,'+
           QuotedStr(sCodComprador)+' COD_COMPRADOR,'+
           ' o.blob_texto || ascii_char(13) || '' - ''||'+
           ' ''Transferido do Docto '+VarToStr(EdtSolicExpDoctoOrigem.Value)+
           ' para o Docto '+VarToStr(EdtSolicExpDoctoDestino.Value)+' por Odir em: ''||'+
           QuotedStr(DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)))+' BLOB_TEXTO,'+
           ' IND_TRANSF, DTA_LIM_TRANSF, QTD_TRANSF,'+
           ' IND_USAR, IND_QTD_ACIMA, QTD_SUGERIDA_ANO, QTD_TRANSF_PERIODO, QTD_TRANSF_ANO,'+
           ' EST_MINIMO, DIAS_ESTOCAGEM, QTD_DEMANDA_DIA, QTD_DEMANDA_ANO, QTD_DIAS_ANO,'+
           ' DATAINCLUSAO, ESTADO, DATAALTERACAO'+

           ' From OC_COMPRAR o'+
           ' Where o.num_documento='+QuotedStr(VarToStr(EdtSolicExpDoctoOrigem.Value))+
           ' And o.cod_item='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Item').AsString)+
           ' And o.cod_empresa='+QuotedStr(sCodEmp);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Delete o Produto no Documento ORIGEM ------------------------------------
    If Ckb_SolicExpExcProduto.Checked Then
    Begin
      MySql:=' Delete From OC_COMPRAR o'+
             ' Where o.num_documento='+QuotedStr(VarToStr(EdtSolicExpDoctoOrigem.Value))+
             ' And o.cod_item='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Item').AsString)+
             ' And o.cod_empresa='+QuotedStr(sCodEmp);
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End; // If Ckb_SolicExpExcProduto.Checked Then

  End; // Procedure InsereProduto;
  // Procedure Interna /////////////////////////////////////////////////////////

Begin
  Result:=False;

  sDta         :='';
  sCodComprador:='';

  // Se Só um Prtoduto =========================================================
  if Ckb_SolicExpSoProduto.Checked Then
  Begin
    // Busca Produto Destino - Já Gerou Ordem de Compra -----------------------
    MySql:=' Select o.num_oc_gerada'+
           ' From oc_comprar o'+
           ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value)+
           ' And o.cod_item='+QuotedStr(DMBelShop.IBQ_AComprarCOD_ITEM.AsString)+
           ' And o.cod_empresa='+QuotedStr(DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldBYName('num_oc_gerada').AsString)<>'' Then
    Begin
      DMBelShop.CDS_BuscaRapida.Close;
      msg('Impossível Exportar Este Produto !!'+cr+cr+'Destino com Ordem de Compra Já Gerada !!','A');
      EdtSolicExpDoctoDestino.SetFocus;
      Exit;
    End;

    DMBelShop.CDS_BuscaRapida.Close;
  End; // if Ckb_SolicExpSoProduto.Checked Then
  DMBelShop.CDS_BuscaRapida.Close;

  // Começa a Exportação =======================================================
  // Verificva se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao -----------------------------------------------------------
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Busca Num_Seq e Comprador do Documento de DESTINO -----------------------
    MySql:=' Select Coalesce(max(o.num_seq) ,1) num_seq'+
           ' From OC_COMPRAR o'+
           ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    iNumSeq:=DMBelShop.CDS_BuscaRapida.FieldBYName('Num_Seq').AsInteger;
    DMBelShop.CDS_BuscaRapida.Close;

    MySql:=' Select first 1 o.cod_comprador'+
           ' From OC_COMPRAR o'+
           ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sCodComprador:=DMBelShop.CDS_BuscaRapida.FieldBYName('cod_comprador').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    // Guarda Codigo da Empresa ------------------------------------------------
    sCodEmp:=DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString;

    // Exporta um Produto ======================================================
    if Ckb_SolicExpSoProduto.Checked Then
    Begin
      Inc(InumSeq);

      // Busca Data do Produto no Documento de DESTINO -------------------------
      MySql:=' Select substring(Cast(Max(o.dta_documento) as varchar(30))From 1 for 19) dta_documento'+
             ' From OC_COMPRAR o'+
             ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value)+
             ' And o.cod_item='+QuotedStr(DMBelShop.IBQ_AComprarCOD_ITEM.AsString);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      sDta:=DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
      If Trim(DMBelShop.CDS_BuscaRapida.FieldBYName('dta_documento').AsString)<>'' Then
       sDta   :=DMBelShop.CDS_BuscaRapida.FieldBYName('dta_documento').AsString;
      sDta   :=F_Troca('/','.',sDta);
      sDta   :=F_Troca('-','.',sDta);

      DMBelShop.CDS_BuscaRapida.Close;

      // Exclui Produto do Docto DESTINO ---------------------------------------
      MySql:=' Delete From oc_comprar o'+
             ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value)+
             ' And o.cod_item='+QuotedStr(DMBelShop.IBQ_AComprarCOD_ITEM.AsString)+
             ' And o.cod_empresa='+QuotedStr(DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString);
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Busca Produto do Docto ORIGEM -----------------------------------------
      MySql:=' Select *'+
             ' From oc_comprar o'+
             ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoOrigem.Value)+
             ' And o.cod_empresa='+QuotedStr(DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString)+
             ' And o.cod_item='+QuotedStr(DMBelShop.IBQ_AComprarCOD_ITEM.AsString);
      DMBelShop.CDS_Busca.Close;
      DMBelShop.SDS_Busca.CommandText:=MySql;
      DMBelShop.CDS_Busca.Open;

      // Insere Produto no Docto DESTINO ---------------------------------------
      InsereProduto;

      DMBelShop.CDS_Busca.Close;

    End; // if Ckb_SolicExpSoProduto.Checked Then

    // Exporta Todos Produtos ==================================================
    if Not Ckb_SolicExpSoProduto.Checked Then
    Begin
      // Busca Produtos do Docto ORIGEM ----------------------------------------
      MySql:=' Select *'+
             ' From oc_comprar o'+
             ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoOrigem.Value)+
             ' And o.cod_empresa='+QuotedStr(sCodEmp)+
             ' Order by o.Des_Item';
      DMBelShop.CDS_Busca.Close;
      DMBelShop.SDS_Busca.CommandText:=MySql;
      DMBelShop.CDS_Busca.Open;

      While Not DMBelShop.CDS_Busca.Eof do
      Begin
        Refresh;

        // Verifica se Pode Exportar -------------------------------------------
        If Trim(DMBelShop.CDS_Busca.FieldByName('NUM_OC_GERADA').AsString)='' Then
        Begin
          // Verifica se OC foi Gerada no DESTINO ------------------------------
          MySql:=' Select o.num_oc_gerada'+
                 ' From oc_comprar o'+
                 ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value)+
                 ' And o.cod_item='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Item').AsString)+
                 ' And o.cod_empresa='+QuotedStr(sCodEmp);
          DMBelShop.CDS_BuscaRapida.Close;
          DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
          DMBelShop.CDS_BuscaRapida.Open;

          If Trim(DMBelShop.CDS_BuscaRapida.FieldBYName('num_oc_gerada').AsString)='' Then
          Begin
            // Busca Data do Produto no Documento de DESTINO -------------------------
            MySql:=' Select substring(Cast(Max(o.dta_documento) as varchar(30))From 1 for 19) dta_documento'+
                   ' From OC_COMPRAR o'+
                   ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value)+
                   ' And o.cod_item='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Item').AsString);
            DMBelShop.CDS_BuscaRapida.Close;
            DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
            DMBelShop.CDS_BuscaRapida.Open;

            sDta:=DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
            If Trim(DMBelShop.CDS_BuscaRapida.FieldBYName('dta_documento').AsString)<>'' Then
             sDta   :=DMBelShop.CDS_BuscaRapida.FieldBYName('dta_documento').AsString;
            sDta   :=F_Troca('/','.',sDta);
            sDta   :=F_Troca('-','.',sDta);

            // Exclui Produto no Docto de DESTINO ----------------------------
            MySql:=' Delete From oc_comprar o'+
                   ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value)+
                   ' And o.cod_item='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Item').AsString)+
                   ' And o.cod_empresa='+QuotedStr(sCodEmp);
            DMBelShop.SQLC.Execute(MySql,nil,nil);

            // Exporta Produto -------------------------------------------------
            Inc(InumSeq);
            InsereProduto;
          End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldBYName('num_oc_gerada').AsString)='' Then
          DMBelShop.CDS_BuscaRapida.Close;

        End; // If Trim(DMBelShop.CDS_Busca.FieldByName('NUM_OC_GERADA').AsString)='' Then

        DMBelShop.CDS_Busca.Next;
      End; // While Not DMBelShop.CDS_Busca.Eof do
      DMBelShop.CDS_Busca.Close;
    End; // if Ckb_SolicExpSoProduto.Checked Then

    // Deleta OC_COMPRAR_DOCS ==================================================
    MySql:=' SELECT First 1 oc.num_documento'+
           ' FROM oc_comprar oc'+
           ' WHERE oc.num_documento='+VarToStr(EdtSolicExpDoctoOrigem.Value);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('num_documento').AsString)='' Then
     OC_COMPRAR_DOCS('D', VarToStr(EdtSolicExpDoctoOrigem.Value), '<>''Linx''');

    DMBelShop.CDS_BuscaRapida.Close;

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Result:=True;
    bgProcessar:=True;

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
    End; // on e : Exception do
  End; // Try

End; // Ordem de Compra - Exporta Documento para Outros >>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmSolicitacoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If bEnterTab Then
  Begin
    If Key = #13 Then
    Begin
      Key:=#0;
      SelectNext(ActiveControl,True,True);
    End;
  End;

end;

procedure TFrmSolicitacoes.PC_PrincipalChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Principal);

  If (PC_Principal.ActivePage=Ts_Odir) And (Ts_Odir.CanFocus) Then
   EdtUsuarioModelo.SetFocus;

  If (PC_Principal.ActivePage=Ts_SolicitacoesExporta) And (Ts_SolicitacoesExporta.CanFocus) Then
   EdtSolicExpDoctoDestino.SetFocus;

  If (PC_Principal.ActivePage=Ts_HabServ) And (Ts_HabServ.CanFocus) Then
  Begin
    If Gb_HabServDesc.Enabled Then
     EdtHabServDesc.SetFocus
    Else
     EdtHabServAbrev.SetFocus;
  End;

  If (PC_Principal.ActivePage=Ts_GeraOCLegendaCores) And (Ts_GeraOCLegendaCores.CanFocus) Then
  Begin
    Bt_GeraOCLegendaCoresVoltar.SetFocus;
  End;

  If (PC_Principal.ActivePage=Ts_ManutDiversas) And (Ts_ManutDiversas.CanFocus) Then
  Begin
    Try
      If (Gb_Desc10.Visible) and (Not EdtDesc10.ReadOnly) Then EdtDesc10.SetFocus;
      If (Gb_Desc9.Visible)  and (Not EdtDesc9.ReadOnly)  Then EdtDesc9.SetFocus;
      If (Gb_Desc8.Visible)  and (Not CkbDesc8.ReadOnly)  Then CkbDesc8.SetFocus;
      If (Gb_Desc7.Visible)  and (Not MeDesc7.ReadOnly)   Then MeDesc7.SetFocus;
      If (Gb_Desc6.Visible)  and (Not EdtDesc6.ReadOnly)  Then EdtDesc6.SetFocus;
      If (Gb_Desc5.Visible)  and (Not EdtDesc5.ReadOnly)  Then EdtDesc5.SetFocus;
      If (Gb_Desc4.Visible)  and (Not EdtDesc4.ReadOnly)  Then EdtDesc4.SetFocus;
      If (Gb_Desc3.Visible)  and (Not EdtDesc3.ReadOnly)  Then EdtDesc3.SetFocus;
      If (Gb_Desc2.Visible)  and (Not EdtDesc2.ReadOnly)  Then EdtDesc2.SetFocus;
      If (Gb_Desc1.Visible)  and (Not EdtDesc1.ReadOnly)  Then EdtDesc1.SetFocus;
    Except
      Bt_ManutDiversosVoltar.SetFocus;
    End;
  End;

  If (PC_Principal.ActivePage=Ts_ParametrosGerenciador) And (Ts_ParametrosGerenciador.CanFocus) Then
   PC_ParametrosChange(Self);

  If (PC_Principal.ActivePage=Ts_Vales) And (Ts_Vales.CanFocus) Then
  Begin
    If (EdtValesCodLoja.Visible) and (Not EdtValesCodLoja.ReadOnly) Then EdtValesCodLoja.SetFocus
    Else If (EdtValesCodProf.Visible) and (Not EdtValesCodLoja.ReadOnly) Then EdtValesCodProf.SetFocus
    Else If (EdtValesDocto.Visible)   and (Not EdtValesDocto.Properties.ReadOnly)   Then EdtValesDocto.SetFocus
    Else Dbg_ValesParcelas.SetFocus;
  End;

  If (PC_Principal.ActivePage=Ts_SolicitFornLojas) And (Ts_SolicitFornLojas.CanFocus) Then
   Dbg_SolicitFornLojas.SetFocus;

  If (PC_Principal.ActivePage=Ts_ProfSelecina) And (Ts_ProfSelecina.CanFocus) Then
   EdtProfSelecionaNome.SetFocus;

  If (PC_Principal.ActivePage=Ts_MargemLucroFormulas) And (Ts_MargemLucroFormulas.CanFocus) Then
   Bt_FormulaVoltar.SetFocus;

  If (PC_Principal.ActivePage=Ts_ApresentaGrid) And (Ts_ApresentaGrid.CanFocus) Then
  Begin
    Dbg_ApresGrid.SetFocus;
  End;

  If (PC_Principal.ActivePage=Ts_ProSoftImpArquivo) And (Ts_ProSoftImpArquivo.CanFocus) Then
   Bt_ProSoftImpArquivo.SetFocus;

  If (PC_Principal.ActivePage=Ts_PlanilhaFinanceira) And (Ts_PlanilhaFinanceira.CanFocus) Then
  Begin
    PC_FinanPlanFinanceiraSolicitaChange(Self);
  End;

  If (PC_Principal.ActivePage=Ts_ReposLojasDigita) And (Ts_ReposLojasDigita.CanFocus) Then
  Begin
    If EdtReposLojasSeq.AsInteger=0 Then
     Begin
       EdtReposLojasSeq.SetFocus;
     End
    Else
     Begin
       EdtReposLojasSeqExit(Self);
       EdtReposLojasQtdReposicao.SetFocus;
     End;
  End;
end;

procedure TFrmSolicitacoes.Bt_SolicExpVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSolicitacoes.Ckb_SolicExpSoProdutoClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_SolicExpSoProduto);

  If Ckb_SolicExpSoProduto.Checked Then
   Begin
     EdtSolicExpTpExportacao.Text:=DMBelShop.IBQ_AComprarCOD_ITEM.AsString+' - '+ 
                                   DMBelShop.IBQ_AComprarDES_ITEM.AsString;
     EdtSolicExpTpExportacao.Color:=$00FF8000;
   End
  Else
   Begin
     EdtSolicExpTpExportacao.Text:='TODOS OS PRODUTOS';
     EdtSolicExpTpExportacao.Color:=clRed;
   End; // If Ckb_SolicExpSoProduto.Checked Then
   
end;

procedure TFrmSolicitacoes.Bt_SoliciExpExportarClick(Sender: TObject);
Var
  MySql: String;
begin
  EdtSolicExpDoctoDestino.SetFocus;
  
  If EdtSolicExpDoctoDestino.AsInteger=0 Then
  Begin
    msg('Favor Informar o Número do'+cr+cr+'Documento de Destino !!','A');
    EdtSolicExpDoctoDestino.SetFocus;
    Exit;
  End;

  // Verifica se Existe o Docto de Destino ===================================== 
  MySql:=' Select o.num_seq'+
         ' From oc_comprar o'+
         ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('num_seq').AsString)='' Then
  Begin
    DMBelShop.CDS_BuscaRapida.Close;
    msg('Documento de DESTINO Não Existe !!','A');
    EdtSolicExpDoctoDestino.SetFocus;
    Exit;
  End;
  DMBelShop.CDS_BuscaRapida.Close;

  If Ckb_SolicExpSoProduto.Checked Then
   Begin
     If Trim(DMBelShop.IBQ_AComprarNUM_OC_GERADA.AsString)<>'' Then
     Begin
       msg('Impossível Exportar Este Produto !!'+cr+cr+'Ordem de Compra Já Gerada !!','A');
       Ckb_SolicExpSoProduto.SetFocus;
       Exit;
     End;
   
     If msg('Deseja Realmente Exportar o Produto:'+cr+cr+EdtSolicExpTpExportacao.Text+' ??','C')=2 Then
     Begin
       Ckb_SolicExpSoProduto.SetFocus;
       Exit;
     End;
   End
  Else // If Ckb_SolicExpSoProduto.Checked Then
   Begin
     If msg('Deseja Realmente Exportar'+cr+cr+EdtSolicExpTpExportacao.Text+' ??','C')=2 Then
     Begin
       Ckb_SolicExpSoProduto.SetFocus;
       Exit;
     End;

     If msg('Transferir TODOS os Produtos da Loja :'+DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString+cr+
            DMBelShop.IBQ_AComprarDES_EMPRESA.AsString+cr+cr+'Esta CORRETO ??','C')=2 Then
     Begin
       Ckb_SolicExpSoProduto.SetFocus;
       Exit;
     End;
     
   End; // If Ckb_SolicExpSoProduto.Checked Then

  // Exporta Documento =========================================================
  PainelApresExp.Caption:='AGUARDE !! Exportando Empresa: '+
                               DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString+' - '+
                               DMBelShop.IBQ_AComprarDES_EMPRESA.AsString;
  PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
  PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
  PainelApresExp.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-PainelApresExp.Height)/2));
  PainelApresExp.Color:=clSilver;
  PainelApresExp.Font.Style:=[fsBold];
  PainelApresExp.Parent:=FrmSolicitacoes;
  PainelApresExp.Visible:=True;
  Refresh;
  
  If OcExportaDocumento Then
  Begin
    PainelApresExp.Visible:=False;
    Refresh;
    msg('Exportação Efetuada com SUCESSO !!','A');
    Bt_SolicExpVoltarClick(Self);
  End;
  PainelApresExp.Visible:=False;
  Refresh;
  
end;

procedure TFrmSolicitacoes.Ckb_SolicExpSoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_SolicExpSoProdutoClick(sELF);

end;

procedure TFrmSolicitacoes.EdtSolicExpDoctoDestinoExit(Sender: TObject);
begin
  If EdtSolicExpDoctoOrigem.Value=EdtSolicExpDoctoDestino.Value Then
  Begin
    msg('Impossível Exportar'+cr+'para o Mesmo Documento !!','A');
    EdtSolicExpDoctoDestino.Value:=0;
    EdtSolicExpDoctoDestino.SetFocus;
    Exit;
  End;
end;

procedure TFrmSolicitacoes.FormShow(Sender: TObject);
begin
  PC_PrincipalChange(Self);
end;

procedure TFrmSolicitacoes.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Não Permite Sair com Ctrl+F4
  Application.OnMessage := AppMessage;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Balão ///////////////////////////////////////////////
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ValesSalvar.Handle, @ti, TipoDoIcone, 'Salva Tudo', 'SALVAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ValesVoltar.Handle, @ti, TipoDoIcone, 'Abandona Tudo', 'VOLTAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Dbg_ValesParcelas.Handle, @ti, TipoDoIcone, '<Duplo Clique> Para Selecionar', 'ALTERAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ReposLojasAlterar.Handle, @ti, TipoDoIcone, 'Altera Qtd de Reposição', 'ALTERAR');

  bEnterTab:=True;

  // Painel Exposicao de Informação de Processamento ===========================
  PainelApresExp.Color:=$00F3F3F3;
  PainelApresExp.Height:=42;

  bRelSimples:=False;
  bgFechaRepos:=False;
end;

procedure TFrmSolicitacoes.Ckb_SolicExpExcProdutoClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_SolicExpExcProduto);

end;

procedure TFrmSolicitacoes.Ckb_SolicExpExcProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AcertaCkb_SN(Ckb_SolicExpExcProduto);

end;

procedure TFrmSolicitacoes.Bt_FinanObjetivosHabDeVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSolicitacoes.Ckb_FinanObjetivosHabDesObjetivosClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_FinanObjetivosHabDesObjetivos);

  If Ckb_FinanObjetivosHabDesObjetivos.Checked Then
   Lb_FinanObjetivosHabDesObjetivos.Color:=$00DADADA
  Else
   Lb_FinanObjetivosHabDesObjetivos.Color:=clBtnFace;
end;

procedure TFrmSolicitacoes.Ckb_FinanObjetivosHabDesDiariosClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_FinanObjetivosHabDesDiarios);

  If Ckb_FinanObjetivosHabDesDiarios.Checked Then
   Lb_FinanObjetivosHabDesDiarios.Color:=$00DADADA
  Else
   Lb_FinanObjetivosHabDesDiarios.Color:=clBtnFace;

end;

procedure TFrmSolicitacoes.Ckb_FinanObjetivosHabDesRealizadosClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_FinanObjetivosHabDesRealizados);

  If Ckb_FinanObjetivosHabDesRealizados.Checked Then
   Lb_FinanObjetivosHabDesRealizados.Color:=$00DADADA
  Else
   Lb_FinanObjetivosHabDesRealizados.Color:=clBtnFace;
end;

procedure TFrmSolicitacoes.Ckb_FinanObjetivosHabDesResultadosClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_FinanObjetivosHabDesResultados);

  If Ckb_FinanObjetivosHabDesResultados.Checked Then
   Lb_FinanObjetivosHabDesResultados.Color:=$00DADADA
  Else
   Lb_FinanObjetivosHabDesResultados.Color:=clBtnFace;
end;

procedure TFrmSolicitacoes.Ckb_FinanObjetivosHabDesPercentuaisClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_FinanObjetivosHabDesPercentuais);

  If Ckb_FinanObjetivosHabDesPercentuais.Checked Then
   Lb_FinanObjetivosHabDesPercentuais.Color:=$00DADADA
  Else
   Lb_FinanObjetivosHabDesPercentuais.Color:=clBtnFace;
end;

procedure TFrmSolicitacoes.Ckb_FinanObjetivosHabDesPercentuaisKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_FinanObjetivosHabDesPercentuaisClick(Self);
end;

procedure TFrmSolicitacoes.Ckb_FinanObjetivosHabDesResultadosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_FinanObjetivosHabDesResultadosClick(Self);

end;

procedure TFrmSolicitacoes.Ckb_FinanObjetivosHabDesRealizadosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_FinanObjetivosHabDesRealizadosClick(Self);

end;

procedure TFrmSolicitacoes.Ckb_FinanObjetivosHabDesDiariosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_FinanObjetivosHabDesDiariosClick(Self);

end;

procedure TFrmSolicitacoes.Ckb_FinanObjetivosHabDesObjetivosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_FinanObjetivosHabDesObjetivosClick(Self);

end;
    
procedure TFrmSolicitacoes.Bt_FinanObjetivosHabDeOKClick(Sender: TObject);
begin
  bgProcessar:=True;

  Close;
end;

procedure TFrmSolicitacoes.Bt_QtdCaixaCDVoltarClick(Sender: TObject);
begin
  Close;

end;

procedure TFrmSolicitacoes.Bt_AtualizaSIDICOMCurvaABCEnderecoOKClick(Sender: TObject);
begin
  bgProcessar:=True;

  Close;

end;

procedure TFrmSolicitacoes.Bt_GeraOCLegendaCoresVoltarClick(Sender: TObject);
begin
  Close;

end;

procedure TFrmSolicitacoes.Bt_FinanFechaCaixaVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSolicitacoes.mem_FinanFechaCaixaChange(Sender: TObject);
begin
  Stg_FinanFechaCaixaCalendario.Invalidate;

end;

procedure TFrmSolicitacoes.Bt_FinanFechaCaixaAnteriorClick(Sender: TObject);
begin
  PrimeiroDiaMes := IncMonth(PrimeiroDiaMes, -1);
  MovtoCaixaDiaDesenharCalendario;

end;

procedure TFrmSolicitacoes.Bt_FinanFechaCaixaProximoClick(Sender: TObject);
begin
  PrimeiroDiaMes := IncMonth(PrimeiroDiaMes, 1);
  MovtoCaixaDiaDesenharCalendario;

end;

procedure TFrmSolicitacoes.Stg_FinanFechaCaixaCalendarioDrawCell(Sender: TObject; ACol,
                     ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DiaGrid : string;
  AlturaGrid, LarguraGrid, TopGrid, LeftGrid : Integer;
  Data : TDateTime;
Const
  ArrayCores : array [0..4] of TColor = (clRed, $0000A600, $00FF8000, $00FFC794, $0004FFFF);//$00FFFF80);
  // 0 = clRed  = Importador e Não Lançado
  // 1 = $0000A600 = Importado e Lancado
  // 2 = $00FF8000 =  Fechado Sem Diferença
  // 3 = 00FFC794 =  Fechado Com Diferença
  // 4 = $0004FFFF =  Sem Vendas
begin
  with Stg_FinanFechaCaixaCalendario do
  begin
    //Limpando o Calendário Para Recria-lo
    Canvas.Brush.Color := clWhite;
    Canvas.Pen.Color   := clWhite;
    Canvas.Font.Style  := [];
    Canvas.Font.Color  := clBlack;
    Canvas.FillRect(Rect);
    DiaGrid := Cells[aCol, aRow];
    
    //Senão for Cabeçalho dos Dias da Semana
    if aRow > 0 then 
    begin
      Data := StrToDate(DiaGrid);
      DiaGrid := IntToStr(DayOf(Data));
      
      //Checa se os Dias São do Mês Selecionado
      if MonthOf(Data) = MonthOf(PrimeiroDiaMes) then
      begin
        //Pintando a Data Atual
        if Data = Date then
        begin
          // Dia de Hoje
          // Canvas.Brush.Color := $00E9E9E9; // $00FFC794;
          Canvas.Font.Style := [fsBold];
          Canvas.Font.Size  := 12;
          Canvas.Rectangle(Rect);
        end;

        //Pintando Data Selecionada
        if gdSelected in State then
        Begin
          // Movimento no Calendário
          Canvas.Brush.Color := $00E9E9E9; // $00FFC794;
          Canvas.Font.Color  := clBlack;
          Canvas.Font.Style  := [fsBold];
          Canvas.Font.Size  := 8;
          Canvas.Rectangle(Rect);
        end;

        // Se existir evento na data
        iTipo:=5;
        If CDS_.Locate('Data',DateToStr(Data),[]) Then
         iTipo:=CDS_.FieldByName('COR').AsInteger;

        if mem_FinanFechaCaixa.Lines.IndexOf(DateToStr(Data)) >= 0 then
        begin
          if gdSelected in State then
          begin
            If iTipo<>5 Then
            Begin
              Canvas.Brush.Color :=ArrayCores[iTipo]; //Odir
              Canvas.Font.Color  :=clWhite;     //Odir

              If (iTipo in [3..4]) then
               Canvas.Font.Color  :=clWindowText;     //Odir

            End;
          end
          else // if gdSelected in State then
          begin
            If iTipo<>5 Then
            Begin
              Canvas.Brush.Color :=ArrayCores[iTipo]; //Odir
              Canvas.Font.Color  :=clWhite;     //Odir

              If (iTipo in [3..4]) then
               Canvas.Font.Color  :=clWindowText;     //Odir
            End;
          end; // if gdSelected in State then

          Canvas.Font.Style  :=[fsBold];  //Fonte em Negrito
          Canvas.Rectangle(Rect);         //Pintando em Forma de Retangulo
        end; // if mem_FinanFechaCaixa.Lines.IndexOf(DateToStr(Data)) >= 0 then
      end
      else // if MonthOf(Data) = MonthOf(PrimeiroDiaMes) then
      begin
        //Deixando Cinza as Dia Que Não São do Mês Selecionado
        Canvas.Brush.Color :=clWhite;
        Canvas.Font.Color  :=clSilver;
      end; // if MonthOf(Data) = MonthOf(PrimeiroDiaMes) then
    end
    else // if aRow > 0 then //Se for Cabeçalho dos Dias da Semana
    begin
      Data := 0;
      Canvas.Font.Color := clRed;
      Canvas.Font.Style :=[fsBold];
    end; // if aRow > 0 then

    //Desenhando o Calendario e Colocando os Dias, Altura, Largura e Posição
    AlturaGrid  := Canvas.TextHeight(DiaGrid);
    LarguraGrid := Canvas.TextWidth(DiaGrid);
    LeftGrid    := Rect.Left + (ColWidths[ACol]  - LarguraGrid) div 2;
    TopGrid     := Rect.Top  + (RowHeights[ARow] - AlturaGrid) div 2;
    Canvas.Rectangle(Classes.Rect(Rect.Left + 2, Rect.Top + 2, Rect.Right - 2, Rect.Bottom - 2));
    Canvas.TextOut(LeftGrid, TopGrid, DiaGrid);
  end; // with CalendarGrid do
end;

procedure TFrmSolicitacoes.Ts_FinanFechaCaixaLanctosShow(Sender: TObject);
var
  i: Integer;
begin
  // Monstando o Cabeçalho da Semana ( Seg / Terc / Quart...)
  with Stg_FinanFechaCaixaCalendario do
  begin
    for i := 1 to 7 do begin
      Cells[i-1, 0] := AnsiUpperCaseFileName(ShortDayNames[i]);
    end;
  end;

  // Pega o Primeiro dia do Mes do Date
  // Pega a Data se estiver 20/01/2009 ai Fica 01/01/2009)
  // entao a variavel PrimeiroDiaMes :=1
//  PrimeiroDiaMes := RecodeDay(Date, 1);
  PrimeiroDiaMes := RecodeDay(dgDtaCalendario, 1);
  MovtoCaixaDiaDesenharCalendario;

end;

procedure TFrmSolicitacoes.Bt_MargemLucroOKClick(Sender: TObject);
begin

  If Cbx_MargemLucroApres.ItemIndex<0 Then
  Begin
    msg('Selecione o Tipo de Apresentação !!','A');
    Cbx_MargemLucroApres.SetFocus;
    Exit;
  End;

  // Periodo de Saídas
  Try
    StrToDate(DtEdt_MargemLucroDtaInicioVen.Text);
  Except
    msg('Data Inicial do Período Inválida !!','A');
    DtEdt_MargemLucroDtaInicioVen.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_MargemLucroDtaFimVen.Text);
  Except
    msg('Data Final do Período Inválida !!','A');
    DtEdt_MargemLucroDtaFimVen.SetFocus;
    Exit;
  End;

  If DtEdt_MargemLucroDtaFimVen.Date<DtEdt_MargemLucroDtaInicioVen.Date Then
  Begin
    msg('Período Inválido !!','A');
    DtEdt_MargemLucroDtaInicioVen.SetFocus;
    Exit;
  End;

  // Periodo de Entradas
  If Gb_MargemLucroPeriodoEntradas.Visible Then
  Begin
    Try
      StrToDate(DtEdt_MargemLucroDtaInicioEnt.Text);
    Except
      msg('Data Inicial do Período Inválida !!','A');
      DtEdt_MargemLucroDtaInicioEnt.SetFocus;
      Exit;
    End;

    Try
      StrToDate(DtEdt_MargemLucroDtaFimEnt.Text);
    Except
      msg('Data Final do Período Inválida !!','A');
      DtEdt_MargemLucroDtaFimEnt.SetFocus;
      Exit;
    End;

    If DtEdt_MargemLucroDtaFimEnt.Date<DtEdt_MargemLucroDtaInicioEnt.Date Then
    Begin
      msg('Período Inválido !!','A');
      DtEdt_MargemLucroDtaInicioEnt.SetFocus;
      Exit;
    End;
  End; // If Gb_MargemLucroPeriodoEntradas.Visible Then

  If msg('As Informações Estão CORRETAS ??','C')=2 Then
  Begin
    Cbx_MargemLucroApres.SetFocus;
    Exit;
  End;

  bgProcessar:=True;

  Close;

end;

procedure TFrmSolicitacoes.Bt_MargemLucroVoltarClick(Sender: TObject);
begin
  Close;

end;

procedure TFrmSolicitacoes.Cbx_MargemLucroApresChange(Sender: TObject);
Var
  s: String;
begin
  Pan_MargemLucroPcCustoTE.Visible:=False;
//  Ckb_MargemLucroPcCustoTE.Checked:=False;
  Gb_MargemLucroPeriodoEntradas.Visible:=False;
  If (Cbx_MargemLucroApres.ItemIndex in [0,1,4,5]) Then
  Begin
    AtualizaPeriodoAno(Now, s);
    s:=Trim(f_Troca('Between','',s));
    s:=Trim(f_Troca('''','',s));
    DtEdt_MargemLucroDtaInicioEnt.Date:=StrToDate(Copy(s,1,10));
    DtEdt_MargemLucroDtaFimEnt.Date:=StrToDate(Copy(s,16,10));
    Gb_MargemLucroPeriodoEntradas.Visible:=True;

    Pan_MargemLucroPcCustoTE.Visible:=True;
    If (Cbx_MargemLucroApres.ItemIndex in [0,1]) Then
     Lb_MargemLucroPcCustoTE.Caption:='Usar CUSTO MÉDIO das Últimas Compras nas Transferencias ?';
    If (Cbx_MargemLucroApres.ItemIndex in [4,5]) Then
     Lb_MargemLucroPcCustoTE.Caption:='Usar PREÇO DE CUSTO da Última Compra nas Transferencias ?';
  End;

  SelectNext(ActiveControl,True,True);

end;

procedure TFrmSolicitacoes.Ts_MargemLucroShow(Sender: TObject);
begin
  Cbx_MargemLucroApres.SetFocus;
end;

procedure TFrmSolicitacoes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // Retorna Permissão de Sair com Ctrl+F4
  Application.OnMessage := nil;

  If GridNew<>nil Then
   FreeAndNil(GridNew);
end;

procedure TFrmSolicitacoes.Bt_FormulaVoltarClick(Sender: TObject);
begin
  Close;

end;

procedure TFrmSolicitacoes.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmSolicitacoes.DtEdt_MargemLucroDtaFimVenPropertiesEditValueChanged(Sender: TObject);
begin
  If Gb_MargemLucroPeriodoEntradas.Visible Then
  Begin
    DecodeDate(DtEdt_MargemLucroDtaInicioVen.Date, wgAnoH, wgMesH, wgDiaH);
    DtEdt_MargemLucroDtaInicioEnt.Date:=EncodeDate(wgAnoH-1, wgMesH, wgDiaH);
    DtEdt_MargemLucroDtaFimEnt.Date:=DtEdt_MargemLucroDtaInicioVen.Date-1;
  End; // If Gb_MargemLucroPeriodoEntradas.Visible Then
end;

procedure TFrmSolicitacoes.Bt_HabServVoltarClick(Sender: TObject);
begin
  bgProcessar:=False;
  Close;
end;

procedure TFrmSolicitacoes.Bt_HabServSalvarClick(Sender: TObject);
Var
 sTipo, MySql: String;
begin

  EdtHabServDesc.Text:=Trim(EdtHabServDesc.Text);

  // Verifica Código SIDICOM ===================================================
  If Ts_HabServ.Caption='Serviço' Then
  Begin
    If Trim(EdtHabServCodSidicom.Text)<>'' Then
    Begin
      MySql:=' SELECT p.codproduto'+
             ' FROM produto p'+
             ' WHERE p.codproduto='+QuotedStr(EdtHabServCodSidicom.Text)+
             ' AND p.principalfor in (''000500'',''000883'')';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('codproduto').AsString)='' Then
      Begin
        msg('Produto Não Existe no SIDICOM !!','A');
        DMBelShop.CDS_BuscaRapida.Close;
        EdtHabServCodSidicom.SetFocus;
        Exit;
      End;
      DMBelShop.CDS_BuscaRapida.Close;

      // Verifica já Cadastrado ==================================================
      MySql:=' SELECT hs.cod_sidicom,'+
             ' Case hs.tip_habserv'+
             '   When ''H'' Then ''Habilidade'''+
             '   When ''S'' Then ''Serviço'''+
             ' End tip_habserv'+
             ' FROM SAL_HAB_SERV hs'+
             ' WHERE hs.cod_sidicom='+QuotedStr(EdtHabServCodSidicom.Text)+
             ' AND hs.cod_habserv<>'+QuotedStr(EdtHabServCodigo.Text);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('cod_sidicom').AsString)<>'' Then
      Begin
        msg('Item Já Cadastrado como'+cr+DMBelShop.CDS_BuscaRapida.FieldByName('tip_habserv').AsString+' !!','A');
        DMBelShop.CDS_BuscaRapida.Close;
        EdtHabServCodSidicom.SetFocus;
        Exit;
      End;
      DMBelShop.CDS_BuscaRapida.Close;
    End; // If Trim(EdtHabServCodSidicom.Text)<>'' Then

    If EdtHabServPreco.Value=0.00 Then
    Begin
      msg('Favor Informar o Preço !!','A');
      EdtHabServPreco.SetFocus;
      Exit;
    End;

  End; // If Ts_HabServ.Caption:='Serviço' Then

  If Trim(EdtHabServDesc.Text)='' Then
  Begin
    msg('Favor Informar a Descrição !!','A');
    EdtHabServDesc.SetFocus;
    Exit;
  End;

  If (Gb_HabServAbrev.Visible) and (Trim(EdtHabServAbrev.Text)='') Then
  Begin
    msg('Favor Informar a Abreviatura !!','A');
    EdtHabServAbrev.SetFocus;
    Exit;
  End;

  //============================================================================
  // INCLUSÃO ==================================================================
  //============================================================================
  If Bt_HabServSalvar.Caption='Incluir' Then
  Begin
    // Consiste Habilidade =====================================================
    If Ts_HabServ.Caption='Habilidade' Then
    Begin
      If Not DMSalao.CDS_Habilidades.IsEmpty Then
      Begin
        // Verifica se Já Existe ------------------------------------
        If DMSalao.CDS_Habilidades.Locate('Des_Habilidade',EdtHabServDesc.Text,[]) Then
        Begin
          msg(Ts_HabServ.Caption+' Já Existente !!','A');
          EdtHabServDesc.SetFocus;
          Exit;
        End; // If Not DMSalao.CDS_Habilidades.IsEmpty Then
      End; // If Not DMSalao.CDS_Habilidades.IsEmpty Then
    End; // If Ts_HabServ.Caption='Habilidade' Then

    // Consiste Serviço ========================================================
    If Ts_HabServ.Caption='Serviço' Then
    Begin
      // Verifica se Já Existe ------------------------------------
      MySql:=' SELECT s.des_habserv'+
             ' FROM SAL_HAB_SERV s'+
             ' WHERE s.tip_habserv=''S'''+
             ' AND s.des_habserv='+QuotedStr(EdtHabServDesc.Text);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('des_habserv').AsString)<>'' Then
      Begin
        DMBelShop.CDS_BuscaRapida.Close;
        If msg('Esta Descrição de Serviço Já Existente !!'+cr+cr+'Deseja Cadastrar Assim Mesmo ??','C')=2 Then
        Begin
          EdtHabServDesc.SetFocus;
          Exit;
        End;
      End;
      DMBelShop.CDS_BuscaRapida.Close;

      If EdtHabServPreco.Value=0.00 Then
      Begin
        msg('Favor Informar o Preço !!','A');
        EdtHabServPreco.SetFocus;
        Exit;
      End;

    End; // If Ts_HabServ.Caption='Serviço' Then
  End; // If Bt_HabServSalvar.Caption='Incluir' Then

  //============================================================================
  // ALTERAÇÃO =================================================================
  //============================================================================
  If Bt_HabServSalvar.Caption='Alterar' Then
  Begin
    // Consiste Habilidade/Servico ----------------------------------
    If Ts_HabServ.Caption='Habilidade' Then sTipo:='H';
    If Ts_HabServ.Caption='Serviço'    Then sTipo:='S';

    // Verifica se Já Existe ------------------------------------
    MySql:=' SELECT h.des_habserv'+
           ' FROM SAL_HAB_SERV h'+
           ' WHERE h.tip_habserv='+QuotedStr(sTipo)+
           ' AND h.cod_habserv<>'+QuotedStr(VarToStr(EdtHabServCodigo.AsInteger))+
           ' AND h.des_habserv='+QuotedStr(EdtHabServDesc.Text);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('des_habserv').AsString)<>'' Then
    Begin
      DMBelShop.CDS_BuscaRapida.Close;
      msg(Ts_HabServ.Caption+' Já Existente !!','A');
      EdtHabServDesc.SetFocus;
      Exit;
    End;
    DMBelShop.CDS_BuscaRapida.Close;
  End; // If Bt_HabServSalvar.Caption='Alterar' Then

  bgProcessar:=True;
  Close;

end;

procedure TFrmSolicitacoes.Ckb_HabServAtivoClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_HabServAtivo);

  // Consiste Atividade -------------------------------------------
  If Bt_HabServSalvar.Caption='Alterar' Then
  Begin
    Gb_HabServAtivoAltera.Visible:=False;

    If bgCkbChecado<>Ckb_HabServAtivo.Checked Then
    Begin
      Gb_HabServAtivoAltera.Visible:=True;
      Ckb_HabServAtivoAltera.Checked:=False;
      Ckb_HabServAtivoAltera.Font.Color:=clRed;
      Ckb_HabServAtivoAlteraClick(Self);

      If Ts_HabServ.Caption='Habilidade' Then
       Lb_HabServAtivoAltera.Caption:='Alterar Todos os Profissionais que Utilizam esta '+
                                      Ts_HabServ.Caption+' para Ativo = '+Ckb_HabServAtivo.Caption+' ?';

      If Ts_HabServ.Caption='Serviço' Then
      Begin
        Lb_HabServAtivoAltera.Caption:='Alterar Todos os Profissionais que Utilizam este '+
                                      Ts_HabServ.Caption+' para Ativo = '+Ckb_HabServAtivo.Caption+' ?';
        Ckb_HabServAtivoAltera.Left:=448;
      End;
      Ckb_HabServAtivoAlteraClick(Self);
      Ckb_HabServAtivoAltera.SetFocus;
    End; //  // bgCkbChecado<>Ckb_HabServAtivo.Checked Then
  End; // If Bt_HabServSalvar.Caption='Alterar' Then
end;

procedure TFrmSolicitacoes.Ckb_HabServAtivoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_HabServAtivoClick(Self);
end;

procedure TFrmSolicitacoes.Bt_HabServLocalizaSidicomClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtHabServCodSidicom.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.apresentacao Descricao, p.codproduto Codigo'+
         ' FROM produto p'+
         ' WHERE COALESCE(p.situacaopro,0)=0'+
         ' AND p.principalfor in (''000500'',''000883'')'+
         ' AND NOT EXISTS'+
         ' ( SELECT 1'+
         '   FROM sal_hab_serv_link l, sal_hab_serv h'+
         '   WHERE l.cod_habilidade=h.cod_habserv'+
         '   AND   h.tip_habserv=''H'''+
         '   AND   h.cod_sidicom=p.codproduto'+
         ' )'+
         ' AND NOT EXISTS'+
         ' ( SELECT 1'+
         '   FROM sal_hab_serv_link l, sal_hab_serv s'+
         '   WHERE l.cod_servico=s.cod_habserv'+
         '   AND   s.tip_habserv=''S'''+
         '   AND   s.cod_sidicom=p.codproduto'+
         ' )'+
         ' ORDER BY p.apresentacao';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Codigo').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Produto a Listar !!','A');
    EdtHabServCodSidicom.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Descricao';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Descricao';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    If sgCodProd<>FrmPesquisa.EdtCodigo.Text Then
    Begin
      EdtHabServCodSidicom.Text:=FrmPesquisa.EdtCodigo.Text;
      EdtHabServDesc.Text:=FrmPesquisa.EdtDescricao.Text;
      EdtHabServDesc.SetFocus;
    End;
  End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmSolicitacoes.EdtHabServCodSidicomExit(Sender: TObject);
Var
  MySql: String;
begin
  If Trim(EdtHabServCodSidicom.Text)<>'' Then
  Begin
    MySql:=' SELECT p.codproduto, p.apresentacao'+
           ' FROM produto p'+
           ' WHERE p.codproduto='+QuotedStr(EdtHabServCodSidicom.Text)+
           ' AND p.principalfor in (''000500'',''000883'')';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('codproduto').AsString)='' Then
    Begin
      msg('Produto Não Existe no SIDICOM !!','A');
      DMBelShop.CDS_BuscaRapida.Close;
      EdtHabServCodSidicom.Text:=sgCodProd;
      EdtHabServCodSidicom.SetFocus;
      Exit;
    End;

    If sgCodProd<>Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodProduto').AsString) Then
    Begin
      EdtHabServCodSidicom.Text:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodProduto').AsString);
      EdtHabServDesc.Text:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Apresentacao').AsString);
    End;
    EdtHabServDesc.SetFocus;

    DMBelShop.CDS_BuscaRapida.Close;
  End; // If Trim(EdtHabServCodSidicom.Text)<>'' Then
end;

procedure TFrmSolicitacoes.EdtHabServCodSidicomEnter(Sender: TObject);
begin
  sgCodProd:=Trim(EdtHabServCodSidicom.Text)
end;

procedure TFrmSolicitacoes.Bt_IBGEVoltarClick(Sender: TObject);
begin
  bgProcessar:=False;
  Close;

end;

procedure TFrmSolicitacoes.Bt_IBGESelecionarClick(Sender: TObject);
begin
  bgProcessar:=True;
  Close;

end;

procedure TFrmSolicitacoes.Dbg_IBGE1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sIBGE: String;
begin
  If Key=VK_F4 Then
  Begin
    sIBGE:='';
    If InputQuery('Localizar Endereço','',sIBGE) then
    Begin
      if Trim(sIBGE)<>'' then
      Begin
        sIBGE:=AnsiUpperCase(sIBGE);

        LocalizaRegistro(DMSalao.CDS_V_RetornoIBGE, 'Endereco', sIBGE);
      End; // if Trim(sIBGE)<>'' then
    End; // If InputQuery('Localizar Endereço','',sIBGE) then
  End; // If Key=VK_F4 Then
End;

procedure TFrmSolicitacoes.Bt_ManutDiversosVoltarClick(Sender: TObject);
begin
  bgProcessar:=False;
  Close;

end;

procedure TFrmSolicitacoes.Bt_ManutDiversosDMLClick(Sender: TObject);
begin

  If Trim(sgComponentesConsiste)<>'' Then
  Begin
    If Not ConsisteComponentesManutDiversas Then
     Exit;
  End;

  bgProcessar:=True;
  Close;

end;

procedure TFrmSolicitacoes.CkbDesc8Click(Sender: TObject);
begin
  AcertaCkb_SN(CkbDesc8);
end;

procedure TFrmSolicitacoes.CkbDesc8KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AcertaCkb_SN(CkbDesc8);
end;

procedure TFrmSolicitacoes.Ts_HabServEnter(Sender: TObject);
begin
  bgCkbChecado:=Ckb_HabServAtivo.Checked;
end;

procedure TFrmSolicitacoes.Ckb_HabServAtivoAlteraClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_HabServAtivoAltera);

  If Gb_HabServAtivoAltera.Visible Then
  Begin
    Ckb_HabServAtivoAltera.Font.Color:=clRed;
    If Ckb_HabServAtivoAltera.Checked Then
      Ckb_HabServAtivoAltera.Font.Color:=clBlue;
  End; // If Gb_HabServAtivoAltera.Visible Then
end;

procedure TFrmSolicitacoes.Ckb_HabServAtivoAlteraKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AcertaCkb_SN(Ckb_HabServAtivoAltera);

end;

procedure TFrmSolicitacoes.Bt_ParamSisVoltarClick(Sender: TObject);
Var
  i: Integer;
begin
  PC_Parametros.SetFocus;
  If Ts_ParamLojaReposFornec.TabVisible Then
  Begin
    DMBelShop.CDS_Busca.Close;

    For i:=0 to FrmSolicitacoes.ComponentCount-1 do
    Begin
      If FrmSolicitacoes.Components[i] is TTabSheet Then
       If (FrmSolicitacoes.Components[i] as TTabSheet).Parent=PC_Parametros Then
       (FrmSolicitacoes.Components[i] as TTabSheet).TabVisible:=True;
    End; // For i:=0 to FrmSolicitacoes.ComponentCount-1 do
    Ts_ParamLojaReposFornec.TabVisible:=False;

    Bt_ParamSisSalvar.Visible:=True;
    Bt_ParamSisReposFornec.Visible:=True;

    PC_Parametros.TabIndex:=0;
    PC_ParametrosChange(Self);
    Exit;
  End; // If Ts_ParamLojaReposFornec.Visible Then

  If (DMVirtual.CDS_V_ParamSalMinimo.State=dsInsert) Or (DMVirtual.CDS_V_ParamSalMinimo.State=dsEdit) Then
   DMVirtual.CDS_V_ParamSalMinimo.CancelUpdates;

  DMVirtual.CDS_V_ParamSalMinimo.Close;

  bgProcessar:=False;

  Close;
end;

procedure TFrmSolicitacoes.Ckb_ParamConsNfeOCSolicClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_ParamConsNfeOCSolic);
end;

procedure TFrmSolicitacoes.Ckb_ParamConsNfeOCSolicKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AcertaCkb_SN(Ckb_ParamConsNfeOCSolic);
end;

procedure TFrmSolicitacoes.Bt_ParamSisSalvarClick(Sender: TObject);
begin
  // Consiste INSS =============================================================
  If (Trim(DBCBx_ParamTaxaSindMes.Text)='') Or (Trim(DBCBx_ParamTaxaSindPosicao.Text)='') or (Trim(DBCBx_ParamTaxaSindDia.Text)='') Then
  Begin
    msg('Favor Informar o Mês/Dia de Competência'+cr+'para Calculo ds Taxas de Sindicato !!','A');
    PC_Parametros.ActivePage:=Ts_ParamINSS;
    DBCBx_ParamTaxaSindMes.SetFocus;
    Exit;
  End;

  // Consiste Percentuais da Curva ABC =========================================
  If (EdtParamCurvaALimite.AsInteger + EdtParamCurvaBLimite.AsInteger + EdtParamCurvaCLimite.AsInteger +
      EdtParamCurvaDLimite.AsInteger + EdtParamCurvaELimite.AsInteger)<>100 Then
  Begin
    msg('Total da Distribuição dos Percentuais'+cr+cr+'da Curva ABC NÃO Fecham 100% !!','A');
    PC_Parametros.ActivePage:=Ts_ParamCurvaABC;
    PC_ParametrosChange(Self);
    Exit;
  End;

  if msg('As Alterações nos PÂRAMETROS'+cr+cr+'Estão Corretas ??','C')=2 Then
  Begin
    PC_ParametrosChange(Self);
    Exit;
  End;

  bgProcessar:=True;
  Close;
end;

procedure TFrmSolicitacoes.Bt_ConsistenciasSalvarClick(Sender: TObject);
begin
  if msg('As Alterações nas Consistências '+cr+cr+'Estão Corretas ??','C')=2 Then
  Begin
    Dbg_Consistencias.SetFocus;
    Exit;
  End;

  bgProcessar:=True;
  Close;


end;

procedure TFrmSolicitacoes.Bt_ConsistenciasVoltarClick(Sender: TObject);
begin
  bgProcessar:=False;
  Close;

end;

procedure TFrmSolicitacoes.Dbg_ConsistenciasDblClick(Sender: TObject);
begin
  gCDS_V1.Edit;
  If gCDS_V1.FieldByName('IND_LIBERADO').AsString='SIM' Then
   gCDS_V1.FieldByName('IND_LIBERADO').AsString:='NAO'
  Else
   gCDS_V1.FieldByName('IND_LIBERADO').AsString:='SIM';
  gCDS_V1.Post;
end;

procedure TFrmSolicitacoes.Dbg_ConsistenciasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If (Column.FieldName='IND_LIBERADO') Then // Este comando altera cor da Celula
  Begin
    if gCDS_V1.FieldByName('Ind_liberado').AsString='SIM' then
     Dbg_Consistencias.Canvas.Brush.Color:=$0080FF80
    Else
     Dbg_Consistencias.Canvas.Brush.Color:=$009D9DFF;

    Dbg_Consistencias.Canvas.FillRect(Rect);
    Dbg_Consistencias.DefaultDrawDataCell(Rect,Column.Field,state);
  End;

end;

procedure TFrmSolicitacoes.Bt_ValesVoltarClick(Sender: TObject);
begin
  // Fecha Transação ===========================================================
  If (DMSalao.CDS_Vales.State=dsInsert) Or (DMSalao.CDS_Vales.State=dsEdit) Then
   DMSalao.CDS_Vales.CancelUpdates;

  bgProcessar:=False;
  Close;

end;

procedure TFrmSolicitacoes.Bt_ValesSalvarClick(Sender: TObject);
begin
  //Consistir se incluir

  bgProcessar:=True;
  Close;

end;

procedure TFrmSolicitacoes.Dbg_ValesParcelasDblClick(Sender: TObject);
begin
  If DMSalao.CDS_Vales.IsEmpty Then
   Exit;

  If EdtValesVlrDesc.Enabled Then
  Begin
    EdtValesVlrDesc.Value:=DMSalao.CDS_ValesVLR_DESCONTO.AsCurrency;
    EdtValesVlrAcresc.Value:=DMSalao.CDS_ValesVLR_ACRESCIMOS.AsCurrency;
    EdtValesVlrPago.Value:=DMSalao.CDS_ValesVLR_PAGO.AsCurrency;

    If Trim(DMSalao.CDS_ValesDTA_PAGAMENTO.AsString)<>'' Then
     DtEdt_ValesPagto.Date:=DMSalao.CDS_ValesDTA_PAGAMENTO.AsDateTime;

    EdtValesDoctoPagto.Value:=DMSalao.CDS_ValesNUM_DOCTO_PAGTO.AsCurrency;

    ValesAcertaComponentes(4,clWindow, False, True, False); // (iTipo:Integer; tCor:TColor; bReadOnly, bEnabled, bVisible:Boolean);

    Dbg_ValesParcelas.Enabled:=False;
    EdtValesVlrDesc.SetFocus;
  End; // If EdtValesVlrDesc.Enabled Then
  
end;

procedure TFrmSolicitacoes.EdtValesCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtValesDesLoja.Clear;

  If EdtValesCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From EMP_CONEXOES'+
           ' Where Ind_Ativo=''SIM'''+
           ' And COD_FILIAL='+QuotedStr(FormatFloat('00',EdtValesCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('RAZAO_SOCIAL').AsString)='' Then
    Begin
      msg('Loja NÃO Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtValesCodLoja.Clear;
      EdtValesCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtValesDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    Screen.Cursor:=crDefault;
  End;

  If Not EdtValesCodLoja.ReadOnly Then
   EdtValesCodLoja.Color:=clWindow
  Else
   EdtValesCodLoja.Color:=$00E0E0E0;

end;

procedure TFrmSolicitacoes.Bt_ValesBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtValesCodLoja.Clear;
  EdtValesDesLoja.Clear;

  EdtValesCodLoja.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
         ' From EMP_CONEXOES'+
         ' Where IND_ATIVO=''SIM'''+
         ' Order by RAZAO_SOCIAL';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('RAZAO_SOCIAL').AsString)='' Then
  Begin
    Screen.Cursor:=crDefault;
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Loja a Listar !!','A');
    EdtValesCodLoja.SetFocus;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Razao_Social';
  FrmPesquisa.Campo_Codigo:='Cod_Filial';
  FrmPesquisa.Campo_Descricao:='Razao_Social';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtValesCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtValesDesLoja.Text:=FrmPesquisa.EdtDescricao.Text;
   End
  Else
   Begin
     EdtValesCodLoja.Clear;
     EdtValesDesLoja.Clear;
     EdtValesCodLoja.SetFocus;
   End;

  Screen.Cursor:=crDefault;
  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmSolicitacoes.EdtValesCodProfExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtValesDesProf.Clear;

  If EdtValesCodLoja.AsInteger=0 Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtValesCodLoja.SetFocus;
    Exit;
  End;

  If EdtValesCodProf.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Profissional ======================================================
    MySql:=' SELECT p.des_profissional, p.cod_profissional'+
           ' FROM SAL_PROFISSIONAIS p'+
           ' WHERE p.tip_pessoa='+QuotedStr('P')+
           ' AND   p.cod_loja='+QuotedStr(FormatFloat('00',EdtValesCodLoja.AsInteger))+
           ' AND   p.cod_profissional='+QuotedStr(FormatFloat('000000',EdtValesCodProf.AsInteger));

           If (Ckb_ValesAtivos.Checked) And (Not Ckb_ValesInativos.Checked)Then
            MySql:=MySql+' AND   p.ind_ativo='+QuotedStr('SIM');

           If (Not Ckb_ValesAtivos.Checked) And (Ckb_ValesInativos.Checked)Then
            MySql:=MySql+' AND   p.ind_ativo='+QuotedStr('NAO');

           MySql:=MySql+' ORDER BY 1';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString)='' Then
    Begin
      msg('Sem Profissiona a Listar !!'+cr+cr+' Ou Inativo !!', 'A');
      Screen.Cursor:=crDefault;
      EdtValesCodProf.Clear;
      EdtValesCodProf.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtValesDesProf.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Profissional').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    Screen.Cursor:=crDefault;
  End;

  If Not EdtValesCodLoja.ReadOnly Then
   EdtValesCodProf.Color:=clWindow
  Else
   EdtValesCodProf.Color:=$00E0E0E0;

end;

procedure TFrmSolicitacoes.Bt_ValesBuscaProfClick(Sender: TObject);
Var
  MySql: String;
begin

  If EdtValesCodLoja.AsInteger=0 Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtValesCodLoja.SetFocus;
    Exit;
  End;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtValesCodProf.Clear;
  EdtValesDesProf.Clear;

  EdtValesCodProf.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.des_profissional, p.cod_profissional'+
         ' FROM SAL_PROFISSIONAIS p'+
         ' WHERE p.tip_pessoa='+QuotedStr('P');

         If (Ckb_ValesAtivos.Checked) And (Not Ckb_ValesInativos.Checked)Then
          MySql:=MySql+' AND   p.ind_ativo='+QuotedStr('SIM');

         If (Not Ckb_ValesAtivos.Checked) And (Ckb_ValesInativos.Checked)Then
          MySql:=MySql+' AND   p.ind_ativo='+QuotedStr('NAO');

         MySql:=MySql+' AND   p.cod_loja='+QuotedStr(FormatFloat('00',EdtValesCodLoja.AsInteger))+
                      ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Cod_Profissional').AsString)='' Then
  Begin
    Screen.Cursor:=crDefault;
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Profissiona a Listar !!'+cr+cr+' Ou Inativo !!', 'A');
    EdtValesCodProf.SetFocus;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Profissional';
  FrmPesquisa.Campo_Codigo:='Cod_Profissional';
  FrmPesquisa.Campo_Descricao:='Des_Profissional';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtValesCodProf.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtValesDesProf.Text:=FrmPesquisa.EdtDescricao.Text;
   End
  Else
   Begin
     EdtValesCodProf.Clear;
     EdtValesDesProf.Clear;
     EdtValesCodProf.SetFocus;
   End;

  Screen.Cursor:=crDefault;
  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmSolicitacoes.Bt_ValesGeraParcClick(Sender: TObject);
Var
  cVlrParc, cVlrDif: Currency;
  iDia, i, iQtdParc: Integer;
  MySql: String;
  dDta: TDate;
  wDia, wMes, wAno: Word;
begin
  If Not ConsisteVales('G') Then
   Exit;

  If Bt_ValesGeraParc.Caption='Abandonar' Then
  Begin
    // Abandona Transação ======================================================
    DMSalao.CDS_Vales.CancelUpdates;

    ValesAcertaComponentes(5, clWindow, False, True, True);
                          // (iTipo:Integer; tCor:TColor; bReadOnly, bEnabled, bVisible:Boolean);

    Bt_ValesGeraParc.Caption:='Gerar Parcelas';
    EdtValesDocto.SetFocus;
    Exit;
  End;
  Screen.Cursor:=crAppStart;

  // Calucla valor(es) da(s) Parcela(s) ========================================
  iQtdParc:=StrToInt(EdtValesTotalParc.Text);
  cVlrParc:=RoundTo(EdtValesVlrDocto.Value/iQtdParc,-2);
  cVlrDif:=cVlrParc*iQtdParc;
  cVlrDif:=EdtValesVlrDocto.Value-cVlrDif;

  DMSalao.CDS_ValesProfissionais.Close;
  MySql:=' SELECT v.* FROM ps_vales_pessoas v'+
         ' WHERE v.tp_pessoa=-1';
  DMSalao.CDS_Vales.Close;
  DMSalao.SDS_Vales.CommandText:=MySql;
  DMSalao.CDS_Vales.Open;

  // Cria Parcelas de Vales ====================================================
  For i:=1 to iQtdParc do
  Begin
    // Busca Num_Seq ------------------------------------------------
    MySql:='SELECT GEN_ID(GEN_VALES,1) Num_Seq'+
           ' FROM RDB$DATABASE';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    If i=1 Then // Primeiro Registro
     Begin
       DecodeDate(DtEdt_ValesPrimVencto.Date, wAno, wMes, wDia);
       iDia:=wDia;

       dDta:=DtEdt_ValesPrimVencto.Date
     End
    Else // If i=1 Then // Primeiro Registro
     Begin
       If EdtValesPrazo.Value=0 Then
        Begin
          // Próximo Mês e Desmembra Data
          dDta:=PrimUltDia(dDta,'U')+1;
          DecodeDate(dDta, wAno, wMes, wDia);

          // Monta Novo Vencimento
          dDta:=EncodeDate(wAno, wMes, iDia);
        End
       Else
        Begin
          dDta:=dDta+EdtValesPrazo.Value;
        End;
     End; // If i=1 Then // Primeiro Registro

    DMSalao.CDS_Vales.Append;
    DMSalao.CDS_ValesNUM_SEQ.AsInteger:=DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsInteger;
    DMBelShop.CDS_Busca.Close;
    DMSalao.CDS_ValesTP_PESSOA.AsString:='1';
    DMSalao.CDS_ValesCOD_LOJA.AsString:=FormatFloat('00',EdtValesCodLoja.AsInteger);
    DMSalao.CDS_ValesCOD_PESSOA.AsString:=FormatFloat('000000',EdtValesCodProf.AsInteger);
    DMSalao.CDS_ValesNUM_DOCTO.AsString:=VarToStr(EdtValesDocto.Value);
    DMSalao.CDS_ValesIND_DEBCRED.AsString:='D';
    DMSalao.CDS_ValesVLR_ORIGINAL.AsCurrency:=EdtValesVlrDocto.Value;
    DMSalao.CDS_ValesTOT_PRESTACAO.AsCurrency:=EdtValesTotalParc.Value;
    DMSalao.CDS_ValesNUM_PRAZO.AsString:=VarToStr(EdtValesPrazo.Value);
    DMSalao.CDS_ValesDTA_PRIM_VENC.AsDateTime:=DtEdt_ValesPrimVencto.Date;
    DMSalao.CDS_ValesNUM_PRESTACAO.AsInteger:=i;
    DMSalao.CDS_ValesDTA_VENCIMENTO.AsDateTime:=dDta;

    If i=1 Then
     DMSalao.CDS_ValesVLR_PRESTACAO.AsCurrency:=cVlrParc+cVlrDif
    Else
     DMSalao.CDS_ValesVLR_PRESTACAO.AsCurrency:=cVlrParc;

    DMSalao.CDS_ValesVLR_DESCONTO.AsCurrency:=0;
    DMSalao.CDS_ValesVLR_ACRESCIMOS.AsCurrency:=0;
    DMSalao.CDS_ValesVLR_APAGAR.AsCurrency:=DMSalao.CDS_ValesVLR_PRESTACAO.AsCurrency;
    DMSalao.CDS_ValesVLR_PAGO.AsCurrency:=0;
    DMSalao.CDS_ValesNUM_DOCTO_PAGTO.AsInteger:=0;
    DMSalao.CDS_ValesUSU_INCLUI.AsString:=Cod_Usuario;
    DMSalao.CDS_ValesDTA_INCLUI.AsDateTime:=Now;

  End; // For i:=1 to iQtdParc do
  DMSalao.CDS_Vales.First;

  Screen.Cursor:=crDefault;

  // Desbiliata Componentes ====================================================
  EdtValesCodLoja.Color:=$00E0E0E0;
  EdtValesCodLoja.ReadOnly:=True;
  EdtValesCodLoja.TabStop:=Not EdtValesCodLoja.ReadOnly;

  EdtValesCodProf.Color:=$00E0E0E0;
  EdtValesCodProf.ReadOnly:=True;
  EdtValesCodProf.TabStop:=Not EdtValesCodProf.ReadOnly;

  EdtValesDocto.Style.Color:=$00E0E0E0;
  EdtValesDocto.Properties.ReadOnly:=True;
  EdtValesDocto.TabStop:=Not EdtValesDocto.Properties.ReadOnly;

  EdtValesVlrDocto.Style.Color:=$00E0E0E0;
  EdtValesVlrDocto.Properties.ReadOnly:=True;
  EdtValesVlrDocto.TabStop:=Not EdtValesVlrDocto.Properties.ReadOnly;

  EdtValesTotalParc.Style.Color:=$00E0E0E0;
  EdtValesTotalParc.Properties.ReadOnly:=True;
  EdtValesTotalParc.TabStop:=Not EdtValesTotalParc.Properties.ReadOnly;

  EdtValesPrazo.Style.Color:=$00E0E0E0;
  EdtValesPrazo.Properties.ReadOnly:=True;
  EdtValesPrazo.TabStop:=Not EdtValesPrazo.Properties.ReadOnly;

  DtEdt_ValesPrimVencto.Style.Color:=$00E0E0E0;
  DtEdt_ValesPrimVencto.Properties.ReadOnly:=True;
  DtEdt_ValesPrimVencto.TabStop:=Not DtEdt_ValesPrimVencto.Properties.ReadOnly;

  Bt_ValesGeraParc.Caption:='Abandonar';
  Bt_ValesSalvar.Enabled:=True;
  Dbg_ValesParcelas.SetFocus;

end;

procedure TFrmSolicitacoes.Bt_ValesAlterarClick(Sender: TObject);
begin

  If Not ConsisteVales('A') Then
   Exit;

  DMSalao.CDS_Vales.Edit;
  DMSalao.CDS_ValesVLR_DESCONTO.AsCurrency:=EdtValesVlrDesc.Value;
  DMSalao.CDS_ValesVLR_ACRESCIMOS.AsCurrency:=EdtValesVlrAcresc.Value;
  DMSalao.CDS_ValesVLR_APAGAR.AsCurrency:=DMSalao.CDS_ValesVLR_PRESTACAO.AsCurrency-
                                          DMSalao.CDS_ValesVLR_DESCONTO.AsCurrency+
                                          DMSalao.CDS_ValesVLR_ACRESCIMOS.AsCurrency;

  DMSalao.CDS_ValesVLR_PAGO.AsCurrency:=EdtValesVlrPago.Value;
  DMSalao.CDS_ValesDTA_PAGAMENTO.AsString:=DtEdt_ValesPagto.Text;
  DMSalao.CDS_ValesNUM_DOCTO_PAGTO.AsString:=EdtValesDoctoPagto.Text;

  DMSalao.CDS_ValesUSU_ALTERA.AsString:=Cod_Usuario;
  DMSalao.CDS_ValesDTA_ALTERA.AsDateTime:=Now;

  EdtValesVlrDesc.Clear;
  EdtValesVlrAcresc.Clear;
  EdtValesVlrPago.Clear;
  DtEdt_ValesPagto.Clear;
  EdtValesDoctoPagto.Clear;

  ValesAcertaComponentes(3,$00E0E0E0, True, False, False); // (iTipo:Integer; tCor:TColor; bReadOnly, bEnabled, bVisible:Boolean);

  Dbg_ValesParcelas.Enabled:=True;
  Dbg_ValesParcelas.SetFocus;

end;

procedure TFrmSolicitacoes.Bt_ValesAbandonarClick(Sender: TObject);
begin
  // Fecha Transação ===========================================================
  If (DMSalao.CDS_Vales.State=dsInsert) Or (DMSalao.CDS_Vales.State=dsEdit) Then
   DMSalao.CDS_Vales.CancelUpdates;

  EdtValesVlrDesc.Clear;
  EdtValesVlrAcresc.Clear;
  EdtValesVlrPago.Clear;
  DtEdt_ValesPagto.Clear;
  EdtValesDoctoPagto.Clear;

  ValesAcertaComponentes(2,$00E0E0E0, True, False, False); // (iTipo:Integer; tCor:TColor; bReadOnly, bEnabled, bVisible:Boolean);

  Dbg_ValesParcelas.Enabled:=True;
  Dbg_ValesParcelas.SetFocus;

end;

procedure TFrmSolicitacoes.EdtValesDoctoPagtoExit(Sender: TObject);
begin
  If Bt_ValesAlterar.Enabled Then
   Bt_ValesAlterar.SetFocus;
end;

procedure TFrmSolicitacoes.EdtValesCodLojaEnter(Sender: TObject);
begin
  (Sender as TCurrencyEdit).Color:=clMoneyGreen
end;

procedure TFrmSolicitacoes.PC_ParametrosChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Parametros);

  If (PC_Parametros.ActivePage=Ts_ParamLojaReposicoes) Then
   Bt_ParamSisReposFornec.Visible:=True
  Else
   Bt_ParamSisReposFornec.Visible:=False;

  If (PC_Parametros.ActivePage=Ts_ParamLojaReposicoes) And (Ts_ParamLojaReposicoes.CanFocus) Then
   Cbx_ParamLojaNeces.SetFocus;

  If (PC_Parametros.ActivePage=Ts_ParamLojaReposFornec) And (Ts_ParamLojaReposFornec.CanFocus) Then
   EdtParamLojaReposCodForn.SetFocus;

  If (PC_Parametros.ActivePage=Ts_ParamComissaoProf) And (Ts_ParamComissaoProf.CanFocus) Then
   Cbx_ParamComProfDiaIni.SetFocus;

  If (PC_Parametros.ActivePage=Ts_ParamConsisNFeOC) And (Ts_ParamConsisNFeOC.CanFocus) Then
   Ckb_ParamConsNfeOCSolic.SetFocus;

  If (PC_Parametros.ActivePage=Ts_ParamConcBancaria) And (Ts_ParamConcBancaria.CanFocus) Then
   Dbe_ParamConcBancoDiaNao.SetFocus;

  If (PC_Parametros.ActivePage=Ts_ParamSalarioMinimo) And (Ts_ParamSalarioMinimo.CanFocus) Then
   Dbg_ParamSalMinino.SetFocus;

  If (PC_Parametros.ActivePage=Ts_ParamTaxaSindicato) And (Ts_ParamTaxaSindicato.CanFocus) Then
   DBCBx_ParamTaxaSindMes.SetFocus;

  If (PC_Parametros.ActivePage=Ts_ParamCurvaABC) And (Ts_ParamCurvaABC.CanFocus) Then
  Begin
    EdtParamCurvaALimite.SetFocus;
  End;
end;

procedure TFrmSolicitacoes.Bt_ParamSalMinNovoClick(Sender: TObject);
Var
  MySql: String;
begin
  If Bt_ParamSalMinNovo.Caption='Novo' Then
  Begin
    sgTipoDML:='Incluido';

    MySql:=' SELECT COALESCE(MAX(c.num_seq)+1 ,1) Num_Seq'+
           ' FROM fin_contribuicoes c';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sgNumSeq:=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    Dbg_ParamSalMinino.Enabled:=False;
    Bt_ParamSalMinNovo.Caption:='Inclui';
    Bt_ParamSalMinAlterar.Caption:='Abandonar';

    Bt_ParamSisSalvar.Enabled:=False;
    Bt_ParamSisVoltar.Enabled:=False;

    EdtParamVlrSalMinimo.Enabled:=True;
    DtEdtParamVigIniSalMinino.Enabled:=True;
    DtEdtParamVigFimSalMinino.Enabled:=True;

    EdtParamVlrSalMinimo.SetFocus;
    Exit;
  End; // If Bt_ParamSalMinNovo.Caption='Novor' Then

  If Not ConsisteParametrosSIS('SM') Then
   Exit;

  If Bt_ParamSalMinNovo.Caption='Inclui' Then
  Begin
    DMVirtual.CDS_V_ParamSalMinimo.Insert;
    DMVirtual.CDS_V_ParamSalMinimoNUM_SEQ.AsString:=sgNumSeq;
    DMVirtual.CDS_V_ParamSalMinimoDTA_INCLUI.AsDateTime:=Now;
    DMVirtual.CDS_V_ParamSalMinimoUSU_INCLUI.AsString:=Cod_Usuario;
  End; // If Bt_ParamSalMinNovo.Caption='Incluir' Then

  If Bt_ParamSalMinNovo.Caption='Altera' Then
  Begin
    DMVirtual.CDS_V_ParamSalMinimo.Locate('Num_Seq', sgNumSeq,[]);
    DMVirtual.CDS_V_ParamSalMinimo.Edit;
    DMVirtual.CDS_V_ParamSalMinimoDTA_ALTERA.AsDateTime:=Now;
    DMVirtual.CDS_V_ParamSalMinimoUSU_ALTERA.AsString:=Cod_Usuario;

    If DMVirtual.CDS_V_ParamSalMinimoIND_SIT.AsString='Incluido' Then
     sgTipoDML:='Incluido';

  End; // If Bt_ParamSalMinNovo.Caption='Alterar' Then

  DMVirtual.CDS_V_ParamSalMinimoIND_SIT.AsString:=sgTipoDML;
  DMVirtual.CDS_V_ParamSalMinimoDTA_VIGENCIA_INICIO.AsDateTime:=DtEdtParamVigIniSalMinino.Date;
  DMVirtual.CDS_V_ParamSalMinimoDTA_VIGENCIA_FINAL.AsDateTime:=DtEdtParamVigFimSalMinino.Date;
  DMVirtual.CDS_V_ParamSalMinimoPER_ALIQUOTA.AsCurrency:=0;
  DMVirtual.CDS_V_ParamSalMinimoPER_ALIQUOTA.AsCurrency:=0;
  DMVirtual.CDS_V_ParamSalMinimoSEQ_REG.AsInteger:=1;
  DMVirtual.CDS_V_ParamSalMinimoTP_REGISTRO.AsInteger:=1;
  DMVirtual.CDS_V_ParamSalMinimoVLR_DEDUCAO.AsCurrency:=0;
  DMVirtual.CDS_V_ParamSalMinimoVLR_FINAL.AsCurrency:=0;
  DMVirtual.CDS_V_ParamSalMinimoVLR_INICIAL.AsCurrency:=EdtParamVlrSalMinimo.Value;
  DMVirtual.CDS_V_ParamSalMinimo.Post;

  Dbg_ParamSalMinino.Enabled:=True;
  Bt_ParamSalMinNovo.Caption:='Novo';
  Bt_ParamSalMinAlterar.Caption:='Alterar';

  Bt_ParamSisSalvar.Enabled:=True;
  Bt_ParamSisVoltar.Enabled:=True;

  EdtParamVlrSalMinimo.Value:=0;
  EdtParamVlrSalMinimo.Enabled:=False;
  DtEdtParamVigIniSalMinino.Enabled:=False;
  DtEdtParamVigIniSalMinino.Clear;
  DtEdtParamVigFimSalMinino.Enabled:=False;
  DtEdtParamVigFimSalMinino.Clear;

end;

procedure TFrmSolicitacoes.Bt_ParamSalMinAlterarClick(Sender: TObject);
begin

  If Bt_ParamSalMinAlterar.Caption='Alterar' Then
  Begin
    If (DMVirtual.CDS_V_ParamSalMinimo.IsEmpty) Or (DMVirtual.CDS_V_ParamSalMinimoIND_SIT.AsString='Excluido') Then
     Exit;

    sgTipoDML:='Alterado';

    Dbg_ParamSalMinino.Enabled:=False;
    Bt_ParamSalMinNovo.Caption:='Altera';
    Bt_ParamSalMinAlterar.Caption:='Abandonar';

    Bt_ParamSisSalvar.Enabled:=False;
    Bt_ParamSisVoltar.Enabled:=False;

    // Apresenta
    sgNumSeq:=DMVirtual.CDS_V_ParamSalMinimoNUM_SEQ.AsString;
    EdtParamVlrSalMinimo.Value:=DMVirtual.CDS_V_ParamSalMinimoVLR_INICIAL.AsCurrency;
    DtEdtParamVigIniSalMinino.Date:=DMVirtual.CDS_V_ParamSalMinimoDTA_VIGENCIA_INICIO.AsDateTime;
    DtEdtParamVigFimSalMinino.Date:=DMVirtual.CDS_V_ParamSalMinimoDTA_VIGENCIA_FINAL.AsDateTime;

    EdtParamVlrSalMinimo.Enabled:=True;
    DtEdtParamVigIniSalMinino.Enabled:=True;
    DtEdtParamVigFimSalMinino.Enabled:=True;

    EdtParamVlrSalMinimo.SetFocus;
    Exit;
  End; // If Bt_ParamSalMinAlterar.Caption='Alterar' Then

  // Abandona Todo =============================================================
  Dbg_ParamSalMinino.Enabled:=True;
  Bt_ParamSalMinNovo.Caption:='Novo';
  Bt_ParamSalMinAlterar.Caption:='Alterar';

  Bt_ParamSisSalvar.Enabled:=True;
  Bt_ParamSisVoltar.Enabled:=True;
  
  EdtParamVlrSalMinimo.Value:=0;
  EdtParamVlrSalMinimo.Enabled:=False;
  DtEdtParamVigIniSalMinino.Enabled:=False;
  DtEdtParamVigIniSalMinino.Clear;
  DtEdtParamVigFimSalMinino.Enabled:=False;
  DtEdtParamVigFimSalMinino.Clear;

end;

procedure TFrmSolicitacoes.Dbg_ParamSalMininoDrawColumnCell(Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMVirtual.CDS_V_ParamSalMinimoIND_SIT.AsString='Excluido' Then
    Begin
      Dbg_ParamSalMinino.Canvas.Brush.Color:=clRed;
      Dbg_ParamSalMinino.Canvas.FillRect(Rect);
      Dbg_ParamSalMinino.DefaultDrawDataCell(Rect,Column.Field,state);
    end;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmSolicitacoes.Bt_ParamSalMinExcluirClick(Sender: TObject);
begin
  If (DMVirtual.CDS_V_ParamSalMinimo.IsEmpty) Or
     (DMVirtual.CDS_V_ParamSalMinimoIND_SIT.AsString='Excluido') Or
     (Not Dbg_ParamSalMinino.Enabled) Then
   Exit;

   If msg('Deseja Realmente Excluir o'+cr+cr+'Registro Selecionado ??','C')=2 Then
    Exit;

  sgTipoDML:='Excluido';
  DMVirtual.CDS_V_ParamSalMinimo.Edit;
  DMVirtual.CDS_V_ParamSalMinimoIND_SIT.AsString:=sgTipoDML;
  DMVirtual.CDS_V_ParamSalMinimo.Post;


end;

procedure TFrmSolicitacoes.DtEdtParamVigFimSalMininoExit(Sender: TObject);
begin
  Bt_ParamSalMinNovo.SetFocus;
end;

procedure TFrmSolicitacoes.Bt_SolicitFornLojasVoltarClick(Sender: TObject);
begin
  DMLojaUnica.CDS_V_SolicitFornLojas.Close;
  bgProcessar:=False;
  Close;
end;

procedure TFrmSolicitacoes.Bt_SolicitFornLojasImportarClick(Sender: TObject);
Var
  sCodLoja, sCodForn: String;
begin

  // Verifica se tem Fornecedor Selecionado ====================================
  sCodLoja:='';
  DMLojaUnica.CDS_V_SolicitFornLojas.First;
  DMLojaUnica.CDS_V_SolicitFornLojas.DisableControls;
  While Not DMLojaUnica.CDS_V_SolicitFornLojas.Eof do
  Begin
    If DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString='SIM' Then
    Begin
      sCodLoja:='ok';
      Break;
    End;
    DMLojaUnica.CDS_V_SolicitFornLojas.Next;
  End; // While Not DMLojaUnica.CDS_V_SolicitFornLojas.Eof do
  DMLojaUnica.CDS_V_SolicitFornLojas.EnableControls;
  DMLojaUnica.CDS_V_SolicitFornLojas.First;

  If sCodLoja='' Then
  Begin
    msg('Favor Selecionar o(s)'+cr+cr+'Fornecedor(es) a Importar !!','A');
    Dbg_SolicitFornLojas.SetFocus;
    Exit;
  End;

  If msg('Deseja Realmente Importar os'+cr+'Fornecedores Selecionados ??','C')=2 Then
  Begin
    Dbg_SolicitFornLojas.SetFocus;
    Exit;
  End;

  sgFornLojas:='';
  sgDemandas:='';
  sgInsertOC_Meses:='';
  sCodLoja:='';
  sCodForn:='';

  DMLojaUnica.CDS_V_SolicitFornLojas.First;
  DMLojaUnica.CDS_V_SolicitFornLojas.DisableControls;
  While Not DMLojaUnica.CDS_V_SolicitFornLojas.Eof do
  Begin
    sCodLoja:=Copy(DMLojaUnica.CDS_V_SolicitFornLojasCOD_LOJA.AsString,5,2);
    sCodForn:=DMLojaUnica.CDS_V_SolicitFornLojasCOD_FORNECEDOR.AsString;

    If DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString='SIM' Then
    Begin
      // Aguarda Periodos de Demanda --------------------------------
      If Trim(sgDemandas)='' Then
      Begin
        sgInsertOC_Meses:=
              ' INSERT INTO OC_COMPRAR_MESES ('+
              ' NUM_DOCUMENTO, MES1, MES2, MES3, MES4, MES5, MES6, MES7, MES8)'+
              ' Values (NumDoc,';

              If Trim(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES1.AsString)='' Then
               sgInsertOC_Meses:=sgInsertOC_Meses+' NULL,'
              Else
               sgInsertOC_Meses:=sgInsertOC_Meses+
               QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES1.AsString)+', ';

              If Trim(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES2.AsString)='' Then
               sgInsertOC_Meses:=sgInsertOC_Meses+' NULL,'
              Else
               sgInsertOC_Meses:=sgInsertOC_Meses+
               QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES2.AsString)+', ';

              If Trim(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES3.AsString)='' Then
               sgInsertOC_Meses:=sgInsertOC_Meses+' NULL,'
              Else
               sgInsertOC_Meses:=sgInsertOC_Meses+
               QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES3.AsString)+', ';

              If Trim(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES4.AsString)='' Then
               sgInsertOC_Meses:=sgInsertOC_Meses+' NULL,'
              Else
               sgInsertOC_Meses:=sgInsertOC_Meses+
               QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES4.AsString)+', ';

              If Trim(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES5.AsString)='' Then
               sgInsertOC_Meses:=sgInsertOC_Meses+' NULL,'
              Else
               sgInsertOC_Meses:=sgInsertOC_Meses+
               QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES5.AsString)+', ';

              If Trim(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES6.AsString)='' Then
               sgInsertOC_Meses:=sgInsertOC_Meses+' NULL,'
              Else
               sgInsertOC_Meses:=sgInsertOC_Meses+
               QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES6.AsString)+', ';

              If Trim(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES7.AsString)='' Then
               sgInsertOC_Meses:=sgInsertOC_Meses+' NULL,'
              Else
               sgInsertOC_Meses:=sgInsertOC_Meses+
               QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES7.AsString)+', ';

              If Trim(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES8.AsString)='' Then
               sgInsertOC_Meses:=sgInsertOC_Meses+' NULL'
              Else
               sgInsertOC_Meses:=sgInsertOC_Meses+
               QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES8.AsString);

              sgInsertOC_Meses:=sgInsertOC_Meses+')';

        sgDemandas:=' AND EXISTS (SELECT 1'+
                    ' FROM OC_COMPRAR_MESES_LOJAS ml'+
                    ' WHERE ml.num_documento=ol.num_documento'+
                    ' AND   ml.cod_loja=ol.cod_empresa'+
                    ' AND   COALESCE(ml.mes1, '''')='+
                    QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES1.AsString)+
                    ' AND   COALESCE(ml.mes2, '''')='+
                    QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES2.AsString)+
                    ' AND   COALESCE(ml.mes3, '''')='+
                    QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES3.AsString)+
                    ' AND   COALESCE(ml.mes4, '''')='+
                    QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES4.AsString)+
                    ' AND   COALESCE(ml.mes5, '''')='+
                    QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES5.AsString)+
                    ' AND   COALESCE(ml.mes6, '''')='+
                    QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES6.AsString)+
                    ' AND   COALESCE(ml.mes7, '''')='+
                    QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES7.AsString)+
                    ' AND   COALESCE(ml.mes8, '''')='+
                    QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES8.AsString)+')'
      End; // If Trim(sgDemandas)='' Then

      // Guarda Codigos de Fornecedores e Lojas ---------------------
      If Dbg_SolicitFornLojas.Columns[3].Visible Then
      Begin
        If sgFornLojas='' Then
         Begin
           sgFornLojas:='AND ((ol.Cod_Fornecedor='+QuotedStr(sCodForn)+' and ol.cod_Empresa='+QuotedStr(sCodLoja)+')';
         End
        Else // If sgFornLojas='' Then
         Begin
           sgFornLojas:=sgFornLojas+' Or (ol.Cod_Fornecedor='+QuotedStr(sCodForn)+' and ol.cod_Empresa='+QuotedStr(sCodLoja)+')';
         End; // If sgFornLojas='' Then
      End; // If Dbg_SolicitFornLojas.Columns[3].Visible Then

      If Not Dbg_SolicitFornLojas.Columns[3].Visible Then
      Begin
        // Guarda Codigos de Fornecedores ---------------------------
        If sgFornLojas='' Then
         Begin
           sgFornLojas:=' AND ol.Cod_Fornecedor IN ('+QuotedStr(sCodForn);
         End
        Else
         Begin
           sgFornLojas:=sgFornLojas+', '+QuotedStr(sCodForn);
         End; // If sgFornLojas='' Then
      End; // If Not Dbg_SolicitFornLojas.Columns[3].Visible Then

    End; // If DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString='SIM' Then

    DMLojaUnica.CDS_V_SolicitFornLojas.Next
  End; // While Not DMLojaUnica.CDS_V_SolicitFornLojas.Eof do
  DMLojaUnica.CDS_V_SolicitFornLojas.EnableControls;
  DMLojaUnica.CDS_V_SolicitFornLojas.First;

  sgFornLojas:=sgFornLojas+')';
  DMLojaUnica.CDS_V_SolicitFornLojas.Close;

  bgProcessar:=True;
  Close;
end;

procedure TFrmSolicitacoes.Dbg_SolicitFornLojasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If not (gdSelected in State) Then
  Begin
    If DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString='SIM' then
    Begin
      Dbg_SolicitFornLojas.Canvas.Brush.Color:=clYellow;

      Dbg_SolicitFornLojas.Canvas.FillRect(Rect);
      Dbg_SolicitFornLojas.DefaultDrawDataCell(Rect,Column.Field,state);
    End; // If DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString='SIM' then

    DMLojaUnica.CDS_V_SolicitFornLojasDTA_SOLICITACAO.Alignment:=taCenter;
  End;

end;

procedure TFrmSolicitacoes.Dbg_SolicitFornLojasDblClick(Sender: TObject);
Var
  i: Integer;
  sDemaAtual, sDemandas: String;
begin
  If Not DMLojaUnica.CDS_V_SolicitFornLojas.IsEmpty Then
  Begin
    i:=DMLojaUnica.CDS_V_SolicitFornLojas.RecNo;

    If DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString='SIM' Then
     Begin
       DMLojaUnica.CDS_V_SolicitFornLojas.Edit;
       DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString:='NAO';
       DMLojaUnica.CDS_V_SolicitFornLojas.Post;
     End
    Else // If DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString='SIM' Then
     Begin
        sDemaAtual:=DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES1.AsString+
                    DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES2.AsString+
                    DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES3.AsString+
                    DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES4.AsString+
                    DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES5.AsString+
                    DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES6.AsString+
                    DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES7.AsString+
                    DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES8.AsString;

       DMLojaUnica.CDS_V_SolicitFornLojas.DisableControls;
       bgSiga:=True;
       DMLojaUnica.CDS_V_SolicitFornLojas.First;
       While Not DMLojaUnica.CDS_V_SolicitFornLojas.Eof do
       Begin
         If (i<>DMLojaUnica.CDS_V_SolicitFornLojas.RecNo) And (DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString='SIM')Then
         Begin
           sDemandas:=DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES1.AsString+
                      DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES2.AsString+
                      DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES3.AsString+
                      DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES4.AsString+
                      DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES5.AsString+
                      DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES6.AsString+
                      DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES7.AsString+
                      DMLojaUnica.CDS_V_SolicitFornLojasDEM_MES8.AsString;

           If sDemaAtual<>sDemandas Then
           Begin
             bgSiga:=False;
             Break;
           end; // If sDemaAtual<>sDemandas Then
         End; // If i<>DMLojaUnica.CDS_V_SolicitFornLojas.RecNo Then

         DMLojaUnica.CDS_V_SolicitFornLojas.Next;
       End; // While Not DMLojaUnica.CDS_V_SolicitFornLojas.Eof do
       DMLojaUnica.CDS_V_SolicitFornLojas.EnableControls;

       DMLojaUnica.CDS_V_SolicitFornLojas.RecNo:=i;

       If bgSiga Then
        Begin
          // Grava SIM
          DMLojaUnica.CDS_V_SolicitFornLojas.Edit;
          DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString:='SIM';
          DMLojaUnica.CDS_V_SolicitFornLojas.Post;
        End
       Else // If bgSiga Then
        Begin
          // Não Altera Demandas Diferentes
          msg('Impossivel Selecionar !!'+cr+cr+'Os Períodos de Demandas são Diferentes !!','A');
        End;
     End; // If DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString='SIM' Then

  End; // If Not DMLojaUnica.CDS_V_SolicitFornLojas.IsEmpty Then
end;

procedure TFrmSolicitacoes.Ckb_SolicitFornLojasMostraLojaClick(Sender: TObject);
Var
  i: Integer;
begin
  AcertaCkb_Style(Ckb_SolicitFornLojasMostraLoja);

  i:=DMLojaUnica.CDS_V_SolicitFornLojas.RecNo;

  DMLojaUnica.CDS_V_SolicitFornLojas.DisableControls;
  If Not Ckb_SolicitFornLojasMostraLoja.Checked Then
   Begin
     DMLojaUnica.CDS_V_SolicitFornLojas.First;
     While Not DMLojaUnica.CDS_V_SolicitFornLojas.Eof do
     Begin

       If DMLojaUnica.CDS_V_SolicitFornLojasESTE.AsString='N' Then
       Begin
         DMLojaUnica.CDS_V_SolicitFornLojas.Edit;
         DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString:='NAO';
         DMLojaUnica.CDS_V_SolicitFornLojas.Post;
       End; // If DMLojaUnica.CDS_V_SolicitFornLojasESTE.AsString='N' Then

       DMLojaUnica.CDS_V_SolicitFornLojas.Next;
     End; // While Not DMLojaUnica.CDS_V_SolicitFornLojas.Eof do

     // Apresenta Fornecedores Distintos
     Dbg_SolicitFornLojas.Columns[3].Visible:=False;
     Dbg_SolicitFornLojas.Columns[4].Visible:=False;
     DMLojaUnica.CDS_V_SolicitFornLojas.Filter:='ESTE='+QuotedStr('S');
     DMLojaUnica.CDS_V_SolicitFornLojas.Filtered:=True;
   End
  Else // If Not Ckb_SolicitFornLojasMostraLoja.Checked Then
   Begin
     // Apresenta Toodos Fornecedores e Lojas
     Dbg_SolicitFornLojas.Columns[3].Visible:=True;
     Dbg_SolicitFornLojas.Columns[4].Visible:=True;
     DMLojaUnica.CDS_V_SolicitFornLojas.Filter:='';
     DMLojaUnica.CDS_V_SolicitFornLojas.Filtered:=False;
   End; // If Not Ckb_SolicitFornLojasMostraLoja.Checked Then
  DMLojaUnica.CDS_V_SolicitFornLojas.EnableControls;

  If i<=DMLojaUnica.CDS_V_SolicitFornLojas.RecordCount Then
   DMLojaUnica.CDS_V_SolicitFornLojas.RecNo:=i;

end;

procedure TFrmSolicitacoes.Ckb_ValesAtivosClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_ValesAtivos);
end;

procedure TFrmSolicitacoes.Ckb_ValesInativosClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_ValesInativos);

end;

procedure TFrmSolicitacoes.Ckb_ValesAtivosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ValesInativosClick(Self);
end;

procedure TFrmSolicitacoes.Ckb_ValesInativosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ValesInativosClick(Self);
end;

procedure TFrmSolicitacoes.Ckb_SolicitFornLojasMostraLojaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_SolicitFornLojasMostraLojaClick(Self);
end;

procedure TFrmSolicitacoes.Dbg_SolicitFornLojasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
begin
  If Key=VK_F4 Then
  Begin
    If Not DMLojaUnica.CDS_V_SolicitFornLojas.IsEmpty Then
    Begin
      s:='';
      If InputQuery('Localizar Fornecedor','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            DMLojaUnica.CDS_V_SolicitFornLojas.Locate('COD_FORNECEDOR',FormatFloat('000000',StrToInt(s)),[]);
          Except
            s:=AnsiUpperCase(s);
            i:=DMLojaUnica.CDS_V_SolicitFornLojas.RecNo;
            If Not LocalizaRegistro(DMLojaUnica.CDS_V_SolicitFornLojas, 'NOMEFORNECEDOR', s) Then
             DMLojaUnica.CDS_V_SolicitFornLojas.RecNo:=i;
          End;
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Fornecedor','',s) then
    End; // If Not DMLojaUnica.CDS_V_SolicitFornLojas.IsEmpty Then
  End; // If Key=VK_F4 Then
  Dbg_SolicitFornLojas.SetFocus;

end;

procedure TFrmSolicitacoes.Ckb_ParamTaxaSindVlrTaxaClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_ParamTaxaSindVlrTaxa);
end;

procedure TFrmSolicitacoes.Ckb_ParamTaxaSindVlrTaxaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ParamTaxaSindVlrTaxaClick(Self);
end;

procedure TFrmSolicitacoes.Ckb_MargemLucroPcCustoTEClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_MargemLucroPcCustoTE);

end;

procedure TFrmSolicitacoes.Ckb_MargemLucroPcCustoTEKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_MargemLucroPcCustoTEClick(Self);
end;

procedure TFrmSolicitacoes.Bt_SolicitFornLojasLixeiraClick(Sender: TObject);
Var
  sCodLoja, sCodForn, sDtaSolicit: String;
  MySql: String;
begin
  sCodForn:='';
  sCodForn:='';
  sDtaSolicit:='';

  DMLojaUnica.CDS_V_SolicitFornLojas.First;
  DMLojaUnica.CDS_V_SolicitFornLojas.DisableControls;
  While Not DMLojaUnica.CDS_V_SolicitFornLojas.Eof do
  Begin
    If DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString='SIM' Then
    Begin
      // Guarda Codigos de Fornecedores --------------------------
      If Trim(sCodForn)='' Then
       Begin
         sCodForn:=QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasCOD_FORNECEDOR.AsString);
       End
      Else // If Trim(sCodForn)='' Then
       Begin
         If Not AnsiContainsStr(sCodForn, QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasCOD_FORNECEDOR.AsString)) Then
          sCodForn:=sCodForn+', '+QuotedStr(DMLojaUnica.CDS_V_SolicitFornLojasCOD_FORNECEDOR.AsString);
       End; // If Trim(sCodForn)='' Then

      // Guarda Codigos de Lojas e Data da Solicitação ------------
      If Dbg_SolicitFornLojas.Columns[3].Visible Then
      Begin
        If Trim(sCodLoja)='' Then
         Begin
           sCodLoja:=QuotedStr(Copy(DMLojaUnica.CDS_V_SolicitFornLojasCOD_LOJA.AsString,5,2));
         End
        Else // If Trim(sCodLoja)='' Then
         Begin
           If Not AnsiContainsStr(sCodLoja, QuotedStr(Copy(DMLojaUnica.CDS_V_SolicitFornLojasCOD_LOJA.AsString,5,2))) Then
            sCodLoja:=QuotedStr(Copy(DMLojaUnica.CDS_V_SolicitFornLojasCOD_LOJA.AsString,5,2));
         End; // If Trim(sCodLoja)='' Then


        If Trim(sDtaSolicit)='' Then
         Begin
          sDtaSolicit:=QuotedStr(f_Troca('/','.',f_Troca('-','.',DMLojaUnica.CDS_V_SolicitFornLojasDTA_SOLICITACAO.AsString)));
         End
        Else // If Trim(sDtaSolicit)='' Then
         Begin
           If Not AnsiContainsStr(sDtaSolicit, QuotedStr(f_Troca('/','.',f_Troca('-','.',DMLojaUnica.CDS_V_SolicitFornLojasDTA_SOLICITACAO.AsString)))) Then
            sDtaSolicit:=sDtaSolicit+', '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DMLojaUnica.CDS_V_SolicitFornLojasDTA_SOLICITACAO.AsString)));
         End; // If Trim(sCosDtaSolicitdLoja)='' Then
      End; // If Dbg_SolicitFornLojas.Columns[3].Visible Then
    End; // If DMLojaUnica.CDS_V_SolicitFornLojasPROC.AsString='SIM' Then

    DMLojaUnica.CDS_V_SolicitFornLojas.Next
  End; // While Not DMLojaUnica.CDS_V_SolicitFornLojas.Eof do
  DMLojaUnica.CDS_V_SolicitFornLojas.EnableControls;
  DMLojaUnica.CDS_V_SolicitFornLojas.First;

  // Verifica se é Para Colocar na Lixeira a Solicitação =======================
  If Trim(sCodForn)='' Then
  Begin
    msg('SEM Solicitação Selecionada !!','A');
    Dbg_SolicitFornLojas.SetFocus;
    Exit;
  End; // If Trim(sCodForn)='' Then

  If (Trim(sCodForn)<>'') And (Trim(sCodLoja)='') And (Trim(sDtaSolicit)='') Then
   sgMensagem:='Deseja Realmente Enviar para LIXEIRA'+cr+
               'TODAS as Solicitações em Aberto'+cr+
               'do(s) Fornecedor(es) Selecionado(s) ???'
  Else
   sgMensagem:='Deseja Realmente Enviar para LIXEIRA'+cr+
               'as Solicitações Selecionada(s) ???';

  If msg(sgMensagem,'C')=2 Then
  Begin
    Dbg_SolicitFornLojas.SetFocus;
    Exit;
  End; // If Trim(sCodForn)='' Then
  sgMensagem:='';

  // ENVIA SOLICITAÇÕES PARA LIXEIRA ===========================================
  // IND_OC_GERADA = (L)ixeira
  // DTA_OC_GERADA = DATA DO ENVIO PARA LIXEIRA
  // NUM_OC_GERADA = 999999999 9/9
  // Verifica se Transação esta Ativa
  //============================================================================
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

    MySql:=' UPDATE OC_COMPRAR_LOJAS ol'+
           ' Set ol.IND_OC_GERADA='+QuotedStr('L')+
           ',    ol.DTA_OC_GERADA=current_timestamp'+
           ',    ol.NUM_OC_GERADA=999999999'+

           ' WHERE ol.ind_oc_gerada='+QuotedStr('N')+
           ' AND   ol.cod_fornecedor IN ('+sCodForn+')';

           If Trim(sCodLoja)<>'' Then
            MySql:=MySql+' AND   ol.cod_empresa IN ('+sCodLoja+')';

           If Trim(sDtaSolicit)<>'' Then
            MySql:=MySql+' AND   CAST(ol.dta_documento AS DATE) IN ('+sDtaSolicit+')';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

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
      Exit;
    End; // on e : Exception do
  End; // Try

  // Busca Fornecedores de Lojas Unicas a Importar =============================
  If Not FrmBelShop.LojaUnicaFornecedorImportar Then
  Begin
    sgMensagem:='';
    Bt_SolicitFornLojasVoltarClick(Self);
    Exit;
  End;
  Ckb_SolicitFornLojasMostraLoja.Checked:=False;
  Ckb_SolicitFornLojasMostraLojaClick(Self);
  sgMensagem:='';
end;

procedure TFrmSolicitacoes.Bt_EdtProfSelecionaVoltarClick(Sender: TObject);
begin
  // Usado no Botao Bt_ApresGridVoltar

  DMSalao.CDS_V_ProfSeleciona.Close;
  bgProcessar:=False;
  Close;
end;

procedure TFrmSolicitacoes.Bt_EdtProfSelecionaLocalizaClick(Sender: TObject);
Var
  MySql: String;
begin
  // Cria ClientDataSet Virtual - CDS_V_ProfSeleciona ========================
  If DMSalao.CDS_V_ProfSeleciona.Active Then
   DMSalao.CDS_V_ProfSeleciona.Close;

  DMSalao.CDS_V_ProfSeleciona.CreateDataSet;
  DMSalao.CDS_V_ProfSeleciona.Open;

  If Trim(EdtProfSelecionaNome.Text)='' Then
  Begin
    msg('Favor Informar o Nome do'+cr+cr+'Profissional a Selecionar !!','A');
    EdtProfSelecionaNome.SetFocus;
    Exit;
  End;

  MySql:=' SELECT ''NAO'' PROC, p.cod_loja, p.des_profissional, p.des_apelido,'+
         '        p.cod_profissional, p.num_cpf, p.ind_ativo'+
         ' FROM SAL_PROFISSIONAIS p'+
         ' WHERE p.tip_pessoa='+QuotedStr('P')+
         ' AND   p.des_profissional LIKE '+QuotedStr('%'+EdtProfSelecionaNome.Text+'%');

         If Cbx_ProfSelecionaSituacao.ItemIndex=0 Then MySql:=MySql+' AND p.ind_ativo=''SIM''';
         If Cbx_ProfSelecionaSituacao.ItemIndex=1 Then MySql:=MySql+' AND p.ind_ativo=''NAO''';

         MySql:=MySql+' Order by p.cod_loja, p.des_profissional';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)='' Then
  Begin
    msg('Sem Profissional a Listar !!','A');
    EdtProfSelecionaNome.SetFocus;
    MySql:='';
  End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)='' Then

  If MySql<>'' Then
  Begin
    DMSalao.CDS_V_ProfSeleciona.Data:=DMBelShop.CDS_BuscaRapida.Data;
    DMSalao.CDS_V_ProfSeleciona.Last;
    DMSalao.CDS_V_ProfSeleciona.First;
    Dbg_ProfSeleciona.SetFocus;
  End;

  DMBelShop.CDS_BuscaRapida.Close;
end;

procedure TFrmSolicitacoes.Dbg_ProfSelecionaDblClick(Sender: TObject);
Var
  i: Integer;
begin

  If Not DMSalao.CDS_V_ProfSeleciona.IsEmpty Then
  Begin
    sgTipoDML:='';
    sgCodigo :='';

    i:=DMSalao.CDS_V_ProfSeleciona.RecNo;

    DMSalao.CDS_V_ProfSeleciona.First;
    DMSalao.CDS_V_ProfSeleciona.DisableControls;
    While Not DMSalao.CDS_V_ProfSeleciona.Eof do
    Begin

      DMSalao.CDS_V_ProfSeleciona.Edit;
      If i=DMSalao.CDS_V_ProfSeleciona.RecNo Then
       Begin
         DMSalao.CDS_V_ProfSelecionaPROC.AsString:='SIM';
         sgCodigo:=DMSalao.CDS_V_ProfSelecionaCOD_PROFISSIONAL.AsString;
         sgTipoDML:=DMSalao.CDS_V_ProfSelecionaCOD_LOJA.AsString;
       End
      Else
       Begin
         DMSalao.CDS_V_ProfSelecionaPROC.AsString:='NAO';
       End;
      DMSalao.CDS_V_ProfSeleciona.Post;

      DMSalao.CDS_V_ProfSeleciona.Next
    End;
    DMSalao.CDS_V_ProfSeleciona.EnableControls;

    // Posiciona no Marcado
    DMSalao.CDS_V_ProfSeleciona.RecNo:=i;
  End; // If Not DMLojaUnica.CDS_V_SolicitFornLojas.IsEmpty Then
end;

procedure TFrmSolicitacoes.Dbg_ProfSelecionaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If not (gdSelected in State) Then
  Begin
    If Not DMSalao.CDS_V_ProfSeleciona.IsEmpty Then
    Begin
      If DMSalao.CDS_V_ProfSelecionaPROC.AsString='SIM' then
      Begin
        Dbg_ProfSeleciona.Canvas.Brush.Color:=clYellow;

        Dbg_ProfSeleciona.Canvas.FillRect(Rect);
        Dbg_ProfSeleciona.DefaultDrawDataCell(Rect,Column.Field,state);
      End; // If DMSalao.CDS_V_ProfSelecionaPROC.AsString='SIM' then

      DMSalao.CDS_V_ProfSelecionaCOD_LOJA.Alignment:=taCenter;
      DMSalao.CDS_V_ProfSelecionaIND_ATIVO.Alignment:=taCenter;
    End; // If Not DMSalao.CDS_V_ProfSeleciona.IsEmpty Then
  End;
end;

procedure TFrmSolicitacoes.Bt_EdtProfSelecionaSelecionarClick(Sender: TObject);
begin

  If Not DMSalao.CDS_V_ProfSeleciona.IsEmpty Then
  Begin
    If Not ClientMarcado(DMSalao.CDS_V_ProfSeleciona,'PROC', 'SIM') Then
    Begin
      msg('Sem Profissiona Selecionado !!', 'A');
      Exit;
    End;

    DMSalao.CDS_V_ProfSeleciona.Locate('COD_LOJA;COD_PROFISSIONAL',VarArrayOf([sgTipoDML,sgCodigo]),[]);

    bgProcessar:=True;
    Close;
  End; // If Not DMSalao.CDS_V_ProfSeleciona.IsEmpty Then

end;

procedure TFrmSolicitacoes.Bt_ApresGridSalvaExcelClick(Sender: TObject);
begin
  If Dbg_ApresGrid.DataSource=DMSalao.DS_ApresGrid Then
  Begin
    If DMSalao.CDS_ApresGrid.IsEmpty Then
     Exit;
  End;

  ExportDBGridExcel(True, Dbg_ApresGrid, FrmSolicitacoes);

end;

procedure TFrmSolicitacoes.Bt_ApresGridClipboardClick(Sender: TObject);
begin
  If Dbg_ApresGrid.DataSource=DMSalao.DS_ApresGrid Then
  Begin
    If DMSalao.CDS_ApresGrid.IsEmpty Then
     Exit;
  End;

  DBGridClipboard(Dbg_ApresGrid);
end;

procedure TFrmSolicitacoes.PC_FinanPlanFinanceiraSolicitaChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_FinanPlanFinanceiraSolicita);

  If (PC_FinanPlanFinanceiraSolicita.ActivePage=Ts_FinanPlanFinanceiraSolicitaDatas) And (Ts_FinanPlanFinanceiraSolicitaDatas.CanFocus) Then
  Begin
    DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
  End;

  If (PC_FinanPlanFinanceiraSolicita.ActivePage=Ts_FinanPlanFinanceiraSolicitaTamColunas) And (Ts_FinanPlanFinanceiraSolicitaTamColunas.CanFocus) Then
  Begin
    EdtFinanPlanFinanceiraTamColunasNaoFixadas.SetFocus;
  End;
end;

procedure TFrmSolicitacoes.Rb_FinanPlanFinanceiraUsarDtaDoctoClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_FinanPlanFinanceiraUsarMesAno);
  AcertaRb_Style(Rb_FinanPlanFinanceiraUsarDtaComprov);
  AcertaRb_Style(Rb_FinanPlanFinanceiraUsarDtaDocto);

  Ts_FinanPlanFinanceiraPeriodoMesAno.TabVisible:=False;
  Ts_FinanPlanFinanceiraPeriodoData.Caption:=Rb_FinanPlanFinanceiraUsarDtaDocto.Caption;
  Ts_FinanPlanFinanceiraPeriodoData.TabVisible:=True;

end;

procedure TFrmSolicitacoes.Rb_FinanPlanFinanceiraUsarDtaComprovClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_FinanPlanFinanceiraUsarMesAno);
  AcertaRb_Style(Rb_FinanPlanFinanceiraUsarDtaComprov);
  AcertaRb_Style(Rb_FinanPlanFinanceiraUsarDtaDocto);

  Ts_FinanPlanFinanceiraPeriodoMesAno.TabVisible:=False;
  Ts_FinanPlanFinanceiraPeriodoData.Caption:=Rb_FinanPlanFinanceiraUsarDtaComprov.Caption;
  Ts_FinanPlanFinanceiraPeriodoData.TabVisible:=True;

end;

procedure TFrmSolicitacoes.Rb_FinanPlanFinanceiraUsarMesAnoClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_FinanPlanFinanceiraUsarMesAno);
  AcertaRb_Style(Rb_FinanPlanFinanceiraUsarDtaComprov);
  AcertaRb_Style(Rb_FinanPlanFinanceiraUsarDtaDocto);

  Ts_FinanPlanFinanceiraPeriodoData.TabVisible:=False;
  Ts_FinanPlanFinanceiraPeriodoMesAno.TabVisible:=True;

end;

procedure TFrmSolicitacoes.Cbx_FinanPlanFinanceiraMes1Exit(Sender: TObject);
Var
  i: Integer;
  b: Boolean;
begin
  b:=False;
  For i:=1 to 12 do
  Begin
    If AnsiUpperCase(LongMonthNames[i])=Cbx_FinanPlanFinanceiraMes1.Text Then
     b:=True;
  end;

  If Not b Then
  Begin
    msg('Mês Informado é Inválido !!','A');
    Cbx_FinanPlanFinanceiraMes1.SetFocus;
    Exit;
  End;
end;

procedure TFrmSolicitacoes.Cbx_FinanPlanFinanceiraMes2Exit(Sender: TObject);
Var
  i: Integer;
  b: Boolean;
begin
  b:=False;
  For i:=1 to 12 do
  Begin
    If AnsiUpperCase(LongMonthNames[i])=Cbx_FinanPlanFinanceiraMes2.Text Then
     b:=True;
  end;

  If Not b Then
  Begin
    msg('Mês Informado é Inválido !!','A');
    Cbx_FinanPlanFinanceiraMes2.SetFocus;
    Exit;
  End;
end;

procedure TFrmSolicitacoes.Bt_FinanPlanFinanceiraPeriodoOKClick(Sender: TObject);
Var
  s: String;
  i: Integer;
begin
  // Apropriação por Mes e Ano =================================================
  If Rb_FinanPlanFinanceiraUsarMesAno.Checked Then
  Begin
    If Cbx_FinanPlanFinanceiraMes1.Text='' Then
    Begin
      msg('Favor Informar o Mês de Apropriação !!','A');
      Cbx_FinanPlanFinanceiraMes1.SetFocus;
      Exit;
    End;

    If EdtFinanPlanFinanceiraAno1.Value=0 Then
    Begin
      msg('Favor Informar o Ano de Apropriação !!','A');
      EdtFinanPlanFinanceiraAno1.SetFocus;
      Exit;
    End;

    If Cbx_FinanPlanFinanceiraMes2.Text='' Then
    Begin
      msg('Favor Informar o Mês de Apropriação !!','A');
      Cbx_FinanPlanFinanceiraMes2.SetFocus;
      Exit;
    End;

    If EdtFinanPlanFinanceiraAno2.Value=0 Then
    Begin
      msg('Favor Informar o Ano de Apropriação !!','A');
      EdtFinanPlanFinanceiraAno2.SetFocus;
      Exit;
    End;

    s:=FrmBelShop.PlanFinanceiraMesAno;
    If s='' Then
    Begin
      msg('Período Inválido!!','A');
      Cbx_FinanPlanFinanceiraMes1.SetFocus;
      Exit;
    End;
    sgMesAnoPlanFinanceira:=s;

    If msg('O Período Informado Esta CORRETO ??','C')=2 Then
    Begin
      Cbx_FinanPlanFinanceiraMes1.SetFocus;
      Exit;
    End;
    FrmBelShop.EdtFinanPlanFinanceiraPeriodo.Text:='Período de '+
                                        Cbx_FinanPlanFinanceiraMes1.Text+'/'+EdtFinanPlanFinanceiraAno1.Text+' a '+
                                        Cbx_FinanPlanFinanceiraMes2.Text+'/'+EdtFinanPlanFinanceiraAno2.Text;
  End; // If Rb_FinanPlanFinanceiraUsarMesAno.Checked Then

  // Apropriação por Período ===================================================
  If Not Rb_FinanPlanFinanceiraUsarMesAno.Checked Then
  Begin
    Try
      StrToDate(DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.Text);
    Except
      msg('Data Inicial do Período Inválida !!','A');
      DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
      Exit;
    End;

    Try
      StrToDate(DtEdt_FinanPlanFinanceiraPeriodoDtaFim.Text);
    Except
      msg('Data Final do Período Inválida !!','A');
      DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
      Exit;
    End;

    If DtEdt_FinanPlanFinanceiraPeriodoDtaFim.Date<DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.Date Then
    Begin
      msg('Período Inválido !!','A');
      DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
      Exit;
    End;

    If msg('O Período Informado Esta CORRETO ??','C')=2 Then
    Begin
      DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
      Exit;
    End;

    If Rb_FinanPlanFinanceiraUsarDtaDocto.Checked Then
    Begin
     i:=QuantidadeMesesPeirodo(DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.Date, DtEdt_FinanPlanFinanceiraPeriodoDtaFim.Date);
     If i>12 Then
     Begin
       msg('O Período Deverá SER no Máximo'+cr+cr+'de 12 Meses ??','A');
       DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
       Exit;
     End;

     sgMesAnoPlanFinanceira:=' And m.datadocumento>='+QuotedStr(DateToStr(
                             DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.Date))+
                             ' And m.datadocumento<='+QuotedStr(DateToStr(
                             DtEdt_FinanPlanFinanceiraPeriodoDtaFim.Date));
    End; // If Rb_FinanPlanFinanceiraUsarDtaDocto.Checked Then

    If Rb_FinanPlanFinanceiraUsarDtaComprov.Checked Then
    Begin
     i:=QuantidadeMesesPeirodo(DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.Date, DtEdt_FinanPlanFinanceiraPeriodoDtaFim.Date);
     If i>12 Then
     Begin
       msg('O Período Deverá SER no Máximo'+cr+cr+'de 12 Meses ??','A');
       DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
       Exit;
     End;

     sgMesAnoPlanFinanceira:=' And m.datacomprovante>='+QuotedStr(DateToStr(
                             DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.Date))+
                             ' And m.datacomprovante<='+QuotedStr(DateToStr(
                             DtEdt_FinanPlanFinanceiraPeriodoDtaFim.Date));
    End; // If Rb_FinanPlanFinanceiraUsarDtaComprov.Checked Then

    sgMesAnoPlanFinanceira:=f_Troca('/','.',sgMesAnoPlanFinanceira);

    FrmBelShop.EdtFinanPlanFinanceiraPeriodo.Text:='Período de '+
                                        DateToStr(DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.Date)+
                                        ' a '+
                                        DateToStr(DtEdt_FinanPlanFinanceiraPeriodoDtaFim.Date);
  End; // If Not Rb_FinanPlanFinanceiraUsarMesAno.Checked Then

  bgProcessar:=True;
  Close;

end;

procedure TFrmSolicitacoes.Bt_FinanPlanFinanceiraPeriodoVoltarClick(Sender: TObject);
begin
  bgProcessar:=False;
  Close;

end;

procedure TFrmSolicitacoes.Bt_ProSoftImpArquivoClick(Sender: TObject);
Var
  OpenDialog: TOpenDialog;

  tsArquivo: TStringList;
  i, iPosIni, iPosFin: Integer;
  sLinha, sCodContabil: String;
  MySql: String;
begin
  EdtProSoftImpPastaArquivoChange(Self);

  sgNomeArq:='';
  OpenDialog := TOpenDialog.Create(Self);
  With OpenDialog do
  Begin
    Options := [ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
    DefaultExt := 'TXT;txt';
    Filter := 'Arquivo TXT (*.txt)|*.txt';
    FilterIndex := 1;
    Title := 'Busca Arquivo Texto para ProSoft';

    If Execute then
     Begin
       EdtProSoftImpPastaArquivo.Text:=OpenDialog.FileName;
       EditorProSoftImpArquivo.Lines.LoadFromFile(EdtProSoftImpPastaArquivo.Text);

       // Monta Nome do Arquivo -------------------------------------
       tsArquivo:=TStringList.Create;

       Try
         tsArquivo.LoadFromFile(EdtProSoftImpPastaArquivo.Text);

         For i := 0 to tsArquivo.Count - 1 do
         Begin
           sLinha:=AnsiUpperCase(Trim(tsArquivo[i]));

           If (AnsiContainsStr(sLinha, 'EMPRESA: ')) Then
           Begin
             iPosIni:=pos('Empresa:',sLinha);
             iPosIni:=iPosIni+length('Empresa: ');
             iPosFin:=pos('-',sLinha);
             sCodContabil:=Trim(copy(sLinha,iPosIni,iPosFin-iPosIni));

             // Busca Lojas =============================================================
             MySql:=' Select e.COD_FILIAL, e.RAZAO_SOCIAL, e.COD_CONTABIL'+
                    ' From EMP_CONEXOES e'+
                    ' Where e.COD_CONTABIL='+QuotedStr(sCodContabil);
             DMBelShop.CDS_BuscaRapida.Close;
             DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
             DMBelShop.CDS_BuscaRapida.Open;

             If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString)='' Then
             Begin
               msg('Loja NÃO Encontrada com Código'+cr+'Contabil Igual a '+sCodContabil+' !!', 'A');
               DMBelShop.CDS_BuscaRapida.Close;
               EdtProSoftImpPastaArquivo.SetFocus;
               Exit;
             End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString)='' Then

             sgNomeArq:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString+'_'+
                        DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;

             DMBelShop.CDS_BuscaRapida.Close;

             Break;
           End; // If (AnsiContainsStr(sLinha, 'EMPRESA: ')) Then
         End; // For i := 0 to tsArquivo.Count - 1 do
       Finally // Try
         Begin
           DMBelShop.CDS_BuscaRapida.Close;
           FreeAndNil(tsArquivo);
         End;
       End; // Try
       FreeAndNil(tsArquivo);
     End
    Else // if Execute then
     Begin
       Free;
       Exit;
     End; // if Execute then
  End; // With OpenDialog do
end;

procedure TFrmSolicitacoes.Bt_ProSoftImpArquivoSalvarClick(Sender: TObject);
Var
  SaveDialog: TSaveDialog;
begin

  If Trim(sgNomeArq)='' Then
  Begin
    msg('Favor Informar a Pasta e o Arquivo'+cr+'de ORIGEM a Importar!!','A');
    Bt_ProSoftImpArquivo.SetFocus;
    Exit;
  End;

  EdtProSoftImpArquivoSalvar.Clear;

  SaveDialog := TSaveDialog.Create(Self);
  With SaveDialog do
  Begin
    Options := [ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
    FileName:=sgNomeArq;
    DefaultExt := 'txt';
    Filter := 'Arquivo TXT ('+sgNomeArq+')|';
    FilterIndex := 1;
    Title := 'Salvar Arquivo Texto para ProSoft';

    if Execute then
     Begin
        EdtProSoftImpArquivoSalvar.Text:=SaveDialog.FileName;
     End
    else // if Execute then
     begin
       Free;
       Exit;
     end; // if Execute then
  End; // With OpenDialog do
end;

procedure TFrmSolicitacoes.Bt_ProSoftImpArqImportaClick(Sender: TObject);
var
  tsArquivo: TStringList;
  tsArqNovo: TStringList;
  i, iPosIni, iPosFin: Integer;
  s, sLinha, sLinhaNova: String;
  MySql: String;

  bProcOK: Boolean;

  // Repete Uma Vez ============================================================
  sCodContabil,           // Código Contabil   => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA
  sCodigoEmpresa,         // Código da Loja    => É Informado
  sNomeEmpresa,           // Nome da Empresa   => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA
  sNomeFilial,            // Nome da Filial    => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA
  sCodigoFilial,          // Código da Filial  => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA

  // Repete Tantos quantos Tiverem =============================================
  sMatriculaFuncionario,  // Matrícula do Funcionário => Funcionario:   00031  /  ADRIANA GARCIA NUNES
  sNomeFuncionario,       // Nome do Funcionário      => Funcionario:   00031  /  ADRIANA GARCIA NUNES
  sCargo,                  // Cargo                    => Funcao:  AUXILIAR LIMPEZA

  sDataAdmissao,          // Data de Admissão         => Admissao: 07/11/2007
  sDataDemissao,          // Data de Demissão         => Demissao: 17/03/2008

  sSexo,                  // Sexo                     => Sexo: 2-Feminino ou Sexo: 1-Masculino
  sDataNascimento,        // Data de Nascimento       => Data de Nascimento: 26/04/1960

  sCPF,                   // CFP                      => CPF: 003.264.090-09
  sPIS,                   // PIS                      => PIS: 12745036671

  sTipoFuncionario,       // Tipo de Funcionário      => Condicao: 0-Ativo ou Inativo
  sEstadoCivil           // Estado Civil             => Est.Civil: 1-Solteiro 2-Casado 3-Desquitado 4-Divorciado 5-Outros 6-Viuvo
  : String;

  bGrava: Boolean;     // Se Data de Demissão < 01/05/2015 Não gravar
begin

  If EditorProSoftImpArquivo.Lines.Count<1 Then
  Begin
    msg('Favor Informar a Pasta e o Arquivo'+cr+'de ORIGEM a Importar!!','A');
    Bt_ProSoftImpArquivo.SetFocus;
    Exit;
  End;

  If Trim(EdtProSoftImpPastaArquivo.Text)='' Then
  Begin
    msg('Favor Informar a Pasta e o Arquivo'+cr+'de ORIGEM a Importar !!','A');
    Bt_ProSoftImpArquivo.SetFocus;
    Exit;
  End;

  If Trim(EdtProSoftImpArquivoSalvar.Text)='' Then
  Begin
    msg('Favor Informar a Pasta e o Arquivo'+cr+'de DESTINO a Salvar !!','A');
    Bt_ProSoftImpArquivoSalvar.SetFocus;
    Exit;
  End;

  If Trim(ExtractName(EdtProSoftImpPastaArquivo.Text))=Trim(ExtractName(EdtProSoftImpArquivoSalvar.Text)) Then
  Begin
    msg('Arquivos com o Mesmo Nome !!'+cr+'Altere o Nome do Arquivo de DESTINO !!','A');
    EdtProSoftImpArquivoSalvar.Clear;
    Bt_ProSoftImpArquivoSalvar.SetFocus;
    Exit;
  End;

  If msg('A Data LIMITE Esta CORRETA ??','C')=2 Then
  Begin
    DtEdt_ProSoftImpDtaLimite.SetFocus;
    Exit;
  End;

  Ts_ProSoftImpArquivo.Enabled:=False;
  FrmBelShop.MontaProgressBar(True, FrmSolicitacoes);

  { Instancia a variável arquivo }
  tsArquivo:=TStringList.Create;
  tsArqNovo:=TStringList.Create;

  Try
    tsArquivo.LoadFromFile(EdtProSoftImpPastaArquivo.Text);
    pgProgBar.Properties.Max:=tsArquivo.Count;
    pgProgBar.Position:=0;

    // Repete Uma Vez ===========================================================
    sCodContabil:='';
    sCodigoEmpresa:='';
    sNomeEmpresa:='';
    sNomeFilial:='';
    sCodigoFilial:='';

    // Repete Tantos quantos Tiverem ============================================
    sMatriculaFuncionario:='';
    sNomeFuncionario:='';
    sDataAdmissao:='';
    sDataDemissao:='';
    sSexo:='';
    sPIS:='';
    sCPF:='';
    sDataNascimento:='';
    sTipoFuncionario:='';
    sEstadoCivil:='';
    sCargo:='';

    bProcOK:=True;
    For i := 0 to tsArquivo.Count - 1 do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=i+1;
      Refresh;

      sLinha:=AnsiUpperCase(Trim(tsArquivo[i]));

      // 1 ======================================================================
      // sCodContabil    -> Código Contabil   => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA
      // sCodigoEmpresa  -> Código da Loja    => É Informado
      // sNomeEmpresa    -> Nome da Empresa   => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA
      // sNomeFilial     -> Nome da Filial    => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA
      // sCodigoFilial   -> Código da Filial  => É Informado
      // 1 ======================================================================
      If (AnsiContainsStr(sLinha, 'EMPRESA: ')) and (sCodigoEmpresa='') Then
      Begin
        iPosIni:=pos('Empresa:',sLinha);
        iPosIni:=iPosIni+length('Empresa: ');
        iPosFin:=pos('-',sLinha);
        sCodContabil:=Trim(copy(sLinha,iPosIni,iPosFin-iPosIni));

        // Busca Lojas =============================================================
        MySql:=' Select e.COD_FILIAL, e.RAZAO_SOCIAL, e.COD_CONTABIL'+
               ' From EMP_CONEXOES e'+
               ' Where e.COD_CONTABIL='+QuotedStr(sCodContabil);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString)='' Then
        Begin
          msg('Loja NÃO Encontrada com Código'+cr+'Contabil Igual a '+sCodContabil+' !!', 'A');
          Screen.Cursor:=crDefault;
          DMBelShop.CDS_BuscaRapida.Close;
          Exit;
        End;

        sCodigoEmpresa:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString;
        sCodigoFilial :=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString;

        sNomeEmpresa:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
        sNomeFilial :=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
      End; // If (AnsiContainsStr(sLinha, 'EMPRESA: ')) and (sCodigoEmpresa='') Then

      // 2 ======================================================================
      // sMatriculaFuncionario -> Matrícula do Funcionário => Funcionario:   00031  /  ADRIANA GARCIA NUNES
      // sNomeFuncionario      -> Nome do Funcionário      => Funcionario:   00031  /  ADRIANA GARCIA NUNES
      // 2 ======================================================================
      If AnsiContainsStr(sLinha, 'FUNCIONARIO: ') Then
      Begin
        iPosIni:=pos('FUNCIONARIO:',sLinha);
        iPosIni:=iPosIni+length('FUNCIONARIO:');
        iPosFin:=pos('/',sLinha);

        sMatriculaFuncionario:=Trim(copy(sLinha,iPosIni,iPosFin-iPosIni));
        sNomeFuncionario:=Trim(copy(sLinha,iPosFin+1,Length(sLinha)));
      End; // If AnsiContainsStr(sLinha, 'FUNCIONARIO: ') Then

      // 3 ======================================================================
      // sSexo           -> Sexo               => Sexo:  1-Masculino
      //                                                 2-Feminino
      // sDataNascimento -> Data de Nascimento => Data de Nascimento: 26/04/1960
      // 3 ======================================================================
      If AnsiContainsStr(sLinha, 'DATA DE NASCIMENTO: ') Then
      Begin
        iPosIni:=pos('DATA DE NASCIMENTO:',sLinha);
        iPosIni:=iPosIni+length('DATA DE NASCIMENTO:');
        iPosFin:=pos('LOCAL DE NASCIMENTO:',sLinha);
        sDataNascimento:=Trim(copy(sLinha,iPosIni,iPosFin-iPosIni));
        If Trim(sDataNascimento)='/  /' Then
         sDataNascimento:=' ';

        iPosIni:=pos('SEXO:',sLinha);
        iPosIni:=iPosIni+length('SEXO:');
        iPosFin:=2;
        sSexo:=Trim(copy(sLinha,iPosIni,iPosFin));

        If sSexo='1' Then
         sSexo:='M'
        Else
         sSexo:='F';
      End; // If AnsiContainsStr(sLinha, 'DATA DE NASCIMENTO: ') Then

      // 4 ======================================================================
      // sEstadoCivil -> Estado Civil  => Est.Civil: 1-Solteiro
      //                                             2-Casado
      //                                             3-Desquitado
      //                                             4-Divorciado
      //                                             5-Outros
      //                                             6-Viuvo
      //                                             7-União Estável
      // 4 ======================================================================
      If AnsiContainsStr(sLinha, 'EST.CIVIL: ') Then
      Begin
        iPosIni:=pos('EST.CIVIL: ',sLinha);
         iPosIni:=iPosIni+length('EST.CIVIL:');
        sEstadoCivil:=Trim(copy(sLinha,iPosIni,2));

        If sEstadoCivil='1' Then sEstadoCivil:='SOLTEIRO'
        else
        If sEstadoCivil='2' Then sEstadoCivil:='CASADO'
        else
        If sEstadoCivil='3' Then sEstadoCivil:='DESQUITADO'
        else
        If sEstadoCivil='4' Then sEstadoCivil:='DIVORCIADO'
        else
        If sEstadoCivil='5' Then sEstadoCivil:='OUTROS'
        else
        If sEstadoCivil='6' Then sEstadoCivil:='VIUVO'
        else
        If sEstadoCivil='7' Then sEstadoCivil:='UNIÃO ESTÁVEL'
        Else
         sEstadoCivil:=sEstadoCivil+' - NAO EXISTENTE';
      End; // If AnsiContainsStr(sLinha, 'Est.Civil: ') Then

      // 5 ======================================================================
      // sCPF -> CFP => CPF: 003.264.090-09 (00326409009)
      // sPIS -> PIS => PIS: 12745036671
      // 5 ======================================================================
      If AnsiContainsStr(sLinha, 'CPF: ') Then
      Begin
        iPosIni:=pos('CPF:',sLinha);
        iPosIni:=iPosIni+length('CPF:');
        iPosFin:=pos('CTPS:',sLinha);
        sCPF:=Trim(copy(sLinha,iPosIni,iPosFin-iPosIni));
        sCPF:=RetiraPontosBarras(sCPF);

        iPosFin:=pos('EXP: ',sLinha);
        s:=Copy(sLinha,iPosFin+4,Length(sLinha));
        iPosIni:=pos('PIS: ',s);
        iPosIni:=iPosIni+length('PIS:');
        iPosFin:=pos('EXP: ',s);

        sPIS:=Trim(copy(s,iPosIni,iPosFin-iPosIni));
        sPIS:=RetiraPontosBarras(sPIS);
      End; // If AnsiContainsStr(sLinha, 'CPF: ') Then

      // 6 ======================================================================
      // sTipoFuncionario -> Tipo de Funcionário => Condicao: 0-Ativo ou Inativo
      // 6 ======================================================================
      If AnsiContainsStr(sLinha, 'CONDICAO: ') Then
      Begin
        iPosIni:=pos('CONDICAO:',sLinha);
        iPosIni:=iPosIni+length('CONDICAO:');
        sTipoFuncionario:=Trim(copy(sLinha,iPosIni,2));

        If sTipoFuncionario='0' Then
         sTipoFuncionario:='ATIVO'
        else
         sTipoFuncionario:='INATIVO';
      End; // If AnsiContainsStr(sLinha, 'CONDICAO: ') Then

      // 7 ======================================================================
      // sCargo        -> Cargo            => Funcao:  AUXILIAR LIMPEZA
      // sDataAdmissao -> Data de Admissão => Admissao: 07/11/2007
      // sDataDemissao -> Data de Demissão => Demissao: 17/03/2008
      // 7 ======================================================================
      If AnsiContainsStr(sLinha, 'FUNCAO: ') Then
      Begin
        iPosIni:=pos('FUNCAO:',sLinha);
        iPosIni:=iPosIni+length('FUNCAO:');
        iPosFin:=pos('ADMISSAO:',sLinha);
        sCargo:=Trim(copy(sLinha,iPosIni,iPosFin-iPosIni));

        iPosIni:=iPosFin+length('ADMISSAO:');
        iPosFin:=pos('DEMISSAO:',sLinha);
        sDataAdmissao:=Trim(copy(sLinha,iPosIni,iPosFin-iPosIni));
        If Trim(sDataAdmissao)='/  /' Then
         sDataAdmissao:=' ';

        bGrava:=True;
        iPosIni:=iPosFin+length('DEMISSAO:');
        iPosFin:=pos('EX.DEMISSAO:',sLinha);
        sDataDemissao:=Trim(copy(sLinha,iPosIni,iPosFin-iPosIni));
        If Trim(sDataDemissao)='/  /' Then
         Begin
          sDataDemissao:=' ';
          sTipoFuncionario:='ATIVO';
         End
        Else
         Begin
           If StrToDate(sDataDemissao)<DtEdt_ProSoftImpDtaLimite.Date Then
            bGrava:=False;
         End; // If Trim(sDataDemissao)='/  /' Then

        // Gera Linha ==========================================================
        sLinhaNova:='                                                                                ';

        If Not bRelSimples Then
        Begin
          insert(ZerosEsquerda(sCodigoEmpresa,2),sLinhaNova,1); // sCodigoEmpresa
          insert(BrancosDireita(sNomeEmpresa,40),sLinhaNova,3); // sNomeEmpresa
          insert(BrancosDireita(sNomeFilial,40),sLinhaNova,43); // sNomeFilial
          insert(ZerosEsquerda(sCodigoFilial,3),sLinhaNova,83); // sCodigoFilial
          insert(ZerosEsquerda(sMatriculaFuncionario,10),sLinhaNova,86); // sMatriculaFuncionario
          insert(BrancosDireita(sNomeFuncionario,40),sLinhaNova,96); // sNomeFuncionario
          insert(BrancosDireita(sDataAdmissao,10),sLinhaNova,136); // sDataAdmissao
          insert(BrancosDireita(sDataDemissao,10),sLinhaNova,146); // sDataDemissao
          insert(BrancosDireita(sSexo,1),sLinhaNova,156); // sSexo
          insert(ZerosEsquerda(sPIS,11),sLinhaNova,157); // sPIS
          insert(ZerosEsquerda(sCPF,11),sLinhaNova,168); // sCPF
          insert(BrancosDireita(sDataNascimento,10),sLinhaNova,179); // sDataNascimento
          insert(BrancosDireita(sTipoFuncionario,25),sLinhaNova,189); // sTipoFuncionario
          insert(BrancosDireita(sEstadoCivil,15),sLinhaNova,214); // sEstadoCivil
          insert(BrancosDireita(sCargo,40),sLinhaNova,229); // sCargo
          insert(BrancosDireita('N',1),sLinhaNova,269); // Filhos
          insert('00/00/0000',sLinhaNova,270); // Data de Nascimento do Filho
          insert(' ',sLinhaNova,280); // Sexo do Filho
          insert(BrancosDireita(' ',10),sLinhaNova,281); // Código da Área
          insert(BrancosDireita(' ',50),sLinhaNova,291); // Descrição da Área
        End; // If Not bRelSimples Then

        If bRelSimples Then
        Begin
          insert(Trim(sNomeFuncionario)+';'+Trim(sCPF)+';'+Trim(sDataNascimento)+';'+Trim(sTipoFuncionario)+';',sLinhaNova,1);
//
//          insert(ZerosEsquerda(sCodigoEmpresa,2),sLinhaNova,1); // sCodigoEmpresa
//          insert(BrancosDireita(sNomeEmpresa,40),sLinhaNova,3); // sNomeEmpresa
//          insert(BrancosDireita(sNomeFilial,40),sLinhaNova,43); // sNomeFilial
//          insert(ZerosEsquerda(sCodigoFilial,3),sLinhaNova,83); // sCodigoFilial
//          insert(ZerosEsquerda(sMatriculaFuncionario,10),sLinhaNova,86); // sMatriculaFuncionario
//          insert(BrancosDireita(sDataAdmissao,10),sLinhaNova,136); // sDataAdmissao
//          insert(BrancosDireita(sDataDemissao,10),sLinhaNova,146); // sDataDemissao
//          insert(BrancosDireita(sSexo,1),sLinhaNova,156); // sSexo
//          insert(ZerosEsquerda(sPIS,11),sLinhaNova,157); // sPIS
//          insert(BrancosDireita(sEstadoCivil,15),sLinhaNova,214); // sEstadoCivil
//          insert(BrancosDireita(sCargo,40),sLinhaNova,229); // sCargo
//          insert(BrancosDireita('N',1),sLinhaNova,269); // Filhos
//          insert('00/00/0000',sLinhaNova,270); // Data de Nascimento do Filho
//          insert(' ',sLinhaNova,280); // Sexo do Filho
//          insert(BrancosDireita(' ',10),sLinhaNova,281); // Código da Área
//          insert(BrancosDireita(' ',50),sLinhaNova,291); // Descrição da Área
        End; // If Not bRelSimples Then

        If bGrava Then
        Begin
          tsArqNovo.Add(sLinhaNova);
        End; // If (sDataDemissao)<>'' Then

        // Inicializa Variaveis =================================================
        sMatriculaFuncionario:='';
        sNomeFuncionario:='';
        sDataAdmissao:='';
        sDataDemissao:='';
        sSexo:='';
        sPIS:='';
        sCPF:='';
        sDataNascimento:='';
        sTipoFuncionario:='';
        sEstadoCivil:='';
        sCargo:='';
      End; // If AnsiContainsStr(sLinha, 'FUNCAO: ') Then
    End; // For i := 0 to tsArquivo.Count - 1 do

    // Verifica se é para Gravar ===============================================
    If bProcOK Then
     Begin
       tsArqNovo.SaveToFile(EdtProSoftImpArquivoSalvar.Text);

       msg('Arquivo Gerado com SUCESSO Em: '+cr+EdtProSoftImpArquivoSalvar.Text,'A');

       EdtProSoftImpPastaArquivo.Clear;
       EdtProSoftImpArquivoSalvar.Clear;
     End
    Else // If bProcOK Then
     Begin
       EdtProSoftImpPastaArquivo.Clear;
       EdtProSoftImpArquivoSalvar.Clear;
     End;  // If bProcOK Then

    FrmBelShop.MontaProgressBar(False, FrmSolicitacoes);
    Ts_ProSoftImpArquivo.Enabled:=True;

  Finally // Try
   Begin
     FreeAndNil(tsArquivo);
     FreeAndNil(tsArqNovo);
     Ts_ProSoftImpArquivo.Enabled:=True;
   End;
  End; // Try

  tsArquivo.Free;
  tsArqNovo.Free;
end;

procedure TFrmSolicitacoes.PC_FinanPlanFinanceiraPeriodoChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_FinanPlanFinanceiraPeriodo);

  If (PC_FinanPlanFinanceiraPeriodo.ActivePage=Ts_FinanPlanFinanceiraPeriodoMesAno) And (Ts_FinanPlanFinanceiraPeriodoMesAno.CanFocus) Then
  Begin
     Cbx_FinanPlanFinanceiraMes1.SetFocus;
  End;

  If (PC_FinanPlanFinanceiraPeriodo.ActivePage=Ts_FinanPlanFinanceiraPeriodoData) And (Ts_FinanPlanFinanceiraPeriodoData.CanFocus) Then
  Begin
     DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
  End;
                  
end;

procedure TFrmSolicitacoes.Bt_FinanPlanFinanceiraTamColunasOKClick(Sender: TObject);
begin
  bgProcessar:=True;
  Close;

end;

procedure TFrmSolicitacoes.EdtProSoftImpPastaArquivoChange(Sender: TObject);
begin
  EditorProSoftImpArquivo.Lines.Clear;
end;

procedure TFrmSolicitacoes.Bt_SelecionarOKClick(Sender: TObject);
begin
  // Verifica se Existe Registro Selecionado ===================================
  bgOK:=False;
  DMBelShop.CDS_Busca.First;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then
    Begin
      bgOK:=True;
    End;

    DMBelShop.CDS_Busca.Next;
  End;

  If (FrmSolicitacoes.Caption='VERIFICA POSIÇÃO DE ESTOQUES DAS LOJAS') And (bgOK) Then
  Begin
    BuscaEstoquesLojas;
    Lab_Conta.Visible:=False;
    Exit;
  End; // If FrmSolicitacoes.Caption='VERIFICA POSIÇÃO DE ESTOQUES DAS LOJAS' Then

  bgProcessar:=True;
  Close;
end;

procedure TFrmSolicitacoes.Bt_SelecionarValtarClick(Sender: TObject);
begin
  bgOK:=False;
  bgProcessar:=False;
  Close;

end;

procedure TFrmSolicitacoes.Dbg_SelecionarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;State: TGridDrawState);
Var
  bAtualizou: Boolean;
begin
  if not (gdSelected in State) Then              // hra_atualizacao
  Begin
    if DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then
     Dbg_Selecionar.Canvas.Brush.Color:=clSkyBlue;

    If FrmSolicitacoes.Caption='VERIFICA POSIÇÃO DE ESTOQUES DAS LOJAS' Then
    Begin
      If (Column.FieldName='DTA_ATUALIZACAO') Or (Column.FieldName='COD_FILIAL')Then //   ----> Este comando altera cor da Celula
      Begin
        bAtualizou:=True;
        if Trim(DMBelShop.CDS_Busca.FieldByName('DTA_ATUALIZACAO').AsString)='' Then
         bAtualizou:=False

        Else If (StrToDate(DMBelShop.CDS_Busca.FieldByName('DTA_ATUALIZACAO').AsString)=Date-1) And
                (StrToTime(DMBelShop.CDS_Busca.FieldByName('HRA_ATUALIZACAO').AsString)<StrToTime('18:00:00')) Then
         bAtualizou:=False

        Else if (StrToDate(DMBelShop.CDS_Busca.FieldByName('DTA_ATUALIZACAO').AsString)<Date-1) Then
         bAtualizou:=False;

        If Not bAtualizou Then
        Begin
          Dbg_Selecionar.Canvas.Font.Style:=[fsBold];
          Dbg_Selecionar.Canvas.Font.Color:=clWhite; //-->> Cor da Fonte
          Dbg_Selecionar.Canvas.Brush.Color:=clRed;  //-->> Cor da Celula
        End;
      End;
    End;// If FrmSolicitacoes.Caption='VERIFICA POSIÇÃO DE ESTOQUES DAS LOJAS' Then
  End;
  Dbg_Selecionar.Canvas.FillRect(Rect);
  Dbg_Selecionar.DefaultDrawDataCell(Rect,Column.Field,state);

  If FrmSolicitacoes.Caption='VERIFICA POSIÇÃO DE ESTOQUES DAS LOJAS' Then
  Begin
    DMBelShop.CDS_Busca.FieldByName('COD_FILIAL').Alignment:=taCenter;
    DMBelShop.CDS_Busca.FieldByName('DTA_ATUALIZACAO').Alignment:=taCenter;
  End;


end;

procedure TFrmSolicitacoes.Bt_SelectEmpProcMarcaTodosClick(Sender: TObject);
begin
  If DMBelShop.CDS_Busca.IsEmpty Then
   Exit;

  DMBelShop.CDS_Busca.DisableControls;
  DMBelShop.CDS_Busca.First;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    Refresh;

    DMBelShop.CDS_Busca.Edit;
    DMBelShop.CDS_Busca.FieldByName('PROC').AsString:='SIM';
    DMBelShop.CDS_Busca.Post;

    DMBelShop.CDS_Busca.Next;
  End;
  DMBelShop.CDS_Busca.EnableControls;
  DMBelShop.CDS_Busca.First;

end;

procedure TFrmSolicitacoes.Bt_SelectEmpProcDesMarcaTodosClick(Sender: TObject);
begin
  If DMBelShop.CDS_Busca.IsEmpty Then
   Exit;

  DMBelShop.CDS_Busca.DisableControls;
  DMBelShop.CDS_Busca.First;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    Refresh;

    DMBelShop.CDS_Busca.Edit;
    DMBelShop.CDS_Busca.FieldByName('PROC').AsString:='NAO';
    DMBelShop.CDS_Busca.Post;

    DMBelShop.CDS_Busca.Next;
  End;
  DMBelShop.CDS_Busca.EnableControls;
  DMBelShop.CDS_Busca.First;

end;

procedure TFrmSolicitacoes.Dbg_SelecionarDblClick(Sender: TObject);
begin
  DMBelShop.CDS_Busca.Edit;
  If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then
    DMBelShop.CDS_Busca.FieldByName('PROC').AsString:='NAO'
  Else
    DMBelShop.CDS_Busca.FieldByName('PROC').AsString:='SIM';
  DMBelShop.CDS_Busca.Post;

end;

procedure TFrmSolicitacoes.Bt_ParamCurvaDiasUteisClick(Sender: TObject);
begin
  Try
    StrToDate(DtEdt_EdtParamCurvaInicio.Text);
    StrToDate(DtEdt_EdtParamCurvaFim.Text);
  Except
    msg('Erro no Período Informado !!','A');
    DtEdt_EdtParamCurvaInicio.SetFocus;
    Exit;
  End;

  If DtEdt_EdtParamCurvaInicio.Date>DtEdt_EdtParamCurvaFim.Date Then
  Begin
    msg('Erro no Período Informado !!','A');
    DtEdt_EdtParamCurvaInicio.SetFocus;
    Exit;
  End;

  Try
    EdtParamCurvaDiasTotal.Text:=VarToStr((DtEdt_EdtParamCurvaFim.Date-DtEdt_EdtParamCurvaInicio.Date)+1);
    EdtParamCurvaDiasUteis.Value:=DiasUteisBelShop(DtEdt_EdtParamCurvaInicio.Date, DtEdt_EdtParamCurvaFim.Date,
                                                   Ckb_ParamCurvaDomingo.Checked, Ckb_ParamCurvaSabado.Checked);
  Except
    msg('Erro no Período Informado !!','A');
  End;

end;

procedure TFrmSolicitacoes.DtEdt_EdtParamCurvaInicioPropertiesChange(Sender: TObject);
begin
  EdtParamCurvaDiasTotal.Value:=0;
  EdtParamCurvaDiasUteis.Value:=0;
end;

procedure TFrmSolicitacoes.Ckb_ParamCurvaSabadoClick(Sender: TObject);
begin
  DtEdt_EdtParamCurvaInicioPropertiesChange(Self);
end;

procedure TFrmSolicitacoes.Bt_QualquerCoisaSalvarClick(Sender: TObject);
begin
  // Usado por Outros Botoes ===================================================

  If Trim((Sender as TJvXPButton).Name)='Bt_SalaoRelImprime' Then
  Begin
    If Trim(Pan_SalaoRelatorios.Caption)='' Then
    Begin
      msg('Favor Selecionar o Relatório !!','A');
      OutLook_SalaoRelatorios.SetFocus;
      Exit;
    End;

    If EdtSalaoRelCodLoja.Value=0 Then
    Begin
      If msg('Deseja Relatório de Todas as Lojas ??','C')=2 Then
      Begin
        EdtSalaoRelCodLoja.SetFocus;
        Exit;
      End;
    End;

    SalaoRelatorios;
    Exit;
  End; // If Trim((Sender as TJvXPButton).Name)='Bt_SalaoRelImprime' Then

  bgProcessar:=True;
  Close;
end;

procedure TFrmSolicitacoes.Bt_QualquerCoisaVoltarClick(Sender: TObject);
begin
  // Usado por Outros Botoes ===================================================

  If Trim((Sender as TJvXPButton).Name)='Bt_ExcelVoltar' Then
  Begin
    ADOT_Dcto.Close;
    ADOC_Excel.Connected:=False;
  End; // If Trim((Sender as TJvXPButton).Name)='Bt_ExcelVoltar' Then

  bgProcessar:=False;
  Close;

end;

procedure TFrmSolicitacoes.Bt_ExcelBuscaClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(OpenDialog);

  EdtExcelArquivo.Clear;
  EdtExcelPlanilha.Clear;

  ADOT_Dcto.Close;
  ADOC_Excel.Connected:=False;

  With OpenDialog do
  Begin
    Options := [ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
    DefaultExt := 'XLS';
    Filter := 'Planilha (*.xls)|*.xls';
    FilterIndex := 1;
    Title := 'Localiza Docto EXCEL';

    if Execute then
     Begin
       EdtExcelArquivo.Text:=OpenDialog.FileName;
       EdtExcelPlanilha.SetFocus;
     End
    Else // if Execute then
     Begin
       FreeAndNil(OpenDialog);
       Exit;
     End; // if Execute then
     FreeAndNil(OpenDialog);
  End; // With OpenDialog do
end;

procedure TFrmSolicitacoes.Bt_ExcelBuscaPlanilhaClick(Sender: TObject);
begin

  Try
    ADOC_Excel.Connected:=False;
    ADOC_Excel.ConnectionString:=
    'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;'+
    'Data Source='+EdtExcelArquivo.Text+';'+
    'Mode=Share Deny None;Extended Properties=Excel 8.0;'+
    'Persist Security Info=False;Jet OLEDB:System database="";'+
    'Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";'+
    'Jet OLEDB:Engine Type=35;Jet OLEDB:Database Locking Mode=0;'+
    'Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;'+
    'Jet OLEDB:New Database Password="";Jet OLEDB:Create System Database=False;'+
    'Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don''t Copy Locale on Compact=False;'+
    'Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False';
    ADOC_Excel.Connected:=True;

    ADOT_Dcto.TableName:=EdtExcelPlanilha.Text+'$';
    ADOT_Dcto.Open;

    Lb_Processar.Caption:=IntToStr(ADOT_Dcto.RecordCount);
    Lb_Processados.Caption:='0';
  Except
    msg('Docto/Planilha Não Encontrada !!','A');
    EdtExcelPlanilha.SetFocus;
    Exit;
  End;

end;

procedure TFrmSolicitacoes.EdtParamLojaNecesCodLojaChange(Sender: TObject);
begin
  EdtParamLojaNecesDesLoja.Clear;

end;

procedure TFrmSolicitacoes.Bt_ParamLojaNecesIncluirClick(Sender: TObject);
Var
  i: Integer;
  dDta: TDateTime;
  s, sCurvas, sManut: String;
begin
  Dbg_ParamLojaNeces.SetFocus;

  If Trim(Cbx_ParamLojaNeces.Text)='' Then
  Begin
    msg('Favor Informar o Dia da Semana !','A');
    Cbx_ParamLojaNeces.SetFocus;
    Exit;
  End;

  If EdtParamLojaNecesCodLoja.Value=0 Then
  Begin
    msg('Favor Informar a Loja !','A');
    EdtParamLojaNecesCodLoja.SetFocus;
    Exit;
  End; //  If EdtParamLojaNecesCodLoja.Value<>0 Then

  i:=EdtParamLojaNecesCodLoja.AsInteger;

  s:='NAO';
  If Ckb_ParamLojaNecesA.Checked Then s:='SIM';
  sCurvas:=s+';';
  s:='NAO';
  If Ckb_ParamLojaNecesB.Checked Then s:='SIM';
  sCurvas:=sCurvas+s+';';
  s:='NAO';
  If Ckb_ParamLojaNecesC.Checked Then s:='SIM';
  sCurvas:=sCurvas+s+';';
  s:='NAO';
  If Ckb_ParamLojaNecesD.Checked Then s:='SIM';
  sCurvas:=sCurvas+s+';';
  s:='NAO';
  If Ckb_ParamLojaNecesE.Checked Then s:='SIM';
  sCurvas:=sCurvas+s+';';

  If Not AnsiContainsStr(sCurvas, 'SIM') Then
   sCurvas:=f_Troca('NAO', 'SIM', sCurvas);

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

    // Inclui Loja Necessidade =================================================
    MySqlDML:=' SELECT t.cod_aux'+
              ' FROM TAB_AUXILIAR t'+
              ' WHERE t.tip_aux='+IntToStr(igDiaSemana)+
              ' AND t.cod_aux='+VarToStr(EdtParamLojaNecesCodLoja.Value);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySqlDML;
    DMBelShop.CDS_BuscaRapida.Open;

    dDta:=DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor);
    sManut:=FormatFloat('00',DayOf(dDta))+FormatFloat('00',MonthOf(dDta))+IntToStr(YearOf(dDta));
    sManut:=sManut+copy(TimeToStr(dDta),1,2)+copy(TimeToStr(dDta),4,2);

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Aux').AsString)='' Then
     Begin
       MySqlDML:=' INSERT INTO TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
                 ' VALUES ('+
                 IntToStr(igDiaSemana)+', '+ // TIP_AUX
                 VarToStr(EdtParamLojaNecesCodLoja.Value)+', '+ // COD_AUX
                 QuotedStr(sCurvas)+', '+ // DES_AUX
                 QuotedStr('SIM')+', '+ // DES_AUX1
                 QuotedStr(sManut+'.01')+', '+ // VLR_AUX - Dia Mes Ano ,01 Inclusao
                 QuotedStr(Cod_Usuario)+')'; //  VLR_AUX1 - Codigo Usuario
     End
    Else // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Aux').AsString)='' Then
     Begin
       MySqlDML:=' UPDATE TAB_AUXILIAR t'+
                 ' SET t.DES_AUX='+QuotedStr(sCurvas)+
                 ', VLR_AUX='+QuotedStr(sManut+'.02')+
                 ', VLR_AUX1='+QuotedStr(Cod_Usuario)+
                 ' WHERE t.tip_aux='+IntToStr(igDiaSemana)+
                 ' AND   t.cod_aux='+VarToStr(EdtParamLojaNecesCodLoja.Value);
     End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Aux').AsString)='' Then
    DMBelShop.SQLC.Execute(MySqlDML,nil,nil);

    DMBelShop.CDS_BuscaRapida.Close;

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Cbx_ParamLojaNecesChange(Self);

    DMVirtual.CDS_V_ParamLojaNeces.Locate('COD_LOJA',FormatFloat('00',i),[]);
    Screen.Cursor:=crDefault;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

  EdtParamLojaNecesCodLoja.Value:=0;
  EdtParamLojaNecesDesLoja.Clear;
  EdtParamLojaNecesCodLoja.SetFocus;

end;

procedure TFrmSolicitacoes.EdtParamLojaNecesCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtParamLojaNecesDesLoja.Clear;

  If EdtParamLojaNecesCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From   EMP_CONEXOES'+
           ' Where  Ind_Ativo=''SIM'''+
           ' And    COD_FILIAL='+QuotedStr(FormatFloat('00',EdtParamLojaNecesCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('RAZAO_SOCIAL').AsString)='' Then
    Begin
      msg('Loja NÃO Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtParamLojaNecesCodLoja.Clear;
      EdtParamLojaNecesCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtParamLojaNecesDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmSolicitacoes.Bt_ParamLojaNecesBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtParamLojaNecesCodLoja.Clear;
  EdtParamLojaNecesDesLoja.Clear;

  EdtParamLojaNecesCodLoja.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
         ' From EMP_CONEXOES'+
         ' Where IND_ATIVO=''SIM'''+
         ' Order by RAZAO_SOCIAL';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('RAZAO_SOCIAL').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Loja a Listar !!','A');
    EdtParamLojaNecesCodLoja.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Razao_Social';
  FrmPesquisa.Campo_Codigo:='Cod_Filial';
  FrmPesquisa.Campo_Descricao:='Razao_Social';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtParamLojaNecesCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtParamLojaNecesDesLoja.Text:=FrmPesquisa.EdtDescricao.Text;
     EdtParamLojaNecesCodLojaExit(Self);
   End
  Else
   Begin
     EdtParamLojaNecesCodLoja.Clear;
     EdtParamLojaNecesDesLoja.Clear;
     EdtParamLojaNecesCodLoja.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmSolicitacoes.Cbx_ParamLojaNecesChange(Sender: TObject);
Var
  MySql: String;
  i: Integer;
begin

  // Cria ClientDataSet ========================================================
  If DMVirtual.CDS_V_ParamLojaNeces.Active Then
   DMVirtual.CDS_V_ParamLojaNeces.Close;

  try
    DMVirtual.CDS_V_ParamLojaNeces.CreateDataSet;
    DMVirtual.CDS_V_ParamLojaNeces.Open;
  Except
    DMVirtual.CDS_V_ParamLojaNeces.EmptyDataSet;
    DMVirtual.CDS_V_ParamLojaNeces.Open;
  End;
  DMVirtual.CDS_V_ParamLojaNeces.Filtered:=False;
  DMVirtual.CDS_V_ParamLojaNeces.Filter:='';

  // Busca Lojas do Dia Selecionado ============================================
  If Trim(Cbx_ParamLojaNeces.Text)<>'' Then
  Begin
    For i:= Low(LongDayNames) to High(LongDayNames) do
    Begin
      If LongDayNames[i]=Cbx_ParamLojaNeces.Text Then
      Begin
        igDiaSemana:=110+i;
        Break;
       End;
    End; // For i:= Low(LongDayNames) to High(LongDayNames) do

    MySql:=' SELECT e.cod_filial, e.razao_social des_loja,'+
           ' SUBSTRING(t.des_aux FROM  1 FOR 3) Class_A,'+
           ' SUBSTRING(t.des_aux FROM  5 FOR 3) Class_B,'+
           ' SUBSTRING(t.des_aux FROM  9 FOR 3) Class_C,'+
           ' SUBSTRING(t.des_aux FROM 13 FOR 3) Class_D,'+
           ' SUBSTRING(t.des_aux FROM 17 FOR 3) Class_E,'+
           ' TRIM(Coalesce(t.des_aux1,''NAO'')) Ind_Ativo'+

           ' FROM TAB_AUXILIAR t, EMP_CONEXOES e'+
           ' WHERE t.cod_aux=e.cod_filial'+
           ' AND t.tip_aux='+IntToStr(igDiaSemana)+
           ' ORDER BY 1';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    While not DMBelShop.CDS_Busca.Eof do
    Begin
      DMVirtual.CDS_V_ParamLojaNeces.Append;
      For i:=0 to DMBelShop.CDS_Busca.FieldCount-1 do
       DMVirtual.CDS_V_ParamLojaNeces.Fields[i].Assign(DMBelShop.CDS_Busca.Fields[i]);

      DMVirtual.CDS_V_ParamLojaNeces.Post;

      DMBelShop.CDS_Busca.Next;
    End; // While not DMBelShop.CDS_BuscaRapida.Eof do
    DMBelShop.CDS_Busca.Close;

    DMVirtual.CDS_V_ParamLojaNeces.First;
  End; // If Trim(Cbx_ParamLojaNeces.Text)='' Then
end;

procedure TFrmSolicitacoes.Dbg_ParamLojaNecesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If (Column.FieldName='IND_CURVA_A') Then // Este comando altera cor da Celula
  Begin
    if DMVirtual.CDS_V_ParamLojaNecesIND_CURVA_A.AsString='SIM' Then
    Begin
      Dbg_ParamLojaNeces.Canvas.Font.Style:=[fsBold];
      Dbg_ParamLojaNeces.Canvas.Brush.Color:=$0080FF80;
    End;
  End;

  If (Column.FieldName='IND_CURVA_B') Then // Este comando altera cor da Celula
  Begin
    if DMVirtual.CDS_V_ParamLojaNecesIND_CURVA_B.AsString='SIM' Then
    Begin
      Dbg_ParamLojaNeces.Canvas.Font.Style:=[fsBold];
      Dbg_ParamLojaNeces.Canvas.Brush.Color:=$0080FF80;
    End;
  End;

  If (Column.FieldName='IND_CURVA_C') Then // Este comando altera cor da Celula
  Begin
    if DMVirtual.CDS_V_ParamLojaNecesIND_CURVA_C.AsString='SIM' Then
    Begin
      Dbg_ParamLojaNeces.Canvas.Font.Style:=[fsBold];
      Dbg_ParamLojaNeces.Canvas.Brush.Color:=$0080FF80;
    End;
  End;

  If (Column.FieldName='IND_CURVA_D') Then // Este comando altera cor da Celula
  Begin
    if DMVirtual.CDS_V_ParamLojaNecesIND_CURVA_D.AsString='SIM' Then
    Begin
      Dbg_ParamLojaNeces.Canvas.Font.Style:=[fsBold];
      Dbg_ParamLojaNeces.Canvas.Brush.Color:=$0080FF80;
    End;
  End;

  If (Column.FieldName='IND_CURVA_E') Then // Este comando altera cor da Celula
  Begin
    if DMVirtual.CDS_V_ParamLojaNecesIND_CURVA_E.AsString='SIM' Then
    Begin
      Dbg_ParamLojaNeces.Canvas.Font.Style:=[fsBold];
      Dbg_ParamLojaNeces.Canvas.Brush.Color:=$0080FF80;
    End;
  End;

  if not (gdSelected in State) Then
  Begin
    if DMVirtual.CDS_V_ParamLojaNecesIND_ATIVO.AsString='NAO' Then
    Begin
      Dbg_ParamLojaNeces.Canvas.Brush.Color:=clRed;
      Dbg_ParamLojaNeces.Canvas.Font.Color:=clWindow;
    end;
  End; // if not (gdSelected in State) Then

  Dbg_ParamLojaNeces.Canvas.FillRect(Rect);
  Dbg_ParamLojaNeces.DefaultDrawDataCell(Rect,Column.Field,state);

  DMVirtual.CDS_V_ParamLojaNecesCOD_LOJA.Alignment   :=taCenter;
  DMVirtual.CDS_V_ParamLojaNecesIND_CURVA_A.Alignment:=taCenter;
  DMVirtual.CDS_V_ParamLojaNecesIND_CURVA_B.Alignment:=taCenter;
  DMVirtual.CDS_V_ParamLojaNecesIND_CURVA_C.Alignment:=taCenter;
  DMVirtual.CDS_V_ParamLojaNecesIND_CURVA_D.Alignment:=taCenter;
  DMVirtual.CDS_V_ParamLojaNecesIND_CURVA_E.Alignment:=taCenter;
  DMVirtual.CDS_V_ParamLojaNecesIND_ATIVO.Alignment:=taCenter;
end;

procedure TFrmSolicitacoes.Ckb_ParamLojaNecesAClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_ParamLojaNecesA);
  AcertaCkb_Style(Ckb_ParamLojaNecesB);
  AcertaCkb_Style(Ckb_ParamLojaNecesC);
  AcertaCkb_Style(Ckb_ParamLojaNecesD);
  AcertaCkb_Style(Ckb_ParamLojaNecesE);
end;

procedure TFrmSolicitacoes.Ckb_ParamLojaNecesAKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ParamLojaNecesAClick(Self);
end;

procedure TFrmSolicitacoes.Bt_ParamLojaNecesExcluirClick(Sender: TObject);
begin
  If DMVirtual.CDS_V_ParamLojaNeces.IsEmpty Then
   Exit;

  If msg('Deseja Realmente Excluir a'+cr+'Loja Selecionada ??','C')=2 Then
  Begin
    EdtParamLojaNecesCodLoja.SetFocus;
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

    // Inclui Loja Necessidade =================================================
    MySqlDML:=' DELETE FROM TAB_AUXILIAR t'+
              ' WHERE t.tip_aux='+IntToStr(igDiaSemana)+
              ' AND t.cod_aux='+DMVirtual.CDS_V_ParamLojaNecesCOD_LOJA.AsString;
    DMBelShop.SQLC.Execute(MySqlDML,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Cbx_ParamLojaNecesChange(Self);

    Screen.Cursor:=crDefault;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

  EdtParamLojaNecesCodLoja.Value:=0;
  EdtParamLojaNecesDesLoja.Clear;
  EdtParamLojaNecesCodLoja.SetFocus;

end;

procedure TFrmSolicitacoes.EditorProSoftImpArquivoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  Color: TColor;
begin

  If key=VK_F2 Then
  Begin
    Color:=clWindow;
    If DtEdt_ProSoftImpDtaLimite.Style.Color=Color Then
     Begin
       DtEdt_ProSoftImpDtaLimite.Style.Color:=clRed;
       bRelSimples:=True;
     End
    Else
     Begin
       DtEdt_ProSoftImpDtaLimite.Style.Color:=Color;
       bRelSimples:=False;
     End
  End; // If key=F2 Then

end;

procedure TFrmSolicitacoes.Bt_ReposLojasVoltarClick(Sender: TObject);
begin
  bgProcessar:=False;
  Close;

end;

procedure TFrmSolicitacoes.EdtReposLojasSeqExit(Sender: TObject);
begin
  EdtReposLojasProduto.Clear;
  EdtReposLojasQtdReposicao.Value:=0;

  If EdtReposLojasSeq.AsInteger>0 Then
  Begin
    If not DMCentralTrocas.CDS_ReposicaoTransf.Locate('NUM_SEQ', EdtReposLojasSeq.AsInteger,[]) Then
    Begin
      msg('Sequência do Produto'+cr+cr+'Não Encontrada !!','A');
      EdtReposLojasSeq.SetFocus;
      Exit;
    End;

    EdtReposLojasProduto.Text:=DMCentralTrocas.CDS_ReposicaoTransfDES_PRODUTO.AsString;
    EdtReposLojasQtdReposicao.Value:=DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsInteger;

    If DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsInteger=999999 Then
    Begin
      MessageBox(Handle, pChar('IMPOSSÍVEL ALTERAR !!'+cr+cr+
                               'Produto Transferido para o'+cr+
                               'Próximo Dia de Separação !!!'), 'ATENÇÃO !!', MB_ICONERROR);
      EdtReposLojasProduto.Clear;
      EdtReposLojasQtdReposicao.Value:=0;
      EdtReposLojasSeq.Value:=0;
      EdtReposLojasSeq.SetFocus;
      Exit;
    End;


    If DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsInteger<>0 Then
    Begin
      MessageBox(Handle, pChar('IMPOSSÍVEL ALTERAR !!'+cr+cr+
                               'Produto já Transferido para o'+cr+
                               'Pedido Nº '+DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsString+
                               ' no SIDICOM.'), 'ATENÇÃO !!', MB_ICONERROR);
      EdtReposLojasProduto.Clear;
      EdtReposLojasQtdReposicao.Value:=0;
      EdtReposLojasSeq.Value:=0;
      EdtReposLojasSeq.SetFocus;
      Exit;
    End;

    Bt_ReposLojasAlterar.Enabled:=True;
  End; // If EdtReposLojasSeq.AsInteger<0 Then
end;

procedure TFrmSolicitacoes.Bt_ReposLojasAlterarClick(Sender: TObject);
Var
  MySql: String;
begin
  EdtReposLojasSeq.SetFocus;

  If (Trim(EdtReposLojasProduto.Text)='') Or (EdtReposLojasSeq.Value<1) Then
   Exit;

  Bt_ReposLojasAlterar.Enabled:=False;

  // Verifica se Existe Preco de Compra ========================================
  if (DMCentralTrocas.CDS_ReposicaoTransfPRECOCOMPRA.AsCurrency<=0.00) And (EdtReposLojasQtdReposicao.AsInteger>0) Then
  Begin
    FrmSolicitacoes.Bt_ReposLojasPreco.Enabled:=True;
    FrmSolicitacoes.EdtReposLojasSeq.SetFocus;

    msg('Produto SEM PREÇO de COMPRA!!'+cr+'Solicitar o Cadastramento no SIDICOM !!'+cr+'Lista de Preços <0006>'+cr+'Após Atualize !','A');
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

    MySql:=' UPDATE ES_ESTOQUES_LOJAS el'+
           ' SET el.qtd_a_transf='+VarToStr(EdtReposLojasQtdReposicao.Value)+
           ', USU_ALTERA='+QuotedStr(Cod_Usuario)+
           ', DTA_ALTERA=current_timestamp'+
           ' WHERE el.dta_movto='+QuotedStr(sgDtaInicio)+
           ' AND   el.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
           ' AND   el.num_seq='+DMCentralTrocas.CDS_ReposicaoTransfNUM_SEQ.AsString+
           ' AND   el.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DMCentralTrocas.CDS_ReposicaoTransf.Edit;
    DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsInteger:=EdtReposLojasQtdReposicao.AsInteger;
    DMCentralTrocas.CDS_ReposicaoTransf.Post;

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

  EdtReposLojasProduto.Clear;
  EdtReposLojasQtdReposicao.Value:=0;
  EdtReposLojasSeq.SetFocus;
  EdtReposLojasSeq.Clear;

  // Se Deve Fechar Digitação de Alteração de Qtd de Reposição Depois de Salvar...
  If bgFechaRepos Then
   Bt_ReposLojasVoltarClick(Self);


end;

procedure TFrmSolicitacoes.Bt_LimpaListaClick(Sender: TObject);
begin
  Lbx_Usuarios.SetFocus;
  lbx_Usuarios.Items.Clear;
end;

procedure TFrmSolicitacoes.Lbx_UsuariosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  b: Boolean;
  sLogin: String;
  i: Integer;
begin
  If key=vk_Delete Then
  Begin
    If lbx_Usuarios.Items.Count>0 Then
     lbx_Usuarios.DeleteSelected;
  End;

  If key=vk_Insert Then
  Begin
    b:=True;
    While b do
    Begin
      sLogin:='';
      If InputQuery('Informe o LOGIN do Usuário','',sLogin) then
       Begin
         Try
           If (Length(sLogin)>20) Or (Trim(sLogin)='') Then
            msg('Login Inválido !!','A')
           Else
            Break;
         Except
         End;
       End
      Else // If InputQuery('Informe o Desconto','',sVlrDesc) then
       Begin
         Break;
       End; // If InputQuery('Informe o Desconto','',sVlrDesc) then
    End; // While b do

    If sLogin<>'' Then
    Begin
      sLogin:=AnsiUpperCase(sLogin);
      b:=False;
      For i:=0 to lbx_Usuarios.Items.Count-1 do
      Begin
        If lbx_Usuarios.Items[i]=sLogin Then
        Begin
          b:=True;
          Break;
        End;
      End;

      If Not b Then
       lbx_Usuarios.Items.Add(sLogin);
    End;
  End;

end;

procedure TFrmSolicitacoes.Bt_AtualizaClick(Sender: TObject);
Var
  MySql: String;
  b: Boolean;
begin

  Lbx_Usuarios.SetFocus;

  If Trim(EdtUsuarioModelo.Text)='' Then
  Begin
    msg('Favor Informar o Login'+cr+cr+'do Usuário Modelo !!','A');
    EdtUsuarioModelo.SetFocus;
    Exit;
  End;

  If Trim(EdtLojaModelo.Text)='' Then
  Begin
    msg('Favor Informar o Codigo'+cr+cr+'da Loja Modelo !!','A');
    EdtLojaModelo.SetFocus;
    Exit;
  End;

  If ((Trim(EdtUsuarioModelo.Text)='RENATO') Or (Trim(EdtUsuarioModelo.Text)='ODIR') Or (Trim(EdtUsuarioModelo.Text)='TIAGO')) And
     (((Des_Usuario)<>'RENATO') And ((Des_Usuario)<>'ODIR') And ((Des_Usuario)<>'TIAGO')) Then
  Begin
    msg('Usuário SEM Permissão de Atualização !!','A');
    EdtUsuarioModelo.Clear;
    EdtUsuarioModelo.SetFocus;
    Exit;
  End;

  MySql:=' SELECT e.cod_filial FROM emp_conexoes e WHERE e.cod_filial='+EdtLojaModelo.Text;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString)='' Then
  Begin
    DMBelShop.CDS_BuscaRapida.Close;
    msg('Não Existe Loja com'+cr+cr+'o Códgio Selecionado !!','A');
    EdtLojaModelo.SetFocus;
    Exit;
  End;
  DMBelShop.CDS_BuscaRapida.Close;

  If Lbx_Usuarios.Items.Count<1 Then
  Begin
    msg('Sem Usuário a Atualizar !!','A');
    Lbx_Usuarios.SetFocus;
    Exit;
  End;

  If Application.MessageBox('Deseja Realmente Atualizar Usuário Conforme Modelo ??', 'ATENÇÃO !!', 292) = idNo Then
   Exit;

  sgOutrasEmpresa:='(50,96,97,98,99)'; //ou '('99', '50')';
//  sgEmpresaNao   :='('+EdtLojaModelo.Text+')'; //ou '('50')';
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False;
  FrmSelectEmpProcessamento.iNrEmpProc:=0;
  FrmSelectEmpProcessamento.Caption:='SELECIONE A(S) LOJA(S) A SEREM ATUALIZADAS';
  FrmSelectEmpProcessamento.ShowModal;

  // Verifica se Existe Empresa a Processar ====================================
  If FrmSelectEmpProcessamento.iNrEmpProc=0 Then
  Begin
    FreeAndNil(FrmSelectEmpProcessamento);
    Exit;
  End; // If FrmSelectEmpProcessamento.iNrEmpProc=1 Then
  FreeAndNil(FrmSelectEmpProcessamento);

  // Atauliza Usuarios =========================================================
  AtualizaPermissoesUsuarios;

end;

procedure TFrmSolicitacoes.EdtLojaModeloKeyPress(Sender: TObject; var Key: Char);
begin
  If not (key in ['0'..'9']) Then
  Begin
    Key := #0;
    Exit;
  End;

end;

procedure TFrmSolicitacoes.OutLook_SalaoRelatoriosButtonClick(Sender: TObject; Index: Integer);
begin
  OutLook_SalaoRelatorios.Pages[0].Buttons[Index].Down:=True;
  Pan_SalaoRelatorios.Caption:=OutLook_SalaoRelatorios.Pages[0].Buttons[Index].Caption;
end;

procedure TFrmSolicitacoes.EdtSalaoRelCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin
  
  EdtSalaoRelDesLoja.Clear;
                  
  If EdtSalaoRelCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From   EMP_CONEXOES'+
           ' Where  Ind_Ativo=''SIM'''+
           ' And    COD_FILIAL='+QuotedStr(FormatFloat('00',EdtSalaoRelCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('RAZAO_SOCIAL').AsString)='' Then
    Begin
      msg('Loja NÃO Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtSalaoRelCodLoja.Clear;
      EdtSalaoRelCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtSalaoRelDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmSolicitacoes.Bt_SalaoRelBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtSalaoRelCodLoja.Clear;
  EdtSalaoRelDesLoja.Clear;

  EdtSalaoRelCodLoja.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
         ' From EMP_CONEXOES'+
         ' Where IND_ATIVO=''SIM'''+
         ' Order by RAZAO_SOCIAL';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('RAZAO_SOCIAL').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Loja a Listar !!','A');
    EdtSalaoRelCodLoja.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Razao_Social';
  FrmPesquisa.Campo_Codigo:='Cod_Filial';
  FrmPesquisa.Campo_Descricao:='Razao_Social';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtSalaoRelCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtSalaoRelDesLoja.Text:=FrmPesquisa.EdtDescricao.Text;
     EdtSalaoRelCodLojaExit(Self);
   End
  Else
   Begin
     EdtSalaoRelCodLoja.Clear;
     EdtSalaoRelDesLoja.Clear;
     EdtSalaoRelCodLoja.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmSolicitacoes.Bt_ParamSisReposFornecClick(Sender: TObject);
Var
  i: integer;
  MySql: String;
begin
  // Apresenta TabSheet de Fornecedores que Não Entram no Calculo de Reposição
  For i:=0 to FrmSolicitacoes.ComponentCount-1 do
  Begin
    If FrmSolicitacoes.Components[i] is TTabSheet Then
     If (FrmSolicitacoes.Components[i] as TTabSheet).Parent=PC_Parametros Then
     (FrmSolicitacoes.Components[i] as TTabSheet).TabVisible:=False;
  End; // For i:=0 to FrmSolicitacoes.ComponentCount-1 do

  MySql:=' SELECT f.codfornecedor, f.nomefornecedor'+
         ' FROM TAB_AUXILIAR t, FORNECEDOR f'+
         ' WHERE t.cod_aux=f.codfornecedor'+
         ' AND t.tip_aux=13'+
         ' ORDER BY f.nomefornecedor';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  Ts_ParamLojaReposFornec.TabVisible:=True;
  Bt_ParamSisReposFornec.Visible:=False;
  Bt_ParamSisSalvar.Visible:=False;
  PC_ParametrosChange(Self);

end;

procedure TFrmSolicitacoes.Dbg_ParamLojaReposFornecKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  MySql: String;
begin
  If DMBelShop.CDS_Busca.IsEmpty Then
   Exit;

  If Key=VK_Delete Then
  Begin
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

      MySql:=' DELETE FROM TAB_AUXILIAR t'+
             ' WHERE t.tip_aux=13'+
             ' AND   LPAD(t.cod_aux, 6, ''0'')='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('codfornecedor').AsString);
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ======================================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      DMBelShop.CDS_Busca.DisableControls;
      DMBelShop.CDS_Busca.Close;
      DMBelShop.CDS_Busca.Open;
      DMBelShop.CDS_Busca.EnableControls;

      Screen.Cursor:=crDefault;

    Except
      on e : Exception do
      Begin
        // Abandona Transacao ====================================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';

        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        Exit;
      End; // on e : Exception do
    End; // Try
  End; // if Key=VK_Delete Then
  Dbg_ParamLojaReposFornec.SetFocus;

end;

procedure TFrmSolicitacoes.EdtParamLojaReposCodFornExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtParamLojaReposCodForn.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Fornecedores =======================================================
    MySql:=' SELECT f.nomefornecedor, f.codfornecedor'+
           ' FROM FORNECEDOR f'+
           ' WHERE f.codfornecedor='+VarToStr(EdtParamLojaReposCodForn.Value);
    DMBelShop.SQLQ_Busca.Close;
    DMBelShop.SQLQ_Busca.SQL.Clear;
    DMBelShop.SQLQ_Busca.SQL.Add(MySql);
    DMBelShop.SQLQ_Busca.Open;

    Screen.Cursor:=crDefault;

    If Trim(DMBelShop.SQLQ_Busca.FieldByName('codfornecedor').AsString)='' Then
    Begin
      msg('Fornecedor NÃO Encontrado !!!', 'A');
      DMBelShop.SQLQ_Busca.Close;
      EdtParamLojaReposCodForn.Clear;
      EdtParamLojaReposCodForn.SetFocus;
      Exit;
    End;
    PlaySound(PChar('SystemQuestion'), 0, SND_ASYNC);
    PlaySound(PChar('SystemAsterisk'), 0, SND_ASYNC);
    PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
    PlaySound(PChar('SystemQuestion'), 0, SND_ASYNC);

    If Application.MessageBox('No Momento da Inclusão do Fornecedor TODOS os PRODUTOS'+cr+
                              'Teram seus ESTOQUES MÍNIMO ZERADOS !!'+cr+cr+'DESEJA CONTINUAR ???????', 'ATENÇÃO !!', 292) = IdNo Then
    Begin
      EdtParamLojaReposCodForn.Text:='0';
      EdtParamLojaReposCodForn.SetFocus;
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

      // Insere Fornecedor
      MySql:=' UPDATE or INSERT INTO TAB_AUXILIAR'+
             ' (tip_aux, cod_aux, des_aux, des_aux1, vlr_aux, vlr_aux1)'+
             ' values (13, '+QuotedStr(DMBelShop.SQLQ_Busca.FieldByName('codfornecedor').AsString)+', null, null, null, null)';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Zera Estoques Minimos
      MySql:=' UPDATE ES_FINAN_CURVA_ABC c'+
             ' SET c.est_minimo=0'+
             ' WHERE c.est_minimo<>0'+
             ' AND EXISTS (SELECT 1'+
             '             FROM PRODUTO p'+
             '             WHERE p.codproduto=c.cod_produto'+
             '             AND P.PRINCIPALFOR='+QuotedStr(DMBelShop.SQLQ_Busca.FieldByName('codfornecedor').AsString)+')';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ======================================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      DMBelShop.CDS_Busca.DisableControls;
      DMBelShop.CDS_Busca.Close;
      DMBelShop.CDS_Busca.Open;
      DMBelShop.CDS_Busca.Locate('codfornecedor',DMBelShop.SQLQ_Busca.FieldByName('codfornecedor').AsString,[]);
      DMBelShop.CDS_Busca.EnableControls;

      Screen.Cursor:=crDefault;

    Except
      on e : Exception do
      Begin
        // Abandona Transacao ====================================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';

        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        Exit;
      End; // on e : Exception do
    End; // Try

    EdtParamLojaReposCodForn.Text:='0';
    EdtParamLojaReposCodForn.SetFocus;
  End;
end;

procedure TFrmSolicitacoes.Bt_ParamLojaReposBuscaFornClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  EdtParamLojaReposCodForn.Clear;
  EdtParamLojaReposCodForn.SetFocus;

  Screen.Cursor:=crAppStart;

  MySql:=' SELECT f.nomefornecedor, f.codfornecedor'+
         ' FROM FORNECEDOR f'+
         ' order by f.nomefornecedor';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('CodFornecedor').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Fornecedor a Listar !!','A');
    EdtParamLojaReposCodForn.Clear;
    EdtParamLojaReposCodForn.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='NomeFornecedor';
  FrmPesquisa.Campo_Codigo:='CodFornecedor';
  FrmPesquisa.Campo_Descricao:='NomeFornecedor';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtParamLojaReposCodForn.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtParamLojaReposCodFornExit(Self);
  End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmSolicitacoes.Dbg_ParamLojaNecesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sManut, sLoja, sProc: String;
  dDta: TDateTime;
begin
  // Altera Processamento do Fornecedor ========================================
  If key=Vk_F6 Then
  Begin
    sLoja:=DMVirtual.CDS_V_ParamLojaNecesCOD_LOJA.AsString;

    sProc:='SIM';
    If DMVirtual.CDS_V_ParamLojaNecesIND_ATIVO.AsString='SIM' Then
     sProc:='NAO';

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

      dDta:=DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor);
      sManut:=FormatFloat('00',DayOf(dDta))+FormatFloat('00',MonthOf(dDta))+IntToStr(YearOf(dDta));
      sManut:=sManut+copy(TimeToStr(dDta),1,2)+copy(TimeToStr(dDta),4,2);

      MySqlDML:=' UPDATE TAB_AUXILIAR t'+
                ' SET t.DES_AUX1='+QuotedStr(sProc)+
                ', VLR_AUX='+QuotedStr(sManut+'.03')+
                ', VLR_AUX1='+QuotedStr(Cod_Usuario)+
                ' WHERE t.tip_aux='+IntToStr(igDiaSemana)+
                ' AND   t.cod_aux='+QuotedStr(DMVirtual.CDS_V_ParamLojaNecesCOD_LOJA.AsString);
      DMBelShop.SQLC.Execute(MySqlDML,nil,nil);

      // Atualiza Transacao ======================================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      Cbx_ParamLojaNecesChange(Self);

      DMVirtual.CDS_V_ParamLojaNeces.Locate('COD_LOJA',sLoja,[]);
      Screen.Cursor:=crDefault;
    Except
      on e : Exception do
      Begin
        // Abandona Transacao ====================================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try
    Dbg_ParamLojaNeces.SetFocus;

  End; // If key=Vk_F6 Then

end;

procedure TFrmSolicitacoes.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // primeiramente verificamos se é o evento a ser tratado...
  If Msg.message = WM_MOUSEWHEEL then
  Begin
//    If ActiveControl is TDBGrid then // If Somente DBGRID *** Testa se Classe é TDBGRID
//    Begin
      Msg.message := WM_KEYDOWN;
      Msg.lParam := 0;
      Sentido := HiWord(Msg.wParam);
      if Sentido > 0 then
       Msg.wParam := VK_UP
      else
       Msg.wParam := VK_DOWN;
//    End; // If ActiveControl is TDBGrid then // If Somente DBGRID *** Testa se Classe é TDBGRID
  End; // if Msg.message = WM_MOUSEWHEEL then

end;

procedure TFrmSolicitacoes.Dbg_ApresGridEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ApresGridEnter; 
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Cbx_ParamLojaNecesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Cbx_ParamLojaNecesChange(Self);
end;

procedure TFrmSolicitacoes.Cbx_ParamLojaNecesClick(Sender: TObject);
begin
  Cbx_ParamLojaNecesChange(Self);
end;

procedure TFrmSolicitacoes.Bt_ReposLojasPrecoClick(Sender: TObject);
Var
  IBQ_MPMS: TIBQuery;
  MySql: String;
  i, iNumDoc, iNumReg: Integer;
begin
  ConexaoEmpIndividual('IBDB_MPMS', 'IBT_MPMS', 'A');

  // Cria Query da Empresa ------------------------------------
  FrmBelShop.CriaQueryIB('IBDB_MPMS', 'IBT_MPMS', IBQ_MPMS, True, True);

  // Busca Preco de Compra SIDICOM ---------------------------------------------
  MySql:=' SELECT l.CODLISTA, l.CODPRODUTO, l.PRECOCOMPRA, l.MARGEM,'+
         ' l.PRECOVENDA, l.PRECOANTERIOR, l.DATAALTERACAO, l.HORAALTERACAO,'+
         ' l.DESCONTO, l.DESCONTOMAX, l.DESATIVADO, l.PRECODOLAR, l.ACRECIMOLISTA,'+
         ' l.CUSTOSLISTA, CURRENT_DATE DTA_ATUALIZACAO'+
         ' FROM LISTAPRE l'+
         ' where l.codlista='+QuotedStr('0006')+
         ' and l.codproduto='+QuotedStr(DMCentralTrocas.CDS_ReposicaoTransfCOD_PRODUTO.AsString);
  IBQ_MPMS.Close;
  IBQ_MPMS.SQL.Clear;
  IBQ_MPMS.SQL.Add(MySql);
  IBQ_MPMS.Open;

  If Trim(IBQ_MPMS.FieldByName('CODPRODUTO').AsString)='' Then
  Begin
    IBQ_MPMS.Close;
    ConexaoEmpIndividual('IBDB_MPMS', 'IBT_MPMS', 'A');
    msg('Produto, Ainda, Não Cadastrado'+cr+'na Lista de Preços <0006>!!','A');
    Exit;
  End;

  If (Trim(IBQ_MPMS.FieldByName('PRECOCOMPRA').AsString)='') Or (IBQ_MPMS.FieldByName('PRECOCOMPRA').AsCurrency=0.0000) Then
  Begin
    IBQ_MPMS.Close;
    ConexaoEmpIndividual('IBDB_MPMS', 'IBT_MPMS', 'A');
    msg('Produto Continua Sem Preço de Compra'+cr+'na Lista de Preços <0006>!!','A');
    Exit;
  End;

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  PainelApresExp.Caption:='AGUARDE !! Atualizando Preço de Compra...';
  PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
  PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
  PainelApresExp.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-PainelApresExp.Height)/2))-20;
  PainelApresExp.Color:=clSilver;
  PainelApresExp.Font.Style:=[fsBold];
  PainelApresExp.Parent:=FrmSolicitacoes;
  PainelApresExp.Visible:=True;
  Refresh;

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE OR INSERT INTO LISTAPRE ('+
           ' CODLISTA, CODPRODUTO, PRECOCOMPRA, MARGEM, PRECOVENDA,'+
           ' PRECOANTERIOR, DATAALTERACAO, HORAALTERACAO, DESCONTO,'+
           ' DESCONTOMAX, DESATIVADO, PRECODOLAR, ACRECIMOLISTA,'+
           ' CUSTOSLISTA,DTA_ATUALIZACAO)'+
           ' VALUES ('+
           QuotedStr(IBQ_MPMS.FieldByName('CODLISTA').AsString)+', '+
           QuotedStr(IBQ_MPMS.FieldByName('CODPRODUTO').AsString)+', '+
           QuotedStr(IBQ_MPMS.FieldByName('PRECOCOMPRA').AsString)+', '+
           QuotedStr(IBQ_MPMS.FieldByName('MARGEM').AsString)+', '+
           QuotedStr(IBQ_MPMS.FieldByName('PRECOVENDA').AsString)+', '+
           QuotedStr(IBQ_MPMS.FieldByName('PRECOANTERIOR').AsString)+', ';

           If Trim(IBQ_MPMS.FieldByName('DATAALTERACAO').AsString)='' Then
            MySql:=
             MySql+' null, '
           Else
            MySql:=
             MySql+QuotedStr(IBQ_MPMS.FieldByName('DATAALTERACAO').AsString)+', ';

           If Trim(IBQ_MPMS.FieldByName('HORAALTERACAO').AsString)='' Then
            MySql:=
             MySql+' null, '
           Else
            MySql:=
             MySql+QuotedStr(IBQ_MPMS.FieldByName('HORAALTERACAO').AsString)+', ';

    MySql:=
     MySql+QuotedStr(IBQ_MPMS.FieldByName('DESCONTO').AsString)+', '+
           QuotedStr(IBQ_MPMS.FieldByName('DESCONTOMAX').AsString)+', '+
           QuotedStr(IBQ_MPMS.FieldByName('DESATIVADO').AsString)+', '+
           QuotedStr(IBQ_MPMS.FieldByName('PRECODOLAR').AsString)+', '+
           QuotedStr(IBQ_MPMS.FieldByName('ACRECIMOLISTA').AsString)+', '+
           QuotedStr(IBQ_MPMS.FieldByName('CUSTOSLISTA').AsString)+', '+
           QuotedStr(IBQ_MPMS.FieldByName('DTA_ATUALIZACAO').AsString)+')'+
           ' MATCHING (CODLISTA, CODPRODUTO)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    IBQ_MPMS.Close;

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
      PainelApresExp.Visible:=False;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try
  ConexaoEmpIndividual('IBDB_MPMS', 'IBT_MPMS', 'F');

  iNumReg:=DMCentralTrocas.CDS_ReposicaoTransfNUM_SEQ.AsInteger;
  iNumDoc:=DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsInteger;

  DMCentralTrocas.CDS_ReposicaoDocs.DisableControls;
  DMCentralTrocas.CDS_ReposicaoDocs.Last;
  DMCentralTrocas.CDS_ReposicaoDocs.First;
  DMCentralTrocas.CDS_ReposicaoDocs.Locate('NUM_DOCTO',iNumDoc,[]);
  DMCentralTrocas.CDS_ReposicaoTransf.Locate('NUM_SEQ',iNumReg,[]);
  DMCentralTrocas.CDS_ReposicaoDocs.EnableControls;

  Bt_ReposLojasPreco.Enabled:=False;
  PainelApresExp.Visible:=False;
  
  msg('Atualização Efetuada com SUCESSO !!','A');

  EdtReposLojasSeq.SetFocus;

end;

procedure TFrmSolicitacoes.JvXPButton1Click(Sender: TObject);
begin

  If msg('Deseja Realmente Salvar  ??','C')=2 Then
  Begin
    Dbg_CodigosViculados.SetFocus;
    Exit;
  End;

  bgProcessar:=True;
  Close;

end;

end.

