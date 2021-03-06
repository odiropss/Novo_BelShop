{                ok
 Height = 470 - 432
 Width  = 649 - 633
===============================================
TABSHEET N�O UTILIZADOS:
  - Ts_ParamIRRF
  - Ts_ParamINSS
  - Ts_ParamConsisNFeOC
===============================================
  // Abre Form de Solicita��es (Enviar o TabIndex a Manter Ativo) ==============
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
   3 = Viculos de C�digos Loja - CANOAS - Ts_SalaoCodigosViculados
   4 = Legenda de Cores no Pedido OC - Ts_GeraOCLegendaCores
   5 = Calendario de Fechamento de Caixas - Ts_FinanFechaCaixaLanctos
   6 = Calculo de Margem de Lucro - Ts_MargemLucro
   7 = Mostra Formulas Utilizadas no Calclo de Margem de Lucro - Ts_MargemLucroFormulas
   8 = Habilidades e Servi�os - Ts_HabServ
   9 = Localiza Endere�o IBGE - Ts_IBGE
  10 = Manuten��es Diversas - Ts_ManutDiversas
  11 = Parametros do Gerenciador - Ts_ParametrosGerenciador
  12 = Manuten��o de Consistencias - Ts_Consistencias
  13 = Manuten��o de Vales - Ts_Vales
  14 = RETIRADO:
       Fornecedores a Importar de Solicita��es de Lojas - Ts_SolicitFornLojas
  15 = Seleciona Profissional de Qualquer Loja - Ts_ProfSelecina
  16 = Movimento com C�digos TecBiz  N�O Encontrados (Apresenta Grid) - Ts_ApresentaGrid
  17 = Planilha Financeira - Periodo de Apropria��o - Ts_PlanilhaFinanceira
  18 = Apresenta Qualquer Coisa para Selecionar (USAR DMBelShop.CDS_Busca) - Ts_Selecionar
  19 = Usar com Qualquer Coisa - Ts_QualquerCoisa
  20 = Excel Importa Arquivo - Ts_ExcelImportar
  21 = Digita��o de Reposi��es de Lojas - Ts_ReposLojasDigita
  22 = Transfere Permiss�es Usu�rios SIDICOM  - Ts_SidicomUsuario
  23 = Sal�o - Relat�rios - Ts_SalaoRelatorios
  24 = Diverg�ncias Reposi��es Lojas  - Acerta Diverg�ncias - Ts_ReposDivergencias
  25 = Analise Reposicao Di�ria - Ts_AnaliseReposicaoDiaria
  26 - Concilia��o de Dep�sitos - Cadastro de Hist�ricos - Ts_ConcDepHistoricos
  27 - Estoque Minio/M�ximo - Atualiza MIX de Lojas - Ts_MixProdutosLojas
  28 - Estoque Minio/M�ximo - Grupo de Lojas (Em Desenvolvimento) - Ts_GruposLojas
  29 - AUDITORIA - Salva Posi��o de Estoqe para Invent�rio (Aquivo.TXT) - Ts_Auditoria
  30 - Concilia��o de Dep�sitos - Documento Financeiro de Entrega para o Renato - Ts_ConcDepDocFinan
  31 - Apresenta Estoque do CD Com Necessidade de Compra em 15 Dias - Ts_ComprasEstoquesCD
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
  JvOutlookBar, RelVisual, AppEvnts, MMSystem, JvButton,
  JvTransparentButton, RXCtrls;
//  �ltimo: MMSystem

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
    Pan_Simples: TPanel;
    Bt_SimplesVoltar: TJvXPButton;
    Bt_SimplesOK: TJvXPButton;
    Panel8: TPanel;
    Bt_CodigosViculadosVoltar: TJvXPButton;
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
    Bt_SelecionarVoltar: TJvXPButton;
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
    Pan_ReposicaoLojas: TPanel;
    Bt_ReposLojasVoltar: TJvXPButton;
    Panel7: TPanel;
    Gb_ReposLojasSeq: TGroupBox;
    EdtReposLojasSeq: TJvValidateEdit;
    Gb_ReposLojasQtdReposicao: TGroupBox;
    EdtReposLojasQtdReposicao: TCurrencyEdit;
    Bt_ReposLojasAlterar: TJvXPButton;
    Ts_SidicomUsuario: TTabSheet;
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
    Bt_CodigosViculadosSalvar: TJvXPButton;
    DtaEdtSolicExpDoctoDestino: TDateTimePicker;
    Pan_Cor8: TPanel;
    Ts_ReposDivergencias: TTabSheet;
    Pan_ReposDivergencias: TPanel;
    Gb_ReposDivProdutoSel: TGroupBox;
    Gb_ReposDivQtd: TGroupBox;
    EdtReposDivQtd: TCurrencyEdit;
    Bt_ReposDivAlterarQtd: TJvXPButton;
    Mem_ReposDivProduto: TMemo;
    Dbg_ReposDivProdutos: TDBGridJul;
    Label13: TLabel;
    Ts_ParamTransferencias: TTabSheet;
    GroupBox3: TGroupBox;
    EdtTransfCodLoja: TCurrencyEdit;
    Bt_TransfBuscaLoja: TJvXPButton;
    EdtTransfDescLoja: TEdit;
    Label84: TLabel;
    Label86: TLabel;
    EdtTransfNumProd: TCurrencyEdit;
    EdtTransfQtdProd: TCurrencyEdit;
    Dbg_TransfLojas: TDBGridJul;
    Bt_TransfSalvar: TJvXPButton;
    Ts_AnaliseReposicaoDiaria: TTabSheet;
    Panel2: TPanel;
    Bt_AnaliseRepDiariaVoltar: TJvXPButton;
    Bt_AnaliseRepDiariaSalvaClipboard: TJvXPButton;
    Dbg_AnaliseRepDiaria: TDBGridJul;
    Ts_ConcDepHistoricos: TTabSheet;
    Panel5: TPanel;
    Bt_ConcDepHistoricosVoltar: TJvXPButton;
    Bt_ConcDepHistoricosSalvar: TJvXPButton;
    Dbg_ConcDepHistoricos: TDBGrid;
    Gb_ConcDepHistoricosGrupos: TGroupBox;
    Rb_ConcDepHistoricosCX_MTZ: TJvRadioButton;
    Rb_ConcDepHistoricosDEPOSITO: TJvRadioButton;
    Rb_ConcDepHistoricosOUTROS: TJvRadioButton;
    Rb_ConcDepHistoricosDESPESA: TJvRadioButton;
    Label87: TLabel;
    Ts_MixProdutosLojas: TTabSheet;
    Panel14: TPanel;
    Bt_MixLojasVoltar: TJvXPButton;
    Bt_MixLojasAlterar: TJvXPButton;
    EdtMixLoja: TEdit;
    Bt_MixLojasOrigemSim: TJvTransparentButton;
    Bt_MixLojasOrigemNao: TJvTransparentButton;
    Label88: TLabel;
    Bt_MixLojasDestSim: TJvTransparentButton;
    Bt_MixLojasDestNao: TJvTransparentButton;
    Gb_MixLojasSel: TGroupBox;
    Gb_MixProdutos: TGroupBox;
    Lbx_MixLojasSel: TListBox;
    Lbx_MixLojas: TListBox;
    Ts_GruposLojas: TTabSheet;
    Panel15: TPanel;
    Bt_GruposLojasVoltar: TJvXPButton;
    Bt_GruposLojasSalvar: TJvXPButton;
    Ts_Auditoria: TTabSheet;
    Gb_AudArqDestino: TGroupBox;
    Bt_AudBuscaArq: TJvXPButton;
    EdtAudDescArquivo: TEdit;
    Gb_AudLoja: TGroupBox;
    Bt_AudBuscaLoja: TJvXPButton;
    EdtAudDescLoja: TEdit;
    Panel16: TPanel;
    Bt_AudGeraVoltar: TJvXPButton;
    Bt_AudGeraArquivo: TJvXPButton;
    EdtAudCodLoja: TCurrencyEdit;
    Bt_ProSoftImpTodos: TJvXPButton;
    Ts_ConcDepDocFinan: TTabSheet;
    Gb_ConcDepDocFinan: TGroupBox;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Dbe_ConcDepDocFinanDocto: TDBEdit;
    Dbe_ConcDepDocFinanUsuCriacao: TDBEdit;
    Dbe_ConcDepDocFinanDtaCriacao: TDBEdit;
    Dbe_ConcDepDocFinanUsuEmissao: TDBEdit;
    Dbe_ConcDepDocFinanDtaEmissao: TDBEdit;
    Dbe_ConcDepDocFinanUsuRecebe: TDBEdit;
    Dbe_ConcDepDocFinanDtaRecebe: TDBEdit;
    Dbg_ConcDepDocFinan: TDBGrid;
    Pan_ConcDepDocFinan: TPanel;
    Bt_ConcDepDocFinanVoltar: TJvXPButton;
    Bt_ConcDepDocFinanImprimir: TJvXPButton;
    Bt_ConcDepDocFinanExcluir: TJvXPButton;
    Bt_ConcDepDocFinanRecebe: TJvXPButton;
    Bt_ConcDepDocFinanFechamento: TJvXPButton;
    Panel17: TPanel;
    Ts_ComprasEstoquesCD: TTabSheet;
    Dbg_ComprasEstoquesCD: TDBGrid;
    Panel18: TPanel;
    Bt_ComprasEstoquesCDVoltar: TJvXPButton;
    Bt_ComprasEstoquesMemoria: TJvXPButton;
    Rb_ComprasEstoquesA: TRadioButton;
    Rb_ComprasEstoquesB: TRadioButton;
    Rb_ComprasEstoquesD: TRadioButton;
    Rb_ComprasEstoquesC: TRadioButton;
    Rb_ComprasEstoquesE: TRadioButton;
    Label89: TLabel;
    Bt_ComprasEstoquesCDCurva: TJvXPButton;
    Rb_AudCadProdutos: TJvRadioButton;
    Rb_AudPosEstoque: TJvRadioButton;
    Gb_AudDepositos: TGroupBox;
    Dbg_AudDepositos: TDBGrid;
    TabSheet1: TTabSheet;
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

    // CRIA GRID NEW em Ts_QualquerCoisa ////////////////////////////////////////
    Procedure GridNewCriar(Dts: TDataSource; sNomeObjeto: String; bSalvar: Boolean = True);
    ////////////////////////////////////////////////////////////////////////////

    // EVENTOS EM TEMPO DE EXCU��O /////////////////////////////////////////////
    // OCComparaPedidos
    procedure OCComparaPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);


    // AvariasFornecedor
    procedure AvariasFornecedorDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    ////////////////////////////////////////////////////////////////////////////

    // COMPRAS /////////////////////////////////////////////////////////////////
    Function  OcExportaDocumento: Boolean;
    Procedure ComprasAnaliseSaldoCD(sCurva: String);

    ////////////////////////////////////////////////////////////////////////////

    // MOVIMENTO DE CAIXA DIA //////////////////////////////////////////////////
    procedure MovtoCaixaDiaDesenharCalendario;
    Procedure MovtoCaixaDiaSituacao(dDt: TDateTime);
    Procedure MovtoCaixaDiaMemo;

    Function  TrinksImportaArquivoDiario:Boolean;

    ////////////////////////////////////////////////////////////////////////////

    // MANUTEN��ES DIVERSAS ////////////////////////////////////////////////////
    Function ConsisteComponentesManutDiversas: Boolean;
    ////////////////////////////////////////////////////////////////////////////

    // MANUTEN��ES VALES ///////////////////////////////////////////////////////
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
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Bal�o
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente
    ////////////////////////////////////////////////////////////////////////////

    // PARAMETROS do SISTEMA ///////////////////////////////////////////////////
    Function  ConsisteParametrosSIS(sTipo: String): Boolean;
                                // sTipo = (SM) Salario M�nimo
                                // sTipo = (INSS) Tabela INSS
                                // sTipo = (IRRF) Tabela IRRF

    ////////////////////////////////////////////////////////////////////////////

    // ATUALIZA PERMISSOES USUARIOS ////////////////////////////////////////////
    Procedure AtualizaPermissoesUsuarios;
    Function  ExcutaQueryUsuario(MySql: String): Boolean;

    // BUSCA ESTOQUES DAS LOJAS ////////////////////////////////////////////////
    Procedure BuscaEstoquesLojas;
    ////////////////////////////////////////////////////////////////////////////

    // SAL�O - RELAT�RIOS //////////////////////////////////////////////////////
    Procedure SalaoRelatorios;
    ////////////////////////////////////////////////////////////////////////////

    // AUDITORIA ///////////////////////////////////////////////////////////////
    // OdirApagar - 22/01/2019
    // Function  Auditoria_Delete_Insert(bInsert:Boolean): Boolean;

    // Busca Dados de Inventario Aleat�rio ====================================
    //DadosInventario;

    Procedure AuditoriaGeraArquivo;
    ////////////////////////////////////////////////////////////////////////////

    // FINANCEIRO - ICMS D�BIOT/CREDITO ////////////////////////////////////////
    Function  ICMSDebitoCreditoImportaNCM: Boolean;
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
    procedure Bt_SimplesVoltarClick(Sender: TObject);
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
    procedure mem_FinanFechaCaixaChange(Sender: TObject);
    procedure Bt_FinanFechaCaixaAnteriorClick(Sender: TObject);
    procedure Bt_FinanFechaCaixaProximoClick(Sender: TObject);
    procedure Stg_FinanFechaCaixaCalendarioDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure Ts_FinanFechaCaixaLanctosShow(Sender: TObject);
    procedure Bt_MargemLucroOKClick(Sender: TObject);
    procedure Cbx_MargemLucroApresChange(Sender: TObject);
    procedure Ts_MargemLucroShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtEdt_MargemLucroDtaFimVenPropertiesEditValueChanged(Sender: TObject);
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
    procedure Dbg_ConsistenciasDblClick(Sender: TObject);
    procedure Dbg_ConsistenciasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_ValesVoltarClick(Sender: TObject);
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
    procedure Ckb_ValesAtivosClick(Sender: TObject);
    procedure Ckb_ValesInativosClick(Sender: TObject);
    procedure Ckb_ValesAtivosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_ValesInativosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_ParamTaxaSindVlrTaxaClick(Sender: TObject);
    procedure Ckb_ParamTaxaSindVlrTaxaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_MargemLucroPcCustoTEClick(Sender: TObject);
    procedure Ckb_MargemLucroPcCustoTEKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure Bt_ProSoftImpArquivoClick(Sender: TObject);
    procedure Bt_ProSoftImpArquivoSalvarClick(Sender: TObject);
    procedure Bt_ProSoftImpArqImportaClick(Sender: TObject);
    procedure PC_FinanPlanFinanceiraPeriodoChange(Sender: TObject);
    procedure EdtProSoftImpPastaArquivoChange(Sender: TObject);
    procedure Bt_SelecionarOKClick(Sender: TObject);
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
    procedure EdtSolicExpDoctoDestinoEnter(Sender: TObject);
    procedure Dbg_ExcelImportarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_IBGE2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ParamSalMininoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ConsistenciasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ValesParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ProfSelecionaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ApresGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_SelecionarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ReposDivProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ReposDivProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ReposDivAlterarQtdClick(Sender: TObject);
    procedure EdtReposDivQtdChange(Sender: TObject);
    procedure EdtTransfCodLojaChange(Sender: TObject);
    procedure EdtTransfCodLojaExit(Sender: TObject);
    procedure Bt_TransfBuscaLojaClick(Sender: TObject);
    procedure Bt_TransfSalvarClick(Sender: TObject);
    procedure Bt_AnaliseRepDiariaSalvaClipboardClick(Sender: TObject);
    procedure Dbg_AnaliseRepDiariaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_ConcDepHistoricoSalvarClick(Sender: TObject);
    procedure Rb_ConcDepHistoricosCX_MTZClick(Sender: TObject);
    procedure Rb_ConcDepHistoricosCX_MTZKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Bt_MixLojasOrigemSimClick(Sender: TObject);
    procedure Bt_AudBuscaArqClick(Sender: TObject);
    procedure Bt_AudBuscaLojaClick(Sender: TObject);
    procedure Rb_AudCadProdutosClick(Sender: TObject);
    procedure Bt_ProSoftImpTodosClick(Sender: TObject);
    procedure Dbg_CodigosViculadosEnter(Sender: TObject);
    procedure Dbg_IBGE1Enter(Sender: TObject);
    procedure Dbg_ParamLojaNecesEnter(Sender: TObject);
    procedure Dbg_ParamSalMininoEnter(Sender: TObject);
    procedure Dbg_ParamLojaReposFornecEnter(Sender: TObject);
    procedure Dbg_TransfLojasEnter(Sender: TObject);
    procedure Dbg_ConsistenciasEnter(Sender: TObject);
    procedure Dbg_ValesParcelasEnter(Sender: TObject);
    procedure Dbg_ProfSelecionaEnter(Sender: TObject);
    procedure Dbg_SelecionarEnter(Sender: TObject);
    procedure Dbg_ExcelImportarEnter(Sender: TObject);
    procedure Dbg_ReposDivProdutosEnter(Sender: TObject);
    procedure Dbg_AnaliseRepDiariaEnter(Sender: TObject);
    procedure Dbg_ConcDepHistoricosEnter(Sender: TObject);
    procedure Dbg_ConcDepDocFinanEnter(Sender: TObject);
    procedure Dbg_ConcDepDocFinanDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_ConcDepDocFinanImprimirClick(Sender: TObject);
    procedure Bt_ConcDepDocFinanExcluirClick(Sender: TObject);
    procedure Bt_ConcDepDocFinanRecebeClick(Sender: TObject);
    procedure Bt_ConcDepDocFinanFechamentoClick(Sender: TObject);
    procedure Dbg_ComprasEstoquesCDEnter(Sender: TObject);
    procedure Bt_ComprasEstoquesMemoriaClick(Sender: TObject);
    procedure Rb_ComprasEstoquesAClick(Sender: TObject);
    procedure Rb_ComprasEstoquesAKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ComprasEstoquesCDCurvaClick(Sender: TObject);
    procedure Dbg_ComprasEstoquesCDDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_AudDepositosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_AudDepositosEnter(Sender: TObject);
    procedure Dbg_AudDepositosDblClick(Sender: TObject);
    procedure Rb_AudCadProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    // N�o Permite Sair com Ctrl+F4
    procedure AppMessage(var Msg: TMSG; var HAndled: Boolean);
  public
    { Public declarations }
    sgSender: String; // Usado para Determinar Qual o Componente SENDER

    bgFechaRepos, // Se Deve Fechar Digita��o de Altera��o de Qtd de reposi��o Depois de Salvar...
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
    // (C) Concilia��o do Caixa Dias
  end;

type
   THackDBGrid = class(TDBGrid);

const
  // Show Hint em Forma de Bal�o
  TTS_BALLOON = $40;
  TTM_SETTITLE = (WM_USER + 32);
  //////////////////////////////

var
  FrmSolicitacoes: TFrmSolicitacoes;

  // Show Hint em Forma de Bal�o
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  TD: TTransactionDesc;

  GridNew: TDBGrid;

  igTipo: Integer; // Tipo de Eventos no Calendario
  PrimeiroDiaMes: TDateTime;

  sgDtaI, sgDtaF: String;

  sgMensagem,
  sgMessagemSimplesOK,    // Menssagem para o Bt_SimplesOK
  sgMessagemSimplesVoltar // Menssagem para o Bt_SimplesVoltar
  : String;

  sgNomeArq: String;

  sgTipoDML: String;
  sgCodProd: String;

  igDiaSemana: Integer;

  bRelSimples: Boolean;

  IBQ_ConsultaFilial  : TIBQuery;

  igCodDeposito: Integer;

implementation

uses DK_Procs1, UDMBelShop, UFrmBelShop, UDMSalao, UPesquisa, UFrmSalao,
     UDMVirtual, UDMCentralTrocas, UDMConexoes,
     UFrmSelectEmpProcessamento, IBCustomDataSet, UDMRelatorio,
     UPesquisaIB, UDMBancosConciliacao, RTLConsts, UFrmBancoExtratos;

{$R *.dfm}

//==============================================================================
// Odir ========================================================================
//==============================================================================

// FINANCEIRO - ICMS D�BIOT/CREDITO - Importa NCM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSolicitacoes.ICMSDebitoCreditoImportaNCM: Boolean;
Var
  MySql: String;

  sLinha,
  sDia, sHora: String;

  i: Integer;
  bImporta: Boolean;
Begin
  Result:=True;

  sHora:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
  sDia :=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

  OdirPanApres.Caption:='AGUARDE !! Importando Arquivo(CSV) NCM e Percentuais ICMS...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicitacoes;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  OdirPanApres.Refresh;
  Refresh;

  // Verifica se Transa��o esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    FrmBelShop.MontaProgressBar(True, FrmSolicitacoes);
    pgProgBar.Properties.Max:=EditorProSoftImpArquivo.Lines.Count;
    pgProgBar.Position:=0;

    For i:=0 to EditorProSoftImpArquivo.Lines.Count-1 do
    Begin
      Try
        StrToInt(Trim(Separa_String(EditorProSoftImpArquivo.Lines[i],1)));
        bImporta:=True;
      Except
        bImporta:=False;
      End;

      // Importa NCM ===========================================================
      If bImporta Then
      Begin
        // Trata Final da Linha para Importa��o ================================
        sLinha:=Trim(EditorProSoftImpArquivo.Lines[i]);
        If Copy(sLinha,length(sLinha),1)<>';' Then
         sLinha:=sLinha+';';

        MySql:=' UPDATE OR INSERT INTO DEB_CRED_ICMS_NCM'+
               ' (DES_NCM, PER_ICMS, PER_FCP, PER_ICMS_EFETIVO,'+
               '  USU_ATUALIZACAO, DTA_ATUALIZACAO, HRA_ATUALIZACA0)'+

               ' VALUES ('+
               QuotedStr(Trim(Separa_String(sLinha,1)))+', '+ // DES_NCM
               QuotedStr(f_Troca(',','.',f_Troca('%','',Separa_String(sLinha,2))))+', '+ // PER_ICMS
               QuotedStr(f_Troca(',','.',f_Troca('%','',Separa_String(sLinha,3))))+', '+ // PER_FCP
               QuotedStr(f_Troca(',','.',f_Troca('%','',Separa_String(sLinha,4))))+', '+ // PER_ICMS_EFETIVO
               Cod_Usuario+','+ // USU_ATUALIZACAO
               QuotedStr(f_Troca('/','.',f_Troca('-','.',sDia)))+', '+ // DTA_ATUALIZACAO
               QuotedStr(sHora)+')'+ // HRA_ATUALIZACA0

               ' MATCHING (DES_NCM)';
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If bImporta Then

      pgProgBar.Position:=i+1;
    End; // For i:=0 to EditorProSoftImpArquivo.Lines.Count-1 do

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    msg('Arquivo NCM e Percentuais ICMS '+cr+cr+'Importado com SUCESSO !!','A')
  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);
      Result:=False;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transa��o
  FrmBelShop.MontaProgressBar(False, FrmSolicitacoes);
  DateSeparator:='/';
  DecimalSeparator:=',';
  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  EditorProSoftImpArquivo.Lines.Clear;
  EdtProSoftImpPastaArquivo.Clear;
End; // FINANCEIRO - ICMS D�BIOT/CREDITO - Importa NCM >>>>>>>>>>>>>>>>>>>>>>>>>

// COMPRAS - Analise de Saldo no CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.ComprasAnaliseSaldoCD(sCurva: String);
Begin
  OdirPanApres.Caption:='AGUARDE !! Localizando Estoque CD para Analise...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicitacoes;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  OdirPanApres.Refresh;
  Refresh;

  DMBelShop.CDS_ComprasEstoqueCD.Close;
  DMBelShop.SDS_ComprasEstoqueCD.Params.ParamByName('Curva').AsString:=sCurva;
  DMBelShop.SDS_ComprasEstoqueCD.Params.ParamByName('Comprador').AsString:=Cod_Usuario;
  DMBelShop.CDS_ComprasEstoqueCD.Open;

  OdirPanApres.Visible:=False;
  If DMBelShop.CDS_ComprasEstoqueCD.RecordCount<3 Then
  Begin
    msg('Sem Produtos a Apresentar...','A');
    DMBelShop.CDS_ComprasEstoqueCD.Close;
    Exit;
  End; // If DMBelShop.CDS_ComprasEstoqueCD.IsEmpty Then

End; // COMPRAS - Analise de Saldo no CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// MOVIMENTO DE CAIXA DIA - Importa Arquivo Diario - Trinks >>>>>>>>>>>>>>>>>>>>
Function TFrmSolicitacoes.TrinksImportaArquivoDiario:Boolean;
Var
  MySql: String;

  wDia, wMes, wAno: Word;

  sDateSeparator: Char;

  sLinha, sDia, sHora,
  sNrDocto, sDtaMovto, sDtaRegistro,
  sCodTrinks, sCodLinx, sCodSidicom: String;

  i: Integer;

  bImporta, bInsert: Boolean; // Se � Linha Para Importar
Begin
  Result:=True;

  sHora:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
  sDia :=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

  OdirPanApres.Caption:='AGUARDE !! Importando Arquivo Di�rio Trinks';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicitacoes;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  OdirPanApres.Refresh;
  Refresh;

  // Verifica se Transa��o esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Verifica se Exclui Movimewntos do Dia j� Existentes =====================
