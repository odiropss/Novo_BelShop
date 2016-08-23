{
//  Inclusão.Tag=1
//  Alteração.Tag=2
//  Exclusão.Tag=3
//  Salvar.Tag=4
}
unit UFrmSalao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
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
  dxSkinsdxStatusBarPainter, cxContainer, cxEdit, dxSkinscxPCPainter,
  AppEvnts, ExtDlgs, ACBrBase, ACBrSocket, ACBrCEP, JvGradientCaption,
  JvOutlookBar, cxSpinEdit, Grids, StdCtrls, jpeg, ComCtrls, cxPC, RXSpin,
  ExtCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  JvExStdCtrls, JvEdit, JvValidateEdit, JvRadioButton, dxStatusBar,
  MaskEditJul, CurrEditJul, DBGridJul, DBCtrls, JvExMask, JvToolEdit, Mask,
  JvXPCore, JvXPButtons,
  ToolEdit, CurrEdit,
  JvXPCheckCtrls, DBGrids,
  JvCheckBox, JvExControls, Commctrl,
  DBClient, DBXpress, IBQuery, DB, StrUtils, FMTBcd, SqlExpr,
  Clipbrd, // PrintScreen
  WinInet, RelVisual, MMSystem, Menus;
//  Último: Menus;

type
  TFrmSalao = class(TForm)
    PC_Salao: TPageControl;
    CorCaptionForm: TJvGradientCaption;
    Ts_Profissionais: TTabSheet;
    Gb_Filtro: TGroupBox;
    Gb_FiltroAtivo: TGroupBox;
    Gb_Profissionais: TGroupBox;
    Dbg_Profissionais: TDBGrid;
    Ts_CadProfissional: TTabSheet;
    Panel7: TPanel;
    Bt_CadProfAbandonar: TJvXPButton;
    Bt_CadProfDML: TJvXPButton;
    Gb_FiltroLoja: TGroupBox;
    EdtCodLoja: TCurrencyEdit;
    Bt_BuscaLoja: TJvXPButton;
    EdtDesLoja: TEdit;
    Ts_Habilidades: TTabSheet;
    Panel2: TPanel;
    Bt_Novo: TJvXPButton;
    Bt_Alterar: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    Pan_HabilidadesServicos: TPanel;
    ACBrCEP: TACBrCEP;
    OpenFoto: TOpenPictureDialog;
    Gb_Profissional: TGroupBox;
    Dbe_CadProfCodLoja: TDBEdit;
    EdtCadProfDesLoja: TEdit;
    Label1: TLabel;
    Dbe_CadProfCodigo: TDBEdit;
    Dbe_CadProfNome: TDBEdit;
    Label3: TLabel;
    Dbe_CadProfApelido: TDBEdit;
    Label12: TLabel;
    PC_CadProfissional: TPageControl;
    Ts_CadProfDadosPessoais: TTabSheet;
    Gb_CadProfPessoais: TGroupBox;
    Label9: TLabel;
    Lab_Anos: TLabel;
    Label38: TLabel;
    Me_CadProfCPF: TMaskEdit;
    Label4: TLabel;
    Dbe_CadProfIdentidade: TDBEdit;
    Label6: TLabel;
    Ckb_CadProfAtivo: TJvXPCheckbox;
    Lab_CadProfLiberdo: TLabel;
    Ckb_CadProfLiberdo: TJvXPCheckbox;
    Pan_Foto: TPanel;
    IM_CadProfFoto: TImage;
    Label5: TLabel;
    Bt_CadProfBuscaFoto: TJvXPButton;
    Bt_CadProfLimpaFoto: TJvXPButton;
    Gb_CadProfEndereco: TGroupBox;
    Label53: TLabel;
    Label45: TLabel;
    Label51: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label52: TLabel;
    Me_CadProfCEP: TMaskEdit;
    Dbe_CadProfEndereco: TDBEdit;
    Dbe_CadProfComplEnd: TDBEdit;
    Bt_CadProfBuscaMunicipio: TJvXPButton;
    Dbe_CadProfNumEnd: TDBEdit;
    Dbe_CadProfBairro: TDBEdit;
    Bt_CadProfBuscaUF: TJvXPButton;
    Dbe_CadProfMunicipio: TDBEdit;
    Dbe_CadProfEstado: TDBEdit;
    Gb_LocalEndereco: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Bt_CadProfBuscaCEP_IBGE: TJvXPButton;
    Bt_CadProfBuscaEnd_IBGE: TJvXPButton;
    Me_CadProfCEPLocIBGE: TMaskEdit;
    Bt_CadProfLimpaEndereco: TJvXPButton;
    PC_CadProfDiversos: TPageControl;
    Ts_CadProfLocais: TTabSheet;
    Ts_CadProfObservacao: TTabSheet;
    Pan_CadProfFone: TPanel;
    Panel6: TPanel;
    Label10: TLabel;
    Bt_CadProfFoneNovo: TJvXPButton;
    Bt_CadProfFoneAlterar: TJvXPButton;
    Bt_CadProfFoneExcluir: TJvXPButton;
    Dbg_CadProfFones: TDBGrid;
    Dbm_CadProfOBS: TDBMemo;
    Pan_CadProfEmail: TPanel;
    Panel8: TPanel;
    Label11: TLabel;
    Bt_CadProfEmailNovo: TJvXPButton;
    Bt_CadProfEmailAlterar: TJvXPButton;
    Bt_CadProfEmailExcluir: TJvXPButton;
    Dbg_CadProfEmails: TDBGrid;
    Ts_CadProfDoctos: TTabSheet;
    Ts_CadProfContrato: TTabSheet;
    Gb_CadProfDoctos: TGroupBox;
    Gb_CadProfSindicato: TGroupBox;
    Gb_CadProfTecBiz: TGroupBox;
    Gb_CadProfINSS: TGroupBox;
    Gb_CadProfAlvaraLoc: TGroupBox;
    Gb_CadProfPlanoSaude: TGroupBox;
    Gb_CadProfBanco: TGroupBox;
    Label13: TLabel;
    Dbe_CadProfNumSindicato: TDBEdit;
    Ckb_CadProfTaxaSindicato: TJvCheckBox;
    Label19: TLabel;
    Label14: TLabel;
    Dbe_CadProfVlrSindicato: TDBEdit;
    Dbe_CadProfCompSindicato: TDBEdit;
    Label15: TLabel;
    Label17: TLabel;
    Ckb_CadProfTaxaNaoSocio: TJvCheckBox;
    Dbe_CadProfVlrTaxaNaoSocios: TDBEdit;
    Label18: TLabel;
    Dbe_CadProfCompNaoSocios: TDBEdit;
    Label2: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Dbe_CadProfMatriculaTecBiz: TDBEdit;
    Dbe_CadProfNumTecBiz: TDBEdit;
    Dbe_CadProfCompTecBiz: TDBEdit;
    Label22: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label16: TLabel;
    Dbe_CadProfCompINSS: TDBEdit;
    Dbe_CadProfPerINSS: TDBEdit;
    Dbe_CadProfNumINSS: TDBEdit;
    Label26: TLabel;
    Dbe_CadProfCodPlanoSaude: TDBEdit;
    EdtCadProfDesPlanoSaude: TEdit;
    Bt_CadProfBuscaPlanoSaude: TJvXPButton;
    Bt_CadProfInserePlanoSaude: TJvXPButton;
    Dbe_CadProfCompPlanoSaude: TDBEdit;
    Label28: TLabel;
    Dbe_CadProfVlrPlanoSaude: TDBEdit;
    Label27: TLabel;
    Gb_CadProfDependentes: TGroupBox;
    Panel1: TPanel;
    Bt_CadProfDependenteNovo: TJvXPButton;
    Bt_CadProfDependenteAlterar: TJvXPButton;
    Bt_CadProfDependenteExcluir: TJvXPButton;
    Dbg_CadProfDependentes: TDBGrid;
    Label25: TLabel;
    Dbe_CadProfAlvaraLoc: TDBEdit;
    Label30: TLabel;
    Dbe_CadProfNumBanco: TDBEdit;
    Dbe_CadProfNomeBanco: TDBEdit;
    Label31: TLabel;
    Label32: TLabel;
    Dbe_CadProfNumAgencia: TDBEdit;
    Dbe_CadProfNomeAgencia: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    Dbe_CadProfNumConta: TDBEdit;
    EdtDta_CadProfDtaNasc: TJvDateEdit;
    Pan_HabServ: TPanel;
    Gb_CadProfHabi: TGroupBox;
    Panel9: TPanel;
    Dbg_CadProfHab: TDBGridJul;
    Pan_CadProfHab: TPanel;
    Bt_CadProfHabExcluir: TJvXPButton;
    Gb_CadProfServ: TGroupBox;
    Panel11: TPanel;
    Dbg_CadProfServ: TDBGridJul;
    Pan_CadProfServ: TPanel;
    Bt_CadProfHabIncluir: TJvXPButton;
    Gb_CadProfContratos: TGroupBox;
    Gb_CadProfContrato: TGroupBox;
    Label29: TLabel;
    Label36: TLabel;
    Label60: TLabel;
    Label35: TLabel;
    Dbe_CadProfNumContrato: TDBEdit;
    EdtDt_CadProfIniContrato: TJvDateEdit;
    EdtDt_CadProfFimContrato: TJvDateEdit;
    Dbe_CadProfMesesContrato: TDBEdit;
    Gb_CadProfPeriodoCalculo: TGroupBox;
    Label49: TLabel;
    Label37: TLabel;
    Gb_CadProfPeriodoUtlCalculo: TGroupBox;
    Label50: TLabel;
    Label61: TLabel;
    EdtDt_CadProfDiaIniUltCalculo: TJvDateEdit;
    EdtDt_CadProfDiaFimUltCalculo: TJvDateEdit;
    Gb_CadProfPercentuais: TGroupBox;
    Label54: TLabel;
    Label47: TLabel;
    Label46: TLabel;
    Dbe_CadProfPerComissao: TDBEdit;
    Dbe_CadProfPerComissaoSupervisor: TDBEdit;
    Dbe_CadProfPerExtraAno: TDBEdit;
    Gb_CadProfMoveis: TGroupBox;
    Dbm_CadProfMoveis: TDBMemo;
    GroupBox3: TGroupBox;
    Dbm_CadProfRenovacoes: TDBMemo;
    Bt_CadProfHabAlterar: TJvXPButton;
    Bt_CadProfServAlterar: TJvXPButton;
    Dbe_CadProfDiaIniCalculo: TDBEdit;
    Dbe_CadProfDiaFimCalculo: TDBEdit;
    Gb_CadProfRenovacao: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    EdtDt_CadProfIniRenovacao: TJvDateEdit;
    EdtDt_CadProfFimRenovacao: TJvDateEdit;
    Bt_CadProfNovaRenovacao: TJvXPButton;
    Bt_CadProfExcluiRenovacao: TJvXPButton;
    Gb_CadProfContrBens: TGroupBox;
    Dbe_CadProfNumContratoBens: TDBEdit;
    Ts_CadProfSidicom: TTabSheet;
    Gb_CadProfSidicom: TGroupBox;
    Gb_CadProfSidNivelTabela: TGroupBox;
    Label58: TLabel;
    Dbe_CadProfSidNivelTabela: TDBEdit;
    Gb_CadProfSidTipCalculo: TGroupBox;
    Rb_CadProfSidPercentuais: TJvRadioButton;
    Rb_CadProfSidDescontos: TJvRadioButton;
    Rb_CadProfSidListaPreco: TJvRadioButton;
    Gb_CadProfSidTabelaProc: TGroupBox;
    Rb_CadProfSidTabela0: TJvRadioButton;
    Rb_CadProfSidTabela2: TJvRadioButton;
    Rb_CadProfSidTabela6: TJvRadioButton;
    Rb_CadProfSidTabela4: TJvRadioButton;
    Rb_CadProfSidTabela8: TJvRadioButton;
    Rb_CadProfSidTabela1: TJvRadioButton;
    Rb_CadProfSidTabela3: TJvRadioButton;
    Rb_CadProfSidTabela5: TJvRadioButton;
    Rb_CadProfSidTabela7: TJvRadioButton;
    PC_CadProfSidicom: TPageControl;
    Ts_CadProfSupervisor: TTabSheet;
    Dbg_CadProfSidSupervisor: TDBGrid;
    EdtCadProfSidCodSupervisor: TJvValidateEdit;
    Bt_CadProfSidExcluiSupervisor: TJvXPButton;
    Ts_CadProfVendViculados: TTabSheet;
    Gb_CadProfSidQuotaMes: TGroupBox;
    Dbe_CadProfSidQuotaMes: TDBEdit;
    Dbg_CadProfSidVendedor: TDBGrid;
    Label59: TLabel;
    Pan_CadProfSidSupervisor: TPanel;
    Bt_CadProfSidBuscaSupervisor: TJvXPButton;
    Ckb_CadProfSidSuperAtivo: TJvXPCheckbox;
    Ckb_CadProfSidSuperInativo: TJvXPCheckbox;
    Label41: TLabel;
    Label43: TLabel;
    EdtCadProfSidCodVendedor: TJvValidateEdit;
    Label62: TLabel;
    Pan_CadProfSidVendedor: TPanel;
    Bt_CadProfSidBuscaVendedor: TJvXPButton;
    Ckb_CadProfSidVendAtivo: TJvXPCheckbox;
    Ckb_CadProfSidVendInativo: TJvXPCheckbox;
    Bt_CadProfSidExcluiVendedor: TJvXPButton;
    Cbx_Situacao: TComboBox;
    Label63: TLabel;
    Cbx_CadProfTpPessoa: TComboBox;
    Bt_LiberaConsistencias: TJvXPButton;
    Ckb_Vendedores: TJvCheckBox;
    Ckb_Profissionais: TJvCheckBox;
    Bt_HabServMaximizar: TJvXPButton;
    Bt_HabServMinimizar: TJvXPButton;
    Ts_ProfVales: TTabSheet;
    Pan_Rodape: TPanel;
    Bt_Fechar: TJvXPButton;
    Pan_Profissionais: TPanel;
    Gb_ValesFiltro: TGroupBox;
    Gb_ValesFiltroLoja: TGroupBox;
    EdtValesCodLoja: TCurrencyEdit;
    Bt_ValesBuscaLoja: TJvXPButton;
    EdtValesDesLoja: TEdit;
    Pan_ValesRodape: TPanel;
    Gb_ValesFiltroProf: TGroupBox;
    EdtValesCodProf: TCurrencyEdit;
    Bt_ValesBuscaProf: TJvXPButton;
    EdtValesDesProf: TEdit;
    Gb_Vales: TGroupBox;
    Dbg_Vales: TDBGrid;
    Gb_ValesFiltroPeriodo: TGroupBox;
    DtEdt_ValesDtInicio: TcxDateEdit;
    Label181: TLabel;
    DtEdt_ValesDtFim: TcxDateEdit;
    Bt_ValesNovo: TJvXPButton;
    Bt_ValesAlterar: TJvXPButton;
    Bt_ValesExcluir: TJvXPButton;
    Gb_ValesFiltroSitVales: TGroupBox;
    Ckb_ValesAbertos: TJvXPCheckbox;
    Ckb_ValesFechados: TJvXPCheckbox;
    Bt_ValesFiltroConsultar: TJvXPButton;
    Dbg_ValesPagtos: TDBGrid;
    Gb_ValesProf: TGroupBox;
    Dbg_ValesProf: TDBGrid;
    Gb_ValesFiltroSitProf: TGroupBox;
    Ckb_ValesAtivos: TJvXPCheckbox;
    Ckb_ValesInativos: TJvXPCheckbox;
    Pan_ValesProfInativo: TPanel;
    Splitter1: TSplitter;
    Ts_ProfMetas: TTabSheet;
    Pan_MetasRodape: TPanel;
    GroupBox1: TGroupBox;
    EdtMetasCodLoja: TCurrencyEdit;
    Bt_MetasBuscaLoja: TJvXPButton;
    EdtMetasDesLoja: TEdit;
    Gb_MetasProfissionais: TGroupBox;
    Pan_Metas: TPanel;
    Gb_MetasHabilidades: TGroupBox;
    Gb_Metas: TGroupBox;
    Pan_FinanObjetivosManutObjetivos: TPanel;
    Bt_MetasSalvar: TJvXPButton;
    Bt_MetasAbandonar: TJvXPButton;
    Label65: TLabel;
    EdtMetasAno: TRxSpinEdit;
    Pan_MetasProf: TPanel;
    Label91: TLabel;
    Dbe_MetasProfMes01: TDBEdit;
    Label95: TLabel;
    Dbe_MetasProfMes02: TDBEdit;
    Label96: TLabel;
    Dbe_MetasProfMes03: TDBEdit;
    Label97: TLabel;
    Dbe_MetasProfMes04: TDBEdit;
    Label101: TLabel;
    Dbe_MetasProfMes05: TDBEdit;
    Label100: TLabel;
    Dbe_MetasProfMes06: TDBEdit;
    Label102: TLabel;
    Dbe_MetasProfMes12: TDBEdit;
    Dbe_MetasProfMes11: TDBEdit;
    Label103: TLabel;
    Label104: TLabel;
    Dbe_MetasProfMes10: TDBEdit;
    Dbe_MetasProfMes09: TDBEdit;
    Label105: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Dbe_MetasProfMes07: TDBEdit;
    Dbe_MetasProfMes08: TDBEdit;
    Bt_MetasAlterar: TJvXPButton;
    Dbg_MetasProfissionais: TDBGrid;
    EdtLocalizaProf: TEdit;
    Bt_MetasLocalizaProf: TJvXPButton;
    Dbg_MetasHabilidades: TDBGrid;
    Label66: TLabel;
    Dbe_MetasProfCom01: TDBEdit;
    Dbe_MetasProfCom02: TDBEdit;
    Dbe_MetasProfCom04: TDBEdit;
    Dbe_MetasProfCom03: TDBEdit;
    Dbe_MetasProfCom06: TDBEdit;
    Dbe_MetasProfCom05: TDBEdit;
    Dbe_MetasProfCom12: TDBEdit;
    Dbe_MetasProfCom11: TDBEdit;
    Dbe_MetasProfCom07: TDBEdit;
    Dbe_MetasProfCom08: TDBEdit;
    Dbe_MetasProfCom09: TDBEdit;
    Dbe_MetasProfCom10: TDBEdit;
    Dbe_MetasProfComAno: TDBEdit;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Gb_CadProfImpressao: TGroupBox;
    Label48: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    Dbe_CadProfVlrPagtoMinimo: TDBEdit;
    Dbe_CadProfVlrCaucao: TDBEdit;
    Dbe_CadProfPerLocador: TDBEdit;
    Bt_CadProfServAlterarTodos: TJvXPButton;
    Ts_ProfPagtos: TTabSheet;
    PC_PagtoPlanilha: TcxPageControl;
    Ts_PagtoProfissionais: TcxTabSheet;
    Gb_PagtoFiltro: TGroupBox;
    Gb_PagtoLoja: TGroupBox;
    EdtPagtoCodLoja: TCurrencyEdit;
    Bt_PagtoBuscaLoja: TJvXPButton;
    EdtPagtoDesLoja: TEdit;
    Gb_PagtoProfissionais: TGroupBox;
    Dbg_PagtoProfissionais: TDBGridJul;
    Panel13: TPanel;
    Bt_PagtoFechar: TJvXPButton;
    Panel14: TPanel;
    Ts_PagtoPlanilha: TcxTabSheet;
    StatusBar1: TStatusBar;
    Bt_PagtoDesmarcaTodos: TJvXPButton;
    Bt_PagtoMarcaTodos: TJvXPButton;
    Bt_PagtoAlteraPeriodo: TJvXPButton;
    Panel16: TPanel;
    Bt_PagtoVendas: TJvXPButton;
    Ckb_PagtoMetas: TJvXPCheckbox;
    Label72: TLabel;
    Ts_PagtoVendas: TcxTabSheet;
    Dbg_PagtosVendas: TDBGrid;
    Pan_ComissaoBottom: TPanel;
    Bt_PagtoVendasVoltar: TJvXPButton;
    Bt_PagtoVendasSalvaExcel: TJvXPButton;
    Bt_PagtoVendasClipboard: TJvXPButton;
    Rb_PagtoVendasSintetico: TJvRadioButton;
    Rb_PagtoVendasAnalitico: TJvRadioButton;
    Ts_PagtoDebCred: TcxTabSheet;
    Dbg_PagtosDebCred: TDBGrid;
    Pan_DebCredBottom: TPanel;
    Bt_PagtoDebCredVoltar: TJvXPButton;
    Bt_PagtoDebCredSalvaExcel: TJvXPButton;
    Bt_PagtoDebCredClipboard: TJvXPButton;
    Rb_PagtoDebCredSintetico: TJvRadioButton;
    Rb_PagtoDebCredAnalitico: TJvRadioButton;
    Ts_ProfMovtosRH: TTabSheet;
    GroupBox2: TGroupBox;
    Lab_TotalProf: TLabel;
    Ckb_CadProfINSSCobrar: TJvCheckBox;
    Label73: TLabel;
    OdirPanApres: TPanel;
    Bt_PagtoGeraPlanilha: TJvXPButton;
    Pan_ProfBranco: TPanel;
    Pan_PlanilhaBottom: TPanel;
    Bt_PagtoPlansVoltar: TJvXPButton;
    Bt_PagtoPlanSalvaExcel: TJvXPButton;
    Bt_PagtoPlanClipboard: TJvXPButton;
    Rb_PagtoPlanTodos: TJvRadioButton;
    Rb_PagtoPlanDeposito: TJvRadioButton;
    Dbg_PagtoPlanilha: TDBGrid;
    GroupBox4: TGroupBox;
    Label74: TLabel;
    EdtPagtoCodPlan: TCurrencyEdit;
    Bt_PagtoBuscaPlan: TJvXPButton;
    Gb_Habilidades: TGroupBox;
    Panel5: TPanel;
    Bt_HabNova: TJvXPButton;
    Bt_HabAterar: TJvXPButton;
    Bt_HabExcluir: TJvXPButton;
    Gb_Servicos: TGroupBox;
    Panel4: TPanel;
    Bt_ServNovo: TJvXPButton;
    Bt_ServAlterar: TJvXPButton;
    Bt_ServExcluir: TJvXPButton;
    Bt_ServIncluir: TJvXPButton;
    Ts_PlanoSaude: TTabSheet;
    Gb_PlanoSaude: TGroupBox;
    Panel12: TPanel;
    Dbg_PlanoSaude: TDBGridJul;
    Pan_PlanoSaude: TPanel;
    Bt_PlanoSaudeNovo: TJvXPButton;
    Bt_PlanoSaudeAlterar: TJvXPButton;
    Bt_PlanoSaudeExcluir: TJvXPButton;
    Pan_PlanoSaudeRodape: TPanel;
    Bt_PlanoSaudeFechar: TJvXPButton;
    Sb_CadProfServ: TdxStatusBar;
    Panel3: TPanel;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    EdtCadProfPerComissao: TCurrEditJul;
    Bt_PagtoDebCredImprime: TJvXPButton;
    Cbx_CadProfSitPrevidencia: TComboBox;
    Label79: TLabel;
    PC_ProfMovtosRH: TPageControl;
    Pan_MovtosRH: TPanel;
    Lb_Obs: TLabel;
    Ts_ProfImpTecBiz: TTabSheet;
    Ts_ProfImpPlanoSaude: TTabSheet;
    Gb_ProfTecBizImpArquivo: TGroupBox;
    Bt_ProfTecBizArquivo: TJvXPButton;
    EdtProfTecBizPastaArquivo: TEdit;
    Bt_ProfTecBizImpArquivo: TJvXPButton;
    Gb_ProfTecBizImpArqSel: TGroupBox;
    Lbx_ProfTecBizImpArqSel: TListBox;
    PC_ProfTecBiz: TPageControl;
    Ts_ProfTecBizImpArquivo: TTabSheet;
    Strg_ProfTecBizImpArquivo: TStringGrid;
    Ts_ProfTecBizImportados: TTabSheet;
    Pan_ProfTecBizConsulta: TPanel;
    Gb_ProfTecBizConsulta: TGroupBox;
    Label76: TLabel;
    DtEdt_ProfTecBizDtaInicio: TcxDateEdit;
    DtEdt_ProfTecBizDtaFim: TcxDateEdit;
    Bt_ProfTecBizSalvaExcel: TJvXPButton;
    Bt_ProfTecBizClipboard: TJvXPButton;
    Bt_ProfTecBizBuscar: TJvXPButton;
    Dbg_ProfTecBizImportados: TDBGrid;
    Gb_ProfPlanoSaudeImpArquivo: TGroupBox;
    Bt_ProfPlanoSaudeArquivo: TJvXPButton;
    EdtProfPlanoSaudePastaArquivo: TEdit;
    Gb_ProfPlanoSaudeImpArqSel: TGroupBox;
    Lbx_ProfPlanoSaudeImpArqSel: TListBox;
    PC_ProfPlanoSaude: TPageControl;
    Ts_ProfPlanoSaudeImpArquivo: TTabSheet;
    Strg_ProfPlanoSaudeImpArquivo: TStringGrid;
    Ts_ProfPlanoSaudeImportados: TTabSheet;
    Pan_ProfPlanoSaudeConsulta: TPanel;
    Gb_ProfPlanoSaudeConsulta: TGroupBox;
    Label80: TLabel;
    DtEdt_ProfPlanoSaudeDtaInicio: TcxDateEdit;
    DtEdt_ProfPlanoSaudeDtaFim: TcxDateEdit;
    Bt_ProfPlanoSaudeSalvaExcel: TJvXPButton;
    Bt_ProfPlanoSaudeClipboard: TJvXPButton;
    Bt_ProfPlanoSaudeBuscar: TJvXPButton;
    Dbg_ProfPlanoSaudeImportados: TDBGrid;
    Bt_ProfPlanoSaudeImpArquivo: TJvXPButton;
    Dbg_Habilidades: TDBGridJul;
    Dbg_Servicos: TDBGridJul;
    ApplicationEventos: TApplicationEvents;
    Pan_ProfOutLookRH: TPanel;
    OutLook_ProfMovtosRH: TJvOutlookBar;
    Ts_ProfINSS: TTabSheet;
    Gb_INSS_PSLocaliza: TGroupBox;
    Label195: TLabel;
    Label197: TLabel;
    Label75: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    EdtINSS_PSCodLoja: TCurrencyEdit;
    Bt_INSS_PSBuscaLoja: TJvXPButton;
    EdtINSS_PSDesLoja: TEdit;
    Bt_INSS_PSBusca: TJvXPButton;
    Cbx_INSS_PSMes: TComboBox;
    EdtINSS_PSAno: TcxSpinEdit;
    DtaEdt_INSS_PSVenc: TcxDateEdit;
    Dbg_ProfINSS: TDBGridJul;
    Ts_ProfTaxaSindicato: TTabSheet;
    Dbg_ProfTaxaSindicato: TDBGridJul;
    Panel22: TPanel;
    Pan_ProfCalcularIT: TPanel;
    Bt_ProfINSSTXSCalcular: TJvXPButton;
    Panel21: TPanel;
    Bt_ProfINSSTXSExcel: TJvXPButton;
    Bt_ProfINSSTXSClipboard: TJvXPButton;
    Bt_MovtosRHRetornar: TJvXPButton;
    Bt_PagtoExcluirPlanilha: TJvXPButton;
    EdtCadProfLocalizar: TEdit;
    Ckb_CadProfLocalizarQualquerLj: TJvXPCheckbox;
    Bt_CadProfLocalizar: TJvXPButton;
    Bt_CadProfVerificaCad: TJvXPButton;
    Ts_ProfBeneficios: TTabSheet;
    PC_Beneficios: TPageControl;
    Ts_BeneficiosManut: TTabSheet;
    Ts_Beneficios: TTabSheet;
    Pan_BenefSolic: TPanel;
    Dbg_Beneficios: TDBGridJul;
    Bt_BenefBuscar: TJvXPButton;
    Label64: TLabel;
    EdtBenefCodLoja: TCurrencyEdit;
    Bt_BenefBuscaLoja: TJvXPButton;
    EdtBenefDesLoja: TEdit;
    Gb_BenefSituacao: TGroupBox;
    Cbx_BenefSituacao: TComboBox;
    Sb_Beneficios: TdxStatusBar;
    Pan_BenefManut: TPanel;
    Label81: TLabel;
    EdtBenefManutCodLoja: TCurrencyEdit;
    Bt_BenefManutBuscaLoja: TJvXPButton;
    EdtBenefManutDesLoja: TEdit;
    Label82: TLabel;
    EdtBenefManutCodProf: TCurrencyEdit;
    Bt_BenefManutBuscaProf: TJvXPButton;
    EdtBenefManutDesProf: TEdit;
    Gb_BenefManutTipo: TGroupBox;
    Rb_BenefManutUmaVez: TRadioButton;
    Rb_BenefManutDiario: TRadioButton;
    Rb_BenefManutSemanal: TRadioButton;
    Rb_BenefManutMensal: TRadioButton;
    Pan_BenefManutDados: TPanel;
    Gb_BenefManutDesc: TGroupBox;
    EdtBenefManutDesc: TEdit;
    Gb_BenefManutPeriodo: TGroupBox;
    Label83: TLabel;
    DtaEdtBenefManutInicio: TcxDateEdit;
    DtaEdtBenefManutFim: TcxDateEdit;
    Gb_BenefManutValor: TGroupBox;
    EdtBenefManutValor: TCurrencyEdit;
    Gb_BenefManutTpValor: TGroupBox;
    Rb_BenefManutVlrIntegral: TJvRadioButton;
    Rb_BenefManutVlrDiaMes: TJvRadioButton;
    Gb_BenefManutPosDia: TGroupBox;
    Cbx_BenefManutPosDiaMes: TComboBox;
    Gb_BenefManutDiaSemana: TGroupBox;
    Cbx_BenefManutDiaSemana: TComboBox;
    Panel23: TPanel;
    Bt_BenefManutSalvar: TJvXPButton;
    Bt_BenefManutAbandonar: TJvXPButton;
    Label84: TLabel;
    Cbx_CadProfServAtivo: TComboBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PC_SalaoChange(Sender: TObject);
    procedure Bt_AlterarClick(Sender: TObject);
    procedure Bt_CadProfAbandonarClick(Sender: TObject);

    // odir

    // DIVERSOS ////////////////////////////////////////////////////////////////
    Procedure ApresCadProfissional(bVisivel: Boolean);

    Procedure FechaTudoSalao;

    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente

    // DBGRID - (ERRO) Acerta Rolagem do Mouse
    Procedure AcertaRolagemDBGid(Sender: TObject);

    Procedure DesabilitaTodasTabSheets(PC: TPageControl);

    ////////////////////////////////////////////////////////////////////////////

    // HABILIDADES /////////////////////////////////////////////////////////////
    Function ConsisteExcluao(sTipo: String): Boolean;
                             // Tipo: (H)abilidade (S)ervico
    ////////////////////////////////////////////////////////////////////////////

    // PROFISSIONAL ////////////////////////////////////////////////////////////
    Procedure DadosProfissional;

    Procedure LiberaIBGE(bLibera: Boolean);
    Procedure ApresentaIBGE(iPosIBGE: Integer);

    Function  ConsisteProfissional: Boolean;
    Function  ConsisteDadosSidicom(bConsisteSIDICOM: Boolean): Boolean;
                                   // bConsisteSIDICOM = Se Consiste Dados do Sisdicom para DML

    Function  AtualizaProfissionalSIDICOM(sDML: String): Boolean;
                                       // sDML: (A)Alteração
                                       //       (I)Inclusão
    ////////////////////////////////////////////////////////////////////////////

    // METAS ///////////////////////////////////////////////////////////////////
    Procedure CriaMetasProfissional;
                             // Tipo: (H)abilidade (S)ervico
    ////////////////////////////////////////////////////////////////////////////

    // INSS-PLANO DE SAUDE-SINDICATO ///////////////////////////////////////////
    Function ProfBuscaDebitos(sTipo: String): Boolean;
                            // sTipo: (I) Contribuiçao INSS
                            //        (S) Taxa Sindicato
                            //        (P) Plano de Saude

    Function  ProfCalculaINSS(sDta: String): Boolean;
    Function  ProfCalculaTaxaSindicato(sDta: String): Boolean;
    ////////////////////////////////////////////////////////////////////////////

    // IMPORTAÇÃO DEBITOS RH ///////////////////////////////////////////////////
    Procedure ProfImportaTecBiz;
    Procedure ProfImportaPlanoSaude;
    ////////////////////////////////////////////////////////////////////////////

    // PLANILHA DE PAGAMENTOS //////////////////////////////////////////////////
    Function  PodeCalcular(Var bProc: Boolean): Boolean; // Verifica se Período para Calculo esta OK
    Function  ProfissionaisCalcular: Boolean;
    Procedure CalculaPeriodoCalculo(sDiaI, sDiaF, sDtaIUC, sDtaFUC: String; var sDtaIC: String; var sDtaFC: String);
                                 // sDiaI  =Dia da Semana de Inicio do Calculo
                                 // sDiaF  =Dia da Semana de Fim do Calculo
                                 // sDtaIUC=Data Inicial do Último Calculo
                                 // sDtaFUC=Data Final do Último Calculo
                                 // sDtaIC =Data Inicial para Calculo (Retorno)
                                 // sDtaFC =Data Final para Calculo (Retorno)
    Function  ProfBuscaVendas: Boolean;
    Function  ProfGeraBeneficios: Boolean;
    Function  ProfApresentaComissoes: Boolean;
    Procedure ProfApresentaComissoesGrid;

    Procedure ProfBuscaDebitosCreditos;
    Procedure ProfApresentaDebCredGrid;
    Procedure ProfSemRecebementos(Var iIndex:Integer);

    Function  ProfPagtoPlanilha(sNumPlan, sCodLoja: String): Boolean;

    Function  ProfPagtoExcluiPlanilha(sCodLoja, sNrPlan, sDesAux, sDtaI, sDtaF: String): Boolean;

    // PLANO DE SAUDE //////////////////////////////////////////////////////////
    Procedure BuscaPlanosSaude(sTp: String=''; sCodPS: String='');
    Procedure PlanoSaudeAlterarProfissionais;
    ////////////////////////////////////////////////////////////////////////////

    // BENEFICIOS //////////////////////////////////////////////////////////////
    Function BeneficiosManut: Boolean;
             // Usado:
             // sgDtaFim para Data de Encerramente/Final
             // sgTipo:='' ou I=Inativar  E=Excluir
    Procedure BeneficiosInicializaComponentes;
    Function  BeneficioConsiste: Boolean;
    Function  BeneficioSalvar: Boolean;
    ////////////////////////////////////////////////////////////////////////////

    // Odir

    procedure EdtCodLojaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_BuscaLojaClick(Sender: TObject);
    procedure EdtCodLojaChange(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
    procedure Ts_HabilidadesShow(Sender: TObject);
    procedure Bt_HabAterarClick(Sender: TObject);
    procedure Bt_HabExcluirClick(Sender: TObject);
    procedure Bt_ServAlterarClick(Sender: TObject);
    procedure Bt_ServExcluirClick(Sender: TObject);
    procedure Bt_HabNovaClick(Sender: TObject);
    procedure Bt_ServIncluirClick(Sender: TObject);
    procedure Bt_ServNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Ckb_CadProfAtivoClick(Sender: TObject);
    procedure Ckb_CadProfAtivoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_CadProfLiberdoClick(Sender: TObject);
    procedure Ckb_CadProfLiberdoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_CadProfDMLClick(Sender: TObject);
    procedure Bt_NovoClick(Sender: TObject);
    procedure Bt_CadProfBuscaCEP_IBGEClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_CadProfLimpaEnderecoClick(Sender: TObject);
    procedure Bt_CadProfBuscaEnd_IBGEClick(Sender: TObject);
    procedure ACBrCEPBuscaEfetuada(Sender: TObject);
    procedure Bt_CadProfBuscaMunicipioClick(Sender: TObject);
    procedure Bt_CadProfBuscaUFClick(Sender: TObject);
    procedure Dbg_ProfissionaisDblClick(Sender: TObject);
    procedure Bt_CadProfBuscaFotoClick(Sender: TObject);
    procedure Bt_CadProfLimpaFotoClick(Sender: TObject);
    procedure Bt_CadProfFoneNovoClick(Sender: TObject);
    procedure Bt_CadProfFoneAlterarClick(Sender: TObject);
    procedure Bt_CadProfFoneExcluirClick(Sender: TObject);
    procedure Bt_CadProfEmailNovoClick(Sender: TObject);
    procedure Bt_CadProfEmailAlterarClick(Sender: TObject);
    procedure Bt_CadProfEmailExcluirClick(Sender: TObject);
    procedure Dbm_CadProfOBSEnter(Sender: TObject);
    procedure Dbm_CadProfOBSExit(Sender: TObject);
    procedure Ckb_CadProfTaxaSindicatoClick(Sender: TObject);
    procedure Ckb_CadProfTaxaSindicatoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_CadProfTaxaNaoSocioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_CadProfTaxaNaoSocioClick(Sender: TObject);
    procedure Dbe_CadProfCodPlanoSaudeExit(Sender: TObject);
    procedure Bt_CadProfBuscaPlanoSaudeClick(Sender: TObject);
    procedure Bt_CadProfInserePlanoSaudeClick(Sender: TObject);
    procedure Bt_CadProfDependenteNovoClick(Sender: TObject);
    procedure Bt_CadProfDependenteAlterarClick(Sender: TObject);
    procedure Bt_CadProfDependenteExcluirClick(Sender: TObject);
    procedure PC_CadProfissionalChange(Sender: TObject);
    procedure PC_CadProfDiversosChange(Sender: TObject);
    procedure EdtDta_CadProfDtaNascExit(Sender: TObject);
    procedure Bt_CadProfHabIncluirClick(Sender: TObject);
    procedure Bt_CadProfHabAlterarClick(Sender: TObject);
    procedure Bt_CadProfHabExcluirClick(Sender: TObject);
    procedure Bt_CadProfServAlterarClick(Sender: TObject);
    procedure EdtDt_CadProfIniContratoExit(Sender: TObject);
    procedure EdtDt_CadProfFimContratoExit(Sender: TObject);
    procedure Dbg_HabilidadesDblClick(Sender: TObject);
    procedure Dbg_ServicosDblClick(Sender: TObject);
    procedure Dbg_CadProfHabDblClick(Sender: TObject);
    procedure Dbg_CadProfServDblClick(Sender: TObject);
    procedure Dbg_CadProfDependentesDblClick(Sender: TObject);
    procedure Dbg_CadProfFonesDblClick(Sender: TObject);
    procedure Dbg_CadProfEmailsDblClick(Sender: TObject);
    procedure Dbm_CadProfRenovacoesDblClick(Sender: TObject);
    procedure Bt_CadProfNovaRenovacaoClick(Sender: TObject);
    procedure Bt_CadProfExcluiRenovacaoClick(Sender: TObject);
    procedure PC_CadProfSidicomChange(Sender: TObject);
    procedure Rb_CadProfSidPercentuaisClick(Sender: TObject);
    procedure Rb_CadProfSidPercentuaisKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCadProfSidCodSupervisorExit(Sender: TObject);
    procedure EdtCadProfSidCodVendedorExit(Sender: TObject);
    procedure Ckb_CadProfSidSuperAtivoClick(Sender: TObject);
    procedure Ckb_CadProfSidSuperAtivoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_CadProfSidExcluiSupervisorClick(Sender: TObject);
    procedure Bt_CadProfSidExcluiVendedorClick(Sender: TObject);
    procedure Bt_CadProfSidBuscaSupervisorClick(Sender: TObject);
    procedure Bt_CadProfSidBuscaVendedorClick(Sender: TObject);
    procedure Cbx_SituacaoClick(Sender: TObject);
    procedure Bt_CadProfLocalizarClick(Sender: TObject);
    procedure Cbx_CadProfTpPessoaExit(Sender: TObject);
    procedure Cbx_CadProfTpPessoaChange(Sender: TObject);
    procedure Bt_LiberaConsistenciasClick(Sender: TObject);
    procedure Ckb_ProfissionaisClick(Sender: TObject);
    procedure Bt_HabServMaximizarClick(Sender: TObject);
    procedure Bt_HabServMinimizarClick(Sender: TObject);
    procedure EdtValesCodLojaExit(Sender: TObject);
    procedure EdtValesCodLojaChange(Sender: TObject);
    procedure EdtValesCodProfChange(Sender: TObject);
    procedure DtEdt_ValesDtInicioPropertiesChange(Sender: TObject);
    procedure Ckb_ValesAbertosClick(Sender: TObject);
    procedure Ckb_ValesFechadosClick(Sender: TObject);
    procedure EdtValesCodProfExit(Sender: TObject);
    procedure Bt_ValesBuscaLojaClick(Sender: TObject);
    procedure Bt_ValesBuscaProfClick(Sender: TObject);
    procedure Ckb_ValesAbertosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_ValesFechadosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ValesFiltroConsultarClick(Sender: TObject);
    procedure Ckb_ValesAtivosClick(Sender: TObject);
    procedure Ckb_ValesInativosClick(Sender: TObject);
    procedure Ckb_ValesInativosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_ValesAtivosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ValesProfDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_ValesAlterarClick(Sender: TObject);
    procedure Bt_ValesNovoClick(Sender: TObject);
    procedure Dbg_ValesProfEnter(Sender: TObject);
    procedure Dbg_ValesProfExit(Sender: TObject);
    procedure EdtValesCodProfEnter(Sender: TObject);
    procedure EdtValesCodLojaEnter(Sender: TObject);
    procedure Bt_ValesExcluirClick(Sender: TObject);
    procedure EdtMetasAnoChange(Sender: TObject);
    procedure EdtMetasCodLojaChange(Sender: TObject);
    procedure EdtMetasCodLojaExit(Sender: TObject);
    procedure Bt_MetasAlterarClick(Sender: TObject);
    procedure Bt_MetasAbandonarClick(Sender: TObject);
    procedure Bt_MetasSalvarClick(Sender: TObject);
    procedure Bt_MetasBuscaLojaClick(Sender: TObject);
    procedure Dbe_MetasProfCom12Exit(Sender: TObject);
    procedure Dbe_CadProfPerComissaoChange(Sender: TObject);
    procedure Dbe_CadProfPerComissaoExit(Sender: TObject);
    procedure Dbe_CadProfPerComissaoSupervisorExit(Sender: TObject);
    procedure Bt_CadProfServAlterarTodosClick(Sender: TObject);
    procedure Bt_PagtoFecharClick(Sender: TObject);
    procedure PC_PagtoPlanilhaChange(Sender: TObject);
    procedure EdtPagtoCodLojaChange(Sender: TObject);
    procedure EdtPagtoCodLojaExit(Sender: TObject);
    procedure Dbg_PagtoProfissionaisDblClick(Sender: TObject);
    procedure Dbg_PagtoProfissionaisDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_PagtoMarcaTodosClick(Sender: TObject);
    procedure Dbg_PagtoProfissionaisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_PagtoAlteraPeriodoClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_PagtoVendasClick(Sender: TObject);
    procedure Ckb_PagtoMetasClick(Sender: TObject);
    procedure Dbg_PagtosVendasColEnter(Sender: TObject);
    procedure Dbg_PagtosVendasColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure Dbg_PagtosVendasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_PagtosVendasDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure Dbg_PagtosVendasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_PagtoVendasSalvaExcelClick(Sender: TObject);
    procedure Bt_PagtoVendasVoltarClick(Sender: TObject);
    procedure Bt_PagtoVendasClipboardClick(Sender: TObject);
    procedure Rb_PagtoVendasSinteticoClick(Sender: TObject);
    procedure Ckb_PagtoMetasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Rb_PagtoVendasSinteticoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_ProfissionaisKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_VendedoresKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ProfTecBizImpArquivoClick(Sender: TObject);
    procedure Bt_ProfTecBizArquivoClick(Sender: TObject);
    procedure Strg_ProfTecBizImpArquivoDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure Dbg_PagtosDebCredColEnter(Sender: TObject);
    procedure Dbg_PagtosDebCredColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure Dbg_PagtosDebCredDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure Dbg_PagtosDebCredKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Rb_PagtoDebCredSinteticoClick(Sender: TObject);
    procedure Rb_PagtoDebCredSinteticoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_PagtosDebCredDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_FecharClick(Sender: TObject);
    procedure Ckb_CadProfINSSCobrarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_CadProfINSSCobrarClick(Sender: TObject);
    procedure Gb_CadProfINSSExit(Sender: TObject);
    procedure EdtINSS_PSCodLojaChange(Sender: TObject);
    procedure EdtINSS_PSCodLojaExit(Sender: TObject);
    procedure Bt_INSS_PSBuscaLojaClick(Sender: TObject);
    procedure Bt_INSS_PSBuscaClick(Sender: TObject);
    procedure Dbg_ProfINSSDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Bt_ProfINSSTXSCalcularClick(Sender: TObject);
    procedure Dbg_ProfissionaisDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Ts_PagtoVendasShow(Sender: TObject);
    procedure Ts_PagtoDebCredShow(Sender: TObject);
    procedure Bt_PagtoGeraPlanilhaClick(Sender: TObject);
    procedure Rb_PagtoPlanTodosClick(Sender: TObject);
    procedure Rb_PagtoPlanTodosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_PagtoPlanilhaColEnter(Sender: TObject);
    procedure Dbg_PagtoPlanilhaColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure Dbg_PagtoPlanilhaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_PagtoPlanilhaDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure Dbg_PagtoPlanilhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPagtoCodPlanExit(Sender: TObject);
    procedure Bt_PagtoBuscaPlanClick(Sender: TObject);
    procedure Dbe_CadProfNumBancoExit(Sender: TObject);
    procedure Ts_CadProfissionalEnter(Sender: TObject);
    procedure Dbe_CadProfNumAgenciaExit(Sender: TObject);
    procedure Dbe_CadProfNomeBancoExit(Sender: TObject);
    procedure Dbe_CadProfNumBancoEnter(Sender: TObject);
    procedure Cbx_INSS_PSMesChange(Sender: TObject);
    procedure Cbx_INSS_PSMesEnter(Sender: TObject);
    procedure Bt_INSS_PSFecharClick(Sender: TObject);
    procedure Ts_CadProfContratoShow(Sender: TObject);
    procedure Dbm_CadProfRenovacoesChange(Sender: TObject);
    procedure Bt_PagtoBuscaLojaClick(Sender: TObject);
    procedure Dbg_PlanoSaudeDblClick(Sender: TObject);
    procedure Dbg_PlanoSaudeDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_PlanoSaudeNovoClick(Sender: TObject);
    procedure Bt_PlanoSaudeFecharClick(Sender: TObject);
    procedure Bt_PlanoSaudeExcluirClick(Sender: TObject);
    procedure Dbe_CadProfNumINSSExit(Sender: TObject);
    procedure Dbe_CadProfVlrTaxaNaoSociosExit(Sender: TObject);
    procedure Dbg_ProfTaxaSindicatoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbe_CadProfVlrSindicatoExit(Sender: TObject);
    procedure Ckb_CadProfLocalizarQualquerLjClick(Sender: TObject);
    procedure Ckb_CadProfLocalizarQualquerLjKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Dbg_CadProfServKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PC_ProfTecBizChange(Sender: TObject);
    procedure Bt_ProfTecBizBuscarClick(Sender: TObject);
    procedure Bt_PagtoDebCredImprimeClick(Sender: TObject);
    procedure Cbx_CadProfSitPrevidenciaChange(Sender: TObject);
    procedure Cbx_CadProfSitPrevidenciaKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Bt_ProfPlanoSaudeArquivoClick(Sender: TObject);
    procedure Bt_ProfPlanoSaudeImpArquivoClick(Sender: TObject);
    procedure Strg_ProfPlanoSaudeImpArquivoDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure PC_ProfMovtosRHChange(Sender: TObject);
    procedure DtEdt_ProfTecBizDtaInicioPropertiesChange(Sender: TObject);
    procedure PC_ProfPlanoSaudeChange(Sender: TObject);
    procedure DtEdt_ProfPlanoSaudeDtaInicioPropertiesChange(
      Sender: TObject);
    procedure Bt_ProfPlanoSaudeBuscarClick(Sender: TObject);
    procedure Ts_PagtoPlanilhaShow(Sender: TObject);
    procedure ApplicationEventosMessage(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_ProfissionaisEnter(Sender: TObject);
    procedure Dbg_ProfPlanoSaudeImportadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ProfTecBizImportadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure OutLook_ProfMovtosRHClick(Sender: TObject);
    procedure OutLook_ProfMovtosRHButtonClick(Sender: TObject;
      Index: Integer);
    procedure OutLook_ProfMovtosRHPages0Buttons0Click(Sender: TObject);
    procedure Bt_MovtosRHRetornarClick(Sender: TObject);
    procedure OutLook_ProfMovtosRHPages0Buttons1Click(Sender: TObject);
    procedure OutLook_ProfMovtosRHPages1Buttons0Click(Sender: TObject);
    procedure OutLook_ProfMovtosRHPages1Buttons1Click(Sender: TObject);
    procedure Bt_PagtoExcluirPlanilhaClick(Sender: TObject);
    procedure Bt_CadProfVerificaCadClick(Sender: TObject);
    procedure OutLook_ProfMovtosRHPages2Buttons0Click(Sender: TObject);
    procedure OutLook_ProfMovtosRHPages2Buttons1Click(Sender: TObject);
    procedure PC_BeneficiosChange(Sender: TObject);
    procedure Bt_BenefBuscarClick(Sender: TObject);
    procedure Dbg_BeneficiosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure EdtBenefCodLojaExit(Sender: TObject);
    procedure Bt_BenefBuscaLojaClick(Sender: TObject);
    procedure Dbg_BeneficiosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Cbx_BenefSituacaoChange(Sender: TObject);
    procedure EdtBenefManutCodLojaExit(Sender: TObject);
    procedure EdtBenefManutCodProfExit(Sender: TObject);
    procedure Bt_BenefManutBuscaLojaClick(Sender: TObject);
    procedure Bt_BenefManutBuscaProfClick(Sender: TObject);
    procedure Rb_BenefManutUmaVezClick(Sender: TObject);
    procedure Rb_BenefManutUmaVezKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_BenefManutSalvarClick(Sender: TObject);
    procedure Bt_BenefManutAbandonarClick(Sender: TObject);
    procedure Bt_BenefManutAbandonarExit(Sender: TObject);
    procedure Rb_BenefManutVlrIntegralClick(Sender: TObject);
    procedure DtaEdtBenefManutInicioExit(Sender: TObject);
    procedure Rb_BenefManutVlrIntegralKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtBenefCodLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtBenefManutCodLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtBenefManutCodProfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPagtoCodLojaEnter(Sender: TObject);
    procedure Dbg_CadProfServDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Cbx_CadProfServAtivoClick(Sender: TObject);

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

type
   THackDBGridSalao = class(TDBGrid);

var
  FrmSalao: TFrmSalao;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;

  bgDrawColumnCell, // Se já Processou DrawColumnCell no Dbg_Profissionais
  bgPeriodoForcado,
  bgCalculoIndividual,
  bgSairSalao,
  bgCFPLiberado, bgIncluiSIDICOM,
  bgIncluidoSIDICOM,      // Se Incluido no Sidicom
  bgConsultaIPS: Boolean; // Se é Consulta de 'I' Contribuição INSS
                          //                  'P' Plano de Saude
                          //                  'S' Taxa Sindicato

  IBQ_Loja  : TIBQuery;

  // Calculo de Comissão
  sgProfComissao: String; // Clausula IN de Codigos de Profissionais e Periodos
  sgProfissionais: String; // Clausula IN de Codigos de Profissionais
  cgPerComisSuper: Currency;
  sgCodSuperVisor: String;

  cgTotVendas: Currency;

  sgPeriodoIni, sgPeriodoFim,
  sgDtaIniSemana, sgDtaFimSemana: String; // Usado quando a Data de Inicio do Ultimo Calculo for
                                          // menor que a do inicio da Semanda de Calculo

  iWidthPanel, iTopPanel, iHeightPanel: Integer;

  sgMes, sgMesVenc, sgAnoVenc, sgMesCompetencia, sgAnoCompetencia: String;
  sgINSS_PS: String; // O Que Calcular (I)INSS ou (P)Plano de Saude
  bgDtaInicioContrato: Boolean; // Considerar Profissional SEM data de inicio de contrato para o Calculo de INSS ?

  gCDS_V1: TClientDataSet;

implementation

uses DK_Procs1, UFrmBelShop, UDMSalao, UDMBelShop, UPesquisa, UFrmSolicitacoes,
     UFrmPeriodoApropriacao, SysConst, Math, UFrmSalaoPercServico,
     cxProgressBar, UDMRelatorio, UFrmSelectEmpProcessamento, Masks;

//Math, Types, RTLConsts;

{$R *.dfm}

// Odir

// BENEFICIOS - Salva Beneficio ////////////////////////////////////////////////
Function TFrmSalao.BeneficioSalvar: Boolean;
Var
  MySql: String;
Begin
  Result:=True;

  OdirPanApres.Caption:='AGUARDE !! Salvando Benefício...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
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

    MySql:=' SELECT COALESCE(MAX(b.num_docto)+1 ,1) Num'+
           ' FROM PS_BENEFICIOS_PESSOAS b';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sNumDoc:=DMBelShop.CDS_BuscaRapida.FieldByName('Num').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    MySql:=' INSERT INTO PS_BENEFICIOS_PESSOAS ('+
           ' TP_PESSOA, COD_LOJA, COD_PESSOA, NUM_DOCTO, DES_DOCTO, VLR_DOCTO,'+
           ' USU_INCLUI, DTA_INI_BENEFICIO, DTA_FIM_BENEFICIO';

           // IND_UMA_VEZ -------------------------------------------
           If Rb_BenefManutUmaVez.Checked Then MySql:=MySql+', IND_UMA_VEZ';

           // IND_DIARIAMENTE ---------------------------------------
           If Rb_BenefManutDiario.Checked Then MySql:=MySql+', IND_DIARIAMENTE';

           // IND_SEMANAMENTE / TIP_VLR_APAGAR ----------------------
           If Rb_BenefManutSemanal.Checked Then MySql:=MySql+', IND_SEMANAMENTE, TIP_VLR_APAGAR';

           // IND_MENSALMENTE / DES_POSICAO_DIA ---------------------
           If Rb_BenefManutMensal.Checked Then MySql:=MySql+', IND_MENSALMENTE, DES_POSICAO_DIA';

           // Dias da Semana - IND_SEMANAMENTE / IND_MENSALMENTE ----
           If (Rb_BenefManutSemanal.Checked) Or (Rb_BenefManutMensal.Checked) Then
           Begin
             If Cbx_BenefManutDiaSemana.ItemIndex=0 Then MySql:=MySql+', IND_DIA_SEG';
             If Cbx_BenefManutDiaSemana.ItemIndex=1 Then MySql:=MySql+', IND_DIA_TER';
             If Cbx_BenefManutDiaSemana.ItemIndex=2 Then MySql:=MySql+', IND_DIA_QUA';
             If Cbx_BenefManutDiaSemana.ItemIndex=3 Then MySql:=MySql+', IND_DIA_QUI';
             If Cbx_BenefManutDiaSemana.ItemIndex=4 Then MySql:=MySql+', IND_DIA_SEX';
           End; // If (Rb_BenefManutSemanal.Checked) Or (Rb_BenefManutMensal.Checked) Then

    MySql:=
     MySql+')'+
           ' VALUES ('+
           ' 1, '+ // TP_PESSOA,
           QuotedStr(FormatFloat('00',EdtBenefManutCodLoja.AsInteger))+', '+ // COD_LOJA
           IntToStr(EdtBenefManutCodProf.AsInteger)+', '+ // COD_PESSOA
           sNumDoc+', '+ // NUM_DOCTO
           QuotedStr(EdtBenefManutDesc.Text)+', '+ // DES_DOCTO
           QuotedStr(VarToStr(EdtBenefManutValor.Value))+', '+ // VLR_DOCTO
           QuotedStr(Cod_Usuario)+', '+ // USU_INCLUI
           QuotedStr(DateToStr(DtaEdtBenefManutInicio.Date)); // DTA_INI_BENEFICIO

           // DTA_FIM_BENEFICIO
           If (DateToStr(DtaEdtBenefManutFim.Date)='00.00.0000') Or (DateToStr(DtaEdtBenefManutFim.Date)='00/00/0000') Then
            MySql:=MySql+', NULL'
           Else
           MySql:=MySql+', '+QuotedStr(DateToStr(DtaEdtBenefManutFim.Date));

           // IND_UMA_VEZ -------------------------------------------
           If Rb_BenefManutUmaVez.Checked Then
            MySql:=MySql+', ''SIM''';

           // IND_DIARIAMENTE ---------------------------------------
           If Rb_BenefManutDiario.Checked Then
            MySql:=MySql+', ''SIM''';

           // IND_SEMANAMENTE / TIP_VLR_APAGAR ----------------------
           If Rb_BenefManutSemanal.Checked Then
           Begin
             MySql:=MySql+', ''SIM''';

             If Rb_BenefManutVlrIntegral.Checked Then
              MySql:=MySql+', 0';

             If Rb_BenefManutVlrDiaMes.Checked Then
              MySql:=MySql+', 1';
           End; // If Rb_BenefManutSemanal.Checked Then

           // IND_MENSALMENTE / DES_POSICAO_DIA ---------------------
           If Rb_BenefManutMensal.Checked Then
            MySql:=MySql+', ''SIM'', '+QuotedStr(Cbx_BenefManutPosDiaMes.Text);

           // Dias da Semana - IND_SEMANAMENTE / IND_MENSALMENTE ----
           If (Rb_BenefManutSemanal.Checked) Or (Rb_BenefManutMensal.Checked) Then
            MySql:=MySql+', ''SIM''';

    MySql:=
     MySql+')';
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

      Result:=False;
      
      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try

End;// BENEFICIOS - Salva Beneficio ////////////////////////////////////////////

// BENEFICIOS - Consiste Beneficio /////////////////////////////////////////////
Function TFrmSalao.BeneficioConsiste: Boolean;
Begin
  Result:=False;

  If Trim(EdtBenefManutDesc.Text)='' Then
  Begin
    msg('Favor Informar a Descrição !!','A');
    EdtBenefManutDesc.SetFocus;
    Exit;
  End;

  // Periodo
  Try
     StrToDate(DtaEdtBenefManutInicio.Text);
  Except
    Begin
      msg('Data de INÍCIO do Período'+cr+cr+'de Pagto é Inválida !!','A');
      DtaEdtBenefManutInicio.SetFocus;
      Exit;
    End;
  End;

  If Trim(DtaEdtBenefManutFim.Text)<>'' Then
  Begin
    If DtaEdtBenefManutFim.Date<DtaEdtBenefManutInicio.Date Then
    Begin
      msg('Data do FIM do Período'+cr+cr+'de Pagto é Inválida !!','A');
      DtaEdtBenefManutFim.SetFocus;
      Exit;
    End;
  End;

  If EdtBenefManutValor.Value=0.00 Then
  Begin
    msg('Favor Informar o'+cr+cr+'Valor do Benefício !!','A');
    EdtBenefManutValor.SetFocus;
    Exit;
  End;

  If EdtBenefManutValor.Value<0 Then
  Begin
    msg('Valor do Benefício Inválido !!','A');
    EdtBenefManutValor.SetFocus;
    Exit;
  End;

  If Gb_BenefManutTpValor.Visible Then
  Begin
    If (not Rb_BenefManutVlrIntegral.Checked) and (not Rb_BenefManutVlrDiaMes.Checked) Then
    Begin
      msg('Favor Informar o'+cr+cr+'Tipo do Valor a Pagar !!','A');
      Rb_BenefManutVlrIntegral.SetFocus;
      Exit;
    End; // If (not Rb_BenefManutVlrIntegral.Checked) and (not Rb_BenefManutVlrDiaMes.Checked) Then
  End; // If Gb_BenefManutTpValor.Visible Then

  If Gb_BenefManutPosDia.Visible Then
  Begin
    If Cbx_BenefManutPosDiaMes.ItemIndex<0 Then
    Begin
      msg('Favor Informar Posição Dia no Mês !!','A');
      Cbx_BenefManutPosDiaMes.SetFocus;
      Exit;
    End; // If Cbx_BenefManutPosDiaMes.ItemIndex<0 Then
  End; // If Gb_BenefManutPosDia.Visible Then

  If Gb_BenefManutDiaSemana.Visible Then
  Begin
    If Cbx_BenefManutDiaSemana.ItemIndex<0 Then
    Begin
      msg('Favor Informar o Dia da Semana !!','A');
      Cbx_BenefManutDiaSemana.SetFocus;
      Exit;
    End; // If Cbx_BenefManutDiaSemana.ItemIndex<0 Then
  End; // If Gb_BenefManutDiaSemana.Visible Then

  Result:=True;
End; // BENEFICIOS - Consiste Beneficio ////////////////////////////////////////

// BENEFICIOS - Inicializa Componentes /////////////////////////////////////////
Procedure TFrmSalao.BeneficiosInicializaComponentes;
Begin
  Gb_BenefManutTipo.Enabled:=False;
  Rb_BenefManutUmaVez.Checked:=False;
  Rb_BenefManutDiario.Checked:=False;
  Rb_BenefManutSemanal.Checked:=False;
  Rb_BenefManutMensal.Checked:=False;
  Rb_BenefManutUmaVezClick(Self);

  Pan_BenefManutDados.Visible:=False;
  EdtBenefManutDesc.Clear;
  DtaEdtBenefManutInicio.Clear;
  DtaEdtBenefManutFim.Clear;
  EdtBenefManutValor.Value:=0;

  Rb_BenefManutVlrIntegral.Checked:=False;
  Rb_BenefManutVlrDiaMes.Checked:=False;
  Rb_BenefManutVlrIntegralClick(Self);

  Cbx_BenefManutPosDiaMes.ItemIndex:=-1;
  Cbx_BenefManutDiaSemana.ItemIndex:=-1;

  // Posição Padrão
  Gb_BenefManutValor.Left:=56;
  DtaEdtBenefManutFim.Enabled:=True;
  Gb_BenefManutTpValor.Left:=185;
  Gb_BenefManutTpValor.Visible:=True;
  Gb_BenefManutPosDia.Left:=117;
  Gb_BenefManutPosDia.Visible:=True;
  Gb_BenefManutDiaSemana.Left:=256;
  Gb_BenefManutDiaSemana.Visible:=True;
End; // BENEFICIOS - Inicializa Componentes ////////////////////////////////////

// BENEFICIOS - Manutencao de Beneficios ///////////////////////////////////////
Function TFrmSalao.BeneficiosManut: Boolean;
Var
  MySql: String;
  bAlt_Ult_Geracao: Boolean;
Begin
  // Usa
  // sgDtaFim para Data de Encerramente/Final
  // sgTipo:='' ou I=Inativar  E=Excluir

  Result:=True;
  bAlt_Ult_Geracao:=False;
  sCodFilial:=Copy(DMSalao.CDS_BeneficiosCOD_LOJA.AsString,5,2);

  OdirPanApres.Caption:='AGUARDE !! Atualizando Benefício';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
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

    If sgDtaFim='(Sem Final)' Then
    Begin
      // Atualiza Beneficio Sem Final = Null ===================================
      MySql:=' UPDATE PS_BENEFICIOS_PESSOAS b'+
             ' SET b.dta_fim_beneficio=NULL'+
             ', b.usu_altera='+QuotedStr(Cod_Usuario)+
             ', b.dta_altera= current_timestamp'+

             ' WHERE b.cod_loja='+QuotedStr(sCodFilial)+
             ' AND   b.cod_pessoa='+DMSalao.CDS_BeneficiosCOD_PROF.AsString+
             ' AND   b.num_docto='+DMSalao.CDS_BeneficiosNUM_DOCTO.AsString;
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End; // If sgDtaFim='(Sem Final)' Then

    If sgDtaFim<>'(Sem Final)' Then
    Begin
      // Exclui lançamento Gerados Após a Data de Final do Benefício ===========
      If Trim(DMSalao.CDS_BeneficiosDTA_ULT_GERACAO.AsString)<>'' Then
      Begin
        If DMSalao.CDS_BeneficiosDTA_ULT_GERACAO.AsDateTime>StrToDateTime(f_Troca('/','.',f_Troca('-','.',sgDtaFim))) Then
        Begin
          bAlt_Ult_Geracao:=True;

          MySql:=' DELETE FROM PS_VALES_PESSOAS v'+
                 ' WHERE v.vlr_pago=0'+
                 ' AND   v.cod_loja='+QuotedStr(sCodFilial)+
                 ' AND   v.cod_pessoa='+DMSalao.CDS_BeneficiosCOD_PROF.AsString+
                 ' AND   v.ind_debcred='+QuotedStr('B')+
                 ' AND   v.num_docto='+DMSalao.CDS_BeneficiosNUM_DOCTO.AsString+
                 ' AND   v.dta_vencimento>'+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaFim)));
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End; // If DMSalao.CDS_BeneficiosDTA_ULT_GERACAO.AsDateTime>StrToDateTime(sgDtaFim) Then
      End; // If Trim(DMSalao.CDS_BeneficiosDTA_ULT_GERACAO.AsString)<>'' Then

      // Atualiza Beneficio ====================================================
      If sgTipo<>'E' Then // <> Exclusao
      Begin
        MySql:=' UPDATE PS_BENEFICIOS_PESSOAS b'+
               ' SET b.dta_fim_beneficio='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaFim)))+
               ', b.usu_altera='+QuotedStr(Cod_Usuario)+
               ', b.dta_altera= current_timestamp';

               if bAlt_Ult_Geracao Then
                MySql:=
                 MySql+', b.dta_ult_geracao='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaFim)));

               If sgTipo='I' Then
                MySql:=
                 MySql+', b.ind_ativo='+QuotedStr('N');

        MySql:=
         MySql+' WHERE b.cod_loja='+QuotedStr(sCodFilial)+
               ' AND   b.cod_pessoa='+DMSalao.CDS_BeneficiosCOD_PROF.AsString+
               ' AND   b.num_docto='+DMSalao.CDS_BeneficiosNUM_DOCTO.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If sgTipo<>'E' Then // <> Exclusao

      // Exclui Beneficio ======================================================
      If sgTipo='E' Then // <> Exclusao
      Begin
        MySql:=' DELETE FROM PS_BENEFICIOS_PESSOAS b'+
               ' WHERE b.cod_loja='+QuotedStr(sCodFilial)+
               ' AND   b.cod_pessoa='+DMSalao.CDS_BeneficiosCOD_PROF.AsString+
               ' AND   b.num_docto='+DMSalao.CDS_BeneficiosNUM_DOCTO.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If sgTipo<>'E' Then // <> Exclusao
    End; // If sgDtaFim<>'(Sem Final)' Then

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

      Result:=False;

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try

End; // BENEFICIOS - Manutencao de Beneficios //////////////////////////////////

// DIVERSOS - Desabilita Todas as TabSheet de um PageControl >>>>>>>>>>>>>>>>>>>
Procedure TFrmSalao.DesabilitaTodasTabSheets(PC: TPageControl);
Var
  i: Integer;
Begin
  // Desabilita TabSheets ======================================================
  For i:=0 to FrmSalao.ComponentCount-1 do
  Begin
    If FrmSalao.Components[i] is TTabSheet Then
     If (FrmSalao.Components[i] as TTabSheet).Parent=PC Then
     (FrmSalao.Components[i] as TTabSheet).TabVisible:=False;
  End; // For i:=0 to FrmSalao.ComponentCount-1 do

  // Desabilita Botoes de Calculo ==============================================
  Bt_ProfINSSTXSCalcular.Visible:=False;
  Bt_ProfINSSTXSExcel.Visible:=False;
  Bt_ProfINSSTXSClipboard.Visible:=False;

  Bt_MovtosRHRetornar.Visible:=True;
  Bt_Fechar.Visible:=False;

End; // DIVERSOS - Desabilita Todas as TabSheet de um PageControl >>>>>>>>>>>>>>

// DBGRID - (ERRO) Acerta Rolagem do Mouse >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSalao.AcertaRolagemDBGid(Sender: TObject);
Var
 bDBGrid: Boolean;
Begin
  bDBGrid:=False;
  If (Sender is TDBGrid) Then
  Begin
    bDBGrid:=True;
    ApplicationEventos.OnActivate:=(Sender as TDBGrid).OnEnter;
  End;

  If (Sender is TDBGridJul) Then
  Begin
    bDBGrid:=True;
    ApplicationEventos.OnActivate:=(Sender as TDBGridJul).OnEnter;
  End;

  If bDBGrid Then
  Begin
    Application.OnMessage := ApplicationEventosMessage;
    ApplicationEventos.Activate;
  End;

End; // DBGRID - (ERRO) Acerta Rolagem do Mouse >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// PLANILHA DE PAGAMENTOS - Verifica se Período para Calculo esta OK ///////////
Function TFrmSalao.PodeCalcular(Var bProc: Boolean): Boolean;
Var
  MySql: String;
  dDtaIn, dDtaFi, dDtaI, dDtaF: TDate;
  sNomeDiaI, sNomeDiaF: String;
  b: Boolean;
  sPeriodo: String;
begin
  Result:=False;
  sgMensagem:='';
  bProc:=False;

  DMSalao.CDS_V_PagtoProf.DisableControls;
  DMSalao.CDS_V_PagtoProf.First;
  While Not DMSalao.CDS_V_PagtoProf.Eof do
  Begin
    If ((DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsDateTime+7=DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsDateTime) And
        (DMSalao.CDS_V_PagtoProfFIM_ULT_CALCULO.AsDateTime+7=DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsDateTime)) And
       (Trim(DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString)<>'') Then
    Begin
      DMSalao.CDS_V_PagtoProf.EnableControls;
      DMSalao.CDS_V_PagtoProf.First;
      Result:=True;
      Exit;
    End;

    DMSalao.CDS_V_PagtoProf.Next;
  End;
  DMSalao.CDS_V_PagtoProf.EnableControls;
  DMSalao.CDS_V_PagtoProf.First;

  MySql:=' SELECT p.dia_ini_comissao_prof, p.dia_fim_comissao_prof'+
         ' FROM parametros p';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sNomeDiaI:=AnsiUpperCase(DMBelShop.CDS_BuscaRapida.FieldByName('dia_ini_comissao_prof').AsString);
  sNomeDiaF:=AnsiUpperCase(DMBelShop.CDS_BuscaRapida.FieldByName('dia_fim_comissao_prof').AsString);
  DMBelShop.CDS_BuscaRapida.Close;

  // Verifica Periodo para Calculo =============================================
  dDtaFi:=DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor); //StrToDateTime('06/10/2015');
  dDtaFi:=dDtaFi-1;
  b:=True;
  While b do
  Begin
    If AnsiUpperCase(DiaSemanaNome(dDtaFi))=sNomeDiaF Then
     Break;

    dDtaFi:=dDtaFi-1;
  End; // While AnsiUpperCase(DiaSemanaNome(dDtaFi))=sNomeDiaF Then
  dDtaIn:=dDtaFi-6;
  sgDtaI:=DateToStr(dDtaIn);
  sgDtaF:=DateToStr(dDtaFi);

   If (StrToDate(DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString)<>StrToDate(DateToStr(dDtaIn))) Or
      (StrToDate(DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString)<>StrToDate(DateToStr(dDtaFi))) Then
   Begin
     sgMensagem:=sgDtaI+' a '+sgDtaF;
   End;

  // Verifica Se Existe algum Periodo Errado para Calculo ======================
  sgMensagem:=sgDtaI+' a '+sgDtaF;

  DMSalao.CDS_V_PagtoProf.DisableControls;
  DMSalao.CDS_V_PagtoProf.First;
  While Not DMSalao.CDS_V_PagtoProf.Eof do
  Begin
    dDtaI:=dDtaIn;
    dDtaF:=dDtaFi;

    If ((StrToDate(DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString)<>StrToDate(DateToStr(dDtaI))) Or
        (StrToDate(DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString)<>StrToDate(DateToStr(dDtaF)))) And
       (Trim(DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString)<>'') Then
    Begin
      If StrToDate(DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString)<StrToDate(DateToStr(dDtaI)) Then
      Begin
        dDtaI:=dDtaI-7;
        dDtaF:=dDtaF-7;

        If (StrToDate(DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString)=StrToDate(DateToStr(dDtaI))) And
           (StrToDate(DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString)=StrToDate(DateToStr(dDtaF))) And
           (Trim(sPeriodo)='') Then
        Begin
          sgMensagem:='';
          Break;
          Exit;
        end;

        sPeriodo:=DateToStr(dDtaI)+' a '+DateToStr(dDtaF);

        While b do
        Begin
        sgAnoCompetencia:=DateToStr(dDtaI);
          If DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString=DateToStr(dDtaI) Then
          Begin
            Break;
          End;

          If StrToDate(DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString)<StrToDate(DateToStr(dDtaI)) Then
          Begin
            If Not AnsiContainsStr(sgMensagem, sPeriodo) Then
             sgMensagem:=sPeriodo+cr+sgMensagem;

            dDtaI:=dDtaI-7;
            dDtaF:=dDtaF-7;
            sPeriodo:=DateToStr(dDtaI)+' a '+DateToStr(dDtaF);
          End;

          If StrToDate(DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString)>StrToDate(DateToStr(dDtaI)) Then
          Begin
            Break;
          End;                                                          
        End; // While b do
      End; // If DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsDateTime<dDtaI Then
    End; // If (DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsDateTime<>dDtaI) Or (DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsDateTime<>dDtaF) Then

    If (StrToDate(DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString)=StrToDate(sgDtaI)) And
       (StrToDate(DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString)=StrToDate(sgDtaF)) And
       (Trim(DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString)<>'') Then
     bProc:=True;

    DMSalao.CDS_V_PagtoProf.Next;

  End; // While Not DMSalao.CDS_V_PagtoProf.Eof do
  DMSalao.CDS_V_PagtoProf.EnableControls;
  DMSalao.CDS_V_PagtoProf.First;

  If (Trim(sgMensagem)='') Or (Trim(sgMensagem)=sgDtaI+' a '+sgDtaF) Then
   Result:=True;

End; // PLANILHA DE PAGAMENTOS - Verifica se Período para Calculo esta OK //////

// PLANO DE SAUDE - Alterar Valor dos Planos de Saude dos Profissionais ////////
Procedure TFrmSalao.PlanoSaudeAlterarProfissionais;
Var
  MySql: String;
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

    FrmBelShop.MontaProgressBar(True, FrmSalao);
    pgProgBar.Properties.Max:=DMSalao.CDS_V_ManutPlSaude.RecordCount;
    pgProgBar.Position:=0;

    DMSalao.CDS_V_ManutPlSaude.First;
    DMSalao.CDS_V_ManutPlSaude.DisableControls;
    While Not DMSalao.CDS_V_ManutPlSaude.Eof do
    Begin
      pgProgBar.Position:=DMSalao.CDS_V_ManutPlSaude.RecNo;


      If DMSalao.CDS_V_ManutPlSaudeAlterar.AsString='SIM' Then
      Begin
        MySql:=' SELECT pf.cod_loja, pf.cod_profissional, pf.vlr_plano_saude'+
               ' FROM SAL_PROFISSIONAIS pf'+
               ' WHERE pf.tip_pessoa='+QuotedStr('P')+
               ' AND   pf.ind_Ativo='+QuotedStr('SIM')+
               ' AND   pf.cod_plano_saude='+DMSalao.CDS_V_ManutPlSaudeCod_Plano.AsString;
        DMBelShop.CDS_Busca.Close;
        DMBelShop.SDS_Busca.CommandText:=MySql;
        DMBelShop.CDS_Busca.Open;

        While Not DMBelShop.CDS_Busca.Eof do
        Begin
          // Altera Plano de Saude do Profissional =============================
          If DMBelShop.CDS_Busca.FieldByName('vlr_plano_saude').AsCurrency<>DMSalao.CDS_V_ManutPlSaudeVlr_Titular.AsCurrency Then
          Begin
            MySql:=' UPDATE SAL_PROFISSIONAIS pf'+
                   ' SET pf.vlr_plano_saude='+QuotedStr(f_Troca(',','.',DMSalao.CDS_V_ManutPlSaudeVlr_Titular.AsString))+
                   ' WHERE pf.cod_profissional='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('cod_profissional').AsString)+
                   ' AND   pf.cod_plano_saude='+QuotedStr(DMSalao.CDS_V_ManutPlSaudeCod_Plano.AsString)+
                   ' AND   pf.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString);
            DMBelShop.SQLC.Execute(MySql,nil,nil);
          End; // If DMBelShop.CDS_Busca.FieldByName('vlr_plano_saude').AsCurrency<>DMSalao.CDS_V_ManutPlSaudeVlr_Titular.AsCurrency Then

          // Altera Plano de Saude dos Dependentes =============================
          MySql:=' SELECT dp.num_seq'+
                 ' FROM PS_DEPENDENTES_PS dp'+
                 ' WHERE dp.tp_pessoa=1'+
                 ' AND   dp.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
                 ' AND   dp.cod_pessoa='+DMBelShop.CDS_Busca.FieldByName('cod_profissional').AsString;
          DMBelShop.CDS_BuscaRapida.Close;
          DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
          DMBelShop.CDS_BuscaRapida.Open;

          While Not DMBelShop.CDS_BuscaRapida.Eof do
          Begin
            MySql:=' UPDATE PS_DEPENDENTES_PS dp'+
                   ' SET dp.vlr_plano_saude='+QuotedStr(f_Troca(',','.',DMSalao.CDS_V_ManutPlSaudeVlr_Dependente.AsString))+
                   ' WHERE dp.Num_Seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString;
            DMBelShop.SQLC.Execute(MySql,nil,nil);

            DMBelShop.CDS_BuscaRapida.Next;
          End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
          DMBelShop.CDS_BuscaRapida.Close;

          DMBelShop.CDS_Busca.Next;
        End; // While Not DMBelShop.CDS_Busca.Eof do
        DMBelShop.CDS_Busca.Close;

      End; // If DMSalao.CDS_V_ManutPlSaudeAlterar.AsString='SIM' Then

      DMSalao.CDS_V_ManutPlSaude.Next;
    End; // While Not DMSalao.CDS_V_ManutPlSaude.Eof do
    DMSalao.CDS_V_ManutPlSaude.EnableControls;
    DMSalao.CDS_V_ManutPlSaude.First;

    FrmBelShop.MontaProgressBar(False, FrmSalao);

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

End; // PLANO DE SAUDE - Alterar Valor dos Planos de Saude dos Profissionais ///

// PLANO DE SAUDE - Busca Plano de Saude ///////////////////////////////////////
Procedure TFrmSalao.BuscaPlanosSaude(sTp: String=''; sCodPS: String='');
Var
  s: String;
Begin
  // sTp = Tipo DML (N)Novo (A)Alterar
  // sCodPL = Codigo do Plano de Saude

  If Not DMSalao.CDS_V_ManutPlSaude.IsEmpty Then
  Begin
    s:='';
    DMSalao.CDS_V_ManutPlSaude.DisableControls;
    DMSalao.CDS_V_ManutPlSaude.First;
    While Not DMSalao.CDS_V_ManutPlSaude.Eof do
    Begin
      If DMSalao.CDS_V_ManutPlSaudeAlterar.AsString='SIM' Then
       s:=s+'"'+DMSalao.CDS_V_ManutPlSaudeCod_Plano.AsString+'" ';

      DMSalao.CDS_V_ManutPlSaude.Next;
    End;
    DMSalao.CDS_V_ManutPlSaude.First;
    DMSalao.CDS_V_ManutPlSaude.EnableControls;
  End; // If Not DMSalao.CDS_V_ManutPlSaude.IsEmpty Then

  If DMSalao.CDS_V_ManutPlSaude.Active Then
   DMSalao.CDS_V_ManutPlSaude.Close;

  DMSalao.CDS_V_ManutPlSaude.CreateDataSet;
  DMSalao.CDS_V_ManutPlSaude.Open;

  MySqlDML:=' SELECT p.cod_aux Codigo, p.des_aux Descricao,'+
            ' p.vlr_aux Vlr_Titular, p.vlr_aux1 Vlr_Dependente'+
            ' FROM  tab_auxiliar p'+
            ' WHERE p.tip_aux=4'+
            ' AND   p.cod_aux<>0';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySqlDML;
  DMBelShop.CDS_BuscaRapida.Open;

  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    DMSalao.CDS_V_ManutPlSaude.Insert;
    DMSalao.CDS_V_ManutPlSaudeCod_Plano.AsString:=
                       DMBelShop.CDS_BuscaRapida.FieldbyName('Codigo').AsString;
    DMSalao.CDS_V_ManutPlSaudeDes_Plano.AsString:=
                    DMBelShop.CDS_BuscaRapida.FieldbyName('Descricao').AsString;
    DMSalao.CDS_V_ManutPlSaudeVlr_Titular.AsCurrency:=
                DMBelShop.CDS_BuscaRapida.FieldbyName('Vlr_Titular').AsCurrency;
    DMSalao.CDS_V_ManutPlSaudeVlr_Dependente.AsCurrency:=
             DMBelShop.CDS_BuscaRapida.FieldbyName('Vlr_Dependente').AsCurrency;

    If (sTp='A') And (DMBelShop.CDS_BuscaRapida.FieldbyName('Codigo').AsString=sCodPS) Then
     DMSalao.CDS_V_ManutPlSaudeAlterar.AsString:='SIM'
    Else If AnsiContainsStr(s, '"'+DMBelShop.CDS_BuscaRapida.FieldbyName('Codigo').AsString+'"') Then
     DMSalao.CDS_V_ManutPlSaudeAlterar.AsString:='SIM'
    Else
     DMSalao.CDS_V_ManutPlSaudeAlterar.AsString:='NAO';
    DMSalao.CDS_V_ManutPlSaude.Post;

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.Close;
  DMSalao.CDS_V_ManutPlSaude.Last;
  DMSalao.CDS_V_ManutPlSaude.First;

End; // PLANO DE SAUDE - Busca Plano de Saude //////////////////////////////////

// PLANILHA DE PAGAMENTOS - Exclui Planilha de Pagamentos //////////////////////
Function TFrmSalao.ProfPagtoExcluiPlanilha(sCodLoja, sNrPlan, sDesAux, sDtaI, sDtaF: String): Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  OdirPanApres.Caption:='AGUARDE !! Excluindo Planilha Número: '+sNrPlan+' do Período de '+sDtaI+' a '+sDtaF;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
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
    DecimalSeparator:='.';

    // TECBIZ ==================================================================
    MySql:=' UPDATE PS_TECBIZ T'+
           ' SET T.ind_pago=''NAO'''+
           ' WHERE t.dta_ini_periodo>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaI)))+
           ' AND   t.dta_fim_periodo<='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaF)))+
           ' AND   t.ind_pago=''SIM'''+
           ' AND EXISTS (SELECT 1'+
           ' FROM SAL_PLAN_DEBCRED db'+
           ' WHERE db.num_seq=t.num_seq'+
           ' AND   db.cod_loja='+QuotedStr(sCodLoja)+
           ' AND   db.num_planilha='+sNrPlan+')';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // INSS ====================================================================
    MySql:=' UPDATE  PS_VALES_PESSOAS i'+
           ' SET i.vlr_pago=0,'+
           '     i.num_docto_pagto=0,'+
           '     i.dta_pagamento=NULL'+
           ' WHERE i.ind_debcred=''I'''+
           ' AND   i.vlr_pago>0'+
           ' AND   i.cod_loja='+QuotedStr(sCodLoja)+
           ' AND   i.num_docto_pagto='+sNrPlan;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // PLANO SAUDE =============================================================
    MySql:=' UPDATE PS_VALES_PESSOAS p'+
           ' SET p.vlr_pago=0,'+
           '     p.num_docto_pagto=0,'+
           '     p.dta_pagamento=NULL'+
           ' WHERE p.ind_debcred=''P'''+
           ' AND   p.vlr_pago>0'+
           ' AND   p.cod_loja='+QuotedStr(sCodLoja)+
           ' AND   p.num_docto_pagto='+sNrPlan;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // TAXA SINDICATO ==========================================================
    MySql:=' UPDATE PS_VALES_PESSOAS s'+
           ' SET s.vlr_pago=0,'+
           '     s.num_docto_pagto=0,'+
           '     s.dta_pagamento=NULL'+
           ' WHERE s.ind_debcred=''S'''+
           ' AND   s.vlr_pago>0'+
           ' AND   s.cod_loja='+QuotedStr(sCodLoja)+
           ' AND   s.num_docto_pagto='+sNrPlan;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // VALES ===================================================================
    MySql:=' UPDATE PS_VALES_PESSOAS v'+
           ' SET v.vlr_pago=0,'+
           '     v.num_docto_pagto=0,'+
           '     v.dta_pagamento=NULL'+
           ' WHERE v.ind_debcred=''D'''+
           ' AND   v.vlr_pago>0'+
           ' AND   v.cod_loja='+QuotedStr(sCodLoja)+
           ' AND   v.num_docto_pagto='+sNrPlan;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // BENEFÍCIOS ==============================================================
    MySql:=' UPDATE PS_VALES_PESSOAS v'+
           ' SET v.vlr_pago=0,'+
           '     v.num_docto_pagto=0,'+
           '     v.dta_pagamento=NULL'+
           ' WHERE v.ind_debcred=''B'''+
           ' AND   v.vlr_pago>0'+
           ' AND   v.cod_loja='+QuotedStr(sCodLoja)+
           ' AND   v.num_docto_pagto='+sNrPlan;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Acerta Dta_Ult_Pagto dos Benefício ======================================
    MySql:=' SELECT DISTINCT dc.num_docto, dc.codprof'+
           ' FROM SAL_PLAN_DEBCRED dc'+
           ' WHERE dc.tp_doc=10'+
           ' AND   dc.cod_loja='+QuotedStr(sCodLoja)+
           ' AND   dc.num_planilha='+sNrPlan;
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      MySql:=' SELECT MAX(dd.dta_vencimento) Dta_Ult_Pato'+
             ' FROM SAL_PLAN_DEBCRED dd'+
             ' WHERE dd.tp_doc=10'+
             ' AND   dd.cod_loja='+QuotedStr(sCodLoja)+
             ' AND   dd.codprof='+DMBelShop.CDS_Busca.FieldByName('CodProf').AsString+
             ' AND   dd.num_planilha<>'+sNrPlan;
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      MySql:=' UPDATE PS_BENEFICIOS_PESSOAS b'+
             ' SET b.ind_ativo='+QuotedStr('S');

             If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Ult_Pato').AsString)<>'' Then
              MySql:=
               MySql+', b.dta_ult_pagto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',
                                                    DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Ult_Pato').AsString)))
             Else
              MySql:=
               MySql+', b.dta_ult_pagto=NULL';

      MySql:=
       MySql+' WHERE b.cod_loja='+QuotedStr(sCodLoja)+
             ' AND   b.cod_pessoa='+DMBelShop.CDS_Busca.FieldByName('CodProf').AsString+
             ' AND   b.num_docto='+DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString;
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      DMBelShop.CDS_BuscaRapida.Close;

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    // SAL_PLAN_VENDAS =========================================================
    MySql:=' DELETE FROM SAL_PLAN_VENDAS pv'+
           ' WHERE pv.cod_loja='+QuotedStr(sCodLoja)+
           ' AND   pv.num_planilha='+sNrPlan;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // SAL_PLAN_DEBCRED ========================================================
    MySql:=' DELETE FROM SAL_PLAN_DEBCRED dc'+
           ' WHERE dc.num_planilha='+sNrPlan+
           ' AND   dc.cod_loja='+QuotedStr(sCodLoja);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // SAL_PLAN_PAGTO ==========================================================
    MySql:=' DELETE FROM SAL_PLAN_PAGTO pp'+
           ' WHERE pp.num_planilha='+sNrPlan+
           ' AND   pp.cod_loja='+QuotedStr(sCodLoja);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Altera Ultimo Periodo de Calculo dos Profissionais ======================
    // Com Periodo Igual
    MySql:=' UPDATE SAL_PROFISSIONAIS pf'+
           ' SET pf.dta_periodo_ini_cal='+
           QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(StrToDate(sDtaI)-7))))+
           ',    pf.dta_periodo_fim_cal='+
           QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(StrToDate(sDtaI)-1))))+
           ' WHERE pf.cod_loja='+QuotedStr(sCodLoja)+
           ' AND   pf.dta_periodo_ini_cal='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaI)))+
           ' AND   pf.dta_periodo_fim_cal='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaF)));
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Altera Ultimo Periodo de Calculo dos Profissionais ======================
    // Com Periodo Diferente
    MySql:=' UPDATE SAL_PROFISSIONAIS pf'+
           ' SET pf.dta_periodo_fim_cal='+
           QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(StrToDate(sDtaI)-1))))+
           ' WHERE pf.cod_loja='+QuotedStr(sCodLoja)+
           ' AND   pf.dta_periodo_ini_cal<>'+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaI)))+
           ' AND   pf.dta_periodo_fim_cal='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaF)));
    DMBelShop.SQLC.Execute(MySql,nil,nil);
                                           
    // TAB_AUXILIAR ============================================================
    MySql:=' DELETE FROM TAB_AUXILIAR ta'+
           ' WHERE ta.tip_aux=7'+
           ' AND   ta.cod_aux='+sNrPlan+
           ' AND   ta.des_aux='+QuotedStr(sDesAux);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

    Result:=True;

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

End; // PLANILHA DE PAGAMENTOS - Exclui Planilha de Pagamentos /////////////////

// PLANILHA DE PAGAMENTOS - Apresenta Planilha de Pagamentos ///////////////////
Function TFrmSalao.ProfPagtoPlanilha(sNumPlan, sCodLoja: String): Boolean;
Var
  i: Integer;
  MySql: String;
  sNumBanco, sDesBanco: String;
  sL1,  sL2,  sL3,  sL4,  sL5,  sL6,  sL7,  sL8,  sL9,  sL10,
  sL11, sL12, sL13, sL14, sL15, sL16, sL17, sL18, sL19, sL20: TStringList;
Begin
  Result:=True;

  sL1:=TStringList.Create;
  sL2:=TStringList.Create;
  sL3:=TStringList.Create;
  sL4:=TStringList.Create;
  sL5:=TStringList.Create;
  sL6:=TStringList.Create;
  sL7:=TStringList.Create;
  sL8:=TStringList.Create;
  sL9:=TStringList.Create;
  sL10:=TStringList.Create;
  sL11:=TStringList.Create;
  sL12:=TStringList.Create;
  sL13:=TStringList.Create;
  sL14:=TStringList.Create;
  sL15:=TStringList.Create;
  sL16:=TStringList.Create;
  sL17:=TStringList.Create;
  sL18:=TStringList.Create;
  sL19:=TStringList.Create;
  sL20:=TStringList.Create;

  sL1.Clear;
  sL2.Clear;
  sL3.Clear;
  sL4.Clear;
  sL5.Clear;
  sL6.Clear;
  sL7.Clear;
  sL8.Clear;
  sL9.Clear;
  sL10.Clear;
  sL11.Clear;
  sL12.Clear;
  sL13.Clear;
  sL14.Clear;
  sL15.Clear;
  sL16.Clear;
  sL17.Clear;
  sL18.Clear;
  sL19.Clear;
  sL20.Clear;

  OdirPanApres.Caption:='AGUARDE !! Calculando Planilha de Pagamento dos Profissionais na Loja: Bel_'+sCodLoja;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Visible:=True;
  Refresh;

  // Busca Loja ================================================================
  MySql:=' SELECT e.razao_social'+
         ' FROM emp_conexoes e'+
         ' WHERE e.cod_filial='+QuotedStr(sCodLoja);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgDesLoja:=DMBelShop.CDS_BuscaRapida.FieldByName('razao_social').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // Busca Bancos e Dta FIM ====================================================
  MySql:=' SELECT pp.num_banco, pp.des_banco'+
         ' FROM   SAL_PLAN_PAGTO pp'+
         ' WHERE  pp.num_planilha='+sNumPlan+
         ' AND    pp.cod_loja='+QuotedStr(sCodLoja)+
         ' GROUP  BY 1,2'+
         ' ORDER  BY 1';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  // Monta Cabeçalho do Select =================================================
  sL1.Text:=' SELECT -10 num_planilha, ''PLAN_''||'+QuotedStr(sNumPlan)+'||'' - Pagamento de Profissionais de Salão'' des_profissional,'+
            ' CAST('+QuotedStr(sgDtaF)+' AS DATE) Fim_Contrato,'+
            ' 0 vlr_comissao, 0 vlr_beneficios, 0 vlr_plano_saude,'+
            ' ''CABECALHO1'' num_tecbiz, 0 Vlr_Tecbiz, 0 Vlr_Taxas, 0 vlr_vales,'+
            ' 0 vlr_inss, ''CABECALHO1'' num_inss, 0 per_inss, 0 Vlr_Arredonda, 0 Vlr_Deposito,'+
            ' 0 num_banco, '''' des_banco,'+
            ' '''' num_agencia, '''' num_conta, 0 ordem, ''S'' Com_Saldo'+
            ' FROM RDB$DATABASE'+

            ' UNION'+

            // Linha em Branco
            ' SELECT -9 num_planilha, '''','+
            ' CAST('+QuotedStr(sgDtaF)+' AS DATE) Fim_Contrato,'+
            '  0 vlr_comissao, 0 vlr_beneficios, 0 vlr_plano_saude,'+
            ' ''LINHA BRANCO'' num_tecbiz, 0 Vlr_Tecbiz, 0 Vlr_Taxas, 0 vlr_vales, 0 vlr_inss,'+
            ' ''LINHA BRANCO'' num_inss, 0 per_inss, 0 Vlr_Arredonda, 0 Vlr_Deposito,'+
            ' 0 num_banco, '''' des_banco,'+
            ' '''' num_agencia, '''' num_conta, 0 ordem, ''S'' Com_Saldo'+
            ' FROM RDB$DATABASE'+

            ' UNION'+

            // Periodo
            ' SELECT -8 num_planilha, ''Período de: ''||'+
            QuotedStr(f_Troca('.','/',f_Troca('-','/',sgDtaI)))+'||'' a ''||'+
            QuotedStr(f_Troca('.','/',f_Troca('-','/',sgDtaF)))+' des_profissional,'+
            ' CAST('+QuotedStr(sgDtaF)+' AS DATE) Fim_Contrato,'+
            ' 0 vlr_comissao, 0 vlr_beneficios, 0 vlr_plano_saude,'+
            ' ''CABECALHO1'' num_tecbiz, 0 Vlr_Tecbiz, 0 Vlr_Taxas, 0 vlr_vales, 0 vlr_inss,'+
            ' ''CABECALHO1'' num_inss, 0 per_inss, 0 Vlr_Arredonda, 0 Vlr_Deposito,'+
            ' 0 num_banco, '''' des_banco,'+
            ' '''' num_agencia, '''' num_conta, 0 ordem, ''S'' Com_Saldo'+
            ' FROM RDB$DATABASE'+

            ' UNION'+

            // Linha em Branco
            ' SELECT -7 num_planilha, '''','+
            ' CAST('+QuotedStr(sgDtaF)+' AS DATE) Fim_Contrato,'+
            ' 0 vlr_comissao, 0 vlr_beneficios, 0 vlr_plano_saude,'+
            ' ''LINHA BRANCO'' num_tecbiz, 0 Vlr_Tecbiz, 0 Vlr_Taxas, 0 vlr_vales, 0 vlr_inss,'+
            ' ''LINHA BRANCO'' num_inss, 0 per_inss, 0 Vlr_Arredonda, 0 Vlr_Deposito,'+
            ' 0 num_banco, '''' des_banco,'+
            ' '''' num_agencia, '''' num_conta, 0 ordem, ''S'' Com_Saldo'+
            ' FROM RDB$DATABASE'+

            ' UNION'+

            // Loja
            ' SELECT -6 num_planilha, ''BEL_''||'+QuotedStr(sCodLoja)+'||'' - ''||'+QuotedStr(sgDesLoja)+' des_profissional,'+
            ' CAST('+QuotedStr(sgDtaF)+' AS DATE) Fim_Contrato,'+
            ' SUM(pp.vlr_comissao) vlr_comissao,'+
            ' SUM(pp.vlr_beneficios) vlr_beneficios,'+
            ' SUM(pp.vlr_plano_saude) vlr_plano_saude,'+
            ' ''CABECALHO2'' num_tecbiz,'+
            ' SUM(pp.vlr_tecbiz) vlr_tecbiz,'+
            ' SUM(pp.vlr_taxas) vlr_taxas,'+
            ' SUM(pp.vlr_vales) vlr_vales,'+
            ' SUM(pp.vlr_inss) vlr_inss,'+
            ' ''CABECALHO2'' num_inss, 0 per_inss,'+
            ' SUM(pp.vlr_Arredonda) vlr_Arredonda,'+
            ' SUM(pp.vlr_saldo) Vlr_Deposito,'+
            ' 0 num_banco, '''' des_banco,'+
            ' '''' num_agencia, '''' num_conta, 0 ordem, ''S'' Com_Saldo'+

            ' FROM SAL_PLAN_PAGTO pp'+

            ' WHERE pp.num_planilha='+sNumPlan+
            ' AND   pp.cod_loja='+QuotedStr(sCodLoja)+

            ' UNION'+

            // Linha em Branco
            ' SELECT -5 num_planilha, '''','+
            '  CAST('+QuotedStr(sgDtaF)+' AS DATE) Fim_Contrato,'+
            ' 0 vlr_comissao, 0 vlr_beneficios, 0 vlr_plano_saude,'+
            ' ''LINHA BRANCO'' num_tecbiz, 0 Vlr_Tecbiz, 0 Vlr_Taxas, 0 vlr_vales, 0 vlr_inss,'+
            ' ''LINHA BRANCO'' num_inss, 0 per_inss, 0 Vlr_Arredonda, 0 Vlr_Deposito,'+
            ' 0 num_banco, '''' des_banco, '''' num_agencia, '''' num_conta, 0 ordem, ''S'' com_saldo'+
            ' FROM RDB$DATABASE';

  // Monta Select de Bancos ====================================================
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
     sNumBanco:=DMBelShop.CDS_Busca.FieldByName('num_banco').AsString;
     sDesBanco:=DMBelShop.CDS_Busca.FieldByName('des_banco').AsString;

     // Cabecalho do Banco
     MySql:=' SELECT '+(IntToStr(StrToInt(sNumPlan)-1))+' num_planilha, ''DEPOSITOS ''||'+QuotedStr(sDesBanco)+','+
            ' CAST('+QuotedStr(sgDtaF)+' AS DATE) Fim_Contrato,'+
            ' 0 vlr_comissao, 0 vlr_beneficios, 0 vlr_plano_saude,'+
            ' ''CABECALHO BANCO'' num_tecbiz, 0 Vlr_Tecbiz, 0 Vlr_Taxas, 0 vlr_vales, 0 vlr_inss,'+
            ' ''CABECALHO BANCO'' num_inss, 0 per_inss, 0 Vlr_Arredonda, 0 Vlr_Deposito, '+
            ' 0 num_banco, '+QuotedStr(sDesBanco)+' des_banco, '''' num_agencia, '''' num_conta,'+
            ' 0 ordem, ''S'' com_saldo'+
            ' FROM RDB$DATABASE'+

            ' UNION'+

            // Depositos do Banco
            ' SELECT pp.num_planilha, pp.des_profissional,'+
            ' pp.Dta_Fim_Contrato Fim_Contrato,'+
            ' pp.vlr_comissao, pp.vlr_beneficios, pp.vlr_plano_saude, pp.num_tecbiz,'+
            ' pp.vlr_tecbiz, pp.Vlr_Taxas, pp.vlr_vales, pp.vlr_inss, pp.num_inss,'+
            ' pp.per_inss, pp.Vlr_Arredonda, pp.vlr_saldo Vlr_Deposito,'+
            ' pp.num_banco, pp.des_banco,'+
            ' pp.num_agencia, pp.num_conta, 0 ordem,'+
            ' CASE'+
            '   WHEN pp.vlr_saldo>0 Then ''S'''+
            '   ELSE '''''+
            ' END Com_Saldo'+

            ' FROM SAL_PLAN_PAGTO pp'+

            ' WHERE pp.num_planilha='+sNumPlan+
            ' AND   pp.cod_loja='+QuotedStr(sCodLoja)+
            ' AND   pp.num_banco='+sNumBanco+

            ' UNION'+

            //Rodape do Banco
            ' SELECT '+(IntToStr((StrToInt(sNumPlan)*10)+1))+' num_planilha, ''{ TOTAL: ''||pp.des_banco||'' }'','+
            ' CAST('+QuotedStr(sgDtaF)+' AS DATE) Fim_Contrato,'+
            ' SUM(pp.vlr_comissao) vlr_comissao,'+
            ' SUM(pp.vlr_beneficios) vlr_beneficios,'+
            ' SUM(pp.vlr_plano_saude) vlr_plano_saude,'+
            ' ''TOTAL BANCO'' num_tecbiz,'+
            ' SUM(pp.vlr_Tecbiz) vlr_Tecbiz,'+
            ' SUM(pp.vlr_Taxas) vlr_Taxas,'+
            ' SUM(pp.vlr_vales) vlr_vales,'+
            ' SUM(pp.vlr_inss) vlr_inss,'+
            ' ''TOTAL BANCO'' num_inss, 0 per_inss,'+
            ' SUM(pp.vlr_Arredonda) Vlr_Arredonda,'+
            ' SUM(pp.vlr_saldo) Vlr_Deposito,'+
            ' 0 num_banco, pp.des_banco||'' TOTAL'','+
            ' '''' num_agencia, '''' num_conta, 0 ordem, ''S'' com_saldo '+

            ' FROM SAL_PLAN_PAGTO pp'+

            ' WHERE pp.num_planilha='+sNumPlan+
            ' AND   pp.cod_loja='+QuotedStr(sCodLoja)+
            ' AND   pp.num_banco='+sNumBanco+
            ' GROUP BY 17,2'+

            ' UNION'+

            // Linha em Branco
            ' SELECT '+(IntToStr((StrToInt(sNumPlan)*10)+1))+' num_planilha, ''{ZZZZZZ}'','+
            ' CAST('+QuotedStr(sgDtaF)+' AS DATE) Fim_Contrato,'+
            ' 0 vlr_comissao, 0 vlr_beneficios, 0 vlr_plano_saude,'+
            ' ''LINHA BRANCO'' num_tecbiz, 0 Vlr_Tecbiz, 0 Vlr_Taxas, 0 vlr_vales, 0 vlr_inss,'+
            ' ''LINHA BRANCO'' num_inss, 0 per_inss, 0 Vlr_Arredonda, 0 Vlr_Deposito,'+
            ' 0 num_banco, '+QuotedStr(sDesBanco)+'||'' TOTAL'','+
            ' '''' num_agencia, '''' num_conta, 0 ordem, ''S'' com_saldo'+
            ' FROM RDB$DATABASE';

     // Monta Select ===========================================================
          If Trim(sL2.Text)=''  Then sL2.Text:=' UNION'+MySql
     Else If Trim(sL3.Text)=''  Then sL3.Text:=' UNION'+MySql
     Else If Trim(sL4.Text)=''  Then sL4.Text:=' UNION'+MySql
     Else If Trim(sL5.Text)=''  Then sL5.Text:=' UNION'+MySql
     Else If Trim(sL6.Text)=''  Then sL6.Text:=' UNION'+MySql
     Else If Trim(sL7.Text)=''  Then sL7.Text:=' UNION'+MySql
     Else If Trim(sL8.Text)=''  Then sL8.Text:=' UNION'+MySql
     Else If Trim(sL9.Text)=''  Then sL9.Text:=' UNION'+MySql
     Else If Trim(sL10.Text)='' Then sL10.Text:=' UNION'+MySql
     Else If Trim(sL11.Text)='' Then sL11.Text:=' UNION'+MySql
     Else If Trim(sL12.Text)='' Then sL12.Text:=' UNION'+MySql
     Else If Trim(sL13.Text)='' Then sL13.Text:=' UNION'+MySql
     Else If Trim(sL14.Text)='' Then sL14.Text:=' UNION'+MySql
     Else If Trim(sL15.Text)='' Then sL15.Text:=' UNION'+MySql
     Else If Trim(sL16.Text)='' Then sL16.Text:=' UNION'+MySql
     Else If Trim(sL17.Text)='' Then sL17.Text:=' UNION'+MySql
     Else If Trim(sL18.Text)='' Then sL18.Text:=' UNION'+MySql
     Else If Trim(sL19.Text)='' Then sL19.Text:=' UNION'+MySql
     Else If Trim(sL20.Text)='' Then sL20.Text:=' UNION'+MySql;

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do

  DMSalao.CDS_PagtosPlan.Close;
  DMSalao.CDS_PagtosPlan.IndexFieldNames:='';

  DMSalao.SDS_PagtosPlan.CommandText:=sL1.Text+sL2.Text+sL3.Text+sL4.Text+sL5.Text+
                                      sL6.Text+sL7.Text+sL8.Text+sL9.Text+sL10.Text+
                                      sL11.Text+sL12.Text+sL13.Text+sL14.Text+sL15.Text+
                                      sL16.Text+sL17.Text+sL18.Text+sL19.Text+sL20.Text;

  DMSalao.SDS_PagtosPlan.CommandText:=Trim(DMSalao.SDS_PagtosPlan.CommandText)+' ORDER BY 17,1,2';
  DMSalao.CDS_PagtosPlan.Open;

  If DMSalao.CDS_PagtosPlan.IsEmpty Then
  Begin
    Result:=False;
    DMBelShop.CDS_Busca.Close;
    DMSalao.CDS_PagtosPlan.Close;
    Exit;
  End;

  DMBelShop.CDS_Busca.Close;

  // Cria Ordem ================================================================
  i:=0;
  DMSalao.CDS_PagtosPlan.First;
  DMSalao.CDS_PagtosPlan.DisableControls;
  While Not DMSalao.CDS_PagtosPlan.Eof do
  Begin
    Inc(i);
    DMSalao.CDS_PagtosPlan.Edit;
    DMSalao.CDS_PagtosPlanORDEM.AsInteger:=i;
    DMSalao.CDS_PagtosPlan.Post;

    DMSalao.CDS_PagtosPlan.Next;
  End;
  DMSalao.CDS_PagtosPlan.First;

  // Monta Planilha ============================================================
  DMSalao.CDS_PagtosPlan.First;
  While Not DMSalao.CDS_PagtosPlan.Eof do
  Begin

    if DMSalao.CDS_PagtosPlanNUM_INSS.AsString='CABECALHO1' Then
    Begin
      DMSalao.CDS_PagtosPlan.Edit;
      DMSalao.CDS_PagtosPlanFIM_CONTRATO.Clear;
      DMSalao.CDS_PagtosPlanVLR_COMISSAO.Clear;
      DMSalao.CDS_PagtosPlanVLR_BENEFICIOS.Clear;
      DMSalao.CDS_PagtosPlanVLR_PLANO_SAUDE.Clear;
      DMSalao.CDS_PagtosPlanVLR_TAXAS.Clear;
      DMSalao.CDS_PagtosPlanVLR_VALES.Clear;
      DMSalao.CDS_PagtosPlanVLR_INSS.Clear;
      DMSalao.CDS_PagtosPlanVLR_TECBIZ.Clear;
      DMSalao.CDS_PagtosPlanPER_INSS.Clear;
      DMSalao.CDS_PagtosPlanVLR_ARREDONDA.Clear;
      DMSalao.CDS_PagtosPlanVLR_DEPOSITO.Clear;
      DMSalao.CDS_PagtosPlanNUM_BANCO.Clear;
      DMSalao.CDS_PagtosPlanNUM_INSS.Clear;
      DMSalao.CDS_PagtosPlanNUM_TECBIZ.Clear;
      DMSalao.CDS_PagtosPlan.POST;
    end;

    if DMSalao.CDS_PagtosPlanNUM_INSS.AsString='CABECALHO2' Then
    Begin
      DMSalao.CDS_PagtosPlan.Edit;
      DMSalao.CDS_PagtosPlanFIM_CONTRATO.Clear;
      DMSalao.CDS_PagtosPlanNUM_BANCO.Clear;
      DMSalao.CDS_PagtosPlanNUM_INSS.Clear;
      DMSalao.CDS_PagtosPlanNUM_TECBIZ.Clear;
      DMSalao.CDS_PagtosPlanPER_INSS.Clear;
      DMSalao.CDS_PagtosPlan.POST;
    End;

    if DMSalao.CDS_PagtosPlanNUM_INSS.AsString='LINHA BRANCO' Then
    Begin
      DMSalao.CDS_PagtosPlan.Edit;
      DMSalao.CDS_PagtosPlanDES_PROFISSIONAL.Clear;
      DMSalao.CDS_PagtosPlanDES_BANCO.Clear;
      DMSalao.CDS_PagtosPlanFIM_CONTRATO.Clear;
      DMSalao.CDS_PagtosPlanVLR_COMISSAO.Clear;
      DMSalao.CDS_PagtosPlanVLR_BENEFICIOS.Clear;
      DMSalao.CDS_PagtosPlanVLR_PLANO_SAUDE.Clear;
      DMSalao.CDS_PagtosPlanVLR_TAXAS.Clear;
      DMSalao.CDS_PagtosPlanVLR_VALES.Clear;
      DMSalao.CDS_PagtosPlanVLR_INSS.Clear;
      DMSalao.CDS_PagtosPlanPER_INSS.Clear;
      DMSalao.CDS_PagtosPlanVLR_ARREDONDA.Clear;
      DMSalao.CDS_PagtosPlanVLR_DEPOSITO.Clear;
      DMSalao.CDS_PagtosPlanVLR_TECBIZ.Clear;
      DMSalao.CDS_PagtosPlanNUM_BANCO.Clear;
      DMSalao.CDS_PagtosPlanNUM_TECBIZ.Clear;
      DMSalao.CDS_PagtosPlanNUM_INSS.Clear;
      DMSalao.CDS_PagtosPlan.POST;
    end;

    if DMSalao.CDS_PagtosPlanNUM_INSS.AsString='CABECALHO BANCO' Then
    Begin
      DMSalao.CDS_PagtosPlan.Edit;
      DMSalao.CDS_PagtosPlanFIM_CONTRATO.Clear;
      DMSalao.CDS_PagtosPlanVLR_COMISSAO.Clear;
      DMSalao.CDS_PagtosPlanVLR_BENEFICIOS.Clear;
      DMSalao.CDS_PagtosPlanVLR_PLANO_SAUDE.Clear;
      DMSalao.CDS_PagtosPlanVLR_TAXAS.Clear;
      DMSalao.CDS_PagtosPlanVLR_VALES.Clear;
      DMSalao.CDS_PagtosPlanVLR_INSS.Clear;
      DMSalao.CDS_PagtosPlanPER_INSS.Clear;
      DMSalao.CDS_PagtosPlanVLR_ARREDONDA.Clear;
      DMSalao.CDS_PagtosPlanVLR_DEPOSITO.Clear;
      DMSalao.CDS_PagtosPlanVLR_TECBIZ.Clear;
      DMSalao.CDS_PagtosPlanNUM_BANCO.Clear;
      DMSalao.CDS_PagtosPlanDES_BANCO.Clear;
      DMSalao.CDS_PagtosPlanNUM_TECBIZ.Clear;
      DMSalao.CDS_PagtosPlanNUM_INSS.Clear;
      DMSalao.CDS_PagtosPlan.POST;
    end;

    if DMSalao.CDS_PagtosPlanNUM_INSS.AsString='TOTAL BANCO' Then
    Begin
      DMSalao.CDS_PagtosPlan.Edit;
      DMSalao.CDS_PagtosPlanFIM_CONTRATO.Clear;
      DMSalao.CDS_PagtosPlanPER_INSS.Clear;
      DMSalao.CDS_PagtosPlanDES_BANCO.Clear;
      DMSalao.CDS_PagtosPlanNUM_BANCO.Clear;
      DMSalao.CDS_PagtosPlanNUM_TECBIZ.Clear;
      DMSalao.CDS_PagtosPlanNUM_INSS.Clear;
      DMSalao.CDS_PagtosPlan.POST;
    end;

    DMSalao.CDS_PagtosPlan.Next;
  End;
  DMSalao.CDS_PagtosPlan.EnableControls;
  DMSalao.CDS_PagtosPlan.First;

  DMSalao.CDS_PagtosPlan.IndexFieldNames:='ORDEM';

  sL1.Free;
  sL1:=nil;
  sL2.Free;
  sL2:=nil;
  sL3.Free;
  sL3:=nil;
  sL4.Free;
  sL4:=nil;
  sL5.Free;
  sL5:=nil;
  sL6.Free;
  sL6:=nil;
  sL7.Free;
  sL7:=nil;
  sL8.Free;
  sL8:=nil;
  sL9.Free;
  sL9:=nil;
  sL10.Free;
  sL10:=nil;
  sL11.Free;
  sL11:=nil;
  sL12.Free;
  sL12:=nil;
  sL13.Free;
  sL13:=nil;
  sL14.Free;
  sL14:=nil;
  sL15.Free;
  sL15:=nil;
  sL16.Free;
  sL16:=nil;
  sL17.Free;
  sL17:=nil;
  sL18.Free;
  sL18:=nil;
  sL19.Free;
  sL19:=nil;
  sL20.Free;
  sL20:=nil;               
                                          
End; // PLANILHA DE PAGAMENTOS - Apresenta Planilha de Pagamentos //////////////

// CONTRIBUIÇÃO INSS / PLANODE SAUDE - Calcula Taxa Sindicato //////////////////
Function TFrmSalao.ProfCalculaTaxaSindicato(sDta: String): Boolean;
Var
  s, MySql: String;
Begin
  Result:=True;

  DMSalao.CDS_V_TaxaSindicato.Close;

  FrmBelShop.MontaProgressBar(True, FrmSalao);

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Exclui Taxa Sindicato Ainda Não Cobradas ================================
    MySql:=' Delete FROM ps_vales_pessoas i'+
           ' WHERE i.cod_loja='+QuotedStr(sCodFilial)+
           ' AND   i.tp_pessoa=1'+
           ' AND   i.ind_debcred='+QuotedStr('S')+
           ' AND  i.dta_vencimento='+QuotedStr(sDta)+
           ' AND  NOT EXISTS (SELECT 1'+
           '              FROM  sal_plan_debcred dc'+
           '              WHERE dc.cod_loja=i.cod_loja'+
           '              AND   dc.codprof=i.cod_pessoa'+
           '              AND   dc.TP_DOC=4'+ // TAXA DO SINDICATO
           '              AND   dc.num_seq=i.num_seq'+
           '              AND   dc.num_docto=i.num_docto'+
           '              AND   dc.dta_vencimento=i.dta_vencimento)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Calcula Taxa Sindicato ==================================================
    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    DMBelShop.CDS_Busca.First;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;
      pgProgBar.Refresh;

      // Busca Num_Seq ------------------------------------------------
      MySql:='SELECT GEN_ID(GEN_VALES,1) Num_Seq'+
             ' FROM RDB$DATABASE';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      MySql:=' Insert into PS_VALES_PESSOAS ('+
             ' NUM_SEQ, TP_PESSOA, COD_LOJA, COD_PESSOA,'+
             ' NUM_DOCTO, DES_DOCTO, IND_DEBCRED, VLR_ORIGINAL,'+
             ' TOT_PRESTACAO, NUM_PRAZO, DTA_PRIM_VENC,'+
             ' NUM_PRESTACAO, DTA_VENCIMENTO, VLR_PRESTACAO,'+
             ' VLR_DESCONTO, VLR_ACRESCIMOS, VLR_APAGAR, VLR_PAGO, NUM_DOCTO_PAGTO,'+
             ' USU_INCLUI)'+

             ' Values('+
             QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+ // NUM_SEQ
             QuotedStr('1')+', '+ // TP_PESSOA
             QuotedStr(sCodFilial)+', '+ // COD_LOJA
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Profissional').AsString)+', '+ // COD_PESSOA
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Mes').AsString)+'||'+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Ano').AsString)+', '+ // NUM_DOCTO
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Des_Docto').AsString)+', '+ // DES_DOCTO
             QuotedStr('S')+', '+ // IND_DEBCRED
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Vlr_Apagar').AsString)+', '+ // VLR_ORIGINAL
             QuotedStr('1')+', '+ // TOT_PRESTACAO
             QuotedStr('0')+', '+ // NUM_PRAZO
             QuotedStr(sDta)+', '+ // DTA_PRIM_VENC
             QuotedStr('1')+', '+ // NUM_PRESTACAO
             QuotedStr(sDta)+', '+ // DTA_VENCIMENTO
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Vlr_Apagar').AsString)+', '+ // VLR_PRESTACAO
             QuotedStr('0')+', '+ // VLR_DESCONTO
             QuotedStr('0')+', '+ // VLR_ACRESCIMOS
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Vlr_Apagar').AsString)+', '+ // VLR_APAGAR
             QuotedStr('0')+', '+ // VLR_PAGO
             QuotedStr('0')+', '+ // NUM_DOCTO_PAGTO
             QuotedStr(Cod_Usuario)+
             ')';

      DMBelShop.SQLC.Execute(MySql,nil,nil);

      DMBelShop.CDS_BuscaRapida.Close;

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do

    // Grava Tabela de Calculo de Taxa de Sindicato ============================
    MySql:=' SELECT t.tip_aux'+
           ' FROM  tab_auxiliar t'+
           ' WHERE t.tip_aux=9'+
           ' AND   t.des_aux='+QuotedStr(f_Troca('.','/',sDta))+
           ' AND   t.des_aux1='+QuotedStr(sCodFilial);
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;
    s:=DMBelShop.CDS_Busca.FieldByName('tip_aux').AsString;
    DMBelShop.CDS_Busca.Close;

    If Trim(s)='' Then
    Begin
      MySql:=' Insert Into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1)'+
             ' Values ('+
             QuotedStr('9')+','+
             ' (SELECT COALESCE(MAX(t.Cod_Aux)+1 ,1) FROM TAB_AUXILIAR t WHERE t.tip_aux=9),'+
             QuotedStr(f_Troca('.','/',sDta))+', '+
             QuotedStr(sCodFilial)+')';
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End;

    // Exclui Tabela de Calculo de Taxa de Sindicato ===========================
    MySql:=' DELETE FROM tab_auxiliar t'+
           ' WHERE t.tip_aux=9'+
           ' AND NOT EXISTS (SELECT 1'+
           ' FROM ps_vales_pessoas i'+
           ' WHERE i.tp_pessoa=1'+
           ' AND   i.ind_debcred='+QuotedStr('S')+
           ' AND'+
           ' CAST(LPAD(EXTRACT(DAY FROM i.dta_vencimento),2,''0'') AS VARCHAR(2))||''/''||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM i.dta_vencimento),2,''0'') AS VARCHAR(2))||''/''||'+
           ' CAST(LPAD(EXTRACT(YEAR FROM i.dta_vencimento),4,''0'') AS VARCHAR(4))=t.des_aux)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ===========================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);
      Result:=False;

      DateSeparator:='/';
      DecimalSeparator:=',';
    End; // on e : Exception do
  End; // Try

  FrmBelShop.MontaProgressBar(False, FrmSalao);

End; // CONTRIBUIÇÃO INSS / PLANODE SAUDE - Calcula Taxa Sindicato /////////////

// CONTRIBUIÇÃO INSS / PLANODE SAUDE - Calcula Contibuições de INSS ////////////
Function TFrmSalao.ProfCalculaINSS(sDta: String): Boolean;
Var
  s, MySql: String;
Begin
  Result:=True;

  DMSalao.CDS_V_Inss.Close;

  FrmBelShop.MontaProgressBar(True, FrmSalao);

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Exclui Contribuições Ainda Não Cobradas =================================
    MySql:=' Delete FROM ps_vales_pessoas i'+
           ' WHERE i.cod_loja='+QuotedStr(sCodFilial)+
           ' AND   i.tp_pessoa=1'+
           ' AND   i.ind_debcred='+QuotedStr('I')+
           ' AND   i.num_docto='+sgMesVenc+sgAnoVenc+
           ' AND  NOT EXISTS (SELECT 1'+
           '              FROM sal_plan_debcred dc'+
           '              WHERE dc.cod_loja=i.cod_loja'+
           '              AND   dc.codprof=i.cod_pessoa'+
           '              AND   dc.TP_DOC=2'+ // CONTRIBUIÇÃO INSS
           '              AND   dc.num_seq=i.num_seq'+
           '              AND   dc.num_docto=i.num_docto'+
           '              AND   dc.dta_vencimento=i.dta_vencimento)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Calcula Contribuição INSS ===============================================
    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    DMBelShop.CDS_Busca.First;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;
      pgProgBar.Refresh;

      // Busca Num_Seq ------------------------------------------------
      MySql:='SELECT GEN_ID(GEN_VALES,1) Num_Seq'+
             ' FROM RDB$DATABASE';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      MySql:=' Insert into PS_VALES_PESSOAS ('+
             ' NUM_SEQ, TP_PESSOA, COD_LOJA, COD_PESSOA,'+
             ' NUM_DOCTO, DES_DOCTO, IND_DEBCRED, VLR_ORIGINAL, PER_PERCENTUAL,'+
             ' TOT_PRESTACAO, NUM_PRAZO, DTA_PRIM_VENC,'+
             ' NUM_PRESTACAO, DTA_VENCIMENTO, VLR_PRESTACAO,'+
             ' VLR_DESCONTO, VLR_ACRESCIMOS, VLR_APAGAR, VLR_PAGO, NUM_DOCTO_PAGTO,'+
             ' USU_INCLUI)'+

             ' Values('+
             QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+ // NUM_SEQ
             QuotedStr('1')+', '+ // TP_PESSOA
             QuotedStr(sCodFilial)+', '+ // COD_LOJA
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Profissional').AsString)+', '+ // COD_PESSOA
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Mes').AsString)+'||'+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Ano').AsString)+', '+ // NUM_DOCTO
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Num_INSS').AsString)+', '+ // DES_DOCTO
             QuotedStr('I')+', '+ // IND_DEBCRED
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Sal_Minimo').AsString)+', '+ // VLR_ORIGINAL
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Per_INSS').AsString)+', '+ //PER_PERCENTUAL
             QuotedStr('1')+', '+ // TOT_PRESTACAO
             QuotedStr('0')+', '+ // NUM_PRAZO
             QuotedStr(sDta)+', '+ // DTA_PRIM_VENC
             QuotedStr('1')+', '+ // NUM_PRESTACAO
             QuotedStr(sDta)+', '+ // DTA_VENCIMENTO
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Vlr_Contrib').AsString)+', '+ // VLR_PRESTACAO
             QuotedStr('0')+', '+ // VLR_DESCONTO
             QuotedStr('0')+', '+ // VLR_ACRESCIMOS
             QuotedStr(DMBelShop.CDS_Busca.FieldByName('Vlr_Contrib').AsString)+', '; // VLR_APAGAR

             // VLR_PAGO
             If DMBelShop.CDS_Busca.FieldByName('Ind_Cobra_Inss').AsString='SIM' Then
              MySql:=MySql+QuotedStr('0')+', '
             Else
              MySql:=MySql+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Vlr_Contrib').AsString)+', ';

             // NUM_DOCTO_PAGTO
             If DMBelShop.CDS_Busca.FieldByName('Ind_Cobra_Inss').AsString='SIM' Then
              MySql:=MySql+QuotedStr('0')+', '
             Else
              MySql:=MySql+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Mes').AsString)+'||'+
                           QuotedStr(DMBelShop.CDS_Busca.FieldByName('Ano').AsString)+', ';

             MySql:=MySql+QuotedStr(Cod_Usuario)+
             ')';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      DMBelShop.CDS_BuscaRapida.Close;

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do

    // Grava Tabela de Calculo de Contribuição INSS =================
    MySql:=' SELECT t.tip_aux'+
           ' FROM  tab_auxiliar t'+
           ' WHERE t.tip_aux=5'+
           ' AND   t.des_aux='+QuotedStr(f_Troca('.','/',sDta))+
           ' AND   t.des_aux1='+QuotedStr(sCodFilial);
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;
    s:=DMBelShop.CDS_Busca.FieldByName('tip_aux').AsString;
    DMBelShop.CDS_Busca.Close;

    If Trim(s)='' Then
    Begin
      MySql:=' Insert Into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1)'+
             ' Values ('+
             QuotedStr('5')+','+
             ' (SELECT COALESCE(MAX(t.Cod_Aux)+1 ,1) FROM TAB_AUXILIAR t WHERE t.tip_aux=5),'+
             QuotedStr(f_Troca('.','/',sDta))+', '+
             QuotedStr(sCodFilial)+')';
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End;

    // Exclui Tabela de Calculo de Contribuição INSS =================
    MySql:=' DELETE FROM tab_auxiliar t'+
           ' WHERE t.tip_aux=5'+
           ' AND NOT EXISTS (SELECT 1'+
           ' FROM ps_vales_pessoas i'+
           ' WHERE i.tp_pessoa=1'+
           ' AND   i.ind_debcred='+QuotedStr('I')+
           ' AND'+
           ' CAST(LPAD(EXTRACT(DAY FROM i.dta_vencimento),2,''0'') AS VARCHAR(2))||''/''||'+
           ' CAST(LPAD(EXTRACT(MONTH FROM i.dta_vencimento),2,''0'') AS VARCHAR(2))||''/''||'+
           ' CAST(LPAD(EXTRACT(YEAR FROM i.dta_vencimento),4,''0'') AS VARCHAR(4))=t.des_aux)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ===========================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);
      Result:=False;

      DateSeparator:='/';
      DecimalSeparator:=',';
    End; // on e : Exception do
  End; // Try

  FrmBelShop.MontaProgressBar(False, FrmSalao);

End; // CONTRIBUIÇÃO INSS / PLANODE SAUDE - Calcula Contibuições de INSS ///////

// INSS-PLANO DE SAUDE-SINDICATO - Busca Movtos ////////////////////////////////
Function TFrmSalao.ProfBuscaDebitos(sTipo: String): Boolean;
Var
  MySql: String;
  cVlrTotPaga, cVlrTotNPaga: Currency;
  bQuebra: Boolean;
Begin
  // sTipo: (I) Contribuiçao INSS
  //        (S) Taxa Sindicato

  Result:=False;

  If EdtINSS_PSCodLoja.Value=0 Then
  Begin
    EdtINSS_PSCodLoja.SetFocus;
    Exit;
  End;

  If Trim(Cbx_INSS_PSMes.Text)='' Then
  Begin
    msg('Valor Informar o Mês de Compotência !!','A');
    Cbx_INSS_PSMes.SetFocus;
    Exit;
  End;

  Screen.Cursor:=crAppStart;

  //============================================================================
  // Contribuição INSS =========================================================
  //============================================================================
  If sTipo='I' Then
  Begin
    MySql:=' SELECT p.des_profissional, p.des_apelido,'+
           ' i.des_docto Inscr_INSS, i.vlr_original Vlr_SalMinimo,'+
           ' i.per_percentual Per_INSS, i.vlr_prestacao Vlr_Contribuicao,'+
           ' i.dta_vencimento,'+
           ' CASE'+
           '   WHEN i.vlr_pago=0 THEN ''NAO'''+
           '   ELSE ''SIM'''+
           ' END Pago,'+
           ' i.num_seq, i.cod_loja, i.cod_pessoa Cod_Prof, i.num_docto,'+
           ' i.vlr_apagar, i.vlr_pago, p.ind_cobra_inss'+

           ' FROM ps_vales_pessoas i, sal_profissionais p'+

           ' WHERE i.cod_pessoa=p.cod_profissional'+
           ' AND   i.cod_loja=p.cod_loja'+
           ' AND   i.tp_pessoa=1'+
           ' AND   p.tip_pessoa='+QuotedStr('P')+
           ' AND   i.ind_debcred='+QuotedStr('I')+
           ' AND   i.cod_loja='+QuotedStr(FormatFloat('00',EdtINSS_PSCodLoja.AsInteger))+
           ' AND   i.num_docto='+sgMesVenc+sgAnoVenc+

           ' ORDER BY p.ind_cobra_inss Desc, p.des_profissional';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    try
      DMSalao.CDS_V_Inss.EmptyDataSet;
      DMSalao.CDS_V_Inss.Open;
    Except
      DMSalao.CDS_V_Inss.CreateDataSet;
      DMSalao.CDS_V_Inss.Open;
    End;

    // Se Não Existe Contribuição INSS =========================================
    If DMBelShop.CDS_Busca.IsEmpty Then
    Begin
      DMBelShop.CDS_Busca.Close;

      Screen.Cursor:=crDefault;
      Dbg_ProfINSS.SetFocus;
      Exit;
    End;

    // Cabecalho ===============================================================
    DMSalao.CDS_V_Inss.Append;
    DMSalao.CDS_V_InssNOME.AsString:='BEL_'+FormatFloat('00',EdtINSS_PSCodLoja.AsInteger)+' - '+EdtINSS_PSDesLoja.Text;
    DMSalao.CDS_V_Inss.Post;

    DMSalao.CDS_V_Inss.Append;
    DMSalao.CDS_V_InssNOME.AsString:='COMPETÊNCIA: '+Cbx_INSS_PSMes.Text+'/'+EdtINSS_PSAno.Text;
    DMSalao.CDS_V_Inss.Post;

    DMSalao.CDS_V_Inss.Append;
    DMSalao.CDS_V_InssNOME.AsString:='';
    DMSalao.CDS_V_Inss.Post;

    DMSalao.CDS_V_Inss.Append;
    DMSalao.CDS_V_InssNOME.AsString:='>> RELAÇÃO DE CONTRIBUIÇÃO DE INSS >>>>>>>>';
    DMSalao.CDS_V_Inss.Post;

    // Detalhes ================================================================
    cVlrTotPaga:=0;
    cVlrTotNPaga:=0;
    bQuebra:=False;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      If DMBelShop.CDS_Busca.FieldByName('ind_cobra_inss').AsString='SIM' Then
      Begin
        cVlrTotPaga:=cVlrTotPaga+DMBelShop.CDS_Busca.FieldByName('vlr_apagar').AsCurrency;
      End; // If DMBelShop.CDS_Busca.FieldByName('ind_cobra_inss').AsString='SIM' Then

      If DMBelShop.CDS_Busca.FieldByName('ind_cobra_inss').AsString='NAO' Then
      Begin
        If cVlrTotNPaga=0 Then
        Begin
          bQuebra:=True;

          // Cabecalho
          DMSalao.CDS_V_Inss.Append;
          DMSalao.CDS_V_InssNOME.AsString:='>> TOTAL DE CONTRIBUIÇÃO DE INSS >>>>>>>>';
          DMSalao.CDS_V_InssVLR_APAGAR.AsCurrency:=cVlrTotPaga;
          DMSalao.CDS_V_Inss.Post;

          DMSalao.CDS_V_Inss.Append;
          DMSalao.CDS_V_InssNOME.AsString:='';
          DMSalao.CDS_V_Inss.Post;

          DMSalao.CDS_V_Inss.Append;
          DMSalao.CDS_V_InssNOME.AsString:='>> NÃO COBRAR CONTRIBUIÇÃO DE INSS >>>>>>>>';
          DMSalao.CDS_V_Inss.Post;
        End; // If cVlrTotNPaga=0 Then

        cVlrTotNPaga:=cVlrTotNPaga+DMBelShop.CDS_Busca.FieldByName('vlr_apagar').AsCurrency;
      End; // If DMBelShop.CDS_Busca.FieldByName('ind_cobra_inss').AsString='SIM' Then

      DMSalao.CDS_V_Inss.Append;
      DMSalao.CDS_V_InssNOME.AsString:=DMBelShop.CDS_Busca.FieldByName('Des_Profissional').AsString;
      DMSalao.CDS_V_InssAPELIDO.AsString:=DMBelShop.CDS_Busca.FieldByName('Des_Apelido').AsString;
      DMSalao.CDS_V_InssNUM_INSS.AsString:=DMBelShop.CDS_Busca.FieldByName('Inscr_INSS').AsString;
      DMSalao.CDS_V_InssPER_INSS.AsString:=DMBelShop.CDS_Busca.FieldByName('Per_INSS').AsString;
      DMSalao.CDS_V_InssVLR_APAGAR.AsString:=DMBelShop.CDS_Busca.FieldByName('Vlr_Apagar').AsString;
      DMSalao.CDS_V_InssDTA_VENCIMENTO.AsDateTime:=DMBelShop.CDS_Busca.FieldByName('Dta_Vencimento').AsDateTime;
      DMSalao.CDS_V_InssPAGO.AsString:=DMBelShop.CDS_Busca.FieldByName('Pago').AsString;
      DMSalao.CDS_V_InssCODIGO.AsString:=DMBelShop.CDS_Busca.FieldByName('Cod_Prof').AsString;
      DMSalao.CDS_V_InssLOJA.AsString:=DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString;
      DMSalao.CDS_V_InssNUM_SEQ.AsString:=DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString;
      DMSalao.CDS_V_INSS.Post;

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do

    // Totaliza no Final =======================================================
    If bQuebra Then
     Begin
       // Total de Quem Já Contem Contribuições de INSS
       DMSalao.CDS_V_Inss.Append;
       DMSalao.CDS_V_InssNOME.AsString:='>> TOTAL NÃO COBRAR CONTRIBUIÇÃO DE INSS >>>>>>>>';
       DMSalao.CDS_V_InssVLR_APAGAR.AsCurrency:=cVlrTotNPaga;
       DMSalao.CDS_V_Inss.Post;
     End
    Else
     Begin
       // Total de Contribuições de INSS
       DMSalao.CDS_V_Inss.Append;
       DMSalao.CDS_V_InssNOME.AsString:='>> TOTAL DE CONTRIBUIÇÃO DE INSS >>>>>>>>';
       DMSalao.CDS_V_InssVLR_APAGAR.AsCurrency:=cVlrTotPaga;
       DMSalao.CDS_V_Inss.Post;
     End;

    DMSalao.CDS_V_Inss.First;
    DMBelShop.CDS_Busca.Close;

    Dbg_ProfINSS.SetFocus;
  End; // If sTipo='I' Then

  //============================================================================
  // Taxa Sindicato ============================================================
  //============================================================================
  If sTipo='S' Then
  Begin
    MySql:=' SELECT p.des_profissional, p.des_apelido,'+
           ' ps.num_docto, ps.des_docto,'+
           ' ps.dta_vencimento, ps.vlr_apagar,'+
           ' ps.vlr_pago, ps.dta_pagamento, ps.num_docto_pagto,'+
           ' ps.num_seq, ps.cod_loja, ps.cod_pessoa Cod_Prof'+

           ' FROM ps_vales_pessoas ps, sal_profissionais p'+

           ' WHERE ps.cod_pessoa=p.cod_profissional'+
           ' AND   ps.cod_loja=p.cod_loja'+
           ' AND   ps.tp_pessoa=1'+
           ' AND   p.tip_pessoa='+QuotedStr('P')+
           ' AND   ps.ind_debcred='+QuotedStr('S')+
           ' AND   ps.cod_loja='+QuotedStr(FormatFloat('00',EdtINSS_PSCodLoja.AsInteger))+
           ' AND   ps.dta_vencimento='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text)))+

           ' ORDER BY p.des_profissional';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    try
      DMSalao.CDS_V_TaxaSindicato.EmptyDataSet;
      DMSalao.CDS_V_TaxaSindicato.Open;
    Except
      DMSalao.CDS_V_TaxaSindicato.CreateDataSet;
      DMSalao.CDS_V_TaxaSindicato.Open;
    End;

    // Se Não Existe Taxa Sindicato ============================================
    If DMBelShop.CDS_Busca.IsEmpty Then
    Begin
      DMBelShop.CDS_Busca.Close;

      Screen.Cursor:=crDefault;
      msg('Sem Taxa Sindicato'+cr+cr+'Calculada no Mês Selecionado !!','A');
      Dbg_ProfTaxaSindicato.SetFocus;
      Exit;
    End;

    // Cabecalho ===============================================================
    DMSalao.CDS_V_TaxaSindicato.Append;
    DMSalao.CDS_V_TaxaSindicatoNOME.AsString:='BEL_'+FormatFloat('00',EdtINSS_PSCodLoja.AsInteger)+' - '+EdtINSS_PSDesLoja.Text;
    DMSalao.CDS_V_TaxaSindicato.Post;

    DMSalao.CDS_V_TaxaSindicato.Append;
    DMSalao.CDS_V_TaxaSindicatoNOME.AsString:='COMPETÊNCIA: '+Cbx_INSS_PSMes.Text+'/'+EdtINSS_PSAno.Text;
    DMSalao.CDS_V_TaxaSindicato.Post;

    DMSalao.CDS_V_TaxaSindicato.Append;
    DMSalao.CDS_V_TaxaSindicatoNOME.AsString:='';
    DMSalao.CDS_V_TaxaSindicato.Post;

    DMSalao.CDS_V_TaxaSindicato.Append;
    DMSalao.CDS_V_TaxaSindicatoNOME.AsString:='>> RELAÇÃO DE TAXAS DE SINDICATO >>>>>>>>';
    DMSalao.CDS_V_TaxaSindicato.Post;

    // Detalhes ================================================================
    cVlrTotPaga:=0;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      cVlrTotPaga:=cVlrTotPaga+DMBelShop.CDS_Busca.FieldByName('vlr_apagar').AsCurrency;

      DMSalao.CDS_V_TaxaSindicato.Append;
      DMSalao.CDS_V_TaxaSindicatoNOME.AsString:=DMBelShop.CDS_Busca.FieldByName('Des_Profissional').AsString;
      DMSalao.CDS_V_TaxaSindicatoAPELIDO.AsString:=DMBelShop.CDS_Busca.FieldByName('Des_Apelido').AsString;
      DMSalao.CDS_V_TaxaSindicatoNUM_DOCTO.AsString:=DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString;
      DMSalao.CDS_V_TaxaSindicatoDES_DOCTO.AsString:=DMBelShop.CDS_Busca.FieldByName('Des_Docto').AsString;
      DMSalao.CDS_V_TaxaSindicatoDTA_VENCIMENTO.AsDateTime:=DMBelShop.CDS_Busca.FieldByName('Dta_Vencimento').AsDateTime;
      DMSalao.CDS_V_TaxaSindicatoVLR_APAGAR.AsString:=DMBelShop.CDS_Busca.FieldByName('Vlr_Apagar').AsString;
      DMSalao.CDS_V_TaxaSindicatoVLR_PAGO.AsString:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pago').AsString;

      If Trim(DMBelShop.CDS_Busca.FieldByName('Dta_Pagamento').AsString)<>'' Then
       DMSalao.CDS_V_TaxaSindicatoDTA_PAGAMENTO.AsDateTime:=DMBelShop.CDS_Busca.FieldByName('Dta_Pagamento').AsDateTime;

      DMSalao.CDS_V_TaxaSindicatoNUM_DOCTO_PAGTO.AsString:=DMBelShop.CDS_Busca.FieldByName('Num_Docto_Pagto').AsString;
      DMSalao.CDS_V_TaxaSindicatoNUM_SEQ.AsString:=DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString;
      DMSalao.CDS_V_TaxaSindicatoLOJA.AsString:=DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString;
      DMSalao.CDS_V_TaxaSindicatoCODIGO.AsString:=DMBelShop.CDS_Busca.FieldByName('Cod_Prof').AsString;
      DMSalao.CDS_V_TaxaSindicato.Post;

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do

    // Totaliza no Final =======================================================
    DMSalao.CDS_V_TaxaSindicato.Append;
    DMSalao.CDS_V_TaxaSindicatoNOME.AsString:='>> TOTAL TAXAS SINDICATO >>>>>>>>>>>>>';
    DMSalao.CDS_V_TaxaSindicatoVLR_APAGAR.AsCurrency:=cVlrTotPaga;
    DMSalao.CDS_V_TaxaSindicato.Post;

    DMSalao.CDS_V_TaxaSindicato.First;
    DMBelShop.CDS_Busca.Close;

    Dbg_ProfTaxaSindicato.SetFocus;
  End; // If sTipo='S' Then

  Result:=True;
  Screen.Cursor:=crDefault;
End; // INSS-PLANO DE SAUDE-SINDICATO - Busca Movtos ///////////////////////////

// PLANILHA DE PAGAMENTOS - Apresenta no Grid Profissionais de Recebimentos ////
Procedure TFrmSalao.ProfSemRecebementos(Var iIndex:Integer);
Begin
  DMSalao.CDS_V_PagtoProf.First;
  While Not DMSalao.CDS_V_PagtoProf.Eof do
  Begin
    If DMSalao.CDS_V_PagtoProfCALCULAR.AsString='SIM' Then
    Begin
      If Not DMSalao.CDS_V_PagtosDebCred.Locate('COD_PROF',DMSalao.CDS_V_PagtoProfCODIGO.AsString,[]) Then
      Begin
        // Profissional Sem Recebimento
        DMSalao.CDS_V_PagtosDebCred.Append;
        DMSalao.CDS_V_PagtosDebCredCOD_PROF.AsString:=DMSalao.CDS_V_PagtoProfCODIGO.AsString;
        DMSalao.CDS_V_PagtosDebCredDES_PROFISSIONAL.AsString:=DMSalao.CDS_V_PagtoProfNOME.AsString;
        DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsCurrency:=0;
        DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsCurrency:=0;
        DMSalao.CDS_V_PagtosDebCredVLR_SALDO.AsCurrency:=0;
        DMSalao.CDS_V_PagtosDebCredSINTETICO.AsString:='S';
        iIndex:=iIndex+1;
        DMSalao.CDS_V_PagtosDebCredINDEX.AsInteger:=iIndex;
        DMSalao.CDS_V_PagtosDebCred.Post;

        DMSalao.CDS_V_PagtosDebCred.Append;
        DMSalao.CDS_V_PagtosDebCredCOD_PROF.AsString:='';
        DMSalao.CDS_V_PagtosDebCredSINTETICO.AsString:='S';
        iIndex:=iIndex+1;
        DMSalao.CDS_V_PagtosDebCredINDEX.AsInteger:=iIndex;
        DMSalao.CDS_V_PagtosDebCred.Post;
      End; // If Not DMSalao.CDS_V_PagtosDebCred.Locate('COD_PROF',DMSalao.CDS_V_PagtoProfCODIGO.AsString) Then
    End; // If DMSalao.CDS_V_PagtoProfCALCULAR.AsString='SIM' Then

    DMSalao.CDS_V_PagtoProf.Next;
  End; // While Not DMSalao.CDS_V_PagtoProf.Eof
  DMSalao.CDS_V_PagtoProf.First;

End; // PLANILHA DE PAGAMENTOS - Apresenta no Grid Profissionais de Recebimentos

// PLANILHA DE PAGAMENTOS - Apresenta Debito/Credito no Grid ///////////////////
Procedure TFrmSalao.ProfApresentaDebCredGrid;
Var
  sCodProf, sCodProfi: String;

  cVlrArredondar,
  cSaldo, cTotDeb, cTotCred,
  cTotGeralDeb, cTotGeralCred : Currency;

  iIndex, iIndexProf: Integer;

  // Calcula Arredondamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Procedure ProfArredontamentos;
  Begin
    If cTotCred<cTotDeb Then
    Begin
      cVlrArredondar:=Abs(cTotCred-cTotDeb);

      cTotCred:=cTotCred+cVlrArredondar;
      cTotGeralCred:=cTotGeralCred+cVlrArredondar;

      // Detalhes ================================================================
      DMSalao.CDS_V_PagtosDebCred.Append;
      DMSalao.CDS_V_PagtosDebCredDES_PROFISSIONAL.AsString:='ARREDONDAMENTO ATUAL';
      DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsCurrency:=cVlrArredondar;
      DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsCurrency:=0.00;

      cSaldo:=cSaldo+cVlrArredondar;
      DMSalao.CDS_V_PagtosDebCredVLR_SALDO.AsCurrency:=cSaldo;

      DMSalao.CDS_V_PagtosDebCredNUM_DOCTO.AsString:='1';
      DMSalao.CDS_V_PagtosDebCredVLR_ORIGINAL.AsCurrency:=cVlrArredondar;
      DMSalao.CDS_V_PagtosDebCredNUM_PRESTACOES.AsString:='Unica';
      DMSalao.CDS_V_PagtosDebCredDTA_PRIM_VENC.AsString:=f_Troca('.','/',sgDtaF);
      DMSalao.CDS_V_PagtosDebCredNUM_PRESTACAO.AsString:='Unica';
      DMSalao.CDS_V_PagtosDebCredDTA_VENCIMENTO.AsString:=f_Troca('.','/',sgDtaF);
      DMSalao.CDS_V_PagtosDebCredVLR_PRESTACAO.AsCurrency:=cVlrArredondar;
      DMSalao.CDS_V_PagtosDebCredVLR_DESCONTO.AsCurrency:=0.00;
      DMSalao.CDS_V_PagtosDebCredVLR_ACRESCIMO.AsCurrency:=0.00;
      DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger:=8;
      DMSalao.CDS_V_PagtosDebCredNUM_SEQ.AsInteger:=0;
      DMSalao.CDS_V_PagtosDebCredCODPROF.AsString:=sCodProfi;

      iIndex:=iIndex+1;
      DMSalao.CDS_V_PagtosDebCredINDEX.AsInteger:=iIndex;
      DMSalao.CDS_V_PagtosDebCred.Post;
    End;
  End; // Calcula Arredondamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


  // Cria Dados da Planilha de Debitos/Creditos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Procedure Detalhes(sTipo: String);
  Begin
    // sTipo=''  Dados do Profissiona nos Detalhes (Codigo e Nome)
    // sTipo='P' Profissional
    // sTipo='F' Final do Arquivo

    // Final do Arquivo ========================================================
    If sTipo='F' Then
    Begin
      // Crédito de Arredondamento ----------------------------------
      ProfArredontamentos;

      // Acerta Totais do Profissional
      DMSalao.CDS_V_PagtosDebCred.Locate('INDEX', iIndexProf,[]);
      DMSalao.CDS_V_PagtosDebCred.Edit;
      DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsCurrency:=cTotCred;
      DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsCurrency:=cTotDeb;
      DMSalao.CDS_V_PagtosDebCredVLR_SALDO.AsCurrency:=cTotCred-cTotDeb;
      DMSalao.CDS_V_PagtosDebCred.Post;

      DMSalao.CDS_V_PagtosDebCred.Append;
      DMSalao.CDS_V_PagtosDebCredCOD_PROF.AsString:='';
      DMSalao.CDS_V_PagtosDebCredSINTETICO.AsString:='S';
      iIndex:=iIndex+1;
      DMSalao.CDS_V_PagtosDebCredINDEX.AsInteger:=iIndex;
      DMSalao.CDS_V_PagtosDebCred.Post;

      // Profissionais Sem Recebimentos -----------------------------
      ProfSemRecebementos(iIndex);

      DMSalao.CDS_V_PagtosDebCred.Append;
      DMSalao.CDS_V_PagtosDebCredDES_PROFISSIONAL.AsString:='--- TOTAL GERAL ---';
      DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsCurrency:=cTotGeralCred;
      DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsCurrency:=cTotGeralDeb;
      DMSalao.CDS_V_PagtosDebCredVLR_SALDO.AsCurrency:=cTotGeralCred-cTotGeralDeb;
      DMSalao.CDS_V_PagtosDebCredSINTETICO.AsString:='S';
      iIndex:=iIndex+1;
      DMSalao.CDS_V_PagtosDebCredINDEX.AsInteger:=iIndex;
      DMSalao.CDS_V_PagtosDebCred.Post;

      Exit;
    End;

    // Profissional ============================================================
    If sTipo='P' Then
    Begin
      If DMBelShop.CDS_Busca.RecNo<>1 Then
      Begin
        // Crédito de Arredondamento --------------------------------
        ProfArredontamentos;

        // Acerta Totais do Profissional
        DMSalao.CDS_V_PagtosDebCred.Locate('INDEX', iIndexProf,[]);
        DMSalao.CDS_V_PagtosDebCred.Edit;
        DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsCurrency:=cTotCred;
        DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsCurrency:=cTotDeb;
        DMSalao.CDS_V_PagtosDebCredVLR_SALDO.AsCurrency:=cTotCred-cTotDeb;
        DMSalao.CDS_V_PagtosDebCred.Post;

        cTotCred:=0;
        cTotDeb:=0;
        cSaldo:=0;

        DMSalao.CDS_V_PagtosDebCred.Append;
        DMSalao.CDS_V_PagtosDebCredCOD_PROF.AsString:='';
        DMSalao.CDS_V_PagtosDebCredSINTETICO.AsString:='S';
        iIndex:=iIndex+1;
        DMSalao.CDS_V_PagtosDebCredINDEX.AsInteger:=iIndex;
        DMSalao.CDS_V_PagtosDebCred.Post;
      End; // If DMBelShop.CDS_Busca.RecNo<>1 Then

      sCodProfi:=DMBelShop.CDS_Busca.FieldByName('COD_PROFISSIONAL').AsString;
      DMSalao.CDS_V_PagtosDebCred.Append;
      DMSalao.CDS_V_PagtosDebCredCOD_PROF.AsString:=
                           DMBelShop.CDS_Busca.FieldByName('COD_PROFISSIONAL').AsString;
      DMSalao.CDS_V_PagtosDebCredDES_PROFISSIONAL.AsString:=
                   DMBelShop.CDS_Busca.FieldByName('DES_PROFISSIONAL').AsString;
      DMSalao.CDS_V_PagtosDebCredSINTETICO.AsString:='S';
      iIndex:=iIndex+1;
      DMSalao.CDS_V_PagtosDebCredINDEX.AsInteger:=iIndex;
      DMSalao.CDS_V_PagtosDebCred.Post;

      iIndexProf:=iIndex;
    End; // If sTipo='P' Then

    // Detalhes ================================================================
    DMSalao.CDS_V_PagtosDebCred.Append;
    DMSalao.CDS_V_PagtosDebCredDES_PROFISSIONAL.AsString:=
                          DMBelShop.CDS_Busca.FieldByName('DES_DOCTO').AsString;
    DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsCurrency:=
                     DMBelShop.CDS_Busca.FieldByName('VLR_CREDITOS').AsCurrency;
    DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsCurrency:=
                      DMBelShop.CDS_Busca.FieldByName('VLR_DEBITOS').AsCurrency;

    cSaldo:=cSaldo+(DMBelShop.CDS_Busca.FieldByName('VLR_CREDITOS').AsCurrency-
                    DMBelShop.CDS_Busca.FieldByName('VLR_DEBITOS').AsCurrency);
    DMSalao.CDS_V_PagtosDebCredVLR_SALDO.AsCurrency:=cSaldo;

    DMSalao.CDS_V_PagtosDebCredNUM_DOCTO.AsString:=
                          DMBelShop.CDS_Busca.FieldByName('NUM_DOCTO').AsString;
    DMSalao.CDS_V_PagtosDebCredVLR_ORIGINAL.AsCurrency:=
                     DMBelShop.CDS_Busca.FieldByName('VLR_ORIGINAL').AsCurrency;
    DMSalao.CDS_V_PagtosDebCredNUM_PRESTACOES.AsString:=
                     DMBelShop.CDS_Busca.FieldByName('NUM_PRESTACOES').AsString;
    DMSalao.CDS_V_PagtosDebCredDTA_PRIM_VENC.AsString:=
                      DMBelShop.CDS_Busca.FieldByName('DTA_PRIM_VENC').AsString;
    DMSalao.CDS_V_PagtosDebCredNUM_PRESTACAO.AsString:=
                      DMBelShop.CDS_Busca.FieldByName('NUM_PRESTACAO').AsString;
    DMSalao.CDS_V_PagtosDebCredDTA_VENCIMENTO.AsString:=
                     DMBelShop.CDS_Busca.FieldByName('DTA_VENCIMENTO').AsString;
    DMSalao.CDS_V_PagtosDebCredVLR_PRESTACAO.AsCurrency:=
                    DMBelShop.CDS_Busca.FieldByName('VLR_PRESTACAO').AsCurrency;
    DMSalao.CDS_V_PagtosDebCredVLR_DESCONTO.AsCurrency:=
                     DMBelShop.CDS_Busca.FieldByName('VLR_DESCONTO').AsCurrency;
    DMSalao.CDS_V_PagtosDebCredVLR_ACRESCIMO.AsCurrency:=
                   DMBelShop.CDS_Busca.FieldByName('VLR_ACRESCIMOS').AsCurrency;
    DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger:=
                           DMBelShop.CDS_Busca.FieldByName('TIP_DOC').AsInteger;
    DMSalao.CDS_V_PagtosDebCredNUM_SEQ.AsInteger:=
                           DMBelShop.CDS_Busca.FieldByName('NUM_SEQ').AsInteger;
    DMSalao.CDS_V_PagtosDebCredCODPROF.AsString:=sCodProfi;

    iIndex:=iIndex+1;
    DMSalao.CDS_V_PagtosDebCredINDEX.AsInteger:=iIndex;
    DMSalao.CDS_V_PagtosDebCred.Post;
  End; // Cria Dados da Planilha de Comissões >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Begin
  try
    DMSalao.CDS_V_PagtosDebCred.CreateDataSet;
    DMSalao.CDS_V_PagtosDebCred.IndexFieldNames:='';
    DMSalao.CDS_V_PagtosDebCred.Open;
  Except
    DMSalao.CDS_V_PagtosDebCred.EmptyDataSet;
    DMSalao.CDS_V_PagtosDebCred.IndexFieldNames:='';
    DMSalao.CDS_V_PagtosDebCred.Open;
  End;

  sCodProf:='';

  cSaldo:=0;
  cTotDeb:=0;
  cTotCred:=0;
  cTotGeralDeb:=0;
  cTotGeralCred:=0;

  iIndex:=0;
  iIndexProf:=0;

  // Cabecalho da Planilha =====================================================
  DMSalao.CDS_V_PagtosDebCred.Append;
  DMSalao.CDS_V_PagtosDebCredDES_PROFISSIONAL.AsString:='PLANILHA DE CONFERENCIA DÉBITOS/CRÉDITOS';
  DMSalao.CDS_V_PagtosDebCredSINTETICO.AsString:='S';
  iIndex:=iIndex+1;
  DMSalao.CDS_V_PagtosDebCredINDEX.AsInteger:=iIndex;
  DMSalao.CDS_V_PagtosDebCred.Post;

  DMSalao.CDS_V_PagtosDebCred.Append;
  DMSalao.CDS_V_PagtosDebCredDES_PROFISSIONAL.AsString:=
                             'Bel_'+FormatFloat('00',EdtPagtoCodLoja.AsInteger)+
                             ': '+EdtPagtoDesLoja.Text;
  DMSalao.CDS_V_PagtosDebCredSINTETICO.AsString:='S';
  iIndex:=iIndex+1;
  DMSalao.CDS_V_PagtosDebCredINDEX.AsInteger:=iIndex;
  DMSalao.CDS_V_PagtosDebCred.Post;

  DMSalao.CDS_V_PagtosDebCred.Append;
  DMSalao.CDS_V_PagtosDebCredDES_PROFISSIONAL.AsString:='Período de: '+sgPeriodoIni+' a '+sgPeriodoFim;
  DMSalao.CDS_V_PagtosDebCredSINTETICO.AsString:='S';
  iIndex:=iIndex+1;
  DMSalao.CDS_V_PagtosDebCredINDEX.AsInteger:=iIndex;
  DMSalao.CDS_V_PagtosDebCred.Post;

  DMSalao.CDS_V_PagtosDebCred.Append;
  DMSalao.CDS_V_PagtosDebCredCOD_PROF.AsString:='';
  DMSalao.CDS_V_PagtosDebCredSINTETICO.AsString:='S';
  iIndex:=iIndex+1;
  DMSalao.CDS_V_PagtosDebCredINDEX.AsInteger:=iIndex;
  DMSalao.CDS_V_PagtosDebCred.Post;

  FrmBelShop.MontaProgressBar(True, FrmSalao);
  pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
  pgProgBar.Position:=0;

  // Monta Planilha de Pagamentos ==============================================
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    Application.ProcessMessages;

    pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;
    pgProgBar.Refresh;

    cTotGeralCred:=cTotGeralCred+
                     DMBelShop.CDS_Busca.FieldByName('VLR_CREDITOS').AsCurrency;
    cTotGeralDeb:=cTotGeralDeb+
                      DMBelShop.CDS_Busca.FieldByName('VLR_DEBITOS').AsCurrency;

    If sCodProf=DMBelShop.CDS_Busca.FieldByName('COD_PROFISSIONAL').AsString Then
     Begin
       // Totais
       cTotCred:=cTotCred+
                     DMBelShop.CDS_Busca.FieldByName('VLR_CREDITOS').AsCurrency;
       cTotDeb:=cTotDeb+
                      DMBelShop.CDS_Busca.FieldByName('VLR_DEBITOS').AsCurrency;

       Detalhes('');
     End
    Else // If sCodProf=DMBelShop.CDS_Busca.FieldByName('COD_PROFISSIONAL').AsString Then
     Begin
       Detalhes('P');

       // Totais
       cTotCred:=cTotCred+
                     DMBelShop.CDS_Busca.FieldByName('VLR_CREDITOS').AsCurrency;
       cTotDeb:=cTotDeb+
                      DMBelShop.CDS_Busca.FieldByName('VLR_DEBITOS').AsCurrency;
     End; // If sCodProf=DMBelShop.CDS_Busca.FieldByName('COD_PROFISSIONAL').AsString Then

    sCodProf:=DMBelShop.CDS_Busca.FieldByName('COD_PROFISSIONAL').AsString;

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do

  // Parte Final ===============================================================
  Detalhes('F');

  FrmBelShop.MontaProgressBar(False, FrmSalao);
  Screen.Cursor:=crDefault;

  DMBelShop.CDS_Busca.Close;

  DMSalao.CDS_V_PagtosDebCred.IndexFieldNames:='INDEX';
  DMSalao.CDS_V_PagtosDebCred.First;

  THackDBGridSalao(Dbg_PagtosDebCred).FixedCols:=3;
End; // PLANILHA DE PAGAMENTOS - Apresenta Debito/Credito no Grid //////////////

// IMPORTAÇÃO DEBITOS RH - PLANO DE SAUDE //////////////////////////////////////
Procedure TFrmSalao.ProfImportaPlanoSaude;
Var
  ii, i: Integer;
  s, MySql: String;
  bSiga: Boolean;
  sCodLoja, sCodProf: String;
Begin

  gCDS_V1:=TClientDataSet.Create(Self);
  gCDS_V1.FieldDefs.Clear;
  gCDS_V1.FieldDefs.Add('Arquivo',ftString,30);
  gCDS_V1.FieldDefs.Add('CPF',ftString,14);
  gCDS_V1.FieldDefs.Add('Titular',ftString,100);
  gCDS_V1.CreateDataSet;
  gCDS_V1.Open;

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

    // Cria ProgressBar ====================================================
    FrmBelShop.MontaProgressBar(True, FrmSalao);

    Strg_ProfPlanoSaudeImpArquivo.ColWidths[0]:=200;
    Strg_ProfPlanoSaudeImpArquivo.ColWidths[1]:=80;
    Strg_ProfPlanoSaudeImpArquivo.ColWidths[2]:=200;
    Strg_ProfPlanoSaudeImpArquivo.ColWidths[3]:=80;
    Strg_ProfPlanoSaudeImpArquivo.ColWidths[4]:=60;
    Strg_ProfPlanoSaudeImpArquivo.ColWidths[5]:=200;
    Strg_ProfPlanoSaudeImpArquivo.Refresh;

    For i:=0 to Lbx_ProfPlanoSaudeImpArqSel.Items.Count-1 do
    Begin
      Lbx_ProfPlanoSaudeImpArqSel.Selected[i];

      XlsToStringGrid(Strg_ProfPlanoSaudeImpArquivo,IncludeTrailingPathDelimiter(EdtProfPlanoSaudePastaArquivo.Text)+Lbx_ProfPlanoSaudeImpArqSel.Items[i]);

      If Strg_ProfPlanoSaudeImpArquivo.RowCount>0 Then
      Begin
        // Verifica Estrutura ==================================================
        // Cells[coluna,linha]
        bSiga:=True;
        If (Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[0,0])<>'CAD_NOME') Or // TITULAR
           (Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[1,0])<>'CAD_CPF') Or
           (Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[2,0])<>'CAD_NOME1') Or
           (Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[3,0])<>'PARENTESCO') Or
           (Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[4,0])<>'VALOR') Or
           (Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[5,0])<>'PLA_DESCRICAO') Then
        Begin
          msg('Arquivo: '+Lbx_ProfPlanoSaudeImpArqSel.Items[i]+cr+'Com Estrutura Inválida !!'+cr+cr+'Verifique o Arquivo !!','A');
          bSiga:=False;
          Break;
        End;

        // Verifica se Arquivo já Foi Importado e Cobrado ======================
        If bSiga Then
        Begin
          MySql:=' SELECT pl.vlr_pago'+
                 ' FROM PS_VALES_PESSOAS pl'+
                 ' WHERE pl.tp_pessoa=1'+
                 ' AND   pl.ind_debcred='+QuotedStr('P')+
                 ' AND   pl.des_arquivo='+QuotedStr(Lbx_ProfPlanoSaudeImpArqSel.Items[i])+
                 ' ORDER BY pl.vlr_pago DESC';
          DMBelShop.CDS_BuscaRapida.Close;
          DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
          DMBelShop.CDS_BuscaRapida.Open;
          s:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('vlr_pago').AsString);
          DMBelShop.CDS_BuscaRapida.Close;

          If (StrToCurrDef(s,0)<>0) Then
          Begin
            msg('Arquivo: '+Lbx_ProfPlanoSaudeImpArqSel.Items[i]+cr+'Já Importado e Cobrado !!','A');
            bSiga:=False;
            Break;
          End;

          If bSiga Then
          Begin
            If (s<>'') And (StrToCurrDef(s,999999)=0) Then
            Begin
              If msg('Arquivo: '+Lbx_ProfPlanoSaudeImpArqSel.Items[i]+cr+'Já Importado e NÃO Cobrado !!'+cr+cr+'Deseja SUBSTITUÍ-LO ??','C')=1 Then
               Begin
                 // Exclui Todo o Movto Já Importado e Não Cobrado do Arquivo =========
                 MySql:=' DELETE FROM PS_VALES_PESSOAS pl'+
                        ' WHERE pl.tp_pessoa=1'+
                        ' AND   pl.ind_debcred='+QuotedStr('P')+
                        ' AND   pl.des_arquivo='+QuotedStr(Lbx_ProfPlanoSaudeImpArqSel.Items[i]);
                 DMBelShop.SQLC.Execute(MySql,nil,nil);

                 bSiga:=True;
               End
              Else
               Begin
                 bSiga:=False;
                 Break;
               End; // If msg('Arquivo: '+Lbx_ProfPlanoSaudeImpArqSel.Items[i]+cr+'Já Importado e NÃO Cobrado !!'+cr+cr+'Deseja SUBSTITUÍ-LO ??','C')=1 Then
            End; // If (s<>'') And (StrToCurrDef(s,999999)=0) Then
          End; // If bSiga Then
        End; // If bSiga Then

        If bSiga Then
        Begin
          pgProgBar.Properties.Max:=Strg_ProfPlanoSaudeImpArquivo.RowCount;
          Lb_Obs.Caption:='Aguarde !! Efetuando a Importação Plano de Saúde - Arquivo: '+Lbx_ProfPlanoSaudeImpArqSel.Items[i];

          // Acerta Valor Decimal
          For ii:=1 to Strg_ProfPlanoSaudeImpArquivo.RowCount-1 do
          Begin
            // Cells[coluna,linha]
            Strg_ProfPlanoSaudeImpArquivo.Cells[4,ii]:=ZerosCentavos(f_Troca('.',',',Strg_ProfPlanoSaudeImpArquivo.Cells[4,ii]),2)
          End;

          // Cells[coluna,linha]
          For ii:=1 to Strg_ProfPlanoSaudeImpArquivo.RowCount-1 do
          Begin
            pgProgBar.Position:=ii;

            Refresh;

            If (Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[0,ii])<>'') And
               (Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[1,ii])<>'') Then
            Begin
              // Busca Codigo do Profissional ==================================
              MySql:=' SELECT p.cod_loja, p.cod_profissional'+
                     ' FROM SAL_PROFISSIONAIS p'+
                     ' WHERE p.num_cpf='+QuotedStr(tbFmtCPForCNPJ(Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[1,ii])))+
                     ' ORDER BY p.ind_ativo DESC';
              DMBelShop.CDS_BuscaRapida.Close;
              DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
              DMBelShop.CDS_BuscaRapida.Open;
              sCodLoja:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('cod_loja').AsString);
              sCodProf:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('cod_profissional').AsString);
              DMBelShop.CDS_BuscaRapida.Close;

              If Trim(sCodLoja)='' Then
              Begin
                gCDS_V1.Append;
                gCDS_V1.FieldByName('Arquivo').AsString:=Lbx_ProfPlanoSaudeImpArqSel.Items[i];
                gCDS_V1.FieldByName('CPF').AsString:=tbFmtCPForCNPJ(Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[1,ii]));
                gCDS_V1.FieldByName('Titular').AsString:=Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[0,ii]);
                gCDS_V1.Post;
              End; // If Trim(sCodLoja)<>'' Then

              If Trim(sCodLoja)<>'' Then
              Begin
                // Insere Plano de Saude =======================================
                MySql:=' Insert into PS_VALES_PESSOAS ('+
                       ' NUM_SEQ, TP_PESSOA, COD_LOJA, COD_PESSOA,'+
                       ' NUM_DOCTO, DES_DOCTO, IND_DEBCRED, VLR_ORIGINAL,'+
                       ' TOT_PRESTACAO, NUM_PRAZO, DTA_PRIM_VENC,'+
                       ' NUM_PRESTACAO, DTA_VENCIMENTO, VLR_PRESTACAO,'+
                       ' VLR_DESCONTO, VLR_ACRESCIMOS, VLR_APAGAR, VLR_PAGO, NUM_DOCTO_PAGTO,'+
                       ' USU_INCLUI, DES_ARQUIVO)'+

                       ' Values ('+
                       '(SELECT GEN_ID(GEN_VALES,1) FROM RDB$DATABASE), '+ // NUM_SEQ
                       QuotedStr('1')+', '+ // TP_PESSOA
                       QuotedStr(sCodLoja)+', '+ // COD_LOJA
                       QuotedStr(sCodProf)+', '+ // COD_PESSOA
                       QuotedStr(Copy(sgDtaFim,4,2)+Copy(sgDtaFim,7,4))+', '+ // NUM_DOCTO
                       QuotedStr(Copy(Trim('PS-'+Strg_ProfPlanoSaudeImpArquivo.Cells[5,ii]),1,57))+', '+ // DES_DOCTO
                       QuotedStr('P')+', '+ // IND_DEBCRED
                       QuotedStr(f_Troca(',','.',Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[4,ii])))+', '+ // VLR_ORIGINAL
                       QuotedStr('1')+', '+ // TOT_PRESTACAO
                       QuotedStr('0')+', '+ // NUM_PRAZO
                       QuotedStr(sgDtaFim)+', '+ // DTA_PRIM_VENC
                       QuotedStr('1')+', '+ // NUM_PRESTACAO
                       QuotedStr(sgDtaFim)+', '+ // DTA_VENCIMENTO
                       QuotedStr(f_Troca(',','.',Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[4,ii])))+', '+ // VLR_PRESTACAO
                       QuotedStr('0')+', '+ // VLR_DESCONTO
                       QuotedStr('0')+', '+ // VLR_ACRESCIMOS
                       QuotedStr(f_Troca(',','.',Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[4,ii])))+', '+ // VLR_APAGAR
                       QuotedStr('0')+', '+ // VLR_PAGO
                       QuotedStr('0')+', '+ // NUM_DOCTO_PAGTO
                       QuotedStr(Cod_Usuario)+', '+ // USU_INCLUI
                       QuotedStr(Lbx_ProfPlanoSaudeImpArqSel.Items[i])+ // DES_ARQUIVO
                       ')';
                DMBelShop.SQLC.Execute(MySql,nil,nil);
              End; // If Trim(sCodLoja)<>'' Then
            End; // If Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[0,ii])<>'' Then

            // Salva Registro sem Titular (CAD_NOME Em Branco)
            If (Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[0,ii])='') Or
               (Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[1,ii])='') Then
            Begin
              gCDS_V1.Append;
              gCDS_V1.FieldByName('Arquivo').AsString:=Lbx_ProfPlanoSaudeImpArqSel.Items[i];
              gCDS_V1.FieldByName('CPF').AsString:=tbFmtCPForCNPJ(Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[1,ii]));
              gCDS_V1.FieldByName('Titular').AsString:=Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[0,ii]);
              gCDS_V1.Post;
            End; // If Trim(Strg_ProfPlanoSaudeImpArquivo.Cells[0,ii])='' Then

          End; // For ii:=1 to Strg_ProfPlanoSaudeImpArquivo.RowCount-1 do
        End; // If bSiga Then
        pgProgBar.Position:=pgProgBar.Properties.Max;

      End; // If Strg_ProfPlanoSaudeImpArquivo.RowCount>0 Then
    End; // For i:=0 to Lbx_ProfPlanoSaudeImpArqSel.Items.Count-1 do

    FrmBelShop.MontaProgressBar(False, FrmSalao);

    If bSiga Then
     Begin
       DMBelShop.SQLC.Commit(TD);
       msg('Importação Efetuada Com SUCESSO !!','A');
     End
    Else
     Begin
       // Abandona Transacao ====================================================
       DMBelShop.SQLC.Rollback(TD);
     End; // If bSiga Then

     LimpaStringGrid(Strg_ProfPlanoSaudeImpArquivo);
     EdtProfPlanoSaudePastaArquivo.Clear;
     Lbx_ProfPlanoSaudeImpArqSel.Items.Clear;

     DateSeparator:='/';
     DecimalSeparator:=',';
     Bt_ProfPlanoSaudeArquivo.SetFocus;

     Lb_Obs.Caption:='Observações...';

     Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      FrmBelShop.MontaProgressBar(False, FrmSalao);

      LimpaStringGrid(Strg_ProfPlanoSaudeImpArquivo);
      EdtProfPlanoSaudePastaArquivo.Clear;
      Lbx_ProfPlanoSaudeImpArqSel.Items.Clear;

      DateSeparator:='/';
      DecimalSeparator:=',';
      Lb_Obs.Caption:='Observações...';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);

      Exit;
    End; // on e : Exception do
  End; // Try

  // Apresenta Movimentos Plano de Saude =======================================
  If bSiga Then
  Begin
    If Not gCDS_V1.IsEmpty Then
    Begin
      msg('Existem CPF SEM o '+cr+'Profissional Correspondente !!'+cr+cr+' Verifique antes de continuar...','A');

      DMSalao.CDS_ApresGrid.Data:=gCDS_V1.Data;
      FreeAndNil(gCDS_V1);

      // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==========
      FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
      FrmBelShop.AbreSolicitacoes(16);

      FrmSolicitacoes.Caption:='PLANO DE SAÚDE';
      FrmSolicitacoes.Ts_ApresentaGrid.Caption:='MOVIMENTOS DE DÉBITOS (RH) PLANO DE SAÚDE';
      FrmSolicitacoes.ShowModal;

      FrmSolicitacoes.Free;
      FrmSolicitacoes:=nil;

      DMSalao.CDS_ApresGrid.Close;
    End; // If Not gCDS_V1.IsEmpty Then
    DMSalao.CDS_ApresGrid.Close;
  End; // If bSiga Then
End; // IMPORTAÇÃO DEBITOS RH - PLANO DE SAUDE /////////////////////////////////

// IMPORTAÇÃO DEBITOS RH - TECBIZ //////////////////////////////////////////////
Procedure TFrmSalao.ProfImportaTecBiz;
Var
  ii, i: Integer;
  s, sNomeProf, sMatriculaTecBiz, MySql: String;
  bSiga: Boolean;
Begin

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

    // Cria ProgressBar ====================================================
    FrmBelShop.MontaProgressBar(True, FrmSalao);

    For i:=0 to Lbx_ProfTecBizImpArqSel.Items.Count-1 do
    Begin
      Lbx_ProfTecBizImpArqSel.Selected[i];

      XlsToStringGrid(Strg_ProfTecBizImpArquivo,IncludeTrailingPathDelimiter(EdtProfTecBizPastaArquivo.Text)+Lbx_ProfTecBizImpArqSel.Items[i]);

      If Strg_ProfTecBizImpArquivo.RowCount>0 Then
      Begin
        // Verifica Estrutura ==================================================
        // Cells[coluna,linha]
        bSiga:=True;
        If (Trim(Strg_ProfTecBizImpArquivo.Cells[0,0])<>'Seq.') Or
           (Trim(Strg_ProfTecBizImpArquivo.Cells[1,0])<>'Código') Or
           (Trim(Strg_ProfTecBizImpArquivo.Cells[2,0])<>'Nome Associado') Or
           (Trim(Strg_ProfTecBizImpArquivo.Cells[3,0])<>'Total(R$)') Then
        Begin
          msg('Arquivo: '+Lbx_ProfTecBizImpArqSel.Items[i]+cr+'Com Estrutura Inválida !!'+cr+cr+'Verifique o Arquivo !!','A');
          bSiga:=False;
        End;

        // Verifica se Arquivo já Foi Cobrado ==================================
        MySql:=' SELECT FIRST 1 t.ind_pago'+
               ' FROM PS_TECBIZ t'+
               ' WHERE t.des_arquivo='+QuotedStr(Lbx_ProfTecBizImpArqSel.Items[i])+
               ' AND   t.dta_ini_periodo='+QuotedStr(sgDtaInicio)+
               ' AND   t.dta_fim_periodo='+QuotedStr(sgDtaFim);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;
        s:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('ind_pago').AsString);
        DMBelShop.CDS_BuscaRapida.Close;

        If s='SIM' Then
        Begin
          msg('Arquivo: '+Lbx_ProfTecBizImpArqSel.Items[i]+cr+'Já Importado e Cobrado !!','A');
          bSiga:=False;
        End;

        If bSiga Then
        Begin
          pgProgBar.Properties.Max:=Strg_ProfTecBizImpArquivo.RowCount;
          Lb_Obs.Caption:='Aguarde !! Efetuando a Importação TecBiz - Arquivo: '+Lbx_ProfTecBizImpArqSel.Items[i];

          // Processa Arquivo TecBiz ===========================================
          // Cells[coluna,linha]
          For ii:=1 to Strg_ProfTecBizImpArquivo.RowCount-1 do
          Begin
            sNomeProf       :=AnsiUpperCase((Trim(Strg_ProfTecBizImpArquivo.Cells[2,ii])));
            sMatriculaTecBiz:=Trim(Strg_ProfTecBizImpArquivo.Cells[1,ii]);

            If Trim(Strg_ProfTecBizImpArquivo.Cells[1,ii])='01040' Then
             MySql:=MySql;

            pgProgBar.Position:=ii;
            Refresh;

            If Trim(sMatriculaTecBiz)<>'' Then
            Begin
              // Verifica se Profissinal Existe com o Codigo do TecBiz =========
              MySql:=' SELECT p.cod_loja, p.des_profissional, p.cod_profissional,'+
                     '        p.num_matricula_tecbiz, p.ind_ativo'+
                     ' FROM  SAL_PROFISSIONAIS p'+
                     ' WHERE (Trim(UPPER(p.des_profissional))='+QuotedStr(sNomeProf)+
                     '        OR p.num_matricula_tecbiz='+QuotedStr(sMatriculaTecBiz)+')';

              MySqlOrderBy:=' ORDER BY p.num_matricula_tecbiz desc, p.ind_ativo desc';
              DMBelShop.CDS_Busca.Close;
              DMBelShop.SDS_Busca.CommandText:=MySql+MySqlOrderBy;
              DMBelShop.CDS_Busca.Open;

              // Se nâo Encontrou Busca Novamente com Nome Sem Acento ==========
              If Trim(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)='' Then
              Begin
                MySql:=' SELECT p.cod_loja, p.des_profissional, p.cod_profissional,'+
                       '        p.num_matricula_tecbiz, p.ind_ativo'+
                       ' FROM  SAL_PROFISSIONAIS p'+
                       ' WHERE (Trim(UPPER(p.des_profissional))='+ QuotedStr(TiraAcentos(sNomeProf))+
                       '        OR p.num_matricula_tecbiz='+QuotedStr(sMatriculaTecBiz)+')';
                DMBelShop.CDS_Busca.Close;
                DMBelShop.SDS_Busca.CommandText:=MySql+MySqlOrderBy;
                DMBelShop.CDS_Busca.Open;
              End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)='' Then

              // Se Ainda nâo Encontrou Busca Pelo Codigo ======================
              If Trim(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)='' Then
              Begin
                MySql:=' SELECT p.cod_loja, p.des_profissional, p.cod_profissional,'+
                       '        p.num_matricula_tecbiz, p.ind_ativo'+
                       ' FROM SAL_PROFISSIONAIS p'+
                       ' WHERE p.num_matricula_tecbiz='+QuotedStr(sMatriculaTecBiz);
                DMBelShop.CDS_Busca.Close;
                DMBelShop.SDS_Busca.CommandText:=MySql+MySqlOrderBy;
                DMBelShop.CDS_Busca.Open;
              End;

              // Se Encontrou Busca somente IND_Ativo e que Seja Profissional de Salão
              If DMBelShop.CDS_Busca.RecordCount>1 Then
              Begin
                MySql:=MySql+' AND p.tip_pessoa='+QuotedStr('P')+' AND p.ind_ativo='+QuotedStr('SIM');
                DMBelShop.CDS_Busca.Close;
                DMBelShop.SDS_Busca.CommandText:=MySql+MySqlOrderBy;
                DMBelShop.CDS_Busca.Open;
              End;

              // Se Encontrou que Tenha NUM_TECBIZ e MATRICULA Válida ==========
              If DMBelShop.CDS_Busca.RecordCount>1 Then
              Begin
                MySql:=MySql+' AND (((p.num_matricula_tecbiz is not null)'+
                             ' AND (Trim(p.num_matricula_tecbiz)<>'''')) OR'+
                             ' ((p.num_tecbiz is not null) and (Trim(p.num_tecbiz)<>'''')))';
                DMBelShop.CDS_Busca.Close;
                DMBelShop.SDS_Busca.CommandText:=MySql+MySqlOrderBy;
                DMBelShop.CDS_Busca.Open;
              End;

              // Insere Codigo do TecBiz Como Anterior =========================
              If DMBelShop.CDS_Busca.RecordCount=1 Then
              Begin
                sNomeProf:=Trim(DMBelShop.CDS_Busca.FieldByName('des_profissional').AsString);

                // Atualiza o Codigo TecBiz ====================================
                If Trim(DMBelShop.CDS_Busca.FieldByName('num_matricula_tecbiz').AsString)='' Then
                Begin
                  MySql:=' UPDATE sal_profissionais p'+
                         ' SET p.num_matricula_tecbiz='+QuotedStr(sMatriculaTecBiz)+
                         ' WHERE p.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
                         ' AND p.cod_profissional='+DMBelShop.CDS_Busca.FieldByName('Cod_Profissional').AsString;
                  DMBelShop.SQLC.Execute(MySql,nil,nil);
                End; // If Trim(DMBelShop.CDS_Busca.FieldByName('num_matricula_tecbiz').AsString)='' Then

                MySql:=' SELECT t.tip_aux'+
                       ' FROM TAB_AUXILIAR t'+
                       ' WHERE t.tip_aux=10'+
                       ' AND   t.cod_aux='+sMatriculaTecBiz;  // Código TecBiz
                DMBelShop.CDS_Pesquisa.Close;
                DMBelShop.SDS_Pesquisa.CommandText:=MySql;
                DMBelShop.CDS_Pesquisa.Open;

                If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Tip_Aux').AsString)='' Then
                 Begin
                   MySql:=' INSERT INTO TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1)'+
                          ' Values (10,'+ // Tip_Aux
                          sMatriculaTecBiz+', '+ // Código TecBiz
                          QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString))+', '+ // Cod_Loja
                          QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('Cod_Profissional').AsString))+ // Código Profissional
                          ')';
                 End
                Else // If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Tip_Aux').AsString)='' Then
                 Begin
                   MySql:=' UPDATE TAB_AUXILIAR t'+
                          ' SET t.DES_AUX='+QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString))+ // Cod_Loja
                          ', t.DES_AUX1='+QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('Cod_Profissional').AsString))+ // Código Profissional
                          ' WHERE t.tip_aux=10'+
                          ' AND   t.cod_aux='+sMatriculaTecBiz;  // Código TecBiz
                 End; // If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Tip_Aux').AsString)='' Then
                DMBelShop.SQLC.Execute(MySql,nil,nil);

                DMBelShop.CDS_Pesquisa.Close;
              End; // If DMBelShop.CDS_Busca.RecordCount=1 Then
              DMBelShop.CDS_Busca.Close;

              // Verifica se Profissional ja Foi Importado =====================
              MySql:=' SELECT t.Num_Seq'+
                     ' FROM  PS_TECBIZ t'+
                     ' WHERE t.des_arquivo='+QuotedStr(Lbx_ProfTecBizImpArqSel.Items[i])+
                     ' AND   t.dta_ini_periodo='+QuotedStr(sgDtaInicio)+
                     ' AND   t.dta_fim_periodo='+QuotedStr(sgDtaFim)+
                     ' AND   t.Cod_TecBiz='+QuotedStr(Trim(Strg_ProfTecBizImpArquivo.Cells[1,ii]));
              DMBelShop.CDS_BuscaRapida.Close;
              DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
              DMBelShop.CDS_BuscaRapida.Open;
              s:=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString;
              DMBelShop.CDS_BuscaRapida.Close;

              // Insere TecBiz =================================================
              If Trim(s)='' Then
              Begin
                MySql:=' Insert Into PS_TECBIZ'+
                       ' (NUM_SEQ, DTA_INI_PERIODO, DTA_FIM_PERIODO,'+
                       ' COD_TECBIZ, DES_PESSOA,'+
                       ' VLR_TECBIZ, DES_ARQUIVO, USU_INCLUI)'+

                       ' Values ('+
                       '(SELECT GEN_ID(GEN_TECBIZ,1) FROM RDB$DATABASE), '+ // NUM_SEQ
                       QuotedStr(sgDtaInicio)+', '+ // DTA_INI_PERIODO
                       QuotedStr(sgDtaFim)+', '+ // DTA_FIM_PERIODO
                       QuotedStr(sMatriculaTecBiz)+', '+ // COD_TECBIZ
                       QuotedStr(sNomeProf)+', '+ // DES_PESSOA
                       QuotedStr(F_Troca(',','.',Trim(AnsiUpperCase(Strg_ProfTecBizImpArquivo.Cells[3,ii]))))+', '+ // VLR_TECBIZ
                       QuotedStr(Lbx_ProfTecBizImpArqSel.Items[i])+', '+ // DES_ARQUIVO
                       QuotedStr(Cod_Usuario)+ // USU_INCLUI
                       ')';
                DMBelShop.SQLC.Execute(MySql,nil,nil);
              End; // If Trim(MySql)<>'' Then
            End; // If Trim(Strg_ProfTecBizImpArquivo.Cells[1,ii])<>'' Then
          End; // For ii:=1 to Strg_ProfTecBizImpArquivo.RowCount-1 do
        End; // If bSiga Then
        pgProgBar.Position:=pgProgBar.Properties.Max;
      End; // If Strg_ProfTecBizImpArquivo.RowCount>0 Then
    End; // For i:=0 to Lbx_ProfTecBizImpArqSel.Items.Count-1 do

    FrmBelShop.MontaProgressBar(False, FrmSalao);

    DMBelShop.SQLC.Commit(TD);
    msg('Importação Efetuada Com SUCESSO !!','A');

    LimpaStringGrid(Strg_ProfTecBizImpArquivo);
    EdtProfTecBizPastaArquivo.Clear;
    Lbx_ProfTecBizImpArqSel.Items.Clear;

    DateSeparator:='/';
    DecimalSeparator:=',';
    Bt_ProfTecBizArquivo.SetFocus;

    Lb_Obs.Caption:='Observações...';

    Screen.Cursor:=crDefault;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      FrmBelShop.MontaProgressBar(False, FrmSalao);

      LimpaStringGrid(Strg_ProfTecBizImpArquivo);
      EdtProfTecBizPastaArquivo.Clear;
      Lbx_ProfTecBizImpArqSel.Items.Clear;

      DateSeparator:='/';
      DecimalSeparator:=',';
      Lb_Obs.Caption:='Observações...';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);

      Exit;
    End; // on e : Exception do
  End; // Try

  // Apresenta Movimentos TecBiz Não Encontrados =============================
  MySql:=' SELECT DISTINCT tb.des_pessoa, tb.cod_tecbiz, tb.des_arquivo'+
         ' FROM ps_tecbiz tb'+
         ' WHERE tb.ind_pago='+QuotedStr('NAO')+
         ' AND   tb.dta_fim_periodo BETWEEN '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim)+
         ' AND NOT EXISTS (SELECT 1'+
         '                 FROM SAL_PROFISSIONAIS pf, tab_auxiliar ta'+
         '                 WHERE pf.cod_loja=ta.des_aux'+
         '                 AND   pf.cod_profissional=ta.des_aux1'+
         '                 AND   ta.tip_aux=10'+
         '                 AND   pf.tip_pessoa='+QuotedStr('P')+
         '                 AND   pf.ind_Ativo='+QuotedStr('SIM')+
         '                 AND   tb.cod_tecbiz=LPAD(ta.cod_aux,5,0))'+
         ' ORDER BY 1';
  DMSalao.CDS_ApresGrid.Close;
  DMSalao.SDS_ApresGrid.CommandText:=MySql;
  DMSalao.CDS_ApresGrid.Open;

  If Trim(DMSalao.CDS_ApresGrid.FieldByName('cod_tecbiz').AsString)<>'' Then
  Begin
    msg('Existem Códigos TecBiz SEM o '+cr+'Profissional Correspondente !!'+cr+cr+' Verifique antes de continuar...','A');

    // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==========
    FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
    FrmBelShop.AbreSolicitacoes(16);

    // Acerta Colunas no DBGrid ==============================================
    FrmSolicitacoes.Dbg_ApresGrid.Columns[0].Title.Caption:='Nome';
    FrmSolicitacoes.Dbg_ApresGrid.Columns[0].Width:=300;

    FrmSolicitacoes.Dbg_ApresGrid.Columns[1].Alignment:=taCenter;
    FrmSolicitacoes.Dbg_ApresGrid.Columns[1].Color:=$0080FFFF;
    FrmSolicitacoes.Dbg_ApresGrid.Columns[1].Font.Style:=[fsBold];
    FrmSolicitacoes.Dbg_ApresGrid.Columns[1].Title.Alignment:=taCenter;
    FrmSolicitacoes.Dbg_ApresGrid.Columns[1].Title.Caption:='Cód TecBiz';
    FrmSolicitacoes.Dbg_ApresGrid.Columns[1].Width:=80;

    FrmSolicitacoes.Dbg_ApresGrid.Columns[2].Title.Caption:='Nome da Planilha TecBiz';
    FrmSolicitacoes.Dbg_ApresGrid.Columns[2].Width:=240;

    FrmSolicitacoes.Caption:='T E C B I Z';
    FrmSolicitacoes.Ts_ApresentaGrid.Caption:='MOVIMENTOS DE DÉBITOS (RH) TECBIZ';
    FrmSolicitacoes.ShowModal;

    FrmSolicitacoes.Free;
    FrmSolicitacoes:=nil;

    DMSalao.CDS_ApresGrid.Close;
  End;
  DMSalao.CDS_ApresGrid.Close;


End; // IMPORTAÇÃO DEBITOS RH - TECBIZ /////////////////////////////////////////

// PLANILHA DE PAGAMENTOS - Busca Débitos de Profissionais /////////////////////
Procedure TFrmSalao.ProfBuscaDebitosCreditos;
Var
  MySql: String;
Begin
  // Tipos de Documento
  //==================================================
  //  1 - VALES = 1
  //  2 - CONTRIBUIÇOES DE INSS = 2
  //  3 - PLANO DE SAUDE = 3

  //  4 - TAXA DO SINDICATO = 4
  //  4 - TAXA NÃO SOCIO DO SINDICATO = 4 (NÃ0 CALULAR)

  //  5 - TECBIZ = 5
  //  6 - ARREDONDAMENTO PAGAMENTOS ANTERIORES = 6
  //  7 - INCORPORA COMISSÕES = 7
  //  8 - ARREDONDAMENTO ATUAL = 8

  // 10 - Beneficios = 10

  // Apresentacao ==============================================================
  OdirPanApres.Caption:='AGUARDE !! 2/2 - Calculando Débitos e Créditos da Profissionais na Loja: Bel_'+FormatFloat('00',EdtPagtoCodLoja.AsInteger);
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Visible:=True;
  Refresh;

  Screen.Cursor:=crAppStart;

  //  1 - (D) VALES ============================================================
  //  2 - (I) CONTRIBUIÇOES DE INSS ============================================
  //  3 - (P) PLANO DE SAUDE ===================================================
  //  4 - (S) TAXA DO SINDICATO ================================================
  // 10 - (B) BENEFICIOS =======================================================
  MySql:=' SELECT pf.cod_loja, pf.cod_profissional, pf.des_profissional,'+

 //        ' ''DÉBITO'' Tipo_Docto,'+
         ' CASE vp.ind_debcred'+
         '    WHEN ''B'' THEN ''CRÉDITO'''+
         '    ELSE ''DÉBITO'''+
         ' END Tipo_Docto,'+

         ' Case vp.ind_debcred'+
         '    When ''D'' Then ''VALES'''+ // Vales
         '    When ''I'' Then ''CONTRIBUIÇÃO INSS'''+ // INSS
         '    When ''P'' Then vp.des_docto'+ // Plano de Saude
         '    When ''S'' Then ''TAXA SINDICADO'''+ // Taxa Sindicato
         '    When ''B'' Then vp.des_docto'+ // Beneficios
         ' End Des_docto,'+

         ' vp.num_docto,'+

         ' Case vp.ind_debcred'+
         '    When ''D'' Then vp.vlr_original'+ // Vales
         '    When ''I'' Then vp.vlr_apagar'+ // INSS
         '    When ''P'' Then vp.vlr_original'+ // Plano de Saude
         '    When ''S'' Then vp.vlr_original'+ // Taxa Sindicato
         '    When ''B'' Then vp.vlr_original'+ // Beneficios
         ' End vlr_original,'+

         ' Case vp.ind_debcred'+
         '    When ''D'' Then vp.tot_prestacao'+ // Vales
         '    When ''I'' Then ''Unica'''+ // INSS
         '    When ''P'' Then ''Unica'''+ // Plano de Saude
         '    When ''S'' Then ''Unica'''+ // Taxa Sindicato
         '    When ''B'' Then vp.tot_prestacao'+ // Taxa Sindicato
         ' End num_prestacoes,'+

         ' vp.dta_prim_venc,'+

         ' Case vp.ind_debcred'+
         '    When ''D'' Then vp.num_prestacao'+ // Vales
         '    When ''I'' Then ''Unica'''+ // INSS
         '    When ''P'' Then ''Unica'''+ // Plano de Saude
         '    When ''S'' Then ''Unica'''+ // Taxa Sindicato
         '    When ''B'' Then vp.num_prestacao'+ // Beneficios
         ' End num_prestacao,'+

         ' vp.dta_vencimento, vp.vlr_prestacao, vp.vlr_desconto, vp.vlr_acrescimos,'+

         ' Case vp.ind_debcred'+
         '    When ''B'' Then'+ // Beneficios
         '      0'+
         '    Else'+ // Outros
         '      vp.vlr_apagar'+
         ' End vlr_debitos,'+

         ' Case vp.ind_debcred'+
         '    When ''B'' Then'+ // Beneficios
         '      vp.vlr_apagar'+
         '    Else'+ // Outros
         '      0'+
         ' End vlr_creditos,'+

         ' vp.num_seq,'+

         ' Case vp.ind_debcred'+
         '    When ''D'' Then  1'+ // Vales
         '    When ''I'' Then  2'+ // INSS
         '    When ''P'' Then  3'+ // Plano de Saude
         '    When ''S'' Then  4'+ // Taxa Sindicato
         '    When ''B'' Then 10'+ // Beneficios
         ' End tip_doc'+

         ' FROM ps_vales_pessoas vp, sal_profissionais pf'+
         ' WHERE vp.cod_loja=pf.cod_loja'+
         ' AND   vp.cod_pessoa=pf.cod_profissional'+
         ' AND   vp.tp_pessoa=1'+
         ' AND   pf.tip_pessoa='+QuotedStr('P')+
         ' AND   pf.ind_Ativo='+QuotedStr('SIM')+
         ' AND ('+
         '      (vp.ind_debcred='+QuotedStr('D')+')'+ // Vales
         '       or'+
         '      (vp.ind_debcred='+QuotedStr('I')+')'+ // INSS
         '       or'+
         '      (vp.ind_debcred='+QuotedStr('P')+')'+ // Plano de Saude
         '       or'+
         '      (vp.ind_debcred='+QuotedStr('S')+')'+ // Taxa Sindicato
         '       or'+
         '      (vp.ind_debcred='+QuotedStr('B')+')'+ // Beneficios
         '     )'+
         ' AND vp.vlr_pago=0'+
         ' AND vp.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
         ' AND vp.cod_pessoa in ('+sgProfissionais+')'+
         ' AND vp.dta_vencimento <='+QuotedStr(sgDtaF);

  // 5 - TECBIZ ================================================================
  MySqlClausula2:=' UNION'+

                  ' SELECT pf.cod_loja, pf.cod_profissional, pf.des_profissional,'+
                  ' ''DÉBITO'' Tipo_Docto, ''TECBIZ'' Des_docto, tb.Cod_TecBiz Num_DOCTO,'+
                  ' tb.vlr_tecbiz Vlr_Original, ''Unica'' num_prestacoes,'+

                  ' Cast('+QuotedStr(sgDtaF)+' as Date) dta_prim_venc,'+
                  ' ''Unica'' num_prestacao, Cast('+QuotedStr(sgDtaF)+' as Date) dta_vencimento,'+
                  ' tb.vlr_tecbiz vlr_prestacao, 0 vlr_desconto, 0 vlr_acrescimos,'+
                  ' tb.vlr_tecbiz vlr_debitos, 0 vlr_creditos, tb.num_seq, 5 tip_doc'+

                  ' FROM  SAL_PROFISSIONAIS pf, PS_TECBIZ tb, tab_auxiliar ta'+
                  ' WHERE pf.cod_loja=ta.des_aux'+
                  ' AND   pf.cod_profissional=ta.des_aux1'+
                  ' AND   tb.cod_tecbiz=lpad(ta.cod_aux,5,0)'+
                  ' AND   ta.tip_aux=10'+
                  ' AND   tb.ind_pago='+QuotedStr('NAO')+
                  ' AND   pf.tip_pessoa='+QuotedStr('P')+
                  ' AND   pf.ind_Ativo='+QuotedStr('SIM')+
                  ' AND   pf.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
                  ' AND   tb.dta_fim_periodo<='+QuotedStr(sgDtaF)+
                  ' AND   pf.cod_profissional  in ('+sgProfissionais+')';

  // 6 - ARREDONDAMENTO PAGAMENTOS ANTERIORES ==================================
  MySqlClausula3:=' UNION'+

                  ' SELECT pf.cod_loja, pf.cod_profissional,'+
                  ' pf.des_profissional, ''DÉBITO'' TIPO_DOCTO, ''ARREDONDAMENTO PAGTO ANTERIOR'' DES_DOCTO,'+
                  ' pp.num_planilha NUM_DOCTO, pp.vlr_arredonda VLR_ORIGINAL, ''Unica'' NUM_PRESTACOES,'+
                  ' pp.dta_periodo_fim DTA_PRIM_VENC, ''Unica'' NUM_PRESTACAO,'+
                  ' Cast('+QuotedStr(sgDtaF)+' as Date) DTA_VENCIMENTO,'+
                  ' pp.vlr_arredonda VLR_PRESTACAO, 0 VLR_DESCONTO, 0 VLR_ACRESCIMOS,'+
                  ' pp.vlr_arredonda VLR_DEBITOS, 0 VLR_CREDITOS, pp.num_planilha num_seq, 6 tip_doc'+

                  ' FROM  sal_plan_pagto pp, sal_profissionais pf'+
                  ' WHERE pp.cod_loja=pf.cod_loja'+
                  ' AND   pp.cod_profissional=pf.cod_profissional'+
                  ' AND   pf.tip_pessoa='+QuotedStr('P')+
                  ' AND   pp.vlr_arredonda<>0'+
                  ' AND   pp.ind_arrendonda=''NAO'''+
                  ' AND   pp.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
                  ' AND   pf.cod_profissional  IN ('+sgProfissionais+')';

//opssopss 1
//  // 10 - BENEFICIOS ===========================================================
//  MySqlClausula4:=' UNION'+
//                  ' SELECT pf.cod_loja, pf.cod_profissional, pf.des_profissional,'+
//                  ' ''CRÉDITO'' Tipo_Docto, vp.des_docto, vp.num_docto, vp.vlr_original,'+
//                  ' vp.tot_prestacao num_prestacoes, vp.dta_prim_venc, ''Unica'' num_prestacao,'+
//                  ' Cast('+QuotedStr(sgDtaF)+' as Date) DTA_VENCIMENTO,'+
//                  ' SUM(vp.vlr_prestacao) vlr_prestacao,'+
//                  ' SUM(vp.vlr_desconto) vlr_desconto,'+
//                  ' SUM(vp.vlr_acrescimos) vlr_acrescimos,'+
//                  ' 0 vlr_Debitos,'+
//                  ' SUM(vp.vlr_apagar) vlr_Creditos,'+
//                  ' 0 Num_Seq,'+
//                  ' 10 tip_doc'+
//
//                  ' FROM ps_vales_pessoas vp, sal_profissionais pf'+
//                  ' WHERE vp.cod_loja=pf.cod_loja'+
//                  ' AND   vp.cod_pessoa=pf.cod_profissional'+
//                  ' AND   vp.tp_pessoa=1'+
//                  ' AND   pf.tip_pessoa='+QuotedStr('P')+
//                  ' AND   pf.ind_Ativo='+QuotedStr('SIM')+
//                  ' AND   vp.ind_debcred='+QuotedStr('C')+
//                  ' AND   vp.vlr_pago=0'+
//                  ' AND   vp.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
//                  ' AND   vp.cod_pessoa in ('+sgProfissionais+')'+
//                  ' AND   vp.dta_vencimento <='+QuotedStr(sgDtaF)+
//
//                  ' GROUP BY pf.cod_loja, pf.cod_profissional, pf.des_profissional,'+
//                  '          vp.des_docto, vp.num_docto, vp.vlr_original,'+
//                  '          vp.tot_prestacao, vp.dta_prim_venc';
//
//  DMBelShop.CDS_Busca.Close;
////odiropss 2
//DMBelShop.SDS_Busca.CommandText:=MySql+MySqlClausula2+MySqlClausula3+MySqlClausula4;

  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql+MySqlClausula2+MySqlClausula3;

  // INCORPORA COMISSÕES =======================================================
  DMSalao.CDS_V_PagtosVendas.Filter:='SINTETICO=''S''';
  DMSalao.CDS_V_PagtosVendas.Filtered:=True;
  DMSalao.CDS_V_PagtosVendas.First;
  While Not DMSalao.CDS_V_PagtosVendas.Eof do
  Begin
    If Trim(DMSalao.CDS_V_PagtosVendasCOD_PROF.AsString)<>'' Then
    Begin
      MySql:=' UNION '+

             ' SELECT '+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+' cod_loja,'+
             QuotedStr(DMSalao.CDS_V_PagtosVendasCOD_PROF.AsString)+' cod_profissional,'+
             QuotedStr(DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString)+'des_profissional,'+
             QuotedStr('CRÉDITO')+' TIPO_DOCTO,'+
             QuotedStr('COMISSÃO')+' DES_DOCTO,'+
             '1 NUM_DOCTO,'+
             f_Troca(',','.',DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO.AsString)+' VLR_ORIGINAL,'+
             QuotedStr('Unica')+' NUM_PRESTACOES,'+
             ' Cast('+QuotedStr(sgDtaF)+' as Date) DTA_PRIM_VENC,'+
             QuotedStr('Unica')+' NUM_PRESTACAO,'+
             ' Cast('+QuotedStr(sgDtaF)+' as Date) DTA_VENCIMENTO,'+
             f_Troca(',','.',DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO.AsString)+' VLR_PRESTACAO,'+
             ' 0 VLR_DESCONTO, 0 VLR_ACRESCIMOS, 0 VLR_DEBITOS,'+
             f_Troca(',','.',DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO.AsString)+' VLR_CREDITOS,'+
             ' 0 num_seq, 7 tip_doc'+
             ' FROM RDB$DATABASE';
      DMBelShop.SDS_Busca.CommandText:=DMBelShop.SDS_Busca.CommandText+MySql;
    End;

    DMSalao.CDS_V_PagtosVendas.Next;
  End; // While Not DMSalao.CDS_V_PagtosVendas.Eof do
  DMSalao.CDS_V_PagtosVendas.First;

  MySqlOrderGrup:=' ORDER BY 3, 2, 4, 5, 6'; // ORDER BY 3,2,4,5'; //3, 2, 5';
  DMBelShop.SDS_Busca.CommandText:=DMBelShop.SDS_Busca.CommandText+MySqlOrderGrup;
  DMBelShop.CDS_Busca.Open;

  // Apresenta Debitos e Creditos ==============================================
  ProfApresentaDebCredGrid;

End; // PLANILHA DE PAGAMENTOS - Busca Débitos de Profissionais ////////////////

// PLANILHA DE PAGAMENTOS - Apresenta Vendas de Profissionais no Grid //////////
Procedure TFrmSalao.ProfApresentaComissoesGrid;
Var
  sCodProf, sTpComissao: String;

  cTotVlrComissao, cTotVlrItem, cTotQtdServ,
  cTotGeralComissao, cTotGeralItem, cTotGeralQtd,

  cVlrComissaoSID, cPerComisaoSID,
  cTotVlrComissaoSID, cTotGeralComissaoSID : Currency;

  iIndex, iIndexProf: Integer;

  // Cria Dados da Planilha de Comissões >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Procedure Detalhes(sTipo: String);
  Begin
    // sTipo=''  Dados do Profissiona nos Detalhes (Codigo e Nome)
    // sTipo='C' Comisao Aplicada e detalhes
    // sTipo='P' Profissional
    // sTipo='F' Final do Arquivo

    // Final do Arquivo ========================================================
    If sTipo='F' Then
    Begin
      DMSalao.CDS_V_PagtosVendas.Append;
      DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString:='--- TOTAIS ---';
      DMSalao.CDS_V_PagtosVendasQTD_SERVICO.AsCurrency:=cTotQtdServ;
      DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO.AsCurrency:=cTotVlrComissao;
      DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO_SID.AsCurrency:=cTotVlrComissaoSID;
      DMSalao.CDS_V_PagtosVendasVLR_TOTALITEM.AsCurrency:=cTotVlrItem;
      iIndex:=iIndex+1;
      DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
      DMSalao.CDS_V_PagtosVendas.Post;

      // Acerta Totais do Profissional
      DMSalao.CDS_V_PagtosVendas.Locate('INDEX', iIndexProf,[]);
      DMSalao.CDS_V_PagtosVendas.Edit;
      DMSalao.CDS_V_PagtosVendasQTD_SERVICO.AsCurrency:=cTotQtdServ;
      DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO.AsCurrency:=cTotVlrComissao;
      DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO_SID.AsCurrency:=cTotVlrComissaoSID;
      DMSalao.CDS_V_PagtosVendasVLR_TOTALITEM.AsCurrency:=cTotVlrItem;
      DMSalao.CDS_V_PagtosVendas.Post;

      DMSalao.CDS_V_PagtosVendas.Append;
      DMSalao.CDS_V_PagtosVendasCOD_PROF.AsString:='';
      DMSalao.CDS_V_PagtosVendasSINTETICO.AsString:='S';
      DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
      iIndex:=iIndex+1;
      DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
      DMSalao.CDS_V_PagtosVendas.Post;

      DMSalao.CDS_V_PagtosVendas.Append;
      DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString:='--- TOTAL GERAL ---';
      DMSalao.CDS_V_PagtosVendasQTD_SERVICO.AsCurrency:=cTotGeralQtd;
      DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO.AsCurrency:=cTotGeralComissao;
      DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO_SID.AsCurrency:=cTotGeralComissaoSID;
      DMSalao.CDS_V_PagtosVendasVLR_TOTALITEM.AsCurrency:=cTotGeralItem;
      DMSalao.CDS_V_PagtosVendasSINTETICO.AsString:='S';
      iIndex:=iIndex+1;
      DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
      DMSalao.CDS_V_PagtosVendas.Post;

      Exit;
    End;

    // Profissional ============================================================
    If sTipo='P' Then
    Begin
      If DMBelShop.CDS_Busca.RecNo<>1 Then
      Begin
        DMSalao.CDS_V_PagtosVendas.Append;
        DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString:='--- TOTAIS ---';
        DMSalao.CDS_V_PagtosVendasQTD_SERVICO.AsCurrency:=cTotQtdServ;
        DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO.AsCurrency:=cTotVlrComissao;
        DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO_SID.AsCurrency:=cTotVlrComissaoSID;
        DMSalao.CDS_V_PagtosVendasVLR_TOTALITEM.AsCurrency:=cTotVlrItem;
        iIndex:=iIndex+1;
        DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
        DMSalao.CDS_V_PagtosVendas.Post;

        // Acerta Totais do Profissional
        DMSalao.CDS_V_PagtosVendas.Locate('INDEX', iIndexProf,[]);
        DMSalao.CDS_V_PagtosVendas.Edit;
        DMSalao.CDS_V_PagtosVendasQTD_SERVICO.AsCurrency:=cTotQtdServ;
        DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO.AsCurrency:=cTotVlrComissao;
        DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO_SID.AsCurrency:=cTotVlrComissaoSID;
        DMSalao.CDS_V_PagtosVendasVLR_TOTALITEM.AsCurrency:=cTotVlrItem;
        DMSalao.CDS_V_PagtosVendas.Post;

        cTotQtdServ:=0;
        cTotVlrComissao:=0;
        cTotVlrComissaoSID:=0;
        cTotVlrItem:=0;

        DMSalao.CDS_V_PagtosVendas.Append;
        DMSalao.CDS_V_PagtosVendasCOD_PROF.AsString:='';
        DMSalao.CDS_V_PagtosVendasSINTETICO.AsString:='S';
        iIndex:=iIndex+1;
        DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
        DMSalao.CDS_V_PagtosVendas.Post;
      End; // If DMBelShop.CDS_Busca.RecNo<>1 Then

      DMSalao.CDS_V_PagtosVendas.Append;
      DMSalao.CDS_V_PagtosVendasCOD_PROF.AsString:=
                           DMBelShop.CDS_Busca.FieldByName('COD_PROF').AsString;
      DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString:=
                   DMBelShop.CDS_Busca.FieldByName('DES_PROFISSIONAL').AsString;
      DMSalao.CDS_V_PagtosVendasSINTETICO.AsString:='S';
      iIndex:=iIndex+1;
      DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
      DMSalao.CDS_V_PagtosVendas.Post;

      iIndexProf:=iIndex;
      sTipo:='C'
    End; // If sTipo='P' Then

    // Comissão Aplicada =======================================================
    DMSalao.CDS_V_PagtosVendas.Append;
    If sTipo='C' Then
    Begin
      DMSalao.CDS_V_PagtosVendasCOD_PROF.AsString:='';
      iIndex:=iIndex+1;
      DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
      DMSalao.CDS_V_PagtosVendas.Post;

      DMSalao.CDS_V_PagtosVendas.Append;
      DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString:=Trim(
                  DMBelShop.CDS_Busca.FieldByName('COMISSAO_APLICADA').AsString);
    End; // If sTipo='C' Then

    // Detalhes ================================================================
    If sTipo='' Then
    Begin
      DMSalao.CDS_V_PagtosVendasCOD_PROF.AsString:=
                           DMBelShop.CDS_Busca.FieldByName('COD_PROF').AsString;
      DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString:=
                   DMBelShop.CDS_Busca.FieldByName('DES_PROFISSIONAL').AsString;
    End;

    DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO.AsCurrency:=
                 DMBelShop.CDS_Busca.FieldByName('VLR_TOT_COMISSAO').AsCurrency;
    DMSalao.CDS_V_PagtosVendasNUM_DOCTO.AsString:=
                          DMBelShop.CDS_Busca.FieldByName('NUM_DOCTO').AsString;
    DMSalao.CDS_V_PagtosVendasDTA_COMPROV.AsString:=
                        DMBelShop.CDS_Busca.FieldByName('DTA_COMPROV').AsString;
    DMSalao.CDS_V_PagtosVendasCOD_COMPROV.AsString:=
                        DMBelShop.CDS_Busca.FieldByName('COD_COMPROV').AsString;
    DMSalao.CDS_V_PagtosVendasTIP_DOCTO.AsString:=
                          DMBelShop.CDS_Busca.FieldByName('TIP_DOCTO').AsString;
    DMSalao.CDS_V_PagtosVendasCOD_PRODUTO.AsString:=
                        DMBelShop.CDS_Busca.FieldByName('COD_PRODUTO').AsString;
    DMSalao.CDS_V_PagtosVendasQTD_SERVICO.AsCurrency:=
                      DMBelShop.CDS_Busca.FieldByName('QTD_SERVICO').AsCurrency;
    DMSalao.CDS_V_PagtosVendasVLR_TOTALITEM.AsCurrency:=
                    DMBelShop.CDS_Busca.FieldByName('VLR_TOTALITEM').AsCurrency;
    DMSalao.CDS_V_PagtosVendasPER_COMIS_GERAL.AsCurrency:=
                  DMBelShop.CDS_Busca.FieldByName('PER_COMIS_GERAL').AsCurrency;
    DMSalao.CDS_V_PagtosVendasDES_HABILIDADE.AsString:=
                     DMBelShop.CDS_Busca.FieldByName('DES_HABILIDADE').AsString;

    If Trim(DMBelShop.CDS_Busca.FieldByName('PER_COMIS_HAB').AsString)='' Then
     DMSalao.CDS_V_PagtosVendasPER_COMIS_HAB.AsCurrency:=0
    Else
     DMSalao.CDS_V_PagtosVendasPER_COMIS_HAB.AsCurrency:=
                    DMBelShop.CDS_Busca.FieldByName('PER_COMIS_HAB').AsCurrency;

    DMSalao.CDS_V_PagtosVendasDES_SERVICO.AsString:=
                        DMBelShop.CDS_Busca.FieldByName('DES_SERVICO').AsString;

    If Trim(DMBelShop.CDS_Busca.FieldByName('PER_COMIS_SERV').AsString)='' Then
     DMSalao.CDS_V_PagtosVendasPER_COMIS_SERV.AsCurrency:=0
    Else
     DMSalao.CDS_V_PagtosVendasPER_COMIS_SERV.AsCurrency:=
                   DMBelShop.CDS_Busca.FieldByName('PER_COMIS_SERV').AsCurrency;

    // Valores SIDICOM
    DMSalao.CDS_V_PagtosVendasPER_COMIS_SID.AsCurrency:=cPerComisaoSID;
    DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO_SID.AsCurrency:=cVlrComissaoSID;

    iIndex:=iIndex+1;
    DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
    DMSalao.CDS_V_PagtosVendas.Post;
  End; // Cria Dados da Planilha de Comissões >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Begin

  try
    DMSalao.CDS_V_PagtosVendas.CreateDataSet;
    DMSalao.CDS_V_PagtosVendas.IndexFieldNames:='';
    DMSalao.CDS_V_PagtosVendas.Open;
  Except
    DMSalao.CDS_V_PagtosVendas.EmptyDataSet;
    DMSalao.CDS_V_PagtosVendas.IndexFieldNames:='';
    DMSalao.CDS_V_PagtosVendas.Open;
  End;

  sCodProf:='';
  sTpComissao:='';

  cTotQtdServ:=0;
  cTotVlrComissao:=0;
  cTotVlrComissaoSID:=0;
  cTotVlrItem:=0;

  cTotGeralQtd:=0;
  cTotGeralComissao:=0;
  cTotGeralComissaoSID:=0;
  cTotGeralItem:=0;

  iIndex:=0;
  iIndexProf:=0;

  // Cabecalho da Planilha =====================================================
  DMSalao.CDS_V_PagtosVendas.Append;
  DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString:='PLANILHA DE CONFERENCIA DE PAGAMENTOS';
  DMSalao.CDS_V_PagtosVendasSINTETICO.AsString:='S';
  iIndex:=iIndex+1;
  DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
  DMSalao.CDS_V_PagtosVendas.Post;

  DMSalao.CDS_V_PagtosVendas.Append;
  DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString:=
                             'Bel_'+FormatFloat('00',EdtPagtoCodLoja.AsInteger)+
                             ': '+EdtPagtoDesLoja.Text;
  DMSalao.CDS_V_PagtosVendasSINTETICO.AsString:='S';
  iIndex:=iIndex+1;
  DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
  DMSalao.CDS_V_PagtosVendas.Post;

  DMSalao.CDS_V_PagtosVendas.Append;
  DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString:='Período de: '+sgPeriodoIni+' a '+sgPeriodoFim;
  DMSalao.CDS_V_PagtosVendasSINTETICO.AsString:='S';
  iIndex:=iIndex+1;
  DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
  DMSalao.CDS_V_PagtosVendas.Post;

  DMSalao.CDS_V_PagtosVendas.Append;
  DMSalao.CDS_V_PagtosVendasCOD_PROF.AsString:='';
  DMSalao.CDS_V_PagtosVendasSINTETICO.AsString:='S';
  iIndex:=iIndex+1;
  DMSalao.CDS_V_PagtosVendasINDEX.AsInteger:=iIndex;
  DMSalao.CDS_V_PagtosVendas.Post;

  FrmBelShop.MontaProgressBar(True, FrmSalao);
  pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
  pgProgBar.Position:=0;

  // Monta Planilha de Pagamentos ==============================================
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    Application.ProcessMessages;

    pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;
    pgProgBar.Refresh;

    // Camissão SIDICOM
    cVlrComissaoSID:=0;
    If Trim(DMBelShop.CDS_Busca.FieldByName('SID_TAB_COMSSAO').AsString)='1' Then
     cPerComisaoSID:=DMBelShop.CDS_Busca.FieldByName('PER_COMISSAO_TAB1').AsCurrency;
    If Trim(DMBelShop.CDS_Busca.FieldByName('SID_TAB_COMSSAO').AsString)='2' Then
     cPerComisaoSID:=DMBelShop.CDS_Busca.FieldByName('PER_COMISSAO_TAB2').AsCurrency;
    If Trim(DMBelShop.CDS_Busca.FieldByName('SID_TAB_COMSSAO').AsString)='3' Then
     cPerComisaoSID:=DMBelShop.CDS_Busca.FieldByName('PER_COMISSAO_TAB3').AsCurrency;
    If Trim(DMBelShop.CDS_Busca.FieldByName('SID_TAB_COMSSAO').AsString)='4' Then
     cPerComisaoSID:=DMBelShop.CDS_Busca.FieldByName('PER_COMISSAO_TAB4').AsCurrency;
    If Trim(DMBelShop.CDS_Busca.FieldByName('SID_TAB_COMSSAO').AsString)='5' Then
     cPerComisaoSID:=DMBelShop.CDS_Busca.FieldByName('PER_COMISSAO_TAB5').AsCurrency;
    If Trim(DMBelShop.CDS_Busca.FieldByName('SID_TAB_COMSSAO').AsString)='6' Then
     cPerComisaoSID:=DMBelShop.CDS_Busca.FieldByName('PER_COMISSAO_TAB6').AsCurrency;
    If Trim(DMBelShop.CDS_Busca.FieldByName('SID_TAB_COMSSAO').AsString)='7' Then
     cPerComisaoSID:=DMBelShop.CDS_Busca.FieldByName('PER_COMISSAO_TAB7').AsCurrency;
    If Trim(DMBelShop.CDS_Busca.FieldByName('SID_TAB_COMSSAO').AsString)='8' Then
     cPerComisaoSID:=DMBelShop.CDS_Busca.FieldByName('PER_COMISSAO_TAB7').AsCurrency;

    cVlrComissaoSID:=0;
    If cPerComisaoSID>0 Then
     cVlrComissaoSID:=Round_5(((DMBelShop.CDS_Busca.FieldByName('Vlr_TotalItem').AsCurrency*cPerComisaoSID)/100),2);

    // Totais
    cTotGeralComissaoSID:=cTotGeralComissaoSID+cVlrComissaoSID;
    cTotGeralComissao:=cTotGeralComissao+
                 DMBelShop.CDS_Busca.FieldByName('VLR_TOT_COMISSAO').AsCurrency;

    If Trim(DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString)<>'Sem' Then
    Begin
      cTotGeralQtd:=cTotGeralQtd+
                      DMBelShop.CDS_Busca.FieldByName('QTD_SERVICO').AsCurrency;

      cTotGeralItem:=cTotGeralItem+
                    DMBelShop.CDS_Busca.FieldByName('VLR_TOTALITEM').AsCurrency;
    End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString)<>'Sem' Then

    If sCodProf=DMBelShop.CDS_Busca.FieldByName('COD_PROF').AsString Then
     Begin
       If sTpComissao=Trim(DMBelShop.CDS_Busca.FieldByName('COMISSAO_APLICADA').AsString) Then
        Begin
          // Totais
          cTotVlrComissaoSID:=cTotVlrComissaoSID+cVlrComissaoSID;
          cTotVlrComissao:=cTotVlrComissao+
                 DMBelShop.CDS_Busca.FieldByName('VLR_TOT_COMISSAO').AsCurrency;

          If Trim(DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString)<>'Sem' Then
          Begin
            cTotQtdServ:=cTotQtdServ+
                      DMBelShop.CDS_Busca.FieldByName('QTD_SERVICO').AsCurrency;

            cTotVlrItem:=cTotVlrItem+
                    DMBelShop.CDS_Busca.FieldByName('VLR_TOTALITEM').AsCurrency;
          End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString)<>'Sem' Then

          Detalhes('');
        End
       Else // If sTpComissao=Trim(DMBelShop.CDS_Busca.FieldByName('COMISSAO_APLICADA').AsString) Then
        Begin
          Detalhes('C');

          // Totais
          cTotVlrComissaoSID:=cTotVlrComissaoSID+cVlrComissaoSID;
          cTotVlrComissao:=cTotVlrComissao+
                 DMBelShop.CDS_Busca.FieldByName('VLR_TOT_COMISSAO').AsCurrency;

          If Trim(DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString)<>'Sem' Then
          Begin
            cTotQtdServ:=cTotQtdServ+
                      DMBelShop.CDS_Busca.FieldByName('QTD_SERVICO').AsCurrency;

            cTotVlrItem:=cTotVlrItem+
                    DMBelShop.CDS_Busca.FieldByName('VLR_TOTALITEM').AsCurrency;
          End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString)<>'Sem' Then

        End; // If sTpComissao=Trim(DMBelShop.CDS_Busca.FieldByName('COMISSAO_APLICADA').AsString) Then

     End
    Else // If sCodProf=DMBelShop.CDS_Busca.FieldByName('COD_PROF').AsString Then
     Begin
       Detalhes('P');

       // Totais
       cTotVlrComissaoSID:=cTotVlrComissaoSID+cVlrComissaoSID;
       cTotVlrComissao:=cTotVlrComissao+
                 DMBelShop.CDS_Busca.FieldByName('VLR_TOT_COMISSAO').AsCurrency;

       If Trim(DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString)<>'Sem' Then
       Begin
         cTotQtdServ:=cTotQtdServ+
                      DMBelShop.CDS_Busca.FieldByName('QTD_SERVICO').AsCurrency;

         cTotVlrItem:=cTotVlrItem+
                    DMBelShop.CDS_Busca.FieldByName('VLR_TOTALITEM').AsCurrency;
       End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString)<>'Sem' Then

     End; // If sCodProf=DMBelShop.CDS_Busca.FieldByName('COD_PROF').AsString Then

    sCodProf   :=DMBelShop.CDS_Busca.FieldByName('COD_PROF').AsString;
    sTpComissao:=Trim(DMBelShop.CDS_Busca.FieldByName('COMISSAO_APLICADA').AsString);

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do
  FrmBelShop.MontaProgressBar(False, FrmSalao);

  // Parte Final ===============================================================
  Detalhes('F');

  DMBelShop.CDS_Busca.Close;

  DMSalao.CDS_V_PagtosVendas.IndexFieldNames:='INDEX';
  DMSalao.CDS_V_PagtosVendas.First;

  THackDBGridSalao(Dbg_PagtosVendas).FixedCols:=3;

End; // PLANILHA DE PAGAMENTOS - Apresenta Vendas de Profissionais no Grid /////

// PLANILHA DE PAGAMENTOS - Gera Movimentação de Beneficios ////////////////////
Function TFrmSalao.ProfGeraBeneficios: Boolean;
Var
  MySql: String;
  bExecutar: Boolean;
  sDtaUltGeracao: String;
  dDtaIni, dDtaFim: TDate;
  iDiasPagto: integer;
Begin
  Result:=True;

  OdirPanApres.Caption:='AGUARDE !! Gerando Valores de Benefícios na Loja: Bel_'+FormatFloat('00',EdtPagtoCodLoja.AsInteger);
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Busca Beneficios a Calcular ===============================================
  MySql:=' SELECT b.cod_pessoa, b.num_docto, b.des_docto,'+
         ' b.dta_ini_beneficio, b.dta_fim_beneficio, b.dta_ult_geracao, b.dta_ult_pagto,'+

         ' CAST(CASE'+
         '    WHEN b.dta_ult_geracao IS NULL THEN b.dta_ini_beneficio'+
         '    WHEN b.dta_ult_geracao>b.dta_ini_beneficio THEN b.dta_ult_geracao+1'+
         ' END AS DATE) Dta_Inicio,'+

         ' CAST(CASE'+
         '    WHEN (b.dta_fim_beneficio IS NULL) OR (b.dta_fim_beneficio>CAST('+QuotedStr(sgDtaF)+' AS DATE)) THEN '+QuotedStr(sgDtaF)+ // Dta do Fim do Calculo
         '    ELSE b.dta_fim_beneficio'+
         ' END AS DATE) Dta_Fim,'+

         ' b.vlr_docto,'+

         ' b.ind_uma_vez,'+

         ' b.ind_diariamente,'+

         ' b.ind_semanamente,'+
         ' b.tip_vlr_apagar,'+
         ' CASE'+
         '   WHEN (b.ind_dia_seg=''SIM'') AND (COALESCE(b.tip_vlr_apagar,9999)<>9999) THEN ''SEQ'''+
         '   WHEN (b.ind_dia_ter=''SIM'') AND (COALESCE(b.tip_vlr_apagar,9999)<>9999) THEN ''TER'''+
         '   WHEN (b.ind_dia_qua=''SIM'') AND (COALESCE(b.tip_vlr_apagar,9999)<>9999) THEN ''QUA'''+
         '   WHEN (b.ind_dia_qui=''SIM'') AND (COALESCE(b.tip_vlr_apagar,9999)<>9999) THEN ''QUI'''+
         '   WHEN (b.ind_dia_sex=''SIM'') AND (COALESCE(b.tip_vlr_apagar,9999)<>9999) THEN ''SEX'''+
         '    ELSE '''''+
         ' END Dia_Semana,'+

         ' b.ind_mensalmente,'+
         ' b.des_posicao_dia,'+
         ' CASE'+
         '   WHEN (b.ind_dia_seg=''SIM'') AND (Coalesce(b.des_posicao_dia,'''')<>'''') THEN ''SEQ'''+
         '   WHEN (b.ind_dia_ter=''SIM'') AND (Coalesce(b.des_posicao_dia,'''')<>'''') THEN ''TER'''+
         '   WHEN (b.ind_dia_qua=''SIM'') AND (Coalesce(b.des_posicao_dia,'''')<>'''') THEN ''QUA'''+
         '   WHEN (b.ind_dia_qui=''SIM'') AND (Coalesce(b.des_posicao_dia,'''')<>'''') THEN ''QUI'''+
         '   WHEN (b.ind_dia_sex=''SIM'') AND (Coalesce(b.des_posicao_dia,'''')<>'''') THEN ''SEX'''+
         '   ELSE '''''+
         ' END Dia_Mes'+

         ' FROM PS_BENEFICIOS_PESSOAS b'+
         ' WHERE b.tp_pessoa=1'+
         ' AND   b.ind_ativo='+QuotedStr('S')+
         ' AND   b.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
         ' AND   b.dta_ini_beneficio<='+QuotedStr(sgDtaF)+
         ' AND   ((b.dta_ult_geracao<'+QuotedStr(sgDtaF)+') OR (b.dta_ult_geracao IS NULL) OR'+
         '       ((b.ind_uma_vez='+QuotedStr('S')+') AND (b.dta_ult_geracao IS NULL)))'+

         ' ORDER BY b.cod_pessoa, b.ind_uma_vez, b.ind_diariamente, b.ind_semanamente, b.ind_mensalmente';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  If Trim(DMBelShop.CDS_Busca.FieldByName('Cod_Pessoa').AsString)='' Then
  Begin
    DMBelShop.CDS_Busca.Close;
    Exit;
  End;

  // Monta INSERT PS_VALES_PESSOAS =============================================
  MySqlDML:=' INSERT INTO PS_VALES_PESSOAS ('+
            ' NUM_SEQ, TP_PESSOA, COD_LOJA, COD_PESSOA, NUM_DOCTO,'+
            ' DES_DOCTO, IND_DEBCRED, VLR_ORIGINAL, TOT_PRESTACAO,'+
            ' NUM_PRAZO, DTA_PRIM_VENC, NUM_PRESTACAO, DTA_VENCIMENTO,'+
            ' VLR_PRESTACAO, VLR_APAGAR, USU_INCLUI)'+
            ' VALUES ('+
            ' GEN_ID(GEN_VALES,1),'+ // NUM_SEQ
            ' 1,'+ // TP_PESSOA
            QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+' ,'+ // COD_LOJA
            ' :CodProf,'+ // COD_PESSOA, --->> b.Cod_Pessoa
            ' :NumDocto,'+ // NUM_DOCTO, --->> b.Num_docto
            ' :DesDocto,'+ // DES_DOCTO, --->> b.des_docto
            QuotedStr('B')+' ,'+ // IND_DEBCRED,
            ' :VlrDocto,'+ // VLR_ORIGINAL, --->> b.vlr_docto
            ' :TotPrestacao,'+ // TOT_PRESTACAO ---->> LER OBS: Uma Vez dia seman ou mes
            ' :Prazo,'+ // NUM_PRAZO ---->> LER OBS: Somente uma Vez (1) Diariamente (1) Semanalmente (7) Mensalmente (7)
            ' :DtaPrimVencto,'+ // DTA_PRIM_VENC --->>> b.dta_Ini_beneficio
            ' :NumPrestacao,'+ // NUM_PRESTACAO, -->> quantidade de dias entre inicio e vencimento do docto
            ' :DtaVencto,'+ // DTA_VENCIMENTO, -->> Atenção com data final e dia da semana
            ' :Vlr_Prestacao,'+ // VLR_PRESTACAO, -->> Atenção ao Calculo
            ' :Vlr_Apagar,'+ // VLR_APAGAR, --->> Igual a VLR_PRESTACAO
            QuotedStr(Cod_Usuario)+ // USU_INCLUI
            ')';
  DMBelShop.SQLQuery3.Close;
  DMBelShop.SQLQuery3.SQL.Clear;
  DMBelShop.SQLQuery3.SQL.Add(MySqlDML);

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

    FrmBelShop.MontaProgressBar(True, FrmSalao);
    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    pgProgBar.Position:=0;

    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      // COD_PESSOA, --->> b.Cod_Pessoa
      DMBelShop.SQLQuery3.Params.ParamByName('CodProf').AsInteger:=DMBelShop.CDS_Busca.FieldByName('Cod_Pessoa').AsInteger;

      // NUM_DOCTO, --->> b.Num_Docto
      DMBelShop.SQLQuery3.Params.ParamByName('NumDocto').AsInteger:=DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsInteger;

      // DES_DOCTO, --->> b.Des_Docto
      DMBelShop.SQLQuery3.Params.ParamByName('DesDocto').AsString:=Trim(DMBelShop.CDS_Busca.FieldByName('Des_Docto').AsString);

      // VLR_ORIGINAL, --->> b.Vlr_Ddocto
      DMBelShop.SQLQuery3.Params.ParamByName('VlrDocto').AsCurrency:=DMBelShop.CDS_Busca.FieldByName('Vlr_Docto').AsCurrency;

      // DTA_PRIM_VENC --->> b.Dta_Ini_Beneficio
      DMBelShop.SQLQuery3.Params.ParamByName('DtaPrimVencto').AsDate:=StrToDate(DMBelShop.CDS_Busca.FieldByName('Dta_Ini_Beneficio').AsString);

      bExecutar:=False;

      //========================================================================
      // Uma Vez Somente =======================================================
      //========================================================================
      If Trim(DMBelShop.CDS_Busca.FieldByName('ind_uma_vez').AsString)='SIM' Then
      Begin
        // TOT_PRESTACAO ---->> LER OBS: Uma Vez no dia, Diariamente, semanal ou mes
        DMBelShop.SQLQuery3.Params.ParamByName('TotPrestacao').AsInteger:=1;

        // NUM_PRAZO ---->> LER OBS: Somente uma Vez (1) Diariamente (1) Semanalmente (7) Mensalmente (7)
        DMBelShop.SQLQuery3.Params.ParamByName('Prazo').AsInteger:=1;

        // NUM_PRESTACAO, -->> quantidade de dias entre inicio e vencimento do docto
        DMBelShop.SQLQuery3.Params.ParamByName('NumPrestacao').AsInteger:=1;

        // DTA_VENCIMENTO, -->> Atenção com data final e dia da semana
        DMBelShop.SQLQuery3.Params.ParamByName('DtaVencto').AsDate:=StrToDate(
                 DMBelShop.CDS_Busca.FieldByName('Dta_Ini_Beneficio').AsString);

        // VLR_PRESTACAO, -->> (Vlr_Docto) Atenção ao Calculo
        DMBelShop.SQLQuery3.Params.ParamByName('Vlr_Prestacao').AsCurrency:=
                        DMBelShop.CDS_Busca.FieldByName('Vlr_Docto').AsCurrency;

        // VLR_APAGAR, --->> Igual a VLR_PRESTACAO
        DMBelShop.SQLQuery3.Params.ParamByName('Vlr_Apagar').AsCurrency:=
                        DMBelShop.CDS_Busca.FieldByName('Vlr_Docto').AsCurrency;

        DMBelShop.SQLQuery3.ExecSQL;

        sDtaUltGeracao:=DMBelShop.CDS_Busca.FieldByName('Dta_Ini_Beneficio').AsString;
        bExecutar:=True;
      End; // If Trim(DMBelShop.CDS_Busca.FieldByName('ind_uma_vez').AsString)='SIM' Then
      //========================================================================

      //========================================================================
      // Diariamente ===========================================================
      //========================================================================
      If Trim(DMBelShop.CDS_Busca.FieldByName('ind_diariamente').AsString)='SIM' Then
      Begin
        // TOT_PRESTACAO ---->> LER OBS: Uma Vez no dia, Diariamente, semanal ou mes
        DMBelShop.SQLQuery3.Params.ParamByName('TotPrestacao').AsInteger:=1;

        // NUM_PRAZO ---->> LER OBS: Somente uma Vez (1) Diariamente (1) Semanalmente (7) Mensalmente (7)
        DMBelShop.SQLQuery3.Params.ParamByName('Prazo').AsInteger:=1;

        // NUM_PRESTACAO, -->> quantidade de dias entre inicio e vencimento do docto
        DMBelShop.SQLQuery3.Params.ParamByName('NumPrestacao').AsInteger:=1;

        // Periodo para Analise de Pagamento -----------------------------------
        dDtaIni:=StrToDate(DMBelShop.CDS_Busca.FieldByName('Dta_Inicio').AsString);
        dDtaFim:=StrToDate(DMBelShop.CDS_Busca.FieldByName('Dta_Fim').AsString);
        While dDtaIni<=dDtaFim do
        Begin
          // DTA_VENCIMENTO, -->> Atenção com data final e dia da semana
          DMBelShop.SQLQuery3.Params.ParamByName('DtaVencto').AsDate:=dDtaIni;

          // VLR_PRESTACAO, -->> (Vlr_Docto) Atenção ao Calculo
          DMBelShop.SQLQuery3.Params.ParamByName('Vlr_Prestacao').AsCurrency:=
                        DMBelShop.CDS_Busca.FieldByName('Vlr_Docto').AsCurrency;

          // VLR_APAGAR, --->> Igual a VLR_PRESTACAO
          DMBelShop.SQLQuery3.Params.ParamByName('Vlr_Apagar').AsCurrency:=
                        DMBelShop.CDS_Busca.FieldByName('Vlr_Docto').AsCurrency;

          DMBelShop.SQLQuery3.ExecSQL;

          sDtaUltGeracao:=DateToStr(dDtaIni);
          bExecutar:=True;

          dDtaIni:=dDtaIni+1;
        End; // While dDtaIni<=dDtaFim Then
      End; // If Trim(DMBelShop.CDS_Busca.FieldByName('ind_diariamente').AsString)='SIM' Then
      //========================================================================

      //========================================================================
      // Semanalmente ==========================================================
      //========================================================================
      If Trim(DMBelShop.CDS_Busca.FieldByName('ind_semanamente').AsString)='SIM' Then
      Begin
        // Periodo para Analise de Pagamento -----------------------------------
        dDtaIni:=StrToDate(DMBelShop.CDS_Busca.FieldByName('Dta_Inicio').AsString);
        dDtaFim:=StrToDate(DMBelShop.CDS_Busca.FieldByName('Dta_Fim').AsString);
        iDiasPagto:=0;
        While dDtaIni<=dDtaFim do
        Begin
          Inc(iDiasPagto);

          If AnsiUpperCase(DiaSemanaAbrev(dDtaIni))=DMBelShop.CDS_Busca.FieldByName('Dia_Semana').AsString Then
          Begin
            DecodeDate(PrimeiroUltimoDia(dDtaIni,'U'), wgAnoH, wgMesH, wgDiaH);
            igNrDias:=wgDiaH;

            // TOT_PRESTACAO ---->> LER OBS: Uma Vez no dia, Diariamente, semanal ou mes
            DMBelShop.SQLQuery3.Params.ParamByName('TotPrestacao').AsInteger:=1;

            // NUM_PRAZO ---->> LER OBS: Somente uma Vez (1) Diariamente (1) Semanalmente (7) Mensalmente (7)
            DMBelShop.SQLQuery3.Params.ParamByName('Prazo').AsInteger:=1;

            // NUM_PRESTACAO, -->> quantidade de dias entre inicio e vencimento do docto
            DMBelShop.SQLQuery3.Params.ParamByName('NumPrestacao').AsInteger:=1;

            // DTA_VENCIMENTO, -->> Atenção com data final e dia da semana
            DMBelShop.SQLQuery3.Params.ParamByName('DtaVencto').AsDate:=dDtaIni;

            // VLR_PRESTACAO, -->> (Vlr_Docto) Atenção ao Calculo
            If DMBelShop.CDS_Busca.FieldByName('Tip_Vlr_Apagar').AsString ='0' Then
             DMBelShop.SQLQuery3.Params.ParamByName('Vlr_Prestacao').AsCurrency:=
                         DMBelShop.CDS_Busca.FieldByName('Vlr_Docto').AsCurrency
            Else
             DMBelShop.SQLQuery3.Params.ParamByName('Vlr_Prestacao').AsCurrency:=
               RoundTo(((DMBelShop.CDS_Busca.FieldByName('Vlr_Docto').AsCurrency/
                                                        igNrDias)*iDiasPagto),-2);

            // VLR_APAGAR, --->> Igual a VLR_PRESTACAO
            DMBelShop.SQLQuery3.Params.ParamByName('Vlr_Apagar').AsCurrency:=
             DMBelShop.SQLQuery3.Params.ParamByName('Vlr_Prestacao').AsCurrency;

            DMBelShop.SQLQuery3.ExecSQL;
          End; // If AnsiUpperCase(DiaSemanaAbrev(dDtaIni))=DMBelShop.CDS_Busca.FieldByName('Dia_Semana').AsString Then

          sDtaUltGeracao:=DateToStr(dDtaIni);
          bExecutar:=True;

          dDtaIni:=dDtaIni+1;
        End; // While dDtaIni<=dDtaFim Then
      End; // If Trim(DMBelShop.CDS_Busca.FieldByName('ind_semanamente').AsString)='SIM' Then
      //========================================================================

      //========================================================================
      // Mensalmente ===========================================================
      //========================================================================
      If Trim(DMBelShop.CDS_Busca.FieldByName('ind_mensalmente').AsString)='SIM' Then
      Begin
        // Periodo para Analise de Pagamento -----------------------------------
        dDtaIni:=StrToDate(DMBelShop.CDS_Busca.FieldByName('Dta_Inicio').AsString);
        dDtaFim:=StrToDate(DMBelShop.CDS_Busca.FieldByName('Dta_Fim').AsString);
        While dDtaIni<=dDtaFim do
        Begin

          If (AnsiUpperCase(DiaSemanaAbrev(dDtaIni))=DMBelShop.CDS_Busca.FieldByName('Dia_Mes').AsString) and
             (DiaNoMes(dDtaIni)=DMBelShop.CDS_Busca.FieldByName('Des_Posicao_Dia').AsString) Then
          Begin
            // TOT_PRESTACAO ---->> LER OBS: Uma Vez no dia, Diariamente, semanal ou mes
            DMBelShop.SQLQuery3.Params.ParamByName('TotPrestacao').AsInteger:=1;

            // NUM_PRAZO ---->> LER OBS: Somente uma Vez (1) Diariamente (1) Semanalmente (7) Mensalmente (7)
            DMBelShop.SQLQuery3.Params.ParamByName('Prazo').AsInteger:=1;

            // NUM_PRESTACAO, -->> quantidade de dias entre inicio e vencimento do docto
            DMBelShop.SQLQuery3.Params.ParamByName('NumPrestacao').AsInteger:=1;

            // DTA_VENCIMENTO, -->> Atenção com data final e dia da semana
            DMBelShop.SQLQuery3.Params.ParamByName('DtaVencto').AsDate:=dDtaIni;

            // VLR_PRESTACAO, -->> (Vlr_Docto) Atenção ao Calculo
            DMBelShop.SQLQuery3.Params.ParamByName('Vlr_Prestacao').AsCurrency:=
                        DMBelShop.CDS_Busca.FieldByName('Vlr_Docto').AsCurrency;

            // VLR_APAGAR, --->> Igual a VLR_PRESTACAO
            DMBelShop.SQLQuery3.Params.ParamByName('Vlr_Apagar').AsCurrency:=
             DMBelShop.SQLQuery3.Params.ParamByName('Vlr_Prestacao').AsCurrency;

            DMBelShop.SQLQuery3.ExecSQL;
          End; // If AnsiUpperCase(DiaSemanaAbrev(dDtaIni))=DMBelShop.CDS_Busca.FieldByName('Dia_Semana').AsString Then

          sDtaUltGeracao:=DateToStr(dDtaIni);
          bExecutar:=True;

          dDtaIni:=dDtaIni+1;
        End; // While dDtaIni<=dDtaFim Then
      End; // If Trim(DMBelShop.CDS_Busca.FieldByName('ind_mensalmente').AsString)='SIM' Then
      //========================================================================

      If bExecutar Then
      Begin
        // Atualiza Ultima Geração =============================================
        MySql:=' UPDATE PS_BENEFICIOS_PESSOAS b'+
               ' SET b.dta_ult_geracao='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaUltGeracao)))+
               ' WHERE b.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
               ' AND   b.cod_pessoa='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Pessoa').AsString)+
               ' AND   b.num_docto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString);
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If bExecutar Then

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    FrmBelShop.MontaProgressBar(False, FrmSalao);
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SQLQuery3.Close;

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
      Result:=False;

      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      FrmBelShop.MontaProgressBar(False, FrmSalao);

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try

End; // PLANILHA DE PAGAMENTOS - Gera Movimentação de Beneficios ///////////////

// PLANILHA DE PAGAMENTOS - Apresenta Vendas de Profissionais //////////////////
Function TFrmSalao.ProfApresentaComissoes: Boolean;
Var
  sFiltro, MySql: String;
  cVlrComisSuper: Currency;

  sCodProfAno: String;
  cPerComisAno, cVlrComisAno: Currency;
  iNrAnosExtra: integer;
  mMemoConta: TMemo;
Begin
  // Apresentacao ==============================================================
  OdirPanApres.Caption:='AGUARDE !! 1/2 - Calculando Comissões de Profissionais da Loja: Bel_'+FormatFloat('00',EdtPagtoCodLoja.AsInteger);
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Visible:=True;
  Refresh;

  Result:=True;

  Screen.Cursor:=crAppStart;

  sFiltro:=f_Troca('nt.codvendedor','ve.cod_profissional',sgProfComissao);
  sFiltro:=f_Troca('nt.datacomprovante','ve.dta_comprov',sFiltro);

  //============================================================================
  // Select Total de Vendas e Profissional com Ano Extra =======================
  //============================================================================
  MySql:=' SELECT'+
         ' CASE'+
         '   WHEN COALESCE(CAST(SUBSTRING(pf.blob_renovacoes FROM 1 FOR 32000) AS VARCHAR(2000)),'''')>'''' THEN'+
         '     pf.cod_profissional'+
         '   ELSE'+
         '     ''NAO'''+
         ' END CodProf,'+
         ' CASE'+
         '   WHEN COALESCE(CAST(SUBSTRING(pf.blob_renovacoes FROM 1 FOR 32000) AS VARCHAR(2000)),'''')>'''' THEN'+
         '     pf.blob_renovacoes'+
         '   ELSE'+
         '     ''NAO'''+
         ' END Renovacoes,'+
         ' CASE'+
         '   WHEN COALESCE(CAST(SUBSTRING(pf.blob_renovacoes FROM 1 FOR 32000) AS VARCHAR(2000)),'''')>'''' THEN'+
         '     pf.per_extra_ano'+
         '   ELSE'+
         '     0.00'+
         ' END PerExtraAno,'+
         ' CAST(SUM(COALESCE(ve.vlr_totalitem,0)) AS NUMERIC(12,2)) Total_Vendas'+

         ' FROM sal_movtos_vendas ve'+
         '   LEFT JOIN produto pr               ON pr.codproduto=ve.cod_produto'+
         '                                     AND pr.principalfor in (''000500'',''000883'')'+
         '   LEFT JOIN comprv cp                ON cp.codloja=ve.cod_loja'+
         '                                     AND cp.codcomprovante=ve.cod_comprov'+
         '   LEFT JOIN sal_profissionais pf     ON pf.cod_loja=ve.cod_loja'+
         '                                     AND pf.cod_profissional=ve.cod_profissional'+
         '                                     AND pf.cod_loja=ve.cod_loja'+
         '                                     AND pf.tip_pessoa='+QuotedStr('P')+
         '   LEFT JOIN sal_hab_serv se          ON se.cod_sidicom=ve.cod_produto'+
         '                                     AND se.tip_habserv=''S'''+
         '   LEFT JOIN sal_prof_habilidades ps  ON ps.cod_profissional=pf.cod_profissional'+
         '                                     AND ps.cod_loja=pf.cod_loja'+
         '                                     AND ps.cod_servico=se.cod_habserv'+
         '                                     AND ps.cod_servico IS NOT NULL'+
         '                                     AND ps.ind_ativo=''SIM'''+
         '   LEFT JOIN sal_hab_serv_link lk     ON lk.cod_servico=se.cod_habserv'+
         '   LEFT JOIN sal_hab_serv ha          ON ha.cod_habserv=lk.cod_habilidade'+
         '                                     AND ha.tip_habserv=''H'''+
         '   LEFT JOIN sal_prof_habilidades ph  ON ph.cod_profissional=pf.cod_profissional'+
         '                                     AND ph.cod_loja=pf.cod_loja'+
         '                                     AND ph.cod_habilidade=ha.cod_habserv'+
         '                                     AND ph.cod_servico IS NULL'+
         '                                     AND ph.ind_ativo=''SIM'''+

         ' WHERE ve.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
         ' AND ('+sFiltro+')'+
         ' GROUP BY 1,2,3';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.CDS_Pesquisa.Filter:='';
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  cgTotVendas:=0;
  cVlrComisSuper:=0;
  DMBelShop.CDS_Pesquisa.First;
  While Not DMBelShop.CDS_Pesquisa.Eof do
  Begin
    cgTotVendas:=cgTotVendas+DMBelShop.CDS_Pesquisa.FieldByName('Total_Vendas').AsCurrency;

    DMBelShop.CDS_Pesquisa.Next;
  End; // While Not DMBelShop.CDS_Pesquisa.Eof Then
  DMBelShop.CDS_Pesquisa.First;

  If cgPerComisSuper<>0 Then
   cVlrComisSuper:=RoundTo((cgTotVendas*cgPerComisSuper)/100,-2);

  //============================================================================
  // Select de Apresentação de Comissões =======================================
  //============================================================================
  MySql:=' SELECT ve.cod_profissional Cod_Prof, PF.des_profissional,'+

         ' CASE'+
         '   WHEN (ps.cod_habilidade IS NULL) AND (ha.des_habserv=''PROMOÇÕES'')  THEN'+
         '    ha.des_habserv'+
         '   WHEN (ps.cod_habilidade IS NULL) OR (se.ind_ativo=''NAO'')  THEN'+
         '      ''SERVIÇO NÃO AUTORIZADO-COMISSÃO GERAL'''+
         '   WHEN (ps.per_comissao_serv<>0) AND (ps.per_comissao_serv>ps.per_comissao_hab) AND (ps.per_comissao_serv>pf.per_comissao) THEN'+
         '      ''COMISSÃO SOBRE SERVIÇO'''+
         '   WHEN (ps.per_comissao_hab<>0) AND (ps.per_comissao_hab>pf.per_comissao) THEN'+
         '      ''COMISSÃO SOBRE HABILIDADE'''+
         '   WHEN pf.per_comissao<>0 THEN'+
         '      ''COMISSÃO GERAL'''+
         '   ELSE'+
         '      ''SEM COMISSÃO INFORMADA'''+
         ' END COMISSAO_APLICADA,'+
         ' CAST('+
         '      CASE'+
         '        WHEN (ps.cod_habilidade IS NULL) AND (ha.des_habserv=''PROMOÇÕES'') THEN'+
         '          CASE'+
         '            WHEN PF.ind_sid_tabelaproc=0 THEN'+
         '              (ve.vlr_totalitem*pf.per_comissao)/100'+
         '            WHEN PF.ind_sid_tabelaproc=1 THEN'+
         '              (ve.vlr_totalitem*ve.per_comissao_tab1)/100'+
         '            WHEN PF.ind_sid_tabelaproc=2 THEN'+
         '              (ve.vlr_totalitem*ve.per_comissao_tab2)/100'+
         '            WHEN PF.ind_sid_tabelaproc=3 THEN'+
         '              (ve.vlr_totalitem*ve.per_comissao_tab3)/100'+
         '            WHEN PF.ind_sid_tabelaproc=4 THEN'+
         '              (ve.vlr_totalitem*ve.per_comissao_tab4)/100'+
         '            WHEN PF.ind_sid_tabelaproc=5 THEN'+
         '              (ve.vlr_totalitem*ve.per_comissao_tab5)/100'+
         '            WHEN PF.ind_sid_tabelaproc=6 THEN'+
         '              (ve.vlr_totalitem*ve.per_comissao_tab6)/100'+
         '            WHEN PF.ind_sid_tabelaproc=7 THEN'+
         '              (ve.vlr_totalitem*ve.per_comissao_tab7)/100'+
         '            WHEN PF.ind_sid_tabelaproc=8 THEN'+
         '              (ve.vlr_totalitem*ve.per_comissao_tab8)/100'+
         '            ELSE'+
         '              (ve.vlr_totalitem*pf.per_comissao)/100'+
         '          END'+
         '        WHEN ps.cod_habilidade IS NULL THEN'+
         '          (ve.vlr_totalitem*pf.per_comissao)/100'+
         '        WHEN (ps.per_comissao_serv<>0) AND (ps.per_comissao_serv>ps.per_comissao_hab) AND (ps.per_comissao_serv>pf.per_comissao) THEN'+
         '          (ve.vlr_totalitem*ps.per_comissao_serv)/100'+
         '        WHEN (ps.per_comissao_hab<>0) AND (ps.per_comissao_hab>pf.per_comissao) THEN'+
         '          (ve.vlr_totalitem*ps.per_comissao_hab)/100'+
         '        WHEN pf.per_comissao<>0 THEN'+
         '          (ve.vlr_totalitem*pf.per_comissao)/100'+
         '        ELSE'+
         '          0.00'+
         '      END'+
         ' as Numeric(12,2)) VLR_TOT_COMISSAO,'+

         ' ve.num_docto, ve.dta_comprov,'+
         ' ve.cod_comprov, cp.nomecomprovante TIP_DOCTO,'+
         ' ve.cod_produto,'+
         ' ve.qtd_atendidaitem QTD_SERVICO, ve.vlr_totalitem,'+
         ' pf.per_comissao PER_COMIS_GERAL,'+
         ' pf.per_comissao_supervisor,'+

         ' ps.cod_habilidade,'+
         ' CASE'+
         '   WHEN ha.des_habserv IS NULL THEN'+
         '     ''HABILIDADE NÂO CADASTRADA'''+
         '   ELSE ha.des_habserv'+
         ' END DES_HABILIDADE,'+

         ' ps.per_comissao_hab PER_COMIS_HAB,'+

         ' se.cod_habserv COD_SERVICO,'+
         ' CASE'+
         '   WHEN se.des_habserv IS NULL THEN pr.apresentacao'+
         '   ELSE se.des_habserv'+
         ' END DES_SERVICO,'+
         ' ps.per_comissao_serv PER_COMIS_SERV,'+

         ' pf.ind_sid_niveltabela SID_NIVEL_TAB, pf.ind_sid_tabelaproc SID_TAB_COMSSAO,'+
         ' ve.per_comissao_tab1, ve.per_comissao_tab2, ve.per_comissao_tab3, ve.per_comissao_tab4,'+
         ' ve.per_comissao_tab5, ve.per_comissao_tab6, ve.per_comissao_tab7, ve.per_comissao_tab8'+

         ' FROM sal_movtos_vendas ve'+
         '   LEFT JOIN produto pr               ON pr.codproduto=ve.cod_produto'+
         '                                     AND pr.principalfor in (''000500'',''000883'')'+
         '   LEFT JOIN comprv cp                ON cp.codloja=ve.cod_loja'+
         '                                     AND cp.codcomprovante=ve.cod_comprov'+
         '   LEFT JOIN sal_profissionais pf     ON pf.cod_loja=ve.cod_loja'+
         '                                     AND pf.cod_profissional=ve.cod_profissional'+
         '                                     AND pf.cod_loja=ve.cod_loja'+
         '                                     AND pf.tip_pessoa='+QuotedStr('P')+
         '   LEFT JOIN sal_hab_serv se          ON se.cod_sidicom=ve.cod_produto'+
         '                                     AND se.tip_habserv=''S'''+
         '   LEFT JOIN sal_prof_habilidades ps  ON ps.cod_profissional=pf.cod_profissional'+
         '                                     AND ps.cod_loja=pf.cod_loja'+
         '                                     AND ps.cod_servico=se.cod_habserv'+
         '                                     AND ps.cod_servico IS NOT NULL'+
         '                                     AND ps.ind_ativo=''SIM'''+
         '   LEFT JOIN sal_hab_serv_link lk     ON lk.cod_servico=se.cod_habserv'+
         '   LEFT JOIN sal_hab_serv ha          ON ha.cod_habserv=lk.cod_habilidade'+
         '                                     AND ha.tip_habserv=''H'''+
         '   LEFT JOIN sal_prof_habilidades ph  ON ph.cod_profissional=pf.cod_profissional'+
         '                                     AND ph.cod_loja=pf.cod_loja'+
         '                                     AND ph.cod_habilidade=ha.cod_habserv'+
         '                                     AND ph.cod_servico IS NULL'+
         '                                     AND ph.ind_ativo=''SIM'''+

         ' WHERE ve.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
         ' AND ('+sFiltro+')';

         //======================================================================
         // Comissao Supervisor =================================================
         //======================================================================
         MySqlClausula1:='';
         If sgCodSuperVisor<>'' Then
         Begin
           // Localiza Supervisor ------------------------------------------
           DMSalao.CDS_V_PagtoProf.Locate('CODIGO',sgCodSuperVisor,[]);

           MySqlClausula1:=' UNION'+
                           ' SELECT '+QuotedStr(DMSalao.CDS_V_PagtoProfCODIGO.AsString)+' Cod_Prof, '+
                           QuotedStr(DMSalao.CDS_V_PagtoProfNOME.AsString)+' des_profissional, '+
                           QuotedStr('COMISSÃO SUPERVIDOR -'+CurrToStr(cgPerComisSuper)+'%')+' COMISSAO_APLICADA, '+
                           f_Troca(',','.',CurrToStr(cVlrComisSuper))+' VLR_TOT_COMISSAO, '+
                           QuotedStr('Sem')+' num_docto, current_date dta_comprov,'+
                           ' '''' cod_comprov, '''' TIP_DOCTO, '''' cod_produto,'+
                           ' 1 QTD_SERVICO, '+
                           f_Troca(',','.',CurrToStr(cgTotVendas))+' vlr_totalitem,'+
                           ' 0 PER_COMIS_GERAL, '+
                           f_Troca(',','.',CurrToStr(cgPerComisSuper))+' per_comissao_supervisor,'+
                           ' 0 cod_habilidade, '''' DES_HABILIDADE, 0 PER_COMIS_HAB,'+
                           ' 0 COD_SERVICO, '''' DES_SERVICO, 0 PER_COMIS_SERV,'+
                           ' '''' SID_NIVEL_TAB, '''' SID_TAB_COMSSAO,'+
                           ' 0 per_comissao_tab1, 0 per_comissao_tab2, 0 per_comissao_tab3, 0 per_comissao_tab4,'+
                           ' 0 per_comissao_tab5, 0 per_comissao_tab6, 0 per_comissao_tab7, 0 per_comissao_tab8'+

                           '  From RDB$DATABASE';
         End; // If (cgPerComisSuper<>0) And (sgCodSuperVisor<>'') Then

         //======================================================================
         // Calcula Comissão Extra Ano ==========================================
         //======================================================================
         MySqlSelect   :='';
         MySqlClausula2:='';

         DMBelShop.CDS_Pesquisa.First;
         While Not DMBelShop.CDS_Pesquisa.Eof do
         Begin
           // Localiza Profissional ------------------------------------------
           sCodProfAno :=DMBelShop.CDS_Pesquisa.FieldByName('CodProf').AsString;

           If (DMBelShop.CDS_Pesquisa.FieldByName('CodProf').AsString<>'NAO')   And
              (DMBelShop.CDS_Pesquisa.FieldByName('Renovacoes').AsString<>'NAO') And
              (DMBelShop.CDS_Pesquisa.FieldByName('PerExtraAno').AsCurrency<>0)  And
              (DMSalao.CDS_V_PagtoProf.Locate('CODIGO',sCodProfAno,[])) Then
           Begin
             // Conta Anos de Renovações ----------------------------
             mMemoConta:=TMemo.Create(Self);
             mMemoConta.Visible:=False;
             mMemoConta.Parent:=FrmSalao;
             mMemoConta.Width:=500;
             mMemoConta.Lines.Clear;

             mMemoConta.Text:=DMBelShop.CDS_Pesquisa.FieldByName('Renovacoes').AsString;

             iNrAnosExtra:=mMemoConta.Lines.Count;
             mMemoConta.Free;
             mMemoConta:=Nil;

             cPerComisAno:=DMBelShop.CDS_Pesquisa.FieldByName('PerExtraAno').AsCurrency*iNrAnosExtra;
             cVlrComisAno:=RoundTo((DMBelShop.CDS_Pesquisa.FieldByName('TOTAL_VENDAS').AsCurrency*(cPerComisAno/100)),-2);

             MySqlClausula2:=
             MySqlClausula2+' UNION'+
                            ' SELECT '+QuotedStr(DMSalao.CDS_V_PagtoProfCODIGO.AsString)+' Cod_Prof, '+
                            QuotedStr(DMSalao.CDS_V_PagtoProfNOME.AsString)+' des_profissional, '+
                            QuotedStr('COMISSÃO EXTRA ANO('+
                                      DMBelShop.CDS_Pesquisa.FieldByName('PerExtraAno').AsString+'% - '+
                                      IntToStr(iNrAnosExtra)+' Anos = '+CurrToStr(cPerComisAno)+'%)')+' COMISSAO_APLICADA, '+
                            f_Troca(',','.',CurrToStr(cVlrComisAno))+' VLR_TOT_COMISSAO, '+
                            QuotedStr('Sem')+' num_docto, current_date dta_comprov,'+
                            ' '''' cod_comprov, '''' TIP_DOCTO, '''' cod_produto,'+
                            ' 1 QTD_SERVICO, '+
                            f_Troca(',','.',DMBelShop.CDS_Pesquisa.FieldByName('TOTAL_VENDAS').AsString)+' vlr_totalitem,'+
                            ' 0 PER_COMIS_GERAL,'+
                            ' 0 PER_COMISSAO_SUPERVISOR,'+
                            ' 0 cod_habilidade, '''' DES_HABILIDADE, 0 PER_COMIS_HAB,'+
                            ' 0 COD_SERVICO, '''' DES_SERVICO, 0 PER_COMIS_SERV,'+
                            ' '''' SID_NIVEL_TAB, '''' SID_TAB_COMSSAO,'+
                            ' 0 per_comissao_tab1, 0 per_comissao_tab2, 0 per_comissao_tab3, 0 per_comissao_tab4,'+
                            ' 0 per_comissao_tab5, 0 per_comissao_tab6, 0 per_comissao_tab7, 0 per_comissao_tab8'+
                            '  From RDB$DATABASE';
           End; // If DMBelShop.CDS_Pesquisa.FieldByName('PerExtraAno').AsCurrency>0 Then

           DMBelShop.CDS_Pesquisa.Next;
         End; // While Not DMBelShop.CDS_Pesquisa.Eof do
         DMBelShop.CDS_Pesquisa.Close;

         MySqlOrderGrup:=' ORDER BY 2,1,3';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql+MySqlClausula1+MySqlClausula2+MySqlOrderGrup;
  DMBelShop.CDS_Busca.Open;

  If DMBelShop.CDS_Busca.IsEmpty Then
  Begin
    Screen.Cursor:=crDefault;
    OdirPanApres.Visible:=False;
    If msg('Profissionais Sem Comissão no Período !!'+cr+cr+'Deseja Continuar ??','C')=2 Then
    Begin
      Result:=False;
      Exit;
    End;
  End;

  ProfApresentaComissoesGrid;

  OdirPanApres.Visible:=False;

  Screen.Cursor:=crDefault;
End; // PLANILHA DE PAGAMENTOS - Apresenta Vendas de Profissionais /////////////

// PLANILHA DE PAGAMENTOS - Busca Vendas de Profissionais //////////////////////
Function TFrmSalao.ProfBuscaVendas: Boolean;
Var
  MySql: String;
  bSiga: Boolean;
  i: Integer;
  sDelete: String;
Begin
  Result:=True;
  sgCodEmp:=FormatFloat('00',EdtPagtoCodLoja.AsInteger);

  // Apresentacao ==============================================================
  OdirPanApres.Caption:='AGUARDE !! Localizando Vendas de Profissionais na Loja: Bel_'+sgCodEmp;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Visible:=True;
  Refresh;

  // Conecta Empresa ===========================================================
  If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
   Begin
     bSiga:=True;
   End
  Else
   Begin
     FrmSalao.Refresh;
     bSiga:=False;

     msg('Loja Bel_'+sgCodEmp+' Não Conectada !!'+cr+cr+'Tente Mais Tarde..','A');
     OdirPanApres.Visible:=False;
     Result:=False;
     Exit;
   End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

  // Inicia Processamento ======================================================
  If bSiga Then // Empresa Conectada
  Begin
    FrmBelShop.MontaProgressBar(True, FrmSalao);

    // Cria Query da Empresa ----------------------------------------
    FrmBelShop.CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp,IBQ_Loja, True, True);

    // Monta SQL Total de Registros ---------------------------------
    MySql:=' SELECT Count(nt.codvendedor) TotReg'+
           ' FROM mcli nt'+
           '       LEFT JOIN mclipro it   ON nt.chavenf=it.chavenf'+
           '       LEFT JOIN produto pr   ON it.codproduto=pr.codproduto'+
           '                             AND pr.principalfor in (''000500'',''000883'')'+
           ' WHERE nt.codcomprovante in (''002'', ''007'')'+
           ' AND ('+sgProfComissao+')'+
           ' AND nt.codfilial='+QuotedStr(sgCodEmp);
    IBQ_Loja.SQL.Clear;
    IBQ_Loja.SQL.Add(MySql);
    i:=0;
    bSiga:=False;
    While Not bSiga do
    Begin
      Try
        IBQ_Loja.Open;
        bSiga:=True;
        pgProgBar.Properties.Max:=IBQ_Loja.FieldByName('TotReg').AsInteger;
      Except
        Inc(i);
      End; // Try

      If i>10 Then
      Begin
        // Fecha Conexão =======================================================
        ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

        msg('Loja Bel_'+sgCodEmp+' Perdeu a Não Conexão !!'+cr+cr+'Tente Mais Tarde..','A');
        OdirPanApres.Visible:=False;
        Result:=False;
        Exit;
      End; // If i>10 Then
    End; // While Not bSiga do

    // Monta SQL ----------------------------------------------------
    MySql:=' SELECT'+
           ' nt.codvendedor Cod_Profissional,'+
           ' nt.codvendedor2 Cod_Supervisor,'+
           ' nt.chavenf Num_Chavenf, nt.codcomprovante Cod_Comprov,'+
           ' nt.numero Num_Docto, nt.serie Num_Serie,'+
           ' nt.datadocumento Dta_Docto, nt.datacomprovante Dta_Comprov,'+
           ' nt.situacaonf Ind_SituacaoNF, nt.codcliente Cod_Cliente,'+
           ' nt.totitens Qtd_Itens,'+
           ' nt.totbruto Vlr_BrutoNF, nt.totdescitem Vlr_DescNF, nt.totnota Vlr_TotalNF,'+
           ' it.codproduto Cod_Produto,'+
           ' it.quantatendida Qtd_AtendidaItem,'+
           ' it.preco Vlr_PrecoItem,'+
           ' it.desconto1 Vlr_Desc1Item, it.desconto2 Vlr_Desc2Item,'+
           ' it.desconto3 Vlr_Desc3Item, it.desconto4 Vlr_Desc4Item,  it.descontocalc Vlr_DescCalcItem,'+
           ' it.valbruto Vlr_BrutoItem,  it.valdescitem Vlr_DescItem, it.valtotal Vlr_TotalItem,'+
           ' COALESCE(c.TABELA1,0) PER_COMISSAO_TAB1, COALESCE(c.TABELA2,0) PER_COMISSAO_TAB2,'+
           ' COALESCE(c.TABELA3,0) PER_COMISSAO_TAB3, COALESCE(c.TABELA4,0) PER_COMISSAO_TAB4,'+
           ' COALESCE(c.TABELA5,0) PER_COMISSAO_TAB5, COALESCE(c.TABELA6,0) PER_COMISSAO_TAB6,'+
           ' COALESCE(c.TABELA7,0) PER_COMISSAO_TAB7, COALESCE(c.TABELA8,0) PER_COMISSAO_TAB8'+

           ' FROM mcli nt'+
           '       LEFT JOIN mclipro it   ON nt.chavenf=it.chavenf'+
           '       LEFT JOIN produto pr   ON it.codproduto=pr.codproduto'+
           '                             AND pr.principalfor in (''000500'',''000883'')'+
           '       LEFT JOIN procomis c   ON c.codproduto=it.codproduto'+
           '                             AND c.codnivelcomissao=1'+

           ' WHERE nt.codcomprovante in (''002'', ''007'')'+
           ' AND ('+sgProfComissao+')'+

           ' AND nt.codfilial='+QuotedStr(sgCodEmp)+
           ' ORDER BY nt.numero, pr.apresentacao';
    IBQ_Loja.SQL.Clear;
    IBQ_Loja.SQL.Add(MySql);
    i:=0;
    bSiga:=False;
    While Not bSiga do
    Begin
      Try
        IBQ_Loja.Open;
        bSiga:=True;
      Except
        Inc(i);
      End; // Try

      If i>10 Then
      Begin
        // Fecha Conexão =======================================================
        ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

        msg('Loja Bel'+sgCodEmp+' Perdeu a Não Conexão !!'+cr+cr+'Tente Mais Tarde..','A');
        OdirPanApres.Visible:=False;
        Result:=False;
        Exit;
      End; // If i>10 Then
    End; // While Not bSiga do

    // Processamento ===========================================================
    If bSiga Then // Query Executada
    Begin
      pgProgBar.Position:=0;
      FrmSalao.Refresh;

      // Monta Transacao =======================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMBelShop.SQLC.StartTransaction(TD);
      Try
        Screen.Cursor:=crAppStart;
        DateSeparator:='.';
        DecimalSeparator:='.';

        // Exclui Nota Existente ----------------------------------
        If Not IBQ_Loja.IsEmpty Then
        Begin
          sDelete:=f_Troca('nt.codvendedor','ve.cod_profissional',sgProfComissao);
          sDelete:=f_Troca('nt.datacomprovante','ve.dta_comprov',sDelete);
          MySql:=' DELETE FROM sal_movtos_vendas ve'+
                 ' WHERE ve.cod_loja='+QuotedStr(sgCodEmp)+
                 ' AND ('+sDelete+')';
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End; // If Not IBQ_Loja.IsEmpty Then

        While Not IBQ_Loja.Eof do
        Begin
          Application.ProcessMessages;

          pgProgBar.Position:=IBQ_Loja.RecNo;
          pgProgBar.Refresh;

          // Inclui Nota de Venda -----------------------------------
          MySql:=' Insert Into SAL_MOVTOS_VENDAS ('+
                 ' COD_LOJA, NUM_CHAVENF, COD_COMPROV, NUM_DOCTO, NUM_SERIE,'+
                 ' DTA_DOCTO, DTA_COMPROV, IND_SITUACAONF, COD_CLIENTE,'+
                 ' COD_PROFISSIONAL, COD_SUPERVISOR, QTD_ITENS, VLR_BRUTONF,'+
                 ' VLR_DESCNF, VLR_TOTALNF, COD_PRODUTO, QTD_ATENDIDAITEM,'+
                 ' VLR_PRECOITEM, VLR_DESC1ITEM, VLR_DESC2ITEM, VLR_DESC3ITEM,'+
                 ' VLR_DESC4ITEM, VLR_DESCCALCITEM, VLR_BRUTOITEM, VLR_DESCITEM,'+
                 ' VLR_TOTALITEM,'+
                 ' PER_COMISSAO_TAB1, PER_COMISSAO_TAB2, PER_COMISSAO_TAB3, PER_COMISSAO_TAB4,'+
                 ' PER_COMISSAO_TAB5, PER_COMISSAO_TAB6, PER_COMISSAO_TAB7, PER_COMISSAO_TAB8,'+
                 ' USU_INCLUI)'+

                 ' Values('+
                 QuotedStr(sgCodEmp)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('NUM_CHAVENF').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('COD_COMPROV').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('NUM_DOCTO').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('NUM_SERIE').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('DTA_DOCTO').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('DTA_COMPROV').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('IND_SITUACAONF').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('COD_CLIENTE').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('COD_PROFISSIONAL').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('COD_SUPERVISOR').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('QTD_ITENS').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('VLR_BRUTONF').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('VLR_DESCNF').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('VLR_TOTALNF').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('COD_PRODUTO').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('QTD_ATENDIDAITEM').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('VLR_PRECOITEM').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('VLR_DESC1ITEM').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('VLR_DESC2ITEM').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('VLR_DESC3ITEM').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('VLR_DESC4ITEM').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('VLR_DESCCALCITEM').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('VLR_BRUTOITEM').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('VLR_DESCITEM').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('VLR_TOTALITEM').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('PER_COMISSAO_TAB1').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('PER_COMISSAO_TAB2').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('PER_COMISSAO_TAB3').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('PER_COMISSAO_TAB4').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('PER_COMISSAO_TAB5').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('PER_COMISSAO_TAB6').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('PER_COMISSAO_TAB7').AsString)+', '+
                 QuotedStr(IBQ_Loja.FieldByName('PER_COMISSAO_TAB8').AsString)+', '+
                 QuotedStr(Cod_Usuario)+')';
          DMBelShop.SQLC.Execute(MySql,nil,nil);

          IBQ_Loja.Next;
        End; // While Not IBQ_Loja.Eof do
        IBQ_Loja.Close;

        // Fecha Transacao =====================================================
        DMBelShop.SQLC.Commit(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

      Except
        on e : Exception do
        Begin
          Result:=False;
          IBQ_Loja.Close;

          // Fecha Conexão =====================================================
          ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

          DMBelShop.SQLC.Rollback(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';
          Screen.Cursor:=crDefault;

          MessageBox(Handle, pChar(sgCodEmp+#13+e.message), 'Erro', MB_ICONERROR);

          FrmBelShop.MontaProgressBar(False, FrmSalao);
          OdirPanApres.Visible:=False;
          Exit;
        End; // on e : Exception do
      End; // Try
    End; // If bSiga Then // Query Executada
  End; // If bSiga Then // Empresa Conectada

  FrmBelShop.MontaProgressBar(False, FrmSalao);

  // Fecha Conexão =============================================================
  ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

  OdirPanApres.Visible:=False;
End; // PLANILHA DE PAGAMENTOS - Busca Venda de Profissionais //////////////////

// PLANILHA DE PAGAMENTOS - Calcula Período para Calculo ///////////////////////
Procedure TFrmSalao.CalculaPeriodoCalculo(sDiaI, sDiaF, sDtaIUC, sDtaFUC: String; var sDtaIC: String; var sDtaFC: String);
Var
  dDta: TDate;
  b: Boolean;
  MySql: String;
begin
  // sDiaI  =Dia da Semana de Inicio do Calculo
  // sDiaF  =Dia da Semana de Fim do Calculo
  // sDtaIUC=Data Inicial do Último Calculo
  // sDtaFUC=Data Final do Último Calculo
  // sDtaIC =Data Inicial para Calculo (Retorno)
  // sDtaFC =Data Final para Calculo (Retorno)

  If sgDtaIniSemana='' Then
  Begin
    MySql:=' SELECT p.dta_periodo_ini_cal Dta_Inicio, p.dta_periodo_fim_cal Dta_Fim'+
           ' FROM SAL_PROFISSIONAIS p'+
           ' WHERE p.tip_pessoa='+QuotedStr('P')+
           ' AND   p.ind_ativo='+QuotedStr('SIM')+
           ' AND   p.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
           ' GROUP BY 1, 2'+
           ' HAVING p.dta_periodo_ini_cal=MAX(p.dta_periodo_ini_cal)'+
           ' ORDER BY 1, 2';
    DMBelShop.SQLQuery1.Close;
    DMBelShop.SQLQuery1.SQL.Clear;
    DMBelShop.SQLQuery1.SQL.Add(MySql);
    DMBelShop.SQLQuery1.Open;
    sgDtaIniSemana:=DMBelShop.SQLQuery1.FieldByName('Dta_Inicio').AsString;
    sgDtaFimSemana:=DMBelShop.SQLQuery1.FieldByName('Dta_Fim').AsString;
    DMBelShop.SQLQuery1.Close;

    If sgDtaIniSemana='' Then
     sgDtaIniSemana:=sDtaIUC;

    If sgDtaFimSemana='' Then
     sgDtaFimSemana:=sDtaFUC;
  End; // If sgDtaIniSemana='' Then

  If sDtaIUC='' Then
   sDtaIUC:=sgDtaIniSemana;

  If sDtaFUC='' Then
   sDtaFUC:=sgDtaFimSemana;

  If StrToDate(sDtaIUC)<StrToDate(sgDtaIniSemana) Then
   sgDtaIniSemana:=sDtaIUC
  Else
   sDtaIUC:=sgDtaIniSemana;

  dDta:=DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)+1;
  sDtaIC:='';
  sDtaFC:='';
  b:=True;
  While b do
  Begin
  sgAnoCompetencia:=DateToStr(dDta);
    dDta:=dDta-1;
  sgAnoCompetencia:=DateToStr(dDta);

    If StrToDate(sDtaFUC)>=dDta Then
    Begin
      sDtaIC:=sgDtaIniSemana;
      sDtaFC:=sgDtaFimSemana;
      Break;
    End;

    If AnsiUpperCase(DiaSemanaNome(dDta))=AnsiUpperCase(sDiaF) Then
    Begin
      Try
        StrToDate(sDtaFC);
      Except
        sDtaFC:=DateToStr(dDta);
      End; // Try
    End; // If AnsiUpperCase(DiaSemanaNome(dDta))=AnsiUpperCase(sDiaF) Then

    If AnsiUpperCase(DiaSemanaNome(dDta))=AnsiUpperCase(sDiaI) Then
    Begin
      Try
        StrToDate(sDtaFC);
        sDtaIC:=DateToStr(dDta);

       If sDtaIC=sDtaIUC Then
        Begin
          sDtaFC:='';
          sDtaIC:='';
          Break;
        End
       Else If Trim(sDtaIUC)='' Then
        Begin
          Break;
        End
       Else If sDtaIC<>DateToStr(StrToDate(sDtaFUC)+1) Then // If sDtaIC=sDtaIUC Then
        Begin
          sDtaIC:='';
        End
       Else // If sDtaIC=sDtaIUC Then
        Begin
          Break;
        End; // If sDtaIC=sDtaIUC Then
      Except
      End; // Try
    End; // If AnsiUpperCase(DiaSemanaNome(dDta))=AnsiUpperCase(sDiaI) Then
  End; // While b do

  If Trim(sDtaIC)='' Then sDtaIC:=sDtaIUC;
  If Trim(sDtaFC)='' Then sDtaFC:=sDtaFUC;

End; // PLANILHA DE PAGAMENTOS - Calcula Período para Calculo //////////////////

// PLANILHA DE PAGAMENTOS - Busca Profissionais a Calcular /////////////////////
Function TFrmSalao.ProfissionaisCalcular: Boolean;
Var
  MySql: String;
  sSalMinimo, sDta, sDiaI, sDiaF: String;
Begin
  Result:=False;

  OdirPanApres.Caption:='AGUARDE !! Localizando Profissionais na Loja: Bel_'+FormatFloat('00',EdtPagtoCodLoja.AsInteger);
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Visible:=True;
  Refresh;

  Screen.Cursor:=crAppStart;
  MySql:=' SELECT ''SIM'' Calcular,  ''Bel_''||p.cod_loja Loja,'+
         ' p.cod_profissional Codigo, p.des_profissional Nome, p.des_apelido Apelido,'+
         ' p.dia_periodo_ini_com Dia_Inicio, p.dia_periodo_fim_com Dia_Final,'+
         ' p.dta_periodo_ini_cal Ini_Ult_Calculo, p.dta_periodo_fim_cal Fim_Ult_Calculo,'+
         ' '''' DTA_INI_CALCULO, '''' DTA_FIM_CALCULO,'+
         ' Coalesce(p.Per_Comissao_Supervisor,0) Per_Comissao_Supervisor,'+
         ' p.num_tecbiz, p.num_inss, p.per_inss,'+
         ' p.num_banco, p.des_banco, p.num_agencia, p.des_agencia, p.num_conta,'+
         ' CASE'+
         '    WHEN ((p.dta_fim_renovacao IS NULL) OR (TRIM(p.dta_fim_renovacao)='''')) THEN'+
         '      p.dta_fim_contrato'+
         '    ELSE'+
         '      p.dta_fim_renovacao'+
         '  END Fim_Contrato'+

         ' FROM sal_profissionais p'+

         ' WHERE p.tip_pessoa='+QuotedStr('P')+
         ' AND   p.ind_ativo='+QuotedStr('SIM')+
         ' AND   p.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
         ' ORDER BY p.des_profissional';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  If Trim(DMBelShop.CDS_Busca.FieldByName('Codigo').AsString)='' Then
  Begin
    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
    DMBelShop.CDS_Busca.Close;
    msg('Sem Profissional a Listar...','A');
    EdtPagtoCodLoja.SetFocus;
    Exit;
  End;
  Lab_TotalProf.Caption:=IntToStr(DMBelShop.CDS_Busca.RecordCount);

  If DMSalao.CDS_V_PagtoProf.Active Then
   DMSalao.CDS_V_PagtoProf.Close;

  DMSalao.CDS_V_PagtoProf.CreateDataSet;
  DMSalao.CDS_V_PagtoProf.IndexFieldNames:='';
  DMSalao.CDS_V_PagtoProf.Open;

  FrmBelShop.MontaProgressBar(True, FrmSalao);
  pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
  pgProgBar.Position:=0;

  cgPerComisSuper:=0;
  sgCodSuperVisor:='';
  DMBelShop.CDS_Busca.First;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    Application.ProcessMessages;

    // Calcula Periodo de Calculo ==============================================
    Try
      CalculaPeriodoCalculo(DMBelShop.CDS_Busca.FieldByName('DIA_INICIO').AsString,
                            DMBelShop.CDS_Busca.FieldByName('DIA_FINAL').AsString,
                            DMBelShop.CDS_Busca.FieldByName('INI_ULT_CALCULO').AsString,
                            DMBelShop.CDS_Busca.FieldByName('FIM_ULT_CALCULO').AsString,
                            sgDtaInicio, sgDtaFim);
    Except
      on e : Exception do
      Begin
        FrmBelShop.MontaProgressBar(False, FrmSalao);

        OdirPanApres.Visible:=False;
        Screen.Cursor:=crDefault;
        DMBelShop.CDS_Busca.Close;
        EdtPagtoCodLoja.Value:=0;
        EdtPagtoDesLoja.Clear;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);

        Break;
        Exit;
      End; // on e : Exception do
    End;

    // Busca Salario Mínimo ====================================================
    sDta:=F_Troca('/','.',sgDtaFim);
    sDta:=F_Troca('-','.',sDta);
    MySql:=' SELECT ct.vlr_inicial Sal_Minimo'+
           ' FROM fin_contribuicoes ct'+
           ' WHERE ct.tp_registro=1'+
           ' AND CAST('+QuotedStr(sDta)+' AS DATE) BETWEEN ct.dta_vigencia_inicio AND ct.dta_vigencia_final';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sSalMinimo:=DMBelShop.CDS_BuscaRapida.FieldBYName('Sal_Minimo').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    If sSalMinimo='' Then
    Begin
      FrmBelShop.MontaProgressBar(False, FrmSalao);

      msg('Salário Mínimo Referentre a '+sDta+cr+cr+'Não Informado nos Parametros !!','A');
      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;
      DMBelShop.CDS_Busca.Close;
      EdtPagtoCodLoja.Value:=0;
      EdtPagtoDesLoja.Clear;
      Break;
      Exit;
    End;

    DMSalao.CDS_V_PagtoProf.Append;

    If sgDtaInicio='' Then
     DMSalao.CDS_V_PagtoProfCALCULAR.AsString:='NAO'
    Else
     DMSalao.CDS_V_PagtoProfCALCULAR.AsString:=
                           DMBelShop.CDS_Busca.FieldByName('Calcular').AsString;

    DMSalao.CDS_V_PagtoProfLOJA.AsString:=
                             DMBelShop.CDS_Busca.FieldByName('Loja').AsString;
    DMSalao.CDS_V_PagtoProfCODIGO.AsString:=
                             DMBelShop.CDS_Busca.FieldByName('Codigo').AsString;
    DMSalao.CDS_V_PagtoProfNOME.AsString:=
                               DMBelShop.CDS_Busca.FieldByName('Nome').AsString;
    DMSalao.CDS_V_PagtoProfAPELIDO.AsString:=
                            DMBelShop.CDS_Busca.FieldByName('Apelido').AsString;
    DMSalao.CDS_V_PagtoProfDIA_INICIO.AsString:=
                         DMBelShop.CDS_Busca.FieldByName('Dia_Inicio').AsString;
    DMSalao.CDS_V_PagtoProfDIA_FINAL.AsString:=
                          DMBelShop.CDS_Busca.FieldByName('Dia_Final').AsString;
    DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString:=
                    DMBelShop.CDS_Busca.FieldByName('Ini_Ult_Calculo').AsString;
    DMSalao.CDS_V_PagtoProfFIM_ULT_CALCULO.AsString:=
                    DMBelShop.CDS_Busca.FieldByName('Fim_Ult_Calculo').AsString;

    DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString:=sgDtaInicio;
    DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString:=sgDtaFim;

    If (DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString=DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString) Or
       (DMSalao.CDS_V_PagtoProfFIM_ULT_CALCULO.AsString=DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString) Then
     DMSalao.CDS_V_PagtoProfCALCULAR.AsString:='NAO';

    DMSalao.CDS_V_PagtoProfVLR_SAL_MINIMO.AsString:=sSalMinimo;

    DMSalao.CDS_V_PagtoProfPER_COMIS_SUPER.AsString:=
            DMBelShop.CDS_Busca.FieldByName('Per_Comissao_Supervisor').AsString;

    If DMBelShop.CDS_Busca.FieldByName('Per_Comissao_Supervisor').AsCurrency<>0 Then
    Begin
      DMSalao.CDS_V_PagtoProfSUPERVISOR.AsString:='SIM';
      cgPerComisSuper:=DMBelShop.CDS_Busca.FieldByName('PER_COMISSAO_SUPERVISOR').AsCurrency;
      sgCodSuperVisor:=DMBelShop.CDS_Busca.FieldByName('Codigo').AsString;
    End;

    DMSalao.CDS_V_PagtoProfNUM_TECBIZ.AsString:=
                         DMBelShop.CDS_Busca.FieldByName('NUM_TECBIZ').AsString;
    DMSalao.CDS_V_PagtoProfNUM_INSS.AsString:=
                           DMBelShop.CDS_Busca.FieldByName('NUM_INSS').AsString;
    DMSalao.CDS_V_PagtoProfPER_INSS.AsString:=
                           DMBelShop.CDS_Busca.FieldByName('Per_INSS').AsString;
    DMSalao.CDS_V_PagtoProfNUM_BANCO.AsString:=
                          DMBelShop.CDS_Busca.FieldByName('NUM_BANCO').AsString;
    DMSalao.CDS_V_PagtoProfDES_BANCO.AsString:=
                          DMBelShop.CDS_Busca.FieldByName('DES_BANCO').AsString;
    DMSalao.CDS_V_PagtoProfNUM_AGENCIA.AsString:=
                        DMBelShop.CDS_Busca.FieldByName('NUM_AGENCIA').AsString;
    DMSalao.CDS_V_PagtoProfDES_AGENCIA.AsString:=
                        DMBelShop.CDS_Busca.FieldByName('DES_AGENCIA').AsString;
    DMSalao.CDS_V_PagtoProfNUM_CONTA.AsString:=
                          DMBelShop.CDS_Busca.FieldByName('NUM_CONTA').AsString;
    DMSalao.CDS_V_PagtoProfFIM_CONTRATO.AsString:=
                       DMBelShop.CDS_Busca.FieldByName('FIM_CONTRATO').AsString;

    DMSalao.CDS_V_PagtoProf.Post;

    pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.Close;
  FrmBelShop.MontaProgressBar(False, FrmSalao);

  If DMSalao.CDS_V_PagtoProf.IsEmpty Then
   Begin
     Result:=False;
   End
  Else
   Begin
     DMSalao.CDS_V_PagtoProf.First;
     Result:=True;
   End;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;
end; // PLANILHA DE PAGAMENTOS - Busca Profissionais a Calcular ////////////////

// METAS - CRIA METAS DO PROFISSIONAL //////////////////////////////////////////
Procedure TFrmSalao.CriaMetasProfissional;
Var
  MySql: String;
Begin
  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' INSERT INTO SAL_METAS ('+  // COD_HABILIDADE,
           ' COD_LOJA, COD_PROFISSIONAL, DES_ANO, USU_INCLUI)'+
           ' Values ('+
           QuotedStr(DMSalao.CDS_MetasProfissionaisCOD_LOJA.AsString)+', '+
           QuotedStr(DMSalao.CDS_MetasProfissionaisCOD_PROFISSIONAL.AsString)+', '+
           QuotedStr(IntToStr(EdtMetasAno.AsInteger))+', '+
           QuotedStr(Cod_Usuario)+
           ')';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    DMSalao.CDS_MetasProf.Close;
    DMSalao.CDS_MetasProf.Open;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try
End; // METAS - CRIA METAS DO PROFISSIONAL /////////////////////////////////////

// PROFISSIONAL - Consiste Dados do Profissional no SIDICOM >>>>>>>>>>>>>>>>>>>>
Function TFrmSalao.ConsisteDadosSidicom(bConsisteSIDICOM: Boolean): Boolean;
Var
  b, bConsistir: Boolean;
Begin
  Result:=False;

  // Nível de Tabela ------------------------------------------------
  bConsistir:=True;
  if (DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE','Dbe_CadProfSidNivelTabela',[])) And (Not bConsisteSIDICOM) Then
   bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
  If bConsistir Then
  Begin
    b:=True;
    if StrToIntDef(DMSalao.CDS_ProfissionaisIND_SID_NIVELTABELA.AsString,99999999)=99999999 Then
     b:=False;

    If ((DMSalao.CDS_ProfissionaisIND_SID_NIVELTABELA.AsInteger<0) Or
        (DMSalao.CDS_ProfissionaisIND_SID_NIVELTABELA.AsInteger>1)) and (b) Then
     b:=False;

    If Not b Then
    Begin
      Try
        Dbe_CadProfSidNivelTabela.SetFocus;
        msg('Nível de Tabela Inválido !!'+cr+cr+'0=Não Usa Comissão'+cr+'1=Usa Comissão    ','A');
      Except
        msg('ERRO DE INCLUSÃO DE DADOS SIDICOM:'+cr+cr+'Nível de Tabela Inválido !!'+cr+'0=Não Usa Comissão'+cr+'1=Usa Comissão    ','A');
      End;
      Exit;
    End;
  End; // If bConsistir Then

  // Tipo de Cálculo de Comissão ------------------------------------
  bConsistir:=True;
  if (DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE','Gb_CadProfSidTipCalculo',[])) And (Not bConsisteSIDICOM) Then
   bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
  If bConsistir Then
  Begin
    If (not Rb_CadProfSidPercentuais.Checked) and
       (not Rb_CadProfSidDescontos.Checked) and
       (not Rb_CadProfSidListaPreco.Checked) Then
    Begin
      Try
        Rb_CadProfSidPercentuais.SetFocus;
        msg('Favor Informar o'+cr+'Tipo de Cálculo de Comissão !!','A');
      Except
        msg('ERRO DE INCLUSÃO DE DADOS SIDICOM:'+cr+cr+'Tipo de Cálculo de Comissão Inválido !!','A');
    End;
      Exit;
    End;
  End; // If bConsistir Then

  // Tabela Comissão Percentuais ------------------------------------
  bConsistir:=True;
  if (DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE','Gb_CadProfSidTabelaProc',[])) And (Not bConsisteSIDICOM) Then
   bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
  If bConsistir Then
  Begin
    If (Rb_CadProfSidPercentuais.Checked) and (not Rb_CadProfSidTabela0.Checked) and
       (not Rb_CadProfSidTabela1.Checked) and (not Rb_CadProfSidTabela2.Checked) and
       (not Rb_CadProfSidTabela3.Checked) and (not Rb_CadProfSidTabela4.Checked) and
       (not Rb_CadProfSidTabela5.Checked) and (not Rb_CadProfSidTabela6.Checked) and
       (not Rb_CadProfSidTabela7.Checked) and (not Rb_CadProfSidTabela8.Checked) Then
    Begin
      Try
        Rb_CadProfSidTabela0.SetFocus;
        msg('Favor Informar o'+cr+'Tabela Comissão Percentuais !!','A');
      Except
        msg('ERRO DE INCLUSÃO DE DADOS SIDICOM:'+cr+cr+'Tabela Comissão Percentuais Inválida !!','A');
      End;

      Exit;
    End;
  End; // If bConsistir Then

  // Codigo do Supervisor -------------------------------------------
  bConsistir:=True;
  if (DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'EdtCadProfSidCodSupervisor' ,[])) And (Not bConsisteSIDICOM) Then
   bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
  If bConsistir Then
  Begin
    If DMSalao.CDS_SID_Supervisor.IsEmpty Then
    Begin
      Try
        PC_CadProfSidicom.TabIndex:=0;
        EdtCadProfSidCodSupervisor.SetFocus;
        msg('Favor Informar o'+cr+'Supervidor !!','A');
      Except
        msg('ERRO DE INCLUSÃO DE DADOS SIDICOM:'+cr+cr+'Profissional SEM Supervisor !!','A');
      End;

      Exit;
    End;
  End; // If bConsistir Then

  Result:=True;
End;

// PROFISSIONAL - Atualiza Profissional no SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSalao.AtualizaProfissionalSIDICOM(sDML: String): Boolean;
Var
  MySql: String;
  b: Boolean;
  mMemo: TMemo;
  i: Integer;
Begin
  // sDML: (A)Alteração
  //       (I)Inclusão

  Result:=False;
  bgIncluidoSIDICOM:=False;

  sgCodEmp :=FormatFloat('00',StrToInt(EdtCodLoja.Text));
  sgDesLoja:=EdtDesLoja.Text;

  // Apresentacao ==============================================================
  OdirPanApres.Caption:='AGUARDE !! Atualizando Profissional na Loja: '+sgCodEmp+' - '+sgDesLoja;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2));
  OdirPanApres.Visible:=True;
  Refresh;

  // Conecta Empresa ===========================================================
  If Not ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
  Begin
    OdirPanApres.Visible:=False;
    Refresh;
    msg('Loja Bel_'+sgCodEmp+cr+'NÃO Conectada a Internet !!'+cr+cr+'Tente Mais Tarde...','A');
    Exit;
  End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

  // Cria Query da Empresa =====================================================
  FrmBelShop.CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_Loja, True, True);

  // Monta Transacao ===========================================================
  b:=False;
  While Not b do
  Begin
    b:=IBTransacao('S', 'IBT_'+sgCodEmp);
  End; // While Not b do

  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Inclui Profissional --------------------------------------
    If sDML='I' Then
    Begin
      sgMensagem:='Inclusão do Profissional';

      MySql:=' Insert Into VENDEDOR ('+
             ' CODVENDEDOR, NOMEVENDEDOR, TIPOCOMISSAO, TABELAPRO, VALORQUOTA,'+
             ' TELEFONE, ENDERECO, LOGNUMERO, LOGCOMPL, BAIRRO, CIDADE, ESTADO,'+
             ' CODIGOPOSTAL, OBSERVACAO, DESATIVADO, CODNIVELCOMISSAO, NUMEROCPF,'+
             ' DATAALTERACAO, EMAIL, CODVENFORCONFIG)'+

             ' Values('+
             ' :CODVENDEDOR, :NOMEVENDEDOR, :TIPOCOMISSAO, :TABELAPRO, :VALORQUOTA,'+
             ' :TELEFONE, :ENDERECO, :LOGNUMERO, :LOGCOMPL, :BAIRRO, :CIDADE, :ESTADO,'+
             ' :CODIGOPOSTAL, :OBSERVACAO, :DESATIVADO, :CODNIVELCOMISSAO, :NUMEROCPF,'+
             ' current_timestamp, :EMAIL, :CODVENFORCONFIG)';
    End; // If sDML='I' Then

    // Altera Profissional --------------------------------------
    If sDML='A' Then
    Begin
      sgMensagem:='Alteração do Profissional';

      MySql:=' Update VENDEDOR Set'+
             '  NOMEVENDEDOR=:NOMEVENDEDOR'+
             ', TIPOCOMISSAO=:TIPOCOMISSAO'+
             ', TABELAPRO=:TABELAPRO'+
             ', VALORQUOTA=:VALORQUOTA'+
             ', TELEFONE=:TELEFONE'+
             ', ENDERECO=:ENDERECO'+
             ', LOGNUMERO=:LOGNUMERO'+
             ', LOGCOMPL=:LOGCOMPL'+
             ', BAIRRO=:BAIRRO'+
             ', CIDADE=:CIDADE'+
             ', ESTADO=:ESTADO'+
             ', CODIGOPOSTAL=:CODIGOPOSTAL'+
             ', OBSERVACAO=:OBSERVACAO'+
             ', DESATIVADO=:DESATIVADO'+
             ', CODNIVELCOMISSAO=:CODNIVELCOMISSAO'+
             ', NUMEROCPF=:NUMEROCPF'+
             ', DATAALTERACAO=current_timestamp'+
             ', EMAIL=:EMAIL'+
             ', CODVENFORCONFIG=:CODVENFORCONFIG'+

             ' WHERE CODVENDEDOR='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
    End; // If sDML='A' Then

    // Executa Altera/Inclusao ----------------------------------
    IBQ_Loja.Close;
    IBQ_Loja.SQL.Clear;
    IBQ_Loja.SQL.Add(MySql);

    If sDML='I' Then
     IBQ_Loja.Params.ParamByName('CODVENDEDOR').AsString:=
                             DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString;

    IBQ_Loja.Params.ParamByName('NOMEVENDEDOR').AsString:=
                       Copy(DMSalao.CDS_ProfissionaisDES_APELIDO.AsString,1,30);
    IBQ_Loja.Params.ParamByName('TIPOCOMISSAO').AsString:=
                             DMSalao.CDS_ProfissionaisTIP_SID_COMISSAO.AsString;
    IBQ_Loja.Params.ParamByName('TABELAPRO').AsString:=
                           DMSalao.CDS_ProfissionaisIND_SID_TABELAPROC.AsString;
    IBQ_Loja.Params.ParamByName('VALORQUOTA').AsString:=
                                DMSalao.CDS_ProfissionaisVLR_SID_QUOTA.AsString;

    // Telefone e E-Mail ===================================================
    If not ((DMSalao.CDS_ProfissionaisBLOB_LOCALIZACOES as TBlobField).IsNull) Then
    Begin
      mMemo:=TMemo.Create(Self);
      mMemo.Visible:=False;
      mMemo.Parent:=FrmSalao;
      mMemo.Width:=500;
      mMemo.Lines.Clear;

      mMemo.Text:=DMSalao.CDS_ProfissionaisBLOB_LOCALIZACOES.AsString;

      // Telefone -----------------------------------------------
      For i:=0 to mMemo.Lines.Count-1 do
      Begin
        If Separa_String(mMemo.Lines[i], 1)='1' Then
        Begin
          IBQ_Loja.Params.ParamByName('TELEFONE').AsString:=
                         Copy(Trim(Separa_String(mMemo.Lines[i], 3))+' '+
                         Trim(Separa_String(mMemo.Lines[i], 4)),1,15);
          Break;
        End; // If Separa_String(mMemo.Lines[i], 1)='1' Then
      End; // For i:=0 to mMemo.Lines.Count-1 do

      // E-Mail' ------------------------------------------------
      For i:=0 to mMemo.Lines.Count-1 do
      Begin
        If Separa_String(mMemo.Lines[i], 1)='2' Then
        Begin
          IBQ_Loja.Params.ParamByName('EMAIL').AsString:=Separa_String(mMemo.Lines[i], 3);
          Break;
        End; // If Separa_String(mMemo.Lines[i], 1)='1' Then
      End; // For i:=0 to mMemo.Lines.Count-1 do

      mMemo.Free;
      mMemo:=Nil;
    End; // If not ((DMSalao.CDS_ProfissionaisBLOB_LOCALIZACOES as TBlobField).IsNull) Then

    IBQ_Loja.Params.ParamByName('ENDERECO').AsString:=
                      Copy(DMSalao.CDS_ProfissionaisDES_ENDERECO.AsString,1,45);
    IBQ_Loja.Params.ParamByName('LOGNUMERO').AsString:=
                      Copy(DMSalao.CDS_ProfissionaisNUM_ENDERECO.AsString,1,10);
    IBQ_Loja.Params.ParamByName('LOGCOMPL').AsString:=
                      Copy(DMSalao.CDS_ProfissionaisCPL_ENDERECO.AsString,1,30);
    IBQ_Loja.Params.ParamByName('BAIRRO').AsString:=
                        Copy(DMSalao.CDS_ProfissionaisDES_BAIRRO.AsString,1,25);
    IBQ_Loja.Params.ParamByName('CIDADE').AsString:=
                     Copy(DMSalao.CDS_ProfissionaisDES_MUNICIPIO.AsString,1,25);
    IBQ_Loja.Params.ParamByName('ESTADO').AsString:=
                                       DMSalao.CDS_ProfissionaisDES_UF.AsString;
    IBQ_Loja.Params.ParamByName('CODIGOPOSTAL').AsString:=
                      Copy(Trim(DMSalao.CDS_ProfissionaisNUM_CEP.AsString),1,8);
    IBQ_Loja.Params.ParamByName('OBSERVACAO').AsBlob:=
                                     DMSalao.CDS_ProfissionaisBLOB_OBS.AsString;

    If DMSalao.CDS_ProfissionaisIND_ATIVO.AsString='SIM' Then
     IBQ_Loja.Params.ParamByName('DESATIVADO').AsString:='N'
    Else
     IBQ_Loja.Params.ParamByName('DESATIVADO').AsString:='S';

    IBQ_Loja.Params.ParamByName('CODNIVELCOMISSAO').AsString:=
                          DMSalao.CDS_ProfissionaisIND_SID_NIVELTABELA.AsString;
    IBQ_Loja.Params.ParamByName('NUMEROCPF').AsString:=
                  Tira_Mascara(Trim(DMSalao.CDS_ProfissionaisNUM_CPF.AsString));
    IBQ_Loja.Params.ParamByName('CODVENFORCONFIG').AsString:='0';
    IBQ_Loja.ExecSQL;

    // Exclui VENDEDORSUPER -----------------------------------------
    sgMensagem:='Exclusão de Supervisor-VENDEDORSUPER';

    MySql:=' Delete FROM VENDEDORSUPER vs'+
           ' WHERE vs.supervisor ='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+
           ' OR    vs.codvendedor='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
    IBQ_Loja.Close;
    IBQ_Loja.SQL.Clear;
    IBQ_Loja.SQL.Add(MySql);
    IBQ_Loja.ExecSQL;

    // Altera VENDEDORSUPER -----------------------------------------
    MySql:=' SELECT ps.cod_supervisor, ps.cod_profissional'+
           ' FROM sal_prof_supervisor ps'+
           ' WHERE ps.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
           ' AND (ps.cod_supervisor  ='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+
           ' OR   ps.cod_profissional='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+')';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString)<>'' Then
    Begin

      DMBelShop.CDS_BuscaRapida.First;
      While Not DMBelShop.CDS_BuscaRapida.Eof do
      Begin
        sgMensagem:='Exclusão de Vendedor-VENDEDORSUPER';

        MySql:=' Delete FROM VENDEDORSUPER vs'+
               ' WHERE vs.codvendedor='+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString);
        IBQ_Loja.Close;
        IBQ_Loja.SQL.Clear;
        IBQ_Loja.SQL.Add(MySql);
        IBQ_Loja.ExecSQL;

        DMBelShop.CDS_BuscaRapida.Next;
      End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

      DMBelShop.CDS_BuscaRapida.First;
      While Not DMBelShop.CDS_BuscaRapida.Eof do
      Begin
        sgMensagem:='Inclusão de Supervisor-VENDEDORSUPER';

        MySql:=' Insert into VENDEDORSUPER (SUPERVISOR, CODVENDEDOR)'+
               ' Values ('+
               QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Supervisor').AsString)+', '+
               QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString)+')';
        IBQ_Loja.Close;
        IBQ_Loja.SQL.Clear;
        IBQ_Loja.SQL.Add(MySql);
        IBQ_Loja.ExecSQL;

        DMBelShop.CDS_BuscaRapida.Next;
      End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
    End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString)<>'' Then
    DMBelShop.CDS_BuscaRapida.Close;

    // Commita Transação ------------------------------------------
    b:=False;
    While Not b do
    Begin
      b:=IBTransacao('C', 'IBT_'+sgCodEmp);
      bgIncluidoSIDICOM:=True;
      Result:=True;
    End; // While Not b do

    msg('Exportação do Profissional para o SIDICOM'+cr+cr+'Efetuada com SUCESSO !!','A');
  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      // Rollback Transacao -----------------------------------------
      b:=False;
      While Not b do
      Begin
        b:=IBTransacao('R', 'IBT_'+sgCodEmp);
      End; // While Not b do

      Screen.Cursor:=crDefault;
    End; // on e : Exception do
  End;

  DateSeparator:='/';
  DecimalSeparator:=',';

  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;
  Refresh;

  // Fecha Conexão =============================================================
  ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

End;

// PROFISSIONAL - Consiste Profissional >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSalao.ConsisteProfissional: Boolean;
Var
  i: Integer;
  MySql: String;
  bConsistir: Boolean;
Begin
  Result:=False;

  //============================================================================
  // DADOS PESSOAIS ============================================================
  //============================================================================
  PC_CadProfissional.TabIndex:=0;
  Refresh;

  // Nome -----------------------------------------------------------
  if Trim(DMSalao.CDS_ProfissionaisDES_PROFISSIONAL.AsString)='' Then
  Begin
    msg('Favor Informar o'+cr+cr+'Nome do Profissional !!','A');
    Dbe_CadProfNome.SetFocus;
    Exit;
  End;

  // Apelido --------------------------------------------------------
  if Trim(DMSalao.CDS_ProfissionaisDES_APELIDO.AsString)='' Then
  Begin
    msg('Favor Informar o'+cr+cr+'Apelido do Profissional !!','A');
    Dbe_CadProfApelido.SetFocus;
    Exit;
  End;

  // Tipo de Pessoa -------------------------------------------------
  if Cbx_CadProfTpPessoa.ItemIndex<0 Then
  Begin
    msg('Favor Informar o Tipo de Pessoa !!','A');
    Cbx_CadProfTpPessoa.SetFocus;
    Exit;
  End;

  // Data Nascimento ------------------------------------------------
  bConsistir:=False;
  if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'EdtDta_CadProfDtaNasc' ,[]) Then
   bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
  If bConsistir Then
  Begin
    Try
      StrToDate(EdtDta_CadProfDtaNasc.Text);
    Except
      msg('Data de Nascimento Inválida !!','A');
      EdtDta_CadProfDtaNasc.SetFocus;
      Exit;
    End;
  End; // If bConsistir Then

  // CPF ------------------------------------------------------------
  // 29/04/2015 - Retirado a Possibilidade de consistencia
  bConsistir:=True;
  If bConsistir Then
  Begin
    if Not tbIsCPForCNPJ(Me_CadProfCPF.Text) Then
    Begin
      msg('CPF Inválido !!','A');
      Me_CadProfCPF.SetFocus;
      Exit;
    End;

    If Not bgCFPLiberado Then
    Begin
      MySql:=' SELECT p.des_profissional, p.ind_ativo, p.ind_liberado'+
             ' FROM sal_profissionais p'+
             ' WHERE p.Cod_Profissional<>'+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+
             ' AND   p.tip_pessoa='+QuotedStr('P')+
             ' AND   p.num_cpf='+QuotedStr(Me_CadProfCPF.Text);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      sgMensagem:='';
      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('des_profissional').AsString)<>'' Then
       sgMensagem:='Existe Profissional com este CPF Cadastrado'+cr+
                   'Nome: '+DMBelShop.CDS_BuscaRapida.FieldByName('des_profissional').AsString+cr+
                   'Ativo: '+DMBelShop.CDS_BuscaRapida.FieldByName('ind_ativo').AsString+cr+
                   'Contrato Liberado: '+DMBelShop.CDS_BuscaRapida.FieldByName('ind_Liberado').AsString;

      DMBelShop.CDS_BuscaRapida.Close;
      If sgMensagem<>'' Then
      Begin
        If msg(sgMensagem+cr+'Continuar ??','C')=2 Then
        Begin
          Me_CadProfCPF.SetFocus;
          Exit;
        End;
        bgCFPLiberado:=True;
      End;
    End; // If Not bgCFPLiberado Then
  End; // If bConsistir Then

  // Endereço -------------------------------------------------------
  bConsistir:=False;
  if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbe_CadProfEndereco' ,[]) Then
   bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
  If bConsistir Then
  Begin
    if (Trim(Me_CadProfCEP.Text)='     -   ') Or
       (Trim(DMSalao.CDS_ProfissionaisDES_ENDERECO.AsString)='')  Or
       (Trim(DMSalao.CDS_ProfissionaisNUM_ENDERECO.AsString)='')  Or
       (Trim(DMSalao.CDS_ProfissionaisDES_MUNICIPIO.AsString)='') Or
       (Trim(DMSalao.CDS_ProfissionaisDES_ESTADO.AsString)='')    Then
    Begin
      msg('Endereço Inválido !!','A');
      Me_CadProfCEP.SetFocus;
      Exit;
    End;
  End; // If bConsistir Then

  //============================================================================
  // DOCUMENTAÇÃO  =============================================================
  //============================================================================
  If Ts_CadProfDoctos.TabVisible Then
  Begin
    PC_CadProfissional.TabIndex:=1;
    Refresh;

    // Nº Inscrição dos Salões de Beleza ----------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbe_CadProfNumSindicato' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      if Trim(DMSalao.CDS_ProfissionaisNUM_SINDICATO.AsString)='' Then
      Begin
        msg('Favor Informar o'+cr+'Nº Inscrição dos Salões de Beleza !!','A');
        Dbe_CadProfNumSindicato.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then

    // Valor Taxa do Sindicato --------------------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbe_CadProfVlrSindicato' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      If (Ckb_CadProfTaxaSindicato.Checked) and (DMSalao.CDS_ProfissionaisVLR_TAXA_SINDICATO.AsCurrency=0) Then
      Begin
        msg('Favor Informar o'+cr+'Valor Taxa do Sindicato !!','A');
        Dbe_CadProfVlrSindicato.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then

    // Comprovante da Taxa do Sindicato -----------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbe_CadProfCompSindicato' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      If (Ckb_CadProfTaxaSindicato.Checked) Then
      Begin
        msg('Favor Informar o'+cr+'Comprovante da Taxa do Sindicato !!','A');
        Dbe_CadProfCompSindicato.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then

    // Valor da Taxa de Não Sócio -----------------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbe_CadProfVlrTaxaNaoSocios' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      If (Ckb_CadProfTaxaNaoSocio.Checked) and (DMSalao.CDS_ProfissionaisVLR_TAXA_NAOSOCIO.AsCurrency=0) Then
      Begin
        msg('Favor Informar o'+cr+'Valor da Taxa de Não Sócio !!','A');
        Dbe_CadProfVlrTaxaNaoSocios.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then

    // Comprovante da Taxa de Não Sócio -----------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbe_CadProfCompNaoSocios' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      If (Ckb_CadProfTaxaNaoSocio.Checked) Then
      Begin
        msg('Favor Informar o'+cr+'Comprovante da Taxa de Não Sócio !!','A');
        Dbe_CadProfCompNaoSocios.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then

    // TecBiz -------------------------------------------------------
    // 29/04/2015 - Retirado a Possibilidade de consistencia
    bConsistir:=True;
    If bConsistir Then
    Begin
      i:=0;
      If Trim(DMSalao.CDS_ProfissionaisNUM_TECBIZ.AsString)<>''           Then Inc(i);
      If Trim(DMSalao.CDS_ProfissionaisNUM_MATRICULA_TECBIZ.AsString)<>'' Then Inc(i);
      If (i>0) and (i<2) Then
      Begin
        msg('Favor Completar as Informações TecBiz !!','A');
        Dbe_CadProfNumTecBiz.SetFocus;
        Exit;
      End;

      // Consiste Codigo TecBiz ==================================================
      If Trim(DMSalao.CDS_ProfissionaisNUM_MATRICULA_TECBIZ.AsString)<>'' Then
      Begin
        MySql:=' SELECT p.cod_loja, p.cod_profissional, p.des_profissional,'+
               ' CASE'+
               '   WHEN p.tip_pessoa=''P'' THEN ''Profissinal de Salão'''+
               '   ELSE ''Vendedor'''+
               ' END Tip_Pessoa'+

               ' FROM SAL_PROFISSIONAIS p, TAB_AUXILIAR t'+

               ' WHERE p.cod_loja=t.des_aux'+
               ' AND   p.cod_profissional=t.des_aux1'+
               ' AND   t.tip_aux=10'+
               ' AND   t.cod_aux='+DMSalao.CDS_ProfissionaisNUM_MATRICULA_TECBIZ.AsString+
               ' AND   NOT (p.cod_profissional='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+
               '            AND p.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+')';
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        sgMensagem:='';
        If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)<>'' Then
         sgMensagem:='Existe Profissional com este Códgio da TecBiz Cadastrado !!'+cr+
                     'Cod_Loja: '+DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString+cr+
                     'Nome: '+DMBelShop.CDS_BuscaRapida.FieldByName('des_profissional').AsString+cr+
                     'Tipo de Pessoa: '+DMBelShop.CDS_BuscaRapida.FieldByName('Tip_Pessoa').AsString;

        DMBelShop.CDS_BuscaRapida.Close;
        If sgMensagem<>'' Then
        Begin
          msg(sgMensagem,'A');
          Dbe_CadProfMatriculaTecBiz.SetFocus;
          Exit;
        End;
      End; // If Trim(DMSalao.CDS_ProfissionaisNUM_MATRICULA_TECBIZ.AsString)<>'' Then
    End; // If bConsistir Then

    // INSS ---------------------------------------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbe_CadProfNumINSS' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      i:=0;
      If Trim(DMSalao.CDS_ProfissionaisNUM_INSS.AsString)<>'' Then Inc(i);
      If DMSalao.CDS_ProfissionaisPER_INSS.AsCurrency<>0      Then Inc(i);
      If (i>0) and (i<2) Then
      Begin
        msg('Favor Completar as Informações INSS !!','A');
        Dbe_CadProfNumINSS.SetFocus;
        Exit;
      End;

      If (Ckb_CadProfINSSCobrar.Checked) And
         ((Trim(DMSalao.CDS_ProfissionaisNUM_INSS.AsString)='') Or (DMSalao.CDS_ProfissionaisPER_INSS.AsCurrency=0) Or
         (DMSalao.CDS_ProfissionaisPER_INSS.AsString='') or (Cbx_CadProfSitPrevidencia.ItemIndex<>0)) Then
      Begin
        Ckb_CadProfINSSCobrar.Checked:=False;
      End;

      If (Trim(DMSalao.CDS_ProfissionaisNUM_INSS.AsString)<>'') And (DMSalao.CDS_ProfissionaisPER_INSS.AsCurrency<>0) Then
      Begin
        If Ckb_CadProfINSSCobrar.Checked Then
         sgMensagem:='Deseja Realmente Cobrar a Contribuiçao'+cr+cr+'de INSS do Profissional ??'
        Else
         sgMensagem:='Deseja Realmente NÃO Cobrar a Contribuiçao'+cr+cr+'de INSS do Profissional ??';

        If msg(sgMensagem,'C')=2 Then
        Begin
          Ckb_CadProfINSSCobrar.SetFocus;
          Exit;
        End;
      End; // If (Trim(DMSalao.CDS_ProfissionaisNUM_INSS.AsString)<>'')) And (DMSalao.CDS_ProfissionaisPER_INSS.AsCurrency<>'0') Then
    End; // If bConsistir Then

    // Valor do Plano de Saúde --------------------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbe_CadProfCodPlanoSaude' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      If (DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsInteger<>0) And
         (DMSalao.CDS_ProfissionaisVLR_PLANO_SAUDE.AsCurrency=0) Then
      Begin
        msg('Favor Informar o'+cr+'Valor do Plano de Saúde !!','A');
        Dbe_CadProfVlrPlanoSaude.SetFocus;
        Exit;
      End;

      // Comprovante do Plano de Saúde --------------------------------
      If (DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsInteger<>0) Then
      Begin
        msg('Favor Informar o'+cr+'Comprovante do Plano de Saúde !!','A');
        Dbe_CadProfCompPlanoSaude.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then

    // Nº Alvará Localização ----------------------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbe_CadProfAlvaraLoc' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      If Trim(DMSalao.CDS_ProfissionaisNUM_ALVARA_LOCAL.AsString)='' Then
      Begin
        msg('Favor Informar o'+cr+'Nº Alvará Localização !!','A');
        Dbe_CadProfAlvaraLoc.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then

    // Banco --------------------------------------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbe_CadProfNumBanco' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      i:=0;
      If ((Trim(DMSalao.CDS_ProfissionaisNUM_BANCO.AsString)<>'') Or (DMSalao.CDS_ProfissionaisNUM_BANCO.AsInteger<>0)) Then Inc(i);
      If Trim(DMSalao.CDS_ProfissionaisDES_BANCO.AsString) <>''   Then Inc(i);
      If Trim(DMSalao.CDS_ProfissionaisNUM_AGENCIA.AsString)<>''  Then Inc(i);
      If Trim(DMSalao.CDS_ProfissionaisDES_AGENCIA.AsString)<>''  Then Inc(i);
      If Trim(DMSalao.CDS_ProfissionaisNUM_CONTA.AsString)  <>''    Then Inc(i);

      If (i>0) and (i<5) Then
      Begin
        msg('Favor Completar as Informações do Banco !!','A');
        Dbe_CadProfNumBanco.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then
  End; // If Ts_CadProfDoctos.TabVisible Then

  //============================================================================
  // CONTRATOS =================================================================
  //============================================================================
  If Ts_CadProfContrato.TabVisible Then
  Begin
    PC_CadProfissional.TabIndex:=2;
    Refresh;

    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'EdtDt_CadProfIniContrato' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      // Data de Incio do Contrato ------------------------------------
      Try
        StrToDate(EdtDt_CadProfIniContrato.Text);
      Except
        msg('Data de Início de Contrato Inválida !!','A');
        EdtDt_CadProfIniContrato.SetFocus;
        Exit;
      End;

      // Data de Fim do Contrato --------------------------------------
      Try
        StrToDate(EdtDt_CadProfFimContrato.Text);
      Except
        msg('Data de Fim de Contrato Inválida !!','A');
        EdtDt_CadProfFimContrato.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then

    // % de Comissão Geral Profissional -----------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbe_CadProfPerComissao' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      If (DMSalao.CDS_ProfissionaisPER_COMISSAO.AsCurrency=0) And (Dbe_CadProfPerComissao.Enabled) Then
      Begin
        msg('Favor Informar o'+cr+'% de Comissão Geral Profissional !!','A');
        Dbe_CadProfPerComissao.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then

    // % Auferido pelo Locatário ------------------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbe_CadProfPerLocador' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      If DMSalao.CDS_ProfissionaisPER_LOCADOR.AsCurrency=0 Then
      Begin
        msg('Favor Informar o'+cr+'% Auferido pelo Locador !!','A');
        Dbe_CadProfPerLocador.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then

    // Móveis do Contrato -------------------------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbm_CadProfMoveis' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      If (DMSalao.CDS_ProfissionaisBLOB_CONTRATO_MOVEIS as TBlobField).IsNull Then
      Begin
        msg('Favor Informar o'+cr+'Móveis do Contrato !!','A');
        Dbm_CadProfMoveis.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then

    // Habilidades --------------------------------------------------
    bConsistir:=False;
    if DMBelShop.CDS_Consistencias.Locate('DES_COMPONENTE', 'Dbg_CadProfHab' ,[]) Then
     bConsistir:=(DMBelShop.CDS_ConsistenciasIND_LIBERADO.AsString='SIM');
    If bConsistir Then
    Begin
      If DMSalao.CDS_HabilidadesProf.IsEmpty Then
      Begin
        msg('Favor Informar a(s)'+cr+'Habildade(s) do Profissional !!','A');
        Dbg_CadProfHab.SetFocus;
        Exit;
      End;
    End; // If bConsistir Then
  End; // If Ts_CadProfContrato.TabVisible Then

  //============================================================================
  // DADOS SIDICOM =============================================================
  //============================================================================
  PC_CadProfissional.TabIndex:=3;

  DMBelShop.CDS_Consistencias.Close;
  DMBelShop.SDS_Consistencias.Params.ParamByName('Codigo').AsInteger:=1;
  DMBelShop.CDS_Consistencias.Open;
  If Not ConsisteDadosSidicom(False) Then
  Begin
    DMBelShop.CDS_Consistencias.Close;
    Exit;
  End;
  DMBelShop.CDS_Consistencias.Close;

  Result:=True;                                                                
End;

// PROFISSIONAL - Apresenta Dados do IBGE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSalao.ApresentaIBGE(iPosIBGE: Integer);
Var
  MySql: String;
Begin
  Me_CadProfCEPLocIBGE.Text:='     -   ';

  Me_CadProfCEP.Text:=ACBrCEP.Enderecos[iPosIBGE].CEP;
  DMSalao.CDS_ProfissionaisNUM_CEP.AsString:=ACBrCEP.Enderecos[iPosIBGE].CEP;

  DMSalao.CDS_ProfissionaisDES_ENDERECO.AsString:=
               AnsiUpperCase(Trim(ACBrCEP.Enderecos[iPosIBGE].Tipo_Logradouro))+
                ' '+AnsiUpperCase(Trim(ACBrCEP.Enderecos[iPosIBGE].Logradouro));

  // edtComplemento.Text:=ACBrCEP.Enderecos[iPosIBGE].Complemento;

  DMSalao.CDS_ProfissionaisDES_BAIRRO.AsString:=
                        AnsiUpperCase(Trim(ACBrCEP.Enderecos[iPosIBGE].Bairro));

  DMSalao.CDS_ProfissionaisDES_MUNICIPIO.AsString:=
                     AnsiUpperCase(Trim(ACBrCEP.Enderecos[iPosIBGE].Municipio));
  DMSalao.CDS_ProfissionaisCOD_MUNICIPIO_IBGE.AsString:=
                                     ACBrCEP.Enderecos[iPosIBGE].IBGE_Municipio;

  DMSalao.CDS_ProfissionaisCOD_ESTADO_IBGE.AsString:=
                                            ACBrCEP.Enderecos[iPosIBGE].IBGE_UF;
  DMSalao.CDS_ProfissionaisDES_UF.AsString:=ACBrCEP.Enderecos[iPosIBGE].UF;

  // Busca Descrição do Estado =================================================
  MySql:=' SELECT e.des_estado'+
         ' FROM ESTADOS_IBGE e'+
         ' WHERE e.cod_estado='+ACBrCEP.Enderecos[iPosIBGE].IBGE_UF;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  DMSalao.CDS_ProfissionaisDES_ESTADO.AsString:=
                   DMBelShop.CDS_BuscaRapida.FieldByName('des_estado').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // Nao Libera Endereço pelo IBGE =============================================
  LiberaIBGE(False);
End; // PROFISSIONAL - Apresenta Dados do IBGE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// PROFISSIONAL - Libera Acesso a Endereco se IBGE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSalao.LiberaIBGE(bLibera: Boolean);
Begin
  Me_CadProfCEP.ReadOnly:=Not bLibera;
  Me_CadProfCEP.TabStop:=bLibera;

  Dbe_CadProfEndereco.ReadOnly:=Not bLibera;
  Dbe_CadProfEndereco.TabStop:=bLibera;

  Dbe_CadProfBairro.ReadOnly:=Not bLibera;
  Dbe_CadProfBairro.TabStop:=bLibera;

  Bt_CadProfBuscaMunicipio.Enabled:=bLibera;
  Bt_CadProfBuscaUF.Enabled:=bLibera;

  Me_CadProfCEP.Color:=clWindow;
  Dbe_CadProfEndereco.Color:=clWindow;
  Dbe_CadProfBairro.Color:=clWindow;
  If Not bLibera Then
  Begin
    Me_CadProfCEP.Color:=$00DFDFFF;
    Dbe_CadProfEndereco.Color:=$00DFDFFF;
    Dbe_CadProfBairro.Color:=$00DFDFFF;
  End; //If Not bLibera Then

End; // PROFISSIONAL - Libera Acesso a Endereco se IBGE >>>>>>>>>>>>>>>>>>>>>>>>

// DIVERSOS - Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmSalao.CreateToolTips(hWnd: Cardinal);
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
Procedure TFrmSalao.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // DIVERSOS - Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>

// PROFISSIONAL - Dados do Profissional >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSalao.DadosProfissional;
Var
  s, MySql: String;
  Foto: TStream;  // um stream para o conteúdo do campo BLOB
  Imagem: TJPEGImage;  // a imagem JPG
  mMemo: TMemo;
  i: Integer;
Begin

  //============================================================================
  // Posiciona TabSheets =======================================================
  //============================================================================
  PC_CadProfissional.TabIndex:=0;
  PC_CadProfissionalChange(Self);

  PC_CadProfDiversos.TabIndex:=0;
  PC_CadProfDiversosChange(Self);

  PC_CadProfSidicom.TabIndex:=0;
  PC_CadProfSidicomChange(Self);

  Cbx_CadProfServAtivo.ItemIndex:=0;

  //============================================================================
  // Dados Pessoais ============================================================
  //============================================================================
  bgIncluiSIDICOM:=(DMSalao.CDS_ProfissionaisIND_CAD_SIDICOM.AsString='SIM');

  s:=DMSalao.CDS_ProfissionaisTIP_PESSOA.AsString;
  Cbx_CadProfTpPessoa.ItemIndex:=-1;
  If s='V' Then Cbx_CadProfTpPessoa.ItemIndex:=Cbx_CadProfTpPessoa.Items.IndexOf('Vendedor');
  If s='P' Then Cbx_CadProfTpPessoa.ItemIndex:=Cbx_CadProfTpPessoa.Items.IndexOf('Profissional');

  Me_CadProfCEPLocIBGE.Text:='     -   ';

  EdtCadProfDesLoja.Text:=EdtDesLoja.Text;

  EdtDta_CadProfDtaNasc.Date:=DMSalao.CDS_ProfissionaisDTA_NASCIMENTO.AsDateTime;
  Lab_Anos.Caption:='0 Anos';
  If EdtDta_CadProfDtaNasc.Text<>'  /  /    ' Then
   Lab_Anos.Caption:=IntToStr(ObterIdade(
                             DMSalao.CDS_ProfissionaisDTA_NASCIMENTO.AsDateTime,
                     DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)))+' Anos';

  Me_CadProfCPF.Text:=DMSalao.CDS_ProfissionaisNUM_CPF.AsString;
  Me_CadProfCEP.Text:=DMSalao.CDS_ProfissionaisNUM_CEP.AsString;

  Ckb_CadProfAtivo.Checked:=(DMSalao.CDS_ProfissionaisIND_ATIVO.AsString='SIM');
  Ckb_CadProfAtivoClick(Self);

  Ckb_CadProfLiberdo.Checked:=(DMSalao.CDS_ProfissionaisIND_LIBERADO.AsString='SIM');
  Ckb_CadProfLiberdoClick(Self);

  // Apresenta Foto ============================================================
  IM_CadProfFoto.Picture := Nil;
  If Trim(DMSalao.CDS_ProfissionaisBLOB_FOTO.AsString)<>'' Then
  Begin
    // Obter um Stream Contendo o Conteúdo do Ccampo BLOB
    Foto := DMSalao.CDS_Profissionais.CreateBlobStream(DMSalao.CDS_ProfissionaisBLOB_FOTO, bmRead);
    //Foto := SQLDataSet1.CreateBlobStream(SQLDataSet1.FieldByName('BLOB_FOTO'), bmRead);

    // Criar uma Instância de TJPEGImage
    Imagem := TJPEGImage.Create;

    // Carregar a Imagem a Partir do Stream TStream
    Imagem.LoadFromStream(Foto);

    // Exibir a Imagem no Image
    IM_CadProfFoto.Picture.Assign(Imagem);

    Foto.Free;
    Foto:=nil;

    Imagem.Free;
    Imagem:=nil;
  End; // If Trim(DMSalao.CDS_ProfissionaisBLOB_FOTO.AsString)<>'' Then

  // Localizações Telefones e E-Mail's =========================================
  If DMSalao.CDS_V_ProfFones.Active Then
   DMSalao.CDS_V_ProfFones.Close;

  DMSalao.CDS_V_ProfFones.CreateDataSet;
  DMSalao.CDS_V_ProfFones.Open;

  If DMSalao.CDS_V_ProfEmail.Active Then
   DMSalao.CDS_V_ProfEmail.Close;

  DMSalao.CDS_V_ProfEmail.CreateDataSet;
  DMSalao.CDS_V_ProfEmail.Open;

  If not ((DMSalao.CDS_ProfissionaisBLOB_LOCALIZACOES as TBlobField).IsNull) Then
  Begin
    mMemo:=TMemo.Create(Self);
    mMemo.Visible:=False;
    mMemo.Parent:=FrmSalao;
    mMemo.Width:=500;
    mMemo.Lines.Clear;

    mMemo.Text:=DMSalao.CDS_ProfissionaisBLOB_LOCALIZACOES.AsString;

    For i:=0 to mMemo.Lines.Count-1 do
    Begin
      // Localizações Telefones -------------------------------------
      If Separa_String(mMemo.Lines[i], 1)='1' Then
      Begin
        DMSalao.CDS_V_ProfFones.Append;
        DMSalao.CDS_V_ProfFonesDes_Localizacao.AsString:=Separa_String(mMemo.Lines[i], 2);
        DMSalao.CDS_V_ProfFonesDes_DDD.AsString        :=Separa_String(mMemo.Lines[i], 3);
        DMSalao.CDS_V_ProfFonesDes_Fone.AsString       :=Separa_String(mMemo.Lines[i], 4);
        DMSalao.CDS_V_ProfFones.Post;
      End; // If Separa_String(mMemo.Lines[i], 1)='1' Then

      // Localizações E-Mail's --------------------------------------
      If Separa_String(mMemo.Lines[i], 1)='2' Then
      Begin
        DMSalao.CDS_V_ProfEmail.Append;
        DMSalao.CDS_V_ProfEmailDes_Localizacao.AsString:=Separa_String(mMemo.Lines[i], 2);
        DMSalao.CDS_V_ProfEmailDes_Email.AsString      :=Separa_String(mMemo.Lines[i], 3);
        DMSalao.CDS_V_ProfEmail.Post;
      End; // If Separa_String(mMemo.Lines[i], 1)='1' Then
    End; // For i:=0 to mMemo.Lines.Count-1 do
    DMSalao.CDS_V_ProfFones.First;
    DMSalao.CDS_V_ProfEmail.First;

    FreeAndNil(mMemo);
  End; // If not ((DMSalao.CDS_ProfissionaisBLOB_LOCALIZACOES as TBlobField).IsNull) Then

  // Libera ou NÃO Se Endereço pelo IBGE =======================================
  If DMSalao.CDS_ProfissionaisCOD_MUNICIPIO_IBGE.AsInteger<>0 Then
   LiberaIBGE(False)
  Else
   LiberaIBGE(True);

  //============================================================================
  // Documentações =============================================================
  //============================================================================
  Ckb_CadProfTaxaSindicato.Checked:=(DMSalao.CDS_ProfissionaisIND_TAXA_SINDICATO.AsString='SIM');
  Ckb_CadProfTaxaSindicatoClick(Self);

  Ckb_CadProfTaxaNaoSocio.Checked:=(DMSalao.CDS_ProfissionaisIND_TAXA_NAOSOCIO.AsString='SIM');
  Ckb_CadProfTaxaNaoSocioClick(Self);

  Ckb_CadProfINSSCobrar.Checked:=(DMSalao.CDS_ProfissionaisIND_COBRA_INSS.AsString='SIM');
  Ckb_CadProfINSSCobrarClick(Self);

  Cbx_CadProfSitPrevidencia.ItemIndex:=DMSalao.CDS_ProfissionaisSIT_PREVIDENCIARIA.AsInteger;

  // Plano de Saude/Dependentes ================================================

  // Dependentes
  If DMSalao.CDS_V_Dependentes.Active Then
   DMSalao.CDS_V_Dependentes.Close;

  DMSalao.CDS_V_Dependentes.CreateDataSet;
  DMSalao.CDS_V_Dependentes.Open;

  // Plano de Saude ============================================================
  EdtCadProfDesPlanoSaude.Clear;
  MySql:=' SELECT p.des_aux'+
         ' FROM tab_auxiliar p'+
         ' WHERE p.tip_aux=4'+
         ' AND   p.cod_aux='+DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsString;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  EdtCadProfDesPlanoSaude.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('des_aux').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // Dependentes de Plano de Saúde =============================================
  MySql:=' SELECT dp.Num_Seq, dp.des_dependente, dp.des_parentesco, dp.dta_nascimento, dp.vlr_plano_saude'+
         ' FROM ps_dependentes_ps dp'+
         ' WHERE dp.tp_pessoa=1'+
         ' AND dp.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
         ' AND dp.cod_pessoa='+DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    DMSalao.CDS_V_Dependentes.Append;
    DMSalao.CDS_V_DependentesDes_Dependente.AsString:=
               DMBelShop.CDS_BuscaRapida.FieldByName('des_dependente').AsString;
    DMSalao.CDS_V_DependentesDes_Parentesco.AsString:=
               DMBelShop.CDS_BuscaRapida.FieldByName('des_parentesco').AsString;
    DMSalao.CDS_V_DependentesDta_Nascimento.AsString:=
               DMBelShop.CDS_BuscaRapida.FieldByName('dta_nascimento').AsString;
    DMSalao.CDS_V_DependentesVlr_PlanoSaude.AsString:=
              DMBelShop.CDS_BuscaRapida.FieldByName('vlr_plano_saude').AsString;
    DMSalao.CDS_V_DependentesNum_Seq.AsInteger:=
                     DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
    DMSalao.CDS_V_DependentesInd_Exc.AsString:='';
    DMSalao.CDS_V_Dependentes.Post;

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.Close;
  DMSalao.CDS_V_Dependentes.First;

  //============================================================================
  // Contrato ==================================================================
  //============================================================================
  EdtDt_CadProfIniContrato.Date :=DMSalao.CDS_ProfissionaisDTA_INI_CONTRATO.AsDateTime;
  EdtDt_CadProfFimContrato.Date :=DMSalao.CDS_ProfissionaisDTA_FIM_CONTRATO.AsDateTime;

  EdtDt_CadProfIniRenovacao.Date :=DMSalao.CDS_ProfissionaisDTA_INI_RENOVACAO.AsDateTime;
  EdtDt_CadProfFimRenovacao.Date :=DMSalao.CDS_ProfissionaisDTA_FIM_RENOVACAO.AsDateTime;

  EdtDt_CadProfDiaIniUltCalculo.Date:=DMSalao.CDS_ProfissionaisDTA_PERIODO_INI_CAL.AsDateTime;
  EdtDt_CadProfDiaFimUltCalculo.Date:=DMSalao.CDS_ProfissionaisDTA_PERIODO_FIM_CAL.AsDateTime;

  DMSalao.CDS_ServicosProf.Filtered:=False;
  DMSalao.CDS_ServicosProf.Filter:='';
  DMSalao.CDS_ServicosProf.Close;
  DMSalao.CDS_HabilidadesProf.Close;
  DMSalao.SDS_HabilidadesProf.Params.ParamByName('CodLoja').AsString:=
                                     DMSalao.CDS_ProfissionaisCOD_LOJA.AsString;
  DMSalao.SDS_HabilidadesProf.Params.ParamByName('CodProf').AsString:=
                             DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString;
  DMSalao.CDS_HabilidadesProf.Open;

  //============================================================================
  // Dados Sidicom =============================================================
  //============================================================================
  Rb_CadProfSidPercentuais.Checked:=(DMSalao.CDS_ProfissionaisTIP_SID_COMISSAO.AsString='P');
  Rb_CadProfSidListaPreco.Checked :=(DMSalao.CDS_ProfissionaisTIP_SID_COMISSAO.AsString='L');
  Rb_CadProfSidDescontos.Checked  :=(DMSalao.CDS_ProfissionaisTIP_SID_COMISSAO.AsString='D');

  Rb_CadProfSidTabela0.Checked    :=(DMSalao.CDS_ProfissionaisIND_SID_TABELAPROC.AsString='0');
  Rb_CadProfSidTabela1.Checked    :=(DMSalao.CDS_ProfissionaisIND_SID_TABELAPROC.AsString='1');
  Rb_CadProfSidTabela2.Checked    :=(DMSalao.CDS_ProfissionaisIND_SID_TABELAPROC.AsString='2');
  Rb_CadProfSidTabela3.Checked    :=(DMSalao.CDS_ProfissionaisIND_SID_TABELAPROC.AsString='3');
  Rb_CadProfSidTabela4.Checked    :=(DMSalao.CDS_ProfissionaisIND_SID_TABELAPROC.AsString='4');
  Rb_CadProfSidTabela5.Checked    :=(DMSalao.CDS_ProfissionaisIND_SID_TABELAPROC.AsString='5');
  Rb_CadProfSidTabela6.Checked    :=(DMSalao.CDS_ProfissionaisIND_SID_TABELAPROC.AsString='6');
  Rb_CadProfSidTabela7.Checked    :=(DMSalao.CDS_ProfissionaisIND_SID_TABELAPROC.AsString='7');
  Rb_CadProfSidTabela8.Checked    :=(DMSalao.CDS_ProfissionaisIND_SID_TABELAPROC.AsString='8');
  Rb_CadProfSidPercentuaisClick(Self);

  If DMSalao.CDS_ProfissionaisVLR_SID_QUOTA.AsString='' Then
    DMSalao.CDS_ProfissionaisVLR_SID_QUOTA.AsCurrency:=0.00;

  // Supervisor ================================================================
  DMSalao.CDS_SID_Supervisor.Close;
  DMSalao.SDS_SID_Supervisor.Params.ParamByName('CodLoja').AsString:=DMSalao.CDS_ProfissionaisCOD_LOJA.AsString;
  DMSalao.SDS_SID_Supervisor.Params.ParamByName('CodProf').AsString:=DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString;
  DMSalao.CDS_SID_Supervisor.Open;

  // Vendedores do Supervisor ==================================================
  DMSalao.CDS_SID_Vendedores.Close;
  DMSalao.SDS_SID_Vendedores.Params.ParamByName('CodLoja').AsString:=DMSalao.CDS_ProfissionaisCOD_LOJA.AsString;
  DMSalao.SDS_SID_Vendedores.Params.ParamByName('CodProf').AsString:=DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString;
  DMSalao.CDS_SID_Vendedores.Open;

  Ts_CadProfDoctos.TabVisible:=False;
  Ts_CadProfContrato.TabVisible:=False;
  If Cbx_CadProfTpPessoa.ItemIndex=0 Then
  Begin
    Ts_CadProfDoctos.TabVisible:=True;
    Ts_CadProfContrato.TabVisible:=True;
  End;

  DMSalao.CDS_ProfissionaisNUM_TECBIZ.EditMask:='9999-9999-9999-9999;0;_';

End; // PROFISSIONAL - Dados do Profissional >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// HABILIDADES - consistem Exclusão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSalao.ConsisteExcluao(sTipo: String): Boolean;
Var
  MySql: String;
  sProf: String;
Begin
  // Tipo: (H)abilidade (S)ervico
  Result:=False;
  sgMensagem:='';

  // Habilidade ================================================================
  If sTipo='H' Then
  Begin
    // Consiste a Metas ---------------------------------------------
    MySql:=' SELECT p.des_profissional'+
           ' FROM SAL_METAS m, SAL_PROFISSIONAIS p'+
           ' WHERE m.cod_profissional=p.cod_profissional'+
           ' AND   p.tip_pessoa='+QuotedStr('P')+
           ' AND   m.cod_habilidade='+DMSalao.CDS_HabilidadesCOD_HAB.AsString;
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sProf:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Profissional').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    If sProf<>'' Then
    Begin
      sgMensagem:='Impossível Excluir !!'+cr+'Existe(m) Meta(s) Lançada(s)'+cr+'para Profissional(is) !!';
      Exit;
    End;

    // Consiste a Habilidade de Profissionais -----------------------
    MySql:=' SELECT distinct p.cod_profissional, p.des_profissional'+
           ' FROM sal_prof_habilidades h, sal_profissionais p'+
           ' WHERE  h.cod_profissional=p.cod_profissional'+
           ' AND    h.Cod_loaj=p.Cod_Loja'+
           ' AND    p.tip_pessoa='+QuotedStr('P')+
           ' AND    h.cod_habilidade='+QuotedStr(DMSalao.CDS_HabilidadesCOD_HAB.AsString);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Des_Profissional').AsString)<>'' Then
    Begin
      msg('Impossível Excluir !!'+cr+'Existem Profissionais Utilizando'+cr+'Esta Habilidade !!','A');

      If DMBelShop.CDS_BuscaRapida.RecordCount<11 Then
      Begin
        sgMensagem:='';
        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          If sgMensagem='' Then
           sgMensagem:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString+' - '+
                  DMBelShop.CDS_BuscaRapida.FieldByName('Des_Profissional').AsString
          Else
           sgMensagem:=sgMensagem+cr+DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString+' - '+
                                     DMBelShop.CDS_BuscaRapida.FieldByName('Des_Profissional').AsString;

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
        DMBelShop.CDS_BuscaRapida.Close;

        ShowMessage('Profisionais Que Utilizam Esta Habilidades'+cr+cr+sgMensagem)
      End; // If DMBelShop.CDS_BuscaRapida.RecordCount<11 Then

      sgMensagem:='';
      Exit;
    End;
    DMBelShop.CDS_BuscaRapida.Close;
  End; // If sTipo='H' Then

  // Serviço ===================================================================
  If sTipo='S' Then
  Begin
    // Consiste a Servico de Profissionais --------------------------
    MySql:=' SELECT distinct p.cod_profissional, p.des_profissional'+
           ' FROM SAL_PROF_HABILIDADES ph, SAL_PROFISSIONAIS p'+
           ' WHERE ph.cod_profissional=p.cod_profissional'+
           ' AND   ph.cod_loja=p.cod_loja'+
           ' AND   p.tip_pessoa='+QuotedStr('P')+
           ' AND   ph.cod_Servico='+QuotedStr(DMSalao.CDS_ServicosCOD_SERVICO.AsString);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Des_Profissional').AsString)<>'' Then
    Begin
      msg('Impossível Excluir !!'+cr+'Existem Profissionais Utilizando'+cr+'Este Serviço !!','A');

      If DMBelShop.CDS_BuscaRapida.RecordCount<11 Then
      Begin
        sgMensagem:='';
        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          If sgMensagem='' Then
           sgMensagem:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString+' - '+
                  DMBelShop.CDS_BuscaRapida.FieldByName('Des_Profissional').AsString
          Else
           sgMensagem:=sgMensagem+cr+DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString+' - '+
                                     DMBelShop.CDS_BuscaRapida.FieldByName('Des_Profissional').AsString;

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
        DMBelShop.CDS_BuscaRapida.Close;

        ShowMessage('Profisionais Que Utilizam Este Serviço'+cr+cr+sgMensagem)
      End; // If DMBelShop.CDS_BuscaRapida.RecordCount<11 Then

      sgMensagem:='';
      Exit;
    End;
    DMBelShop.CDS_BuscaRapida.Close;
  End; // If sTipo='S' Then

  Result:=True;
   
End; // HABILIDADES - consistem Exclusão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// DIVERSOS - Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSalao.FechaTudoSalao;
Var
  i: Integer;
Begin

  // Fecha Componentes DMSalao =================================================
  For i:=0 to DMSalao.ComponentCount-1 do
  Begin
    If DMSalao.Components[i] is TClientDataSet Then
     If (DMSalao.Components[i] as TClientDataSet).Active Then
     (DMSalao.Components[i] as TClientDataSet).Close;

    If DMSalao.Components[i] is TSQLQuery Then
     If (DMSalao.Components[i] as TSQLQuery).Active Then
     (DMSalao.Components[i] as TSQLQuery).Close;
  End;

end; // DIVERSOS - Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Acerta Aprtesentacao de TabSheet e Paineis >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSalao.ApresCadProfissional(bVisivel: Boolean);
Begin
  EdtCadProfPerComissao.Value:=0;
  
  // Apresenta TabSheets =======================================================
  Ts_Profissionais.TabVisible:=bVisivel;
  Ts_CadProfissional.TabVisible:=Not bVisivel;

  PC_CadProfissional.ActivePage:=Ts_CadProfDadosPessoais;
  PC_CadProfDiversos.ActivePage:=Ts_CadProfLocais;

  Refresh;

End; // Acerta Aprtesentacao de TabSheet e Paineis >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmSalao.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmSalao.PC_SalaoChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Salao);

  If (PC_Salao.ActivePage=Ts_Profissionais) And (Ts_Profissionais.CanFocus) Then
   EdtCodLoja.SetFocus;

  If (PC_Salao.ActivePage=Ts_Habilidades) And (Ts_Habilidades.CanFocus) Then
  Begin
    Bt_CadProfVerificaCad.Visible:=False;
    Dbg_Habilidades.SetFocus;
  End;

  If (PC_Salao.ActivePage=Ts_ProfVales) And (Ts_ProfVales.CanFocus) Then
   EdtValesCodLoja.SetFocus;

  If (PC_Salao.ActivePage=Ts_ProfMetas) And (Ts_ProfMetas.CanFocus) Then
   EdtMetasCodLoja.SetFocus;

  If (PC_Salao.ActivePage=Ts_ProfPagtos) And (Ts_ProfPagtos.CanFocus) Then
  Begin
    If (PC_PagtoPlanilha.ActivePage=Ts_PagtoProfissionais) And (Ts_PagtoProfissionais.CanFocus) Then
     EdtPagtoCodLoja.SetFocus;

    If (PC_PagtoPlanilha.ActivePage=Ts_PagtoDebCred) And (Ts_PagtoDebCred.CanFocus) Then
     Dbg_PagtosDebCred.SetFocus;

    If (PC_PagtoPlanilha.ActivePage=Ts_PagtoVendas) And (Ts_PagtoVendas.CanFocus) Then
     Dbg_PagtosVendas.SetFocus;

    If (PC_PagtoPlanilha.ActivePage=Ts_PagtoPlanilha) And (Ts_PagtoPlanilha.CanFocus) Then
     Dbg_PagtoPlanilha.SetFocus;
  End;

  If (PC_Salao.ActivePage=Ts_ProfMovtosRH) And (Ts_ProfMovtosRH.CanFocus) Then
  Begin
    Ts_ProfImpTecBiz.TabVisible:=False;
    Ts_ProfImpPlanoSaude.TabVisible:=False;
    Ts_ProfINSS.TabVisible:=False;
    Ts_ProfTaxaSindicato.TabVisible:=False;

    OutLook_ProfMovtosRH.Pages[OutLook_ProfMovtosRH.ActivePageIndex].Font.Style:=[fsBold];
    OutLook_ProfMovtosRH.Pages[OutLook_ProfMovtosRH.ActivePageIndex].Font.Color:=clWindowText;
    OutLook_ProfMovtosRH.Pages[OutLook_ProfMovtosRH.ActivePageIndex].Font.Name:='MS Sans Serif'; // 'Arial Black';

    Bt_MovtosRHRetornar.Visible:=False;
    Bt_Fechar.Parent:=Pan_MovtosRH;

    Bt_ProfINSSTXSCalcular.Visible:=False;
    Bt_ProfINSSTXSExcel.Visible:=False;
    Bt_ProfINSSTXSClipboard.Visible:=False;
  End; // If (PC_Salao.ActivePage=Ts_ProfMovtosRH) And (Ts_ProfMovtosRH.CanFocus) Then

end;

procedure TFrmSalao.Bt_AlterarClick(Sender: TObject);
begin
  Dbg_Profissionais.SetFocus;

  OdirPanApres.Visible:=False;

  If Cbx_CadProfServAtivo.ItemIndex=1 Then

  If DMSalao.CDS_Profissionais.IsEmpty Then
  Begin
    msg('SEM Profissional a DETALHAR !!' ,'A');
    Exit;
  End;

  bgCFPLiberado:=False; // Libera para verificaçao de Duplicidade de CPF

  // Abre Transação ============================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);

  // Edita =====================================================================
  DMSalao.CDS_Profissionais.Edit;

  // Dados dos Profissional ====================================================
  Try
    DadosProfissional;
  Except
    On e : Exception do
    Begin
      DateSeparator:='/';
      DecimalSeparator:=',';

      If DMBelShop.SQLC.InTransaction Then
       DMBelShop.SQLC.Rollback(TD);

      If (DMSalao.CDS_Profissionais.State=dsInsert) Or (DMSalao.CDS_Profissionais.State=dsEdit) Then
       DMSalao.CDS_Profissionais.CancelUpdates;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    End;
  End; // Try

  Bt_CadProfDML.Caption:='Alterar';
  Bt_CadProfDML.Tag:=2;
  BloqueioBotoes(FrmSalao, DMBelShop.CDS_Seguranca, igTagPermissao, Des_Login, bgInd_Admin);

  ApresCadProfissional(False);

  Dbe_CadProfNome.SetFocus;
end;

procedure TFrmSalao.Bt_CadProfAbandonarClick(Sender: TObject);
Var
  sCodProf: String;
begin
  If PC_Salao.ActivePage=Ts_CadProfissional Then
   Dbe_CadProfCodigo.SetFocus;

  If DMBelShop.SQLC.InTransaction Then
  Begin
    If msg('Deseja Realmente Abandonar ??'+cr+cr+'Todas as ALTERAÇÕES, INCLUSÕES e EXCLUSÕES'+cr+'Serãm Abandonadas !!','C')=2 Then
     Exit;
  End;

  OdirPanApres.Visible:=False;

  // Fecha Transação ===========================================================
  If (DMSalao.CDS_Profissionais.State=dsInsert) Or (DMSalao.CDS_Profissionais.State=dsEdit) Then
   DMSalao.CDS_Profissionais.CancelUpdates;

  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  DateSeparator:='/';
  DecimalSeparator:=',';
  Screen.Cursor:=crDefault;

  ApresCadProfissional(True);

  sCodProf:=DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString;
  Cbx_SituacaoClick(Self);
  DMSalao.CDS_Profissionais.Locate('Cod_Profissional',sCodProf,[]);

  Dbg_Profissionais.SetFocus;

end;

procedure TFrmSalao.EdtCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtDesLoja.Clear;
  DMSalao.CDS_Profissionais.Close;

  If EdtCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From EMP_CONEXOES'+
           ' Where Ind_Ativo=''SIM'''+
           ' And COD_FILIAL='+QuotedStr(FormatFloat('00',EdtCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('RAZAO_SOCIAL').AsString)='' Then
    Begin
      msg('Loja NÃO Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtCodLoja.Clear;
      EdtCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    Ckb_Profissionais.Checked:=True;
    Ckb_Vendedores.Checked:=False;
    Cbx_SituacaoClick(Self);

    Dbg_Profissionais.SetFocus;
    Screen.Cursor:=crDefault;

  End;
end;

procedure TFrmSalao.FormShow(Sender: TObject);
begin
  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmSalao);

  bEnterTab:=True;
  bgSairSalao:=False;

  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  PC_SalaoChange(Self);
  PC_CadProfSidicomChange(Self);
  PC_PagtoPlanilha.ActivePage:=Ts_PagtoProfissionais;

//OdirApgar - 01/10/2015
//  // Abre INSS/Taxa Sindicato  =================================================
//  If PC_Salao.ActivePage=Ts_ProfMovtosRH Then
//  Begin
//    Cbx_INSS_PSMesChange(Self);
//  End; // If PC_Salao.ActivePage=Ts_PlanoSaude Then

  // Abre Plano de Saude =======================================================
  If PC_Salao.ActivePage=Ts_PlanoSaude Then
  Begin
    BuscaPlanosSaude();
  End; // If PC_Salao.ActivePage=Ts_PlanoSaude Then

  FrmSalao.Align:=alClient;

end;

procedure TFrmSalao.Bt_BuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtCodLoja.Clear;
  EdtDesLoja.Clear;

  DMSalao.CDS_Profissionais.Close;

  EdtCodLoja.SetFocus;

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
    EdtCodLoja.SetFocus;
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
     EdtCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtDesLoja.Text:=FrmPesquisa.EdtDescricao.Text;
     Dbg_Profissionais.SetFocus;
   End
  Else
   Begin
     EdtCodLoja.Clear;
     EdtDesLoja.Clear;
     EdtCodLoja.SetFocus;
   End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmSalao.EdtCodLojaChange(Sender: TObject);
begin
  EdtDesLoja.Clear;
  FechaTudoSalao;
end;

procedure TFrmSalao.Bt_ExcluirClick(Sender: TObject);
Var
  sExclui,  MySql: String;
begin
  Dbg_Profissionais.SetFocus;
  OdirPanApres.Visible:=False;

  If DMSalao.CDS_Profissionais.IsEmpty Then
  Begin
    msg('SEM Profissional a EXCLUIR !!' ,'A');
    Exit;
  End;

  If DMSalao.CDS_ProfissionaisIND_LIBERADO.AsString='SIM' Then
  Begin
    msg('Impossível EXCLUIR !!'+cr+'Profissional com Contrato Assinado !!' ,'A');
    Exit;
  End;

  If DMSalao.CDS_ProfissionaisIND_CAD_SIDICOM.AsString='SIM' Then
  Begin
    msg('Impossível EXCLUIR !!'+cr+'Profissional Já Cadastrado no SIDICOM !!' ,'A');
    Exit;
  End;

  // Consiste Já Já Houver Pagamentos ==========================================
  MySql:=' SELECT FIRST 1 pp.cod_profissional'+
         ' FROM SAL_PLAN_PAGTO pp'+
         ' WHERE pp.cod_loja='+QuotedStr(FormatFloat('00',EdtCodLoja.AsInteger))+
         ' AND   pp.cod_profissional='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  MySql:=DMBelShop.CDS_BuscaRapida.FieldByName('cod_profissional').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  If MySql<>'' Then
  Begin
    msg('Impossível Excluir Este Profissional !!'+cr+'Ele Contém Pagamentos !!','A');
    Exit;
  End; // If MySql<>'' Then

  // Consiste Vendas ===========================================================
  MySql:=' SELECT FIRST 1 v.cod_profissional'+
         ' FROM SAL_MOVTOS_VENDAS v'+
         ' WHERE v.cod_loja='+QuotedStr(FormatFloat('00',EdtCodLoja.AsInteger))+
         ' AND   v.cod_profissional='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  MySql:=DMBelShop.CDS_BuscaRapida.FieldByName('cod_profissional').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  If MySql<>'' Then
  Begin
    msg('Impossível Excluir Este Profissional !!'+cr+'Ele Contém Vendas !!','A');
    Exit;
  End; // If MySql<>'' Then

  // Consiste Vales ============================================================
  MySql:=' SELECT FIRST 1 v.cod_pessoa'+
         ' FROM PS_VALES_PESSOAS v'+
         ' WHERE v.tp_pessoa=1'+
         ' AND   v.cod_loja='+QuotedStr(FormatFloat('00',EdtCodLoja.AsInteger))+
         ' AND   v.cod_pessoa='+IntToStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsInteger);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  MySql:=DMBelShop.CDS_BuscaRapida.FieldByName('cod_pessoa').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  If MySql<>'' Then
  Begin
    msg('Impossível Excluir Este Profissional !!'+cr+'Ele Contém Movimento (Débito ou Crédito) !!','A');
    Exit;
  End; // If MySql<>'' Then

  // Consiste Metas ============================================================
  sExclui:=''; // Marca para Excluir (M)etas e/ou (H)abilidades

  MySql:=' SELECT FIRST 1 m.cod_profissional'+
         ' FROM SAL_METAS m'+
         ' WHERE m.cod_loja='+QuotedStr(FormatFloat('00',EdtCodLoja.AsInteger))+
         ' AND   m.cod_profissional='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  MySql:=DMBelShop.CDS_BuscaRapida.FieldByName('cod_profissional').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  If MySql<>'' Then
  Begin
    If msg('Este Profissional Contém Metas !!'+cr+'Deseja Realmente Excluí-lo ??','C')=2 Then
     Exit;
    sExclui:='M';
  End; // If MySql<>'' Then

  // Consiste Habilidades ======================================================
  MySql:=' SELECT FIRST 1 h.cod_profissional'+
         ' FROM SAL_PROF_HABILIDADES h'+
         ' WHERE h.cod_loja='+QuotedStr(FormatFloat('00',EdtCodLoja.AsInteger))+
         ' AND   h.cod_profissional='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  MySql:=DMBelShop.CDS_BuscaRapida.FieldByName('cod_profissional').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  If MySql<>'' Then
  Begin
    If msg('Este Profissional Contém Habilidades !!'+cr+'Deseja Realmente Excluí-lo ??','C')=2 Then
     Exit;
    sExclui:=sExclui+'H';
  End; // If MySql<>'' Then

  If msg('Deseja Realmente Excluír'+cr+'O Profissional Selecionado ??','C')=2 Then
   Exit;

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

    If sExclui<>'' Then
    Begin
      // Exclui Metas -----------------------------------------------
      If AnsiContainsStr(sExclui, 'M') Then
      Begin
        MySql:=' DELETE FROM SAL_METAS m'+
               ' WHERE m.cod_loja='+QuotedStr(FormatFloat('00',EdtCodLoja.AsInteger))+
               ' AND   m.cod_profissional='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
        DMBelShop.SQLC.Execute(MySql, Nil, Nil);
      End; // If AnsiContainsStr(sExclui, 'M') Then

      // Exclui Habilidade ------------------------------------------
      If AnsiContainsStr(sExclui, 'H') Then
      Begin
        MySql:=' DELETE FROM SAL_PROF_HABILIDADES h'+
               ' WHERE h.cod_loja='+QuotedStr(FormatFloat('00',EdtCodLoja.AsInteger))+
               ' AND   h.cod_profissional='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
        DMBelShop.SQLC.Execute(MySql, Nil, Nil);
      End; // If AnsiContainsStr(sExclui, 'H') Then
    End; // If sExclui<>'' Then

    // Exclui Profissional ------------------------------------------
    MySql:=' DELETE FROM SAL_PROFISSIONAIS p'+
           ' WHERE p.cod_loja='+QuotedStr(FormatFloat('00',EdtCodLoja.AsInteger))+
           ' AND   p.cod_profissional='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
    DMBelShop.SQLC.Execute(MySql, Nil, Nil);

    // Exclui Codigo TecBiz -----------------------------------------
    MySql:=' DELETE FROM tab_auxiliar t'+
           ' WHERE t.tip_aux=10'+
           ' AND t.cod_aux='+QuotedStr(DMSalao.CDS_ProfissionaisNUM_MATRICULA_TECBIZ.AsString)+
           ' AND t.des_aux='+QuotedStr(FormatFloat('00',EdtCodLoja.AsInteger))+
           ' AND t.des_aux1='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
    DMBelShop.SQLC.Execute(MySql, Nil, Nil);

    // Exclui Numero de Dependentes ----------------------------------
    MySql:=' DELETE FROM tab_auxiliar t'+
           ' WHERE t.tip_aux=6'+
           ' AND t.cod_aux='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+
           ' AND t.des_aux='+QuotedStr(FormatFloat('00',EdtCodLoja.AsInteger));
    DMBelShop.SQLC.Execute(MySql, Nil, Nil);

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Cbx_SituacaoClick(Self);

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

end;

procedure TFrmSalao.Ts_HabilidadesShow(Sender: TObject);
begin
  If Not DMSalao.CDS_Habilidades.Active Then
  Begin
    DMSalao.CDS_Habilidades.Open;
    DMSalao.CDS_Servicos.Open;
  End;

end;

procedure TFrmSalao.Bt_HabAterarClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_Habilidades.SetFocus;

  If DMSalao.CDS_Habilidades.IsEmpty Then
   Exit;

  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(8);

  FrmSolicitacoes.Caption:='Habilidade de Profissionais de Salão';
  FrmSolicitacoes.Ts_HabServ.Caption:='Habilidade';
  FrmSolicitacoes.Bt_HabServSalvar.Caption:='Alterar';

  FrmSolicitacoes.EdtHabServCodigo.AsInteger:=DMSalao.CDS_HabilidadesCOD_HAB.AsInteger;
  FrmSolicitacoes.Gb_HabServCodigo.Enabled:=False;

  FrmSolicitacoes.EdtHabServDesc.Text       :=DMSalao.CDS_HabilidadesDES_HABILIDADE.AsString;
  FrmSolicitacoes.Gb_HabServDesc.Enabled:=True;
  If Trim(DMSalao.CDS_HabilidadesDES_HABILIDADE.AsString)='PROMOÇÕES' Then
  Begin
    FrmSolicitacoes.Gb_HabServDesc.Enabled:=False;
    FrmSolicitacoes.EdtHabServDesc.Color:=$00DADADA;
  End;

  FrmSolicitacoes.EdtHabServAbrev.Text      :=DMSalao.CDS_HabilidadesDES_ABREVIATURA.AsString;
  FrmSolicitacoes.Gb_HabServAbrev.Left      :=FrmSolicitacoes.Gb_HabServCodigo.Left;

  FrmSolicitacoes.Ckb_HabServAtivo.Checked  :=(DMSalao.CDS_HabilidadesIND_ATIVO.AsString='SIM');
  AcertaCkb_SN(FrmSolicitacoes.Ckb_HabServAtivo);
  FrmSolicitacoes.Gb_HabServAtivo.Left      :=FrmSolicitacoes.Gb_HabServCodigo.Left;

  FrmSolicitacoes.Gb_HabServPreco.Visible:=False;
  FrmSolicitacoes.Gb_HabServCodSidicom.Visible:=False;

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    // Altera Habilidade =======================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      MySql:=' Update SAL_HAB_SERV h'+
             ' Set h.DES_HABSERV='+QuotedStr(Trim(FrmSolicitacoes.EdtHabServDesc.Text))+', '+
             ' h.DES_ABREVIATURA='+QuotedStr(Trim(FrmSolicitacoes.EdtHabServAbrev.Text))+', '+
             ' h.IND_ATIVO='+QuotedStr(FrmSolicitacoes.Ckb_HabServAtivo.Caption)+', '+
             ' h.USU_ALTERA='+QuotedStr(Cod_Usuario)+', '+
             ' h.DTA_ALTERA=Current_Date'+

             ' Where h.tip_habserv=''H'''+
             ' And   h.cod_habserv='+QuotedStr(VarToStr(FrmSolicitacoes.EdtHabServCodigo.Value));
      DMBelShop.SQLC.Execute(MySql, nil, nil);

      // Altera Habilidade de Profissionais ====================================
      If FrmSolicitacoes.Ckb_HabServAtivoAltera.Checked Then
      Begin
        MySql:=' Update SAL_PROF_HABILIDADES'+
               ' set Ind_Ativo='+QuotedStr(FrmSolicitacoes.Ckb_HabServAtivo.Caption)+
               ' Where Cod_Habilidade='+QuotedStr(DMSalao.CDS_HabilidadesCOD_HAB.AsString);
        DMBelShop.SQLC.Execute(MySql, nil, nil);
      End;

      // Fecha Transacao =======================================================
      DMBelShop.SQLC.Commit(TD);

      DMSalao.CDS_Habilidades.Close;
      DMSalao.CDS_Habilidades.Open;
      DMSalao.CDS_Habilidades.Locate('Cod_Hab',FrmSolicitacoes.EdtHabServCodigo.AsInteger,[]);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
    Except
     on e : Exception do
     Begin
       DMBelShop.SQLC.Rollback(TD);

       DateSeparator:='/';
       DecimalSeparator:=',';
       Screen.Cursor:=crDefault;

       MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
     End; // on e : Exception do
    End; // Try
  End; // If bgProcessar Then
  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmSalao.Bt_HabExcluirClick(Sender: TObject);
Var
  MySql: String;
begin
  If DMSalao.CDS_Habilidades.IsEmpty Then
   Exit;

  // Consiste Exclusão =========================================================
  If Not ConsisteExcluao('H') Then
  Begin
    If sgMensagem<>'' Then
     msg(sgMensagem,'A');
    Exit;
  End;

  If msg('Deseja Realmente Excluir a Habilidade:'+cr+DMSalao.CDS_HabilidadesDES_HABILIDADE.AsString,'C')=2 Then
   Exit;

  // Exclui Habilidade e Servicos ==============================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' Delete From SAL_HAB_SERV_LINK l'+
           ' Where l.cod_habilidade='+QuotedStr(DMSalao.CDS_HabilidadesCOD_HAB.AsString);
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    MySql:=' Delete From SAL_HAB_SERV h'+
           ' where h.tip_habserv=''H'''+
           ' And h.cod_habserv='+QuotedStr(DMSalao.CDS_HabilidadesCOD_HAB.AsString);
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    MySql:=' DELETE FROM SAL_PROF_HABILIDADES h'+
           ' WHERE ph.cod_habilidade='+QuotedStr(DMSalao.CDS_HabilidadesCOD_HAB.AsString);
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    // Fecha Transacao ===========================================================
    DMBelShop.SQLC.Commit(TD);

    DMSalao.CDS_Habilidades.Close;
    DMSalao.CDS_Habilidades.Open;

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;
  Except
    on e : Exception do
    Begin
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

end;

procedure TFrmSalao.Bt_ServAlterarClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_Habilidades.SetFocus;

  If DMSalao.CDS_Servicos.IsEmpty Then
   Exit;

  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(8);

  FrmSolicitacoes.Caption:='Serviço de Profissionais de Salão';
  FrmSolicitacoes.Ts_HabServ.Caption:='Serviço';
  FrmSolicitacoes.Bt_HabServSalvar.Caption:='Alterar';

  FrmSolicitacoes.EdtHabServCodigo.AsInteger:=DMSalao.CDS_ServicosCOD_SERVICO.AsInteger;
  FrmSolicitacoes.Gb_HabServCodigo.Enabled:=False;

  FrmSolicitacoes.EdtHabServDesc.Text       :=DMSalao.CDS_ServicosDES_SERVICO.AsString;
  FrmSolicitacoes.EdtHabServPreco.Value     :=DMSalao.CDS_ServicosVLR_HABSERV.AsCurrency;
  FrmSolicitacoes.EdtHabServCodSidicom.Text :=DMSalao.CDS_ServicosCOD_SIDICOM.AsString;

  FrmSolicitacoes.Gb_HabServAbrev.Visible:=False;

  FrmSolicitacoes.Ckb_HabServAtivo.Checked  :=(DMSalao.CDS_ServicosIND_ATIVO.AsString='SIM');
  AcertaCkb_SN(FrmSolicitacoes.Ckb_HabServAtivo);

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    // Altera Habilidade =======================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      MySql:=' Update SAL_HAB_SERV s'+
             ' Set s.DES_HABSERV='+QuotedStr(Trim(FrmSolicitacoes.EdtHabServDesc.Text))+', '+
             ' s.VLR_HABSERV='+QuotedStr(VarToStr(FrmSolicitacoes.EdtHabServPreco.Value))+', '+
             ' s.IND_ATIVO='+QuotedStr(FrmSolicitacoes.Ckb_HabServAtivo.Caption)+', '+
             ' s.USU_ALTERA='+QuotedStr(Cod_Usuario)+', '+
             ' s.DTA_ALTERA=Current_Date, ';

             If Trim(FrmSolicitacoes.EdtHabServCodSidicom.Text)<>'' Then
              MySql:=MySql+' s.COD_SIDICOM='+QuotedStr(FormatFloat('000000',StrToInt(FrmSolicitacoes.EdtHabServCodSidicom.Text)))
             Else
              MySql:=MySql+' s.COD_SIDICOM=Null ';

             MySql:=MySql+' Where s.tip_habserv=''S'''+
                          ' And   s.cod_habserv='+QuotedStr(VarToStr(FrmSolicitacoes.EdtHabServCodigo.Value));
      DMBelShop.SQLC.Execute(MySql, nil, nil);

      // Altera Habilidade de Profissionais ====================================
      If FrmSolicitacoes.Ckb_HabServAtivoAltera.Checked Then
      Begin
        MySql:=' Update SAL_PROF_HABILIDADES'+
               ' set Ind_Ativo='+QuotedStr(FrmSolicitacoes.Ckb_HabServAtivo.Caption)+
               ' Where Cod_Habilidade='+QuotedStr(DMSalao.CDS_HabilidadesCOD_HAB.AsString)+
               ' And   Cod_Servico='+QuotedStr(VarToStr(FrmSolicitacoes.EdtHabServCodigo.Value));
        DMBelShop.SQLC.Execute(MySql, nil, nil);
      End;

      // Fecha Transacao ===========================================================
      DMBelShop.SQLC.Commit(TD);

      DMSalao.CDS_Servicos.Close;
      DMSalao.CDS_Servicos.Open;
      DMSalao.CDS_Servicos.Locate('Cod_Servico',FrmSolicitacoes.EdtHabServCodigo.AsInteger,[]);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
    Except
     on e : Exception do
     Begin
       DMBelShop.SQLC.Rollback(TD);

       DateSeparator:='/';
       DecimalSeparator:=',';
       Screen.Cursor:=crDefault;

       MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
     End; // on e : Exception do
    End; // Try
  End; // If bgProcessar Then

  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmSalao.Bt_ServExcluirClick(Sender: TObject);
Var
  MySql: String;
  iCod: Integer;
begin

  If DMSalao.CDS_Servicos.IsEmpty Then
   Exit;

  // Consiste Exclusão =========================================================
  If Not ConsisteExcluao('S') Then
  Begin
    If sgMensagem<>'' Then
     msg(sgMensagem,'A');
    Exit;
  End;

  If msg('Deseja Realmente Excluir o Serviço:'+cr+DMSalao.CDS_ServicosDES_SERVICO.AsString,'C')=2 Then
   Exit;

  // Exclui Habilidade e Servicos ==============================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' Delete From SAL_HAB_SERV_LINK l'+
           ' where l.Cod_Habilidade='+QuotedStr(DMSalao.CDS_HabilidadesCOD_HAB.AsString)+
           ' And   l.cod_Servico='+QuotedStr(DMSalao.CDS_ServicosCOD_SERVICO.AsString);
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    MySql:=' DELETE FROM SAL_PROF_HABILIDADES ph'+
           ' WHERE  ph.cod_habilidade='+QuotedStr(DMSalao.CDS_HabilidadesCOD_HAB.AsString)+
           ' AND    ph.cod_servico='+QuotedStr(DMSalao.CDS_ServicosCOD_SERVICO.AsString);
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    // Fecha Transacao ===========================================================
    DMBelShop.SQLC.Commit(TD);

    iCod:=DMSalao.CDS_HabilidadesCOD_HAB.AsInteger;
    DMSalao.CDS_Habilidades.Close;
    DMSalao.CDS_Habilidades.Open;
    DMSalao.CDS_Habilidades.Locate('Cod_Hab',iCod,[]);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;
  Except
    on e : Exception do
    Begin
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

end;

procedure TFrmSalao.Bt_HabNovaClick(Sender: TObject);
Var
  MySql: String;
Begin
  Dbg_Habilidades.SetFocus;

  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(8);

  FrmSolicitacoes.Caption:='Habilidade de Profissionais de Salão';
  FrmSolicitacoes.Ts_HabServ.Caption:='Habilidade';
  FrmSolicitacoes.Bt_HabServSalvar.Caption:='Incluir';

  // Busca Código para Habilidade ==============================================
  MySql:=' SELECT GEN_ID(GEN_HAB_SERVICOS,1) Codigo'+
         ' FROM RDB$DATABASE';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  FrmSolicitacoes.EdtHabServCodigo.AsInteger:=DMBelShop.CDS_BuscaRapida.FieldByName('Codigo').AsInteger;
  FrmSolicitacoes.Gb_HabServCodigo.Enabled:=False;
  DMBelShop.SDS_BuscaRapida.Close;

  FrmSolicitacoes.Ckb_HabServAtivo.Checked:=True;
  AcertaCkb_SN(FrmSolicitacoes.Ckb_HabServAtivo);
  
  FrmSolicitacoes.Gb_HabServPreco.Visible:=False;
  FrmSolicitacoes.Gb_HabServCodSidicom.Visible:=False;
  FrmSolicitacoes.Gb_HabServAtivo.Visible:=False;


  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    // Cadastra Habilidade ==============================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      MySql:=' Insert Into SAL_HAB_SERV'+
             ' (TIP_HABSERV, COD_HABSERV, DES_HABSERV, DES_ABREVIATURA, IND_ATIVO, USU_INCLUI)'+
             ' Values ('+
             QuotedStr('H')+', '+
             QuotedStr(VarToStr(FrmSolicitacoes.EdtHabServCodigo.AsInteger))+', '+
             QuotedStr(Trim(FrmSolicitacoes.EdtHabServDesc.Text))+', '+
             QuotedStr(Trim(FrmSolicitacoes.EdtHabServAbrev.Text))+', '+
             QuotedStr(FrmSolicitacoes.Ckb_HabServAtivo.Caption)+', '+
             QuotedStr(Cod_Usuario)+')';
      DMBelShop.SQLC.Execute(MySql, nil, nil);

      // Fecha Transacao ===========================================================
      DMBelShop.SQLC.Commit(TD);

      DMSalao.CDS_Habilidades.Close;
      DMSalao.CDS_Habilidades.Open;
      DMSalao.CDS_Habilidades.Locate('Cod_Hab',FrmSolicitacoes.EdtHabServCodigo.AsInteger,[]);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
    Except
     on e : Exception do
     Begin
       DMBelShop.SQLC.Rollback(TD);

       DateSeparator:='/';
       DecimalSeparator:=',';
       Screen.Cursor:=crDefault;

       MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
     End; // on e : Exception do
    End; // Try
  End; // If bgProcessar Then
  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmSalao.Bt_ServIncluirClick(Sender: TObject);
Var
  MySql: String;
  i, ii: Integer;

  bTodaLoja: Boolean;
  sAtivo: String;
begin

  Dbg_Servicos.SetFocus;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT s.des_habserv Des_Servico, s.cod_habserv Cod_Servico,'+
         ' s.vlr_habserv Preco, s.ind_ativo'+
         ' FROM SAL_HAB_SERV s'+
         ' WHERE s.tip_habserv=''S'''+
         ' AND NOT EXISTS ('+
         ' SELECT 1'+
         ' FROM sal_hab_serv_link l'+
         ' Where l.cod_servico=s.cod_habserv)'+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Des_Servico').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Serviço a Listar !!','A');
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Servico';
  FrmPesquisa.Campo_Codigo:='Cod_Servico';
  FrmPesquisa.Campo_Descricao:='Des_Servico';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // Variavel de Entrada  - Variavel de Retorno
  // Campo_Retorno1       - Retorno1
  // Campo_Retorno2       - Retorno2
  // Campo_Retorno3       - Retorno3
  FrmPesquisa.Campo_Retorno1:='Preco';
  FrmPesquisa.Campo_Retorno2:='ind_ativo';
  FrmPesquisa.Campo_Retorno3:='';

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    // Verifica se Transação esta Ativa
    If DMBelShop.SQLC.InTransaction Then
     DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      // Inclui Servico ========================================================
      MySql:=' Insert Into SAL_HAB_SERV_LINK'+
             ' (COD_HABILIDADE, COD_SERVICO, USU_INCLUI)'+
             ' Values ('+
             QuotedStr(DMSalao.CDS_HabilidadesCOD_HAB.AsString)+', '+
             QuotedStr(Trim(FrmPesquisa.EdtCodigo.Text))+', '+
             QuotedStr(Cod_Usuario)+')';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Inclui Servico no Profisional que Contem a Habilidade =================
      MySql:=' SELECT ph.cod_loja, em.razao_social, ph.cod_profissional,'+
             ' pr.des_profissional, ph.cod_habilidade, ph.ind_ativo'+

             ' FROM SAL_PROF_HABILIDADES ph, sal_profissionais pr, emp_conexoes em'+

             ' WHERE ph.cod_loja=pr.cod_loja'+
             ' AND ph.cod_profissional=pr.cod_profissional'+
             ' AND ph.cod_loja=em.cod_filial'+
             ' AND ph.cod_servico IS NULL'+
             ' AND pr.tip_pessoa='+QuotedStr('P')+
             ' AND ph.cod_habilidade='+QuotedStr(DMSalao.CDS_HabilidadesCOD_HAB.AsString)+
             ' ORDER BY 1,2';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      sgCodLojas:='';
      bTodaLoja:=False;
      While Not DMBelShop.CDS_BuscaRapida.Eof do
      Begin
        If sgCodLojas<>DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString Then
         bTodaLoja:=False;

        If Not bTodaLoja Then
        Begin
          FrmSalaoPercServico:=TFrmSalaoPercServico.Create(Self);

          FrmSalaoPercServico.EdtSalaoPercServCodLoja.Text:=
                     DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString;
          FrmSalaoPercServico.EdtSalaoPercServDesLoja.Text:=
                 DMBelShop.CDS_BuscaRapida.FieldByName('razao_social').AsString;

          FrmSalaoPercServico.EdtSalaoPercServCodProf.Text:=
             DMBelShop.CDS_BuscaRapida.FieldByName('cod_profissional').AsString;
          FrmSalaoPercServico.EdtSalaoPercServDesProf.Text:=
             DMBelShop.CDS_BuscaRapida.FieldByName('des_profissional').AsString;

          FrmSalaoPercServico.EdtSalaoPercServCodHab.Text:=
                                        DMSalao.CDS_HabilidadesCOD_HAB.AsString;
          FrmSalaoPercServico.EdtSalaoPercServDesHab.Text:=
                                 DMSalao.CDS_HabilidadesDES_HABILIDADE.AsString;

          FrmSalaoPercServico.EdtSalaoPercServCodServ.Text:=Trim(FrmPesquisa.EdtCodigo.Text);
          FrmSalaoPercServico.EdtSalaoPercServDesServ.Text:=Trim(FrmPesquisa.EdtDescricao.Text);

          FrmSalaoPercServico.ShowModal;

          bTodaLoja:=(FrmSalaoPercServico.Rb_SalaoPercServTodos.Checked=True);
          cgPerPadrao:=FrmSalaoPercServico.EdtSalaoPercServPerCom.Value;

          sAtivo:='SIM';
          If Not FrmSalaoPercServico.Ckb_SalaoPercServAtivo.Checked Then
           sAtivo:='NAO';

          FrmSalaoPercServico.Free;
          FrmSalaoPercServico:=nil;
        End; // If sgCodLojas<>DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString Then


        MySql:=' Insert Into SAL_PROF_HABILIDADES ('+
               ' COD_LOJA, COD_PROFISSIONAL, COD_HABILIDADE, COD_SERVICO,'+
               ' VLR_SERVICO, PER_COMISSAO_SERV, IND_ATIVO, USU_INCLUI)'+
               ' Values('+
               QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)+', '+ // COD_LOJA
               QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString)+', '+ // COD_PROFISSIONAL
               QuotedStr(DMSalao.CDS_HabilidadesCOD_HAB.AsString)+', '+ // COD_HABILIDADE
               QuotedStr(Trim(FrmPesquisa.EdtCodigo.Text))+', '+ // COD_SERVICO
               QuotedStr(Trim(FrmPesquisa.Retorno1))+', '+ // VLR_SERVICO
               QuotedStr(f_troca(',','.',CurrToStr(cgPerPadrao)))+', '+ // PER_COMISSAO_SERV
               QuotedStr(Trim(FrmPesquisa.Retorno2))+', '+ // IND_ATIVO
               QuotedStr(Cod_Usuario)+')';  // USU_INCLUI
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        sgCodLojas:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString;

        DMBelShop.CDS_BuscaRapida.Next;
      End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
      DMBelShop.CDS_BuscaRapida.Close;
      sgCodLojas:='';

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      i :=DMSalao.CDS_HabilidadesCOD_HAB.AsInteger;
      ii:=StrToInt(FrmPesquisa.EdtCodigo.Text);

      DMSalao.CDS_Habilidades.Close;
      DMSalao.CDS_Habilidades.Open;
      DMSalao.CDS_Habilidades.Locate('Cod_Hab',i,[]);

      DMSalao.CDS_Servicos.Close;
      DMSalao.CDS_Servicos.Open;
      DMSalao.CDS_Servicos.Locate('Cod_Servico',ii,[]);

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
      End; // on e : Exception do
    End; // Try

  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmSalao.Bt_ServNovoClick(Sender: TObject);
Var
  MySql: String;
  iCodHab: Integer;

  bTodaLoja: Boolean;
  sAtivo: String;
begin
  iCodHab:=DMSalao.CDS_HabilidadesCOD_HAB.AsInteger;
  Dbg_Servicos.SetFocus;

  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(8);

  FrmSolicitacoes.Caption:='Serviço de Profissionais de Salão';
  FrmSolicitacoes.Ts_HabServ.Caption:='Serviço';
  FrmSolicitacoes.Bt_HabServSalvar.Caption:='Incluir';

  // Busca Código para Serviço =================================================
  MySql:=' SELECT GEN_ID(GEN_HAB_SERVICOS,1) Codigo'+
         ' FROM RDB$DATABASE';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  FrmSolicitacoes.EdtHabServCodigo.AsInteger:=DMBelShop.CDS_BuscaRapida.FieldByName('Codigo').AsInteger;
  FrmSolicitacoes.Gb_HabServCodigo.Enabled:=False;
  DMBelShop.SDS_BuscaRapida.Close;

  FrmSolicitacoes.Ckb_HabServAtivo.Checked:=True;
  FrmSolicitacoes.Gb_HabServAtivo.Visible:=False;
  FrmSolicitacoes.Gb_HabServAbrev.Visible:=False;
  AcertaCkb_SN(FrmSolicitacoes.Ckb_HabServAtivo);

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    // Cadastra Serviço ========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      MySql:=' Insert Into SAL_HAB_SERV'+
             ' (TIP_HABSERV, COD_HABSERV, DES_HABSERV, VLR_HABSERV, IND_ATIVO,'+
             '  USU_INCLUI, COD_SIDICOM)'+
             ' Values ('+
             QuotedStr('S')+', '+
             QuotedStr(VarToStr(FrmSolicitacoes.EdtHabServCodigo.AsInteger))+', '+
             QuotedStr(Trim(FrmSolicitacoes.EdtHabServDesc.Text))+', '+
             QuotedStr(CurrToStr(FrmSolicitacoes.EdtHabServPreco.Value))+', '+
             QuotedStr(FrmSolicitacoes.Ckb_HabServAtivo.Caption)+', '+
             QuotedStr(Cod_Usuario)+', ';

             If Trim(FrmSolicitacoes.EdtHabServCodSidicom.Text)<>'' Then
              MySql:=MySql+QuotedStr(FormatFloat('000000',StrToInt(FrmSolicitacoes.EdtHabServCodSidicom.Text)))
             Else
              MySql:=MySql+' Null';

             MySql:=MySql+')';

      DMBelShop.SQLC.Execute(MySql, nil, nil);

      MySql:=' Insert Into SAL_HAB_SERV_LINK'+
             ' (COD_HABILIDADE, COD_SERVICO, USU_INCLUI)'+
             ' Values ('+
             QuotedStr(IntToStr(iCodHab))+', '+
             QuotedStr(VarToStr(FrmSolicitacoes.EdtHabServCodigo.AsInteger))+', '+
             QuotedStr(Cod_Usuario)+')';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Inclui Servico no Profisional que Contem a Habilidade =================
      MySql:=' SELECT ph.cod_loja, em.razao_social, ph.cod_profissional,'+
             ' pr.des_profissional, ph.cod_habilidade, ph.ind_ativo'+

             ' FROM SAL_PROF_HABILIDADES ph, sal_profissionais pr, emp_conexoes em'+

             ' WHERE ph.cod_loja=pr.cod_loja'+
             ' AND ph.cod_profissional=pr.cod_profissional'+
             ' AND ph.cod_loja=em.cod_filial'+
             ' AND pr.tip_pessoa='+QuotedStr('P')+
             ' AND ph.cod_servico IS NULL'+
             ' AND ph.cod_habilidade='+QuotedStr(IntToStr(iCodHab))+
             ' ORDER BY 1,2';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      sgCodLojas:='';
      bTodaLoja:=False;
      cgPerPadrao:=0;
      While Not DMBelShop.CDS_BuscaRapida.Eof do
      Begin
        If sgCodLojas<>DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString Then
         bTodaLoja:=False;

        If Not bTodaLoja Then
        Begin
          FrmSalaoPercServico:=TFrmSalaoPercServico.Create(Self);

          FrmSalaoPercServico.EdtSalaoPercServCodLoja.Text:=
                     DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString;
          FrmSalaoPercServico.EdtSalaoPercServDesLoja.Text:=
                 DMBelShop.CDS_BuscaRapida.FieldByName('razao_social').AsString;

          FrmSalaoPercServico.EdtSalaoPercServCodProf.Text:=
             DMBelShop.CDS_BuscaRapida.FieldByName('cod_profissional').AsString;
          FrmSalaoPercServico.EdtSalaoPercServDesProf.Text:=
             DMBelShop.CDS_BuscaRapida.FieldByName('des_profissional').AsString;

          FrmSalaoPercServico.EdtSalaoPercServCodHab.Text:=
                                        DMSalao.CDS_HabilidadesCOD_HAB.AsString;
          FrmSalaoPercServico.EdtSalaoPercServDesHab.Text:=
                                 DMSalao.CDS_HabilidadesDES_HABILIDADE.AsString;

          FrmSalaoPercServico.EdtSalaoPercServCodServ.Text:=
                                          FrmSolicitacoes.EdtHabServCodigo.Text;
          FrmSalaoPercServico.EdtSalaoPercServDesServ.Text:=
                                      Trim(FrmSolicitacoes.EdtHabServDesc.Text);
          FrmSalaoPercServico.EdtSalaoPercServPerCom.Value:=cgPerPadrao;

          FrmSalaoPercServico.ShowModal;

          bTodaLoja:=(FrmSalaoPercServico.Rb_SalaoPercServTodos.Checked=True);
          cgPerPadrao:=FrmSalaoPercServico.EdtSalaoPercServPerCom.Value;

          sAtivo:='SIM';
          If Not FrmSalaoPercServico.Ckb_SalaoPercServAtivo.Checked Then
           sAtivo:='NAO';

          FreeAndNil(FrmSalaoPercServico);
        End; // If sgCodLojas<>DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString Then

        MySql:=' Insert Into SAL_PROF_HABILIDADES ('+
               ' COD_LOJA, COD_PROFISSIONAL, COD_HABILIDADE, COD_SERVICO,'+
               ' VLR_SERVICO, PER_COMISSAO_SERV, IND_ATIVO, USU_INCLUI)'+
               ' Values('+
               QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)+', '+ // COD_LOJA
               QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString)+', '+ // COD_PROFISSIONAL
               QuotedStr(IntToStr(iCodHab))+', '+ // COD_HABILIDADE
               QuotedStr(VarToStr(FrmSolicitacoes.EdtHabServCodigo.AsInteger))+', '+ // COD_SERVICO
               QuotedStr(CurrToStr(FrmSolicitacoes.EdtHabServPreco.Value))+', '+ // VLR_SERVICO
               QuotedStr(f_troca(',','.',CurrToStr(cgPerPadrao)))+', '+ // PER_COMISSAO_SERV
               QuotedStr(FrmSolicitacoes.Ckb_HabServAtivo.Caption)+', '+ // IND_ATIVO
               QuotedStr(Cod_Usuario)+')'; // USU_INCLUI
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        sgCodLojas:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString;

        DMBelShop.CDS_BuscaRapida.Next;
      End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
      DMBelShop.CDS_BuscaRapida.Close;
      sgCodLojas:='';

      // Fecha Transacao ===========================================================
      DMBelShop.SQLC.Commit(TD);

      DMSalao.CDS_Habilidades.Close;
      DMSalao.CDS_Habilidades.Open;
      DMSalao.CDS_Habilidades.Locate('Cod_Hab',iCodHab,[]);

      DMSalao.CDS_Servicos.Locate('Cod_Servico',FrmSolicitacoes.EdtHabServCodigo.AsInteger,[]);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
    Except
     on e : Exception do
     Begin
       DMBelShop.SQLC.Rollback(TD);

       DateSeparator:='/';
       DecimalSeparator:=',';
       Screen.Cursor:=crDefault;

       MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
     End; // on e : Exception do
    End; // Try
  End; // If bgProcessar Then

  FreeAndNil(FrmSolicitacoes);
end;

procedure TFrmSalao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairSalao Then
   Begin
     Action := caHide; // caFree;

     If DMBelShop.SQLC.InTransaction Then
      DMBelShop.SQLC.Rollback(TD);

     FechaTudoSalao;
   End
  Else
   Begin
     msg('Para Fechar Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;
end;

procedure TFrmSalao.Ckb_CadProfAtivoClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_CadProfAtivo);
end;

procedure TFrmSalao.Ckb_CadProfAtivoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Ckb_CadProfAtivoClick(Self);
end;

procedure TFrmSalao.Ckb_CadProfLiberdoClick(Sender: TObject);
begin
  If (PC_CadProfissional.ActivePage=Ts_CadProfDadosPessoais) And (Ts_CadProfDadosPessoais.CanFocus) Then
  Begin
    If (Not Ckb_CadProfAtivo.Checked) and (Ckb_CadProfLiberdo.Checked) And (Ts_CadProfDadosPessoais.CanFocus) Then
    Begin
      msg('Profissional Desativado !!','A');
      Ckb_CadProfLiberdo.Checked:=False;
      Exit;
    End;

    If (Ckb_CadProfLiberdo.Checked) And (DMSalao.CDS_ProfissionaisNUM_CONTRATO.AsInteger=0) Then
    Begin
      If msg('Profissional SEM Nº do Contrato !!'+cr+cr+'Deseja Informar o Número ??','C')=1 Then
      Begin
        Ckb_CadProfLiberdo.Checked:=False;
        AcertaCkb_SN(Ckb_CadProfLiberdo);
        PC_CadProfissional.ActivePage:=Ts_CadProfContrato;
        Dbe_CadProfNumContrato.SetFocus;
        Exit;
      End;
    End;

// Não Esta Sendo Usado Conforme Renato ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
//    If (Ckb_CadProfLiberdo.Checked) And (DMSalao.CDS_ProfissionaisNUM_CONTRATO_BENS.AsInteger=0) Then
//    Begin
//      If msg('Profissional SEM Nº do Contrato de Bens !!'+cr+cr+'Deseja Informar o Número ??','C')=1 Then
//      Begin
//        Ckb_CadProfLiberdo.Checked:=False;
//        AcertaCkb_SN(Ckb_CadProfLiberdo);
//        PC_CadProfissional.ActivePage:=Ts_CadProfContrato;
//        Dbe_CadProfNumContratoBens.SetFocus;
//        Exit;
//      End;
//    End;
// ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
  End; // If (PC_CadProfissional.ActivePage=Ts_CadProfDadosPessoais) And (Ts_CadProfDadosPessoais.CanFocus) Then

  AcertaCkb_SN(Ckb_CadProfLiberdo);
end;

procedure TFrmSalao.Ckb_CadProfLiberdoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_CadProfLiberdoClick(Self);
end;

procedure TFrmSalao.Bt_CadProfDMLClick(Sender: TObject);
Var
  sCodProf, sNumSeqDep: String;
  MySql: String;
  Foto: TMemoryStream;
  mMemo: TMemo;
  bAtivo: Boolean;
  s: String;
begin
  sgMensagem:='';

  Dbe_CadProfCodigo.SetFocus;

  If Bt_HabServMinimizar.Enabled Then
   Bt_HabServMinimizarClick(Self);

  // Efetua Consistencia de Profissionais ======================================
  DMBelShop.CDS_Consistencias.Close;
  DMBelShop.SDS_Consistencias.Params.ParamByName('Codigo').AsInteger:=1;
  DMBelShop.CDS_Consistencias.Open;
  If Not ConsisteProfissional Then
  Begin
    DMBelShop.CDS_Consistencias.Close;
    Exit;
  End;
  DMBelShop.CDS_Consistencias.Close;

  ApresCadProfissional(True);
  If msg('Deseja Realmente '+Bt_CadProfDML.Caption+cr+'o Profissional ??','C')=2 Then
   Exit;

  // Cria Memo =================================================================
  mMemo:=TMemo.Create(Self);
  mMemo.Visible:=False;
  mMemo.Parent:=FrmSalao;
  mMemo.Width:=500;
  mMemo.Lines.Clear;

  PC_CadProfissional.TabIndex:=0;
  PC_CadProfDiversos.TabIndex:=0;
  PC_CadProfSidicom.TabIndex:=0;

  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    If DMSalao.CDS_Profissionais.State=dsInsert Then
    Begin
      MySql:=' INSERT INTO SAL_PROFISSIONAIS ('+

             ' COD_LOJA, COD_PROFISSIONAL, DES_PROFISSIONAL, DES_APELIDO,'+
             ' NUM_CPF, NUM_RG, BLOB_FOTO, NUM_CEP, DES_ENDERECO,'+
             ' NUM_ENDERECO, CPL_ENDERECO, DES_BAIRRO, COD_MUNICIPIO_IBGE,'+
             ' DES_MUNICIPIO, COD_ESTADO_IBGE, DES_UF, DES_ESTADO, BLOB_LOCALIZACOES,'+
             ' BLOB_OBS, NUM_ALVARA_LOCAL, NUM_SINDICATO, IND_TAXA_SINDICATO,'+
             ' VLR_TAXA_SINDICATO, COD_COMPRV_SINDICATO, IND_TAXA_NAOSOCIO,'+
             ' VLR_TAXA_NAOSOCIO, COD_COMPRV_NAOSOCIO,'+
             ' NUM_INSS, PER_INSS, IND_COBRA_INSS, SIT_PREVIDENCIARIA, COD_COMPRV_INSS,'+
             ' NUM_TECBIZ, NUM_MATRICULA_TECBIZ,'+
             ' COD_COMPRV_TECBIZ, COD_PLANO_SAUDE, VLR_PLANO_SAUDE,'+
             ' COD_COMPRV_PL_SAUDE,'+
             ' NUM_BANCO, DES_BANCO, NUM_AGENCIA, DES_AGENCIA, NUM_CONTA,'+
             ' NUM_CONTRATO, NUM_MESES_CONTRATO,'+
             ' BLOB_CONTRATO_MOVEIS, IND_LIBERADO,'+
             ' BLOB_RENOVACOES, NUM_CONTRATO_BENS,'+
             ' LOC_W_CONTRATO, LOC_W_ALTER_CONTRATUAL, LOC_W_LOC_BENS,'+
             ' VLR_PAGTO_MINIMO, VLR_CAUCAO, PER_LOCADOR, PER_COMISSAO_SUPERVISOR,'+
             ' PER_COMISSAO, PER_EXTRA_ANO,'+
             ' IND_SID_NIVELTABELA, TIP_SID_COMISSAO, IND_SID_TABELAPROC, VLR_SID_QUOTA,'+
             ' TIP_PESSOA, IND_ATIVO, USU_INCLUI';

             Try
               StrToDate(EdtDta_CadProfDtaNasc.Text);
               MySql:=MySql+', DTA_NASCIMENTO';
             Except
             End;

             Try
               StrToDate(EdtDt_CadProfIniContrato.Text);
               MySql:=MySql+', DTA_INI_CONTRATO';
             Except
             End;

             Try
               StrToDate(EdtDt_CadProfFimContrato.Text);
               MySql:=MySql+', DTA_FIM_CONTRATO';
             Except
             End;

             Try
               StrToDate(EdtDt_CadProfIniRenovacao.Text);
               MySql:=MySql+', DTA_INI_RENOVACAO';
             Except
             End;

             Try
               StrToDate(EdtDt_CadProfFimRenovacao.Text);
               MySql:=MySql+', DTA_FIM_RENOVACAO';
             Except
             End;

             MySql:=MySql+')'+

             ' Values ('+
             ' :COD_LOJA, :COD_PROFISSIONAL, :DES_PROFISSIONAL, :DES_APELIDO,'+
             ' :NUM_CPF, :NUM_RG, :BLOB_FOTO, :NUM_CEP, :DES_ENDERECO,'+
             ' :NUM_ENDERECO, :CPL_ENDERECO, :DES_BAIRRO, :COD_MUNICIPIO_IBGE,'+
             ' :DES_MUNICIPIO, :COD_ESTADO_IBGE, :DES_UF, :DES_ESTADO, :BLOB_LOCALIZACOES,'+
             ' :BLOB_OBS, :NUM_ALVARA_LOCAL, :NUM_SINDICATO, :IND_TAXA_SINDICATO,'+
             ' :VLR_TAXA_SINDICATO, :COD_COMPRV_SINDICATO, :IND_TAXA_NAOSOCIO,'+
             ' :VLR_TAXA_NAOSOCIO, :COD_COMPRV_NAOSOCIO,'+
             ' :NUM_INSS, :PER_INSS, :IND_COBRA_INSS, :SIT_PREVIDENCIARIA, :COD_COMPRV_INSS,'+
             ' :NUM_TECBIZ, :NUM_MATRICULA_TECBIZ,'+
             ' :COD_COMPRV_TECBIZ, :COD_PLANO_SAUDE, :VLR_PLANO_SAUDE,'+
             ' :COD_COMPRV_PL_SAUDE,'+
             ' :NUM_BANCO, :DES_BANCO, :NUM_AGENCIA, :DES_AGENCIA, :NUM_CONTA,'+
             ' :NUM_CONTRATO, :NUM_MESES_CONTRATO,'+
             ' :BLOB_CONTRATO_MOVEIS, :IND_LIBERADO,'+
             ' :BLOB_RENOVACOES, :NUM_CONTRATO_BENS,'+
             ' :LOC_W_CONTRATO, :LOC_W_ALTER_CONTRATUAL, :LOC_W_LOC_BENS,'+
             ' :VLR_PAGTO_MINIMO, :VLR_CAUCAO, :PER_LOCADOR, :PER_COMISSAO_SUPERVISOR,'+
             ' :PER_COMISSAO, :PER_EXTRA_ANO,'+
             ' :IND_SID_NIVELTABELA, :TIP_SID_COMISSAO, :IND_SID_TABELAPROC, :VLR_SID_QUOTA,'+
             ' :TIP_PESSOA, :IND_ATIVO, :USU_INCLUI';

             Try
               StrToDate(EdtDta_CadProfDtaNasc.Text);
               MySql:=MySql+', :DTA_NASCIMENTO';
             Except
             End;

             Try
               StrToDate(EdtDt_CadProfIniContrato.Text);
               MySql:=MySql+', :DTA_INI_CONTRATO';
             Except
             End;

             Try
               StrToDate(EdtDt_CadProfFimContrato.Text);
               MySql:=MySql+', :DTA_FIM_CONTRATO';
             Except
             End;

             Try
               StrToDate(EdtDt_CadProfIniRenovacao.Text);
               MySql:=MySql+', :DTA_INI_RENOVACAO';
             Except
             End;

             Try
               StrToDate(EdtDt_CadProfFimRenovacao.Text);
               MySql:=MySql+', :DTA_FIM_RENOVACAO';
             Except
             End;

             MySql:=MySql+')'
    End; // If DMSalao.CDS_Profissionais.State=dsInsert Then

    If DMSalao.CDS_Profissionais.State=dsEdit Then
    Begin
      MySql:=' UPDATE SAL_PROFISSIONAIS SET'+

             ' DES_PROFISSIONAL=:DES_PROFISSIONAL'+
             ', DES_APELIDO=:DES_APELIDO'+
             ', NUM_CPF=:NUM_CPF'+
             ', NUM_RG=:NUM_RG'+
             ', BLOB_FOTO=:BLOB_FOTO'+
             ', NUM_CEP=:NUM_CEP'+
             ', DES_ENDERECO=:DES_ENDERECO'+
             ', NUM_ENDERECO=:NUM_ENDERECO'+
             ', CPL_ENDERECO=:CPL_ENDERECO'+
             ', DES_BAIRRO=:DES_BAIRRO'+
             ', COD_MUNICIPIO_IBGE=:COD_MUNICIPIO_IBGE'+
             ', DES_MUNICIPIO=:DES_MUNICIPIO'+
             ', COD_ESTADO_IBGE=:COD_ESTADO_IBGE'+
             ', DES_UF=:DES_UF'+
             ', DES_ESTADO=:DES_ESTADO'+
             ', BLOB_LOCALIZACOES=:BLOB_LOCALIZACOES'+
             ', BLOB_OBS=:BLOB_OBS'+
             ', NUM_ALVARA_LOCAL=:NUM_ALVARA_LOCAL'+
             ', NUM_SINDICATO=:NUM_SINDICATO'+
             ', IND_TAXA_SINDICATO=:IND_TAXA_SINDICATO'+
             ', VLR_TAXA_SINDICATO=:VLR_TAXA_SINDICATO'+
             ', COD_COMPRV_SINDICATO=:COD_COMPRV_SINDICATO'+
             ', IND_TAXA_NAOSOCIO=:IND_TAXA_NAOSOCIO'+
             ', VLR_TAXA_NAOSOCIO=:VLR_TAXA_NAOSOCIO'+
             ', COD_COMPRV_NAOSOCIO=:COD_COMPRV_NAOSOCIO'+
             ', NUM_INSS=:NUM_INSS'+
             ', PER_INSS=:PER_INSS'+
             ', IND_COBRA_INSS=:IND_COBRA_INSS'+
             ', SIT_PREVIDENCIARIA=:SIT_PREVIDENCIARIA'+ 
             ', COD_COMPRV_INSS=:COD_COMPRV_INSS'+
             ', NUM_TECBIZ=:NUM_TECBIZ'+
             ', NUM_MATRICULA_TECBIZ=:NUM_MATRICULA_TECBIZ'+
             ', COD_COMPRV_TECBIZ=:COD_COMPRV_TECBIZ'+
             ', COD_PLANO_SAUDE=:COD_PLANO_SAUDE'+
             ', VLR_PLANO_SAUDE=:VLR_PLANO_SAUDE'+
             ', COD_COMPRV_PL_SAUDE=:COD_COMPRV_PL_SAUDE'+
             ', NUM_BANCO=:NUM_BANCO'+
             ', DES_BANCO=:DES_BANCO'+
             ', NUM_AGENCIA=:NUM_AGENCIA'+
             ', DES_AGENCIA=:DES_AGENCIA'+
             ', NUM_CONTA=:NUM_CONTA'+
             ', NUM_CONTRATO=:NUM_CONTRATO'+
             ', NUM_MESES_CONTRATO=:NUM_MESES_CONTRATO'+
             ', BLOB_CONTRATO_MOVEIS=:BLOB_CONTRATO_MOVEIS'+
             ', IND_LIBERADO=:IND_LIBERADO'+
             ', BLOB_RENOVACOES=:BLOB_RENOVACOES'+
             ', NUM_CONTRATO_BENS=:NUM_CONTRATO_BENS'+
             ', LOC_W_CONTRATO=:LOC_W_CONTRATO'+
             ', LOC_W_ALTER_CONTRATUAL=:LOC_W_ALTER_CONTRATUAL'+
             ', LOC_W_LOC_BENS=:LOC_W_LOC_BENS'+
             ', VLR_PAGTO_MINIMO=:VLR_PAGTO_MINIMO'+
             ', VLR_CAUCAO=:VLR_CAUCAO'+
             ', PER_LOCADOR=:PER_LOCADOR'+
             ', PER_COMISSAO_SUPERVISOR=:PER_COMISSAO_SUPERVISOR'+
             ', PER_COMISSAO=:PER_COMISSAO'+
             ', PER_EXTRA_ANO=:PER_EXTRA_ANO'+
             ', IND_SID_NIVELTABELA=:IND_SID_NIVELTABELA'+
             ', TIP_SID_COMISSAO=:TIP_SID_COMISSAO'+
             ', IND_SID_TABELAPROC=:IND_SID_TABELAPROC'+
             ', VLR_SID_QUOTA=:VLR_SID_QUOTA'+
             ', TIP_PESSOA=:TIP_PESSOA'+
             ', IND_ATIVO=:IND_ATIVO'+

             ', USU_ALTERA=:USU_ALTERA'+
             ', DTA_ALTERA=current_timestamp';


             Try
               StrToDate(EdtDta_CadProfDtaNasc.Text);
               MySql:=MySql+', DTA_NASCIMENTO=:DTA_NASCIMENTO';
             Except
               MySql:=MySql+', DTA_NASCIMENTO=NULL';
             End;

             Try
               StrToDate(EdtDt_CadProfIniContrato.Text);
               MySql:=MySql+', DTA_INI_CONTRATO=:DTA_INI_CONTRATO';
             Except
               MySql:=MySql+', DTA_INI_CONTRATO=NULL';
             End;

             Try
               StrToDate(EdtDt_CadProfFimContrato.Text);
               MySql:=MySql+', DTA_FIM_CONTRATO=:DTA_FIM_CONTRATO';
             Except
               MySql:=MySql+', DTA_FIM_CONTRATO=NULL';
             End;

             Try
               StrToDate(EdtDt_CadProfIniRenovacao.Text);
               MySql:=MySql+', DTA_INI_RENOVACAO=:DTA_INI_RENOVACAO';
             Except
               MySql:=MySql+', DTA_INI_RENOVACAO=NULL';
             End;

             Try
               StrToDate(EdtDt_CadProfFimRenovacao.Text);
               MySql:=MySql+', DTA_FIM_RENOVACAO=:DTA_FIM_RENOVACAO';
             Except
               MySql:=MySql+', DTA_FIM_RENOVACAO=NULL';
             End;

             MySql:=MySql+' WHERE COD_LOJA='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
                          ' AND  COD_PROFISSIONAL='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
    End; // If DMSalao.CDS_Profissionais.State=dsEdit Then
    DMBelShop.SQLQuery1.Close;
    DMBelShop.SQLQuery1.SQL.Clear;
    DMBelShop.SQLQuery1.SQL.Add(MySql);

    If DMSalao.CDS_Profissionais.State=dsInsert Then
    Begin
      DMBelShop.SQLQuery1.Params.ParamByName('COD_LOJA').AsString:=
                                     DMSalao.CDS_ProfissionaisCOD_LOJA.AsString;
      DMBelShop.SQLQuery1.Params.ParamByName('COD_PROFISSIONAL').AsString:=
                             DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString;
      DMBelShop.SQLQuery1.Params.ParamByName('USU_INCLUI').AsString:=Cod_Usuario;
    End;

    If DMSalao.CDS_Profissionais.State=dsEdit Then
    Begin
      DMBelShop.SQLQuery1.Params.ParamByName('USU_ALTERA').AsString:=Cod_Usuario;
    End;

    DMBelShop.SQLQuery1.Params.ParamByName('DES_PROFISSIONAL').AsString:=
                             DMSalao.CDS_ProfissionaisDES_PROFISSIONAL.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('DES_APELIDO').AsString:=
                                  DMSalao.CDS_ProfissionaisDES_APELIDO.AsString;

    Try
      StrToDate(EdtDta_CadProfDtaNasc.Text);
      DMBelShop.SQLQuery1.Params.ParamByName('DTA_NASCIMENTO').AsDate:=EdtDta_CadProfDtaNasc.Date;
    Except
    End;

    DMBelShop.SQLQuery1.Params.ParamByName('NUM_CPF').AsString:=Me_CadProfCPF.Text;
    DMBelShop.SQLQuery1.Params.ParamByName('NUM_RG').AsString:=Dbe_CadProfIdentidade.Text;

    // Foto do Profissional -----------------------------------------
    Foto:=TMemoryStream.Create;
    If IM_CadProfFoto.Picture.Graphic<>nil Then
    Begin
      IM_CadProfFoto.Picture.Graphic.SaveToStream(Foto);
    End;
    DMBelShop.SQLQuery1.Params.ParamByName('BLOB_FOTO').LoadFromStream(foto, ftGraphic);
    Foto.Free;
    Foto:=nil;

    DMBelShop.SQLQuery1.Params.ParamByName('NUM_CEP').AsString:=Me_CadProfCEP.Text;
    DMBelShop.SQLQuery1.Params.ParamByName('DES_ENDERECO').AsString:=
                                 DMSalao.CDS_ProfissionaisDES_ENDERECO.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('NUM_ENDERECO').AsString:=
                                 DMSalao.CDS_ProfissionaisNUM_ENDERECO.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('CPL_ENDERECO').AsString:=
                                 DMSalao.CDS_ProfissionaisCPL_ENDERECO.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('DES_BAIRRO').AsString:=
                                   DMSalao.CDS_ProfissionaisDES_BAIRRO.AsString;

    If Trim(DMSalao.CDS_ProfissionaisCOD_MUNICIPIO_IBGE.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('COD_MUNICIPIO_IBGE').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('COD_MUNICIPIO_IBGE').AsString:=
                           DMSalao.CDS_ProfissionaisCOD_MUNICIPIO_IBGE.AsString;

    DMBelShop.SQLQuery1.Params.ParamByName('DES_MUNICIPIO').AsString:=
                                DMSalao.CDS_ProfissionaisDES_MUNICIPIO.AsString;

    If Trim(DMSalao.CDS_ProfissionaisCOD_ESTADO_IBGE.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('COD_ESTADO_IBGE').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('COD_ESTADO_IBGE').AsString:=
                              DMSalao.CDS_ProfissionaisCOD_ESTADO_IBGE.AsString;

    DMBelShop.SQLQuery1.Params.ParamByName('DES_UF').AsString:=
                                       DMSalao.CDS_ProfissionaisDES_UF.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('DES_ESTADO').AsString:=
                                   DMSalao.CDS_ProfissionaisDES_ESTADO.AsString;

    // BLOB_LOCALIZACOES --------------------------------------------
    mMemo.Lines.Clear;
    DMSalao.CDS_V_ProfFones.First;
    While Not DMSalao.CDS_V_ProfFones.Eof do
    Begin
      mMemo.Lines.Add('1;'+DMSalao.CDS_V_ProfFonesDes_Localizacao.AsString+
                       ';'+DMSalao.CDS_V_ProfFonesDes_DDD.AsString+
                       ';'+DMSalao.CDS_V_ProfFonesDes_Fone.AsString+';');

      DMSalao.CDS_V_ProfFones.Next;
    End; // While Not DMSalao.CDS_V_ProfFones.Eof do
    DMSalao.CDS_V_ProfFones.First;

    DMSalao.CDS_V_ProfEmail.First;
    While Not DMSalao.CDS_V_ProfEmail.Eof do
    Begin
      mMemo.Lines.Add('2;'+DMSalao.CDS_V_ProfEmailDes_Localizacao.AsString+
                       ';'+DMSalao.CDS_V_ProfEmailDes_Email.AsString+';');

      DMSalao.CDS_V_ProfEmail.Next;
    End; // While Not DMSalao.CDS_V_ProfEnail.Eof do
    DMSalao.CDS_V_ProfEmail.First;
    DMBelShop.SQLQuery1.Params.ParamByName('BLOB_LOCALIZACOES').AsMemo:=mMemo.Text;

    DMBelShop.SQLQuery1.Params.ParamByName('BLOB_OBS').AsBlob:=
                                     DMSalao.CDS_ProfissionaisBLOB_OBS.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('NUM_ALVARA_LOCAL').AsString:=
                             DMSalao.CDS_ProfissionaisNUM_ALVARA_LOCAL.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('NUM_SINDICATO').AsString:=
                                DMSalao.CDS_ProfissionaisNUM_SINDICATO.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('IND_TAXA_SINDICATO').AsString:=
                                               Ckb_CadProfTaxaSindicato.Caption;

    If Trim(DMSalao.CDS_ProfissionaisVLR_TAXA_SINDICATO.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('VLR_TAXA_SINDICATO').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('VLR_TAXA_SINDICATO').AsString:=
                           DMSalao.CDS_ProfissionaisVLR_TAXA_SINDICATO.AsString;

    DMBelShop.SQLQuery1.Params.ParamByName('COD_COMPRV_SINDICATO').AsString:=
                         DMSalao.CDS_ProfissionaisCOD_COMPRV_SINDICATO.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('IND_TAXA_NAOSOCIO').AsString:=
                                                Ckb_CadProfTaxaNaoSocio.Caption;

    If Trim(DMSalao.CDS_ProfissionaisVLR_TAXA_NAOSOCIO.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('VLR_TAXA_NAOSOCIO').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('VLR_TAXA_NAOSOCIO').AsString:=
                            DMSalao.CDS_ProfissionaisVLR_TAXA_NAOSOCIO.AsString;

    DMBelShop.SQLQuery1.Params.ParamByName('COD_COMPRV_NAOSOCIO').AsString:=
                          DMSalao.CDS_ProfissionaisCOD_COMPRV_NAOSOCIO.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('NUM_INSS').AsString:=
                                     DMSalao.CDS_ProfissionaisNUM_INSS.AsString;

    If Trim(DMSalao.CDS_ProfissionaisPER_INSS.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('PER_INSS').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('PER_INSS').AsString:=
                                     DMSalao.CDS_ProfissionaisPER_INSS.AsString;

    DMBelShop.SQLQuery1.Params.ParamByName('IND_COBRA_INSS').AsString:=
                                                  Ckb_CadProfINSSCobrar.Caption;

    If Cbx_CadProfSitPrevidencia.ItemIndex<0 Then
     DMBelShop.SQLQuery1.Params.ParamByName('SIT_PREVIDENCIARIA').AsInteger:=0
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('SIT_PREVIDENCIARIA').AsInteger:=
                                            Cbx_CadProfSitPrevidencia.ItemIndex;

    DMBelShop.SQLQuery1.Params.ParamByName('COD_COMPRV_INSS').AsString:=
                              DMSalao.CDS_ProfissionaisCOD_COMPRV_INSS.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('NUM_TECBIZ').AsString:=
                                   DMSalao.CDS_ProfissionaisNUM_TECBIZ.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('NUM_MATRICULA_TECBIZ').AsString:=
                         DMSalao.CDS_ProfissionaisNUM_MATRICULA_TECBIZ.AsString;

    // Atualiza Tab_Auxiliar - Codigos TecBiz ==================================
    s:='TAB_AUXILIAR 10 TECBIZ - DELETE';
    MySqlDML:=' DELETE FROM TAB_AUXILIAR t'+
              ' WHERE t.tip_aux=10'+
              ' AND   t.des_aux='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+ // Cod_Loja
              ' AND   t.des_aux1='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString); // Cod_Profissional
    DMBelShop.SQLC.Execute(MySqlDML,nil,nil);

    If Trim(DMSalao.CDS_ProfissionaisNUM_MATRICULA_TECBIZ.AsString)<>'' Then
    Begin
      s:='TAB_AUXILIAR 10 TECBIZ - INSERT';
      MySqlDML:=' INSERT INTO TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1)'+
                ' Values (10,'+ // Tip_Aux
                QuotedStr(DMSalao.CDS_ProfissionaisNUM_MATRICULA_TECBIZ.AsString)+', '+ // Código TecBiz
                QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+', '+ // Cod_Loja
                QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+ // Código Profissional
                ')';
      DMBelShop.SQLC.Execute(MySqlDML,nil,nil);
    End; // If Trim(DMSalao.CDS_ProfissionaisNUM_MATRICULA_TECBIZ.AsString)<>'' Then

    DMBelShop.SQLQuery1.Params.ParamByName('COD_COMPRV_TECBIZ').AsString:=
                            DMSalao.CDS_ProfissionaisCOD_COMPRV_TECBIZ.AsString;

    If Trim(DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('COD_PLANO_SAUDE').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('COD_PLANO_SAUDE').AsString:=
                              DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsString;

    If Trim(DMSalao.CDS_ProfissionaisVLR_PLANO_SAUDE.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('VLR_PLANO_SAUDE').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('VLR_PLANO_SAUDE').AsString:=
                              DMSalao.CDS_ProfissionaisVLR_PLANO_SAUDE.AsString;

    DMBelShop.SQLQuery1.Params.ParamByName('COD_COMPRV_PL_SAUDE').AsString:=
                          DMSalao.CDS_ProfissionaisCOD_COMPRV_PL_SAUDE.AsString;

    // DEPENDENTES --------------------------------------------------
    DMSalao.CDS_V_Dependentes.Filtered:=False;
    DMSalao.CDS_V_Dependentes.First;
    While Not DMSalao.CDS_V_Dependentes.Eof do
    Begin
       sNumSeqDep:=DMSalao.CDS_V_DependentesNum_Seq.AsString;

       MySql:='';
       If (Trim(sNumSeqDep)='') and (Trim(DMSalao.CDS_V_DependentesInd_Exc.AsString)='') Then
        Begin
         s:='Insere  Dependentes';
          MySql:=' Insert into PS_DEPENDENTES_PS (NUM_SEQ, TP_PESSOA, COD_LOJA,'+
                 ' COD_PESSOA, DES_DEPENDENTE, DES_PARENTESCO, DTA_NASCIMENTO,'+
                 ' VLR_PLANO_SAUDE)'+
                 ' Values ('+
                 '(SELECT GEN_ID(GEN_DEPENDENTES_PS,1) FROM RDB$DATABASE), '+ // NUM_SEQ
                 QuotedStr('1')+', '+ // TP_PESSOA
                 QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+', '+ // COD_LOJA
                 QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+', '+ // COD_PESSOA
                 QuotedStr(Trim(DMSalao.CDS_V_DependentesDes_Dependente.AsString))+', '+ // DES_DEPENDENTE
                 QuotedStr(Trim(DMSalao.CDS_V_DependentesDes_Parentesco.AsString))+', '+ // DES_PARENTESCO
                 QuotedStr(Trim(F_troca('/','.',F_troca('-','.',DMSalao.CDS_V_DependentesDta_Nascimento.AsString))))+', '+ // DTA_NASCIMENTO,
                 QuotedStr(Trim(F_troca(',','.',DMSalao.CDS_V_DependentesVlr_PlanoSaude.AsString)))+')'; // VLR_PLANO_SAUDE
        End
       Else If Trim(DMSalao.CDS_V_DependentesInd_Exc.AsString)='' Then
        Begin
         s:='Update Dependentes';
          MySql:=' UPDATE PS_DEPENDENTES_PS dp'+
                 '  SET dp.des_dependente='+QuotedStr(DMSalao.CDS_V_DependentesDes_Dependente.AsString)+
                 ', dp.des_parentesco='+QuotedStr(DMSalao.CDS_V_DependentesDes_Parentesco.AsString)+
                 ', dp.dta_nascimento='+QuotedStr(Trim(F_troca('/','.',F_troca('-','.',DMSalao.CDS_V_DependentesDta_Nascimento.AsString))))+
                 ', dp.vlr_plano_saude='+QuotedStr(f_Troca(',','.',DMSalao.CDS_V_DependentesVlr_PlanoSaude.AsString))+
                 ' WHERE dp.Num_Seq='+sNumSeqDep;
        End
       Else // If (Trim(sNumSeqDep)='') and (Trim(DMSalao.CDS_V_DependentesInd_Exc.AsString)='') Then
        Begin

          If Trim(sNumSeqDep)<>'' Then
          Begin
            s:='Delete Dependentes';
            MySql:=' DELETE FROM PS_DEPENDENTES_PS dp'+
                   ' WHERE dp.Num_Seq='+sNumSeqDep;
          End; // If Trim(sNumSeqDep)<>'' Then
        End; // If (Trim(sNumSeqDep)='') and (Trim(DMSalao.CDS_V_DependentesInd_Exc.AsString)='') Then

       sgMensagem:='MySql';
       If MySql<>'' Then
        DMBelShop.SQLC.Execute(MySql,nil,nil);

      DMSalao.CDS_V_Dependentes.Next;
    End; // While Not DMSalao.CDS_V_Dependentes.Eof do
    DMSalao.CDS_V_Dependentes.Filtered:=True;
    DMSalao.CDS_V_Dependentes.First;

    // Numero de Dependentes ===================================================
    s:='TAB_AUXILIAR 6 - DELETE';
    MySql:=' Delete FROM TAB_AUXILIAR dp'+
           ' WHERE dp.tip_aux=6'+
           ' AND   dp.cod_aux='+DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString+
           ' And   dp.des_aux='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString);
       sgMensagem:='MySql';
    DMBelShop.SQLC.Execute(MySql,nil,nil);
    Screen.Cursor:=crAppStart;

    If DMSalao.CDS_V_Dependentes.RecordCount>0 Then
    Begin
    s:='TAB_AUXILIAR 6 - insert';
      MySql:=' INSERT INTO TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, VLR_AUX)'+
             ' Values ('+
             QuotedStr('6')+', '+
             DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString+', '+
             QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+', '+
             QuotedStr(IntToStr(DMSalao.CDS_V_Dependentes.RecordCount))+')';
       sgMensagem:='MySql';
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End; // If DMSalao.CDS_V_Dependentes.RecordCount>0 Then

    If Trim(DMSalao.CDS_ProfissionaisNUM_BANCO.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('NUM_BANCO').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('NUM_BANCO').AsString:=
                                    DMSalao.CDS_ProfissionaisNUM_BANCO.AsString;

    DMBelShop.SQLQuery1.Params.ParamByName('DES_BANCO').AsString:=
                                    DMSalao.CDS_ProfissionaisDES_BANCO.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('NUM_AGENCIA').AsString:=
                                  DMSalao.CDS_ProfissionaisNUM_AGENCIA.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('DES_AGENCIA').AsString:=
                                  DMSalao.CDS_ProfissionaisDES_AGENCIA.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('NUM_CONTA').AsString:=
                                    DMSalao.CDS_ProfissionaisNUM_CONTA.AsString;

    If Trim(DMSalao.CDS_ProfissionaisNUM_CONTRATO.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('NUM_CONTRATO').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('NUM_CONTRATO').AsString:=
                                 DMSalao.CDS_ProfissionaisNUM_CONTRATO.AsString;

    Try
      StrToDate(EdtDt_CadProfIniContrato.Text);
      DMBelShop.SQLQuery1.Params.ParamByName('DTA_INI_CONTRATO').AsDate:=
                                                  EdtDt_CadProfIniContrato.Date;
    Except
    End;

    Try
      StrToDate(EdtDt_CadProfFimContrato.Text);
      DMBelShop.SQLQuery1.Params.ParamByName('DTA_FIM_CONTRATO').AsDate:=
                                                  EdtDt_CadProfFimContrato.Date;
    Except
    End;

    Try
      StrToDate(EdtDt_CadProfIniRenovacao.Text);
      DMBelShop.SQLQuery1.Params.ParamByName('DTA_INI_RENOVACAO').AsDate:=
                                                 EdtDt_CadProfIniRenovacao.Date;
    Except
    End;

    Try
      StrToDate(EdtDt_CadProfFimRenovacao.Text);
      DMBelShop.SQLQuery1.Params.ParamByName('DTA_FIM_RENOVACAO').AsDate:=
                                                 EdtDt_CadProfFimRenovacao.Date;
    Except
    End;

    If Trim(DMSalao.CDS_ProfissionaisNUM_MESES_CONTRATO.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('NUM_MESES_CONTRATO').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('NUM_MESES_CONTRATO').AsString:=
                           DMSalao.CDS_ProfissionaisNUM_MESES_CONTRATO.AsString;

    If Trim(DMSalao.CDS_ProfissionaisNUM_CONTRATO_BENS .AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('NUM_CONTRATO_BENS').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('NUM_CONTRATO_BENS').AsString:=
                           DMSalao.CDS_ProfissionaisNUM_CONTRATO_BENS .AsString;

    If Trim(DMSalao.CDS_ProfissionaisPER_LOCADOR.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('PER_LOCADOR').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('PER_LOCADOR').AsString:=
                                  DMSalao.CDS_ProfissionaisPER_LOCADOR.AsString;

    If Trim(DMSalao.CDS_ProfissionaisPER_COMISSAO_SUPERVISOR.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('PER_COMISSAO_SUPERVISOR').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('PER_COMISSAO_SUPERVISOR').AsString:=
                      DMSalao.CDS_ProfissionaisPER_COMISSAO_SUPERVISOR.AsString;

    If Trim(DMSalao.CDS_ProfissionaisPER_COMISSAO.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('PER_COMISSAO').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('PER_COMISSAO').AsString:=
                                 DMSalao.CDS_ProfissionaisPER_COMISSAO.AsString;

    If Trim(DMSalao.CDS_ProfissionaisPER_EXTRA_ANO.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('PER_EXTRA_ANO').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('PER_EXTRA_ANO').AsString:=
                                DMSalao.CDS_ProfissionaisPER_EXTRA_ANO.AsString;

    If Trim(DMSalao.CDS_ProfissionaisVLR_PAGTO_MINIMO.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('VLR_PAGTO_MINIMO').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('VLR_PAGTO_MINIMO').AsString:=
                             DMSalao.CDS_ProfissionaisVLR_PAGTO_MINIMO.AsString;

    If Trim(DMSalao.CDS_ProfissionaisVLR_CAUCAO.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('VLR_CAUCAO').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('VLR_CAUCAO').AsString:=
                                   DMSalao.CDS_ProfissionaisVLR_CAUCAO.AsString;

    // BLOB_CONTRATO_MOVEIS -----------------------------------------
    DMBelShop.SQLQuery1.Params.ParamByName('BLOB_CONTRATO_MOVEIS').AsBlob:=
                         DMSalao.CDS_ProfissionaisBLOB_CONTRATO_MOVEIS.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('BLOB_RENOVACOES').AsBlob:=
                              DMSalao.CDS_ProfissionaisBLOB_RENOVACOES.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('LOC_W_CONTRATO').AsString:=
                               DMSalao.CDS_ProfissionaisLOC_W_CONTRATO.AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('LOC_W_ALTER_CONTRATUAL').AsString:=
                      DMSalao.CDS_ProfissionaisLOC_W_ALTER_CONTRATUAL .AsString;
    DMBelShop.SQLQuery1.Params.ParamByName('LOC_W_LOC_BENS').AsString:=
                               DMSalao.CDS_ProfissionaisLOC_W_LOC_BENS.AsString;

    If Cbx_CadProfTpPessoa.ItemIndex=0 Then
     DMBelShop.SQLQuery1.Params.ParamByName('TIP_PESSOA').AsString:='P';
    If Cbx_CadProfTpPessoa.ItemIndex=1 Then
     DMBelShop.SQLQuery1.Params.ParamByName('TIP_PESSOA').AsString:='V';

    bAtivo:=(Ckb_CadProfAtivo.Caption='SIM');
    DMBelShop.SQLQuery1.Params.ParamByName('IND_ATIVO').AsString:=Ckb_CadProfAtivo.Caption;

    If Trim(DMSalao.CDS_ProfissionaisIND_SID_NIVELTABELA.AsString)='' Then
     DMBelShop.SQLQuery1.Params.ParamByName('IND_SID_NIVELTABELA').AsString:='0'
    Else
     DMBelShop.SQLQuery1.Params.ParamByName('IND_SID_NIVELTABELA').AsString:=
                          DMSalao.CDS_ProfissionaisIND_SID_NIVELTABELA.AsString;

    DMBelShop.SQLQuery1.Params.ParamByName('TIP_SID_COMISSAO').AsString:='';
    If Rb_CadProfSidPercentuais.Checked Then DMBelShop.SQLQuery1.Params.ParamByName('TIP_SID_COMISSAO').AsString:='P';
    If Rb_CadProfSidDescontos.Checked   Then DMBelShop.SQLQuery1.Params.ParamByName('TIP_SID_COMISSAO').AsString:='D';
    If Rb_CadProfSidListaPreco.Checked  Then DMBelShop.SQLQuery1.Params.ParamByName('TIP_SID_COMISSAO').AsString:='L';

    DMBelShop.SQLQuery1.Params.ParamByName('IND_SID_TABELAPROC').AsString:='';
    If Rb_CadProfSidTabela0.Checked Then DMBelShop.SQLQuery1.Params.ParamByName('IND_SID_TABELAPROC').AsString:='0';
    If Rb_CadProfSidTabela1.Checked Then DMBelShop.SQLQuery1.Params.ParamByName('IND_SID_TABELAPROC').AsString:='1';
    If Rb_CadProfSidTabela2.Checked Then DMBelShop.SQLQuery1.Params.ParamByName('IND_SID_TABELAPROC').AsString:='2';
    If Rb_CadProfSidTabela3.Checked Then DMBelShop.SQLQuery1.Params.ParamByName('IND_SID_TABELAPROC').AsString:='3';
    If Rb_CadProfSidTabela4.Checked Then DMBelShop.SQLQuery1.Params.ParamByName('IND_SID_TABELAPROC').AsString:='4';
    If Rb_CadProfSidTabela5.Checked Then DMBelShop.SQLQuery1.Params.ParamByName('IND_SID_TABELAPROC').AsString:='5';
    If Rb_CadProfSidTabela6.Checked Then DMBelShop.SQLQuery1.Params.ParamByName('IND_SID_TABELAPROC').AsString:='6';
    If Rb_CadProfSidTabela7.Checked Then DMBelShop.SQLQuery1.Params.ParamByName('IND_SID_TABELAPROC').AsString:='7';
    If Rb_CadProfSidTabela8.Checked Then DMBelShop.SQLQuery1.Params.ParamByName('IND_SID_TABELAPROC').AsString:='8';

    If DMSalao.CDS_ProfissionaisVLR_SID_QUOTA.AsString='' Then
     DMSalao.CDS_ProfissionaisVLR_SID_QUOTA.AsCurrency:=0.00;

    DMBelShop.SQLQuery1.Params.ParamByName('VLR_SID_QUOTA').AsString:=
                                DMSalao.CDS_ProfissionaisVLR_SID_QUOTA.AsString;

    DMBelShop.SQLQuery1.Params.ParamByName('IND_LIBERADO').AsString:=Ckb_CadProfLiberdo.Caption;
    mMemo.Free;
    mMemo:=Nil;

    sCodProf:=DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString;

    sgMensagem:='SQLQuery1';
    DMBelShop.SQLQuery1.ExecSQL;

    If (DMSalao.CDS_Profissionais.State=dsInsert) Or (DMSalao.CDS_Profissionais.State=dsEdit) Then
     DMSalao.CDS_Profissionais.CancelUpdates;

    // Acerta Periodo de Dias para Processamento
    s:='Acerta Periodo de Dias para Processamento - SELECT';
    MySql:=' SELECT p.dia_ini_comissao_prof, p.dia_fim_comissao_prof'+
           ' FROM parametros p';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    // Acerta Periodo de Calculo de Comissão de Profissionais ================
    s:='Acerta Periodo de Dias para Processamento - Update';
    MySql:=' UPDATE SAL_PROFISSIONAIS'+
           ' Set dia_periodo_ini_com='+QuotedStr(
           DMBelShop.CDS_BuscaRapida.FieldByName('dia_ini_comissao_prof').AsString)+
           ' , dia_periodo_fim_com='+QuotedStr(
           DMBelShop.CDS_BuscaRapida.FieldByName('dia_fim_comissao_prof').AsString)+
           ' Where Tip_Pessoa=''P''';
       sgMensagem:='MySql';
    DMBelShop.SQLC.Execute(MySql,nil,nil);
    Screen.Cursor:=crAppStart;

    DMBelShop.CDS_BuscaRapida.Close;

    // Fecha Transacao ===========================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin

      If (DMSalao.CDS_Profissionais.State=dsInsert) Or (DMSalao.CDS_Profissionais.State=dsEdit) Then
       DMSalao.CDS_Profissionais.CancelUpdates;

      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      Bt_CadProfAbandonarClick(Self);

      MessageBox(Handle, pChar('Mensagem de erro (ODIR) do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try

  Screen.Cursor:=crAppStart;

  Bt_CadProfAbandonarClick(Self);
  Screen.Cursor:=crAppStart;

  If bAtivo Then
   Cbx_Situacao.ItemIndex:=0
  Else
   Cbx_Situacao.ItemIndex:=1;

  Cbx_SituacaoClick(Self);
  Screen.Cursor:=crAppStart;

  ApresCadProfissional(True);
  Screen.Cursor:=crAppStart;

  bgSiga:=False;
  If DMSalao.CDS_Profissionais.Locate('Cod_Profissional',sCodProf,[]) Then
   bgSiga:=True;
  Refresh;

  // Verifica Inclusão no SIDICOM ==============================================
  If (DMSalao.CDS_ProfissionaisIND_LIBERADO.AsString='SIM') And (bgSiga)Then
  Begin
    If msg('Deseja INCLUIR/ALTERAR'+cr+cr+'o Profissional no SIDICOM ??','C')=1 Then
    Begin
      DMBelShop.CDS_Consistencias.Close;
      DMBelShop.SDS_Consistencias.Params.ParamByName('Codigo').AsInteger:=1;
      DMBelShop.CDS_Consistencias.Open;
      If not ConsisteDadosSidicom(True) Then
      Begin
        Screen.Cursor:=crDefault;
        DMBelShop.CDS_Consistencias.Close;
        Exit;
      End;
      DMBelShop.CDS_Consistencias.Close;

      // Inclui no SIDICOM -----------------------------------------
      If Not AtualizaProfissionalSIDICOM('I') Then
      Begin
        DMBelShop.CDS_Consistencias.Close;
        DMBelShop.SDS_Consistencias.Params.ParamByName('Codigo').AsInteger:=1;
        DMBelShop.CDS_Consistencias.Open;
        If not ConsisteDadosSidicom(True) Then
        Begin
          DMBelShop.CDS_Consistencias.Close;
          Screen.Cursor:=crDefault;
          Exit;
        End;
        DMBelShop.CDS_Consistencias.Close;

        // Altera no SIDICOM -----------------------------------------
        If Not AtualizaProfissionalSIDICOM('A') Then
        Begin
          msg('ERRO ao ATUALIZAR O Profissional !!','A');
        End;
      End; // If Not AtualizaProfissionalSIDICOM('I') Then
    End; // If msg('Deseja Incluir o Profissional no SIDICOM ??','C')=1 Then
  End; // If (DMSalao.CDS_ProfissionaisIND_LIBERADO.AsString='SIM') And (bgSiga)Then

  If bgIncluidoSIDICOM Then
  Begin
    // Marca o Profissional com Incluido no Sidicom
    If DMBelShop.SQLC.InTransaction Then
    DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao ===========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
     Screen.Cursor:=crAppStart;

     MySql:=' Update SAL_PROFISSIONAIS'+
            ' Set IND_CAD_SIDICOM='+QuotedStr('SIM')+
            ' Where COD_LOJA='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
            ' And COD_PROFISSIONAL='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
     DMBelShop.SQLC.Execute(MySql,nil,nil);

     // Atualiza Transacao =======================================
     DMBelShop.SQLC.Commit(TD);
     Screen.Cursor:=crDefault;

     // Apresenta Profissionais ==================================
     Cbx_SituacaoClick(Self);
     ApresCadProfissional(True);
     DMSalao.CDS_Profissionais.Locate('Cod_Profissional',sCodProf,[]);
     Refresh;
    Except
     on e : Exception do
     Begin
       // Abandona Transacao =====================================
       DMBelShop.SQLC.Rollback(TD);
       Screen.Cursor:=crDefault;

       MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
     End; // on e : Exception do
    End; // Try
  End; // If bgIncluidoSIDICOM Then

  Screen.Cursor:=crDefault;
  Dbg_Profissionais.SetFocus;

//INSS
end;

procedure TFrmSalao.Bt_NovoClick(Sender: TObject);
Var
  sCodLoja, sCodigo, scodSIDICOM: String;
  MySql: String;
  b, bCodAuto: Boolean;
begin
  Dbg_Profissionais.SetFocus;
  OdirPanApres.Visible:=False;

  If (EdtCodLoja.Value=0) Or (Not DMSalao.CDS_Profissionais.Active) Then
  Begin
    msg('Informe a Loja !!','A');
    EdtCodLoja.SetFocus;
    Exit;
  End;

  sCodLoja:=FormatFloat('00',EdtCodLoja.AsInteger);

  bCodAuto:=True;
  if Application.MessageBox('Buscar Código Automático na Loja ??', 'ATENÇÃO !!', 36)=IdNo Then
   bCodAuto:=False;

  // Codigo Automático - Busca na Loja =========================================
  sCodigo:='';
  If bCodAuto Then
  Begin
    // Busca Código do Profissional na Loja ====================================
    OdirPanApres.Caption:='AGUARDE !! Buscando Código do Profissional na Loja: Bel_'+sCodLoja+'. OBS: Isto Poderá Levar Algum Tempo...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Visible:=True;
    Refresh;

    Screen.Cursor:=crAppStart;

    If Not BuscaNumeradoLoja('11', 'S', sCodLoja, sCodigo) Then
    Begin
      OdirPanApres.Visible:=False;
      msg(sgMensagem,'A');
      Exit;
    End;
  End; // If bCodAuto Then

  // Codigo Informado ==========================================================
  If Not bCodAuto Then
  Begin
    b:=True;
    While b do
    Begin
      If InputQuery('Informe o Código','',sCodigo) then
       Begin
         Try
           StrToInt(sCodigo);
           sCodigo:=FormatFloat('00',StrToInt(sCodigo));

           MySql:=' SELECT p.cod_profissional'+
                  ' FROM sal_profissionais p'+
                  ' WHERE p.cod_loja='+QuotedStr(sCodLoja)+
                  ' AND p.cod_profissional='+QuotedStr(sCodigo);
           DMBelShop.CDS_BuscaRapida.Close;
           DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
           DMBelShop.CDS_BuscaRapida.Open;
           bCodAuto:=(Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString)<>'');
           DMBelShop.CDS_BuscaRapida.Close;

           If bCodAuto Then
            Begin
              msg('Código Já Existente !!','A')
            End
           Else
            Begin
              OdirPanApres.Caption:='AGUARDE !! Analisando Código Informado para Loja: Bel_'+sCodLoja+'. OBS: Isto Poderá Levar Algum Tempo...';
              OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
              OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
              OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
              OdirPanApres.Visible:=True;
              Refresh;
              If BuscaNumeradoLoja('11', 'N', sCodLoja, scodSIDICOM) Then
               Begin
                 OdirPanApres.Visible:=False;
                 If StrToInt(sCodigo)>=StrToInt(scodSIDICOM) Then
                  msg('Código Inválido para esta Loja !!','A')
                 Else
                  Break;
               End
              Else
               Begin
                 OdirPanApres.Visible:=False;
                 If msg('Loja: Bel_'+sCodLoja+' Não Conectada !!'+cr+cr+'Deseja Continuar ??','C')=2 Then
                 Begin
                   Exit;
                 End
                 Else
                 Begin
                   Break;
                 End;
               End;
            End;
         Except
           msg('Código Deve ser um Número Inteiro !!','A')
         End;
       End
      Else // If InputQuery('Informe o Código','',sCodigo) then
       Begin
         Exit;
       End; // If InputQuery('Informe o Código','',sCodigo) then
    End; // While b do
  End; // If Not bCodAuto Then

  // ===========================================================================
  // Abre Transação ============================================================
  // ===========================================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);

  Try
    // Insere Profissional =====================================================
    DMSalao.CDS_Profissionais.Insert;

    DMSalao.CDS_ProfissionaisCOD_LOJA.AsString:=FormatFloat('00',EdtCodLoja.AsInteger);
    DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString:=sCodigo;
    DMSalao.CDS_ProfissionaisIND_LIBERADO.AsString:='SIM';
    Ckb_CadProfLiberdo.Enabled:=True;

    DMSalao.CDS_ProfissionaisNUM_CONTRATO.AsInteger:=0;
    DMSalao.CDS_ProfissionaisNUM_CONTRATO_BENS.AsInteger:=0;

    DMSalao.CDS_ProfissionaisCOD_ESTADO_IBGE.AsInteger:=0;
    DMSalao.CDS_ProfissionaisCOD_MUNICIPIO_IBGE.AsInteger:=0;

    DMSalao.CDS_ProfissionaisVLR_CAUCAO.AsCurrency:=0.00;
    DMSalao.CDS_ProfissionaisVLR_PAGTO_MINIMO.AsCurrency:=0.00;
    DMSalao.CDS_ProfissionaisVLR_PLANO_SAUDE.AsCurrency:=0.00;
    DMSalao.CDS_ProfissionaisVLR_SID_QUOTA.AsCurrency:=0.00;
    DMSalao.CDS_ProfissionaisVLR_TAXA_NAOSOCIO.AsCurrency:=0.00;
    DMSalao.CDS_ProfissionaisVLR_TAXA_SINDICATO.AsCurrency:=0.00;

    DMSalao.CDS_ProfissionaisPER_COMISSAO.AsCurrency:=0.00;
    DMSalao.CDS_ProfissionaisPER_COMISSAO_SUPERVISOR.AsCurrency:=0.00;
    DMSalao.CDS_ProfissionaisPER_EXTRA_ANO.AsCurrency:=0.00;
    DMSalao.CDS_ProfissionaisPER_INSS.AsCurrency:=0.00;
    DMSalao.CDS_ProfissionaisIND_COBRA_INSS.AsString:='NAO';
    DMSalao.CDS_ProfissionaisSIT_PREVIDENCIARIA.AsInteger:=0;
    DMSalao.CDS_ProfissionaisPER_LOCADOR.AsCurrency:=0.00;

    DMSalao.CDS_ProfissionaisVLR_SID_QUOTA.AsCurrency:=0.00;
    DMSalao.CDS_ProfissionaisNUM_BANCO.AsInteger:=0;
    DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsString:='0';
    DMSalao.CDS_ProfissionaisIND_ATIVO.AsString:='SIM';
    DMSalao.CDS_ProfissionaisIND_CAD_SIDICOM.AsString:='NAO';
    DMSalao.CDS_ProfissionaisVLR_SID_QUOTA.AsCurrency:=0.00;
    DMSalao.CDS_ProfissionaisUSU_INCLUI.AsString:=Cod_Usuario;

    // Dados dos Profissional ====================================================
    DadosProfissional;
  Except
    On e : Exception do
    Begin
      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      DateSeparator:='/';
      DecimalSeparator:=',';

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);

      If (DMSalao.CDS_Profissionais.State=dsInsert) Or (DMSalao.CDS_Profissionais.State=dsEdit) Then
       DMSalao.CDS_Profissionais.CancelUpdates;

      If DMBelShop.SQLC.InTransaction Then
       DMBelShop.SQLC.Rollback(TD);

      exit;
    End;
  End; // Try

  // Incluir ===================================================================
  Bt_CadProfDML.Caption:='Incluir';
  Bt_CadProfDML.Tag:=1;
  BloqueioBotoes(FrmSalao, DMBelShop.CDS_Seguranca, igTagPermissao, Des_Login, bgInd_Admin);

  bgCFPLiberado:=False; // Libera para verificaçao de Duplicidade de CPF

  ApresCadProfissional(False);

  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;
  Dbe_CadProfNome.SetFocus;
end;

procedure TFrmSalao.Bt_CadProfBuscaCEP_IBGEClick(Sender: TObject);
Var
  Flags : Cardinal;
begin
  Me_CadProfCEPLocIBGE.SetFocus;

  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    msg('Impossível Conectar!!'+cr+'Você não está conectado à Internet !!','A');
    Exit;
  End;

  If Me_CadProfCEPLocIBGE.Text='     -   ' Then
  Begin
    msg('Favor Informar o Nº do CEP','A');
    Me_CadProfCEPLocIBGE.SetFocus;
    Exit;
  End;

  Try
    If ACBrCEP.BuscarPorCEP(Me_CadProfCEPLocIBGE.Text)=0 Then
    Begin
      Me_CadProfCEPLocIBGE.SetFocus;
      Exit;
    End;

    Dbe_CadProfNumEnd.SetFocus;
  Except
    On e : Exception do
     MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
  End;

end;

procedure TFrmSalao.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEventosMessage;

  // Show Hint em Forma de Balão ///////////////////////////////////////////////
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaLoja.Handle, @ti, TipoDoIcone, 'Loja', 'LOCALIZAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_CadProfBuscaCEP_IBGE.Handle, @ti, TipoDoIcone, 'Endereço Pelo CEP', 'LOCALIZAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_CadProfBuscaEnd_IBGE.Handle, @ti, TipoDoIcone, 'CEP por Endereço', 'LOCALIZAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_CadProfBuscaMunicipio.Handle,  @ti, TipoDoIcone, 'Municipio', 'LOCALIZAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_CadProfBuscaUF.Handle,  @ti, TipoDoIcone, 'Estado', 'LOCALIZAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_CadProfBuscaFoto.Handle,  @ti, TipoDoIcone, 'Foto', 'LOCALIZAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_CadProfBuscaPlanoSaude.Handle,  @ti, TipoDoIcone, 'Plano de Saúde', 'LOCALIZAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_CadProfInserePlanoSaude.Handle,  @ti, TipoDoIcone, 'Plano de Saúde', 'NOVO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_CadProfSidBuscaSupervisor.Handle,  @ti, TipoDoIcone, 'Supervisor', 'LOCALIZAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_CadProfSidBuscaSupervisor.Handle,  @ti, TipoDoIcone, 'Vendedor', 'LOCALIZAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_HabServMaximizar.Handle,  @ti, TipoDoIcone, 'Maximizar', 'Habilidaes/Serviços');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_HabServMinimizar.Handle,  @ti, TipoDoIcone, 'Minimizar', 'Habilidaes/Serviços');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_PagtoMarcaTodos.Handle,  @ti, TipoDoIcone, 'Marcar Todos', 'Alterar Situação');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_PagtoDesmarcaTodos.Handle,  @ti, TipoDoIcone, 'Desmarcar Todos', 'Alterar Situação');

  CreateToolTips(Self.Handle);
  AddToolTip(Ckb_CadProfTaxaNaoSocio.Handle,  @ti, TipoDoIcone, 'SIM = É Cobrado Uma Vez', 'COBRANÇA');
  //////////////////////////////////////////////////////////////////////////////

  bgCalculoIndividual:=False;
end;

procedure TFrmSalao.Bt_CadProfLimpaEnderecoClick(Sender: TObject);
begin
  Me_CadProfCEP.SetFocus;

  If msg('Deseja Realmente Limpar o Endereço ??','C')=2 Then
   Exit;

  Me_CadProfCEP.Text:='     -   ';
  Me_CadProfCEP.ReadOnly:=False;
  Me_CadProfCEP.Color:=clWindow;

  DMSalao.CDS_ProfissionaisDES_ENDERECO.Clear;
  Dbe_CadProfEndereco.ReadOnly:=False;
  Dbe_CadProfEndereco.Color:=clWindow;
  Dbe_CadProfEndereco.TabStop:=True;

  DMSalao.CDS_ProfissionaisDES_BAIRRO.Clear;
  Dbe_CadProfBairro.ReadOnly:=False;
  Dbe_CadProfBairro.Color:=clWindow;
  Dbe_CadProfBairro.TabStop:=True;

  DMSalao.CDS_ProfissionaisCOD_MUNICIPIO_IBGE.AsInteger:=0;
  DMSalao.CDS_ProfissionaisDES_MUNICIPIO.Clear;

  DMSalao.CDS_ProfissionaisCOD_ESTADO_IBGE.AsInteger:=0;
  DMSalao.CDS_ProfissionaisDES_UF.Clear;
  DMSalao.CDS_ProfissionaisDES_ESTADO.Clear;

  Bt_CadProfBuscaMunicipio.Enabled:=True;
  Bt_CadProfBuscaUF.Enabled:=True;
  Me_CadProfCEP.SetFocus;

end;

procedure TFrmSalao.Bt_CadProfBuscaEnd_IBGEClick(Sender: TObject);
Var
  Flags : Cardinal;
begin
  Me_CadProfCEPLocIBGE.SetFocus;

  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    msg('Impossível Conectar!!'+cr+'Você não está conectado à Internet !!','A');
    Exit;
  End;

  If ((Trim(Dbe_CadProfEndereco.Text)='')  And (Trim(Dbe_CadProfBairro.Text)='')) Or
     ((Trim(Dbe_CadProfMunicipio.Text)='') Or  (Trim(Dbe_CadProfEstado.Text)='')) Then
  Begin
    msg('Favor Informar: '+cr+cr+'- Municipio - Obrigatório'+cr+
                                 '- Estado     - Obrigatório'+cr+
                                 '- Endereço  e/ou  Bairro','A');
    Exit;
  End;

  try
    // ACBrCEP.BuscarPorLogradouro(Des_Municipio, Tipo_logradouro, Des_Endereco, Des_UF, Des_Bairro);
    ACBrCEP.BuscarPorLogradouro(DMSalao.CDS_ProfissionaisDES_MUNICIPIO.Text, '',
                                DMSalao.CDS_ProfissionaisDES_ENDERECO.Text,
                                DMSalao.CDS_ProfissionaisDES_UF.Text,
                                DMSalao.CDS_ProfissionaisDES_BAIRRO.Text);
  except
   On e : Exception do
    MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
  end ;
end;

procedure TFrmSalao.ACBrCEPBuscaEfetuada(Sender: TObject);
var
  i : integer;
  MySql: String;
begin
  If ACBrCEP.Enderecos.Count<1 Then
  Begin
    msg('Logradouro NÃO Encontrado !!','A');
    Me_CadProfCEPLocIBGE.Text:='     -   ';
    Exit;
  End;

  Me_CadProfCEPLocIBGE.Text:='     -   ';

  // Se Somente Um Registro de Retorno =========================================
  If ACBrCEP.Enderecos.Count=1 Then
   Begin
     ApresentaIBGE(0);
   End
  Else // If ACBrCEP.Enderecos.Count=1 Then
   Begin
     // Mais de Um Registro de Retorno =========================================
     // Cria ClientDataSet Meses ===============================================
     If DMSalao.CDS_V_RetornoIBGE.Active Then
      DMSalao.CDS_V_RetornoIBGE.Close;

     DMSalao.CDS_V_RetornoIBGE.CreateDataSet;
     DMSalao.CDS_V_RetornoIBGE.Open;

     For i:=0 to ACBrCEP.Enderecos.Count-1 do
     Begin
       DMSalao.CDS_V_RetornoIBGE.Append;
       DMSalao.CDS_V_RetornoIBGECEP.AsString:=ACBrCEP.Enderecos[i].CEP;
       DMSalao.CDS_V_RetornoIBGEEndereco.AsString:=
                      AnsiUpperCase(Trim(ACBrCEP.Enderecos[i].Tipo_Logradouro))+
                       ' '+AnsiUpperCase(Trim(ACBrCEP.Enderecos[i].Logradouro));
       DMSalao.CDS_V_RetornoIBGEBairro.AsString:=
                               AnsiUpperCase(Trim(ACBrCEP.Enderecos[i].Bairro));
       DMSalao.CDS_V_RetornoIBGEMunicipio.AsString:=
                            AnsiUpperCase(Trim(ACBrCEP.Enderecos[i].Municipio));
       DMSalao.CDS_V_RetornoIBGEMunicipio_IBGE.AsString:=
                                            ACBrCEP.Enderecos[i].IBGE_Municipio;
       DMSalao.CDS_V_RetornoIBGEUF.AsString:=ACBrCEP.Enderecos[i].UF;
       DMSalao.CDS_V_RetornoIBGEUF_IBGE.AsString:=ACBrCEP.Enderecos[i].IBGE_UF;
       DMSalao.CDS_V_RetornoIBGE.Post;

       DMSalao.CDS_V_RetornoIBGE.First;
     End; // For i:=0 to ACBrCEP.Enderecos.Count-1 do

     // Apresenta para Selecionar ==============================================
     FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
     FrmBelShop.AbreSolicitacoes(9);

     FrmSolicitacoes.Caption:='ENDEREÇOS IBGE';
     FrmSolicitacoes.Ts_HabServ.Caption:='Selecione o Endereço Correto';

     bgProcessar:=False;
     FrmSolicitacoes.ShowModal;

     If bgProcessar Then
     Begin
       Me_CadProfCEPLocIBGE.Text:='     -   ';

       Me_CadProfCEP.Text:=DMSalao.CDS_V_RetornoIBGECEP.AsString;
       DMSalao.CDS_ProfissionaisNUM_CEP.AsString:=
                                          DMSalao.CDS_V_RetornoIBGECEP.AsString;
       DMSalao.CDS_ProfissionaisDES_ENDERECO.AsString:=
                                     DMSalao.CDS_V_RetornoIBGEEndereco.AsString;
       DMSalao.CDS_ProfissionaisDES_BAIRRO.AsString:=
                                       DMSalao.CDS_V_RetornoIBGEBairro.AsString;
       DMSalao.CDS_ProfissionaisDES_MUNICIPIO.AsString:=
                                    DMSalao.CDS_V_RetornoIBGEMunicipio.AsString;
       DMSalao.CDS_ProfissionaisCOD_MUNICIPIO_IBGE.AsString:=
                               DMSalao.CDS_V_RetornoIBGEMunicipio_IBGE.AsString;
       DMSalao.CDS_ProfissionaisDES_UF.AsString:=
                                           DMSalao.CDS_V_RetornoIBGEUF.AsString;
       DMSalao.CDS_ProfissionaisCOD_ESTADO_IBGE.AsString:=
                                      DMSalao.CDS_V_RetornoIBGEUF_IBGE.AsString;

       // Busca Descrição do Estado ============================================
       MySql:=' SELECT e.des_estado'+
              ' FROM ESTADOS_IBGE e'+
              ' WHERE e.cod_estado='+DMSalao.CDS_V_RetornoIBGEUF_IBGE.AsString;
       DMBelShop.CDS_BuscaRapida.Close;
       DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
       DMBelShop.CDS_BuscaRapida.Open;
       DMSalao.CDS_ProfissionaisDES_ESTADO.AsString:=
                   DMBelShop.CDS_BuscaRapida.FieldByName('des_estado').AsString;
       DMBelShop.CDS_BuscaRapida.Close;

       // Nao Libera Endereço pelo IBGE ========================================
       LiberaIBGE(False);
     End; // If bgProcessar Then
   End; // If ACBrCEP.Enderecos.Count=1 Then
end;

procedure TFrmSalao.Bt_CadProfBuscaMunicipioClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbe_CadProfMunicipio.SetFocus;
  
  If Trim(Dbe_CadProfEstado.Text)='' Then
  Begin
    msg('Favor Informar o Estado (UF) !!','A');
    Dbe_CadProfEstado.SetFocus;
    Exit;
  end;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:='Select Des_Municipio, Cod_Municipio, Des_UF'+
         ' From Municipios_IBGE'+
         ' Where Des_UF='+QuotedStr(DMSalao.CDS_ProfissionaisDES_UF.AsString)+
         ' Order by Des_Municipio';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Cod_Municipio').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    DMBelShop.CDS_Pesquisa.Close;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Bt_CadProfBuscaMunicipio.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Municipio';
  FrmPesquisa.Campo_Codigo:='Cod_Municipio';
  FrmPesquisa.Campo_Descricao:='Des_Municipio';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    DMSalao.CDS_ProfissionaisDES_MUNICIPIO.AsString:=FrmPesquisa.EdtDescricao.Text;
    DMSalao.CDS_ProfissionaisCOD_MUNICIPIO_IBGE.AsString:=FrmPesquisa.EdtCodigo.Text;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmSalao.Bt_CadProfBuscaUFClick(Sender: TObject);
Var
  MySql: String;
Begin
  Dbe_CadProfEstado.SetFocus;
  
  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:='Select Des_Estado, Cod_Estado, Des_UF'+
         ' From Estados_IBGE'+
         ' Order by Des_Estado';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Cod_Estado').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    DMBelShop.CDS_Pesquisa.Close;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Bt_CadProfBuscaUF.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Estado';
  FrmPesquisa.Campo_Codigo:='Cod_Estado';
  FrmPesquisa.Campo_Descricao:='Des_Estado';

  // Campos Qualquer de Retorno ================================================
  // Variavel de Entrada  - Variavel de Retorno
  // Campo_Retorno1       - Retorno1
  FrmPesquisa.Campo_Retorno1:='DES_UF';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    DMSalao.CDS_ProfissionaisCOD_ESTADO_IBGE.AsString:=FrmPesquisa.EdtCodigo.Text;
    DMSalao.CDS_ProfissionaisDES_ESTADO.AsString     :=FrmPesquisa.EdtDescricao.Text;
    DMSalao.CDS_ProfissionaisDES_UF.AsString         :=FrmPesquisa.Retorno1;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmSalao.Dbg_ProfissionaisDblClick(Sender: TObject);
begin
  Bt_AlterarClick(Self);
end;

procedure TFrmSalao.Bt_CadProfBuscaFotoClick(Sender: TObject);
begin

  With OpenFoto do
  Begin
    Title := 'Busca Arquivos De Fotos';

    If Execute then
     Begin
       IM_CadProfFoto.Picture.LoadFromFile(OpenFoto.FileName);
     End
    Else
     Begin
       Exit;
     End;
  End; // With OpenFoto do
End;

procedure TFrmSalao.Bt_CadProfLimpaFotoClick(Sender: TObject);
begin
  IM_CadProfFoto.Picture := Nil;
end;

procedure TFrmSalao.Bt_CadProfFoneNovoClick(Sender: TObject);
begin
  Dbg_CadProfFones.SetFocus;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(10);

  FrmSolicitacoes.Gb_Desc1.Visible :=False;
  FrmSolicitacoes.Gb_Desc2.Visible :=False;
  FrmSolicitacoes.Gb_Desc3.Visible :=False;
  FrmSolicitacoes.Gb_Desc7.Visible :=False;
  FrmSolicitacoes.Gb_Desc8.Visible :=False;
  FrmSolicitacoes.Gb_Desc9.Visible :=False;
  FrmSolicitacoes.Gb_Desc10.Visible:=False;

  FrmSolicitacoes.Ts_ManutDiversas.Caption:=' TELEFONES ';

  FrmSolicitacoes.Gb_Desc4.Caption:=' Localização do Telefone ';
  FrmSolicitacoes.Gb_Desc4.TabOrder:=0;

  FrmSolicitacoes.Gb_Desc5.Caption:=' DDD do Telefone ';
  FrmSolicitacoes.Gb_Desc5.Width:=120;
  FrmSolicitacoes.Gb_Desc5.TabOrder:=1;
  FrmSolicitacoes.EdtDesc5.Width:=35;
  FrmSolicitacoes.EdtDesc5.MaxLength:=4;
  FrmSolicitacoes.EdtDesc5.Left:=ParteInteiro(VarToStr((FrmSolicitacoes.Gb_Desc3.Width-FrmSolicitacoes.EdtDesc3.Width)/2));

  FrmSolicitacoes.Gb_Desc6.Caption:=' Número do Telefone ';
  FrmSolicitacoes.Gb_Desc6.TabOrder:=2;

  // Campos a Consistir
  FrmSolicitacoes.sgComponentesConsiste:='EdtDesc4;EdtDesc5;EdtDesc6;';
  FrmSolicitacoes.Bt_ManutDiversosDML.Caption:='Incluir';
  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    If (Not DMSalao.CDS_V_ProfFones.IsEmpty) and
       (DMSalao.CDS_V_ProfFones.Locate('Des_Fone',FrmSolicitacoes.EdtDesc6.Text,[])) Then
     Begin
       msg('TeleFone Já Informado !!','A');
     End
    Else
     Begin
       DMSalao.CDS_V_ProfFones.Append;
       DMSalao.CDS_V_ProfFonesDes_DDD.AsString        :=FrmSolicitacoes.EdtDesc5.Text;
       DMSalao.CDS_V_ProfFonesDes_Fone.AsString       :=FrmSolicitacoes.EdtDesc6.Text;
       DMSalao.CDS_V_ProfFonesDes_Localizacao.AsString:=FrmSolicitacoes.EdtDesc4.Text;
       DMSalao.CDS_V_ProfFones.Post;
     End;
  End; // If bgProcessar Then
  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmSalao.Bt_CadProfFoneAlterarClick(Sender: TObject);
begin
  Dbg_CadProfFones.SetFocus;

  If DMSalao.CDS_V_ProfFones.IsEmpty Then
   Exit;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(10);

  FrmSolicitacoes.Gb_Desc1.Visible :=False;
  FrmSolicitacoes.Gb_Desc2.Visible :=False;
  FrmSolicitacoes.Gb_Desc3.Visible :=False;
  FrmSolicitacoes.Gb_Desc7.Visible :=False;
  FrmSolicitacoes.Gb_Desc8.Visible :=False;
  FrmSolicitacoes.Gb_Desc9.Visible :=False;
  FrmSolicitacoes.Gb_Desc10.Visible:=False;

  FrmSolicitacoes.Ts_ManutDiversas.Caption:=' TELEFONES ';

  FrmSolicitacoes.Gb_Desc4.Caption:=' Localização do Telefone ';
  FrmSolicitacoes.Gb_Desc4.TabOrder:=0;
  FrmSolicitacoes.EdtDesc4.Text:=DMSalao.CDS_V_ProfFonesDes_Localizacao.AsString;

  FrmSolicitacoes.Gb_Desc5.Caption:=' DDD do Telefone ';
  FrmSolicitacoes.Gb_Desc5.TabOrder:=1;
  FrmSolicitacoes.Gb_Desc5.Width:=120;
  FrmSolicitacoes.EdtDesc5.Width:=35;
  FrmSolicitacoes.EdtDesc5.MaxLength:=4;
  FrmSolicitacoes.EdtDesc5.Left:=ParteInteiro(VarToStr((FrmSolicitacoes.Gb_Desc3.Width-FrmSolicitacoes.EdtDesc3.Width)/2));
  FrmSolicitacoes.EdtDesc5.Text:=DMSalao.CDS_V_ProfFonesDes_DDD.AsString;

  FrmSolicitacoes.Gb_Desc6.Caption:=' Número do Telefone ';
  FrmSolicitacoes.Gb_Desc6.TabOrder:=2;
  FrmSolicitacoes.EdtDesc6.Text:=DMSalao.CDS_V_ProfFonesDes_Fone.AsString;

  // Campos a Consistir
  FrmSolicitacoes.sgComponentesConsiste:='EdtDesc4;EdtDesc5;EdtDesc6;';
  FrmSolicitacoes.Bt_ManutDiversosDML.Caption:='Alterar';
  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    If (Not DMSalao.CDS_V_ProfFones.IsEmpty) and
       (DMSalao.CDS_V_ProfFones.Locate('Des_DDD;Des_Fone;Des_Localizacao',
                            VarArrayOf([FrmSolicitacoes.EdtDesc5.Text,
                                        FrmSolicitacoes.EdtDesc6.Text,
                                        FrmSolicitacoes.EdtDesc4.Text]),[])) Then
     Begin
       msg('Telefone Já Informado !!','A');
     End
    Else
     Begin
       DMSalao.CDS_V_ProfFones.Edit;
       DMSalao.CDS_V_ProfFonesDes_DDD.AsString        :=FrmSolicitacoes.EdtDesc5.Text;
       DMSalao.CDS_V_ProfFonesDes_Fone.AsString       :=FrmSolicitacoes.EdtDesc6.Text;
       DMSalao.CDS_V_ProfFonesDes_Localizacao.AsString:=FrmSolicitacoes.EdtDesc4.Text;
       DMSalao.CDS_V_ProfFones.Post;
     End;
  End; // If bgProcessar Then
  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmSalao.Bt_CadProfFoneExcluirClick(Sender: TObject);
begin
  Dbg_CadProfFones.SetFocus;

  If DMSalao.CDS_V_ProfFones.IsEmpty Then
   Exit;

  If msg('Deseja Realmente Excluir'+cr+'o Telefone Seleciondo ??','C')=2 Then
   Exit;

  DMSalao.CDS_V_ProfFones.Delete;

end;

procedure TFrmSalao.Bt_CadProfEmailNovoClick(Sender: TObject);
begin
  Dbg_CadProfEmails.SetFocus;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(10);

  FrmSolicitacoes.Gb_Desc1.Visible :=False;
  FrmSolicitacoes.Gb_Desc2.Visible :=False;
  FrmSolicitacoes.Gb_Desc3.Visible :=False;
  FrmSolicitacoes.Gb_Desc6.Visible :=False;
  FrmSolicitacoes.Gb_Desc7.Visible :=False;
  FrmSolicitacoes.Gb_Desc8.Visible :=False;
  FrmSolicitacoes.Gb_Desc9.Visible :=False;
  FrmSolicitacoes.Gb_Desc10.Visible:=False;

  FrmSolicitacoes.Ts_ManutDiversas.Caption:=' E-Mails ';

  FrmSolicitacoes.Gb_Desc4.Caption:=' Identificação do E-Mail ';
  FrmSolicitacoes.Gb_Desc4.TabOrder:=0;

  FrmSolicitacoes.Gb_Desc5.Caption:=' Descrição do E-Mail ';
  FrmSolicitacoes.Gb_Desc5.TabOrder:=1;
  FrmSolicitacoes.EdtDesc5.CharCase:=ecLowerCase;

  // Campos a Consistir
  FrmSolicitacoes.sgComponentesConsiste:='EdtDesc4;EdtDesc5;';
  FrmSolicitacoes.Bt_ManutDiversosDML.Caption:='Incluir';
  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    If (Not DMSalao.CDS_V_ProfEmail.IsEmpty) and
       (DMSalao.CDS_V_ProfEmail.Locate('Des_Email',FrmSolicitacoes.EdtDesc5.Text,[])) Then
     Begin
       msg('E-Mail Já Informado !!','A');
     End
    Else
     Begin
       DMSalao.CDS_V_ProfEmail.Append;
       DMSalao.CDS_V_ProfEmailDes_Localizacao.AsString:=FrmSolicitacoes.EdtDesc4.Text;
       DMSalao.CDS_V_ProfEmailDes_Email.AsString      :=FrmSolicitacoes.EdtDesc5.Text;
       DMSalao.CDS_V_ProfEmail.Post;
     End;
  End; // If bgProcessar Then
  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmSalao.Bt_CadProfEmailAlterarClick(Sender: TObject);
begin
  Dbg_CadProfEmails.SetFocus;

  If DMSalao.CDS_V_ProfEmail.IsEmpty Then
   Exit;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(10);

  FrmSolicitacoes.Gb_Desc1.Visible :=False;
  FrmSolicitacoes.Gb_Desc2.Visible :=False;
  FrmSolicitacoes.Gb_Desc3.Visible :=False;
  FrmSolicitacoes.Gb_Desc6.Visible :=False;
  FrmSolicitacoes.Gb_Desc7.Visible :=False;
  FrmSolicitacoes.Gb_Desc8.Visible :=False;
  FrmSolicitacoes.Gb_Desc9.Visible :=False;
  FrmSolicitacoes.Gb_Desc10.Visible:=False;

  FrmSolicitacoes.Ts_ManutDiversas.Caption:=' E-Mails ';

  FrmSolicitacoes.Gb_Desc4.Caption:=' Identificação do E-Mail ';
  FrmSolicitacoes.Gb_Desc4.TabOrder:=0;
  FrmSolicitacoes.edtDesc4.Text:=DMSalao.CDS_V_ProfEmailDes_Localizacao.AsString;

  FrmSolicitacoes.Gb_Desc5.Caption:=' Descrição do E-Mail ';
  FrmSolicitacoes.Gb_Desc5.TabOrder:=1;
  FrmSolicitacoes.edtDesc5.Text:=DMSalao.CDS_V_ProfEmailDes_Email.AsString;
  FrmSolicitacoes.EdtDesc5.CharCase:=ecLowerCase;

  // Campos a Consistir
  FrmSolicitacoes.sgComponentesConsiste:='EdtDesc4;EdtDesc5;';
  FrmSolicitacoes.Bt_ManutDiversosDML.Caption:='Alterar';
  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    If (Not DMSalao.CDS_V_ProfEmail.IsEmpty) and
       (DMSalao.CDS_V_ProfEmail.Locate('Des_Localizacao;Des_Email',
                            VarArrayOf([FrmSolicitacoes.EdtDesc4.Text,
                                        FrmSolicitacoes.EdtDesc5.Text]),[])) Then
     Begin
       msg('E-Mail Já Informado !!','A');
     End
    Else
     Begin
       DMSalao.CDS_V_ProfEmail.Edit;
       DMSalao.CDS_V_ProfEmailDes_Localizacao.AsString:=FrmSolicitacoes.EdtDesc4.Text;
       DMSalao.CDS_V_ProfEmailDes_Email.AsString      :=FrmSolicitacoes.EdtDesc5.Text;
       DMSalao.CDS_V_ProfEmail.Post;
     End;
  End; // If bgProcessar Then
  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmSalao.Bt_CadProfEmailExcluirClick(Sender: TObject);
begin
  Dbg_CadProfEmails.SetFocus;

  If DMSalao.CDS_V_ProfEmail.IsEmpty Then
   Exit;

  If msg('Deseja Realmente Excluir'+cr+'o E-Mail Seleciondo ??','C')=2 Then
   Exit;

  DMSalao.CDS_V_ProfEmail.Delete;

end;

procedure TFrmSalao.Dbm_CadProfOBSEnter(Sender: TObject);
begin
  bEnterTab:=False;
end;

procedure TFrmSalao.Dbm_CadProfOBSExit(Sender: TObject);
begin
  bEnterTab:=True;

end;

procedure TFrmSalao.Ckb_CadProfTaxaSindicatoClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_CadProfTaxaSindicato);
end;

procedure TFrmSalao.Ckb_CadProfTaxaSindicatoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AcertaCkb_SN(Ckb_CadProfTaxaSindicato);

end;

procedure TFrmSalao.Ckb_CadProfTaxaNaoSocioKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AcertaCkb_SN(Ckb_CadProfTaxaNaoSocio);

end;

procedure TFrmSalao.Ckb_CadProfTaxaNaoSocioClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_CadProfTaxaNaoSocio);

end;

procedure TFrmSalao.Dbe_CadProfCodPlanoSaudeExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtCadProfDesPlanoSaude.Clear;

  If DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsInteger<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Plano de Saude ====================================================
    MySql:=' SELECT ps.des_aux, ps.cod_aux, ps.vlr_aux Vlr_Titular, ps.vlr_aux1 Vlr_Dependente'+
           ' FROM TAB_AUXILIAR ps'+
           ' WHERE ps.tip_aux=4'+
           ' AND ps.cod_aux='+DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsString;
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Des_Aux').AsString)='' Then
    Begin
      msg('Plano de Saúde NÃO Encontrado !!!', 'A');
      Screen.Cursor:=crDefault;
      DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsInteger:=0;
      Dbe_CadProfCodPlanoSaude.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;

    EdtCadProfDesPlanoSaude.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Aux').AsString;
    DMSalao.CDS_ProfissionaisVLR_PLANO_SAUDE.AsCurrency:=
                DMBelShop.CDS_BuscaRapida.FieldByName('Vlr_Titular').AsCurrency;

    If Not DMSalao.CDS_V_Dependentes.IsEmpty Then
    Begin
      DMSalao.CDS_V_Dependentes.First;
      While Not DMSalao.CDS_V_Dependentes.Eof do
      Begin
        DMSalao.CDS_V_Dependentes.Edit;
        DMSalao.CDS_V_DependentesVlr_PlanoSaude.AsCurrency:=
             DMBelShop.CDS_BuscaRapida.FieldByName('Vlr_Dependente').AsCurrency;
        DMSalao.CDS_V_Dependentes.Post;

        DMSalao.CDS_V_Dependentes.Next;
      End; // While Not DMSalao.CDS_V_Dependentes.Eof do
      DMSalao.CDS_V_Dependentes.First;
    End; // If Not DMSalao.CDS_V_Dependentes.IsEmpty Then
    DMBelShop.CDS_BuscaRapida.Close;

    Perform(WM_NEXTDLGCTL, 0, 0);
    Screen.Cursor:=crDefault;
  End;

  // Excluir os Dependentes ====================================================
  If DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsInteger=0 Then
   DMSalao.CDS_V_Dependentes.EmptyDataSet;

end;

procedure TFrmSalao.Bt_CadProfBuscaPlanoSaudeClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_CadProfDependentes.SetFocus;

  DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsInteger:=0;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT ps.des_aux Plano_Saude, ps.cod_aux Codigo,'+
         ' ps.vlr_aux Vlr_Titular, ps.vlr_aux1 Vlr_Dependente'+
         ' FROM tab_auxiliar ps'+
         ' WHERE ps.tip_aux=4'+
         ' AND   ps.cod_aux<>0'+
         ' ORDER BY ps.des_aux';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Plano_Saude').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    DMBelShop.CDS_Pesquisa.Close;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Dbe_CadProfCodPlanoSaude.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Plano_Saude';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Plano_Saude';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsString:=FrmPesquisa.EdtCodigo.Text;

    Dbe_CadProfCodPlanoSaudeExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  DMBelShop.CDS_Pesquisa.Close;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmSalao.Bt_CadProfInserePlanoSaudeClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_CadProfDependentes.SetFocus;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(10);

  FrmSolicitacoes.Gb_Desc3.Visible :=False;
  FrmSolicitacoes.Gb_Desc4.Visible :=False;
  FrmSolicitacoes.Gb_Desc5.Visible :=False;
  FrmSolicitacoes.Gb_Desc6.Visible :=False;
  FrmSolicitacoes.Gb_Desc7.Visible :=False;
  FrmSolicitacoes.Gb_Desc8.Visible :=False;

  // Busca o Codigo do Plano de Saude ==========================================
  MySql:='SELECT GEN_ID(GEN_PLANOSAUDE,1) Cod'+
         ' FROM RDB$DATABASE';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  FrmSolicitacoes.Ts_ManutDiversas.Caption:=' CADASTRO DE PLANO DE SAÚDE ';

  FrmSolicitacoes.Gb_Desc1.Caption:=' Código ';
  FrmSolicitacoes.EdtDesc1.Text:=DMBelShop.CDS_Busca.FieldByName('Cod').AsString;
  FrmSolicitacoes.EdtDesc1.Color:=$00E0E0E0;
  FrmSolicitacoes.EdtDesc1.ReadOnly:=True;
  FrmSolicitacoes.EdtDesc1.TabStop:=False;
  FrmSolicitacoes.Gb_Desc1.TabOrder:=3;
  FrmSolicitacoes.Gb_Desc1.Top:=FrmSolicitacoes.Gb_Desc3.Top;
  DMBelShop.CDS_Busca.Close;

  FrmSolicitacoes.Gb_Desc2.Caption:=' Descrição do Plano de Saúde ';
  FrmSolicitacoes.Gb_Desc2.TabOrder:=0;
  FrmSolicitacoes.Gb_Desc2.Top:=FrmSolicitacoes.Gb_Desc3.Top;

  FrmSolicitacoes.Gb_Desc9.Caption:=' Valor do Titular ';
  FrmSolicitacoes.Gb_Desc9.TabOrder:=1;
  FrmSolicitacoes.Gb_Desc9.Top:=FrmSolicitacoes.Gb_Desc4.Top;
  FrmSolicitacoes.Gb_Desc9.Left:=FrmSolicitacoes.Gb_Desc4.Left;

  FrmSolicitacoes.Gb_Desc10.Caption:=' Valor por Dependente ';
  FrmSolicitacoes.Gb_Desc10.TabOrder:=2;
  FrmSolicitacoes.Gb_Desc10.Top:=FrmSolicitacoes.Gb_Desc5.Top;
  FrmSolicitacoes.Gb_Desc10.Left:=FrmSolicitacoes.Gb_Desc5.Left;

  // Campos a Consistir
  FrmSolicitacoes.sgComponentesConsiste:='EdtDesc2;EdtDesc9;EdtDesc10;';
  FrmSolicitacoes.Bt_ManutDiversosDML.Caption:='Incluir';
  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    // Verifica se Existe Plano de Saude ==================================
    MySql:=' SELECT ps.des_aux'+
           ' FROM tab_auxiliar ps'+
           ' WHERE ps.tip_aux=4'+
           ' AND ps.des_aux='+QuotedStr(Trim(FrmSolicitacoes.EdtDesc2.Text));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    If Trim(DMBelShop.CDS_BuscaRapida.FieldBYName('Des_Aux').AsString)<>'' Then
    Begin
      msg('Plano de Saúde Já Existente !!','A');
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    DMBelShop.CDS_BuscaRapida.Close;

    // Cadastra Plano de Saude ============================================
    If StrToCurr(FrmSolicitacoes.EdtDesc9.Text)<StrToCurr(FrmSolicitacoes.EdtDesc10.Text) Then
    Begin
      sgMensagem:='IMPOSSÍVEL GRAVAR !!'+cr+cr+
                  ' Valor do Dependente é Mairo que o Títular !!'+cr+cr+
                  ' Valor do Titular: '+FrmSolicitacoes.EdtDesc9.Text+cr+
                  ' Valor do Dependente: '+FrmSolicitacoes.EdtDesc10.Text;
      Application.MessageBox(PChar(sgMensagem), 'ATENÇÃO !!', 16);

      FrmSolicitacoes.Free;
      FrmSolicitacoes:=nil;
      Exit;
    End; // If StrToCurr(FrmSolicitacoes.EdtDesc9.Text)<StrToCurr(FrmSolicitacoes.EdtDesc10.Text) Then

    // Cadastra Plano de Saude ============================================
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySqlDML:=' INSERT INTO TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, VLR_AUX, VLR_AUX1)'+
              ' VALUES ('+
              QuotedStr('4')+', '+
              ' (SELECT COALESCE(MAX(p.cod_aux)+1 ,1) Cod FROM tab_auxiliar p WHERE p.tip_aux=4), '+
              QuotedStr(Trim(FrmSolicitacoes.EdtDesc2.Text))+', '+
              QuotedStr(F_Troca(',','.',ZerosCentavos(FrmSolicitacoes.EdtDesc9.Text,2)))+', '+
              QuotedStr(F_Troca(',','.',ZerosCentavos(FrmSolicitacoes.EdtDesc10.Text,2)))+')';
    DMBelShop.SQLC.Execute(MySqlDML,nil,nil);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

    // Troca o Plano de Saude ==================================================
    If msg('Deseja Trocar o Plano de Saúde ??','C')=1 Then
    Begin
      MySql:=' SELECT ps.des_aux, ps.cod_aux, ps.vlr_aux Vlr_Titular, ps.vlr_aux1 Vlr_Dependente'+
             ' FROM tab_auxiliar ps'+
             ' WHERE ps.tip_aux=4'+
             ' AND ps.des_aux='+QuotedStr(Trim(FrmSolicitacoes.EdtDesc2.Text));
       DMBelShop.CDS_BuscaRapida.Close;
       DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
       DMBelShop.CDS_BuscaRapida.Open;

      DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsInteger:=
                     DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Aux').AsInteger;
      DMBelShop.CDS_BuscaRapida.Close;

      Dbe_CadProfCodPlanoSaudeExit(Self);
    End; // If msg('Deseja Trocar o Plano de Saúde ??','C')=1 Then
  End; // If bgProcessar Then

  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmSalao.Bt_CadProfDependenteNovoClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_CadProfDependentes.SetFocus;

  If DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsInteger=0 Then
  Begin
    msg('Favor Informar o Plano de Saúde !!','A');
    Dbe_CadProfCodPlanoSaude.SetFocus;
    Exit;
  End;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(10);

  FrmSolicitacoes.Gb_Desc1.Visible :=False;
  FrmSolicitacoes.Gb_Desc2.Visible :=False;
  FrmSolicitacoes.Gb_Desc5.Visible :=False;
  FrmSolicitacoes.Gb_Desc6.Visible :=False;
  FrmSolicitacoes.Gb_Desc8.Visible :=False;
  FrmSolicitacoes.Gb_Desc10.Visible:=False;

  FrmSolicitacoes.Ts_ManutDiversas.Caption:=' DEPENDENTES DO PLANO DE SAÚDE ';

  FrmSolicitacoes.Gb_Desc3.Caption:=' Nome do Dependente ';
  FrmSolicitacoes.Gb_Desc3.TabOrder:=0;

  FrmSolicitacoes.Gb_Desc4.Caption:=' Parentesto ';
  FrmSolicitacoes.Gb_Desc4.TabOrder:=1;

  FrmSolicitacoes.Gb_Desc7.Caption:=' Nascimento ';
  FrmSolicitacoes.Gb_Desc7.TabOrder:=2;
  FrmSolicitacoes.Gb_Desc7.Top:=FrmSolicitacoes.Gb_Desc5.Top;

  MySql:=' SELECT ps.vlr_aux1 Vlr_Dependente'+
         ' FROM tab_auxiliar ps'+
         ' WHERE ps.tip_aux=4'+
         ' AND ps.cod_aux='+DMSalao.CDS_ProfissionaisCOD_PLANO_SAUDE.AsString;
   DMBelShop.CDS_BuscaRapida.Close;
   DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
   DMBelShop.CDS_BuscaRapida.Open;

  FrmSolicitacoes.Gb_Desc9.Caption:=' Valor ';
  FrmSolicitacoes.EdtDesc9.Value:=DMBelShop.CDS_BuscaRapida.FieldByName('Vlr_Dependente').AsCurrency;
  FrmSolicitacoes.Gb_Desc9.TabOrder:=3;
  FrmSolicitacoes.Gb_Desc9.Top:=FrmSolicitacoes.Gb_Desc5.Top;
  FrmSolicitacoes.Gb_Desc9.Left:=FrmSolicitacoes.Gb_Desc8.Left;
  DMBelShop.CDS_BuscaRapida.Close;

  // Campos a Consistir
  FrmSolicitacoes.sgComponentesConsiste:='EdtDesc3;EdtDesc4;MeDesc7;EdtDesc9;';
  FrmSolicitacoes.Bt_ManutDiversosDML.Caption:='Incluir';
  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    If (Not DMSalao.CDS_V_Dependentes.IsEmpty) and
       (DMSalao.CDS_V_Dependentes.Locate('Des_Dependente',FrmSolicitacoes.EdtDesc3.Text,[])) Then
     Begin
       msg('Dependente Já Informado !!','A');
     End
    Else
     Begin
       DMSalao.CDS_V_Dependentes.Append;
       DMSalao.CDS_V_DependentesDes_Dependente.AsString:=FrmSolicitacoes.EdtDesc3.Text;
       DMSalao.CDS_V_DependentesDes_Parentesco.AsString:=FrmSolicitacoes.EdtDesc4.Text;
       DMSalao.CDS_V_DependentesDta_Nascimento.AsString:=FrmSolicitacoes.MeDesc7.Text;
       DMSalao.CDS_V_DependentesVlr_PlanoSaude.AsString:=FrmSolicitacoes.EdtDesc9.Text;
       DMSalao.CDS_V_Dependentes.Post;
     End;
  End; // If bgProcessar Then
  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;
end;

procedure TFrmSalao.Bt_CadProfDependenteAlterarClick(Sender: TObject);
begin
  Dbg_CadProfDependentes.SetFocus;

  If DMSalao.CDS_V_Dependentes.IsEmpty Then
   Exit;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(10);

  FrmSolicitacoes.Gb_Desc1.Visible :=False;
  FrmSolicitacoes.Gb_Desc2.Visible :=False;
  FrmSolicitacoes.Gb_Desc5.Visible :=False;
  FrmSolicitacoes.Gb_Desc6.Visible :=False;
  FrmSolicitacoes.Gb_Desc8.Visible :=False;
  FrmSolicitacoes.Gb_Desc10.Visible:=False;

  FrmSolicitacoes.Ts_ManutDiversas.Caption:=' DEPENDENTES DO PLANO DE SAÚDE ';

  FrmSolicitacoes.Gb_Desc3.Caption:=' Nome do Dependente ';
  FrmSolicitacoes.Gb_Desc3.TabOrder:=0;
  FrmSolicitacoes.EdtDesc3.Text:=DMSalao.CDS_V_DependentesDes_Dependente.AsString;

  FrmSolicitacoes.Gb_Desc4.Caption:=' Parentesto ';
  FrmSolicitacoes.Gb_Desc4.TabOrder:=1;
  FrmSolicitacoes.EdtDesc4.Text:=DMSalao.CDS_V_DependentesDes_Parentesco.AsString;

  FrmSolicitacoes.Gb_Desc7.Caption:=' Nascimento ';
  FrmSolicitacoes.Gb_Desc7.TabOrder:=2;
  FrmSolicitacoes.MeDesc7.Text:=DMSalao.CDS_V_DependentesDta_Nascimento.AsString;
  FrmSolicitacoes.Gb_Desc7.Top:=FrmSolicitacoes.Gb_Desc5.Top;

  FrmSolicitacoes.Gb_Desc9.Caption:=' Valor ';
  FrmSolicitacoes.Gb_Desc9.TabOrder:=3;
  FrmSolicitacoes.EdtDesc9.Text:=DMSalao.CDS_V_DependentesVlr_PlanoSaude.AsString;
  FrmSolicitacoes.Gb_Desc9.Top:=FrmSolicitacoes.Gb_Desc5.Top;
  FrmSolicitacoes.Gb_Desc9.Left:=FrmSolicitacoes.Gb_Desc8.Left;

  // Campos a Consistir
  FrmSolicitacoes.sgComponentesConsiste:='EdtDesc3;EdtDesc4;MeDesc7;EdtDesc9;';
  FrmSolicitacoes.Bt_ManutDiversosDML.Caption:='Alterar';
  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    DMSalao.CDS_V_Dependentes.Edit;
    DMSalao.CDS_V_DependentesDes_Dependente.AsString:=FrmSolicitacoes.EdtDesc3.Text;
    DMSalao.CDS_V_DependentesDes_Parentesco.AsString:=FrmSolicitacoes.EdtDesc4.Text;
    DMSalao.CDS_V_DependentesDta_Nascimento.AsString:=FrmSolicitacoes.MeDesc7.Text;
    DMSalao.CDS_V_DependentesVlr_PlanoSaude.AsString:=FrmSolicitacoes.EdtDesc9.Text;
    DMSalao.CDS_V_Dependentes.Post;
  End; // If bgProcessar Then
  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmSalao.Bt_CadProfDependenteExcluirClick(Sender: TObject);
begin
  Dbg_CadProfDependentes.SetFocus;

  If DMSalao.CDS_V_Dependentes.IsEmpty Then
   Exit;

  If msg('Deseja Realmente Excluir'+cr+'o Dependente Seleciondo ??','C')=2 Then
   Exit;

  DMSalao.CDS_V_Dependentes.Edit;
  DMSalao.CDS_V_DependentesInd_Exc.AsString:='S';
  DMSalao.CDS_V_Dependentes.Post;

end;

procedure TFrmSalao.PC_CadProfissionalChange(Sender: TObject);
begin

  If (PC_CadProfissional.ActivePage=Ts_CadProfDadosPessoais) And (Ts_CadProfDadosPessoais.CanFocus) Then
  Begin
    If Trim(Cbx_CadProfTpPessoa.Text)='' Then
     Cbx_CadProfTpPessoa.SetFocus
    Else
     EdtDta_CadProfDtaNasc.SetFocus;
  End;

  If (PC_CadProfissional.ActivePage=Ts_CadProfDoctos) And (Ts_CadProfDoctos.CanFocus) Then
  Begin
     If Trim(Cbx_CadProfTpPessoa.Text)='' Then
     Begin
       PC_CadProfissional.ActivePage:=Ts_CadProfDadosPessoais;
       msg('Favor Informar o Tipo de Pessoa !!','A');
       Cbx_CadProfTpPessoa.SetFocus;
     End
    Else
     Dbe_CadProfNumSindicato.SetFocus;
  End;

  If (PC_CadProfissional.ActivePage=Ts_CadProfContrato) And (Ts_CadProfContrato.CanFocus) Then
  Begin
     If Trim(Cbx_CadProfTpPessoa.Text)='' Then
     Begin
       PC_CadProfissional.ActivePage:=Ts_CadProfDadosPessoais;
       msg('Favor Informar o Tipo de Pessoa !!','A');
       Cbx_CadProfTpPessoa.SetFocus;
     End
    Else
     Dbe_CadProfNumContrato.SetFocus;
  End;

  If (PC_CadProfissional.ActivePage=Ts_CadProfSidicom) And (Ts_CadProfSidicom.CanFocus) Then
  Begin
     If Trim(Cbx_CadProfTpPessoa.Text)='' Then
     Begin
       PC_CadProfissional.ActivePage:=Ts_CadProfDadosPessoais;
       msg('Favor Informar o Tipo de Pessoa !!','A');
       Cbx_CadProfTpPessoa.SetFocus;
     End
    Else
     Dbe_CadProfSidNivelTabela.SetFocus;
  End;

  CorSelecaoTabSheet(PC_CadProfissional);

end;

procedure TFrmSalao.PC_CadProfDiversosChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_CadProfDiversos);

  If (PC_CadProfDiversos.ActivePage=Ts_CadProfObservacao) And (Ts_CadProfObservacao.CanFocus) Then
   Dbm_CadProfOBS.SetFocus;

  If (PC_CadProfDiversos.ActivePage=Ts_CadProfObservacao) And (Ts_CadProfObservacao.CanFocus) Then
   Dbm_CadProfOBS.SetFocus;
end;

procedure TFrmSalao.EdtDta_CadProfDtaNascExit(Sender: TObject);
begin
  Lab_Anos.Caption:='0 Anos';
  If EdtDta_CadProfDtaNasc.Text<>'  /  /    ' Then
   Lab_Anos.Caption:=IntToStr(ObterIdade(EdtDta_CadProfDtaNasc.Date,
                     DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)))+' Anos';

end;

procedure TFrmSalao.Bt_CadProfHabIncluirClick(Sender: TObject);
Var
  MySql: String;
Begin
  Dbg_CadProfHab.SetFocus;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT ha.des_habserv Habilidade, ha.cod_habserv Codigo'+
         ' FROM sal_hab_serv ha'+
         ' WHERE ha.tip_habserv=''H'''+
         ' AND ha.ind_ativo=''SIM'''+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Habilidade').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    DMBelShop.CDS_Pesquisa.Close;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Habilidade';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Habilidade';

  // Campos Qualquer de Retorno ================================================
  // Variavel de Entrada  - Variavel de Retorno
  // Campo_Retorno1       - Retorno1

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    If DMSalao.CDS_HabilidadesProf.Locate('Cod_Habilidade',FrmPesquisa.EdtCodigo.Text,[]) Then
    Begin
      msg('Habilidade Já Cadastrada !!','A');
      DMBelShop.CDS_Pesquisa.Close;
      FrmPesquisa.Free;
      FrmPesquisa:=nil;
      Exit;
    End;

    FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
    FrmBelShop.AbreSolicitacoes(10);

    FrmSolicitacoes.Gb_Desc3.Visible :=False;
    FrmSolicitacoes.Gb_Desc4.Visible :=False;
    FrmSolicitacoes.Gb_Desc5.Visible :=False;
    FrmSolicitacoes.Gb_Desc6.Visible :=False;
    FrmSolicitacoes.Gb_Desc7.Visible :=False;
    FrmSolicitacoes.Gb_Desc8.Visible :=False;
    FrmSolicitacoes.Gb_Desc10.Visible :=False;

    FrmSolicitacoes.Ts_ManutDiversas.Caption:=' HABILIDADES ';

    FrmSolicitacoes.Gb_Desc1.Caption:=' Código  ';
    FrmSolicitacoes.Gb_Desc1.TabOrder:=0;
    FrmSolicitacoes.EdtDesc1.Text:=DMBelShop.CDS_Pesquisa.FieldByName('Codigo').AsString;
    FrmSolicitacoes.EdtDesc1.ReadOnly:=True;
    FrmSolicitacoes.EdtDesc1.Color:=$00DFDFFF;
    FrmSolicitacoes.Gb_Desc1.Top:=FrmSolicitacoes.Gb_Desc3.Top;

    FrmSolicitacoes.Gb_Desc2.Caption:=' Habilidade ';
    FrmSolicitacoes.Gb_Desc2.TabOrder:=1;
    FrmSolicitacoes.EdtDesc2.Text:=DMBelShop.CDS_Pesquisa.FieldByName('Habilidade').AsString;
    FrmSolicitacoes.EdtDesc2.ReadOnly:=True;
    FrmSolicitacoes.EdtDesc2.Color:=$00DFDFFF;
    FrmSolicitacoes.Gb_Desc2.Top:=FrmSolicitacoes.Gb_Desc3.Top;

    FrmSolicitacoes.Gb_Desc9.Caption:=' Comissão ';
    FrmSolicitacoes.Gb_Desc9.TabOrder:=2;
    FrmSolicitacoes.EdtDesc9.Value:=0.00;
    FrmSolicitacoes.EdtDesc9.MaxValue:=100;
    FrmSolicitacoes.EdtDesc9.MinValue:=0;
    FrmSolicitacoes.Gb_Desc9.Top:=FrmSolicitacoes.Gb_Desc4.Top;
    FrmSolicitacoes.Gb_Desc9.Left:=FrmSolicitacoes.Gb_Desc4.Left;

    // Fecha Pesquisa
    DMBelShop.CDS_Pesquisa.Close;

    // Campos a Consistir
    FrmSolicitacoes.sgComponentesConsiste:='EdtDesc2;';
    FrmSolicitacoes.Bt_ManutDiversosDML.Caption:='Incluir';
    bgProcessar:=False;
    FrmSolicitacoes.ShowModal;

    If bgProcessar Then
    Begin
      DateSeparator:='.';
      DecimalSeparator:='.';

      // Insere Habilidade =====================================================
      MySql:=' Insert Into SAL_PROF_HABILIDADES'+
             ' (COD_LOJA, COD_PROFISSIONAL, COD_HABILIDADE,'+
             '  PER_COMISSAO_HAB, IND_ATIVO, USU_INCLUI)'+
             ' Values('+
             QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+', '+
             QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+', '+
             QuotedStr(FrmSolicitacoes.EdtDesc1.Text)+', '+
             QuotedStr(VarToStr(FrmSolicitacoes.EdtDesc9.Value))+', '+
             '''SIM'', '+
             QuotedStr(Cod_Usuario)+
             ')';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Insere Serviços =======================================================
      MySql:=' SELECT l.cod_servico, s.vlr_habserv, s.ind_ativo'+
             ' FROM SAL_HAB_SERV_LINK l, SAL_HAB_SERV s'+
             ' WHERE l.cod_servico=s.cod_habserv'+
             ' AND s.tip_habserv=''S'''+
             ' AND l.cod_habilidade='+QuotedStr(FrmSolicitacoes.EdtDesc1.Text);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      While Not DMBelShop.CDS_BuscaRapida.Eof do
      Begin
        MySql:=' Insert Into SAL_PROF_HABILIDADES ('+
               ' COD_LOJA, COD_PROFISSIONAL, COD_HABILIDADE, PER_COMISSAO_HAB,'+
               ' COD_SERVICO, VLR_SERVICO, IND_ATIVO, USU_INCLUI)'+
               ' Values ('+
               QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+', '+
               QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+', '+
               QuotedStr(FrmSolicitacoes.EdtDesc1.Text)+', '+
               QuotedStr(VarToStr(FrmSolicitacoes.EdtDesc9.Value))+', '+
               QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Servico').AsString)+', '+
               QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Vlr_HabServ').AsString)+', '+
               QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Ativo').AsString)+', '+
               QuotedStr(Cod_Usuario)+
               ')';
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        DMBelShop.CDS_BuscaRapida.Next;
      End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
      DMBelShop.CDS_BuscaRapida.Close;

      DateSeparator:='/';
      DecimalSeparator:=',';

      DMSalao.CDS_HabilidadesProf.Close;
      DMSalao.CDS_HabilidadesProf.Open;
      DMSalao.CDS_HabilidadesProf.Locate('COD_HABILIDADE', FrmSolicitacoes.EdtDesc1.Text,[]);

    End; // If bgProcessar Then

    FrmSolicitacoes.Free;
    FrmSolicitacoes:=nil;
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmSalao.Bt_CadProfHabAlterarClick(Sender: TObject);
Var
  MySql: String;
Begin
  Dbg_CadProfHab.SetFocus;

  If DMSalao.CDS_HabilidadesProf.IsEmpty Then
  Exit;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(10);

  FrmSolicitacoes.Gb_Desc3.Visible :=False;
  FrmSolicitacoes.Gb_Desc4.Visible :=False;
  FrmSolicitacoes.Gb_Desc5.Visible :=False;
  FrmSolicitacoes.Gb_Desc6.Visible :=False;
  FrmSolicitacoes.Gb_Desc7.Visible :=False;
  FrmSolicitacoes.Gb_Desc10.Visible :=False;

  FrmSolicitacoes.Ts_ManutDiversas.Caption:=' HABILIDADES ';

  FrmSolicitacoes.Gb_Desc1.Caption:=' Código  ';
  FrmSolicitacoes.Gb_Desc1.TabOrder:=0;
  FrmSolicitacoes.EdtDesc1.Text:=DMSalao.CDS_HabilidadesProfCOD_HABILIDADE.AsString;
  FrmSolicitacoes.EdtDesc1.ReadOnly:=True;
  FrmSolicitacoes.EdtDesc1.Color:=$00DFDFFF;
  FrmSolicitacoes.Gb_Desc1.Top:=FrmSolicitacoes.Gb_Desc3.Top;

  FrmSolicitacoes.Gb_Desc2.Caption:=' Habilidade ';
  FrmSolicitacoes.Gb_Desc2.TabOrder:=1;
  FrmSolicitacoes.EdtDesc2.Text:=DMSalao.CDS_HabilidadesProfHABILIDADE.AsString;
  FrmSolicitacoes.EdtDesc2.ReadOnly:=True;
  FrmSolicitacoes.EdtDesc2.Color:=$00DFDFFF;
  FrmSolicitacoes.Gb_Desc2.Top:=FrmSolicitacoes.Gb_Desc3.Top;

  FrmSolicitacoes.Gb_Desc9.Caption:=' Comissão ';
  FrmSolicitacoes.Gb_Desc9.TabOrder:=2;
  FrmSolicitacoes.EdtDesc9.Value:=DMSalao.CDS_HabilidadesProfPER_COMISSAO.AsCurrency;
  FrmSolicitacoes.EdtDesc9.MaxValue:=100;
  FrmSolicitacoes.EdtDesc9.MinValue:=0;
  FrmSolicitacoes.Gb_Desc9.Top:=FrmSolicitacoes.Gb_Desc4.Top;
  FrmSolicitacoes.Gb_Desc9.Left:=FrmSolicitacoes.Gb_Desc4.Left;

  FrmSolicitacoes.Gb_Desc8.Caption:=' Ativo ';
  FrmSolicitacoes.Gb_Desc8.TabOrder:=3;
  FrmSolicitacoes.CkbDesc8.Checked:=(DMSalao.CDS_HabilidadesProfATIVO.AsString='SIM');
  FrmSolicitacoes.CkbDesc8Click(Self);
  FrmSolicitacoes.Gb_Desc8.Top:=FrmSolicitacoes.Gb_Desc5.Top;
  FrmSolicitacoes.Gb_Desc8.Left:=FrmSolicitacoes.Gb_Desc5.Left;

  // Campos a Consistir
  FrmSolicitacoes.sgComponentesConsiste:='EdtDesc2;';
  FrmSolicitacoes.Bt_ManutDiversosDML.Caption:='Alterar';
  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' Update SAL_PROF_HABILIDADES'+
           ' Set PER_COMISSAO_HAB='+QuotedStr(VarToStr(FrmSolicitacoes.EdtDesc9.Value))+', '+
           ' IND_ATIVO='+QuotedStr(FrmSolicitacoes.CkbDesc8.Caption)+', '+
           ' USU_ALTERA='+QuotedStr(Cod_Usuario)+', '+
           ' DTA_ALTERA=Current_Date'+

           ' Where COD_LOJA='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
           ' And   COD_PROFISSIONAL='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+
           ' And   COD_HABILIDADE='+QuotedStr(DMSalao.CDS_HabilidadesProfCOD_HABILIDADE.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DateSeparator:='/';
    DecimalSeparator:=',';

    DMSalao.CDS_HabilidadesProf.Close;
    DMSalao.CDS_HabilidadesProf.Open;
    DMSalao.CDS_HabilidadesProf.Locate('COD_HABILIDADE', FrmSolicitacoes.EdtDesc1.Text,[]);
  End; // If bgProcessar Then

  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmSalao.Bt_CadProfHabExcluirClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_CadProfHab.SetFocus;

  If DMSalao.CDS_HabilidadesProf.IsEmpty Then
   Exit;

  If msg('Deseja Realmente Excluir'+cr+cr+'a Habilidade Selecionada ??','C')=2 Then
   Exit;

  MySql:=' Delete From SAL_PROF_HABILIDADES'+
         ' Where COD_LOJA='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
         ' And   COD_PROFISSIONAL='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+
         ' And   COD_HABILIDADE='+QuotedStr(DMSalao.CDS_HabilidadesProfCOD_HABILIDADE.AsString);
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  DMSalao.CDS_HabilidadesProf.Close;
  DMSalao.CDS_HabilidadesProf.Open;

end;

procedure TFrmSalao.Bt_CadProfServAlterarClick(Sender: TObject);
Var
  MySql: String;
  iCodHab, iCodServ: Integer;
begin
  Dbg_CadProfServ.SetFocus;

  If DMSalao.CDS_ServicosProf.IsEmpty Then
   Exit;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(10);

  FrmSolicitacoes.Gb_Desc3.Visible :=False;
  FrmSolicitacoes.Gb_Desc4.Visible :=False;
  FrmSolicitacoes.Gb_Desc5.Visible :=False;
  FrmSolicitacoes.Gb_Desc6.Visible :=False;
  FrmSolicitacoes.Gb_Desc7.Visible :=False;

  FrmSolicitacoes.Ts_ManutDiversas.Caption:=' SERVIÇOS ';

  FrmSolicitacoes.Gb_Desc1.Caption:=' Código  ';
  FrmSolicitacoes.Gb_Desc1.TabOrder:=0;
  FrmSolicitacoes.EdtDesc1.Text:=DMSalao.CDS_ServicosProfCOD_SERVICO.AsString;
  FrmSolicitacoes.EdtDesc1.ReadOnly:=True;
  FrmSolicitacoes.EdtDesc1.Color:=$00DFDFFF;
  FrmSolicitacoes.Gb_Desc1.Top:=FrmSolicitacoes.Gb_Desc3.Top;

  FrmSolicitacoes.Gb_Desc2.Caption:=' Serviço ';
  FrmSolicitacoes.Gb_Desc2.TabOrder:=1;
  FrmSolicitacoes.EdtDesc2.Text:=DMSalao.CDS_ServicosProfSERVICO.AsString;
  FrmSolicitacoes.EdtDesc2.ReadOnly:=True;
  FrmSolicitacoes.EdtDesc2.Color:=$00DFDFFF;
  FrmSolicitacoes.Gb_Desc2.Top:=FrmSolicitacoes.Gb_Desc3.Top;

  FrmSolicitacoes.Gb_Desc9.Caption:=' Preço ';
  FrmSolicitacoes.Gb_Desc9.TabOrder:=2;
  FrmSolicitacoes.EdtDesc9.Value:=DMSalao.CDS_ServicosProfPRECO.AsCurrency;
  FrmSolicitacoes.Gb_Desc9.Top:=FrmSolicitacoes.Gb_Desc4.Top;
  FrmSolicitacoes.Gb_Desc9.Left:=FrmSolicitacoes.Gb_Desc4.Left;

  FrmSolicitacoes.Gb_Desc10.Caption:=' Comissão ';
  FrmSolicitacoes.Gb_Desc10.TabOrder:=3;
  FrmSolicitacoes.EdtDesc10.Value:=DMSalao.CDS_ServicosProfPER_COMISSAO.AsCurrency;
  FrmSolicitacoes.EdtDesc10.MaxValue:=100;
  FrmSolicitacoes.EdtDesc10.MinValue:=0;
  FrmSolicitacoes.Gb_Desc10.Top:=FrmSolicitacoes.Gb_Desc5.Top;
  FrmSolicitacoes.Gb_Desc10.Left:=FrmSolicitacoes.Gb_Desc5.Left;

  FrmSolicitacoes.Gb_Desc8.Caption:=' Ativo ';
  FrmSolicitacoes.Gb_Desc8.TabOrder:=4;
  FrmSolicitacoes.CkbDesc8.Checked:=(DMSalao.CDS_ServicosProfIND_ATIVO.AsString='SIM');
  FrmSolicitacoes.CkbDesc8Click(Self);
  FrmSolicitacoes.Gb_Desc8.Top:=FrmSolicitacoes.Gb_Desc6.Top;
  FrmSolicitacoes.Gb_Desc8.Left:=FrmSolicitacoes.Gb_Desc6.Left;
  FrmSolicitacoes.Gb_Desc8.Visible:=(DMSalao.CDS_HabilidadesProfATIVO.AsString='SIM');

  // Campos a Consistir
  FrmSolicitacoes.sgComponentesConsiste:='EdtDesc2;';
  FrmSolicitacoes.Bt_ManutDiversosDML.Caption:='Alterar';
  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' Update SAL_PROF_HABILIDADES'+
           ' Set VLR_SERVICO='+QuotedStr(VarToStr(FrmSolicitacoes.EdtDesc9.Value))+', '+
           ' PER_COMISSAO_SERV='+QuotedStr(VarToStr(FrmSolicitacoes.EdtDesc10.Value))+', '+
           ' IND_ATIVO='+QuotedStr(FrmSolicitacoes.CkbDesc8.Caption)+', '+
           ' USU_ALTERA='+QuotedStr(Cod_Usuario)+', '+
           ' DTA_ALTERA=Current_Date'+

           ' Where COD_LOJA='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
           ' And   COD_PROFISSIONAL='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+
           ' And   COD_HABILIDADE='+QuotedStr(DMSalao.CDS_HabilidadesProfCOD_HABILIDADE.AsString)+
           ' And   COD_SERVICO='+QuotedStr(DMSalao.CDS_ServicosProfCOD_SERVICO.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DateSeparator:='/';
    DecimalSeparator:=',';

    iCodHab:=DMSalao.CDS_HabilidadesProfCOD_HABILIDADE.AsInteger;
    iCodServ:=DMSalao.CDS_ServicosProfCOD_SERVICO.AsInteger;
    DMSalao.CDS_HabilidadesProf.Close;
    DMSalao.CDS_HabilidadesProf.Open;
    DMSalao.CDS_HabilidadesProf.Locate('COD_HABILIDADE', iCodHab,[]);

    DMSalao.CDS_ServicosProf.Locate('COD_SERVICO', iCodServ,[]);
  End; // If bgProcessar Then

  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;
end;

procedure TFrmSalao.EdtDt_CadProfIniContratoExit(Sender: TObject);
begin
  DMSalao.CDS_ProfissionaisNUM_MESES_CONTRATO.AsInteger:=0;

  If (EdtDt_CadProfFimContrato.Text='  /  /    ') and (EdtDt_CadProfFimContrato.Text='  /  /    ') Then
   Exit;

  If EdtDt_CadProfIniContrato.Text<>'  /  /    ' Then
  Begin
    Try
      StrToDate(EdtDt_CadProfIniContrato.Text);
    Except
      msg('Data de Início do Contrato Inválida !!','A');
      EdtDt_CadProfIniContrato.SetFocus;
      Exit;
    End;

    If EdtDt_CadProfFimContrato.Text='  /  /    ' Then
    Begin
      msg('Favor Informar a Data de'+cr+cr+'Fim do Contrato !!','A');
      EdtDt_CadProfFimContrato.SetFocus;
      Exit;
    End;
  End;

  If EdtDt_CadProfFimContrato.Text<>'  /  /    ' Then
  Begin
    Try
      StrToDate(EdtDt_CadProfFimContrato.Text);
    Except
      msg('Data do Final do Contrato Inválida !!','A');
      EdtDt_CadProfFimContrato.SetFocus;
      Exit;
    End;

    If EdtDt_CadProfIniContrato.Text='  /  /    ' then
    Begin
      msg('Favor Informar a Data de'+cr+cr+'Início do Contrato !!','A');
      EdtDt_CadProfIniContrato.SetFocus;
      Exit;
    End;
  End;

  If (EdtDt_CadProfFimContrato.Text<>'  /  /    ') and (EdtDt_CadProfFimContrato.Text<>'  /  /    ') Then
  Begin
    If StrToDate(EdtDt_CadProfFimContrato.Text)<=StrToDate(EdtDt_CadProfIniContrato.Text) Then
    Begin
      msg('Período do Contrato Inválido !!','A');
      EdtDt_CadProfIniContrato.Text:='  /  /    ';
      EdtDt_CadProfFimContrato.Text:='  /  /    ';
      EdtDt_CadProfIniContrato.SetFocus;
      Exit;
    End;
  End;

  DMSalao.CDS_ProfissionaisNUM_MESES_CONTRATO.AsInteger:=ParteInteiro(CurrToStr((
               EdtDt_CadProfFimContrato.Date-EdtDt_CadProfIniContrato.Date)/30));

end;

procedure TFrmSalao.EdtDt_CadProfFimContratoExit(Sender: TObject);
begin
  If (EdtDt_CadProfIniContrato.Text<>'  /  /    ') and (EdtDt_CadProfFimContrato.Text='  /  /    ') Then
  Begin
     msg('Favor Informar a Data do Fim do Contrato !!','A');
     EdtDt_CadProfFimContrato.SetFocus;
     Exit;
  End;

  EdtDt_CadProfIniContratoExit(Self);
end;

procedure TFrmSalao.Dbg_HabilidadesDblClick(Sender: TObject);
begin
  Bt_HabAterarClick(Self);
end;

procedure TFrmSalao.Dbg_ServicosDblClick(Sender: TObject);
begin
  Bt_ServAlterarClick(Self);
end;

procedure TFrmSalao.Dbg_CadProfHabDblClick(Sender: TObject);
begin
  Bt_CadProfHabAlterarClick(Self);
end;

procedure TFrmSalao.Dbg_CadProfServDblClick(Sender: TObject);
begin
  Bt_CadProfServAlterarClick(Self);
end;

procedure TFrmSalao.Dbg_CadProfDependentesDblClick(Sender: TObject);
begin
  Bt_CadProfDependenteAlterarClick(Self);
end;

procedure TFrmSalao.Dbg_CadProfFonesDblClick(Sender: TObject);
begin
  Bt_CadProfFoneAlterarClick(Self);
end;

procedure TFrmSalao.Dbg_CadProfEmailsDblClick(Sender: TObject);
begin
  Bt_CadProfEmailAlterarClick(Self);
end;

procedure TFrmSalao.Dbm_CadProfRenovacoesDblClick(Sender: TObject);
Begin
//  ShowMessage(Dbm_CadProfRenovacoes.Lines[Dbm_CadProfRenovacoes.CaretPos.Y]);
//  Dbm_CadProfRenovacoes.Lines.Delete(Dbm_CadProfRenovacoes.CaretPos.Y);
//  [Dbm_CadProfRenovacoes.CaretPos.Y];
end;

procedure TFrmSalao.Bt_CadProfNovaRenovacaoClick(Sender: TObject);
Var
  i: Integer;
  mMemo: TMemo;
begin

  If (StrToIntDef(DMSalao.CDS_ProfissionaisNUM_MESES_CONTRATO.AsString,99999999)=99999999) Or
     (EdtDt_CadProfIniContrato.Text='  /  /    ') Or (EdtDt_CadProfFimContrato.Text='  /  /    ')  Then
  Begin
    msg('Sem Período de'+cr+cr+'Início e Fim do Contrato !!','A');
    Exit;
  End;

  bgSair:=False;
  FrmPeriodoApropriacao:=TFrmPeriodoApropriacao.Create(Self);
  FrmPeriodoApropriacao.Caption:='RENOVAÇÃO DE CONTRATO';
  FrmPeriodoApropriacao.Lb_Informacao.Caption:='Informe o Período de Renovação de Contrato';
  FrmPeriodoApropriacao.Lb_Numero.Caption:='=> Informe o Nº de Meses do Período de Renovação';
  FrmPeriodoApropriacao.EdtNumero.AsInteger:=DMSalao.CDS_ProfissionaisNUM_MESES_CONTRATO.AsInteger;
  FrmPeriodoApropriacao.Lb_Numero.Visible:=True;
  FrmPeriodoApropriacao.EdtNumero.Visible:=True;

  //FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Properties.ReadOnly:=True;
  FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.TabStop:=False;
  FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Style.Color:=cl3DLight;

  //FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Properties.ReadOnly:=True;
  FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.TabStop:=False;
  FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Style.Color:=cl3DLight;

  // Acerta Periodo da Nova Renovação ==========================================
  i:=DMSalao.CDS_ProfissionaisNUM_MESES_CONTRATO.AsInteger;
  If (EdtDt_CadProfFimRenovacao.Text<>'  /  /    ') And (EdtDt_CadProfFimRenovacao.Text<>'  /  /    ')  Then
   Begin
     FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Text:=
                          DateToStr(StrToDate(EdtDt_CadProfFimRenovacao.Text)+1);
     FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Text   :=
                          DateToStr(IncMonth(StrToDate(EdtDt_CadProfFimRenovacao.Text),i));
   End
  Else // If (EdtDt_CadProfFimRenovacao.Text<>'  /  /    ') And (EdtDt_CadProfFimRenovacao.Text<>'  /  /    ')  Then
   Begin
     FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Text:=
                          DateToStr(StrToDate(EdtDt_CadProfFimContrato.Text)+1);
     FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Text   :=
                          DateToStr(IncMonth(StrToDate(EdtDt_CadProfFimContrato.Text),i));
   End; // If (EdtDt_CadProfFimRenovacao.Text<>'  /  /    ') And (EdtDt_CadProfFimRenovacao.Text<>'  /  /    ')  Then

  FrmPeriodoApropriacao.ShowModal;

  If bgSiga Then
  Begin
    mMemo:=TMemo.Create(Self);
    mMemo.Visible:=False;
    mMemo.Parent:=FrmSalao;
    mMemo.Width:=500;
    mMemo.Lines.Clear;

    mMemo.Text:=DMSalao.CDS_ProfissionaisBLOB_RENOVACOES.AsString;
    mMemo.Lines.Add(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Text+ ' a '+
                    FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Text);
    DMSalao.CDS_ProfissionaisBLOB_RENOVACOES.AsString:=mMemo.Lines.Text;

    EdtDt_CadProfIniRenovacao.Date:=FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date;
    EdtDt_CadProfFimRenovacao.Date:=FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date;

    mMemo.Free;
    mMemo:=Nil;

  End;
  FrmPeriodoApropriacao.Free;
  FrmPeriodoApropriacao:=nil;

end;

procedure TFrmSalao.Bt_CadProfExcluiRenovacaoClick(Sender: TObject);
Var
  i: Integer;
  mMemo: TMemo;
begin
  If (EdtDt_CadProfIniRenovacao.Text='  /  /    ') Or (EdtDt_CadProfFimRenovacao.Text='  /  /    ')  Then
  Begin
    msg('Sem Período de Renovação'+cr+cr+'A Excluir !!','A');
    Exit;
  End;

  If msg('Deseja Realmente Excluir a'+cr+cr+'Ultima Renovação ??','C')=2 Then
   Exit;

  mMemo:=TMemo.Create(Self);
  mMemo.Visible:=False;
  mMemo.Parent:=FrmSalao;
  mMemo.Width:=500;
  mMemo.Lines.Clear;

  mMemo.Text:=DMSalao.CDS_ProfissionaisBLOB_RENOVACOES.AsString;

  For i:=0 to mMemo.Lines.Count-1 do
  Begin
    If mMemo.Lines[i]=EdtDt_CadProfIniRenovacao.Text+' a '+EdtDt_CadProfFimRenovacao.Text Then
    Begin
      EdtDt_CadProfIniRenovacao.Text:=Copy(mMemo.Lines[i-1],1,10);
      EdtDt_CadProfFimRenovacao.Text:=Copy(mMemo.Lines[i-1],14,10);

      mMemo.Lines.Delete(i);
    End;
  End; // For i:=0 to Dbm_CadProfRenovacoes.Lines.Count-' do
  DMSalao.CDS_ProfissionaisBLOB_RENOVACOES.AsString:=mMemo.Lines.Text;

  FreeAndNil(mMemo);
end;

procedure TFrmSalao.PC_CadProfSidicomChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_CadProfSidicom);
end;

procedure TFrmSalao.Rb_CadProfSidPercentuaisClick(Sender: TObject);
Var
  b: Boolean;
begin
  AcertaRb_Style(Rb_CadProfSidPercentuais);
  AcertaRb_Style(Rb_CadProfSidDescontos);
  AcertaRb_Style(Rb_CadProfSidListaPreco);

  AcertaRb_Style(Rb_CadProfSidTabela0);
  AcertaRb_Style(Rb_CadProfSidTabela1);
  AcertaRb_Style(Rb_CadProfSidTabela2);
  AcertaRb_Style(Rb_CadProfSidTabela3);
  AcertaRb_Style(Rb_CadProfSidTabela4);
  AcertaRb_Style(Rb_CadProfSidTabela5);
  AcertaRb_Style(Rb_CadProfSidTabela6);
  AcertaRb_Style(Rb_CadProfSidTabela7);
  AcertaRb_Style(Rb_CadProfSidTabela8);

  b:=False;
  If Rb_CadProfSidPercentuais.Checked Then
   b:=True;

  Rb_CadProfSidTabela0.Enabled:=b;
  Rb_CadProfSidTabela1.Enabled:=b;
  Rb_CadProfSidTabela2.Enabled:=b;
  Rb_CadProfSidTabela3.Enabled:=b;
  Rb_CadProfSidTabela4.Enabled:=b;
  Rb_CadProfSidTabela5.Enabled:=b;
  Rb_CadProfSidTabela6.Enabled:=b;
  Rb_CadProfSidTabela7.Enabled:=b;
  Rb_CadProfSidTabela8.Enabled:=b;

end;

procedure TFrmSalao.Rb_CadProfSidPercentuaisKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_CadProfSidPercentuaisClick(Self);
end;

procedure TFrmSalao.EdtCadProfSidCodSupervisorExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtCadProfSidCodSupervisor.Value<>0 Then
  Begin
    // Busca Profissional ======================================================
    Screen.Cursor:=crAppStart;
    MySql:=' SELECT p.des_profissional, p.cod_profissional'+
           ' FROM sal_profissionais p'+
           ' WHERE p.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
           ' AND p.cod_profissional='+QuotedStr(FormatFloat('000000',EdtCadProfSidCodSupervisor.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    Screen.Cursor:=crDefault;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString)='' Then
    Begin
       msg('Profissional NÃO Encontrado !!!', 'A');
       DMBelShop.CDS_BuscaRapida.Close;
       EdtCadProfSidCodSupervisor.Clear;
       EdtCadProfSidCodSupervisor.SetFocus;
       Exit;
    End;

    MySql:=' DELETE FROM SAL_PROF_SUPERVISOR s'+
           ' WHERE s.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
           ' AND   s.cod_profissional='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    MySql:=' INSERT INTO SAL_PROF_SUPERVISOR (COD_LOJA, COD_SUPERVISOR, COD_PROFISSIONAL, USU_INCLUI)'+
           ' Values('+
           QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+', '+
           QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString)+', '+
           QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+', '+
           QuotedStr(Cod_Usuario)+')';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DMSalao.CDS_SID_Supervisor.Close;
    DMSalao.CDS_SID_Supervisor.Open;

    DMSalao.CDS_SID_Vendedores.Close;
    DMSalao.CDS_SID_Vendedores.Open;

    EdtCadProfSidCodSupervisor.Text:='0';
    EdtCadProfSidCodSupervisor.SetFocus;

    DMBelShop.CDS_BuscaRapida.Close;
  End;
end;

procedure TFrmSalao.EdtCadProfSidCodVendedorExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtCadProfSidCodVendedor.Value<>0 Then
  Begin
    // Busca Profissional ======================================================
    Screen.Cursor:=crAppStart;
    MySql:=' SELECT p.des_profissional, p.cod_profissional'+
           ' FROM sal_profissionais p'+
           ' WHERE p.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
           ' AND p.cod_profissional='+QuotedStr(FormatFloat('000000',EdtCadProfSidCodVendedor.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    Screen.Cursor:=crDefault;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString)='' Then
    Begin
       msg('Profissional NÃO Encontrado !!!', 'A');
       DMBelShop.CDS_BuscaRapida.Close;
       EdtCadProfSidCodVendedor.Clear;
       EdtCadProfSidCodVendedor.SetFocus;
       Exit;
    End;

    If DMSalao.CDS_SID_Vendedores.Locate('Codigo',DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString,[]) Then
    Begin
      msg('Profissional Já Informado !!','A');
      DMBelShop.CDS_BuscaRapida.Close;
      EdtCadProfSidCodVendedor.Clear;
      EdtCadProfSidCodVendedor.SetFocus;
      Exit;
    End;

    MySql:=' DELETE FROM SAL_PROF_SUPERVISOR s'+
           ' WHERE s.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
           ' AND   s.cod_profissional='+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    MySql:=' INSERT INTO SAL_PROF_SUPERVISOR (COD_LOJA, COD_SUPERVISOR, COD_PROFISSIONAL, USU_INCLUI)'+
           ' Values('+
           QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+', '+
           QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+', '+
           QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString)+', '+
           QuotedStr(Cod_Usuario)+')';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DMSalao.CDS_SID_Supervisor.Close;
    DMSalao.CDS_SID_Supervisor.Open;

    sgCodigo:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Profissional').AsString;
    DMSalao.CDS_SID_Vendedores.Close;
    DMSalao.CDS_SID_Vendedores.Open;
    DMSalao.CDS_SID_Vendedores.Locate('Codigo',sgCodigo,[]);
                                                            
    EdtCadProfSidCodVendedor.Text:='0';
    EdtCadProfSidCodVendedor.SetFocus;
  End;

  DMBelShop.CDS_BuscaRapida.Close;

end;

procedure TFrmSalao.Ckb_CadProfSidSuperAtivoClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_CadProfSidSuperAtivo);
  AcertaCkb_Style(Ckb_CadProfSidSuperInativo);
  AcertaCkb_Style(Ckb_CadProfSidVendAtivo);
  AcertaCkb_Style(Ckb_CadProfSidVendInativo);
end;

procedure TFrmSalao.Ckb_CadProfSidSuperAtivoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AcertaCkb_Style(Ckb_CadProfSidSuperAtivo);
  AcertaCkb_Style(Ckb_CadProfSidSuperInativo);
  AcertaCkb_Style(Ckb_CadProfSidVendAtivo);
  AcertaCkb_Style(Ckb_CadProfSidVendInativo);

end;

procedure TFrmSalao.Bt_CadProfSidExcluiSupervisorClick(Sender: TObject);
Var
  MySql: String;
begin
  If DMSalao.CDS_SID_Supervisor.IsEmpty Then
   Exit;

  If msg('Deseja Realmente EXCLUIR o'+cr+cr+'Supervisor do Profissional  ??','C')=2 Then
   Exit;

  MySql:=' DELETE FROM SAL_PROF_SUPERVISOR s'+
         ' WHERE s.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
         ' AND   s.cod_profissional='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  DMSalao.CDS_SID_Supervisor.Close;
  DMSalao.CDS_SID_Supervisor.Open;

  DMSalao.CDS_SID_Vendedores.Close;
  DMSalao.CDS_SID_Vendedores.Open;
end;

procedure TFrmSalao.Bt_CadProfSidExcluiVendedorClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_CadProfSidVendedor.SetFocus;

  If DMSalao.CDS_SID_Vendedores.IsEmpty Then
   Exit;

  If msg('Deseja Realmente EXCLUIR o'+cr+cr+'Profissional Selecionado ??','C')=2 Then
   Exit;

  MySql:=' DELETE FROM SAL_PROF_SUPERVISOR s'+
         ' WHERE s.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
         ' AND   s.cod_supervisor='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+
         ' AND   s.cod_profissional='+QuotedStr(DMSalao.CDS_SID_VendedoresCODIGO.AsString);
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  DMSalao.CDS_SID_Supervisor.Close;
  DMSalao.CDS_SID_Supervisor.Open;

  DMSalao.CDS_SID_Vendedores.Close;
  DMSalao.CDS_SID_Vendedores.Open;
end;

procedure TFrmSalao.Bt_CadProfSidBuscaSupervisorClick(Sender: TObject);
Var
  MySql: String;
Begin
  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;
  MySql:=' SELECT p.des_profissional Profissional, p.cod_profissional Codigo, p.ind_Ativo Ativo'+
         ' FROM sal_profissionais p'+
         ' WHERE p.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
         ' AND p.tip_pessoa='+QuotedStr('P');

         If (Ckb_CadProfSidSuperAtivo.Checked) and (Not Ckb_CadProfSidSuperInativo.Checked) Then
          MySql:=MySql+' And p.ind_Ativo='+QuotedStr('SIM');

         If (Not Ckb_CadProfSidSuperAtivo.Checked) and (Ckb_CadProfSidSuperInativo.Checked) Then
          MySql:=MySql+' And p.ind_Ativo='+QuotedStr('NAO');

         MySql:=MySql+' Order by 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Codigo').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    DMBelShop.CDS_Pesquisa.Close;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Profissional';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Profissional';

  // Campos Qualquer de Retorno ================================================
  // Variavel de Entrada  - Variavel de Retorno
  // Campo_Retorno1       - Retorno1

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;

  // Fecha Pesquisa
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    If DMSalao.CDS_SID_Supervisor.Locate('Codigo',FrmPesquisa.EdtCodigo.Text,[]) Then
    Begin
      msg('Supervisor Já Informado !!','A');
      DMBelShop.CDS_Pesquisa.Close;
      FrmPesquisa.Free;
      FrmPesquisa:=nil;
      Exit;
    End;

    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' DELETE FROM SAL_PROF_SUPERVISOR s'+
           ' WHERE s.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
           ' AND   s.cod_profissional='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    MySql:=' INSERT INTO SAL_PROF_SUPERVISOR (COD_LOJA, COD_SUPERVISOR, COD_PROFISSIONAL, USU_INCLUI)'+
           ' Values('+
           QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+', '+
           QuotedStr(FrmPesquisa.EdtCodigo.Text)+', '+
           QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+', '+
           QuotedStr(Cod_Usuario)+')';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DMSalao.CDS_SID_Supervisor.Close;
    DMSalao.CDS_SID_Supervisor.Open;

    DMSalao.CDS_SID_Vendedores.Close;
    DMSalao.CDS_SID_Vendedores.Open;

    DateSeparator:='/';
    DecimalSeparator:=',';
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmSalao.Bt_CadProfSidBuscaVendedorClick(Sender: TObject);
Var
  MySql: String;
Begin
  Dbg_CadProfSidVendedor.SetFocus;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;
  MySql:=' SELECT p.des_profissional Profissional, p.cod_profissional Codigo, p.ind_Ativo Ativo'+
         ' FROM sal_profissionais p'+
         ' WHERE p.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
         ' AND   p.tip_pessoa='+QuotedStr('P');

         If (Ckb_CadProfSidVendAtivo.Checked) and (Not Ckb_CadProfSidVendInativo.Checked) Then
          MySql:=MySql+' And p.ind_Ativo='+QuotedStr('SIM');

         If (Not Ckb_CadProfSidVendAtivo.Checked) and (Ckb_CadProfSidVendInativo.Checked) Then
          MySql:=MySql+' And p.ind_Ativo='+QuotedStr('NAO');

         MySql:=MySql+' Order by 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Codigo').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    DMBelShop.CDS_Pesquisa.Close;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Profissional';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Profissional';

  // Campos Qualquer de Retorno ================================================
  // Variavel de Entrada  - Variavel de Retorno
  // Campo_Retorno1       - Retorno1

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;

  // Fecha Pesquisa
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    If DMSalao.CDS_SID_Vendedores.Locate('Codigo',FrmPesquisa.EdtCodigo.Text,[]) Then
    Begin
      msg('Vendedor Já Informado !!','A');
      DMBelShop.CDS_Pesquisa.Close;
      FrmPesquisa.Free;
      FrmPesquisa:=nil;
      Exit;
    End;

    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' DELETE FROM SAL_PROF_SUPERVISOR s'+
           ' WHERE s.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
           ' AND   s.cod_profissional='+QuotedStr(FrmPesquisa.EdtCodigo.Text);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    MySql:=' INSERT INTO SAL_PROF_SUPERVISOR (COD_LOJA, COD_SUPERVISOR, COD_PROFISSIONAL, USU_INCLUI)'+
           ' Values('+
           QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+', '+
           QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+', '+
           QuotedStr(FrmPesquisa.EdtCodigo.Text)+', '+
           QuotedStr(Cod_Usuario)+')';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DMSalao.CDS_SID_Supervisor.Close;
    DMSalao.CDS_SID_Supervisor.Open;

    DMSalao.CDS_SID_Vendedores.Close;
    DMSalao.CDS_SID_Vendedores.Open;

    DateSeparator:='/';
    DecimalSeparator:=',';
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmSalao.Cbx_SituacaoClick(Sender: TObject);
Var
  MySql: String;
begin
  If EdtCodLoja.Value<>0 Then
  Begin
    bgDrawColumnCell:=False;
    Bt_CadProfVerificaCad.Caption:='Verificar Cadastro';

    sgCodEmp:=FormatFloat('00',EdtCodLoja.AsInteger);

    MySql:=' SELECT *'+
           ' FROM SAL_PROFISSIONAIS p'+
           ' WHERE p.cod_loja='+QuotedStr(sgCodEmp);

           If (Ckb_Profissionais.Checked) and (Not Ckb_Vendedores.Checked) Then
            MySql:=MySql+' AND p.TIP_PESSOA=''P'''
           Else If (Not Ckb_Profissionais.Checked) and (Ckb_Vendedores.Checked) Then
            MySql:=MySql+' AND p.TIP_PESSOA=''V''';

           If Cbx_Situacao.ItemIndex=0 Then MySql:=MySql+' AND p.ind_ativo=''SIM''';
           If Cbx_Situacao.ItemIndex=1 Then MySql:=MySql+' AND p.ind_ativo=''NAO''';

           MySql:=MySql+' ORDER BY p.des_profissional';
    DMSalao.CDS_Profissionais.Close;
    DMSalao.SDS_Profissionais.CommandText:=MySql;
    DMSalao.CDS_Profissionais.Open;

    If DMSalao.CDS_Profissionais.Eof Then
    Begin
      DMSalao.CDS_Profissionais.Close;
      msg('Loja Sem Profissional a Listar !!','A');
      EdtCodLoja.Clear;
      EdtCodLoja.SetFocus;
      Exit;
    End;

    Ckb_ProfissionaisClick(Self);

//    DMSalao.CDS_Profissionais.First;
//    DMSalao.CDS_Profissionais.Next;
//    DMSalao.CDS_Profissionais.Last;
//    DMSalao.CDS_Profissionais.First;

    Dbg_Profissionais.SetFocus;
  End; // If EdtCodLoja.Value<>0 Then
end;

procedure TFrmSalao.Bt_CadProfLocalizarClick(Sender: TObject);
begin

  //============================================================================
  // Pesquisa Profissional na Loja já Selecionada ==============================
  //============================================================================
  If not Ckb_CadProfLocalizarQualquerLj.Checked Then
  Begin
    If DMSalao.CDS_Profissionais.IsEmpty Then
     Exit;

    If StrToIntDef(EdtCadProfLocalizar.Text,99999999)=99999999 Then
     Begin
       If Not DMSalao.CDS_Profissionais.Locate('DES_PROFISSIONAL', EdtCadProfLocalizar.Text,[]) Then
       Begin
         If Not LocalizaRegistro(DMSalao.CDS_Profissionais, 'DES_PROFISSIONAL', EdtCadProfLocalizar.Text) Then
         Begin
           msg('Nome Não Encontrado !!','A');
           DMSalao.CDS_Profissionais.First;
         End;
       End; // If Not DMSalao.CDS_Profissionais.Locate('DES_PROFISSIONAL', EdtCadProfLocalizar.Text,[]) Then
     End
    Else // If StrToIntDef(EdtCadProfLocalizar.Text,99999999)=99999999 Then
     Begin
       If Not DMSalao.CDS_Profissionais.Locate('COD_PROFISSIONAL', EdtCadProfLocalizar.Text,[]) Then
       Begin
         If Not LocalizaRegistro(DMSalao.CDS_Profissionais, 'COD_PROFISSIONAL',
                                 FormatFloat('000000',StrToInt(EdtCadProfLocalizar.Text))) Then
         Begin
           msg('Código Não Encontrado !!','A');
           DMSalao.CDS_Profissionais.First;
         End;
       End; // If Not DMSalao.CDS_Profissionais.Locate('COD_PROFISSIONAL', EdtCadProfLocalizar.Text,[]) Then
     End; // If StrToIntDef(EdtCadProfLocalizar.Text,99999999)=99999999 Then
  End; // If not Ckb_CadProfLocalizarQualquerLj.Checked Then

  //============================================================================
  // Pesquisa Profissional em Quarquer Loja ====================================
  //============================================================================
  If Ckb_CadProfLocalizarQualquerLj.Checked Then
  Begin
    // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
    FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
    FrmBelShop.AbreSolicitacoes(15);

    FrmSolicitacoes.EdtProfSelecionaNome.Text:=EdtCadProfLocalizar.Text;

    bgProcessar:=False;
    FrmSolicitacoes.ShowModal;

    If bgProcessar Then
    Begin
      Cbx_Situacao.ItemIndex:=FrmSolicitacoes.Cbx_ProfSelecionaSituacao.ItemIndex;

      EdtCodLoja.Value:=StrToInt(sgTipoDML);
      EdtCodLojaExit(Self);

      If Not DMSalao.CDS_Profissionais.IsEmpty Then
       DMSalao.CDS_Profissionais.Locate('COD_PROFISSIONAL',sgCodigo,[]);
    End; // If bgProcessar Then

    DMSalao.CDS_V_ProfSeleciona.Close;
    FrmSolicitacoes.Free;
    FrmSolicitacoes:=nil;
  End; // If Ckb_CadProfLocalizarQualquerLj.Checked Then
end;

procedure TFrmSalao.Cbx_CadProfTpPessoaExit(Sender: TObject);
begin
  if Trim(Cbx_CadProfTpPessoa.Text)='' Then
  Begin
    msg('Favor Informar o Tipo de Pessoa !!','A');
    Cbx_CadProfTpPessoa.SetFocus;
    Exit;
  End;

end;

procedure TFrmSalao.Cbx_CadProfTpPessoaChange(Sender: TObject);
begin
  If (Cbx_CadProfTpPessoa.ItemIndex=1) and (Not DMSalao.CDS_HabilidadesProf.IsEmpty) Then
  Begin
    msg('Impossível Alterar !!'+cr+cr+'Este Colaborador Contém Habilidade !!','A');
    Cbx_CadProfTpPessoa.ItemIndex:=0;
    Exit;
  End;

  Ts_CadProfDoctos.TabVisible:=False;
  Ts_CadProfContrato.TabVisible:=False;
  If Cbx_CadProfTpPessoa.ItemIndex=0 Then
  Begin
    Ts_CadProfDoctos.TabVisible:=True;
    Ts_CadProfContrato.TabVisible:=True;
  End;

end;

procedure TFrmSalao.Bt_LiberaConsistenciasClick(Sender: TObject);
Var
  s, MySql: String;
begin

  MySql:=' SELECT c.NUM_SEQ, c.DES_MODULO, c.NUM_ORDEM, c.DES_LABEL, c.IND_LIBERADO'+
         ' FROM CONSISTENCIAS_LIBERAR c'+
         ' WHERE c.codigo=1'+
         ' ORDER BY 2,3';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('DES_MODULO').AsString)='' Then
  Begin
    msg('Consistências Não Definidas !!','A');
    DMBelShop.CDS_BuscaRapida.Close;
    Exit;
  End;

  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(12);

  // Monta Consistencas do Modulo ==============================================
  FrmSolicitacoes.gCDS_V1:=TClientDataSet.Create(Self);
  FrmSolicitacoes.gCDS_V1.FieldDefs.Clear;
  FrmSolicitacoes.gCDS_V1.FieldDefs.Add('NUM_SEQ',ftInteger);
  FrmSolicitacoes.gCDS_V1.FieldDefs.Add('DES_MODULO',ftString,60);
  FrmSolicitacoes.gCDS_V1.FieldDefs.Add('DES_LABEL',ftString,60);
  FrmSolicitacoes.gCDS_V1.FieldDefs.Add('IND_LIBERADO',ftString,3);
  FrmSolicitacoes.gCDS_V1.CreateDataSet;
  FrmSolicitacoes.gCDS_V1.Open;

  s:='';
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin

    If s=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('DES_MODULO').AsString) Then
     Begin
       FrmSolicitacoes.gCDS_V1.Append;
       FrmSolicitacoes.gCDS_V1.FieldByName('NUM_SEQ').AsString:=
                Trim(DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString);
       FrmSolicitacoes.gCDS_V1.FieldByName('DES_LABEL').AsString:=
              Trim(DMBelShop.CDS_BuscaRapida.FieldByName('DES_LABEL').AsString);
       FrmSolicitacoes.gCDS_V1.FieldByName('IND_LIBERADO').AsString:=
           Trim(DMBelShop.CDS_BuscaRapida.FieldByName('IND_LIBERADO').AsString);
       FrmSolicitacoes.gCDS_V1.Post;
    End
    Else // If s=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('DES_MODULO').AsString) Then
     Begin
       FrmSolicitacoes.gCDS_V1.Append;
       FrmSolicitacoes.gCDS_V1.FieldByName('NUM_SEQ').AsString:=
                Trim(DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString);
       FrmSolicitacoes.gCDS_V1.FieldByName('DES_MODULO').AsString:=
             Trim(DMBelShop.CDS_BuscaRapida.FieldByName('DES_MODULO').AsString);
       FrmSolicitacoes.gCDS_V1.FieldByName('DES_LABEL').AsString:=
              Trim(DMBelShop.CDS_BuscaRapida.FieldByName('DES_LABEL').AsString);
       FrmSolicitacoes.gCDS_V1.FieldByName('IND_LIBERADO').AsString:=
           Trim(DMBelShop.CDS_BuscaRapida.FieldByName('IND_LIBERADO').AsString);
       FrmSolicitacoes.gCDS_V1.Post;
     End; // If s=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('DES_MODULO').AsString) Then

    s:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('DES_MODULO').AsString);

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  FrmSolicitacoes.gCDS_V1.First;
  DMBelShop.CDS_BuscaRapida.Close;

  FrmSolicitacoes.gDS_V1:=TDataSource.Create(Self);
  FrmSolicitacoes.gDS_V1.DataSet:=FrmSolicitacoes.gCDS_V1;

  FrmSolicitacoes.Dbg_Consistencias.DataSource:=FrmSolicitacoes.gDS_V1;

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
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

      FrmSolicitacoes.gCDS_V1.First;
      While Not FrmSolicitacoes.gCDS_V1.Eof do
      Begin
        MySql:=' Update CONSISTENCIAS_LIBERAR'+
               ' Set Ind_Liberado='+QuotedStr(FrmSolicitacoes.gCDS_V1.FieldByName('Ind_Liberado').AsString)+
               ' Where Num_Seq='+QuotedStr(FrmSolicitacoes.gCDS_V1.FieldByName('Num_Seq').AsString);
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        FrmSolicitacoes.gCDS_V1.Next;
      End; // While Not FrmSolicitacoes.gCDS_V1.Eof do

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
      End; // on e : Exception do
    End; // Try
  End; // If bgProcessar Then

  FrmSolicitacoes.gDS_V1.Free;
  FrmSolicitacoes.gDS_V1:=nil;

  FrmSolicitacoes.gCDS_V1.Free;
  FrmSolicitacoes.gCDS_V1:=nil;

  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmSalao.Ckb_ProfissionaisClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_Profissionais);
  AcertaCkb_Style(Ckb_Vendedores);

  If Not DMSalao.CDS_Profissionais.IsEmpty Then
  Begin
    DMSalao.CDS_Profissionais.Filtered:=False;
    DMSalao.CDS_Profissionais.Filter:='';

    If (Ckb_Profissionais.Checked) and (Not Ckb_Vendedores.Checked) Then
     DMSalao.CDS_Profissionais.Filter:='TIP_PESSOA=''P'''
    Else If (Not Ckb_Profissionais.Checked) and (Ckb_Vendedores.Checked) Then
     DMSalao.CDS_Profissionais.Filter:='TIP_PESSOA=''V''';

    If Trim(DMSalao.CDS_Profissionais.Filter)<>'' Then
     DMSalao.CDS_Profissionais.Filtered:=True;
  End; // If Not DMSalao.CDS_Profissionais.IsEmpty Then
end;

procedure TFrmSalao.Bt_HabServMaximizarClick(Sender: TObject);
begin
  iWidthPanel:=Pan_HabServ.Width;
  iTopPanel:=Pan_HabServ.Top;
  iHeightPanel:=Pan_HabServ.Height;
  Pan_HabServ.Align:=alClient;

  Bt_HabServMaximizar.Enabled:=False;
  Bt_HabServMinimizar.Enabled:=True;

end;

procedure TFrmSalao.Bt_HabServMinimizarClick(Sender: TObject);
begin
  Pan_HabServ.Width:=iWidthPanel;// 961;
  Pan_HabServ.Align:=alNone;
  Pan_HabServ.Top:=iTopPanel; // 238;
  Pan_HabServ.Left:=0;
  Pan_HabServ.Height:=iHeightPanel; // 179;
  Pan_HabServ.Align:=alBottom;

  Bt_HabServMaximizar.Enabled:=True;
  Bt_HabServMinimizar.Enabled:=False;

end;

procedure TFrmSalao.EdtValesCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtValesDesLoja.Clear;
  DMSalao.CDS_ValesProfissionais.Close;

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

    DtEdt_ValesDtInicio.SetFocus;
    Screen.Cursor:=crDefault;

  End;

  EdtValesCodLoja.Color:=clWindow

end;

procedure TFrmSalao.EdtValesCodLojaChange(Sender: TObject);
begin
  EdtValesDesLoja.Clear;
  EdtValesCodProf.Clear;
  EdtValesDesProf.Clear;
  
  FechaTudoSalao;

end;

procedure TFrmSalao.EdtValesCodProfChange(Sender: TObject);
begin
  EdtValesDesProf.Clear;
  FechaTudoSalao;

end;

procedure TFrmSalao.DtEdt_ValesDtInicioPropertiesChange(Sender: TObject);
begin
  FechaTudoSalao;
end;

procedure TFrmSalao.Ckb_ValesAbertosClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_ValesAbertos);
  DtEdt_ValesDtInicioPropertiesChange(Self);
end;

procedure TFrmSalao.Ckb_ValesFechadosClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_ValesFechados);
  DtEdt_ValesDtInicioPropertiesChange(Self);

end;

procedure TFrmSalao.EdtValesCodProfExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtValesDesProf.Clear;
  DMSalao.CDS_ValesProfissionais.Close;
  Pan_ValesProfInativo.Visible:=False;

  If EdtValesCodProf.Value<>0 Then
  Begin
    If EdtValesCodLoja.AsInteger=0 Then
    Begin
      msg('Favor Informar a Loja !!','A');
      EdtValesCodLoja.SetFocus;
      Exit;
    End;

    Screen.Cursor:=crAppStart;

    // Busca Profissional ======================================================
    MySql:=' SELECT p.des_profissional, p.cod_profissional, p.ind_Ativo'+
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
      msg('Sem Profissiona a Listar!!!', 'A');
      Screen.Cursor:=crDefault;
      EdtValesCodProf.Clear;
      EdtValesCodProf.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtValesDesProf.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Profissional').AsString;

    If DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Ativo').AsString='NAO' Then
     Pan_ValesProfInativo.Visible:=True;

    DMBelShop.CDS_BuscaRapida.Close;

    Screen.Cursor:=crDefault;

  End;
  EdtValesCodProf.Color:=clWindow;

end;

procedure TFrmSalao.Bt_ValesBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtValesCodLoja.Clear;
  EdtValesDesLoja.Clear;

  DMSalao.CDS_ValesProfissionais.Close;

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
     DtEdt_ValesDtInicio.SetFocus;
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

procedure TFrmSalao.Bt_ValesBuscaProfClick(Sender: TObject);
Var
  MySql: String;
begin
  Pan_ValesProfInativo.Visible:=False;

  If EdtValesCodLoja.AsInteger=0 Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtValesCodLoja.SetFocus;
    Exit;
  End;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtValesCodProf.Clear;
  EdtValesDesProf.Clear;

  DMSalao.CDS_ValesProfissionais.Close;

  EdtValesCodProf.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.des_profissional, p.cod_profissional, p.ind_ativo'+
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
    msg('Sem Profissional a Listar !!','A');
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

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtValesCodProf.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtValesDesProf.Text:=FrmPesquisa.EdtDescricao.Text;

     If DMBelShop.CDS_Pesquisa.FieldByName('Ind_Ativo').AsString='NAO' Then
      Pan_ValesProfInativo.Visible:=True;

     Ckb_ValesAbertos.SetFocus;
   End
  Else
   Begin
     EdtValesCodProf.Clear;
     EdtValesDesProf.Clear;
     EdtValesCodProf.SetFocus;
   End;

  Screen.Cursor:=crDefault;
  DMBelShop.CDS_Pesquisa.Close;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmSalao.Ckb_ValesAbertosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ValesAbertosClick(Self);
end;

procedure TFrmSalao.Ckb_ValesFechadosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ValesFechadosClick(Self);
end;

procedure TFrmSalao.Bt_ValesFiltroConsultarClick(Sender: TObject);
Var
  MySql: String;
  sDtaI, sDtaF: String;
begin

  Try
    StrToDate(DtEdt_ValesDtInicio.Text);
  Except
    msg('Data de Início do Período Inválida !!','A');
    DtEdt_ValesDtInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_ValesDtFim.Text);
  Except
    msg('Data do Final do Período Inválida !!','A');
    DtEdt_ValesDtFim.SetFocus;
    Exit;
  End;

  If StrToDate(DtEdt_ValesDtInicio.Text)>StrToDate(DtEdt_ValesDtFim.Text) Then
  Begin
    msg('Período Inválido !!','A');
    DtEdt_ValesDtInicio.Text:='  /  /    ';
    DtEdt_ValesDtFim.Text:='  /  /    ';
    DtEdt_ValesDtInicio.SetFocus;
    Exit;
  End;

  Screen.Cursor:=crAppStart;

  sDtaI:=f_Troca('/','.',DtEdt_ValesDtInicio.Text);
  sDtaI:=f_Troca('-','.',sDtaI);
  sDtaF:=f_Troca('/','.',DtEdt_ValesDtFim.Text);
  sDtaF:=f_Troca('-','.',sDtaF);

  DMSalao.CDS_Vales.Close;

  MySql:=' SELECT distinct p.Cod_loja, p.cod_profissional, p.des_profissional,'+
         ' v.num_docto, v.vlr_original, v.tot_prestacao,'+
         ' v.num_prazo, v.dta_prim_venc, p.ind_ativo,'+
         ' (p.Cod_loja||p.cod_profissional||v.num_docto||v.vlr_original||v.tot_prestacao||v.num_prazo||v.dta_prim_venc) Chave'+

         ' FROM PS_VALES_PESSOAS v, SAL_PROFISSIONAIS p'+
         ' WHERE v.cod_loja=p.cod_loja'+
         ' AND   v.cod_pessoa=p.cod_profissional'+
         ' AND   v.ind_debcred='+QuotedStr('D')+
         ' AND   v.tp_pessoa=1'+
         ' AND   p.tip_pessoa='+QuotedStr('P')+
         ' AND   v.dta_vencimento between '+QuotedStr(sDtaI)+' and '+QuotedStr(sDtaF);

         If EdtValesCodLoja.Value<>0 Then
          MySql:=MySql+' AND   v.cod_loja='+QuotedStr(FormatFloat('00',EdtValesCodLoja.AsInteger));

         If EdtValesCodProf.Value<>0 Then
          MySql:=MySql+' AND   v.cod_pessoa='+QuotedStr(FormatFloat('000000',EdtValesCodProf.AsInteger));

         If (Ckb_ValesAbertos.Checked) And (Not Ckb_ValesFechados.Checked)Then
          MySql:=MySql+' AND v.vlr_pago=0';

         If (Not Ckb_ValesAbertos.Checked) And (Ckb_ValesFechados.Checked)Then
          MySql:=MySql+' AND v.vlr_pago<>0';

         If (Ckb_ValesAtivos.Checked) And (Not Ckb_ValesInativos.Checked)Then
          MySql:=MySql+' AND   p.ind_ativo='+QuotedStr('SIM');

         If (Not Ckb_ValesAtivos.Checked) And (Ckb_ValesInativos.Checked)Then
          MySql:=MySql+' AND   p.ind_ativo='+QuotedStr('NAO');

         MySql:=MySql+' ORDER BY p.des_profissional';
  DMSalao.CDS_ValesProfissionais.Close;
  DMSalao.SDS_ValesProfissionais.CommandText:=MySql;
  DMSalao.CDS_ValesProfissionais.Open;

  If DMSalao.CDS_ValesProfissionais.IsEmpty Then
  Begin
    Screen.Cursor:=crDefault;
    msg('Sem Vales a Listar'+cr+cr+'no Período !!','A');
    DMSalao.CDS_ValesProfissionais.Close;
    DtEdt_ValesDtInicio.SetFocus;
    Exit;
  End;

  Screen.Cursor:=crDefault;

end;

procedure TFrmSalao.Ckb_ValesAtivosClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_ValesAtivos);
  DtEdt_ValesDtInicioPropertiesChange(Self);

end;

procedure TFrmSalao.Ckb_ValesInativosClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_ValesInativos);
  DtEdt_ValesDtInicioPropertiesChange(Self);

end;

procedure TFrmSalao.Ckb_ValesInativosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ValesInativosClick(Self);
end;

procedure TFrmSalao.Ckb_ValesAtivosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ValesAtivosClick(Self);
end;

procedure TFrmSalao.Dbg_ValesProfDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not (gdSelected in State) Then
  Begin
    if DMSalao.CDS_ValesProfissionaisIND_ATIVO.AsString='NAO' Then
    Begin
      Dbg_ValesProf.Canvas.Brush.Color:=clRed;
      Dbg_ValesProf.Canvas.Font.Color:=clWhite;
      Dbg_ValesProf.Canvas.FillRect(Rect);
      Dbg_ValesProf.DefaultDrawDataCell(Rect,Column.Field,state);
    end;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmSalao.Bt_ValesAlterarClick(Sender: TObject);
Var
  sChave: String;
  iNumSeq: Integer;
  MySql: String;
begin
  Dbg_ValesProf.SetFocus;

  If DMSalao.CDS_Vales.IsEmpty Then
   Exit;

  sChave:=DMSalao.CDS_ValesProfissionaisCHAVE.AsString;
  iNumSeq:=DMSalao.CDS_ValesNUM_SEQ.AsInteger;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(13);

  FrmSolicitacoes.Caption:='Manutenção de Vales';

  FrmSolicitacoes.EdtValesCodLoja.Text:=DMSalao.CDS_ValesCOD_LOJA.AsString;
  FrmSolicitacoes.EdtValesCodLojaExit(Self);

  FrmSolicitacoes.EdtValesCodProf.Text:=DMSalao.CDS_ValesCOD_PESSOA.AsString;
  FrmSolicitacoes.EdtValesCodProfExit(Self);

  FrmSolicitacoes.EdtValesDocto.Value:=DMSalao.CDS_ValesNUM_DOCTO.AsInteger;
  FrmSolicitacoes.EdtValesVlrDocto.Value:=DMSalao.CDS_ValesVLR_ORIGINAL.AsCurrency;
  FrmSolicitacoes.EdtValesTotalParc.Value:=DMSalao.CDS_ValesTOT_PRESTACAO.AsInteger;
  FrmSolicitacoes.EdtValesPrazo.Value:=DMSalao.CDS_ValesNUM_PRAZO.AsInteger;
  FrmSolicitacoes.DtEdt_ValesPrimVencto.Date:=DMSalao.CDS_ValesDTA_PRIM_VENC.AsDateTime;

  FrmSolicitacoes.ValesAcertaComponentes(1,$00E0E0E0, True, False, False); // (iTipo:Integer; tCor:TColor; bReadOnly, bEnabled, bVisible:Boolean);

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    // Altera Vales ============================================================
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

      DMSalao.CDS_Vales.First;
      While Not DMSalao.CDS_Vales.Eof do
      Begin
        MySql:=' Update PS_VALES_PESSOAS'+
               ' Set VLR_DESCONTO='+QuotedStr(DMSalao.CDS_ValesVLR_DESCONTO.AsString)+
               ', VLR_ACRESCIMOS='+QuotedStr(DMSalao.CDS_ValesVLR_ACRESCIMOS.AsString)+
               ', VLR_APAGAR='+QuotedStr(DMSalao.CDS_ValesVLR_APAGAR.AsString)+
               ', VLR_PAGO='+QuotedStr(DMSalao.CDS_ValesVLR_PAGO.AsString);

               If Trim(DMSalao.CDS_ValesUSU_ALTERA.AsString)<>'' Then
                MySql:=MySql+', USU_ALTERA='+QuotedStr(DMSalao.CDS_ValesUSU_ALTERA.AsString);

               If Trim(DMSalao.CDS_ValesDTA_ALTERA.AsString)<>'' Then
                MySql:=MySql+', DTA_ALTERA='+QuotedStr(DMSalao.CDS_ValesDTA_ALTERA.AsString);

               If Trim(DMSalao.CDS_ValesNUM_DOCTO_PAGTO.AsString)<>'' Then
                MySql:=MySql+', NUM_DOCTO_PAGTO='+QuotedStr(DMSalao.CDS_ValesNUM_DOCTO_PAGTO.AsString)
               Else
                MySql:=MySql+', NUM_DOCTO_PAGTO='+QuotedStr('0');

               If Trim(DMSalao.CDS_ValesDTA_PAGAMENTO.AsString)<>'' Then
                MySql:=MySql+', DTA_PAGAMENTO='+QuotedStr(DMSalao.CDS_ValesDTA_PAGAMENTO.AsString)
               Else
                MySql:=MySql+', DTA_PAGAMENTO=Null';

               MySql:=MySql+' Where NUM_SEQ='+QuotedStr(DMSalao.CDS_ValesNUM_SEQ.AsString);
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        DMSalao.CDS_Vales.Next;
      End; // While Not DMSalao.CDS_Vales.Eof do

      // Fecha Transação ===========================================================
      If (DMSalao.CDS_Vales.State=dsInsert) Or (DMSalao.CDS_Vales.State=dsEdit) Then
       DMSalao.CDS_Vales.CancelUpdates;

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);
    Except
      on e : Exception do
      Begin
        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try
  End; // If bgProcessar Then

  DateSeparator:='/';
  DecimalSeparator:=',';
  Screen.Cursor:=crDefault;

  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

  Bt_ValesFiltroConsultarClick(Self);

  If Not DMSalao.CDS_ValesProfissionais.IsEmpty Then
  Begin
    DMSalao.CDS_ValesProfissionais.Locate('CHAVE', sChave, []);
    DMSalao.CDS_Vales.Locate('NUM_SEQ', iNumSeq, []);
  End;

  Dbg_ValesProf.SetFocus;
end;

procedure TFrmSalao.Bt_ValesNovoClick(Sender: TObject);
Var
  sChave: String;
  iNumSeq: Integer;
  MySql: String;
  dDtaI, dDtaF: TDate;
begin
  Dbg_ValesProf.SetFocus;

  sChave:=DMSalao.CDS_ValesProfissionaisCHAVE.AsString;
  iNumSeq:=DMSalao.CDS_ValesNUM_SEQ.AsInteger;
  DMSalao.CDS_Vales.Close;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(13);

  FrmSolicitacoes.Caption:='Inclusão de Vales';

  If Trim(EdtValesCodLoja.Text)<>'' Then
  Begin
    FrmSolicitacoes.EdtValesCodLoja.Text:=EdtValesCodLoja.Text;
    FrmSolicitacoes.EdtValesCodLojaExit(Self);
  End;

  If Trim(EdtValesCodProf.Text)<>'' Then
  Begin
    FrmSolicitacoes.EdtValesCodProf.Text:=EdtValesCodProf.Text;
    FrmSolicitacoes.EdtValesCodProfExit(Self);
  End;

  FrmSolicitacoes.ValesAcertaComponentes(5, clWindow, False, True, True);
                          // (iTipo:Integer; tCor:TColor; bReadOnly, bEnabled, bVisible:Boolean);

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    // Altera Vales ============================================================
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

      DMSalao.CDS_Vales.First;
      While Not DMSalao.CDS_Vales.Eof do
      Begin

        If DMSalao.CDS_Vales.RecNo=1 Then
        Begin
          sChave:=DMSalao.CDS_ValesCOD_LOJA.AsString+
                  DMSalao.CDS_ValesNUM_DOCTO.AsString+
                  DMSalao.CDS_ValesVLR_ORIGINAL.AsString+
                  DMSalao.CDS_ValesTOT_PRESTACAO.AsString+
                  DMSalao.CDS_ValesNUM_PRAZO.AsString+
                  DMSalao.CDS_ValesDTA_PRIM_VENC.AsString;
          iNumSeq:=DMSalao.CDS_ValesNUM_SEQ.AsInteger;

          // Apresenta Vales
          sgCodEmp:=DMSalao.CDS_ValesCOD_LOJA.AsString;
          sgCodigo:=DMSalao.CDS_ValesCOD_PESSOA.AsString;
          dDtaI:=DMSalao.CDS_ValesDTA_VENCIMENTO.AsDateTime;
        End;
        dDtaF:=DMSalao.CDS_ValesDTA_VENCIMENTO.AsDateTime;

        MySql:=' Insert into PS_VALES_PESSOAS ('+
               ' NUM_SEQ, TP_PESSOA, COD_LOJA, COD_PESSOA,'+
               ' NUM_DOCTO, IND_DEBCRED, VLR_ORIGINAL, TOT_PRESTACAO, NUM_PRAZO, DTA_PRIM_VENC,'+
               ' NUM_PRESTACAO, DTA_VENCIMENTO, VLR_PRESTACAO,'+
               ' VLR_DESCONTO, VLR_ACRESCIMOS, VLR_APAGAR, VLR_PAGO, NUM_DOCTO_PAGTO,'+
               ' USU_INCLUI)'+

               ' Values('+
               QuotedStr(DMSalao.CDS_ValesNUM_SEQ.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesTP_PESSOA.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesCOD_LOJA.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesCOD_PESSOA.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesNUM_DOCTO.AsString)+', '+
               QuotedStr('D')+', '+
               QuotedStr(DMSalao.CDS_ValesVLR_ORIGINAL.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesTOT_PRESTACAO.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesNUM_PRAZO.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesDTA_PRIM_VENC.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesNUM_PRESTACAO.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesDTA_VENCIMENTO.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesVLR_PRESTACAO.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesVLR_DESCONTO.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesVLR_ACRESCIMOS.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesVLR_APAGAR.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesVLR_PAGO.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesNUM_DOCTO_PAGTO.AsString)+', '+
               QuotedStr(DMSalao.CDS_ValesUSU_INCLUI.AsString)+')';
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        DMSalao.CDS_Vales.Next;
      End; // While Not DMSalao.CDS_Vales.Eof do

      // Fecha Transação ===========================================================
      If (DMSalao.CDS_Vales.State=dsInsert) Or (DMSalao.CDS_Vales.State=dsEdit) Then
       DMSalao.CDS_Vales.CancelUpdates;

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      // Apresenta Novo Vales ======================================================
      EdtValesCodLoja.AsInteger:=StrToInt(sgCodEmp);
      EdtValesCodLojaExit(Self);
      EdtValesCodProf.AsInteger:=StrToInt(sgCodigo);
      EdtValesCodProfExit(Self);

      Ckb_ValesAtivos.Checked:=True;
      Ckb_ValesAtivosClick(Self);

      Ckb_ValesInativos.Checked:=False;
      Ckb_ValesInativosClick(Self);

      Ckb_ValesAbertos.Checked:=True;
      Ckb_ValesAbertosClick(Self);

      Ckb_ValesFechados.Checked:=False;
      Ckb_ValesFechadosClick(Self);

      DtEdt_ValesDtInicio.Date:=dDtaI;
      DtEdt_ValesDtFim.Date:=dDtaF;
      Bt_ValesFiltroConsultarClick(Self);

      DMSalao.CDS_ValesProfissionais.Locate('CHAVE', sChave, []);
      DMSalao.CDS_Vales.Locate('NUM_SEQ', iNumSeq, []);
    Except
      on e : Exception do
      Begin
        FrmSolicitacoes.Free;
        FrmSolicitacoes:=nil;

        DMSalao.CDS_ValesProfissionais.Close;
        DMSalao.CDS_Vales.Close;

        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        Exit;
      End; // on e : Exception do
    End; // Try
  End; // If bgProcessar Then

  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

  If (DMSalao.CDS_ValesProfissionais.Active) And (Not bgProcessar) Then
  Begin
    sChave:=DMSalao.CDS_ValesProfissionaisCHAVE.AsString;
    Bt_ValesFiltroConsultarClick(Self);
    DMSalao.CDS_ValesProfissionais.Locate('CHAVE', sChave, []);
    DMSalao.CDS_Vales.Locate('NUM_SEQ', iNumSeq, []);
  End;

  If DMSalao.CDS_ValesProfissionais.IsEmpty Then
  Begin
    DMSalao.CDS_Vales.Close;

    If EdtValesCodLoja.Value<>0 Then
     Bt_ValesFiltroConsultarClick(Self);
  End;

  Dbg_ValesProf.SetFocus;
end;

procedure TFrmSalao.Dbg_ValesProfEnter(Sender: TObject);
begin
  // Usado em Outros DBGrids ===================================================
  (Sender as TDBGrid).Color:=clMoneyGreen;

  Dbg_ProfissionaisEnter(Self);
end;

procedure TFrmSalao.Dbg_ValesProfExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=$00E4F2F3;
end;

procedure TFrmSalao.EdtValesCodProfEnter(Sender: TObject);
begin
  EdtValesCodProf.Color:=clMoneyGreen;
end;

procedure TFrmSalao.EdtValesCodLojaEnter(Sender: TObject);
begin
  EdtValesCodLoja.Color:=clMoneyGreen;
end;

procedure TFrmSalao.Bt_ValesExcluirClick(Sender: TObject);
Var
  MySql: String;
  bParcPaga, bParcNaoPaga: Boolean;
begin
  Dbg_ValesProf.SetFocus;

  If DMSalao.CDS_Vales.IsEmpty Then
   Exit;

  MySql:=' SELECT DISTINCT Coalesce(v.vlr_pago,0) vlr_pago'+
         ' FROM PS_VALES_PESSOAS v'+
         ' WHERE v.tp_pessoa=1'+
         ' AND   v.ind_debcred='+QuotedStr('D')+
         ' AND   v.cod_loja='+QuotedStr(DMSalao.CDS_ValesProfissionaisCOD_LOJA.AsString)+
         ' AND   v.cod_pessoa='+QuotedStr(DMSalao.CDS_ValesProfissionaisCOD_PROFISSIONAL.AsString)+
         ' AND   v.num_docto='+QuotedStr(DMSalao.CDS_ValesProfissionaisNUM_DOCTO.AsString)+
         ' AND   v.vlr_original='+QuotedStr(f_Troca(',','.',DMSalao.CDS_ValesProfissionaisVLR_ORIGINAL.AsString))+
         ' AND   v.tot_prestacao='+QuotedStr(DMSalao.CDS_ValesProfissionaisTOT_PRESTACAO.AsString)+
         ' AND   v.num_prazo='+QuotedStr(DMSalao.CDS_ValesProfissionaisNUM_PRAZO.AsString)+
         ' AND   v.dta_prim_venc='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DMSalao.CDS_ValesProfissionaisDTA_PRIM_VENC.AsString)));
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If DMBelShop.CDS_BuscaRapida.IsEmpty Then
  Begin
    DMBelShop.CDS_BuscaRapida.Close;
    msg('Erro ao Localizar Docto do Vale !!'+cr+cr+'Entre em Contato com o Odir !!!','A');
    Dbg_ValesProf.SetFocus;
    Exit;
  End; // If Not bgSiga Then

  bParcPaga:=False;
  bParcNaoPaga:=False;
  DMBelShop.CDS_BuscaRapida.First;
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    // Somente Parcelas em Aberto -----------------------------------
    If DMBelShop.CDS_BuscaRapida.FieldByName('VLR_PAGO').AsCurrency=0 Then
     bParcNaoPaga:=True
    Else
     bParcPaga:=True;

    If (bParcNaoPaga) And (bParcPaga) Then
     Break;

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.Close;

  // bParcPaga =SIM AND bParcNaoPaga=NAO = QUITADO   - NÃO EXCLUI ==============
  If (bParcPaga) and (Not bParcNaoPaga) Then
  Begin
    msg('Impossível Excluir !!'+cr+cr+'Vale Já Quitado !!!','A');
    Dbg_ValesProf.SetFocus;
    Exit;
  End; // If Not bgSiga Then

  // bParcPaga =NAO AND bParcNaoPaga=SIM = EM ABERTO - EXCLUI ==================
  If (Not bParcPaga) and (bParcNaoPaga) Then
  Begin
    If msg('Deseja Realmente Excluir o'+cr+cr+'Vale Selecionado ??','C')=2 Then
     Exit;
  End; // If (Not bParcPaga) and (bParcNaoPaga) Then

  // bParcPaga =SIM AND bParcNaoPaga=SIM = FALTA PAGTOS - EXCLUI PARCELAS EM ABERTO ==
  If (bParcPaga) and (bParcNaoPaga) Then
  Begin
    if Application.MessageBox('Vale com Parcelas JÁ PAGAS e NÃO PAGAS'+cr+cr+
                              'Deseja EXCLUIR as NÂO PAGAS ???', 'ATENÇÃO !!', 292)=IdNo Then
     exit;
  End; // If (bParcPaga) and (bParcNaoPaga) Then

  // Exclui Vale ===============================================================
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

    If (bParcPaga) and (bParcNaoPaga) Then
    Begin
      // Não Excluir Pois Já Tem Parcelas Quitadas
      // Colocar NUM_DOCTO_PAGTO = 999999
      MySql:=' UPDATE PS_VALES_PESSOAS v'+
             ' SET v.vlr_pago=v.vlr_apagar,'+
             ' v.num_docto_pagto=999999,'+
             ' v.dta_pagamento=CURRENT_DATE,'+
             ' v.usu_altera='+Cod_Usuario+','+
             ' v.dta_altera=CURRENT_DATE'+

             ' WHERE v.tp_pessoa=1'+
             ' AND   v.ind_debcred='+QuotedStr('D')+
             ' AND   v.cod_loja='+QuotedStr(DMSalao.CDS_ValesProfissionaisCOD_LOJA.AsString)+
             ' AND   v.cod_pessoa='+QuotedStr(DMSalao.CDS_ValesProfissionaisCOD_PROFISSIONAL.AsString)+
             ' AND   v.num_docto='+QuotedStr(DMSalao.CDS_ValesProfissionaisNUM_DOCTO.AsString)+
             ' AND   v.vlr_original='+QuotedStr(f_Troca(',','.',DMSalao.CDS_ValesProfissionaisVLR_ORIGINAL.AsString))+
             ' AND   v.tot_prestacao='+QuotedStr(DMSalao.CDS_ValesProfissionaisTOT_PRESTACAO.AsString)+
             ' AND   v.num_prazo='+QuotedStr(DMSalao.CDS_ValesProfissionaisNUM_PRAZO.AsString)+
             ' AND   v.dta_prim_venc='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DMSalao.CDS_ValesProfissionaisDTA_PRIM_VENC.AsString)))+
             ' AND   v.vlr_pago=0';

    End; // If (bParcPaga) and (bParcNaoPaga) Then

    If (Not bParcPaga) and (bParcNaoPaga) Then
    Begin
      // Excluir Pois Não Tem Parcelas Quitadas
      MySql:=' DELETE FROM PS_VALES_PESSOAS v'+
             ' WHERE v.tp_pessoa=1'+
             ' AND   v.ind_debcred='+QuotedStr('D')+
             ' AND   v.cod_loja='+QuotedStr(DMSalao.CDS_ValesProfissionaisCOD_LOJA.AsString)+
             ' AND   v.cod_pessoa='+QuotedStr(DMSalao.CDS_ValesProfissionaisCOD_PROFISSIONAL.AsString)+
             ' AND   v.num_docto='+QuotedStr(DMSalao.CDS_ValesProfissionaisNUM_DOCTO.AsString)+
             ' AND   v.vlr_original='+QuotedStr(f_Troca(',','.',DMSalao.CDS_ValesProfissionaisVLR_ORIGINAL.AsString))+
             ' AND   v.tot_prestacao='+QuotedStr(DMSalao.CDS_ValesProfissionaisTOT_PRESTACAO.AsString)+
             ' AND   v.num_prazo='+QuotedStr(DMSalao.CDS_ValesProfissionaisNUM_PRAZO.AsString)+
             ' AND   v.dta_prim_venc='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DMSalao.CDS_ValesProfissionaisDTA_PRIM_VENC.AsString)));
     End; // If (bParcPaga) and (bParcNaoPaga) Then
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

    Bt_ValesFiltroConsultarClick(Self);

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

End;

procedure TFrmSalao.EdtMetasAnoChange(Sender: TObject);
Var
  i: Integer;
begin
  If (EdtMetasAno.Enabled) And (DMSalao.CDS_MetasProfissionais.Active) And (Trim(EdtMetasAno.Text)<>'') Then
  Begin
    If Not DMSalao.CDS_MetasProfissionais.IsEmpty Then
    Begin
      i:=StrToInt(EdtMetasAno.Text);
      if (i>=2012) And (i<=2099) Then
      Begin
        DMSalao.CDS_MetasProfissionaisAfterScroll(DMSalao.CDS_MetasProfissionais);
      End; // if (EdtMetasAno.AsInteger>=2012) And (EdtMetasAno.AsInteger<=2099) Then
    End; // If Not DMSalao.CDS_MetasProfissionais.IsEmpty Then
  End; // If (EdtMetasAno.Enabled) And (DMSalao.CDS_MetasProfissionais.Active) Then
end;

procedure TFrmSalao.EdtMetasCodLojaChange(Sender: TObject);
begin
  EdtMetasDesLoja.Clear;
  Bt_MetasAlterar.Enabled:=False;
  EdtMetasAno.Enabled:=False;

  FechaTudoSalao;

end;

procedure TFrmSalao.EdtMetasCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtMetasDesLoja.Clear;
  Bt_MetasAlterar.Enabled:=False;
  EdtMetasAno.Enabled:=False;
  DMSalao.CDs_MetasProfissionais.Close;

  If EdtMetasCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From EMP_CONEXOES'+
           ' Where Ind_Ativo=''SIM'''+
           ' And COD_FILIAL='+QuotedStr(FormatFloat('00',EdtMetasCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('RAZAO_SOCIAL').AsString)='' Then
    Begin
      msg('Loja NÃO Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtMetasCodLoja.Clear;
      EdtMetasCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtMetasDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    MySql:=' SELECT P.Cod_Loja, p.cod_profissional, p.des_profissional'+
           ' FROM SAL_PROFISSIONAIS p'+
           ' WHERE p.tip_pessoa='+QuotedStr('P')+
           ' AND   p.ind_ativo='+QuotedStr('SIM')+
           ' AND   p.cod_loja='+QuotedStr(FormatFloat('00',EdtMetasCodLoja.AsInteger))+
           ' ORDER BY p.des_profissional';
    DMSalao.CDS_MetasProfissionais.Close;
    DMSalao.SDS_MetasProfissionais.CommandText:=MySql;
    DMSalao.CDS_MetasProfissionais.Open;

    If Trim(DMSalao.CDS_MetasProfissionaisCOD_PROFISSIONAL.AsString)='' Then
    Begin
      DMSalao.CDS_MetasProfissionais.Close;
      msg('Sem Profissional de Salão'+cr+cr+'a Listar !!','A');
      EdtMetasCodLoja.SetFocus;
      Exit;
    End;

    Bt_MetasAlterar.Enabled:=True;
    EdtMetasAno.Enabled:=True;

    Dbg_MetasProfissionais.SetFocus;
    Screen.Cursor:=crDefault;

  End;

end;

procedure TFrmSalao.Bt_MetasAlterarClick(Sender: TObject);
begin
  Bt_MetasAlterar.Enabled:=False;
  EdtMetasAno.Enabled:=False;
  Bt_MetasSalvar.Enabled:=True;
  Bt_MetasAbandonar.Enabled:=True;
  Pan_MetasProf.Enabled:=True;
  Dbe_MetasProfComAno.Enabled:=True;

  DMSalao.CDS_MetasProf.Edit;

  Dbe_MetasProfMes01.SetFocus;
end;

procedure TFrmSalao.Bt_MetasAbandonarClick(Sender: TObject);
begin
  // Fecha Transação ===========================================================
  If (DMSalao.CDS_MetasProf.State=dsInsert) Or (DMSalao.CDS_MetasProf.State=dsEdit) Then
   DMSalao.CDS_MetasProf.CancelUpdates;

  Bt_MetasAlterar.Enabled:=True;
  EdtMetasAno.Enabled:=True;
  Bt_MetasSalvar.Enabled:=False;
  Bt_MetasAbandonar.Enabled:=False;
  Pan_MetasProf.Enabled:=False;
  Dbe_MetasProfComAno.Enabled:=False;

  Dbg_MetasProfissionais.SetFocus;

end;

procedure TFrmSalao.Bt_MetasSalvarClick(Sender: TObject);
Var
  MySql: String;
Begin

  Bt_MetasSalvar.Enabled:=False;
  Bt_MetasAbandonar.Enabled:=False;
  Pan_MetasProf.Enabled:=False;
  Dbe_MetasProfComAno.Enabled:=False;

  // Altera Meta do Profissional ===============================================
  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE SAL_METAS'+  // COD_HABILIDADE,
           ' SET PER_META_ANO='+QuotedStr(DMSalao.CDS_MetasProfPER_META_ANO.AsString)+
           ', OBJ_MES01='+QuotedStr(DMSalao.CDS_MetasProfOBJ_MES01.AsString)+
           ', PER_OBJ_MES01='+QuotedStr(DMSalao.CDS_MetasProfPER_OBJ_MES01.AsString)+
           ', OBJ_MES02='+QuotedStr(DMSalao.CDS_MetasProfOBJ_MES02.AsString)+
           ', PER_OBJ_MES02='+QuotedStr(DMSalao.CDS_MetasProfPER_OBJ_MES02.AsString)+
           ', OBJ_MES03='+QuotedStr(DMSalao.CDS_MetasProfOBJ_MES03.AsString)+
           ', PER_OBJ_MES03='+QuotedStr(DMSalao.CDS_MetasProfPER_OBJ_MES03.AsString)+
           ', OBJ_MES04='+QuotedStr(DMSalao.CDS_MetasProfOBJ_MES04.AsString)+
           ', PER_OBJ_MES04='+QuotedStr(DMSalao.CDS_MetasProfPER_OBJ_MES04.AsString)+
           ', OBJ_MES05='+QuotedStr(DMSalao.CDS_MetasProfOBJ_MES05.AsString)+
           ', PER_OBJ_MES05='+QuotedStr(DMSalao.CDS_MetasProfPER_OBJ_MES05.AsString)+
           ', OBJ_MES06='+QuotedStr(DMSalao.CDS_MetasProfOBJ_MES06.AsString)+
           ', PER_OBJ_MES06='+QuotedStr(DMSalao.CDS_MetasProfPER_OBJ_MES06.AsString)+
           ', OBJ_MES07='+QuotedStr(DMSalao.CDS_MetasProfOBJ_MES07.AsString)+
           ', PER_OBJ_MES07='+QuotedStr(DMSalao.CDS_MetasProfPER_OBJ_MES07.AsString)+
           ', OBJ_MES08='+QuotedStr(DMSalao.CDS_MetasProfOBJ_MES08.AsString)+
           ', PER_OBJ_MES08='+QuotedStr(DMSalao.CDS_MetasProfPER_OBJ_MES08.AsString)+
           ', OBJ_MES09='+QuotedStr(DMSalao.CDS_MetasProfOBJ_MES09.AsString)+
           ', PER_OBJ_MES09='+QuotedStr(DMSalao.CDS_MetasProfPER_OBJ_MES09.AsString)+
           ', OBJ_MES10='+QuotedStr(DMSalao.CDS_MetasProfOBJ_MES10.AsString)+
           ', PER_OBJ_MES10='+QuotedStr(DMSalao.CDS_MetasProfPER_OBJ_MES10.AsString)+
           ', OBJ_MES11='+QuotedStr(DMSalao.CDS_MetasProfOBJ_MES11.AsString)+
           ', PER_OBJ_MES11='+QuotedStr(DMSalao.CDS_MetasProfPER_OBJ_MES11.AsString)+
           ', OBJ_MES12='+QuotedStr(DMSalao.CDS_MetasProfOBJ_MES12.AsString)+
           ', PER_OBJ_MES12='+QuotedStr(DMSalao.CDS_MetasProfPER_OBJ_MES12.AsString)+
           ', USU_ALTERA='+QuotedStr(Cod_Usuario)+
           ', DTA_ALTERA=current_timestamp'+

           ' WHERE COD_LOJA='+QuotedStr(DMSalao.CDS_MetasProfCOD_LOJA.AsString)+
           ' AND   COD_PROFISSIONAL='+QuotedStr(DMSalao.CDS_MetasProfCOD_PROFISSIONAL.AsString)+
           ' AND   DES_ANO='+QuotedStr(DMSalao.CDS_MetasProfDES_ANO.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    DMSalao.CDS_MetasProf.Close;
    DMSalao.CDS_MetasProf.Open;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

  // Fecha Transação ===========================================================
  If (DMSalao.CDS_MetasProf.State=dsInsert) Or (DMSalao.CDS_MetasProf.State=dsEdit) Then
   DMSalao.CDS_MetasProf.CancelUpdates;

  Bt_MetasAlterar.Enabled:=True;
  EdtMetasAno.Enabled:=True;

  Dbg_MetasProfissionais.SetFocus;

end;

procedure TFrmSalao.Bt_MetasBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtMetasCodLoja.Clear;
  EdtMetasDesLoja.Clear;
  Bt_MetasAlterar.Enabled:=False;
  EdtMetasAno.Enabled:=False;

  DMSalao.CDS_MetasProfissionais.Close;

  EdtMetasCodLoja.SetFocus;

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
    EdtMetasCodLoja.SetFocus;
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
     EdtMetasCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtMetasDesLoja.Text:=FrmPesquisa.EdtDescricao.Text;

     Bt_MetasAlterar.Enabled:=True;
     EdtMetasAno.Enabled:=True;

     Dbg_MetasProfissionais.SetFocus;
   End
  Else
   Begin
     EdtMetasCodLoja.Clear;
     EdtMetasDesLoja.Clear;
     EdtMetasCodLoja.SetFocus;
   End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmSalao.Dbe_MetasProfCom12Exit(Sender: TObject);
begin
  Dbe_MetasProfMes01.SetFocus;
end;

procedure TFrmSalao.Dbe_CadProfPerComissaoChange(Sender: TObject);
begin
  If (DMSalao.CDS_Profissionais.State=dsInsert) Or (DMSalao.CDS_Profissionais.State=dsEdit) Then
   DMSalao.CDS_ProfissionaisPER_LOCADOR.AsCurrency:=100-DMSalao.CDS_ProfissionaisPER_COMISSAO.AsCurrency;
end;

procedure TFrmSalao.Dbe_CadProfPerComissaoExit(Sender: TObject);
begin
  Dbe_CadProfPerComissaoChange(Self);
end;

procedure TFrmSalao.Dbe_CadProfPerComissaoSupervisorExit(Sender: TObject);
Var
  MySql: String;
begin
  If DMSalao.CDS_ProfissionaisPER_COMISSAO_SUPERVISOR.AsCurrency<>0 Then
  Begin
    // Verifica se já Existe Supervisor ========================================
    MySql:=' SELECT p.cod_profissional Codigo, p.des_profissional nome'+
           ' FROM sal_profissionais p'+
           ' WHERE EXISTS (SELECT 1'+
           '               FROM sal_prof_supervisor s'+
           '               WHERE s.cod_supervisor=p.cod_profissional'+
           '               AND s.cod_loja=p.cod_loja)'+
           ' AND p.tip_pessoa='+QuotedStr('P')+
           ' AND   p.ind_ativo='+QuotedStr('SIM')+
           ' AND   p.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
           ' AND   p.cod_profissional<>'+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Codigo').AsString)<>'' Then
    Begin
      ShowMessage('Impossível a Comissão de Supervisor !!'+cr+
                  'O Profissional Supervisor é'+cr+cr+
                  'Codigo: '+DMBelShop.CDS_BuscaRapida.FieldByName('Codigo').AsString+cr+
                  'Nome  : '+DMBelShop.CDS_BuscaRapida.FieldByName('Nome').AsString);
      DMBelShop.CDS_BuscaRapida.Close;

      DMSalao.CDS_ProfissionaisPER_COMISSAO_SUPERVISOR.AsCurrency:=0;
      Dbe_CadProfPerComissaoSupervisor.SetFocus;
      Exit;
    End;
    DMBelShop.CDS_BuscaRapida.Close;

    MySql:=' SELECT p.cod_profissional Codigo, p.des_profissional Nome'+
           ' FROM SAL_PROFISSIONAIS p'+
           ' WHERE p.tip_pessoa='+QuotedStr('P')+
           ' AND   p.ind_ativo='+QuotedStr('SIM')+
           ' AND   p.per_comissao_supervisor<>0'+
           ' AND   p.cod_loja='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
           ' AND   p.cod_profissional<>'+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Codigo').AsString)<>'' Then
    Begin
      ShowMessage('Impossível a Comissão de Supervisor !!'+cr+
                  'Já Existente Profissional/Supervisor com Comissão !!'+cr+cr+
                  'Codigo: '+DMBelShop.CDS_BuscaRapida.FieldByName('Codigo').AsString+cr+
                  'Nome  : '+DMBelShop.CDS_BuscaRapida.FieldByName('Nome').AsString);
      DMBelShop.CDS_BuscaRapida.Close;

      DMSalao.CDS_ProfissionaisPER_COMISSAO_SUPERVISOR.AsCurrency:=0;
      Dbe_CadProfPerComissaoSupervisor.SetFocus;
      Exit;
    End;
    DMBelShop.CDS_BuscaRapida.Close;
  End; // If DMSalao.CDS_ProfissionaisPER_COMISSAO_SUPERVISOR.AsCurrency<>0 Then

end;

procedure TFrmSalao.Bt_CadProfServAlterarTodosClick(Sender: TObject);
Var
  MySql: String;
begin
  If DMSalao.CDS_ServicosProf.IsEmpty Then
   Exit;

  If msg('Deseja Realmente Alterar Todas as'+cr+cr+'Comissões para '+VarToStr(EdtCadProfPerComissao.Value)+' % ??','C')=2 Then
   Exit;

  Screen.Cursor:=crAppStart;
  DateSeparator:='.';
  DecimalSeparator:='.';

  DMSalao.CDS_ServicosProf.First;
  While Not DMSalao.CDS_ServicosProf.Eof do
  Begin
    MySql:=' Update SAL_PROF_HABILIDADES s'+
           ' Set s.PER_COMISSAO_SERV='+QuotedStr(VarToStr(EdtCadProfPerComissao.Value))+', '+
           ' s.USU_ALTERA='+QuotedStr(Cod_Usuario)+', '+
           ' s.DTA_ALTERA=Current_Date'+

           ' Where s.COD_LOJA='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
           ' And   s.COD_PROFISSIONAL='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+
           ' And   s.COD_HABILIDADE='+QuotedStr(DMSalao.CDS_HabilidadesProfCOD_HABILIDADE.AsString)+
           ' And   s.COD_SERVICO='+QuotedStr(DMSalao.CDS_ServicosProfCOD_SERVICO.AsString);

           If Cbx_CadProfServAtivo.ItemIndex=1 Then
             MySql:=
              MySql+' AND s.IND_ATIVO=''SIM''';

           If Cbx_CadProfServAtivo.ItemIndex=2 Then
             MySql:=
              MySql+' AND s.IND_ATIVO=''NAO''';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DMSalao.CDS_ServicosProf.Next;
  End; // While Not DMSalao.CDS_ServicosProf.Eof do

  DMSalao.CDS_ServicosProf.Close;
  DMSalao.CDS_ServicosProf.Open;
  DMSalao.CDS_ServicosProf.First;
  DateSeparator:='/';
  DecimalSeparator:=',';
  Screen.Cursor:=crDefault;

end;

procedure TFrmSalao.Bt_PagtoFecharClick(Sender: TObject);
begin
  bgSairSalao:=True;
  Close;

end;

procedure TFrmSalao.PC_PagtoPlanilhaChange(Sender: TObject);
begin
  If (PC_PagtoPlanilha.ActivePage=Ts_PagtoProfissionais) And (Ts_PagtoProfissionais.CanFocus) Then
  Begin
    If EdtPagtoCodLoja.AsInteger=0 Then
     EdtPagtoCodLoja.SetFocus
    Else
     Dbg_PagtoProfissionais.SetFocus;
  End;

  If (PC_PagtoPlanilha.ActivePage=Ts_PagtoPlanilha) And (Ts_PagtoPlanilha.CanFocus) Then
   Dbg_PagtoPlanilha.SetFocus;

  If (PC_PagtoPlanilha.ActivePage=Ts_PagtoVendas) And (Ts_PagtoVendas.CanFocus) Then
   Dbg_PagtosVendas.SetFocus;

  If (PC_PagtoPlanilha.ActivePage=Ts_PagtoDebCred) And (Ts_PagtoDebCred.CanFocus) Then
   Dbg_PagtosDebCred.SetFocus;

end;

procedure TFrmSalao.EdtPagtoCodLojaChange(Sender: TObject);
begin
  EdtPagtoDesLoja.Clear;
  Lab_TotalProf.Caption:='0';
  FechaTudoSalao;
  Refresh;

end;

procedure TFrmSalao.EdtPagtoCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtPagtoDesLoja.Clear;

  DMSalao.CDS_V_PagtoProf.Close;

  sgDtaIniSemana:='';
  bgPeriodoForcado:=False;

  Lab_TotalProf.Caption:='0';

  If EdtPagtoCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From EMP_CONEXOES'+
           ' Where Ind_Ativo=''SIM'''+
           ' And COD_FILIAL='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('RAZAO_SOCIAL').AsString)='' Then
    Begin
      msg('Loja NÃO Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtPagtoCodLoja.Clear;
      EdtPagtoCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtPagtoDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    // Busca Profissionais a Calcular ==========================================
    If Not ProfissionaisCalcular Then
    Begin
      EdtPagtoCodLoja.SetFocus;
      Exit;
    End;

    Dbg_PagtoProfissionais.SetFocus;
    Screen.Cursor:=crDefault;
  End; // If EdtPagtoCodLoja.Value<>0 Then

end;

procedure TFrmSalao.Dbg_PagtoProfissionaisDblClick(Sender: TObject);
begin
  If bgCalculoIndividual Then
  Begin
    If DMSalao.CDS_V_PagtoProf.IsEmpty Then
     Exit;

    DMSalao.CDS_V_PagtoProf.Edit;
    If DMSalao.CDS_V_PagtoProfCALCULAR.AsString='SIM' Then
     Begin
       DMSalao.CDS_V_PagtoProfCALCULAR.AsString:='NAO'
     End
    Else
     Begin
       If Trim(DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString)='' Then
       Begin
         msg('Profissional Sem Data para Calculo !!','A');
         Exit;
       End;

       DMSalao.CDS_V_PagtoProfCALCULAR.AsString:='SIM';
     End;

    If DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString=DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString Then
     DMSalao.CDS_V_PagtoProfCALCULAR.AsString:='NAO';

    DMSalao.CDS_V_PagtoProf.Post;
  End; // If bgCalculoIndividual Then
end;

procedure TFrmSalao.Dbg_PagtoProfissionaisDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMSalao.CDS_V_PagtoProfCALCULAR.AsString='NAO' Then
    Begin
      Dbg_PagtoProfissionais.Canvas.Brush.Color:=$00B7B7FF;
    end;

    If (Column.FieldName='NOME') Then //   ----> Este comando altera cor da Celula
    Begin
      If (DMSalao.CDS_V_PagtoProfSUPERVISOR.AsString='SIM') Then
      Begin
        Dbg_PagtoProfissionais.Canvas.Font.Style:=[fsBold];
        Dbg_PagtoProfissionais.Canvas.Brush.Color:=clBlue;
        Dbg_PagtoProfissionais.Canvas.Font.Color:=clWhite;// -->> Cor da Fonte
      End;
    End;

    Dbg_PagtoProfissionais.Canvas.FillRect(Rect);
    Dbg_PagtoProfissionais.DefaultDrawDataCell(Rect,Column.Field,state);

    DMSalao.CDS_V_PagtoProfCALCULAR.Alignment:=taCenter;
    DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.Alignment:=taCenter;
    DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.Alignment:=taCenter;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmSalao.Bt_PagtoMarcaTodosClick(Sender: TObject);
Var
  sPerIni, sPerFim: string;
  bPerDif: Boolean;
begin
  Dbg_PagtoProfissionais.SetFocus;

  If DMSalao.CDS_V_PagtoProf.IsEmpty Then
   Exit;

  bPerDif:=False;
  DMSalao.CDS_V_PagtoProf.First;
  While Not DMSalao.CDS_V_PagtoProf.Eof do
  Begin
    DMSalao.CDS_V_PagtoProf.Edit;

    If (Sender as TJvXPButton).Name='Bt_PagtoMarcaTodos' Then
     Begin
       If Trim(DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString)<>'' Then
        Begin
          If DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString<>DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString Then
          Begin
            If ((sPerIni<>DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString) Or
                (sPerFim<>DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString)) And
               (sPerIni<>'') Then
             bPerDif:=True;

            DMSalao.CDS_V_PagtoProfCALCULAR.AsString:='SIM';
          End; // If DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString<>DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString Then
        End
       Else
        Begin
          DMSalao.CDS_V_PagtoProfCALCULAR.AsString:='NAO';
        End;
     End
    Else
     Begin
       DMSalao.CDS_V_PagtoProfCALCULAR.AsString:='NAO';
     End;

    DMSalao.CDS_V_PagtoProf.Post;

    // Verificar se Existem Períodos Diferentes ================================
    sPerIni:=DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString;
    sPerFim:=DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString;

    DMSalao.CDS_V_PagtoProf.Next;
  End; // While Not DMSalao.CDS_V_PagtoProf.Eof do
  DMSalao.CDS_V_PagtoProf.First;

  If bPerDif Then
  Begin
    sgMensagem:='Existem Períodos Diferentes para Calculo !!'+cr+cr+
                'Verifique se Esta CORRETO !!';
    Application.MessageBox(PChar(sgMensagem), 'ATENÇÃO !!', 0);
  End;

end;

procedure TFrmSalao.Dbg_PagtoProfissionaisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sValor: String;
  b: Boolean;
begin
  // Altera Possibilidade de Calculo Individual ================================
  If (Shift = [ssCtrl, ssAlt, ssShift]) And (Key = VK_F12) Then
  Begin
    If bgCalculoIndividual Then
     Begin
       bgCalculoIndividual:=False;
       Bt_PagtoMarcaTodos.Visible:=False;
       Bt_PagtoDesmarcaTodos.Visible:=False;
     End
    Else
     Begin
       bgCalculoIndividual:=True;
       Bt_PagtoMarcaTodos.Visible:=True;
       Bt_PagtoDesmarcaTodos.Visible:=True;
     End
  End; // If (Shift = [ssCtrl, ssAlt, ssShift]) And (Key = VK_F12) Then

  // Localizar =================================================================
  If Key=Vk_F4 Then
  Begin
    If Not DMSalao.CDS_V_PagtoProf.IsEmpty Then
    Begin
      sValor:='';
      b:=True;
      While b do
      Begin
        If InputQuery('Localizar Código/Nome','',sValor) then
         Begin
           Try
             StrToInt(sValor);
             sValor:=FormatFloat('000000',StrToInt(sValor));

             If Not DMSalao.CDS_V_PagtoProf.Locate('Codigo', sValor,[]) Then
             Begin
               If Not LocalizaRegistro(DMSalao.CDS_V_PagtoProf, 'Codigo', sValor) Then
                b:=False;
             End; // If Not DMSalao.CDS_V_PagtoProf.Locate('Codigo', sValor,[]) Then
             Break;
           Except
             If Not DMSalao.CDS_V_PagtoProf.Locate('Nome', sValor,[]) Then
             Begin
               If Not LocalizaRegistro(DMSalao.CDS_V_PagtoProf, 'Nome', sValor) Then
                b:=False;
             End; // If Not DMSalao.CDS_V_PagtoProf.Locate('Nome', sValor,[]) Then
             Break;
           End;
         End
        Else // If InputQuery('Localizar Código/Nome','',sValor) then
         Begin
           Break;
         End; // If InputQuery('Localizar Código/Nome','',sValor) then
      End; // While b do

      If Not b Then
       msg('Profissional Não Localizado !!','A');
    End; // If Not DMConciliacao.CDS_CMExtratos.IsEmpty Then
  End; // If Key=Vk_F4 Then
end;

procedure TFrmSalao.Bt_PagtoAlteraPeriodoClick(Sender: TObject);
Var
  MySql, sDtaI, sDtaF, sNomeDiaI, sNomeDiaF: String;
begin
  Dbg_PagtoProfissionais.SetFocus;

  If DMSalao.CDS_V_PagtoProf.IsEmpty Then
   Exit;

  // Nomes e Dias para Calculo =================================================
  sDtaI:='';
  sDtaF:='';
  MySql:=' SELECT MAX(p.dta_periodo_fim_cal) Dta_Fim'+
         ' FROM sal_profissionais p'+
         ' WHERE p.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger));
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Not DMBelShop.CDS_BuscaRapida.Eof Then
  Begin
    sDtaI:=DateToStr(DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Fim').AsDateTime+1);
    sDtaF:=DateToStr(DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Fim').AsDateTime+7);
  End;
  DMBelShop.CDS_BuscaRapida.Close;

  MySql:=' SELECT p.dia_ini_comissao_prof, p.dia_fim_comissao_prof'+
         ' FROM parametros p';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sNomeDiaI:=AnsiUpperCase(DMBelShop.CDS_BuscaRapida.FieldByName('dia_ini_comissao_prof').AsString);
  sNomeDiaF:=AnsiUpperCase(DMBelShop.CDS_BuscaRapida.FieldByName('dia_fim_comissao_prof').AsString);
  DMBelShop.CDS_BuscaRapida.Close;

  // Solicita Novo Periodo para Calculo ========================================
  FrmPeriodoApropriacao:=TFrmPeriodoApropriacao.Create(Self);
  FrmPeriodoApropriacao.Caption:='ALTERAÇÃO DE PERÍODO DE CALCULO';
  // FrmPeriodoApropriacao.Gb_PeriodoAproprAplicar.Visible:=True;

  bgSiga:=False;
  FrmPeriodoApropriacao.ShowModal;

  // Verifica se Periodo esta OK ===============================================
  If bgSiga Then
  Begin
    If AnsiUpperCase(DiaSemanaNome(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date))<>sNomeDiaI Then
    Begin
      msg('Dia INICIAL da Semana de'+cr+'Calculo deve ser '+sNomeDiaI+' !!','A');
      bgSiga:=False;
    End;

    If AnsiUpperCase(DiaSemanaNome(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date))<>sNomeDiaF Then
    Begin
      msg('Dia FINAL da Semana de'+cr+'Calculo deve ser '+sNomeDiaF+' !!','A');
      bgSiga:=False;
    End;

    If (sDtaI<>'') And (sDtaF<>'') Then
    Begin
      If (FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date<>StrToDate(sDtaI)) Or
         (FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date   <>StrToDate(sDtaF)) Then
      Begin
        bgSiga:=True;
        bgPeriodoForcado:=False;
        If msg('Período Inválido !!'+cr+'O Calculo deve ser de: '+sDtaI+' a '+sDtaF+cr+cr+'Deseja Continuar Assim Mesmo ??','C')=2 Then
         bgSiga:=False
        Else
         bgPeriodoForcado:=True;
      End;
    End; // If (sDtaI<>'') And (sDtaF<>'') Then
  End; // If bgSiga Then

  // Altera Periodo ============================================================
  If bgSiga Then
  Begin
    // Altera Periodo de Calculo Somente do Selecionado ========================
    If FrmPeriodoApropriacao.Rb_PerAproprSelecionado.Checked Then
    Begin
      If Trim(DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString)<>'' Then
      Begin
        If (StrToDate(DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString)>=FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date) Or
           (StrToDate(DMSalao.CDS_V_PagtoProfFIM_ULT_CALCULO.AsString)<=FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date) Then
        Begin
          sgMensagem:='Período Informado Coincidente com Último Calculo !!'+cr+cr+
                      'Período Calculado : '+DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString+' a '+
                                             DMSalao.CDS_V_PagtoProfFIM_ULT_CALCULO.AsString+cr+
                      'Período Informado: '+DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date)+' a '+
                                            DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date)+cr+cr+
                      'Deseja GRAVAR Para RECALCULAR ??';
          If Application.MessageBox(PChar(sgMensagem), 'ATENÇÃO !!', 292)=IdNo Then
           Begin
             sgMensagem:='';
             Exit;
           End
          Else
           Begin
             DMSalao.CDS_V_PagtoProf.Edit;
             DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString:=DateToStr(
                       FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date);
             DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString:=DateToStr(
                          FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date);
             DMSalao.CDS_V_PagtoProf.Post;
           End;
        End;
      End; // If (Trim(DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString)<>'') Then
    End; // If FrmPeriodoApropriacao.Rb_PerAproprSelecionado.Checked Then

    // Altera Periodo de Calculo Somente do Selecionado ========================
    If FrmPeriodoApropriacao.Rb_PerAproprTodos.Checked Then
    Begin

      DMSalao.CDS_V_PagtoProf.First;
      While Not DMSalao.CDS_V_PagtoProf.Eof do
      Begin
        DMSalao.CDS_V_PagtoProf.Edit;

        If Trim(DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString)<>'' Then
         Begin
          If ((FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date>=StrToDate(DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString)) And
              (FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date<=StrToDate(DMSalao.CDS_V_PagtoProfFIM_ULT_CALCULO.AsString))) Or
              ((FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date>=StrToDate(DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString)) And
              (FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date<=StrToDate(DMSalao.CDS_V_PagtoProfFIM_ULT_CALCULO.AsString))) Then
           Begin
             bgSiga:=False;
             DMSalao.CDS_V_PagtoProfCALCULAR.AsString:='NAO';
           End
          Else
           Begin
             DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString:=DateToStr(
                       FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date);
             DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString:=DateToStr(
                          FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date);
             DMSalao.CDS_V_PagtoProfCALCULAR.AsString:='SIM';
           End;
         End
        Else // If Trim(DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString)<>'' Then
         Begin
           DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString:=DateToStr(
                     FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date);
           DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString:=DateToStr(
                        FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date);
           DMSalao.CDS_V_PagtoProfCALCULAR.AsString:='SIM';
         End;
        DMSalao.CDS_V_PagtoProf.Post;

        DMSalao.CDS_V_PagtoProf.Next;
      End; // While Not DMSalao.CDS_V_PagtoProf.Eof do
      DMSalao.CDS_V_PagtoProf.First;

      If Not bgSiga Then
      Begin
        sgMensagem:='Período Informado Coincidente com Último Calculo de Profissionais'+cr+
                    'ou'+cr+
                    'Período Superior a Última Semana Vigênte para Cálculo !!'+cr+cr+
                    ' Os mesmos Ficarão DesMarcados para Calclulo...'+cr+cr+
                    'Período Calculado : '+DMSalao.CDS_V_PagtoProfINI_ULT_CALCULO.AsString+' a '+
                                             DMSalao.CDS_V_PagtoProfFIM_ULT_CALCULO.AsString+cr+
                    'Período Informado: '+DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date)+' a '+
                                            DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date);
        Application.MessageBox(PChar(sgMensagem), 'ATENÇÃO !!', 0);
      End; // If Not bgSiga Then
    End; // If FrmPeriodoApropriacao.Rb_PerAproprTodos.Checked Then
  End; // If bgSiga Then

  FrmPeriodoApropriacao.Free;
  FrmPeriodoApropriacao:=nil;

end;

procedure TFrmSalao.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmSalao.Bt_PagtoVendasClick(Sender: TObject);
Var
  i: Integer;
  dDta: TDateTime;
  wDia, wMes, wAno: Word;
  MySql: String;
  bProcessar: Boolean;
begin

  Dbg_PagtoProfissionais.SetFocus;

  If DMSalao.CDS_V_PagtoProf.IsEmpty Then
   Exit;

  If bgPeriodoForcado Then
  Begin
    If msg('Período de Calculo foi Forçado...'+cr+'Fora do Padrão !!'+cr+cr+'Deseja Continuar ??','C')=2 Then
     Exit;
  End; // If bgPeriodoForcado Then

  // Verifica se Periodo esta Correto ==========================================
  If (DMSalao.CDS_V_PagtoProfDIA_INICIO.AsString<>DMSalao.CDS_V_PagtoProfDIA_FINAL.AsString) And (Not bgPeriodoForcado) Then
  Begin
    bProcessar:=False;
    If Not PodeCalcular(bProcessar) Then
    Begin
      PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);

      If Not bProcessar Then
       Begin
         MessageBox(Handle, pChar('Período(s) a Ser(em) Calculado(s):'+cr+cr+sgMensagem), 'Período para Calculo esta Incorreto !!', MB_ICONERROR);
         Exit;
       End
      Else
       Begin
         if Application.MessageBox(pChar('Período(s) a Ser(em) Calculado(s):'+cr+cr+sgMensagem+cr+cr+
                                   'O(S) PERÍODO(S) ESTA(ÃO) CORRETO(S)??'), 'ATENÇÃO !!', 36)=IdNo Then
          Exit;
       End; // If Not bProcessar Then
    End; // If Not PodeCalcular Then
  End; // If DMSalao.CDS_V_PagtoProfDIA_INICIO.AsString<>DMSalao.CDS_V_PagtoProfDIA_FINAL.AsString Then

  // Verifica se Existe Profissiona a Calcular =================================
  bgSiga:=False;
  DMSalao.CDS_V_PagtoProf.First;
  While Not DMSalao.CDS_V_PagtoProf.Eof do
  Begin
    If DMSalao.CDS_V_PagtoProfCALCULAR.AsString='SIM' Then
    Begin
      bgSiga:=True;
      Break;
    End; // If DMSalao.CDS_V_PagtoProfCALCULAR.AsString='SIM' Then

    DMSalao.CDS_V_PagtoProf.Next;
  End; // While Not DMSalao.CDS_V_PagtoProf.Eof do
  DMSalao.CDS_V_PagtoProf.First;

  If Not bgSiga Then
  Begin
    msg('Sem Profissional Selecionado !!','A');
    Dbg_PagtoProfissionais.SetFocus;
    Exit;
  End;

  If msg('Deseja Realmente Efetuar o Calculo ??','C')=2 Then
  Begin
    Dbg_PagtoProfissionais.SetFocus;
    Exit;
  End;

  // Monta Profissinais para SQL ===============================================
  If FrmBelShop.gCDS_V_Geral<>nil Then
  Begin
    FrmBelShop.gCDS_V_Geral.Free;
    FrmBelShop.gCDS_V_Geral:=nil;
  End;

  try
    FrmBelShop.gCDS_V_Geral:=TClientDataSet.Create(Self);
  Except
    FrmBelShop.gCDS_V_Geral.EmptyDataSet;
  End;

  FrmBelShop.gCDS_V_Geral.FieldDefs.Clear;
  FrmBelShop.gCDS_V_Geral.FieldDefs.Add('DtaI',ftString,10);
  FrmBelShop.gCDS_V_Geral.FieldDefs.Add('DtaF',ftString,10);
  FrmBelShop.gCDS_V_Geral.FieldDefs.Add('Prof',ftString,20000);
  FrmBelShop.gCDS_V_Geral.CreateDataSet;
  FrmBelShop.gCDS_V_Geral.Open;

  sgPeriodoIni:='';
  DMSalao.CDS_V_PagtoProf.First;
  While Not DMSalao.CDS_V_PagtoProf.Eof do
  Begin
    If DMSalao.CDS_V_PagtoProfCALCULAR.AsString='SIM' Then
    Begin

      If sgPeriodoIni='' Then
       Begin
         sgPeriodoIni:=DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString;
         sgPeriodoFim:=DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString;
       End
      Else
       Begin
         If StrToDate(sgPeriodoIni)<StrToDate(DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString) Then
         Begin
           sgPeriodoIni:=DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString;
           sgPeriodoFim:=DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString;
         End;
       End; // If sgPeriodoIni='' Then

      sgDtaI:=DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString;
      sgDtaF:=DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString;

      If FrmBelShop.gCDS_V_Geral.Locate('DtaI;DtaF', VarArrayOf([sgDtaI,sgDtaF]),[]) Then
       Begin
         FrmBelShop.gCDS_V_Geral.Edit;
         FrmBelShop.gCDS_V_Geral.FieldByName('Prof').AsString:=
                             FrmBelShop.gCDS_V_Geral.FieldByName('Prof').AsString+
                           ', '+QuotedStr(DMSalao.CDS_V_PagtoProfCODIGO.AsString);
       End
      Else
       Begin
         FrmBelShop.gCDS_V_Geral.Insert;
         FrmBelShop.gCDS_V_Geral.FieldByName('Dtai').AsString:=
                                  DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString;
         FrmBelShop.gCDS_V_Geral.FieldByName('DtaF').AsString:=
                                  DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString;
         FrmBelShop.gCDS_V_Geral.FieldByName('Prof').AsString:=
                                QuotedStr(DMSalao.CDS_V_PagtoProfCODIGO.AsString);
       End;
      FrmBelShop.gCDS_V_Geral.Post;
    End; // If DMSalao.CDS_V_PagtoProfCALCULAR.AsString='SIM' Then

    DMSalao.CDS_V_PagtoProf.Next;
  End; // While Not DMSalao.CDS_V_PagtoProf.Eof do
  DMSalao.CDS_V_PagtoProf.First;

  sgProfComissao:='';
  sgProfissionais:='';
  FrmBelShop.gCDS_V_Geral.First;
  While Not FrmBelShop.gCDS_V_Geral.Eof do
  Begin
    sgDtaI:=FrmBelShop.gCDS_V_Geral.FieldByName('Dtai').AsString;
    sgDtaI:=f_Troca('/','.',sgDtaI);
    sgDtaI:=f_Troca('-','.',sgDtaI);

    sgDtaF:=FrmBelShop.gCDS_V_Geral.FieldByName('DtaF').AsString;
    sgDtaF:=f_Troca('/','.',sgDtaF);
    sgDtaF:=f_Troca('-','.',sgDtaF);

    If sgProfComissao<>'' Then
     sgProfComissao:=sgProfComissao+' or  (nt.codvendedor in ('+
                           FrmBelShop.gCDS_V_Geral.FieldByName('Prof').AsString+
                           ') and nt.datacomprovante BETWEEN '+
                           QuotedStr(sgDtaI)+' And '+QuotedStr(sgDtaF)+')';

    If sgProfComissao='' Then
     sgProfComissao:='(nt.codvendedor in ('+
                           FrmBelShop.gCDS_V_Geral.FieldByName('Prof').AsString+
                           ') and nt.datacomprovante BETWEEN '+
                           QuotedStr(sgDtaI)+' And '+QuotedStr(sgDtaF)+')';

    If sgProfissionais<>'' Then
     sgProfissionais:=sgProfissionais+', '+FrmBelShop.gCDS_V_Geral.FieldByName('Prof').AsString;

    If sgProfissionais='' Then
     sgProfissionais:=FrmBelShop.gCDS_V_Geral.FieldByName('Prof').AsString;

    FrmBelShop.gCDS_V_Geral.Next;
  End; // While Not FrmBelShop.gCDS_V_Geral.Eof do

  // Verifica se Calculo Metas =================================================
//  sgMensagem:='Calculo SEM Metas ??';
//  If Ckb_PagtoMetas.Checked Then
//   sgMensagem:='Calculo COM Metas ??';
//
//  If msg('Efetuar o '+sgMensagem,'C')=2 Then
//  Begin
//    FrmBelShop.gCDS_V_Geral.Free;
//    FrmBelShop.gCDS_V_Geral:=nil;
//    Exit;
//  End;

  //============================================================================
  // Verifica INSS (Sempre no Dia 15 de Cada Mês) ==============================
  //============================================================================
  DecodeDate(StrToDateTime(sgPeriodoIni), wAno, wMes, wDia);
  i:=wMes;

  dDta:=EncodeDate(wAno, wMes, 15);
  If DataNoPeriodo(StrToDate(f_Troca('.','/',sgPeriodoIni)), StrToDate(f_Troca('.','/',sgPeriodoFim)),dDta) Then
  Begin
    MySql:=' SELECT First 1 pf.cod_loja'+
           ' FROM ps_vales_pessoas vp, sal_profissionais pf'+
           ' WHERE vp.cod_loja=pf.cod_loja'+
           ' AND   vp.cod_pessoa=pf.cod_profissional'+
           ' AND   vp.tp_pessoa=1'+
           ' AND   pf.tip_pessoa='+QuotedStr('P')+
           ' AND   pf.ind_Ativo='+QuotedStr('SIM')+
           ' AND   vp.ind_debcred='+QuotedStr('I')+ // Contribuição de INSS
           ' AND   vp.vlr_pago=0'+
           ' AND   vp.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
           ' AND   vp.cod_pessoa in ('+sgProfissionais+')'+
           ' AND   vp.dta_vencimento='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dDta))));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    bgSiga:=(Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)<>'');
    DMBelShop.CDS_BuscaRapida.Close;

    If bgSiga Then
     Begin
       If msg('As Contribuições de INSS'+cr+'do Mês de '+LongMonthNames[i]+cr+'Foram Geradas CORRETAMENTE ??','C')=2 Then
       Begin
         FrmBelShop.gCDS_V_Geral.Free;
         FrmBelShop.gCDS_V_Geral:=nil;
         Exit;
       End;
     End
    Else
     Begin
       If msg('As Contribuições de INSS'+cr+'do Mês de '+LongMonthNames[i]+cr+'NÃO Foram Geradas !!'+cr+cr+'Deseja Continuar ??','C')=2 Then
       Begin
         FrmBelShop.gCDS_V_Geral.Free;
         FrmBelShop.gCDS_V_Geral:=nil;
         Exit;
       End;
     End; //If bgSiga Then
  End; // If DataNoPeriodo(StrToDate(f_Troca('.','/',sgPeriodoIni)), StrToDate(f_Troca('.','/',sgPeriodoFim)),dDta) Then
  //============================================================================

  //============================================================================
  // Verifica Plano de Saude (Sempre no Dia 22 de Cada Mês) ====================
  //============================================================================
  dDta:=EncodeDate(wAno, wMes, 22);
  If DataNoPeriodo(StrToDate(f_Troca('.','/',sgPeriodoIni)), StrToDate(f_Troca('.','/',sgPeriodoFim)),dDta) Then
  Begin
    MySql:=' SELECT First 1 pf.cod_loja'+
           ' FROM ps_vales_pessoas vp, sal_profissionais pf'+
           ' WHERE vp.cod_loja=pf.cod_loja'+
           ' AND   vp.cod_pessoa=pf.cod_profissional'+
           ' AND   vp.tp_pessoa=1'+
           ' AND   pf.tip_pessoa='+QuotedStr('P')+
           ' AND   pf.ind_Ativo='+QuotedStr('SIM')+
           ' AND   vp.ind_debcred='+QuotedStr('P')+ // Plano de Saude
           ' AND   vp.vlr_pago=0'+
           ' AND   vp.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
           ' AND   vp.cod_pessoa in ('+sgProfissionais+')'+
           ' AND   vp.dta_vencimento='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dDta))));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    bgSiga:=(Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)<>'');
    DMBelShop.CDS_BuscaRapida.Close;

    If bgSiga Then
     Begin
       If msg('Os Planos de Saúde'+cr+'do Mês de '+LongMonthNames[i]+cr+cr+'Foram IMPORTADOS ??','C')=2 Then
       Begin
         FrmBelShop.gCDS_V_Geral.Free;
         FrmBelShop.gCDS_V_Geral:=nil;
         Exit;
       End;
     End
    Else
     Begin
       If msg('Os Planos de Saúde'+cr+' do Mês de '+LongMonthNames[i]+cr+'NÃO Foram IMPORTADOS !!'+cr+cr+'Deseja Continuar ??','C')=2 Then
       Begin
         FrmBelShop.gCDS_V_Geral.Free;
         FrmBelShop.gCDS_V_Geral:=nil;
         Exit;
       End;
     End; //If bgSiga Then
  End; // If DataNoPeriodo(StrToDate(f_Troca('.','/',sgPeriodoIni)), StrToDate(f_Troca('.','/',sgPeriodoFim)),dDta) Then
  //============================================================================

  //============================================================================
  // Verifica Taxa Sindicato (Sempre no Último Dia de Fevereiro de Cada Ano) ===
  //============================================================================
  If wMes=2 Then
  Begin
    dDta:=PrimeiroUltimoDia(EncodeDate(wAno, wMes, 1),'U');

    If DataNoPeriodo(StrToDate(f_Troca('.','/',sgPeriodoIni)), StrToDate(f_Troca('.','/',sgPeriodoFim)),dDta) Then
    Begin
      MySql:=' SELECT First 1 pf.cod_loja'+
             ' FROM ps_vales_pessoas vp, sal_profissionais pf'+
             ' WHERE vp.cod_loja=pf.cod_loja'+
             ' AND   vp.cod_pessoa=pf.cod_profissional'+
             ' AND   vp.tp_pessoa=1'+
             ' AND   pf.tip_pessoa='+QuotedStr('P')+
             ' AND   pf.ind_Ativo='+QuotedStr('SIM')+
             ' AND   vp.ind_debcred='+QuotedStr('S')+ // Taxa Sindicato
             ' AND   vp.vlr_pago=0'+
             ' AND   vp.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
             ' AND   vp.cod_pessoa in ('+sgProfissionais+')'+
             ' AND   vp.dta_vencimento='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dDta))));
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      bgSiga:=(Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)<>'');
      DMBelShop.CDS_BuscaRapida.Close;

      If bgSiga Then
       Begin
         If msg('As Taxas do Sindicato'+cr+'do Mês de '+LongMonthNames[i]+cr+cr+'Foram Geradas CORRETAMENTE ??','C')=2 Then
         Begin
           FrmBelShop.gCDS_V_Geral.Free;
           FrmBelShop.gCDS_V_Geral:=nil;
           Exit;
         End;
       End
      Else
       Begin
         If msg('As Taxas do Sindicato'+cr+'do Mês de '+LongMonthNames[i]+cr+'NÃO Foram Geradas !!'+cr+cr+'Deseja Continuar ??','C')=2 Then
         Begin
           FrmBelShop.gCDS_V_Geral.Free;
           FrmBelShop.gCDS_V_Geral:=nil;
           Exit;
         End;
       End; //If bgSiga Then
    End; // If DataNoPeriodo(StrToDate(f_Troca('.','/',sgPeriodoIni)), StrToDate(f_Troca('.','/',sgPeriodoFim)),dDta) Then
  End; // If wMes=2 Then
  //============================================================================

  //============================================================================
  // Solicita Arquivo TecBiz ===================================================
  //============================================================================
  If msg('Arquivo(s) TecBiz Já Importado(s) ??','C')=2 Then
    Exit;

  // Busca Vendas dos Profissionais da Loja Selecionada ========================
  sgMensagem:='DESEJA BUSCAR AS VENDAS'+cr+cr+'DOS PROFISSIONAIS DA LOJA Bel_'+FormatFloat('00',EdtPagtoCodLoja.AsInteger)+' ??';
  If msg(sgMensagem,'C')=1 Then
  Begin
    If Not ProfBuscaVendas Then
    Begin
      FrmBelShop.gCDS_V_Geral.Free;
      FrmBelShop.gCDS_V_Geral:=nil;
      Exit;
    End;
  End; // If msg(sgMensagem,'C')=1 Then

  //============================================================================
  // GERA MOVIMENTAÇÃO DE BENEFICIO NA TABELA PS_VALES_PESSOAS =================
  //============================================================================
  If Not ProfGeraBeneficios Then
  Begin
    msg('Erro ao Calcular Benefícios !!'+cr+cr+'Entrar em Contato com o Odir!!','A');
    Dbg_PagtoProfissionais.SetFocus;
    Exit;
  End;

  //============================================================================
  // CALCULO DE COMISSÕES DO PERIODO ===========================================
  //============================================================================
  If Not ProfApresentaComissoes Then
  Begin
    FrmBelShop.gCDS_V_Geral.Free;
    FrmBelShop.gCDS_V_Geral:=nil;
    Exit;
  End;

  //============================================================================
  // CALCULO DE DÉBITOS/CRÉDITOS DO PERIODO ====================================
  //============================================================================
  ProfBuscaDebitosCreditos;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  // Fecha Client Virtual gCDS_V_Geral =========================================
  FrmBelShop.gCDS_V_Geral.Close;
  FrmBelShop.gCDS_V_Geral.Free;
  FrmBelShop.gCDS_V_Geral:=nil;

  // Apresenta Planilhas de Conferencias =======================================
  Ts_PagtoPlanilha.TabVisible:=False;
  Ts_PagtoVendas.TabVisible:=True;
  Ts_PagtoDebCred.TabVisible:=True;
  Ts_PagtoProfissionais.TabVisible:=False;
  PC_PagtoPlanilha.ActivePage:=Ts_PagtoDebCred;

//odirapagar - 29/01/2015
//  Bt_PagtoGeraPlanilha.Visible:=True;/

  // Coloca Como Sintético =====================================================
  Rb_PagtoVendasSintetico.Checked:=True;
  Rb_PagtoVendasSinteticoClick(Self);

  Rb_PagtoDebCredSintetico.Checked:=True;
  Rb_PagtoDebCredSinteticoClick(Self);

  DMSalao.CDS_V_PagtoProf.First;

end;

procedure TFrmSalao.Ckb_PagtoMetasClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_PagtoMetas);
end;

procedure TFrmSalao.Dbg_PagtosVendasColEnter(Sender: TObject);
begin

  if (THackDBGridSalao(Dbg_PagtosVendas).SelectedIndex=0) Or
     (THackDBGrid(Dbg_PagtosVendas).SelectedIndex=1) Then
  begin
    THackDBGridSalao(Dbg_PagtosVendas).LeftCol:=3;
    THackDBGridSalao(Dbg_PagtosVendas).SelectedIndex:=2;
    Dbg_PagtosVendas.Refresh;
  end;

end;

procedure TFrmSalao.Dbg_PagtosVendasColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
begin
  // Acerta Colunas Fixadas -----------------------------------------
  Dbg_PagtosVendasColEnter(Self);

end;

procedure TFrmSalao.Dbg_PagtosVendasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  // Acerta Colunas Fixadas -----------------------------------------
  Dbg_PagtosVendasColEnter(Self);

  // Acerta Apresentacao --------------------------------------------
  if not (gdSelected in State) Then
  Begin
    If (DMSalao.CDS_V_PagtosVendasCOD_PROF.AsString<>'') And
       (DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString<>'') And
       (DMSalao.CDS_V_PagtosVendasNUM_DOCTO.AsString='') Then
    Begin
      Dbg_PagtosVendas.Canvas.Font.Style:=[fsBold];
      Dbg_PagtosVendas.Canvas.Brush.Color:=clSkyBlue;
    End;

    If DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString='--- TOTAIS ---' Then
    Begin
      Dbg_PagtosVendas.Canvas.Font.Style:=[fsBold];
      Dbg_PagtosVendas.Canvas.Brush.Color:=$00D8D8D8; 
    End;

    If DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString='--- TOTAL GERAL ---' Then
    Begin
      Dbg_PagtosVendas.Canvas.Font.Style:=[fsBold];
      Dbg_PagtosVendas.Canvas.Brush.Color:=clBlue;
      Dbg_PagtosVendas.Canvas.Font.Color:=clWhite;// -->> Cor da Fonte
    End;

    If (Column.FieldName='DES_PROFISSIONAL') Then //   ----> Este comando altera cor da Celula
    Begin
      If (DMSalao.CDS_V_PagtosVendasCOD_PROF.AsString='') And
         (DMSalao.CDS_V_PagtosVendasDES_PROFISSIONAL.AsString<>'') And
         (DMSalao.CDS_V_PagtosVendasVLR_TOT_COMISSAO.AsString<>'') And
         (DMSalao.CDS_V_PagtosVendasNUM_DOCTO.AsString<>'') Then
      Begin
        Dbg_PagtosVendas.Canvas.Font.Style:=[fsBold];
        Dbg_PagtosVendas.Canvas.Brush.Color:=clMoneyGreen;
      End;
    End;

    Dbg_PagtosVendas.Canvas.FillRect(Rect);
    Dbg_PagtosVendas.DefaultDrawDataCell(Rect,Column.Field,state);
  End; // if not (gdSelected in State) Then

  THackDBGridSalao(Dbg_PagtosVendas).FixedCols:=3;

end;

procedure TFrmSalao.Dbg_PagtosVendasDrawDataCell(Sender: TObject;
          const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  // Acerta Colunas Fixadas -----------------------------------------
  Dbg_PagtosVendasColEnter(Self);

end;

procedure TFrmSalao.Dbg_PagtosVendasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Acerta Posicição na Celula ================================================
  if (Key = VK_Left) and (THackDBGridSalao(Dbg_PagtosVendas).SelectedIndex=1) then
  Begin
    Key := VK_Clear;
    THackDBGridSalao(Dbg_PagtosVendas).FixedCols:=3;
    Dbg_PagtosVendas.Refresh;
  End;

end;

procedure TFrmSalao.Bt_PagtoVendasSalvaExcelClick(Sender: TObject);
begin

  If (Sender as TJvXPButton).Name='Bt_ProfPlanoSaudeSalvaExcel' Then
  Begin
    If DMSalao.CDS_PlanoSaudeApres.IsEmpty Then
     Exit;

    ExportDBGridExcel(True, Dbg_ProfPlanoSaudeImportados, FrmSalao);
  End;

  If (Sender as TJvXPButton).Name='Bt_ProfTecBizSalvaExcel' Then
  Begin
    If DMSalao.CDS_TecBizApres.IsEmpty Then
     Exit;

    ExportDBGridExcel(True, Dbg_ProfTecBizImportados, FrmSalao);
  End;

  If (Sender as TJvXPButton).Name='Bt_PagtoVendasSalvaExcel' Then
  Begin
    If DMSalao.CDS_V_PagtosVendas.IsEmpty Then
     Exit;

    ExportDBGridExcel(True, Dbg_PagtosVendas, FrmSalao);
  End;

  If (Sender as TJvXPButton).Name='Bt_PagtoDebCredSalvaExcel' Then
  Begin
    If DMSalao.CDS_V_PagtosDebCred.IsEmpty Then
     Exit;

    ExportDBGridExcel(True, Dbg_PagtosDebCred, FrmSalao);
  End;

  If (Sender as TJvXPButton).Name='Bt_ProfINSSTXSExcel' Then
  Begin                            
    // Contribuição INSS =======================================================
    If sgINSS_PS='I' Then
    Begin
      If DMSalao.CDS_V_Inss.IsEmpty Then
       Exit;

      ExportDBGridExcel(True, Dbg_ProfINSS, FrmSalao);
    End; // If sgINSS_PS='I' Then

    // Taxa Sindicato ==========================================================
    If sgINSS_PS='S' Then
    Begin
      If DMSalao.CDS_V_TaxaSindicato.IsEmpty Then
       Exit;

      ExportDBGridExcel(True, Dbg_ProfTaxaSindicato, FrmSalao);
    End; // If sgINSS_PS='S' Then
  End; // If (Sender as TJvXPButton).Name='Bt_ProfINSSTXSExcel' Then

  If (Sender as TJvXPButton).Name='Bt_PagtoPlanSalvaExcel' Then
  Begin
    If DMSalao.CDS_PagtosPlan.IsEmpty Then
     Exit;

    ExportDBGridExcel(True, Dbg_PagtoPlanilha, FrmSalao);
  End;
end;

procedure TFrmSalao.Bt_PagtoVendasVoltarClick(Sender: TObject);
begin
  EdtPagtoCodPlan.Value:=0;

  Ts_PagtoPlanilha.TabVisible:=False;
  Ts_PagtoVendas.TabVisible:=False;
  Ts_PagtoDebCred.TabVisible:=False;
  Ts_PagtoProfissionais.TabVisible:=True;
  Dbg_PagtoProfissionais.Visible:=True;

  DMSalao.CDS_PagtosPlan.Close;
  DMSalao.CDS_V_PagtosVendas.Close;
  DMSalao.CDS_V_PagtosDebCred.Close;

  Bt_PagtoDebCredImprime.Visible:=True;
  Bt_PagtoDebCredImprime.Caption:='Planilha Conferência';
  Bt_PagtoDebCredImprime.Parent:=Pan_DebCredBottom;
  Bt_PagtoGeraPlanilha.Parent:=Pan_DebCredBottom;

  PC_PagtoPlanilha.ActivePage:=Ts_PagtoProfissionais;

end;

procedure TFrmSalao.Bt_PagtoVendasClipboardClick(Sender: TObject);
begin

  If (Sender as TJvXPButton).Name='Bt_ProfPlanoSaudeClipboard' Then
  Begin
    If DMSalao.CDS_PlanoSaudeApres.IsEmpty Then
     Exit;

    DBGridClipboard(Dbg_ProfPlanoSaudeImportados);
  End;

  If (Sender as TJvXPButton).Name='Bt_ProfTecBizClipboard' Then
  Begin
    If DMSalao.CDS_TecBizApres.IsEmpty Then
     Exit;

    DBGridClipboard(Dbg_ProfTecBizImportados);
  End;

  If (Sender as TJvXPButton).Name='Bt_PagtoVendasClipboard' Then
  Begin
    If DMSalao.CDS_V_PagtosVendas.IsEmpty Then
     Exit;

    DBGridClipboard(Dbg_PagtosVendas);
  End;

  If (Sender as TJvXPButton).Name='Bt_PagtoDebCredClipboard' Then
  Begin
    If DMSalao.CDS_V_PagtosDebCred.IsEmpty Then
     Exit;

    DBGridClipboard(Dbg_PagtosDebCred);
  End;

  If (Sender as TJvXPButton).Name='Bt_ProfINSSTXSClipboard' Then
  Begin
    // Contribuição INSS =======================================================
    If sgINSS_PS='I' Then
    Begin
      If DMSalao.CDS_V_Inss.IsEmpty Then
       Exit;

      DBGridClipboard(Dbg_ProfINSS);
    End; // If sgINSS_PS='I' Then

    // Taxa Sindicato ==========================================================
    If sgINSS_PS='S' Then
    Begin
      If DMSalao.CDS_V_TaxaSindicato.IsEmpty Then
       Exit;

      DBGridClipboard(Dbg_ProfTaxaSindicato);
    End; // If sgINSS_PS='S' Then
  End; // If (Sender as TJvXPButton).Name='Bt_INSS_PSClipboard' Then

  If (Sender as TJvXPButton).Name='Bt_PagtoPlanClipboard' Then
  Begin
    If DMSalao.CDS_PagtosPlan.IsEmpty Then
     Exit;

    DBGridClipboard(Dbg_PagtoPlanilha);
  End;
end;

procedure TFrmSalao.Rb_PagtoVendasSinteticoClick(Sender: TObject);
Var
  i: Integer;
begin
  AcertaRb_Style(Rb_PagtoVendasSintetico);
  AcertaRb_Style(Rb_PagtoVendasAnalitico);

  DMSalao.CDS_V_PagtosVendas.Filtered:=False;
  DMSalao.CDS_V_PagtosVendas.Filter:='';

  If Rb_PagtoVendasSintetico.Checked Then
  Begin
    DMSalao.CDS_V_PagtosVendas.Filter:='SINTETICO=''S''';
    DMSalao.CDS_V_PagtosVendas.Filtered:=True;
  End;

  For i:=0 to Dbg_PagtosVendas.Columns.Count-1 do
  Begin
    Dbg_PagtosVendas.Columns[i].Visible:=True;
    If (DMSalao.CDS_V_PagtosVendas.Filtered) and (i>5) Then
     Dbg_PagtosVendas.Columns[i].Visible:=False;
  End; // For i:=0 to DMSalao.CDS_V_PagtosVendas.Fields.Count-1 do

  If PC_PagtoPlanilha.ActivePage=Ts_PagtoVendas Then
   Dbg_PagtosVendas.SetFocus;

end;

procedure TFrmSalao.Ckb_PagtoMetasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_PagtoMetasClick(Self);
end;

procedure TFrmSalao.Rb_PagtoVendasSinteticoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_PagtoVendasSinteticoClick(Self);
end;

procedure TFrmSalao.Ckb_ProfissionaisKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Ckb_ProfissionaisClick(Self);
end;

procedure TFrmSalao.Ckb_VendedoresKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ProfissionaisClick(Self);
end;

procedure TFrmSalao.Bt_ProfTecBizImpArquivoClick(Sender: TObject);
Var
  MySql: String;
  dDta: TDate;
  b: Boolean;
begin
  PC_ProfTecBiz.TabIndex:=0;

  sgMensagem:='O ARQUIVO TECBIZ, A SER IMPORTADO, DEVE SER:'+cr+cr+
              ' - Arquivo em Excel:'+cr+
              '          - Extensão "XLS" ou "XLSX"'+cr+cr+
              ' - Leiaute:'+cr+
              '          - Primeira  Coluna: Seq.'+cr+
              '          - Segunda Coluna: Código (Contendo 5 Caracteres Fixos)'+cr+
              '          - Terceira  Coluna: Nome do Associado'+cr+
              '          - Quarta    Coluna: Total(R$)'+cr+cr+
              ' AS INFORMAÇÕES ESTÃO CORRETAS ??';

  If Application.MessageBox(PChar(sgMensagem), 'ATENÇÃO !!', 292)=IdNo Then
   Exit;

  Strg_ProfTecBizImpArquivo.SetFocus;

  bgSiga:=False;

  FrmPeriodoApropriacao:=TFrmPeriodoApropriacao.Create(Self);

  If sgDtaI='' Then
   Begin
     dDta:=DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor);

     b:=True;
     While b do
     Begin
       If AnsiUpperCase(DiaSemanaNome(dDta))=AnsiUpperCase('Terça') Then
       Begin
         FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Text:=DateToStr(dDta-6);
         FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Text   :=DateToStr(dDta);
         b:=False;
         Break;
       End;
       dDta:=dDta-1;
     End; // While b do
   End
  Else
   Begin
     FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Text:=sgDtaI;
     FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Text   :=sgDtaF;
   End; // If sgDtaI='' Then

  FrmPeriodoApropriacao.ShowModal;

  If Not bgSiga Then
  Begin
    FrmPeriodoApropriacao.Free;
    FrmPeriodoApropriacao:=nil;
    Exit;
  End;

  sgDtaI:=DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date);
  sgDtaF:=DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date);

  sgDtaInicio:=f_Troca('/','.',DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date));
  sgDtaInicio:=f_Troca('-','.',sgDtaInicio);
  sgDtaFim   :=f_Troca('/','.',DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date));
  sgDtaFim   :=f_Troca('/','.',sgDtaFim);

  FrmPeriodoApropriacao.Free;
  FrmPeriodoApropriacao:=nil;

  // Verifica Existencia do Periodo ============================================
  MySql:='SELECT tb.dta_ini_periodo, tb.dta_fim_periodo'+
         ' FROM PS_TECBIZ tb'+
         ' WHERE ('+
         '    ('+
         '    (Cast('+QuotedStr(sgDtaInicio)+' as Date) BETWEEN tb.dta_ini_periodo AND tb.dta_fim_periodo)'+
         '     OR'+
         '    (Cast('+QuotedStr(sgDtaFim)+' as Date) BETWEEN tb.dta_ini_periodo AND tb.dta_fim_periodo)'+
         '    )'+
         '  OR'+
         '   ('+
         '   (tb.dta_ini_periodo BETWEEN Cast('+QuotedStr(sgDtaInicio)+' as Date) AND Cast('+QuotedStr(sgDtaFim)+' as Date))'+
         '    OR'+
         '   (tb.dta_fim_periodo BETWEEN  Cast('+QuotedStr(sgDtaInicio)+' as Date) AND Cast('+QuotedStr(sgDtaFim)+' as Date))'+
         '   )'+
         '   )';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgDtaI:=DMBelShop.CDS_BuscaRapida.FieldByName('dta_ini_periodo').AsString;
  sgDtaF:=DMBelShop.CDS_BuscaRapida.FieldByName('dta_fim_periodo').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  If Trim(sgDtaI)<>'' Then
  Begin
    If msg('Período Informado em Convergência'+cr+'com Período já Importado !!'+cr+sgDtaI+' a '+sgDtaF+cr+cr+'Deseja Continuar Assim mesmo ??','C')=2 Then
    Begin
      Strg_ProfTecBizImpArquivo.SetFocus;
      Exit;
    End;
  End;

  If Lbx_ProfTecBizImpArqSel.Items.Count<1 Then
  Begin
    msg('SEM Arquivo TecBiz'+cr+cr+'a Importar !!','A');
    Bt_ProfTecBizArquivo.SetFocus;
    Exit;
  End;

  If msg('A(s) Planinha(s) Selecionada(s) Esta(ão) CORRETA(S) ??','C')=2 Then
  Begin
    Bt_ProfTecBizArquivo.SetFocus;
    Exit;
  End;

  // Importa TecBiz ============================================================
  ProfImportaTecBiz;
end;

procedure TFrmSalao.Bt_ProfTecBizArquivoClick(Sender: TObject);
Var
  OpenDialog: TOpenDialog;
  i, ii: Integer;
  b: Boolean;
  s: String;
begin

  // Limpa StringGrid
  LimpaStringGrid(Strg_ProfTecBizImpArquivo);
  Lbx_ProfTecBizImpArqSel.Items.Clear;

  OpenDialog := TOpenDialog.Create(Self);
  With OpenDialog do
  Begin
    Options := [ofAllowMultiSelect , ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
    DefaultExt := 'xls;xlsx';
    Filter := 'Arquivo Excel (*.xls;*.xlsx)|*.xls;*.xlsx';
    FilterIndex := 1;
    Title := 'Busca TecBiz.Excel';

    if Execute then
     Begin
       If EdtProfTecBizPastaArquivo.Text='' Then
        EdtProfTecBizPastaArquivo.Text:=ExtractFilePath(OpenDialog.FileName);

       If EdtProfTecBizPastaArquivo.Text<>ExtractFilePath(OpenDialog.FileName) Then
        Lbx_ProfTecBizImpArqSel.Items.Clear;

       // Seleciona os Arquivos ================================================
       for i:=0 to OpenDialog.Files.Count-1 do
       Begin
         s:=ExtractFileName(OpenDialog.Files[i]);
         b:=True;
         For ii:=0 to Lbx_ProfTecBizImpArqSel.Items.Count-1 do
         Begin
           If Lbx_ProfTecBizImpArqSel.Items[ii]=s Then
           Begin
             b:=False;
             Break;
           End;
         End; // For ii:=0 to Lbx_ProfTecBizImpArqSel.Items.Count-1 do

         If b Then
          Lbx_ProfTecBizImpArqSel.Items.Add(s);
       End; // for i:=0 to Files.Count-1 do
     End
    else // if Execute then
     begin
       Free;
       Exit;
     end; // if Execute then
  End; // With OpenDialog do
end;

procedure TFrmSalao.Strg_ProfTecBizImpArquivoDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  X, C, R :Integer;
begin
  // Ajusta Colunas para Direita
  C := ACol;
  R := ARow;
//  if (ACol > 1) and (ARow > 0) then
  If ACol =3 Then
  Begin
    With Sender as TStringGrid do
    Begin
      X := Rect.Left +(Rect.Right -Rect.Left) -Canvas.TextWidth(Cells[C, R]) -3;
      Canvas.TextRect(Rect, X, Rect.Top +2, Cells[C, R]);
    End;
  End;
end;

procedure TFrmSalao.Dbg_PagtosDebCredColEnter(Sender: TObject);
begin

  if (THackDBGridSalao(Dbg_PagtosDebCred).SelectedIndex=0) Or
     (THackDBGrid(Dbg_PagtosDebCred).SelectedIndex=1) Then
  begin
    THackDBGridSalao(Dbg_PagtosDebCred).LeftCol:=3;
    THackDBGridSalao(Dbg_PagtosDebCred).SelectedIndex:=2;
    Dbg_PagtosDebCred.Refresh;
  end;


end;

procedure TFrmSalao.Dbg_PagtosDebCredColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
begin
  // Acerta Colunas Fixadas -----------------------------------------
  Dbg_PagtosDebCredColEnter(Self);

end;

procedure TFrmSalao.Dbg_PagtosDebCredDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  // Acerta Colunas Fixadas -----------------------------------------
  Dbg_PagtosDebCredColEnter(Self);

end;

procedure TFrmSalao.Dbg_PagtosDebCredKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Acerta Posicição na Celula ================================================
  if (Key = VK_Left) and (THackDBGridSalao(Dbg_PagtosDebCred).SelectedIndex=1) then
  Begin
    DMSalao.CDS_V_PagtosDebCred.DisableControls;
    Key := VK_Clear;
    THackDBGridSalao(Dbg_PagtosDebCred).FixedCols:=3;
    Dbg_PagtosDebCred.Refresh;
    DMSalao.CDS_V_PagtosDebCred.EnableControls;
  End;

end;

procedure TFrmSalao.Rb_PagtoDebCredSinteticoClick(Sender: TObject);
Var
  i: Integer;
begin
  AcertaRb_Style(Rb_PagtoDebCredSintetico);
  AcertaRb_Style(Rb_PagtoDebCredAnalitico);

  DMSalao.CDS_V_PagtosDebCred.Filtered:=False;
  DMSalao.CDS_V_PagtosDebCred.Filter:='';

  If Rb_PagtoDebCredSintetico.Checked Then
  Begin
    DMSalao.CDS_V_PagtosDebCred.Filter:='SINTETICO=''S''';
    DMSalao.CDS_V_PagtosDebCred.Filtered:=True;
  End;

  For i:=0 to Dbg_PagtosDebCred.Columns.Count-1 do
  Begin
    Dbg_PagtosDebCred.Columns[i].Visible:=True;
    If (DMSalao.CDS_V_PagtosDebCred.Filtered) and (i>4) Then
     Dbg_PagtosDebCred.Columns[i].Visible:=False;
  End; // For i:=0 to Dbg_PagtosDebCred.Columns.Count-1 do

  If PC_PagtoPlanilha.ActivePage=Ts_PagtoDebCred Then
   Dbg_PagtosDebCred.SetFocus;

end;

procedure TFrmSalao.Rb_PagtoDebCredSinteticoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_PagtoDebCredSinteticoClick(Self);
end;

procedure TFrmSalao.Dbg_PagtosDebCredDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  // Acerta Colunas Fixadas -----------------------------------------
  Dbg_PagtosVendasColEnter(Self);

  // Acerta Apresentacao --------------------------------------------
  if not (gdSelected in State) Then
  Begin
    If DMSalao.CDS_V_PagtosDebCredCOD_PROF.AsString<>'' Then
    Begin
      Dbg_PagtosDebCred.Canvas.Font.Style:=[fsBold];
      Dbg_PagtosDebCred.Canvas.Brush.Color:=clSkyBlue;
    End;

    If DMSalao.CDS_V_PagtosDebCredDES_PROFISSIONAL.AsString='--- TOTAL GERAL ---' Then
    Begin
      Dbg_PagtosDebCred.Canvas.Font.Style:=[fsBold];
      Dbg_PagtosDebCred.Canvas.Brush.Color:=clBlue;
      Dbg_PagtosDebCred.Canvas.Font.Color:=clWhite;// -->> Cor da Fonte
    End;

    Dbg_PagtosDebCred.Canvas.FillRect(Rect);
    Dbg_PagtosDebCred.DefaultDrawDataCell(Rect,Column.Field,state);
  End; // if not (gdSelected in State) Then

  THackDBGridSalao(Dbg_PagtosDebCred).FixedCols:=3;

end;

procedure TFrmSalao.Bt_FecharClick(Sender: TObject);
begin
  // ATENÇÃO - Usado em Outros Paineis =========================================
  PC_Salao.SetFocus;
  If Ts_ProfVales.TabVisible Then
  Begin
    DesabilitaTodasTabSheets(PC_Salao);

    CorCaptionForm.FormCaption:='Movimentos (RH) Débitos/Créditos';
    Ts_ProfMovtosRH.TabVisible:=True;
    PC_SalaoChange(Self);

    OutLook_ProfMovtosRHClick(Self);
    OutLook_ProfMovtosRH.Enabled:=True;
    OutLook_ProfMovtosRH.SetFocus;

    // Posiciona Painel Rodape
    Bt_Fechar.Parent:=Pan_MovtosRH;
    Bt_Fechar.Visible:=True;

    Exit;
  End; // If Ts_ParamLojaReposFornec.Visible Then

  bgSairSalao:=True;
  Close;

end;

procedure TFrmSalao.Ckb_CadProfINSSCobrarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Ckb_CadProfINSSCobrarClick(Self);

end;

procedure TFrmSalao.Ckb_CadProfINSSCobrarClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_CadProfINSSCobrar);

  If (Ckb_CadProfINSSCobrar.Checked) And
     ((Trim(DMSalao.CDS_ProfissionaisNUM_INSS.AsString)='') Or (DMSalao.CDS_ProfissionaisPER_INSS.AsCurrency=0) Or
     (DMSalao.CDS_ProfissionaisPER_INSS.AsString='') Or (Cbx_CadProfSitPrevidencia.ItemIndex<>0)) Then
  Begin
    msg('Dados de INSS Inválidos !!','A');
    Ckb_CadProfINSSCobrar.Checked:=False;
    Dbe_CadProfNumINSS.SetFocus;
  End;

end;

procedure TFrmSalao.Gb_CadProfINSSExit(Sender: TObject);
begin
  If (Trim(DMSalao.CDS_ProfissionaisNUM_INSS.AsString)='') Or (DMSalao.CDS_ProfissionaisPER_INSS.AsCurrency=0) Or
     (Cbx_CadProfSitPrevidencia.ItemIndex<>0) Then
  Begin
    Ckb_CadProfINSSCobrar.Checked:=False;
    Ckb_CadProfINSSCobrarClick(Self);
  End;
end;

procedure TFrmSalao.EdtINSS_PSCodLojaChange(Sender: TObject);
begin
  // Usado em Outros TCurrencyEdit
  If Trim((Sender as TCurrencyEdit).Name)='EdtINSS_PSCodLoja' Then
   EdtINSS_PSDesLoja.Clear;

  If Trim((Sender as TCurrencyEdit).Name)='EdtBenefCodLoja' Then
   EdtBenefDesLoja.Clear;

  If Trim((Sender as TCurrencyEdit).Name)='EdtBenefManutCodLoja' Then
  Begin
    BeneficiosInicializaComponentes;

    EdtBenefManutDesLoja.Clear;
    EdtBenefManutCodProf.Clear;
    EdtBenefManutDesProf.Clear;
  End;

  If Trim((Sender as TCurrencyEdit).Name)='EdtBenefManutCodProf' Then
  Begin
    BeneficiosInicializaComponentes;

    EdtBenefManutDesProf.Clear;
  End;

  FechaTudoSalao;

end;

procedure TFrmSalao.EdtINSS_PSCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtINSS_PSCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    Cbx_INSS_PSMesChange(Self);

    EdtINSS_PSDesLoja.Clear;

    DMSalao.CDS_V_INSS.Close;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From EMP_CONEXOES'+
           ' Where Ind_Ativo=''SIM'''+
           ' And COD_FILIAL='+QuotedStr(FormatFloat('00',EdtINSS_PSCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('RAZAO_SOCIAL').AsString)='' Then
    Begin
      msg('Loja NÃO Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtINSS_PSCodLoja.Clear;
      EdtINSS_PSCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtINSS_PSDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    // Busca Contribuições INSS/Plano de Saude =================================
    ProfBuscaDebitos(sgINSS_PS);

    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmSalao.Bt_INSS_PSBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtINSS_PSCodLoja.Clear;
  EdtINSS_PSDesLoja.Clear;

  EdtINSS_PSCodLoja.SetFocus;

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
    EdtINSS_PSCodLoja.SetFocus;
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
     EdtINSS_PSCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtINSS_PSDesLoja.Text:=FrmPesquisa.EdtDescricao.Text;
     EdtINSS_PSCodLojaExit(Self);
   End
  Else
   Begin
     EdtINSS_PSCodLoja.Clear;
     EdtINSS_PSDesLoja.Clear;
     EdtINSS_PSCodLoja.SetFocus;
   End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmSalao.Bt_INSS_PSBuscaClick(Sender: TObject);
Var
  sTp, MySql: String;
  wDia, wMes, wAno: Word;
begin
  FechaTudoSalao;

  If EdtINSS_PSCodLoja.Value=0 Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtINSS_PSCodLoja.SetFocus;
    Exit;
  End;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  If sgINSS_PS='I' Then sTp:='5';
  If sgINSS_PS='S' Then sTp:='9';

// OdirApagar - 01/10/2015 - Plano de Suade é Importado e Não Mais Gerado
//  If sgINSS_PS='P' Then sTp:='8';

  MySql:=' SELECT t.des_aux Dta_Pagto, t.cod_aux Planilha'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux='+sTp+
         ' AND   t.des_aux1='+QuotedStr(FormatFloat('00',StrToInt(EdtINSS_PSCodLoja.text)))+
         ' ORDER BY cast((substring(t.des_aux from 1 for 2)||''.''||'+
         '                substring(t.des_aux from 4 for 2)||''.''||'+
         '                substring(t.des_aux from 7 for 4)) as date) desc';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Planilha').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Planilha a Listar !!','A');
    EdtINSS_PSCodLoja.SetFocus;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Dta_Pagto';
  FrmPesquisa.Campo_Codigo:='Planilha';
  FrmPesquisa.Campo_Descricao:='Dta_Pagto';
  // FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;
  // Campos Qualquer de Retorno ================================================
  // Variavel de Entrada  - Variavel de Retorno
  // Campo_Retorno1       - Retorno1
  // Campo_Retorno2       - Retorno2
  // Campo_Retorno3       - Retorno3
  // FrmPesquisa.Campo_Retorno1:='Dta_Cadastro';
  // FrmPesquisa.Campo_Retorno2:='Cod_Cidade';
  // FrmPesquisa.Campo_Retorno3:='';

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    bgConsultaIPS:=True;

    DecodeDate(StrToDateTime(Trim(FrmPesquisa.EdtDescricao.Text)), wAno, wMes, wDia);
    sMes1:=LongMonthNames[wMes];
    Cbx_INSS_PSMes.ItemIndex:=Cbx_INSS_PSMes.Items.IndexOf(sMes1);
    EdtINSS_PSAno.Value:=wAno;
    DtaEdt_INSS_PSVenc.Text:=Trim(FrmPesquisa.EdtDescricao.Text);

    EdtINSS_PSCodLoja.SetFocus;
    EdtINSS_PSCodLojaExit(Self);
  End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmSalao.Dbg_ProfINSSDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if (DMSalao.CDS_V_InssNOME.AsString<>'') And (DMSalao.CDS_V_InssNUM_INSS.AsString='') Then
    Begin
      Dbg_ProfINSS.Canvas.Font.Style:=[fsBold];
      Dbg_ProfINSS.Canvas.Brush.Color:=clSkyBlue;
    end;

    If (Column.FieldName='PAGO') Then //   ----> Este comando altera cor da Celula
    Begin
      If (DMSalao.CDS_V_InssPAGO.AsString='SIM') Then
      Begin
        Dbg_ProfINSS.Canvas.Font.Style:=[fsBold];
        Dbg_ProfINSS.Canvas.Brush.Color:=clBlue;
        Dbg_ProfINSS.Canvas.Font.Color:=clWhite;// -->> Cor da Fonte
      End;

      If (DMSalao.CDS_V_InssPAGO.AsString='NAO') Then
      Begin
        Dbg_ProfINSS.Canvas.Font.Style:=[fsBold];
        Dbg_ProfINSS.Canvas.Brush.Color:=clRed;
        Dbg_ProfINSS.Canvas.Font.Color:=clWhite;// -->> Cor da Fonte
      End;
    End;

    Dbg_ProfINSS.Canvas.FillRect(Rect);
    Dbg_ProfINSS.DefaultDrawDataCell(Rect,Column.Field,state);

    DMSalao.CDS_V_InssPAGO.Alignment:=taCenter;
    DMSalao.CDS_V_InssDTA_VENCIMENTO.Alignment:=taCenter;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmSalao.Bt_ProfINSSTXSCalcularClick(Sender: TObject);
Var
  s, MySql: String;
  sMensagem: String;
  sSalMinimo: String;
begin

  sgMensagem:='';
  sgMensagemERRO:='';

  If sgINSS_PS='I' Then sMensagem:='de Contribuição de INSS ??';
  If sgINSS_PS='S' Then sMensagem:='de Taxa de Sindicato ??';

// OdirApagar - 01/10/2015 - Plano de Suade é Importado e Não Mais Gerado
//  If sgINSS_PS='P' Then sMensagem:='de Plano de Saúde ??';

  If Trim(Cbx_INSS_PSMes.Text)='' Then
  Begin
    msg('Valor Informar o Mês de Compotência !!','A');
    Cbx_INSS_PSMes.SetFocus;
    Exit;
  End;

  // Verifica Existencia do Salario Minino no Perirodo =========================
  If sgINSS_PS='I' Then
  Begin
    bgDtaInicioContrato:=True;
    If msg('Calcular Profissionais'+cr+cr+'SEM DATA DE INÍCIO de Contrato ??','C')=2 Then
     bgDtaInicioContrato:=False;

    // Verifica Salario Minimo =================================================
    MySql:=' SELECT ct.vlr_inicial Sal_Minimo'+
           ' FROM fin_contribuicoes ct'+
           ' WHERE ct.tp_registro=1'+
           ' AND CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text)))+' AS DATE) BETWEEN ct.dta_vigencia_inicio AND ct.dta_vigencia_final';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sSalMinimo:=Trim(DMBelShop.CDS_BuscaRapida.FieldBYName('Sal_Minimo').AsString);
    DMBelShop.CDS_BuscaRapida.Close;

    If sSalMinimo='' Then
    Begin
      msg('Salário Mínimo Referentre a '+DtaEdt_INSS_PSVenc.Text+cr+cr+'Não Informado nos Parametros !!','A');
      Exit;
    End;
  End; // If sgINSS_PS='I' Then

  // Seleciona Lojas ===========================================================
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False; // Empresa 06 Checada
  // Inclui Outras Empresas
  sgOutrasEmpresa:='';
  FrmSelectEmpProcessamento.ShowModal;

  // Verifica se Existe Empresa a Processar ====================================
  If FrmSelectEmpProcessamento.iNrEmpProc=0 Then
  Begin
    FrmSelectEmpProcessamento.Free;
    Exit;
  End; // If FrmSelectEmpProcessamento.iNrEmpProc=1 Then
  iNrConexoes:=FrmSelectEmpProcessamento.iNrEmpProc;
  FrmSelectEmpProcessamento.Free;

  // ===========================================================================
  // Analisa se já Foi Cobrado =================================================
  // ===========================================================================
  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
    Begin
      sCodFilial:=DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString;

      // Verifica se Contribuiçao de INSS já Foi Cobrado ===========================
      If sgINSS_PS='I' Then
      Begin
        MySql:=' SELECT d.num_planilha'+
               ' FROM PS_VALES_PESSOAS i, SAL_PLAN_DEBCRED d'+
               ' WHERE i.cod_loja=d.cod_loja'+
               ' AND   i.num_seq=d.num_seq'+
               ' AND   i.num_docto=d.num_docto'+
               ' AND   i.dta_vencimento=d.dta_vencimento'+
               ' AND   i.tp_pessoa=1'+
               ' AND   d.tp_doc=2'+ // CONTRIBUIÇÃO INSS
               ' AND   i.cod_loja='+QuotedStr(sCodFilial)+
               ' AND   i.ind_debcred='+QuotedStr('I')+
               ' AND   i.num_docto='+sgMesVenc+sgAnoVenc;
        DMBelShop.CDS_Busca.Close;
        DMBelShop.SDS_Busca.CommandText:=MySql;
        DMBelShop.CDS_Busca.Open;
        s:=DMBelShop.CDS_Busca.FieldByName('num_planilha').AsString;
        DMBelShop.CDS_Busca.Close;

        If Trim(s)<>'' Then
        Begin
          sgMensagemERRO:=sgMensagemERRO+cr+'- Bel_'+sCodFilial+
                                            ' Não GERADA !! - Contribuição de INSS da Competência de '+
                                            Cbx_INSS_PSMes.Text+'/'+EdtINSS_PSAno.Text+
                                            ' Já Cobrado na Planilha de Pagto Nº '+s;
          DMBelShop.CDS_EmpProcessa.Edit;
          DMBelShop.CDS_EmpProcessaPROC.AsString:='NAO';
          DMBelShop.CDS_EmpProcessa.Post;

          iNrConexoes:=iNrConexoes-1;
        End;
      End; // If sgINSS_PS='I' Then

// OdirApagar - 01/10/2015 - Plano de Suade é Importado e Não Mais Gerado
//      // Verifica se Plano de Saude já Foi Cobrado =================================
//      If sgINSS_PS='P' Then
//      Begin
//        MySql:=' SELECT d.num_planilha'+
//               ' FROM ps_vales_pessoas i, sal_plan_debcred d'+
//               ' WHERE i.cod_loja=d.cod_loja'+
//               ' AND   i.num_seq=d.num_seq'+
//               ' AND   i.num_docto=d.num_docto'+
//               ' AND   i.dta_vencimento=d.dta_vencimento'+
//               ' AND   i.tp_pessoa=1'+
//               ' AND   d.tp_doc=3'+ // PLANO DE SAUDE
//               ' AND   i.cod_loja='+QuotedStr(sCodFilial)+
//               ' AND   i.ind_debcred='+QuotedStr('P')+
//               ' AND   EXISTS (SELECT 1'+
//               '               From TAB_AUXILIAR ps'+
//               '               WHERE ps.tip_aux=4'+
//               '               AND   Trim(ps.des_aux)=Trim(d.des_profissional))';
//        DMBelShop.CDS_Busca.Close;
//        DMBelShop.SDS_Busca.CommandText:=MySql;
//        DMBelShop.CDS_Busca.Open;
//        s:=DMBelShop.CDS_Busca.FieldByName('num_planilha').AsString;
//        DMBelShop.CDS_Busca.Close;
//
//        If Trim(s)<>'' Then
//        Begin
//          sgMensagemERRO:=sgMensagemERRO+cr+'- Bel_'+sCodFilial+
//                                            ' Não GERADA !! - Plano de Saúde da Competência de '+
//                                            Cbx_INSS_PSMes.Text+'/'+EdtINSS_PSAno.Text+
//                                            ' Já Cobrado na Planilha de Pagto Nº '+s;
//          DMBelShop.CDS_EmpProcessa.Edit;
//          DMBelShop.CDS_EmpProcessaPROC.AsString:='NAO';
//          DMBelShop.CDS_EmpProcessa.Post;
//
//          iNrConexoes:=iNrConexoes-1;
//        End;
//      End; // If sgINSS_PS='P' Then

      // Verifica se Taxa Sindicato já Foi Cobrado =================================
      If sgINSS_PS='S' Then
      Begin
        MySql:=' SELECT d.num_planilha'+
               ' FROM ps_vales_pessoas i, sal_plan_debcred d'+
               ' WHERE i.cod_loja=d.cod_loja'+
               ' AND   i.num_seq=d.num_seq'+
               ' AND   i.num_docto=d.num_docto'+
               ' AND   i.dta_vencimento=d.dta_vencimento'+
               ' AND   i.tp_pessoa=1'+
               ' AND   d.tp_doc=4'+ // TAXA DO SINDICATO
               ' AND   i.cod_loja='+QuotedStr(sCodFilial)+ // QuotedStr(FormatFloat('00',EdtINSS_PSCodLoja.AsInteger))+
               ' AND   i.ind_debcred='+QuotedStr('S')+
               ' AND   i.dta_vencimento='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text)));
        DMBelShop.CDS_Busca.Close;
        DMBelShop.SDS_Busca.CommandText:=MySql;
        DMBelShop.CDS_Busca.Open;
        s:=DMBelShop.CDS_Busca.FieldByName('num_planilha').AsString;
        DMBelShop.CDS_Busca.Close;

        If Trim(s)<>'' Then
        Begin
          sgMensagemERRO:=sgMensagemERRO+cr+'- Bel_'+sCodFilial+
                                            ' Não GERADA !! - Taxas do Sindicato da Competência de '+
                                            Cbx_INSS_PSMes.Text+'/'+EdtINSS_PSAno.Text+
                                            ' Já Cobrado na Planilha de Pagto Nº '+s;
          DMBelShop.CDS_EmpProcessa.Edit;
          DMBelShop.CDS_EmpProcessaPROC.AsString:='NAO';
          DMBelShop.CDS_EmpProcessa.Post;

          iNrConexoes:=iNrConexoes-1;
        End;
      End; // If sgINSS_PS='S' Then
    End; // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; //   While Not DMBelShop.CDS_EmpProcessa.Eof do

  If iNrConexoes=0 Then
  Begin
    sgMensagemERRO:='SEM Loja a GERAR !!'+cr+cr+sgMensagemERRO;
    MessageBox(Handle, pChar(sgMensagemERRO), 'ATENÇÃO !!', MB_ICONERROR);
    sgMensagemERRO:='';
    Exit;
  End;

  If msg('Deseja Realmente Efetuar o Calculo'+cr+cr+sMensagem,'C')=2 Then
   Exit;

  If sgINSS_PS='I' Then sgMensagem:='Contribuição de INSS';
  If sgINSS_PS='S' Then sgMensagem:='Taxas de Sindicato';

// OdirApagar - 01/10/2015 - Plano de Suade é Importado e Não Mais Gerado
//  If sgINSS_PS='P' Then sgMensagem:='Plano de Saúde';

  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    Screen.Cursor:=crAppStart;

    If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
    Begin
      sCodFilial:=DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString;

      OdirPanApres.Caption:='AGUARDE !! Efetuando Calculo de'+sgMensagem+' da Loja: Bel_'+sCodFilial;
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
      OdirPanApres.Visible:=True;
      Refresh;

      // Contribuição de INSS ======================================================
      If sgINSS_PS='I' Then
      Begin
        Dbg_ProfINSS.SetFocus;

        MySql:=' SELECT pf.cod_loja, pf.cod_profissional, pf.des_profissional,'+
               ' pf.num_inss, pf.per_inss, pf.ind_cobra_inss,'+
               ' CAST(LPAD(EXTRACT(MONTH FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text)))+' AS DATE)),2,''0'') AS VARCHAR(2)) Mes,'+
               ' CAST(LPAD(EXTRACT(year FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text)))+' AS DATE)),4,''0'') AS VARCHAR(4)) ANO,'+
               ' sm.Sal_Minimo, CAST((ROUND(((pf.per_inss*sm.Sal_Minimo)/100),2)) AS NUMERIC(12,2)) Vlr_Contrib'+

               ' FROM SAL_PROFISSIONAIS pf,'+
               '     (SELECT ct.vlr_inicial Sal_Minimo'+
               '      FROM fin_contribuicoes ct'+
               '      WHERE ct.tp_registro=1'+
               '      AND '+QuotedStr('15.'+sgMesCompetencia+'.'+sgAnoCompetencia)+' BETWEEN ct.dta_vigencia_inicio AND ct.dta_vigencia_final) SM'+

               ' WHERE COALESCE(pf.num_inss,'''')<>'''''+
               ' AND   pf.per_inss<>0'+
               ' AND   pf.cod_loja='+QuotedStr(sCodFilial)+
               ' AND   pf.tip_pessoa='+QuotedStr('P')+
               ' AND   pf.ind_Ativo='+QuotedStr('SIM');

               If Not bgDtaInicioContrato Then
                 MySql:=MySql+' AND   pf.dta_ini_contrato<'+QuotedStr('01.'+sgMesVenc+'.'+sgAnoVenc)
               Else
                 MySql:=MySql+' AND   (pf.dta_ini_contrato<'+QuotedStr('01.'+sgMesVenc+'.'+sgAnoVenc)+
                              '        Or pf.dta_ini_contrato is Null)';

       MySql:=
         MySql+' AND   (NOT EXISTS (SELECT 1'+
               '                    FROM ps_vales_pessoas i'+
               '                    WHERE i.cod_pessoa=pf.cod_profissional'+
               '                    AND   i.cod_loja=pf.cod_loja'+
               '                    AND   i.tp_pessoa=1'+
               '                    AND   i.vlr_pago<>0'+
               '                    AND   i.ind_debcred='+QuotedStr('I')+
               '                    AND   i.num_docto='+sgMesVenc+sgAnoVenc+')'+
               '        OR ((pf.ind_cobra_inss='+QuotedStr('SIM')+') or (pf.ind_cobra_inss='+QuotedStr('NAO')+'))'+
               '     )'+
               ' ORDER BY 3';
      End; // If sgINSS_PS='I' Then

// OdirApagar - 01/10/2015 - Plano de Suade é Importado e Não Mais Gerado
//      // Plano de Saude ============================================================
//      If sgINSS_PS='P' Then
//      Begin
//        Dbg_ProfPlanoSaude.SetFocus;
//
//        MySql:=' SELECT pf.cod_loja, pf.cod_profissional, pf.des_profissional, ps.des_aux DES_DOCTO,'+
//               ' (CAST(LPAD(EXTRACT(MONTH FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text)))+' AS DATE)),2,''0'') AS VARCHAR(2))) Mes,'+
//               ' (CAST(LPAD(EXTRACT(YEAR FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text)))+' AS DATE)),4,''0'') AS VARCHAR(4))) ANO,'+
//               ' (COALESCE(pf.vlr_plano_saude,0)+SUM(COALESCE(de.vlr_plano_saude,0))) vlr_plano_saude,'+
//               ' (CAST(COALESCE(dp.vlr_aux,0) AS INTEGER)) Num_Dep,'+
//               ' (COALESCE(pf.vlr_plano_saude,0)+SUM(COALESCE(de.vlr_plano_saude,0))) Vlr_Apagar'+
//
//               '  FROM SAL_PROFISSIONAIS pf'+
//               '     INNER JOIN tab_auxiliar ps       ON ps.cod_aux=pf.cod_plano_saude'+  // Plano de Saude
//               '                                     AND ps.tip_aux=4'+
//               '     LEFT  JOIN tab_auxiliar dp       ON dp.cod_aux=pf.cod_profissional'+ // Numero de Dependentes
//               '                                     AND dp.tip_aux=6'+
//               '                                     AND dp.des_aux=pf.cod_loja'+
//               '     LEFT  JOIN ps_dependentes_ps de  ON de.cod_loja=pf.cod_loja'+   // Valor por Dependente
//               '                                     AND de.cod_pessoa=pf.cod_profissional'+
//               '                                     AND de.tp_pessoa=1'+
//
//               ' WHERE pf.cod_plano_saude<>0'+
//               ' AND   pf.cod_loja='+QuotedStr(sCodFilial)+
//               ' AND   pf.tip_pessoa='+QuotedStr('P')+
//               ' AND   pf.ind_Ativo='+QuotedStr('SIM')+
//               ' AND   NOT EXISTS (SELECT 1'+
//               '                   FROM ps_vales_pessoas pl'+
//               '                   WHERE pl.cod_pessoa=pf.cod_profissional'+
//               '                   AND   pl.cod_loja=pf.cod_loja'+
//               '                   AND   pl.tp_pessoa=1'+
//               '                   AND   pl.vlr_pago<>0'+
//               '                   AND   pl.ind_debcred='+QuotedStr('P')+
//               '                   AND  pl.dta_vencimento='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text)))+')'+
//
//               ' GROUP BY pf.cod_loja, pf.cod_profissional, pf.des_profissional, des_docto,'+
//               ' pf.vlr_plano_saude, Num_Dep'+
//
//               ' ORDER BY 3';
//      End; // If sgINSS_PS='P' Then

      // Taxas de Sindicato ========================================================
      If sgINSS_PS='S' Then
      Begin
        Dbg_ProfTaxaSindicato.SetFocus;

        MySql:=' SELECT pf.cod_loja, pf.cod_profissional, pf.des_profissional,'+
               ' pf.num_sindicato Insc_SINDICATO, ''TAXA SINDICATO'' Des_docto,'+
               ' (CAST(LPAD(EXTRACT(MONTH FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text)))+' AS DATE)),2,''0'') AS VARCHAR(2))) Mes,'+
               ' (CAST(LPAD(EXTRACT(YEAR FROM CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text)))+' AS DATE)),4,''0'') AS VARCHAR(4))) ANO,'+
               ' pf.vlr_taxa_sindicato, pf.vlr_taxa_sindicato Vlr_Apagar'+

               ' FROM SAL_PROFISSIONAIS pf'+

               ' WHERE TRIM(COALESCE(pf.num_sindicato,''''))<>'''''+
               ' AND   pf.ind_taxa_sindicato='+QuotedStr('SIM')+
               ' AND   COALESCE(pf.vlr_taxa_sindicato,0)>0'+
               ' AND   pf.cod_loja='+QuotedStr(sCodFilial)+
               ' AND   pf.tip_pessoa='+QuotedStr('P')+
               ' AND   pf.ind_Ativo='+QuotedStr('SIM')+
               ' AND NOT EXISTS (SELECT 1'+
               '                 FROM ps_vales_pessoas pl'+
               '                 WHERE pl.cod_pessoa=pf.cod_profissional'+
               '                 AND   pl.cod_loja=pf.cod_loja'+
               '                 AND   pl.tp_pessoa=1'+
               '                 AND   pl.vlr_pago<>0'+
               '                 AND   pl.ind_debcred='+QuotedStr('S')+
               '                 AND  pl.dta_vencimento='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text)))+')'+

               ' ORDER BY 3';
      End; // If sgINSS_PS='S' Then

      DMBelShop.CDS_Busca.Close;
      DMBelShop.SDS_Busca.CommandText:=MySql;
      DMBelShop.CDS_Busca.Open;

      bgSiga:=True;
      If DMBelShop.CDS_Busca.IsEmpty Then
      Begin
        DMBelShop.CDS_Busca.Close;

        sgMensagemERRO:=sgMensagemERRO+cr+'- Bel_'+sCodFilial+' Não GERADA !! - Sem Profissional a Calcular !!';
        bgSiga:=False;
      End;

      // Calcula Contribuição de INSS ==============================================
      If (bgSiga) and (sgINSS_PS='I') Then
      Begin
        If Not ProfCalculaINSS(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text))) Then
        Begin
          DMBelShop.CDS_Busca.Close;
          sgMensagemERRO:=sgMensagemERRO+cr+'- Bel_'+sCodFilial+' Não GERADA !! - Erro no Caluclo de Contribuição de INSS !!';
        End;
      End; // If (bgSiga) and (sgINSS_PS='I') Then

// OdirApagar - 01/10/2015 - Plano de Suade é Importado e Não Mais Gerado
//      // Calcula Plano de Saude ====================================================
//      If (bgSiga) and (sgINSS_PS='P') Then
//      Begin
//        If Not ProfCalculaPlanoSaude(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text))) Then
//        Begin
//          DMBelShop.CDS_Busca.Close;
//          sgMensagemERRO:=sgMensagemERRO+cr+'- Bel_'+sCodFilial+' Não GERADA !! - Erro no Caluclo de Plano de Saúde !!';
//        End;
//      End; // If (bgSiga) and (sgINSS_PS='P') Then

      // Calcula Taxa Sindicato ====================================================
      If (bgSiga) and (sgINSS_PS='S') Then
      Begin
        If Not ProfCalculaTaxaSindicato(f_Troca('/','.',f_Troca('-','.',DtaEdt_INSS_PSVenc.Text))) Then
        Begin
          DMBelShop.CDS_Busca.Close;
          sgMensagemERRO:=sgMensagemERRO+cr+'- Bel_'+sCodFilial+' Não GERADA !! - Erro no Caluclo de Taxa de Sindicato !!';
        End;
      End; // If (bgSiga) and (sgINSS_PS='S') Then
    End; // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; //   While Not DMBelShop.CDS_EmpProcessa.Eof do

  DMBelShop.CDS_Busca.Close;
  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  If Trim(sgMensagemERRO)<>'' Then
  Begin
    MessageBox(Handle, pChar(sgMensagemERRO), 'ATENÇÃO !!', MB_ICONERROR);
    sgMensagemERRO:='LEIA COM ATENÇÃO !!!'+cr+sgMensagemERRO;
  End;

  If ProfBuscaDebitos(sgINSS_PS) Then
   msg('Calculo Efetuado com SUCESSO !!', 'A');

end;

procedure TFrmSalao.Dbg_ProfissionaisDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  If (bgDrawColumnCell) and (Not DMSalao.CDS_Profissionais.IsEmpty) Then
  Begin
    if not (gdSelected in State) Then
    Begin
      // Validade FIM de Contrato ==============================================
      If (Column.FieldName='DTA_FIM_RENOVACAO') Then // Este comando altera cor da Celula
      Begin
        If Trim(DMSalao.CDS_ProfissionaisDTA_FIM_RENOVACAO.AsString)<>'' Then
        Begin
          If (DMSalao.CDS_ProfissionaisDTA_FIM_RENOVACAO.AsDateTime-(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)-30))<31 Then
          Begin
            Dbg_Profissionais.Canvas.Brush.Color:=clRed;
            Dbg_Profissionais.Canvas.Font.Color:=clWhite;// Cor da Fonte
          End;
        End;
      End; // If (Column.FieldName='DTA_FIM_RENOVACAO') Then

      If (Column.FieldName='DTA_FIM_CONTRATO') Then // Este comando altera cor da Celula
      Begin
        If (Trim(DMSalao.CDS_ProfissionaisDTA_FIM_RENOVACAO.AsString)='') And
           (Trim(DMSalao.CDS_ProfissionaisDTA_FIM_CONTRATO.AsString)='') Then
         Begin
           Dbg_Profissionais.Canvas.Brush.Color:=clRed;
           Dbg_Profissionais.Canvas.Font.Color:=clWhite; // Cor da Fonte
         End
        Else If (Trim(DMSalao.CDS_ProfissionaisDTA_FIM_RENOVACAO.AsString)='') And
                (Trim(DMSalao.CDS_ProfissionaisDTA_FIM_CONTRATO.AsString)<>'') Then
         Begin
           If (DMSalao.CDS_ProfissionaisDTA_FIM_CONTRATO.AsDateTime-(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)-30))<31 Then
           Begin
             Dbg_Profissionais.Canvas.Brush.Color:=clRed;
             Dbg_Profissionais.Canvas.Font.Color:=clWhite; // Cor da Fonte
           End;
         End;
      End; // (Column.FieldName='DTA_FIM_CONTRATO') Then

      // Valida INSS =============================================================
      If (Column.FieldName='NUM_INSS') Then // Este comando altera cor da Celula
      Begin
        If Trim(DMSalao.CDS_ProfissionaisNUM_INSS.AsString)='' Then
        Begin
          Dbg_Profissionais.Canvas.Brush.Color:=clRed;
          Dbg_Profissionais.Canvas.Font.Color:=clWhite; // Cor da Fonte
        End;
      End; // If (Column.FieldName='NUM_INSS') Then

      If (Column.FieldName='PER_INSS') Then // Este comando altera cor da Celula
      Begin
        If (Trim(DMSalao.CDS_ProfissionaisNUM_INSS.AsString)<>'') and
           (DMSalao.CDS_ProfissionaisPER_INSS.AsCurrency=0) Then
        Begin
          Dbg_Profissionais.Canvas.Brush.Color:=clRed;
          Dbg_Profissionais.Canvas.Font.Color:=clWhite;// Cor da Fonte
        End;
      End; // If (Column.FieldName='PER_INSS') Then

      // Valida Numero do Cartão TECBIZ ==========================================
      If (Column.FieldName='NUM_TECBIZ') Then // Este comando altera cor da Celula
      Begin
        If Trim(DMSalao.CDS_ProfissionaisNUM_TECBIZ.AsString)='' Then
        Begin
          Dbg_Profissionais.Canvas.Brush.Color:=clRed;
          Dbg_Profissionais.Canvas.Font.Color:=clWhite; // Cor da Fonte
        End;
      End; // If (Column.FieldName='NUM_INSS') Then

      Dbg_Profissionais.Canvas.FillRect(Rect);
      Dbg_Profissionais.DefaultDrawDataCell(Rect,Column.Field,state);

      DMSalao.CDS_ProfissionaisDTA_FIM_CONTRATO.Alignment:=taCenter;
      DMSalao.CDS_ProfissionaisDTA_FIM_RENOVACAO.Alignment:=taCenter;
      DMSalao.CDS_ProfissionaisNUM_INSS.Alignment:=taCenter;
      DMSalao.CDS_ProfissionaisNUM_TECBIZ.Alignment:=taCenter;
      DMSalao.CDS_ProfissionaisIND_LIBERADO.Alignment:=taCenter;
      DMSalao.CDS_ProfissionaisIND_ATIVO.Alignment:=taCenter;
      DMSalao.CDS_ProfissionaisTIP_PESSOA.Alignment:=taCenter;
    End;
  End; // If bgDrawColumnCell Then
end;

procedure TFrmSalao.Ts_PagtoVendasShow(Sender: TObject);
begin
  Bt_PagtoGeraPlanilha.Visible:=False;
  If Not Ts_PagtoPlanilha.TabVisible Then
  Begin
    Pan_ProfBranco.Parent:=Pan_ComissaoBottom;
    Bt_PagtoGeraPlanilha.Visible:=True;
    Bt_PagtoGeraPlanilha.Parent:=Pan_ComissaoBottom;
    Bt_PagtoDebCredImprime.Caption:='Planilha Conferência';
    Bt_PagtoDebCredImprime.Parent:=Pan_ComissaoBottom;
  End; // If Not Ts_PagtoPlanilha.TabVisible Then
end;

procedure TFrmSalao.Ts_PagtoDebCredShow(Sender: TObject);
begin
  Bt_PagtoGeraPlanilha.Visible:=False;
  If Not Ts_PagtoPlanilha.TabVisible Then
  Begin
    Pan_ProfBranco.Parent:=Pan_DebCredBottom;
    Bt_PagtoGeraPlanilha.Visible:=True;
    Bt_PagtoGeraPlanilha.Parent:=Pan_DebCredBottom;
    Bt_PagtoDebCredImprime.Caption:='Planilha Conferência';
    Bt_PagtoDebCredImprime.Parent:=Pan_DebCredBottom;
  End; // If Not Ts_PagtoPlanilha.TabVisible Then

end;

procedure TFrmSalao.Bt_PagtoGeraPlanilhaClick(Sender: TObject);
Var
  MySql,
  sCodProf, sNumPlan, sDtaFimBeneficio: String;
  i: Integer;
begin

  If Ts_PagtoPlanilha.TabVisible Then
  Begin
    msg('Planilha de Pagto Já Calculada !!','A');
    Exit;
  End;

  If DMSalao.CDS_V_PagtosDebCred.IsEmpty Then
   Exit;

  if Application.MessageBox('Após a Geração da Planilha de Pagamentos'+cr+
                            'Não Heverá, mais, Possibilidades de Alterações'+cr+
                            'nos Débitos e Créditos Constantes na Mesma !!'+cr+cr+
                            'Deseja Realmente EFETUAR A GERAÇÃO ??', 'ATENÇÃO !!', 292)=IdNo Then
   Exit;

  // Apresentacao ==============================================================
  OdirPanApres.Caption:='AGUARDE !! Gerando Planilha de Pagamento dos Profissionais na Loja: Bel_'+FormatFloat('00',EdtPagtoCodLoja.AsInteger);
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
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

    // Busca Numero da Planilha -------------------------------------
    MySql:=' SELECT GEN_ID(GEN_SAL_PLAN_PAGTO_ID,1) Codigo'+
           ' FROM RDB$DATABASE';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sNumPlan:=DMBelShop.CDS_BuscaRapida.FieldByName('Codigo').AsString;
    DMBelShop.SDS_BuscaRapida.Close;

    // Torna Analitico ----------------------------------------------
    Rb_PagtoDebCredAnalitico.Checked:=True;
    Rb_PagtoDebCredSinteticoClick(Self);

    DMSalao.CDS_V_PagtosDebCred.First;
    FrmBelShop.MontaProgressBar(True, FrmSalao);
    pgProgBar.Properties.Max:=DMSalao.CDS_V_PagtosDebCred.RecordCount;
    pgProgBar.Position:=0;

    // Tipos de Documento
    //  1 -VALES = 1
    //  2 - CONTRIBUIÇOES DE INSS = 2
    //  3 - PLANO DE SAUDE = 3
    //  4 - TAXA DO SINDICATO e TAXA NÃO SOCIO DO SINDICATO = 4
    //  5 - TECBIZ = 5
    //  6 - ARREDONDAMENTO PAGAMENTOS ANTERIORES = 6
    //  7 - INCORPORA COMISSÕES = 7
    //  8 - ARREDONDAMENTO ATUAL = 8
    // 10 - BENEFICIOS = 10

    // Abre Client para Receber Debiots e Creditos =============================
    DMSalao.CDS_PagtosDebCred.Close;
    DMSalao.SDS_PagtosDebCred.CommandText:=' SELECT * FROM SAL_PLAN_DEBCRED WHERE NUM_PLANILHA<1';
    DMSalao.CDS_PagtosDebCred.Open;

    // Processa ================================================================
    While Not DMSalao.CDS_V_PagtosDebCred.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMSalao.CDS_V_PagtosDebCred.RecNo;

      If Trim(DMSalao.CDS_V_PagtosDebCredCOD_PROF.AsString)<>'' Then
       Begin
         sCodProf:=DMSalao.CDS_V_PagtosDebCredCOD_PROF.AsString;

         // Posiciona no Profissional -----------------------------
         // Atulaiza Periodo do Ultimo Calculo
         If DMSalao.CDS_V_PagtoProf.Locate('CODIGO',sCodProf,[]) Then
         Begin
           MySql:=' UPDATE sal_profissionais p'+
                  ' SET p.dta_periodo_ini_cal='+
                  QuotedStr(f_Troca('/','.',f_Troca('-','.',DMSalao.CDS_V_PagtoProfDTA_INI_CALCULO.AsString)))+
                  ', p.dta_periodo_fim_cal='+
                  QuotedStr(f_Troca('/','.',f_Troca('-','.',DMSalao.CDS_V_PagtoProfDTA_FIM_CALCULO.AsString)))+
                  ' WHERE p.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
                  ' AND p.cod_profissional='+QuotedStr(sCodProf);
           DMBelShop.SQLC.Execute(MySql,nil,nil);
         End;

         // INSERE PLANILHA DE PAGAMENTOS ======================================
         MySql:=' INSERT INTO SAL_PLAN_PAGTO ('+
                ' NUM_PLANILHA, DTA_PERIODO_INI, DTA_PERIODO_FIM, COD_LOJA,'+
                ' COD_PROFISSIONAL, DES_PROFISSIONAL,'+
                ' VLR_COMISSAO, VLR_BENEFICIOS, VLR_PLANO_SAUDE,'+
                ' NUM_TECBIZ, VLR_TECBIZ,'+
                ' VLR_TAXAS, VLR_VALES, VLR_SALMINIMO,'+
                ' NUM_INSS, PER_INSS, VLR_INSS,'+
                ' VLR_ARREDONDA, IND_ARRENDONDA, NUM_PLAN_PAGTO, VLR_SALDO,'+
                ' NUM_BANCO, DES_BANCO, NUM_AGENCIA, DES_AGENCIA, NUM_CONTA,'+
                ' DTA_FIM_CONTRATO, USU_INCLUI)'+

                ' VALUES ('+
                QuotedStr(sNumPlan)+', '+ // NUM_PLANILHA
                QuotedStr(f_Troca('/','.',f_Troca('-','.',sgPeriodoIni)))+', '+ // DTA_PERIODO_INI
                QuotedStr(f_Troca('/','.',f_Troca('-','.',sgPeriodoFim)))+', '+ // DTA_PERIODO_FIM
                QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+', '+ // COD_LOJA
                QuotedStr(sCodProf)+', '+ // COD_PROFISSIONAL
                QuotedStr(DMSalao.CDS_V_PagtoProfNOME.AsString)+', '+ // DES_PROFISSIONAL
                '0, '+ // COMISSÕES = 7
                '0, '+ // BENEFICIOS = 10
                '0, '+ // PLANO DE SAUDE = 3
                QuotedStr(DMSalao.CDS_V_PagtoProfNUM_TECBIZ.AsString)+', '+ // NUM_TECBIZ
                '0, '+ // TECBIZ = 5
                '0, '+ // TAXAS: TAXA DO SINDICATO e TAXA NÃO SOCIO DO SINDICATO = 4
                '0, '+ // VALES: VALES = 1 e ARREDONDAMENTO PAGAMENTOS ANTERIORES = 6
                QuotedStr(DMSalao.CDS_V_PagtoProfVLR_SAL_MINIMO.AsString)+', '+ // VLR_SALMINIMO
                QuotedStr(DMSalao.CDS_V_PagtoProfNUM_INSS.AsString)+', '+ // NUM_INSS
                '0, '+ // PERCENTUAL INSS
                '0, '+ // VALOR DE CONTRIBUIÇOES DE INSS = 2
                '0, '+ // ARREDONDAMENTO ATUAL = 8
                QuotedStr('NAO')+', '+ // IND_ARRENDONDA
                '0, '+ // NUMERO DA PLANILHA QUE EFETUOU O PAGAMENTO
                QuotedStr(DMSalao.CDS_V_PagtosDebCredVLR_SALDO.AsString)+', '+ // VLR_SALDO
                QuotedStr(DMSalao.CDS_V_PagtoProfNUM_BANCO.AsString)+', '+ // NUM_BANCO
                QuotedStr(DMSalao.CDS_V_PagtoProfDES_BANCO.AsString)+', '+ // DES_BANCO
                QuotedStr(DMSalao.CDS_V_PagtoProfNUM_AGENCIA.AsString)+', '+ // NUM_AGENCIA
                QuotedStr(DMSalao.CDS_V_PagtoProfDES_AGENCIA.AsString)+', '+ // DES_AGENCIA
                QuotedStr(DMSalao.CDS_V_PagtoProfNUM_CONTA.AsString)+', '; // NUM_CONTA

                If Trim(DMSalao.CDS_V_PagtoProfFIM_CONTRATO.AsString)='' Then
                 MySql:=MySql+' null,'
                Else
                 MySql:=MySql+QuotedStr(DMSalao.CDS_V_PagtoProfFIM_CONTRATO.AsString)+', '; // FIM_CONTRATO

                MySql:=MySql+QuotedStr(Cod_Usuario)+')'; // USU_INCLUI
         DMBelShop.SQLC.Execute(MySql,nil,nil);
       End
      Else If Trim(DMSalao.CDS_V_PagtosDebCredTP_DOC.AsString)<>'' Then
       Begin
         // ALTERA PLANILHA ==================================================

         sgTipoDML:=' SET ';
         MySql:=' UPDATE SAL_PLAN_PAGTO pp';
                //==============================================================
                // Tp_Doc = 1 - VALES
                // Tp_Doc = 3 - PLANO DE SAUDE
                // Tp_Doc = 6 - ARREDONDAMENTO PAGAMENTOS ANTERIORES
                //==============================================================
                If (DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=1) Or   // VALES
                   (DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=3) Or   // PLANO DE SAUDE
                   (DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=6) Then // ARREDONDAMENTO PAGAMENTOS ANTERIORES
                Begin
                  If (DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=1) Or (DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=6) Then
                  Begin
                    MySql:=MySql+sgTipoDML+' pp.VLR_VALES=pp.VLR_VALES+'+f_Troca(',','.',DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsString);
                    sgTipoDML:=', ';
                  End;

                  // Atualiza Pagamento do Vale ---------------------
                  If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=1 Then
                  Begin
                    MySqlDML:=' UPDATE PS_VALES_PESSOAS vp'+
                              ' SET vp.vlr_pago=vp.vlr_apagar'+
                              ', vp.num_docto_pagto='+QuotedStr(sNumPlan)+ // NUM_PLANILHA
                              ', vp.dta_pagamento='+QuotedStr(sgDtaF)+ // DTA_PERIODO_FIM
                              ' WHERE vp.IND_DEBCRED=''D'''+
                              ' AND   vp.vlr_pago=0'+
                              ' AND   vp.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
                              ' AND   vp.num_seq='+DMSalao.CDS_V_PagtosDebCredNUM_SEQ.AsString;
                    DMBelShop.SQLC.Execute(MySqlDML,nil,nil);
                  End; // If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=1 Then

                  // Atualiza Pagamento de Plano de Saude ----------------------
                  If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=3 Then
                  Begin
                    MySql:=MySql+sgTipoDML+' pp.VLR_PLANO_SAUDE=pp.VLR_PLANO_SAUDE+'+f_Troca(',','.',DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsString);
                    sgTipoDML:=', ';

                    MySqlDML:=' UPDATE PS_VALES_PESSOAS vp'+
                              ' SET vp.vlr_pago=vp.vlr_apagar'+
                              ', vp.num_docto_pagto='+QuotedStr(sNumPlan)+ // NUM_PLANILHA
                              ', vp.dta_pagamento='+QuotedStr(sgDtaF)+ // DTA_PERIODO_FIM
                              ' WHERE vp.IND_DEBCRED=''P'''+
                              ' AND   vp.vlr_pago=0'+
                              ' AND   vp.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
                              ' AND   vp.num_seq='+DMSalao.CDS_V_PagtosDebCredNUM_SEQ.AsString;
                    DMBelShop.SQLC.Execute(MySqlDML,nil,nil);
                  End; // If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=3 Then

                  // Atualiza Arredondamento Anterior ---------------
                  If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=6 Then
                  Begin
                    MySqlDML:=' UPDATE SAL_PLAN_PAGTO ar'+
                              ' SET ar.ind_arrendonda='+QuotedStr('SIM')+
                              ', ar.num_plan_pagto='+QuotedStr(sNumPlan)+
                              ' WHERE ar.vlr_arredonda<>0'+
                              ' AND   ar.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
                              ' AND   ar.ind_arrendonda='+QuotedStr('NAO')+
                              ' AND   ar.num_planilha='+DMSalao.CDS_V_PagtosDebCredNUM_SEQ.AsString;
                    DMBelShop.SQLC.Execute(MySqlDML,nil,nil);
                  End; // If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=6 Then
                End; //  If (DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=1) Or ...
                //==============================================================

                //==============================================================
                // Tp_Doc = 2 - CONTRIBUIÇOES DE INSS ==========================
                //==============================================================
                If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=2 Then
                Begin
                  MySql:=MySql+sgTipoDML+' pp.PER_INSS='+f_Troca(',','.',DMSalao.CDS_V_PagtoProfPER_INSS.AsString);
                  sgTipoDML:=', ';
                  MySql:=MySql+sgTipoDML+' pp.VLR_INSS='+f_Troca(',','.',DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsString);
                  sgTipoDML:=', ';

                  // Atualiza Pagamento INSS ------------------------
                  MySqlDML:=' UPDATE ps_vales_pessoas vp'+
                            ' SET vp.vlr_pago=vp.vlr_apagar'+
                            ', vp.num_docto_pagto='+QuotedStr(sNumPlan)+ // NUM_PLANILHA
                            ', vp.dta_pagamento='+QuotedStr(sgDtaF)+ // DTA_PERIODO_FIM
                            ' WHERE vp.IND_DEBCRED=''I'''+
                            ' AND   vp.vlr_pago=0'+
                            ' AND   vp.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
                            ' AND   vp.num_seq='+DMSalao.CDS_V_PagtosDebCredNUM_SEQ.AsString;
                  DMBelShop.SQLC.Execute(MySqlDML,nil,nil);
                End; // If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=2 Then
                //==============================================================

                //==============================================================
                // Tp_Doc = 4 - TAXA SINDICATO =================================
                //            - TAXA NÃO SOCIO DO SINDICATO ====================
                //==============================================================
                If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=4 Then
                Begin
                  MySql:=MySql+sgTipoDML+' pp.VLR_TAXAS=pp.VLR_TAXAS+'+f_Troca(',','.',DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsString);
                  sgTipoDML:=', ';

                  // Atualiza Pagamento Taxa Sindicato --------------
                  If DMSalao.CDS_V_PagtosDebCredNUM_SEQ.AsString<>'0' Then // TAXA NÃO SOCIO DO SINDICATO (Num_Seq=0)
                  Begin
                    MySqlDML:=' UPDATE ps_vales_pessoas vp'+
                              ' SET vp.vlr_pago=vp.vlr_apagar'+
                              ', vp.num_docto_pagto='+QuotedStr(sNumPlan)+ // NUM_PLANILHA
                              ', vp.dta_pagamento='+QuotedStr(sgDtaF)+ // DTA_PERIODO_FIM
                              ' WHERE vp.IND_DEBCRED=''S'''+
                              ' AND   vp.vlr_pago=0'+
                              ' AND   vp.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
                              ' AND   vp.num_seq='+DMSalao.CDS_V_PagtosDebCredNUM_SEQ.AsString;
                    DMBelShop.SQLC.Execute(MySqlDML,nil,nil);
                  End; // If DMSalao.CDS_V_PagtosDebCredNUM_SEQ.AsString<>'0' Then // TAXA NÃO SOCIO DO SINDICATO (Num_Seq=0)
                End; // If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=4 Then
                //==============================================================

                //==============================================================
                // Tp_Doc = 5 - TECBIZ =========================================
                //==============================================================
                If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=5 Then
                Begin
                  MySql:=MySql+sgTipoDML+' pp.VLR_TECBIZ=pp.VLR_TECBIZ+'+f_Troca(',','.',DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsString);
                  sgTipoDML:=', ';

                  // Atualiza Pagamento TecBiz ----------------------
                  MySqlDML:=' UPDATE PS_TECBIZ tb'+
                            ' SET tb.ind_pago='+QuotedStr('SIM')+
                            ' WHERE tb.num_seq='+DMSalao.CDS_V_PagtosDebCredNUM_SEQ.AsString;
                  DMBelShop.SQLC.Execute(MySqlDML,nil,nil);
                End; // If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=5 Then
                //==============================================================

                //==============================================================
                // Tp_Doc = 7 - COMISSÕES ======================================
                //==============================================================
                If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=7 Then
                Begin
                  MySql:=MySql+sgTipoDML+' pp.VLR_COMISSAO=pp.VLR_COMISSAO+'+f_Troca(',','.',DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsString);
                  sgTipoDML:=', ';
                End; // If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=7 Then
                //==============================================================

                //==============================================================
                // Tp_Doc = 8 - ARREDONDAMENTO ATUAL ===========================
                //==============================================================
                If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=8 Then
                Begin
                 MySql:=MySql+sgTipoDML+' pp.VLR_ARREDONDA=pp.VLR_ARREDONDA+'+f_Troca(',','.',DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsString);
                 sgTipoDML:=', ';
                End; // If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=8 Then
                //==============================================================

                //==============================================================
                // Tp_Doc = 10 - BENEFICIOS ====================================
                //==============================================================
                If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=10 Then
                Begin
                  MySql:=MySql+sgTipoDML+' pp.VLR_BENEFICIOS=pp.VLR_BENEFICIOS+'+f_Troca(',','.',DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsString);
                  sgTipoDML:=', ';

                  // Atualiza Pagamento de Benefícios --------------
                  MySqlDML:=' UPDATE PS_VALES_PESSOAS vp'+
                            ' SET vp.vlr_pago=vp.vlr_apagar'+
                            ', vp.num_docto_pagto='+QuotedStr(sNumPlan)+ // NUM_PLANILHA
                            ', vp.dta_pagamento='+QuotedStr(sgDtaF)+ // DTA_PERIODO_FIM
                            ' WHERE vp.IND_DEBCRED=''B'''+
                            ' AND   vp.vlr_pago=0'+
                            ' AND   vp.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
                            ' AND   vp.num_seq='+DMSalao.CDS_V_PagtosDebCredNUM_SEQ.AsString;
                  DMBelShop.SQLC.Execute(MySqlDML,nil,nil);

                  // Atualiza Data do Ultimo Pagamento de Benefícios -
                  MySqlSelect:=' SELECT be.dta_fim_beneficio'+
                               ' FROM PS_BENEFICIOS_PESSOAS be'+
                               ' WHERE be.dta_fim_beneficio IS NOT NULL'+
                               ' AND   be.dta_fim_beneficio<='+QuotedStr(sgDtaF)+ // DTA_PERIODO_FIM
                               ' AND   be.num_docto='+DMSalao.CDS_V_PagtosDebCredNUM_DOCTO.AsString+
                               ' AND   be.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
                               ' AND   be.cod_pessoa='+DMSalao.CDS_V_PagtosDebCredCODPROF.AsString;
                  DMBelShop.CDS_BuscaRapida.Close;
                  DMBelShop.SDS_BuscaRapida.CommandText:=MySqlSelect;
                  DMBelShop.CDS_BuscaRapida.Open;
                  sDtaFimBeneficio:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Fim_Beneficio').AsString);
                  DMBelShop.CDS_BuscaRapida.Close;

                  MySqlDML:=' UPDATE PS_BENEFICIOS_PESSOAS be'+
                            ' SET be.dta_ult_pagto='+QuotedStr(DMSalao.CDS_V_PagtosDebCredDTA_VENCIMENTO.AsString);

                            If Trim(sDtaFimBeneficio)<>'' Then
                             MySqlDML:=
                              MySqlDML+', be.ind_ativo='+QuotedStr('N');

                  MySqlDML:=
                   MySqlDML+' WHERE be.num_docto='+DMSalao.CDS_V_PagtosDebCredNUM_DOCTO.AsString+
                            ' AND be.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
                            ' AND be.cod_pessoa='+DMSalao.CDS_V_PagtosDebCredCODPROF.AsString;
                  DMBelShop.SQLC.Execute(MySqlDML,nil,nil);
                End; // If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=10 Then
                //==============================================================

                MySql:=MySql+' WHERE pp.num_planilha='+sNumPlan+
                             ' AND pp.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
                             ' AND pp.cod_profissional='+QuotedStr(sCodProf);
         DMBelShop.SQLC.Execute(MySql,nil,nil);

       End; // If Trim(DMSalao.CDS_V_PagtosDebCredTP_DOC.AsString)<>'' Then

      // Atualiza Tabela SAL_PLAN_DEBCRED ======================================
      DMSalao.CDS_PagtosDebCred.Insert;
      For i:=0 to DMSalao.CDS_V_PagtosDebCred.FieldCount-1 do
      Begin
        If i=0 Then
        Begin
          DMSalao.CDS_PagtosDebCred.Fields[0].AsString:=sNumPlan;
          DMSalao.CDS_PagtosDebCred.Fields[1].AsString:=FormatFloat('00',EdtPagtoCodLoja.AsInteger);
        End;

        If i<>DMSalao.CDS_V_PagtosDebCred.FieldCount-1 Then
         Begin
           DMSalao.CDS_PagtosDebCred.Fields[i+2].Assign(DMSalao.CDS_V_PagtosDebCred.Fields[i]);
         End
        Else
         Begin
          If Trim(DMSalao.CDS_V_PagtosDebCredTP_DOC.AsString)<>'' Then
           DMSalao.CDS_PagtosDebCred.Fields[i+2].AsString:=sCodProf
          Else
           DMSalao.CDS_PagtosDebCred.Fields[i+2].AsString:='0';
         End; // If i<>DMSalao.CDS_V_PagtosDebCred.FieldCount-1 Yhen
      End;

      DMSalao.CDS_PagtosDebCred.Post;
      DMSalao.CDS_PagtosDebCred.ApplyUpdates(0);

      DMSalao.CDS_V_PagtosDebCred.Next;
    End; // While Not DMSalao.CDS_V_PagtosDebCred.Eof do

    // Atualiza Tabela SAL_PLAN_VENDAS =========================================
    DMSalao.CDS_PagtosVendas.Close;
    DMSalao.SDS_PagtosVendas.CommandText:=' SELECT * FROM SAL_PLAN_VENDAS WHERE NUM_PLANILHA<1';
    DMSalao.CDS_PagtosVendas.Open;

    // Coloca Vendas para Analitico ---------------------------------
    Rb_PagtoVendasAnalitico.Checked:=True;
    Rb_PagtoVendasSinteticoClick(Self);

    OdirPanApres.Caption:='AGUARDE !! Atualizando Vendas dos Profissionais na Loja: Bel_'+FormatFloat('00',EdtPagtoCodLoja.AsInteger);
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Visible:=True;
    Refresh;

    // Atualiza SAL_PLAN_VENDAS -------------------------------------
    pgProgBar.Properties.Max:=DMSalao.CDS_V_PagtosVendas.RecordCount;
    pgProgBar.Position:=0;
    DMSalao.CDS_V_PagtosVendas.First;
    While Not DMSalao.CDS_V_PagtosVendas.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMSalao.CDS_V_PagtosVendas.RecNo;
      Refresh;

      DMSalao.CDS_PagtosVendas.Insert;
      For i:=0 to DMSalao.CDS_V_PagtosVendas.FieldCount-1 do
      Begin
        If i=0 Then
        Begin
          DMSalao.CDS_PagtosVendas.Fields[0].AsString:=sNumPlan;
          DMSalao.CDS_PagtosVendas.Fields[1].AsString:=FormatFloat('00',EdtPagtoCodLoja.AsInteger);
        End;

        DMSalao.CDS_PagtosVendas.Fields[i+2].Assign(DMSalao.CDS_V_PagtosVendas.Fields[i]);
      End;
      DMSalao.CDS_PagtosVendas.Post;
      DMSalao.CDS_PagtosVendas.ApplyUpdates(0);

      DMSalao.CDS_V_PagtosVendas.Next;
    End; // While Not DMSalao.CDS_V_PagtosVendas.Eof do

    // Retorna Vendas para Sintético --------------------------------
    Rb_PagtoVendasSintetico.Checked:=True;
    Rb_PagtoVendasSinteticoClick(Self);

    DMSalao.CDS_V_PagtosVendas.First;

    // Guarda Numero da Planilha ===============================================
    MySqlDML:=' INSERT INTO TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX)'+
              ' Values ('+
              QuotedStr('7')+','+
              QuotedStr(sNumPlan)+','+
              QuotedStr(f_Troca('.','/',sgPeriodoIni)+' a '+f_Troca('.','/',sgPeriodoFim)+' - '+
                        FormatFloat('00',EdtPagtoCodLoja.AsInteger))+')';
    DMBelShop.SQLC.Execute(MySqlDML,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    // Abre Client Que Recebeu Debitos/Creditos  e Vendas ======================
    DMSalao.CDS_PagtosDebCred.Close;
    DMSalao.CDS_PagtosVendas.Close;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
      FrmBelShop.MontaProgressBar(False, FrmSalao);
      OdirPanApres.Visible:=False;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try
  FrmBelShop.MontaProgressBar(False, FrmSalao);

  // Apresenta Profissionais ===================================================
  sgDtaIniSemana:='';
  ProfissionaisCalcular;

  Rb_PagtoDebCredSintetico.Checked:=True;
  Rb_PagtoDebCredSinteticoClick(Self);
  DMSalao.CDS_V_PagtosDebCred.First;

  // Apresenta Planilha de Pagamentos ==========================================
  sgDtaI:=sgPeriodoIni;
  sgDtaI:=F_Troca('/','.',sgDtaI);
  sgDtaI:=F_Troca('-','.',sgDtaI);

  sgDtaF:=sgPeriodoFim;
  sgDtaF:=F_Troca('/','.',sgDtaF);
  sgDtaF:=F_Troca('-','.',sgDtaF);

  If Not ProfPagtoPlanilha(sNumPlan, FormatFloat('00',EdtPagtoCodLoja.AsInteger)) Then
  Begin
    Screen.Cursor:=crDefault;
    OdirPanApres.Visible:=False;
    msg('Sem Planilha de Pagamentos a Apresentar !1','A');
    Exit;
  End;

  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;

  THackDBGridSalao(Dbg_PagtoPlanilha).FixedCols:=2;

//odirapagar - 29/01/2015
//  Bt_PagtoGeraPlanilha.Visible:=False;
  Ts_PagtoPlanilha.TabVisible:=True;
  PC_PagtoPlanilha.ActivePage:=Ts_PagtoPlanilha;
  PC_PagtoPlanilha.Refresh;

  Dbg_PagtoPlanilha.SetFocus;

end;

procedure TFrmSalao.Rb_PagtoPlanTodosClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_PagtoPlanTodos);
  AcertaRb_Style(Rb_PagtoPlanDeposito);

  DMSalao.CDS_PagtosPlan.Filtered:=False;
  DMSalao.CDS_PagtosPlan.Filter:='';

  If Rb_PagtoPlanDeposito.Checked Then
  Begin
    DMSalao.CDS_PagtosPlan.Filter:='COM_SALDO=''S''';
    DMSalao.CDS_PagtosPlan.Filtered:=True;
  End;

end;

procedure TFrmSalao.Rb_PagtoPlanTodosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_PagtoPlanTodosClick(Self);
end;

procedure TFrmSalao.Dbg_PagtoPlanilhaColEnter(Sender: TObject);
begin

  if (THackDBGridSalao(Dbg_PagtoPlanilha).SelectedIndex=0) Or
     (THackDBGrid(Dbg_PagtoPlanilha).SelectedIndex=1) Then
  begin
    THackDBGridSalao(Dbg_PagtoPlanilha).LeftCol:=2;
    THackDBGridSalao(Dbg_PagtoPlanilha).SelectedIndex:=1;
//    Dbg_PagtoPlanilha.Refresh;
End;

end;

procedure TFrmSalao.Dbg_PagtoPlanilhaColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
begin

  // Acerta Colunas Fixadas -----------------------------------------
  Dbg_PagtoPlanilhaColEnter(Self);

end;

procedure TFrmSalao.Dbg_PagtoPlanilhaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  // Acerta Colunas Fixadas -----------------------------------------
  Dbg_PagtoPlanilhaColEnter(Self);

  // Acerta Apresentacao --------------------------------------------
  if not (gdSelected in State) Then
  Begin
    If Copy(DMSalao.CDS_PagtosPlanDES_PROFISSIONAL.AsString,1,4)='BEL_' Then
     Begin
       Dbg_PagtoPlanilha.Canvas.Font.Style:=[fsBold];
       Dbg_PagtoPlanilha.Canvas.Brush.Color:=clBlue;
       Dbg_PagtoPlanilha.Canvas.Font.Color:=clWhite;// -->> Cor da Fonte
     End
    Else If (Copy(DMSalao.CDS_PagtosPlanDES_PROFISSIONAL.AsString,1,9)='DEPOSITOS') Or
            (Copy(DMSalao.CDS_PagtosPlanDES_PROFISSIONAL.AsString,1,1)='{')  Then
     Begin
       Dbg_PagtoPlanilha.Canvas.Font.Style:=[fsBold];
       Dbg_PagtoPlanilha.Canvas.Brush.Color:=clSkyBlue;
     End
    Else
     Begin
       Dbg_PagtoPlanilha.Canvas.Font.Color:=clBlack;// -->> Cor da Fonte
     End;

    Dbg_PagtoPlanilha.Canvas.FillRect(Rect);
    Dbg_PagtoPlanilha.DefaultDrawDataCell(Rect,Column.Field,state);
  End; // if not (gdSelected in State) Then
//  THackDBGridSalao(Dbg_PagtoPlanilha).FixedCols:=2;

end;

procedure TFrmSalao.Dbg_PagtoPlanilhaDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  // Acerta Colunas Fixadas -----------------------------------------
  Dbg_PagtoPlanilhaColEnter(Self);

end;

procedure TFrmSalao.Dbg_PagtoPlanilhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Acerta Posicição na Celula ================================================
  if (Key = VK_Left) and (THackDBGridSalao(Dbg_PagtoPlanilha).SelectedIndex=1) then
  Begin
    Key := VK_Clear;
    THackDBGridSalao(Dbg_PagtoPlanilha).FixedCols:=2;
    Dbg_PagtoPlanilha.Refresh;
  End;
end;

procedure TFrmSalao.EdtPagtoCodPlanExit(Sender: TObject);
Var
  MySql: String;
  i: Integer;
begin

  If EdtPagtoCodPlan.Value=0 Then
   Exit;

  If EdtPagtoCodLoja.Value=0 Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtPagtoCodPlan.Value:=0;
    EdtPagtoCodLoja.SetFocus;
    Exit;
  End;

  // Planilhas de Pagamento a Profissionais de Salão
  MySql:=' SELECT t.des_aux'+
         ' FROM  TAB_AUXILIAR t'+
         ' WHERE t.tip_aux=7'+
         ' AND   t.des_aux1 is null'+
         ' AND   t.cod_aux='+VarToStr(EdtPagtoCodPlan.Value)+
         ' AND   SUBSTRING(t.des_aux FROM CHAR_LENGTH(t.des_aux)-1 FOR 2)='+QuotedStr(FormatFloat('00',StrToInt(EdtPagtoCodLoja.text)));
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgDtaF:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Aux').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  If Trim(sgDtaF)='' Then
  Begin
    msg('Sem Planilha de Pagamentos a Apresentar !!','A');
    EdtPagtoCodPlan.Value:=0;
    EdtPagtoCodPlan.SetFocus;
    Exit;
  End;

  sgDtaI:=Copy(sgDtaF,1,10);
  sgDtaI:=F_Troca('/','.',sgDtaI);
  sgDtaI:=F_Troca('-','.',sgDtaI);

  sgDtaF:=Copy(sgDtaF,14,10);
  sgDtaF:=F_Troca('/','.',sgDtaF);
  sgDtaF:=F_Troca('-','.',sgDtaF);

  sgPeriodoIni:=sgDtaI;
  sgPeriodoFim:=sgDtaF;


  // Apresenta Planilha de Pagamento ===========================================
  If Not ProfPagtoPlanilha(VarToStr(EdtPagtoCodPlan.Value), FormatFloat('00',EdtPagtoCodLoja.AsInteger)) Then
  Begin
    Screen.Cursor:=crDefault;
    msg('Sem Planilha de Pagamentos a Apresentar !1','A');
    Exit;
  End;

  // Apresenta Planilha de Vendas ==============================================
  MySql:=' SELECT pv.NUM_PLANILHA, pv.COD_LOJA, pv.COD_PROFISSIONAL, pv.DES_PROFISSIONAL,'+
         ' pv.QTD_SERVICO, pv.VLR_TOTALITEM,  pv.VLR_TOT_COMISSAO, pv.VLR_TOT_COMISSAO_SID,'+
         ' pv.PER_COMIS_SERV, pv.PER_COMIS_HAB, pv.PER_COMIS_GERAL, pv.PER_COMIS_SID,'+
         ' pv.NUM_DOCTO, pv.DTA_COMPROV, pv.COD_COMPROV, pv.TIP_DOCTO, pv.COD_PRODUTO,'+
         ' pv.COD_HABILIDADE, pv.DES_HABILIDADE, pv.COD_SERVICO, pv.DES_SERVICO,'+
         ' pv.SINTETICO, pv."INDEX"'+

         ' FROM SAL_PLAN_VENDAS pv'+
         ' WHERE pv.num_planilha='+VarToStr(EdtPagtoCodPlan.Value)+
         ' AND   pv.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
         ' ORDER BY pv."INDEX"';
  DMSalao.CDS_PagtosVendas.Close;
  DMSalao.SDS_PagtosVendas.CommandText:=MySql;
  DMSalao.CDS_PagtosVendas.Open;

  try
    DMSalao.CDS_V_PagtosVendas.CreateDataSet;
    DMSalao.CDS_V_PagtosVendas.IndexFieldNames:='';
    DMSalao.CDS_V_PagtosVendas.Open;
  Except
    DMSalao.CDS_V_PagtosVendas.EmptyDataSet;
    DMSalao.CDS_V_PagtosVendas.IndexFieldNames:='';
    DMSalao.CDS_V_PagtosVendas.Open;
  End;

  While not DMSalao.CDS_PagtosVendas.Eof do
  Begin
     DMSalao.CDS_V_PagtosVendas.Insert;
     For i:=0 to DMSalao.CDS_PagtosVendas.FieldCount-1 do
     Begin
       If i>1 Then
        DMSalao.CDS_V_PagtosVendas.Fields[i-2].Assign(DMSalao.CDS_PagtosVendas.Fields[i]);
     End;
     DMSalao.CDS_V_PagtosVendas.Post;

     DMSalao.CDS_PagtosVendas.Next;
  End;

  DMSalao.CDS_PagtosVendas.Close;
  DMSalao.CDS_V_PagtosVendas.IndexFieldNames:='INDEX';
  DMSalao.CDS_V_PagtosVendas.First;

  // Apresenta Planilha de Debitos e Creditos ==================================
  MySql:=' SELECT dc.NUM_PLANILHA, dc.COD_LOJA, dc.COD_PROFISSIONAL, dc.DES_PROFISSIONAL,'+
         ' dc.VLR_CREDITOS, dc.VLR_DEBITOS, dc.VLR_SALDO, dc.NUM_DOCTO, dc.VLR_ORIGINAL,'+
         ' dc.NUM_PRESTACOES, dc.DTA_PRIM_VENC, dc.NUM_PRESTACAO, dc.DTA_VENCIMENTO,'+
         ' dc.VLR_PRESTACAO, dc.VLR_DESCONTO, dc.VLR_ACRESCIMOS, dc.NUM_SEQ, dc.SINTETICO,'+
         ' dc.IDX_INDEX, dc.TP_DOC, dc.CODPROF'+

         ' FROM SAL_PLAN_DEBCRED dc'+
         ' WHERE dc.num_planilha='+VarToStr(EdtPagtoCodPlan.Value)+
         ' AND   dc.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
         ' ORDER BY dc.idx_index';
  DMSalao.CDS_PagtosDebCred.Close;
  DMSalao.SDS_PagtosDebCred.CommandText:=MySql;
  DMSalao.CDS_PagtosDebCred.Open;

  try
    DMSalao.CDS_V_PagtosDebCred.CreateDataSet;
    DMSalao.CDS_V_PagtosDebCred.IndexFieldNames:='';
    DMSalao.CDS_V_PagtosDebCred.Open;
  Except
    DMSalao.CDS_V_PagtosDebCred.EmptyDataSet;
    DMSalao.CDS_V_PagtosDebCred.IndexFieldNames:='';
    DMSalao.CDS_V_PagtosDebCred.Open;
  End;

  While not DMSalao.CDS_PagtosDebCred.Eof do
  Begin
     DMSalao.CDS_V_PagtosDebCred.Insert;
     For i:=0 to DMSalao.CDS_PagtosDebCred.FieldCount-1 do
     Begin
       If i>1 Then
        DMSalao.CDS_V_PagtosDebCred.Fields[i-2].Assign(DMSalao.CDS_PagtosDebCred.Fields[i]);
     End;
     DMSalao.CDS_V_PagtosDebCred.Post;

     DMSalao.CDS_PagtosDebCred.Next;
  End;

  DMSalao.CDS_PagtosDebCred.Close;
  DMSalao.CDS_V_PagtosDebCred.IndexFieldNames:='INDEX';
  DMSalao.CDS_V_PagtosDebCred.First;

  // Coloca tudo em Sintetico ==================================================
  Rb_PagtoVendasSintetico.Checked:=True;
  Rb_PagtoVendasSinteticoClick(Self);

  Rb_PagtoDebCredSintetico.Checked:=True;
  Rb_PagtoDebCredSinteticoClick(Self);

  // Apresenta Planilhas =======================================================
  OdirPanApres.Visible:=False;

//Odirapagar - 29/09/2015
//  EdtPagtoCodPlan.Value:=0;

  Screen.Cursor:=crDefault;
  THackDBGridSalao(Dbg_PagtoPlanilha).FixedCols:=2;

//odirapagar - 29/01/2015
//  Bt_PagtoGeraPlanilha.Visible:=False;

  Ts_PagtoPlanilha.TabVisible:=True;
  Ts_PagtoVendas.TabVisible:=True;
  Ts_PagtoDebCred.TabVisible:=True;
  Ts_PagtoProfissionais.TabVisible:=False;
  PC_PagtoPlanilha.ActivePage:=Ts_PagtoPlanilha;
  PC_PagtoPlanilha.Refresh;

  Dbg_PagtoPlanilha.SetFocus;
end;

procedure TFrmSalao.Bt_PagtoBuscaPlanClick(Sender: TObject);
Var
  MySql: String;
begin
  If EdtPagtoCodLoja.Value=0 Then
  Begin
    msg('Favor Informara a Loja !!','A');
    EdtPagtoCodLoja.SetFocus;
    Exit;
  End;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtPagtoCodPlan.Clear;

  EdtPagtoCodPlan.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;
  DMBelShop.CDS_Pesquisa.Close;
  MySql:=' SELECT t.cod_aux Planilha, SUBSTRING(t.des_aux FROM 1 FOR 23) Periodo'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux=7'+
         ' AND   t.des_aux1 is null'+
         ' AND   SUBSTRING(t.des_aux FROM CHAR_LENGTH(t.des_aux)-1 FOR 2)='+QuotedStr(FormatFloat('00',StrToInt(EdtPagtoCodLoja.text)))+
         ' Order by t.cod_aux Desc';
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Planilha').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Planilha a Listar !!','A');
    EdtPagtoCodPlan.SetFocus;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Periodo';
  FrmPesquisa.Campo_Codigo:='Planilha';
  FrmPesquisa.Campo_Descricao:='Periodo';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtPagtoCodPlan.Value:=StrToInt(FrmPesquisa.EdtCodigo.Text);
    EdtPagtoCodPlanExit(Self);
  End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmSalao.Dbe_CadProfNumBancoExit(Sender: TObject);
Var
  s, MySql: String;
begin

  If DMSalao.CDS_ProfissionaisNUM_BANCO.AsInteger<>0 Then
   Begin
     MySql:=' SELECT DISTINCT b.des_banco'+
            ' FROM fin_bancos b'+
            ' WHERE b.num_banco='+DMSalao.CDS_ProfissionaisNUM_BANCO.AsString;
     DMBelShop.CDS_BuscaRapida.Close;
     DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
     DMBelShop.CDS_BuscaRapida.Open;
     s:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Banco').AsString;
     DMBelShop.CDS_BuscaRapida.Close;

     If Trim(s)='' Then
     Begin
       Dbe_CadProfNomeBanco.Color:=clWindow;
       Dbe_CadProfNomeBanco.ReadOnly:=False;
       Exit;
     End;

     DMSalao.CDS_ProfissionaisDES_BANCO.AsString:=s;

     Dbe_CadProfNomeBanco.Color:=$00E0E0E0;
     Dbe_CadProfNomeBanco.ReadOnly:=True;

     Dbe_CadProfNumAgencia.Color:=clWindow;
     Dbe_CadProfNumAgencia.ReadOnly:=False;
   End
  Else // If DMSalao.CDS_ProfissionaisNUM_BANCO.AsInteger<>0 Then
   Begin
     DMSalao.CDS_ProfissionaisDES_BANCO.Clear;

     Dbe_CadProfNomeBanco.Color:=clWindow;
     Dbe_CadProfNomeBanco.ReadOnly:=False;

     Dbe_CadProfNumAgencia.Color:=clWindow;
     Dbe_CadProfNumAgencia.ReadOnly:=False;
   End;  // If DMSalao.CDS_ProfissionaisNUM_BANCO.AsInteger<>0 Then

end;

procedure TFrmSalao.Ts_CadProfissionalEnter(Sender: TObject);
begin
  Dbe_CadProfNomeBanco.Color:=$00E0E0E0;
  Dbe_CadProfNomeBanco.ReadOnly:=True;

  Dbe_CadProfNumAgencia.Color:=$00E0E0E0;
  Dbe_CadProfNumAgencia.ReadOnly:=True;

  Dbe_CadProfNomeAgencia.Color:=$00E0E0E0;
  Dbe_CadProfNomeAgencia.ReadOnly:=True;

  Dbe_CadProfNumConta.Color:=$00E0E0E0;
  Dbe_CadProfNumConta.ReadOnly:=True;

end;

procedure TFrmSalao.Dbe_CadProfNumAgenciaExit(Sender: TObject);
Var
  s, MySql: String;
begin
  If Trim(DMSalao.CDS_ProfissionaisNUM_AGENCIA.AsString)<>'' Then
   Begin
     MySql:=' SELECT DISTINCT b.des_agencia'+
            ' FROM FIN_BANCOS b'+
            ' WHERE b.num_banco='+DMSalao.CDS_ProfissionaisNUM_BANCO.AsString+
            ' AND   b.num_agencia='+QuotedStr(DMSalao.CDS_ProfissionaisNUM_AGENCIA.AsString);
     DMBelShop.CDS_BuscaRapida.Close;
     DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
     DMBelShop.CDS_BuscaRapida.Open;
     s:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Agencia').AsString;
     DMBelShop.CDS_BuscaRapida.Close;

     Dbe_CadProfNumConta.Color:=clWindow;
     Dbe_CadProfNumConta.ReadOnly:=False;

     If Trim(s)='' Then
     Begin
       Dbe_CadProfNomeAgencia.Color:=clWindow;
       Dbe_CadProfNomeAgencia.ReadOnly:=False;
       Exit;
     End;

     DMSalao.CDS_ProfissionaisDES_AGENCIA.AsString:=s;

     Dbe_CadProfNomeAgencia.Color:=$00E0E0E0;
     Dbe_CadProfNomeAgencia.ReadOnly:=True;

   End
  Else // If DMSalao.CDS_ProfissionaisNUM_BANCO.AsInteger<>0 Then
   Begin
     DMSalao.CDS_ProfissionaisDES_AGENCIA.Clear;
     DMSalao.CDS_ProfissionaisNUM_CONTA.Clear;

     Dbe_CadProfNomeAgencia.Color:=clWindow;
     Dbe_CadProfNomeAgencia.ReadOnly:=False;

     Dbe_CadProfNumConta.Color:=clWindow;
     Dbe_CadProfNumConta.ReadOnly:=False;

   End; // If DMSalao.CDS_ProfissionaisNUM_BANCO.AsInteger<>0 Then

end;

procedure TFrmSalao.Dbe_CadProfNomeBancoExit(Sender: TObject);
begin
  If Trim(DMSalao.CDS_ProfissionaisDES_BANCO.AsString)<>'' Then
  Begin
    Dbe_CadProfNumAgencia.Color:=clWindow;
    Dbe_CadProfNumAgencia.ReadOnly:=False;
  End;

end;

procedure TFrmSalao.Dbe_CadProfNumBancoEnter(Sender: TObject);
begin
  Dbe_CadProfNomeBanco.Color:=$00E0E0E0;
  Dbe_CadProfNomeBanco.ReadOnly:=True;

  Dbe_CadProfNumAgencia.Color:=$00E0E0E0;
  Dbe_CadProfNumAgencia.ReadOnly:=True;

  Dbe_CadProfNomeAgencia.Color:=$00E0E0E0;
  Dbe_CadProfNomeAgencia.ReadOnly:=True;

  Dbe_CadProfNumConta.Color:=$00E0E0E0;
  Dbe_CadProfNumConta.ReadOnly:=True;

end;

procedure TFrmSalao.Cbx_INSS_PSMesChange(Sender: TObject);
Var
  wDia, wMes, wAno: Word;
begin
  FechaTudoSalao;

  If Ts_ProfMovtosRH.Visible Then
  Begin

    If Not bgConsultaIPS Then
    Begin
      wAno:=StrToInt(EdtINSS_PSAno.Text);
      If sgINSS_PS='I' Then
      Begin
        DtaEdt_INSS_PSVenc.Date:=PrimeiroUltimoDia(EncodeDate(wAno, StrToInt(NumeroMes(copy(Cbx_INSS_PSMes.Text,1,3))), 1),'U');
        DtaEdt_INSS_PSVenc.Date:=DtaEdt_INSS_PSVenc.Date+1;
        DecodeDate(DtaEdt_INSS_PSVenc.Date, wAno, wMes, wDia);
        DtaEdt_INSS_PSVenc.Date:=EncodeDate(wAno, wMes, 15);
      End;

// OdirApagar - 01/10/2015 - Plano de Suade é Importado e Não Mais Gerado
//      // Plano de Saude
//      If sgINSS_PS='P' Then
//       DtaEdt_INSS_PSVenc.Date:=EncodeDate(wAno, StrToInt(NumeroMes(Cbx_INSS_PSMes.Text)), 22);

      // Taxa Sindicato
      If sgINSS_PS='S' Then
       DtaEdt_INSS_PSVenc.Date:=PrimeiroUltimoDia(EncodeDate(wAno, StrToInt(NumeroMes(copy(Cbx_INSS_PSMes.Text,1,3))), 1),'U');

      // Mes/Ano Competencia
      sgMesCompetencia:=ZerosEsquerda((NumeroMes(Cbx_INSS_PSMes.Text)),2);
      sgAnoCompetencia:=EdtINSS_PSAno.Text;

      // Mes/Ano Vencimento
      sgMesVenc:=ZerosEsquerda(IntToStr(wMes),2);
      sgAnoVenc:=IntToStr(wAno);
    End; // If Not bgConsultaIPS Then

    bgConsultaIPS :=False;

    Try
      ProfBuscaDebitos(sgINSS_PS);
    Except
    End;
  End; // If Ts_ProfMovtosRH.Visible Then
  Refresh;

end;

procedure TFrmSalao.Cbx_INSS_PSMesEnter(Sender: TObject);
begin
  If EdtINSS_PSCodLoja.Value=0 Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtINSS_PSCodLoja.SetFocus;
    Exit;
  End;

end;

procedure TFrmSalao.Bt_INSS_PSFecharClick(Sender: TObject);
begin
  bgSairSalao:=True;
  Close;
end;

procedure TFrmSalao.Ts_CadProfContratoShow(Sender: TObject);
begin
  EdtDt_CadProfIniContrato.ReadOnly:=False;
  EdtDt_CadProfIniContrato.Color:=clWindow;
  EdtDt_CadProfFimContrato.ReadOnly:=False;
  EdtDt_CadProfFimContrato.Color:=clWindow;

  If Trim(EdtDt_CadProfIniRenovacao.Text)<>'/  /' Then
  Begin
    EdtDt_CadProfIniContrato.ReadOnly:=True;
    EdtDt_CadProfIniContrato.Color:=$00E0E0E0;

    EdtDt_CadProfFimContrato.ReadOnly:=True;
    EdtDt_CadProfFimContrato.Color:=$00E0E0E0;
  End; // If Trim(EdtDt_CadProfIniRenovacao.Text)='/  /' Then
end;

procedure TFrmSalao.Dbm_CadProfRenovacoesChange(Sender: TObject);
begin
  EdtDt_CadProfIniContrato.ReadOnly:=False;
  EdtDt_CadProfIniContrato.Color:=clWindow;
  EdtDt_CadProfFimContrato.ReadOnly:=False;
  EdtDt_CadProfFimContrato.Color:=clWindow;

  If Not ((DMSalao.CDS_ProfissionaisBLOB_RENOVACOES as TBlobField).IsNull) Then
  Begin
    EdtDt_CadProfIniContrato.ReadOnly:=True;
    EdtDt_CadProfIniContrato.Color:=$00E0E0E0;

    EdtDt_CadProfFimContrato.ReadOnly:=True;
    EdtDt_CadProfFimContrato.Color:=$00E0E0E0;
  End; // If Trim(EdtDt_CadProfIniRenovacao.Text)='/  /' Then

end;

procedure TFrmSalao.Bt_PagtoBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtPagtoCodLoja.Clear;
  EdtPagtoDesLoja.Clear;

  DMSalao.CDS_Profissionais.Close;

  Dbg_PagtoProfissionais.SetFocus;

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
    EdtPagtoCodLoja.SetFocus;
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
     EdtPagtoCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtPagtoDesLoja.Text:=FrmPesquisa.EdtDescricao.Text;
     EdtPagtoCodLojaExit(Self);
   End
  Else
   Begin
     EdtPagtoCodLoja.Clear;
     EdtPagtoDesLoja.Clear;
     EdtPagtoCodLoja.SetFocus;
   End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmSalao.Dbg_PlanoSaudeDblClick(Sender: TObject);
begin
  If DMSalao.CDS_V_ManutPlSaude.IsEmpty Then
   Exit;

  DMSalao.CDS_V_ManutPlSaude.Edit;
  If DMSalao.CDS_V_ManutPlSaudeAlterar.AsString='SIM' Then
   DMSalao.CDS_V_ManutPlSaudeAlterar.AsString:='NAO'
  Else
   DMSalao.CDS_V_ManutPlSaudeAlterar.AsString:='SIM';
  DMSalao.CDS_V_ManutPlSaude.Post;

end;

procedure TFrmSalao.Dbg_PlanoSaudeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If not (gdSelected in State) Then
  Begin
    If DMSalao.CDS_V_ManutPlSaudeAlterar.AsString='SIM' then
    Begin
      Dbg_PlanoSaude.Canvas.Brush.Color:=clYellow;
    End;

    If (Column.FieldName='Alterar') Then //   ----> Este comando altera cor da Celula
    Begin
      If (DMSalao.CDS_V_ManutPlSaudeAlterar.AsString='SIM') Then
      Begin
        Dbg_PlanoSaude.Canvas.Font.Style:=[fsBold];
        Dbg_PlanoSaude.Canvas.Brush.Color:=clBlue;
        Dbg_PlanoSaude.Canvas.Font.Color:=clWhite;// -->> Cor da Fonte
      End;
    End;

    Dbg_PlanoSaude.Canvas.FillRect(Rect);
    Dbg_PlanoSaude.DefaultDrawDataCell(Rect,Column.Field,state);

    DMSalao.CDS_V_ManutPlSaudeAlterar.Alignment:=taCenter;

  End; // If not (gdSelected in State) Then
end;

procedure TFrmSalao.Bt_PlanoSaudeNovoClick(Sender: TObject);
Var
  sDML: String;
begin
  Dbg_PlanoSaude.SetFocus;

  If Trim((Sender as TJvXPButton).Caption)='Novo' Then
   sDML:='N'
  Else If Trim((Sender as TJvXPButton).Caption)='Alterar' Then
   sDML:='A'
  Else
   Exit;

  If (DMSalao.CDS_V_ManutPlSaude.IsEmpty) and (sDML='A') Then
   Exit;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(10);

  FrmSolicitacoes.Gb_Desc3.Visible :=False;
  FrmSolicitacoes.Gb_Desc4.Visible :=False;
  FrmSolicitacoes.Gb_Desc5.Visible :=False;
  FrmSolicitacoes.Gb_Desc6.Visible :=False;
  FrmSolicitacoes.Gb_Desc7.Visible :=False;
  FrmSolicitacoes.Gb_Desc8.Visible :=False;

  // Busca o Codigo do Plano de Saude ==========================================
  If sDML='N' Then
  Begin
    MySqlDML:='SELECT GEN_ID(GEN_PLANOSAUDE,1) Cod'+
              ' FROM RDB$DATABASE';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySqlDML;
    DMBelShop.CDS_Busca.Open;
  End;

  If sDML='N' Then
   FrmSolicitacoes.Ts_ManutDiversas.Caption:=' INCLUSÃO DE PLANO DE SAÚDE '
  Else
   FrmSolicitacoes.Ts_ManutDiversas.Caption:=' ALTERAÇÃO DE PLANO DE SAÚDE ';

  FrmSolicitacoes.Gb_Desc1.Caption:=' Código ';
  FrmSolicitacoes.EdtDesc1.Color:=$00E0E0E0;
  FrmSolicitacoes.EdtDesc1.ReadOnly:=True;
  FrmSolicitacoes.EdtDesc1.TabStop:=False;
  FrmSolicitacoes.Gb_Desc1.TabOrder:=3;
  FrmSolicitacoes.Gb_Desc1.Top:=FrmSolicitacoes.Gb_Desc3.Top;
  If sDML='N' Then
   FrmSolicitacoes.EdtDesc1.Text:=DMBelShop.CDS_Busca.FieldByName('Cod').AsString
  Else
   FrmSolicitacoes.EdtDesc1.Text:=DMSalao.CDS_V_ManutPlSaudeCod_Plano.AsString;
  DMBelShop.CDS_Busca.Close;

  FrmSolicitacoes.Gb_Desc2.Caption:=' Descrição do Plano de Saúde ';
  FrmSolicitacoes.Gb_Desc2.TabOrder:=0;
  FrmSolicitacoes.Gb_Desc2.Top:=FrmSolicitacoes.Gb_Desc3.Top;
  If sDML='A' Then
   FrmSolicitacoes.EdtDesc2.Text:=DMSalao.CDS_V_ManutPlSaudeDes_Plano.AsString;

  FrmSolicitacoes.Gb_Desc9.Caption:=' Valor do Titular ';
  FrmSolicitacoes.Gb_Desc9.TabOrder:=1;
  FrmSolicitacoes.Gb_Desc9.Top:=FrmSolicitacoes.Gb_Desc4.Top;
  FrmSolicitacoes.Gb_Desc9.Left:=FrmSolicitacoes.Gb_Desc4.Left;
  If sDML='A' Then
   FrmSolicitacoes.EdtDesc9.Text:=DMSalao.CDS_V_ManutPlSaudeVlr_Titular.AsString;

  FrmSolicitacoes.Gb_Desc10.Caption:=' Valor por Dependente ';
  FrmSolicitacoes.Gb_Desc10.TabOrder:=2;
  FrmSolicitacoes.Gb_Desc10.Top:=FrmSolicitacoes.Gb_Desc5.Top;
  FrmSolicitacoes.Gb_Desc10.Left:=FrmSolicitacoes.Gb_Desc5.Left;
  If sDML='A' Then
   FrmSolicitacoes.EdtDesc10.Text:=DMSalao.CDS_V_ManutPlSaudeVlr_Dependente.AsString;

  // Campos a Consistir
  FrmSolicitacoes.sgComponentesConsiste:='EdtDesc2;EdtDesc9;EdtDesc10;';

  If sDML='N' Then
   FrmSolicitacoes.Bt_ManutDiversosDML.Caption:='Incluir'
  Else
   FrmSolicitacoes.Bt_ManutDiversosDML.Caption:='Alterar';

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    If StrToCurr(FrmSolicitacoes.EdtDesc9.Text)<StrToCurr(FrmSolicitacoes.EdtDesc10.Text) Then
    Begin
      sgMensagem:='IMPOSSÍVEL GRAVAR !!'+cr+cr+
                  'Valor do Dependente é Maior que o Títular !!'+cr+cr+
                  'Valor do Titular: '+FrmSolicitacoes.EdtDesc9.Text+cr+
                  'Valor do Dependente: '+FrmSolicitacoes.EdtDesc10.Text;
      Application.MessageBox(PChar(sgMensagem), 'ATENÇÃO !!', 16);

      sgMensagem:='';

      FrmSolicitacoes.Free;
      FrmSolicitacoes:=nil;

      Exit;
    End;

    If sDML='N' Then
    Begin
      If (Not DMSalao.CDS_V_ManutPlSaude.IsEmpty) and (DMSalao.CDS_V_ManutPlSaude.Locate('Des_Plano',FrmSolicitacoes.EdtDesc2.Text,[])) Then
       Begin
         msg('Plano de Saúde Já Cadastrado !!','A');
         Exit;
       End
    End; // If sDML='N' Then

    // Grava Plano de Saude ====================================================
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

      // Inclui Plano de Contas -------------------------------------
      If sDML='N' Then
      Begin
        MySqlDML:=' INSERT INTO TAB_AUXILIAR (tip_aux, cod_aux, des_aux, vlr_aux, vlr_aux1)'+
                  ' VALUES ('+
                  QuotedStr('4')+', '+
                  QuotedStr(Trim(FrmSolicitacoes.EdtDesc1.Text))+', '+
                  QuotedStr(Trim(FrmSolicitacoes.EdtDesc2.Text))+', '+
                  QuotedStr(F_Troca(',','.',ZerosCentavos(FrmSolicitacoes.EdtDesc9.Text,2)))+', '+
                  QuotedStr(F_Troca(',','.',ZerosCentavos(FrmSolicitacoes.EdtDesc10.Text,2)))+')';
      End;

      // Altera Plano de Contas -------------------------------------
      If sDML='A' Then
      Begin
        MySqlDML:=' UPDATE TAB_AUXILIAR'+
                  ' SET des_aux ='+QuotedStr(Trim(FrmSolicitacoes.EdtDesc2.Text))+
                  ',    vlr_aux ='+QuotedStr(F_Troca(',','.',ZerosCentavos(FrmSolicitacoes.EdtDesc9.Text,2)))+
                  ',    vlr_aux1='+QuotedStr(F_Troca(',','.',ZerosCentavos(FrmSolicitacoes.EdtDesc10.Text,2)))+
                  ' WHERE tip_aux=4'+
                  ' AND cod_aux='+QuotedStr(Trim(FrmSolicitacoes.EdtDesc1.Text));
      End;
      DMBelShop.SQLC.Execute(MySqlDML,nil,nil);

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

    // Busca Plano de Saude =======================================
    BuscaPlanosSaude(sDML, Trim(FrmSolicitacoes.EdtDesc1.Text));

    DMSalao.CDS_V_ManutPlSaude.Locate('Des_Plano',FrmSolicitacoes.EdtDesc2.Text,[]);
  End; // If bgProcessar Then

  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmSalao.Bt_PlanoSaudeFecharClick(Sender: TObject);
begin

  bgSiga:=True;
  DMSalao.CDS_V_ManutPlSaude.First;
  While Not DMSalao.CDS_V_ManutPlSaude.Eof do
  Begin
    if DMSalao.CDS_V_ManutPlSaudeAlterar.AsString='SIM' Then
    Begin
      bgSiga:=False;
      Break;
    End;

    DMSalao.CDS_V_ManutPlSaude.Next;
  End; // While Not DMSalao.CDS_V_ManutPlSaude.Eof do
  DMSalao.CDS_V_ManutPlSaude.First;

  If Not bgSiga Then
  Begin
    bgSiga:=True;
    sgMensagem:='Todos os Profissionais Terão seus Valores Alterados,'+cr+
                'Conforme os Planos de Saúde Marcados como "SIM"'+cr+cr+
                'DESEJA CONTINUAR ???';

    If Application.MessageBox(pChar(sgMensagem), 'ATENÇÃO !!', 292)=IdNo Then
     Exit;
    sgMensagem:='';

    // Altera Valor do Plano de Saude nos Profissionais ========================
    PlanoSaudeAlterarProfissionais;
  End; // If Not bgSiga Then

  bgSairSalao:=True;
  Close;

end;

procedure TFrmSalao.Bt_PlanoSaudeExcluirClick(Sender: TObject);
Var
  MySql: String;
begin
  If DMSalao.CDS_V_ManutPlSaude.IsEmpty Then
   Exit;

  If msg('Deseja Realmente Exclir o'+cr+'Plano de Saúde Selecionado ??','C')=2 Then
   Exit;

  // Verifica a Possibilidade de Exclusão ======================================
  MySql:=' SELECT  p.cod_plano_saude'+
         ' FROM  SAL_PROFISSIONAIS p'+
         ' WHERE p.cod_plano_saude='+DMSalao.CDS_V_ManutPlSaudeCod_Plano.AsString;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('cod_plano_saude').AsString)<>'' Then
  Begin
    DMBelShop.CDS_BuscaRapida.Close;
    msg('Impossível Excluir !!'+cr+'Existe Profissional Utilizando'+cr+'este Plano de Saúde !!','A');
    Exit;
  End;
  DMBelShop.CDS_BuscaRapida.Close;

  // Exclui Plano de Saúde =====================================================
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
           ' WHERE t.tip_aux=4'+
           ' AND t.cod_aux='+DMSalao.CDS_V_ManutPlSaudeCod_Plano.AsString;
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

  // Busca Plano de Saude =======================================
  BuscaPlanosSaude;

end;

procedure TFrmSalao.Dbe_CadProfNumINSSExit(Sender: TObject);
begin
  If ((Trim(DMSalao.CDS_ProfissionaisNUM_INSS.AsString)='') Or (DMSalao.CDS_ProfissionaisPER_INSS.AsCurrency=0) Or
     (DMSalao.CDS_ProfissionaisPER_INSS.AsString='')        Or (Cbx_CadProfSitPrevidencia.ItemIndex<>0)) Then
   Ckb_CadProfINSSCobrar.Checked:=False;

end;

procedure TFrmSalao.Dbe_CadProfVlrTaxaNaoSociosExit(Sender: TObject);
begin
  If DMSalao.CDS_ProfissionaisVLR_TAXA_NAOSOCIO.AsCurrency=0 Then
  Begin
    Ckb_CadProfTaxaNaoSocio.Checked:=False;
    Ckb_CadProfTaxaNaoSocioClick(Self);
  End;
end;

procedure TFrmSalao.Dbg_ProfTaxaSindicatoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if (DMSalao.CDS_V_TaxaSindicatoNOME.AsString<>'') And (DMSalao.CDS_V_TaxaSindicatoAPELIDO.AsString='') Then
    Begin
      Dbg_ProfTaxaSindicato.Canvas.Font.Style:=[fsBold];
      Dbg_ProfTaxaSindicato.Canvas.Brush.Color:=clSkyBlue;
    end;

    Dbg_ProfTaxaSindicato.Canvas.FillRect(Rect);
    Dbg_ProfTaxaSindicato.DefaultDrawDataCell(Rect,Column.Field,state);

    DMSalao.CDS_V_TaxaSindicatoDTA_VENCIMENTO.Alignment:=taCenter;
    DMSalao.CDS_V_TaxaSindicatoDTA_PAGAMENTO.Alignment:=taCenter;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmSalao.Dbe_CadProfVlrSindicatoExit(Sender: TObject);
begin
  If DMSalao.CDS_ProfissionaisVLR_TAXA_SINDICATO.AsCurrency=0 Then
  Begin
    Ckb_CadProfTaxaSindicato.Checked:=False;
    Ckb_CadProfTaxaSindicatoClick(Self);
  End;

end;

procedure TFrmSalao.Ckb_CadProfLocalizarQualquerLjClick(Sender: TObject);
begin
  AcertaCkb_Style(Ckb_CadProfLocalizarQualquerLj);

end;

procedure TFrmSalao.Ckb_CadProfLocalizarQualquerLjKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_CadProfLocalizarQualquerLjClick(Self);
end;

procedure TFrmSalao.Dbg_CadProfServKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sSituacao, MySql: String;
begin

  // Altera Situação Ativo do Serviço ==========================================
  If key=VK_F6 Then
  Begin
    If DMSalao.CDS_ServicosProf.IsEmpty Then
     Exit;

    If msg('Deseja Realmente Alterar'+cr+cr+'a Situação dos Serviços ?','C')=2 Then
     Exit;

    sSituacao:='SIM';
    If Application.MessageBox('Alterar a SITUAÇÂO de TODOS dos SERVIÇOS Para ?', 'ATIVO', 292) = idNo Then
     sSituacao:='NAO';

    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    DMSalao.CDS_ServicosProf.First;
    While Not DMSalao.CDS_ServicosProf.Eof do
    Begin
      MySql:=' Update SAL_PROF_HABILIDADES s'+
             ' set s.ind_ativo='+QuotedStr(sSituacao)+
             ', s.USU_ALTERA='+QuotedStr(Cod_Usuario)+
             ', s.DTA_ALTERA=Current_Date'+

             ' Where s.COD_LOJA='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_LOJA.AsString)+
             ' And   s.COD_PROFISSIONAL='+QuotedStr(DMSalao.CDS_ProfissionaisCOD_PROFISSIONAL.AsString)+
             ' And   s.COD_HABILIDADE='+QuotedStr(DMSalao.CDS_HabilidadesProfCOD_HABILIDADE.AsString)+
             ' And   s.COD_SERVICO='+QuotedStr(DMSalao.CDS_ServicosProfCOD_SERVICO.AsString);

             If Cbx_CadProfServAtivo.ItemIndex=1 Then
               MySql:=
                MySql+' AND s.IND_ATIVO=''SIM''';

             If Cbx_CadProfServAtivo.ItemIndex=2 Then
               MySql:=
                MySql+' AND s.IND_ATIVO=''NAO''';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      DMSalao.CDS_ServicosProf.Next;
    End; // While Not DMSalao.CDS_ServicosProf.Eof do

    DMSalao.CDS_ServicosProf.Close;
    DMSalao.CDS_ServicosProf.Open;
    DMSalao.CDS_ServicosProf.First;
    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;
  End; // If key=VK_F6 Then
end;

procedure TFrmSalao.PC_ProfTecBizChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_ProfTecBiz);

  DMSalao.CDS_TecBizApres.Close;
end;

procedure TFrmSalao.Bt_ProfTecBizBuscarClick(Sender: TObject);
Var
  sDtaI, sDtaF: String;
  MySql: String;
begin

  Try
    StrToDate(DtEdt_ProfTecBizDtaInicio.Text);
  Except
    msg('Data de Início do Período Inválida !!','A');
    DtEdt_ProfTecBizDtaInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_ProfTecBizDtaFim.Text);
  Except
    msg('Data do Final do Período Inválida !!','A');
    DtEdt_ProfTecBizDtaFim.SetFocus;
    Exit;
  End;

  If StrToDate(DtEdt_ProfTecBizDtaInicio.Text)>StrToDate(DtEdt_ProfTecBizDtaFim.Text) Then
  Begin
    msg('Período Inválido !!','A');
    DtEdt_ProfTecBizDtaInicio.Text:='  /  /    ';
    DtEdt_ProfTecBizDtaFim.Text:='  /  /    ';
    DtEdt_ProfTecBizDtaInicio.SetFocus;
    Exit;
  End;

  Screen.Cursor:=crAppStart;

  sDtaI:=f_Troca('/','.',DtEdt_ProfTecBizDtaInicio.Text);
  sDtaI:=f_Troca('-','.',sDtaI);
  sDtaF:=f_Troca('/','.',DtEdt_ProfTecBizDtaFim.Text);
  sDtaF:=f_Troca('-','.',sDtaF);

  MySql:=' SELECT t.dta_ini_periodo, t.dta_fim_periodo, t.cod_tecbiz, t.des_pessoa,'+
         ' t.vlr_tecbiz, t.ind_pago, t.des_arquivo'+
         ' FROM ps_tecbiz t'+
         ' WHERE ((t.dta_ini_periodo BETWEEN '+QuotedStr(sDtaI)+' AND '+QuotedStr(sDtaF)+')'+
         '        OR (t.dta_fim_periodo BETWEEN '+QuotedStr(sDtaI)+' AND '+QuotedStr(sDtaF)+'))'+
         ' ORDER BY t.des_pessoa, t.dta_ini_periodo, t.dta_fim_periodo, t.des_arquivo,t.num_seq';
  DMSalao.CDS_TecBizApres.Close;
  DMSalao.SDS_TecBizApres.CommandText:=MySql;
  DMSalao.CDS_TecBizApres.Open;
  Screen.Cursor:=crDefault;

  If Trim(DMSalao.CDS_TecBizApresCOD_TECBIZ.AsString)='' Then
  Begin
    DMSalao.CDS_TecBizApres.Close;
    msg('Sem Movimento TecBiz no Período !!','A');
    Exit;
  End;

  Dbg_ProfTecBizImportados.SetFocus;
end;

procedure TFrmSalao.Bt_PagtoDebCredImprimeClick(Sender: TObject);
Var
  MySql, sCodProf: String;
  sDtaEmissao, sUsuEmissao: String;
begin

  if (DMSalao.CDS_V_PagtosDebCred.IsEmpty) Or (DMSalao.CDS_V_PagtosVendas.IsEmpty) Then
   Exit;

  // Torna Analitico ----------------------------------------------
  Rb_PagtoDebCredAnalitico.Checked:=True;
  Rb_PagtoDebCredSinteticoClick(Self);

  Rb_PagtoVendasSintetico.Checked:=True;
  Rb_PagtoVendasSinteticoClick(Self);

   try
    DMSalao.CDS_V_RelPlanPagto.CreateDataSet;
    DMSalao.CDS_V_RelPlanPagto.Open;
  Except
    DMSalao.CDS_V_RelPlanPagto.EmptyDataSet;
    DMSalao.CDS_V_RelPlanPagto.Open;
  End;

  // Monta CLientDataSet para Relatório ========================================

  // ===========================================================================
  // Se NÃO For Consulta de Calculos Anteriores ================================
  // ===========================================================================
  If EdtPagtoCodPlan.Value=0 Then
  Begin
    sUsuEmissao:=sgNomeUsuario;
    sDtaEmissao:=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

    DMSalao.CDS_V_PagtosVendas.First;
    DMSalao.CDS_V_PagtoProf.First;
    DMSalao.CDS_V_PagtoProf.DisableControls;
    DMSalao.CDS_V_PagtosVendas.DisableControls;
    DMSalao.CDS_V_PagtosDebCred.DisableControls;
    While Not DMSalao.CDS_V_PagtoProf.Eof do
    Begin

      If DMSalao.CDS_V_PagtosDebCred.Locate('CODPROF', DMSalao.CDS_V_PagtoProfCODIGO.AsString,[]) Then
      Begin
        DMSalao.CDS_V_RelPlanPagto.Append;

        If DMSalao.CDS_V_PagtoProfNUM_BANCO.AsInteger=0 Then
         DMSalao.CDS_V_RelPlanPagtoTP_DEPOSITO.AsString:='DEPOSITOS: SEM CONTA CORRENTE'
        Else
         DMSalao.CDS_V_RelPlanPagtoTP_DEPOSITO.AsString:='DEPOSITOS: '+DMSalao.CDS_V_PagtoProfDES_BANCO.AsString;

        DMSalao.CDS_V_RelPlanPagtoCOD_PROF.AsString:=DMSalao.CDS_V_PagtoProfCODIGO.AsString;
        DMSalao.CDS_V_RelPlanPagtoDES_PROFISSIONAL.AsString:=DMSalao.CDS_V_PagtoProfNOME.AsString;

        If Trim(DMSalao.CDS_V_PagtoProfFIM_CONTRATO.AsString)<>'' Then
         DMSalao.CDS_V_RelPlanPagtoDTA_FIM_CONTRATO.AsString:=DMSalao.CDS_V_PagtoProfFIM_CONTRATO.AsString;

        // Valor das Vendas ( zero para Supervisor)
        DMSalao.CDS_V_RelPlanPagtoVLR_VENDA.AsCurrency:=0;
        If DMSalao.CDS_V_PagtoProfCODIGO.AsString<>sgCodSuperVisor Then
        Begin
          if DMSalao.CDS_V_PagtosVendas.Locate('COD_PROF;COD_PRODUTO;COD_COMPROV;NUM_DOCTO',
             VarArrayOf([DMSalao.CDS_V_PagtoProfCODIGO.AsString,'','','']),[]) Then
           DMSalao.CDS_V_RelPlanPagtoVLR_VENDA.AsCurrency:=DMSalao.CDS_V_PagtosVendasVLR_TOTALITEM.AsCurrency;
        End; // If DMSalao.CDS_V_PagtoProfCODIGO.AsString<>sgCodSuperVisor Then

        DMSalao.CDS_V_RelPlanPagtoVLR_COMISSAO.AsCurrency:=0;
        DMSalao.CDS_V_RelPlanPagtoVLR_BENEFICIO.AsCurrency:=0;
        DMSalao.CDS_V_RelPlanPagtoVLR_PLANOSAUDE.AsCurrency:=0;

        DMSalao.CDS_V_RelPlanPagtoNUM_TECBIZ.AsString:=DMSalao.CDS_V_PagtoProfNUM_TECBIZ.AsString;
        DMSalao.CDS_V_RelPlanPagtoVLR_TECBIZ.AsCurrency:=0;

        DMSalao.CDS_V_RelPlanPagtoVLR_TAXAS.AsCurrency:=0;
        DMSalao.CDS_V_RelPlanPagtoVLR_VALES.AsCurrency:=0;

        DMSalao.CDS_V_RelPlanPagtoVLR_INSS.AsCurrency:=0;
        DMSalao.CDS_V_RelPlanPagtoNUM_INSS.AsString:=DMSalao.CDS_V_PagtoProfNUM_INSS.AsString;
        DMSalao.CDS_V_RelPlanPagtoPER_INSS.AsCurrency:=0;
        If Trim(DMSalao.CDS_V_PagtoProfPER_INSS.AsString)<>'' Then
         DMSalao.CDS_V_RelPlanPagtoPER_INSS.AsCurrency:=DMSalao.CDS_V_PagtoProfPER_INSS.AsCurrency;

        DMSalao.CDS_V_RelPlanPagtoVLR_ARREDONDA.AsCurrency:=0;
        DMSalao.CDS_V_RelPlanPagtoVLR_DEPOSITO.AsCurrency:=0;

        DMSalao.CDS_V_RelPlanPagtoNUM_BANCO.AsString:=DMSalao.CDS_V_PagtoProfNUM_BANCO.AsString;
        DMSalao.CDS_V_RelPlanPagtoDES_BANCO.AsString:=DMSalao.CDS_V_PagtoProfDES_BANCO.AsString;

        DMSalao.CDS_V_RelPlanPagtoNUM_AGENCIA.AsString:=DMSalao.CDS_V_PagtoProfNUM_AGENCIA.AsString;
        DMSalao.CDS_V_RelPlanPagtoNUM_CONTA.AsString:=DMSalao.CDS_V_PagtoProfNUM_CONTA.AsString;

        DMSalao.CDS_V_RelPlanPagto.Post;
      End; // If DMSalao.CDS_V_PagtosDebCred.Locate('CODPROF', DMSalao.CDS_V_PagtoProfCODIGO.AsString,[]) Then

      DMSalao.CDS_V_PagtoProf.Next;
    End; // While Not DMSalao.CDS_V_PagtoProf.Eof do
    DMSalao.CDS_V_PagtoProf.EnableControls;
    DMSalao.CDS_V_PagtosVendas.EnableControls;
    DMSalao.CDS_V_PagtosDebCred.EnableControls;
    DMSalao.CDS_V_PagtoProf.First;
    DMSalao.CDS_V_PagtosVendas.First;
  End; // If EdtPagtoCodPlan.Value=0 Then
  // ===========================================================================

  // ===========================================================================
  // Se For Consulta de Calculos Anteriores ====================================
  // ===========================================================================
  If EdtPagtoCodPlan.Value<>0 Then
  Begin
    // Busca Dados da Planilha de Pagamento em Consulta ========================
    MySql:=' SELECT p.cod_loja, p.cod_profissional Codigo, p.des_profissional nome,'+
           '        p.dta_fim_contrato fim_contrato, p.num_tecbiz,'+
           '        p.num_inss, p.per_inss,'+
           '        p.num_banco, p.des_banco, p.num_agencia, p.num_conta,'+
           '        u.des_login, p.dta_inclui'+
           ' FROM SAL_PLAN_PAGTO p, PS_USUARIOS u'+
           ' WHERE p.usu_inclui=u.cod_usuario'+
           ' AND   p.num_planilha='+VarToStr(EdtPagtoCodPlan.Value)+
           ' AND   p.cod_loja='+QuotedStr(FormatFloat('00',EdtPagtoCodLoja.AsInteger))+
           ' ORDER BY 2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    sUsuEmissao:=DMBelShop.CDS_Busca.FieldByName('Des_Login').AsString;
    sDtaEmissao:=DMBelShop.CDS_Busca.FieldByName('Dta_Inclui').AsString;

    DMSalao.CDS_V_PagtosVendas.First;
    DMSalao.CDS_V_PagtosVendas.DisableControls;
    DMSalao.CDS_V_PagtosDebCred.DisableControls;
    DMBelShop.CDS_Busca.First;
    DMBelShop.CDS_Busca.DisableControls;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin

      If DMSalao.CDS_V_PagtosDebCred.Locate('CODPROF', DMBelShop.CDS_Busca.FieldByName('CODIGO').AsString,[]) Then
      Begin
        DMSalao.CDS_V_RelPlanPagto.Append;

        If DMBelShop.CDS_Busca.FieldByName('NUM_BANCO').AsInteger=0 Then
         DMSalao.CDS_V_RelPlanPagtoTP_DEPOSITO.AsString:='DEPOSITOS: SEM CONTA CORRENTE'
        Else
         DMSalao.CDS_V_RelPlanPagtoTP_DEPOSITO.AsString:='DEPOSITOS: '+DMBelShop.CDS_Busca.FieldByName('DES_BANCO').AsString;

        DMSalao.CDS_V_RelPlanPagtoCOD_PROF.AsString:=DMBelShop.CDS_Busca.FieldByName('CODIGO').AsString;
        DMSalao.CDS_V_RelPlanPagtoDES_PROFISSIONAL.AsString:=DMBelShop.CDS_Busca.FieldByName('NOME').AsString;

        If Trim(DMBelShop.CDS_Busca.FieldByName('FIM_CONTRATO').AsString)<>'' Then
         DMSalao.CDS_V_RelPlanPagtoDTA_FIM_CONTRATO.AsString:=DMBelShop.CDS_Busca.FieldByName('FIM_CONTRATO').AsString;

        // Valor das Vendas ( zero para Supervisor)
        DMSalao.CDS_V_RelPlanPagtoVLR_VENDA.AsCurrency:=0;
        If DMBelShop.CDS_Busca.FieldByName('CODIGO').AsString<>sgCodSuperVisor Then
        Begin
          if DMSalao.CDS_V_PagtosVendas.Locate('COD_PROF;COD_PRODUTO;COD_COMPROV;NUM_DOCTO',
             VarArrayOf([DMBelShop.CDS_Busca.FieldByName('CODIGO').AsString,'','','']),[]) Then
           DMSalao.CDS_V_RelPlanPagtoVLR_VENDA.AsCurrency:=DMSalao.CDS_V_PagtosVendasVLR_TOTALITEM.AsCurrency;
        End; // If DMBelShop.CDS_Busca.FieldByName('CODIGO').AsString<>sgCodSuperVisor Then

        DMSalao.CDS_V_RelPlanPagtoVLR_COMISSAO.AsCurrency:=0;
        DMSalao.CDS_V_RelPlanPagtoVLR_BENEFICIO.AsCurrency:=0;
        DMSalao.CDS_V_RelPlanPagtoVLR_PLANOSAUDE.AsCurrency:=0;

        DMSalao.CDS_V_RelPlanPagtoNUM_TECBIZ.AsString:=DMBelShop.CDS_Busca.FieldByName('NUM_TECBIZ').AsString;
        DMSalao.CDS_V_RelPlanPagtoVLR_TECBIZ.AsCurrency:=0;

        DMSalao.CDS_V_RelPlanPagtoVLR_TAXAS.AsCurrency:=0;
        DMSalao.CDS_V_RelPlanPagtoVLR_VALES.AsCurrency:=0;

        DMSalao.CDS_V_RelPlanPagtoVLR_INSS.AsCurrency:=0;
        DMSalao.CDS_V_RelPlanPagtoNUM_INSS.AsString:=DMBelShop.CDS_Busca.FieldByName('NUM_INSS').AsString;
        DMSalao.CDS_V_RelPlanPagtoPER_INSS.AsCurrency:=0;
        If Trim(DMBelShop.CDS_Busca.FieldByName('PER_INSS').AsString)<>'' Then
         DMSalao.CDS_V_RelPlanPagtoPER_INSS.AsCurrency:=DMBelShop.CDS_Busca.FieldByName('PER_INSS').AsCurrency;

        DMSalao.CDS_V_RelPlanPagtoVLR_ARREDONDA.AsCurrency:=0;
        DMSalao.CDS_V_RelPlanPagtoVLR_DEPOSITO.AsCurrency:=0;

        DMSalao.CDS_V_RelPlanPagtoNUM_BANCO.AsString:=DMBelShop.CDS_Busca.FieldByName('NUM_BANCO').AsString;
        DMSalao.CDS_V_RelPlanPagtoDES_BANCO.AsString:=DMBelShop.CDS_Busca.FieldByName('DES_BANCO').AsString;

        DMSalao.CDS_V_RelPlanPagtoNUM_AGENCIA.AsString:=DMBelShop.CDS_Busca.FieldByName('NUM_AGENCIA').AsString;
        DMSalao.CDS_V_RelPlanPagtoNUM_CONTA.AsString:=DMBelShop.CDS_Busca.FieldByName('NUM_CONTA').AsString;

        DMSalao.CDS_V_RelPlanPagto.Post;
      End; // If DMSalao.CDS_V_PagtosDebCred.Locate('CODPROF', DMBelShop.CDS_Busca.FieldByName('CODIGO').AsString,[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMSalao.CDS_V_PagtosVendas.EnableControls;
    DMSalao.CDS_V_PagtosDebCred.EnableControls;
    DMSalao.CDS_V_PagtosVendas.First;

    DMBelShop.CDS_Busca.EnableControls;
    DMBelShop.CDS_Busca.Close;
  End; // If EdtPagtoCodPlan.Value<>0 Then
  // ===========================================================================

  // Busca Debitos =============================================================
  DMSalao.CDS_V_PagtosDebCred.First;
  DMSalao.CDS_V_PagtosDebCred.DisableControls;
  While Not DMSalao.CDS_V_PagtosDebCred.Eof do
  Begin
    sCodProf:=DMSalao.CDS_V_PagtosDebCredCODPROF.AsString;

    If Trim(sCodProf)<>'' Then
    Begin
      If DMSalao.CDS_V_RelPlanPagto.Locate('COD_PROF',sCodProf,[]) Then
      Begin
        DMSalao.CDS_V_RelPlanPagto.Edit;

        // 7 - Valor da Comissão
        If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=7 Then
         DMSalao.CDS_V_RelPlanPagtoVLR_COMISSAO.AsCurrency:=
                              DMSalao.CDS_V_RelPlanPagtoVLR_COMISSAO.AsCurrency+
                              DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsCurrency;

        // 10 - Beneficios
        If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=10 Then
         DMSalao.CDS_V_RelPlanPagtoVLR_BENEFICIO.AsCurrency:=
                              DMSalao.CDS_V_RelPlanPagtoVLR_BENEFICIO.AsCurrency+
                              DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsCurrency;

        // 3 - Valor do Plano de Saude
        If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=3 Then
         DMSalao.CDS_V_RelPlanPagtoVLR_PLANOSAUDE.AsCurrency:=
                            DMSalao.CDS_V_RelPlanPagtoVLR_PLANOSAUDE.AsCurrency+
                            DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsCurrency;

        // 5 - Valor do TecBiz
        If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=5 Then
         DMSalao.CDS_V_RelPlanPagtoVLR_TECBIZ.AsCurrency:=
                               DMSalao.CDS_V_RelPlanPagtoVLR_TECBIZ.AsCurrency+
                               DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsCurrency;

        // 4 - Valor das Taxas
        If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=4 Then
         DMSalao.CDS_V_RelPlanPagtoVLR_TAXAS.AsCurrency:=
                               DMSalao.CDS_V_RelPlanPagtoVLR_TAXAS.AsCurrency+
                               DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsCurrency;

        // 1 - Valor dos Vales
        // 6 - Arredondamento Anterior
        If (DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger in [1,6]) Then
         DMSalao.CDS_V_RelPlanPagtoVLR_VALES.AsCurrency:=
                               DMSalao.CDS_V_RelPlanPagtoVLR_VALES.AsCurrency+
                               DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsCurrency;

        // 2 -  Valor da Contribuição de INSS
        If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=2 Then
         DMSalao.CDS_V_RelPlanPagtoVLR_INSS.AsCurrency:=
                               DMSalao.CDS_V_RelPlanPagtoVLR_INSS.AsCurrency+
                               DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsCurrency;

        // Valor do Arredondamento Atual
        If DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger=8 Then
         DMSalao.CDS_V_RelPlanPagtoVLR_ARREDONDA.AsCurrency:=
                             DMSalao.CDS_V_RelPlanPagtoVLR_ARREDONDA.AsCurrency+
                             DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsCurrency;

        // CREDITOS
        // 7 - Valor da Comissão
        // 8 - Valor do Arredondamento Atual
        // 10 - Valor dos Beneficios
        If (DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger in [7,8,10]) Then
         DMSalao.CDS_V_RelPlanPagtoVLR_DEPOSITO.AsCurrency:=
                              DMSalao.CDS_V_RelPlanPagtoVLR_DEPOSITO.AsCurrency+
                              DMSalao.CDS_V_PagtosDebCredVLR_CREDITO.AsCurrency;

        // DEBITOS
        // 1 - Valor dos Vales
        // 2 - Valor da Contribuição de INSS
        // 3 - Valor do Plano de Saude
        // 4 - Valor das Taxas
        // 5 - Valor do TecBiz
        // 6 - Arredondamento Anterior
        If (DMSalao.CDS_V_PagtosDebCredTP_DOC.AsInteger in [1..6]) Then
         DMSalao.CDS_V_RelPlanPagtoVLR_DEPOSITO.AsCurrency:=
                          DMSalao.CDS_V_RelPlanPagtoVLR_DEPOSITO.AsCurrency+
                          (DMSalao.CDS_V_PagtosDebCredVLR_DEBITO.AsCurrency*-1);

        DMSalao.CDS_V_RelPlanPagto.Post;
     End; // If DMSalao.CDS_V_RelPlanPagto.Locate('COD_PROF',sCodProf,[]) Then

    End; // If Trim(DMSalao.CDS_V_PagtosDebCredCODPROF.AsString)<>'' Then

    DMSalao.CDS_V_PagtosDebCred.Next;
  End; // While Not DMSalao.CDS_V_PagtosDebCred.Eof do
  DMSalao.CDS_V_PagtosDebCred.EnableControls;

  DMSalao.CDS_V_PagtosDebCred.First;

  // Imprime Relatório =========================================================
  With DMRelatorio.RelVisual do
  Begin
    ClientDataSet:=DMSalao.CDS_V_RelPlanPagto;
    Destino:=toVisualiza;
    Orientacao:=toPaisagem;

//OdirApagar - 29/09/2015
//    If Not Ts_PagtoPlanilha.TabVisible Then
    If Bt_PagtoDebCredImprime.Caption='Planilha Conferência' Then
     Begin
       ImprimirTarjaCinza:=False;
       ImprimirVisto:=False;
       Cabecalho1Esquerda:='';
       Cabecalho1Centro  :='========= SIMPLES CONFERÊNCIA =========';
       Cabecalho2Esquerda:='RELATÓRIO DE PAGAMENTOS de Profissionais de Salão';
     End
    Else
     Begin
       ImprimirTarjaCinza:=False;
       ImprimirVisto:=True;
       Cabecalho1Centro  :='';
       Cabecalho1Esquerda:='RELATÓRIO DE PAGAMENTOS de Profissionais de Salão';
       Cabecalho2Esquerda:='=================================================';
     End; // If Not Ts_PagtoPlanilha.TabVisible Then

    Cabecalho1Direita :=DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
    Cabecalho2Direita :='#Pag';
    Cabecalho3Direita :='Gerado em '+sDtaEmissao+' Por: '+sUsuEmissao;
    Cabecalho3Esquerda:='Bel_'+FormatFloat('00',StrToInt(EdtPagtoCodLoja.text))+' - '+EdtPagtoDesLoja.Text;
    Cabecalho3Centro  :='Período de '+F_Troca('.','/',F_Troca('-','/',sgPeriodoIni))+' Até '+F_Troca('.','/',F_Troca('-','/',sgPeriodoFim));
//odirapagar - 22/10/2015
//    Cabecalho3Centro  :='Período de '+F_Troca('.','/',F_Troca('-','/',sgDtaI))+' Até '+F_Troca('.','/',F_Troca('-','/',sgDtaF));

    Fonte.Assign(DMRelatorio.FontDialog.Font);

    DefinicaoCampos.Clear;
    DefinicaoCampos.Add('D0;70;E;;DES_PROFISSIONAL;Profissional');
//    DefinicaoCampos.Add('D0;26;D;;DTA_FIM_CONTRATO;Fim Contrato');
    DefinicaoCampos.Add('D1;22;D;#,##0.00;VLR_VENDA;Vendas');
    DefinicaoCampos.Add('D1;22;D;#,##0.00;VLR_COMISSAO;Comissões');
    DefinicaoCampos.Add('D1;22;D;#,##0.00;VLR_BENEFICIO;Benefícios');
    DefinicaoCampos.Add('D1;20;D;#,##0.00;VLR_PLANOSAUDE;Pl.Saúde');
//    DefinicaoCampos.Add('D0;30;D;;NUM_TECBIZ;Nº TecBiz');
    DefinicaoCampos.Add('D1;20;D;#,##0.00;VLR_TECBIZ;TecBiz');
    DefinicaoCampos.Add('D1;20;D;#,##0.00;VLR_TAXAS;Taxas');
    DefinicaoCampos.Add('D1;20;D;#,##0.00;VLR_VALES;Vales');
    DefinicaoCampos.Add('D1;20;D;#,##0.00;VLR_INSS;INSS');
//    DefinicaoCampos.Add('D0;25;D;;NUM_INSS;Nº INSS');
//    DefinicaoCampos.Add('D0;15;D;#,##0.00;PER_INSS;% INSS');
    DefinicaoCampos.Add('D1;20;D;#,##0.00;VLR_ARREDONDA;Arredonda');
    DefinicaoCampos.Add('D1;22;D;#,##0.00;VLR_DEPOSITO;VR LIQUIDO');
//    DefinicaoCampos.Add('D0;60;E;;NUM_BANCO;Nº Banco');
//    DefinicaoCampos.Add('D0;30;D;;DES_BANCO;Descr. Banco');
    DefinicaoCampos.Add('D0;10;D;;NUM_AGENCIA;Agência');
    DefinicaoCampos.Add('D0;30;D;;NUM_CONTA;Nº C/Corrente');

    // Quebra de Grupo
    DefinicaoCampos.Add('G1;100;E;;TP_DEPOSITO;');
    DefinicaoCampos.Add('G1;60;E;;NUM_BANCO;Nº Banco :');
    Execute;
  End; // With DMRelatorio.RelVisual do

  DMSalao.CDS_V_RelPlanPagto.Close;

  // Retorna ===================================================================
  Rb_PagtoDebCredSintetico.Checked:=True;
  Rb_PagtoDebCredSinteticoClick(Self);

  Rb_PagtoVendasSintetico.Checked:=True;
  Rb_PagtoVendasSinteticoClick(Self);

end;

procedure TFrmSalao.Cbx_CadProfSitPrevidenciaChange(Sender: TObject);
begin
  Ckb_CadProfINSSCobrar.Checked:=False;
  If Cbx_CadProfSitPrevidencia.ItemIndex=0 Then
   Ckb_CadProfINSSCobrar.Checked:=True;

  Ckb_CadProfINSSCobrarClick(Self);
end;

procedure TFrmSalao.Cbx_CadProfSitPrevidenciaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Cbx_CadProfSitPrevidenciaChange(Self);
end;

procedure TFrmSalao.Bt_ProfPlanoSaudeArquivoClick(Sender: TObject);
Var
  OpenDialog: TOpenDialog;
  i, ii: Integer;
  b: Boolean;
  s: String;
begin

  // Limpa StringGrid
  LimpaStringGrid(Strg_ProfPlanoSaudeImpArquivo);
  Lbx_ProfPlanoSaudeImpArqSel.Items.Clear;

  OpenDialog := TOpenDialog.Create(Self);
  With OpenDialog do
  Begin
    Options := [ofAllowMultiSelect , ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
    DefaultExt := 'xls;xlsx';
    Filter := 'Arquivo Excel (*.xls;*.xlsx)|*.xls;*.xlsx';
    FilterIndex := 1;
    Title := 'Busca Plano Saúde.Excel';
          
    if Execute then
     Begin
       If EdtProfPlanoSaudePastaArquivo.Text='' Then
        EdtProfPlanoSaudePastaArquivo.Text:=ExtractFilePath(OpenDialog.FileName);
        
       If EdtProfPlanoSaudePastaArquivo.Text<>ExtractFilePath(OpenDialog.FileName) Then
        Lbx_ProfPlanoSaudeImpArqSel.Items.Clear;

       // Seleciona os Arquivos ================================================
       for i:=0 to OpenDialog.Files.Count-1 do
       Begin
         s:=ExtractFileName(OpenDialog.Files[i]);
         b:=True;
         For ii:=0 to Lbx_ProfPlanoSaudeImpArqSel.Items.Count-1 do
         Begin
           If Lbx_ProfPlanoSaudeImpArqSel.Items[ii]=s Then
           Begin
             b:=False;
             Break;
           End;
         End; // For ii:=0 to Lbx_ProfPlanoSaudeImpArqSel.Items.Count-1 do

         If b Then
          Lbx_ProfPlanoSaudeImpArqSel.Items.Add(s);
       End; // for i:=0 to Files.Count-1 do
     End
    else // if Execute then
     begin
       Free;
       Exit;
     end; // if Execute then
  End; // With OpenDialog do
end;

procedure TFrmSalao.Bt_ProfPlanoSaudeImpArquivoClick(Sender: TObject);
Var
  b: Boolean;
begin
  PC_ProfPlanoSaude.TabIndex:=0;

  sgMensagem:='O ARQUIVO PLANO DE SAÚDE, A SER IMPORTADO, DEVE SER:'+cr+cr+
              ' - Arquivo em Excel:'+cr+
              '          - Extensão "XLS" ou "XLSX"'+cr+cr+
              ' - Leiaute:'+cr+
              '          - Primeira  Coluna: CAD_NOME'+cr+ // TITULAR
              '          - Segunda   Coluna: CAD_CPF'+cr+
              '          - Terceira  Coluna: CAD_NOME1'+cr+
              '          - Quarta    Coluna: PARENTESCO'+cr+
              '          - Quinta    Coluna: VALOR'+cr+
              '          - Sexta     Coluna: PLA_DESCRICAO'+cr+cr+
              ' AS INFORMAÇÕES ESTÃO CORRETAS ??';

  If Application.MessageBox(PChar(sgMensagem), 'ATENÇÃO !!', 292)=IdNo Then
   Exit;

  Strg_ProfPlanoSaudeImpArquivo.SetFocus;

  If Lbx_ProfPlanoSaudeImpArqSel.Items.Count<1 Then
  Begin
    msg('Favor Informar a Pasta e Arquivo'+cr+'do Plano de Saúde !!','A');
    Bt_ProfPlanoSaudeArquivo.SetFocus;
    Exit;
  End;

  b:=True;
  While b do
  Begin
    bgSiga:=True;

    // Solicita Vencimento =======================================================
    sgDtaInicio:=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
    sgDtaFim:=InputBoxData('Plano de Saúde', 'Vencimento', '22/'+Copy(sgDtaInicio,4,3)+Copy(sgDtaInicio,7,4));

    If Trim(sgDtaFim)='' Then
     Exit;

    If Copy(sgDtaFim,1,2)<>'22' Then
    Begin
      msg(sgDtaFim+' - Dia NÃO Permitido para Cobrança'+cr+'de Plano de Saúde, deve ser, sempre,'+cr+'no dia 22  de Cada Mês!!','A');
      bgSiga:=False;
    End;

    If bgSiga Then
    Begin
      If StrToDate(sgDtaFim)<StrToDate(sgDtaInicio) Then
      Begin
        If msg(sgDtaFim+cr+'Data do Vencimento do Plano de Saúde,'+cr+'É Inferior a Data de Hoje !!'+cr+'Deseja Manté-la ??','C')=2 Then
        Begin
          bgSiga:=False;
        End;
      End;
    End;

    If bgSiga Then
    Begin
      sgDtaFim:=f_Troca('/','.',f_Troca('-','.',sgDtaFim));
      b:=False;
    End;
  End; // While b do

  If msg('A(s) Planinha(s) Selecionada(s) Esta(ão) CORRETA(S) ??','C')=2 Then
  Begin
    Bt_ProfPlanoSaudeArquivo.SetFocus;
    Exit;
  End;

  // Importa Plano de Saúde ====================================================
  ProfImportaPlanoSaude;
end;

procedure TFrmSalao.Strg_ProfPlanoSaudeImpArquivoDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  X, C, R :Integer;
begin
  // Ajusta Colunas para Direita
  C := ACol;
  R := ARow;
//  if (ACol > 1) and (ARow > 0) then
  If ACol =4 Then
  Begin
    With Sender as TStringGrid do
    Begin
      X := Rect.Left +(Rect.Right -Rect.Left) -Canvas.TextWidth(Cells[C, R]) -3;
      Canvas.TextRect(Rect, X, Rect.Top +2, Cells[C, R]);
    End;
  End;

end;

procedure TFrmSalao.PC_ProfMovtosRHChange(Sender: TObject);
Var
  wDia, wMes, wAno: Word;
  MySql: String;
begin

  CorSelecaoTabSheet(PC_ProfMovtosRH);

  // Contribuição INSS ou Taxa Sindicato =======================================
  If ((PC_ProfMovtosRH.ActivePage=Ts_ProfINSS) And (Ts_ProfINSS.CanFocus)) Or
     ((PC_ProfMovtosRH.ActivePage=Ts_ProfTaxaSindicato) And (Ts_ProfTaxaSindicato.CanFocus)) Then
  Begin
    Pan_ProfCalcularIT.Visible:=True;

    FechaTudoSalao;
    EdtINSS_PSCodLoja.Value:=0;
    EdtINSS_PSDesLoja.Clear;

    // Inicializa Mês/Ano de Competencia =========================================
    DecodeDate(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor), wAno, wMes, wDia);
    sMes1:=LongMonthNames[wMes];

    Cbx_INSS_PSMes.ItemIndex:=Cbx_INSS_PSMes.Items.IndexOf(sMes1);

    Cbx_INSS_PSMes.Enabled:=True;
    Cbx_INSS_PSMes.Color:=clWindow;

    EdtINSS_PSAno.Value:=wAno;

    // Contribuição INSS =======================================================
    If (PC_ProfMovtosRH.ActivePage=Ts_ProfINSS) And (Ts_ProfINSS.CanFocus) Then
    Begin
      Gb_INSS_PSLocaliza.Parent:=Ts_ProfINSS;
      sgINSS_PS:='I';
    End;

    Cbx_INSS_PSMesChange(Self);

    // Taxa Sindicato ==========================================================
    If (PC_ProfMovtosRH.ActivePage=Ts_ProfTaxaSindicato) And (Ts_ProfTaxaSindicato.CanFocus) Then
    Begin
      Gb_INSS_PSLocaliza.Parent:=Ts_ProfTaxaSindicato;
      sgINSS_PS:='S';

      MySql:= ' SELECT p.mes_cobranca_sindicato Mes FROM parametros p';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      Cbx_INSS_PSMes.ItemIndex:=Cbx_INSS_PSMes.Items.IndexOf(DMBelShop.CDS_BuscaRapida.FieldByName('Mes').AsString);
      Cbx_INSS_PSMesChange(Self);
      DMBelShop.CDS_BuscaRapida.Close;

      Cbx_INSS_PSMes.Enabled:=False;
      Cbx_INSS_PSMes.Color:=$00E0E0E0;
    End; // If (PC_ProfCobrancas.ActivePage=Ts_ProfTaxaSindicato) And (Ts_ProfTaxaSindicato.CanFocus) Then

    Try
      EdtINSS_PSCodLoja.SetFocus;
    Except
    End;
  End; //   If ((PC_ProfMovtosRH.ActivePage=Ts_ProfINSS) And (Ts_ProfINSS.CanFocus)) Or ((PC_ProfMovtosRH.ActivePage=Ts_ProfTaxaSindicato) And (Ts_ProfTaxaSindicato.CanFocus)) Then

  // TecBiz ====================================================================
  If (PC_ProfMovtosRH.ActivePage=Ts_ProfImpTecBiz) And (Ts_ProfImpTecBiz.CanFocus) Then
  Begin
    Pan_ProfCalcularIT.Visible:=False;

    PC_ProfTecBiz.TabIndex:=0;
    Strg_ProfTecBizImpArquivo.SetFocus;
  End;

  // Plano de Saude ============================================================
  If (PC_ProfMovtosRH.ActivePage=Ts_ProfImpPlanoSaude) And (Ts_ProfImpPlanoSaude.CanFocus) Then
  Begin
    Pan_ProfCalcularIT.Visible:=False;

    PC_ProfPlanoSaude.TabIndex:=0;
    Strg_ProfPlanoSaudeImpArquivo.SetFocus;
  End;

  // Benefícios ================================================================
  If (PC_ProfMovtosRH.ActivePage=Ts_ProfBeneficios) And (Ts_ProfBeneficios.CanFocus) Then
  Begin
    Pan_ProfCalcularIT.Visible:=False;

    PC_Beneficios.TabIndex:=0;
    EdtBenefCodLoja.SetFocus;
  End;
end;

procedure TFrmSalao.DtEdt_ProfTecBizDtaInicioPropertiesChange(Sender: TObject);
begin
  DMSalao.CDS_TecBizApres.Close;
end;

procedure TFrmSalao.PC_ProfPlanoSaudeChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_ProfPlanoSaude);

  DMSalao.CDS_PlanoSaudeApres.Close;

end;

procedure TFrmSalao.DtEdt_ProfPlanoSaudeDtaInicioPropertiesChange(Sender: TObject);
begin
  DMSalao.CDS_PlanoSaudeApres.Close;

end;

procedure TFrmSalao.Bt_ProfPlanoSaudeBuscarClick(Sender: TObject);
Var
  sDtaI, sDtaF: String;
  MySql: String;
begin

  Try
    StrToDate(DtEdt_ProfPlanoSaudeDtaInicio.Text);
  Except
    msg('Data de Início do Período Inválida !!','A');
    DtEdt_ProfPlanoSaudeDtaInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_ProfPlanoSaudeDtaFim.Text);
  Except
    msg('Data do Final do Período Inválida !!','A');
    DtEdt_ProfPlanoSaudeDtaFim.SetFocus;
    Exit;
  End;

  If StrToDate(DtEdt_ProfPlanoSaudeDtaInicio.Text)>StrToDate(DtEdt_ProfPlanoSaudeDtaFim.Text) Then
  Begin
    msg('Período Inválido !!','A');
    DtEdt_ProfPlanoSaudeDtaInicio.Text:='  /  /    ';
    DtEdt_ProfPlanoSaudeDtaFim.Text:='  /  /    ';
    DtEdt_ProfPlanoSaudeDtaInicio.SetFocus;
    Exit;
  End;

  Screen.Cursor:=crAppStart;

  sDtaI:=f_Troca('/','.',DtEdt_ProfPlanoSaudeDtaInicio.Text);
  sDtaI:=f_Troca('-','.',sDtaI);
  sDtaF:=f_Troca('/','.',DtEdt_ProfPlanoSaudeDtaFim.Text);
  sDtaF:=f_Troca('-','.',sDtaF);

  MySql:=' SELECT pl.cod_pessoa, pf.des_profissional, pl.des_docto,'+
         ' pl.dta_vencimento, pl.vlr_apagar,'+
         ' CASE pl.vlr_pago'+
         '   WHEN 0 THEN ''NAO'''+
         '   ELSE ''SIM'''+
         ' END Pagto,'+
         ' pl.des_arquivo'+

         ' FROM ps_vales_pessoas pl, sal_profissionais pf'+
         ' WHERE pl.cod_loja=pf.cod_loja'+
         ' AND   pl.cod_pessoa=pf.cod_profissional'+
         ' AND   pl.tp_pessoa=1'+
         ' AND   pl.ind_debcred='+QuotedStr('P')+
         ' AND   pl.dta_vencimento BETWEEN '+QuotedStr(sDtaI)+' AND '+QuotedStr(sDtaF)+
         ' ORDER BY pf.des_profissional, pl.dta_vencimento, pl.des_arquivo, pl.num_seq';
  DMSalao.CDS_PlanoSaudeApres.Close;
  DMSalao.SDS_PlanoSaudeApres.CommandText:=MySql;
  DMSalao.CDS_PlanoSaudeApres.Open;
  Screen.Cursor:=crDefault;

  If Trim(DMSalao.CDS_PlanoSaudeApresCOD_PESSOA.AsString)='' Then
  Begin
    DMSalao.CDS_PlanoSaudeApres.Close;
    msg('Sem Plano de Saúde no Período !!','A');
    Exit;
  End;

  Dbg_ProfPlanoSaudeImportados.SetFocus;
end;

procedure TFrmSalao.Ts_PagtoPlanilhaShow(Sender: TObject);
begin
  Bt_PagtoDebCredImprime.Caption:='Planilha Pagamento';
  Bt_PagtoDebCredImprime.Parent:=Pan_PlanilhaBottom;

end;

procedure TFrmSalao.ApplicationEventosMessage(var Msg: tagMSG; var Handled: Boolean);
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

procedure TFrmSalao.Dbg_ProfissionaisEnter(Sender: TObject);
begin
  // Usado em Oustro DBGrids (ERRO) Acerta Rolagem do Mouse ====================
  AcertaRolagemDBGid(Sender);
end;

procedure TFrmSalao.Dbg_ProfPlanoSaudeImportadosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If (Column.FieldName='PAGTO') Then
  Begin
    If DMSalao.CDS_PlanoSaudeApresPAGTO.AsString='SIM' Then
    Begin
      Dbg_ProfPlanoSaudeImportados.Canvas.Font.Style:=[fsBold];
      Dbg_ProfPlanoSaudeImportados.Canvas.Font.Color:=clWhite;
      Dbg_ProfPlanoSaudeImportados.Canvas.Brush.Color:=clBlue;

      Dbg_ProfPlanoSaudeImportados.Canvas.FillRect(Rect);
      Dbg_ProfPlanoSaudeImportados.DefaultDrawDataCell(Rect,Column.Field,state);
    End;
    DMSalao.CDS_PlanoSaudeApresPAGTO.Alignment:=taCenter;
  End;

end;

procedure TFrmSalao.Dbg_ProfTecBizImportadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If (Column.FieldName='IND_PAGO') Then
  Begin
    If DMSalao.CDS_TecBizApresIND_PAGO.AsString='SIM' Then
    Begin
      Dbg_ProfTecBizImportados.Canvas.Font.Style:=[fsBold];
      Dbg_ProfTecBizImportados.Canvas.Font.Color:=clWhite;
      Dbg_ProfTecBizImportados.Canvas.Brush.Color:=clBlue;

      Dbg_ProfTecBizImportados.Canvas.FillRect(Rect);
      Dbg_ProfTecBizImportados.DefaultDrawDataCell(Rect,Column.Field,state);
    End;
    DMSalao.CDS_TecBizApresIND_PAGO.Alignment:=taCenter;
  End;


end;

procedure TFrmSalao.OutLook_ProfMovtosRHClick(Sender: TObject);
Var
  ii, i: Integer;
begin
  For i:=0 to OutLook_ProfMovtosRH.Pages.Count-1 do
  Begin
    For ii:=0 to OutLook_ProfMovtosRH.Pages[i].Buttons.Count-1 do
    Begin
      OutLook_ProfMovtosRH.Pages[i].Buttons[ii].Down:=False;
    End;
  End; // For i:=0 to OutLook_ProfMovtosRH.Pages.Count-1 do
end;

procedure TFrmSalao.OutLook_ProfMovtosRHButtonClick(Sender: TObject; Index: Integer);
begin
  OutLook_ProfMovtosRH.Pages[OutLook_ProfMovtosRH.ActivePageIndex].Buttons[index].Down:=True;
end;

procedure TFrmSalao.OutLook_ProfMovtosRHPages0Buttons0Click(Sender: TObject);
begin
  Strg_ProfTecBizImpArquivo.ColWidths[2]:=500;

  // Desabilita Todas as TabSheets e Botoes de Calculo =========================
  DesabilitaTodasTabSheets(PC_ProfMovtosRH);

  // Habilita TabSheet (TECBIZ) ================================================
  Ts_ProfImpTecBiz.TabVisible:=True;
  PC_ProfMovtosRH.ActivePage:=Ts_ProfImpTecBiz;
  PC_ProfMovtosRHChange(Self);

  sgDtaI:='';
  sgDtaF:='';

  OutLook_ProfMovtosRH.Enabled:=False;
end;

procedure TFrmSalao.Bt_MovtosRHRetornarClick(Sender: TObject);
begin
  // Desabilita Todas as TabSheets e Botoes de Calculo =========================
  DesabilitaTodasTabSheets(PC_ProfMovtosRH);

  Bt_MovtosRHRetornar.Visible:=False;
  Bt_Fechar.Visible:=True;

  OutLook_ProfMovtosRHClick(Self);
  OutLook_ProfMovtosRH.Enabled:=True;
  OutLook_ProfMovtosRH.SetFocus;

  FechaTudoSalao;
end;

procedure TFrmSalao.OutLook_ProfMovtosRHPages0Buttons1Click(Sender: TObject);
begin
  // Desabilita Todas as TabSheets e Botoes de Calculo =========================
  DesabilitaTodasTabSheets(PC_ProfMovtosRH);

  // Habilita TabSheet (PLANO DE SAUDE) ========================================
  Ts_ProfImpPlanoSaude.TabVisible:=True;
  PC_ProfMovtosRH.ActivePage:=Ts_ProfImpPlanoSaude;
  PC_ProfMovtosRHChange(Self);

  sgDtaI:='';
  sgDtaF:='';

  Bt_MovtosRHRetornar.Visible:=True;
  Bt_Fechar.Visible:=False;

  OutLook_ProfMovtosRH.Enabled:=False;

end;

procedure TFrmSalao.OutLook_ProfMovtosRHPages1Buttons0Click(Sender: TObject);
Var
  wDia, wMes, wAno: Word;
begin
  // Desabilita Todas as TabSheets e Botoes de Calculo =========================
  DesabilitaTodasTabSheets(PC_ProfMovtosRH);

  // Desabilita Botoes de Calculo ==============================================
  Bt_ProfINSSTXSCalcular.Visible:=True;
  Bt_ProfINSSTXSExcel.Visible:=True;
  Bt_ProfINSSTXSClipboard.Visible:=True;

  OutLook_ProfMovtosRH.Enabled:=False;

  // Habilita TabSheet (Contribuição INSS) =====================================
  Ts_ProfINSS.TabVisible:=True;
  PC_ProfMovtosRH.ActivePage:=Ts_ProfINSS;
  PC_ProfMovtosRHChange(Self);

  // Inicializa Mês/Ano de Competencia =========================================
  DecodeDate(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor), wAno, wMes, wDia);
  sgMes:=LongMonthNames[wMes];

  Cbx_INSS_PSMes.ItemIndex:=Cbx_INSS_PSMes.Items.IndexOf(sgMes);
  EdtINSS_PSAno.Value:=wAno;
  Cbx_INSS_PSMesChange(Self);

  sgDtaI:='';
  sgDtaF:='';
end;

procedure TFrmSalao.OutLook_ProfMovtosRHPages1Buttons1Click(Sender: TObject);
Var
  wDia, wMes, wAno: Word;
begin
  // Desabilita Todas as TabSheets e Botoes de Calculo =========================
  DesabilitaTodasTabSheets(PC_ProfMovtosRH);

  // Desabilita Botoes de Calculo ==============================================
  Bt_ProfINSSTXSCalcular.Visible:=True;
  Bt_ProfINSSTXSExcel.Visible:=True;
  Bt_ProfINSSTXSClipboard.Visible:=True;

  OutLook_ProfMovtosRH.Enabled:=False;

  // Inicializa Mês/Ano de Competencia =========================================
  DecodeDate(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor), wAno, wMes, wDia);
  sgMes:=LongMonthNames[wMes];

  Cbx_INSS_PSMes.ItemIndex:=Cbx_INSS_PSMes.Items.IndexOf(sgMes);
  EdtINSS_PSAno.Value:=wAno;
  Cbx_INSS_PSMesChange(Self);

  // Habilita TabSheet (Contribuição INSS) =====================================
  Ts_ProfTaxaSindicato.TabVisible:=True;
  PC_ProfMovtosRH.ActivePage:=Ts_ProfTaxaSindicato;
  PC_ProfMovtosRHChange(Self);

  sgDtaI:='';
  sgDtaF:='';
end;

procedure TFrmSalao.Bt_PagtoExcluirPlanilhaClick(Sender: TObject);
Var
  MySql: String;
  sCodLoja, sNrPlan, sDtaI, sDtaF, sDesAux: String;
begin

  If EdtPagtoCodLoja.Value=0 Then
  Begin
    msg('Favor Informara a Loja !!','A');
    EdtPagtoCodLoja.SetFocus;
    Exit;
  End;

  Dbg_PagtoProfissionais.SetFocus;

  // Busca Última Planilha =====================================================
  Screen.Cursor:=crAppStart;
  sNrPlan :='';
  sDtaI   :='';
  sDtaF   :='';
  sDesAux :='';
  sCodLoja:=FormatFloat('00',StrToInt(EdtPagtoCodLoja.text));
  MySql:=' SELECT'+
         ' ''Bel_''||SUBSTRING(t.des_aux FROM CHAR_LENGTH(t.des_aux)-1 FOR 2) Loja,'+
         ' t.cod_aux Planilha,'+
         ' SUBSTRING(t.des_aux FROM 1 FOR 10) DtaI,'+
         ' SUBSTRING(t.des_aux FROM 14 FOR 10) DtaF,'+
         ' Trim(t.des_aux) des_aux'+

         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux=7'+
         ' AND   t.des_aux1 IS NULL'+
         ' AND   SUBSTRING(t.des_aux FROM CHAR_LENGTH(t.des_aux)-1 FOR 2)='+QuotedStr(sCodLoja)+
         ' AND   t.cod_aux= (SELECT MAX(t1.cod_aux) cod_aux'+
         '                   FROM TAB_AUXILIAR t1'+
         '                   WHERE t1.tip_aux=7'+
         '                   AND   t1.des_aux1 IS NULL'+
         '                   AND   SUBSTRING(t1.des_aux FROM CHAR_LENGTH(t1.des_aux)-1 FOR 2)='+QuotedStr(sCodLoja)+')';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  Screen.Cursor:=crDefault;
  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Planilha').AsString)='' Then
  Begin
    DMBelShop.CDS_BuscaRapida.Close;
    msg('Sem Planilha a Excluir !!','A');
    Exit;
  End;

  sNrPlan :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Planilha').AsString);
  sDtaI   :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('DtaI').AsString);
  sDtaF   :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('DtaF').AsString);
  sDesAux:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Des_Aux').AsString);
  sgMensagem:='TOTAIS A EXCLUIR';

  DMBelShop.CDS_BuscaRapida.Close;

  OdirPanApres.Caption:='AGUARDE !! Localizando Planilha Número: '+sNrPlan+' do Período de '+sDtaI+' a '+sDtaF;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // TECBIZ - Total de Lancamentos =============================================
  MySql:=' SELECT COUNT(t.cod_tecbiz) Total'+
         ' FROM PS_TECBIZ t'+
         ' WHERE t.dta_ini_periodo>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaI)))+
         ' AND   t.dta_fim_periodo<='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaF)))+
         ' AND   t.ind_pago=''SIM'''+
         ' AND EXISTS (SELECT 1'+
         ' FROM SAL_PLAN_DEBCRED db'+
         ' WHERE db.num_seq=t.num_seq'+
         ' AND   db.cod_loja='+QuotedStr(sCodLoja)+
         ' AND   db.num_planilha='+sNrPlan+')';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgMensagem:=sgMensagem+cr+cr+'Total de Lançamentos TECBIZ ==>> '+DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // INSS - Total de Lancamentos ===============================================
  MySql:=' SELECT COUNT(i.cod_pessoa) Total'+
         ' FROM PS_VALES_PESSOAS i'+
         ' WHERE i.ind_debcred=''I'''+
         ' AND   i.vlr_pago>0'+
         ' AND   i.cod_loja='+QuotedStr(sCodLoja)+
         ' AND   i.num_docto_pagto='+sNrPlan;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgMensagem:=sgMensagem+cr+'Total de Lançamentos INSS ==>> '+DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // PLANO SAUDE - Total de Lancamentos ========================================
  MySql:=' SELECT COUNT(p.cod_pessoa) Total'+
         ' FROM PS_VALES_PESSOAS p'+
         ' WHERE p.ind_debcred=''P'''+
         ' AND   p.vlr_pago>0'+
         ' AND   p.cod_loja='+QuotedStr(sCodLoja)+
         ' AND   p.num_docto_pagto='+sNrPlan;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgMensagem:=sgMensagem+cr+'Total de Lançamentos PLANO DE SAÚDE ==>> '+DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // TAXA SINDICATO - Total de Lancamentos =====================================
  MySql:=' SELECT COUNT(s.cod_pessoa) Total'+
         ' FROM PS_VALES_PESSOAS s'+
         ' WHERE s.ind_debcred=''S'''+
         ' AND   s.vlr_pago>0'+
         ' AND   s.cod_loja='+QuotedStr(sCodLoja)+
         ' AND   s.num_docto_pagto='+sNrPlan;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgMensagem:=sgMensagem+cr+'Total de Lançamentos TAXA SINDICATO ==>> '+DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // VALES - Total de Lancamentos ==============================================
  MySql:=' SELECT COUNT(v.cod_pessoa) Total'+
         ' FROM PS_VALES_PESSOAS v'+
         ' WHERE v.ind_debcred=''D'''+
         ' AND   v.vlr_pago>0'+
         ' AND   v.cod_loja='+QuotedStr(sCodLoja)+
         ' AND   v.num_docto_pagto='+sNrPlan;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgMensagem:=sgMensagem+cr+'Total de Lançamentos VALES ==>> '+DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // BENEFICIOS - Total de Lancamentos =========================================
  MySql:=' SELECT COUNT(v.cod_pessoa) Total'+
         ' FROM PS_VALES_PESSOAS v'+
         ' WHERE v.ind_debcred=''B'''+
         ' AND   v.vlr_pago>0'+
         ' AND   v.cod_loja='+QuotedStr(sCodLoja)+
         ' AND   v.num_docto_pagto='+sNrPlan;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgMensagem:=sgMensagem+cr+'Total de Lançamentos BENEFÍCIOS ==>> '+DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // SAL_PLAN_VENDAS - Total de Lancamentos de Venda para Comissão =============
  MySql:=' SELECT COUNT(pv.cod_profissional) Total'+
         ' FROM SAL_PLAN_VENDAS pv'+
         ' WHERE TRIM(COALESCE(pv.cod_profissional,''''))<>'''''+
         ' AND   TRIM(COALESCE(pv.num_docto,''''))<>'''''+
         ' AND   pv.cod_loja='+QuotedStr(sCodLoja)+
         ' AND   pv.num_planilha='+sNrPlan;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgMensagem:=sgMensagem+cr+'Total de Lancamentos de VENDA PARA COMISSÃO ==>> '+DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // SAL_PLAN_DEBCRED - Total de Lancamentos de Debitos e Creditos =============
  MySql:=' SELECT COUNT(dc.cod_loja) Total'+
         ' FROM SAL_PLAN_DEBCRED dc'+
         ' WHERE dc.codprof<>''0'''+
         ' AND   dc.num_planilha='+sNrPlan+
         ' AND   dc.cod_loja='+QuotedStr(sCodLoja);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgMensagem:=sgMensagem+cr+'Total de Lancamentos de DÉBITOS/CRÉDITOS ==>> '+DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // SAL_PLAN_PAGTO - Total de Profisionais na Planilha Pagto ==================
  MySql:=' SELECT COUNT(pp.cod_loja) Total'+
         ' FROM SAL_PLAN_PAGTO pp'+
         ' WHERE pp.num_planilha='+sNrPlan+
         ' AND   pp.cod_loja='+QuotedStr(sCodLoja);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgMensagem:=sgMensagem+cr+'Total de PROFISSIONAIS na Planilha Pagto ==>> '+DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // Total de Profissinais da Planilha Pagto ===================================
  MySql:=' SELECT'+
         ' CASE'+
         '   WHEN pf.ind_ativo=''NAO'' THEN'+
         '     pf.cod_profissional'+
         '   ELSE'+
         '    ''0'''+
         ' END Cod_Prof_Inativo,'+
         ' pf.ind_ativo, COUNT(pf.cod_profissional) total'+
         ' FROM SAL_PROFISSIONAIS pf'+
         ' WHERE pf.cod_loja='+QuotedStr(sCodLoja)+
         ' AND   pf.dta_periodo_ini_cal='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaI)))+
         ' AND   pf.dta_periodo_fim_cal='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaF)))+
         ' GROUP BY 1,2';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgMensagem:=sgMensagem+cr+#9+'Cod Prof Inativo'+#9+'Ativo'+#9+'Total';

  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    sgMensagem:=sgMensagem+cr+#9+#9+DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Prof_Inativo').AsString+#9+
                                 DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Ativo').AsString+#9+
                                 DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsString;

    DMBelShop.CDS_BuscaRapida.Next;
  End;
  DMBelShop.CDS_BuscaRapida.Close;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  sgMensagem:=sgMensagem+cr+cr+'DESEJA RELAMENTE EXCLUIR ESTA PLANILHA ??';
  If Application.MessageBox(PChar(sgMensagem), PChar('DADOS DA PLANILHA '+sNrPlan+' A EXCLUIR'), 292) = IdNo Then
    Exit;

  sgMensagem:='';

  // Exclui Planilha ===========================================================
  if ProfPagtoExcluiPlanilha(sCodLoja, sNrPlan, sDesAux, sDtaI, sDtaF) Then
  Begin
    EdtPagtoCodLoja.AsInteger:=StrToInt(sCodLoja);
    EdtPagtoCodLojaExit(Self);
    msg('Exclusão da Palnilha de Pagto Nº '+sNrPlan+cr+cr+'Efetuada com SUCESSO !!','A');
  End;

end;

procedure TFrmSalao.Bt_CadProfVerificaCadClick(Sender: TObject);
begin
  If bgDrawColumnCell Then
   Begin
     bgDrawColumnCell:=False;
     Bt_CadProfVerificaCad.Caption:='Verificar Cadastro';
   End
  Else
   Begin
     OdirPanApres.Caption:='AGUARDE !! Verificando Cadastros...';
     OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
     OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSalao.Width-OdirPanApres.Width)/2));
     OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSalao.Height-OdirPanApres.Height)/2))-20;
     OdirPanApres.Visible:=True;
     Refresh;

     Screen.Cursor:=crAppStart;
     bgDrawColumnCell:=True;
     DMSalao.CDS_Profissionais.Last;
     DMSalao.CDS_Profissionais.First;
     Bt_CadProfVerificaCad.Caption:='Não Verificar Cadastro';

     Screen.Cursor:=crDefault;
     OdirPanApres.Visible:=False;
     Refresh;
   End;
  Dbg_Profissionais.SetFocus;
end;

procedure TFrmSalao.OutLook_ProfMovtosRHPages2Buttons0Click(Sender: TObject);
begin
  FechaTudoSalao;
  
  OutLook_ProfMovtosRH.Enabled:=False;

  // Desabilita Todas as TabSheets e Botoes de Calculo =========================
  DesabilitaTodasTabSheets(PC_Salao);

  CorCaptionForm.FormCaption:='Vales de Profissionais de Salão';
  Ts_ProfVales.TabVisible:=True;

  DtEdt_ValesDtInicio.Text:=DateToStr(Now-365);
  DtEdt_ValesDtFim.Text:=DateToStr(now);

  BloqueioBotoes(FrmSalao, DMBelShop.CDS_Seguranca, igTagPermissao, Des_Login, bgInd_Admin);

  // Posiciona Painel Rodape
  Bt_Fechar.Parent:=Pan_ValesRodape;
  Bt_Fechar.Visible:=True;

  PC_SalaoChange(Self);

end;

procedure TFrmSalao.OutLook_ProfMovtosRHPages2Buttons1Click(Sender: TObject);
begin



  // Desabilita Todas as TabSheets e Botoes de Calculo =========================
  DesabilitaTodasTabSheets(PC_ProfMovtosRH);

  OutLook_ProfMovtosRH.Enabled:=False;

  // Habilita TabSheet (BENEFICIOS) ============================================
  Ts_ProfBeneficios.TabVisible:=True;
  PC_ProfMovtosRH.ActivePage:=Ts_ProfBeneficios;
  PC_ProfMovtosRHChange(Self);
  PC_BeneficiosChange(Self);

end;

procedure TFrmSalao.PC_BeneficiosChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Beneficios);

  FechaTudoSalao;

  If (PC_Beneficios.ActivePage=Ts_Beneficios) And (Ts_Beneficios.CanFocus) Then
  Begin
    EdtBenefCodLoja.Clear;
    EdtBenefDesLoja.Clear;
    EdtBenefCodLoja.SetFocus;
  End;

  If (PC_Beneficios.ActivePage=Ts_BeneficiosManut) And (Ts_BeneficiosManut.CanFocus) Then
  Begin
    BeneficiosInicializaComponentes;

    EdtBenefManutCodLoja.Clear;
    EdtBenefManutCodProf.Clear;
    EdtBenefManutDesLoja.Clear;
    EdtBenefManutDesProf.Clear;

    Pan_BenefManutDados.Visible:=False;

    EdtBenefManutCodLoja.SetFocus;
  End; // If (PC_Beneficios.ActivePage=Ts_BeneficiosManut) And (Ts_BeneficiosManut.CanFocus) Then
end;

procedure TFrmSalao.Bt_BenefBuscarClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_Beneficios.SetFocus;
  
  MySql:=' SELECT'+
         ' ''Bel_''||b.cod_loja cod_loja,'+
         ' p.cod_profissional cod_prof, p.des_profissional profissional, p.ind_ativo Prof_Ativo,'+
         ' b.num_docto, b.des_docto, b.vlr_docto,'+
         ' b.dta_ini_beneficio, b.dta_fim_beneficio, b.dta_ult_geracao, b.dta_ult_pagto,'+
         ' CASE'+
         '   WHEN b.ind_uma_vez=''SIM'' THEN ''Unico'''+
         '   WHEN b.ind_diariamente=''SIM'' THEN ''Diariamente'''+
         '   WHEN b.ind_semanamente=''SIM'' THEN ''Semanalmente'''+
         '   WHEN b.ind_mensalmente=''SIM'' THEN ''Mensalmente'''+
         ' END Tipo_Pagto,'+
         ' CAST(CASE'+
         '         WHEN b.ind_uma_vez=''SIM'' THEN ''Somente Uma Vez'''+
         '         WHEN b.ind_diariamente=''SIM'' THEN ''Todos os Dias'''+
         '         WHEN b.ind_semanamente=''SIM'' THEN'+
         '            CASE'+
         '              WHEN (b.ind_dia_seg=''SIM'') AND (b.tip_vlr_apagar=0) THEN ''Toda a Segunda - Valor Integral'''+
         '              WHEN (b.ind_dia_seg=''SIM'') AND (b.tip_vlr_apagar=1) THEN ''Toda a Segunda - Valor Dia/Mês'''+
         '              WHEN (b.ind_dia_ter=''SIM'') AND (b.tip_vlr_apagar=0) THEN ''Toda a Terça - Valor Integral'''+
         '              WHEN (b.ind_dia_ter=''SIM'') AND (b.tip_vlr_apagar=1) THEN ''Toda a Terça - Valor Dia/Mês'''+
         '              WHEN (b.ind_dia_qua=''SIM'') AND (b.tip_vlr_apagar=0) THEN ''Toda a Quarta - Valor Integral'''+
         '              WHEN (b.ind_dia_qua=''SIM'') AND (b.tip_vlr_apagar=1) THEN ''Toda a Quarta - Valor Dia/Mês'''+
         '              WHEN (b.ind_dia_qui=''SIM'') AND (b.tip_vlr_apagar=0) THEN ''Toda a Quinta - Valor Integral'''+
         '              WHEN (b.ind_dia_qui=''SIM'') AND (b.tip_vlr_apagar=1) THEN ''Toda a Quinta - Valor Dia/Mês'''+
         '              WHEN (b.ind_dia_sex=''SIM'') AND (b.tip_vlr_apagar=0) THEN ''Toda a Sexta - Valor Integral'''+
         '              WHEN (b.ind_dia_sex=''SIM'') AND (b.tip_vlr_apagar=1) THEN ''Toda a Sexta - Valor Dia/Mês'''+
         '            END'+
         '         WHEN b.ind_mensalmente=''SIM'' THEN'+
         '            CASE'+
         '              WHEN b.ind_dia_seg=''SIM''  THEN ''Toda ''||b.des_posicao_dia||'' Segunda do Mês'''+
         '              WHEN b.ind_dia_ter=''SIM''  THEN ''Toda ''||b.des_posicao_dia||'' Terça do Mês'''+
         '              WHEN b.ind_dia_qua=''SIM''  THEN ''Toda ''||b.des_posicao_dia||'' Quarta do Mês'''+
         '              WHEN b.ind_dia_qui=''SIM''  THEN ''Toda ''||b.des_posicao_dia||'' Quinta do Mês'''+
         '              WHEN b.ind_dia_sex=''SIM''  THEN ''Toda ''||b.des_posicao_dia||'' Sexta do Mês'''+
         '            END'+
         ' END AS VARCHAR(60)) Situacao_Pagto,'+
         ' CASE b.ind_ativo'+
         '    WHEN ''S'' THEN ''SIM'''+
         '    ELSE ''NAO'''+
         ' END ativo'+
         
         ' FROM PS_BENEFICIOS_PESSOAS b, SAL_PROFISSIONAIS p'+
         ' WHERE b.cod_pessoa=p.cod_profissional'+
         ' AND b.cod_loja=p.cod_loja'+
         ' AND b.tp_pessoa=1';

         If EdtBenefCodLoja.Value<>0 Then
          MySql:= MySql+' AND b.Cod_Loja='+QuotedStr(FormatFloat('00',EdtBenefCodLoja.AsInteger));

           If Cbx_BenefSituacao.ItemIndex=0 Then MySql:=MySql+' AND b.ind_ativo='+QuotedStr('S');
           If Cbx_BenefSituacao.ItemIndex=1 Then MySql:=MySql+' AND b.ind_ativo='+QuotedStr('N');

  MySql:=
   MySql+' ORDER BY p.des_profissional, b.cod_loja';
  DMSalao.CDS_Beneficios.DisableControls;
  DMSalao.CDS_Beneficios.Close;
  DMSalao.SDS_Beneficios.CommandText:=MySql;
  DMSalao.CDS_Beneficios.Open;
  DMSalao.CDS_Beneficios.EnableControls;

  If Trim(DMSalao.CDS_BeneficiosCOD_LOJA.AsString)='' Then
  Begin
    msg('SEM Beneficios a Apresentar !!','A');
    DMSalao.CDS_Beneficios.Close;
    EdtBenefCodLoja.SetFocus;
    Exit;
  End;
  While Not DMSalao.CDS_Beneficios.Eof do
  Begin
     DMSalao.CDS_Beneficios.Next;
  End;
  DMSalao.CDS_Beneficios.First;

  Dbg_Beneficios.SetFocus;
end;

procedure TFrmSalao.Dbg_BeneficiosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if (DMSalao.CDS_BeneficiosATIVO.AsString='NAO') Then
    Begin
      Dbg_Beneficios.Canvas.Font.Color:=clWhite;
      Dbg_Beneficios.Canvas.Brush.Color:=clRed;
    end;

    Dbg_Beneficios.Canvas.FillRect(Rect);
    Dbg_Beneficios.DefaultDrawDataCell(Rect,Column.Field,state);

    DMSalao.CDS_BeneficiosCOD_LOJA.Alignment:=taCenter;
    DMSalao.CDS_BeneficiosCOD_PROF.Alignment:=taRightJustify;
    DMSalao.CDS_BeneficiosPROF_ATIVO.Alignment:=taCenter;
    DMSalao.CDS_BeneficiosNUM_DOCTO.Alignment:=taRightJustify;
    DMSalao.CDS_BeneficiosVLR_DOCTO.Alignment:=taRightJustify;
    DMSalao.CDS_BeneficiosDTA_INI_BENEFICIO.Alignment:=taCenter;
    DMSalao.CDS_BeneficiosDTA_FIM_BENEFICIO.Alignment:=taCenter;
    DMSalao.CDS_BeneficiosDTA_ULT_GERACAO.Alignment:=taCenter;
    DMSalao.CDS_BeneficiosDTA_ULT_PAGTO.Alignment:=taCenter;
    DMSalao.CDS_BeneficiosTIPO_PAGTO.Alignment:=taCenter;
    DMSalao.CDS_BeneficiosATIVO.Alignment:=taCenter;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmSalao.EdtBenefCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtBenefCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    EdtBenefDesLoja.Clear;

    DMSalao.CDS_Beneficios.Close;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From EMP_CONEXOES'+
           ' Where Ind_Ativo=''SIM'''+
           ' And COD_FILIAL='+QuotedStr(FormatFloat('00',EdtBenefCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('RAZAO_SOCIAL').AsString)='' Then
    Begin
      msg('Loja NÃO Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtBenefCodLoja.Clear;
      EdtBenefCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtBenefDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmSalao.Bt_BenefBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtBenefCodLoja.Clear;
  EdtBenefDesLoja.Clear;

  EdtBenefCodLoja.SetFocus;

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
    EdtBenefCodLoja.SetFocus;
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
     EdtBenefCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtBenefDesLoja.Text:=FrmPesquisa.EdtDescricao.Text;
     EdtBenefCodLojaExit(Self);
   End
  Else
   Begin
     EdtBenefCodLoja.Clear;
     EdtBenefDesLoja.Clear;
     EdtBenefCodLoja.SetFocus;
   End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmSalao.Dbg_BeneficiosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  b, bNome, bProcBeneficio: Boolean;
  sValor: String;
  iRecNo: Integer;
begin

  If DMSalao.CDS_Beneficios.IsEmpty Then
   Exit;

  sgTipo:=''; // I=Inativar  E=Excluir
  bProcBeneficio:=False;

  iRecNo:=DMSalao.CDS_Beneficios.RecNo;

  // Exclui Documento ==========================================================
  If Key=Vk_Delete Then
  Begin
    sgTipo:='';

    // Se Houver Data do Ultimo Pagto --------------------------
    If Trim(DMSalao.CDS_BeneficiosDTA_ULT_PAGTO.AsString)<>'' Then
    Begin
      msg('Impossível Excluir Este Documento !!'+cr+cr+'Pagamento Já Efetuado !!','A');
      Exit;
    End; // If Trim(DMSalao.CDS_BeneficiosDTA_ULT_PAGTO.AsString)<>'' Then

    if msg('Deseja Realmente Excluir o'+cr+
           'Documento Número '+DMSalao.CDS_BeneficiosNUM_DOCTO.AsString+cr+
           'do Profissional '+DMSalao.CDS_BeneficiosPROFISSIONAL.AsString+cr+
           'da Loja '+DMSalao.CDS_BeneficiosCOD_LOJA.AsString+' ???','C')=2 Then
     Exit;

    sgDtaFim:=DateToStr(DMSalao.CDS_BeneficiosDTA_INI_BENEFICIO.AsDateTime-1);
    sgTipo:='E';

    bProcBeneficio:=True;
  End; // If Key=Vk_Delete Then

  // Localiza Profissional =====================================================
  If Key=Vk_F4 Then
  Begin
    bNome:=False;
    sValor:='';
    b:=True;
    While b do
    Begin
      If InputQuery('Localizar Código/Nome','',sValor) then
       Begin
         Try
           StrToInt(sValor);
           sValor:=FormatFloat('000000',StrToInt(sValor));
           If Not DMSalao.CDS_Beneficios.Locate('COD_PROF', sValor,[]) Then
           Begin
             If Not LocalizaRegistro(DMSalao.CDS_Beneficios, 'COD_PROF', sValor) Then
              b:=False;
           End; // If Not DMSalao.CDS_Beneficios.Locate('COD_PROF', sValor,[]) Then
           Break;
         Except
           bNome:=True;
           If Not DMSalao.CDS_Beneficios.Locate('PROFISSIONAL', sValor,[]) Then
           Begin
             If Not LocalizaRegistro(DMSalao.CDS_Beneficios, 'PROFISSIONAL', sValor) Then
              b:=False;
           End; // If Not DMSalao.CDS_Beneficios.Locate('PROFISSIONAL', sValor,[]) Then
           Break;
         End;
       End
      Else // If InputQuery('Localizar Código/Nome','',sValor) then
       Begin
         Break;
       End; // If InputQuery('Localizar Código/Nome','',sValor) then
    End; // While b do

    If Not b Then
     Begin
       msg('Profissional Não Localizado !!','A');
       DMSalao.CDS_Beneficios.RecNo:=iRecNo;
     End
    Else
     Begin
       If bNome Then
        THackDBGridSalao(Dbg_Beneficios).SelectedIndex:=2
       Else
        THackDBGridSalao(Dbg_Beneficios).SelectedIndex:=1;
     End;
  End; // If Key=Vk_F4 Then

  // Altera Data de Final ======================================================
  If Key=Vk_F5 Then
  Begin
    bProcBeneficio:=True;

    If DMSalao.CDS_BeneficiosATIVO.AsString='NAO' Then
    Begin
      msg('Impossível Alterar !!'+cr+cr+'Documento Já ENCERRADO !!','A');
      Exit;
    End;

    b:=True;
    While b do
    Begin
      sgDtaFim:='';
      sgDtaFim:=InputBoxData('Benefícios', 'Data Final (SEM DATA Tecle 99/99/9999)', sgDtaFim, False);

      If sgDtaFim='' Then
       Break;

      If sgDtaFim='99/99/9999' Then
       sgDtaFim:='(Sem Final)';

      if msg('A Data Final do Documento '+sgDtaFim+cr+cr+'Esta Correta ??','C')=1 Then
       b:=False
    End; // While b do

    // Verifica Possibilidade de Processamento =================================
    If (sgDtaFim<>'') and (sgDtaFim<>'(Sem Final)') Then
    Begin
      sgTipo:='';

      // Se Inativa Docto -------------------------------------------
      If (DMSalao.CDS_BeneficiosDTA_INI_BENEFICIO.AsDateTime>StrToDateTime(sgDtaFim)) and (Trim(DMSalao.CDS_BeneficiosDTA_ULT_PAGTO.AsString)='') Then
      Begin
        If msg('Data Inicial: '+DMSalao.CDS_BeneficiosDTA_INI_BENEFICIO.AsString+cr+
               'Data Final  : '+sgDtaFim+cr+cr+
               'Data Final Inferior a Inicial !!'+cr+
               'Deseja Tornar Inativo Este Documento ??','C')=2 Then
         Exit
        Else
         sgTipo:='I';
      End; // If (DMSalao.CDS_BeneficiosDTA_INI_BENEFICIO.AsDateTime>StrToDateTime(sgDtaFim)) and (Trim(DMSalao.CDS_BeneficiosDTA_ULT_PAGTO.AsString)='') Then

      // Se Menor que Data do Ultimo Pagto --------------------------
      If Trim(DMSalao.CDS_BeneficiosDTA_ULT_PAGTO.AsString)<>'' Then
      Begin
        If DMSalao.CDS_BeneficiosDTA_ULT_PAGTO.AsDateTime>StrToDateTime(sgDtaFim) Then
        Begin
          msg('Data Último Pagto: '+DMSalao.CDS_BeneficiosDTA_ULT_PAGTO.AsString+cr+cr+
              'Data Inválida !!'+cr+cr+'Já Houve Pagamento Posterior a '+sgDtaFim+' !!','A');
          Exit;
        End;
      End; // If Trim(DMSalao.CDS_BeneficiosDTA_ULT_PAGTO.AsString)<>'' Then

      // Se Igual a Data do Ultimo Pagto (Inativar) ----------------------------
      If DMSalao.CDS_BeneficiosDTA_ULT_PAGTO.AsDateTime=StrToDateTime(sgDtaFim) Then
      Begin
        If msg('Data Final       : '+sgDtaFim+cr+
               'Data Último Pagto: '+DMSalao.CDS_BeneficiosDTA_ULT_PAGTO.AsString+cr+
               'Data Final Igual ao do Último Pagto !!'+cr+cr+
               'Deseja Tornar Inativo Este Documento ??','C')=2 Then
         Exit
        Else
         sgTipo:='I';
      End; // If (DMSalao.CDS_BeneficiosDTA_INI_BENEFICIO.AsDateTime>StrToDateTime(sgDtaFim)) and (Trim(DMSalao.CDS_BeneficiosDTA_ULT_PAGTO.AsString)='') Then
    End; // If (sgDtaFim<>'') and (sgDtaFim<>'(Sem Final)') Then
  End; // If Key=Vk_F5 Then

  // Se Efetua a Manutenção do Documento de Beneficios =========================
  If bProcBeneficio Then
  Begin
    If Not BeneficiosManut Then
    Begin
      msg('Erro ao Atualiza Benefício !!'+cr+cr+'Entre em Contato com o Odir !!!','A');
      Dbg_Beneficios.SetFocus;
      Exit;
    End; // If Not bgSiga Then

    DMSalao.CDS_Beneficios.DisableControls;
    DMSalao.CDS_Beneficios.Close;
    DMSalao.CDS_Beneficios.Open;
    DMSalao.CDS_Beneficios.EnableControls;

    If iRecNo<DMSalao.CDS_Beneficios.RecordCount Then
     DMSalao.CDS_Beneficios.RecNo:=iRecNo;
  End; // If bProcBeneficio Then

end;

procedure TFrmSalao.Cbx_BenefSituacaoChange(Sender: TObject);
begin
  FechaTudoSalao;
end;

procedure TFrmSalao.EdtBenefManutCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtBenefManutCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    EdtBenefManutDesLoja.Clear;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From EMP_CONEXOES'+
           ' Where Ind_Ativo=''SIM'''+
           ' And COD_FILIAL='+QuotedStr(FormatFloat('00',EdtBenefManutCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('RAZAO_SOCIAL').AsString)='' Then
    Begin
      msg('Loja NÃO Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtBenefManutCodLoja.Clear;
      EdtBenefManutCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtBenefManutDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    Pan_BenefManut.Enabled:=True;
    EdtBenefManutCodProf.SetFocus;
    
    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmSalao.EdtBenefManutCodProfExit(Sender: TObject);
Var
  MySql: String;
begin
  EdtBenefManutDesProf.Clear;

  BeneficiosInicializaComponentes;

  If EdtBenefManutCodLoja.Value=0 Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtBenefManutCodLoja.SetFocus;
    Exit;
  End;

  If EdtBenefManutCodProf.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Profissional ======================================================
    MySql:=' SELECT p.des_profissional, p.cod_profissional'+
           ' FROM SAL_PROFISSIONAIS p'+
           ' WHERE p.tip_pessoa='+QuotedStr('P')+
           ' AND   p.ind_ativo='+QuotedStr('SIM')+
           ' AND   p.cod_loja='+QuotedStr(FormatFloat('00',EdtBenefManutCodLoja.AsInteger))+
           ' AND   p.cod_profissional='+QuotedStr(FormatFloat('000000',EdtBenefManutCodProf.AsInteger))+
           ' ORDER BY des_profissional';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Des_Profissional').AsString)='' Then
    Begin
      msg('Profissional NÃO Encontrado'+cr+cr+'Ou Esta Inativo !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtBenefManutCodProf.Clear;
      Pan_BenefManut.Enabled:=True;
      EdtBenefManutCodProf.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;
    EdtBenefManutDesProf.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Profissional').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    Gb_BenefManutTipo.Enabled:=True;
    Gb_BenefManutTipo.SetFocus;
    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmSalao.Bt_BenefManutBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtBenefManutCodLoja.Clear;
  EdtBenefManutDesLoja.Clear;

  EdtBenefManutCodLoja.SetFocus;

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
    EdtBenefManutCodLoja.SetFocus;
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
     EdtBenefManutCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtBenefManutDesLoja.Text:=FrmPesquisa.EdtDescricao.Text;
     EdtBenefManutCodLojaExit(Self);
   End
  Else
   Begin
     EdtBenefManutCodLoja.Clear;
     EdtBenefManutDesLoja.Clear;
     EdtBenefManutCodLoja.SetFocus;
   End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmSalao.Bt_BenefManutBuscaProfClick(Sender: TObject);
Var
  MySql: String;
begin
  BeneficiosInicializaComponentes;

  EdtBenefManutCodProf.Clear;
  EdtBenefManutDesProf.Clear;

  If EdtBenefManutCodLoja.Value=0 Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtBenefManutCodLoja.SetFocus;
    Exit;
  End;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  Pan_BenefManut.Enabled:=True;
  EdtBenefManutCodProf.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.des_profissional, p.cod_profissional'+
         ' FROM SAL_PROFISSIONAIS p'+
         ' WHERE p.tip_pessoa='+QuotedStr('P')+
         ' AND   p.ind_ativo='+QuotedStr('SIM')+
         ' AND   p.cod_loja='+QuotedStr(FormatFloat('00',EdtBenefManutCodLoja.AsInteger))+
         ' ORDER BY des_profissional';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Des_Profissional').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Profissional a Listar !!','A');
    Pan_BenefManut.Enabled:=True;
    EdtBenefManutCodProf.SetFocus;
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
     EdtBenefManutCodProf.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtBenefManutDesProf.Text:=FrmPesquisa.EdtDescricao.Text;
     EdtBenefManutCodProfExit(Self);
   End
  Else
   Begin
     EdtBenefManutCodProf.Clear;
     EdtBenefManutDesProf.Clear;
     Pan_BenefManut.Enabled:=True; 
     EdtBenefManutCodProf.SetFocus;
   End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmSalao.Rb_BenefManutUmaVezClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_BenefManutUmaVez);
  AcertaRb_Style(Rb_BenefManutDiario);
  AcertaRb_Style(Rb_BenefManutSemanal);
  AcertaRb_Style(Rb_BenefManutMensal);

  If (Sender is TRadioButton) Then
  Begin
    If (Sender as TRadioButton).Checked Then
    Begin
      If Rb_BenefManutUmaVez.Checked Then
      Begin
        DtaEdtBenefManutFim.Enabled:=False;
        Gb_BenefManutTpValor.Visible:=False;
        Gb_BenefManutValor.Left:=177;
        Gb_BenefManutPosDia.Visible:=False;
        Gb_BenefManutDiaSemana.Visible:=False;
      End; // If Trim((Sender as TRadioButton).Name)='Rb_BenefManutUmaVez' Then

      If Rb_BenefManutDiario.Checked Then
      Begin
        Gb_BenefManutTpValor.Visible:=False;
        Gb_BenefManutValor.Left:=177;
        Gb_BenefManutPosDia.Visible:=False;
        Gb_BenefManutDiaSemana.Visible:=False;
      End; // If Trim((Sender as TRadioButton).Name)='Rb_BenefManutDiario' Then

      If Rb_BenefManutSemanal.Checked Then
      Begin
        Gb_BenefManutPosDia.Visible:=False;
        Gb_BenefManutDiaSemana.Left:=186;
      End; // If Trim((Sender as TRadioButton).Name)='Rb_BenefManutSemanal' Then

      If Rb_BenefManutMensal.Checked Then
      Begin
        Gb_BenefManutTpValor.Visible:=False;
        Gb_BenefManutValor.Left:=177;
      End; // If Trim((Sender as TRadioButton).Name)='Rb_BenefManutMensal' Then

      Pan_BenefManut.Enabled:=False;
      Gb_BenefManutTipo.Enabled:=False;
      Pan_BenefManutDados.Visible:=True;
      EdtBenefManutDesc.SetFocus;
    End; // If (Sender as TRadioButton).Checked) Then
  End; // If (Sender is TRadioButton) Then

end;

procedure TFrmSalao.Rb_BenefManutUmaVezKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_BenefManutUmaVezClick(Self);
end;

procedure TFrmSalao.Bt_BenefManutSalvarClick(Sender: TObject);
begin
  Pan_BenefManut.Enabled:=True;
  EdtBenefManutCodProf.SetFocus;
  
  If BeneficioConsiste Then
  Begin
    If msg('Deseja Realmente Salvar'+cr+cr+'o Benefício Informado ??','C')=2 Then
    Begin
      EdtBenefManutDesc.SetFocus;
      Exit;
    End;

    If Not BeneficioSalvar Then
     msg('Erro al Salvar Benefício'+cr+cr+'Entrar em Contato com o Odir !!','A')
    Else
     msg('Benefício Salvo com Sucesso !!', 'A');

    BeneficiosInicializaComponentes;
    Pan_BenefManut.Enabled:=True;
    EdtBenefManutCodProf.SetFocus;
  End;
end;

procedure TFrmSalao.Bt_BenefManutAbandonarClick(Sender: TObject);
begin
  BeneficiosInicializaComponentes;
  Pan_BenefManut.Enabled:=True;
  EdtBenefManutCodProf.SetFocus;
end;

procedure TFrmSalao.Bt_BenefManutAbandonarExit(Sender: TObject);
begin
  If Pan_BenefManutDados.Visible Then
   EdtBenefManutDesc.SetFocus;
end;

procedure TFrmSalao.Rb_BenefManutVlrIntegralClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_BenefManutVlrIntegral);
  AcertaRb_Style(Rb_BenefManutVlrDiaMes);
end;

procedure TFrmSalao.DtaEdtBenefManutInicioExit(Sender: TObject);
begin
  If Not DtaEdtBenefManutFim.Enabled Then
   DtaEdtBenefManutFim.Date:=DtaEdtBenefManutInicio.Date;
end;

procedure TFrmSalao.Rb_BenefManutVlrIntegralKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Rb_BenefManutVlrIntegralClick(Self);
end;

procedure TFrmSalao.EdtBenefCodLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key=Vk_F9 Then Bt_BenefBuscaLojaClick(Self);

end;

procedure TFrmSalao.EdtBenefManutCodLojaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key=Vk_F9 Then Bt_BenefManutBuscaLojaClick(Self);

end;

procedure TFrmSalao.EdtBenefManutCodProfKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key=Vk_F9 Then Bt_BenefManutBuscaProfClick(Self);

end;

procedure TFrmSalao.EdtPagtoCodLojaEnter(Sender: TObject);
begin
  EdtPagtoCodLoja.Value:=0;
end;

procedure TFrmSalao.Dbg_CadProfServDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If (Column.FieldName='IND_ATIVO') Then
  Begin
    if DMSalao.CDS_ServicosIND_ATIVO.AsString='NAO' Then
    Begin
      Dbg_CadProfServ.Canvas.Brush.Color:=clRed;
      Dbg_CadProfServ.Canvas.Font.Color:=clWhite;
    End;
  End;

  Dbg_CadProfServ.Canvas.FillRect(Rect);
  Dbg_CadProfServ.DefaultDrawDataCell(Rect,Column.Field,state);

end;

procedure TFrmSalao.Cbx_CadProfServAtivoClick(Sender: TObject);
begin

  DMSalao.CDS_ServicosProf.Filtered:=False;
  DMSalao.CDS_ServicosProf.Filter:='';

  If Cbx_CadProfServAtivo.ItemIndex=1 Then
  Begin
    DMSalao.CDS_ServicosProf.Filter:='IND_ATIVO=''SIM''';
    DMSalao.CDS_ServicosProf.Filtered:=True;
  End;

  If Cbx_CadProfServAtivo.ItemIndex=2 Then
  Begin
    DMSalao.CDS_ServicosProf.Filter:='IND_ATIVO=''NAO''';
    DMSalao.CDS_ServicosProf.Filtered:=True;
  End;
end;

end.


{
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
- TECBIZ
  -  Importa Cobrança pelos 5 ultimo Numerodo do cartão TECBIZ
  - Solicita Data de Vencimento
======================================

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
- TAXA DO SINDICATO
	  - Cobrar, sempre, no último Dia Util do Mês de FEVEREIRO de Cada ANO.
	  - Cobrar dos Profissionais que TIverem DATA de INICIO DE CONTRATO inferior
      ANO DE COBRANÇA.

    - Inclusão Inicio do contrato se menor que ano atual.
======================================

          >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
          - TAXA DE NÃO SOCIO
            - Se Ckb_CadProfTaxaNaoSocio.Checked Então Cobrar UMA VEZ
          ======================================

          >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
          - VALOR PLANO SAUDE
            - Valor individual para Titular e Dependentes ?
            - Cobrar o total do titular
            - Conforme acordado em reunião o PLANO DE SAÚDE será Cobrado, sempre,
                    no dia 22 do Mês de Competência, ou dia superior sempre que sábado, domingo ou feriado.
          ======================================

          >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
          - INSS
            - Conforme acordado em reunião o INSS será Cobrado, sempre,
                    no dia 15 do Mês de Competência, ou dia superior sempre que sábado, domingo ou feriado.

          ======================================

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
- PARCELAMENTO DE DÉBITOS
	- Possibilitar o parcelamento de Débitos
======================================
}