// OdirApagar - 21/11/2018
//    If bgOK Then
//    Begin
//      If msg('Dia '+sgDta+' J� Importado !!'+cr+cr+'Deseja Exclu�-lo'+cr+'Antes da Importa��o ???','C')=1 Then
//      Begin
//        MySql:=' DELETE FROM TRINKS_DIARIO t'+
//               ' WHERE t.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDta)));
//        DMBelShop.SQLC.Execute(MySql,nil,nil);
//      End; // If msg('Dia '+sgDta+' J� Importado !!'+cr+cr+'Deseja Exclu�-lo'+cr+'Antes da Importa��o ???','C')=1 Then
//    End; // If bgOK Then

    FrmBelShop.MontaProgressBar(True, FrmSolicitacoes);
    pgProgBar.Properties.Max:=EditorProSoftImpArquivo.Lines.Count;
    pgProgBar.Position:=0;

    // =========================================================================
    // Processa Arquivo Trinks =================================================
    // =========================================================================
    For i:=0 to EditorProSoftImpArquivo.Lines.Count-1 do
    Begin
      // =======================================================================
      // Verifica Leiaute NOVO - Formato: Relat�rio de 2019-03-12 at� 2019-03-13
      // =======================================================================
      If Copy(Trim(EditorProSoftImpArquivo.Lines[i]),1,9)='Relat�rio' Then
      Begin
        If Pos('-',Trim(EditorProSoftImpArquivo.Lines[i]))<>18 Then
        Begin
          msg('TRINKS - Leiaute Inv�lido (-)!!','A');
          FrmBelShop.MontaProgressBar(False, FrmSolicitacoes);
          Screen.Cursor:=crDefault;
          OdirPanApres.Visible:=False;
          Exit;
        End; // If Pos('-',(Trim(EditorProSoftImpArquivo.Lines[i]),1,9))<>5 Then

        // Data de Todos os Movimentos ------------------------------
        sNrDocto:=Copy(Trim(EditorProSoftImpArquivo.Lines[i]),14,10);
        sDtaMovto:=Copy(sNrDocto,9,2);
        sDtaMovto:=sDtaMovto+'.'+Copy(sNrDocto,6,2);
        sDtaMovto:=sDtaMovto+'.'+Copy(sNrDocto,1,4);

        Try
          sDateSeparator:=DateSeparator;
          DateSeparator:='.';

          StrToDate(sDtaMovto);
        Except
          DateSeparator:=sDateSeparator;
          msg('TRINKS - Leiaute Inv�lido (sDtaMovto) !!','A');
          FrmBelShop.MontaProgressBar(False, FrmSolicitacoes);
          Screen.Cursor:=crDefault;
          OdirPanApres.Visible:=False;
          Exit;
        End;
        DateSeparator:=sDateSeparator;

        // Verifica se J� Existe Movto =======================================
        sNrDocto:='';
        MySql:=' SELECT t.cod_trinks'+
               ' FROM TRINKS_DIARIO t'+
               ' WHERE t.dta_movto = '+QuotedStr(sDtaMovto);
        DMBelShop.SQLQuery1.Close;
        DMBelShop.SQLQuery1.SQL.Clear;
        DMBelShop.SQLQuery1.SQL.Add(MySql);
        DMBelShop.SQLQuery1.Open;
        sNrDocto:=Trim(DMBelShop.SQLQuery1.FieldByName('Cod_Trinks').AsString);
        DMBelShop.SQLQuery1.Close;

        If Trim(sNrDocto)<>'' Then
        Begin
          msg('TRINKS - Movimentos do dia '+sDtaMovto+cr+cr+'J� Importado !!!','A');
          FrmBelShop.MontaProgressBar(False, FrmSolicitacoes);
          Screen.Cursor:=crDefault;
          OdirPanApres.Visible:=False;
          Exit;
        End; // If Pos('-',(Trim(EditorProSoftImpArquivo.Lines[i]),1,9))<>5 Then

        // Monta Numero do Documento ===========================================
        sNrDocto:='';
        DecodeDate(StrToDate(sDtaMovto), wAno, wMes, wDia);
        sNrDocto:=IntToStr(wDia);

        If wMes<10 Then
         sNrDocto:=sNrDocto+'0'+IntToStr(wMes)
        Else
         sNrDocto:=sNrDocto+IntToStr(wMes);

        sNrDocto:=sNrDocto+Copy(IntToStr(wAno),length(IntToStr(wAno))-1,2);
      End; // If Copy(Trim(EditorProSoftImpArquivo.Lines[i]),1,9)='Relat�rio' Then
      // Verifica Leiaute NOVO - Formato: Relat�rio de 2019-03-12 at� 2019-03-13
      // =======================================================================

      // =======================================================================
      // Pega Codigo da Loja no Trinks e ve se Importa =========================
      // =======================================================================
      Try
        sCodTrinks:=IntToStr(StrToInt(Trim(Separa_String(EditorProSoftImpArquivo.Lines[i],1))));

        If (Trim(sDtaMovto)='') Or (Trim(sNrDocto)='') Then
        Begin
          msg('TRINKS - Leiaute Inv�lido  (Sem sDtaMovto) !!','A');
          FrmBelShop.MontaProgressBar(False, FrmSolicitacoes);
          Screen.Cursor:=crDefault;
          OdirPanApres.Visible:=False;
          Exit;
        End; // If (Trim(sDtaMovto)='') Or (Trim(sNrDocto)='') Then

        bImporta:=True;
      Except
        bImporta:=False;
      End;
      // Pega Codigo da Loja no Trinks e ve se Importa =========================
      // =======================================================================

      // =======================================================================
      // Importa Trinks Diario =================================================
      // =======================================================================
      If bImporta Then
      Begin
        // Trata Linha para importa��o =========================================
        sLinha:=Trim(EditorProSoftImpArquivo.Lines[i]);
        If Copy(sLinha,length(sLinha),1)<>';' Then
         sLinha:=sLinha+';';

        // Atualiza Data do Registro ===========================================
        sDtaRegistro:=Trim(Separa_String(sLinha,3));
        sDtaRegistro:=Copy(sDtaRegistro,9,2)+'.'+Copy(sDtaRegistro,6,2)+'.'+Copy(sDtaRegistro,1,4);

        Try
          sDateSeparator:=DateSeparator;
          DateSeparator:='.';
          DateToStr(StrToDateTime(sDtaRegistro));
        Except
          msg('TRINKS - Leiaute Inv�lido (sDtaRegistro) !!','A');
          FrmBelShop.MontaProgressBar(False, FrmSolicitacoes);
          Screen.Cursor:=crDefault;
          OdirPanApres.Visible:=False;
          DateSeparator:=sDateSeparator;
          Exit;
        End;
        DateSeparator:=sDateSeparator;

        // Busca Codigos da Lojas SIDICOM e LINX ===============================
        MySql:=' SELECT e.cod_filial, e.cod_linx'+
               ' FROM EMP_CONEXOES e'+
               ' WHERE e.cod_trinks='+sCodTrinks;
        DMBelShop.SQLQuery1.Close;
        DMBelShop.SQLQuery1.SQL.Clear;
        DMBelShop.SQLQuery1.SQL.Add(MySql);
        DMBelShop.SQLQuery1.Open;
        sCodSidicom:=DMBelShop.SQLQuery1.FieldByName('Cod_Filial').AsString;
        sCodLinx   :=DMBelShop.SQLQuery1.FieldByName('Cod_Linx').AsString;
        DMBelShop.SQLQuery1.Close;

        If Trim(sCodLinx)='' Then
        Begin
          bImporta:=False;

          While Not bImporta do
          Begin
            msg('Loja N�o Encontrada: '+cr+sCodTrinks+' - '+Trim(Separa_String(sLinha,2))+cr+
                'Favor Cadastrar Antes de Continuar..','A');

            // Busca Codigos da Lojas SIDICOM e LINX ===============================
            MySql:=' SELECT e.cod_filial, e.cod_linx'+
                   ' FROM EMP_CONEXOES e'+
                   ' WHERE e.cod_trinks='+sCodTrinks;
            DMBelShop.SQLQuery1.Close;
            DMBelShop.SQLQuery1.SQL.Clear;
            DMBelShop.SQLQuery1.SQL.Add(MySql);
            DMBelShop.SQLQuery1.Open;
            sCodSidicom:=DMBelShop.SQLQuery1.FieldByName('Cod_Filial').AsString;
            sCodLinx   :=DMBelShop.SQLQuery1.FieldByName('Cod_Linx').AsString;
            DMBelShop.SQLQuery1.Close;

            If Trim(sCodLinx)<>'' Then
             bImporta:=True;
          End; // While Not bImporta do
        End; // If Trim(sCodLinx)='' Then

        // =====================================================================
        // Importa dados do Aequivo Trinks Diario ==============================
        // =====================================================================
        If bImporta Then
        Begin
          // ===================================================================
          // Verifica se J� Existe Movto =======================================
          // ===================================================================
          MySql:=' SELECT t.cod_trinks'+
                 ' FROM TRINKS_DIARIO t'+
                 ' WHERE t.dta_movto = '+QuotedStr(sDtaMovto)+
                 ' AND   t.cod_trinks='+sCodTrinks;
          DMBelShop.SQLQuery1.Close;
          DMBelShop.SQLQuery1.SQL.Clear;
          DMBelShop.SQLQuery1.SQL.Add(MySql);
          DMBelShop.SQLQuery1.Open;
          bInsert:=(Trim(DMBelShop.SQLQuery1.FieldByName('Cod_Trinks').AsString)='');
          DMBelShop.SQLQuery1.Close;
          // Verifica se J� Existe Movto =======================================
          // ===================================================================

          //====================================================================
          // Update no Movimento ===============================================
          //====================================================================
          If Not bInsert Then
          Begin
            MySql:=' UPDATE TRINKS_DIARIO t'+
                   ' set t.num_clientes=t.num_clientes + '+Trim(f_Troca(',','',Separa_String(sLinha,4)))+
                   ', t.num_atendimentos=num_atendimentos + '+Trim(f_Troca(',','',Separa_String(sLinha,5)))+
                   ', t.vlr_servicos=vlr_servicos + '+Trim(f_Troca(',','',Trim(Separa_String(sLinha,7))))+
                   ', t.vlr_produtos=vlr_produtos + '+Trim(f_Troca(',','',Trim(Separa_String(sLinha,8))))+
                   ', t.vlr_pacotes=vlr_pacotes + '+Trim(f_Troca(',','',Trim(Separa_String(sLinha,9))))+
                   ', t.vlr_descontos=vlr_descontos + ABS('+Trim(f_Troca(',','',Trim(Separa_String(sLinha,10))))+')'+
                   ', t.vlr_total=vlr_total + '+Trim(f_Troca(',','',Trim(Separa_String(sLinha,11))))+
                   ', t.vlr_creditos=vlr_creditos + '+Trim(f_Troca(',','',Trim(Separa_String(sLinha,12))))+
                   ', t.vlr_debitos=vlr_debitos + '+Trim(f_Troca(',','',Trim(Separa_String(sLinha,13))))+
                   ', t.vlr_dinheiro=vlr_dinheiro + '+Trim(f_Troca(',','',Trim(Separa_String(sLinha,14))))+
                   ', t.vlr_outros=vlr_outros + '+Trim(f_Troca(',','',Trim(Separa_String(sLinha,15))))+
                   ', t.vlr_troco=vlr_troco + ABS('+Trim(f_Troca(',','',Trim(Separa_String(sLinha,16))))+')'+
                   ', t.qtd_servicos=qtd_servicos + '+Trim(f_Troca(',','',Trim(Separa_String(sLinha,18))))+
                   ', t.qtd_produtos=qtd_produtos + '+Trim(f_Troca(',','',Trim(Separa_String(sLinha,19))))+
                   ', t.qtd_pacotes=qtd_pacotes + '+Trim(f_Troca(',','',Trim(Separa_String(sLinha,20))))+
                   ', t.vlr_ticket_medio=t.vlr_total / t.num_atendimentos'+
                   ', t.dta_atualizacao='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDia)))+
                   ', t.hra_atualizacao='+QuotedStr(sHora);

                   // Valores Somente para Movimentos do Dia ===================
                   If sDtaMovto=sDtaRegistro Then
                   Begin
                     MySql:=
                      MySql+', t.vlr_sangria=t.vlr_sangria+'+Trim(f_Troca(',','',Trim(Separa_String(sLinha,17))));
                   End; // If sDtaMovto=sDtaRegistro Then

            MySql:=
             MySql+' WHERE t.dta_movto = '+QuotedStr(sDtaMovto)+
                   ' AND   t.cod_trinks='+sCodTrinks;
          End; // If Not bInsert Then
          // Update no Movimento ===============================================
          //====================================================================

          //====================================================================
          // Insere Novo Movimento =============================================
          //====================================================================
          If bInsert Then
          Begin
            MySql:=' INSERT INTO TRINKS_DIARIO '+
                   ' (COD_TRINKS, DES_TRINKS, NUM_DOCTO, DTA_MOVTO,'+
                   '  NUM_CLIENTES, NUM_ATENDIMENTOS,'+
                   '  VLR_TICKET_MEDIO, VLR_SERVICOS, VLR_PRODUTOS, VLR_PACOTES,'+
                   '  VLR_DESCONTOS, VLR_TOTAL, VLR_CREDITOS, VLR_DEBITOS,'+
                   '  VLR_DINHEIRO, VLR_OUTROS, VLR_TROCO, VLR_SANGRIA,'+
                   '  QTD_SERVICOS, QTD_PRODUTOS, QTD_PACOTES,'+
                   '  COD_LINX, COD_LOJA, DTA_ATUALIZACAO, HRA_ATUALIZACAO)'+

                   ' VALUES ('+
                   sCodTrinks+', '+ // COD_TRINKS
                   QuotedStr(Trim(Separa_String(sLinha,2)))+', '+ // DES_TRINKS
                   QuotedStr(sNrDocto)+', '+ // NUM_DOCTO
                   QuotedStr(sDtaMovto)+', '+ // DTA_MOVTO
                   Trim(f_Troca(',','',Separa_String(sLinha,4)))+', '+ // NUM_CLIENTES
                   Trim(f_Troca(',','',Separa_String(sLinha,5)))+', '+ // NUM_ATENDIMENTOS
                   Trim(f_Troca(',','',Separa_String(sLinha,6)))+', '+ // VLR_TICKET_MEDIO
                   Trim(f_Troca(',','',Separa_String(sLinha,7)))+', '+ // VLR_SERVICOS
                   Trim(f_Troca(',','',Separa_String(sLinha,8)))+', '+ // VLR_PRODUTOS
                   Trim(f_Troca(',','',Separa_String(sLinha,9)))+', '+ // VLR_PACOTES
                   'ABS('+Trim(f_Troca(',','',Separa_String(sLinha,10)))+'), '+ // VLR_DESCONTOS
                   Trim(f_Troca(',','',Separa_String(sLinha,11)))+', '+ // VLR_TOTAL
                   Trim(f_Troca(',','',Separa_String(sLinha,12)))+', '+ // VLR_CREDITOS
                   Trim(f_Troca(',','',Separa_String(sLinha,13)))+', '+ // VLR_DEBITOS
                   Trim(f_Troca(',','',Separa_String(sLinha,14)))+', '+ // VLR_DINHEIRO
                   Trim(f_Troca(',','',Separa_String(sLinha,15)))+', '+ // VLR_OUTROS
                   'ABS('+Trim(f_Troca(',','',Separa_String(sLinha,16)))+'), '; // VLR_TROCO

                   // Valores Somente para Movimentos do Dia ===================
                   If sDtaMovto=sDtaRegistro Then
                   Begin
                     MySql:=
                      MySql+Trim(f_Troca(',','',Separa_String(sLinha,17)))+', '; // VLR_SAGRIA
                   End; // If sDtaMovto=sDtaRegistro Then

                   // Valores Zerados para Movimentos que Sekjam do Dia ========
                   If sDtaMovto<>sDtaRegistro Then
                   Begin
                     MySql:=
                      MySql+'0.00 , '; // VLR_SAGRIA
                   End; // If sDtaMovto<>sDtaRegistro Then

            MySql:=
             MySql+Trim(f_Troca(',','',Separa_String(sLinha,18)))+', '+ // QTD_SERVICOS
                   Trim(f_Troca(',','',Separa_String(sLinha,19)))+', '+ // QTD_PRODUTOS
                   Trim(f_Troca(',','',Separa_String(sLinha,20)))+', '+ // QTD_PACOTES
                   sCodLinx+', '+ // COD_LINX
                   QuotedStr(sCodSidicom)+', '+ // COD_LOJA
                   QuotedStr(f_Troca('/','.',f_Troca('-','.',sDia)))+', '+ // DTA_ATUALIZACAO
                   QuotedStr(sHora)+')'; // HRA_ATUALIZACAO
          End; // If bInsert Then
          // Insere Novo Movimento =============================================
          //====================================================================

          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End; // If bImporta Then
        // Importa dados do Aequivo Trinks Diario ==============================
        // =====================================================================
      End; // If bImporta Then
      // Importa Trinks Diario =================================================
      // =======================================================================

      pgProgBar.Position:=i+1;
    End; // For i:=0 to EditorProSoftImpArquivo.Lines.Count-1 do
    // Processa Arquivo Trinks =================================================
    // =========================================================================

    // =========================================================================
    // Atualiza Transacao ======================================================
    // =========================================================================
    DMBelShop.SQLC.Commit(TD);
    // Atualiza Transacao ======================================================
    // =========================================================================

    msg('Arquivo Di�rio Trinks'+cr+cr+'Importado com SUCESSO !!','A')
  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);
      Result:=False;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transa��o
  FrmBelShop.MontaProgressBar(False, FrmSolicitacoes);
  DateSeparator:='/';
  DecimalSeparator:=',';
  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  EditorProSoftImpArquivo.Lines.Clear;
  EdtProSoftImpPastaArquivo.Clear;
End; // MOVIMENTO DE CAIXA DIA - Importa Arquivo Diario - Trinks >>>>>>>>>>>>>>>

// OdirApagar - 22/01/2019
//// AUDITORIA - Delete e/ou Insert Tabela: W_PROD_LOJA >>>>>>>>>>>>>>>>>>>>>>>>>>
//Function TFrmSolicitacoes.Auditoria_Delete_Insert(bInsert:Boolean): Boolean;
//Var
//  MySql: String;
//Begin
//  Result:=True;
//
//  // Verifica se Transa��o esta Ativa
//  If DMBelShop.SQLC.InTransaction Then
//   DMBelShop.SQLC.Rollback(TD);
//
//  // Monta Transacao
//  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//  TD.IsolationLevel:=xilREADCOMMITTED;
//  DMBelShop.SQLC.StartTransaction(TD);
//
//  Try // Try da Transa��o
//    // Exclui Produtos Antigos da Loja ------------------------------
//    MySql:=' DELETE FROM W_PROD_LOJA pl'+
//           ' WHERE pl.cod_loja_linx='+IntToStr(EdtAudCodLoja.AsInteger);
//    DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//    // Insere Mix da Produtos da Loja -------------------------------
//    If bInsert Then
//    Begin
//      MySql:=' INSERT into W_PROD_LOJA'+
//             ' SELECT DISTINCT pl.cod_loja_linx, pl.cod_produto'+
//             ' FROM LINX_PRODUTOS_LOJAS pl'+
//             ' WHERE pl.cod_loja_linx='+IntToStr(EdtAudCodLoja.AsInteger);
//      DMBelShop.SQLC.Execute(MySql,nil,nil);
//    End; // If bInsert Then
//
//    // Atualiza Transacao ======================================================
//    DMBelShop.SQLC.Commit(TD);
//  Except // Except da Transa��o
//    on e : Exception do
//    Begin
//      // Abandona Transacao ====================================================
//      DMBelShop.SQLC.Rollback(TD);
//
//      OdirPanApres.Visible:=False;
//      Screen.Cursor:=crDefault;
//
//      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
//
//      Result:=False;
//    End; // on e : Exception do
//  End; // Try da Transa��o
//End; // AUDITORIA - Delete e/ou Insert Tabela: W_PROD_LOJA >>>>>>>>>>>>>>>>>>>>>

// AUDITORIA - Gera Arquivo de Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.AuditoriaGeraArquivo;
Var
  MySql: String;

  tsArquivo: TStringList;
  sParametros: String;

  b: Boolean;
Begin
  Screen.Cursor:=crArrow;

  //============================================================================
  // Busca Cadastro de Produtos ================================================
  //============================================================================
  If Rb_AudCadProdutos.Checked Then
  Begin
    PainelApresExp.Caption:='AGUARDE !! Gerando Arquivo de Produtos...';
    PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
    PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
    PainelApresExp.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-PainelApresExp.Height)/2))-20;
    PainelApresExp.Color:=clSilver;
    PainelApresExp.Font.Style:=[fsBold];
    PainelApresExp.Parent:=FrmSolicitacoes;
    PainelApresExp.Visible:=True;
    Refresh;

    MySql:=' SELECT'+
           ' TRIM(p.cod_barra)||'';''||TRIM(p.nome)||'';''||TRIM(p.desc_setor)||'';''||TRIM(p.desativado)||'';'' LINHA'+
           ' FROM LINXPRODUTOS p'+

           ' UNION'+

           ' SELECT'+
           ' TRIM(b.cod_barra)||'';''||TRIM(pb.nome)||'';''||TRIM(pb.desc_setor)||'';''||TRIM(pb.desativado)||'';'''+
           ' FROM LINXPRODUTOS pb'+
           '     LEFT JOIN LINXPRODUTOSCODBAR b on b.cod_produto=pb.cod_produto';
  End; // If Rb_AudCadProdutos.Checked Then
  // Busca Cadastro de Produtos ================================================
  //============================================================================

  //============================================================================
  // Busca Posi��o de Estoque dos Produtos da Loja =============================
  //============================================================================
  If Rb_AudPosEstoque.Checked Then
  Begin
    sgDia :=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
    b:=True;
    While b do
    Begin
      sgDia:=InputBoxData('Auditoria', 'Saldo Final do Dia ? (Encerrar=99/99/9999)', sgDia, False);

      If sgDia='' Then
      Begin
        msg('Dia Inv�lido !!','A');
        Exit;
      End;

      If sgDia='99/99/9999' Then
       Exit;

      if msg('O Dia '+sgDia+' Esta Correto ??','C')=1 Then
       b:=False
    End; // While b do

    If msg('Buscar Saldo de Estoque Inicial'+cr+cr+'do Dia '+sgDia+'e no Linx ??','C')=1 Then
    Begin
      sgDia :=DateToStr(StrToDate(sgDia)-1);

      PainelApresExp.Caption:='AGUARDE !! Atualizando Saldo Dep�sito '+IntToStr(igCodDeposito)+' (LINX - CLOUD)';
      PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
      PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
      PainelApresExp.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-PainelApresExp.Height)/2))-20;
      PainelApresExp.Color:=clSilver;
      PainelApresExp.Font.Style:=[fsBold];
      PainelApresExp.Parent:=FrmSolicitacoes;
      PainelApresExp.Visible:=True;
      Refresh;

      // WebService Linx - Atualiza Saldo do Depoisto Solicitado =================
      sParametros:=sgPastaWebService+'PWebServiceLinx.exe LinxProdutosInventario'; // Excutavel e Metodo a Processar
      sParametros:=sParametros+' '+IntToStr(EdtAudCodLoja.AsInteger); // Codigo da Loja a Processar
      sParametros:=sParametros+' "'+IncludeTrailingPathDelimiter(sgPastaWebService+'Metodos')+'"'; // Pasta dos Metodos
      sParametros:=sParametros+' "'+IncludeTrailingPathDelimiter(sgPastaWebService+'Retornos')+'"'; // Pasta dos Retornos
      sParametros:=sParametros+' "'+sgDia+'"'; // Data Inicial
      sParametros:=sParametros+' NULL'; // Data Final
      sParametros:=sParametros+' NULL'; // Codigo do Produto   => Pode ser Nulo - String ''
      sParametros:=sParametros+' '+IntToStr(igCodDeposito); // Codigo Qualqueer    => Pode ser Nulo - String ''
      sParametros:=sParametros+' NULL'; // Campo Data para Pesquisa => SIM ou Branco => Se Utiliza��o de Data de Emiss�o Para Pesquisa

      // Envia Parametro e Aguarda Termino do Processo ===========================
      CreateProcessSimple(sParametros);

      // Verifica se Web Serive Funcionou ========================================
      MySql:=' SELECT FIRST 1 i.cod_produto'+
             ' FROM LINXPRODUTOSINVENTARIO i'+
             ' WHERE i.dta_atualizacao=CURRENT_DATE'+
             ' AND   i.cod_deposito='+IntToStr(igCodDeposito)+
             ' AND   i.empresa='+IntToStr(EdtAudCodLoja.AsInteger);
      DMBelShop.SQLQuery3.Close;
      DMBelShop.SQLQuery3.SQL.Clear;
      DMBelShop.SQLQuery3.SQL.Add(MySql);
      DMBelShop.SQLQuery3.Open;
      sParametros:=DMBelShop.SQLQuery3.FieldByName('Cod_Produto').AsString;
      DMBelShop.SQLQuery3.Close;

      If Trim(sParametros)='' Then
      Begin
        msg('Problema de Conex�o com o LINX !!'+cr+'Web Service N�o Funcionou !!'+cr+cr+'TENTE NOVAMENTE !!!','A');
        PainelApresExp.Visible:=False;
        Screen.Cursor:=crDefault;
        Exit;
      End; // If Trim(sParametros)='' Then
    End; // If msg('Buscar Saldo de Estoque Inicial'+cr+cr+'do Dia de Hoje no Linx ??','C')=1 Then

    // Gera o Arquivo para Auditoria - Inventario ==============================
    PainelApresExp.Caption:='AGUARDE !! Gerando Arquivo de Estoque de Produtos...';
    PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
    PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
    PainelApresExp.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-PainelApresExp.Height)/2))-20;
    PainelApresExp.Color:=clSilver;
    PainelApresExp.Font.Style:=[fsBold];
    PainelApresExp.Parent:=FrmSolicitacoes;
    PainelApresExp.Visible:=True;
    Refresh;

// OdirApagar - 22/01/2019
//    // Insere Produtos que a Loja Trabalha =====================================
//    If Not Auditoria_Delete_Insert(True) Then
//     Exit;
//
//    // Busca Posi��o de Estoque dos Produtos da Loja ----------------
//    MySql:=' SELECT'+
//           ' TRIM(REPLACE(lj.nome_emp, ''-'', ''|''))||'';''||'+
//           ' TRIM(pr.cod_barra)||'';''||'+
//           ' REPLACE(TRIM(pd.preco_custo), ''.'', '','')||'';''||'+
//           ' REPLACE(TRIM(pd.preco_venda), ''.'', '','')||'';''||'+
//           ' CAST(COALESCE(iv.quantidade,0) AS INTEGER)||'';''||'+
//           ' TRIM(pr.desativado) LINHA'+
//
//           ' FROM W_PROD_LOJA pl'+
//           '     LEFT JOIN LINXLOJAS lj               ON lj.empresa=pl.cod_loja_linx'+
//           '     LEFT JOIN LINXPRODUTOS pr            ON pr.cod_produto=pl.cod_produto'+
//           '     LEFT JOIN LINXPRODUTOSDETALHES pd    ON pd.empresa=pl.cod_loja_linx'+
//           '                                         AND pd.cod_produto=pl.cod_produto'+
//           '     LEFT JOIN LINXPRODUTOSINVENTARIO iv  ON iv.empresa=pl.cod_loja_linx'+
//           '                                         AND iv.cod_produto=pl.cod_produto'+
//           '                                         AND iv.cod_deposito='+IntToStr(igCodDeposito)+
//
//           ' WHERE pl.cod_loja_linx='+IntToStr(EdtAudCodLoja.AsInteger);

    MySql:=' SELECT'+
           ' TRIM(REPLACE(lj.nome_emp, ''-'', ''|''))||'';''||'+
           ' TRIM(pr.cod_barra)||'';''||'+
           ' REPLACE(TRIM(COALESCE(pd.preco_custo,0.0000)), ''.'', '','')||'';''||'+
           ' REPLACE(TRIM(COALESCE(pd.preco_venda,0.0000)), ''.'', '','')||'';''||'+
           ' CAST(COALESCE(iv.quantidade,0) AS INTEGER)||'';''||'+
           ' TRIM(pr.desativado) LINHA'+

           ' FROM LINXPRODUTOS pr'+
           '     LEFT JOIN LINXLOJAS lj               ON lj.empresa='+IntToStr(EdtAudCodLoja.AsInteger)+
           '     LEFT JOIN LINXPRODUTOSINVENTARIO iv  ON iv.empresa=lj.empresa'+
           '                                         AND iv.cod_deposito='+IntToStr(igCodDeposito)+
           '                                         AND iv.cod_produto=pr.cod_produto'+
           '     LEFT JOIN LINXPRODUTOSDETALHES pd    ON pd.empresa=lj.empresa'+
           '                                         AND pd.cod_produto=pr.cod_produto'+

           ' UNION'+

           ' SELECT'+
           ' TRIM(REPLACE(lj.nome_emp, ''-'', ''|''))||'';''||'+
           ' TRIM(cb.cod_barra)||'';''||'+
           ' REPLACE(TRIM(COALESCE(pd.preco_custo,0.0000)), ''.'', '','')||'';''||'+
           ' REPLACE(TRIM(COALESCE(pd.preco_venda,0.0000)), ''.'', '','')||'';''||'+
           ' ''0;''||'+
           ' TRIM(pr.desativado) LINHA'+

           ' FROM LINXPRODUTOSCODBAR cb'+
           '     LEFT JOIN LINXPRODUTOS pr            ON pr.cod_produto=cb.cod_produto'+
           '     LEFT JOIN LINXLOJAS lj               ON lj.empresa='+IntToStr(EdtAudCodLoja.AsInteger)+
           '     LEFT JOIN LINXPRODUTOSDETALHES pd    ON pd.empresa=lj.empresa'+
           '                                         AND pd.cod_produto=cb.cod_produto'+
           ' WHERE NOT EXISTS (SELECT 1'+
           '                   FROM LINXPRODUTOS pp'+
           '                   WHERE pp.cod_barra=cb.cod_barra)';
  End; // If Rb_AudPosEstoque.Checked Then
  // Busca Posi��o de estoque dos Produtos da Loja =============================
  //============================================================================

  //============================================================================
  // Monta o Arquivo ===========================================================
  //============================================================================
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  FrmBelShop.MontaProgressBar(True, FrmSolicitacoes);
  pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
  pgProgBar.Position:=0;

  Try
    //==========================================================================
    // Cria Arquivo Texto ======================================================
    //==========================================================================
    tsArquivo:=TStringList.Create;
    // Cria Arquivo Texto ======================================================
    //==========================================================================

    //==========================================================================
    // Apropria Produtos no Arquivo ============================================
    //==========================================================================
    DMBelShop.CDS_Busca.DisableControls;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      tsArquivo.Add(DMBelShop.CDS_Busca.FieldByName('Linha').AsString);

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.EnableControls;
    DMBelShop.CDS_Busca.Close;
    // Apropria Produtos no Arquivo ============================================
    //==========================================================================

    //==========================================================================
    // Salva Arquivo Texto =====================================================
    //==========================================================================
    tsArquivo.SaveToFile(EdtAudDescArquivo.Text);
    // Salva Arquivo Texto =====================================================
    //==========================================================================
  Finally // Try
    { Libera a instancia da lista da mem�ria }
    FreeAndNil(tsArquivo);
  End; // Try
  // Monta o Arquivo ===========================================================
  //============================================================================

  // OdirApagar - 22/01/2019
//  If Not Auditoria_Delete_Insert(False) Then
//   Exit;

  FrmBelShop.MontaProgressBar(False, FrmSolicitacoes);
  PainelApresExp.Visible:=False;
  Screen.Cursor:=crDefault;

  msg('Arquivo Gerado com SUCESSO !!','A');
End; // AUDITORIA - Gera Arquivo de Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Relat�rios do Sal�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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

  If sgTipoImpressao='Endere�os de E-Mails' Then
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

    // Cria Client para Relat�rio ==============================================
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

    // Atualiza Client para Relat�rio ==========================================
    While Not DMBelShop.SQLQ_Busca.Eof do
    Begin
      mmemo.Text:=DMBelShop.SQLQ_Busca.FieldByName('BLOB_LOCALIZACOES').AsString;
                                             
      sgCodigo:='';
      For i:=0 to mMemo.Lines.Count-1 do
      Begin
        // Localiza��es E-Mail's --------------------------------------
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

      Cabecalho3Centro:='RELAT�RIO DE E-MAILs';

      DefinicaoCampos.Clear;
      DefinicaoCampos.Add('D0;10;E;;COD_PROF;C�d');
      DefinicaoCampos.Add('D0;90;E;;NOME_PROF;Nome Profissional');
//      DefinicaoCampos.Add('D0;50;E;;APELIDO_PROF;Apelido');
      DefinicaoCampos.Add('D0;50;E;;IDENTIFICA;Identifica��o');
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
  End; // If sgTipoImpressao='Endere�os de E-Mails' Then
End; // Relat�rios do Sal�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
    msg('Loja Modelo Sem Conex�o !!'+cr+cr+'Tente Mais Tarde !!','A');
    Exit;
  End; // Try

  If Not bSiga Then
  Begin
    msg('Loja Modelo Sem Conex�o !!'+cr+cr+'Tente Mais Tarde !!','A');
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
    // Fecha Conex�o Loja Modelo =================================================
    ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

    msg('Usu�rio modelo N�o Existe !!','A');
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
  // USUARIO - Busca Dados do Usu�rio Modelo ===================================
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
  // USUARIOCOMPRV - Busca Dados do Usu�rio Modelo =============================
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
  // USUARIOFILIAL - Busca Dados do Usu�rio Modelo =============================
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
  // USUARIOP - Busca Dados do Usu�rio Modelo ==================================
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
  // USUARIOLISTA - Busca Dados do Usu�rio Modelo ==============================
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
  // USUARIO_MONITOR - Busca Dados do Usu�rio Modelo ===========================
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
  // Fecha Conex�o Loja Modelo =================================================
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

      PainelApresExp.Caption:='AGUARDE !! Atualizando Permiss�es: Bel_'+sgCodEmp;
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
              PainelApresExp.Caption:='AGUARDE !! Atualizando Permiss�es: Bel_'+sgCodEmp+' - Usuario: '+sNomeUsuario;
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
              PainelApresExp.Caption:='AGUARDE !! Atualizando Permiss�es: Bel_'+sgCodEmp+' - UsuarioComprv: '+sNomeUsuario;
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
              PainelApresExp.Caption:='AGUARDE !! Atualizando Permiss�es: Bel_'+sgCodEmp+' - UsuarioFilial: '+sNomeUsuario;
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
              PainelApresExp.Caption:='AGUARDE !! Atualizando Permiss�es: Bel_'+sgCodEmp+' - UsuarioP: '+sNomeUsuario;
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
              PainelApresExp.Caption:='AGUARDE !! Atualizando Permiss�es: Bel_'+sgCodEmp+' - UsuarioLista: '+sNomeUsuario;
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
              PainelApresExp.Caption:='AGUARDE !! Atualizando Permiss�es: Bel_'+sgCodEmp+' - Usuario_Monitor: '+sNomeUsuario;
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

      // Fecha Conex�o =========================================================
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
   msg('Lojas N�o Conectadas: '+cr+cr+sgLojasNConectadas,'A');

  // Erro ao Consultar Usuario
  If Trim(sgMensagemERRO)<>'' Then
   MessageBox(Handle, pChar('ERRO ao Consultar Usu�rio:'+cr+sgMensagemERRO), 'ATEN��O !!', MB_ICONINFORMATION);

  // Erro ao Atualizar Tabela
  If Trim(sgMensagem)<>'' Then
   MessageBox(Handle, pChar('ERRO ao Atualizar Usu�rio:'+cr+sgMensagem), 'ATEN��O !!', MB_ICONINFORMATION);

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
  Bt_SelecionarVoltar.Enabled:=False;

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

      If bSiga Then // Conex�o
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
        // UTILIZA TRANSA�OES CURTAS --------------------------------
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

        // Fecha Conex�o =========================================================
        ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');
      End; // If bSiga Then // Conex�o
    End; // If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do

  Screen.Cursor:=crDefault;
  PainelApresExp.Visible:=False;

  If Trim(sgMensagem)='' Then
  Begin
    msg('Sem Loja a Processar ou'+cr+' Lojas Sem Conex�o no Momento !!','A');
    Bt_SelecionarOK.Enabled:=True;
    Bt_SelectEmpProcMarcaTodos.Enabled:=True;
    Bt_SelectEmpProcDesMarcaTodos.Enabled:=True;
    Bt_SelecionarVoltar.Enabled:=True;

    DMBelShop.CDS_Busca.First;
    Exit;
  End;

  MessageBox(Handle, pChar('Lojas Processadas:'+cr+sgMensagem+cr+cr+'Loja(s) N�o Conectadas:'+cr+sgMensagemERRO), 'ATEN��O !!', MB_ICONINFORMATION);

  Screen.Cursor:=crArrow;

  PainelApresExp.Caption:='AGUARDE !! Localizando Nova Posi��o de Importa��o !!';
  PainelApresExp.Visible:=True;
  Refresh;

  DMBelShop.CDS_Busca.Close;
  DMBelShop.CDS_Busca.Open;

  Screen.Cursor:=crDefault;
  PainelApresExp.Visible:=False;

  Bt_SelecionarOK.Enabled:=True;
  Bt_SelectEmpProcMarcaTodos.Enabled:=True;
  Bt_SelectEmpProcDesMarcaTodos.Enabled:=True;
  Bt_SelecionarVoltar.Enabled:=True;

// =============================================================================
// FIM DO PROCESSO =============================================================
// =============================================================================
End; // BUSCA ESTOQUES DAS LOJAS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// N�o Permite Sair com Ctrl+F4 ////////////////////////////////////////////////
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

// EVENTOS EM TEMPO DE EXCU��O - INICIO ////////////////////////////////////////
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

// AvariasFornecedor ===========================================================
procedure TFrmSolicitacoes.AvariasFornecedorDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
Begin

  If not (gdSelected in State) Then
  Begin
    if DMBelShop.CDS_Busca1.FieldByName('Ordem').AsInteger in [0, 2, 6] Then
    Begin
      GridNew.Canvas.Brush.Color:=clYellow;
      GridNew.Canvas.Font.Style:=[fsBold];
      GridNew.Canvas.Font.Color:=clBlue;
    End;
  End;

  GridNew.Canvas.FillRect(Rect);
  GridNew.DefaultDrawDataCell(Rect,Column.Field,state);

  GridNew.Columns[1].Alignment:=taRightJustify;
  GridNew.Columns[2].Alignment:=taRightJustify;
  GridNew.Columns[3].Alignment:=taRightJustify;

End; // AvariasFornecedor ======================================================
// EVENTOS EM TEMPO DE EXCU��O - FIM ///////////////////////////////////////////

// PARAMETROS do SISTEMA - Consiste Parametros do Sistema //////////////////////
Function TFrmSolicitacoes.ConsisteParametrosSIS(sTipo: String): Boolean;
Var
  bSalMinExiste, bPerSMExiste: Boolean;
Begin
  // sTipo = (SM) Salario M�nimo
  // sTipo = (INSS) Tabela INSS
  // sTipo = (IRRF) Tabela IRRF
  Result:=False;

  // Salario Minimo ============================================================
  If sTipo='SM' Then
  Begin
    // Zerado -------------------------------------------------------
    If EdtParamVlrSalMinimo.Value<1 Then
    Begin
      msg('Sal�rio M�nimo Inv�lido !!','A');
      EdtParamVlrSalMinimo.SetFocus;
      Exit;
    End;

    // J� Existente -------------------------------------------------
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
    End; // While Not DMVirtual.CDS_V_ParamSalMinimo.Eof do

    If Not bSalMinExiste Then
    Begin
      msg('Sal�rio M�nimo Existente'+cr+'ou Menor ao Existente !!','A');
      EdtParamVlrSalMinimo.SetFocus;
      Exit;
    End;

    If Not bPerSMExiste Then
    Begin
      msg('Per�odo de Vig�ncia Existente !!','A');
      DtEdtParamVigIniSalMinino.SetFocus;
      Exit;
    End;

    // Periodo de Vigencia ------------------------------------------
    Try
      StrToDate(DtEdtParamVigIniSalMinino.Text);
    Except
      msg('Vig�ncia Inicial Inv�lida !!','A');
      DtEdtParamVigIniSalMinino.SetFocus;
      Exit;
    End;

    Try
      StrToDate(DtEdtParamVigFimSalMinino.Text);
    Except
      msg('Vig�ncia Final Inv�lida !!','A');
      DtEdtParamVigFimSalMinino.SetFocus;
      Exit;
    End;

    If DtEdtParamVigFimSalMinino.Date<=DtEdtParamVigIniSalMinino.Date Then
    Begin
      msg('Per�odo de Vig�ncia Inv�lido !!','A');
      DtEdtParamVigIniSalMinino.SetFocus;
      Exit;
    End;
  End; // If sTipo='SM' Then

  Result:=True;

End; // PARAMETROS do SISTEMA - Consiste Parametros do Sistema /////////////////

// MANUTEN��ES VALES - Acerta Componentes //////////////////////////////////////
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
End; // MANUTEN��ES VALES - Acerta Componentes /////////////////////////////////

// DIVERSOS - Show Hint em Forma de Bal�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
end; // DIVERSOS - Show Hint em Forma de Bal�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// DIVERSOS - Show Hint em Forma de Bal�o - Usado no FormCreate >>>>>>>>>>>>>>>>
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

end; // DIVERSOS - Show Hint em Forma de Bal�o - Usado no FormCreate >>>>>>>>>>>

// DIVERSOS - Show Hint em Forma de Bal�o - Posiciona do Componente >>>>>>>>>>>>
Procedure TFrmSolicitacoes.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // DIVERSOS - Show Hint em Forma de Bal�o - Posiciona do Componente >>>>>>>

// MANUTEN��ES VALES - CONSISTENCIAS DE VALES //////////////////////////////////
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
    msg('Favor Informar o N� Docto !!','A');
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
    msg('Data do 1� Vencimento Inv�lida !!','A');
    DtEdt_ValesPrimVencto.SetFocus;
    Exit;
  End;

  If sTipo='A' Then // Somente para Altera��o de Parcela
  Begin
    If Trim(DtEdt_ValesPagto.Text)<>'' Then
    Begin
      Try
        StrToDate(DtEdt_ValesPagto.Text);
      Except
        msg('Data de Pagto Inv�lida !!','A');
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
      msg('Favor Informar o'+cr+cr+'N� do Docto de Pagto !!','A');
      EdtValesDoctoPagto.SetFocus;
      Exit;
    End;

    cVlr:=RoundTo(((DMSalao.CDS_ValesVLR_PRESTACAO.AsCurrency+EdtValesVlrAcresc.Value)-EdtValesVlrDesc.Value),-2);
    If (EdtValesVlrPago.Value<>0) and (RoundTo(cVlr-EdtValesVlrPago.Value,-2)<>0) Then
    Begin
      msg('Valor PAGO N�o Fecha'+cr+'com o Valor A PAGAR !!'+cr+cr+
          '- Vlr A PAGAR: '+CurrToStr(cVlr)+' - Vlr PAGO: '+EdtValesVlrPago.Text,'A');
      EdtValesVlrDesc.SetFocus;
      Exit;
    End;
  End; // If sTipo='A' Then // Somente para Altera��o de Parcela

  Result:=True;

End; // MANUTEN��ES VALES - CONSISTENCIAS DE VALES /////////////////////////////

// MANUTEN��ES DIVERSAS - Consiste Componetes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
//  bEdtDesc8 :=False; CheckBox N�o Precisa
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
        msg(Gb_Desc7.Caption+cr+'� Inv�lido !!','A');
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

End; // MANUTEN��ES DIVERSAS - Consiste Componetes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// MOVIMENTO DE CAIXA DIA - Coloca no Memo para Apresenta��o >>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.MovtoCaixaDiaMemo;
Begin

  mem_FinanFechaCaixa.Lines.Clear;
  CDS_.First;
  While Not CDS_.Eof do
  Begin
    mem_FinanFechaCaixa.Lines.Add(CDS_.FieldByName('DATA').AsString);
    CDS_.Next;
  End; // While Not CDS_.Eof do

End; // MOVIMENTO DE CAIXA DIA - Coloca no Memo para Apresenta��o >>>>>>>>>>>>>>

// MOVIMENTO DE CAIXA DIA - Gera Situa�oes do Caixa do Mes >>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.MovtoCaixaDiaSituacao(dDt: TDateTime) ;
Var
  MySql: String;
Begin
  // 0 = clRed     = Importador e N�o Lan�ado
  // 1 = $0000A600 = Importado e Lancado
  // 2 = $00FF8000 =  Fechado Sem Diferen�a
  // 3 = 00FFC794  =  Fechado Com Diferen�a
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

  // Busca Caixa Fechado Sem Diferen�a =========================================
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
    // 2 = $00FF8000 =  Fechado Sem Diferen�a
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

  // Busca Caixa Fechado Com Diferen�a =========================================
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
    // 3 = 00FFC794 =  Fechado Com Diferen�a
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

  // Busca Caixa N�o Fechado Com Lancamentos ===================================
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
    // 1 = $0000A600 = N�o Fechado Com Lancamentos
    If Not CDS_.Locate('DATA',f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString),[]) Then
    Begin
      CDS_.Insert;
      CDS_.FieldByName('DATA').AsString:=f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString);
      CDS_.FieldByName('COR').AsInteger:=1;
      CDS_.Post;
    End;

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

  // Busca Caixa N�o Fechado e Sem Lancamentos =================================
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
    // 0 = clRed     = N�i Fechado e Sem Lan�amentos
    If Not CDS_.Locate('DATA',f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString),[]) Then
    Begin
      CDS_.Insert;
      CDS_.FieldByName('DATA').AsString:=f_Troca('.','/',DMBelShop.CDS_BuscaRapida.FieldByName('dta_caixa').AsString);
      CDS_.FieldByName('COR').AsInteger:=0;
      CDS_.Post;
    End;

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

End; // MOVIMENTO DE CAIXA DIA - Gera Situa�oes do Caixa do Mes >>>>>>>>>>>>>>>>

// MOVIMENTO DE CAIXA DIA - Desenha Calend�rio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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

  While DayOfWeek(DiaPrimeiroMes) <> 1 do
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
  End; // While DayOfWeek(DiaPrimeiroMes) <> 1 do

end; // MOVIMENTO DE CAIXA DIA - Desenha Calend�rio >>>>>>>>>>>>>>>>>>>>>>>>>>>>

// CRIA GRIDNEW em Ts_QualquerCoisa >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.GridNewCriar(Dts: TDataSource; sNomeObjeto: String; bSalvar: Boolean = True);
Var
  i, iFormWidth: Integer;
Begin
  GridNew:=TDBGrid.Create(Self);
  GridNew.Visible:=True;
  GridNew.Parent:=Ts_QualquerCoisa;
  GridNew.Align:=alClient;
  GridNew.Options:=[dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
  GridNew.DataSource:=Dts;

  iFormWidth:=0;
  GridNew.TitleFont.Style:=[];

  If sNomeObjeto='Corredores' Then
  Begin
    GridNew.TitleFont.Style:=[fsBold];

    iFormWidth:=100;
    For i:=0 to GridNew.Columns.Count-1 do
    Begin
      If i=0 Then
      Begin
        GridNew.Columns[i].Width:=200;
        iFormWidth:=iFormWidth+200;
      End;

      If (i=1) Or (i=2)Then
      Begin
        GridNew.Columns[i].Width:=52;
        iFormWidth:=iFormWidth+52;
      End;

      If i>2 Then
      Begin
        GridNew.Columns[i].Width:=64;
        iFormWidth:=iFormWidth+64;
      End;

      If i<>0 Then
      Begin
        GridNew.Columns[i].Title.Alignment:=taRightJustify;
      End;
    End;
  End; // If sNomeObjeto='Corredores' Then

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
  End; // If sNomeObjeto='PopM_GeraOC' Then

  If sNomeObjeto='Apresenta Avarias' Then
  Begin
    GridNew.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
    GridNew.OnDrawColumnCell:=AvariasFornecedorDrawColumnCell;
    GridNew.TitleFont.Style:=[fsBold];
    GridNew.Font.Style:=[];

    GridNew.Columns[4].Visible:=False;

    GridNew.Columns[0].Width:=300;
    GridNew.Columns[0].Title.Caption:='Nome do Produto';

    GridNew.Columns[1].Width:=80;
    GridNew.Columns[1].Title.Caption:='Qtd Avarias';
    GridNew.Columns[1].Title.Alignment:=taRightJustify;

    GridNew.Columns[2].Width:=80;
    GridNew.Columns[2].Title.Caption:='Vlr Unit�rio';
    GridNew.Columns[2].Title.Alignment:=taRightJustify;

    GridNew.Columns[3].Width:=80;
    GridNew.Columns[3].Title.Caption:='Vlr Total';
    GridNew.Columns[3].Title.Alignment:=taRightJustify;
  End; // If sNomeObjeto='Apresenta Avarias' Then

  If Not bSalvar Then
   Bt_QualquerCoisaSalvar.Visible:=False;

  If iFormWidth<>0 Then
  Begin
    FrmSolicitacoes.AutoSize:=False;
    FrmSolicitacoes.Width:=iFormWidth;
    FrmSolicitacoes.AutoSize:=True;
  End; // If iFormWidth<>0 Then
End; // CRIA GRIDNEW em Ts_QualquerCoisa >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Compras - Exporta Documento para Outros >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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

  // Se S� um Prtoduto =========================================================
  if Ckb_SolicExpSoProduto.Checked Then
  Begin
    // Busca Produto Destino - J� Gerou Ordem de Compra -----------------------
    MySql:=' Select o.num_oc_gerada'+
           ' From oc_comprar o'+
           ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value)+
           ' And   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdtSolicExpDoctoDestino.Date))))+
           ' And o.cod_item='+QuotedStr(DMBelShop.IBQ_AComprarCOD_ITEM.AsString)+
           ' And o.cod_empresa='+QuotedStr(DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldBYName('num_oc_gerada').AsString)<>'' Then
    Begin
      DMBelShop.CDS_BuscaRapida.Close;
      msg('Imposs�vel Exportar Este Produto !!'+cr+cr+'Destino com Ordem de Compra J� Gerada !!','A');
      EdtSolicExpDoctoDestino.SetFocus;
      Exit;
    End;

    DMBelShop.CDS_BuscaRapida.Close;
  End; // if Ckb_SolicExpSoProduto.Checked Then
  DMBelShop.CDS_BuscaRapida.Close;

  // Come�a a Exporta��o =======================================================
  // Verificva se Transa��o esta Ativa
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
           ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value)+
           ' And   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdtSolicExpDoctoDestino.Date))));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    iNumSeq:=DMBelShop.CDS_BuscaRapida.FieldBYName('Num_Seq').AsInteger;
    DMBelShop.CDS_BuscaRapida.Close;

    MySql:=' Select first 1 o.cod_comprador'+
           ' From OC_COMPRAR o'+
           ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value)+
           ' And   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdtSolicExpDoctoDestino.Date))));
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
      MySql:=' Select substring(Cast(Max(o.dta_documento) as varchar(30)) From 1 for 19) dta_documento'+
             ' From OC_COMPRAR o'+
             ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value)+
             ' And   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DMBelShop.IBQ_AComprarDTA_DOCUMENTO.AsDateTime))))+
             ' And   o.cod_item='+QuotedStr(DMBelShop.IBQ_AComprarCOD_ITEM.AsString);
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
             ' And   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdtSolicExpDoctoDestino.Date))))+
             ' And   o.cod_item='+QuotedStr(DMBelShop.IBQ_AComprarCOD_ITEM.AsString)+
             ' And   o.cod_empresa='+QuotedStr(DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString);
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Busca Produto do Docto ORIGEM -----------------------------------------
      MySql:=' Select *'+
             ' From oc_comprar o'+
             ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoOrigem.Value)+
             ' And   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DMBelShop.IBQ_AComprarDTA_DOCUMENTO.AsDateTime))))+
             ' And   o.cod_empresa='+QuotedStr(DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString)+
             ' And   o.cod_item='+QuotedStr(DMBelShop.IBQ_AComprarCOD_ITEM.AsString);
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
             ' And   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DMBelShop.IBQ_AComprarDTA_DOCUMENTO.AsDateTime))))+
             ' And   o.cod_empresa='+QuotedStr(sCodEmp)+
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
                 ' And   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdtSolicExpDoctoDestino.Date))))+
                 ' And   o.cod_item='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Item').AsString)+
                 ' And   o.cod_empresa='+QuotedStr(sCodEmp);
          DMBelShop.CDS_BuscaRapida.Close;
          DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
          DMBelShop.CDS_BuscaRapida.Open;

          If Trim(DMBelShop.CDS_BuscaRapida.FieldBYName('num_oc_gerada').AsString)='' Then
          Begin
            // Busca Data do Produto no Documento de DESTINO -------------------------
            MySql:=' Select Max(o.dta_documento) dta_documento'+
                   ' From OC_COMPRAR o'+
                   ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value)+
                   ' And   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdtSolicExpDoctoDestino.Date))));
            DMBelShop.CDS_BuscaRapida.Close;
            DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
            DMBelShop.CDS_BuscaRapida.Open;

            sDta:=DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
            If Trim(DMBelShop.CDS_BuscaRapida.FieldBYName('dta_documento').AsString)<>'' Then
             sDta   :=DMBelShop.CDS_BuscaRapida.FieldBYName('dta_documento').AsString;
            sDta   :=f_Troca('/','.',f_Troca('-','.',sDta));

            // Exclui Produto no Docto de DESTINO ----------------------------
            MySql:=' Delete From oc_comprar o'+
                   ' Where o.num_documento='+VarToStr(EdtSolicExpDoctoDestino.Value)+
                   ' And   Cast(o.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdtSolicExpDoctoDestino.Date))))+
                   ' And   o.cod_item='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Item').AsString)+
                   ' And   o.cod_empresa='+QuotedStr(sCodEmp);
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
           ' WHERE oc.num_documento='+VarToStr(EdtSolicExpDoctoOrigem.Value)+
           ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DMBelShop.IBQ_AComprarDTA_DOCUMENTO.AsDateTime))));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If (Trim(DMBelShop.CDS_BuscaRapida.FieldByName('num_documento').AsString)='') And (Not bgLinxChamada) Then
     OC_COMPRAR_DOCS('D', VarToStr(EdtSolicExpDoctoOrigem.Value), '<>''Linx''');

    If (Trim(DMBelShop.CDS_BuscaRapida.FieldByName('num_documento').AsString)='') And (bgLinxChamada) Then
     OC_COMPRAR_DOCS('D', VarToStr(EdtSolicExpDoctoOrigem.Value), '=''Linx''');

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

End; // Compras - Exporta Documento para Outros >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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

  If (PC_Principal.ActivePage=Ts_SidicomUsuario) And (Ts_SidicomUsuario.CanFocus) Then
  Begin
    EdtUsuarioModelo.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_SidicomUsuario) And (Ts_SidicomUsuario.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_SolicitacoesExporta) And (Ts_SolicitacoesExporta.CanFocus) Then
  Begin
    EdtSolicExpDoctoDestino.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_SolicitacoesExporta) And (Ts_SolicitacoesExporta.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_HabServ) And (Ts_HabServ.CanFocus) Then
  Begin
    If Gb_HabServDesc.Enabled Then
     EdtHabServDesc.SetFocus
    Else
     EdtHabServAbrev.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_HabServ) And (Ts_HabServ.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_GeraOCLegendaCores) And (Ts_GeraOCLegendaCores.CanFocus) Then
  Begin
    Bt_GeraOCLegendaCoresVoltar.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_GeraOCLegendaCores) And (Ts_GeraOCLegendaCores.CanFocus) Then

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
  End; // If (PC_Principal.ActivePage=Ts_ManutDiversas) And (Ts_ManutDiversas.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_ParametrosGerenciador) And (Ts_ParametrosGerenciador.CanFocus) Then
  Begin
    PC_ParametrosChange(Self);
  End; // If (PC_Principal.ActivePage=Ts_ParametrosGerenciador) And (Ts_ParametrosGerenciador.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_Vales) And (Ts_Vales.CanFocus) Then
  Begin
    If (EdtValesCodLoja.Visible) and (Not EdtValesCodLoja.ReadOnly) Then EdtValesCodLoja.SetFocus
    Else If (EdtValesCodProf.Visible) and (Not EdtValesCodLoja.ReadOnly) Then EdtValesCodProf.SetFocus
    Else If (EdtValesDocto.Visible)   and (Not EdtValesDocto.Properties.ReadOnly)   Then EdtValesDocto.SetFocus
    Else Dbg_ValesParcelas.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_Vales) And (Ts_Vales.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_ProfSelecina) And (Ts_ProfSelecina.CanFocus) Then
  Begin
    EdtProfSelecionaNome.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_ProfSelecina) And (Ts_ProfSelecina.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_MargemLucroFormulas) And (Ts_MargemLucroFormulas.CanFocus) Then
  Begin
    Bt_FormulaVoltar.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_MargemLucroFormulas) And (Ts_MargemLucroFormulas.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_ApresentaGrid) And (Ts_ApresentaGrid.CanFocus) Then
  Begin
    Dbg_ApresGrid.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_ApresentaGrid) And (Ts_ApresentaGrid.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_ProSoftImpArquivo) And (Ts_ProSoftImpArquivo.CanFocus) Then
  Begin
//    If AnsiUpperCase(Des_Usuario)='ODIR' Then
//     Bt_ProSoftImpTodos.Visible:=True;

    Bt_ProSoftImpArquivo.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_ProSoftImpArquivo) And (Ts_ProSoftImpArquivo.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_PlanilhaFinanceira) And (Ts_PlanilhaFinanceira.CanFocus) Then
  Begin
    PC_FinanPlanFinanceiraSolicitaChange(Self);
  End; // If (PC_Principal.ActivePage=Ts_PlanilhaFinanceira) And (Ts_PlanilhaFinanceira.CanFocus) Then

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
  End; // If (PC_Principal.ActivePage=Ts_ReposLojasDigita) And (Ts_ReposLojasDigita.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_AnaliseReposicaoDiaria) And (Ts_AnaliseReposicaoDiaria.CanFocus) Then
  Begin
    Dbg_AnaliseRepDiaria.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_AnaliseReposicaoDiaria) And (Ts_AnaliseReposicaoDiaria.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_ConcDepDocFinan) And (Ts_ConcDepDocFinan.CanFocus) Then
  Begin
    If Not ((bgInd_Admin) And ((AnsiUpperCase(Des_Usuario)='RENATO') Or (AnsiUpperCase(Des_Usuario)='ODIR'))) Then
    Begin
      Bt_ConcDepDocFinanRecebe.Visible:=False;
      Bt_ConcDepDocFinanFechamento.Visible:=False;
    End;

    Dbg_ConcDepDocFinan.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_ConcDepDocFinan) And (Ts_ConcDepDocFinan.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_ComprasEstoquesCD) And (Ts_ComprasEstoquesCD.CanFocus) Then
  Begin
//    Rb_ComprasEstoquesA.Checked:=True;
//    Rb_ComprasEstoquesAClick(Self);
//
//    Bt_ComprasEstoquesCDCurvaClick(Self);

    Dbg_ComprasEstoquesCD.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_ComprasEstoquesCD) And (Ts_ComprasEstoquesCD.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_Auditoria) And (Ts_Auditoria.CanFocus) Then
  Begin
    igCodDeposito:=0;
  End; // If (PC_Principal.ActivePage=Ts_Auditoria) And (Ts_Auditoria.CanFocus) Then

end;

procedure TFrmSolicitacoes.Bt_SolicExpVoltarClick(Sender: TObject);
begin
  {
  Usado em:
  Bt_QtdCaixaCDVoltarClick
  Bt_GeraOCLegendaCoresVoltarClick
  Bt_FinanFechaCaixaVoltarClick
  Bt_MargemLucroVoltarClick
  Bt_FormulaVoltarClick
  Bt_FinanPlanFinanceiraPeriodoVoltarClick
  Bt_SelecionarVoltarClick
  Bt_GruposLojasVoltarClick
  Bt_SolicExpVoltarClick
  Bt_ProSoftImpVoltar
  Bt_AudGeraVoltar
  }

  bgOK:=False;
  bgProcessar:=False;
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
begin
  EdtSolicExpDoctoDestino.SetFocus;

  If EdtSolicExpDoctoDestino.AsInteger=0 Then
  Begin
    msg('Favor Informar o N�mero do'+cr+cr+'Documento de Destino !!','A');
    EdtSolicExpDoctoDestino.SetFocus;
    Exit;
  End;

  If Ckb_SolicExpSoProduto.Checked Then
   Begin
     If Trim(DMBelShop.IBQ_AComprarNUM_OC_GERADA.AsString)<>'' Then
     Begin
       msg('Imposs�vel Exportar Este Produto !!'+cr+cr+'Ordem de Compra J� Gerada !!','A');
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
  PainelApresExp.Caption:='AGUARDE !! Exportando Empresa: '+DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString+' - '+
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
    msg('Exporta��o Efetuada com SUCESSO !!','A');
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
Var
  MySql: String;
begin

  If EdtSolicExpDoctoDestino.AsInteger=0 Then
   Exit;

  If EdtSolicExpDoctoOrigem.Value=EdtSolicExpDoctoDestino.Value Then
  Begin
    msg('Imposs�vel Exportar'+cr+'para o Mesmo Documento !!','A');
    EdtSolicExpDoctoDestino.Value:=0;
    EdtSolicExpDoctoDestino.SetFocus;
    Exit;
  End;

  // Verifica se Existe o Docto de Destino =====================================
  MySql:=' Select d.dta_docto'+
         ' FROM OC_COMPRAR_DOCS d'+
         ' Where d.num_docto='+IntToStr(EdtSolicExpDoctoDestino.AsInteger);

         If bgLinxChamada Then
          MySql:=
           MySql+' AND d.origem='+QuotedStr('Linx')
         Else
          MySql:=
           MySql+' AND UPPER(TRIM(d.Origem)) LIKE '+QuotedStr('%BEL%');
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('dta_docto').AsString)='' Then
  Begin
    DMBelShop.CDS_BuscaRapida.Close;
    msg('Documento de DESTINO N�o Existe !!','A');
    EdtSolicExpDoctoDestino.SetFocus;
    Exit;
  End;
  DtaEdtSolicExpDoctoDestino.Date:=DMBelShop.CDS_BuscaRapida.FieldByName('dta_docto').AsDateTime;
  DMBelShop.CDS_BuscaRapida.Close;
  Bt_SoliciExpExportar.Enabled:=True;
end;

procedure TFrmSolicitacoes.FormShow(Sender: TObject);
begin
  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmSolicitacoes);

  PC_PrincipalChange(Self);
end;

procedure TFrmSolicitacoes.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Bal�o
begin
  // N�o Permite Sair com Ctrl+F4
  Application.OnMessage := AppMessage;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Bal�o ///////////////////////////////////////////////
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ValesSalvar.Handle, @ti, TipoDoIcone, 'Salva Tudo', 'SALVAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ValesVoltar.Handle, @ti, TipoDoIcone, 'Abandona Tudo', 'VOLTAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Dbg_ValesParcelas.Handle, @ti, TipoDoIcone, '<Duplo Clique> Para Selecionar', 'ALTERAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ReposLojasAlterar.Handle, @ti, TipoDoIcone, 'Altera Qtd de Reposi��o', 'ALTERAR');

  bEnterTab:=True;

  // Painel Exposicao de Informa��o de Processamento ===========================
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

procedure TFrmSolicitacoes.Bt_SimplesVoltarClick(Sender: TObject);
begin
  If Trim(sgMessagemSimplesVoltar)<>'' Then
  Begin
    If msg(sgMessagemSimplesVoltar,'C')=2 Then
     Exit;
  End; //  If Trim(sgMessagemSimplesOK)<>'' Then

  bgProcessar:=False;

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
  // 0 = clRed  = Importador e N�o Lan�ado
  // 1 = $0000A600 = Importado e Lancado
  // 2 = $00FF8000 =  Fechado Sem Diferen�a
  // 3 = 00FFC794 =  Fechado Com Diferen�a
  // 4 = $0004FFFF =  Sem Vendas
begin
  with Stg_FinanFechaCaixaCalendario do
  begin
    //Limpando o Calend�rio Para Recria-lo
    Canvas.Brush.Color := clWhite;
    Canvas.Pen.Color   := clWhite;
    Canvas.Font.Style  := [];
    Canvas.Font.Color  := clBlack;
    Canvas.FillRect(Rect);
    DiaGrid := Cells[aCol, aRow];
    
    //Sen�o for Cabe�alho dos Dias da Semana
    if aRow > 0 then 
    begin
      Data := StrToDate(DiaGrid);
      DiaGrid := IntToStr(DayOf(Data));
      
      //Checa se os Dias S�o do M�s Selecionado
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
          // Movimento no Calend�rio
          Canvas.Brush.Color := $00E9E9E9; // $00FFC794;
          Canvas.Font.Color  := clBlack;
          Canvas.Font.Style  := [fsBold];
          Canvas.Font.Size  := 8;
          Canvas.Rectangle(Rect);
        end;

        // Se existir evento na data
        igTipo:=5;
        If CDS_.Locate('Data',DateToStr(Data),[]) Then
         igTipo:=CDS_.FieldByName('COR').AsInteger;

        if mem_FinanFechaCaixa.Lines.IndexOf(DateToStr(Data)) >= 0 then
        begin
          if gdSelected in State then
          begin
            If igTipo<>5 Then
            Begin
              Canvas.Brush.Color :=ArrayCores[igTipo]; //Odir
              Canvas.Font.Color  :=clWhite;     //Odir

              If (igTipo in [3..4]) then
               Canvas.Font.Color  :=clWindowText;     //Odir

            End;
          end
          else // if gdSelected in State then
          begin
            If igTipo<>5 Then
            Begin
              Canvas.Brush.Color :=ArrayCores[igTipo]; //Odir
              Canvas.Font.Color  :=clWhite;     //Odir

              If (igTipo in [3..4]) then
               Canvas.Font.Color  :=clWindowText;     //Odir
            End;
          end; // if gdSelected in State then

          Canvas.Font.Style  :=[fsBold];  //Fonte em Negrito
          Canvas.Rectangle(Rect);         //Pintando em Forma de Retangulo
        end; // if mem_FinanFechaCaixa.Lines.IndexOf(DateToStr(Data)) >= 0 then
      end
      else // if MonthOf(Data) = MonthOf(PrimeiroDiaMes) then
      begin
        //Deixando Cinza as Dia Que N�o S�o do M�s Selecionado
        Canvas.Brush.Color :=clWhite;
        Canvas.Font.Color  :=clSilver;
      end; // if MonthOf(Data) = MonthOf(PrimeiroDiaMes) then
    end
    else // if aRow > 0 then //Se for Cabe�alho dos Dias da Semana
    begin
      Data := 0;
      Canvas.Font.Color := clRed;
      Canvas.Font.Style :=[fsBold];
    end; // if aRow > 0 then

    //Desenhando o Calendario e Colocando os Dias, Altura, Largura e Posi��o
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
  // Monstando o Cabe�alho da Semana ( Seg / Terc / Quart...)
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
    msg('Selecione o Tipo de Apresenta��o !!','A');
    Cbx_MargemLucroApres.SetFocus;
    Exit;
  End;

  // Periodo de Sa�das
  Try
    StrToDate(DtEdt_MargemLucroDtaInicioVen.Text);
  Except
    msg('Data Inicial do Per�odo Inv�lida !!','A');
    DtEdt_MargemLucroDtaInicioVen.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_MargemLucroDtaFimVen.Text);
  Except
    msg('Data Final do Per�odo Inv�lida !!','A');
    DtEdt_MargemLucroDtaFimVen.SetFocus;
    Exit;
  End;

  If DtEdt_MargemLucroDtaFimVen.Date<DtEdt_MargemLucroDtaInicioVen.Date Then
  Begin
    msg('Per�odo Inv�lido !!','A');
    DtEdt_MargemLucroDtaInicioVen.SetFocus;
    Exit;
  End;

  // Periodo de Entradas
  If Gb_MargemLucroPeriodoEntradas.Visible Then
  Begin
    Try
      StrToDate(DtEdt_MargemLucroDtaInicioEnt.Text);
    Except
      msg('Data Inicial do Per�odo Inv�lida !!','A');
      DtEdt_MargemLucroDtaInicioEnt.SetFocus;
      Exit;
    End;

    Try
      StrToDate(DtEdt_MargemLucroDtaFimEnt.Text);
    Except
      msg('Data Final do Per�odo Inv�lida !!','A');
      DtEdt_MargemLucroDtaFimEnt.SetFocus;
      Exit;
    End;

    If DtEdt_MargemLucroDtaFimEnt.Date<DtEdt_MargemLucroDtaInicioEnt.Date Then
    Begin
      msg('Per�odo Inv�lido !!','A');
      DtEdt_MargemLucroDtaInicioEnt.SetFocus;
      Exit;
    End;
  End; // If Gb_MargemLucroPeriodoEntradas.Visible Then

  If msg('As Informa��es Est�o CORRETAS ??','C')=2 Then
  Begin
    Cbx_MargemLucroApres.SetFocus;
    Exit;
  End;

  bgProcessar:=True;

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
     Lb_MargemLucroPcCustoTE.Caption:='Usar CUSTO M�DIO das �ltimas Compras nas Transferencias ?';
    If (Cbx_MargemLucroApres.ItemIndex in [4,5]) Then
     Lb_MargemLucroPcCustoTE.Caption:='Usar PRE�O DE CUSTO da �ltima Compra nas Transferencias ?';
  End;

  SelectNext(ActiveControl,True,True);

end;

procedure TFrmSolicitacoes.Ts_MargemLucroShow(Sender: TObject);
begin
  Cbx_MargemLucroApres.SetFocus;
end;

procedure TFrmSolicitacoes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If DMCentralTrocas.CDS_Depositos.Active Then
   DMCentralTrocas.CDS_Depositos.Close;

  If DMCentralTrocas.CDS_ParamTransf.Active Then
   DMCentralTrocas.CDS_ParamTransf.Close;

  // Retorna Permiss�o de Sair com Ctrl+F4
  Application.OnMessage := nil;

  If GridNew<>nil Then
   FreeAndNil(GridNew);
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

procedure TFrmSolicitacoes.Bt_HabServSalvarClick(Sender: TObject);
Var
 sTipo, MySql: String;
begin

  EdtHabServDesc.Text:=Trim(EdtHabServDesc.Text);

  // Verifica C�digo SIDICOM ===================================================
  If Ts_HabServ.Caption='Servi�o' Then
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
        msg('Produto N�o Existe no SIDICOM !!','A');
        DMBelShop.CDS_BuscaRapida.Close;
        EdtHabServCodSidicom.SetFocus;
        Exit;
      End;
      DMBelShop.CDS_BuscaRapida.Close;

      // Verifica j� Cadastrado ==================================================
      MySql:=' SELECT hs.cod_sidicom,'+
             ' Case hs.tip_habserv'+
             '   When ''H'' Then ''Habilidade'''+
             '   When ''S'' Then ''Servi�o'''+
             ' End tip_habserv'+
             ' FROM SAL_HAB_SERV hs'+
             ' WHERE hs.cod_sidicom='+QuotedStr(EdtHabServCodSidicom.Text)+
             ' AND hs.cod_habserv<>'+QuotedStr(EdtHabServCodigo.Text);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('cod_sidicom').AsString)<>'' Then
      Begin
        msg('Item J� Cadastrado como'+cr+DMBelShop.CDS_BuscaRapida.FieldByName('tip_habserv').AsString+' !!','A');
        DMBelShop.CDS_BuscaRapida.Close;
        EdtHabServCodSidicom.SetFocus;
        Exit;
      End;
      DMBelShop.CDS_BuscaRapida.Close;
    End; // If Trim(EdtHabServCodSidicom.Text)<>'' Then

    If EdtHabServPreco.Value=0.00 Then
    Begin
      msg('Favor Informar o Pre�o !!','A');
      EdtHabServPreco.SetFocus;
      Exit;
    End;

  End; // If Ts_HabServ.Caption:='Servi�o' Then

  If Trim(EdtHabServDesc.Text)='' Then
  Begin
    msg('Favor Informar a Descri��o !!','A');
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
  // INCLUS�O ==================================================================
  //============================================================================
  If Bt_HabServSalvar.Caption='Incluir' Then
  Begin
    // Consiste Habilidade =====================================================
    If Ts_HabServ.Caption='Habilidade' Then
    Begin
      If Not DMSalao.CDS_Habilidades.IsEmpty Then
      Begin
        // Verifica se J� Existe ------------------------------------
        If DMSalao.CDS_Habilidades.Locate('Des_Habilidade',EdtHabServDesc.Text,[]) Then
        Begin
          msg(Ts_HabServ.Caption+' J� Existente !!','A');
          EdtHabServDesc.SetFocus;
          Exit;
        End; // If Not DMSalao.CDS_Habilidades.IsEmpty Then
      End; // If Not DMSalao.CDS_Habilidades.IsEmpty Then
    End; // If Ts_HabServ.Caption='Habilidade' Then

    // Consiste Servi�o ========================================================
    If Ts_HabServ.Caption='Servi�o' Then
    Begin
      // Verifica se J� Existe ------------------------------------
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
        If msg('Esta Descri��o de Servi�o J� Existente !!'+cr+cr+'Deseja Cadastrar Assim Mesmo ??','C')=2 Then
        Begin
          EdtHabServDesc.SetFocus;
          Exit;
        End;
      End;
      DMBelShop.CDS_BuscaRapida.Close;

      If EdtHabServPreco.Value=0.00 Then
      Begin
        msg('Favor Informar o Pre�o !!','A');
        EdtHabServPreco.SetFocus;
        Exit;
      End;

    End; // If Ts_HabServ.Caption='Servi�o' Then
  End; // If Bt_HabServSalvar.Caption='Incluir' Then

  //============================================================================
  // ALTERA��O =================================================================
  //============================================================================
  If Bt_HabServSalvar.Caption='Alterar' Then
  Begin
    // Consiste Habilidade/Servico ----------------------------------
    If Ts_HabServ.Caption='Habilidade' Then sTipo:='H';
    If Ts_HabServ.Caption='Servi�o'    Then sTipo:='S';

    // Verifica se J� Existe ------------------------------------
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
      msg(Ts_HabServ.Caption+' J� Existente !!','A');
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

      If Ts_HabServ.Caption='Servi�o' Then
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
      msg('Produto N�o Existe no SIDICOM !!','A');
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
  {
  Usado em:
  Bt_HabServVoltarClick
  Bt_ManutDiversosVoltarClick
  Bt_ConsistenciasVoltarClick
  Bt_ReposLojasVoltarClick
  Bt_ConcDepHistoricosVoltarClick
  }

  bgProcessar:=False;
  Close;

end;

procedure TFrmSolicitacoes.Bt_IBGESelecionarClick(Sender: TObject);
begin
  {
  Usado em:
  Bt_ValesSalvarClick (Consistir se Incluir)
  Bt_FinanPlanFinanceiraTamColunasOKClick
  Bt_MixProdutosAlterarClick
  Bt_SimplesOKClick
  Bt_ManutDiversosDMLClick
  Bt_ConsistenciasSalvarClick
  Bt_CodigosViculadosSalvarClick
  Bt_GruposLojasSalvarClick
  Bt_AudGeraArquivo
  }

  //============================================================================
  // Gera Arquivo de Auditoria de Estoques =====================================
  //============================================================================
  If (Sender as TJvXPButton).Name='Bt_AudGeraArquivo' Then
  Begin
    EdtAudDescArquivo.SetFocus;

    If Trim(EdtAudDescArquivo.Text)='' Then
    Begin
      msg('Favor Informar o Arquivo Destino !','A');
      Bt_AudBuscaArq.SetFocus;
      Exit;
    End; // If Trim(EdtAudDescArquivo.Text)='' Then

    If msg('O Arquivo DESTINO Esta CORRETO ?','C')=2 Then
    Begin
      Bt_AudBuscaArq.SetFocus;
      Exit;
    End;

    If Rb_AudPosEstoque.Checked Then
    Begin
      If Trim(EdtAudDescLoja.Text)='' Then
      Begin
        msg('Favor Informar a Loja !','A');
        Bt_AudBuscaLoja.SetFocus;
        Exit;
      End; // If Trim(EdtAudDescArquivo.Text)='' Then

      If msg('A LOJA Selecionada Esta CORRETA ?','C')=2 Then
      Begin
        Bt_AudBuscaLoja.SetFocus;
        Exit;
      End;

      If igCodDeposito=0 Then
      Begin
        msg('Favor Selecionar o'+cr+cr+'Dep�sito para Invent�rio?','A');
        Dbg_AudDepositos.SetFocus;
        Exit;
      End; // If igCodDeposito=0 Then

      If igCodDeposito<>0 Then
      Begin
        If msg('O DEP�SITO Selecionado Esta CORRETO ?','C')=2 Then
        Begin
          Dbg_AudDepositos.SetFocus;
          Exit;
        End; // If msg('O DEP�SITO Selecionado Esta CORRETO ?','C')=2 Then
      End; // If igCodDeposito<>0 Then
    End; // If Rb_AudPosEstoque.Checked Then

    AuditoriaGeraArquivo;
    Exit;
  End; // If (Sender as TJvXPButton).Name='Bt_AudGeraArquivo' Then
  // Gera Arquivo de Auditoria de Estoques =====================================
  //============================================================================

  //============================================================================
  // Salvar Codigos Vinculados Conta Corrente ==================================
  //============================================================================
  If (Sender as TJvXPButton).Name='Bt_CodigosViculadosSalvar' Then
  Begin
    Dbg_CodigosViculados.SetFocus;

    If msg('Deseja Realmente Salvar  ??','C')=2 Then
    Begin
      Dbg_CodigosViculados.SetFocus;
      Exit;
    End;
  End; // If (Sender as TJvXPButton).Name='Bt_CodigosViculadosSalvar' Then
  // Salvar Codigos Vinculados Conta Corrente ==================================
  //============================================================================

  //============================================================================
  // Salvar Consistencias Sal�o ================================================
  //============================================================================
  If (Sender as TJvXPButton).Name='Bt_ConsistenciasSalvar' Then
  Begin
    Dbg_Consistencias.SetFocus;

    if msg('As Altera��es nas Consist�ncias '+cr+cr+'Est�o Corretas ??','C')=2 Then
    Begin
      Dbg_Consistencias.SetFocus;
      Exit;
    End;
  End; //If (Sender as TJvXPButton).Name='Bt_ManutDiversosDML' Then
  // Salvar Consistencias Sal�o ================================================
  //============================================================================

  //============================================================================
  // Salvar Manuten��es em Geral ===============================================
  //============================================================================
  If (Sender as TJvXPButton).Name='Bt_ManutDiversosDML' Then
  Begin
    EdtDesc2.SetFocus;

    If Trim(sgComponentesConsiste)<>'' Then
    Begin
      If Not ConsisteComponentesManutDiversas Then
       Exit;
    End;
  End; // If (Sender as TJvXPButton).Name='Bt_ManutDiversosDML' Then
  // Salvar Manuten��es em Geral ===============================================
  //============================================================================

  //============================================================================
  //  Utiliza Bot�o Bt_SimplesOK:
  // - Habilita / Desabilita Linha dos Objetivos/Metas
  // - Diverg�ncias Reposi��es Lojas
  //============================================================================
  If (Sender as TJvXPButton).Name='Bt_SimplesOK' Then
  Begin
    If (PC_Principal.ActivePage=Ts_FinanObjetivosHabilitaDesabilita) And (Ts_FinanObjetivosHabilitaDesabilita.CanFocus) Then
    Begin
      Ckb_FinanObjetivosHabDesObjetivos.SetFocus;
    End; // If (PC_Principal.ActivePage=Ts_FinanObjetivosHabilitaDesabilita) And (Ts_FinanObjetivosHabilitaDesabilita.CanFocus) Then

    If Trim(sgMessagemSimplesOK)<>'' Then
    Begin
      If msg(sgMessagemSimplesOK,'C')=2 Then
       Exit;
    End; //  If Trim(sgMessagemSimplesOK)<>'' Then
  End;
  //  Habilita / Desabilita Linha dos Objetivos/Metas ==========================
  //============================================================================

  //============================================================================
  // Altera Mix Entre Lojas ====================================================
  //============================================================================
  If (Sender as TJvXPButton).Name='Bt_MixLojasAlterar' Then
  Begin
    Lbx_MixLojasSel.SetFocus;

    If Trim(EdtMixLoja.Text)='' Then
    Begin
      msg('Favor Selecionar Loja'+cr+cr+'para Origem do MIX !!','A');
      Lbx_MixLojasSel.SetFocus;
      Exit;
    End; // If Trim(EdtMixLoja.Text)='' Then

    If Lbx_MixLojas.Items.Count<1 Then
    Begin
      msg('Favor Selecionar Loja'+cr+cr+'para Destino do MIX !!','A');
      Lbx_MixLojasSel.SetFocus;
      Exit;
    End; // If Trim(EdtMixLoja.Text)='' Then

    If msg('As Sele��es das Lojas'+cr+cr+'Est�o CORRETAS ??','C')=2 Then
    Begin
     Lbx_MixLojasSel.SetFocus;
     Exit;
    End;
  End; // If (Sender as TJvTransparentButton).Name='Bt_MixLojasAlterar' Then
  // Altera Mix Entre Lojas ====================================================
  //============================================================================

  bgProcessar:=True;
  Close;

end;

procedure TFrmSolicitacoes.Dbg_IBGE1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sIBGE: String;
begin
  // Bloquei Ctrl + Delete =====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  If Key=VK_F4 Then
  Begin
    sIBGE:='';
    If InputQuery('Localizar Endere�o','',sIBGE) then
    Begin
      if Trim(sIBGE)<>'' then
      Begin
        sIBGE:=AnsiUpperCase(sIBGE);

        LocalizaRegistro(DMSalao.CDS_V_RetornoIBGE, 'Endereco', sIBGE);
      End; // if Trim(sIBGE)<>'' then
    End; // If InputQuery('Localizar Endere�o','',sIBGE) then
  End; // If Key=VK_F4 Then
End;

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
    msg('Favor Informar o M�s/Dia de Compet�ncia'+cr+'para Calculo ds Taxas de Sindicato !!','A');
    PC_Parametros.ActivePage:=Ts_ParamINSS;
    DBCBx_ParamTaxaSindMes.SetFocus;
    Exit;
  End;

  // Consiste Percentuais da Curva ABC =========================================
  If (EdtParamCurvaALimite.AsInteger + EdtParamCurvaBLimite.AsInteger + EdtParamCurvaCLimite.AsInteger +
      EdtParamCurvaDLimite.AsInteger + EdtParamCurvaELimite.AsInteger)<>100 Then
  Begin
    msg('Total da Distribui��o dos Percentuais'+cr+cr+'da Curva ABC N�O Fecham 100% !!','A');
    PC_Parametros.ActivePage:=Ts_ParamCurvaABC;
    PC_ParametrosChange(Self);
    Exit;
  End;

  if msg('As Altera��es nos P�RAMETROS'+cr+cr+'Est�o Corretas ??','C')=2 Then
  Begin
    PC_ParametrosChange(Self);
    Exit;
  End;

  bgProcessar:=True;
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
  // Fecha Transa��o ===========================================================
  If (DMSalao.CDS_Vales.State=dsInsert) Or (DMSalao.CDS_Vales.State=dsEdit) Then
   DMSalao.CDS_Vales.CancelUpdates;

  bgProcessar:=False;
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
      msg('Loja N�O Encontrada !!!', 'A');
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
    // Abandona Transa��o ======================================================
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
          // Pr�ximo M�s e Desmembra Data
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
  // Fecha Transa��o ===========================================================
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
  If (Sender is TCurrencyEdit) Then
   (Sender as TCurrencyEdit).Color:=clMoneyGreen
end;

procedure TFrmSolicitacoes.PC_ParametrosChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Parametros);

  DMCentralTrocas.CDS_ParamTransf.Close;

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

  If (PC_Parametros.ActivePage=Ts_ParamTransferencias) And (Ts_ParamTransferencias.CanFocus) Then
  Begin
    DMCentralTrocas.CDS_ParamTransf.Open;
    EdtTransfCodLoja.SetFocus;
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
    End; // While Not DMSalao.CDS_V_ProfSeleciona.Eof do
    DMSalao.CDS_V_ProfSeleciona.EnableControls;

    // Posiciona no Marcado
    DMSalao.CDS_V_ProfSeleciona.RecNo:=i;
  End; // If Not DMSalao.CDS_V_ProfSeleciona.IsEmpty Then
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
    msg('M�s Informado � Inv�lido !!','A');
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
    msg('M�s Informado � Inv�lido !!','A');
    Cbx_FinanPlanFinanceiraMes2.SetFocus;
    Exit;
  End;
end;

procedure TFrmSolicitacoes.Bt_FinanPlanFinanceiraPeriodoOKClick(Sender: TObject);
Var
  s: String;
  i: Integer;
begin
  // Apropria��o por Mes e Ano =================================================
  If Rb_FinanPlanFinanceiraUsarMesAno.Checked Then
  Begin
    If Cbx_FinanPlanFinanceiraMes1.Text='' Then
    Begin
      msg('Favor Informar o M�s de Apropria��o !!','A');
      Cbx_FinanPlanFinanceiraMes1.SetFocus;
      Exit;
    End;

    If EdtFinanPlanFinanceiraAno1.Value=0 Then
    Begin
      msg('Favor Informar o Ano de Apropria��o !!','A');
      EdtFinanPlanFinanceiraAno1.SetFocus;
      Exit;
    End;

    If Cbx_FinanPlanFinanceiraMes2.Text='' Then
    Begin
      msg('Favor Informar o M�s de Apropria��o !!','A');
      Cbx_FinanPlanFinanceiraMes2.SetFocus;
      Exit;
    End;

    If EdtFinanPlanFinanceiraAno2.Value=0 Then
    Begin
      msg('Favor Informar o Ano de Apropria��o !!','A');
      EdtFinanPlanFinanceiraAno2.SetFocus;
      Exit;
    End;

    s:=FrmBelShop.PlanFinanceiraMesAno;
    If s='' Then
    Begin
      msg('Per�odo Inv�lido!!','A');
      Cbx_FinanPlanFinanceiraMes1.SetFocus;
      Exit;
    End;
    sgMesAnoPlanFinanceira:=s;

    If msg('O Per�odo Informado Esta CORRETO ??','C')=2 Then
    Begin
      Cbx_FinanPlanFinanceiraMes1.SetFocus;
      Exit;
    End;
    FrmBelShop.EdtFinanPlanFinanceiraPeriodo.Text:='Per�odo de '+
                                        Cbx_FinanPlanFinanceiraMes1.Text+'/'+EdtFinanPlanFinanceiraAno1.Text+' a '+
                                        Cbx_FinanPlanFinanceiraMes2.Text+'/'+EdtFinanPlanFinanceiraAno2.Text;
  End; // If Rb_FinanPlanFinanceiraUsarMesAno.Checked Then

  // Apropria��o por Per�odo ===================================================
  If Not Rb_FinanPlanFinanceiraUsarMesAno.Checked Then
  Begin
    Try
      StrToDate(DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.Text);
    Except
      msg('Data Inicial do Per�odo Inv�lida !!','A');
      DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
      Exit;
    End;

    Try
      StrToDate(DtEdt_FinanPlanFinanceiraPeriodoDtaFim.Text);
    Except
      msg('Data Final do Per�odo Inv�lida !!','A');
      DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
      Exit;
    End;

    If DtEdt_FinanPlanFinanceiraPeriodoDtaFim.Date<DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.Date Then
    Begin
      msg('Per�odo Inv�lido !!','A');
      DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
      Exit;
    End;

    If msg('O Per�odo Informado Esta CORRETO ??','C')=2 Then
    Begin
      DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
      Exit;
    End;

    If Rb_FinanPlanFinanceiraUsarDtaDocto.Checked Then
    Begin
     i:=QuantidadeMesesPeirodo(DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.Date, DtEdt_FinanPlanFinanceiraPeriodoDtaFim.Date);
     If i>12 Then
     Begin
       msg('O Per�odo Dever� SER no M�ximo'+cr+cr+'de 12 Meses ??','A');
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
       msg('O Per�odo Dever� SER no M�ximo'+cr+cr+'de 12 Meses ??','A');
       DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.SetFocus;
       Exit;
     End;

     sgMesAnoPlanFinanceira:=' And m.datacomprovante>='+QuotedStr(DateToStr(
                             DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.Date))+
                             ' And m.datacomprovante<='+QuotedStr(DateToStr(
                             DtEdt_FinanPlanFinanceiraPeriodoDtaFim.Date));
    End; // If Rb_FinanPlanFinanceiraUsarDtaComprov.Checked Then

    sgMesAnoPlanFinanceira:=f_Troca('/','.',sgMesAnoPlanFinanceira);

    FrmBelShop.EdtFinanPlanFinanceiraPeriodo.Text:='Per�odo de '+
                                        DateToStr(DtEdt_FinanPlanFinanceiraPeriodoDtaInicio.Date)+
                                        ' a '+
                                        DateToStr(DtEdt_FinanPlanFinanceiraPeriodoDtaFim.Date);
  End; // If Not Rb_FinanPlanFinanceiraUsarMesAno.Checked Then

  bgProcessar:=True;
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
    FilterIndex := 1;

    //==========================================================================
    // Arquivo ProSoft =========================================================
    //==========================================================================
    If sgSender='SubMenuFinanExpImpArquivosProSoft' Then
    Begin
      DefaultExt := 'TXT;txt';
      Filter := 'Arquivo TXT (*.txt)|*.TXT';
      Title := 'Busca Arquivo Texto para ProSoft';
    End;
    // Arquivo ProSoft =========================================================
    //==========================================================================

    //==========================================================================
    // Arquivo Trinks e Tabela NCM/Percentuais =================================
    //==========================================================================
    If (sgSender='SubMenuFinanExpImpImportaTrinks') Or (sgSender='SubMenuICMSDebCredImpNCM') Then
    Begin
      DefaultExt := 'CSV;csv';
      Filter := 'Arquivo CSV (*.csv)|*.CSV';
      Title := 'Busca Arquivo CSV Trinks';
    End; // If (sgSender='SubMenuFinanExpImpImportaTrinks') Or (sgSender='SubMenuICMSDebCredImpNCM') Then
    // Arquivo Trinks e Tabela NCM/Percentuais =================================
    //==========================================================================

    If Execute then
     Begin
       EdtProSoftImpPastaArquivo.Text:=OpenDialog.FileName;
       EditorProSoftImpArquivo.Lines.LoadFromFile(EdtProSoftImpPastaArquivo.Text);

       //=======================================================================
       // Arquivo ProSoft ======================================================
       //=======================================================================
       If sgSender='SubMenuFinanExpImpArquivosProSoft' Then
       Begin
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

               // Busca Lojas ==================================================
               MySql:=' Select e.COD_FILIAL, e.RAZAO_SOCIAL, e.COD_CONTABIL'+
                      ' From EMP_CONEXOES e'+
                      ' Where e.COD_CONTABIL='+QuotedStr(sCodContabil);
               DMBelShop.CDS_BuscaRapida.Close;
               DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
               DMBelShop.CDS_BuscaRapida.Open;

               If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString)='' Then
               Begin
                 msg('Loja N�O Encontrada com C�digo'+cr+'Contabil Igual a '+sCodContabil+' !!', 'A');
                 DMBelShop.CDS_BuscaRapida.Close;
                 EdtProSoftImpPastaArquivo.SetFocus;
                 Exit;
               End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString)='' Then

               sgNomeArq:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString+'_'+
                          DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
               sgNomeArq:=f_Troca('|','',sgNomeArq);
               sgNomeArq:=f_Troca('  ',' ',sgNomeArq);

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
       End; // If sgSender='SubMenuFinanExpImpArquivosProSoft' Then
       // Arquivo ProSoft ======================================================
       //=======================================================================

       //=======================================================================
       // Tabela NCM/Percentuais de ICMS =======================================
       //=======================================================================
       If sgSender='SubMenuICMSDebCredImpNCM' Then
       Begin
         Application.MessageBox('O Arquivo CSV Deve Conter os Campos a Abaixo e na Mesma Ordem !!'+cr+
                                'Separados por Ponto e Virgula <;> !'+cr+cr+
                                '1� Campo: C�digo do NCM'+cr+
                                '2� Campo: Percentual do ICMS'+cr+
                                '3� Campo: Percentual do FCP (Fundo de Combate � Pobreza)'+cr+
                                '3� Campo: Percentual do ICMS EFETIVO', 'ATEN��O !!', 16);
       End; // If sgSender='SubMenuICMSDebCredImpNCM' Then
       // Tabela NCM/Percentuais de ICMS =======================================
       //=======================================================================

       If msg('O Arquivo Selecionado Esta CORRETO ??','C')=2 Then
       Begin
         EdtProSoftImpPastaArquivo.Clear;
       End; //If msg('O Arquivo Selecionado Esta CORRETO ??','C')=2 Then
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
    If Trim(EdtProSoftImpPastaArquivo.Text)<>'' Then
     msg('Arquivo de ORIGEM Informado'+cr+cr+'� Inv�lido !!','A')
    Else
     msg('Favor Informar a Pasta e o Arquivo'+cr+cr+'de ORIGEM a Importar!!','A');

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

  // Imposta��o Arquivo do RH ==================================================
  // Repete Uma Vez ============================================================
  sCodContabil,           // C�digo Contabil   => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA
  sCodigoEmpresa,         // C�digo da Loja    => � Informado
  sNomeEmpresa,           // Nome da Empresa   => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA
  sNomeFilial,            // Nome da Filial    => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA
  sCodigoFilial,          // C�digo da Filial  => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA

  // Repete Tantos quantos Tiverem =============================================
  sMatriculaFuncionario,  // Matr�cula do Funcion�rio => Funcionario:   00031  /  ADRIANA GARCIA NUNES
  sNomeFuncionario,       // Nome do Funcion�rio      => Funcionario:   00031  /  ADRIANA GARCIA NUNES
  sCargo,                  // Cargo                    => Funcao:  AUXILIAR LIMPEZA

  sDataAdmissao,          // Data de Admiss�o         => Admissao: 07/11/2007
  sDataDemissao,          // Data de Demiss�o         => Demissao: 17/03/2008

  sSexo,                  // Sexo                     => Sexo: 2-Feminino ou Sexo: 1-Masculino
  sDataNascimento,        // Data de Nascimento       => Data de Nascimento: 26/04/1960

  sCPF,                   // CFP                      => CPF: 003.264.090-09
  sPIS,                   // PIS                      => PIS: 12745036671

  sTipoFuncionario,       // Tipo de Funcion�rio      => Condicao: 0-Ativo ou Inativo
  sEstadoCivil           // Estado Civil             => Est.Civil: 1-Solteiro 2-Casado 3-Desquitado 4-Divorciado 5-Outros 6-Viuvo
  : String;

  bGrava: Boolean;     // Se Data de Demiss�o < 01/05/2015 N�o gravar
begin
  EditorProSoftImpArquivo.SetFocus;

  If (EditorProSoftImpArquivo.Lines.Count<1) Or (Trim(EdtProSoftImpPastaArquivo.Text)='') Then
  Begin
    msg('Favor Informar a'+cr+'Pasta e o Arquivo a Importar !!','A');
    Bt_ProSoftImpArquivo.SetFocus;
    Exit;
  End;

  //============================================================================
  // Importa Arquivo Trinks ====================================================
  //============================================================================
  If sgSender='SubMenuFinanExpImpImportaTrinks' Then
  Begin
    // OdirApagar - 21/11/2018
//    // Verifica se J� Existe Movto no Dia ======================================
//    sgDta:='';
//    For i:=0 to EditorProSoftImpArquivo.Lines.Count-1 do
//    Begin
//      Try
//        //sCodTrinks:=IntToStr(StrToInt(Trim(Separa_String(EditorProSoftImpArquivo.Lines[i],1))));
//        StrToDate(Trim(Separa_String(EditorProSoftImpArquivo.Lines[i],3)));
//        sgDta:=Trim(Separa_String(EditorProSoftImpArquivo.Lines[i],3));
//        Break;
//      Except
//      End;
//    End; // For i:=0 to EditorProSoftImpArquivo.Lines.Count-1 do
//
//    If Trim(sgDta)='' Then
//    Begin
//      msg('Arquivo Inv�lido !!','A');
//      Exit;
//    End;
//
//    MySql:=' SELECT t.cod_trinks'+
//           ' FROM TRINKS_DIARIO t'+
//           ' WHERE t.dta_movto = '+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDta)));
//    DMBelShop.SQLQuery1.Close;
//    DMBelShop.SQLQuery1.SQL.Clear;
//    DMBelShop.SQLQuery1.SQL.Add(MySql);
//    DMBelShop.SQLQuery1.Open;
//    bgOK:=(Trim(DMBelShop.SQLQuery1.FieldByName('Cod_Trinks').AsString)<>'');
//    DMBelShop.SQLQuery1.Close;

    If Not TrinksImportaArquivoDiario Then
     msg('Erro ao importa Arquivo Di�rio Trinks !!','A');

    Exit;
  End; // If sgSender='SubMenuFinanExpImpImportaTrinks' Then
  // Importa Arquivo Trinks ====================================================
  //============================================================================

  //============================================================================
  // Importa Arquivo ProSoft ===================================================
  //============================================================================
  If sgSender='SubMenuFinanExpImpArquivosProSoft' Then
  Begin
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

    { Instancia a vari�vel arquivo }
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
        // sCodContabil    -> C�digo Contabil   => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA
        // sCodigoEmpresa  -> C�digo da Loja    => � Informado
        // sNomeEmpresa    -> Nome da Empresa   => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA
        // sNomeFilial     -> Nome da Filial    => Empresa: 0928 - BELSHOP PERFUMARIA E COSMETICA LTDA
        // sCodigoFilial   -> C�digo da Filial  => � Informado
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
            msg('Loja N�O Encontrada com C�digo'+cr+'Contabil Igual a '+sCodContabil+' !!', 'A');
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
        // sMatriculaFuncionario -> Matr�cula do Funcion�rio => Funcionario:   00031  /  ADRIANA GARCIA NUNES
        // sNomeFuncionario      -> Nome do Funcion�rio      => Funcionario:   00031  /  ADRIANA GARCIA NUNES
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
        //                                             7-Uni�o Est�vel
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
          If sEstadoCivil='7' Then sEstadoCivil:='UNI�O EST�VEL'
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
        // sTipoFuncionario -> Tipo de Funcion�rio => Condicao: 0-Ativo ou Inativo
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
        // sDataAdmissao -> Data de Admiss�o => Admissao: 07/11/2007
        // sDataDemissao -> Data de Demiss�o => Demissao: 17/03/2008
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
            insert(BrancosDireita(' ',10),sLinhaNova,281); // C�digo da �rea
            insert(BrancosDireita(' ',50),sLinhaNova,291); // Descri��o da �rea
          End; // If Not bRelSimples Then

          If bRelSimples Then
          Begin
            insert(Trim(sNomeFuncionario)+';'+Trim(sCPF)+';'+Trim(sDataNascimento)+';'+Trim(sTipoFuncionario)+';',sLinhaNova,1);
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

      // Verifica se � para Gravar ===============================================
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
  End; // If sgSender='SubMenuFinanExpImpArquivosProSoft' Then
  // Importa Arquivo ProSoft ===================================================
  //============================================================================

  //============================================================================
  // Importa Tabela NCM/Percentuais de ICMS ====================================
  //============================================================================
  If sgSender='SubMenuICMSDebCredImpNCM' Then
  Begin
    If Not ICMSDebitoCreditoImportaNCM Then
    Begin
      msg('Erro ao Importar NCM'+cr+'ICMS Debito Credito'+cr+'Entrar em Contato com o ODIR !!', 'A');
      Exit;
    End;
  End; // If sgSender='SubMenuICMSDebCredImpNCM' Then
  // Importa Tabela NCM/Percentuais de ICMS ====================================
  //============================================================================


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
  End; // While Not DMBelShop.CDS_Busca.Eof do

  If (FrmSolicitacoes.Caption='VERIFICA POSI��O DE ESTOQUES DAS LOJAS') And (bgOK) Then
  Begin
    BuscaEstoquesLojas;
    Lab_Conta.Visible:=False;
    Exit;
  End; // If FrmSolicitacoes.Caption='VERIFICA POSI��O DE ESTOQUES DAS LOJAS' Then

  bgProcessar:=True;
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

    If FrmSolicitacoes.Caption='VERIFICA POSI��O DE ESTOQUES DAS LOJAS' Then
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
    End;// If FrmSolicitacoes.Caption='VERIFICA POSI��O DE ESTOQUES DAS LOJAS' Then
  End;
  Dbg_Selecionar.Canvas.FillRect(Rect);
  Dbg_Selecionar.DefaultDrawDataCell(Rect,Column.Field,state);

  If FrmSolicitacoes.Caption='VERIFICA POSI��O DE ESTOQUES DAS LOJAS' Then
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
  End; // While Not DMBelShop.CDS_Busca.Eof do
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
  End; // While Not DMBelShop.CDS_Busca.Eof do
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
    msg('Erro no Per�odo Informado !!','A');
    DtEdt_EdtParamCurvaInicio.SetFocus;
    Exit;
  End;

  If DtEdt_EdtParamCurvaInicio.Date>DtEdt_EdtParamCurvaFim.Date Then
  Begin
    msg('Erro no Per�odo Informado !!','A');
    DtEdt_EdtParamCurvaInicio.SetFocus;
    Exit;
  End;

  Try
    EdtParamCurvaDiasTotal.Text:=VarToStr((DtEdt_EdtParamCurvaFim.Date-DtEdt_EdtParamCurvaInicio.Date)+1);
    EdtParamCurvaDiasUteis.Value:=DiasUteisBelShop(DtEdt_EdtParamCurvaInicio.Date, DtEdt_EdtParamCurvaFim.Date,
                                                   Ckb_ParamCurvaDomingo.Checked, Ckb_ParamCurvaSabado.Checked);
  Except
    msg('Erro no Per�odo Informado !!','A');
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
Var
  bFechar: Boolean;
begin
  // Usado por Outros Botoes ===================================================

  bFechar:=True;
  If (Sender is TJvXPButton) Then
  Begin
    // Imprime Resultados do Sal�o =============================================
    If Trim((Sender as TJvXPButton).Name)='Bt_SalaoRelImprime' Then
    Begin
      If Trim(Pan_SalaoRelatorios.Caption)='' Then
      Begin
        msg('Favor Selecionar o Relat�rio !!','A');
        OutLook_SalaoRelatorios.SetFocus;
        Exit;
      End;

      If EdtSalaoRelCodLoja.Value=0 Then
      Begin
        If msg('Deseja Relat�rio de Todas as Lojas ??','C')=2 Then
        Begin
          EdtSalaoRelCodLoja.SetFocus;
          Exit;
        End;
      End;

      SalaoRelatorios;
      Exit;
    End; // If Trim((Sender as TJvXPButton).Name)='Bt_SalaoRelImprime' Then

    // Salva em Mem�ria Resultado dos Corredores de Reposi��o ==================
    If (Trim((Sender as TJvXPButton).Name)='Bt_ReposLojasResultados') Or
       (Ts_QualquerCoisa.Caption='AVARIAS') Or
       (Ts_QualquerCoisa.Caption='REEMBOLSO FINANCEIRO') Then
    Begin
      DBGridClipboard(GridNew);
      bFechar:=False;
    End;
  End; // If (Sender is TJvXPButton) Then

  If bFechar Then
  Begin
    bgProcessar:=True;
    Close;
  End;
end;

procedure TFrmSolicitacoes.Bt_QualquerCoisaVoltarClick(Sender: TObject);
begin
 {
   Usado por Outros Botoes:

   Bt_AnaliseRepDiariaVoltar
   Bt_ConcDepDocFinanVoltar
  }

  If DMConciliacao.CDS_CMDepAnaliseDocRel.Active Then
   DMConciliacao.CDS_CMDepAnaliseDocRel.Close;
   
  If (Sender is TJvXPButton) Then
  Begin
    If Trim((Sender as TJvXPButton).Name)='Bt_ExcelVoltar' Then
    Begin
      ADOT_Dcto.Close;
      ADOC_Excel.Connected:=False;
    End; // If Trim((Sender as TJvXPButton).Name)='Bt_ExcelVoltar' Then
  End; // If (Sender is TJvXPButton) Then

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
    msg('Docto/Planilha N�o Encontrada !!','A');
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

  // Verifica se Transa��o esta Ativa
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
              ' WHERE t.tip_aux='+IntToStr(igDiaSemana)+ // Dias das Semana e Lojas para Processamento de Transf/Venda CD
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
                 IntToStr(igDiaSemana)+', '+ // TIP_AUX - Dias das Semana e Lojas para Processamento de Transf/Venda CD
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
                 ' WHERE t.tip_aux='+IntToStr(igDiaSemana)+ // Dias das Semana e Lojas para Processamento de Transf/Venda CD
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
    If bgUsaSIDICOM Then
    Begin
      MySql:=' SELECT e.cod_filial, e.razao_social'+
             ' FROM EMP_CONEXOES e'+
             ' WHERE e.ind_ativo=''SIM'''+
             ' AND   e.cod_filial='+QuotedStr(FormatFloat('00',EdtParamLojaNecesCodLoja.AsInteger));
    End; // If bgUsaSIDICOM Then

    If Not bgUsaSIDICOM Then
    Begin
      MySql:=' SELECT e.cod_linx cod_filial, e.razao_social'+
             ' FROM EMP_CONEXOES e'+
             ' WHERE e.ind_ativo=''SIM'''+
             ' AND   e.cod_linx='+EdtParamLojaNecesCodLoja.Text;
    End; // If Not bgUsaSIDICOM Then
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('RAZAO_SOCIAL').AsString)='' Then
    Begin
      msg('Loja N�O Encontrada !!!', 'A');
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

  //============================================================================
  // Utilizando SIDICOM ========================================================
  //============================================================================
  If bgUsaSIDICOM Then
  Begin
    MySql:=' SELECT e.cod_filial, e.razao_social'+
           ' FROM EMP_CONEXOES e'+
           ' WHERE e.ind_ativo=''SIM'''+
           ' ORDER BY e.razao_social';
  End; // If bgUsaSIDICOM Then
  // Utilizando SIDICOM ========================================================
  //============================================================================

  //============================================================================
  // Utilizando LINX ===========================================================
  //============================================================================
  If Not bgUsaSIDICOM Then
  Begin
    MySql:=' SELECT e.cod_linx cod_filial, e.razao_social'+
           ' FROM EMP_CONEXOES e'+
           ' WHERE e.ind_ativo=''SIM'''+
           ' ORDER BY e.razao_social';
  End; // If Not bgUsaSIDICOM Then
  // Utilizando LINX ===========================================================
  //============================================================================
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

    //============================================================================
    // Utilizando SIDICOM ========================================================
    //============================================================================
    If bgUsaSIDICOM Then
    Begin
      MySql:=' SELECT e.cod_filial, e.razao_social des_loja,'+
             ' SUBSTRING(t.des_aux FROM  1 FOR 3) Class_A,'+
             ' SUBSTRING(t.des_aux FROM  5 FOR 3) Class_B,'+
             ' SUBSTRING(t.des_aux FROM  9 FOR 3) Class_C,'+
             ' SUBSTRING(t.des_aux FROM 13 FOR 3) Class_D,'+
             ' SUBSTRING(t.des_aux FROM 17 FOR 3) Class_E,'+
             ' TRIM(Coalesce(t.des_aux1,''NAO'')) Ind_Ativo'+

             ' FROM TAB_AUXILIAR t, EMP_CONEXOES e'+
             ' WHERE t.cod_aux=e.cod_filial'+
             ' AND t.tip_aux='+IntToStr(igDiaSemana)+ // Dias das Semana e Lojas para Processamento de Transf/Venda CD
             ' ORDER BY 1';
    End; // If bgUsaSIDICOM Then
    // Utilizando SIDICOM ========================================================
    //============================================================================

    //============================================================================
    // Utilizando LINX ===========================================================
    //============================================================================
    If Not bgUsaSIDICOM Then
    Begin
      MySql:=' SELECT e.cod_linx cod_filial, e.razao_social des_loja,'+
             ' SUBSTRING(t.des_aux FROM  1 FOR 3) Class_A,'+
             ' SUBSTRING(t.des_aux FROM  5 FOR 3) Class_B,'+
             ' SUBSTRING(t.des_aux FROM  9 FOR 3) Class_C,'+
             ' SUBSTRING(t.des_aux FROM 13 FOR 3) Class_D,'+
             ' SUBSTRING(t.des_aux FROM 17 FOR 3) Class_E,'+
             ' TRIM(Coalesce(t.des_aux1,''NAO'')) Ind_Ativo'+

             ' FROM TAB_AUXILIAR t, EMP_CONEXOES e'+
             ' WHERE t.cod_aux=e.cod_linx'+
             ' AND t.tip_aux='+IntToStr(igDiaSemana)+ // Dias das Semana e Lojas para Processamento de Transf/Venda CD
             ' ORDER BY 1';
    End; // If Not bgUsaSIDICOM Then
    // Utilizando LINX ===========================================================
    //============================================================================
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

  // Verifica se Transa��o esta Ativa
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
              ' WHERE t.tip_aux='+IntToStr(igDiaSemana)+ // Dias das Semana e Lojas para Processamento de Transf/Venda CD
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

procedure TFrmSolicitacoes.EdtReposLojasSeqExit(Sender: TObject);
begin
  EdtReposLojasProduto.Clear;
  EdtReposLojasQtdReposicao.Value:=0;

  If EdtReposLojasSeq.AsInteger>0 Then
  Begin
    If not DMCentralTrocas.CDS_ReposicaoTransf.Locate('NUM_SEQ', EdtReposLojasSeq.AsInteger,[]) Then
    Begin
      msg('Sequ�ncia do Produto'+cr+cr+'N�o Encontrada !!','A');
      EdtReposLojasSeq.SetFocus;
      Exit;
    End;

    EdtReposLojasProduto.Text:=DMCentralTrocas.CDS_ReposicaoTransfDES_PRODUTO.AsString;
    EdtReposLojasQtdReposicao.Value:=DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsInteger;

    If DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsInteger=999999 Then
    Begin
      MessageBox(Handle, pChar('IMPOSS�VEL ALTERAR !!'+cr+cr+
                               'Produto Transferido para o'+cr+
                               'Pr�ximo Dia de Separa��o !!!'), 'ATEN��O !!', MB_ICONERROR);
      EdtReposLojasProduto.Clear;
      EdtReposLojasQtdReposicao.Value:=0;
      EdtReposLojasSeq.Value:=0;
      EdtReposLojasSeq.SetFocus;
      Exit;
    End;


    If DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsInteger<>0 Then
    Begin
      MessageBox(Handle, pChar('IMPOSS�VEL ALTERAR !!'+cr+cr+
                               'Produto j� Transferido para o'+cr+
                               'LINX no Pedido N� '+DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsString+' !!'), 'ATEN��O !!', MB_ICONERROR);
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

  //OdirSemSIDICOM - 07/05/2019
//  // Verifica se Existe Preco de Compra ========================================
//  if (DMCentralTrocas.CDS_ReposicaoTransfPRECOCOMPRA.AsCurrency<=0.00) And (EdtReposLojasQtdReposicao.AsInteger>0) Then
//  Begin
//    FrmSolicitacoes.Bt_ReposLojasPreco.Enabled:=True;
//    FrmSolicitacoes.EdtReposLojasSeq.SetFocus;
//
//    msg('Produto SEM PRE�O de COMPRA!!'+cr+'Solicitar o Cadastramento no SIDICOM !!'+cr+'Lista de Pre�os <0006>'+cr+'Ap�s Atualize !','A');
//    Exit;
//  End;

  // Verifica se Transa��o esta Ativa
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
           ' SET el.Qtd_a_Transf='+VarToStr(EdtReposLojasQtdReposicao.Value)+
           ', el.Usu_Altera='+QuotedStr(Cod_Usuario)+
           ', el.Ind_Leitora=''NAO'''+
           ', el.Dta_Altera=current_timestamp'+
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

  // Se Deve Fechar Digita��o de Altera��o de Qtd de Reposi��o Depois de Salvar...
  If bgFechaRepos Then
   Bt_IBGEVoltarClick(Self);

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
      If InputQuery('Informe o LOGIN do Usu�rio','',sLogin) then
       Begin
         Try
           If (Length(sLogin)>20) Or (Trim(sLogin)='') Then
            msg('Login Inv�lido !!','A')
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
begin

  Lbx_Usuarios.SetFocus;

  If Trim(EdtUsuarioModelo.Text)='' Then
  Begin
    msg('Favor Informar o Login'+cr+cr+'do Usu�rio Modelo !!','A');
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
    msg('Usu�rio SEM Permiss�o de Atualiza��o !!','A');
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
    msg('N�o Existe Loja com'+cr+cr+'o C�dgio Selecionado !!','A');
    EdtLojaModelo.SetFocus;
    Exit;
  End;
  DMBelShop.CDS_BuscaRapida.Close;

  If Lbx_Usuarios.Items.Count<1 Then
  Begin
    msg('Sem Usu�rio a Atualizar !!','A');
    Lbx_Usuarios.SetFocus;
    Exit;
  End;

  If Application.MessageBox('Deseja Realmente Atualizar Usu�rio Conforme Modelo ??', 'ATEN��O !!', 292) = idNo Then
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
      msg('Loja N�O Encontrada !!!', 'A');
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
  // Apresenta TabSheet de Fornecedores que N�o Entram no Calculo de Reposi��o
  For i:=0 to FrmSolicitacoes.ComponentCount-1 do
  Begin
    If FrmSolicitacoes.Components[i] is TTabSheet Then
     If (FrmSolicitacoes.Components[i] as TTabSheet).Parent=PC_Parametros Then
      (FrmSolicitacoes.Components[i] as TTabSheet).TabVisible:=False;
  End; // For i:=0 to FrmSolicitacoes.ComponentCount-1 do

  MySql:=' SELECT '+
         ' CASE'+
         '   WHEN CHAR_LENGTH(TRIM(f.doc_cliente))=14 THEN'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 1 FOR 2) || ''.'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 3 for 3) || ''.'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 6 for 3) || ''/'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 9 for 4) || ''-'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 13 for 2)'+
         '   WHEN CHAR_LENGTH(TRIM(f.doc_cliente))=11 THEN'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 1 for 3) || ''.'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 4 for 3) || ''.'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 7 for 3) || ''-'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 10 for 2)'+
         '   ELSE'+
         '     TRIM(f.doc_cliente)'+
         ' End DOC_CLIENTE,'+

         ' f.nome_cliente NOMEFORNECEDOR,'+
         ' f.cod_cliente CODFORNECEDOR'+

         ' FROM TAB_AUXILIAR t, LINXCLIENTESFORNEC f'+
         ' WHERE t.cod_aux=f.cod_cliente'+
         ' AND t.tip_aux=13'+ // Fornecedores que N�O Entram no Calculo de Reposi��es Autom�ticas
         ' ORDER BY f.nome_cliente';
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

  // Bloquei Ctrl + Delete =====================================================  
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  If Key=VK_Delete Then
  Begin
    // Verifica se Transa��o esta Ativa
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
             ' WHERE t.tip_aux=13'+ // Fornecedores que N�O Entram no Calculo de Reposi��es Autom�ticas
             ' AND   t.cod_aux='+DMBelShop.CDS_Busca.FieldByName('codfornecedor').AsString;
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
    MySql:=' SELECT f.nome_cliente NOMEFORNECEDOR,'+
           '        f.cod_cliente CODFORNECEDOR'+

           ' FROM LINXCLIENTESFORNEC f'+
           ' WHERE f.cod_cliente='+VarToStr(EdtParamLojaReposCodForn.AsInteger)+
           ' AND   EXISTS (SELECT 1'+
           '               FROM LINXPRODUTOS p'+
           '               WHERE p.cod_fornecedor=f.cod_cliente)';
    DMBelShop.SQLQ_Busca.Close;
    DMBelShop.SQLQ_Busca.SQL.Clear;
    DMBelShop.SQLQ_Busca.SQL.Add(MySql);
    DMBelShop.SQLQ_Busca.Open;

    Screen.Cursor:=crDefault;

    If Trim(DMBelShop.SQLQ_Busca.FieldByName('codfornecedor').AsString)='' Then
    Begin
      msg('Fornecedor N�O Encontrado !!!', 'A');
      DMBelShop.SQLQ_Busca.Close;
      EdtParamLojaReposCodForn.Clear;
      EdtParamLojaReposCodForn.SetFocus;
      Exit;
    End;

// OdirApagar - 02/05/2019 - N�o Zera Estoque Minimo
//    PlaySound(PChar('SystemQuestion'), 0, SND_ASYNC);
//    PlaySound(PChar('SystemAsterisk'), 0, SND_ASYNC);
//    PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
//    PlaySound(PChar('SystemQuestion'), 0, SND_ASYNC);
//    If Application.MessageBox(PChar('No Momento da Inclus�o do Fornecedor:'+cr+
//                                    DMBelShop.SQLQ_Busca.FieldByName('nomefornecedor').AsString+cr+cr+
//                                    'TODOS os PRODUTOS Ter�o SEUS ESTOQUES M�NIMO ZERADOS !!'+cr+cr+
//                                    'DESEJA CONTINUAR ???????'), 'ATEN��O !!', 292) = IdNo Then
//    Begin
//      EdtParamLojaReposCodForn.AsInteger:=0;
//      EdtParamLojaReposCodForn.SetFocus;
//      Exit;
//    End;

    // Verifica se Transa��o esta Ativa
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
             ' (tip_aux, cod_aux, des_aux, des_aux1, vlr_aux, vlr_aux1)'+ // Fornecedores que N�O Entram no Calculo de Reposi��es Autom�ticas
             ' values (13, '+QuotedStr(DMBelShop.SQLQ_Busca.FieldByName('codfornecedor').AsString)+', null, null, null, null)';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

// OdirApagar - 02/05/2019 - N�o Zera Estoque Minimo
//      PainelApresExp.Caption:='AGUARDE !! Zerando Estoques M�nimos do Fornecedor Selecioando...';
//      PainelApresExp.Width:=Length(PainelApresExp.Caption)*10;
//      PainelApresExp.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-PainelApresExp.Width)/2));
//      PainelApresExp.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-PainelApresExp.Height)/2))-20;
//      PainelApresExp.Color:=clSilver;
//      PainelApresExp.Font.Style:=[fsBold];
//      PainelApresExp.Parent:=FrmSolicitacoes;
//      PainelApresExp.Visible:=True;
//      Refresh;
//
//      // Zera Estoques Minimos
//      MySql:=' UPDATE ES_FINAN_CURVA_ABC c'+
//             ' SET c.est_minimo=0'+
//             ',    c.usu_altera='+Cod_Usuario+
//             ',    c.dta_altera=current_date'+
//             ' WHERE c.est_minimo<>0'+
//             ' AND EXISTS (SELECT 1'+
//             '             FROM LINXPRODUTOS p'+
//             '             WHERE p.cod_produto=c.cod_prod_linx'+
//             '             AND   p.cod_fornecedor='+QuotedStr(DMBelShop.SQLQ_Busca.FieldByName('codfornecedor').AsString)+')';
//      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ======================================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      DMBelShop.CDS_Busca.DisableControls;
      DMBelShop.CDS_Busca.Close;
      DMBelShop.CDS_Busca.Open;
      DMBelShop.CDS_Busca.Locate('codfornecedor',DMBelShop.SQLQ_Busca.FieldByName('codfornecedor').AsString,[]);
      DMBelShop.CDS_Busca.EnableControls;

// OdirApagar - 02/05/2019 - N�o Zera Estoque Minimo
//      PainelApresExp.Visible:=False;
      Screen.Cursor:=crDefault;

    Except
      on e : Exception do
      Begin
        // Abandona Transacao ====================================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';

// OdirApagar - 02/05/2019 - N�o Zera Estoque Minimo
//        PainelApresExp.Visible:=False;
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        Exit;
      End; // on e : Exception do
    End; // Try

    EdtParamLojaReposCodForn.AsInteger:=0;
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

  MySql:=' SELECT f.nome_cliente NOMEFORNECEDOR,'+

         ' CASE'+
         '   WHEN CHAR_LENGTH(TRIM(f.doc_cliente))=14 THEN'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 1 FOR 2) || ''.'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 3 for 3) || ''.'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 6 for 3) || ''/'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 9 for 4) || ''-'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 13 for 2)'+
         '   WHEN CHAR_LENGTH(TRIM(f.doc_cliente))=11 THEN'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 1 for 3) || ''.'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 4 for 3) || ''.'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 7 for 3) || ''-'' ||'+
         '     SUBSTRING(TRIM(f.doc_cliente) FROM 10 for 2)'+
         '   ELSE'+
         '     TRIM(f.doc_cliente)'+
         ' End DOC_CLIENTE,'+

         ' f.cod_cliente CODFORNECEDOR'+
         
         ' FROM LINXCLIENTESFORNEC f'+
         ' WHERE EXISTS (SELECT 1'+
         '               FROM LINXPRODUTOS p'+
         '               WHERE p.cod_fornecedor=f.cod_cliente)'+
         ' ORDER BY 1';
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
  // Bloquei Ctrl + Delete =====================================================  
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  // Altera Processamento do Fornecedor ========================================
  If key=Vk_F6 Then
  Begin
    sLoja:=DMVirtual.CDS_V_ParamLojaNecesCOD_LOJA.AsString;

    sProc:='SIM';
    If DMVirtual.CDS_V_ParamLojaNecesIND_ATIVO.AsString='SIM' Then
     sProc:='NAO';

    // Verifica se Transa��o esta Ativa
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
                ' WHERE t.tip_aux='+IntToStr(igDiaSemana)+ // Dias das Semana e Lojas para Processamento de Transf/Venda CD
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
  // primeiramente verificamos se � o evento a ser tratado...
  If Msg.message = WM_MOUSEWHEEL then
  Begin
    If (ActiveControl is TDBGrid) Or (ActiveControl is TDBGridJul) then // If Somente DBGRID *** Testa se Classe � TDBGRID
    Begin
      Msg.message := WM_KEYDOWN;
      Msg.lParam := 0;
      Sentido := HiWord(Msg.wParam);
      if Sentido > 0 then
       Msg.wParam := VK_UP
      else
       Msg.wParam := VK_DOWN;
    End; // If (ActiveControl is TDBGrid) Or (ActiveControl is TDBGridJul) then // If Somente DBGRID *** Testa se Classe � TDBGRID
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
  iNumDoc, iNumReg: Integer;
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
    msg('Produto, Ainda, N�o Cadastrado'+cr+'na Lista de Pre�os <0006>!!','A');
    Exit;
  End;

  If (Trim(IBQ_MPMS.FieldByName('PRECOCOMPRA').AsString)='') Or (IBQ_MPMS.FieldByName('PRECOCOMPRA').AsCurrency=0.0000) Then
  Begin
    IBQ_MPMS.Close;
    ConexaoEmpIndividual('IBDB_MPMS', 'IBT_MPMS', 'A');
    msg('Produto Continua Sem Pre�o de Compra'+cr+'na Lista de Pre�os <0006>!!','A');
    Exit;
  End;

  // Verifica se Transa��o esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  PainelApresExp.Caption:='AGUARDE !! Atualizando Pre�o de Compra...';
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
  
  msg('Atualiza��o Efetuada com SUCESSO !!','A');

  EdtReposLojasSeq.SetFocus;

end;

procedure TFrmSolicitacoes.EdtSolicExpDoctoDestinoEnter(Sender: TObject);
begin
   Bt_SoliciExpExportar.Enabled:=False;
end;

procedure TFrmSolicitacoes.Dbg_ExcelImportarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmSolicitacoes.Dbg_IBGE2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmSolicitacoes.Dbg_ParamSalMininoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmSolicitacoes.Dbg_ConsistenciasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmSolicitacoes.Dbg_ValesParcelasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmSolicitacoes.Dbg_ProfSelecionaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmSolicitacoes.Dbg_ApresGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmSolicitacoes.Dbg_SelecionarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmSolicitacoes.Dbg_ReposDivProdutosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If (Column.FieldName='IND_CORRIGIDO') Then
  Begin
    if DMCentralTrocas.CDS_V_ReposDivergenciasIND_CORRIGIDO.AsString='SIM' Then
    Begin
      Dbg_ReposDivProdutos.Canvas.Font.Style:=[fsBold];
      Dbg_ReposDivProdutos.Canvas.Font.Color:=clWhite; // -->> Cor da Fonte
      Dbg_ReposDivProdutos.Canvas.Brush.Color:=clBlue; //  -->> Cor da Celula
    End;
  End; // If (Column.FieldName='IND_CORRIGIDO') Then

  Dbg_ReposDivProdutos.Canvas.FillRect(Rect);
  Dbg_ReposDivProdutos.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMCentralTrocas.CDS_V_ReposDivergenciasIND_CORRIGIDO.Alignment:=taCenter;
  DMCentralTrocas.CDS_V_ReposDivergenciasQTD_A_TRANSF.Alignment:=taRightJustify;
  DMCentralTrocas.CDS_V_ReposDivergenciasQTD_CHECKOUT.Alignment:=taRightJustify;

end;

procedure TFrmSolicitacoes.Dbg_ReposDivProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  {
   - Usado em outros DBGrids
        - Dbg_ConcDepHistoricos
        - Dbg_AnaliseRepDiaria
        - Dbg_ConcDepDocFinan
        - Dbg_ComprasEstoquesCD
        - Dbg_AudDepositos
  }
  // Bloquei Ctrl + Delete =====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmSolicitacoes.Bt_ReposDivAlterarQtdClick(Sender: TObject);
begin
  DMCentralTrocas.CDS_V_ReposDivergencias.Edit;
  DMCentralTrocas.CDS_V_ReposDivergenciasQTD_A_TRANSF.AsInteger:=EdtReposDivQtd.AsInteger;
  DMCentralTrocas.CDS_V_ReposDivergenciasQTD_CHECKOUT.AsInteger:=EdtReposDivQtd.AsInteger;
  DMCentralTrocas.CDS_V_ReposDivergenciasIND_CORRIGIDO.AsString:='SIM';
  DMCentralTrocas.CDS_V_ReposDivergencias.Post;
  DMCentralTrocas.CDS_V_ReposDivergencias.Next;

end;

procedure TFrmSolicitacoes.EdtReposDivQtdChange(Sender: TObject);
begin
  Try
    EdtReposDivQtd.SetFocus;
  Except
  End;
end;

procedure TFrmSolicitacoes.EdtTransfCodLojaChange(Sender: TObject);
begin
  EdtTransfDescLoja.Clear;

end;

procedure TFrmSolicitacoes.EdtTransfCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtTransfDescLoja.Clear;

  If EdtTransfCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Loja ==============================================================
    MySql:=' SELECT lo.nome_emp Nome_Loja, lo.empresa Cod_Loja'+
           ' FROM linxlojas lo'+
           ' WHERE lo.empresa<>2'+
           ' AND   lo.empresa='+IntToStr(EdtTransfCodLoja.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Nome_Loja').AsString)='' Then
    Begin
      msg('Loja N�O Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtTransfCodLoja.Clear;
      EdtTransfCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtTransfDescLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Nome_Loja').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    DMCentralTrocas.CDS_ParamTransf.Locate('Cod_Loja', EdtTransfCodLoja.AsInteger,[]);

    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmSolicitacoes.Bt_TransfBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin
  FrmPesquisa:=TFrmPesquisa.Create(Self);
                          
  EdtTransfCodLoja.Clear;
  EdtTransfDescLoja.Clear;

  EdtTransfCodLoja.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT lo.nome_emp Nome_Loja, lo.empresa Cod_Loja'+
         ' FROM linxlojas lo'+
         ' WHERE lo.empresa<>2'+
         ' ORDER BY lo.nome_emp';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Nome_loja').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Loja a Listar !!','A');
    EdtTransfCodLoja.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Nome_Loja';
  FrmPesquisa.Campo_Codigo:='Cod_Loja';
  FrmPesquisa.Campo_Descricao:='Nome_Loja';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtTransfCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtTransfDescLoja.Text:=FrmPesquisa.EdtDescricao.Text;
     EdtTransfCodLojaExit(Self);
   End
  Else
   Begin
     EdtTransfCodLoja.Clear;
     EdtTransfDescLoja.Clear;
     EdtTransfCodLoja.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmSolicitacoes.Bt_TransfSalvarClick(Sender: TObject);
Var
  MySql: String;
begin

  Dbg_TransfLojas.SetFocus;

  If EdtTransfCodLoja.AsInteger=0 Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtTransfCodLoja.SetFocus;
    Exit;
  End;

  If EdtTransfNumProd.AsInteger=0 Then
  Begin
    msg('Favor Informar o N�mero'+cr+'M�ximo de Produtos/Dia !!','A');
    EdtTransfNumProd.SetFocus;
    Exit;
  End;

  If EdtTransfQtdProd.AsInteger=0 Then
  Begin
    msg('Favor Informar a Quantidade'+cr+'M�xima por Produto !!','A');
    EdtTransfNumProd.SetFocus;
    Exit;
  End;

  // Verifica se Transa��o esta Ativa
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

    // Inclui Loja =============================================================
    MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR'+
           ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
           ' VALUES ('+
           ' 19, '+ // TIP_AUX - TRANSFER�NCIAS LOJAS: N�mero de Produtos e Quantidade M�ximo por Dia
           IntToStr(EdtTransfCodLoja.AsInteger)+', '+ // COD_AUX
           IntToStr(EdtTransfNumProd.AsInteger)+', '+ // DES_AUX
           IntToStr(EdtTransfQtdProd.AsInteger)+', '+ // DES_AUX1
           ' NULL, '+ // VLR_AUX
           ' NULL)'+ // VLR_AUX1
           ' MATCHING (TIP_AUX, COD_AUX)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    DMCentralTrocas.CDS_ParamTransf.Close;
    DMCentralTrocas.CDS_ParamTransf.Open;
    DMCentralTrocas.CDS_ParamTransf.Locate('Cod_Loja', EdtTransfCodLoja.AsInteger,[]);

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

  EdtTransfCodLoja.Value:=0;
  EdtTransfDescLoja.Clear;
  EdtTransfCodLoja.SetFocus;

end;

procedure TFrmSolicitacoes.Bt_AnaliseRepDiariaSalvaClipboardClick(Sender: TObject);
begin
  Dbg_AnaliseRepDiaria.SetFocus;

  If DMCentralTrocas.CDS_AnalRepDiaria.IsEmpty Then
   Exit;

  DBGridClipboard(Dbg_AnaliseRepDiaria);
end;

procedure TFrmSolicitacoes.Dbg_AnaliseRepDiariaDrawColumnCell(Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then // Este comando altera cor da Linha
  Begin
    If DMBelShop.CDS_BuscaRapida.FieldByName('Ordem').AsInteger in [0,2,5] Then
    Begin
      Dbg_AnaliseRepDiaria.Canvas.Font.Style:=[fsBold]; // Estilo da Fonte
      Dbg_AnaliseRepDiaria.Canvas.Brush.Color:=clSkyBlue;
    End;
  End; // if not (gdSelected in State) Then

  Dbg_AnaliseRepDiaria.Canvas.FillRect(Rect);
  Dbg_AnaliseRepDiaria.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMBelShop.CDS_BuscaRapida.FieldByName('Documento').Alignment:=taRightJustify;
  DMBelShop.CDS_BuscaRapida.FieldByName('Total_Linhas').Alignment:=taRightJustify;
  DMBelShop.CDS_BuscaRapida.FieldByName('Total_Qtds').Alignment:=taRightJustify;
end;

procedure TFrmSolicitacoes.Bt_ConcDepHistoricoSalvarClick(Sender: TObject);
begin
  Dbg_ConcDepHistoricos.SetFocus;

  If DMConciliacao.CDS_CMDepHistoricos.IsEmpty Then
   Exit;

  DBGridClipboard(Dbg_ConcDepHistoricos);

end;

procedure TFrmSolicitacoes.Rb_ConcDepHistoricosCX_MTZClick(Sender: TObject);
Var
  MySql: String;
  sGrupo: String;
begin
  OdirPanApres.Caption:='AGUARDE !! Salvando Cadastro de Hist�ricos...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicitacoes;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  OdirPanApres.Refresh;
  Refresh;

  // Verifica se Transa��o esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    If Rb_ConcDepHistoricosCX_MTZ.Checked   Then sGrupo:=Rb_ConcDepHistoricosCX_MTZ.Caption;
    If Rb_ConcDepHistoricosDEPOSITO.Checked Then sGrupo:=Rb_ConcDepHistoricosDEPOSITO.Caption;
    If Rb_ConcDepHistoricosDESPESA.Checked  Then sGrupo:=Rb_ConcDepHistoricosDESPESA.Caption;
    If Rb_ConcDepHistoricosOUTROS.Checked   Then sGrupo:=Rb_ConcDepHistoricosOUTROS.Caption;

    MySql:=' UPDATE TAB_AUXILIAR t'+
           ' SET t.des_aux1='+QuotedStr(sGrupo)+
           ' WHERE t.tip_aux=21'+ // CADASTRO DE HIST�RICOS SANGRIA LINX (LINXSANGRIASUPRIMENTOS)
           ' AND t.cod_aux='+DMConciliacao.CDS_CMDepHistoricosCODIGO.AsString;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DMConciliacao.CDS_CMDepHistoricos.Edit;
    DMConciliacao.CDS_CMDepHistoricosGRUPO.AsString:=sGrupo;
    DMConciliacao.CDS_CMDepHistoricos.Post;

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Screen.Cursor:=crDefault;

  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transa��o

  DateSeparator:='/';
  DecimalSeparator:=',';

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  Rb_ConcDepHistoricosCX_MTZ.Checked  :=False;
  Rb_ConcDepHistoricosDEPOSITO.Checked:=False;
  Rb_ConcDepHistoricosDESPESA.Checked :=False;
  Rb_ConcDepHistoricosOUTROS.Checked  :=False;

  Dbg_ConcDepHistoricos.SetFocus;
end;

procedure TFrmSolicitacoes.Rb_ConcDepHistoricosCX_MTZKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_ConcDepHistoricosCX_MTZClick(Self);
end;

procedure TFrmSolicitacoes.Bt_MixLojasOrigemSimClick(Sender: TObject);
Var
  sLojaSel: String;
  i: Integer;
  b: Boolean;
begin
  //============================================================================
  // Verifica se Existe Loja Selecionada =======================================
  //============================================================================
  If (((Sender as TJvTransparentButton).Name='Bt_MixLojasOrigemSim') Or
     ((Sender as TJvTransparentButton).Name='Bt_MixLojasDestSim')) Then
  Begin
    If Lbx_MixLojasSel.Items.Count<1 Then
     Exit;

    If Lbx_MixLojasSel.SelCount<1 Then
    Begin
      msg('Favor Selecionar Loja !!','A');
      Lbx_MixLojasSel.SetFocus;
      Exit;
    End;
  End; // If (((Sender as TJvTransparentButton).Name='Bt_MixLojasOrigemSim') Or
  // Verifica se Existe Loja Selecionada =======================================
  //============================================================================

  //============================================================================
  // Guarda Loja de Origem Se Existir ==========================================
  //============================================================================
  sLojaSel:='';
  If Trim(EdtMixLoja.Text)<>'' Then
   sLojaSel:=Trim(EdtMixLoja.Text);
  // Guarda Loja de Origem Se Existir ==========================================
  //============================================================================

  //============================================================================
  // Se Existe Somente uma Loja Selecionada para Colocar Loja de Origem ========
  //============================================================================
  If (Sender as TJvTransparentButton).Name='Bt_MixLojasOrigemSim' Then
  Begin
    If Lbx_MixLojasSel.SelCount>1 Then
    Begin
      msg('Selecione Somente UMA Loja'+cr+cr+'para Origem do MIX !!','A');
      Lbx_MixLojasSel.SetFocus;
      Exit;
    End;
  End; // If (Sender as TJvTransparentButton).Name='Bt_MixLojasOrigemSim' Then
  // Se Existe Somente uma Loja Selecionada para Colocar Loja de Origem ========
  //============================================================================

  //============================================================================
  // Coloca Loja de Origem ======================================================
  //============================================================================
  If (Sender as TJvTransparentButton).Name='Bt_MixLojasOrigemSim' Then
  Begin
    EdtMixLoja.Text:=Lbx_MixLojasSel.Items[Lbx_MixLojasSel.ItemIndex];
    Lbx_MixLojasSel.DeleteSelected;

    If Trim(sLojaSel)<>'' Then
     Lbx_MixLojasSel.Items.Add(Trim(sLojaSel));
  End; // If ((Sender as TJvTransparentButton).Name='Bt_MixLojasOrigemSim') Or
  // Coloca Loja de Origem ======================================================
  //============================================================================

  //============================================================================
  // Retira Loja de Origem =====================================================
  //============================================================================
  If (Sender as TJvTransparentButton).Name='Bt_MixLojasOrigemNao' Then
  Begin
    If Trim(sLojaSel)<>'' Then
    Begin
      Lbx_MixLojasSel.Items.Add(Trim(sLojaSel));
      EdtMixLoja.Clear;
    End; // If Trim(EdtMixLoja.Text)<>'' Then
  End; // If ((Sender as TJvTransparentButton).Name='Bt_MixLojasOrigemSim') Or
  // Retira Loja de Origem =====================================================
  //============================================================================

  //============================================================================
  // Acrescenta Lojas Destino ==================================================
  //============================================================================
  If (Sender as TJvTransparentButton).Name='Bt_MixLojasDestSim' Then
  Begin
    // Acrescenta Lojas Selecionadas
    For i:=0 to Lbx_MixLojasSel.Items.Count-1 do
    Begin
      If Lbx_MixLojasSel.Selected[i]<>False then
      begin
        Lbx_MixLojas.Items.add(Lbx_MixLojasSel.Items[i]);
      End; // If Lbx_MixLojasSel.Selected[i]<>False then
    End; // For i:=0 to Lbx_MixLojasSel.Items.Count-1 do

    // Exclui Lojas Acrescentadas
    b:=True;
    While b do
    Begin
      For i:=0 to Lbx_MixLojasSel.Items.Count-1 do
      Begin
        If Lbx_MixLojasSel.Selected[i]<>False then
        begin
          Lbx_MixLojasSel.Items.Delete(i);
          Break;
        End; // If Lbx_MixLojasSel.Selected[i]<>False then
      End; // For i:=0 to Lbx_MixLojasSel.Items.Count-1 do

      If Lbx_MixLojasSel.SelCount<1 Then
       Break;
    End; // While b do
  End; // If (Sender as TJvTransparentButton).Name='Bt_MixLojasDestSim' Then
  // Acrescenta Lojas Destino ==================================================
  //============================================================================

  //============================================================================
  // Retira Lojas Destino ======================================================
  //============================================================================
  If (Sender as TJvTransparentButton).Name='Bt_MixLojasDestNao' Then
  Begin
    If Lbx_MixLojas.Items.Count<1 Then
     Exit;

    If Lbx_MixLojas.SelCount<1 Then
    Begin
      msg('Favor Selecionar Loja Destino !!','A');
      Lbx_MixLojas.SetFocus;
      Exit;
    End;

    // Retira Lojas Selecionada no Destino
    For i:=0 to Lbx_MixLojas.Items.Count-1 do
    Begin
      If Lbx_MixLojas.Selected[i]<>False then
      begin
        Lbx_MixLojasSel.Items.add(Lbx_MixLojas.Items[i]);
      End; // If Lbx_MixLojas.Selected[i]<>False then
    End; // For i:=0 to Lbx_MixLojasSel.Items.Count-1 do

    // Exclui Lojas Acrescentadas no Destino
    b:=True;
    While b do
    Begin
      For i:=0 to Lbx_MixLojas.Items.Count-1 do
      Begin
        If Lbx_MixLojas.Selected[i]<>False then
        begin
          Lbx_MixLojas.Items.Delete(i);
          Break;
        End; // If Lbx_MixLojas.Selected[i]<>False then
      End; // For i:=0 to Lbx_MixLojas.Items.Count-1 do

      If Lbx_MixLojas.SelCount<1 Then
       Break;
    End; // While b do
  End; // If (Sender as TJvTransparentButton).Name='Bt_MixLojasDestNao' Then
  // Retira Lojas Destino ======================================================
  //============================================================================

end;

procedure TFrmSolicitacoes.Bt_AudBuscaArqClick(Sender: TObject);
Var
  SaveDialog: TSaveDialog;
begin

  EdtAudDescArquivo.Clear;

  SaveDialog := TSaveDialog.Create(Self);
  With SaveDialog do
  Begin
    Options := [ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
    DefaultExt := 'TXT';
    Filter := 'Arquivo TXT (*.txt)|*.TXT|';
    FilterIndex := 1;
    Title := 'Salvar Arquivo Texto para Auditoria';

    if Execute then
     Begin
        EdtAudDescArquivo.Text:=SaveDialog.FileName;
     End
    else // if Execute then
     begin
       Free;
       Exit;
     end; // if Execute then
  End; // With OpenDialog do
end;

procedure TFrmSolicitacoes.Bt_AudBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtAudDescLoja.Clear;
  EdtAudCodLoja.Clear;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT UPPER(l.nome_emp) nome_emp, l.empresa, l.cod_loja'+
         ' FROM LINXLOJAS l'+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Nome_Emp').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Loja a Listar !!','A');
    Bt_AudBuscaLoja.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Nome_Emp';
  FrmPesquisa.Campo_Codigo:='Empresa';
  FrmPesquisa.Campo_Descricao:='Nome_Emp';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtAudDescLoja.Text:=FrmPesquisa.EdtDescricao.Text;
     EdtAudCodLoja.Text    :=FrmPesquisa.EdtCodigo.Text;
   End
  Else
   Begin
     EdtAudDescLoja.Clear;
     EdtAudCodLoja.Clear;
     Bt_AudBuscaLoja.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmSolicitacoes.Rb_AudCadProdutosClick(Sender: TObject);
begin
  If (Sender is TJvRadioButton) Then
  Begin
    AcertaRb_Style(Rb_AudCadProdutos);
    AcertaRb_Style(Rb_AudPosEstoque);

    If Rb_AudPosEstoque.Checked Then
     Begin
       Gb_AudLoja.Visible:=True;

       Gb_AudDepositos.Visible:=True;
       DMCentralTrocas.CDS_Depositos.Open;
       igCodDeposito:=0;
       Dbg_AudDepositos.SetFocus;
     End
    Else // If Rb_AudPosEstoque.Checked Then
     Begin
       Gb_AudLoja.Visible:=False;

       Gb_AudDepositos.Visible:=False;
       DMCentralTrocas.CDS_Depositos.Close;
       igCodDeposito:=0;
     End; // If Rb_AudPosEstoque.Checked Then
  End; // If (Sender is TJvRadioButton) Then
end;

procedure TFrmSolicitacoes.Bt_ProSoftImpTodosClick(Sender: TObject);
var
  tsArquivo: TStringList;
  tsArqNovo: TStringList;
  i, iPosIni, iPosFin: Integer;
  sCampo, sLinha, sLinhaNova: String;

  bMoradia: Boolean; // Se proximo ENDERE�O � Moradia

  sAtualizadoEm,
  sNome, sMatricula,
  sDataDeNascimento, sNaturalidade, sSexo,
  sNomedoPai, sNomedaMae,
  sNacionalidade, sEstadoCivil, sEscolaridade,
  sEndereco,
  sEmail,
  sCPF, sCTPSNum, sCTPSSerie, sPis,
  sRG, sTituloDeEleitor, sZonaEleitoral, sSecaoEleitoral,
  sReservista,
  sCNH,
  sStatus,
  sCargo, sDataDeAdmissao, sDataDoContrato, sDataDeDemissao,
  sMotivoDaDemissao,
  sSalario,
  sTurno,

  sPerfil, sSaudacao, sFoto, sPNE,
  sDistanciaDaEmpresa, sValorDaRescisao,
  sContato, sTipoDeContrato, sSuperiorDireto,
  sGrauHierarquico, sDuracaoDoContrato,
  sVencimentoDoContrato, sCriadoEm, sDepartamento, sCandidato,
  sBancoDeHoras, sBanco, sAgencia, sContaCorrente
  : String;

  Procedure LimpaTudo;
  Begin
    sAtualizadoEm:='';
    sNome:=''; sMatricula:='';
    sDataDeNascimento:=''; sNaturalidade:=''; sSexo:='';
    sNomedoPai:=''; sNomedaMae:='';
    sNacionalidade:=''; sEstadoCivil:=''; sEscolaridade:='';
    sEndereco:='';
    sEmail:='';
    sCPF:=''; sCTPSNum:=''; sCTPSSerie:=''; sPis:='';
    sRG:=''; sTituloDeEleitor:=''; sZonaEleitoral:=''; sSecaoEleitoral:='';
    sReservista:='';
    sCNH:='';
    sStatus:='';
    sCargo:=''; sDataDeAdmissao:=''; sDataDoContrato:=''; sDataDeDemissao:='';
    sMotivoDaDemissao:='';
    sSalario:='';
    sTurno:='';

    sPerfil:='';
    sSaudacao:='';
    sFoto:='';
    sPNE:='';
    sDistanciaDaEmpresa:='';
    sValorDaRescisao:='';
    sContato:='';
    sTipoDeContrato:='';
    sSuperiorDireto:='';
    sGrauHierarquico:='';
    sDuracaoDoContrato:='';
    sVencimentoDoContrato:='';
    sCriadoEm:='';
    sDepartamento:='';
    sCandidato:='';
    sBancoDeHoras:='';
    sBanco:='';
    sAgencia:='';
    sContaCorrente:='';
  End;
begin

  If (EditorProSoftImpArquivo.Lines.Count<1) Or (Trim(EdtProSoftImpPastaArquivo.Text)='') Then
  Begin
    msg('Favor Informar a'+cr+'Pasta e o Arquivo a Importar !!','A');
    Bt_ProSoftImpArquivo.SetFocus;
    Exit;
  End;

  //============================================================================
  // Exporta Arquivo ProSoft ===================================================
  //============================================================================
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

  Ts_ProSoftImpArquivo.Enabled:=False;
  FrmBelShop.MontaProgressBar(True, FrmSolicitacoes);

  { Instancia a vari�vel arquivo }
  tsArquivo:=TStringList.Create;
  tsArqNovo:=TStringList.Create;

  Try
    tsArquivo.LoadFromFile(EdtProSoftImpPastaArquivo.Text);
    pgProgBar.Properties.Max:=tsArquivo.Count;
    pgProgBar.Position:=0;

    sLinhaNova:='Nome;Matricula;Perfil;Data de Nascimento;Sexo;Estado Civil;Saudacao;'+
                'Foto;Nacionalidade;Naturalidade;Nome do Pai;Nome da Mae;PNE;Distancia da empresa;'+
                'Data de admissao;Data de demissao;Motivo da demissao;Valor da Rescisao;Endereco;Contato;'+
                'Cargo;Status;Salario;Turno;Tipo de contrato;Data do contrato;Escolaridade;Superior direto;'+
                'Grau hierarquico;Duracao do contrato;Vencimento do contrato;Criado em;Atualizado em;'+
                'Departamento;Candidato;E-mail;Banco de Horas;CPF;RG;Titulo de Eleitor;Zona Eleitoral;'+
                'Secao Eleitoral;CTPS NUM;CTPS Serie;Reservista;CNH;Banco;Agencia;Conta Corrente;PIS;';
    tsArqNovo.Add(sLinhaNova);
    sLinhaNova:='';

    LimpaTudo;

    bMoradia:=False;
    For i:=0 to tsArquivo.Count - 1 do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=i+1;
      Refresh;

      sLinha:=Trim(tsArquivo[i]);

      If (AnsiContainsStr(sLinha, 'DADOS BASICOS - LOCAL MORADIA')) Then
       bMoradia:=True;

      //========================================================================
      // Data de Emissao: - Salva Linha Se sAtualizadoEm Estiver Preenchido ====
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Data de Emissao: ')) Then
      Begin
        If Trim(sTurno)<>'' Then
        Begin
          sLinhaNova:=sNome+';'+sMatricula+';'+sPerfil+';'+sDataDeNascimento+';'+sSexo+';'+sEstadoCivil+';'+
                      sSaudacao+';'+sFoto+';'+sNacionalidade+';'+sNaturalidade+';'+sNomedoPai+';'+sNomedaMae+';'+
                      sPNE+';'+sDistanciaDaEmpresa+';'+sDataDeAdmissao+';'+sDataDeDemissao+';'+sMotivoDaDemissao+';'+
                      sValorDaRescisao+';'+sEndereco+';'+sContato+';'+sCargo+';'+sStatus+';'+sSalario+';'+
                      sTurno+';'+sTipoDeContrato+';'+sDataDoContrato+';'+sEscolaridade+';'+sSuperiorDireto+';'+
                      sGrauHierarquico+';'+sDuracaoDoContrato+';'+sVencimentoDoContrato+';'+sCriadoEm+';'+
                      sAtualizadoEm+';'+sDepartamento+';'+sCandidato+';'+sEmail+';'+sBancoDeHoras+';'+sCPF+';'+sRG+';'+
                      sTitulodeEleitor+';'+sZonaEleitoral+';'+sSecaoEleitoral+';'+sCTPSNum+';'+sCTPSSerie+';'+
                      sReservista+';'+sCNH+';'+sBanco+';'+sAgencia+';'+sContaCorrente+';'+sPis+';';
          tsArqNovo.Add(sLinhaNova);

          LimpaTudo;

          sLinhaNova:='';
        End; // If Trim(sAtualizadoEm)<>'' Then

        If (Trim(sTurno)='') and (sAtualizadoEm='') Then
        Begin
          // sAtualizadoEm
          sCampo:='Data de Emissao: ';
          iPosIni:=pos(sCampo,sLinha);
          iPosIni:=iPosIni+length(sCampo);

          sAtualizadoEm:=Trim(Copy(sLinha,iPosIni,10));
        End; // If (Trim(sTurno)='') and (sAtualizadoEm='') Then
      End; // If (AnsiContainsStr(sLinha, 'Data de Emissao: ')) Then

      //========================================================================
      // Nome, Matricula =======================================================
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Funcionario: ')) Then
      Begin
        sCampo:='Funcionario: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);
        sNome:=Trim(Copy(sLinha,iPosIni, Length(Trim(sLinha))));

        // Matricula
        sMatricula:=Trim(Copy(sNome,1, Pos('/', sNome)-1));

        // Nome
        sNome:=Trim(Copy(sNome,Pos('/', sNome)+1, Length(Trim(sNome))));
//        sNome:=Trim(Copy(sNome,Pos('/', sNome)+1, Length(Trim(sNome))-Pos('/', sNome)+1));
      End; // If (AnsiContainsStr(sLinha, 'Funcionario: ')) Then

      //========================================================================
      // Data de Nascimento, Naturalidade, Sexo ================================
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Data de Nascimento: ')) Then
      Begin
        sCampo:='Data de Nascimento: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        // Data de Nascimento
        sDataDeNascimento:=Trim(Copy(sLinha,iPosIni,10));

        sCampo:='Local de Nascimento: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        // Naturalidade
        sCampo:='Sexo: ';
        iPosFin:=pos(sCampo,sLinha);

        sNaturalidade:=Trim(Copy(sLinha,iPosIni,iPosFin-iPosIni));

        // Sexo
        iPosIni:=iPosFin;
        iPosIni:=iPosIni+length(sCampo);

        If Copy(sLinha,iPosIni,1)='1' Then sSexo:='Masculino';
        If Copy(sLinha,iPosIni,1)='2' Then sSexo:='Feminino';

      End; // If (AnsiContainsStr(sLinha, 'Data de Nascimento: ')) Then

      //========================================================================
      // Nome do Pai, Nome da M�e ==============================================
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Filiacao: ')) Then
      Begin
        sCampo:='Filiacao: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        // Posi��o do ' e '
        sCampo:=' e ';
        iPosFin:=pos(sCampo,sLinha);

        // Nome do Pai
        sNomedoPai:=Trim(Copy(sLinha,iPosIni,iPosFin-iPosIni));

        // Nome da M�e
        sCampo:=' e ';
        iPosIni:=iPosFin;
        iPosIni:=iPosIni+length(sCampo);

        sNomedaMae:=Trim(Copy(sLinha, iPosIni, Length(Trim(sLinha))-iPosIni+1));
      End; // If (AnsiContainsStr(sLinha, 'Filiacao: ')) Then

      //========================================================================
      // Nacionalidade, Estado Civil, Escolaridade
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Nacional.: ')) Then
      Begin
        // Nacionalidade
        sCampo:='Nacional.: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Est.Civil: ';
        iPosFin:=pos(sCampo,sLinha);

        sNacionalidade:=Trim(Copy(sLinha,iPosIni, iPosFin-iPosIni));

        // Estado Civil
        iPosIni:=iPosFin;
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Instrucao: ';
        iPosFin:=pos(sCampo,sLinha);

        sEstadoCivil:=Trim(Copy(sLinha,iPosIni,iPosFin-iPosIni));

        // Escolaridade
        iPosIni:=iPosFin;
        iPosIni:=iPosIni+length(sCampo);

        sEscolaridade:=Trim(Copy(sLinha, iPosIni, Length(Trim(sLinha))-iPosIni+1));
      End; // If (AnsiContainsStr(sLinha, 'Nacional.: ')) Then

      //========================================================================
      // Endereco
      //========================================================================
      If ((AnsiContainsStr(sLinha, 'Endereco: ')) Or
          (AnsiContainsStr(sLinha, 'Complemento: ')) Or
          (AnsiContainsStr(sLinha, 'Municipio: '))) And (bMoradia) Then
      Begin
        // Endere�o
        If (AnsiContainsStr(sLinha, 'Endereco: ')) Then
        Begin
          sCampo:='Endereco: ';
          iPosIni:=pos(sCampo,sLinha);
          iPosIni:=iPosIni+length(sCampo);

          sEndereco:=Trim(Copy(sLinha, iPosIni, Length(Trim(sLinha))-iPosIni+1));
        End; // If (AnsiContainsStr(sLinha, 'Endereco: ')) Then

        If (Trim(sEndereco)='') Then
          bMoradia:=False;

        If (Trim(sEndereco)<>'') And  (bMoradia) And
           ((AnsiContainsStr(sLinha, 'Complemento: ')) Or
            (AnsiContainsStr(sLinha, 'Municipio: '))) Then
        Begin
          // Complemento
          If (AnsiContainsStr(sLinha, 'Complemento: ')) Then
          Begin
            sCampo:='Complemento: ';
            iPosIni:=pos(sCampo,sLinha);
            iPosIni:=iPosIni+length(sCampo);

            sCampo:='Bairro: ';
            iPosFin:=pos(sCampo,sLinha);

            sEndereco:=sEndereco+', '+Trim(Copy(sLinha,iPosIni, iPosFin-iPosIni));

            // Bairro
            iPosIni:=iPosFin;
            iPosIni:=iPosIni+length(sCampo);

            sCampo:='CEP: ';
            iPosFin:=pos(sCampo,sLinha);

            sEndereco:=sEndereco+' - '+Trim(Copy(sLinha,iPosIni,iPosFin-iPosIni));

            // CEP
            iPosIni:=iPosFin;
            iPosIni:=iPosIni+length(sCampo);

            sEndereco:=sEndereco+' - '+Trim(Copy(sLinha, iPosIni, Length(Trim(sLinha))-iPosIni+1));
          End; // If (AnsiContainsStr(sLinha, 'Complemento: ')) Then

          // Municipio e UF
          If (AnsiContainsStr(sLinha, 'Municipio: ')) Then
          Begin
            // Municipio
            sCampo:='Municipio: ';
            iPosIni:=pos(sCampo,sLinha);
            iPosIni:=iPosIni+length(sCampo);

            sCampo:='Telefone: ';
            iPosFin:=pos(sCampo,sLinha);

            sEndereco:=sEndereco+' - '+Trim(Copy(sLinha,iPosIni, iPosFin-iPosIni));

            // UF
            sCampo:='UF: ';
            iPosIni:=pos(sCampo,sLinha);
            iPosIni:=iPosIni+length(sCampo);
            sEndereco:=sEndereco+'/'+Trim(Copy(sLinha, iPosIni, Length(Trim(sLinha))-iPosIni+1));

            bMoradia:=False;
          End; // If (AnsiContainsStr(sLinha, 'Municipio: ')) Then
        End; // If (Trim(sEndereco)<>'') And (AnsiContainsStr(sLinha, 'Complemento: ')) Or (AnsiContainsStr(sLinha, 'Municipio: '))) And (bMoradia) Then
      End; // If ((AnsiContainsStr(sLinha, 'Endereco: ')) Or (AnsiContainsStr(sLinha, 'Complemento: ')) Or AnsiContainsStr(sLinha, 'Municipio: '))) And (bMoradia) Then

      //========================================================================
      // E-Mail ================================================================
      //========================================================================
      If (AnsiContainsStr(sLinha, 'E-Mail: ')) Then
      Begin
        sCampo:='E-Mail: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        // E-Mail
        sEmail:=Trim(Copy(sLinha,iPosIni, Length(Trim(sLinha))-iPosIni+1));
      End; // If (AnsiContainsStr(sLinha, 'E-Mail: ')) Then

      //========================================================================
      // CPF, CTPS NUM, CTPS S�rie, PIS
      //========================================================================
      If (AnsiContainsStr(sLinha, 'CPF: ')) Then
      Begin
        // CPF
        sCampo:='CPF: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='CTPS: ';
        iPosFin:=pos(sCampo,sLinha);

        sCPF:=Trim(Copy(sLinha,iPosIni, iPosFin-iPosIni));

        // CTPS e CTPSSerie
        iPosIni:=iPosFin;
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='EXP: ';
        iPosFin:=pos(sCampo,sLinha);

        sCTPSNum:=Trim(Copy(sLinha,iPosIni,iPosFin-iPosIni));
        sCTPSSerie:=Trim(Copy(sCTPSNum,pos('.',sCTPSNum)+1,Length(sCTPSNum)));
        sCTPSNum:=Trim(Copy(sCTPSNum,1, pos('.',sCTPSNum)-1));

        // PIS
        sCampo:='PIS: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        sPis:=Trim(Copy(sLinha, iPosIni, Length(Trim(sLinha))-iPosIni+1));
        sPis:=Trim(Copy(sPis,1,Length(Trim(sPis))-pos('EXP:',sPis)+1));
      End; // If (AnsiContainsStr(sLinha, 'CPF: ')) Then

      //========================================================================
      // RG, T�tulo de Eleitor,	Zona Eleitoral, Se��o Eleitoral
      //========================================================================
      If (AnsiContainsStr(sLinha, 'RG: ')) Then
      Begin
        // RG
        sCampo:='RG: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Titulo Eleitor: ';
        iPosFin:=pos(sCampo,sLinha);

        sRG:=Trim(Copy(sLinha,iPosIni, iPosFin-iPosIni));

        // T�tulo de Eleitor,	Zona Eleitoral, Se��o Eleitoral
        iPosIni:=iPosFin;
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Emissao: ';
        iPosFin:=pos(sCampo,sLinha);

        sTituloDeEleitor:=Trim(Copy(sLinha,iPosIni,iPosFin-iPosIni));
        sSecaoEleitoral:=Trim(Copy(sTituloDeEleitor,pos('-',sTituloDeEleitor)+1,Length(sTituloDeEleitor)));
        sZonaEleitoral:=Trim(Copy(sTituloDeEleitor,pos('/',sTituloDeEleitor)+1,(Length(sTituloDeEleitor)-pos('-',sTituloDeEleitor)+1)));
        sTituloDeEleitor:=Trim(Copy(sTituloDeEleitor,1, pos('/',sTituloDeEleitor)-1));
      End; // If (AnsiContainsStr(sLinha, 'RG: ')) Then

      //========================================================================
      // Certificado Reservista ================================================
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Certificado Reservista: ')) Then
      Begin
        // Certificado Reservista
        sCampo:='Certificado Reservista: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Categoria:';
        iPosFin:=pos(sCampo,sLinha);

        sReservista:=Trim(Copy(sLinha,iPosIni, iPosFin-iPosIni));
      End; // If (AnsiContainsStr(sLinha, 'Certificado Reservista: ')) Then

      //========================================================================
      // Carteira Habilitacao ==================================================
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Carteira Habilitacao: ')) Then
      Begin
        // Carteira Habilitacao
        sCampo:='Carteira Habilitacao: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Data:';
        iPosFin:=pos(sCampo,sLinha);

        sCNH:=Trim(Copy(sLinha,iPosIni, iPosFin-iPosIni));
      End; // If (AnsiContainsStr(sLinha, 'Carteira Habilitacao: ')) Then

      //========================================================================
      // Condi��o/Status =======================================================
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Condicao: ')) Then
      Begin
        // Condi��o/Status
        sCampo:='Condicao: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Vinculo: ';
        iPosFin:=pos(sCampo,sLinha);

        sStatus:=Trim(Copy(sLinha,iPosIni, iPosFin-iPosIni));
      End; // If (AnsiContainsStr(sLinha, 'Condicao: ')) Then

      //========================================================================
      // Cargo, Data de admiss�o, Data do contrato, Data de demiss�o
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Funcao: ')) Then
      Begin
        // Cargo
        sCampo:='Funcao: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Admissao: ';
        iPosFin:=pos(sCampo,sLinha);

        sCargo:=Trim(Copy(sLinha,iPosIni, iPosFin-iPosIni));

        // Data de admiss�o, Data do contrato,
        iPosIni:=iPosFin;
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Demissao: ';
        iPosFin:=pos(sCampo,sLinha);

        sDataDeAdmissao:=Trim(Copy(sLinha,iPosIni,iPosFin-iPosIni));
        sDataDoContrato:=sDataDeAdmissao;

        // Data de demiss�o
        iPosIni:=iPosFin;
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Ex.Demissao: ';
        iPosFin:=pos(sCampo,sLinha);

        sDataDeDemissao:=Trim(Copy(sLinha,iPosIni,iPosFin-iPosIni));
      End; // If (AnsiContainsStr(sLinha, 'Funcao: ')) Then

      //========================================================================
      // Motivo de Desligamento
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Mot.Desligamento: ')) Then
      Begin
        // Motivo de Desligamento
        sCampo:='Mot.Desligamento: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Opcao/FGTS:';
        iPosFin:=pos(sCampo,sLinha);

        sMotivoDaDemissao:=Trim(Copy(sLinha,iPosIni, iPosFin-iPosIni));
      End; // If (AnsiContainsStr(sLinha, 'Mot.Desligamento: ')) Then

      //========================================================================
      // Sal�rio
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Sal. Base: ')) Then
      Begin
        // Sal�rio
        sCampo:='Sal. Base: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Horas Mes: ';
        iPosFin:=pos(sCampo,sLinha);

        sSalario:=Trim(Copy(sLinha,iPosIni, iPosFin-iPosIni));
      End; // If (AnsiContainsStr(sLinha, 'Sal. Base: ')) Then

      //========================================================================
      // Turno: Horario Informado
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Horario Informado: ')) Then
      Begin
        // Turno
        sCampo:='Horario Informado: ';
        iPosIni:=pos(sCampo,sLinha);
        iPosIni:=iPosIni+length(sCampo);

        sCampo:='Almoco';
        iPosFin:=pos(sCampo,sLinha);

        sTurno:=Trim(Copy(sLinha,iPosIni, iPosFin-iPosIni));

        If Trim(sTurno)='' Then
         sTurno:='SEM';
      End; // If (AnsiContainsStr(sLinha, 'Sal. Base: ')) Then

      //========================================================================
      // Turno: Jornada - Se N�O EXISTIR Horario Informado
      //========================================================================
      If (AnsiContainsStr(sLinha, 'Jornada: ')) And (Trim(sTurno)='')Then
      Begin
        // Turno
         sTurno:='SEM';
      End; // If (AnsiContainsStr(sLinha, 'Jornada: ')) And (Trim(stur)Then
    End; // For i:=0 to tsArquivo.Count - 1 do

    // Grava o Ultimo ==========================================================
    sLinhaNova:=sNome+';'+sMatricula+';'+sPerfil+';'+sDataDeNascimento+';'+sSexo+';'+sEstadoCivil+';'+
                sSaudacao+';'+sFoto+';'+sNacionalidade+';'+sNaturalidade+';'+sNomedoPai+';'+sNomedaMae+';'+
                sPNE+';'+sDistanciaDaEmpresa+';'+sDataDeAdmissao+';'+sDataDeDemissao+';'+sMotivoDaDemissao+';'+
                sValorDaRescisao+';'+sEndereco+';'+sContato+';'+sCargo+';'+sStatus+';'+sSalario+';'+
                sTurno+';'+sTipoDeContrato+';'+sDataDoContrato+';'+sEscolaridade+';'+sSuperiorDireto+';'+
                sGrauHierarquico+';'+sDuracaoDoContrato+';'+sVencimentoDoContrato+';'+sCriadoEm+';'+
                sAtualizadoEm+';'+sDepartamento+';'+sCandidato+';'+sEmail+';'+sBancoDeHoras+';'+sCPF+';'+sRG+';'+
                sTitulodeEleitor+';'+sZonaEleitoral+';'+sSecaoEleitoral+';'+sCTPSNum+';'+sCTPSSerie+';'+
                sReservista+';'+sCNH+';'+sBanco+';'+sAgencia+';'+sContaCorrente+';'+sPis+';';
    tsArqNovo.Add(sLinhaNova);

    // Salva o Arquivo =========================================================
    sgMensagem:=IncludeTrailingPathDelimiter(ExtractFilePath(EdtProSoftImpArquivoSalvar.Text));
    sgMensagem:=sgMensagem+ExtractName(EdtProSoftImpArquivoSalvar.Text)+'.csv';

    tsArqNovo.SaveToFile(sgMensagem);

  Finally // Try
   Begin
     FreeAndNil(tsArquivo);
     FreeAndNil(tsArqNovo);
   End;
  End; // Try

  tsArquivo.Free;
  tsArqNovo.Free;

  FrmBelShop.MontaProgressBar(False, FrmSolicitacoes);
  Ts_ProSoftImpArquivo.Enabled:=True;

  MessageBox(Handle, pChar('Arquivo Gerado com SUCESSO !!'+cr+cr+sgMensagem), 'ATEN��O !!', MB_ICONERROR);

  EditorProSoftImpArquivo.Lines.Clear;
  EdtProSoftImpPastaArquivo.Clear;
  EdtProSoftImpArquivoSalvar.Clear;
  // Exporta Arquivo ProSoft ===================================================
  //============================================================================
end;

procedure TFrmSolicitacoes.Dbg_CodigosViculadosEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_CodigosViculadosEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_IBGE1Enter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_IBGE1Enter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_ParamLojaNecesEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ParamLojaNecesEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_ParamSalMininoEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ParamSalMininoEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_ParamLojaReposFornecEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ParamLojaReposFornecEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_TransfLojasEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_TransfLojasEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_ConsistenciasEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ConsistenciasEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_ValesParcelasEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ValesParcelasEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_ProfSelecionaEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ProfSelecionaEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_SelecionarEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_SelecionarEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_ExcelImportarEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ExcelImportarEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_ReposDivProdutosEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ReposDivProdutosEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_AnaliseRepDiariaEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_AnaliseRepDiariaEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_ConcDepHistoricosEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ConcDepHistoricosEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_ConcDepDocFinanEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ConcDepDocFinanEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_ConcDepDocFinanDrawColumnCell(Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then // Este comando altera cor da Linha
  Begin
    If DMConciliacao.CDS_CMDepAnaliseDocRelNOME_LOJA.AsString='TOTAL DO DOCUMENTO' Then
    Begin
      Dbg_ConcDepDocFinan.Canvas.Brush.Color:=clSkyBlue;
      Dbg_ConcDepDocFinan.Canvas.Font.Style:=[fsBold]; // Cor da Fonte
    End;
  End; // if not (gdSelected in State) Then
  Dbg_ConcDepDocFinan.Canvas.FillRect(Rect);
  Dbg_ConcDepDocFinan.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamentos ==============================================================
  DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.Alignment:=taCenter;
  DMConciliacao.CDS_CMDepAnaliseDocRelVLR_MATRIZ.Alignment:=taRightJustify;
  DMConciliacao.CDS_CMDepAnaliseDocRelVLR_DEPOSITOS.Alignment:=taRightJustify;
  DMConciliacao.CDS_CMDepAnaliseDocRelVLR_DESPESAS.Alignment:=taRightJustify;
  DMConciliacao.CDS_CMDepAnaliseDocRelVLR_OUTROS.Alignment:=taRightJustify;
  DMConciliacao.CDS_CMDepAnaliseDocRelVLR_TOTAL.Alignment:=taRightJustify;
  DMConciliacao.CDS_CMDepAnaliseDocRelDTA_INCLUSAO.Alignment:=taCenter;

end;

procedure TFrmSolicitacoes.Bt_ConcDepDocFinanImprimirClick(Sender: TObject);
Var
  MySql: String;           
  dir_padrao, dir_relat: String;

  // Function Interna- Atualiza Data Emiss�o Docto Financeiro >>>>>>>>>>>>>>>>>>
  Function AtualizaDataEmissaoDoctoFinanceiro: Boolean;
  Begin
    // Atualiza Data de Emiss�o ================================================
    OdirPanApres.Caption:='AGUARDE !! Montado/Imprimindo Documento Financeiro...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmSolicitacoes;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Screen.Cursor:=crAppStart;
    Refresh;

    Result:=True;

    // Verifica se Transa��o esta Ativa
    If DMBelShop.SQLC.InTransaction Then
     DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao ===========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try // Try da Transa��o
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      MySql:=' UPDATE FIN_CONCILIACAO_DEP_REL r'+
             ' SET r.dta_impressao=CURRENT_DATE,'+
             '     r.hra_impressao=CURRENT_TIME,'+
             '     r.usu_impressao='+Cod_Usuario+
             ' WHERE r.num_docto='+DMConciliacao.CDS_CMDepAnaliseDocRelNUM_DOCTO.AsString;
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ====================================================
      DMBelShop.SQLC.Commit(TD);

      // Reabre CDS_CMDepAnaliseDocRel - Docto Financeiro ======================
      DMConciliacao.CDS_CMDepAnaliseDocRel.DisableControls;
      DMConciliacao.CDS_CMDepAnaliseDocRel.Close;
      DMConciliacao.CDS_CMDepAnaliseDocRel.Open;
      DMConciliacao.CDS_CMDepAnaliseDocRel.EnableControls;
      DMConciliacao.CDS_CMDepAnaliseDocRel.First;
    Except // Except da Transa��o
      on e : Exception do
      Begin
        // Abandona Transacao ==================================================
        DMBelShop.SQLC.Rollback(TD);

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        Result:=False;
      End; // on e : Exception do
    End; // Try da Transa��o

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;
  End; // Function Interna- Atualiza Data Emiss�o Docto Financeiro >>>>>>>>>>>>>

begin
  Dbg_ConcDepDocFinan.SetFocus;

  If DMConciliacao.CDS_CMDepAnaliseDocRel.IsEmpty Then
   Exit;

  If msg('Deseja Realmente Efetuar a'+cr+cr+'Emiss�o do Docuemnto Financeiro ?','C')=2 Then
   Exit;

  // Salva Data e hora da Emiss�o ==============================================
  If Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_IMPRESSAO.AsString)='' Then
  Begin
    If Not AtualizaDataEmissaoDoctoFinanceiro Then
    Begin
      msg('Ocorreu Erro na Emiss�o  do Documento !!'+cr+cr+'Entrar em Contato'+cr+'= Imediatamente ='+cr+'com o ODIR - 999-578-234','A');
      Exit;
    End; // If ConcDepExcluiLojaDoctoFinanceiro Then
  End; // If Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_IMPRESSAO.AsString)='' Then

  // Monta e Imprime Documento Financeiro ======================================
  {$IFDEF MSWINDOWS}
    dir_padrao      := ExtractFilePath(Application.ExeName);
    dir_relat       := dir_padrao +'Relatorios\';
  {$ENDIF}

  // Apropria DataSet ==========================================================
  DMRelatorio.frDBDataSet1.DataSet:=DMConciliacao.CDS_CMDepAnaliseDocRel;
  DMRelatorio.frReport1.LoadFromFile(Dir_Relat+'Docto_Financeiro_Renato.frf');

  //============================================================================
  // Variaveis de Dicion�rio ===================================================
  //============================================================================
  DMRelatorio.frReport1.Dictionary.Variables.Variable['NrDocto']    :=#39+Trim(DMConciliacao.CDS_CMDepAnaliseDocRelNUM_DOCTO.AsString)+#39;
  DMRelatorio.frReport1.Dictionary.Variables.Variable['CriadoPor']  :=#39+Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDES_USU_CRIACAO.AsString)+#39;
  DMRelatorio.frReport1.Dictionary.Variables.Variable['CriadoEm']   :=#39+Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_CRIACAO.AsString)+#39;
  DMRelatorio.frReport1.Dictionary.Variables.Variable['EmitidoPor'] :=#39+Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDES_USU_IMPRESSAO.AsString)+#39;
  DMRelatorio.frReport1.Dictionary.Variables.Variable['EmitidoEm']  :=#39+Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_IMPRESSAO.AsString)+#39;
  DMRelatorio.frReport1.Dictionary.Variables.Variable['RecebidoPor']:=#39+Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDES_USU_RECEBE.AsString)+#39;
  DMRelatorio.frReport1.Dictionary.Variables.Variable['RecebidoEm'] :=#39+Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_RECEBE.AsString)+#39;
  // Variaveis de Dicion�rio ===================================================
  //============================================================================

  //============================================================================
  // Apresenta Romaneio ========================================================
  //============================================================================
  DMRelatorio.frReport1.PrepareReport;
  DMRelatorio.frReport1.ShowReport;

  DMConciliacao.CDS_CMDepAnaliseDocRel.First;
  // Apresenta Romaneio ========================================================
  //============================================================================
end;

procedure TFrmSolicitacoes.Bt_ConcDepDocFinanExcluirClick(Sender: TObject);
Var
  MySql, sCodAux: String;
  bExclui: Boolean; // Se Exclui Tab_Auxiliar.tip_aux=24

  // Fun��o Interna - Exclui Loja do Docto Financeiro de Entrega >>>>>>>>>>>>>>>
  Function ConcDepExcluiLojaDoctoFinanceiro: Boolean;
  Begin
    OdirPanApres.Caption:='AGUARDE !! Excluindo Loja do Documento Financeiro...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmSolicitacoes;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Screen.Cursor:=crAppStart;
    Refresh;

    Result:=True;

    // Verifica se Transa��o esta Ativa
    If DMBelShop.SQLC.InTransaction Then
     DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao ===========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try // Try da Transa��o
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      // Monta Tab_Auxiliar.Cod_Aux ==============================================
      sCodAux:=Trim(DMConciliacao.CDS_CMDepAnaliseDocRelCOD_LINX.AsString)+ // Codigo da Loja Linx
               FormatFloat('00',StrToInt(Copy(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString),1,2)))+ // Dia do Movto
               FormatFloat('00',StrToInt(Copy(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString),4,2)))+ // Mes do Movto
               Copy(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString),9,2); // Ano do Movto - 2 Caracteres

      // Verifica se Movto a Excluir Contem Observa��o Financeira ==============
      MySql:=' SELECT t.des_aux'+
             ' FROM TAB_AUXILIAR t'+
             ' WHERE t.tip_aux=24'+ // CONCILIA��O DE DEP�SITOS: - OBSERVA��O FINANCEIRA / NUMERO DO DOCUMENTO FINANCEIRO - SE ENTREGUE PARA O RENATO
             ' AND t.cod_aux='+QuotedStr(sCodAux)+
             ' AND t.des_aux1='+QuotedStr(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelNUM_DOCTO.AsString));
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      bExclui:=(DMBelShop.CDS_BuscaRapida.FieldByName('Des_Aux').AsString)='';;
      DMBelShop.CDS_BuscaRapida.Close;

      If bExclui Then
      Begin
        MySql:=' DELETE FROM TAB_AUXILIAR t'+
               ' WHERE t.tip_aux=24'+ // CONCILIA��O DE DEP�SITOS: - OBSERVA��O FINANCEIRA / NUMERO DO DOCUMENTO FINANCEIRO - SE ENTREGUE PARA O RENATO
               ' AND t.cod_aux='+QuotedStr(sCodAux)+
               ' AND t.des_aux1='+QuotedStr(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelNUM_DOCTO.AsString));
      End; // If bExclui Then

      If Not bExclui Then
      Begin
        MySql:=' UPDATE TAB_AUXILIAR t'+
               ' SET t.des_aux1=NULL'+
               ' WHERE t.tip_aux=24'+ // CONCILIA��O DE DEP�SITOS: - OBSERVA��O FINANCEIRA / NUMERO DO DOCUMENTO FINANCEIRO - SE ENTREGUE PARA O RENATO
               ' AND t.cod_aux='+QuotedStr(sCodAux)+
               ' AND t.des_aux1='+QuotedStr(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelNUM_DOCTO.AsString));
      End; // If bExclui Then
      DMBelShop.SQLC.Execute(MySql, nil, nil);

      // Exclui Loja do Documento Financeiro ===================================
      MySql:=' DELETE FROM FIN_CONCILIACAO_DEP_REL r'+
             ' WHERE r.num_docto='+Trim(DMConciliacao.CDS_CMDepAnaliseDocRelNUM_DOCTO.AsString)+
             ' AND   r.cod_linx='+Trim(DMConciliacao.CDS_CMDepAnaliseDocRelCOD_LINX.AsString)+
             ' AND   r.dta_movto='+QuotedStr(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString));
      DMBelShop.SQLC.Execute(MySql, nil, nil);

      // Acerta ClienteDataSet do Movto de Analise da Loja - CDS_CMDepositosAnalise
      If not DMConciliacao.CDS_CMDepositosAnalise.IsEmpty Then
      Begin
        DMConciliacao.CDS_CMDepositosAnalise.First;
        DMConciliacao.CDS_CMDepositosAnalise.DisableControls;
        While Not DMConciliacao.CDS_CMDepositosAnalise.Eof do
        Begin
          If (DMConciliacao.CDS_CMDepositosAnaliseORDEM.AsInteger=4) And
             (DMConciliacao.CDS_CMDepositosAnaliseDTA_DOCTO.AsDateTime=DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsDateTime) And
             (DMConciliacao.CDS_CMDepositosAnaliseCOD_LOJA.AsInteger  =DMConciliacao.CDS_CMDepAnaliseDocRelCOD_LINX.AsInteger) Then
          Begin
            DMConciliacao.CDS_CMDepositosAnalise.Edit;
            DMConciliacao.CDS_CMDepositosAnaliseNUM_RELATORIO.AsString:='';
            DMConciliacao.CDS_CMDepositosAnalise.Post;

            Break;
          End; // If Not DMConciliacao.CDS_CMDepositosAnalise.Locate('COD_LOJA; DTA_DOCTO',...

          DMConciliacao.CDS_CMDepositosAnalise.Next;
        End; // While Not DMConciliacao.CDS_CMDepositosAnalise.Eof do
        DMConciliacao.CDS_CMDepositosAnalise.EnableControls;
      End; // If not DMConciliacao.CDS_CMDepositosAnalise.IsEmpty Thyen

      // Atualiza Transacao ====================================================
      DMBelShop.SQLC.Commit(TD);

    Except // Except da Transa��o
      on e : Exception do
      Begin
        // Abandona Transacao ==================================================
        DMBelShop.SQLC.Rollback(TD);

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        Result:=False;
      End; // on e : Exception do
    End; // Try da Transa��o

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;
  End; // Fun��o Interna - Exclui Loja do Docto Financeiro de Entrega >>>>>>>>>>
begin
  Dbg_ConcDepDocFinan.SetFocus;

  If DMConciliacao.CDS_CMDepAnaliseDocRel.IsEmpty Then
   Exit;

  If Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)='' Then
   Exit;

  If msg('Deseja Realmente EXCLUIR'+cr+cr+'a Loja SELECIONADA ??','C')=2 Then
   Exit;

  If Not ConcDepExcluiLojaDoctoFinanceiro Then
  Begin
    msg('Ocorreu Erro na Exclus�o da Loja !!'+cr+cr+'Entrar em Contato'+cr+'= Imediatamente ='+cr+'com o ODIR - 999-578-234','A');
    Exit;
  End; // If ConcDepExcluiLojaDoctoFinanceiro Then

  DMConciliacao.CDS_CMDepAnaliseDocRel.DisableControls;
  DMConciliacao.CDS_CMDepAnaliseDocRel.Close;
  DMConciliacao.CDS_CMDepAnaliseDocRel.Open;
  DMConciliacao.CDS_CMDepAnaliseDocRel.EnableControls;

  msg('Exclus�o Efetuada com SUCESSO !!','A');

  If DMConciliacao.CDS_CMDepAnaliseDocRel.IsEmpty Then
  Begin
    msg('Documento Financeiro SEM Movimento !!'+cr+cr+'Ser� Descartado !!','A');
    Bt_QualquerCoisaVoltarClick(Bt_QualquerCoisaVoltar);
    Exit;
  End; // If DMConciliacao.CDS_CMDepAnaliseDocRel.IsEmpty Then
end;

procedure TFrmSolicitacoes.Bt_ConcDepDocFinanRecebeClick(Sender: TObject);
Var
  MySql: String;
  sCodAux, sDia, sHora: String;
  iRecNo: Integer;
begin
  Dbg_ConcDepDocFinan.SetFocus;

  If msg('Deseja Realmente Aceitar o Recebimento'+cr+cr+'do Documento Financeiro N�: '+
         DMConciliacao.CDS_CMDepAnaliseDocRelNUM_DOCTO.AsString,'C')=2 Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Efetuando Fechamento Financeiro de Caixa...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicitacoes;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  OdirPanApres.Refresh;
  Refresh;

  If not DMConciliacao.CDS_CMDepositosAnalise.IsEmpty Then
   iRecNo:=DMConciliacao.CDS_CMDepositosAnalise.RecNo;

  // Verifica se Transa��o esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);

  Try // Try da Transa��o
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    sHora:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
    sDia :=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

    FrmBelShop.MontaProgressBar(True, FrmSolicitacoes);
    pgProgBar.Properties.Max:=DMConciliacao.CDS_CMDepAnaliseDocRel.RecordCount;
    pgProgBar.Position:=0;

    sgDtaInicio:='';
    sgDtaFim   :='';
    DMConciliacao.CDS_CMDepAnaliseDocRel.First;
    DMConciliacao.CDS_CMDepAnaliseDocRel.DisableControls;
    While Not DMConciliacao.CDS_CMDepAnaliseDocRel.Eof do
    Begin
      Application.ProcessMessages;

      If Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)<>'' Then
      Begin
        // Acerta Per�odo Para Apresenta��o dos Caixas Fechados ================
        If Trim(sgDtaInicio)='' Then
        Begin
          sgDtaInicio:=Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString);
          sgDtaFim   :=Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString);
        End;

        If StrToDate(sgDtaInicio)<StrToDate(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)) Then
        Begin
          If StrToDate(sgDtaFim)<StrToDate(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)) Then
           sgDtaFim   :=Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString);
        End;

        If StrToDate(sgDtaInicio)>StrToDate(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)) Then
        Begin
          sgDtaFim:=sgDtaInicio;
          sgDtaInicio:=Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString);
        End;

        // Monta Tab_Auxiliar.Cod_Aux ============================================
        sCodAux:=Trim(DMConciliacao.CDS_CMDepAnaliseDocRelCOD_LINX.AsString)+ // Codigo da Loja Linx
                FormatFloat('00',StrToInt(Copy(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString),1,2)))+ // Dia do Movto
                FormatFloat('00',StrToInt(Copy(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString),4,2)))+ // Mes do Movto
                Copy(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString),9,2); // Ano do Movto - 2 Caracteres

        // Atualiza Entrega do Docto Financeiro ================================
        MySql:=' UPDATE TAB_AUXILIAR t'+
               ' SET t.vlr_aux=1'+
               ' WHERE t.tip_aux=24'+ // CONCILIA��O DE DEP�SITOS: - OBSERVA��O FINANCEIRA / NUMERO DO DOCUMENTO FINANCEIRO - SE ENTREGUE PARA O RENATO
               ' AND t.cod_aux='+QuotedStr(sCodAux)+
               ' AND t.des_aux1='+QuotedStr(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelNUM_DOCTO.AsString));
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        // Efetua o Fechamento do Movto ========================================
        MySql:=' SELECT t.cod_aux'+
               ' FROM TAB_AUXILIAR t'+
               ' WHERE t.tip_aux=22'+ // 22 => CONCILIA��O DE DEP�SITOS: DATAS FECHADAS PELO RENATO
               ' AND t.des_aux='+QuotedStr(f_Troca('.','/',f_Troca('-','/',Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString))))+
               ' AND t.des_aux1='+QuotedStr(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelCOD_LINX.AsString));
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Aux').AsString)='' Then
        Begin
//          22 => CONCILIA��O DE DEP�SITOS: DATAS FECHADAS PELO RENATO
//                ====================================================
//              - COD_AUX  = Sequ�ncia - Utilizado somente para ter Cod_Aux na PrimaryKey
//              - DES_AUX  = Data do Fechamento (Renato)
//              - DES_AUX1 = C�digo da Loja Linx
//              - VLR_AUX  = --> N�o Usado
//              - VLR_AUX1 = --> N�o Usado

          MySql:=' INSERT INTO TAB_AUXILIAR'+
                 ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
                 ' VALUES ('+
                 ' 22,'+ // TIP_AUX - CONCILIA��O DE DEP�SITOS - DATAS FECHADAS PELO RENATO
                 ' (SELECT COALESCE(MAX(t.cod_aux)+1 ,1) FROM tab_auxiliar t WHERE t.tip_aux=22), '+ // COD_AUX
                 QuotedStr(f_Troca('.','/',f_Troca('-','/',Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString))))+', '+ // DES_AUX
                 DMConciliacao.CDS_CMDepAnaliseDocRelCOD_LINX.AsString+', '+ // DES_AUX1
                 ' NULL,'+ // VLR_AUX
                 ' NULL)'; // VLR_AUX1
          DMBelShop.SQLC.Execute(MySql, nil,nil);
        End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Aux').AsString)='' Then
        DMBelShop.CDS_BuscaRapida.Close;

        // Atualiza Recebimento: Usuario, Data e Hora ==========================
        MySql:=' UPDATE FIN_CONCILIACAO_DEP_REL dc'+
               ' SET dc.usu_recebe='+Cod_Usuario+
               ',    dc.dta_recebe='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDia)))+
               ',    dc.hra_recebe='+QuotedStr(sHora)+
               ' WHERE dc.num_docto='+Trim(DMConciliacao.CDS_CMDepAnaliseDocRelNUM_DOCTO.AsString);
        DMBelShop.SQLC.Execute(MySql, nil,nil);

        // Acerta ClientDataSet Documento Financeiro - CDS_CMDepAnaliseDocRel ==
        DMConciliacao.CDS_CMDepAnaliseDocRel.Edit;
        DMConciliacao.CDS_CMDepAnaliseDocRelUSU_RECEBE.AsString:=Cod_Usuario;
        DMConciliacao.CDS_CMDepAnaliseDocRelDES_USU_RECEBE.AsString:=Des_Usuario;
        DMConciliacao.CDS_CMDepAnaliseDocRelDTA_RECEBE.AsString:=sDia;
        DMConciliacao.CDS_CMDepAnaliseDocRelHRA_RECEBE.AsString:=sHora;
        DMConciliacao.CDS_CMDepAnaliseDocRel.Post;

        // Acerta ClientDataSet de Analise de Caixa - CDS_CMDepositosAnalise ===
        If (DMConciliacao.CDS_CMDepositosAnalise.Active) and (Not DMConciliacao.CDS_CMDepositosAnalise.IsEmpty) Then
        Begin
          sDia:=f_Troca('/','.',f_Troca('-','.',Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)));

          If LocalizaRegistro(DMConciliacao.CDS_CMDepositosAnalise, 'DTA_DOCTO', sDia) Then
          Begin
            DMConciliacao.CDS_CMDepositosAnalise.DisableControls;
            While Not DMConciliacao.CDS_CMDepositosAnalise.Eof do
            Begin
              If (DMConciliacao.CDS_CMDepositosAnaliseCOD_LOJA.AsInteger          =DMConciliacao.CDS_CMDepAnaliseDocRelCOD_LINX.AsInteger) And
                 (Trim(DMConciliacao.CDS_CMDepositosAnaliseNUM_RELATORIO.AsString)=Trim(DMConciliacao.CDS_CMDepAnaliseDocRelNUM_DOCTO.AsString)) And
                 (Trim(DMConciliacao.CDS_CMDepositosAnaliseDTA_DOCTO.AsString)    =Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)) Then
              Begin
                DMConciliacao.CDS_CMDepositosAnalise.Edit;
                DMConciliacao.CDS_CMDepositosAnaliseFECHA.AsString:='SIM';
                DMConciliacao.CDS_CMDepositosAnaliseREL_ENTREGUE.AsString:='SIM';
                DMConciliacao.CDS_CMDepositosAnalise.Post;
                Break;
              End; // If (DMConciliacao.CDS_CMDepositosAnaliseCOD_LOJA.AsInteger          =DMConciliacao.CDS_CMDepAnaliseDocRelCOD_LINX.AsInteger) And

              DMConciliacao.CDS_CMDepositosAnalise.Next;
            End; // While Not DMConciliacao.CDS_CMDepositosAnalise.Eof do
            DMConciliacao.CDS_CMDepositosAnalise.EnableControls;
            DMConciliacao.CDS_CMDepositosAnalise.RecNo:=iRecNo;
          End; // If LocalizaRegistro(DMConciliacao.CDS_CMDepositosAnalise, 'DTA_DOCTO', sDia) Then
        End; // If (DMConciliacao.CDS_CMDepositosAnalise.Active) and (Not DMConciliacao.CDS_CMDepositosAnalise.IsEmpty) Then
      End; // If Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)<>'' Then

      pgProgBar.Position:=DMConciliacao.CDS_CMDepAnaliseDocRel.RecNo;

      DMConciliacao.CDS_CMDepAnaliseDocRel.Next;
    End; // While Not DMConciliacao.CDS_CMDepAnaliseDocRel.Eof do
    DMConciliacao.CDS_CMDepAnaliseDocRel.EnableControls;
    DMConciliacao.CDS_CMDepAnaliseDocRel.First;

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);
  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DMConciliacao.CDS_CMDepAnaliseDocRel.EnableControls;
      DMConciliacao.CDS_CMDepAnaliseDocRel.First;

      FrmBelShop.MontaProgressBar(False, FrmSolicitacoes);
      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try da Transa��o
  FrmBelShop.MontaProgressBar(False, FrmSolicitacoes);
  DateSeparator:='/';
  DecimalSeparator:=',';

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  bgProcessar:=False;
  If msg('Deseja Apresentar as Lojas'+cr+cr+'Com Caixas Fechados ?? ','C')=1 Then
  Begin
    bgProcessar:=True;
  End;

  Close;
end;

procedure TFrmSolicitacoes.Bt_ConcDepDocFinanFechamentoClick(Sender: TObject);
begin
  sgDtaInicio:='';
  sgDtaFim   :='';
  DMConciliacao.CDS_CMDepAnaliseDocRel.First;
  DMConciliacao.CDS_CMDepAnaliseDocRel.DisableControls;
  While Not DMConciliacao.CDS_CMDepAnaliseDocRel.Eof do
  Begin
    Application.ProcessMessages;

    If Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)<>'' Then
    Begin
      // Acerta Per�odo Para Apresenta��o dos Caixas Fechados ================
      If Trim(sgDtaInicio)='' Then
      Begin
        sgDtaInicio:=Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString);
        sgDtaFim   :=Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString);
      End;

      If StrToDate(sgDtaInicio)<StrToDate(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)) Then
      Begin
        If StrToDate(sgDtaFim)<StrToDate(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)) Then
         sgDtaFim   :=Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString);
      End;

      If StrToDate(sgDtaInicio)>StrToDate(Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)) Then
      Begin
        sgDtaFim:=sgDtaInicio;
        sgDtaInicio:=Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString);
      End;
    End; // If Trim(DMConciliacao.CDS_CMDepAnaliseDocRelDTA_MOVTO.AsString)<>'' Then

    DMConciliacao.CDS_CMDepAnaliseDocRel.Next;
  End; // While Not DMConciliacao.CDS_CMDepAnaliseDocRel.Eof do
  DMConciliacao.CDS_CMDepAnaliseDocRel.EnableControls;
  DMConciliacao.CDS_CMDepAnaliseDocRel.First;

  bgProcessar:=True;
  Close;

end;

procedure TFrmSolicitacoes.Dbg_ComprasEstoquesCDEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ComprasEstoquesCDEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Bt_ComprasEstoquesMemoriaClick(Sender: TObject);
begin
  Dbg_ComprasEstoquesCD.SetFocus;

  If DMBelShop.CDS_ComprasEstoqueCD.IsEmpty Then
   Exit;

  DBGridClipboard(Dbg_ComprasEstoquesCD);

end;

procedure TFrmSolicitacoes.Rb_ComprasEstoquesAClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_ComprasEstoquesA);
  AcertaRb_Style(Rb_ComprasEstoquesB);
  AcertaRb_Style(Rb_ComprasEstoquesC);
  AcertaRb_Style(Rb_ComprasEstoquesD);
  AcertaRb_Style(Rb_ComprasEstoquesE);
end;

procedure TFrmSolicitacoes.Rb_ComprasEstoquesAKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Rb_ComprasEstoquesAClick(Self);
end;

procedure TFrmSolicitacoes.Bt_ComprasEstoquesCDCurvaClick(Sender: TObject);
begin
  If Rb_ComprasEstoquesA.Checked Then
   ComprasAnaliseSaldoCD(Rb_ComprasEstoquesA.Caption);

  If Rb_ComprasEstoquesB.Checked Then
   ComprasAnaliseSaldoCD(Rb_ComprasEstoquesB.Caption);

  If Rb_ComprasEstoquesC.Checked Then
   ComprasAnaliseSaldoCD(Rb_ComprasEstoquesC.Caption);

  If Rb_ComprasEstoquesD.Checked Then
   ComprasAnaliseSaldoCD(Rb_ComprasEstoquesD.Caption);

  If Rb_ComprasEstoquesE.Checked Then
   ComprasAnaliseSaldoCD(Rb_ComprasEstoquesE.Caption);
end;

procedure TFrmSolicitacoes.Dbg_ComprasEstoquesCDDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdSelected in State) Then // Este comando altera cor da Linha
  Begin
    If DMBelShop.CDS_ComprasEstoqueCDORDEM.AsInteger=0 Then
    Begin
      Dbg_ComprasEstoquesCD.Canvas.Brush.Color:=clSkyBlue;
      Dbg_ComprasEstoquesCD.Canvas.Font.Style:=[fsBold]; // Cor da Fonte
    End;
  End; // if not (gdSelected in State) Then
  Dbg_ComprasEstoquesCD.Canvas.FillRect(Rect);
  Dbg_ComprasEstoquesCD.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamentos ==============================================================
  DMBelShop.CDS_ComprasEstoqueCDCOD_PRODUTO.Alignment:=taRightJustify;
  DMBelShop.CDS_ComprasEstoqueCDIND_CURVA.Alignment  :=taCenter;
  DMBelShop.CDS_ComprasEstoqueCDQTD_DIVERGENCIA.Alignment:=taRightJustify;
  DMBelShop.CDS_ComprasEstoqueCDQTD_ESTOQUE.Alignment:=taRightJustify;
  DMBelShop.CDS_ComprasEstoqueCDQTD_VENDA15DD.Alignment:=taRightJustify;

end;

procedure TFrmSolicitacoes.Dbg_AudDepositosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If Dbg_AudDepositos.Visible Then
  Begin
    if not (gdSelected in State) Then // Este comando altera cor da Linha
    Begin
      If DMCentralTrocas.CDS_DepositosSELECAO.AsString='SIM' Then
      Begin
        Dbg_AudDepositos.Canvas.Brush.Color:=clSkyBlue;
        Dbg_AudDepositos.Canvas.Font.Style:=[fsBold]; // Cor da Fonte
      End;
    End; // if not (gdSelected in State) Then
    Dbg_AudDepositos.Canvas.FillRect(Rect);
    Dbg_AudDepositos.DefaultDrawDataCell(Rect,Column.Field,state);

    // Alinhamentos ==============================================================
    DMCentralTrocas.CDS_DepositosSELECAO.Alignment     :=taCenter;
    DMCentralTrocas.CDS_DepositosCOD_DEPOSITO.Alignment:=taRightJustify;
    DMCentralTrocas.CDS_DepositosDISP_VENDA.Alignment  :=taCenter;
    DMCentralTrocas.CDS_DepositosDISP_TRANSF.Alignment  :=taCenter;
  End; // If Dbg_AudDepositos.Visible Then
end;

procedure TFrmSolicitacoes.Dbg_AudDepositosEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_AudDepositosEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicitacoes.Dbg_AudDepositosDblClick(Sender: TObject);
begin
  igCodDeposito:=DMCentralTrocas.CDS_DepositosCOD_DEPOSITO.AsInteger;

  DMCentralTrocas.CDS_Depositos.First;
  DMCentralTrocas.CDS_Depositos.DisableControls;
  While Not DMCentralTrocas.CDS_Depositos.Eof do
  Begin

    If (DMCentralTrocas.CDS_DepositosSELECAO.AsString='SIM') And (DMCentralTrocas.CDS_DepositosCOD_DEPOSITO.AsInteger<>igCodDeposito) Then
    Begin
      DMCentralTrocas.CDS_Depositos.Edit;
      DMCentralTrocas.CDS_DepositosSELECAO.AsString:='NAO';
      DMCentralTrocas.CDS_Depositos.Post;
    End; // If DMCentralTrocas.CDS_DepositosSELECAO.AsString='SIM' Then

    If DMCentralTrocas.CDS_DepositosCOD_DEPOSITO.AsInteger=igCodDeposito Then
    Begin
      DMCentralTrocas.CDS_Depositos.Edit;
      DMCentralTrocas.CDS_DepositosSELECAO.AsString:='SIM';
      DMCentralTrocas.CDS_Depositos.Post;
    End; // If DMCentralTrocas.CDS_DepositosSELECAO.AsString='SIM' Then

    DMCentralTrocas.CDS_Depositos.Next;
  End; // While Not DMCentralTrocas.CDS_Depositos.Eof do
  DMCentralTrocas.CDS_Depositos.Locate('COD_DEPOSITO', igCodDeposito,[]);
  DMCentralTrocas.CDS_Depositos.EnableControls;

end;

procedure TFrmSolicitacoes.Rb_AudCadProdutosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Rb_AudCadProdutosClick(Self);
end;

end.

