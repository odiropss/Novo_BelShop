unit UFrmBancoExtratos;

interface

uses
  Windows, Forms, Menus, StdCtrls, Controls, Grids, ComCtrls, Graphics, Mask,
  Clipbrd, // PrintScreen
  AppEvnts, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, DBGridJul, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, JvEditorCommon, JvEditor, ToolEdit, CurrEdit, JvExControls,
  JvXPCore, JvXPButtons, ExtCtrls, DBGrids, Classes, SysUtils, Comobj, Variants,
  StrUtils, Messages, Dialogs,
  IBQuery, DBXpress, DBClient, dxSkinsdxStatusBarPainter, dxStatusBar, MMSystem;

type
  TFrmBancoExtratos = class(TForm)
    PC_Principal: TPageControl;
    Ts_BancosManut: TTabSheet;
    Ts_ConciliacaoManutPagtos: TTabSheet;
    PC_Bancos: TPageControl;
    Ts_Bancos: TTabSheet;
    Gb_Bancos: TGroupBox;
    Gb_BancosLojas: TGroupBox;
    Dbg_Bancos: TDBGrid;
    Dbg_LojasBanco: TDBGrid;
    Pan_Bancos: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdtNumBanco: TEdit;
    EdtNomeBanco: TEdit;
    EdtNumAgencia: TEdit;
    EdtNomeAgencia: TEdit;
    EdtNumConta: TEdit;
    Bt_DML_1: TJvXPButton;
    Bt_DML_2: TJvXPButton;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    Pan_FinanFechaDiarioSolic: TPanel;
    Label195: TLabel;
    EdtCodLoja: TCurrencyEdit;
    Bt_BuscaLoja: TJvXPButton;
    EdtDesLoja: TEdit;
    Bt_ExcluiLoja: TJvXPButton;
    Ts_ExtratosManut: TTabSheet;
    PC_Extratos: TPageControl;
    Ts_ImportaExtrato: TTabSheet;
    Pan_ExtratoBanco: TPanel;
    Label1: TLabel;
    EdtExtNumBanco: TCurrencyEdit;
    EdtExtBuscaBanco: TJvXPButton;
    EdtExtDesBanco: TEdit;
    EdtExtNumAgencia: TEdit;
    EdtExtDesAgencia: TEdit;
    EdtExtNumConta: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    EdtExtCodBanco: TEdit;
    PC_ExtExtratos: TPageControl;
    Ts_ExtratoBanrisul: TTabSheet;
    Ts_ExtratoSantander: TTabSheet;
    Gb_BanrisulImpArquivo: TGroupBox;
    Bt_BanrisulArquivo: TJvXPButton;
    EdtBanrisulPastaArquivo: TEdit;
    Bt_BanrisulImpExtrato: TJvXPButton;
    EditorBanrisulImpExtrato: TJvEditor;
    Ts_ExtratoConsulta: TTabSheet;
    Gb_ConsExtFiltros: TGroupBox;
    Gb_ConsExtrato: TGroupBox;
    Gb_ConsExtPeriodo: TGroupBox;
    Label10: TLabel;
    DtEdt_PeriodoDtaInicio: TcxDateEdit;
    DtEdt_PeriodoDtaFim: TcxDateEdit;
    Bt_ConsExtBuscaMovto: TJvXPButton;
    Label11: TLabel;
    Lbx_ConsExtMovtos: TListBox;
    Bt_ConsExtExcluiMovto: TJvXPButton;
    Bt_ConsExtExtrato: TJvXPButton;
    Panel2: TPanel;
    Bt_FinanMLScrollSalvaClipboard: TJvXPButton;
    Bt_FinanMLFSalvaCSV: TJvXPButton;
    Dbg_ConsExtrato: TDBGrid;
    Gb_SantanderImpArquivo: TGroupBox;
    Bt_SantanderArquivo: TJvXPButton;
    EdtSantanderPastaArquivo: TEdit;
    Bt_SantanderImpExtrato: TJvXPButton;
    Strg_SantanderImpExtrato: TStringGrid;
    PC_Conciliacoes: TPageControl;
    PC_ConcConciliar: TPageControl;
    Ts_ConcConciliar: TTabSheet;
    Pan_ConcSolicitacoes: TPanel;
    Label15: TLabel;
    Pan_ConcBanco: TPanel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EdtConcNumBanco: TCurrencyEdit;
    EdtConcBuscaBanco: TJvXPButton;
    EdtConcDesBanco: TEdit;
    EdtConcNumAgencia: TEdit;
    EdtConcDesAgencia: TEdit;
    EdtConcNumConta: TEdit;
    Pan_ConcLoja: TPanel;
    Label14: TLabel;
    EdtConcCodLoja: TCurrencyEdit;
    Bt_ConcBuscaLoja: TJvXPButton;
    EdtConcDesLoja: TEdit;
    Gb_ConcConciliaPor: TGroupBox;
    Rb_ConcBanco: TRadioButton;
    Rb_ConcLoja: TRadioButton;
    DtEdt_ConcDtaInicio: TcxDateEdit;
    Bt_ConcConciliar: TJvXPButton;
    Gb_ConcBancosLojas: TGroupBox;
    Dbg_ConcBancosLojas: TDBGrid;
    Ts_ConcConciliando: TTabSheet;
    Gb_ConcExtratosConciliados: TGroupBox;
    Dbg_ConcExtratoBancos: TDBGrid;
    Ts_ConciliacoesManutPagtos: TTabSheet;
    MainMenu1: TMainMenu;
    MenuConcilicao: TMenuItem;
    MenuManutConcilicao: TMenuItem;
    MenuParametros: TMenuItem;
    Pan_ManutConc: TPanel;
    Gb_ConcManutPagtos: TGroupBox;
    Gb_ConcManutExtrato: TGroupBox;
    Dbg_ConcManutExtrato: TDBGridJul;
    Splitter2: TSplitter;
    Dbg_ConcManutPagto: TDBGridJul;
    MenuTipoConcilciao: TMenuItem;
    Rb_ConcTodos: TRadioButton;
    DtEdt_ConcDtaFim: TcxDateEdit;
    Label16: TLabel;
    Ts_ConcManutTotalPagtos: TTabSheet;
    Panel1: TPanel;
    Bt_ConcManutSalvaClipboard: TJvXPButton;
    Bt_ConcManutSalvaCSV: TJvXPButton;
    Bt_ConcManutVoltar: TJvXPButton;
    Dbg_ConcManutTotalPagtos: TDBGrid;
    MenuHistoricosBancarios: TMenuItem;
    SubMenuConcilicaoAutomatica: TMenuItem;
    Ts_HistConcAuto: TTabSheet;
    Panel3: TPanel;
    Bt_HistConcAutoSair: TJvXPButton;
    Dbg_HistConcAuto: TDBGrid;
    Label17: TLabel;
    EdtHistConcAutoLocaliza: TEdit;
    StatusBar3: TStatusBar;
    SubMenuConciliar: TMenuItem;
    SubMenuManutencao: TMenuItem;
    PopupMenu: TPopupMenu;
    StatusBar4: TStatusBar;
    OdirPanApres: TPanel;
    Pan_ManutConcTotais: TPanel;
    Label19: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    EdtConcManutExtratoVlr: TCurrencyEdit;
    EdtConcManutExtratoQtd: TCurrencyEdit;
    EdtConcManutPagtoQtd: TCurrencyEdit;
    EdtConcManutPagtoVlr: TCurrencyEdit;
    EdtConcManutExtPagDif: TCurrencyEdit;
    ApplicationEvents1: TApplicationEvents;
    Ts_VerificaExtrato: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Pan_VerificaExtratoSolic: TPanel;
    Dbg_VerifExtratosContas: TDBGridJul;
    Bt_VerifExtratoOK: TJvXPButton;
    DtEdt_VerifExtratoDtaFim: TcxDateEdit;
    Label21: TLabel;
    DtEdt_VerifExtratoDtaInicio: TcxDateEdit;
    Label22: TLabel;
    Bt_VerifExtratoVerificar: TJvXPButton;
    Mem_VerifContas: TMemo;
    Bt_VerifExtratoDtSemMovto: TJvXPButton;
    Pan_HistConcAutoDuplica: TPanel;
    Bt_HistConcAutoRepLoja: TJvXPButton;
    Edit1: TEdit;
    dxStatusBar3: TdxStatusBar;
    Ts_ConciliacoesManutDepositos: TTabSheet;
    Pan_Opcoes: TPanel;
    Lb_Obs: TLabel;
    Bt_Sair: TJvXPButton;
    Pan_Concilicao: TPanel;
    Pan_ConcSeleciona: TPanel;
    Rb_ConcAmbos: TRadioButton;
    Rb_ConcConciliados: TRadioButton;
    Rb_ConcNaoConciliados: TRadioButton;
    Bt_CMDesmarcar: TJvXPButton;
    Bt_CMConciliar: TJvXPButton;
    Bt_CMApresFiltro: TJvXPButton;
    Pan_ManutConcDep: TPanel;
    Splitter3: TSplitter;
    Gb_ConcManutDepositos: TGroupBox;
    Dbg_ConcManutDepositos: TDBGridJul;
    Gb_ConcManutExtratoDep: TGroupBox;
    Dbg_ConcManutExtratoDep: TDBGridJul;
    Pan_ManutConcTotaisDep: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    EdtConcManutExtratoVlrDep: TCurrencyEdit;
    EdtConcManutExtratoQtdDep: TCurrencyEdit;
    EdtConcManutDepQtd: TCurrencyEdit;
    EdtConcManutDepVlr: TCurrencyEdit;
    EdtConcManutExtDepDif: TCurrencyEdit;
    dxStatusBar1: TdxStatusBar;
    Pan_OpcoesDep: TPanel;
    Bt_SairDep: TJvXPButton;
    Pan_ConcilicaoDep: TPanel;
    Pan_ConcSelecionaDep: TPanel;
    Rb_ConcAmbosDep: TRadioButton;
    Rb_ConcConciliadosDep: TRadioButton;
    Rb_ConcNaoConciliadosDep: TRadioButton;
    Bt_CMDesmarcarDep: TJvXPButton;
    Bt_CMConciliarDep: TJvXPButton;
    Bt_CMPeriodoDep: TJvXPButton;
    Bt_CMRelatorioDep: TJvXPButton;
    Ts_ConciliacoesManutDepAnalise: TTabSheet;
    Panel4: TPanel;
    Bt_DepAnaliseVoltar: TJvXPButton;
    Dbg_DepAnalise: TDBGrid;
    Bt_DepAnaliseDia: TJvXPButton;
    Bt_DepAnaliseSalvaClipboard: TJvXPButton;
    Bt_CMObsNaoConcDep: TJvXPButton;
    procedure FormCreate(Sender: TObject);
    procedure PC_PrincipalChange(Sender: TObject);
    procedure Bt_SairClick(Sender: TObject);
    procedure PC_BancosChange(Sender: TObject);
    procedure Bt_DML_1Click(Sender: TObject);

    // Odir INICIO /////////////////////////////////////////////////////////////

    // DIVERSOS ////////////////////////////////////////////////////////////////
    Procedure LiberaMenu(b: Boolean);
    Procedure HabilitaBotoes(b: Boolean);
    Procedure DesabilitaTabSheet(TS: TTabSheet); // TS = TabSheet a Liberar
    Procedure VisivelMenusConciliacoes(b: Boolean);

    // Desbilita o Scroll do Mouse no DbGrid
    Procedure DesabilitaScrollMouse(var Msg: TMsg; var Handled: Boolean);

    // Habilita o Scroll do Mouse no DBGrid
    procedure HabilitaScrollMouse(var Msg: TMsg; var Handled: Boolean);
    ////////////////////////////////////////////////////////////////////////////

    // Manuten��o de Bancos ////////////////////////////////////////////////////
    Procedure BancosLiberaEdits(bLibera: Boolean);
    ////////////////////////////////////////////////////////////////////////////

    // Manuten��o de Extratos //////////////////////////////////////////////////
    function  ImportaExtratoSantander(AGrid: TStringGrid; sPasta: String; slArquivos: TStringList): Boolean;
                                   // AGrid: StringGrid de Extratos
                                   // sPasta: Pasta Onde esta os Arquivos Excel
                                   // slArquivos: StringList com Nome doArquivos Excel

    Function  ExtratosLeiauteBanco(sDesBanco: String): Boolean;
    Procedure ExtratosLimpa(Sender: TControl);
    Procedure ExtratosSalvar;

    Procedure CriaDiasSemExtrato;
    ////////////////////////////////////////////////////////////////////////////

    // CONCILIA��ES PAGTOS /////////////////////////////////////////////////////
    Procedure TotaisMarcadosNaoConciliados;

    Procedure ConciliacaoLimpa(Sender: TControl; bLimpaTudo: Boolean=False);
              // Para Usar Somente bLimpaTudo Coloque Um Edit Qualquer em Sender
              // Que seja Diferente de:
              //                       - EdtConcNumAgencia
              //                       - EdtConcNumConta
              //                       - EdtConcNumBanco
    Procedure ConcConciliar;
    Function  ConcBuscaMovtoPagto: Boolean;
    Procedure ConcConcilia;
    Procedure ConcConciliarHistAutomaticos;

    Procedure BuscaMovtosExtratosPagtos;

    Procedure LiberaClientGravar(bLibera: Boolean);

    Function  PodeConciliar(iExtrato, iPagto: Integer): Boolean;
    Function  BuscaTpConcicliacao(var sCod: String; Var sDesc: String): Boolean;

    Function  ProcessaTipoConciliacao(sCodConc, sDesConc: String): Boolean;
    Function  ProcessaConciciacao(sTipo: String): Boolean;
    //==========================================================================
    // Tipo de Concilia��o
    //==========================================================================
    // sTipo= (Pag) Processa Pagamento --------> (FIN_CONCILIACAO_PAGTOS.tip_conciliacao = null Ou Pelo Sisitema)
    // sTipo= (Ext) Processa Extrato ----------> (FIN_CONCILIACAO_PAGTOS.tip_conciliacao = null Ou Pelo Sisitema)
    // sTipo= (Din) Processa Como Dinheiro ----> (FIN_CONCILIACAO_PAGTOS.tip_conciliacao = DINH)
    // sTipo= (SEx) Processa Somente Extrato (Cria FIN_CONCILIACAO_MOVTOS)--> (FIN_CONCILIACAO_PAGTOS.tip_conciliacao = SExt)
    ////////////////////////////////////////////////////////////////////////////

    Procedure EliminarConciliacaoError;

    ////////////////////////////////////////////////////////////////////////////

    // CONCILIA��ES DEPOSITOS //////////////////////////////////////////////////
    Procedure HabilitaBotoesDep(b: Boolean);
    Function  AtualizaMovtosDepositos: Boolean;

    Function  PodeConciliarDepositos(iExtrato, iPagto: Integer): Boolean;

    Procedure LiberaClientGravarDep(bLibera: Boolean);
    Procedure TotaisMarcadosNaoConciliadosDep;

    Function  BuscaMovtosExtratosDepositos(bExtrato: Boolean = False): Boolean;
                                           // bExtrato: Soverifica se Existe Extrato no Per�odo

    Function  ProcessaConciciacaoDep(sTipo: String): Boolean;
    //==========================================================================
    // Tipo de Concilia��o
    //==========================================================================
    // sTipo= (Pag) Processa Deposito (Mantido Abreviatura <Pag>) -> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = null Ou Pelo Sisitema)
    // sTipo= (Ext) Processa Extrato ------------------------------> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = null Ou Pelo Sisitema)
    // sTipo= (Din) Processa Como Dinheiro ------------------------> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = DINH)
    // sTipo= (Des) Processa Como Despesa -------------------------> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = DESP)
    // (N�O ESTA LIBERADO) sTipo= (SEx) Processa Somente Extrato (Cria FIN_CONCILIACAO_MOV_DEP) --> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = SExt)
    // sTipo= (Div) Processa Diversos Extratos com Diversos Dep�sitos -> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = NULL)
    ////////////////////////////////////////////////////////////////////////////

    // CONCILIA��ES PAGTOS/ DEPOSITOS //////////////////////////////////////////
    Procedure LocalizaValoresConciliar(iTipo: Integer);
                                    // iTipo=1 EdtConcManutExtratoVlrDep Busca em DMConciliacao.DS_CMDepositos
                                    // iTipo=2 EdtConcManutDepVlr        Busca em DMConciliacao.DS_CMExtratosDep
                                    // iTipo=3 EdtConcManutExtratoVlr    Busca em DMConciliacao.DS_CMPagtos
                                    // iTipo=4 EdtConcManutPagtoVlr      Busca em DMConciliacao.DS_CMExtratos

    // Odir FIM ////////////////////////////////////////////////////////////////

    Procedure ConcPopMenuClick(Sender: TObject);
    Procedure ConcPopMenuClickSIM(Sender: TObject);
    Procedure ConcPopMenuClickNAO(Sender: TObject);
    procedure Bt_DML_2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Dbg_BancosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodLojaExit(Sender: TObject);
    procedure Bt_BuscaLojaClick(Sender: TObject);
    procedure Dbg_LojasBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ExcluiLojaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PC_ExtratosChange(Sender: TObject);
    procedure EdtExtNumBancoExit(Sender: TObject);
    procedure EdtExtNumAgenciaChange(Sender: TObject);
    procedure EdtExtNumContaChange(Sender: TObject);
    procedure EdtExtNumBancoChange(Sender: TObject);
    procedure EdtExtBuscaBancoClick(Sender: TObject);
    procedure EdtExtDesBancoChange(Sender: TObject);
    procedure PC_ExtExtratosChange(Sender: TObject);
    procedure Bt_BanrisulArquivoClick(Sender: TObject);
    procedure Bt_BanrisulImpExtratoClick(Sender: TObject);
    procedure Bt_ConsExtBuscaMovtoClick(Sender: TObject);
    procedure Bt_ConsExtExcluiMovtoClick(Sender: TObject);
    procedure Bt_ConsExtExtratoClick(Sender: TObject);
    procedure Bt_FinanMLScrollSalvaClipboardClick(Sender: TObject);
    procedure Bt_FinanMLFSalvaCSVClick(Sender: TObject);
    procedure Dbg_ConsExtratoEnter(Sender: TObject);
    procedure Dbg_ConsExtratoExit(Sender: TObject);
    procedure Dbg_ConsExtratoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Strg_SantanderImpExtratoDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Bt_SantanderArquivoClick(Sender: TObject);
    procedure Bt_SantanderImpExtratoClick(Sender: TObject);
    procedure PC_ConciliacoesChange(Sender: TObject);
    procedure Rb_ConcBancoClick(Sender: TObject);
    procedure Rb_ConcBancoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtConcNumAgenciaChange(Sender: TObject);
    procedure EdtConcNumContaChange(Sender: TObject);
    procedure EdtConcNumBancoChange(Sender: TObject);
    procedure EdtConcNumBancoExit(Sender: TObject);
    procedure EdtConcBuscaBancoClick(Sender: TObject);
    procedure EdtConcCodLojaExit(Sender: TObject);
    procedure Bt_ConcBuscaLojaClick(Sender: TObject);
    procedure Dbg_ConcBancosLojasEnter(Sender: TObject);
    procedure Dbg_ConcBancosLojasExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Bt_ConcConciliarClick(Sender: TObject);
    procedure PC_ConcConciliarChange(Sender: TObject);
    procedure Dbg_ConcExtratoBancosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PC_ConciliacoesExit(Sender: TObject);
    procedure MenuParametrosClick(Sender: TObject);
    procedure Dbg_ConcManutExtratoDblClick(Sender: TObject);
    procedure Dbg_ConcManutPagtoDblClick(Sender: TObject);
    procedure Bt_CMConciliarClick(Sender: TObject);
    procedure MenuTipoConcilciaoClick(Sender: TObject);
    procedure Dbg_ConcManutExtratoEnter(Sender: TObject);
    procedure Rb_ConcConciliadosClick(Sender: TObject);
    procedure Rb_ConcConciliadosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ConcManutExtratoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ConcManutPagtoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ConcManutExtratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ConcManutPagtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ConcManutPagtoTitleClick(Column: TColumn);
    procedure Bt_ConcManutVoltarClick(Sender: TObject);
    procedure Bt_ConcManutSalvaClipboardClick(Sender: TObject);
    procedure Bt_ConcManutSalvaCSVClick(Sender: TObject);
    procedure Dbg_ConcManutTotalPagtosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SubMenuConcilicaoAutomaticaClick(Sender: TObject);
    procedure Bt_HistConcAutoSairClick(Sender: TObject);
    procedure EdtHistConcAutoLocalizaChange(Sender: TObject);
    procedure Dbg_HistConcAutoDblClick(Sender: TObject);
    procedure SubMenuConciliarClick(Sender: TObject);
    procedure SubMenuManutencaoClick(Sender: TObject);
    procedure Dbg_LojasBancoEnter(Sender: TObject);
    procedure Dbg_LojasBancoExit(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure Ts_ConcConciliandoExit(Sender: TObject);
    procedure Dbg_ConcManutExtratoTitleClick(Column: TColumn);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_CMApresFiltroClick(Sender: TObject);
    procedure Bt_CMDesmarcarClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_ConcManutPagtoEnter(Sender: TObject);
    procedure Dbg_VerifExtratosContasDblClick(Sender: TObject);
    procedure Bt_VerifExtratoOKClick(Sender: TObject);
    procedure Dbg_VerifExtratosContasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_VerifExtratoVerificarClick(Sender: TObject);
    procedure Bt_VerifExtratoDtSemMovtoClick(Sender: TObject);
    procedure DtEdt_VerifExtratoDtaInicioPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bt_CMPeriodoDepClick(Sender: TObject);
    procedure Dbg_ConcManutExtratoDepDblClick(Sender: TObject);
    procedure Rb_ConcConciliadosDepClick(Sender: TObject);
    procedure Dbg_ConcManutExtratoDepDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ConcManutExtratoDepEnter(Sender: TObject);
    procedure Dbg_ConcManutExtratoDepKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Dbg_ConcManutExtratoDepTitleClick(Column: TColumn);
    procedure Dbg_ConcManutDepositosDblClick(Sender: TObject);
    procedure Dbg_ConcManutDepositosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ConcManutDepositosEnter(Sender: TObject);
    procedure Dbg_ConcManutDepositosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ConcManutDepositosTitleClick(Column: TColumn);
    procedure Bt_CMConciliarDepClick(Sender: TObject);
    procedure Rb_ConcConciliadosDepKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_CMDesmarcarDepClick(Sender: TObject);
    procedure EdtConcManutExtratoVlrDepChange(Sender: TObject);
    procedure EdtConcManutDepVlrChange(Sender: TObject);
    procedure EdtConcManutExtratoVlrChange(Sender: TObject);
    procedure EdtConcManutPagtoVlrChange(Sender: TObject);
    procedure Bt_DepAnaliseVoltarClick(Sender: TObject);
    procedure Bt_CMRelatorioDepClick(Sender: TObject);
    procedure Bt_CMObsNaoConcDepClick(Sender: TObject);
    procedure Bt_DepAnaliseDiaClick(Sender: TObject);
    procedure Dbg_DepAnaliseDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ConsExtratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ConcBancosLojasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ConcExtratoBancosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ConcManutTotalPagtosKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Dbg_HistConcAutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_VerifExtratosContasKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Dbg_DepAnaliseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
    sgCodUsuario: String;
  end;

type
 TAuxGrid = class(TStringGrid);

var
  FrmBancoExtratos: TFrmBancoExtratos;

  // Cria Ponteiro de Transa��o
  TD: TTransactionDesc;

  bgLocate, bgChange: Boolean;

  bgSairBancos: Boolean;
  IBQ_ConsultaLoja  : TIBQuery;

  sgDtaServidor: String;

  sgCodLoja, sgCodLojaExt: String;

  lgBoxLojas: TListBox;
  mgMemo: TMemo;

  // Bancos
  sgTpMDL,
  sgCodBanco: String;

  // Extratos
  sgLeiaute,
  sgDia, sgMes, sgAno,
  sgDesMovto, sgDocto, sgValor, sgSaldo,
  sgDta, sgTpMovtos: String;

  // Extrato Santander
  slgArquivos: TStringList; // Arquivo(s) Excel a Processar

  // Conciliacao
  igTotMarcaExt, igTotMarcaPag: Integer;

  cgVlrConciarExt, cgVlrConciarPag: Currency;

  sgTipoSelecao, sgColunaLocalizar: String;
  bgSabDom: Boolean;

  sgAgencia, sgContaCorrente: String;
  bgComNrConta: Boolean; // Se Extrato do Santander cont�m o Numero da Conta

implementation

uses DK_Procs1, UDMBelShop, UDMConexoes, UDMVirtual, UEntrada,
     UPesquisaIB, UDMBancosConciliacao, UPesquisa,
     UFrmBelShop, UFrmTiposConciliacao, Contnrs, UFrmApresConciliacao,
     UFrmSolicitacoes, UFrmPeriodoApropriacao, DB, ComConst, SysConst,
  UFrmConfirmacao;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// CONCILIA��ES PAGTOS/DEPOSITOS - Busca Movto Com Valores Acumulados >>>>>>>>>>
Procedure TFrmBancoExtratos.LocalizaValoresConciliar(iTipo: Integer);
Begin
  // iTipo=1 EdtConcManutExtratoVlrDep Busca em DMConciliacao.DS_CMDepositos
  // iTipo=2 EdtConcManutDepVlr        Busca em DMConciliacao.DS_CMExtratosDep
  // iTipo=3 EdtConcManutExtratoVlr    Busca em DMConciliacao.DS_CMPagtos
  // iTipo=4 EdtConcManutPagtoVlr      Busca em DMConciliacao.DS_CMExtratos

  // iTipo=1 EdtConcManutExtratoVlrDep Busca em DMConciliacao.DS_CMDepositos
  If iTipo=1 Then
  Begin
    If EdtConcManutExtratoVlrDep.Value<>0 Then
    Begin
      If DMConciliacao.CDS_CMDepositos.Locate('Conciliado?; Conciliar?; VLR_DOCTO', VarArrayOf(['NAO', 'NAO', EdtConcManutExtratoVlrDep.Value]),[]) Then
      Begin
        Dbg_ConcManutDepositos.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];

        PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
        msg('Movto com Valor Localizado !!','A');

        Dbg_ConcManutDepositos.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
        THackDBGrid(Dbg_ConcManutDepositos).SelectedIndex:=7;
      End;
    End; // If EdtConcManutExtratoVlrDep.Value<>0 Then
  End; // If iTipo=1 Then

  // iTipo=2 EdtConcManutDepVlr        Busca em DMConciliacao.DS_CMExtratosDep
  If iTipo=2 Then
  Begin
    If EdtConcManutDepVlr.Value<>0 Then
    Begin
      If DMConciliacao.CDS_CMExtratosDep.Locate('Conciliado?; Conciliar?; VLR_DOCTO', VarArrayOf(['NAO', 'NAO', EdtConcManutDepVlr.Value]),[]) Then
      Begin
        Dbg_ConcManutExtratoDep.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];

        PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
        msg('Extrato com Valor Localizado !!','A');

        Dbg_ConcManutExtratoDep.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
        THackDBGrid(Dbg_ConcManutExtratoDep).SelectedIndex:=7;
      End;
    End; // If EdtConcManutExtratoVlrDep.Value<>0 Then
  End; // If iTipo=2 Then

  // iTipo=3 EdtConcManutExtratoVlr    Busca em DMConciliacao.DS_CMPagtos
  If iTipo=3 Then
  Begin
    If EdtConcManutExtratoVlr.Value<>0 Then
    Begin
      If DMConciliacao.CDS_CMPagtos.Locate('Conciliado?; Conciliar?; VLR_DOCTO', VarArrayOf(['NAO', 'NAO', EdtConcManutExtratoVlr.Value]),[]) Then
      Begin
        Dbg_ConcManutPagto.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];

        PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
        msg('Movto com Valor Localizado !!','A');

        Dbg_ConcManutPagto.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
        THackDBGrid(Dbg_ConcManutPagto).SelectedIndex:=7;
      End;
    End; // If EdtConcManutExtratoVlr.Value<>0 Then
  End; // If iTipo=3 Then

  // iTipo=4 EdtConcManutPagtoVlr      Busca em DMConciliacao.DS_CMExtratos
  If iTipo=4 Then
  Begin
    If EdtConcManutPagtoVlr.Value<>0 Then
    Begin
      If DMConciliacao.CDS_CMExtratos.Locate('Conciliado?; Conciliar?; VLR_DOCTO', VarArrayOf(['NAO', 'NAO', EdtConcManutPagtoVlr.Value]),[]) Then

      Begin
        Dbg_ConcManutExtrato.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];

        PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
        msg('Extrato com Valor Localizado !!','A');

        Dbg_ConcManutExtrato.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
        THackDBGrid(Dbg_ConcManutExtrato).SelectedIndex:=7;
      End;
    End; // If EdtConcManutPagtoVlr.Value<>0 Then
  End; // If iTipo=4 Then

End; // CONCILIA��ES PAGTOS/DEPOSITOS - Busca Movto Com Valores Acumulados >>>>>

// CONCILIA��ES DEPOSITOS - Processa Concilia��o Extrato/Deposito >>>>>>>>>>>>>>
Function TFrmBancoExtratos.ProcessaConciciacaoDep(sTipo: String): Boolean;
Var
  MySql: String;
  sChvExtrato, sNumSeq, sNumCompl: String;
  s, sObs: String;
  b: Boolean;
  mmChaveExt: TMemo;
  i: Integer;
Begin
  //===========================================================
  // Tipo de Concilia��o
  //===========================================================
  // sTipo= (Pag) Processa Deposito (Mantido Abreviatura <Pag>) -> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = null Ou Pelo Sisitema)
  // sTipo= (Ext) Processa Extrato ------------------------------> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = null Ou Pelo Sisitema)
  // sTipo= (Din) Processa Como Dinheiro ------------------------> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = DINH)
  // sTipo= (Des) Processa Como Despesa -------------------------> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = DESP)
  // (N�O ESTA LIBERADO) sTipo= (SEx) Processa Somente Extrato (Cria FIN_CONCILIACAO_MOV_DEP) --> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = SExt)
  // sTipo= (Div) Processa Diversos Extratos com Diversos Dep�sitos -> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = NULL)

  Result:=False;

  sNumCompl  :=DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
  sNumSeq    :=DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString;
  sChvExtrato:=DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString;

  //============================================================================
  // Solicita Observa��o =======================================================
  //============================================================================
  sObs:='';
  If (sTipo='Din') Or (sTipo='Pag') Or (sTipo='Ext') Or (sTipo='Div') Or (sTipo='Des') Then
  Begin
    b:=True;
    While b do
    Begin
      InputQueryOdir('CONCILIA��O DEP�SITOS', 'Informe a Observa��o',sObs);
      b:=False;

      If Length(sObs)>100 Then
      Begin
        msg('O N�mero Maximo de Caracteres � de 100'+cr+cr+'Observa��o Atual: '+IntToStr(Length(sObs))+' Caracteres !!','A');
        b:=True;
      End;
    End;
  End; // If (sTipo='Din') Or (sTipo='Pag') Or (sTipo='Ext') Or (sTipo='Div') Or (sTipo='Des') Then
  // Solicita Observa��o =======================================================
  //============================================================================

  //============================================================================
  // Concilia Extratos / Deposito Diversos =====================================
  //============================================================================
  If sTipo='Div' Then
  Begin
    // Cria Memo par Chaves dos Extratos =======================================
    mmChaveExt:=TMemo.Create(Self);
    mmChaveExt.Visible:=False;
    mmChaveExt.Parent:=FrmBancoExtratos;
    mmChaveExt.Width:=500;
    mmChaveExt.Lines.Clear;

    // Extratos Diversos a Conciliar ===========================================
    DMConciliacao.CDS_CMExtratosDep.First;
    DMConciliacao.CDS_CMExtratosDep.DisableControls;
    HabilitaBotoesDep(False);
    While Not DMConciliacao.CDS_CMExtratosDep.Eof do
    Begin
      Refresh;

      If (DMConciliacao.CDS_CMExtratosDepConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMExtratosDepConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMExtratosDepQUEM.AsString)='') Then
      Begin
        mmChaveExt.Lines.Add(DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString);

        // Libera Para Grava��o ================================================
        LiberaClientGravarDep(True);

        DMConciliacao.CDS_CMExtratosDep.Edit;
        DMConciliacao.CDS_CMExtratosDepCOD_USUARIO.AsString:=sgCodUsuario;
        DMConciliacao.CDS_CMExtratosDepConciliado.AsString:='SIM';
        DMConciliacao.CDS_CMExtratosDepQUEM.AsString:='USU';
        DMConciliacao.CDS_CMExtratosDep.Post;

        // Retira a Libera�ao Para Grava��o ====================================
        LiberaClientGravarDep(False);

      End; // If (DMConciliacao.CDS_CMExtratosDepConciliar.AsString='SIM') And

      DMConciliacao.CDS_CMExtratosDep.Next;
    End; // While Not DMConciliacao.CDS_CMExtratosDep.Eof do
    DMConciliacao.CDS_CMExtratosDep.EnableControls;

    // Dep�sitos Diversos a Conciliar ==========================================
    DMConciliacao.CDS_CMDepositos.First;
    DMConciliacao.CDS_CMDepositos.DisableControls;
    While Not DMConciliacao.CDS_CMDepositos.Eof do
    Begin
      Refresh;

      If (DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMDepositosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMDepositosQUEM.AsString)='') Then
      Begin
        // Libera Para Grava��o ================================================
        LiberaClientGravarDep(True);

        DMConciliacao.CDS_CMDepositos.Edit;
        DMConciliacao.CDS_CMDepositosCOD_USUARIO.AsString:=sgCodUsuario;
        DMConciliacao.CDS_CMDepositosConciliado.AsString:='SIM';
        DMConciliacao.CDS_CMDepositosQUEM.AsString:='USU';
        DMConciliacao.CDS_CMDepositosTXT_OBS.AsString:=sObs;
        DMConciliacao.CDS_CMDepositos.Post;

        // Retira a Libera�ao Para Grava��o ====================================
        LiberaClientGravarDep(False);

        // Grava Dep�sito como Conciliado ======================================
        MySql:=' Update FIN_CONCILIACAO_MOV_DEP m'+
               ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
               ',      m.OBS_NAO_CONC=Null'+
               ' Where m.Num_Seq='+DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString+
               ' And   m.Num_Compl='+DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        // Salva Concilia��o ===================================================
        For i:=0 to mmChaveExt.Lines.Count-1 do
        Begin
          MySql:=' INSERT INTO FIN_CONCILIACAO_DEPOSITOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 '  COD_USUARIO, TXT_OBS)'+
                 ' VALUES('+
                 QuotedStr(mmChaveExt.Lines[i])+', '+
                 QuotedStr(DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString)+', '+
                 QuotedStr(DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString)+', '+
                 QuotedStr('USU')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr(sObs)+')';
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End; // For i:=0 to mmChaveExt.Lines.Count-1 do
      End; // If (DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM') And ...

      DMConciliacao.CDS_CMDepositos.Next;
    End; // While Not DMConciliacao.CDS_CMDepositos.Eof do
    DMConciliacao.CDS_CMDepositos.EnableControls;

    FreeAndNil(mmChaveExt);

    HabilitaBotoesDep(True);

    Result:=True;
  End; // If sTipo='Div' Then
  // Concilia Extratos / Deposito Diversos =====================================
  //============================================================================

  //============================================================================
  // Concilia Por Deposito =====================================================
  //============================================================================
  If sTipo='Pag' Then
  Begin
    DMConciliacao.CDS_CMDepositos.First;
    DMConciliacao.CDS_CMDepositos.DisableControls;
    While Not DMConciliacao.CDS_CMDepositos.Eof do
    Begin
      Refresh;

      If (DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMDepositosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMDepositosQUEM.AsString)='') Then
      Begin
        sNumCompl  :=DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
        sNumSeq    :=DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString;
        Break;
      End;

      DMConciliacao.CDS_CMDepositos.Next;
    End; // While Not DMConciliacao.CDS_CMDepositos.Eof do
    DMConciliacao.CDS_CMDepositos.EnableControls;

    // Libera Para Grava��o ====================================================
    LiberaClientGravarDep(True);

    DMConciliacao.CDS_CMDepositos.Edit;
    DMConciliacao.CDS_CMDepositosCOD_USUARIO.AsString:=sgCodUsuario;
    DMConciliacao.CDS_CMDepositosConciliado.AsString:='SIM';
    DMConciliacao.CDS_CMDepositosQUEM.AsString:='USU';
    DMConciliacao.CDS_CMDepositosTXT_OBS.AsString:=sObs;
    DMConciliacao.CDS_CMDepositos.Post;

    // Retira a Libera�ao Para Grava��o ========================================
    LiberaClientGravarDep(False);

    MySql:=' Update FIN_CONCILIACAO_MOV_DEP m'+
           ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
           ',      m.OBS_NAO_CONC=Null'+
           ' Where m.Num_Seq='+DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString+
           ' And   m.Num_Compl='+DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DMConciliacao.CDS_CMExtratosDep.First;
    DMConciliacao.CDS_CMExtratosDep.DisableControls;
    HabilitaBotoesDep(False);
    While Not DMConciliacao.CDS_CMExtratosDep.Eof do
    Begin
      Refresh;

      If (DMConciliacao.CDS_CMExtratosDepConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMExtratosDepConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMExtratosDepQUEM.AsString)='') Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString;

        // Libera Para Grava��o ================================================
        LiberaClientGravarDep(True);

        DMConciliacao.CDS_CMExtratosDep.Edit;
        DMConciliacao.CDS_CMExtratosDepCOD_USUARIO.AsString:=sgCodUsuario;
        DMConciliacao.CDS_CMExtratosDepConciliado.AsString:='SIM';
        DMConciliacao.CDS_CMExtratosDepQUEM.AsString:='USU';
        DMConciliacao.CDS_CMExtratosDep.Post;

        // Retira a Libera�ao Para Grava��o ====================================
        LiberaClientGravarDep(False);

        MySql:=' INSERT INTO FIN_CONCILIACAO_DEPOSITOS'+
               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
               '  COD_USUARIO, TXT_OBS)'+
               ' VALUES('+
               QuotedStr(DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString)+', '+
               QuotedStr('USU')+', '+
               QuotedStr(sgCodUsuario)+', '+
               QuotedStr(sObs)+')';
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If (DMConciliacao.CDS_CMExtratosDepConciliar.AsString='SIM') And

      DMConciliacao.CDS_CMExtratosDep.Next;
    End; // While Not DMConciliacao.CDS_CMExtratosDep.Eof do
    DMConciliacao.CDS_CMExtratosDep.EnableControls;
    HabilitaBotoesDep(True);

    Result:=True;
  End; // If sTipo='Pag' Then
  // Concilia Por Deposito =====================================================
  //============================================================================

  //============================================================================
  // Concilia Por Extrato ======================================================
  //============================================================================
  If sTipo='Ext' Then
  Begin
    DMConciliacao.CDS_CMExtratosDep.First;
    DMConciliacao.CDS_CMExtratosDep.DisableControls;
    While Not DMConciliacao.CDS_CMExtratosDep.Eof do
    Begin
      If (DMConciliacao.CDS_CMExtratosDepConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMExtratosDepConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMExtratosDepQUEM.AsString)='') Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString;
        Break;
      End;

      DMConciliacao.CDS_CMExtratosDep.Next;
    End; // While Not DMConciliacao.CDS_CMExtratosDep.Eof do
    DMConciliacao.CDS_CMExtratosDep.EnableControls;

    // Libera Para Grava��o ====================================================
    LiberaClientGravarDep(True);

    DMConciliacao.CDS_CMExtratosDep.Edit;
    DMConciliacao.CDS_CMExtratosDepCOD_USUARIO.AsString:=sgCodUsuario;
    DMConciliacao.CDS_CMExtratosDepConciliado.AsString:='SIM';
    DMConciliacao.CDS_CMExtratosDepQUEM.AsString:='USU';
    DMConciliacao.CDS_CMExtratosDep.Post;
    Refresh;

    // Retira a Libera�ao Para Grava��o ========================================
    LiberaClientGravarDep(False);

    HabilitaBotoesDep(False);

    DMConciliacao.CDS_CMDepositos.First;
    DMConciliacao.CDS_CMDepositos.DisableControls;
    While Not DMConciliacao.CDS_CMDepositos.Eof do
    Begin
      If (DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMDepositosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMDepositosQUEM.AsString)='') Then
      Begin
        sNumCompl  :=DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
        sNumSeq    :=DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString;

        MySql:=' Update FIN_CONCILIACAO_MOV_DEP m'+
               ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
               ',      m.OBS_NAO_CONC=Null'+
               ' Where m.Num_Seq='+DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString+
               ' And   m.Num_Compl='+DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        // Libera Para Grava��o ================================================
        LiberaClientGravarDep(True);

        DMConciliacao.CDS_CMDepositos.Edit;
        DMConciliacao.CDS_CMDepositosCOD_USUARIO.AsString:=sgCodUsuario;
        DMConciliacao.CDS_CMDepositosConciliado.AsString:='SIM';
        DMConciliacao.CDS_CMDepositosQUEM.AsString:='USU';
        DMConciliacao.CDS_CMDepositosTXT_OBS.AsString:=sObs;
        DMConciliacao.CDS_CMDepositos.Post;
        Refresh;

        // Retira a Libera�ao Para Grava��o ====================================
        LiberaClientGravarDep(False);

        MySql:=' Insert Into FIN_CONCILIACAO_DEPOSITOS'+
               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
               '  COD_USUARIO, TXT_OBS)'+
               ' Values('+
               QuotedStr(DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString)+', '+
               QuotedStr('USU')+', '+
               QuotedStr(sgCodUsuario)+', '+
               QuotedStr(sObs)+')';
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If (DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM') And

      DMConciliacao.CDS_CMDepositos.Next;
    End; // While Not DMConciliacao.CDS_CMDepositos.Eof do
    DMConciliacao.CDS_CMDepositos.EnableControls;
    HabilitaBotoesDep(True);

    Result:=True;
  End; // If sTipo='Ext' Then
  // Concilia Por Extrato ======================================================
  //============================================================================

  //============================================================================
  // Concilia Por Dinheiro =====================================================
  //============================================================================
  If sTipo='Din' Then
  Begin
    HabilitaBotoesDep(False);

    s:=DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
    DMConciliacao.CDS_CMDepositos.First;
    DMConciliacao.CDS_CMDepositos.DisableControls;
    While Not DMConciliacao.CDS_CMDepositos.Eof do
    Begin

      If (DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMDepositosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMDepositosQUEM.AsString)='') Then
      Begin
        // Libera Para Grava��o ================================================
        LiberaClientGravarDep(True);

        DMConciliacao.CDS_CMDepositos.Edit;
        DMConciliacao.CDS_CMDepositosCOD_USUARIO.AsString:=sgCodUsuario;
        DMConciliacao.CDS_CMDepositosConciliado.AsString:='SIM';
        DMConciliacao.CDS_CMDepositosQUEM.AsString:='USU';
        DMConciliacao.CDS_CMDepositosTIP_CONCILIACAO.AsString:='DINH';
        DMConciliacao.CDS_CMDepositosTXT_OBS.AsString:=sObs;
        DMConciliacao.CDS_CMDepositos.Post;

        // Retira a Libera�ao Para Grava��o ====================================
        LiberaClientGravarDep(False);

        MySql:=' Update FIN_CONCILIACAO_MOV_DEP m'+
               ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
               ',      m.OBS_NAO_CONC=Null'+
               ' Where m.Num_Seq='+DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString+
               ' And   m.Num_Compl='+DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        MySql:=' Insert Into FIN_CONCILIACAO_DEPOSITOS'+
               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM, TIP_CONCILIACAO,'+
               '  COD_USUARIO, TXT_OBS)'+
               ' Values('+
               QuotedStr('DINH'+s)+', '+
               QuotedStr(DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString)+', '+
               QuotedStr('USU')+', '+
               QuotedStr('DINH')+', '+
               QuotedStr(sgCodUsuario)+', '+
               QuotedStr(sObs)+')';
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End;

      DMConciliacao.CDS_CMDepositos.Next;
    End; // While Not DMConciliacao.CDS_CMPagtos.Eof do
    DMConciliacao.CDS_CMDepositos.EnableControls;
    HabilitaBotoesDep(True);

    Result:=True;
  End; // If sTipo='Din' Then
  // Concilia Por Dinheiro =====================================================
  //============================================================================

  //============================================================================
  // Concilia Como Despesa =====================================================
  //============================================================================
  If sTipo='Des' Then
  Begin
    HabilitaBotoesDep(False);

    s:=DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
    DMConciliacao.CDS_CMDepositos.First;
    DMConciliacao.CDS_CMDepositos.DisableControls;
    While Not DMConciliacao.CDS_CMDepositos.Eof do
    Begin

      If (DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMDepositosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMDepositosQUEM.AsString)='') Then
      Begin
        // Libera Para Grava��o ================================================
        LiberaClientGravarDep(True);

        DMConciliacao.CDS_CMDepositos.Edit;
        DMConciliacao.CDS_CMDepositosCOD_USUARIO.AsString:=sgCodUsuario;
        DMConciliacao.CDS_CMDepositosConciliado.AsString:='SIM';
        DMConciliacao.CDS_CMDepositosQUEM.AsString:='USU';
        DMConciliacao.CDS_CMDepositosTIP_CONCILIACAO.AsString:='DESP';
        DMConciliacao.CDS_CMDepositosTXT_OBS.AsString:=sObs;
        DMConciliacao.CDS_CMDepositos.Post;

        // Retira a Libera�ao Para Grava��o ====================================
        LiberaClientGravarDep(False);

        MySql:=' Update FIN_CONCILIACAO_MOV_DEP m'+
               ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
               ',      m.OBS_NAO_CONC=Null'+
               ' Where m.Num_Seq='+DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString+
               ' And   m.Num_Compl='+DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        MySql:=' Insert Into FIN_CONCILIACAO_DEPOSITOS'+
               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM, TIP_CONCILIACAO,'+
               '  COD_USUARIO, TXT_OBS)'+
               ' Values('+
               QuotedStr('DESP'+s)+', '+
               QuotedStr(DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString)+', '+
               QuotedStr('USU')+', '+
               QuotedStr('DESP')+', '+
               QuotedStr(sgCodUsuario)+', '+
               QuotedStr(sObs)+')';
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End;

      DMConciliacao.CDS_CMDepositos.Next;
    End; // While Not DMConciliacao.CDS_CMDepositos.Eof do
    DMConciliacao.CDS_CMDepositos.EnableControls;
    HabilitaBotoesDep(True);

    Result:=True;
  End; // If sTipo='Din' Then
  // Concilia Como Despesa =====================================================
  //============================================================================

  //============================================================================
  // (N�O ESTA LIBERADO - Tem que Revisar TUDO)
  // Concilia Somente Extrato ==================================================
  //============================================================================
//  If sTipo='SEx' Then
//  Begin
//    HabilitaBotoesDep(False);
//
//    DMConciliacao.CDS_CMExtratosDep.DisableControls;
//    DMConciliacao.CDS_CMExtratosDep.First;
//    While Not DMConciliacao.CDS_CMExtratosDep.Eof do
//    Begin
//      If (DMConciliacao.CDS_CMExtratosDepConciliar.AsString='SIM') And
//         (DMConciliacao.CDS_CMExtratosDepConciliado.AsString='NAO') And
//         (Trim(DMConciliacao.CDS_CMExtratosDepQUEM.AsString)='') Then
//      Begin
//        sChvExtrato:=DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString;
//
//        // Libera Para Grava��o ====================================================
//        LiberaClientGravarDep(True);
//
//        DMConciliacao.CDS_CMExtratosDep.Edit;
//        DMConciliacao.CDS_CMExtratosDepCOD_USUARIO.AsString:=sgCodUsuario;
//        DMConciliacao.CDS_CMExtratosDepConciliado.AsString:='SIM';
//        DMConciliacao.CDS_CMExtratosDepQUEM.AsString:='USU';
//        DMConciliacao.CDS_CMExtratosDepTIP_CONCILIACAO.AsString:='SExt';
//        DMConciliacao.CDS_CMExtratosDep.Post;
//        Refresh;
//
//        // Retira a Libera�ao Para Grava��o ========================================
//        LiberaClientGravarDep(False);
//
//        // Verifica a Altera��o do Complemento da Sequencia do Registro ==
//        MySql:=' SELECT GEN_ID(GEN_CONCILIACAO_MOV_DEP,0) Num_Seq'+
//               ' FROM RDB$DATABASE';
//        DMBelShop.CDS_BuscaRapida.Close;
//        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
//        DMBelShop.CDS_BuscaRapida.Open;
//        i:=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
//        DMBelShop.CDS_BuscaRapida.Close;
//
//        If i=999999 Then
//        Begin
//          // Acrescenta 1 no Complemento - GEN_COMPL_CONCILIACAO_MOVTOS
//          MySql:=' SELECT GEN_ID(GEN_COMPL_CONCILIACAO_MOV_DEP,1) Num_Seq'+
//                 ' FROM RDB$DATABASE';
//          DMBelShop.CDS_BuscaRapida.Close;
//          DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
//          DMBelShop.CDS_BuscaRapida.Open;
//          DMBelShop.CDS_BuscaRapida.Close;
//
//          // Inicializa Num_Seq - GEN_CONCILIACAO_MOVTOS
//          MySql:=' ALTER SEQUENCE GEN_CONCILIACAO_MOV_DEP RESTART WITH 0';
//          DMBelShop.SQLC.Execute(MySql,nil,nil);
//        End;
//
//        // Busca Num_Seq e Num_Compl ===========================================
//        MySql:=' SELECT GEN_ID(GEN_CONCILIACAO_MOV_DEP,1) Num_Seq'+
//               ' FROM RDB$DATABASE';
//        DMBelShop.CDS_Pesquisa.Close;
//        DMBelShop.SDS_Pesquisa.CommandText:=MySql;
//        DMBelShop.CDS_Pesquisa.Open;
//        sNumSeq:=DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsString;
//        DMBelShop.CDS_Pesquisa.Close;
//
//        MySql:=' SELECT GEN_ID(GEN_COMPL_CONCILIACAO_MOV_DEP,0) Num_Compl'+
//               ' FROM RDB$DATABASE';
//        DMBelShop.CDS_Pesquisa.Close;
//        DMBelShop.SDS_Pesquisa.CommandText:=MySql;
//        DMBelShop.CDS_Pesquisa.Open;
//        sNumCompl:=DMBelShop.CDS_Pesquisa.FieldByName('Num_Compl').AsString;
//        DMBelShop.CDS_Pesquisa.Close;
//
//        // Monta Chv_Pagto =====================================================
//        // CHV_PAGTO = Cod_Loja + Cod_Forn + Cod_Comprov + Num_Serie + Num_Docto + Num_Prest
//        sChvPagto:=sgCodLojaExt+
//                   DMConciliacao.CDS_CMExtratosNUM_BANCO.AsString+
//                   DMConciliacao.CDS_CMExtratosCOD_TPMOVTO.AsString+
//                   DMConciliacao.CDS_CMExtratosNUM_DOCTO.AsString+'01';
//
//        // Insere Movto ========================================================
//        DateSeparator:='.';
//        DecimalSeparator:='.';
//
//        MySql:=' Insert Into FIN_CONCILIACAO_MOV_DEP ('+
//               ' NUM_SEQ, NUM_COMPL,'+
//               ' CHV_PAGTO, CHV_NOTA, CHV_RECIBO, COD_LOJA,'+
//               ' COD_COMPROVANTE, NUM_DOCTO, NUM_SERIE, NUM_PRESTACAO,'+
//               ' DTA_DOCTO, DTA_PAGTO, DTA_VENC, DTA_COMPR, COD_BANCO,'+
//               ' DES_BANCO, COD_COBRANCA, COD_FORNECEDOR, VLR_DOCTO,'+
//               ' VLR_DESCONTO, VLR_ACRESCIMO, VLR_PAGTO, IND_PAGTO_PARCIAL,'+
//               ' OBS_TEXTO, IND_CONCILIACAO, COD_HISTO_AUTO, COD_BANCO_AUTO)'+
//
//               ' Values('+
//               QuotedStr(sNumSeq)+', '+ // NUM_SEQ
//               QuotedStr(sNumCompl)+', '+ // NUM_COMPL
//               QuotedStr(sChvPagto)+', '+ // CHV_PAGTO
//               QuotedStr('0')+', '+ // CHV_NOTA
//               QuotedStr('0')+', '+ // CHV_RECIBO
//               QuotedStr(sgCodLojaExt)+', '+ // COD_LOJA
//               'Null , '+ // COD_COMPROVANTE
//               QuotedStr(DMConciliacao.CDS_CMExtratosNUM_DOCTO.AsString)+', '+ // NUM_DOCTO
//               'Null , '+ // NUM_SERIE
//               QuotedStr('01')+', '+ // NUM_PRESTACAO
////               QuotedStr(f_Troca('/','.',f_Troca('-','.',DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)))+', '+ // DTA_DOCTO
////               QuotedStr(f_Troca('/','.',f_Troca('-','.',DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)))+', '+ // DTA_PAGTO
////               QuotedStr(f_Troca('/','.',f_Troca('-','.',DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)))+', '+ // DTA_VENC
////               QuotedStr(f_Troca('/','.',f_Troca('-','.',DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)))+', '+ // DTA_COMPR
//               QuotedStr(DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)+', '+ // DTA_DOCTO
//               QuotedStr(DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)+', '+ // DTA_PAGTO
//               QuotedStr(DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)+', '+ // DTA_VENC
//               QuotedStr(DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)+', '+ // DTA_COMPR
//               'Null , '+ // COD_BANCO
//               'Null , '+ // DES_BANCO
//               'Null , '+ // COD_COBRANCA
//               'Null , '+ // COD_FORNECEDOR
//               QuotedStr(DMConciliacao.CDS_CMExtratosVLR_DOCTO.AsString)+', '+ // VLR_DOCTO
//               QuotedStr('0')+', '+ // VLR_DESCONTO
//               QuotedStr('0')+', '+ // VLR_ACRESCIMO
//               QuotedStr(DMConciliacao.CDS_CMExtratosVLR_DOCTO.AsString)+', '+ // VLR_PAGTO
//               'Null , '+ // IND_PAGTO_PARCIAL
//               'Null , '+ // OBS_TEXTO
//               QuotedStr('SIM')+', '+ // IND_CONCILIACAO
//               QuotedStr(DMConciliacao.CDS_CMExtratosCOD_TPMOVTO.AsString)+', '+ // COD_HISTO_AUTO
//               QuotedStr(DMConciliacao.CDS_CMExtratosCOD_BANCO.AsString)+')'; // COD_BANCO_AUTO
//        DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//        // Insere Concilia��o Autom�tica do Extrato ============================
//        MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
//               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
//               ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
//               ' Values ('+
//               QuotedStr(DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString)+', '+ // CHV_EXTRATO
//               QuotedStr(sNumSeq)+', '+ // NUM_SEQ
//               QuotedStr(sNumCompl)+', '+ // NUM_COMPL
//               QuotedStr('USU')+', '+ // IND_QUEM
//               QuotedStr(sgCodUsuario)+', '+ // COD_USUARIO
//               QuotedStr('3')+', '+ // TIP_AUX
//               QuotedStr('0')+', '+ // COD_AUX
//               QuotedStr('SExt')+')'; // TIP_CONCILIACAO
//        DMBelShop.SQLC.Execute(MySql, nil, nil);
//
//        DateSeparator:='/';
//        DecimalSeparator:=',';
//      End; // If (DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM') And ....
//
//      DMConciliacao.CDS_CMExtratos.Next;
//    End; // While Not DMConciliacao.CDS_CMExtratos.Eof do
//    DMConciliacao.CDS_CMExtratos.EnableControls;
//    HabilitaBotoes(True);
//
//    Result:=True;
//  End; // If sTipo='SEx' Then
  // Concilia Somente Extrato ==================================================
  //============================================================================

  DMConciliacao.CDS_CMDepositos.DisableControls;
  DMConciliacao.CDS_CMExtratosDep.DisableControls;

  DMConciliacao.CDS_CMDepositos.Close;
  DMConciliacao.CDS_CMExtratosDep.Close;
  DMConciliacao.CDS_CMExtratosDep.Open;
  DMConciliacao.CDS_CMDepositos.Open;
  DMConciliacao.CDS_CMDepositos.EnableControls;
  DMConciliacao.CDS_CMExtratosDep.EnableControls;

  bgLocate:=False;
  DMConciliacao.CDS_CMDepositos.Locate('NUM_SEQ;NUM_COMPL',VarArrayOf([sNumSeq,sNumCompl]),[]);
  DMConciliacao.CDS_CMExtratosDep.Locate('CHV_EXTRATO', sChvExtrato,[]);

End; // CONCILIA��ES DEPOSITOS - Processa Concilia��o Extrato/Deposito >>>>>>>>>

// CONCILIA��ES DEPOSITOS - Busca Extratos e Depositos para Concilia��o >>>>>>>>
Function  TFrmBancoExtratos.BuscaMovtosExtratosDepositos(bExtrato: Boolean = False): Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  OdirPanApres.Caption:='AGUARDE !! Localizando Extratos/Dep�sitos no Per�odo de '+sgDtaI+' a '+sgDtaF;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBancoExtratos.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBancoExtratos.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmBancoExtratos;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  OdirPanApres.Refresh;
  Refresh;

  Rb_ConcAmbosDep.Checked:=True;
  Rb_ConcConciliadosDepClick(Self);

  DMConciliacao.CDS_CMExtratosDep.Close;
  DMConciliacao.CDS_CMDepositos.Close;

  // Busca Extrato do Per�odo ==================================================
  MySql:=' SELECT DISTINCT'+
         ' CASE'+
         '   WHEN p.chv_extrato IS NULL THEN'+
         '     ''NAO'''+
         '   ELSE'+
         '     ''SIM'''+
         ' END "Conciliado?",'+

         ' p.ind_quem QUEM,'+

         ' CASE'+
         '    WHEN p.ind_quem is not null THEN'+
         '      ''SIM'''+
         '    ELSE'+
         '     ''NAO'''+
         ' END "Conciliar?",'+

         ' b.num_banco, b.des_banco, b.num_agencia, b.num_conta,'+
         ' e.dta_extrato, e.num_docto, e.vlr_docto,'+
         ' e.cod_tpmovto, m.des_tpmovto,'+
         ' m.ind_tipo, e.chv_extrato, p.cod_usuario,'+
         ' p.tip_conciliacao, e.cod_banco'+

         ' FROM FIN_BANCOS_EXTRATOS e'+
         '           LEFT JOIN FIN_BANCOS_TP_MOVTOS m       ON m.cod_tpmovto=e.cod_tpmovto'+
         '                                                 AND m.cod_banco=e.cod_banco'+
         '           LEFT JOIN FIN_CONCILIACAO_DEPOSITOS p  ON p.chv_extrato=e.chv_extrato'+
         '           LEFT JOIN FIN_BANCOS b                 ON b.cod_banco=e.cod_banco'+

         ' WHERE m.ind_tipo=''C'''+
         ' AND   e.dta_extrato BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF)+
         ' AND   e.Num_Seq<>999999'+
         ' AND   UPPER(m.des_tpmovto) LIKE ''DEPOS%'''+

         ' ORDER BY e.dta_extrato, b.des_Banco, b.num_banco, b.num_agencia, b.num_conta, e.vlr_docto, e.num_seq';
  DMConciliacao.CDS_CMExtratosDep.Close;
  DMConciliacao.SDS_CMExtratosDep.CommandText:=MySql;
  DMConciliacao.CDS_CMExtratosDep.Open;

  If Trim(DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString)='' Then
  Begin
    OdirPanApres.Visible:=False;
    msg('Sem Extrato no Per�odo Solicitado !!','A');
    DMConciliacao.CDS_CMExtratosDep.Close;
    Exit;
  End;

  // S� Verifia se Existe Extrato no Pr�odo Solicitado =========================
  If bExtrato Then
  Begin
    OdirPanApres.Visible:=False;
    DMConciliacao.CDS_CMExtratosDep.Close;
    DMConciliacao.CDS_CMDepositos.Close;
    Result:=True;
    Exit;
  End; // If bExtrato Then

  // Busca Depositos do Per�odo ================================================
  MySql:=' SELECT DISTINCT'+
         ' m.ind_conciliacao "Conciliado?",'+
         ' p.ind_quem QUEM,'+

         ' CASE'+
         '   WHEN p.ind_quem is not null THEN'+
         '     ''SIM'''+
         '   ELSE'+
         '    ''NAO'''+
         ' END "Conciliar?",'+

         ' ''Bel_''||m.cod_linx cod_loja,'+
         ' e.nome_emp razao_social,'+
         ' m.num_docto Usu_Loja,'+
         ' m.obs_texto,'+
         ' m.dta_docto, m.num_docto, m.vlr_docto, m.dta_venc,'+
         ' m.vlr_desconto, m.vlr_acrescimo,'+
         ' m.cod_banco, m.des_banco,'+
         ' m.num_seq, m.num_compl,'+
         ' p.tip_conciliacao, p.cod_usuario,'+

         ' Case'+
         '   when m.ind_conciliacao=''SIM'' Then'+
         '     p.txt_obs'+
         '   Else'+
         '     m.obs_nao_conc'+
         ' End txt_obs,'+

         ' m.desc_historico'+

         ' FROM FIN_CONCILIACAO_MOV_DEP m'+
         '    LEFT JOIN FIN_CONCILIACAO_DEPOSITOS p  ON p.num_seq=m.num_seq'+
         '                                          AND p.num_compl=m.num_compl'+
         '    LEFT JOIN LINXLOJAS e                  ON e.empresa=m.cod_linx'+

         ' WHERE m.dta_docto BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF)+

         ' ORDER BY m.dta_docto, e.nome_emp, m.num_docto, m.vlr_docto, m.num_seq';
  DMConciliacao.CDS_CMDepositos.Close;
  DMConciliacao.SDS_CMDepositos.CommandText:=MySql;
  DMConciliacao.CDS_CMDepositos.Open;

  If Trim(DMConciliacao.CDS_CMDepositosCOD_LOJA.AsString)='' Then
  Begin
    OdirPanApres.Visible:=False;
    msg('Sem Depositos no Per�odo Solicitado !!','A');
    DMConciliacao.CDS_CMDepositos.Close;
    DMConciliacao.CDS_CMExtratosDep.Close;
    Exit;
  End;

  Rb_ConcConciliadosDepClick(Self);
  Dbg_ConcManutExtratoDep.SetFocus;

  OdirPanApres.Visible:=False;
  Result:=True;
End; // CONCILIA��ES DEPOSITOS - Busca Extratos e Depositos para Concilia��o >>>

// CONCILIA��ES DEPOSITOS - Apresenta Totais Marcados e N�o Conciliados >>>>>>>>
Procedure TFrmBancoExtratos.TotaisMarcadosNaoConciliadosDep;
Var
  CDS: TClientDataSet;
  bVlrEncontrado: Boolean;
Begin

  bVlrEncontrado:=False;

  EdtConcManutExtratoQtdDep.Value:=0;
  EdtConcManutExtratoVlrDep.Value:=0;

  EdtConcManutDepQtd.Value:=0;
  EdtConcManutDepVlr.Value:=0;

  EdtConcManutExtDepDif.Value:=0;
  EdtConcManutExtDepDif.Font.Color:=clWindowText;

  CDS:=TClientDataSet.Create(Self);
  CDS.FieldDefs:=DMConciliacao.CDS_CMExtratosDep.FieldDefs;
  CDS.Data:=DMConciliacao.CDS_CMExtratosDep.Data;
  CDS.First;
  While Not CDS.Eof do
  Begin
    If (cds.FieldByName('Conciliado?').AsString='NAO') And (cds.FieldByName('Conciliar?').AsString='SIM') Then
    Begin
      EdtConcManutExtratoQtdDep.Value:=EdtConcManutExtratoQtdDep.Value+1;
      EdtConcManutExtratoVlrDep.Value:=EdtConcManutExtratoVlrDep.Value+cds.FieldByName('VLR_DOCTO').AsCurrency;
      LocalizaValoresConciliar(1);
      bVlrEncontrado:=True;
    End;

    CDS.Next;
  End;

  If CDS<>nil Then
  Begin
    FreeAndNil(CDS);
  End;

  CDS:=TClientDataSet.Create(Self);
  CDS.FieldDefs:=DMConciliacao.CDS_CMDepositos.FieldDefs;
  CDS.Data:=DMConciliacao.CDS_CMDepositos.Data;
  CDS.First;
  While Not CDS.Eof do
  Begin
    If (cds.FieldByName('Conciliado?').AsString='NAO') And (cds.FieldByName('Conciliar?').AsString='SIM') Then
    Begin
      EdtConcManutDepQtd.Value:=EdtConcManutDepQtd.Value+1;
      EdtConcManutDepVlr.Value:=EdtConcManutDepVlr.Value+cds.FieldByName('VLR_DOCTO').AsCurrency;

      If Not bVlrEncontrado Then
       LocalizaValoresConciliar(2);
    End;

    CDS.Next;
  End;

  If CDS<>nil Then
  Begin
    FreeAndNil(CDS);
  End;

  EdtConcManutExtDepDif.Value:=EdtConcManutExtratoVlrDep.Value-EdtConcManutDepVlr.Value;

  If EdtConcManutExtDepDif.Value<0 Then
   EdtConcManutExtDepDif.Font.Color:=clRed;

End; // CONCILIA��ES DEPOSITOS - Apresenta Totais Marcados e N�o Conciliados >>>

// CONCILIA��ES DEPOSITOS - Libera CDS_CMExtratos / CDS_CMPagtos para Grava��o >>>>>>>>>>>
Procedure TFrmBancoExtratos.LiberaClientGravarDep(bLibera: Boolean);
Begin
  // CDS_CMExtratos ============================================================
  DMConciliacao.CDS_CMExtratosDepCOD_USUARIO.ReadOnly:=Not bLibera;
  DMConciliacao.CDS_CMExtratosDepConciliado.ReadOnly:=Not bLibera;;
  DMConciliacao.CDS_CMExtratosDepConciliar.ReadOnly:=Not bLibera;;
  DMConciliacao.CDS_CMExtratosDepTIP_CONCILIACAO.ReadOnly:=Not bLibera;
  DMConciliacao.CDS_CMExtratosDepQUEM.ReadOnly:=Not bLibera;

  // CDS_CMPagtos ==============================================================
  DMConciliacao.CDS_CMDepositos.ReadOnly:=Not bLibera;
  DMConciliacao.CDS_CMDepositosConciliado.ReadOnly:=Not bLibera;
  DMConciliacao.CDS_CMDepositosConciliar.ReadOnly:=Not bLibera;
  DMConciliacao.CDS_CMDepositosTIP_CONCILIACAO.ReadOnly:=Not bLibera;
  DMConciliacao.CDS_CMDepositosQUEM.ReadOnly:=Not bLibera;

End; // CONCILIA��ES DEPOSITOS - Libera CDS_CMExtratos / CDS_CMPagtos para Grava��o >>>>>>

// CONCILIA��ES DEPOSITOS - Habilita Botoes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.HabilitaBotoesDep(b: Boolean);
Begin
  Bt_CMPeriodoDep.Enabled:=b;
  Bt_CMConciliarDep.Enabled:=b;
  Pan_ConcSelecionaDep.Enabled:=b;
  Bt_SairDep.Enabled:=b;
End; // CONCILIA��ES DEPOSITOS - Habilita Botoes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// CONCILIA��ES DEPOSITOS - Verifica se Pode Conciliar >>>>>>>>>>>>>>>>>>>>>>>>>
Function  TFrmBancoExtratos.PodeConciliarDepositos(iExtrato, iPagto: Integer): Boolean;
Var
  CDS: TClientDataSet;
Begin
  Result:=True;

  // Extrato ===================================================================
  igTotMarcaExt:=0;
  CDS:=TClientDataSet.Create(Self);
  CDS.FieldDefs:=DMConciliacao.CDS_CMExtratosDep.FieldDefs;
  CDS.Data:=DMConciliacao.CDS_CMExtratosDep.Data;
  CDS.First;
  While Not CDS.Eof do
  Begin
    If (cds.FieldByName('Conciliado?').AsString='NAO') And (cds.FieldByName('Conciliar?').AsString='SIM') Then
    Begin
      Inc(igTotMarcaExt);
    End;

    CDS.Next;
  End;
  igTotMarcaExt:=igTotMarcaExt+iExtrato;

  If CDS<>nil Then
  Begin
    FreeAndNil(CDS);
  End;

  // Pagamentos ================================================================
  igTotMarcaPag:=0;
  CDS:=TClientDataSet.Create(Self);
  CDS.FieldDefs:=DMConciliacao.CDS_CMDepositos.FieldDefs;
  CDS.Data:=DMConciliacao.CDS_CMDepositos.Data;
  CDS.First;
  While Not CDS.Eof do
  Begin
    If (cds.FieldByName('Conciliado?').AsString='NAO') And (cds.FieldByName('Conciliar?').AsString='SIM') Then
    Begin
      Inc(igTotMarcaPag);
    End;

    CDS.Next;
  End;
  igTotMarcaPag:=igTotMarcaPag+iPagto;

  If igTotMarcaPag<0 Then igTotMarcaPag:=0;
  If igTotMarcaExt<0 Then igTotMarcaExt:=0;

// OdirApagar - 13/12/2017 - Conciliar Diversos com Diversos
//  If (igTotMarcaPag>1) and (igTotMarcaExt>1) Then
//   Result:=False;
End; // CONCILIA��ES DEPOSITOS - Verifica se Pode Conciliar >>>>>>>>>>>>>>>>>>>>

// CONCILIA��ES DEPOSITOS - Atualiza Movtos Depositos >>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmBancoExtratos.AtualizaMovtosDepositos: Boolean;
Var
  MySql: String;

  sDta,
  sNrSeq, sNrCompl: String;

  iRegNaoCanc: Integer; // Numero de registros N�o Cancelados

  bInserir, bExcluir: Boolean;
Begin
  Result:=True;

  OdirPanApres.Caption:='AGUARDE !! Atualizando Dep�sitos/Concilia��es no Per�odo de '+sgDtaI+' a '+sgDtaF;

  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBancoExtratos.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBancoExtratos.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmBancoExtratos;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
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

    //==========================================================================
    // Retira Movimento de Sangria Cancelados ==================================
    //==========================================================================
    MySql:=' SELECT s.empresa,'+
           '        s.data,'+
           '        s.usuario,'+
           '        ABS(s.valor) VALOR,'+
           '        COALESCE(s.cod_historico,0) COD_HISTORICO,'+
           '        SUBSTRING(TRIM(s.obs) FROM 1 FOR 80) OBS'+
           ' FROM LINXSANGRIASUPRIMENTOS S'+
           ' WHERE s.valor<0.0000'+
           ' AND   s.cancelado=''S'''+
           ' AND   s.data BETWEEN '+
           QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaI)))+' AND '+
           QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaF)))+
           ' ORDER BY s.empresa, s.data, s.usuario, ABS(s.valor)';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    sNrSeq:='0';
    DMBelShop.CDS_Busca.DisableControls;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      // Busca Movto Deposito/Sangria ==========================================
      MySql:=' SELECT md.num_seq, md.num_compl'+
             ' FROM FIN_CONCILIACAO_MOV_DEP md'+
             ' WHERE md.cod_linx='+DMBelShop.CDS_Busca.FieldByName('Empresa').AsString+
             ' AND   md.dta_docto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DMBelShop.CDS_Busca.FieldByName('Data').AsString)))+
             ' AND   md.num_docto='+DMBelShop.CDS_Busca.FieldByName('Usuario').AsString+
             ' AND   md.vlr_docto='+QuotedStr(f_Troca(',','.',DMBelShop.CDS_Busca.FieldByName('Valor').AsString))+
             ' AND   md.cod_historico='+DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString+
             ' AND   Trim(md.obs_texto)='+QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('Obs').AsString))+
             ' AND   md.num_seq<>'+sNrSeq+
             ' ORDER BY md.num_seq';
      DMBelShop.CDS_Busca1.Close;
      DMBelShop.SDS_Busca1.CommandText:=MySql;
      DMBelShop.CDS_Busca1.Open;

      If Not DMBelShop.CDS_Busca1.IsEmpty Then
      Begin
        sNrSeq:=DMBelShop.CDS_Busca1.FieldByName('Num_Seq').AsString;

        // Verifica se Existe Lancamento de Sangria Igual e N�o Cancelado ======
        iRegNaoCanc:=0;
        MySql:=' SELECT COUNT(s.empresa) Reg_Nao_Canc'+
               ' FROM LINXSANGRIASUPRIMENTOS s'+
               ' WHERE s.cancelado=''N'''+
               ' AND   s.empresa='+DMBelShop.CDS_Busca.FieldByName('Empresa').AsString+
               ' AND   s.data='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DMBelShop.CDS_Busca.FieldByName('Data').AsString)))+
               ' AND   s.usuario='+DMBelShop.CDS_Busca.FieldByName('Usuario').AsString+
               ' AND   ABS(s.valor)='+QuotedStr(f_Troca(',','.',DMBelShop.CDS_Busca.FieldByName('Valor').AsString))+
               ' AND   s.cod_historico='+DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString+
               ' AND   Upper(SUBSTRING(TRIM(s.obs) FROM 1 FOR 80))='+QuotedStr(AnsiUpperCase(Trim(DMBelShop.CDS_Busca.FieldByName('Obs').AsString)));
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;
        iRegNaoCanc:=DMBelShop.CDS_BuscaRapida.FieldByName('Reg_Nao_Canc').AsInteger;
        DMBelShop.CDS_BuscaRapida.Close;

        bExcluir:=False;
        If DMBelShop.CDS_Busca1.RecordCount<>iRegNaoCanc Then
         bExcluir:=True;

        If bExcluir Then // Exclui Movimento Devido a Cacelamentos
        Begin
          // Exclui FIN_CONCILIACAO_MOV_DEP ====================================
          MySql:=' DELETE FROM FIN_CONCILIACAO_MOV_DEP md'+
                 ' WHERE md.num_seq='+sNrSeq+
                 ' AND   md.num_compl='+DMBelShop.CDS_Busca1.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql,nil,nil);

          // Busca Chave do Extrato se Conciliado ==============================
          MySql:=' SELECT d.chv_extrato'+
                 ' FROM FIN_CONCILIACAO_DEPOSITOS d'+
                 ' WHERE d.num_seq='+sNrSeq+
                 ' AND   d.num_compl='+DMBelShop.CDS_Busca1.FieldByName('Num_Compl').AsString+
                 ' ORDER BY d.chv_extrato';
          DMBelShop.CDS_BuscaRapida.Close;
          DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
          DMBelShop.CDS_BuscaRapida.Open;

          DMBelShop.CDS_BuscaRapida.DisableControls;
          While Not DMBelShop.CDS_BuscaRapida.Eof do
          Begin
            // Exclui Todos as Concilia��es Realizadas =========================
            MySql:=' DELETE FROM FIN_CONCILIACAO_DEPOSITOS d'+
                   ' WHERE d.chv_extrato='+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('chv_extrato').AsString);
            DMBelShop.SQLC.Execute(MySql,nil,nil);

            DMBelShop.CDS_BuscaRapida.Next;
          End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
          DMBelShop.CDS_BuscaRapida.EnableControls;
          DMBelShop.CDS_BuscaRapida.Close;
        End; // If bExcluir Then // Exclui Movimento Devido a Cacelamentos
      End; // If Not DMBelShop.CDS_Busca1.IsEmpty Then
      DMBelShop.CDS_Busca1.Close;

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.EnableControls;
    DMBelShop.CDS_Busca.Close;
    // Retira Movimento de Sangria Cancelados ==================================
    //==========================================================================

    //==========================================================================
    // Exclui Concilia��es Existentes Sem Depositos ============================
    //==========================================================================
    MySql:=' DELETE FROM FIN_CONCILIACAO_DEPOSITOS d'+
           ' WHERE NOT EXISTS (SELECT 1'+
           '                   FROM FIN_CONCILIACAO_MOV_DEP M'+
           '                   WHERE m.num_seq=d.num_seq'+
           '                   AND   m.num_compl=d.num_compl)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);
    // Exclui Concilia��es Existentes Sem Depositos ============================
    //==========================================================================

    //==========================================================================
    // Exclui Concilia��es Existentes Sem Extratos =============================
    //==========================================================================
    MySql:=' DELETE FROM FIN_CONCILIACAO_DEPOSITOS d'+
           ' WHERE COALESCE(d.tip_conciliacao,'''')<>''DINH'''+
           ' AND   COALESCE(d.tip_conciliacao,'''')<>''DESP'''+
           ' AND   NOT EXISTS (SELECT 1'+
           '                   FROM FIN_BANCOS_EXTRATOS ex'+
           '                   WHERE ex.chv_extrato=d.chv_extrato)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);
    // Exclui Concilia��es Existentes Sem Extratos =============================
    //==========================================================================

    //==========================================================================
    // Coloca para N�o Conciliado Retirado de FIN_CONCILIACAO_DEPOSITOS ========
    //==========================================================================
    MySql:=' UPDATE FIN_CONCILIACAO_MOV_DEP m'+
           ' SET m.ind_conciliacao=''NAO'''+
           ' WHERE m.ind_conciliacao=''SIM'''+
           ' AND   NOT EXISTS (SELECT 1'+
           '                   FROM FIN_CONCILIACAO_DEPOSITOS D'+
           '                   WHERE d.num_seq=m.num_seq'+
           '                   AND   d.num_compl=m.num_compl)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);
    // Coloca para N�o Conciliado Retirado de FIN_CONCILIACAO_DEPOSITOS ========
    //==========================================================================

    //==========================================================================
    // Insere Novos Movtos de Deposito/Sangria =================================
    //==========================================================================
    // Busca Deposito/Sangria para Analise no Periodo Solicitado ===============
    MySql:=' SELECT'+
           ' s.cod_loja COD_LOJA,'+
           ' s.empresa COD_LINX,'+
           ' s.usuario NUM_DOCTO,'+
           ' s.data DTA_DOCTO,'+
           ' COALESCE(s.cod_historico,0) COD_HISTORICO,'+
           ' SUBSTRING(TRIM(s.obs) FROM 1 FOR 80) OBS_TEXTO,'+
           ' SUM(ABS(s.valor)) VLR_DOCTO,'+
           ' COUNT(s.empresa) TotReg'+

           ' FROM LINXSANGRIASUPRIMENTOS s'+

           ' WHERE s.valor<0.0000'+
           ' AND   s.cancelado=''N'''+
           ' AND   s.data BETWEEN '+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaI)))+' AND '+
                                    QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaF)))+
           ' GROUP BY 1,2,3,4,5,6'+
           ' ORDER BY 2,3,4,5,6,7';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    FrmBelShop.MontaProgressBar(True, FrmBancoExtratos);
    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    pgProgBar.Position:=0;

    DMBelShop.CDS_Busca.DisableControls;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      sDta:=f_Troca('/','.',f_Troca('-','.',DMBelShop.CDS_Busca.FieldByName('Dta_Docto').AsString));

      // Verifica Existencia do Movto Deposito/Sangria =========================
      MySql:=' SELECT'+
             ' md.cod_loja,'+
             ' md.cod_linx,'+
             ' md.num_docto,'+
             ' md.dta_docto,'+
             ' TRIM(md.obs_texto) obs_texto, SUM(md.vlr_docto) Vlr_Docto,'+
             ' COUNT(md.cod_linx) TotReg'+

             ' FROM FIN_CONCILIACAO_MOV_DEP md'+

             ' WHERE md.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
             ' AND   md.cod_linx='+DMBelShop.CDS_Busca.FieldByName('Cod_Linx').AsString+
             ' AND   md.num_docto='+DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString+
             ' AND   md.cod_historico='+DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString+
             ' AND   md.dta_docto='+QuotedStr(sDta)+
             ' AND   TRIM(md.obs_texto)='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Obs_Texto').AsString)+
             ' GROUP BY 1,2,3,4,5';
      DMBelShop.CDS_Busca1.Close;
      DMBelShop.SDS_Busca1.CommandText:=MySql;
      DMBelShop.CDS_Busca1.Open;

      // Se Nao Existe ou For Diferentes os Totais Ient�o Insere ===============
      bInserir:=True;
      If Not DMBelShop.CDS_Busca1.IsEmpty Then
      Begin
        If (DMBelShop.CDS_Busca.FieldByName('Vlr_Docto').AsCurrency=DMBelShop.CDS_Busca1.FieldByName('Vlr_Docto').AsCurrency) And
           (DMBelShop.CDS_Busca.FieldByName('TotReg').AsInteger=DMBelShop.CDS_Busca1.FieldByName('TotReg').AsInteger) Then
         bInserir:=False;
      End; // If Not DMBelShop.CDS_Busca1.IsEmpty Then
      DMBelShop.CDS_Busca1.Close;

      // Se Insere Depositos Novos =============================================
      If bInserir Then
      Begin
        sNrSeq  :='0';
        sNrCompl:='0';

        // Busca Num_Seq, Num_Compl a Excluir ==================================
        MySql:=' SELECT md.num_seq, md.num_compl'+
               ' FROM FIN_CONCILIACAO_MOV_DEP md'+
               ' WHERE md.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   md.cod_linx='+DMBelShop.CDS_Busca.FieldByName('Cod_Linx').AsString+
               ' AND   md.num_docto='+DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString+
               ' AND   md.cod_historico='+DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString+
               ' AND   md.dta_docto='+QuotedStr(sDta)+
               ' AND   TRIM(md.obs_texto)='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Obs_Texto').AsString);
        DMBelShop.CDS_Busca1.Close;
        DMBelShop.SDS_Busca1.CommandText:=MySql;
        DMBelShop.CDS_Busca1.Open;

        // Exclui FIN_CONCILIACAO_MOV_DEP e FIN_CONCILIACAO_DEPOSITOS ==========
        DMBelShop.CDS_Busca1.DisableControls;
        While Not DMBelShop.CDS_Busca1.Eof do
        Begin
          sNrSeq  :='0';
          sNrCompl:='0';
          If Trim(DMBelShop.CDS_Busca1.FieldByName('Num_Seq').AsString)<>'' Then
          Begin
            sNrSeq  :=DMBelShop.CDS_Busca1.FieldByName('Num_Seq').AsString;
            sNrCompl:=DMBelShop.CDS_Busca1.FieldByName('Num_Compl').AsString;
          End;

          If Trim(sNrSeq)<>'0' Then
          Begin
            // Exclui FIN_CONCILIACAO_MOV_DEP ==================================
            MySql:=' DELETE FROM FIN_CONCILIACAO_MOV_DEP md'+
                   ' WHERE md.num_seq='+sNrSeq+
                   ' AND   md.num_compl='+sNrCompl;
            DMBelShop.SQLC.Execute(MySql,nil,nil);

            // Busca Chave do Extrato se Conciliado Com Extrato ================
            MySql:=' SELECT d.chv_extrato'+
                   ' FROM FIN_CONCILIACAO_DEPOSITOS d'+
                   ' WHERE d.num_seq='+sNrSeq+
                   ' AND   d.num_compl='+sNrCompl+
                   ' ORDER BY d.chv_extrato';
            DMBelShop.CDS_BuscaRapida.Close;
            DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
            DMBelShop.CDS_BuscaRapida.Open;

            DMBelShop.CDS_BuscaRapida.DisableControls;
            While Not DMBelShop.CDS_BuscaRapida.Eof do
            Begin
              // Exclui Todos as Concilia��es Realizadas Pelo Extratos =========
              MySql:=' DELETE FROM FIN_CONCILIACAO_DEPOSITOS d'+
                     ' WHERE d.chv_extrato='+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Chv_Extrato').AsString);
              DMBelShop.SQLC.Execute(MySql,nil,nil);

              DMBelShop.CDS_BuscaRapida.Next;
            End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
            DMBelShop.CDS_BuscaRapida.EnableControls;
            DMBelShop.CDS_BuscaRapida.Close;

            // Exclui Concili��o Pelo Num_Seq e Num_Compl se Concilia��o Pelo Pagto =======
            MySql:=' DELETE FROM FIN_CONCILIACAO_DEPOSITOS d'+
                   ' WHERE d.num_seq='+sNrSeq+
                   ' AND   d.num_compl='+sNrCompl;
            DMBelShop.SQLC.Execute(MySql,nil,nil);
          End; // If Trim(sNrSeq)<>'0' Then

          DMBelShop.CDS_Busca1.Next;
        End; // While Not DMBelShop.CDS_Busca1.Eof do
        DMBelShop.CDS_Busca1.EnableControls;
        DMBelShop.CDS_Busca1.Close;

        // Insere Novos Movimentos de Dep�sitos ================================
        MySql:=' INSERT INTO FIN_CONCILIACAO_MOV_DEP'+
               ' SELECT '+
               ' GEN_ID(GEN_CONCILIACAO_MOV_DEP,1) NUM_SEQ, '+
               ' GEN_ID(GEN_COMPL_CONCILIACAO_MOV_DEP,0) NUM_COMPL,'+
               ' s.cod_loja COD_LOJA,'+
               ' s.empresa COD_LINX,'+
               ' s.usuario NUM_DOCTO,'+
               ' s.data DTA_DOCTO,'+
               ' s.data DTA_VENC,'+
               ' NULL COD_BANCO,'+
               ' NULL DES_BANCO,'+
               ' 0 COD_PESSOA,'+ // 0 - Indica Lan�amento de Sangria
               ' CAST(ABS(s.valor) AS NUMERIC(12,2)) VLR_ORIGINAL,'+
               ' 0.00 VLR_DESCONTO,'+
               ' 0.00 VLR_ACRESCIMO,'+
               ' CAST(ABS(s.valor) AS NUMERIC(12,2)) VLR_DOCTO,'+
               ' SUBSTRING(TRIM(s.obs) FROM 1 FOR 80) OBS_TEXTO,'+
               ' ''NAO'' IND_CONCILIACAO,'+
               ' 0 COD_HISTO_AUTO,'+
               ' 0 COD_BANCO_AUTO,'+
               ' COALESCE(s.cod_historico,0) COD_HISTORICO,'+
               ' s.desc_historico,'+
               ' NULL OBS_NAO_CONC'+

               ' FROM LINXSANGRIASUPRIMENTOS s'+

               ' WHERE s.valor<0.0000'+
               ' AND   s.cancelado=''N'''+
               ' AND   s.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   s.empresa='+DMBelShop.CDS_Busca.FieldByName('Cod_Linx').AsString+
               ' AND   s.usuario='+DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString+
               ' AND   COALESCE(s.cod_historico,0)='+DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString+
               ' AND   s.data='+QuotedStr(sDta)+
               ' AND   SUBSTRING(TRIM(s.obs) FROM 1 FOR 80)='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Obs_Texto').AsString);
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If bInseri Then

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.EnableControls;
    DMBelShop.CDS_Busca.Close;
    FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);
    // Insere Novos Movtos de Deposito/Sangria =================================
    //==========================================================================

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);
      Result:=False;

      FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transa��o

  DateSeparator:='/';
  DecimalSeparator:=',';

  OdirPanApres.Visible:=False;

  Screen.Cursor:=crDefault;

End; // CONCILIA��ES DEPOSITOS - Atualiza Movtos Depositos >>>>>>>>>>>>>>>>>>>>>

// Menus Visivel >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.VisivelMenusConciliacoes(b: Boolean);
Var
  i, ii: Integer;
Begin
  For i:=0 to MainMenu1.Items.Count-1 do
  Begin
    For ii:=0 to MainMenu1.Items[i].Count-1 do
    Begin
      MainMenu1.Items[i].Items[ii].Visible:=b;
    End; // For ii:=0 to MainMenu1.Items[i].Count-1 do
    MainMenu1.Items[i].Visible:=b;
  End; // For i:=0 to MainMenu1.Items.Count-1 do

//  MenuConcilicao.Visible         :=False;
//  MenuManutConcilicao.Visible    :=False;
//  MenuParametros.Visible         :=False;
//  MenuTipoConcilciao.Visible     :=False;
//  MenuHistoricosBancarios.Visible:=False;

End; // Menus Visivel >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Desabilita TabSheets - Habilita Somente a TS: TTabSheet >>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.DesabilitaTabSheet(TS: TTabSheet);
Begin
  // TS = TabSheet a Liberar
  Ts_BancosManut.TabVisible               :=False;
  Ts_VerificaExtrato.TabVisible           :=False;
  Ts_ExtratosManut.TabVisible             :=False;

  Ts_ConciliacaoManutPagtos.TabVisible    :=False;
  Ts_ConciliacoesManutPagtos.TabVisible   :=False;

  Ts_ConciliacoesManutDepositos.TabVisible:=False;
  Ts_ConciliacoesManutDepAnalise.TabVisible:=False;

  Ts_ConcManutTotalPagtos.TabVisible      :=False;
  Ts_HistConcAuto.TabVisible              :=False;

  If TS<>nil Then
   TS.TabVisible:=True;  // OK
End; // Desabilita TabSheets - Habilita Somente a TS: TTabSheet >>>>>>>>>>>>>>>>

// Habilita Botoes Concilia��o Pagtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.HabilitaBotoes(b: Boolean);
Begin
  Bt_CMApresFiltro.Enabled:=b;
  Bt_CMConciliar.Enabled:=b;
  Pan_ConcSeleciona.Enabled:=b;
  Bt_Sair.Enabled:=b;
End; // Habilita Botoes Concilia��o Pagtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Libera Op��es de Menu >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.LiberaMenu(b: Boolean);
Begin
  MenuConcilicao.Enabled:=b;
  MenuManutConcilicao.Enabled:=b;
  MenuParametros.Enabled:=b;
  MenuTipoConcilciao.Enabled:=b;
  MenuHistoricosBancarios.Enabled:=b;

  If b Then
   Bt_Sair.Caption:='Sair'
  Else
   Bt_Sair.Caption:='Voltar';

End; // Libera Op��es de Menu >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// MANUTENCAO DE EXTRATOS - Cria Dias Sem Extrato >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.CriaDiasSemExtrato;
Var
  MySql: string;
  dDtaInicio, dDtaFim: TDate;
  bFeriado: Boolean;
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

    OdirPanApres.Caption:='AGUARDE !! Criando Dias Sem Extrato Banc�rio...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBancoExtratos.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBancoExtratos.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Visible:=True;
    Refresh;

    FrmBelShop.MontaProgressBar(True, FrmBancoExtratos);
    pgProgBar.Position:=DMBelShop.CDS_Busca.RecordCount;

    DMBelShop.CDS_Busca.First;
    While not DMBelShop.CDS_Busca.Eof do
    Begin
      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;
      Refresh;

      dDtaInicio:=DtEdt_VerifExtratoDtaInicio.Date;
      dDtaFim   :=DtEdt_VerifExtratoDtaFim.Date;

      If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' then
      Begin
        While dDtaInicio<=dDtaFim do
        Begin
           MySql:=' Select f.Dta_Feriado'+
                  ' From FIN_FERIADOS_ANO f'+
                  ' Where f.Ind_Ativo=''SIM'''+
                  ' And   f.Dta_Feriado='+QuotedStr(f_Troca('-','.',f_Troca('/','.',DateToStr(dDtaInicio))));
           DMBelShop.CDS_BuscaRapida.Close;
           DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
           DMBelShop.CDS_BuscaRapida.Open;

           bFeriado:=False;
           If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Feriado').AsString)<>'' Then
            bFeriado:=True;

          If (DiaSemanaAbrev(dDtaInicio)<>'Dom') And (DiaSemanaAbrev(dDtaInicio)<>'Sab') And (Not bFeriado) Then
          Begin
            MySql:=' SELECT e.cod_banco'+
                   ' FROM fin_bancos_extratos e'+
                   ' WHERE e.cod_banco='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Banco').AsString)+
                   ' AND   e.num_seq=999999'+
                   ' AND   e.dta_extrato='+QuotedStr(f_Troca('-','.',f_Troca('/','.',DateToStr(dDtaInicio))));
            DMBelShop.CDS_BuscaRapida.Close;
            DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
            DMBelShop.CDS_BuscaRapida.Open;

            If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Banco').AsString)='' Then
            Begin
              MySql:=' INSERT INTO FIN_BANCOS_EXTRATOS (COD_BANCO, DTA_EXTRATO,'+
                     ' NUM_SEQ, COD_TPMOVTO, NUM_DOCTO, VLR_DOCTO, USU_INCLUI, DTA_INCLUI)'+

                     ' SELECT FIRST 1'+
                     QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Banco').AsString)+' COD_BANCO,'+
                     QuotedStr(f_Troca('-','.',f_Troca('/','.',DateToStr(dDtaInicio))))+' DTA_EXTRATO,'+
                     ' NUM_SEQ, COD_TPMOVTO, NUM_DOCTO, VLR_DOCTO,'+
                     QuotedStr(Trim(sgCodUsuario))+' USU_INCLUI,'+
                     ' CURRENT_TIMESTAMP DTA_INCLUI'+

                     ' FROM FIN_BANCOS_EXTRATOS b'+
                     ' WHERE b.num_seq=999999'+
                     ' AND b.cod_banco='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Banco').AsString)+
                     ' AND b.dta_extrato<'+QuotedStr(f_Troca('-','.',f_Troca('/','.',DateToStr(dDtaInicio))))+
                     ' ORDER BY b.dta_extrato DESC';
              DMBelShop.SQLC.Execute(MySql,nil,nil);

            End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Banco').AsString)='' Then
            DMBelShop.CDS_BuscaRapida.Close;

          End; // If (DiaSemanaAbrev(dDtaInicio)<>'Dom') And (DiaSemanaAbrev(dDtaInicio)<>'Sab') And (Not bFeriado) Then

          dDtaInicio:=dDtaInicio+1;
        End; // While dDtaInicio<=dDtaFim do
      End; // if DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' then

      DMBelShop.CDS_Busca.Next;
    End; // While not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.First;

    OdirPanApres.Visible:=False;
    FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);

    msg('Cria��o de Dias Sem Extrato Banc�rio Efetuada com SUCESSO !!','A');

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

      OdirPanApres.Visible:=False;
      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Erro ao Gerar Dias Sem Extrato !!'+#13+e.message), 'ATEN��O', MB_ICONERROR);

      Exit;
    End; // on e : Exception do
  End; // Try

End; // MANUTENCAO DE EXTRATOS - Cria Dias Sem Extrato >>>>>>>>>>>>>>>>>>>>>>>>>

// MANUTENCAO DE EXTRATOS - Importa Extrato Santander Excel para StringGris >>>>
function TFrmBancoExtratos.ImportaExtratoSantander(AGrid: TStringGrid; sPasta: String; slArquivos: TStringList): Boolean;
const
  xlCellTypeLastCell = $0000000B;
var
  XLApp, Sheet: OLEVariant;
  RangeMatrix: Variant;

  k2, // Numero de Linhas Acumuladas das Planilhas
  x, y, k, r: Integer;

  i: Integer;
  s: String;
  bContaOK: Boolean;
begin
  // Colocar no Uses: Comobj;

  // AGrid: StringGrid de Extratos
  // sPasta: Pasta Onde esta os Arquivos Excel
  // slArquivos: StringList com Nome doArquivos Excel

  sgAgencia:='';
  sgContaCorrente:='';

  Result:=False;
  bContaOK:=True;

  //============================================================================
  // Cria Excel- OLE Object ====================================================
  //============================================================================
  XLApp:=CreateOleObject('Excel.Application');
  try
    // Esconde Excel
    XLApp.Visible:=False;

    //==========================================================================
    // Processa Arquivos Selecionados
    //==========================================================================
    For i:=0 to slgArquivos.Count-1 do
    Begin
      OdirPanApres.Caption:='AGUARDE !! Inicializando Arquivo Excel:'+slArquivos[i];
      Refresh;

      // Abre o Workbook
      XLApp.Workbooks.Open(sPasta+slgArquivos[i]);
      Sheet:=XLApp.Workbooks[slgArquivos[i]].WorkSheets[1];
      Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

      // Inicializa Numero de Linhas do Docto ==================================
      If i=0 Then
      Begin
        K2:=0;
      End; // If i=0 Then

      // Pegar o n�mero da �ltima linha/coluna
      x :=XLApp.ActiveCell.Row;
      y:=XLApp.ActiveCell.Column;

      // Seta Stringrid linha e coluna
      AGrid.RowCount:=x;
      AGrid.ColCount:=y;

      // Seta Stringrid N� Linha mais a N� de Linhas dos Doctos Anteriores =====
      If k2<>0 Then
       AGrid.RowCount:=AGrid.RowCount + k2;

      // Associaca a variant WorkSheet com a variant do Delphi
      k:=1;
      RangeMatrix:=XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;

      // Analisa se Primeiro Arquivo Come�a com Hist�rio Igual 'SALDO ANTERIOR'
      If (i=0) Then
      Begin
        If (AnsiUpperCase(Trim(RangeMatrix[1, 1]))='AGENCIA') And (AnsiUpperCase(Trim(RangeMatrix[4, 3]))<>'SALDO ANTERIOR') Then
        Begin
          sgMensagemERRO:='Erro no Primeiro Arquivo !!'+cr+slgArquivos[i]+cr+'Deve Come�ar com o Hist�rico'+cr+'SALDO ANTERIOR';
          XLApp.Quit;
          XLAPP:=Unassigned;
          Sheet:=Unassigned;
          FreeAndNil(XLApp);
          Exit;
        End; // If (AnsiUpperCase(Trim(RangeMatrix[1, 1]))='AGENCIA') And (AnsiUpperCase(Trim(RangeMatrix[4, 3]))<>'SALDO ANTERIOR') Then

        If (AnsiUpperCase(Trim(RangeMatrix[1, 1]))='DATA') And (AnsiUpperCase(Trim(RangeMatrix[2, 3]))<>'SALDO ANTERIOR') Then
        Begin
          sgMensagemERRO:='Erro no Primeiro Arquivo !!'+cr+slgArquivos[i]+cr+'Deve Come�ar com o Hist�rico'+cr+'SALDO ANTERIOR';
          XLApp.Quit;
          XLAPP:=Unassigned;
          Sheet:=Unassigned;
          FreeAndNil(XLApp);
          Exit;
        End; // If (AnsiUpperCase(Trim(RangeMatrix[1, 1]))='AGENCIA') And (AnsiUpperCase(Trim(RangeMatrix[4, 3]))<>'SALDO ANTERIOR') Then
      End; // If (i=0) Then

      // Verifica se Outros Arquivos Come�a com Hist�rio Igual 'SALDO ANTERIOR'
      If (i<>0) and (AnsiUpperCase(Trim(RangeMatrix[4, 3]))='SALDO ANTERIOR') Then
      Begin
        sgMensagemERRO:='Erro no '+IntToStr(i+1)+'� Arquivo !!'+cr+slgArquivos[i]+cr+
                        'N�o Pode Come�ar com o Hist�rico'+cr+'SALDO ANTERIOR';
        XLApp.Quit;
        XLAPP:=Unassigned;
        Sheet:=Unassigned;
        FreeAndNil(XLApp);
        Exit;
      End;

      // Analisa Agencia e Conta ===============================================
      sgAgencia      :='';
      sgContaCorrente:='';
      bgComNrConta:=False;
      If (AnsiUpperCase(Trim(RangeMatrix[1, 1]))='AGENCIA') Then
      Begin
        sgAgencia     :=Trim(RangeMatrix[k, 2]);
        sgContaCorrente:=Trim(f_Troca(' ','',RangeMatrix[k, 4]));
        If ((EdtExtNumAgencia.Text<>sgAgencia) Or (Tira_Mascara(EdtExtNumConta.Text)<>sgContaCorrente)) Then
        Begin
          bContaOK:=False;
          sgMensagemERRO:='Arquivo: '+slArquivos[i]+' N�O Pertence a Conta Selecionada !!'+cr+cr+
                          'Pertence a'+cr+'Ag�ncia: '+sgAgencia+' C/Corrente:'+sgContaCorrente;
          XLApp.Quit;
          XLAPP:=Unassigned;
          Sheet:=Unassigned;
          FreeAndNil(XLApp);
          Exit;
        End;
      End; // If (AnsiUpperCase(Trim(RangeMatrix[1, 1]))='AGENCIA') Then
      //========================================================================
      // Cria o loop para listar os registros no TStringGrid
      //========================================================================
      repeat
        for r:=1 to y do
        Begin
          s:=Trim(RangeMatrix[k, 1]);

          If (StrToIntDef(copy(RangeMatrix[k, 1],1,1),999999)<>999999) and (Trim(RangeMatrix[k, 1])<>'') and (Trim(RangeMatrix[K, R])<>'')Then
          Begin
            AGrid.Cells[(r-1),(k-1)+k2]:=RangeMatrix[K, R]
          End;
        End;
      Inc(k,1);
      until k > x;
      // Cria o loop para listar os registros no TStringGrid
      //========================================================================

      //========================================================================
      // Inicializa Matrix - Acumula N� Linha da Docto =========================
      //========================================================================
      RangeMatrix:=Unassigned;
      k2:=k2+k;
      // Inicializa Matrix - Acumula N� Linha da Docto
      //========================================================================
    End; // For i:=0 to slgArquivos.Count-1 do
    // Processa Arquivos Selecionados
    //==========================================================================
  finally
    if not VarIsEmpty(XLApp) then // Fecha o Excel
    begin
      XLApp.Quit;
      XLAPP:=Unassigned;
      Sheet:=Unassigned;

      If bContaOK Then
       Result:=True;
    end; // if not VarIsEmpty(XLApp) then
  end; // Try
  // Cria Excel- OLE Object ====================================================
  //============================================================================

  FreeAndNil(XLApp);
End; // MANUTENCAO DE EXTRATOS - Importa Extrato Santander Excel para StringGris >>>>

// CONCILIA��ES - Elimina Movots do SIDICOM com Erro de Concilia��o >>>>>>>>>>>>
Procedure TFrmBancoExtratos.EliminarConciliacaoError;
Var
  MySql: String;
Begin

  OdirPanApres.Caption:='AGUARDE !! Analisando Concilia��es...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBancoExtratos.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBancoExtratos.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmBancoExtratos;
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
  Try
    Screen.Cursor:=crAppStart;

    MySql:=' DELETE FROM FIN_CONCILIACAO_PAGTOS p'+
           ' WHERE COALESCE(p.tip_conciliacao,'''')<>''DINH'''+
           ' AND   COALESCE(p.tip_conciliacao,'''')<>''DESP'''+
           ' AND   NOT EXISTS (SELECT 1'+
           '                   FROM FIN_BANCOS_EXTRATOS e'+
           '                   WHERE e.chv_extrato=p.chv_extrato)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    MySql:=' UPDATE FIN_CONCILIACAO_MOVTOS m'+
           ' SET m.IND_CONCILIACAO=''NAO'''+
           ' WHERE m.IND_CONCILIACAO=''SIM'''+
           ' AND NOT EXISTS (SELECT 1'+
           '                 FROM  FIN_CONCILIACAO_PAGTOS p'+
           '                 WHERE p.num_seq=m.num_seq'+
           '                 AND p.num_compl=m.num_compl)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    MySql:=' DELETE FROM FIN_CONCILIACAO_DEPOSITOS d'+
           ' WHERE COALESCE(d.tip_conciliacao,'''')<>''DINH'''+
           ' AND   COALESCE(d.tip_conciliacao,'''')<>''DESP'''+
           ' AND   NOT EXISTS (SELECT 1'+
           '                   FROM FIN_BANCOS_EXTRATOS e'+
           '                   WHERE e.chv_extrato=d.chv_extrato)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    MySql:=' UPDATE FIN_CONCILIACAO_MOV_DEP m'+
           ' SET m.ind_conciliacao=''NAO'''+
           ' WHERE m.ind_conciliacao=''SIM'''+
           ' AND NOT EXISTS (SELECT 1'+
           '                 FROM  FIN_CONCILIACAO_DEPOSITOS d'+
           '                 WHERE d.num_seq=m.num_seq'+
           '                 AND   d.num_compl=m.num_compl)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      Screen.Cursor:=crDefault;
    End; // on e : Exception do
  End; // Try

  OdirPanApres.Visible:=False;

End; // CONCILIA��ES - Elimina Movots do SIDICOM com Erro de Concilia��o >>>>>>>

// CONCILIA��ES - Apresenta Totais Marcados e N�o Conciliados >>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.TotaisMarcadosNaoConciliados;
Var
  CDS: TClientDataSet;
  bVlrEncontrado: Boolean;
Begin
  bVlrEncontrado:=False;

  EdtConcManutExtratoQtd.Value:=0;
  EdtConcManutExtratoVlr.Value:=0;

  EdtConcManutPagtoQtd.Value:=0;
  EdtConcManutPagtoVlr.Value:=0;

  EdtConcManutExtPagDif.Value:=0;
  EdtConcManutExtPagDif.Font.Color:=clWindowText;

  CDS:=TClientDataSet.Create(Self);
  CDS.FieldDefs:=DMConciliacao.CDS_CMExtratos.FieldDefs;
  CDS.Data:=DMConciliacao.CDS_CMExtratos.Data;
  CDS.First;
  While Not CDS.Eof do
  Begin
    If (cds.FieldByName('Conciliado?').AsString='NAO') And (cds.FieldByName('Conciliar?').AsString='SIM') Then
    Begin
      EdtConcManutExtratoQtd.Value:=EdtConcManutExtratoQtd.Value+1;
      EdtConcManutExtratoVlr.Value:=EdtConcManutExtratoVlr.Value+cds.FieldByName('VLR_DOCTO').AsCurrency;
      LocalizaValoresConciliar(3);
    End;

    CDS.Next;
  End;

  If CDS<>nil Then
  Begin
    FreeAndNil(CDS);
  End;

  CDS:=TClientDataSet.Create(Self);
  CDS.FieldDefs:=DMConciliacao.CDS_CMPagtos.FieldDefs;
  CDS.Data:=DMConciliacao.CDS_CMPagtos.Data;
  CDS.First;
  While Not CDS.Eof do
  Begin
    If (cds.FieldByName('Conciliado?').AsString='NAO') And (cds.FieldByName('Conciliar?').AsString='SIM') Then
    Begin
      EdtConcManutPagtoQtd.Value:=EdtConcManutPagtoQtd.Value+1;
      EdtConcManutPagtoVlr.Value:=EdtConcManutPagtoVlr.Value+cds.FieldByName('VLR_PAGTO').AsCurrency;
      If Not bVlrEncontrado Then
       LocalizaValoresConciliar(4);
    End;

    CDS.Next;
  End;

  If CDS<>nil Then
  Begin
    FreeAndNil(CDS);
  End;

  EdtConcManutExtPagDif.Value:=EdtConcManutExtratoVlr.Value-EdtConcManutPagtoVlr.Value;

  If EdtConcManutExtPagDif.Value<0 Then
   EdtConcManutExtPagDif.Font.Color:=clRed;

End; // CONCILIA��ES - Apresenta Totais Marcados e N�o Conciliados >>>>>>>>>>>>>

// CONCILIA��ES - Filtro para Concilia��o - PopupMenu - CONCILIADOS >>>>>>>>>>>>
Procedure TFrmBancoExtratos.ConcPopMenuClickSIM(Sender: TObject);
Begin

  DMConciliacao.CDS_ConcExtratos.Filter:='';
  DMConciliacao.CDS_ConcExtratos.Filtered:=False;

  DMConciliacao.CDS_ConcExtratos.Filter:='Conciliado='+QuotedStr('SIM');
  DMConciliacao.CDS_ConcExtratos.Filtered:=True;

End; // CONCILIA��ES - Filtro para Concilia��o - PopupMenu - CONCILIADOS >>>>>>>

// CONCILIA��ES - Filtro para Concilia��o - PopupMenu - NAO CONCILIADOS >>>>>>>>
Procedure TFrmBancoExtratos.ConcPopMenuClickNAO(Sender: TObject);
Begin

  DMConciliacao.CDS_ConcExtratos.Filter:='';
  DMConciliacao.CDS_ConcExtratos.Filtered:=False;

  DMConciliacao.CDS_ConcExtratos.Filter:='Conciliado='+QuotedStr('NAO');
  DMConciliacao.CDS_ConcExtratos.Filtered:=True;

End; // CONCILIA��ES - Filtro para Concilia��o - PopupMenu - NAO CONCILIADOS >>>

// CONCILIA��ES - Filtro para Concilia��o - PopupMenu - TODOS >>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.ConcPopMenuClick(Sender: TObject);
Begin

  DMConciliacao.CDS_ConcExtratos.Filter:='';
  DMConciliacao.CDS_ConcExtratos.Filtered:=False;

End; // CONCILIA��ES - Filtro para Concilia��o - PopupMenu - TODOS >>>>>>>>>>>>>

// CONCILIA��ES - Processa Por Pagamento ou Extrato >>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmBancoExtratos.ProcessaConciciacao(sTipo: String): Boolean;
Var
  MySql: String;
  sChvExtrato, sChvPagto, sNumSeq, sNumCompl: String;
  s: String;
  i: Integer;
Begin
  //===========================================================
  // Tipo de Concilia��o
  //===========================================================
  // sTipo= (Pag) Processa Pagamento --------> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = null Ou Pelo Sisitema)
  // sTipo= (Ext) Processa Extrato ----------> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = null Ou Pelo Sisitema)
  // sTipo= (Din) Processa Como Dinheiro ----> (FIN_CONCILIACAO_DEPOSITOS.tip_conciliacao = DINH)
  // sTipo= (SEx) Processa Somente Extrato (Cria FIN_CONCILIACAO_MOVTOS)--> (FIN_CONCILIACAO_PAGTOS.tip_conciliacao = SExt)

  Result:=False;

  sNumCompl  :=DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;
  sNumSeq    :=DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString;
  sChvPagto  :=DMConciliacao.CDS_CMPagtosCHV_PAGTO.AsString;
  sChvExtrato:=DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString;

  //============================================================================
  // Concilia Por Pagamento ====================================================
  //============================================================================
  If sTipo='Pag' Then
  Begin
    DMConciliacao.CDS_CMPagtos.First;
    DMConciliacao.CDS_CMPagtos.DisableControls;
    While Not DMConciliacao.CDS_CMPagtos.Eof do
    Begin
      Refresh;

      If (DMConciliacao.CDS_CMPagtosConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMPagtosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMPagtosQUEM.AsString)='') Then
      Begin
        sNumCompl  :=DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;
        sNumSeq    :=DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString;
        Break;
      End;

      DMConciliacao.CDS_CMPagtos.Next;
    End; // While Not DMConciliacao.CDS_CMPagtos.Eof do
    DMConciliacao.CDS_CMPagtos.EnableControls;

    // Libera Para Grava��o ====================================================
    LiberaClientGravar(True);

    DMConciliacao.CDS_CMPagtos.Edit;
    DMConciliacao.CDS_CMPagtosCOD_USUARIO.AsString:=sgCodUsuario;
    DMConciliacao.CDS_CMPagtosConciliado.AsString:='SIM';
    DMConciliacao.CDS_CMPagtosQUEM.AsString:='USU';
    DMConciliacao.CDS_CMPagtos.Post;

    // Retira a Libera�ao Para Grava��o ========================================
    LiberaClientGravar(False);

    MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
           ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
           ' Where m.Num_Seq='+DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString+
           ' And   m.Num_Compl='+DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DMConciliacao.CDS_CMExtratos.First;
    DMConciliacao.CDS_CMExtratos.DisableControls;
    HabilitaBotoes(False);
    While Not DMConciliacao.CDS_CMExtratos.Eof do
    Begin
      Refresh;

      If (DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMExtratosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMExtratosQUEM.AsString)='') Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString;

        // Libera Para Grava��o ====================================================
        LiberaClientGravar(True);

        DMConciliacao.CDS_CMExtratos.Edit;
        DMConciliacao.CDS_CMExtratosCOD_USUARIO.AsString:=sgCodUsuario;
        DMConciliacao.CDS_CMExtratosConciliado.AsString:='SIM';
        DMConciliacao.CDS_CMExtratosQUEM.AsString:='USU';
        DMConciliacao.CDS_CMExtratos.Post;

        // Retira a Libera�ao Para Grava��o ========================================
        LiberaClientGravar(False);

        MySql:=' Insert Into FIN_CONCILIACAO_PAGTOS'+
               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
               '  COD_USUARIO)'+
               ' Values('+
               QuotedStr(DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString)+', '+
               QuotedStr('USU')+', '+
               QuotedStr(sgCodUsuario)+')';
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If (DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM') And

      DMConciliacao.CDS_CMExtratos.Next;
    End; // While Not DMConciliacao.CDS_CMExtratos.Eof do
    DMConciliacao.CDS_CMExtratos.EnableControls;
    HabilitaBotoes(True);

    Result:=True;
  End; // If sTipo='Pag' Then
  //============================================================================

  //============================================================================
  // Concilia Por Extrato ======================================================
  //============================================================================
  If sTipo='Ext' Then
  Begin
    DMConciliacao.CDS_CMExtratos.First;
    DMConciliacao.CDS_CMExtratos.DisableControls;
    While Not DMConciliacao.CDS_CMExtratos.Eof do
    Begin
      If (DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMExtratosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMExtratosQUEM.AsString)='') Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString;
        Break;
      End;

      DMConciliacao.CDS_CMExtratos.Next;
    End; // While Not DMConciliacao.CDS_CMExtratos.Eof do
    DMConciliacao.CDS_CMExtratos.EnableControls;

    // Libera Para Grava��o ====================================================
    LiberaClientGravar(True);

    DMConciliacao.CDS_CMExtratos.Edit;
    DMConciliacao.CDS_CMExtratosCOD_USUARIO.AsString:=sgCodUsuario;
    DMConciliacao.CDS_CMExtratosConciliado.AsString:='SIM';
    DMConciliacao.CDS_CMExtratosQUEM.AsString:='USU';
    DMConciliacao.CDS_CMExtratos.Post;
    Refresh;

    // Retira a Libera�ao Para Grava��o ========================================
    LiberaClientGravar(False);

    HabilitaBotoes(False);

    DMConciliacao.CDS_CMPagtos.First;
    DMConciliacao.CDS_CMPagtos.DisableControls;
    While Not DMConciliacao.CDS_CMPagtos.Eof do
    Begin
      If (DMConciliacao.CDS_CMPagtosConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMPagtosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMPagtosQUEM.AsString)='') Then
      Begin
        sNumCompl  :=DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;
        sNumSeq    :=DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString;

        MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
               ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
               ' Where m.Num_Seq='+DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString+
               ' And   m.Num_Compl='+DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        // Libera Para Grava��o ====================================================
        LiberaClientGravar(True);

        DMConciliacao.CDS_CMPagtos.Edit;
        DMConciliacao.CDS_CMPagtosCOD_USUARIO.AsString:=sgCodUsuario;
        DMConciliacao.CDS_CMPagtosConciliado.AsString:='SIM';
        DMConciliacao.CDS_CMPagtosQUEM.AsString:='USU';
        DMConciliacao.CDS_CMPagtos.Post;
        Refresh;

        // Retira a Libera�ao Para Grava��o ========================================
        LiberaClientGravar(False);

        MySql:=' Insert Into FIN_CONCILIACAO_PAGTOS'+
               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
               '  COD_USUARIO)'+
               ' Values('+
               QuotedStr(DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString)+', '+
               QuotedStr('USU')+', '+
               QuotedStr(sgCodUsuario)+')';
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If (DMConciliacao.CDS_CMPagtosConciliar.AsString='SIM') And

      DMConciliacao.CDS_CMPagtos.Next;
    End; // While Not DMConciliacao.CDS_CMPagtos.Eof do
    DMConciliacao.CDS_CMPagtos.EnableControls;
    HabilitaBotoes(True);

    Result:=True;
  End; // If sTipo='Ext' Then
  //============================================================================

  //============================================================================
  // Concilia Por Dinheiro =====================================================
  //============================================================================
  If sTipo='Din' Then
  Begin
    HabilitaBotoes(False);

    s:=DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
    DMConciliacao.CDS_CMPagtos.First;
    DMConciliacao.CDS_CMPagtos.DisableControls;
    While Not DMConciliacao.CDS_CMPagtos.Eof do
    Begin

      If (DMConciliacao.CDS_CMPagtosConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMPagtosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMPagtosQUEM.AsString)='') Then
      Begin
        // Libera Para Grava��o ====================================================
        LiberaClientGravar(True);

        DMConciliacao.CDS_CMPagtos.Edit;
        DMConciliacao.CDS_CMPagtosCOD_USUARIO.AsString:=sgCodUsuario;
        DMConciliacao.CDS_CMPagtosConciliado.AsString:='SIM';
        DMConciliacao.CDS_CMPagtosQUEM.AsString:='USU';
        DMConciliacao.CDS_CMPagtosTIP_CONCILIACAO.AsString:='DINH';
        DMConciliacao.CDS_CMPagtos.Post;

        // Retira a Libera�ao Para Grava��o ========================================
        LiberaClientGravar(False);

        MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
               ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
               ' Where m.Num_Seq='+DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString+
               ' And   m.Num_Compl='+DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        MySql:=' Insert Into FIN_CONCILIACAO_PAGTOS'+
               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM, TIP_CONCILIACAO,'+
               '  COD_USUARIO)'+
               ' Values('+
               QuotedStr('DINH'+s)+', '+
               QuotedStr(DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString)+', '+
               QuotedStr('USU')+', '+
               QuotedStr('DINH')+', '+
               QuotedStr(sgCodUsuario)+')';
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End;

      DMConciliacao.CDS_CMPagtos.Next;
    End; // While Not DMConciliacao.CDS_CMPagtos.Eof do
    DMConciliacao.CDS_CMPagtos.EnableControls;
    HabilitaBotoes(True);

    Result:=True;
  End; // If sTipo='Din' Then
  //============================================================================

  //============================================================================
  // Concilia Somente Extrato ==================================================
  //============================================================================
  If sTipo='SEx' Then
  Begin
    HabilitaBotoes(False);

    DMConciliacao.CDS_CMExtratos.DisableControls;
    DMConciliacao.CDS_CMExtratos.First;
    While Not DMConciliacao.CDS_CMExtratos.Eof do
    Begin
      If (DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM') And
         (DMConciliacao.CDS_CMExtratosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMExtratosQUEM.AsString)='') Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString;

        // Libera Para Grava��o ====================================================
        LiberaClientGravar(True);

        DMConciliacao.CDS_CMExtratos.Edit;
        DMConciliacao.CDS_CMExtratosCOD_USUARIO.AsString:=sgCodUsuario;
        DMConciliacao.CDS_CMExtratosConciliado.AsString:='SIM';
        DMConciliacao.CDS_CMExtratosQUEM.AsString:='USU';
        DMConciliacao.CDS_CMExtratosTIP_CONCILIACAO.AsString:='SExt';
        DMConciliacao.CDS_CMExtratos.Post;
        Refresh;

        // Retira a Libera�ao Para Grava��o ========================================
        LiberaClientGravar(False);

        // Verifica a Altera��o do Complemento da Sequencia do Registro ==
        MySql:=' SELECT GEN_ID(GEN_CONCILIACAO_MOVTOS,0) Num_Seq'+
               ' FROM RDB$DATABASE';
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;
        i:=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
        DMBelShop.CDS_BuscaRapida.Close;

        If i=999999 Then
        Begin
          // Acrescenta 1 no Complemento - GEN_COMPL_CONCILIACAO_MOVTOS
          MySql:=' SELECT GEN_ID(GEN_COMPL_CONCILIACAO_MOVTOS,1) Num_Seq'+
                 ' FROM RDB$DATABASE';
          DMBelShop.CDS_BuscaRapida.Close;
          DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
          DMBelShop.CDS_BuscaRapida.Open;
          DMBelShop.CDS_BuscaRapida.Close;

          // Inicializa Num_Seq - GEN_CONCILIACAO_MOVTOS
          MySql:=' ALTER SEQUENCE GEN_CONCILIACAO_MOVTOS RESTART WITH 0';
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End;

        // Busca Num_Seq e Num_Compl ===========================================
        MySql:=' SELECT GEN_ID(GEN_CONCILIACAO_MOVTOS,1) Num_Seq'+
               ' FROM RDB$DATABASE';
        DMBelShop.CDS_Pesquisa.Close;
        DMBelShop.SDS_Pesquisa.CommandText:=MySql;
        DMBelShop.CDS_Pesquisa.Open;
        sNumSeq:=DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsString;
        DMBelShop.CDS_Pesquisa.Close;

        MySql:=' SELECT GEN_ID(GEN_COMPL_CONCILIACAO_MOVTOS,0) Num_Compl'+
               ' FROM RDB$DATABASE';
        DMBelShop.CDS_Pesquisa.Close;
        DMBelShop.SDS_Pesquisa.CommandText:=MySql;
        DMBelShop.CDS_Pesquisa.Open;
        sNumCompl:=DMBelShop.CDS_Pesquisa.FieldByName('Num_Compl').AsString;
        DMBelShop.CDS_Pesquisa.Close;

        // Monta Chv_Pagto =====================================================
        // CHV_PAGTO = Cod_Loja + Cod_Forn + Cod_Comprov + Num_Serie + Num_Docto + Num_Prest
        sChvPagto:=sgCodLojaExt+
                   DMConciliacao.CDS_CMExtratosNUM_BANCO.AsString+
                   DMConciliacao.CDS_CMExtratosCOD_TPMOVTO.AsString+
                   DMConciliacao.CDS_CMExtratosNUM_DOCTO.AsString+'01';

        // Insere Movto ========================================================
        DateSeparator:='.';
        DecimalSeparator:='.';

        MySql:=' Insert Into FIN_CONCILIACAO_MOVTOS ('+
               ' NUM_SEQ, NUM_COMPL,'+
               ' CHV_PAGTO, CHV_NOTA, CHV_RECIBO, COD_LOJA,'+
               ' COD_COMPROVANTE, NUM_DOCTO, NUM_SERIE, NUM_PRESTACAO,'+
               ' DTA_DOCTO, DTA_PAGTO, DTA_VENC, DTA_COMPR, COD_BANCO,'+
               ' DES_BANCO, COD_COBRANCA, COD_FORNECEDOR, VLR_DOCTO,'+
               ' VLR_DESCONTO, VLR_ACRESCIMO, VLR_PAGTO, IND_PAGTO_PARCIAL,'+
               ' OBS_TEXTO, IND_CONCILIACAO, COD_HISTO_AUTO, COD_BANCO_AUTO)'+

               ' Values('+
               QuotedStr(sNumSeq)+', '+ // NUM_SEQ
               QuotedStr(sNumCompl)+', '+ // NUM_COMPL
               QuotedStr(sChvPagto)+', '+ // CHV_PAGTO
               QuotedStr('0')+', '+ // CHV_NOTA
               QuotedStr('0')+', '+ // CHV_RECIBO
               QuotedStr(sgCodLojaExt)+', '+ // COD_LOJA
               'Null , '+ // COD_COMPROVANTE
               QuotedStr(DMConciliacao.CDS_CMExtratosNUM_DOCTO.AsString)+', '+ // NUM_DOCTO
               'Null , '+ // NUM_SERIE
               QuotedStr('01')+', '+ // NUM_PRESTACAO
//               QuotedStr(f_Troca('/','.',f_Troca('-','.',DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)))+', '+ // DTA_DOCTO
//               QuotedStr(f_Troca('/','.',f_Troca('-','.',DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)))+', '+ // DTA_PAGTO
//               QuotedStr(f_Troca('/','.',f_Troca('-','.',DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)))+', '+ // DTA_VENC
//               QuotedStr(f_Troca('/','.',f_Troca('-','.',DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)))+', '+ // DTA_COMPR
               QuotedStr(DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)+', '+ // DTA_DOCTO
               QuotedStr(DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)+', '+ // DTA_PAGTO
               QuotedStr(DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)+', '+ // DTA_VENC
               QuotedStr(DMConciliacao.CDS_CMExtratosDTA_EXTRATO.AsString)+', '+ // DTA_COMPR
               'Null , '+ // COD_BANCO
               'Null , '+ // DES_BANCO
               'Null , '+ // COD_COBRANCA
               'Null , '+ // COD_FORNECEDOR
               QuotedStr(DMConciliacao.CDS_CMExtratosVLR_DOCTO.AsString)+', '+ // VLR_DOCTO
               QuotedStr('0')+', '+ // VLR_DESCONTO
               QuotedStr('0')+', '+ // VLR_ACRESCIMO
               QuotedStr(DMConciliacao.CDS_CMExtratosVLR_DOCTO.AsString)+', '+ // VLR_PAGTO
               'Null , '+ // IND_PAGTO_PARCIAL
               'Null , '+ // OBS_TEXTO
               QuotedStr('SIM')+', '+ // IND_CONCILIACAO
               QuotedStr(DMConciliacao.CDS_CMExtratosCOD_TPMOVTO.AsString)+', '+ // COD_HISTO_AUTO
               QuotedStr(DMConciliacao.CDS_CMExtratosCOD_BANCO.AsString)+')'; // COD_BANCO_AUTO
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        // Insere Concilia��o Autom�tica do Extrato ============================
        MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
               ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
               ' Values ('+
               QuotedStr(DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString)+', '+ // CHV_EXTRATO
               QuotedStr(sNumSeq)+', '+ // NUM_SEQ
               QuotedStr(sNumCompl)+', '+ // NUM_COMPL
               QuotedStr('USU')+', '+ // IND_QUEM
               QuotedStr(sgCodUsuario)+', '+ // COD_USUARIO
               QuotedStr('3')+', '+ // TIP_AUX
               QuotedStr('0')+', '+ // COD_AUX
               QuotedStr('SExt')+')'; // TIP_CONCILIACAO
        DMBelShop.SQLC.Execute(MySql, nil, nil);

        DateSeparator:='/';
        DecimalSeparator:=',';
      End; // If (DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM') And ....

      DMConciliacao.CDS_CMExtratos.Next;
    End; // While Not DMConciliacao.CDS_CMExtratos.Eof do
    DMConciliacao.CDS_CMExtratos.EnableControls;
    HabilitaBotoes(True);

    Result:=True;
  End; // If sTipo='SEx' Then
  //============================================================================

  DMConciliacao.CDS_CMPagtos.DisableControls;
  DMConciliacao.CDS_CMExtratos.DisableControls;

  DMConciliacao.CDS_CMPagtos.Close;
  DMConciliacao.CDS_CMExtratos.Close;
  DMConciliacao.CDS_CMExtratos.Open;
  DMConciliacao.CDS_CMPagtos.Open;
  DMConciliacao.CDS_CMPagtos.EnableControls;
  DMConciliacao.CDS_CMExtratos.EnableControls;

  bgLocate:=False;
  If not DMConciliacao.CDS_CMPagtos.Locate('NUM_SEQ;NUM_COMPL',VarArrayOf([sNumSeq,sNumCompl]),[]) Then
   DMConciliacao.CDS_CMPagtos.Locate('CHV_PAGTO',sChvPagto,[]);

  DMConciliacao.CDS_CMExtratos.Locate('CHV_EXTRATO', sChvExtrato,[]);
End; // CONCILIA��ES - Processa Por Pagamento ou Extrato >>>>>>>>>>>>>>>>>>>>>>>

// CONCILIA��ES - Libera CDS_CMExtratos / CDS_CMPagtos para Grava��o >>>>>>>>>>>
Procedure TFrmBancoExtratos.LiberaClientGravar(bLibera: Boolean);
Begin
  // CDS_CMExtratos ============================================================
  DMConciliacao.CDS_CMExtratosCOD_USUARIO.ReadOnly:=Not bLibera;
  DMConciliacao.CDS_CMExtratosConciliado.ReadOnly:=Not bLibera;;
  DMConciliacao.CDS_CMExtratosConciliar.ReadOnly:=Not bLibera;;
  DMConciliacao.CDS_CMExtratosTIP_CONCILIACAO.ReadOnly:=Not bLibera;
  DMConciliacao.CDS_CMExtratosQUEM.ReadOnly:=Not bLibera;

  // CDS_CMPagtos ==============================================================
  DMConciliacao.CDS_CMPagtosCOD_USUARIO.ReadOnly:=Not bLibera;
  DMConciliacao.CDS_CMPagtosConciliado.ReadOnly:=Not bLibera;
  DMConciliacao.CDS_CMPagtosConciliar.ReadOnly:=Not bLibera;
  DMConciliacao.CDS_CMPagtosTIP_CONCILIACAO.ReadOnly:=Not bLibera;
  DMConciliacao.CDS_CMPagtosQUEM.ReadOnly:=Not bLibera;

End; // CONCILIA��ES - Libera CDS_CMExtratos / CDS_CMPagtos para Grava��o >>>>>>

// CONCILIA��ES - Processa Por Tipo de Concilia��o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmBancoExtratos.ProcessaTipoConciliacao(sCodConc, sDesConc: String): Boolean;
Var
  MySql: String;
  sChvExtrato, sNumSeq, sNumCompl: String;
Begin
  Result:=False;

  //============================================================================
  // Processa Extrato ==========================================================
  //============================================================================
  If igTotMarcaExt>0 Then
  Begin
    sChvExtrato:=DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString;

    // Libera Para Grava��o ====================================================
    LiberaClientGravar(True);

    // Concilia por Tipo de Concilia��o ========================================
    HabilitaBotoes(False);

    DMConciliacao.CDS_CMExtratos.First;
    DMConciliacao.CDS_CMExtratos.DisableControls;
    While Not DMConciliacao.CDS_CMExtratos.Eof do
    Begin
      Refresh;
      If (DMConciliacao.CDS_CMExtratosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMExtratosQUEM.AsString)='') And
         (DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM') Then
      Begin
        DMConciliacao.CDS_CMExtratos.Edit;
        DMConciliacao.CDS_CMExtratosCOD_USUARIO.AsString:=sgCodUsuario;
        DMConciliacao.CDS_CMExtratosConciliado.AsString:='SIM';
        DMConciliacao.CDS_CMExtratosQUEM.AsString:='USU';
        DMConciliacao.CDS_CMExtratosTIP_CONCILIACAO.AsString:=sDesConc;
        DMConciliacao.CDS_CMExtratos.Post;

        MySql:=' Insert Into FIN_CONCILIACAO_PAGTOS'+
               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
               '  COD_USUARIO, TIP_AUX, COD_AUX)'+
               ' Values('+
               QuotedStr(DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString)+', '+
               QuotedStr('0')+', '+
               QuotedStr('0')+', '+
               QuotedStr('USU')+', '+
               QuotedStr(sgCodUsuario)+', '+
               QuotedStr('3')+', '+
               QuotedStr(sCodConc)+')';
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        Result:=True;
      End;

      DMConciliacao.CDS_CMExtratos.Next
    End; // While Not DMConciliacao.CDS_CMExtratos.Eof do
    DMConciliacao.CDS_CMExtratos.EnableControls;
    HabilitaBotoes(True);

    // Retira a Libera�ao Para Grava��o ========================================
    LiberaClientGravar(False);

    Dbg_ConcManutExtrato.SetFocus;
    DMConciliacao.CDS_CMExtratos.Locate('CHV_EXTRATO', sChvExtrato,[]);
  End; // If igTotMarcaExt>0 Then

  //============================================================================
  // Processa Movto Pagto ======================================================
  //============================================================================
  If igTotMarcaPag>0 Then
  Begin
    sNumSeq:=DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString;
    sNumCompl:=DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;

    // Libera Para Grava��o ====================================================
    LiberaClientGravar(True);

    // Concilia por Tipo de Concilia��o ========================================
    HabilitaBotoes(False);

    DMConciliacao.CDS_CMPagtos.First;
    DMConciliacao.CDS_CMPagtos.DisableControls;
    While Not DMConciliacao.CDS_CMPagtos.Eof do
    Begin
      Refresh;
      If (DMConciliacao.CDS_CMPagtosConciliado.AsString='NAO') And
         (Trim(DMConciliacao.CDS_CMPagtosQUEM.AsString)='') And
         (DMConciliacao.CDS_CMPagtosConciliar.AsString='SIM') Then
      Begin
        DMConciliacao.CDS_CMPagtos.Edit;
        DMConciliacao.CDS_CMPagtosCOD_USUARIO.AsString:=sgCodUsuario;
        DMConciliacao.CDS_CMPagtosConciliado.AsString:='SIM';
        DMConciliacao.CDS_CMPagtosQUEM.AsString:='USU';
        DMConciliacao.CDS_CMPagtosTIP_CONCILIACAO.AsString:=sDesConc;
        DMConciliacao.CDS_CMPagtos.Post;

        MySql:=' Insert Into FIN_CONCILIACAO_PAGTOS'+
               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
               '  COD_USUARIO, TIP_AUX, COD_AUX)'+
               ' Values('+
               QuotedStr('Pagtos'+
                         DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString+
                         DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString)+', '+
               QuotedStr(DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString)+', '+
               QuotedStr('USU')+', '+
               QuotedStr(sgCodUsuario)+', '+
               QuotedStr('3')+', '+
               QuotedStr(sCodConc)+')';
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
               ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
               ' Where m.Num_Seq='+DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString+
               ' And   m.Num_Compl='+DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        sNumSeq  :=DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString;
        sNumCompl:=DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;

        Result:=True;
      End;

      DMConciliacao.CDS_CMPagtos.Next
    End; // While Not DMConciliacao.CDS_CMPagtos.Eof do
    DMConciliacao.CDS_CMPagtos.EnableControls;

    HabilitaBotoes(True);

    // Retira a Libera�ao Para Grava��o ========================================
    LiberaClientGravar(False);

    Dbg_ConcManutPagto.SetFocus;
    DMConciliacao.CDS_CMPagtos.Locate('NUM_SEQ;NUM_COMPL', VarArrayOf([sNumSeq,sNumCompl]),[]);
  End; // If igTotMarcPag>0 Then

End; // CONCILIA��ES - Processa Por Tipo de Concilia��o >>>>>>>>>>>>>>>>>>>>>>>>

// CONCILIA��ES - Busca Tipo de Concilia��o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmBancoExtratos.BuscaTpConcicliacao(var sCod: String; Var sDesc: String): Boolean;
Var
  MySql: String;
begin
  Result:=False;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Bancos =============================================================
  MySql:=' SELECT t.des_aux, t.cod_aux'+
         ' FROM tab_auxiliar t'+
         ' WHERE t.tip_aux=3'+
         ' AND t.cod_aux>0'+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If DMBelShop.CDS_Pesquisa.Eof Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Tipo de Concilia��o a Listar !!!', 'A');
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='DES_AUX';
  FrmPesquisa.Campo_Codigo:='COD_AUX';
  FrmPesquisa.Campo_Descricao:='DES_AUX';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.Caption:='Selecione o Tipo de Concilia��o';
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    sCod:=FrmPesquisa.EdtCodigo.Text;
    sDesc:=FrmPesquisa.EdtDescricao.Text;
    Result:=True;
  End;

  FreeAndNil(FrmPesquisa);
End; // CONCILIA��ES - Busca Tipo de Concilia��o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// CONCILIA��ES - Verifica se Pode Conciliar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function  TFrmBancoExtratos.PodeConciliar(iExtrato, iPagto: Integer): Boolean;
Var
  CDS: TClientDataSet;
Begin
  Result:=True;

  // Extrato ===================================================================
  igTotMarcaExt:=0;
  CDS:=TClientDataSet.Create(Self);
  CDS.FieldDefs:=DMConciliacao.CDS_CMExtratos.FieldDefs;
  CDS.Data:=DMConciliacao.CDS_CMExtratos.Data;
  CDS.First;
  While Not CDS.Eof do
  Begin
    If (cds.FieldByName('Conciliado?').AsString='NAO') And (cds.FieldByName('Conciliar?').AsString='SIM') Then
    Begin
      Inc(igTotMarcaExt);
    End;

    CDS.Next;
  End;
  igTotMarcaExt:=igTotMarcaExt+iExtrato;

  If CDS<>nil Then
  Begin
    FreeAndNil(CDS);
  End;

  // Pagamentos ================================================================
  igTotMarcaPag:=0;
  CDS:=TClientDataSet.Create(Self);
  CDS.FieldDefs:=DMConciliacao.CDS_CMPagtos.FieldDefs;
  CDS.Data:=DMConciliacao.CDS_CMPagtos.Data;
  CDS.First;
  While Not CDS.Eof do
  Begin
    If (cds.FieldByName('Conciliado?').AsString='NAO') And (cds.FieldByName('Conciliar?').AsString='SIM') Then
    Begin
      Inc(igTotMarcaPag);
    End;

    CDS.Next;
  End;
  igTotMarcaPag:=igTotMarcaPag+iPagto;

  If igTotMarcaPag<0 Then igTotMarcaPag:=0;
  If igTotMarcaExt<0 Then igTotMarcaExt:=0;

  If (igTotMarcaPag>1) and (igTotMarcaExt>1) Then
   Result:=False;
End; // CONCILIA��ES - Verifica se Pode Conciliar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// CONCILIA��ES - Busca Extratos e Pagtos para Concilia��o >>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.BuscaMovtosExtratosPagtos;
Var
  MySql: String;
Begin
  Rb_ConcAmbos.Checked:=True;
  Rb_ConcConciliadosClick(Self);

  // Busca Extrato do Per�odo ==================================================
  MySql:=' SELECT DISTINCT'+
         ' CASE'+
         '   WHEN p.chv_extrato IS NULL THEN'+
         '     ''NAO'''+
         '   ELSE'+
         '     ''SIM'''+
         ' END "Conciliado?",'+
         ' p.ind_quem QUEM,'+
         ' CASE'+
         '    WHEN p.ind_quem is not null THEN'+
         '      ''SIM'''+
         '    ELSE'+
         '     ''NAO'''+
         ' END "Conciliar?",'+
         ' b.num_banco, b.des_banco, b.num_agencia, b.num_conta, e.dta_extrato,'+
         ' e.cod_tpmovto, m.des_tpmovto,'+
         ' e.num_docto, e.vlr_docto, m.ind_tipo,'+
         ' e.chv_extrato, p.cod_usuario, p.tip_conciliacao, e.cod_banco'+

         ' FROM fin_bancos_extratos e'+
         '          LEFT JOIN fin_bancos_tp_movtos m    ON m.cod_tpmovto=e.cod_tpmovto'+
         '                                             AND m.cod_banco=e.cod_banco'+
         '          LEFT JOIN fin_conciliacao_pagtos p  ON p.chv_extrato=e.chv_extrato'+
         '          LEFT JOIN fin_bancos b              ON b.cod_banco=e.cod_banco'+

         ' WHERE m.ind_tipo=''D'''+
         ' AND   e.dta_extrato Between '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
         ' AND   e.Num_Seq<>999999';

         If sgCodBanco<>'' Then
          MySql:=MySql+' AND   e.cod_banco IN ('+sgCodBanco+')';

         MySql:=MySql+' ORDER BY e.dta_extrato, b.Des_Banco, b.num_banco, b.num_agencia, b.num_conta, e.num_seq';
  DMConciliacao.CDS_CMExtratos.Close;
  DMConciliacao.SDS_CMExtratos.CommandText:=MySql;
  DMConciliacao.CDS_CMExtratos.Open;

  If Trim(DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString)='' Then
  Begin
    msg('Sem Extrato no Per�odo Solicitado !!','A');
    DMConciliacao.CDS_CMExtratos.Close;
    DtEdt_ConcDtaInicio.SetFocus;
    Exit;
  End;

  // Busca Pagamantos do Per�odo ===============================================
  MySql:=' SELECT DISTINCT'+
         ' ''Bel_''||m.cod_loja cod_loja,'+
         ' m.ind_conciliacao "Conciliado?", p.ind_quem QUEM,'+
         ' CASE'+
         '   WHEN p.ind_quem is not null THEN'+
         '     ''SIM'''+
         '   ELSE'+
         '    ''NAO'''+
         ' END "Conciliar?",'+
         ' m.num_docto, m.dta_venc, m.dta_pagto,'+
         ' m.vlr_docto, m.vlr_desconto, m.vlr_acrescimo, m.vlr_pagto,'+
         ' CASE'+
         '   WHEN h.cod_tpmovto IS NOT NULL THEN'+
         '      ''*''||h.cod_tpmovto'+
         '   ELSE'+
         '      m.cod_comprovante'+
         ' END cod_comprovante,'+

         ' CASE'+
         '   WHEN h.cod_tpmovto IS NOT NULL THEN'+
         '      ''*''||h.des_tpmovto'+
         '   ELSE'+
         '      c.nomecomprovante'+
         ' END nomecomprovante,'+
         ' CASE'+
         '   WHEN b.cod_banco IS NOT NULL THEN'+
         '      ''*''||b.cod_banco'+
         '   ELSE'+
         '      m.cod_fornecedor'+
         ' END cod_fornecedor,'+

         ' CASE'+
         '   WHEN b.cod_banco IS NOT NULL THEN'+
         '      ''*''||b.des_banco'+
         '   ELSE'+
         '      f.nomefornecedor'+
         ' END nomefornecedor,'+

         ' m.ind_pagto_parcial, m.num_prestacao, m.num_serie,'+
         ' e.razao_social, m.dta_docto, m.dta_compr, m.cod_banco,'+
         ' m.des_banco, m.cod_cobranca, m.obs_texto,'+
         ' m.num_seq, m.num_compl, m.chv_pagto, m.chv_nota, m.chv_recibo,'+
         ' p.tip_conciliacao, p.cod_usuario'+

         ' FROM FIN_CONCILIACAO_MOVTOS m'+
         '    LEFT JOIN fin_conciliacao_pagtos p  ON p.num_seq=m.num_seq'+
         '                                       AND p.num_compl=m.num_compl'+
         '    LEFT JOIN comprv c                  ON c.codcomprovante=m.cod_comprovante'+
         '                                       AND c.codloja=m.cod_loja'+
         '    LEFT JOIN fornecedor f              ON f.codfornecedor=m.cod_fornecedor'+
         '    LEFT JOIN emp_conexoes e            ON e.cod_filial=m.cod_loja'+
         '    LEFT JOIN fin_bancos_tp_movtos h    ON h.cod_tpmovto=m.cod_histo_auto'+
         '    LEFT JOIN fin_bancos b              ON b.cod_banco=m.cod_banco_auto'+

         ' WHERE (m.dta_pagto Between '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
         '        Or'+
         '        m.dta_venc  Between '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+')';

         If sgCodLojas<>'' Then
          MySql:=MySql+' AND m.cod_loja IN ('+sgCodLojas+')';

         MySql:=MySql+' ORDER BY m.dta_pagto, m.cod_fornecedor, m.cod_loja, m.num_seq, m.num_compl';
  DMConciliacao.CDS_CMPagtos.Close;
  DMConciliacao.SDS_CMPagtos.CommandText:=MySql;
  DMConciliacao.CDS_CMPagtos.Open;

  If Trim(DMConciliacao.CDS_CMPagtosCOD_LOJA.AsString)='' Then
  Begin
    msg('Sem Pagametos no Per�odo Solicitado !!','A');
    DMConciliacao.CDS_CMPagtos.Close;
    DMConciliacao.CDS_CMExtratos.Close;
    DtEdt_ConcDtaInicio.SetFocus;
    Exit;
  End;

  Lb_Obs.Caption:='Tecle <Duplo Click> Para Marcar Concilia��o';
  Pan_ConcSolicitacoes.Visible:=False;
  Pan_ManutConc.Visible:=True;
  Bt_CMApresFiltro.Visible:=True;

  Bt_CMApresFiltro.Caption:='Apresenta Filtro';

  Rb_ConcConciliadosClick(Self);
  Dbg_ConcManutExtrato.SetFocus;

End; // CONCILIA��ES - Busca Extratos e Pagtos para Concilia��o >>>>>>>>>>>>>>>>

// CONCILIA��ES - Efetua a Concilia��o de Hist�ricos Autom�ticos >>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.ConcConciliarHistAutomaticos;
Var
  MySql: String;
  sCodHist, sNumSeq, sNumCompl: String;
  i: Integer;
  sChvPagto: String;
Begin

  //============================================================================
  // A001 - Concilia Hist�ricos Autom�ticos ====================================
  //============================================================================
  MySql:=' SELECT T.cod_tpmovto, t.cod_conc_loja'+
         ' FROM fin_bancos_tp_movtos t'+
         ' WHERE T.cod_conc_loja Is Not NUll'+
         ' order by 1';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  HabilitaBotoes(False);

  pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    Application.ProcessMessages;

    pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;
    sCodHist:=DMBelShop.CDS_Busca.FieldByName('cod_tpmovto').AsString;

    Refresh;

    DMConciliacao.CDS_ConcExtratos.Filtered:=False;
    DMConciliacao.CDS_ConcExtratos.Filter:='COD_TPMOVTO='+sCodHist;
    DMConciliacao.CDS_ConcExtratos.Filtered:=True;

    While Not DMConciliacao.CDS_ConcExtratos.Eof do
    Begin
      Refresh;

      If DMConciliacao.CDS_ConcExtratosConciliado.AsString='NAO' Then
      Begin
        // Verifica a Altera��o do Complemento da Sequencia do Registro ==
        MySql:=' SELECT GEN_ID(GEN_CONCILIACAO_MOVTOS,0) Num_Seq'+
               ' FROM RDB$DATABASE';
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;
        i:=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
        DMBelShop.CDS_BuscaRapida.Close;

        If i=999999 Then
        Begin
          // Acrescenta 1 no Complemento - GEN_COMPL_CONCILIACAO_MOVTOS
          MySql:=' SELECT GEN_ID(GEN_COMPL_CONCILIACAO_MOVTOS,1) Num_Seq'+
                 ' FROM RDB$DATABASE';
          DMBelShop.CDS_BuscaRapida.Close;
          DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
          DMBelShop.CDS_BuscaRapida.Open;
          DMBelShop.CDS_BuscaRapida.Close;

          // Inicializa Num_Seq - GEN_CONCILIACAO_MOVTOS
          MySql:=' ALTER SEQUENCE GEN_CONCILIACAO_MOVTOS RESTART WITH 0';
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End;

        // Busca Num_Seq e Num_Compl ===========================================
        MySql:=' SELECT GEN_ID(GEN_CONCILIACAO_MOVTOS,1) Num_Seq'+
               ' FROM RDB$DATABASE';
        DMBelShop.CDS_Pesquisa.Close;
        DMBelShop.SDS_Pesquisa.CommandText:=MySql;
        DMBelShop.CDS_Pesquisa.Open;
        sNumSeq:=DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsString;
        DMBelShop.CDS_Pesquisa.Close;

        MySql:=' SELECT GEN_ID(GEN_COMPL_CONCILIACAO_MOVTOS,0) Num_Compl'+
               ' FROM RDB$DATABASE';
        DMBelShop.CDS_Pesquisa.Close;
        DMBelShop.SDS_Pesquisa.CommandText:=MySql;
        DMBelShop.CDS_Pesquisa.Open;
        sNumCompl:=DMBelShop.CDS_Pesquisa.FieldByName('Num_Compl').AsString;
        DMBelShop.CDS_Pesquisa.Close;

        // Monta Chv_Pagto =====================================================
        // CHV_PAGTO = Cod_Loja + Cod_Forn + Cod_Comprov + Num_Serie + Num_Docto + Num_Prest
        sChvPagto:=DMBelShop.CDS_Busca.FieldByName('Cod_Conc_Loja').AsString+
                   DMConciliacao.CDS_ConcExtratosNUM_BANCO.AsString+
                   DMBelShop.CDS_Busca.FieldByName('Cod_TpMovto').AsString+
                   DMConciliacao.CDS_ConcExtratosNUM_DOCTO.AsString+'01';

        // Insere Movto ========================================================
        MySql:=' Insert Into FIN_CONCILIACAO_MOVTOS ('+
               ' NUM_SEQ, NUM_COMPL,'+
               ' CHV_PAGTO, CHV_NOTA, CHV_RECIBO, COD_LOJA,'+
               ' COD_COMPROVANTE, NUM_DOCTO, NUM_SERIE, NUM_PRESTACAO,'+
               ' DTA_DOCTO, DTA_PAGTO, DTA_VENC, DTA_COMPR, COD_BANCO,'+
               ' DES_BANCO, COD_COBRANCA, COD_FORNECEDOR, VLR_DOCTO,'+
               ' VLR_DESCONTO, VLR_ACRESCIMO, VLR_PAGTO, IND_PAGTO_PARCIAL,'+
               ' OBS_TEXTO, IND_CONCILIACAO, COD_HISTO_AUTO, COD_BANCO_AUTO)'+

               ' Values('+
               QuotedStr(sNumSeq)+', '+ // NUM_SEQ
               QuotedStr(sNumCompl)+', '+ // NUM_COMPL
               QuotedStr(sChvPagto)+', '+ // CHV_PAGTO
               QuotedStr('0')+', '+ // CHV_NOTA
               QuotedStr('0')+', '+ // CHV_RECIBO
               QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Conc_Loja').AsString)+', '+ // COD_LOJA
               'Null , '+ // COD_COMPROVANTE
               QuotedStr(DMConciliacao.CDS_ConcExtratosNUM_DOCTO.AsString)+', '+ // NUM_DOCTO
               'Null , '+ // NUM_SERIE
               QuotedStr('01')+', '+ // NUM_PRESTACAO
               QuotedStr(DMConciliacao.CDS_ConcExtratosDTA_EXTRATO.AsString)+', '+ // DTA_DOCTO
               QuotedStr(DMConciliacao.CDS_ConcExtratosDTA_EXTRATO.AsString)+', '+ // DTA_PAGTO
               QuotedStr(DMConciliacao.CDS_ConcExtratosDTA_EXTRATO.AsString)+', '+ // DTA_VENC
               QuotedStr(DMConciliacao.CDS_ConcExtratosDTA_EXTRATO.AsString)+', '+ // DTA_COMPR
               'Null , '+ // COD_BANCO
               'Null , '+ // DES_BANCO
               'Null , '+ // COD_COBRANCA
               'Null , '+ // COD_FORNECEDOR
               QuotedStr(DMConciliacao.CDS_ConcExtratosVLR_DOCTO.AsString)+', '+ // VLR_DOCTO
               QuotedStr('0')+', '+ // VLR_DESCONTO
               QuotedStr('0')+', '+ // VLR_ACRESCIMO
               QuotedStr(DMConciliacao.CDS_ConcExtratosVLR_DOCTO.AsString)+', '+ // VLR_PAGTO
               'Null , '+ // IND_PAGTO_PARCIAL
               'Null , '+ // OBS_TEXTO
               QuotedStr('SIM')+', '+ // IND_CONCILIACAO
               QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_TpMovto').AsString)+', '+ // COD_HISTO_AUTO
               QuotedStr(DMConciliacao.CDS_ConcExtratosCOD_BANCO.AsString)+')'; // COD_BANCO_AUTO
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        // Insere Concilia��o Autom�tica do Extrato ============================
        MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
               ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
               ' Values ('+
               QuotedStr(DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString)+', '+
               QuotedStr(sNumSeq)+', '+
               QuotedStr(sNumCompl)+', '+
               QuotedStr('SIS')+', '+
               QuotedStr(sgCodUsuario)+', '+
               QuotedStr('3')+', '+
               QuotedStr('0')+', '+
               QuotedStr('A001')+')';
        DMBelShop.SQLC.Execute(MySql, nil, nil);
      End; // If DMConciliacao.CDS_ConcExtratosConciliado.AsString='NAO' Then

      DMConciliacao.CDS_ConcExtratos.Next;
    End; // While Not DMConciliacao.CDS_ConcExtratos.Eof do

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.Close;

  HabilitaBotoes(True);

  DMConciliacao.CDS_ConcExtratos.Filter:='';
  DMConciliacao.CDS_ConcExtratos.Filtered:=False;
  DMConciliacao.CDS_ConcExtratos.First;
  Refresh;
  //============================================================================

End; // CONCILIA��ES - Efetua a Concilia��o de Hist�ricos Autom�ticos >>>>>>>>>>

// Concilia��o - Efetua a Concilia��o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.ConcConcilia;
Var
  MySql: String;
  sChvExtrato: String;
  sNumConta, sValor: String;
Begin
{============================
CONCILIA��ES:
01 - Concilia��o: Hist�ricos Autom�ticos
02 - Concilia��o: Num_Conta/Pagto
03 - Concilia��o: Num_Conta/Loja/Dta_Pagto/Fornecedor/Comprovante
04 - Concilia��o: Num_Conta/Loja/Dta_Pagto/Fornecedor
05 - Concilia��o: Num_Conta/Loja/Dta_Pagto/Comprovante
06 - Concilia��o: Num_Conta/Loja/Dta_Pagto
07 - Concilia��o: Num_Conta/Loja/Fornecedor/Comprovante
08 - Concilia��o: Num_Conta/Loja/Fornecedor
09 - Concilia��o: Num_Conta/Loja/Comprovante
10 - Concilia��o: Num_Conta/Dta_Pagto/Fornecedor/Comprovante
11 - Concilia��o: Num_Conta/Dta_Pagto/Fornecedor
12 - Concilia��o: Num_Conta/Dta_Pagto/Comprovante
13 - Concilia��o: Num_Conta/Dta_Pagto
14 - Concilia��o: Num_Conta/Fornecedor/Comprovante
15 - Concilia��o: Num_Conta/Fornecedor
16 - Concilia��o: Num_Conta/Comprovante
17 - Concilia��o: Loja
18 - Concilia��o: Extrato - cod_loja/dta_extrato/num_conta/vlr_docto
19 - Concilia��o: Extrato - cod_loja/dta_extrato/num_conta/cod_tpmovto/num_docto
20 - Concilia��o: Loja/Dta_Pagto/Fornecedor/Comprovante
21 - Concilia��o: Loja/Dta_Pagto/Fornecedor
22 - Concilia��o: Loja/Dta_Pagto/Comprovante
23 - Concilia��o: Loja/Dta_Pagto
24 - Concilia��o: Loja/Fornecedor/Comprovante
25 - Concilia��o: Loja/Fornecedor
26 - Concilia��o: Loja/Comprovante
27 - Concilia��o: Dta_Pagto/Fornecedor/Comprovante
28 - Concilia��o: Dta_Pagto/Fornecedor
29 - Concilia��o: Dta_Pagto/Comprovante
30 - Concilia��o: Loja/Dta_Pagto
31 - Concilia��o: Fornecedor/Comprovante
32 - Concilia��o: Fornecedor
33 - Concilia��o: Comprovante
34 - Concilia��o: Loja
============================}
  // Cria ProgressBar ==========================================================
  FrmBelShop.MontaProgressBar(True, FrmBancoExtratos);

  // Verificva se Transa��o esta Ativa
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

    //==========================================================================
    // A001 - Concilia Hist�ricos Autom�ticos ==================================
    //==========================================================================
    Lb_Obs.Caption:='01/35 AGUARDE !! Concilia��o: Hist�ricos Autom�ticos...';
    ConcConciliarHistAutomaticos;

    DMConciliacao.CDS_ConcExtratos.Close;
    DMConciliacao.CDS_ConcExtratos.Filter:='';
    DMConciliacao.CDS_ConcExtratos.Filtered:=False;
    DMConciliacao.CDS_ConcExtratos.Open;

    //==========================================================================
    // C001 - Concilia Pelo Num_Conta/Cod_Loja/Num_Seq/Num_Compl/Vlr_Pgto ======
    //        Lan�amento Individual
    //==========================================================================
    Lb_Obs.Caption:='02/35 AGUARDE !! Concilia��o: Num_Conta/Cod_Loja/Vlr_Pagto...';

    MySql:=' SELECT b.num_conta, m.cod_loja, m.num_seq, m.num_compl, m.vlr_pagto'+
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' ORDER BY 2, 3';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        MySql:=' Select m.Num_Seq'+
               ' From FIN_CONCILIACAO_MOVTOS m'+
               ' Where m.IND_CONCILIACAO='+QuotedStr('NAO')+
               ' And   m.num_seq='+DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString+
               ' And   m.num_compl='+DMBelShop.CDS_Busca.FieldByName('Num_Compl').AsString;
        DMBelShop.CDS_Pesquisa.Close;
        DMBelShop.SDS_Pesquisa.CommandText:=MySql;
        DMBelShop.CDS_Pesquisa.Open;

        If Not DMBelShop.CDS_Pesquisa.IsEmpty Then
        Begin
          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.IND_CONCILIACAO='+QuotedStr('NAO')+
                 ' And   m.num_seq='+DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_Busca.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_Busca.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C001')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMConciliacao.CDS_ConcExtratos.Close;
          DMConciliacao.CDS_ConcExtratos.Filter:='';
          DMConciliacao.CDS_ConcExtratos.Filtered:=False;
          DMConciliacao.CDS_ConcExtratos.Open;
          DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]) ;
        End; // If Not DMBelShop.CDS_Pesquisa.IsEmpty Then
        DMBelShop.CDS_Pesquisa.Close;

      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C002 - Concilia Pelo Num_Conta/Loja/Dta_Pagto/Fornecedor/Comprovante ====
    //==========================================================================
    Lb_Obs.Caption:='03/35 AGUARDE !! Concilia��o: Num_Conta/Loja/Dta_Pagto/Fornecedor/Comprovante...';

    MySql:=' SELECT b.num_conta, m.cod_loja, m.Dta_Pagto, m.cod_fornecedor, m.cod_comprovante,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+

           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3, 4, 5'+
           ' order by 2, 6';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C002')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);

      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C003 - Concilia Pelo Num_Conta/Loja/Dta_Pagto/Fornecedor ================
    //==========================================================================
    Lb_Obs.Caption:='04/35 AGUARDE !! Concilia��o: Num_Conta/Loja/Dta_Pagto/Fornecedor...';

    MySql:=' SELECT b.num_conta, m.cod_loja, m.Dta_Pagto, m.cod_fornecedor,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3, 4'+
           ' ORDER BY 2, 5';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;
          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C003')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C004 - Concilia Pelo Num_Conta/Loja/Dta_Pagto/Comprovante ===============
    //==========================================================================
    Lb_Obs.Caption:='05/35 AGUARDE !! Concilia��o: Num_Conta/Loja/Dta_Pagto/Comprovante...';

    MySql:=' SELECT b.num_conta, m.cod_loja, m.Dta_Pagto, m.cod_comprovante,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3, 4'+
           ' ORDER BY 2, 5';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C004')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C005 - Concilia Pelo Num_Conta/Loja/Dta_Pagto ===========================
    //==========================================================================
    Lb_Obs.Caption:='06/35 AGUARDE !! Concilia��o: Num_Conta/Loja/Dta_Pagto...';

    MySql:=' SELECT b.num_conta, m.cod_loja, m.Dta_Pagto,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3'+
           ' ORDER BY 2, 4';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;
          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C005')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C006 - Concilia Pela Num_Conta/Loja/Fornecedor/Comprovante ==============
    //==========================================================================
    Lb_Obs.Caption:='07/35 AGUARDE !! Concilia��o: Num_Conta/Loja/Fornecedor/Comprovante...';

    MySql:=' SELECT b.num_conta, m.cod_loja, m.cod_fornecedor, m.cod_comprovante,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3, 4'+
           ' ORDER BY 2, 5';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;
          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C006')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C007 - Concilia Pelo Num_Conta/Loja/Fornecedor ==========================
    //==========================================================================
    Lb_Obs.Caption:='08/35 AGUARDE !! Concilia��o: Num_Conta/Loja/Fornecedor...';

    MySql:=' SELECT b.num_conta, m.cod_loja, m.cod_fornecedor,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+

           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND m.cod_loja IN ('+sgCodLojas+')'+
           ' AND m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3'+
           ' ORDER BY 2 , 4';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;
          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C007')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C008 - Concilia Pelo Num_Conta/Loja/Comprovante =========================
    //==========================================================================
    Lb_Obs.Caption:='09/35 AGUARDE !! Concilia��o: Num_Conta/Loja/Comprovante...';

    MySql:=' SELECT b.num_conta, m.cod_loja, m.cod_comprovante,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3'+
           ' ORDER BY 2, 4';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;
          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C008')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C009 - Concilia Pelo Num_Conta/Dta_Pagto/Fornecedor/Comprovante =========
    //==========================================================================
    Lb_Obs.Caption:='10/35 AGUARDE !! Concilia��o: Num_Conta/Dta_Pagto/Fornecedor/Comprovante...';

    MySql:=' SELECT b.num_conta, m.Dta_Pagto, m.cod_fornecedor, m.cod_comprovante,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3, 4'+
           ' ORDER BY 2, 5';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C009')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C010 - Concilia Pelo Num_Conta/Dta_Pagto/Fornecedor =====================
    //==========================================================================
    Lb_Obs.Caption:='11/35 AGUARDE !! Concilia��o: Num_Conta/Dta_Pagto/Fornecedor...';

    MySql:=' SELECT b.num_conta, m.Dta_Pagto, m.cod_fornecedor,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3'+
           ' ORDER BY 2,4';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C010')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C011 - Concilia Pelo Num_Conta/Dta_Pagto/Comprovante ====================
    //==========================================================================
    Lb_Obs.Caption:='12/35 AGUARDE !! Concilia��o: Num_Conta/Dta_Pagto/Comprovante...';

    MySql:=' SELECT b.num_conta, m.Dta_Pagto, m.cod_comprovante,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3'+
           ' ORDER BY 2,4';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C011')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C012 - Concilia Pela Num_Conta/Dta_Pagto ================================
    //==========================================================================
    Lb_Obs.Caption:='13/35 AGUARDE !! Concilia��o: Num_Conta/Dta_Pagto...';

    MySql:=' SELECT b.num_conta, m.Dta_Pagto,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2'+
           ' ORDER BY 2, 3';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C012')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C013 - Concilia Pelo Num_Conta/Fornecedor/Comprovante ===================
    //==========================================================================
    Lb_Obs.Caption:='14/35 AGUARDE !! Concilia��o: Num_Conta/Fornecedor/Comprovante...';

    MySql:=' SELECT b.num_conta, m.cod_fornecedor, m.cod_comprovante,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3'+
           ' ORDER BY 2, 4';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C013')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C014 - Concilia Pelo Num_Conta/Fornecedor ===============================
    //==========================================================================
    Lb_Obs.Caption:='15/35 AGUARDE !! Concilia��o: Num_Conta/Fornecedor...';

    MySql:=' SELECT b.num_conta, m.cod_fornecedor,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2'+
           ' ORDER BY 2, 3';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C014')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C015 - Concilia Pelo Num_Conta/Comprovante ==============================
    //==========================================================================
    Lb_Obs.Caption:='16/35 AGUARDE !! Concilia��o: Num_Conta/Comprovante...';

    MySql:=' SELECT b.num_conta, m.cod_comprovante,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2'+
           ' ORDER BY 2, 3';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C015')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C016 - Concilia Pelo Num_Conta/Loja =====================================
    //==========================================================================
    Lb_Obs.Caption:='17/35 AGUARDE !! Concilia��o: Num_Conta/Loja...';

    MySql:=' SELECT b.num_conta, m.cod_loja,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           '        LEFT jOIN FIN_BANCOS_LOJAS bl on bl.cod_loja=m.cod_loja'+
           '        LEFT JOIN FIN_BANCOS b        on b.cod_banco=bl.cod_banco'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2'+
           ' ORDER BY 2,3';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sNumConta:=DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString;
      sValor   :=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sNumConta,sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               '        LEFT JOIN FIN_BANCOS_LOJAS bl ON bl.cod_loja=m.cod_loja'+
               '        LEFT JOIN FIN_BANCOS b        ON b.cod_banco=bl.cod_banco'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_loja').AsString)+
               ' AND   b.num_conta='+QuotedStr(sNumConta);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C016')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('NUM_CONTA;VLR_DOCTO;Conciliado',VarArrayOf([sNumConta,sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C017 - Concilia Extrato Pelo cod_loja/dta_extrato/num_conta/vlr_docto ===
    //==========================================================================
    Lb_Obs.Caption:='18/35 AGUARDE !! Concilia��o: Extrato - cod_loja/dta_extrato/num_conta/vlr_docto';

    MySql:=' SELECT bl.cod_loja, e.dta_extrato, b.num_conta, e.chv_extrato, e.vlr_docto'+

           ' FROM FIN_BANCOS_EXTRATOS e'+
           '        LEFT JOIN fin_bancos b        ON b.cod_banco=e.cod_banco'+
           '        LEFT JOIN fin_bancos_lojas bl ON bl.cod_banco=b.cod_banco'+
           ' WHERE e.dta_extrato BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' AND e.num_seq<>999999'+
           ' AND NOT EXISTS (SELECT 1'+
           '                 FROM FIN_CONCILIACAO_PAGTOS p'+
           '                 WHERE p.chv_extrato=e.chv_extrato)'+
           ' ORDER BY 2, 1, 4, 3';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      Refresh;

      // Busca Num_Seq e Num_Compl dos Movtos ================================
      MySql:=' SELECT m.num_seq, m.num_compl'+
             ' FROM FIN_CONCILIACAO_MOVTOS m, fin_bancos_lojas bl, fin_bancos b'+
             ' WHERE bl.cod_loja=m.cod_loja'+
             ' AND   b.cod_banco=bl.cod_banco'+
             ' AND   m.ind_conciliacao=''NAO'''+
             ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_loja').AsString)+
             ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Extrato').AsString)+
             ' AND   m.vlr_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Vlr_Docto').AsString)+
             ' AND   b.num_conta='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      While Not DMBelShop.CDS_BuscaRapida.Eof do
      Begin
        Application.ProcessMessages;

        sChvExtrato:=DMBelShop.CDS_Busca.FieldByName('Chv_Extrato').AsString;

        MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
               ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
               ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
               ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
        DMBelShop.SQLC.Execute(MySql, nil, nil);

        MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
               ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
               ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
               ' Values ('+
               QuotedStr(sChvExtrato)+', '+
               QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
               QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
               QuotedStr('SIS')+', '+
               QuotedStr(sgCodUsuario)+', '+
               QuotedStr('3')+', '+
               QuotedStr('0')+', '+
               QuotedStr('C017')+')';
        DMBelShop.SQLC.Execute(MySql, nil, nil);

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);

        DMBelShop.CDS_BuscaRapida.Next;
      End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
      DMBelShop.CDS_BuscaRapida.Close;


      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C018 - Concilia Extrato Pelo cod_loja/dta_extrato/num_conta/cod_tpmovto/num_docto
    //==========================================================================
    Lb_Obs.Caption:='19/35 AGUARDE !! Concilia��o: Extrato - cod_loja/dta_extrato/num_conta/cod_tpmovto/num_docto';

    MySql:=' SELECT bl.cod_loja, e.dta_extrato, b.cod_banco, b.num_conta, e.cod_tpmovto,'+
           ' e.num_docto, sum(e.vlr_docto) vlr_docto'+
           
           ' FROM FIN_BANCOS_EXTRATOS e'+
           '        LEFT JOIN fin_bancos b        ON b.cod_banco=e.cod_banco'+
           '        LEFT JOIN fin_bancos_lojas bl ON bl.cod_banco=b.cod_banco'+
           ' WHERE e.dta_extrato BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' AND e.num_seq<>999999'+
           ' AND NOT EXISTS (SELECT 1'+
           '                 FROM FIN_CONCILIACAO_PAGTOS p'+
           '                 WHERE p.chv_extrato=e.chv_extrato)'+
           ' GROUP BY 1,2,3, 4, 5, 6'+
           ' ORDER BY 2, 1, 4, 3';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      Refresh;

      // Busca Num_Seq e Num_Compl dos Movtos ================================
      MySql:=' SELECT m.num_seq, m.num_compl'+
             ' FROM FIN_CONCILIACAO_MOVTOS m, fin_bancos_lojas bl, fin_bancos b'+
             ' WHERE bl.cod_loja=m.cod_loja'+
             ' AND   b.cod_banco=bl.cod_banco'+
             ' AND   m.ind_conciliacao=''NAO'''+
             ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_loja').AsString)+
             ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Extrato').AsString)+
             ' AND   m.vlr_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Vlr_Docto').AsString)+
             ' AND   b.num_conta='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      While Not DMBelShop.CDS_BuscaRapida.Eof do
      Begin
        Application.ProcessMessages;

        MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
               ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
               ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
               ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
        DMBelShop.SQLC.Execute(MySql, nil, nil);

        MySql:=' SELECT ex.chv_extrato'+
               ' FROM fin_bancos_extratos ex'+
               ' WHERE ex.dta_extrato='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('dta_extrato').AsString)+
               ' AND ex.cod_banco='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Banco').AsString)+
               ' AND ex.cod_tpmovto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('cod_tpmovto').AsString)+
               ' AND ex.num_docto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('num_docto').AsString);
        DMBelShop.CDS_Pesquisa.Close;
        DMBelShop.SDS_Pesquisa.CommandText:=MySql;
        DMBelShop.CDS_Pesquisa.Open;

        While Not DMBelShop.CDS_Pesquisa.Eof do
        Begin
          Application.ProcessMessages;

          sChvExtrato:=DMBelShop.CDS_Pesquisa.FieldByName('chv_extrato').AsString;

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C018')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_Pesquisa.Next;
        End; // While Not DMBelShop.CDS_Pesquisa.Eof do
        DMBelShop.CDS_Pesquisa.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);

        DMBelShop.CDS_BuscaRapida.Next;
      End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
      DMBelShop.CDS_BuscaRapida.Close;


      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C019 - Concilia Pela Loja/Dta_Pagto/Fornecedor/Comprovante ==============
    //==========================================================================
    Lb_Obs.Caption:='20/35 AGUARDE !! Concilia��o: Loja/Dta_Pagto/Fornecedor/Comprovante...';

    MySql:=' SELECT m.cod_loja, m.Dta_Pagto, m.cod_fornecedor, m.cod_comprovante,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3, 4';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)+
               ' AND m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C019')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C020 - Concilia Pela Loja/Dta_Pagto/Fornecedor ==========================
    //==========================================================================
    Lb_Obs.Caption:='21/35 AGUARDE !! Concilia��o: Loja/Dta_Pagto/Fornecedor...';

    MySql:=' SELECT m.cod_loja, m.Dta_Pagto, m.cod_fornecedor,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C020')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C021 - Concilia Pela Loja/Dta_Pagto/Comprovante =========================
    //==========================================================================
    Lb_Obs.Caption:='22/35 AGUARDE !! Concilia��o: Loja/Dta_Pagto/Comprovante...';

    MySql:=' SELECT m.cod_loja, m.Dta_Pagto, m.cod_comprovante,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C021')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C022 - Concilia Pela Loja/Dta_Pagto =====================================
    //==========================================================================
    Lb_Obs.Caption:='23/35 AGUARDE !! Concilia��o: Loja/Dta_Pagto...';

    MySql:=' SELECT m.cod_loja, m.Dta_Pagto,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;
      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C022')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C023 - Concilia Pela Loja/Fornecedor/Comprovante ========================
    //==========================================================================
    Lb_Obs.Caption:='24/35 AGUARDE !! Concilia��o: Loja/Fornecedor/Comprovante...';

    MySql:=' SELECT m.cod_loja, m.cod_fornecedor, m.cod_comprovante,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;
      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;
      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C023')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C024 - Concilia Pela Loja/Fornecedor ====================================
    //==========================================================================
    Lb_Obs.Caption:='25/35 AGUARDE !! Concilia��o: Loja/Fornecedor...';

    MySql:=' SELECT m.cod_loja, m.cod_fornecedor,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND m.cod_loja IN ('+sgCodLojas+')'+
           ' AND m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C024')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C025 - Concilia Pela Loja/Comprovante ===================================
    //==========================================================================
    Lb_Obs.Caption:='26/35 AGUARDE !! Concilia��o: Loja/Comprovante...';

    MySql:=' SELECT m.cod_loja, m.cod_comprovante,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C025')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C026 - Concilia Pela Dta_Pagto/Fornecedor/Comprovante ===================
    //==========================================================================
    Lb_Obs.Caption:='27/35 AGUARDE !! Concilia��o: Dta_Pagto/Fornecedor/Comprovante...';

    MySql:=' SELECT m.Dta_Pagto, m.cod_fornecedor, m.cod_comprovante,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2, 3';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C026')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C027 - Concilia Pela Dta_Pagto/Fornecedor ===============================
    //==========================================================================
    Lb_Obs.Caption:='28/35 AGUARDE !! Concilia��o: Dta_Pagto/Fornecedor...';

    MySql:=' SELECT m.Dta_Pagto, m.cod_fornecedor,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C027')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C028 - Concilia Pela Dta_Pagto/Comprovante ==============================
    //==========================================================================
    Lb_Obs.Caption:='29/35 AGUARDE !! Concilia��o: Dta_Pagto/Comprovante...';

    MySql:=' SELECT m.Dta_Pagto, m.cod_comprovante,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString)+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C028')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C029 - Concilia Pela Dta_Pagto ==========================================
    //==========================================================================
    Lb_Obs.Caption:='30/35 AGUARDE !! Concilia��o: Dta_Pagto...';

    MySql:=' SELECT m.Dta_Pagto,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.dta_pagto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Dta_Pagto').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C029')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C030 - Concilia Pelo Fornecedor/Comprovante =============================
    //==========================================================================
    Lb_Obs.Caption:='31/35 AGUARDE !! Concilia��o: Fornecedor/Comprovante...';

    MySql:=' SELECT m.cod_fornecedor, m.cod_comprovante,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C030')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C031 - Concilia Pelo Fornecedor =========================================
    //==========================================================================
    Lb_Obs.Caption:='32/35 AGUARDE !! Concilia��o: Fornecedor...';

    MySql:=' SELECT m.cod_fornecedor,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+

           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.cod_fornecedor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C031')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C032 - Concilia Pelo Comprovante ========================================
    //==========================================================================
    Lb_Obs.Caption:='33/35 AGUARDE !! Concilia��o: Comprovante...';

    MySql:=' SELECT m.cod_comprovante,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+
           
           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja IN ('+sgCodLojas+')'+
               ' AND   m.cod_comprovante='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Comprovante').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C032')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C033 - Concilia Pela Loja ===============================================
    //==========================================================================
    Lb_Obs.Caption:='34/35 AGUARDE !! Concilia��o: Loja...';

    MySql:=' SELECT m.cod_loja,'+
           ' Sum(m.vlr_pagto) vlr_pagto'+

           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_loja').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C033')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    //==========================================================================

    //==========================================================================
    // C034 - Concilia Pelo Cod_Loja/Chv_Recibo ================================
    //==========================================================================
    Lb_Obs.Caption:='35/35 AGUARDE !! Concilia��o: Cod_Loja/Chv_Recibo...';

    MySql:=' SELECT  m.cod_loja, m.chv_recibo,'+
           ' SUM(m.vlr_pagto) vlr_pagto'+

           ' FROM FIN_CONCILIACAO_MOVTOS m'+
           ' WHERE m.ind_conciliacao=''NAO'''+
           ' AND   m.cod_loja IN ('+sgCodLojas+')'+
           ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
           ' GROUP BY 1,2'+
           ' ORDER BY 1, 2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    HabilitaBotoes(False);

    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      sValor:=DMBelShop.CDS_Busca.FieldByName('Vlr_Pagto').AsString;

      Refresh;
      DMConciliacao.CDS_ConcExtratos.First;

      If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;CHV_CONCILIADA',VarArrayOf([sValor,Null]),[]) Then
      Begin
        sChvExtrato:=DMConciliacao.CDS_ConcExtratosCHV_EXTRATO.AsString;

        // Busca Num_Seq e Num_Compl dos Movtos ================================
        MySql:=' SELECT m.num_seq, m.num_compl'+
               ' FROM FIN_CONCILIACAO_MOVTOS m'+
               ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
               ' AND   m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
               ' AND   m.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Loja').AsString)+
               ' AND   m.chv_recibo='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Chv_Recibo').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          Application.ProcessMessages;

          MySql:=' Update FIN_CONCILIACAO_MOVTOS m'+
                 ' Set   m.IND_CONCILIACAO='+QuotedStr('SIM')+
                 ' Where m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                 ' And   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          MySql:=' Insert into FIN_CONCILIACAO_PAGTOS'+
                 ' (CHV_EXTRATO, NUM_SEQ, NUM_COMPL, IND_QUEM,'+
                 ' COD_USUARIO, TIP_AUX, COD_AUX, TIP_CONCILIACAO)'+
                 ' Values ('+
                 QuotedStr(sChvExtrato)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)+', '+
                 QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString)+', '+
                 QuotedStr('SIS')+', '+
                 QuotedStr(sgCodUsuario)+', '+
                 QuotedStr('3')+', '+
                 QuotedStr('0')+', '+
                 QuotedStr('C034')+')';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

        DMBelShop.CDS_BuscaRapida.Close;

        DMConciliacao.CDS_ConcExtratos.Close;
        DMConciliacao.CDS_ConcExtratos.Filter:='';
        DMConciliacao.CDS_ConcExtratos.Filtered:=False;
        DMConciliacao.CDS_ConcExtratos.Open;
        DMConciliacao.CDS_ConcExtratos.Locate('CHV_EXTRATO',sChvExtrato,[]);
      End; // If DMConciliacao.CDS_ConcExtratos.Locate('VLR_DOCTO;Conciliado',VarArrayOf([sValor,'NAO']),[]) Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    HabilitaBotoes(True);
    FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);
    //==========================================================================

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

    msg('Concilia��o Efetuada com SUCESSO !!','A');

  Except
    on e : Exception do
    Begin
      HabilitaBotoes(True);
      FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);

      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

  FreeAndNil(pgProgBar);

  Lb_Obs.Caption:='Observa��es...';
End; // Concilia��o - Efetua a Concilia��o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Concilia��o - Busca Movtos de Pagamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmBancoExtratos.ConcBuscaMovtoPagto: Boolean;
Var
  MySql: String;
  ii, i: Integer;
  bSiga, bProcOK, bSalva: Boolean;
  dDta: TDate;
Begin

  Result:=False;
  FrmBelShop.MontaProgressBar(True, FrmBancoExtratos);

  // Inicia Processamento ======================================================
  sgLojasNConectadas:='';
  bProcOK:=False;

  sgCodLojas:='';
  For ii:=0 to lgBoxLojas.Items.Count-1 do
  Begin
    pgProgBar.Position:=0;
    sgCodEmp:=lgBoxLojas.Items[ii];

    If Trim(sgCodLojas)='' Then
     sgCodLojas:=sgCodEmp
    Else
     sgCodLojas:=sgCodLojas+', '+sgCodEmp;

    // Apresentacao ==========================================================
    Lb_Obs.Caption:='AGUARDE !! Buscando Pagamentos da Loja: '+sgCodEmp;
    FrmBancoExtratos.Refresh;

    // Conecta Empresa =======================================================
    If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
     Begin
       bSiga:=True;
     End
    Else
     Begin
       FrmBancoExtratos.Refresh;
       bSiga:=False;

       If sgLojasNConectadas='' Then
        sgLojasNConectadas:='Bel_'+sgCodEmp
       Else
        sgLojasNConectadas:=sgLojasNConectadas+', Bel_'+sgCodEmp;
     End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

    // Inicia Processamento ==================================================
    If bSiga Then // Empresa Conectada
    Begin
      // Cria Query da Empresa ------------------------------------
      FrmBelShop.CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp,IBQ_ConsultaLoja, True, True);

      // Monta SQL ------------------------------------------------
      MySql:=' SELECT pg.chavenfprestacao,'+ // pg.codfilial||pg.codfornecedor||pg.codcomprovante||pg.serie||pg.numero||pg.numprestacao,
             ' pg.chavenf, pg.chavenfrecibo,'+
             ' pg.codfilial, pg.codcomprovante, pg.numero, pg.serie,'+
             ' pg.numprestacao,'+
             ' pg.datadocumento, pg.datapagamento, pg.datavencimento, pg.datacomprovante,'+
             ' pg.codbanco, ba.nomebanco, pg.codcobranca,'+
             ' pg.codfornecedor,'+
             ' pg.totnota, pg.desconto, pg.acrecimo, pg.totprestacao, pg.pagoparcial,'+
             ' pg.observacao "Observa��es",'+
             '  (Select Count(tp.CodFilial) tot'+
             '   FROM mforpago tp'+
             '       LEFT JOIN bancos tb ON tb.codbanco=tp.codbanco'+
             '   WHERE tp.codfilial='+QuotedStr(sgCodEmp)+
             '   AND tp.datapagamento between '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+') TotReg'+

             ' FROM mforpago pg'+
             '              LEFT JOIN bancos ba ON ba.codbanco=pg.codbanco'+

             ' WHERE pg.codfilial='+QuotedStr(sgCodEmp)+
             ' AND pg.datapagamento between '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
             ' ORDER BY pg.codfornecedor, pg.datavencimento, pg.numero';
      // Busca Movto de Pagamentos do Dia ---------------------------
      IBQ_ConsultaLoja.SQL.Clear;
      IBQ_ConsultaLoja.SQL.Add(MySql);

      // Abre Query -----------------------------------------------
      i:=0;
      bSiga:=False;
      While Not bSiga do
      Begin
        Try
          IBQ_ConsultaLoja.Open;
          bSiga:=True;
        Except
          Inc(i);
        End; // Try

        If i>10 Then
        Begin
          If sgLojasNConectadas='' Then
           sgLojasNConectadas:='Bel_'+sgCodEmp
          Else
           sgLojasNConectadas:=sgLojasNConectadas+', Bel_'+sgCodEmp;

          Break;
        End; // If i>10 Then
      End; // While Not bSiga do

      // Processamento =======================================================
      If bSiga Then // Query Executada
      Begin
        pgProgBar.Properties.Max:=IBQ_ConsultaLoja.FieldByName('TotReg').AsInteger;
        pgProgBar.Position:=0;

        // Monta Transacao ===================================================
        TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
        TD.IsolationLevel:=xilREADCOMMITTED;
        DMBelShop.SQLC.StartTransaction(TD);
        Try
          Screen.Cursor:=crAppStart;
          DateSeparator:='.';
          DecimalSeparator:='.';

          HabilitaBotoes(False);

          // Exclui Movtos N�o Conciliados ------------------------
          dDta:=StrToDate('23.11.2015');
          If (Pos(Trim(sgCodEmp), '02 03 05 08')=0) or (DtEdt_ConcDtaInicio.Date>dDta) Then
          Begin
            MySql:=' DELETE FROM FIN_CONCILIACAO_MOVTOS m'+
                   ' WHERE m.ind_conciliacao='+QuotedStr('NAO')+
                   ' AND m.cod_loja='+QuotedStr(sgCodEmp)+
                   ' AND m.dta_docto between '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
                   ' AND NOT EXISTS (SELECT 1'+
                   '                 FROM   FIN_CONCILIACAO_PAGTOS p'+
                   '                 WHERE p.num_seq=m.num_seq'+
                   '                 AND   p.num_compl=m.num_compl)';
            DMBelShop.SQLC.Execute(MySql,nil,nil);
          End; // If (Pos(Trim(sgCodEmp), '02 03 05 08')=0) or (DtEdt_ConcDtaInicio.Date>dDta) Then

          While Not IBQ_ConsultaLoja.Eof do
          Begin
            Application.ProcessMessages;

            pgProgBar.Position:=IBQ_ConsultaLoja.RecNo;

            FrmBancoExtratos.Refresh;
            bProcOK:=True;

            // Verifia se Existe ------------------------------------
            MySql:=' SELECT m.chv_pagto'+
                   ' FROM FIN_CONCILIACAO_MOVTOS m'+
                   ' WHERE m.chv_pagto='+
                   QuotedStr(IBQ_ConsultaLoja.FieldByName('chavenfprestacao').AsString)+
                   ' And m.vlr_pagto='+
                   QuotedStr(IBQ_ConsultaLoja.FieldByName('totprestacao').AsString);
            DMBelShop.CDS_BuscaRapida.Close;
            DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
            DMBelShop.CDS_BuscaRapida.Open;
            bSalva:=DMBelShop.CDS_BuscaRapida.FieldByName('chv_pagto').AsString='';
            DMBelShop.CDS_BuscaRapida.Close;

            If bSalva Then
            Begin
              // Verifica a Altera��o do Complemento da Sequencia do Registro ==
              MySql:=' SELECT GEN_ID(GEN_CONCILIACAO_MOVTOS,0) Num_Seq'+
                     ' FROM RDB$DATABASE';
              DMBelShop.CDS_BuscaRapida.Close;
              DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
              DMBelShop.CDS_BuscaRapida.Open;
              i:=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
              DMBelShop.CDS_BuscaRapida.Close;

              If i=999999 Then
              Begin
                // Acrescenta 1 no Complemento - GEN_COMPL_CONCILIACAO_MOVTOS
                MySql:=' SELECT GEN_ID(GEN_COMPL_CONCILIACAO_MOVTOS,1) Num_Seq'+
                       ' FROM RDB$DATABASE';
                DMBelShop.CDS_BuscaRapida.Close;
                DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
                DMBelShop.CDS_BuscaRapida.Open;
                DMBelShop.CDS_BuscaRapida.Close;

                // Inicializa Num_Seq - GEN_CONCILIACAO_MOVTOS
                MySql:=' ALTER SEQUENCE GEN_CONCILIACAO_MOVTOS RESTART WITH 0';
                DMBelShop.SQLC.Execute(MySql,nil,nil);
              End;

              MySql:=' Insert Into FIN_CONCILIACAO_MOVTOS ('+
                     ' NUM_SEQ, NUM_COMPL,'+
                     ' CHV_PAGTO, CHV_NOTA, CHV_RECIBO, COD_LOJA,'+
                     ' COD_COMPROVANTE, NUM_DOCTO, NUM_SERIE, NUM_PRESTACAO,'+
                     ' DTA_DOCTO, DTA_PAGTO, DTA_VENC, DTA_COMPR, COD_BANCO,'+
                     ' DES_BANCO, COD_COBRANCA, COD_FORNECEDOR, VLR_DOCTO,'+
                     ' VLR_DESCONTO, VLR_ACRESCIMO, VLR_PAGTO, IND_PAGTO_PARCIAL,'+
                     ' OBS_TEXTO, IND_CONCILIACAO)'+

                     ' Values('+
                     ' GEN_ID(GEN_CONCILIACAO_MOVTOS,1), '+
                     ' GEN_ID(GEN_COMPL_CONCILIACAO_MOVTOS,0), '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('CHAVENFPRESTACAO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('CHAVENF').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('CHAVENFRECIBO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('CODFILIAL').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('CODCOMPROVANTE').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('NUMERO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('SERIE').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('NUMPRESTACAO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('DATADOCUMENTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('DATAPAGAMENTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('DATAVENCIMENTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('DATACOMPROVANTE').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('CODBANCO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('NOMEBANCO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('CODCOBRANCA').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('CODFORNECEDOR').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('TOTNOTA').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('DESCONTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('ACRECIMO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('TOTPRESTACAO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('PAGOPARCIAL').AsString)+', '+
                     QuotedStr(IBQ_ConsultaLoja.FieldByName('Observa��es').AsString)+', '+
                     QuotedStr('NAO')+')';
               DMBelShop.SQLC.Execute(MySql,nil,nil);

            End; // If bSalva Then
            IBQ_ConsultaLoja.Next;
          End; // While Not IBQ_ConsultaLoja.Eof do
          IBQ_ConsultaLoja.Close;

          HabilitaBotoes(True);

          // Fecha Transacao =================================================
          DMBelShop.SQLC.Commit(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';
          Screen.Cursor:=crDefault;

        Except
          on e : Exception do
          Begin
            HabilitaBotoes(True);

            IBQ_ConsultaLoja.Close;
            DMBelShop.SQLC.Rollback(TD);

            DateSeparator:='/';
            DecimalSeparator:=',';
            Screen.Cursor:=crDefault;

            MessageBox(Handle, pChar(sgCodEmp+#13+e.message), 'Erro', MB_ICONERROR);

            FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);
          End; // on e : Exception do
        End; // Try

      End; // If bSiga Then // Query Executada
    End; // If bSiga Then // Empresa Conectada

    // Fecha Conex�o =========================================================
    ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

  End; // For ii:=0 to lgBoxLojas.Items.Count-1 do
  Lb_Obs.Caption:='Observa��es...';
  FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);

  Screen.Cursor:=crDefault;
  If sgLojasNConectadas<>'' Then
   msg('Lojas N�o Conectadas: '+cr+cr+sgLojasNConectadas,'A');

  If bProcOK Then
   Result:=True;

End; // Concilia��o - Busca Movtos de Pagamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Concilia��o - Limpa Conteudo de Componentes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.ConciliacaoLimpa(Sender: TControl; bLimpaTudo: Boolean=False);
Begin

  If Sender.Name='EdtConcNumAgencia' Then
  Begin
    EdtConcDesAgencia.Clear;
    sgCodBanco:='';
    EdtConcDesBanco.Clear;
    EdtConcNumBanco.Clear;
  End;

  If Sender.Name='EdtConcNumConta' Then
  Begin
    sgCodBanco:='';
    EdtConcDesBanco.Clear;
    EdtConcNumBanco.Clear;
  End;

  If Sender.Name='EdtConcNumBanco' Then
  Begin
    EdtConcDesAgencia.Clear;
    EdtConcDesBanco.Clear;
    sgCodBanco:='';
  End;

  If bLimpaTudo Then
  Begin
    EdtConcNumAgencia.Clear;
    EdtConcDesAgencia.Clear;
    EdtConcNumConta.Clear;
    EdtConcNumBanco.Clear;
    EdtConcDesBanco.Clear;
    sgCodBanco:='';

    EdtConcCodLoja.Clear;
    EdtConcDesLoja.Clear;
    sgCodLoja:='';
  End;

  Bt_ConcConciliar.Enabled:=False;
  DMConciliacao.CDS_LojasBancos.Close;
  DMConciliacao.CDS_ConcExtratos.Close;

End; // Concilia��o - Limpa Conteudo de Componentes >>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Concilia��o - Efetua a Concilia��o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.ConcConciliar;
Var
  sCodBacncos: String;
  MySql: String;
  i: Integer;
Begin
  // Guarda Codigos de Lojas e Bancos ==========================================
  lgBoxLojas:=TListBox.Create(Self);
  lgBoxLojas.Visible:=False;
  lgBoxLojas.Parent:=FrmBancoExtratos;
  lgBoxLojas.Width:=500;
  sCodBacncos:='';

  If Rb_ConcLoja.Checked Then
   Begin
     // Loja
     If EdtConcCodLoja.Value<10 Then
      lgBoxLojas.Items.Add('0'+VarToStr(EdtConcCodLoja.Value))
     Else
      lgBoxLojas.Items.Add(VarToStr(EdtConcCodLoja.Value));

     // Bancos
     DMConciliacao.CDS_LojasBancos.First;
     While Not DMConciliacao.CDS_LojasBancos.Eof do
     Begin
       If sCodBacncos<>'' Then
        sCodBacncos:=sCodBacncos+', '+DMConciliacao.CDS_LojasBancos.FieldBYName('Cod_Banco').AsString;

       If sCodBacncos='' Then
        sCodBacncos:=DMConciliacao.CDS_LojasBancos.FieldBYName('Cod_Banco').AsString;

       DMConciliacao.CDS_LojasBancos.Next;
     End;
     DMConciliacao.CDS_LojasBancos.First;

   End // If Rb_ConcLoja.Checked Then
  Else If Rb_ConcBanco.Checked Then
   Begin
     // Banco
     sCodBacncos:=sgCodBanco;

     // Lojas
     DMConciliacao.CDS_LojasBancos.First;
     While Not DMConciliacao.CDS_LojasBancos.Eof do
     Begin
       lgBoxLojas.Items.Add(DMConciliacao.CDS_LojasBancos.FieldBYName('Cod_Loja').AsString);

       DMConciliacao.CDS_LojasBancos.Next;
     End;
     DMConciliacao.CDS_LojasBancos.First;
   End // Else If Rb_ConcBanco.Checked Then
  Else If Rb_ConcTodos.Checked Then
   Begin
     // Busca Todas as Lojas ----------------------------------------
     MySql:=' SELECT e.cod_filial'+
            ' FROM emp_conexoes e'+
            ' ORDER BY e.cod_filial';
     DMBelShop.CDS_BuscaRapida.Close;
     DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
     DMBelShop.CDS_BuscaRapida.Open;

     While Not DMBelShop.CDS_BuscaRapida.Eof do
     Begin
       lgBoxLojas.Items.Add(DMBelShop.CDS_BuscaRapida.FieldBYName('Cod_Filial').AsString);

       DMBelShop.CDS_BuscaRapida.Next;
     End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
     DMBelShop.CDS_BuscaRapida.Close;

     // Busca Todos os Bancos ---------------------------------------
     MySql:=' SELECT b.cod_banco'+
            ' FROM fin_bancos b'+
            ' ORDER BY b.cod_banco';
     DMBelShop.CDS_BuscaRapida.Close;
     DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
     DMBelShop.CDS_BuscaRapida.Open;

     sCodBacncos:='';
     While Not DMBelShop.CDS_BuscaRapida.Eof do
     Begin
       If sCodBacncos<>'' Then
        sCodBacncos:=sCodBacncos+', '+DMBelShop.CDS_BuscaRapida.FieldBYName('Cod_Banco').AsString;

       If sCodBacncos='' Then
        sCodBacncos:=DMBelShop.CDS_BuscaRapida.FieldBYName('Cod_Banco').AsString;

       DMBelShop.CDS_BuscaRapida.Next;
     End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
     DMBelShop.CDS_BuscaRapida.Close;

   End; // Else If Rb_ConcTodos.Checked Then

  // Guarda Codigo de Lojas ====================================================
  sgCodLojas:='';
  For i:=0 to lgBoxLojas.Items.Count-1 do
  Begin
    If Trim(sgCodLojas)='' Then
     sgCodLojas:=lgBoxLojas.Items[i]
    Else
     sgCodLojas:=sgCodLojas+', '+lgBoxLojas.Items[i];
  End;

  // Busca Extratos Banc�rios ==================================================
  MySql:=' SELECT DISTINCT'+
         ' b.num_banco, b.des_banco, b.num_agencia, b.num_conta,'+
         ' e.dta_extrato, e.cod_tpmovto, m.des_tpmovto,'+
         ' e.num_docto, e.vlr_docto, m.ind_tipo,'+
         ' CASE'+
         '   WHEN p.chv_extrato IS NULL THEN'+
         '        ''NAO'''+
         '   ELSE'+
         '        ''SIM'''+
         ' END "Conciliado",'+
         ' e.chv_extrato, e.cod_banco, p.chv_extrato chv_conciliada'+

         ' FROM fin_bancos_extratos e'+
         '        LEFT JOIN fin_bancos_tp_movtos m    ON m.cod_tpmovto=e.cod_tpmovto'+
         '                                           AND m.cod_banco=e.cod_banco'+
         '        LEFT JOIN fin_conciliacao_pagtos p  ON p.chv_extrato=e.chv_extrato'+
         '        LEFT JOIN fin_bancos b              ON b.cod_banco=e.cod_banco'+

         ' WHERE m.ind_tipo=''D'''+
         ' AND   e.dta_extrato between '+QuotedStr(sgDtaInicio)+' And '+QuotedStr(sgDtaFim)+
         ' AND   e.cod_banco IN ('+sCodBacncos+')'+
         ' AND   e.Num_Seq<>999999'+

         '  ORDER BY b.Des_Banco, b.num_banco, b.num_agencia, b.num_conta, e.dta_extrato, e.num_seq';
  DMConciliacao.CDS_ConcExtratos.Close;
  DMConciliacao.SDS_ConcExtratos.CommandText:=MySql;
  DMConciliacao.CDS_ConcExtratos.Filter:='';
  DMConciliacao.CDS_ConcExtratos.Filtered:=False;
  DMConciliacao.CDS_ConcExtratos.Open;

  If Trim(DMConciliacao.CDS_ConcExtratos.FieldByName('chv_extrato').AsString)='' Then
  Begin
    Screen.Cursor:=crDefault;
    msg('Sem Extrato(s) no Dia Solicitado !!','A');
    FreeAndNil(lgBoxLojas);
    DMConciliacao.CDS_ConcExtratos.Close;
    Exit;
  End;

  If Not ConcBuscaMovtoPagto Then
  Begin
    Screen.Cursor:=crDefault;
    msg('Movimentos de Pagamentos'+cr+'N�o Encontrados na(s) Loja(s) !!','A');
    DtEdt_ConcDtaInicio.SetFocus;
    Exit;
  End;

  PC_ConcConciliar.ActivePage:=Ts_ConcConciliando;

  // Efetua a Concilia��o ======================================================
  ConcConcilia;

  Screen.Cursor:=crDefault;

  FreeAndNil(lgBoxLojas);
End; // // Concilia��o - Efetua a Concilia��o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manuten��o de Extratos - Salva Extrato >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.ExtratosSalvar;
Var
  MySql, sTpDebCre, sCodTpMovto: String;
  s, sNum_Seq: String;
//  bExisteSaldo, bInsere: Boolean;
Begin
  // Se Debito ou Credito ======================================================
  sTpDebCre:='C';
  If AnsiContainsStr(sgValor, '-') Then
   sTpDebCre:='D';

  // Ajusta Valor ==============================================================
  sgValor:=f_Troca('.','',sgValor);
  sgValor:=f_Troca(',','.',sgValor);
  sgValor:=Trim(f_Troca('-','',sgValor));

  // Limpa Valor '�' ===========================================================
  s:=copy(sgValor,length(sgValor),1);
  If s='�' Then
   sgValor:=copy(sgValor,1, length(sgValor)-1);

  // Verifica Tipo de Movimento ================================================
  MySql:=' SELECT t.cod_tpmovto'+
         ' FROM FIN_BANCOS_TP_MOVTOS t'+
         ' Where t.cod_banco='+QuotedStr(EdtExtCodBanco.Text)+
         ' and   t.des_tpmovto='+QuotedStr(sgDesMovto)+
         ' and   t.ind_tipo='+QuotedStr(sTpDebCre);
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;
  sCodTpMovto:=DMBelShop.CDS_Busca.FieldByName('Cod_TpMovto').AsString;
  DMBelShop.CDS_Busca.Close;

  // Cadastra Movto ============================================================
  If Trim(sCodTpMovto)=''  Then
  Begin
    MySql:=' SELECT GEN_ID(GEN_BANCO_TPMOVTOS,1) Codigo'+
           ' FROM RDB$DATABASE';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    sCodTpMovto:=DMBelShop.CDS_Busca.FieldByName('Codigo').AsString;
    DMBelShop.CDS_Busca.Close;

    MySql:=' Insert Into FIN_BANCOS_TP_MOVTOS'+
           ' (COD_BANCO, COD_TPMOVTO, DES_TPMOVTO, IND_TIPO)'+
           ' Values ('+
           QuotedStr(EdtExtCodBanco.Text)+', '+
           QuotedStr(sCodTpMovto)+', '+
           QuotedStr(sgDesMovto)+', '+
           QuotedStr(sTpDebCre)+')';
    DMBelShop.SQLC.Execute(MySql,nil,nil);
  End;

  // Num_Seq do Dia ============================================================
  If Trim(sgDesMovto)='SALDO NA DATA' Then
   Begin
     sNum_Seq:='999999';
   End
  Else
   Begin
     MySql:=' SELECT Coalesce(max(ex.Num_Seq)+1 ,1) Num_Seq'+
            ' FROM FIN_BANCOS_EXTRATOS ex'+
            ' WHERE ex.COD_BANCO='+QuotedStr(EdtExtCodBanco.Text)+
            ' And ex.DTA_EXTRATO='+QuotedStr(sgDta);
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;
    sNum_Seq:=DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString;
    DMBelShop.CDS_Busca.Close;
   End;

  // Insere Extrato ============================================================
  MySql:=' Insert Into FIN_BANCOS_EXTRATOS'+
         ' (COD_BANCO, DTA_EXTRATO, NUM_SEQ, COD_TPMOVTO,'+
         ' NUM_DOCTO, VLR_DOCTO, USU_INCLUI, DTA_INCLUI) '+
         ' Values ('+
         QuotedStr(EdtExtCodBanco.Text)+', '+
         QuotedStr(sgDta)+', '+
         QuotedStr(sNum_Seq)+', '+
         QuotedStr(sCodTpMovto)+', '+
         QuotedStr(Trim(sgDocto))+', '+
         QuotedStr(Trim(sgValor))+', '+
         QuotedStr(Trim(sgCodUsuario))+', '+
         ' current_timestamp)';
  DMBelShop.SQLC.Execute(MySql,nil,nil);

End; // Manuten��o de Extratos - Salva Extrato >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manuten��o de Extratos - Limpa Conteudo de Componentes >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.ExtratosLimpa(Sender: TControl);
Begin

  If Sender.Name='EdtExtNumAgencia' Then
  Begin
    EdtExtDesAgencia.Clear;
    EdtExtCodBanco.Clear;
    EdtExtDesBanco.Clear;
    EdtExtNumBanco.Clear;
  End;

  If Sender.Name='EdtExtNumConta' Then
  Begin
    EdtExtCodBanco.Clear;
    EdtExtDesBanco.Clear;
    EdtExtNumBanco.Clear;
  End;

  If Sender.Name='EdtExtNumBanco' Then
  Begin
    EdtExtDesAgencia.Clear;
    EdtExtDesBanco.Clear;
    EdtExtCodBanco.Clear;
  End;

  If DMConciliacao.CDS_Extrato.Active Then
   DMConciliacao.CDS_Extrato.Close;

  PC_ExtExtratos.Visible:=False;

  // Banrisul
  EdtBanrisulPastaArquivo.Clear;
  EditorBanrisulImpExtrato.Lines.Clear;

  // Santander
  EdtSantanderPastaArquivo.Clear;
  LimpaStringGrid(Strg_SantanderImpExtrato);
  Bt_SantanderImpExtrato.Enabled:=False;

End; // Manuten��o de Extratos - Limpa Conteudo de Componentes >>>>>>>>>>>>>>>>>

// Manuten��o de Extratos - Verifica se Banco tem Leiaute >>>>>>>>>>>>>>>>>>>>>>
Function  TFrmBancoExtratos.ExtratosLeiauteBanco(sDesBanco: String): Boolean;
Var
  MySql: String;
Begin
  Result:=False;
  sgLeiaute:='';
  PC_ExtExtratos.Visible:=False;

  MySql:=' Select Cod_Leiaute, Des_Leiaute'+
         ' From FIN_BANCOS_LEIAUTES'+
         ' Where Upper(Des_Leiaute) like '+QuotedStr('%'+AnsiUpperCase(sDesBanco)+'%');
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  If Not DMBelShop.CDS_Busca.IsEmpty Then
  Begin
    Result:=True;
    sgLeiaute:=DMBelShop.CDS_Busca.FieldByName('Des_Leiaute').AsString;

    If sgLeiaute='BANRISUL' Then
     Begin
       Ts_ExtratoSantander.TabVisible:=False;
       Ts_ExtratoBanrisul.TabVisible:=True;
       PC_ExtExtratos.ActivePage:=Ts_ExtratoBanrisul;
     End
    Else If sgLeiaute='SANTANDER' Then
     Begin
       Ts_ExtratoBanrisul.TabVisible:=False;
       Ts_ExtratoSantander.TabVisible:=True;
       PC_ExtExtratos.ActivePage:=Ts_ExtratoSantander;

       // Ajusta StringGrid - Santander
       Strg_SantanderImpExtrato.ColWidths[1]:=500;
       Strg_SantanderImpExtrato.RowCount := 0;

       With Strg_SantanderImpExtrato do
       Begin
         Cells[0, Row] := 'Data';
         Cells[1, Row] := 'Hist�rico';
         Cells[2, Row] := 'Documento';
         Cells[3, Row] := 'Valor';
         Cells[4, Row] := 'Saldo';
       End;
     End
    Else
     Exit;

    PC_ExtExtratos.Visible:=True;

    PC_ExtExtratosChange(Self);
  End;

  DMBelShop.CDS_Busca.Close;

End; // Manuten��o de Extratos - Verifica se Banco tem Leiaute >>>>>>>>>>>>>>>>>

// Manuten��o de Bancos - Libera Edits >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.BancosLiberaEdits(bLibera: Boolean);
Begin
  EdtNumBanco.Enabled:=bLibera;
  EdtNomeBanco.Enabled:=bLibera;
  EdtNumAgencia.Enabled:=bLibera;
  EdtNomeAgencia.Enabled:=bLibera;
  EdtNumConta.Enabled:=bLibera;
  Dbg_Bancos.Enabled:=Not bLibera;
  Dbg_LojasBanco.Enabled:=Not bLibera;

  If Not bLibera Then
  Begin
    EdtNumBanco.Clear;
    EdtNomeBanco.Clear;
    EdtNumAgencia.Clear;
    EdtNomeAgencia.Clear;
    EdtNumConta.Clear;

    Lb_Obs.Caption:='Observa��o...';
  End;

  If sgTpMDL<>'' Then
   Begin
     Bt_DML_1.Caption:='Salvar';
     Bt_DML_2.Caption:='Abandonar';
   End
  Else
   Begin
     Bt_DML_1.Caption:='Inserir';
     Bt_DML_2.Caption:='Alterar';
   End

End; // Manuten��o de Bancos - Libera Edits >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Desbilita o Scroll do Mouse no DbGrid >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmBancoExtratos.DesabilitaScrollMouse(var Msg: TMsg; var Handled: Boolean);
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
End; // Desbilita o Scroll do Mouse no DbGrid >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita o Scroll do Mouse no DBGrid >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmBancoExtratos.HabilitaScrollMouse(var Msg: TMsg; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // primeiramente verificamos se � o evento a ser tratado...
  if Msg.message = WM_MOUSEWHEEL then
  if ActiveControl is TDBGrid then // *** <=== AQUI voc� testa se classe � TDBGRID
  begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;
    Sentido := HiWord(Msg.wParam);

    if Sentido > 0 then
     Msg.wParam := VK_UP
    else
     Msg.wParam := VK_DOWN;
  end;
end; // Habilita o Scroll do Mouse no DBGrid >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmBancoExtratos.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Acertar Erro na Rolagem do Mouse ==========================================
  Application.OnMessage := ApplicationEvents1Message;

  // N�O PERMITIR MOVIMENTAR O FORM
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  sgDtaServidor:=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
  sgTpMDL:='';

  bgChange:=True;

  Application.OnMessage := HabilitaScrollMouse;

  MenuConcilicao.Visible:=False;

end;

procedure TFrmBancoExtratos.PC_PrincipalChange(Sender: TObject);
Var
  MySql: String;
begin
  CorSelecaoTabSheet(PC_Principal);

  If (PC_Principal.ActivePage=Ts_BancosManut) And (Dbg_Bancos.Visible) Then
  Begin
    Pan_Opcoes.Parent:=Ts_BancosManut;

    LiberaMenu(True);
    VisivelMenusConciliacoes(False);

    Dbg_Bancos.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_BancosManut) And (Dbg_Bancos.Visible) Then

  If (PC_Principal.ActivePage=Ts_ExtratosManut) and (EdtExtNumAgencia.Visible) Then
  Begin
    Pan_Opcoes.Parent:=Ts_ExtratosManut;

    LiberaMenu(True);
    VisivelMenusConciliacoes(False);
    Bt_Sair.Caption:='Sair';

    EdtExtNumAgencia.SetFocus;
    PC_ExtExtratos.Visible:=False;
  End; // If PC_Principal.ActivePage=Ts_ExtratosManut Then

  If PC_Principal.ActivePage=Ts_ConciliacaoManutPagtos Then
  Begin
    Pan_Opcoes.Parent:=Ts_ConciliacaoManutPagtos;

    PC_ConcConciliar.ActivePage:=Ts_ConcConciliar;

    If Pan_ConcBanco.Visible Then
     EdtConcNumAgencia.SetFocus;
    If Pan_ConcLoja.Visible Then
     EdtConcCodLoja.SetFocus;

  End; // If PC_Principal.ActivePage=Ts_ConciliacaoManutPagtos Then

  If PC_Principal.ActivePage=Ts_ConciliacoesManutPagtos Then
  Begin
    Pan_Opcoes.Parent:=Ts_ConciliacoesManutPagtos;

    If Pan_ConcBanco.Visible Then
     EdtConcNumAgencia.SetFocus;
    If Pan_ConcLoja.Visible Then
     EdtConcCodLoja.SetFocus;
  End; // If PC_Principal.ActivePage=Ts_ConciliacoesManutPagtos Then

  If (PC_Principal.ActivePage=Ts_HistConcAuto) And (Dbg_HistConcAuto.CanFocus) Then
  Begin
    Dbg_HistConcAuto.SetFocus;
  End; // If PC_Principal.ActivePage=Ts_HistConcAuto Then

  If (PC_Principal.ActivePage=Ts_VerificaExtrato) And (Dbg_VerifExtratosContas.CanFocus) Then
  Begin
    Pan_Opcoes.Parent:=Ts_VerificaExtrato;
    
    MySql:=' SELECT ''NAO'' PROC, b.cod_banco, b.num_banco, b.des_banco,'+
           ' b.num_agencia, b.des_agencia, b.num_conta'+
           ' FROM FIN_BANCOS b'+
           ' ORDER BY 4,6,7';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    Mem_VerifContas.Lines.Clear;
    Bt_Sair.Caption:='Sair';
    DtEdt_VerifExtratoDtaInicio.SetFocus;
  End; // If PC_Principal.ActivePage=Ts_HistConcAuto Then

  If (PC_Principal.ActivePage=Ts_ConciliacoesManutDepositos) And (Ts_ConciliacoesManutDepositos.CanFocus) Then
  Begin
    LiberaMenu(True);
    VisivelMenusConciliacoes(False);

    Ts_BancosManut.TabVisible:=False;
    Ts_ExtratosManut.TabVisible:=False;
    Ts_ConciliacaoManutPagtos.TabVisible:=False;
    Ts_ConciliacoesManutPagtos.TabVisible:=False;
    Ts_ConcManutTotalPagtos.TabVisible:=False;
    Ts_HistConcAuto.TabVisible:=False;
  End; // If (PC_Principal.ActivePage=Ts_ConciliacoesManutDepositos) And (Ts_ConciliacoesManutDepositos.CanFocus) Then

end;

procedure TFrmBancoExtratos.Bt_SairClick(Sender: TObject);
begin

 DMConciliacao.FechaTudoConciliacao;
 If Bt_Sair.Caption='Sair' Then
  Begin
    bgSairBancos:=True;
    FrmBelShop.FechaTudo;
    Close;
  End;

  If Bt_Sair.Caption='Voltar' Then
  Begin
    LiberaMenu(True);

    Ts_BancosManut.TabVisible:=False;
    Ts_ExtratosManut.TabVisible:=False;
    Ts_ConciliacaoManutPagtos.TabVisible:=False;
    Ts_ConciliacoesManutPagtos.TabVisible:=False;
    Ts_ConcManutTotalPagtos.TabVisible:=False;
    Ts_HistConcAuto.TabVisible:=False;

    Pan_Opcoes.Parent:=PC_Principal;
    Pan_Opcoes.Visible:=True;
    Pan_Concilicao.Visible:=False;
  End;

end;

procedure TFrmBancoExtratos.PC_BancosChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Bancos);

end;

procedure TFrmBancoExtratos.Bt_DML_1Click(Sender: TObject);
Var
  sCodBanco, MySql: String;
begin

  // Salvar Banco ==============================================================
  If Bt_DML_1.Caption='Salvar' Then
  Begin
    // Consistencias ================================================
    If Trim(EdtNumBanco.Text)='' Then
    Begin
      msg('Favor Informar o N�mero do Banco !!','A');
      EdtNumBanco.SetFocus;
      Exit;
    End;

    If StrToIntDef(EdtNumBanco.Text,0)=0 Then
    Begin
      msg('N�mero do Banco � Inv�lido !!','A');
      EdtNumBanco.SetFocus;
      Exit;
    End;

    If Trim(EdtNomeBanco.Text)='' Then
    Begin
      msg('Favor Informar o Nome do Banco !!','A');
      EdtNomeBanco.SetFocus;
      Exit;
    End;

    If Trim(EdtNumAgencia.Text)='' Then
    Begin
      msg('Favor Informar o N�mero da Ag�ncia !!','A');
      EdtNumAgencia.SetFocus;
      Exit;
    End;

    If Trim(EdtNomeAgencia.Text)='' Then
    Begin
      msg('Favor Informar o Nome da Ag�ncia !! ','A');
      EdtNomeAgencia.SetFocus;
      Exit;
    End;

    If Trim(EdtNumConta.Text)='' Then
    Begin
      msg('Favor Informar o N�mero da Conta !! ','A');
      EdtNumConta.SetFocus;
      Exit;
    End;

    // Verificva se Transa��o esta Ativa
    If DMBelShop.SQLC.InTransaction Then
     DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao ==============================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      // Insere Banco -----------------------------------------------
      If sgTpMDL='I' Then
      Begin
        // Busca Codigo do Banco ------------------------------------
        MySql:='SELECT GEN_ID(GEN_BANCO_CODIGO,1) Codigo'+
               ' FROM RDB$DATABASE';
        DMBelShop.CDS_Busca.Close;
        DMBelShop.SDS_Busca.CommandText:=MySql;
        DMBelShop.CDS_Busca.Open;
        sCodBanco:=DMBelShop.CDS_Busca.FieldByName('Codigo').AsString;
        DMBelShop.CDS_Busca.Close;

        MySql:=' Insert Into FIN_BANCOS'+
               ' (COD_BANCO, NUM_BANCO, DES_BANCO, NUM_AGENCIA, DES_AGENCIA,'+
               ' NUM_CONTA, USU_INCLUI, DTA_INCLUI) '+
               ' Values ('+
               QuotedStr(Trim(sCodBanco))+', '+
               QuotedStr(Trim(EdtNumBanco.Text))+', '+
               QuotedStr(Trim(EdtNomeBanco.Text))+', '+
               QuotedStr(Trim(EdtNumAgencia.Text))+', '+
               QuotedStr(Trim(EdtNomeAgencia.Text))+', '+
               QuotedStr(Trim(EdtNumConta.Text))+', '+
               QuotedStr(sgCodUsuario)+', '+
               ' current_timestamp)';
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End;

      // Altera Banco -----------------------------------------------
      If sgTpMDL='A' Then
      Begin
        sCodBanco:=DMConciliacao.CDS_BancosCOD_BANCO.AsString;

        MySql:=' Update FIN_BANCOS'+
               ' Set NUM_BANCO='+QuotedStr(Trim(EdtNumBanco.Text))+
               ', DES_BANCO='+QuotedStr(Trim(EdtNomeBanco.Text))+
               ', NUM_AGENCIA='+QuotedStr(Trim(EdtNumAgencia.Text))+
               ', DES_AGENCIA='+QuotedStr(Trim(EdtNomeAgencia.Text))+
               ', NUM_CONTA='+QuotedStr(Trim(EdtNumConta.Text))+
               ', USU_ALTERA='+QuotedStr(sgCodUsuario)+
               ', DTA_ALTERA=current_timestamp'+

               ' Where Cod_Banco='+sCodBanco;
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End;

      // Atualiza Transacao =========================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      DMConciliacao.CDS_Bancos.Close;
      DMConciliacao.CDS_Bancos.Open;

      DMConciliacao.CDS_Bancos.Locate('COD_BANCO',sCodBanco,[]);

    Except
      on e : Exception do
      Begin
        HabilitaBotoes(True);

        // Abandona Transacao =======================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        If AnsiContainsStr(AnsiUpperCase(e.message), 'DUPLICATE VALUE') Then
         Begin
           DMConciliacao.CDS_Bancos.Locate('Num_Conta',EdtNumConta.Text,[]);
           msg('Banco/Conta Duplicada !!','A');
         End
        Else
         MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);

        Bt_DML_2Click(Self);
        exit;
      End; // on e : Exception do
    End; // Try

    sgTpMDL:='';
    BancosLiberaEdits(False);

    Dbg_Bancos.SetFocus;

    Exit;
  End; // If Bt_DML_1.Caption='Inserir' Then

  // Inserir Banco =============================================================
  If Bt_DML_1.Caption='Inserir' Then
  Begin
    sgTpMDL:='I';
    BancosLiberaEdits(True);
    Lb_Obs.Caption:='Incluindo Banco';


    EdtNumBanco.SetFocus;
  End; // If Bt_DML_1.Caption='Inserir' Then

end;

procedure TFrmBancoExtratos.Bt_DML_2Click(Sender: TObject);
begin
  // Salvar Banco ==============================================================
  If Bt_DML_2.Caption='Abandonar' Then
  Begin
    sgTpMDL:='';
    BancosLiberaEdits(False);

    Dbg_Bancos.SetFocus;

    Exit;
  End; // If Bt_DML_1.Caption='Inserir' Then

  // Inserir Banco =============================================================
  If Bt_DML_2.Caption='Alterar' Then
  Begin

    If DMConciliacao.CDS_Bancos.IsEmpty Then
    Begin
      msg('Sem Banco a Alterar !!','A');
      Exit;
    End;

    sgTpMDL:='A';
    BancosLiberaEdits(True);
    Lb_Obs.Caption:='Alterando Banco';

    // Apresenta Banco ----------------------------------------------
    EdtNumBanco.Text   :=DMConciliacao.CDS_BancosNUM_BANCO.AsString;
    EdtNomeBanco.Text  :=DMConciliacao.CDS_BancosDES_BANCO.AsString;
    EdtNumAgencia.Text :=DMConciliacao.CDS_BancosNUM_AGENCIA.AsString;
    EdtNomeAgencia.Text:=DMConciliacao.CDS_BancosDES_AGENCIA.AsString;
    EdtNumConta.Text   :=DMConciliacao.CDS_BancosNUM_CONTA.AsString;

    EdtNumBanco.SetFocus;
  End; // If Bt_DML_1.Caption='Inserir' Then

end;

procedure TFrmBancoExtratos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmBancoExtratos.Dbg_BancosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
Var
  MySql: String;
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

  If Key=VK_Delete Then
  Begin
    If DMConciliacao.CDS_Bancos.IsEmpty Then
    Begin
      msg('Sem Banco a Excluir !!','A');
      Exit;
    End;

    If msg('Deseja Realmente Excluir o'+cr+'Banco Selecionado ??','C')=2 Then
     Exit;

    // Verificva se Transa��o esta Ativa
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

      MySql:=' Delete From FIN_BANCOS_LOJAS'+
             ' Where Cod_Banco='+QuotedStr(DMConciliacao.CDS_BancosCOD_BANCO.AsString);
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      MySql:=' Delete From FIN_BANCOS'+
             ' Where Cod_Banco='+QuotedStr(DMConciliacao.CDS_BancosCOD_BANCO.AsString);
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      DMConciliacao.CDS_Bancos.Close;
      DMConciliacao.CDS_Bancos.Open;
    Except
      on e : Exception do
      Begin
        HabilitaBotoes(True);

        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        exit;
      End; // on e : Exception do
    End; // Try

  End; // If Key=VK_Delete Then
end;

procedure TFrmBancoExtratos.EdtCodLojaExit(Sender: TObject);
Var
  sCodLoja, sCodLojas, MySql: String;
begin

  EdtDesLoja.Clear;
                               
  If EdtCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From EMP_CONEXOES'+
           ' Where COD_FILIAL='+QuotedStr(FormatFloat('00',EdtCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If DMBelShop.CDS_BuscaRapida.Eof Then
    Begin
      msg('Loja N�O Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtCodLoja.Clear;
      EdtCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;

    EdtDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;

    If Length(EdtCodLoja.Text)<2 Then
     sCodLoja:='0'+EdtCodLoja.Text
    Else
     sCodLoja:=EdtCodLoja.Text;

    If Not DMConciliacao.CDS_LojasBanco.Locate('Cod_loja',sCodLoja,[]) Then
    Begin
      // Verificva se Transa��o esta Ativa
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

        MySql:=' Insert Into FIN_BANCOS_LOJAS'+
               ' (COD_BANCO, COD_LOJA, USU_INCLUI, DTA_INCLUI)'+
               ' Values ('+
               QuotedStr(DMConciliacao.CDS_BancosCOD_BANCO.AsString)+', '+
               QuotedStr(sCodLoja)+', '+
               QuotedStr(sgCodUsuario)+
               ', current_timestamp)';
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        DMConciliacao.CDS_LojasBanco.Close;
        DMConciliacao.CDS_LojasBanco.Open;

        // Atualixa Lojas no Banco ----------------------------------
        sCodLojas:='';
        DMConciliacao.CDS_LojasBanco.First;
        While Not DMConciliacao.CDS_LojasBanco.Eof do
        Begin
          If sCodLojas='' Then
           sCodLojas:=DMConciliacao.CDS_LojasBancoCOD_LOJA.AsString
          Else
           sCodLojas:=sCodLojas+', '+DMConciliacao.CDS_LojasBancoCOD_LOJA.AsString;

          DMConciliacao.CDS_LojasBanco.Next;
        End; // While Not DMConciliacao.CDS_LojasBanco.Eof do

        MySql:=' Update FIN_BANCOS'+
               ' Set COD_LOJAS='+QuotedStr(sCodLojas)+
               ' Where Cod_Banco='+
               QuotedStr(DMConciliacao.CDS_BancosCOD_BANCO.AsString);
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        sgCodBanco:=DMConciliacao.CDS_BancosCOD_BANCO.AsString;

        DMConciliacao.CDS_Bancos.Close;
        DMConciliacao.CDS_Bancos.Open;
        DMConciliacao.CDS_Bancos.Locate('Cod_Banco',sgCodBanco,[]);

        // Atualiza Transacao =======================================
        DMBelShop.SQLC.Commit(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;
      Except
        on e : Exception do
        Begin
          HabilitaBotoes(True);

          // Abandona Transacao =====================================
          DMBelShop.SQLC.Rollback(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';
          Screen.Cursor:=crDefault;

          MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
          exit;
        End; // on e : Exception do
      End; // Try
    End; // If Not DMConciliacao.CDS_LojasBanco.Locate('Cod_loja',sCodLoja,[]) Then

    Dbg_LojasBanco.SetFocus;

    DMBelShop.CDS_BuscaRapida.Close;

   Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmBancoExtratos.Bt_BuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtCodLoja.Clear;
  EdtDesLoja.Clear;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
         ' From EMP_CONEXOES'+
         ' Order by RAZAO_SOCIAL';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If DMBelShop.CDS_Pesquisa.Eof Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Loja a Listar !!','A');
    EdtCodLoja.SetFocus;
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
     EdtCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtDesLoja.Text:=FrmPesquisa.EdtDescricao.Text;

     EdtCodLojaExit(Self);
   End
  Else
   Begin
     EdtCodLoja.Clear;
     EdtDesLoja.Clear;
     EdtCodLoja.SetFocus;
   End;

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmBancoExtratos.Dbg_LojasBancoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  MySql: String;  
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

  If Key=VK_Delete Then
  Begin
    If DMConciliacao.CDS_LojasBanco.IsEmpty Then
    Begin
      msg('Sem Loja a Excluir !!','A');
      Exit;
    End;

    If msg('Deseja Realmente Excluir a'+cr+'Loja Selecionada ??','C')=2 Then
     Exit;

    // Verificva se Transa��o esta Ativa
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

      MySql:=' Delete From FIN_BANCOS_LOJAS'+
             ' Where Cod_Banco='+QuotedStr(DMConciliacao.CDS_BancosCOD_BANCO.AsString)+
             ' And Cod_Loja='+QuotedStr(DMConciliacao.CDS_LojasBancoCOD_LOJA.AsString);
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      DMConciliacao.CDS_LojasBanco.Close;
      DMConciliacao.CDS_LojasBanco.Open;

      If DMConciliacao.CDS_LojasBanco.IsEmpty Then
      Begin
        EdtCodLoja.Clear;
        EdtDesLoja.Clear;
      End;
      
    Except
      on e : Exception do
      Begin
        HabilitaBotoes(True);

        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        exit;
      End; // on e : Exception do
    End; // Try

  End; // If Key=VK_Delete Then

end;

procedure TFrmBancoExtratos.Bt_ExcluiLojaClick(Sender: TObject);
Var
  sCodLojas, MySql: String;
begin
  If DMConciliacao.CDS_LojasBanco.IsEmpty Then
  Begin
    msg('Sem Loja a Excluir !!','A');
    Exit;
  End;

  If msg('Deseja Realmente Excluir a'+cr+'Loja Selecionada ??','C')=2 Then
   Exit;

  // Verificva se Transa��o esta Ativa
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

    MySql:=' Delete From FIN_BANCOS_LOJAS'+
           ' Where Cod_Banco='+QuotedStr(DMConciliacao.CDS_BancosCOD_BANCO.AsString)+
           ' And Cod_Loja='+QuotedStr(DMConciliacao.CDS_LojasBancoCOD_LOJA.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DMConciliacao.CDS_LojasBanco.Close;
    DMConciliacao.CDS_LojasBanco.Open;

    // Atualixa Lojas no Banco ----------------------------------
    DMConciliacao.CDS_LojasBanco.First;
    While Not DMConciliacao.CDS_LojasBanco.Eof do
    Begin
      If sCodLojas='' Then
       sCodLojas:=DMConciliacao.CDS_LojasBancoCOD_LOJA.AsString
      Else
       sCodLojas:=sCodLojas+', '+DMConciliacao.CDS_LojasBancoCOD_LOJA.AsString;

      DMConciliacao.CDS_LojasBanco.Next;
    End; // While Not DMConciliacao.CDS_LojasBanco.Eof do

    MySql:=' Update FIN_BANCOS'+
           ' Set COD_LOJAS='+QuotedStr(sCodLojas)+
           ' Where Cod_Banco='+
           QuotedStr(DMConciliacao.CDS_BancosCOD_BANCO.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    sgCodBanco:=DMConciliacao.CDS_BancosCOD_BANCO.AsString;

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

    DMConciliacao.CDS_Bancos.Close;
    DMConciliacao.CDS_Bancos.Open;
    DMConciliacao.CDS_Bancos.Locate('Cod_Banco',sgCodBanco,[]);

    If DMConciliacao.CDS_LojasBanco.IsEmpty Then
    Begin
      EdtCodLoja.Clear;
      EdtDesLoja.Clear;
    End;

  Except
    on e : Exception do
    Begin
      HabilitaBotoes(True);

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

procedure TFrmBancoExtratos.FormShow(Sender: TObject);
begin
  bgSairBancos:=False;

  Ts_ConcManutTotalPagtos.TabVisible:=False;
  Ts_HistConcAuto.TabVisible:=False;
  MenuTipoConcilciao.Visible:=False;

  If Ts_BancosManut.TabVisible Then
  Begin
    DMConciliacao.CDS_Bancos.Open;
    DMConciliacao.CDS_LojasBanco.Open;
  End; // If Ts_Bancos.TabVisible Then

  If PC_Principal.ActivePage=Ts_BancosManut Then
  Begin
    Dbg_Bancos.SetFocus;
    PC_PrincipalChange(Self);
  End;

  If PC_Principal.ActivePage=Ts_ExtratosManut Then
  Begin
    EdtExtNumAgencia.SetFocus;
    PC_ExtExtratos.Visible:=False;
    PC_PrincipalChange(Self);
  End; // If PC_Principal.ActivePage=Ts_ExtratosManut Then

  If PC_Principal.ActivePage=Ts_ConciliacaoManutPagtos Then
  Begin
    PC_ConcConciliar.ActivePage:=Ts_ConcConciliar;
    EdtConcNumAgencia.SetFocus;
  End; // If PC_Principal.ActivePage=Ts_ConciliacaoManutPagtos Then

  If PC_Principal.ActivePage=Ts_VerificaExtrato Then
  Begin
    PC_PrincipalChange(Self);
  End; // If PC_Principal.ActivePage=Ts_VerificaExtrato Then

  If PC_Principal.ActivePage=Ts_ConciliacoesManutDepositos Then
  Begin
    PC_PrincipalChange(Self);
  End; // If PC_Principal.ActivePage=Ts_ConciliacoesManutDepositos Then

  DtEdt_PeriodoDtaInicio.Text:=DateToStr(Now);
  DtEdt_PeriodoDtaFim.Text:=DateToStr(Now);

  DtEdt_ConcDtaInicio.Text:=DateToStr(Now-1);
  DtEdt_ConcDtaFim.Text:=DateToStr(Now-1);

end;

procedure TFrmBancoExtratos.PC_ExtratosChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Extratos);

end;

procedure TFrmBancoExtratos.EdtExtNumBancoExit(Sender: TObject);
Var
  MySql: String;
begin
  If EdtExtNumBanco.Value<>0 Then
  Begin
    If Trim(EdtExtNumAgencia.Text)='' Then
    Begin
      msg('Favor Informar o N� da Agencia !!','A');
      EdtExtNumAgencia.SetFocus;
      Exit;
    End;

    If Trim(EdtExtNumConta.Text)='' Then
    Begin
      msg('Favor Informar o N� da Conta !!','A');
      EdtExtNumConta.SetFocus;
      Exit;
    End;

    EdtExtDesBanco.Clear;
    EdtExtCodBanco.Clear;

    Screen.Cursor:=crAppStart;

    // Busca Bancos =============================================================
    MySql:=' SELECT b.DES_BANCO, b.NUM_BANCO, b.NUM_CONTA, b.NUM_AGENCIA,'+
           ' b.DES_AGENCIA, b.COD_BANCO'+
           ' FROM FIN_BANCOS b'+
           ' Where  b.NUM_AGENCIA='+QuotedStr(EdtExtNumAgencia.Text)+
           '  and replace(replace(replace(replace(b.NUM_CONTA, ''.'', ''''),''-'',''''),''/'',''''),'' '','''')='+
           '      replace(replace(replace(replace('+QuotedStr(EdtExtNumConta.Text)+', ''.'', ''''),''-'',''''),''/'',''''),'' '','''')'+
           ' and    b.NUM_BANCO='+QuotedStr(EdtExtNumBanco.Text);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If DMBelShop.CDS_BuscaRapida.Eof Then
    Begin
      msg('Banco/Agencia/Conta N�O Encontrados !!!', 'A');
      Screen.Cursor:=crDefault;
      DMBelShop.CDS_BuscaRapida.Close;

      EdtExtNumBanco.Clear;
      EdtExtNumBanco.SetFocus;
      Exit;
    End;

    EdtExtDesAgencia.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Agencia').AsString;

    bgChange:=False;
    EdtExtNumConta.Text  :=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Conta').AsString;

    EdtExtDesBanco.Text  :=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Banco').AsString;
    EdtExtNumBanco.Text  :=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Banco').AsString;
    EdtExtCodBanco.Text  :=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Banco').AsString;

    EdtExtNumAgencia.SetFocus;

    DMBelShop.CDS_BuscaRapida.Close;

   Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmBancoExtratos.EdtExtNumAgenciaChange(Sender: TObject);
begin
  ExtratosLimpa(EdtExtNumAgencia);
end;

procedure TFrmBancoExtratos.EdtExtNumContaChange(Sender: TObject);
begin
  If bgChange Then
   ExtratosLimpa(EdtExtNumConta);

  bgChange:=True;
end;

procedure TFrmBancoExtratos.EdtExtNumBancoChange(Sender: TObject);
begin
  ExtratosLimpa(EdtExtNumBanco);

end;

procedure TFrmBancoExtratos.EdtExtBuscaBancoClick(Sender: TObject);
Var
  MySql: String;
begin

  If Trim(EdtExtNumAgencia.Text)='' Then
  Begin
    msg('Favor Informar o N� da Agencia !!','A');
    EdtExtNumAgencia.SetFocus;
    Exit;
  End;

  If Trim(EdtExtNumConta.Text)='' Then
  Begin
    msg('Favor Informar o N� da Conta !!','A');
    EdtExtNumConta.SetFocus;
    Exit;
  End;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtExtCodBanco.Clear;
  EdtExtNumBanco.Clear;
  EdtExtDesBanco.Clear;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Bancos =============================================================
  MySql:=' SELECT b.DES_BANCO, b.NUM_BANCO, b.NUM_CONTA, b.NUM_AGENCIA,'+
         ' b.DES_AGENCIA, b.COD_BANCO'+
         ' FROM FIN_BANCOS b'+
         ' Where b.NUM_AGENCIA='+QuotedStr(EdtExtNumAgencia.Text)+
         ' and   b.NUM_CONTA='+QuotedStr(EdtExtNumConta.Text)+
         ' Order by b.DES_BANCO';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If DMBelShop.CDS_Pesquisa.Eof Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Banco/Agencia/Conta N�O Encontrados !!!', 'A');
    EdtExtNumBanco.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='DES_BANCO';
  FrmPesquisa.Campo_Codigo:='NUM_BANCO';
  FrmPesquisa.Campo_Descricao:='DES_BANCO';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtExtNumBanco.Text:=FrmPesquisa.EdtCodigo.Text;

     EdtExtNumBancoExit(Self);
   End
  Else
   Begin
     EdtExtCodBanco.Clear;
     EdtExtDesBanco.Clear;
     EdtExtNumBanco.SetFocus;
   End;

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmBancoExtratos.EdtExtDesBancoChange(Sender: TObject);
begin
  If (Trim(EdtExtDesBanco.Text)<>'') and (Not ExtratosLeiauteBanco(Trim(EdtExtDesBanco.Text))) Then
   msg('Banco SEM Leiaute Definido !!','A');
end;

procedure TFrmBancoExtratos.PC_ExtExtratosChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_ExtExtratos);

end;

procedure TFrmBancoExtratos.Bt_BanrisulArquivoClick(Sender: TObject);
Var
  OpenDialog: TOpenDialog;
begin
  EditorBanrisulImpExtrato.Lines.Clear;
  Bt_BanrisulImpExtrato.Enabled:=False;

  OpenDialog := TOpenDialog.Create(Self);
  With OpenDialog do
  Begin
    Options := [ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
    DefaultExt := 'TXT';
    Filter := 'Arquivo Texto (*.txt)|*.TXT';
    FilterIndex := 1;
    Title := 'Busca Arquivos Texto';

    If Execute then
     Begin
       EdtBanrisulPastaArquivo.Text:=OpenDialog.FileName;
       EditorBanrisulImpExtrato.Lines.LoadFromFile(EdtBanrisulPastaArquivo.Text);

       If FileDateToDateTime(FileAgeCreate(EdtBanrisulPastaArquivo.Text))<StrToDate(sgDtaServidor) Then
       Begin
         MessageBox(Handle, pChar('DATA da Cria��o do Arquivo �'+cr+'Inferior ao dia de Hoje !!'+cr+cr+'Favor Gerar o Arquivo Novamente...'), 'Erro', MB_ICONERROR);
         FreeAndNil(OpenDialog);
         Exit;
       End;

       Bt_BanrisulImpExtrato.Enabled:=True;
     End
    Else
    Begin
      Free;
      Exit;
    End;

    Free;
  End;
End;

procedure TFrmBancoExtratos.Bt_BanrisulImpExtratoClick(Sender: TObject);
Var
  ii, i: Integer;
  s, sLinha,
  sDtaApagar: String;
  bIniciou, bGrava: Boolean;
  MySql: String;
  iPosDocto: Integer;
//odirapagar -  bSaldoConta, bInvestAut: Boolean; // Pega Saldo da Conta e Inventimento Automatico.

  Procedure ExcluirExtrato(sCodBanco, sDtaExclui: String);
  Begin
    // =========================================================================
    // OdirApagar - N�o Retira Concilia��es J� Feitas - 24/11/2017 =============
    // =========================================================================
//    // Exclui Concilia��es J� Efetuadas no Dia =================================
//    MySql:=' DELETE FROM FIN_CONCILIACAO_PAGTOS pg'+
//           ' WHERE EXISTS (SELECT 1'+
//           '               FROM FIN_BANCOS_EXTRATOS ex'+
//           '               WHERE ex.chv_extrato=pg.chv_extrato'+
//           '               AND   ex.cod_banco='+QuotedStr(sCodBanco)+
//           '               AND   ex.dta_extrato='+QuotedStr(sDtaExclui)+')';
//    DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//    MySql:=' UPDATE FIN_CONCILIACAO_MOVTOS m'+
//           ' Set m.ind_conciliacao=''NAO'''+
//           ' WHERE m.ind_conciliacao=''SIM'''+
//           ' AND   NOT EXISTS (SELECT 1'+
//           '                   FROM FIN_CONCILIACAO_PAGTOS p'+
//           '                   WHERE p.num_seq=m.num_seq'+
//           '                   AND   p.num_compl=m.num_compl)';
//    DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//    // Exclui Concilia��es de Dep�sitos do Dia ===========================
//    MySql:=' DELETE FROM FIN_CONCILIACAO_DEPOSITOS dp'+
//           ' WHERE EXISTS (SELECT 1'+
//           '               FROM FIN_BANCOS_EXTRATOS ex'+
//           '               WHERE ex.chv_extrato=dp.chv_extrato'+
//           '               AND   ex.cod_banco='+QuotedStr(EdtExtCodBanco.Text)+
//           '               AND   ex.dta_extrato='+QuotedStr(sgDta)+')';
//    DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//    MySql:=' UPDATE FIN_CONCILIACAO_MOV_DEP m'+
//           ' Set m.ind_conciliacao=''NAO'''+
//           ' WHERE m.ind_conciliacao=''SIM'''+
//           ' AND   NOT EXISTS (SELECT 1'+
//           '                   FROM FIN_CONCILIACAO_DEPOSITOS D'+
//           '                   WHERE d.num_seq=m.num_seq'+
//           '                   AND   d.num_compl=m.num_compl)';
//    DMBelShop.SQLC.Execute(MySql,nil,nil);
    // OdirApagar - N�o Retira Concilia��es J� Feitas - 24/11/2017 =============
    // =========================================================================

    // Exclui Extrato do Dia ===================================================
    MySql:=' DELETE FROM FIN_BANCOS_EXTRATOS ex'+
           ' WHERE ex.cod_banco='+QuotedStr(sCodBanco)+
           ' AND   ex.dta_extrato='+QuotedStr(sDtaExclui);
    DMBelShop.SQLC.Execute(MySql,nil,nil);
  End; //  Procedure ApagarExtrato(sCodBanco, sDtaExclui: String);
begin
  EditorBanrisulImpExtrato.SetFocus;

  If EdtExtNumBanco.Value=0 Then
  Begin
    msg('Favor Informar o N�mero do Banco !!','A');
    EdtExtNumBanco.SetFocus;
    Exit;
  End;

  If Trim(EdtBanrisulPastaArquivo.Text)='' Then
  Begin
    msg('Favor Informar a Pasta e Arquivo'+cr+'do Banrisul !!','A');
    Bt_BanrisulArquivo.SetFocus;
    Exit;
  End;

  If EditorBanrisulImpExtrato.Lines.Count<3 Then
  Begin
    msg('Arquivo Banrisul Inv�lido !!','A');
    Bt_BanrisulArquivo.SetFocus;
    Exit;
  End;

  sgDia:='';
  sgMes:='';
  sgAno:='';
  sgDesMovto:='';
  sgDocto:='';
  sgValor:='';
  sgDta:='';

  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ==============================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Cria ProgressBar ========================================================
    FrmBelShop.MontaProgressBar(True, FrmBancoExtratos);

    pgProgBar.Properties.Max:=EditorBanrisulImpExtrato.Lines.Count;

    sDtaApagar:='';
    bIniciou:=False;
    Lb_Obs.Caption:='Aguarde !! Efetuando a Importa��o de Extrato...';
    For i:=0 to EditorBanrisulImpExtrato.Lines.Count-1 do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=i;

      sLinha:=EditorBanrisulImpExtrato.Lines[i];

      // Verifica Agencia ======================================================
      If i=1 Then
      Begin
        ii:=Pos('AGENCIA: ', sLinha);
        s:=Trim(Copy(slinha,ii+9,4));

        If StrToInt(s)<>EdtExtNumBanco.AsInteger Then
        Begin
          msg('N� da Agencia N�o Corresponde'+cr+'ao Informado !!','A');
          FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);
          DMBelShop.SQLC.Rollback(TD);
          Break;
          Exit;
        End;
      End; // If i=1 Then

      // Verifica Numero da Conta ==============================================
      If i=2 Then
      Begin
        ii:=Pos('CONTA..: ', sLinha);
        s:=Trim(Copy(slinha,ii+9,Length(Trim(slinha))));

        If s<>Trim(EdtExtNumConta.Text) Then
        Begin
          msg('N� da Conta N�o Corresponde'+cr+'ao Informado !!','A');
          FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);
          DMBelShop.SQLC.Rollback(TD);
          Break;
          Exit;
        End;
      End; // If i=1 Then

      If AnsiContainsStr(sLinha, 'SALDO ANT EM ') Then
      Begin
        MySql:=' SELECT ex.Num_Seq'+
               ' FROM  FIN_BANCOS_EXTRATOS ex'+
               ' WHERE ex.cod_banco='+QuotedStr(EdtExtCodBanco.Text);
        DMBelShop.CDS_Busca.Close;
        DMBelShop.SDS_Busca.CommandText:=MySql;
        DMBelShop.CDS_Busca.Open;

        If DMBelShop.CDS_Busca.IsEmpty Then
        Begin
          ii:=Pos('SALDO ANT EM ', sLinha);
          sgDta:=Trim(Copy(slinha,ii+13,10));
          sgDta:=f_Troca('/','.',sgDta);
          sgDta:=f_Troca('-','.',sgDta);

          sgValor:=Trim(Copy(slinha,53,28));
          sgDesMovto:='SALDO NA DATA';
          sgDocto:='';

          // Exclui Extrato Anterior se Houver =================================
          If (sDtaApagar<>sgDta) And (Trim(sgDta)<>'')  Then
           ExcluirExtrato(EdtExtCodBanco.Text, sgDta);
          sDtaApagar:=sgDta;

          ExtratosSalvar;
        End;
        DMBelShop.CDS_Busca.Close;
      End;

      // Processa ==============================================================
      If bIniciou Then
      Begin
        If Trim(sLinha)='' Then
        Begin
          FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);
          Break;
          Exit;
        End;

        If Trim(Copy(slinha,1,2))<>'' Then
         sgDia:=Trim(Copy(slinha,1,2));

        If Not bGrava Then
         Begin
           sgDesMovto:=Trim(sgDesMovto+' '+Trim(Copy(slinha,5,40)));
           sgDocto:=Trim(Copy(slinha,iPosDocto,10));
           sgValor:=Trim(Copy(slinha,iPosDocto+11,80-(iPosDocto+10)));
         End
        Else
         Begin
           sgDesMovto:=Trim(Copy(slinha,5,40));
           sgDocto:=Trim(Copy(slinha,iPosDocto,10));
           sgValor:=Trim(Copy(slinha,iPosDocto+11,80-(iPosDocto+10)));
         End;

        If Trim(sgValor)<>'' Then
         Begin
           bGrava:=True;
           sgDta:=sgDia+'.'+sgMes+'.'+sgAno;

           // N�o Processa Data de Hoje
           s:=f_Troca('/','.',sgDtaServidor);
           s:=f_Troca('-','.',s);

           // Grava Extrato ====================================================
           If sgDta<>s Then
           Begin
             If (sDtaApagar<>sgDta) And (Trim(sgDta)<>'')  Then
             Begin
              // Salva Transa��o at� o Dia Anterior ============================
              DMBelShop.SQLC.Commit(TD);

              // Reabre Transa��o ==============================================
              TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMBelShop.SQLC.StartTransaction(TD);

              // Exclui Extrato Anterior se Houver =============================
              ExcluirExtrato(EdtExtCodBanco.Text, sgDta);
             End;
             sDtaApagar:=sgDta;

             ExtratosSalvar;
           End; // If sgDta<>s Then
         End
        Else // If Trim(sgValor)<>'' Then
         Begin
           bGrava:=False;
         End; /// If Trim(sgValor)<>'' Then
      End; // If bIniciou Then

      // Verifica Posicao do Documento =========================================
      If AnsiContainsStr(AnsiUpperCase(sLinha), 'DOCUMENTO') Then
       iPosDocto:=Pos('DOCUMENTO', sLinha);

      // Verifica Quando Inicia ================================================
      If AnsiContainsStr(AnsiUpperCase(sLinha), '++  MOVIMENTOS') Then
      Begin
        bIniciou:=True;
        bGrava:=False;

        // Mes
        ii:=Pos('++  MOVIMENTOS ', sLinha);
        sgMes:=Trim(Copy(slinha,ii+15,3));
        sgMes:=NumeroMes(sgMes);

        // Ano
        ii:=Pos('/', sLinha);
        sgAno:=Trim(Copy(slinha,ii+1,4));
      End;

    End; // For i:=0 to EditorBanrisul.Lines.Count-1 do
    FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);

    // Atualiza Transacao =========================================
    If DMBelShop.SQLC.InTransaction Then
    Begin
      DMBelShop.SQLC.Commit(TD);

      msg('Importa��o Efetuada Com SUCESSO !!','A');
      EditorBanrisulImpExtrato.Lines.Clear;
      EdtBanrisulPastaArquivo.Clear;
    End;

    DateSeparator:='/';
    DecimalSeparator:=',';
    Lb_Obs.Caption:='Observa��es...';

    Screen.Cursor:=crDefault;
  Except
    on e : Exception do
    Begin
      HabilitaBotoes(True);

      // Abandona Transacao =======================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Lb_Obs.Caption:='Observa��es...';
      Screen.Cursor:=crDefault;
      FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

//extratosSalvar
  Bt_BanrisulImpExtrato.Enabled:=False;
end;

procedure TFrmBancoExtratos.Bt_ConsExtBuscaMovtoClick(Sender: TObject);
Var
  MySql: String;
  i: Integer;
begin
  If DMConciliacao.CDS_Extrato.Active Then
   DMConciliacao.CDS_Extrato.Close;

  Lbx_ConsExtMovtos.SetFocus;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Bancos =============================================================
  MySql:=' SELECT tm.des_tpmovto, tm.Ind_Tipo "D/C", tm.cod_tpmovto'+
         ' FROM FIN_BANCOS_TP_MOVTOS tm'+
         ' WHERE tm.cod_banco='+QuotedStr(EdtExtCodBanco.Text)+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If DMBelShop.CDS_Pesquisa.Eof Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Banco Sem Tipo de Movto !!!', 'A');
    Bt_ConsExtBuscaMovto.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='des_tpmovto';
  FrmPesquisa.Campo_Codigo:='cod_tpmovto';
  FrmPesquisa.Campo_Descricao:='des_tpmovto';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    for i:=0 to Lbx_ConsExtMovtos.Count - 1 do
    Begin
      If Lbx_ConsExtMovtos.Items[i]=Trim(FrmPesquisa.EdtDescricao.Text)+' - '+Trim(FrmPesquisa.EdtCodigo.Text) Then
       Exit
    End;

    Lbx_ConsExtMovtos.Items.Add(Trim(FrmPesquisa.EdtDescricao.Text)+' - '+Trim(FrmPesquisa.EdtCodigo.Text));
    Lbx_ConsExtMovtos.SetFocus;

  End;

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmBancoExtratos.Bt_ConsExtExcluiMovtoClick(Sender: TObject);
begin
  If Lbx_ConsExtMovtos.Items.Count>0 Then
   Lbx_ConsExtMovtos.DeleteSelected;

  Lbx_ConsExtMovtos.SetFocus;

end;

procedure TFrmBancoExtratos.Bt_ConsExtExtratoClick(Sender: TObject);
Var
  s, ss, sDtaAnterior: String;
  MySqlCabecalho, MySql: String;
  ii, i: Integer;
begin

  Try
    StrToDate(DtEdt_PeriodoDtaInicio.Text);
  Except
    msg('Data Inicial do Per�odo Inv�lida !!','A');
    DtEdt_PeriodoDtaInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_PeriodoDtaFim.Text);
  Except
    msg('Data Final do Per�odo Inv�lida !!','A');
    DtEdt_PeriodoDtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_PeriodoDtaFim.Date<DtEdt_PeriodoDtaInicio.Date Then
  Begin
    msg('Per�odo Inv�lido !!','A');
    DtEdt_PeriodoDtaInicio.SetFocus;
    Exit;
  End;

  Screen.Cursor:=crAppStart;

  // Guarda Per�odo ============================================================
  sgDtaInicio:=f_Troca('/','.',DtEdt_PeriodoDtaInicio.Text);
  sgDtaInicio:=f_Troca('-','.',sgDtaInicio);
  sgDtaFim:=f_Troca('/','.',DtEdt_PeriodoDtaFim.Text);
  sgDtaFim:=f_Troca('-','.',sgDtaFim);

  // Inicializa Table Extrato Temporaia ========================================
  If DMConciliacao.CDS_Extrato.Active Then
   DMConciliacao.CDS_Extrato.Close;

  // Tipos de Movimento ========================================================
  sgTpMovtos:='';
  for i:=0 to Lbx_ConsExtMovtos.Count - 1 do
  Begin
    s:=Lbx_ConsExtMovtos.Items[i];
    ss:='';
    For ii:=length(s) downto 0 do
    Begin
      If (s[ii]='-') Or (Trim(s[ii])='') Then
       Break
      Else
       ss:=s[ii]+Trim(ss);
    End;

    If sgTpMovtos<>'' Then
     sgTpMovtos:=sgTpMovtos+', '+Trim(ss);

    If sgTpMovtos='' Then
     sgTpMovtos:=Trim(ss);
  End;

  If sgTpMovtos<>'' Then
   sgTpMovtos:='('+sgTpMovtos+')';

  // Busca Saldo Anterior ======================================================
  MySql:=' SELECT MAX(ex.dta_extrato) Dta_Ant'+
         ' FROM FIN_BANCOS_EXTRATOS ex'+
         ' WHERE ex.num_seq=999999'+
         ' AND ex.cod_banco='+QuotedStr(EdtExtCodBanco.Text)+
         ' AND ex.dta_extrato<'+QuotedStr(sgDtaInicio);
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;
  sDtaAnterior:=f_Troca('/','.',DMBelShop.CDS_Busca.FieldByName('Dta_Ant').AsString);
  sDtaAnterior:=f_Troca('-','.',sDtaAnterior);
  DMBelShop.CDS_Busca.Close;

  // Monta Sql de Extratos =====================================================
  MySqlCabecalho:=' SELECT 1 num_seq, '''' dta_extrato, '''' Data,'+
                  QuotedStr('Banco..: '+EdtExtNumBanco.Text+'-'+EdtExtDesBanco.Text)+' des_tpmovto,'+
                  ' '''' num_docto, 0 vlr_docto, '''' ind_tipo'+
                  ' FROM RDB$DATABASE'+

                  ' UNION'+

                  ' SELECT 2 num_seq, '''' dta_extrato, '''' Data,'+
                  QuotedStr('Ag�ncia: '+EdtExtNumAgencia.Text+'-'+EdtExtDesAgencia.Text)+' des_tpmovto,'+
                  ' '''' num_docto, 0 vlr_docto, '''' ind_tipo'+
                  ' FROM RDB$DATABASE'+

                  ' UNION'+

                  ' SELECT 3 num_seq, '''' dta_extrato, '''' Data,'+
                  QuotedStr('Conta..: '+EdtExtNumConta.Text)+' des_tpmovto,'+
                  ' '''' num_docto, 0 vlr_docto, '''' ind_tipo'+
                  ' FROM RDB$DATABASE'+

                  ' UNION'+

                  ' SELECT 4 num_seq, '''' dta_extrato, '''' Data,'+
                  ' '''' des_tpmovto, '''' num_docto, 0 vlr_docto, '''' ind_tipo'+
                  ' FROM RDB$DATABASE'+

                  ' UNION';

  MySql:=' SELECT ex.num_seq, ex.dta_extrato,';

         If Trim(sgTpMovtos)='' Then
          MySql:=MySql+' CASE'+
                       '   WHEN (ex.num_seq=1 OR ex.num_seq=999999)  THEN'+
                       '     CAST(LPAD(EXTRACT(DAY FROM ex.dta_extrato),2,''0'') AS VARCHAR(2))||''/''||'+
                       '     CAST(LPAD(EXTRACT(MONTH FROM ex.dta_extrato),2,''0'') AS VARCHAR(2))||''/''||'+
                       '     CAST(LPAD(EXTRACT(YEAR FROM ex.dta_extrato),4,''0'') AS VARCHAR(4))'+
                       '   ELSE '''''+
                       ' END data,'
         Else
          MySql:=MySql+' ex.dta_extrato data,';

         MySql:=MySql+' tm.des_tpmovto, ex.num_docto, ex.vlr_docto, tm.ind_tipo'+

                      ' FROM FIN_BANCOS_EXTRATOS ex, FIN_BANCOS_TP_MOVTOS tm'+

                      ' WHERE ex.cod_banco=tm.cod_banco'+
                      ' AND   ex.cod_tpmovto=tm.cod_tpmovto'+
                      ' And   ex.Cod_Banco='+QuotedStr(EdtExtCodBanco.Text);

         If Trim(sDtaAnterior)<>'' Then
          MySql:=MySql+' AND ((ex.dta_extrato BETWEEN '+QuotedStr(sgDtaInicio)+
                                                ' AND '+QuotedStr(sgDtaFim)+')'+
                       '   OR (ex.dta_extrato='+QuotedStr(sDtaAnterior)+
                               ' AND ex.num_seq=999999))'
         Else
          MySql:=MySql+' AND ex.dta_extrato BETWEEN '+QuotedStr(sgDtaInicio)+
                                                ' AND '+QuotedStr(sgDtaFim);

         If Trim(sgTpMovtos)<>'' Then
          MySql:=MySql+' AND ex.cod_tpmovto in '+sgTpMovtos;

         MySql:=MySql+' ORDER BY 2, 1';
  DMConciliacao.CDS_Extrato.Close;
  DMConciliacao.SDS_Extrato.CommandText:=MySqlCabecalho+MySql;
  DMConciliacao.CDS_Extrato.Open;

  If DMConciliacao.CDS_Extrato.RecordCount<5 Then
  Begin
    Screen.Cursor:=crDefault;
    msg('Sem Extrato a Listar...','A');
    DMConciliacao.CDS_Extrato.Close;
    Exit;
  End;
  DMConciliacao.CDS_Extrato.Last;
  DMConciliacao.CDS_Extrato.First;

  Screen.Cursor:=crDefault;

  Dbg_ConsExtrato.SetFocus;

end;

procedure TFrmBancoExtratos.Bt_FinanMLScrollSalvaClipboardClick(Sender: TObject);
begin
  If DMConciliacao.CDS_Extrato.IsEmpty Then
   Exit;

  Dbg_ConsExtrato.SetFocus;
  DBGridClipboard(Dbg_ConsExtrato);

end;

procedure TFrmBancoExtratos.Bt_FinanMLFSalvaCSVClick(Sender: TObject);
begin
  Dbg_ConsExtrato.SetFocus;

  mgMemo:=TMemo.Create(mgMemo);
  mgMemo.Visible:=False;
  mgMemo.Parent:=FrmBancoExtratos;
  mgMemo.Width:=500;

  If Not DMConciliacao.CDS_Extrato.IsEmpty Then
   SalvaResultado_CLI_DisplayName(DMConciliacao.CDS_Extrato, Dbg_ConsExtrato, mgMemo);

  FreeAndNil(mgMemo);
end;

procedure TFrmBancoExtratos.Dbg_ConsExtratoEnter(Sender: TObject);
begin
  Application.OnMessage := DesabilitaScrollMouse;

  Lb_Obs.Caption:='N�o Utilize o Scroll (Rodinha) do Mouse para se Movimentar no Grid !!';
end;

procedure TFrmBancoExtratos.Dbg_ConsExtratoExit(Sender: TObject);
begin
  Application.OnMessage := HabilitaScrollMouse;
  Lb_Obs.Caption:='Observa��es...';

end;

procedure TFrmBancoExtratos.Dbg_ConsExtratoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If not (gdSelected in State) Then
  Begin
    if DMConciliacao.CDS_ExtratoNUM_DOCTO.AsString='' then
    Begin
      Dbg_ConsExtrato.Canvas.Font.Style:=[fsBold];
      Dbg_ConsExtrato.Canvas.Brush.Color:=$00E9E9E9;
    End;

    If (Column.Field.FieldName='IND_TIPO') Then
    Begin
      If DMConciliacao.CDS_ExtratoIND_TIPO.AsString='D' Then
       Dbg_ConsExtrato.Canvas.Font.Color:=clRed;

      If DMConciliacao.CDS_ExtratoIND_TIPO.AsString='C' Then
       Dbg_ConsExtrato.Canvas.Font.Color:=clBlue;

    End; // If (Column.Field.FieldName='IND_TIPO') Then

    if DMConciliacao.CDS_ExtratoIND_TIPO.AsString='' then
    Begin
      Dbg_ConsExtrato.Canvas.Font.Style:=[fsBold];
      Dbg_ConsExtrato.Canvas.Brush.Color:=$00E4F2F3;
    End;

    Dbg_ConsExtrato.Canvas.FillRect(Rect);
    Dbg_ConsExtrato.DefaultDrawDataCell(Rect,Column.Field,state);

    DMConciliacao.CDS_ExtratoIND_TIPO.Alignment:=taCenter;
    DMConciliacao.CDS_ExtratoNUM_DOCTO.Alignment:=taRightJustify;
    DMConciliacao.CDS_ExtratoVLR_DOCTO.Alignment:=taRightJustify;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmBancoExtratos.Strg_SantanderImpExtratoDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  X, C, R :Integer;
begin
  // Ajusta Colunas para Direita
  C := ACol;
  R := ARow;
//  if (ACol > 1) and (ARow > 0) then
  If ACol > 1 Then
  Begin
    With Sender as TStringGrid do
    Begin
      X := Rect.Left +(Rect.Right -Rect.Left) -Canvas.TextWidth(Cells[C, R]) -3;
      Canvas.TextRect(Rect, X, Rect.Top+2, Cells[C, R]);
    End;
  End;
end;

procedure TFrmBancoExtratos.Bt_SantanderArquivoClick(Sender: TObject);
Var
  OpenDialog: TOpenDialog;
  ii, i: Integer;
  b: Boolean;

  // Acertar Saldo na Quebra da Planilha
  iLin: Integer; // Linha Anterior se Saldo <> ''
  sData: String; // Data da Linha Anterior
begin
  EdtSantanderPastaArquivo.Clear;
  Strg_SantanderImpExtrato.SetFocus;

  // Cria StringList de Arquivos
  slgArquivos:=TStringList.Create;

  // Limpa StringGrid Santander
  LimpaStringGrid(Strg_SantanderImpExtrato);

  Bt_SantanderImpExtrato.Enabled:=False;

  // ORIGINAL COLOCADO NO FIM DO FORM ==========================================
  OpenDialog := TOpenDialog.Create(Self);
  With OpenDialog do
  Begin
    Options := [ofAllowMultiSelect, ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
    DefaultExt := 'xls;xlsx';
    Filter := 'Arquivo Excel (*.xls;*.xlsx)|*.xls;*.xlsx';
    FilterIndex := 1;
    Title := 'Busca Arquivos Excel - SANTANDER';

    //==========================================================================
    // Seleciona Arquivo(s) (Excel) de Extratos ================================
    //==========================================================================
    If Execute then
     Begin
       //=======================================================================
       // Pega Arquivo(s) Selecionado(s)- Verificar se OK ======================
       //=======================================================================
       slgArquivos.Clear;
       For i:=0 to Files.Count-1 do
       Begin
         slgArquivos.Add(ExtractFileName(Files[i]));
       End; // For i:=0 to OpenDialog.Files.Count-1 do

       If slgArquivos.Count>1 Then
       Begin
         if Application.MessageBox(PChar('Os Arquivos Selecinados Est�o CORRETOS ??'+cr+cr+
                                         'ATEN��O PARA A ORDER ALFAB�TICA DOS MESMOS !!'+cr+cr+slgArquivos.Text), 'ATEN��O !!', 292)=IdNo Then
         Begin
           OdirPanApres.Visible:=False;
           LimpaStringGrid(Strg_SantanderImpExtrato);
           EdtSantanderPastaArquivo.Clear;
           Lb_Obs.Caption:='Observa��es...';
           FreeAndNil(OpenDialog);
           FreeAndNil(slgArquivos);
           Exit;
         End;
       End; // If slgArquivos.Count>1 Then
       // Pega Arquivo(s) Selecionado(s)- Verificar se OK ======================
       //=======================================================================

       //=======================================================================
       // Apropria Endere�o de Arquivo =========================================
       //=======================================================================
       If slgArquivos.Count=1 Then
        EdtSantanderPastaArquivo.Text:=FileName
       Else
        EdtSantanderPastaArquivo.Text:=IncludeTrailingPathDelimiter(ExtractFilePath(FileName));
       // Apropria Endere�o de Arquivo =========================================
       //=======================================================================

       //=======================================================================
       // Verifica Data da Cria��o do(s) Arquivo(s) ============================
       //=======================================================================
       For i:=0 to slgArquivos.Count-1 do
       Begin
         If FileDateToDateTime(FileAgeCreate(IncludeTrailingPathDelimiter(ExtractFilePath(FileName))+slgArquivos[i]))<StrToDate(sgDtaServidor) Then
         Begin
           OdirPanApres.Visible:=False;
           MessageBox(Handle, pChar('DATA da Cria��o do Arquivo '+cr+cr+slgArquivos[i]+cr+cr+' � Inferior ao dia de Hoje !!'+cr+cr+'FAVOR GERAR O ARQUIVO NOVAMENTE !!'), 'ATEN��O !!', MB_ICONERROR);
           FreeAndNil(OpenDialog);
           FreeAndNil(slgArquivos);
           Exit;
         End;
       End; // For i:=0 to slgArquivos.Count-1 do
       // Verifica Data da Cria��o do(s) Arquivo(s) ============================
       //=======================================================================

       OdirPanApres.Caption:='AGUARDE !! Inicializando Arquivos Excel de Extratos...';
       OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
       OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBancoExtratos.Width-OdirPanApres.Width)/2));
       OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBancoExtratos.Height-OdirPanApres.Height)/2))-20;
       OdirPanApres.Font.Style:=[fsBold];
       OdirPanApres.Parent:=FrmBancoExtratos;
       OdirPanApres.BringToFront();
       OdirPanApres.Visible:=True;
       Refresh;

       //=======================================================================
       // Apresenta Arquivos de Extrato Excel ==================================
       //=======================================================================
       // Pasta Onde se Encontra os do Arquivo a Processar
       // Estou Aproveitando Variavel Global sgAplicacoes
       sgAplicacoes:=IncludeTrailingPathDelimiter(ExtractFilePath(FileName));

       // Apresenta os Arquivos ================================================
       If Not ImportaExtratoSantander(Strg_SantanderImpExtrato, sgAplicacoes, slgArquivos) Then
       Begin
         OdirPanApres.Visible:=False;
         LimpaStringGrid(Strg_SantanderImpExtrato);
         EdtSantanderPastaArquivo.Clear;
         Lb_Obs.Caption:='Observa��es...';
         FreeAndNil(OpenDialog);
         FreeAndNil(slgArquivos);

         msg(sgMensagemERRO,'A');
         sgMensagemERRO:='';
         Exit;
       End; // If Not ImportaExtratoSantander(Strg_SantanderImpExtrato, sgAplicacoes, slgArquivos) Then

       OdirPanApres.Caption:='AGUARDE !! Inicializando Arquivos Excel de Extratos...';
       Refresh;

       Strg_SantanderImpExtrato.Refresh;

       // Verifica Leiaute do Arquivo ==========================================
       If Strg_SantanderImpExtrato.ColCount<>6 Then
       Begin

         OdirPanApres.Visible:=False;
         msg('Erro no Leiaute do Arquivo: '+EdtSantanderPastaArquivo.Text+cr+
             'N�mero de Colunas Previstas � 6 Atual Igual a '+IntToStr(Strg_SantanderImpExtrato.ColCount)+cr+cr+
             'Favor Entrar em Contato com o Odir !!','A');
         LimpaStringGrid(Strg_SantanderImpExtrato);
         EdtSantanderPastaArquivo.Clear;
         Lb_Obs.Caption:='Observa��es...';
         FreeAndNil(OpenDialog);
         FreeAndNil(slgArquivos);
         Exit;
       End; // If Strg_SantanderImpExtrato.ColCount<>6 Then

       // Retira Linhas em Branco =============================================
       b:=True;
       i:=0;
       While b do
       Begin
         bgSiga:=False;

         // Cells[coluna,linha]
         sData:='';
         For i:=1 to Strg_SantanderImpExtrato.RowCount-1 do
         Begin
           Application.ProcessMessages;

           If Trim(Strg_SantanderImpExtrato.Cells[0,i])='' Then
           Begin
             bgSiga:=True;
             TAuxGrid(Strg_SantanderImpExtrato).DeleteRow(i);
             Break;
           End;

           If bgComNrConta Then
            ii:=7
           Else
            ii:=6;

           If Strg_SantanderImpExtrato.ColCount=ii Then
           Begin
             // Transporta Coluna se N�o For Igual =============================
             If Strg_SantanderImpExtrato.Cells[5,i]<>'OK' Then
             Begin
               Strg_SantanderImpExtrato.Cells[1,i]:=Trim(Strg_SantanderImpExtrato.Cells[2,i]); // Historico
               Strg_SantanderImpExtrato.Cells[2,i]:=Trim(Strg_SantanderImpExtrato.Cells[3,i]); // Docto
               Strg_SantanderImpExtrato.Cells[3,i]:=Trim(Strg_SantanderImpExtrato.Cells[4,i]); // Valor
               Strg_SantanderImpExtrato.Cells[4,i]:=Trim(Strg_SantanderImpExtrato.Cells[5,i]); // Saldo
               Strg_SantanderImpExtrato.Cells[5,i]:='OK';
             End;

             If Trim(Strg_SantanderImpExtrato.Cells[2,i])='' Then
              Strg_SantanderImpExtrato.Cells[2,i]:='0'; // Docto

             If Trim(Strg_SantanderImpExtrato.Cells[3,i])='' Then
              Strg_SantanderImpExtrato.Cells[3,i]:='0'; // Valor
           End; // If Strg_SantanderImpExtrato.ColCount=ii Then

           // Verificar se Proxima linha � de Data Diferente, se Mesma
           // Tira o Saldo da Linha Atual
           If (Trim(Strg_SantanderImpExtrato.Cells[4,i])<>'') And (Trim(AnsiUpperCase(Strg_SantanderImpExtrato.Cells[1,i]))<>'SALDO ANTERIOR') Then
           Begin
             If Trim(Strg_SantanderImpExtrato.Cells[0,i])=Trim(Strg_SantanderImpExtrato.Cells[0,i+1]) Then
              Strg_SantanderImpExtrato.Cells[4,i]:=EmptyStr;
           End;
         End; // For i:=1 to Strg_SantanderImpExtrato.RowCount-1 do

         If Not bgSiga Then
          b:=False;
       End; // While b do

       //=======================================================================
       // Exclui Ultima Coluna =================================================
       //=======================================================================
         TAuxGrid(Strg_SantanderImpExtrato).DeleteColumn(5);
       // Exclui Ultima Coluna =================================================
       //=======================================================================

       Bt_SantanderImpExtrato.Enabled:=True;
     End
    Else // If Execute then
     Begin
       OdirPanApres.Visible:=False;
       FreeAndNil(OpenDialog);
       FreeAndNil(slgArquivos);
       Exit;
     End; // If Execute then
    // Seleciona Arquivo(s) (Excel) de Extratos ================================
    //==========================================================================

    OdirPanApres.Visible:=False;
    Free;
    FreeAndNil(slgArquivos);
  End; // With OpenDialog do
end;

procedure TFrmBancoExtratos.Bt_SantanderImpExtratoClick(Sender: TObject);
Var
  i: Integer;
  s, sDtaApagar: String;
  MySql: String;
  bOK: Boolean;
begin
  Strg_SantanderImpExtrato.SetFocus;

  If EdtExtNumBanco.Value=0 Then
  Begin
    msg('Favor Informar o N�mero do Banco !!','A');
    EdtExtNumBanco.SetFocus;
    Exit;
  End;

  If Trim(EdtSantanderPastaArquivo.Text)='' Then
  Begin
    msg('Favor Informar a Pasta e Arquivo'+cr+'do Santander !!','A');
    Bt_SantanderArquivo.SetFocus;
    Exit;
  End;

  If Strg_SantanderImpExtrato.RowCount<1 Then
  Begin
    msg('Arquivo Sandanter Inv�lido !!','A');
    Bt_SantanderArquivo.SetFocus;
    Exit;
  End;

  If Not bgComNrConta Then
  Begin
    If msg('Voc� Tem Certeza que o Este Arquivo'+cr+'Pertence Realmente a Conta'+cr+'a cima Citada ??','C')=2 Then
     Exit;
  End; // If bgComNrConta Then

  If msg('Deseja Realmente Importar o Arquivo ??','C')=2 Then
   Exit;

  sgDta:='';
  sgDesMovto:='';
  sgDocto:='';
  sgValor:='';
  sgSaldo:='';

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

    // Cria ProgressBar ========================================================
    FrmBelShop.MontaProgressBar(True, FrmBancoExtratos);

    pgProgBar.Properties.Max:=Strg_SantanderImpExtrato.RowCount-1;
    Lb_Obs.Caption:='Aguarde !! Efetuando a Importa��o de Extrato...';

    // Cells[coluna,linha]
    sDtaApagar:='';
    For i:=1 to Strg_SantanderImpExtrato.RowCount-1 do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=i;

      sgDta:=f_Troca('/','.',Strg_SantanderImpExtrato.Cells[0,i]);
      sgDta:=f_Troca('-','.',sgDta);
      sgDesMovto:=Trim(AnsiUpperCase(Strg_SantanderImpExtrato.Cells[1,i]));
      sgDocto:=Trim(AnsiUpperCase(Strg_SantanderImpExtrato.Cells[2,i]));
      sgValor:=Trim(AnsiUpperCase(Strg_SantanderImpExtrato.Cells[3,i]));
      sgSaldo:=Trim(AnsiUpperCase(Strg_SantanderImpExtrato.Cells[4,i]));

      If Trim(sgdta)<>'' Then
      Begin

        // Apaga Extrato do dia ================================================
        If sDtaApagar<>sgDta Then
        Begin
          // ===================================================================
          // OdirApagar - N�o Retira Concilia��es J� Feitas - 24/11/2017 =======
          // ===================================================================
//          // Exclui Concilia��es de Pagatos do Dia =============================
//          MySql:=' DELETE FROM FIN_CONCILIACAO_PAGTOS pg'+
//                 ' WHERE  COALESCE(pg.tip_conciliacao,'''')<>''DESP'''+
//                 ' AND    COALESCE(pg.tip_conciliacao,'''')<>''DINH'''+
//                 ' AND    EXISTS (SELECT 1'+
//                 '               FROM FIN_BANCOS_EXTRATOS ex'+
//                 '               WHERE ex.chv_extrato=pg.chv_extrato'+
//                 '               AND   ex.cod_banco='+QuotedStr(EdtExtCodBanco.Text)+
//                 '               AND   ex.dta_extrato='+QuotedStr(sgDta)+')';
//          DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//          MySql:=' UPDATE FIN_CONCILIACAO_MOVTOS m'+
//                 ' Set m.ind_conciliacao=''NAO'''+
//                 ' WHERE m.ind_conciliacao=''SIM'''+
//                 ' AND   NOT EXISTS (SELECT 1'+
//                 '                   FROM FIN_CONCILIACAO_PAGTOS p'+
//                 '                   WHERE p.num_seq=m.num_seq'+
//                 '                   AND   p.num_compl=m.num_compl)';
//          DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//          // Exclui Concilia��es de Dep�sitos do Dia ===========================
//          MySql:=' DELETE FROM FIN_CONCILIACAO_DEPOSITOS dp'+
//                 ' WHERE COALESCE(dp.tip_conciliacao,'''')<>''DESP'''+
//                 ' AND   COALESCE(dp.tip_conciliacao,'''')<>''DINH'''+
//                 ' AND   EXISTS (SELECT 1'+
//                 '               FROM FIN_BANCOS_EXTRATOS ex'+
//                 '               WHERE ex.chv_extrato=dp.chv_extrato'+
//                 '               AND   ex.cod_banco='+QuotedStr(EdtExtCodBanco.Text)+
//                 '               AND   ex.dta_extrato='+QuotedStr(sgDta)+')';
//          DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//          MySql:=' UPDATE FIN_CONCILIACAO_MOV_DEP m'+
//                 ' Set m.ind_conciliacao=''NAO'''+
//                 ' WHERE m.ind_conciliacao=''SIM'''+
//                 ' AND   NOT EXISTS (SELECT 1'+
//                 '                   FROM FIN_CONCILIACAO_DEPOSITOS D'+
//                 '                   WHERE d.num_seq=m.num_seq'+
//                 '                   AND   d.num_compl=m.num_compl)';
//          DMBelShop.SQLC.Execute(MySql,nil,nil);
          // OdirApagar - N�o Retira Concilia��es J� Feitas - 24/11/2017 =======
          // ===================================================================

          // Exclui Extrato do Dia =============================================
          MySql:=' DELETE FROM FIN_BANCOS_EXTRATOS ex'+
                 ' WHERE ex.cod_banco='+QuotedStr(EdtExtCodBanco.Text)+
                 ' AND   ex.dta_extrato='+QuotedStr(sgDta);
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End; // If sDtaApagar<>sgDta Then

        // Salva Saldo do Dia Anterior se N�o Houve Extrato Importado para Conta =
        If sgDesMovto='SALDO ANTERIOR' Then
        Begin
          MySql:=' SELECT ex.Num_Seq'+
                 ' FROM  FIN_BANCOS_EXTRATOS ex'+
                 ' WHERE ex.cod_banco='+QuotedStr(EdtExtCodBanco.Text);
          DMBelShop.CDS_Busca.Close;
          DMBelShop.SDS_Busca.CommandText:=MySql;
          DMBelShop.CDS_Busca.Open;

          If DMBelShop.CDS_Busca.IsEmpty Then
          Begin
            sgDta:=f_Troca('/','.',Strg_SantanderImpExtrato.Cells[0,i]);
            sgDta:=f_Troca('-','.',sgDta);
            sgDta:=DateToStr(StrToDate(sgDta)-1);

            sgValor:=sgSaldo;
            sgDesMovto:='SALDO NA DATA';
            sgDocto:='';

            ExtratosSalvar;

            sgDesMovto:='SALDO ANTERIOR';
          End; // If Not DMBelShop.CDS_Busca.IsEmpty Then
          DMBelShop.CDS_Busca.Close;
        End; // If sgDesMovto='SALDO ANTERIOR' Then

        If sgDesMovto<>'SALDO ANTERIOR' Then
        Begin
          If Trim(sgSaldo)='' Then
          Begin
            // N�o Processa Data de Hoje
            s:=f_Troca('/','.',sgDtaServidor);
            s:=f_Troca('-','.',s);

            // Grava Extrato ===================================================
             ExtratosSalvar;
          End; // If sgSaldo='0' Then

          // Grava Extrato ===================================================
          If Trim(sgSaldo)<>'' Then
          Begin
            // N�o Processa Data de Hoje
            s:=f_Troca('/','.',sgDtaServidor);
            s:=f_Troca('-','.',s);

            // Salva o Ultimo Movto do Dia====================================
            ExtratosSalvar;

            // Salva Saldo do Dia
            sgValor:=sgSaldo;
            sgDesMovto:='SALDO NA DATA';
            sgDocto:='';
            ExtratosSalvar;

          End; // if i=Strg_SantanderImpExtrato.RowCount-1 Then
        End; // If sgDesMovto<>'SALDO ANTERIOR' Then

        sDtaApagar:=sgDta;
      End; // If Trim(sgdta)<>'' Then
    End; // For i:=1 to Strg_SantanderImpExtrato.RowCount-1 do

    // Atualiza Transacao ======================================================
    If DMBelShop.SQLC.InTransaction Then
    Begin
      DMBelShop.SQLC.Commit(TD);
      msg('Importa��o Efetuada Com SUCESSO !!','A');

      LimpaStringGrid(Strg_SantanderImpExtrato);
      EdtSantanderPastaArquivo.Clear;
    End;

    FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);
    DateSeparator:='/';
    DecimalSeparator:=',';
    Lb_Obs.Caption:='Observa��es...';

    Screen.Cursor:=crDefault;
  Except
    on e : Exception do
    Begin
      HabilitaBotoes(True);

      // Abandona Transacao =======================================
      DMBelShop.SQLC.Rollback(TD);

      FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);
      LimpaStringGrid(Strg_SantanderImpExtrato);
      EdtSantanderPastaArquivo.Clear;

      DateSeparator:='/';
      DecimalSeparator:=',';
      Lb_Obs.Caption:='Observa��es...';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try
end;

procedure TFrmBancoExtratos.PC_ConciliacoesChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Conciliacoes);

end;

procedure TFrmBancoExtratos.Rb_ConcBancoClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_ConcBanco);
  AcertaRb_Style(Rb_ConcLoja);
  AcertaRb_Style(Rb_ConcTodos);

  sgCodLojas:='';
  Pan_ConcBanco.Visible:=False;
  Pan_ConcLoja.Visible:=False;
  Gb_ConcBancosLojas.Visible:=False;
  
  EdtConcNumAgencia.Clear;
  EdtConcDesAgencia.Clear;
  sgCodBanco:='';
  EdtConcNumConta.Clear;
  EdtConcNumBanco.Clear;
  EdtConcDesBanco.Clear;

  EdtConcCodLoja.Clear;
  EdtConcDesLoja.Clear;

  If Rb_ConcBanco.Checked Then
   Begin
     Pan_ConcBanco.Visible:=True;
     Gb_ConcBancosLojas.Caption:=' Lojas ';
     Gb_ConcBancosLojas.Visible:=True;
     EdtConcNumAgencia.SetFocus;
   End
  Else If Rb_ConcLoja.Checked Then
   Begin
     Pan_ConcLoja.Visible:=True;
     Gb_ConcBancosLojas.Caption:=' Bancos ';
     Gb_ConcBancosLojas.Visible:=True;
     Pan_ConcLoja.Top:=23;
     Pan_ConcLoja.Left:=115;
     EdtConcCodLoja.SetFocus;
   End
  Else If Rb_ConcTodos.Checked Then
   Begin
     Bt_ConcConciliar.Enabled:=True;
     DtEdt_ConcDtaInicio.SetFocus;
   End
end;

procedure TFrmBancoExtratos.Rb_ConcBancoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_ConcBancoClick(Self);
end;

procedure TFrmBancoExtratos.EdtConcNumAgenciaChange(Sender: TObject);
begin
  ConciliacaoLimpa(EdtConcNumAgencia);

end;

procedure TFrmBancoExtratos.EdtConcNumContaChange(Sender: TObject);
begin
  ConciliacaoLimpa(EdtConcNumConta);
end;

procedure TFrmBancoExtratos.EdtConcNumBancoChange(Sender: TObject);
begin
  ConciliacaoLimpa(EdtConcNumBanco);

end;

procedure TFrmBancoExtratos.EdtConcNumBancoExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtConcNumBanco.Value<>0 Then
  Begin

    If Trim(EdtConcNumAgencia.Text)='' Then
    Begin
      msg('Favor Informar o N� da Agencia !!','A');
      EdtConcNumAgencia.SetFocus;
      Exit;
    End;

    If Trim(EdtConcNumConta.Text)='' Then
    Begin
      msg('Favor Informar o N� da Conta !!','A');
      EdtConcNumConta.SetFocus;
      Exit;
    End;

    EdtConcDesBanco.Clear;
    sgCodBanco:='';

    Screen.Cursor:=crAppStart;

    // Busca Bancos =============================================================
    MySql:=' SELECT b.DES_BANCO, b.NUM_BANCO, b.NUM_CONTA, b.NUM_AGENCIA,'+
           ' b.DES_AGENCIA, b.COD_BANCO'+
           ' FROM FIN_BANCOS b'+
           ' Where  b.NUM_AGENCIA='+QuotedStr(EdtConcNumAgencia.Text)+
           ' and b.NUM_CONTA='+QuotedStr(EdtConcNumConta.Text)+
           ' and b.Num_BANCO='+QuotedStr(EdtConcNumBanco.Text);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('DES_BANCO').AsString)='' Then
    Begin
      msg('Banco/Agencia/Conta N�O Encontrados !!!', 'A');
      Screen.Cursor:=crDefault;
      DMBelShop.CDS_BuscaRapida.Close;

      EdtConcNumBanco.Clear;
      EdtConcNumBanco.SetFocus;
      Exit;
    End;

    EdtConcDesAgencia.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Agencia').AsString;
    EdtConcDesBanco.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Banco').AsString;
    EdtConcNumBanco.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Banco').AsString;
    sgCodBanco:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Banco').AsString;

    Bt_ConcConciliar.Enabled:=True;
    If Pan_ConcSolicitacoes.Parent=Ts_ConcConciliar Then
    Begin
      // Busca Lojas ============================================================
      MySql:=' SELECT l.cod_loja, e.razao_social'+
             ' FROM fin_bancos_lojas l, emp_conexoes e'+
             ' WHERE l.cod_loja=e.cod_filial'+
             ' AND l.cod_banco='+QuotedStr(sgCodBanco)+
             ' ORDER BY 1';
      DMConciliacao.CDS_LojasBancos.Close;
      DMConciliacao.SDS_LojasBancos.CommandText:=MySql;
      DMConciliacao.CDS_LojasBancos.Open;

      If DMConciliacao.CDS_LojasBancos.IsEmpty Then
      Begin
        Screen.Cursor:=crDefault;
        msg('Banco Sem Loja a Conciliar !!','A');
        DMConciliacao.CDS_LojasBancos.Close;
        ConciliacaoLimpa(EdtConcNumBanco, True);
        EdtConcNumAgencia.SetFocus;
        Exit;
      End;
      Dbg_ConcBancosLojas.Columns[0].Alignment:=taRightJustify;
      Dbg_ConcBancosLojas.Columns[0].Width:=70;
      Dbg_ConcBancosLojas.Columns[0].Title.Alignment:=taRightJustify;
      Dbg_ConcBancosLojas.Columns[0].Title.Caption:='C�digo';

      Dbg_ConcBancosLojas.Columns[1].Alignment:=taLeftJustify;
      Dbg_ConcBancosLojas.Columns[1].Width:=750;
      Dbg_ConcBancosLojas.Columns[1].Title.Alignment:=taLeftJustify;
      Dbg_ConcBancosLojas.Columns[1].Title.Caption:='Raz�o Social';
    End; // If Pan_ConcSolicitacoes.Parent=Ts_ConcConciliar Then

    DMBelShop.CDS_BuscaRapida.Close;

    If Pan_ConcSolicitacoes.Parent=Ts_ConciliacoesManutPagtos Then
    Begin
      // Busca Lojas ============================================================
      sgCodLojas:='';
      MySql:=' SELECT l.cod_loja'+
             ' FROM fin_bancos_lojas l'+
             ' WHERE l.cod_banco='+QuotedStr(sgCodBanco);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      If DMBelShop.CDS_BuscaRapida.IsEmpty Then
      Begin
        Screen.Cursor:=crDefault;
        msg('Banco Sem Loja a Conciliar !!','A');
        DMBelShop.CDS_BuscaRapida.Close;
        ConciliacaoLimpa(EdtConcNumBanco, True);
        EdtConcNumAgencia.SetFocus;
        Exit;
      End;

      While Not DMBelShop.CDS_BuscaRapida.Eof do
      Begin
        If sgCodLojas<>'' Then
         sgCodLojas:=sgCodLojas+', '+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString);

        If sgCodLojas='' Then
         sgCodLojas:=QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString);

        DMBelShop.CDS_BuscaRapida.Next;
      End;

      DMBelShop.CDS_BuscaRapida.Close;
    End; // If Pan_ConcSolicitacoes.Parent=Ts_ConciliacoesManutPagtos Then

    DtEdt_ConcDtaInicio.SetFocus;

    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmBancoExtratos.EdtConcBuscaBancoClick(Sender: TObject);
Var
  MySql: String;
begin

  If Trim(EdtConcNumAgencia.Text)='' Then
  Begin
    msg('Favor Informar o N� da Agencia !!','A');
    EdtConcNumAgencia.SetFocus;
    Exit;
  End;

  If Trim(EdtConcNumConta.Text)='' Then
  Begin
    msg('Favor Informar o N� da Conta !!','A');
    EdtConcNumConta.SetFocus;
    Exit;
  End;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  sgCodBanco:='';
  EdtConcNumBanco.Clear;
  EdtConcDesBanco.Clear;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Bancos =============================================================
  MySql:=' SELECT b.DES_BANCO, b.NUM_BANCO, b.NUM_CONTA, b.NUM_AGENCIA,'+
         ' b.DES_AGENCIA, b.COD_BANCO'+
         ' FROM FIN_BANCOS b'+
         ' Where b.NUM_AGENCIA='+QuotedStr(EdtConcNumAgencia.Text)+
         ' and   b.NUM_CONTA='+QuotedStr(EdtConcNumConta.Text)+
         ' Order by b.DES_BANCO';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If DMBelShop.CDS_Pesquisa.Eof Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Banco/Agencia/Conta N�O Encontrados !!!', 'A');
    EdtConcNumBanco.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='DES_BANCO';
  FrmPesquisa.Campo_Codigo:='NUM_BANCO';
  FrmPesquisa.Campo_Descricao:='DES_BANCO';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtConcNumBanco.Text:=FrmPesquisa.EdtCodigo.Text;

     EdtConcNumBancoExit(Self);
   End
  Else
   Begin
     sgCodBanco:='';
     EdtConcDesBanco.Clear;
     EdtConcNumBanco.SetFocus;
   End;

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmBancoExtratos.EdtConcCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtConcDesLoja.Clear;
  Bt_ConcConciliar.Enabled:=False;
  DMConciliacao.CDS_LojasBancos.Close;

  If EdtConcCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From EMP_CONEXOES'+
           ' Where COD_FILIAL='+QuotedStr(FormatFloat('00',EdtConcCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('COD_FILIAL').AsString)='' Then
    Begin
      msg('Loja N�O Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtConcCodLoja.Clear;
      EdtConcCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;

    EdtConcDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;

    If Length(EdtConcCodLoja.Text)<2 Then
     sgCodLoja:='0'+EdtConcCodLoja.Text
    Else
     sgCodLoja:=EdtConcCodLoja.Text;

    DMBelShop.CDS_BuscaRapida.Close;

    // Busca Bancos ============================================================
    Bt_ConcConciliar.Enabled:=True;
    If Pan_ConcSolicitacoes.Parent=Ts_ConcConciliar Then
    Begin
      MySql:=' SELECT b.num_banco, b.des_banco,'+
             ' b.num_agencia, b.des_agencia, b.num_conta, b.cod_banco'+
             ' FROM fin_bancos b, fin_bancos_lojas l'+
             ' WHERE b.cod_banco=l.cod_banco'+
             ' AND l.cod_loja='+QuotedStr(sgCodLoja)+
             ' ORDER BY 2';
      DMConciliacao.CDS_LojasBancos.Close;
      DMConciliacao.SDS_LojasBancos.CommandText:=MySql;
      DMConciliacao.CDS_LojasBancos.Open;

      If DMConciliacao.CDS_LojasBancos.IsEmpty Then
      Begin
        Screen.Cursor:=crDefault;
        msg('Loja Sem Banco a Conciliar !!','A');
        DMConciliacao.CDS_LojasBancos.Close;
        Bt_ConcConciliar.Enabled:=False;
        EdtConcDesLoja.Clear;
        EdtConcCodLoja.Clear;
        EdtConcCodLoja.SetFocus;
        Exit;
      End;
      Dbg_ConcBancosLojas.Columns[0].Alignment:=taRightJustify;
      Dbg_ConcBancosLojas.Columns[0].Title.Alignment:=taRightJustify;
      Dbg_ConcBancosLojas.Columns[0].Title.Caption:='N� Banco';
      Dbg_ConcBancosLojas.Columns[0].Width:=66;

      Dbg_ConcBancosLojas.Columns[1].Alignment:=taLeftJustify;
      Dbg_ConcBancosLojas.Columns[1].Title.Alignment:=taLeftJustify;
      Dbg_ConcBancosLojas.Columns[1].Title.Caption:='Descri��o do Banco';
      Dbg_ConcBancosLojas.Columns[1].Width:=260;

      Dbg_ConcBancosLojas.Columns[2].Alignment:=taRightJustify;
      Dbg_ConcBancosLojas.Columns[2].Title.Alignment:=taRightJustify;
      Dbg_ConcBancosLojas.Columns[2].Title.Caption:='N� Agencia';
      Dbg_ConcBancosLojas.Columns[2].Width:=75;

      Dbg_ConcBancosLojas.Columns[3].Alignment:=taLeftJustify;
      Dbg_ConcBancosLojas.Columns[3].Title.Alignment:=taLeftJustify;
      Dbg_ConcBancosLojas.Columns[3].Title.Caption:='Descri��o da Ag�ncia';
      Dbg_ConcBancosLojas.Columns[3].Width:=250;

      Dbg_ConcBancosLojas.Columns[4].Alignment:=taLeftJustify;
      Dbg_ConcBancosLojas.Columns[4].Title.Alignment:=taLeftJustify;
      Dbg_ConcBancosLojas.Columns[4].Title.Caption:='N� da Conta';
      Dbg_ConcBancosLojas.Columns[4].Width:=200;

      Dbg_ConcBancosLojas.Columns[5].Alignment:=taRightJustify;
      Dbg_ConcBancosLojas.Columns[5].Title.Alignment:=taRightJustify;
      Dbg_ConcBancosLojas.Columns[5].Title.Caption:='C�digo';
      Dbg_ConcBancosLojas.Columns[5].Visible:=False;
    End; // If Pan_ConcSolicitacoes.Parent=Ts_ConcConciliar Then

    If Pan_ConcSolicitacoes.Parent=Ts_ConciliacoesManutPagtos Then
    Begin
      // Busca Bancos
      sgCodLojas:=sgCodLoja;
      sgCodBanco:='';
      MySql:=' SELECT l.cod_banco'+
             ' FROM fin_bancos_lojas l'+
             ' WHERE l.cod_loja='+QuotedStr(sgCodLoja);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Banco').AsString)='' Then
      Begin
        Screen.Cursor:=crDefault;
        msg('Loja Sem Banco a Conciliar !!','A');
        DMBelShop.CDS_BuscaRapida.Close;
        Bt_ConcConciliar.Enabled:=False;
        EdtConcDesLoja.Clear;
        EdtConcCodLoja.Clear;
        EdtConcCodLoja.SetFocus;
        Exit;
      End;

      While Not DMBelShop.CDS_BuscaRapida.Eof do
      Begin
        If sgCodBanco<>'' Then
         sgCodBanco:=sgCodBanco+', '+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Banco').AsString);

        If sgCodBanco='' Then
         sgCodBanco:=QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Banco').AsString);

        DMBelShop.CDS_BuscaRapida.Next;
      End;

      DMBelShop.CDS_BuscaRapida.Close;
    End; // If Pan_ConcSolicitacoes.Parent=Ts_ConciliacoesManutPagtos Then

    DtEdt_ConcDtaInicio.SetFocus;

    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmBancoExtratos.Bt_ConcBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtConcCodLoja.Clear;
  EdtConcDesLoja.Clear;
  Bt_ConcConciliar.Enabled:=False;
  DMConciliacao.CDS_LojasBancos.Close;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
         ' From EMP_CONEXOES'+
         ' Order by RAZAO_SOCIAL';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If DMBelShop.CDS_Pesquisa.Eof Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Loja a Listar !!','A');
    EdtConcCodLoja.SetFocus;
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
     EdtConcCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtConcDesLoja.Text:=FrmPesquisa.EdtDescricao.Text;

     EdtConcCodLojaExit(Self);
                                                        
   End
  Else
   Begin
     EdtConcCodLoja.Clear;
     EdtConcDesLoja.Clear;
     EdtConcCodLoja.SetFocus;
   End;

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmBancoExtratos.Dbg_ConcBancosLojasEnter(Sender: TObject);
begin
  Application.OnMessage := DesabilitaScrollMouse;

end;

procedure TFrmBancoExtratos.Dbg_ConcBancosLojasExit(Sender: TObject);
begin
  Application.OnMessage := HabilitaScrollMouse;

end;

procedure TFrmBancoExtratos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  DMConciliacao.FechaTudoConciliacao;
end;

procedure TFrmBancoExtratos.Bt_ConcConciliarClick(Sender: TObject);
Var
  MySql: String;
  iNumDias: Integer;
  bPendencias: Boolean;
begin

  Gb_ConcConciliaPor.SetFocus;

  Try
    StrToDate(DtEdt_ConcDtaInicio.Text);
  Except
    msg('Data Inicial do Per�odo Inv�lida !!','A');
    DtEdt_ConcDtaInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_ConcDtaFim.Text);
  Except
    msg('Data Final do Per�odo Inv�lida !!','A');
    DtEdt_ConcDtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_ConcDtaFim.Date<DtEdt_ConcDtaInicio.Date Then
  Begin
    msg('Per�odo Inv�lido !!','A');
    DtEdt_ConcDtaInicio.SetFocus;
    Exit;
  End;

  If StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)))<=DtEdt_ConcDtaInicio.Date Then
  Begin
    msg('Data In�cio do Per�odo Inv�lida !!'+cr+cr+'Maior ou Igual a Hoje !!','A');
    DtEdt_ConcDtaInicio.SetFocus;
    Exit;
  End;

  If StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)))<=DtEdt_ConcDtaFim.Date Then
  Begin
    msg('Data Final do Per�odo Inv�lida !!'+cr+cr+'Maior ou Igual a Hoje !!','A');
    DtEdt_ConcDtaFim.SetFocus;
    Exit;
  End;

  If Pan_ConcSolicitacoes.Parent=Ts_ConcConciliar Then
  Begin
    If msg(DtEdt_ConcDtaInicio.Text+' a '+DtEdt_ConcDtaFim.Text+cr+cr+'O Per�odo Esta CORRETO ??','C')=2 Then
    Begin
      DtEdt_ConcDtaInicio.SetFocus;
      Exit;
    End;
  End; // If Pan_ConcSolicitacoes.Parent=Ts_ConcConciliar Then

  Screen.Cursor:=crAppStart;

  sgDtaInicio:=f_Troca('/', '.',DtEdt_ConcDtaInicio.Text);
  sgDtaInicio:=f_Troca('-', '.',sgDtaInicio);
  sgDtaFim:=f_Troca('/', '.',DtEdt_ConcDtaFim.Text);
  sgDtaFim:=f_Troca('-', '.',sgDtaFim);

  Lb_Obs.Caption:='Observa��es...';

  // Concilida =================================================================
  If Pan_ConcSolicitacoes.Parent=Ts_ConcConciliar Then
  Begin
    ConcConciliar;
  End; // If Pan_ConcSolicitacoes.Parent=Ts_ConcConciliar Then

  // Apresenta para Concilidar =================================================
  If Pan_ConcSolicitacoes.Parent=Ts_ConciliacoesManutPagtos Then
  Begin
    EdtConcManutExtratoQtd.Value:=0;
    EdtConcManutExtratoVlr.Value:=0;

    EdtConcManutPagtoQtd.Value:=0;
    EdtConcManutPagtoVlr.Value:=0;

    EdtConcManutExtPagDif.Value:=0;

    // Elimina Movots Marcados como Conciliados Mas SEM Concilia��o ============
    EliminarConciliacaoError;

    // Verifica Pendencias -----------------------------------------------------
    bPendencias:=True;
    If msg('Verificar Pendencias de Concilia��es ????','C')=2 Then
     bPendencias:=False;

    MySql:=' SELECT pt.num_dias_concilia'+
           ' FROM parametros pt';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    iNumDias:=0;
    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('num_dias_concilia').AsString)<>'' Then
     iNumDias:=DMBelShop.CDS_BuscaRapida.FieldByName('num_dias_concilia').AsInteger;
    DMBelShop.CDS_BuscaRapida.Close;

    If (iNumDias<>0) and (bPendencias) Then
    Begin
      sgDta:=f_Troca('/', '.',DateToStr(DtEdt_ConcDtaInicio.Date-iNumDias));
      sgDta:=f_Troca('-', '.',sgDta);

      // Movtos de Pagtos ======================================================
      MySql:=' SELECT ''Bel_''||m.cod_loja Loja ,m.dta_pagto, count(m.num_seq) TotReg'+
             ' FROM FIN_CONCILIACAO_MOVTOS m'+
             ' WHERE NOT EXISTS (SELECT 1'+
             '                   FROM FIN_CONCILIACAO_PAGTOS p'+
             '                   WHERE p.num_seq=m.num_seq'+
             '                   AND   p.num_compl=m.num_compl)'+
             '                   AND   m.dta_pagto >= '+QuotedStr(sgDta)+
             ' GROUP BY 1,2';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Loja').AsString)<>'' Then
      Begin
        mgMemo:=TMemo.Create(mgMemo);
        mgMemo.Visible:=False;
        mgMemo.Parent:=FrmBancoExtratos;
        mgMemo.Width:=500;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          mgMemo.Lines.Add('Loja: '+DMBelShop.CDS_BuscaRapida.FieldByName('Loja').AsString+#9+
                           'Data Pagto: '+DMBelShop.CDS_BuscaRapida.FieldByName('dta_pagto').AsString+#9+
                           'Lan�atos: '+DMBelShop.CDS_BuscaRapida.FieldByName('TotReg').AsString);

          DMBelShop.CDS_BuscaRapida.Next;

          If DMBelShop.CDS_BuscaRapida.RecNo=20 Then
          Begin
            If DMBelShop.CDS_BuscaRapida.RecNo<DMBelShop.CDS_BuscaRapida.RecordCount Then
            Begin
              mgMemo.Lines.Add('');
              mgMemo.Lines.Add('Existem um Total de '+IntToStr(DMBelShop.CDS_BuscaRapida.RecordCount)+' Pagtos N�O Conciliados');
            End;
            Break;
          End;

        End;// While Not DMBelShop.CDS_BuscaRapida.Eof do
        DMBelShop.CDS_BuscaRapida.Close;

        Screen.Cursor:=crDefault;
        If mgMemo.Lines.Count>1 Then
        Begin
          ShowMessage('Existem Movtos de Pagtos N�O Conciliados em Datas Anteriores:'+cr+cr+mgMemo.Lines.Text);

          FreeAndNil(mgMemo);
        End;

      End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('num_dias_concilia').AsString)<>'' Then
      DMBelShop.CDS_BuscaRapida.Close;

      Screen.Cursor:=crAppStart;

      // Extratos ==============================================================
      MySql:=' SELECT DISTINCT e.dta_extrato, b.num_banco, b.des_banco,'+
             '                 b.num_agencia, b.num_conta, Count(b.num_banco) totReg'+

             ' FROM fin_bancos_extratos e, fin_bancos b'+

             ' WHERE e.cod_banco=b.cod_banco'+
             ' AND e.num_seq<>999999'+
             ' AND NOT EXISTS (SELECT 1'+
             '                 FROM fin_conciliacao_pagtos p'+
             '                 WHERE p.chv_extrato=e.chv_extrato)'+
             ' AND   e.dta_extrato>='+QuotedStr(sgDta)+
             ' Group by 1,2,3,4,5'+
             ' Order by 1,3,4,5';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Extrato').AsString)<>'' Then
      Begin
        mgMemo:=TMemo.Create(mgMemo);
        mgMemo.Visible:=False;
        mgMemo.Parent:=FrmBancoExtratos;
        mgMemo.Width:=500;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin

          If DMBelShop.CDS_BuscaRapida.RecNo>20 Then
          Begin
            mgMemo.Lines.Add('');
            mgMemo.Lines.Add('Existem um Total de '+IntToStr(DMBelShop.CDS_BuscaRapida.RecordCount)+' Extratos N�O Conciliados');
            Break;
          End;

          mgMemo.Lines.Add('Dia: '+DMBelShop.CDS_BuscaRapida.FieldByName('dta_extrato').AsString+#9+
                           'Nr Banco: '+DMBelShop.CDS_BuscaRapida.FieldByName('num_banco').AsString+#9+
                           'Nome Banco: '+DMBelShop.CDS_BuscaRapida.FieldByName('des_banco').AsString+#9+
                           'Nr Ag�ncia: '+DMBelShop.CDS_BuscaRapida.FieldByName('num_agencia').AsString+#9+
                           'Nr Conta: '+DMBelShop.CDS_BuscaRapida.FieldByName('num_conta').AsString+#9+
                           'Lan�tos: '+DMBelShop.CDS_BuscaRapida.FieldByName('TotReg').AsString);
          DMBelShop.CDS_BuscaRapida.Next;
        End;// While Not DMBelShop.CDS_BuscaRapida.Eof do
        DMBelShop.CDS_BuscaRapida.Close;

        Screen.Cursor:=crDefault;
        If mgMemo.Lines.Count>1 Then
        Begin
          ShowMessage('Existem Extratos N�O Conciliados em Datas Anteriores:'+cr+cr+mgMemo.Lines.Text);

          FreeAndNil(mgMemo);
        End;
        FreeAndNil(mgMemo);
      End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('num_dias_concilia').AsString)<>'' Then
      DMBelShop.CDS_BuscaRapida.Close;
    End; // If (iNumDias<>0) and (bPendencias) Then

    igTotMarcaExt:=0;
    igTotMarcaPag:=0;

    // Busca Extratos e Movimentos de Pagamentos ===============================
    BuscaMovtosExtratosPagtos;
  End; // If Pan_ConcSolicitacoes.Parent=Ts_ConciliacoesManutPagtos Then

  Screen.Cursor:=crDefault;
end;

procedure TFrmBancoExtratos.PC_ConcConciliarChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_ConcConciliar);

  If (PC_ConcConciliar.ActivePage=Ts_ConcConciliando) And (Ts_ConcConciliando.CanFocus) Then
   Dbg_ConcExtratoBancos.SetFocus;

end;

procedure TFrmBancoExtratos.Dbg_ConcExtratoBancosDrawColumnCell(Sender: TObject;
     const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If not (gdSelected in State) Then
  Begin
    If (Column.Field.FieldName='Conciliado') Then
    Begin
      If DMConciliacao.CDS_ConcExtratosConciliado.AsString='NAO' Then
       Dbg_ConcExtratoBancos.Canvas.Font.Color:=clRed;

      If DMConciliacao.CDS_ConcExtratosConciliado.AsString='SIM' Then
       Dbg_ConcExtratoBancos.Canvas.Font.Color:=clBlue;

       Dbg_ConcExtratoBancos.Canvas.Font.Style:=[fsBold];
    End; // If (Column.Field.FieldName='IND_TIPO') Then


    Dbg_ConcExtratoBancos.Canvas.FillRect(Rect);
    Dbg_ConcExtratoBancos.DefaultDrawDataCell(Rect,Column.Field,state);

    DMConciliacao.CDS_ConcExtratosConciliado.Alignment:=taCenter;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmBancoExtratos.PC_ConciliacoesExit(Sender: TObject);
begin
  DMConciliacao.FechaTudoConciliacao;
  ConciliacaoLimpa(EdtBanrisulPastaArquivo, True);
end;

procedure TFrmBancoExtratos.MenuParametrosClick(Sender: TObject);
Var
  b: Boolean;
  MySql, sDiasConc: String;
begin

  If bgInd_Admin Then
  Begin
    MySql:=' SELECT num_dias_concilia'+
           ' FROM PARAMETROS';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sDiasConc:=DMBelShop.CDS_BuscaRapida.FieldByName('num_dias_concilia').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    b:=True;
    While b do
    Begin
      If InputQuery('N� Dias de N�O Concilia��o','',sDiasConc) then
       Begin
         Try
           StrToCurr(sDiasConc);

           // Verificva se Transa��o esta Ativa
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

             MySql:=' UPDATE PARAMETROS'+
                    ' Set num_dias_concilia='+QuotedStr(sDiasConc);
             DMBelShop.SQLC.Execute(MySql,nil,nil);

             // Atualiza Transacao =======================================
             DMBelShop.SQLC.Commit(TD);

             DateSeparator:='/';
             DecimalSeparator:=',';
             Screen.Cursor:=crDefault;
             Break;
           Except
             on e : Exception do
             Begin
               HabilitaBotoes(True);

               // Abandona Transacao =====================================
               DMBelShop.SQLC.Rollback(TD);

               DateSeparator:='/';
               DecimalSeparator:=',';
               Screen.Cursor:=crDefault;

               MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
               exit;
             End; // on e : Exception do
           End; // Try
         Except
           msg('N�mero de Dias Inv�lido !!','A');
           Break;
         End;
       End
      Else // If InputQuery('Informe o Desconto','',sVlrDesc) then
       Begin
         Break;
       End; // If InputQuery('Informe o Desconto','',sVlrDesc) then
    End; // While b do

  End;
end;

procedure TFrmBancoExtratos.Dbg_ConcManutExtratoDblClick(Sender: TObject);
Var
  bExcPagto, bConcRetira: Boolean;
  iRecNo, i: Integer;
  MySql: String;
  sNumSeq, sNumCompl, sChvExtrato: String;
begin

  If (DMConciliacao.CDS_CMExtratos.IsEmpty) or (Not DMConciliacao.CDS_CMExtratos.Active) Then
   Exit;

  // N�o Altera Sem Permiss�o ao Usu�rios ======================================
  If Not Bt_CMConciliar.Visible Then
   Exit;

  iRecNo:=0;
  bConcRetira:=False;
  bExcPagto:=False;

  sNumCompl  :=DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;
  sNumSeq    :=DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString;
  sChvExtrato:=DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString;

  // Verifica se j� esta Conciliado ============================================
  // Conciliado Pelo Sistema
  If DMConciliacao.CDS_CMExtratosQUEM.AsString='SIS' Then
  Begin
    If msg('Conciliado Pelo Sistema !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
     Begin
       Exit;
     End
    Else
     Begin
      // Se Conciliado Pelo Sistema por Hist�rico Autom�tico
       bExcPagto:=False;
       MySql:=' SELECT p.Num_Seq, p.Num_Compl'+
              ' From FIN_CONCILIACAO_PAGTOS p'+
              ' WHERE p.chv_extrato='+QuotedStr(DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString);
       DMBelShop.CDS_BuscaRapida.Close;
       DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
       DMBelShop.CDS_BuscaRapida.Open;
       sNumSeq    :=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString;
       sNumCompl  :=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
       DMBelShop.CDS_BuscaRapida.Close;

       If DMConciliacao.CDS_CMPagtos.Locate('Num_Seq;Num_Compl',VarArrayOf([sNumSeq, sNumCompl]),[]) Then
       Begin
         If Copy(DMConciliacao.CDS_CMPagtosCOD_FORNECEDOR.AsString,1,1)='*' Then
         Begin
           If msg('Concilia��o Hist�rico Autom�tico !!'+cr+'O Movto Pagamento Ser� Exclu�do !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
           Begin
             Exit;
           End;
           iRecNo:=DMConciliacao.CDS_CMPagtos.RecNo;
           bExcPagto:=True;
         End; // If Copy(DMConciliacao.CDS_CMPagtosCOD_FORNECEDOR.AsString)='*' Then
       End; // If DMConciliacao.CDS_CMPagtos.Locate('Num_Seq;Num_Compl',VarArrayOf([sNumSeq, sNumCompl]),[]) Then
       bConcRetira:=True;
     End;
  End; // If DMConciliacao.CDS_CMExtratosQUEM.AsString='SIS' Then

  If DMConciliacao.CDS_CMExtratosQUEM.AsString='USU' Then
  Begin
    if msg('Conciliado Pelo Usu�rio !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
     Begin
       Exit;
     End
    Else
     Begin
       bConcRetira:=True;

       If DMConciliacao.CDS_CMExtratosTIP_CONCILIACAO.AsString='SExt' Then
        bExcPagto:=True;
     End;
  End; // If DMConciliacao.CDS_CMExtratosQUEM.AsString='SIS' Then

  // Verifica se Pode Conciliar ================================================
  i:=1;
  If DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM' Then
   i:=-1;

  If Not PodeConciliar(i,0) Then
  Begin
    igTotMarcaExt:=igTotMarcaExt-1;

    ShowMessage('Imposs�vel Conciliar !!'+cr+cr+'A Concilia��o deve ser:'+cr+cr+
                '1(UM) Marcado para 1(UM) ou DIVERSOS Marcados !!');
    Exit;
  End;

  // Retira Concilia��o ========================================================
  If bConcRetira Then
  Begin
    // Verificva se Transa��o esta Ativa
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

      MySql:=' SELECT p.Chv_Extrato, p.Num_Seq, p.Num_Compl'+
             ' From FIN_CONCILIACAO_PAGTOS p'+
             ' WHERE p.chv_extrato='+QuotedStr(DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString);
      DMBelShop.CDS_Busca.Close;
      DMBelShop.SDS_Busca.CommandText:=MySql;
      DMBelShop.CDS_Busca.Open;

      While Not DMBelShop.CDS_Busca.Eof do
      Begin
        If Trim(DMConciliacao.CDS_CMExtratosTIP_CONCILIACAO.AsString)='' Then
         Begin
           MySql:=' SELECT p.Chv_Extrato, p.Num_Seq, p.Num_Compl'+
                  ' From FIN_CONCILIACAO_PAGTOS p'+
                  ' WHERE p.num_seq='+DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString+
                  ' AND   p.num_compl='+DMBelShop.CDS_Busca.FieldByName('Num_Compl').AsString;
           DMBelShop.CDS_BuscaRapida.Close;
           DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
           DMBelShop.CDS_BuscaRapida.Open;
         End
        Else
         Begin
           MySql:=' SELECT p.Chv_Extrato, p.Num_Seq, p.Num_Compl'+
                  ' From FIN_CONCILIACAO_PAGTOS p'+
                  ' WHERE p.chv_extrato='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Chv_Extrato').AsString);
           DMBelShop.CDS_BuscaRapida.Close;
           DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
           DMBelShop.CDS_BuscaRapida.Open;
         End; // If Trim(DMConciliacao.CDS_CMExtratosTIP_CONCILIACAO.AsString)='' Then

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          If Not bExcPagto Then
           Begin
             // Atualiza Movto Pagto
             MySql:=' UPDATE FIN_CONCILIACAO_MOVTOS m'+
                    ' SET m.ind_conciliacao='+QuotedStr('NAO')+
                    ' WHERE m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString+
                    ' AND m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString;
             DMBelShop.SQLC.Execute(MySql,nil,nil);
           End
          Else
           Begin
             // Exclui Movto Pagto Hist�rico Autom�tico
             MySql:=' DELETE FROM FIN_CONCILIACAO_MOVTOS m'+
                    ' WHERE m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString+
                    ' AND   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString;
             DMBelShop.SQLC.Execute(MySql,nil,nil);
           End; // If Not bExcPagto Then

          MySql:=' DELETE FROM FIN_CONCILIACAO_PAGTOS p'+
                 ' WHERE p.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString+
                 ' AND   p.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString+
                 ' AND   p.Chv_Extrato='+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Chv_Extrato').AsString);
          DMBelShop.SQLC.Execute(MySql,nil,nil);

          sNumCompl  :=DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString;
          sNumSeq    :=DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString;
          sChvExtrato:=DMBelShop.CDS_BuscaRapida.FieldByName('Chv_Extrato').AsString;

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
        DMBelShop.CDS_BuscaRapida.Close;

        DMBelShop.CDS_Busca.Next;
      End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
      DMBelShop.CDS_Busca.Close;

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      DMConciliacao.CDS_CMPagtos.Close;
      DMConciliacao.CDS_CMPagtos.Open;

      DMConciliacao.CDS_CMExtratos.Close;
      DMConciliacao.CDS_CMExtratos.Open;

      If iRecNo=0 Then
       DMConciliacao.CDS_CMPagtos.Locate('NUM_SEQ;NUM_COMPL',VarArrayOf([sNumSeq,sNumCompl]),[])
      Else
       DMConciliacao.CDS_CMPagtos.RecNo:=iRecNo;

      DMConciliacao.CDS_CMExtratos.Locate('CHV_EXTRATO', sChvExtrato,[]);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
      Exit;
    Except
      on e : Exception do
      Begin
        HabilitaBotoes(True);

        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        exit;
      End; // on e : Exception do
    End; // Try
  End; // If bConcRetira Then

  // Libera Para Grava��o ======================================================
  LiberaClientGravar(True);

  // Marca/DesMarca Concilia��o ================================================
  DMConciliacao.CDS_CMExtratos.Edit;
  If DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM' Then
   Begin
    DMConciliacao.CDS_CMExtratosConciliar.AsString:='NAO';
    If bConcRetira Then
    Begin
      DMConciliacao.CDS_CMExtratosCOD_USUARIO.AsString:=EmptyStr;
      DMConciliacao.CDS_CMExtratosConciliado.AsString:='NAO';
      DMConciliacao.CDS_CMExtratosQUEM.AsString:=EmptyStr;
      DMConciliacao.CDS_CMExtratosTIP_CONCILIACAO.AsString:=EmptyStr;
      DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString:=EmptyStr;
    End;
   End
  Else // If DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM' Then
   Begin
     DMConciliacao.CDS_CMExtratosConciliar.AsString:='SIM';
   End; // If DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM' Then
  DMConciliacao.CDS_CMExtratos.Post;

  // Retira a Libera�ao Para Grava��o ==========================================
  LiberaClientGravar(False);

  TotaisMarcadosNaoConciliados;

end;

procedure TFrmBancoExtratos.Dbg_ConcManutPagtoDblClick(Sender: TObject);
Var
  bExcPagto, bConcRetira: Boolean;
  iRecNo, i: Integer;
  MySql: String;
  sNumSeq, sNumCompl, sChvExtrato: String;
begin

  If (DMConciliacao.CDS_CMPagtos.IsEmpty) or (Not DMConciliacao.CDS_CMPagtos.Active) Then
   Exit;

  // N�o Altera Sem Permiss�o ao Usu�rios ======================================
  If Not Bt_CMConciliar.Visible Then
   Exit;

  iRecNo:=0;
  bConcRetira:=False;
  bExcPagto:=False;

  sNumCompl  :=DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;
  sNumSeq    :=DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString;
  sChvExtrato:=DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString;

  // Verifica se j� esta Conciliado ============================================
  If DMConciliacao.CDS_CMPagtosQUEM.AsString='SIS' Then
  Begin
     If msg('Conciliado Pelo Sistema !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
     Begin
       Exit;
     End
    Else
     Begin
       If Copy(DMConciliacao.CDS_CMPagtosCOD_FORNECEDOR.AsString,1,1)='*' Then
       Begin
         If msg('Concilia��o Hist�rico Autom�tico !!'+cr+'O Movto Pagamento Ser� Exclu�do !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
         Begin
           Exit;
         End;
         iRecNo:=DMConciliacao.CDS_CMPagtos.RecNo;
         bExcPagto:=True;
       End; // If Copy(DMConciliacao.CDS_CMPagtosCOD_FORNECEDOR.AsString)='*' Then
       bConcRetira:=True;
     End;
  End; // If DMConciliacao.CDS_CMPagtosQUEM.AsString='SIS' Then

  // Verifica se j� esta Conciliado Somente por Extrato ========================
  If (DMConciliacao.CDS_CMPagtosQUEM.AsString='USU') And (DMConciliacao.CDS_CMPagtosTIP_CONCILIACAO.AsString='SExt') Then
  Begin
    If msg('Concilia��o Somente por Extrato !!'+cr+'O Movto Pagamento Ser� Exclu�do !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
    Begin
      Exit;
    End;
    iRecNo:=DMConciliacao.CDS_CMPagtos.RecNo;
    bExcPagto:=True;

    bConcRetira:=True;
  End; // If DMConciliacao.CDS_CMPagtosQUEM.AsString='SEx' Then

  If (DMConciliacao.CDS_CMPagtosQUEM.AsString='USU') And (DMConciliacao.CDS_CMPagtosTIP_CONCILIACAO.AsString<>'SExt') Then
  Begin
     If msg('Conciliado Pelo Usu�rio !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
     Begin
       Exit;
     End
    Else
     Begin
       bConcRetira:=True;
     End;
  End; // If DMConciliacao.CDS_CMPagtosQUEM.AsString='USU' Then

  // Verifica se Pode Conciliar ================================================
  i:=1;
  If DMConciliacao.CDS_CMPagtosConciliar.AsString='SIM' Then
   i:=-1;

  If Not PodeConciliar(0,i) Then
  Begin
    igTotMarcaPag:=igTotMarcaPag-1;

    ShowMessage('Imposs�vel Conciliar !!'+cr+cr+'A Concilia��o deve ser:'+cr+cr+
                '1(UM) Marcado para 1(UM) ou DIVERSOS Marcados !!');
    Exit;
  End;

  // Retira Concilia��o ========================================================
  If bConcRetira Then
  Begin
    // Verificva se Transa��o esta Ativa
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

      MySql:=' SELECT p.Chv_Extrato'+
             ' From FIN_CONCILIACAO_PAGTOS p'+
             ' WHERE p.num_seq='+DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString+
             ' AND   p.num_compl='+DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;
      DMBelShop.CDS_Busca.Close;
      DMBelShop.SDS_Busca.CommandText:=MySql;
      DMBelShop.CDS_Busca.Open;

      While Not DMBelShop.CDS_Busca.Eof do
      Begin
        MySql:=' SELECT p.Chv_Extrato, p.Num_Seq, p.Num_Compl'+
               ' From FIN_CONCILIACAO_PAGTOS p'+
               ' WHERE p.Chv_Extrato='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Chv_Extrato').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          If Not bExcPagto Then
           Begin
             // Atualiza Movto Pagto
             MySql:=' UPDATE FIN_CONCILIACAO_MOVTOS m'+
                    ' SET m.ind_conciliacao='+QuotedStr('NAO')+
                    ' WHERE m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                    ' AND   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
             DMBelShop.SQLC.Execute(MySql,nil,nil);
           End
          Else
           Begin
             // Exclui Movto Pagto Hist�rico Autom�tico
             MySql:=' DELETE FROM FIN_CONCILIACAO_MOVTOS m'+
                    ' WHERE m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString+
                    ' AND   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString;
             DMBelShop.SQLC.Execute(MySql,nil,nil);
           End; // If Not bExcPagto Then

          MySql:=' DELETE FROM FIN_CONCILIACAO_PAGTOS p'+
                 ' WHERE p.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString+
                 ' AND   p.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString+
                 ' AND   p.Chv_Extrato='+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Chv_Extrato').AsString);
          DMBelShop.SQLC.Execute(MySql,nil,nil);

          sNumCompl  :=DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString;
          sNumSeq    :=DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString;
          sChvExtrato:=DMBelShop.CDS_BuscaRapida.FieldByName('Chv_Extrato').AsString;

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
        DMBelShop.CDS_BuscaRapida.Close;

        DMBelShop.CDS_Busca.Next;
      End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
      DMBelShop.CDS_Busca.Close;

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      DMConciliacao.CDS_CMPagtos.Close;
      DMConciliacao.CDS_CMPagtos.Open;

      DMConciliacao.CDS_CMExtratos.Close;
      DMConciliacao.CDS_CMExtratos.Open;

      If (iRecNo=0) Or (DMConciliacao.CDS_CMPagtos.RecordCount<iRecNo) Then
       DMConciliacao.CDS_CMPagtos.Locate('NUM_SEQ;NUM_COMPL',VarArrayOf([sNumSeq,sNumCompl]),[])
      Else
       DMConciliacao.CDS_CMPagtos.RecNo:=iRecNo;

      DMConciliacao.CDS_CMExtratos.Locate('CHV_EXTRATO', sChvExtrato,[]);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
      Exit;
    Except
      on e : Exception do
      Begin
        HabilitaBotoes(True);

        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        exit;
      End; // on e : Exception do
    End; // Try
  End; // If bConcRetira Then

  // Libera Para Grava��o ======================================================
  LiberaClientGravar(True);

  // Marca/DesMarca Concilia��o ================================================
  DMConciliacao.CDS_CMPagtos.Edit;
  If DMConciliacao.CDS_CMPagtosConciliar.AsString='SIM' Then
   Begin
    DMConciliacao.CDS_CMPagtosConciliar.AsString:='NAO';
    If bConcRetira Then
    Begin
      DMConciliacao.CDS_CMPagtosConciliado.AsString:='NAO';
      DMConciliacao.CDS_CMPagtosQUEM.AsString:='';
      DMConciliacao.CDS_CMPagtosCOD_USUARIO.AsString:='';
      DMConciliacao.CDS_CMPagtosTIP_CONCILIACAO.AsString:='';
    End;
   End
  Else // If DMConciliacao.CDS_CMPagtosConciliar.AsString='SIM' Then
   Begin
     DMConciliacao.CDS_CMPagtosConciliar.AsString:='SIM';
   End; // If DMConciliacao.CDS_CMPagtosConciliar.AsString='SIM' Then
  DMConciliacao.CDS_CMPagtos.Post;

  // Retira a Libera�ao Para Grava��o ==========================================
  LiberaClientGravar(False);

  TotaisMarcadosNaoConciliados;
end;

procedure TFrmBancoExtratos.Bt_CMConciliarClick(Sender: TObject);
Var
  sCodTpConc, sDesTpConc: String;
  sChvExtrato, sNumSeq, sNumCompl: String;
  bConcDinheiro, bConcExtrato: Boolean;
  b: Boolean;
begin

  bgLocate:=True;

  bConcDinheiro:=False;
  bConcExtrato:=False;

  sChvExtrato:=DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString;
  sNumSeq    :=DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString;
  sNumCompl  :=DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;

  If ((DMConciliacao.CDS_CMExtratos.IsEmpty) or (Not DMConciliacao.CDS_CMExtratos.Active)) And
     ((DMConciliacao.CDS_CMPagtos.IsEmpty)   or (Not DMConciliacao.CDS_CMPagtos.Active))  Then
  Begin
    If Ts_ConciliacoesManutPagtos.TabVisible Then
     DtEdt_ConcDtaInicio.SetFocus;
    Exit;
  End;

  If (igTotMarcaExt=0) And (igTotMarcaPag=0) Then
  Begin
    msg('Sem Registro Selecionado !!','A');
    Dbg_ConcManutExtrato.SetFocus;
    Exit;
  End;

  // Concilia��o Como Dinheiro =================================================
  If (igTotMarcaPag<>0) And (igTotMarcaExt=0) Then
  Begin
    If msg('Conciliar como DINHEIRO ??','C')=1 Then
     Begin
       bConcDinheiro:=True;
     End
    Else
     Begin
       Exit;
     End; // If msg('Conciliar como DINHEIRO ??','C')=1 Then
  End; // If (igTotMarcaPag<>0) Or (igTotMarcaExt=0) Then

  // Concilia��o Somente Extrato ===============================================
  If (igTotMarcaPag=0) And (igTotMarcaExt<>0) Then
  Begin
    If msg('Conciliar Somente o Extrato  ??','C')=1 Then
     Begin
       b:=True;
       While b do
       Begin
         sgCodLojaExt:=InputBoxInteiro('Loja Respons�vel pelo(s) Extrato(s)', 'Informe o C�digo da Loja',sgCodLojaExt);
         If Trim(sgCodLojaExt)='' Then
          Exit;

         Try
           StrToCurr(sgCodLojaExt);
           MySqlSelect:=' SELECT e.cod_filial'+
                        ' FROM EMP_CONEXOES e'+
                        ' WHERE e.cod_filial='+QuotedStr(FormatFloat('00',StrToInt(sgCodLojaExt)));
           DMBelShop.CDS_BuscaRapida.Close;
           DMBelShop.SDS_BuscaRapida.CommandText:=MySqlSelect;
           DMBelShop.CDS_BuscaRapida.Open;
           sgCodLojaExt:=DMBelShop.CDS_BuscaRapida.FieldByName('cod_filial').AsString;
           DMBelShop.CDS_BuscaRapida.Close;

           If sgCodLojaExt='' Then
            msg('C�digo da Loja � Inv�lido !!','A')
           Else
            Break;
         Except
         End;
       End; // While b do
       bConcExtrato:=True;
     End
    Else // If msg('Conciliar Somente o Extrato  ??','C')=1 Then
     Begin
       Exit;
     End; // If msg('Conciliar Somente o Extrato  ??','C')=1 Then
  End; // If (igTotMarcaPag=0) And (igTotMarcaExt<>0) Then

  If ((igTotMarcaPag=0) Or (igTotMarcaExt=0)) And (Not bConcDinheiro) And (Not bConcExtrato)Then
  Begin
    ShowMessage('Imposs�vel Conciliar !!'+cr+cr+'A Concilia��o deve ser:'+cr+cr+
                '1(UM) Marcado para 1(UM) ou DIVERSOS Marcados !!');
    Exit;
  End;

  Lb_Obs.Caption:='Efetuando Concilia��o...';

  Rb_ConcAmbos.Checked:=True;
  Rb_ConcConciliadosClick(Self);

  // Verificva se Transa��o esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;

    sCodTpConc:='';
    sDesTpConc:='';

    // Busca Valores da Concilia��o ============================================
    DMConciliacao.CDS_CMExtratos.DisableControls;
    cgVlrConciarExt:=0;
    DMConciliacao.CDS_CMExtratos.First;
    While Not DMConciliacao.CDS_CMExtratos.Eof do
    Begin
      If (DMConciliacao.CDS_CMExtratosConciliado.AsString='NAO') and (DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM') Then
      Begin
        cgVlrConciarExt:=cgVlrConciarExt+DMConciliacao.CDS_CMExtratosVLR_DOCTO.AsCurrency;
      End;

      DMConciliacao.CDS_CMExtratos.Next;
    End;
    DMConciliacao.CDS_CMExtratos.First;
    DMConciliacao.CDS_CMExtratos.EnableControls;
    DMConciliacao.CDS_CMExtratos.Locate('Chv_Extrato', sChvExtrato,[]);

    // Pagamentos ================================================================
    DMConciliacao.CDS_CMPagtos.DisableControls;
    cgVlrConciarPag:=0;
    DMConciliacao.CDS_CMPagtos.First;
    While Not DMConciliacao.CDS_CMPagtos.Eof do
    Begin
      If (DMConciliacao.CDS_CMPagtosConciliado.AsString='NAO') and (DMConciliacao.CDS_CMPagtosConciliar.AsString='SIM') Then
      Begin
        cgVlrConciarPag:=cgVlrConciarPag+DMConciliacao.CDS_CMPagtosVLR_PAGTO.AsCurrency;
      End;

      DMConciliacao.CDS_CMPagtos.Next;
    End;
    DMConciliacao.CDS_CMPagtos.First;
    DMConciliacao.CDS_CMPagtos.EnableControls;

    If Trim(sNumSeq)<>'' Then
     DMConciliacao.CDS_CMPagtos.Locate('Num_Seq;Num_Compl', VarArrayOf([sNumSeq,sNumCompl]),[]);

    // =========================================================================
    // Concilia Por Tipo de Concilia��o ou Por Pagto ou Extrato ================
    // =========================================================================

    // OdirApagar - Talvez (Tipo de Concilia��o) - OdirDuvida
//    If ((igTotMarcaExt>0) And (igTotMarcaPag=0)) Or ((igTotMarcaExt=0) And (igTotMarcaPag>0)) Then
//    Begin
//    // Concilia Por Tipo de Concilia��o ----------------------------------------
//    If ((igTotMarcaExt>0) And (igTotMarcaPag=0)) Or ((igTotMarcaExt=0) And (igTotMarcaPag>0)) Then
//     Begin
//       If Not BuscaTpConcicliacao(sCodTpConc, sDesTpConc) Then
//       Begin
//         DMBelShop.SQLC.Rollback(TD);
//         Lb_Obs.Caption:='Tecle <Duplo Click> Para Marcar Concilia��o';
//         Exit;
//       End;
//
//       // Processa Por Tipo de Concilia��o --------------------------------------
//       If (Trim(sCodTpConc)<>'') and (Trim(sDesTpConc)<>'') Then
//       Begin
//         If Not ProcessaTipoConciliacao(sCodTpConc, sDesTpConc) Then
//         Begin
//           DMBelShop.SQLC.Rollback(TD);
//           Lb_Obs.Caption:='Tecle <Duplo Click> Para Marcar Concilia��o';
//           Exit;
//         End;
//       End; // If (Trim(sCodTpConc<>'') and (Trim(sDesTpConc<>'') Then
//     End // If ((igTotMarcaExt>0) And (igTotMarcaPag=0)) Or ((igTotMarcaExt=0) And (igTotMarcaPag>0)) Then
//    // Concilia Por Pagto ------------------------------------------------------
//    Else if igTotMarcaPag=1 Then

    // Concilia Como Dinheiro --------------------------------------------------
    If bConcDinheiro Then
     Begin
       If Not ProcessaConciciacao('Din') Then
       Begin
         DMBelShop.SQLC.Rollback(TD);
         Lb_Obs.Caption:='Tecle <Duplo Click> Para Marcar Concilia��o';
         Exit;
       End; // If Not ProcessaConciciacao('Din') Then
     End; // If bConcDinheiro Then

    // Concilia Somente Extrato ------------------------------------------------
    If bConcExtrato Then
     Begin
       If Not ProcessaConciciacao('SEx') Then
       Begin
         DMBelShop.SQLC.Rollback(TD);
         Lb_Obs.Caption:='Tecle <Duplo Click> Para Marcar Concilia��o';
         Exit;
       End; // If Not ProcessaConciciacao('SEx') Then
     End // If bConcExtrato Then

    // Concilia Por Pagto ------------------------------------------------------
    Else If igTotMarcaPag=1 Then
     Begin
       If cgVlrConciarExt<>cgVlrConciarPag Then
       Begin
         If msg('Valores a Conciliar Diferentes:'+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Pagto: '+CurrToStr(cgVlrConciarPag)+cr+cr+'Deseja Conciliar ??','C')=2 Then
         Begin
           If Not DMConciliacao.CDS_CMPagtos.IsEmpty Then
            DMConciliacao.CDS_CMPagtos.Locate('NUM_SEQ;NUM_COMPL', VarArrayOf([sNumSeq,sNumCompl]),[]);

           If Not DMConciliacao.CDS_CMExtratos.IsEmpty Then
            DMConciliacao.CDS_CMExtratos.Locate('CHV_EXTRATO', sChvExtrato,[]);

           Screen.Cursor:=crDefault;
           Dbg_ConcManutExtrato.SetFocus;
           Exit;
         End;
       End; // If cgVlrConciarExt<>cgVlrConciarPag Then

       If Not ProcessaConciciacao('Pag') Then
       Begin
         DMBelShop.SQLC.Rollback(TD);
         Lb_Obs.Caption:='Tecle <Duplo Click> Para Marcar Concilia��o';
         Exit;
       End;
     End // If igTotMarcaExt=1 Then

    // Concilia Por Extrato ----------------------------------------------------
    Else If igTotMarcaExt=1 Then
     Begin
       If cgVlrConciarExt<>cgVlrConciarPag Then
       Begin
         If msg('Valores a Conciliar Diferentes:'+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Pagto: '+CurrToStr(cgVlrConciarPag)+cr+cr+'Deseja Conciliar ??','C')=2 Then
         Begin
           If Not DMConciliacao.CDS_CMPagtos.IsEmpty Then
            DMConciliacao.CDS_CMPagtos.Locate('NUM_SEQ;NUM_COMPL', VarArrayOf([sNumSeq,sNumCompl]),[]);

           If Not DMConciliacao.CDS_CMExtratos.IsEmpty Then
            DMConciliacao.CDS_CMExtratos.Locate('CHV_EXTRATO', sChvExtrato,[]);

           Screen.Cursor:=crDefault;
           Dbg_ConcManutExtrato.SetFocus;
           Exit;
         End;
       End; // If cgVlrConciarExt<>cgVlrConciarPag Then

       If Not ProcessaConciciacao('Ext')Then
       Begin
         DMBelShop.SQLC.Rollback(TD);
         Lb_Obs.Caption:='Tecle <Duplo Click> Para Marcar Concilia��o';
         Exit;
       End;
     End; // If igTotMarcaExt=1 Then
    // =========================================================================

    igTotMarcaExt:=0;
    igTotMarcaPag:=0;

    EdtConcManutExtratoQtd.Value:=0;
    EdtConcManutExtratoVlr.Value:=0;
    EdtConcManutPagtoQtd.Value:=0;
    EdtConcManutPagtoVlr.Value:=0;
    EdtConcManutExtPagDif.Value:=0;

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    Screen.Cursor:=crDefault;
    Lb_Obs.Caption:='Tecle <Duplo Click> Para Marcar Concilia��o';

  Except
    on e : Exception do
    Begin
      HabilitaBotoes(True);

      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);
      Lb_Obs.Caption:='Tecle <Duplo Click> Para Marcar Concilia��o';

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    End; // on e : Exception do
  End; // Try

  If bgLocate Then
  Begin
    If Not DMConciliacao.CDS_CMPagtos.IsEmpty Then
     DMConciliacao.CDS_CMPagtos.Locate('NUM_SEQ;NUM_COMPL', VarArrayOf([sNumSeq,sNumCompl]),[]);

    If Not DMConciliacao.CDS_CMExtratos.IsEmpty Then
     DMConciliacao.CDS_CMExtratos.Locate('CHV_EXTRATO', sChvExtrato,[]);
  End; // If bgLocate Then

end;

procedure TFrmBancoExtratos.MenuTipoConcilciaoClick(Sender: TObject);
Var
  sChvExtrato, sNumSeq, sNumCompl: String;
begin
  LiberaMenu(False);

  // Executa Permiss�es de Bot�es ==============================================
  if (Sender is TMenuItem) Then
   igTagPermissao:=(Sender as TMenuItem).Tag;

  BloqueioBotoes(FrmBancoExtratos, DMBelShop.CDS_Seguranca, igTagPermissao, Des_Login, bgInd_Admin);

  Pan_Opcoes.Visible:=True;
  Pan_ConcSolicitacoes.Visible:=False;

  FrmTiposConciliacao:=TFrmTiposConciliacao.Create(Self);
  FrmTiposConciliacao.ShowModal;

  FreeAndNil(FrmTiposConciliacao);

  If DMConciliacao.CDS_CMExtratos.Active Then
  Begin
    sChvExtrato:=DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString;
    DMConciliacao.CDS_CMExtratos.Close;
    DMConciliacao.CDS_CMExtratos.Open;
    DMConciliacao.CDS_CMExtratos.Locate('CHV_EXTRATO', sChvExtrato,[]);
  End;

  If DMConciliacao.CDS_CMPagtos.Active Then
  Begin
    sNumCompl  :=DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;
    sNumSeq    :=DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString;
    DMConciliacao.CDS_CMPagtos.Close;
    DMConciliacao.CDS_CMPagtos.Open;
    DMConciliacao.CDS_CMPagtos.Locate('NUM_SEQ;NUM_COMPL',VarArrayOf([sNumSeq,sNumCompl]),[]);
  End;
end;

procedure TFrmBancoExtratos.Dbg_ConcManutExtratoEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_ConcManutExtratoEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmBancoExtratos.Rb_ConcConciliadosClick(Sender: TObject);
begin
  If (not DMConciliacao.CDS_CMExtratos.Active) Or (not DMConciliacao.CDS_CMPagtos.Active) Then
  Begin
    If (Ts_ConciliacoesManutPagtos.TabVisible) and (Pan_ConcSolicitacoes.Visible) Then
     DtEdt_ConcDtaInicio.SetFocus;

    Exit;
  End;

  Dbg_ConcManutExtrato.SetFocus;

  AcertaRb_Style(Rb_ConcConciliados);
  AcertaRb_Style(Rb_ConcNaoConciliados);
  AcertaRb_Style(Rb_ConcAmbos);

  If Rb_ConcConciliados.Checked Then
  Begin
    DMConciliacao.CDS_CMExtratos.Filtered:=False;
    DMConciliacao.CDS_CMExtratos.Filter:='QUEM is Not null';
    DMConciliacao.CDS_CMExtratos.Filtered:=True;

    DMConciliacao.CDS_CMPagtos.Filtered:=False;
    DMConciliacao.CDS_CMPagtos.Filter:='QUEM is Not null';
    DMConciliacao.CDS_CMPagtos.Filtered:=True;
  End;

  If Rb_ConcNaoConciliados.Checked Then
  Begin
    DMConciliacao.CDS_CMExtratos.Filtered:=False;
    DMConciliacao.CDS_CMExtratos.Filter:='QUEM is null';
    DMConciliacao.CDS_CMExtratos.Filtered:=True;

    DMConciliacao.CDS_CMPagtos.Filtered:=False;
    DMConciliacao.CDS_CMPagtos.Filter:='QUEM is null';
    DMConciliacao.CDS_CMPagtos.Filtered:=True;
  End;

  If Rb_ConcAmbos.Checked Then
  Begin
    DMConciliacao.CDS_CMExtratos.Filtered:=False;
    DMConciliacao.CDS_CMExtratos.Filter:='';

    DMConciliacao.CDS_CMPagtos.Filtered:=False;
    DMConciliacao.CDS_CMPagtos.Filter:='';
  End;

  TotaisMarcadosNaoConciliados;
end;

procedure TFrmBancoExtratos.Rb_ConcConciliadosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_ConcConciliadosClick(Self);
end;

procedure TFrmBancoExtratos.Dbg_ConcManutExtratoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMConciliacao.CDS_CMExtratosQUEM.AsString='SIS' then
     Dbg_ConcManutExtrato.Canvas.Brush.Color:=clLime;

    if DMConciliacao.CDS_CMExtratosQUEM.AsString='USU' then
     Dbg_ConcManutExtrato.Canvas.Brush.Color:=$00BBBBFF;

    if (DMConciliacao.CDS_CMExtratosQUEM.AsString='USU') And (DMConciliacao.CDS_CMExtratosTIP_CONCILIACAO.AsString='SExt') then
    Begin
      Dbg_ConcManutExtrato.Canvas.Brush.Color:=$00FF75BA;
      Dbg_ConcManutExtrato.Canvas.Font.Color:=clWhite; // Cor da Fonte
    End;

    if (Trim(DMConciliacao.CDS_CMExtratosQUEM.AsString)='') And (DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM') then
     Dbg_ConcManutExtrato.Canvas.Brush.Color:=clYellow;

    Dbg_ConcManutExtrato.Canvas.FillRect(Rect);
    Dbg_ConcManutExtrato.DefaultDrawDataCell(Rect,Column.Field,state);

    DMConciliacao.CDS_CMExtratosQUEM.Alignment:=taCenter;
    DMConciliacao.CDS_CMExtratosConciliado.Alignment:=taCenter;
  End;

end;

procedure TFrmBancoExtratos.Dbg_ConcManutPagtoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMConciliacao.CDS_CMPagtosQUEM.AsString='SIS' then
     Dbg_ConcManutPagto.Canvas.Brush.Color:=clLime;

    if DMConciliacao.CDS_CMPagtosQUEM.AsString='USU' then
     Dbg_ConcManutPagto.Canvas.Brush.Color:=$00BBBBFF;

    if (DMConciliacao.CDS_CMPagtosQUEM.AsString='USU') And (DMConciliacao.CDS_CMPagtosTIP_CONCILIACAO.AsString='DINH') then
     Dbg_ConcManutPagto.Canvas.Brush.Color:=clAqua;

    if (DMConciliacao.CDS_CMPagtosQUEM.AsString='USU') And (DMConciliacao.CDS_CMPagtosTIP_CONCILIACAO.AsString='SExt') then
    Begin
      Dbg_ConcManutPagto.Canvas.Brush.Color:=$00FF75BA;
      Dbg_ConcManutPagto.Canvas.Font.Color:=clWhite; // Cor da Fonte
    End;

    if (Trim(DMConciliacao.CDS_CMPagtosQUEM.AsString)='') And (DMConciliacao.CDS_CMPagtosConciliar.AsString='SIM') then
     Dbg_ConcManutPagto.Canvas.Brush.Color:=clYellow;

    Dbg_ConcManutPagto.Canvas.FillRect(Rect);
    Dbg_ConcManutPagto.DefaultDrawDataCell(Rect,Column.Field,state);

    DMConciliacao.CDS_CMPagtosQUEM.Alignment:=taCenter;
    DMConciliacao.CDS_CMPagtosConciliado.Alignment:=taCenter;
    DMConciliacao.CDS_CMPagtosCOD_LOJA.Alignment:=taLeftJustify;
    DMConciliacao.CDS_CMPagtosNUM_DOCTO.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMPagtosDTA_VENC .Alignment:=taCenter;
    DMConciliacao.CDS_CMPagtosDTA_PAGTO .Alignment:=taCenter;
    DMConciliacao.CDS_CMPagtosCOD_COMPROVANTE.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMPagtosCOD_FORNECEDOR.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMPagtosIND_PAGTO_PARCIAL.Alignment:=taCenter;
    DMConciliacao.CDS_CMPagtosNUM_PRESTACAO.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMPagtosDTA_DOCTO.Alignment:=taCenter;
    DMConciliacao.CDS_CMPagtosDTA_COMPR.Alignment:=taCenter;
    DMConciliacao.CDS_CMPagtosCHV_PAGTO.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMPagtosCHV_NOTA.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMPagtosCHV_RECIBO.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMPagtosNUM_SERIE.Alignment:=taRightJustify;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmBancoExtratos.Dbg_ConcManutExtratoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  b: Boolean;
  sValor: String;
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

   // Busca Valor ===============================================================
  If Key=Vk_F4 Then
  Begin
    If Not DMConciliacao.CDS_CMExtratos.IsEmpty Then
    Begin
      sValor:='';
      b:=True;
      While b do
      Begin
        If InputQuery('Valor a Localizar','',sValor) then
         Begin
           Try
             StrToCurr(sValor);
             If Not DMConciliacao.CDS_CMExtratos.Locate('VLR_DOCTO',sValor,[]) Then
             Begin
               msg('Valor N�o Localizado !!','A');
               Exit;
             End;
             Break;
           Except
             msg('Valor Inv�lido !!','A');
             Break;
           End;
         End
        Else // If InputQuery('Valor a Localizar','',sValor) then
         Begin
           Break;
         End; // If InputQuery('Valor a Localizar','',sValor) then
      End; // While b do
    End; // If Not DMConciliacao.CDS_CMExtratos.IsEmpty Then
  End; // If Key=Vk_F4 Then

  // Apresenta Concilia��o =====================================================
  If Key=Vk_F6 Then
  Begin
    If Not DMConciliacao.CDS_CMExtratos.IsEmpty Then
    Begin
      If DMConciliacao.CDS_CMExtratosConciliado.AsString='SIM' Then
       Begin
         OdirPanApres.Caption:='AGUARDE !! Localizando Concilia��o...';
         OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
         OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBancoExtratos.Width-OdirPanApres.Width)/2));
         OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBancoExtratos.Height-OdirPanApres.Height)/2))-20;
         OdirPanApres.Visible:=True;
         Refresh;

         FrmApresConciliacao:=TFrmApresConciliacao.Create(Self);
         FrmApresConciliacao.Dbg_ConcManutPagto.DataSource:=DMConciliacao.DS_CMApresPagtos;
         FrmApresConciliacao.Dbe_ConcManutTotal.DataSource:=DMConciliacao.DS_CMApresPagtos;

         DMConciliacao.CDS_CMApresPagtos.Close;
         DMConciliacao.SDS_CMApresPagtos.Params.ParamByName('CHV_EXTRATO').AsString:=
                                  DMConciliacao.CDS_CMExtratosCHV_EXTRATO.AsString;
         DMConciliacao.CDS_CMApresPagtos.Open;

         OdirPanApres.Visible:=False;
         If DMConciliacao.CDS_CMApresPagtos.IsEmpty Then
         Begin
           FreeAndNil(FrmApresConciliacao);
           DMConciliacao.CDS_CMApresPagtos.Close;
           Exit;
         End; // DMConciliacao.CDS_CMApresPagtos.Close;

         FrmApresConciliacao.Gb_ConcManutExtrato.Visible:=False;
         FrmApresConciliacao.Gb_ConcManutPagtos.Align:=alClient;

         FrmApresConciliacao.ShowModal;

         FreeAndNil(FrmApresConciliacao);
       End
      Else // If DMConciliacao.CDS_CMExtratosConciliado.AsString='SIM' Then
       Begin
         msg('Extrato N�o Conciliado !!','A')
       End;  // If DMConciliacao.CDS_CMExtratosConciliado.AsString='SIM' Then
    End; // If Not DMConciliacao.CDS_CMExtratos.IsEmpty Then
  end; // If Key=Vk_F6 Then
end;

procedure TFrmBancoExtratos.Dbg_ConcManutPagtoKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Var
  b: Boolean;
  sValor: String;
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

  // Busca Valor ===============================================================
  If Key=Vk_F4 Then
  Begin
    If Not DMConciliacao.CDS_CMPagtos.IsEmpty Then
    Begin
      sValor:='';
      b:=True;
      While b do
      Begin
        If InputQuery('Valor a Localizar','',sValor) then
         Begin
           Try
             StrToCurr(sValor);
             If Not DMConciliacao.CDS_CMPagtos.Locate('VLR_PAGTO',sValor,[]) Then
             Begin
               msg('Valor N�o Localizado !!','A');
               Exit;
             End;
             Break;
           Except
             msg('Valor Inv�lido !!','A');
             Break;
           End;
         End
        Else // If InputQuery('Valor a Localizar','',sValor) then
         Begin
           Break;
         End; // If InputQuery('Valor a Localizar','',sValor) then
      End; // While b do
    End; // If Not DMConciliacao.CDS_CMPagtos.IsEmpty Then
  End; // If Key=Vk_F4 Then

  // Apresenta Concilia��o =====================================================
  If Key=Vk_F6 Then
  Begin
    If Not DMConciliacao.CDS_CMPagtos.IsEmpty Then
    Begin
      If DMConciliacao.CDS_CMPagtosConciliado.AsString='SIM' Then
       Begin

         If DMConciliacao.CDS_CMPagtosTIP_CONCILIACAO.AsString='DINH' Then
         Begin
           msg('Pagamento Conciliado como DINHEIRO !!','A');
           Exit;
         End;

         OdirPanApres.Caption:='AGUARDE !! Localizando Concilia��o...';
         OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
         OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBancoExtratos.Width-OdirPanApres.Width)/2));
         OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBancoExtratos.Height-OdirPanApres.Height)/2))-20;
         OdirPanApres.Visible:=True;
         Refresh;

         FrmApresConciliacao:=TFrmApresConciliacao.Create(Self);
         FrmApresConciliacao.Dbg_ConcManutExtrato.DataSource:=DMConciliacao.DS_CMApresExtrato;
         FrmApresConciliacao.Dbe_ConcManutTotal.DataSource:=DMConciliacao.DS_CMApresExtrato;

         DMConciliacao.CDS_CMApresExtratos.Close;
         DMConciliacao.SDS_CMApresExtratos.Params.ParamByName('NUM_SEQ').AsString:=
                                     DMConciliacao.CDS_CMPagtosNUM_SEQ.AsString;
         DMConciliacao.SDS_CMApresExtratos.Params.ParamByName('NUM_COMPL').AsString:=
                                   DMConciliacao.CDS_CMPagtosNUM_COMPL.AsString;
         DMConciliacao.CDS_CMApresExtratos.Open;

         OdirPanApres.Visible:=False;
         If DMConciliacao.CDS_CMApresExtratos.IsEmpty Then
         Begin
           FreeAndNil(FrmApresConciliacao);
           DMConciliacao.CDS_CMApresExtratos.Close;
           Exit;
         End; // If DMConciliacao.CDS_CMApresExtratos.IsEmpty Then

         FrmApresConciliacao.Gb_ConcManutPagtos.Visible:=False;
         FrmApresConciliacao.Gb_ConcManutExtrato.Align:=alClient;

         FrmApresConciliacao.ShowModal;

         FreeAndNil(FrmApresConciliacao);
       End
      Else // If DMConciliacao.CDS_CMPagtosConciliado.AsString='SIM' Then
       Begin
         msg('Pagamento N�o Conciliado !!','A')
       End;  // If DMConciliacao.CDS_CMPagtosConciliado.AsString='SIM' Then
    End; // If Not DMConciliacao.CDS_CMPagtos.IsEmpty Then
  end; // If Key=Vk_F6 Then

end;

procedure TFrmBancoExtratos.Dbg_ConcManutPagtoTitleClick(Column: TColumn);
Var
  s, sPesquisa: String;
  b: Boolean;
  i: Integer;
begin
  If Not DMConciliacao.CDS_CMPagtos.IsEmpty Then
  Begin
    i:=DMConciliacao.CDS_CMPagtos.RecNo;
    sPesquisa:='';
    b:=True;
    While b do
    Begin
      s:=DMConciliacao.CDS_CMPagtos.FieldByName(Column.FieldName).DisplayLabel;
      If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Try
           If Column.FieldName='NUM_DOCTO' Then
            sPesquisa:=FormatFloat('000000',StrToInt(sPesquisa));

           If Not DMConciliacao.CDS_CMPagtos.Locate(Column.FieldName, sPesquisa,[]) Then
           Begin
             If Not LocalizaRegistro(DMConciliacao.CDS_CMPagtos, Column.FieldName, sPesquisa) Then
             Begin
               DMConciliacao.CDS_CMPagtos.RecNo:=i;
               msg('N�o Localizado !!','A');
               Exit;
             End;
           End; // If Not DMConciliacao.CDS_CMPagtos.Locate(Column.FieldName, sPesquisa,[]) Then
           Break;
         Except
           msg('Informa��o Inv�lida !!','A');
           Break;
         End;
       End
      Else // If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Break;
       End; // If InputQuery('Localizar: '+s,'',sPesquisa) then
    End; // While b do
  End; // If Not DMConciliacao.CDS_CMPagtos.IsEmpty Then
end;

procedure TFrmBancoExtratos.Bt_ConcManutVoltarClick(Sender: TObject);
begin

  DMConciliacao.CDS_CMTotalPagtos.Close;

  Ts_ConcManutTotalPagtos.TabVisible:=False;
  Pan_Opcoes.Visible:=True;
  Ts_ConciliacoesManutPagtos.TabVisible:=True;

  HabilitaMenus(FrmBancoExtratos, True);

  Dbg_ConcManutPagto.SetFocus;

end;

procedure TFrmBancoExtratos.Bt_ConcManutSalvaClipboardClick(Sender: TObject);
begin
  { Usado em:
   Bt_DepAnaliseSalvaClipboard
  }

  If (Sender is TJvXPButton) Then
  Begin
    If Trim((Sender as TJvXPButton).Name)='Bt_ConcManutSalvaClipboard' Then
    Begin
      Dbg_ConcManutTotalPagtos.SetFocus;

      If DMConciliacao.CDS_CMTotalPagtos.IsEmpty Then
       Exit;

      DBGridClipboard(Dbg_ConcManutTotalPagtos);
    End; // If Trim((Sender as TJvXPButton).Name)='Bt_ConcManutSalvaClipboard' Then

    If Trim((Sender as TJvXPButton).Name)='Bt_DepAnaliseSalvaClipboard' Then
    Begin
      Dbg_DepAnalise.SetFocus;

      If DMConciliacao.CDS_CMDepositosAnalise.IsEmpty Then
       Exit;

      DBGridClipboard(Dbg_DepAnalise);
    End; // If Trim((Sender as TJvXPButton).Name)='Bt_DepAnaliseSalvaClipboard' Then
  End; // If (Sender is TJvXPButton) Then

end;

procedure TFrmBancoExtratos.Bt_ConcManutSalvaCSVClick(Sender: TObject);
begin
  Dbg_ConcManutTotalPagtos.SetFocus;

  mgMemo:=TMemo.Create(mgMemo);
  mgMemo.Visible:=False;
  mgMemo.Parent:=FrmBancoExtratos;
  mgMemo.Width:=500;

  If Not DMConciliacao.CDS_CMTotalPagtos.IsEmpty Then
   SalvaResultado_CLI_DisplayName(DMConciliacao.CDS_CMTotalPagtos, Dbg_ConcManutTotalPagtos, mgMemo);

  FreeAndNil(mgMemo)
end;

procedure TFrmBancoExtratos.Dbg_ConcManutTotalPagtosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If DMConciliacao.CDS_CMTotalPagtos.Active Then
  Begin
    If DMConciliacao.CDS_CMTotalPagtos.RecNo mod 2=0 Then
    Begin
      Dbg_ConcManutTotalPagtos.Canvas.Brush.Color:=clSkyBlue;
      Dbg_ConcManutTotalPagtos.Canvas.FillRect(Rect);
      Dbg_ConcManutTotalPagtos.DefaultDrawDataCell(Rect,Column.Field,state);

      DMConciliacao.CDS_CMTotalPagtosDTA_PAGTO.Alignment:=taCenter;
    End;
  End; // If DMConciliacao.CDS_CMTotalPagtos.Active Then

end;

procedure TFrmBancoExtratos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  MySql: String;
begin
  // Apresenta Totais de Movimenta��es de Pagamentos ===========================
  If (Key=Vk_F11) And (DMConciliacao.CDS_CMPagtos.Active) Then
  Begin
    If Not DMConciliacao.CDS_CMPagtos.IsEmpty Then
    Begin

      HabilitaMenus(FrmBancoExtratos, False);

      Pan_Opcoes.Visible:=False;

      MySql:=' SELECT ''Bel_''||m.cod_loja cod_loja,  m.dta_pagto,'+
             ' SUM(m.vlr_docto) vlr_docto,'+
             ' SUM(m.vlr_desconto) vlr_desconto,'+
             ' SUM(m.vlr_acrescimo) vlr_acrescimo,'+
             ' SUM(m.vlr_pagto) vlr_pagto,'+
             ' COUNT(m.cod_loja) Tot_reg'+

             ' FROM FIN_CONCILIACAO_MOVTOS m'+
             ' WHERE m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim);

             If sgCodLojas<>'' Then
              MySql:=MySql+' AND m.cod_loja IN ('+sgCodLojas+')';

             MySql:=MySql+' GROUP BY 1,2'+

             ' UNION'+

             ' SELECT  ''TOTAL'' cod_loja, CURRENT_DATE dta_pagto,'+
             ' SUM(m.vlr_docto) vlr_docto,'+
             ' SUM(m.vlr_desconto) vlr_desconto,'+
             ' SUM(m.vlr_acrescimo) vlr_acrescimo,'+
             ' SUM(m.vlr_pagto) vlr_pagto,'+
             ' COUNT(m.cod_loja) Tot_reg'+

             ' FROM FIN_CONCILIACAO_MOVTOS m'+
             ' WHERE m.dta_pagto BETWEEN '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim);

             If sgCodLojas<>'' Then
              MySql:=MySql+' AND m.cod_loja IN ('+sgCodLojas+')';

             MySql:=MySql+' ORDER BY 2,1';
      DMConciliacao.CDS_CMTotalPagtos.Close;
      DMConciliacao.SDS_CMTotalPagtos.CommandText:=MySql;
      DMConciliacao.CDS_CMTotalPagtos.Open;

      Ts_ConciliacoesManutPagtos.TabVisible:=False;
      Ts_ConcManutTotalPagtos.TabVisible:=True;
      PC_PrincipalChange(Self);

      Dbg_ConcManutTotalPagtos.SetFocus;
    End; // If Not DMConciliacao.CDS_CMPagtos.IsEmpty Then
  end; // If (Key=Vk_F11) And (DMConciliacao.CDS_CMPagtos.Active) Then

  // Apresenta Legenda de Cores ================================================
  If (Key=Vk_F1)
      And
     (((PC_Principal.ActivePage=Ts_ConciliacoesManutPagtos) And
       ((DMConciliacao.CDS_CMPagtos.Active) Or (DMConciliacao.CDS_CMExtratos.Active)))
      Or
      ((PC_Principal.ActivePage=Ts_ConciliacoesManutDepositos) And
       ((DMConciliacao.CDS_CMDepositos.Active) Or (DMConciliacao.CDS_CMExtratosDep.Active))))
     Then
  Begin
    // Abre Form de Solicita��es (Enviar o TabIndex a Manter Ativo) ==============
    FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
    FrmSolicitacoes.Caption:='Manuten�ao de Concilia��es';
    FrmBelShop.AbreSolicitacoes(4);

    FrmSolicitacoes.Pan_Cor1.Font.Color:=clWindowText;
    FrmSolicitacoes.Pan_Cor1.Font.Style:=[fsBold];
    FrmSolicitacoes.Pan_Cor1.Color     :=clWindow;
    FrmSolicitacoes.Pan_Cor1.Caption   :='Item Sem Defini��o para Concilia��o (Ainda N�o Conciliado)';

    FrmSolicitacoes.Pan_Cor2.Font.Color:=clWindowText;
    FrmSolicitacoes.Pan_Cor2.Font.Style:=[fsBold];
    FrmSolicitacoes.Pan_Cor2.Color     :=clYellow;
    FrmSolicitacoes.Pan_Cor2.Caption   :='Item Selecionado para Concilia��o (Ainda N�o Conciliado)';

    FrmSolicitacoes.Pan_Cor3.Font.Color:=clWindowText;
    FrmSolicitacoes.Pan_Cor3.Font.Style:=[fsBold];
    FrmSolicitacoes.Pan_Cor3.Color     :=clLime;
    FrmSolicitacoes.Pan_Cor3.Caption   :='Conciliado Pelo Sistema - Autom�tico';

    FrmSolicitacoes.Pan_Cor4.Font.Color:=clWindowText;
    FrmSolicitacoes.Pan_Cor4.Font.Style:=[fsBold];
    FrmSolicitacoes.Pan_Cor4.Color     :=$00BBBBFF;
    FrmSolicitacoes.Pan_Cor4.Caption   :='Conciliado Pelo Usu�rio - Manual (Extrato Com Movimento)';

    FrmSolicitacoes.Pan_Cor5.Font.Color:=clWindowText;
    FrmSolicitacoes.Pan_Cor5.Font.Style:=[fsBold];
    FrmSolicitacoes.Pan_Cor5.Color     :=$00FF75BA;
    FrmSolicitacoes.Pan_Cor5.Caption   :='Conciliado Pelo Usu�rio - Manual (Somente Extrato)';

    FrmSolicitacoes.Pan_Cor6.Font.Color:=clWindowText;
    FrmSolicitacoes.Pan_Cor6.Font.Style:=[fsBold];
    FrmSolicitacoes.Pan_Cor6.Color     :=clAqua;
    FrmSolicitacoes.Pan_Cor6.Caption   :='Conciliado Pelo Usu�rio - Manual (Como Dinheiro)';

    FrmSolicitacoes.Pan_Cor7.Visible:=False;
    FrmSolicitacoes.Pan_Cor8.Visible:=False;

    // Conclia��o Depositios - Sangrias
    If ((PC_Principal.ActivePage=Ts_ConciliacoesManutDepositos) And
       ((DMConciliacao.CDS_CMDepositos.Active) Or (DMConciliacao.CDS_CMExtratosDep.Active))) Then
    Begin
      FrmSolicitacoes.Pan_Cor7.Visible   :=True;
      FrmSolicitacoes.Pan_Cor7.Font.Color:=clWhite;
      FrmSolicitacoes.Pan_Cor7.Font.Style:=[fsBold];
      FrmSolicitacoes.Pan_Cor7.Color     :=clRed;
      FrmSolicitacoes.Pan_Cor7.Caption   :='Conciliado Pelo Usu�rio - Manual (Como Despesa)';
    End;

    bgProcessar:=False;
    FrmSolicitacoes.ShowModal;
    FreeAndNil(FrmSolicitacoes);
  End; // If (Key=Vk_F1) And (PC_Principal.ActivePage=Ts_ConciliacoesManut) Then
end;

procedure TFrmBancoExtratos.SubMenuConcilicaoAutomaticaClick(Sender: TObject);
begin
  LiberaMenu(False);

  // Executa Permiss�es de Bot�es ==============================================
  If (Sender is TMenuItem) Then
   igTagPermissao:=(Sender as TMenuItem).Tag;

  BloqueioBotoes(FrmBancoExtratos, DMBelShop.CDS_Seguranca, igTagPermissao, Des_Login, bgInd_Admin);

  DMConciliacao.FechaTudoConciliacao;

  Pan_Opcoes.Visible:=False;

  Ts_ConciliacoesManutPagtos.TabVisible:=False;
  Ts_ConciliacaoManutPagtos.TabVisible:=False;
  Ts_HistConcAuto.TabVisible:=True;
  PC_PrincipalChange(Self);

  DMConciliacao.CDS_HistAuto.Open;

end;

procedure TFrmBancoExtratos.Bt_HistConcAutoSairClick(Sender: TObject);
begin
  Bt_SairClick(Self);
end;

procedure TFrmBancoExtratos.EdtHistConcAutoLocalizaChange(Sender: TObject);
begin
  If DMConciliacao.CDS_HistAuto.Active Then
  Begin
    DMConciliacao.CDS_HistAuto.Filtered:=False;
    DMConciliacao.CDS_HistAuto.Filter:='';

    If Trim(EdtHistConcAutoLocaliza.Text)<>'' Then
    Begin
      If StrToIntDef(Trim(EdtHistConcAutoLocaliza.Text),999999)=999999 Then
       Begin
        DMConciliacao.CDS_HistAuto.Filter:='DES_HISTORICO Like '+QuotedStr('%'+Trim(EdtHistConcAutoLocaliza.Text)+'%');
        DMConciliacao.CDS_HistAuto.Filtered:=True;
       End
      Else
       Begin
         DMConciliacao.CDS_HistAuto.Locate('COD_HISTORICO', Trim(EdtHistConcAutoLocaliza.Text),[]);
       End; // If StrToIntDef(Trim(EdtHistConcAutoLocaliza.Text),999999)=999999 Then
    End; // If Trim(EdtHistConcAutoLocaliza.Text)<>'' Then
  End; // If DMConciliacao.CDS_HistAuto.Active Then
end;

procedure TFrmBancoExtratos.Dbg_HistConcAutoDblClick(Sender: TObject);
Var
  i: Integer;
  MySql: String;
  b: Boolean;
begin
  If not DMConciliacao.CDs_HistAuto.IsEmpty Then
  Begin
    // Verificva se Transa��o esta Ativa
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

      i:=DMConciliacao.CDS_HistAutoCOD_HISTORICO.AsInteger;

      // Retira Concilia��o Autom�tica ===========================================
      If Trim(DMConciliacao.CDS_HistAutoLOJA.AsString)<>'' Then
      Begin
        if msg('RETIRA a Concilia��o Autom�tica'+cr+'do Hist�rico Selecionado ??','C')=2 Then
        Begin
          DMBelShop.SQLC.Rollback(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';
          Screen.Cursor:=crDefault;

          Dbg_HistConcAuto.SetFocus;
          Exit;
        End; // if msg('Deseja Realmente Retira a Concilia��o'+cr+'Autom�tica do Hist�rico Selecionado ??','C')=2 Then

        MySql:=' UpDate FIN_BANCOS_TP_MOVTOS'+
               ' Set COD_CONC_LOJA=Null'+
               ' Where COD_TPMOVTO='+DMConciliacao.CDS_HistAutoCOD_HISTORICO.AsString;
        DMBelShop.SQLC.Execute(MySql,Nil,Nil);
      End; // If Trim(DMConciliacao.CDS_HistAutoLOJA.AsString)<>'' Then

      // Adiciona Concilia��o Autom�tica =======================================
      If Trim(DMConciliacao.CDS_HistAutoLOJA.AsString)='' Then
      Begin
        if msg('ADICIONAR a Concilia��o Autom�tica'+cr+'para o Hist�rico Selecionado ??','C')=2 Then
        Begin
          DMBelShop.SQLC.Rollback(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';
          Screen.Cursor:=crDefault;

          Dbg_HistConcAuto.SetFocus;
          Exit;
        End; // if msg('Deseja Realmente Adicionar a Concilia��o'+cr+'Autom�tica para o Hist�rico Selecionado ??','C')=2 Then

        b:=True;
        While b do
        Begin
          sgCodLoja:='';
          If InputQuery('Informe o C�digo da Loja','',sgCodLoja) then
           Begin
             Try
               StrToInt(sgCodLoja);

               // Verifica se a Loja Existe ===========================================
               If Length(sgCodLoja)<2 Then
                sgCodLoja:='0'+sgCodLoja;

               MySql:=' SELECT e.cod_filial'+
                      ' FROM emp_conexoes e'+
                      ' WHERE e.cod_filial='+QuotedStr(sgCodLoja);
               DMBelShop.CDS_BuscaRapida.Close;
               DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
               DMBelShop.CDS_BuscaRapida.Open;
               sgCodLoja:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString);
               DMBelShop.CDS_BuscaRapida.Close;

               If sgCodLoja='' Then
                msg('C�digo da Loja � Inv�lido !!','A')
               Else
                Break;
             Except
               msg('C�digo da Loja Inv�lido !!','A');
               sgCodLoja:='';
               Break;
             End;
           End
          Else // If InputQuery('Informe o C�digo da Loja','',sgCodLoja) then
           Begin
             Break;
           End; // If InputQuery('Informe o C�digo da Loja','',sgCodLoja) then
        End; // While b do

        If sgCodLoja='' Then
        Begin
          DMBelShop.SQLC.Rollback(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';
          Screen.Cursor:=crDefault;

          Dbg_HistConcAuto.SetFocus;
          Exit;
        End; // If sgCodLoja='' Then

        MySql:=' UpDate FIN_BANCOS_TP_MOVTOS'+
               ' Set COD_CONC_LOJA='+QuotedStr(sgCodLoja)+
               ' Where COD_TPMOVTO='+DMConciliacao.CDS_HistAutoCOD_HISTORICO.AsString;
        DMBelShop.SQLC.Execute(MySql,Nil,Nil);
      End; // If Trim(DMConciliacao.CDS_HistAutoLOJA.AsString)='' Then

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      DMConciliacao.CDS_HistAuto.DisableControls;
      DMConciliacao.CDS_HistAuto.Close;
      DMConciliacao.CDS_HistAuto.Open;
      DMConciliacao.CDS_HistAuto.EnableControls;

      DMConciliacao.CDS_HistAuto.Locate('COD_HISTORICO', i, []);

      Dbg_HistConcAuto.SetFocus;
    Except
      on e : Exception do
      Begin
        HabilitaBotoes(True);

        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        Dbg_HistConcAuto.SetFocus;
        
      End; // on e : Exception do
    End; // Try
  End; // If not DMConciliacao.CDs_HistAuto.IsEmpty Then

end;

procedure TFrmBancoExtratos.SubMenuConciliarClick(Sender: TObject);
begin
  LiberaMenu(False);

  // Executa Permiss�es de Bot�es ==============================================
  If (Sender is TMenuItem) Then
   igTagPermissao:=(Sender as TMenuItem).Tag;

  Bt_ConcConciliar.Tag:=1; // Libera para Controle de Botoes
  Bt_ConcConciliar.Caption:='Conciliar';
  BloqueioBotoes(FrmBancoExtratos, DMBelShop.CDS_Seguranca, igTagPermissao, Des_Login, bgInd_Admin);

  DMConciliacao.FechaTudoConciliacao;
  ConciliacaoLimpa(EdtBanrisulPastaArquivo, True);

  // Posiciona Pan_ConcSolicitacoes no Form =====================================
  Pan_ConcSolicitacoes.Parent:=Ts_ConcConciliar;
  Pan_ConcSolicitacoes.Visible:=True;

  Pan_Opcoes.Visible:=True;
  Pan_Concilicao.Visible:=False;

  Ts_HistConcAuto.TabVisible:=False;
  Ts_ConciliacoesManutPagtos.TabVisible:=False;
  Ts_ConciliacaoManutPagtos.TabVisible:=True;
  PC_ConcConciliar.ActivePage:=Ts_ConcConciliar;
  PC_PrincipalChange(Self);
  PC_ConcConciliarChange(Self);

  Rb_ConcTodos.Checked:=True;
  Rb_ConcBancoClick(Self);

  If Rb_ConcTodos.Checked Then
   DtEdt_ConcDtaInicio.SetFocus
  Else If Rb_ConcBanco.Checked Then
   EdtConcNumAgencia.SetFocus
  Else If Rb_ConcLoja.Checked Then
   EdtConcCodLoja.SetFocus;
  
end;

procedure TFrmBancoExtratos.SubMenuManutencaoClick(Sender: TObject);
begin
  LiberaMenu(False);

  Lb_Obs.Caption:='Observa��es...';

  // Executa Permiss�es de Bot�es ==============================================
  If (Sender is TMenuItem) Then
   igTagPermissao:=(Sender as TMenuItem).Tag;
   
  Bt_ConcConciliar.Tag:=0; // Retira para Controle de Botoes
  BloqueioBotoes(FrmBancoExtratos, DMBelShop.CDS_Seguranca, igTagPermissao, Des_Login, bgInd_Admin);

  DMConciliacao.FechaTudoConciliacao;
  ConciliacaoLimpa(EdtBanrisulPastaArquivo, True);

  Pan_ManutConc.Visible:=False;
  Bt_CMApresFiltro.Visible:=False;

  // Posiciona Pan_ConcSolicitacoes no Form =====================================
  Pan_ConcSolicitacoes.Parent:=Ts_ConciliacoesManutPagtos;
  Pan_ConcSolicitacoes.Visible:=True;
  Bt_CMApresFiltro.Caption:='Retira Filtro';
  Bt_ConcConciliar.Caption:='Busca';

  Pan_Opcoes.Visible:=True;
  Pan_Concilicao.Visible:=True;

  Ts_HistConcAuto.TabVisible:=False;
  Ts_ConciliacaoManutPagtos.TabVisible:=False;
  Ts_ConciliacoesManutPagtos.TabVisible:=True;
  PC_PrincipalChange(Self);

  Rb_ConcTodos.Checked:=True;
  Rb_ConcBancoClick(Self);

  If Rb_ConcTodos.Checked Then
   DtEdt_ConcDtaInicio.SetFocus
  Else If Rb_ConcBanco.Checked Then
   EdtConcNumAgencia.SetFocus
  Else If Rb_ConcLoja.Checked Then
   EdtConcCodLoja.SetFocus;

end;

procedure TFrmBancoExtratos.Dbg_LojasBancoEnter(Sender: TObject);
begin
  // Desabilita Mouse No Grid ===================================================
  Application.OnMessage:=DesabilitaScrollMouse;

end;

procedure TFrmBancoExtratos.Dbg_LojasBancoExit(Sender: TObject);
begin
  // Habilita Mouse No Grid ===================================================
  Application.OnMessage:=HabilitaScrollMouse;

end;

procedure TFrmBancoExtratos.PopupMenuPopup(Sender: TObject);
var
  i : Integer;
  item : TMenuItem;
begin
  If Not DMConciliacao.CDS_ConcExtratos.IsEmpty Then
  Begin
    PopupMenu.Items.Clear;
    for i := 1 to 3 do
    begin
      item := TMenuItem.Create(Self);

      If i=1 Then
      Begin
        item.Caption := 'Extratos Conciliados';
        item.OnClick := ConcPopMenuClickSIM;
      End;

      If i=2 Then
      Begin
        item.Caption := 'Extratos N�o Conciliados';
        item.OnClick := ConcPopMenuClickNAO;
      End;

      If i=3 Then
      Begin
        item.Caption := 'Todos os Extratos';
        item.OnClick := ConcPopMenuClick;
      End;
      PopupMenu.Items.Add(item);
    end;
  End; // If Not DMConciliacao.CDS_ConcExtratos.IsEmpty Then
end;

procedure TFrmBancoExtratos.Ts_ConcConciliandoExit(Sender: TObject);
begin
  DMConciliacao.CDS_ConcExtratos.Filter:='';
  DMConciliacao.CDS_ConcExtratos.Filtered:=False;
end;

procedure TFrmBancoExtratos.Dbg_ConcManutExtratoTitleClick(Column: TColumn);
Var
  s, sPesquisa: String;
  b: Boolean;
  i: Integer;
begin
  If Not DMConciliacao.CDS_CMExtratos.IsEmpty Then
  Begin
    i:=DMConciliacao.CDS_CMExtratos.RecNo;
    sPesquisa:='';
    b:=True;
    While b do
    Begin
      s:=DMConciliacao.CDS_CMExtratos.FieldByName(Column.FieldName).DisplayLabel;
      If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Try
           If Column.FieldName='NUM_DOCTO' Then
            sPesquisa:=FormatFloat('000000',StrToInt(sPesquisa));

           If Not DMConciliacao.CDS_CMExtratos.Locate(Column.FieldName, sPesquisa,[]) Then
           Begin
             If Not LocalizaRegistro(DMConciliacao.CDS_CMExtratos, Column.FieldName, sPesquisa) Then
             Begin
               DMConciliacao.CDS_CMExtratos.RecNo:=i;
               msg('N�o Localizado !!','A');
               Exit;
             End;
           End; // If Not DMConciliacao.CDS_CMExtratos.Locate(Column.FieldName, sPesquisa,[]) Then
           Break;

         Except
           msg('Informa��o Inv�lida !!','A');
           Break;
         End;
       End
      Else // If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Break;
       End; // If InputQuery('Localizar: '+s,'',sPesquisa) then
    End; // While b do
  End; // If Not DMConciliacao.CDS_CMExtratos.IsEmpty Then
end;

procedure TFrmBancoExtratos.FormKeyUp(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
//  if Key=44   Then
//   Clipboard.AsText:='';
end;

procedure TFrmBancoExtratos.Bt_CMApresFiltroClick(Sender: TObject);
begin
  // Apresenta Filtros =========================================================
  If Not Ts_ConciliacoesManutPagtos.TabVisible Then
   Exit;
   
  If Bt_CMApresFiltro.Caption='Apresenta Filtro' Then
  Begin
    Pan_ConcSolicitacoes.Parent:=Ts_ConciliacoesManutPagtos;
    Pan_ConcSolicitacoes.Visible:=True;
    Bt_ConcConciliar.Caption:='Busca';
    Bt_CMApresFiltro.Caption:='Retira Filtro';
    DtEdt_ConcDtaInicio.SetFocus;
    Exit;
  End;

  If Bt_CMApresFiltro.Caption='Retira Filtro' Then
  Begin
    Bt_CMApresFiltro.Caption:='Apresenta Filtro';
    Pan_ConcSolicitacoes.Visible:=False;
    Exit;
  End;
end;

procedure TFrmBancoExtratos.Bt_CMDesmarcarClick(Sender: TObject);
Var
  ii, i: Integer;
begin
  If DMConciliacao.CDS_CMExtratos.IsEmpty Then
   Exit;

  If DMConciliacao.CDS_CMPagtos.IsEmpty Then
   Exit;

  Screen.Cursor:=crAppStart;

  // Libera Para Grava��o ====================================================
  LiberaClientGravar(True);

  DMConciliacao.CDS_CMExtratos.DisableControls;
  DMConciliacao.CDS_CMPagtos.DisableControls;

  i:=1;
  DMConciliacao.CDS_CMExtratos.First;
  While not DMConciliacao.CDS_CMExtratos.Eof do
  Begin
    If (DMConciliacao.CDS_CMExtratosConciliar.AsString='SIM') And
       (DMConciliacao.CDS_CMExtratosConciliado.AsString='NAO') And
       (Trim(DMConciliacao.CDS_CMExtratosQUEM.AsString)='') Then
    Begin
      If i=1 Then
       i:=DMConciliacao.CDS_CMExtratos.RecNo;

      DMConciliacao.CDS_CMExtratos.Edit;
      DMConciliacao.CDS_CMExtratosConciliar.AsString:='NAO';
      DMConciliacao.CDS_CMExtratos.Post;
    End;

    DMConciliacao.CDS_CMExtratos.Next;
  End; // While not DMConciliacao.CDS_CMExtratos.Eof do

  ii:=1;
  DMConciliacao.CDS_CMPagtos.First;
  While not DMConciliacao.CDS_CMPagtos.Eof do
  Begin
    If (DMConciliacao.CDS_CMPagtosConciliar.AsString='SIM') And
       (DMConciliacao.CDS_CMPagtosConciliado.AsString='NAO') And
       (Trim(DMConciliacao.CDS_CMPagtosQUEM.AsString)='') Then
    Begin
      If ii=1 Then
       ii:=DMConciliacao.CDS_CMPagtos.RecNo;

      DMConciliacao.CDS_CMPagtos.Edit;
      DMConciliacao.CDS_CMPagtosConciliar.AsString:='NAO';
      DMConciliacao.CDS_CMPagtos.Post;
    End;

    DMConciliacao.CDS_CMPagtos.Next;
  End; // While not DMConciliacao.CDS_CMPagtos.Eof do

  // Retira a Libera�ao Para Grava��o ==========================================
  LiberaClientGravar(False);

  igTotMarcaExt:=0;
  igTotMarcaPag:=0;

  TotaisMarcadosNaoConciliados;

  DMConciliacao.CDS_CMExtratos.EnableControls;
  DMConciliacao.CDS_CMPagtos.EnableControls;

  Screen.Cursor:=crDefault;

  // Posiciona
  DMConciliacao.CDS_CMPagtos.First;
  DMConciliacao.CDS_CMExtratos.First;
  If ii<>0 Then DMConciliacao.CDS_CMPagtos.RecNo:=ii;
  If  i<>0 Then DMConciliacao.CDS_CMExtratos.RecNo:=i;
end;

procedure TFrmBancoExtratos.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // primeiramente verificamos se � o evento a ser tratado...
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

procedure TFrmBancoExtratos.Dbg_ConcManutPagtoEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_ConcManutPagtoEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmBancoExtratos.Dbg_VerifExtratosContasDblClick(Sender: TObject);
begin
  If DMBelShop.CDS_Busca.IsEmpty Then
   Exit;

  Bt_VerifExtratoDtSemMovto.Visible:=False;
  Mem_VerifContas.Lines.Clear;

  DMBelShop.CDS_Busca.Edit;
  If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then
   DMBelShop.CDS_Busca.FieldByName('PROC').AsString:='N�o'
  Else
   DMBelShop.CDS_Busca.FieldByName('PROC').AsString:='SIM';
  DMBelShop.CDS_Busca.Post;

end;

procedure TFrmBancoExtratos.Bt_VerifExtratoOKClick(Sender: TObject);
begin
  Bt_VerifExtratoDtSemMovto.Visible:=False;
  Mem_VerifContas.Lines.Clear;

  Dbg_VerifExtratosContas.SetFocus;

  DMBelShop.CDS_Busca.First;
  While not DMBelShop.CDS_Busca.Eof do
  Begin
    Dbg_VerifExtratosContasDblClick(Self);

    DMBelShop.CDS_Busca.Next;
  End; // While not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.First;

end;

procedure TFrmBancoExtratos.Dbg_VerifExtratosContasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' then
     Dbg_VerifExtratosContas.Canvas.Brush.Color:=clSkyBlue
    Else
     Dbg_VerifExtratosContas.Canvas.Brush.Color:=$00EAEAFF;

    Dbg_VerifExtratosContas.Canvas.FillRect(Rect);
    Dbg_VerifExtratosContas.DefaultDrawDataCell(Rect,Column.Field,state);
  End;

end;

procedure TFrmBancoExtratos.Bt_VerifExtratoVerificarClick(Sender: TObject);
Var
  MySql: string;
  dDtaInicio, dDtaFim: TDate;
  i: Integer;
  bFeriado: Boolean;
begin
  Bt_VerifExtratoDtSemMovto.Visible:=False;
  Mem_VerifContas.Lines.Clear;
  Mem_VerifContas.Lines.Add('');
  Mem_VerifContas.Lines.Add('');
  Mem_VerifContas.Lines.Add('');
  Mem_VerifContas.Lines.Add('');

  Dbg_VerifExtratosContas.SetFocus;

  Try
    StrToDate(DtEdt_VerifExtratoDtaInicio.Text);
  Except
    msg('Data Inicial do Per�odo Inv�lida !!','A');
    DtEdt_VerifExtratoDtaInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_VerifExtratoDtaFim.Text);
  Except
    msg('Data Final do Per�odo Inv�lida !!','A');
    DtEdt_VerifExtratoDtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_VerifExtratoDtaFim.Date<DtEdt_VerifExtratoDtaInicio.Date Then
  Begin
    msg('Per�odo Inv�lido !!','A');
    DtEdt_VerifExtratoDtaInicio.SetFocus;
    Exit;
  End;

  If StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)))<=DtEdt_VerifExtratoDtaInicio.Date Then
  Begin
    msg('Data In�cio do Per�odo Inv�lida !!'+cr+cr+'Maior ou Igual a Hoje !!','A');
    DtEdt_VerifExtratoDtaInicio.SetFocus;
    Exit;
  End;

  If StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)))<=DtEdt_VerifExtratoDtaFim.Date Then
  Begin
    msg('Data Final do Per�odo Inv�lida !!'+cr+cr+'Maior ou Igual a Hoje !!','A');
    DtEdt_VerifExtratoDtaFim.SetFocus;
    Exit;
  End;


  OdirPanApres.Caption:='AGUARDE !! Verificando Dias Sem Extrato Banc�rio...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBancoExtratos.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBancoExtratos.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Visible:=True;
  Refresh;

  FrmBelShop.MontaProgressBar(True, FrmBancoExtratos);
  pgProgBar.Position:=DMBelShop.CDS_Busca.RecordCount;

  DMBelShop.CDS_Busca.First;
  While not DMBelShop.CDS_Busca.Eof do
  Begin
    i:=0;
    pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;
    Refresh;

    dDtaInicio:=DtEdt_VerifExtratoDtaInicio.Date;
    dDtaFim   :=DtEdt_VerifExtratoDtaFim.Date;

    If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' then
    Begin
      While dDtaInicio<=dDtaFim do
      Begin
         MySql:=' Select f.Dta_Feriado'+
                ' From FIN_FERIADOS_ANO f'+
                ' Where f.Ind_Ativo=''SIM'''+
                ' And f.Dta_Feriado='+QuotedStr(f_Troca('-','.',f_Troca('/','.',DateToStr(dDtaInicio))));
         DMBelShop.CDS_BuscaRapida.Close;
         DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
         DMBelShop.CDS_BuscaRapida.Open;

         bFeriado:=False;
         If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Feriado').AsString)<>'' Then
          bFeriado:=True;

        If (DiaSemanaAbrev(dDtaInicio)<>'Dom') And (DiaSemanaAbrev(dDtaInicio)<>'Sab') And (Not bFeriado) Then
        Begin
          MySql:=' SELECT e.cod_banco'+
                 ' FROM fin_bancos_extratos e'+
                 ' WHERE e.cod_banco='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Banco').AsString)+
                 ' AND   e.num_seq=999999'+
                 ' AND   e.dta_extrato='+QuotedStr(f_Troca('-','.',f_Troca('/','.',DateToStr(dDtaInicio))));
          DMBelShop.CDS_BuscaRapida.Close;
          DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
          DMBelShop.CDS_BuscaRapida.Open;

          If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Banco').AsString)='' Then
          Begin
            If i=0 Then
            Begin
              Bt_VerifExtratoDtSemMovto.Visible:=True;
              Mem_VerifContas.Lines.Add('');
              Mem_VerifContas.Lines.Add(DMBelShop.CDS_Busca.FieldByName('Num_Banco').AsString+' - '+
                                        DMBelShop.CDS_Busca.FieldByName('Des_Banco').AsString+' - '+
                                        DMBelShop.CDS_Busca.FieldByName('Num_Agencia').AsString+' - '+
                                        DMBelShop.CDS_Busca.FieldByName('Des_Agencia').AsString+' - '+
                                        DMBelShop.CDS_Busca.FieldByName('Num_Conta').AsString);
            End; // If i=0 Then
            Mem_VerifContas.Lines.Add('              '+DateToStr(dDtaInicio));

            Inc(i);
          End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Banco').AsString)='' Then
          DMBelShop.CDS_BuscaRapida.Close;

        End; // If (DiaSemanaAbrev(dDtaInicio)<>'Dom') And (DiaSemanaAbrev(dDtaInicio)<>'Sab') And (Not bFeriado) Then

        dDtaInicio:=dDtaInicio+1;
      End; // While dDtaInicio<=dDtaFim do
    End; // if DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' then

    DMBelShop.CDS_Busca.Next;
  End; // While not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.First;

  OdirPanApres.Visible:=False;
  FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);

  msg('Verifica��o Efetuada com SUCESSO !!','A');

  Mem_VerifContas.SetFocus;

end;

procedure TFrmBancoExtratos.Bt_VerifExtratoDtSemMovtoClick(Sender: TObject);
begin
  If Mem_VerifContas.Lines.Count<1 Then
   Exit;

  Dbg_VerifExtratosContas.SetFocus;

  If msg('Deseja Realmente CRIAR Dias'+cr+'SEM EXTRATOS para o Per�odo de '+cr+DtEdt_VerifExtratoDtaInicio.Text+' a '+DtEdt_VerifExtratoDtaFim.Text+' ??','C')=2 Then
   Exit;

  Try
    StrToDate(DtEdt_VerifExtratoDtaInicio.Text);
  Except
    msg('Data Inicial do Per�odo Inv�lida !!','A');
    DtEdt_VerifExtratoDtaInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_VerifExtratoDtaFim.Text);
  Except
    msg('Data Final do Per�odo Inv�lida !!','A');
    DtEdt_VerifExtratoDtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_VerifExtratoDtaFim.Date<DtEdt_VerifExtratoDtaInicio.Date Then
  Begin
    msg('Per�odo Inv�lido !!','A');
    DtEdt_VerifExtratoDtaInicio.SetFocus;
    Exit;
  End;

  If StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)))<=DtEdt_VerifExtratoDtaInicio.Date Then
  Begin
    msg('Data In�cio do Per�odo Inv�lida !!'+cr+cr+'Maior ou Igual a Hoje !!','A');
    DtEdt_VerifExtratoDtaInicio.SetFocus;
    Exit;
  End;

  If StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)))<=DtEdt_VerifExtratoDtaFim.Date Then
  Begin
    msg('Data Final do Per�odo Inv�lida !!'+cr+cr+'Maior ou Igual a Hoje !!','A');
    DtEdt_VerifExtratoDtaFim.SetFocus;
    Exit;
  End;

  // Cria Dias sem Extrato =====================================================
  CriaDiasSemExtrato
end;

procedure TFrmBancoExtratos.DtEdt_VerifExtratoDtaInicioPropertiesChange(Sender: TObject);
begin
  Bt_VerifExtratoDtSemMovto.Visible:=False;
  Mem_VerifContas.Lines.Clear;

end;

procedure TFrmBancoExtratos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
// OdirApagar - 09/11/2017
//  if bgSairBancos Then
//   Begin
//     Action := caHide;
//   End
//  Else
//   Begin
//     msg('Para Fechar Tecle no Bot�o <Sair>...','A');
//     Action := caNone;
//   End;

{
Valor       Significado
canone      A forma n�o � permitido para fechar, ent�o nada acontece.
caHide      O formul�rio n�o est� fechado, mas apenas escondido.  O aplicativo ainda pode acessar um formul�rio oculto.
caFree      O formul�rio est� fechada e toda a mem�ria alocada para a forma � liberada.
caMinimize  A forma � minimizado, em vez de fechado.  Esta � a a��o padr�o para formul�rios filho MDI.
 }

end;

procedure TFrmBancoExtratos.Bt_CMPeriodoDepClick(Sender: TObject);
Var
  MySql: String;
  sParametros: String;
  bAtualizaLinx: Boolean;
  s, ss: String;
begin
  Dbg_ConcManutExtratoDep.SetFocus;

  bgSiga:=True;
  FrmPeriodoApropriacao:=TFrmPeriodoApropriacao.Create(Self);
  FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Text:=
                      DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
  FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Text   :=
                      DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

  FrmPeriodoApropriacao.ShowModal;
  sgDtaI:=DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date);
  sgDtaF:=DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date);
  s :=sgDtaI;
  ss:=sgDtaF;

  FreeAndNil(FrmPeriodoApropriacao);

  // Limpa Totalizadores =======================================================
  EdtConcManutExtratoQtdDep.Value:=0;
  EdtConcManutExtratoVlrDep.Value:=0;
  EdtConcManutDepQtd.Value:=0;
  EdtConcManutDepVlr.Value:=0;
  EdtConcManutExtDepDif.Value:=0;

  igTotMarcaExt:=0;
  igTotMarcaPag:=0;

  // Verifica se Prossegue Processamento =======================================
  If Not bgSiga Then
   Exit;

  DMConciliacao.CDS_CMExtratosDep.Close;
  DMConciliacao.CDS_CMDepositos.Close;

  // Acerta Data para Separador <.> Ponto ======================================
  sgDtaI:=f_Troca('/','.',f_Troca('-','.',sgDtaI));
  sgDtaF:=f_Troca('/','.',f_Troca('-','.',sgDtaF));

  // Busca Extratos e Movimentos de Depositos ==================================
  If Not BuscaMovtosExtratosDepositos(True) Then
   Exit;

  // Retorna da Formato Normal =================================================
  sgDtaI:=s;
  sgDtaF:=ss;

  //============================================================================
  // Busca Movtos de Sangria e Suprimento de Caixa no Linx (Cloud) =============
  //============================================================================
  PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
  bAtualizaLinx:=False;
  if msg('ATUALIZAR Dados do Linx (Nuvem) no'+cr+'Per�odo Abaixo ??'+cr+cr+sgDtaI+' a '+sgDtaF, 'C')=1 Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    if msg('Deseja Realmente ATUALIZAR'+cr+cr+'Dados do Linx (Nuvem) ??', 'C')=1 Then
     bAtualizaLinx:=True;
  End; // if msg('ATUALIZAR Dados do Linx (Nuvem) no'+cr+'Per�odo Abaixo ??'+cr+cr+sgDtaI+' a '+sgDtaF, 'C')=1 Then

  If bAtualizaLinx Then
  Begin
    OdirPanApres.Caption:='AGUARDE !! Atualizando Sangrias de Caixa LINX - CLOUD';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBancoExtratos.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBancoExtratos.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmBancoExtratos;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;

    // Busca Lojas Linx ==========================================================
    MySql:=' SELECT em.cod_linx'+
           ' FROM EMP_CONEXOES em'+
           ' WHERE em.cod_linx<>0'+
           ' AND   em.ind_ativo=''SIM'''+
           ' ORDER BY 1';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    FrmBelShop.MontaProgressBar(True, FrmBancoExtratos);
    pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
    pgProgBar.Position:=0;

    DMBelShop.CDS_Busca.DisableControls;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      OdirPanApres.Caption:='AGUARDE !! Atualizando Sangrias de Caixa (LINX - CLOUD) Loja: '+DMBelShop.CDS_Busca.FieldByName('Cod_Linx').AsString;
      Application.ProcessMessages;

      sParametros:=sgPastaWebService+'PWebServiceLinx.exe LinxSangriaSuprimentos'; // Excutavel e Metodo a Processar
      sParametros:=sParametros+' '+DMBelShop.CDS_Busca.FieldByName('Cod_Linx').AsString; // Codigo da Loja a Processar
      sParametros:=sParametros+' "'+IncludeTrailingPathDelimiter(sgPastaWebService+'Metodos')+'"'; // Pasta dos Metodos
      sParametros:=sParametros+' "'+IncludeTrailingPathDelimiter(sgPastaWebService+'Retornos')+'"'; // Pasta dos Retornos
      sParametros:=sParametros+' "'+sgDtaI+'"'; // Data Inicial
      sParametros:=sParametros+' "'+sgDtaF+'"'; // Data Final

      // Envia Parametro e Aguarda Termino do Processo =============================
      CreateProcessSimple(sParametros);

      pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.EnableControls;
    DMBelShop.CDS_Busca.Close;
    FrmBelShop.MontaProgressBar(False, FrmBancoExtratos);
  End; // If bAtualizaLinx Then
  // Busca Movtos de Sangria e Suprimento de Caixa no Linx (Cloud) =============
  //============================================================================

  // Insere Novos Depositos se Buscou Dados no Linx ============================
  If bAtualizaLinx Then
  Begin
    If Not AtualizaMovtosDepositos Then
     Exit;
  End; // If bAtualizaLinx Then

  // Acerta Data para Separador <.> Ponto ======================================
  sgDtaI:=f_Troca('/','.',f_Troca('-','.',sgDtaI));
  sgDtaF:=f_Troca('/','.',f_Troca('-','.',sgDtaF));

  // Limpa Totalizadores =======================================================
  EdtConcManutExtratoQtdDep.Value:=0;
  EdtConcManutExtratoVlrDep.Value:=0;
  EdtConcManutDepQtd.Value:=0;
  EdtConcManutDepVlr.Value:=0;
  EdtConcManutExtDepDif.Value:=0;

  igTotMarcaExt:=0;
  igTotMarcaPag:=0;

  // Elimina Movots Marcados como Conciliados Mas SEM Concilia��o ==============
  EliminarConciliacaoError;

  // Busca Extratos e Movimentos de Depositos ==================================
  If Not BuscaMovtosExtratosDepositos() Then
   Exit;

end;

procedure TFrmBancoExtratos.Dbg_ConcManutExtratoDepDblClick(Sender: TObject);
Var
  bExcPagto, bConcRetira: Boolean;
  iRecNo, i: Integer;
  MySql: String;

  sObsNaoConc,
  sNumSeq, sNumCompl, sChvExtrato: String;
begin

  If (DMConciliacao.CDS_CMExtratosDep.IsEmpty) or (Not DMConciliacao.CDS_CMExtratosDep.Active) Then
   Exit;

  // N�o Altera Sem Permiss�o ao Usu�rios ======================================
  If Not Bt_CMConciliar.Visible Then
   Exit;

  iRecNo:=0;
  bConcRetira:=False;
  bExcPagto:=False;

  sNumCompl  :=DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
  sNumSeq    :=DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString;
  sChvExtrato:=DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString;

  // Verifica se j� esta Conciliado ============================================
  // Conciliado Pelo Sistema
  If DMConciliacao.CDS_CMExtratosDepQUEM.AsString='SIS' Then
  Begin
    If msg('Conciliado Pelo Sistema !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
     Begin
       Exit;
     End
    Else
     Begin
       {
       // Se Conciliado Pelo Sistema por Hist�rioco Autom�tico
       bExcPagto:=False;
       MySql:=' SELECT p.Num_Seq, p.Num_Compl'+
              ' From FIN_CONCILIACAO_DEPOSITOS p'+
              ' WHERE p.chv_extrato='+QuotedStr(DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString);
       DMBelShop.CDS_BuscaRapida.Close;
       DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
       DMBelShop.CDS_BuscaRapida.Open;
       sNumSeq    :=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString;
       sNumCompl  :=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
       DMBelShop.CDS_BuscaRapida.Close;

       If DMConciliacao.CDS_CMDepositos.Locate('Num_Seq;Num_Compl',VarArrayOf([sNumSeq, sNumCompl]),[]) Then
       Begin
         If Copy(DMConciliacao.CDS_CMDepositosCOD_FORNECEDOR.AsString,1,1)='*' Then
         Begin
           If msg('Concilia��o Hist�rico Autom�tico !!'+cr+'O Movto Pagamento Ser� Exclu�do !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
           Begin
             Exit;
           End;
           iRecNo:=DMConciliacao.CDS_CMDepositos.RecNo;
           bExcPagto:=True;
         End; // If Copy(DMConciliacao.CDS_CMDepositosCOD_FORNECEDOR.AsString)='*' Then
       End; // If DMConciliacao.CDS_CMDepositos.Locate('Num_Seq;Num_Compl',VarArrayOf([sNumSeq, sNumCompl]),[]) Then
       }
       bConcRetira:=True;
     End;
  End; // If DMConciliacao.CDS_CMExtratosDepQUEM.AsString='SIS' Then

  If DMConciliacao.CDS_CMExtratosDepQUEM.AsString='USU' Then
  Begin
    if msg('Conciliado Pelo Usu�rio !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
     Begin
       Exit;
     End
    Else
     Begin
       bConcRetira:=True;
       {
       If DMConciliacao.CDS_CMExtratosDepTIP_CONCILIACAO.AsString='SExt' Then
        bExcPagto:=True;
       }
     End;
  End; // If DMConciliacao.CDS_CMExtratosDepQUEM.AsString='SIS' Then

  // Verifica se Pode Conciliar ================================================
  i:=1;
  If DMConciliacao.CDS_CMExtratosDepConciliar.AsString='SIM' Then
   i:=-1;

  If Not PodeConciliarDepositos(i,0) Then
  Begin
    igTotMarcaExt:=igTotMarcaExt-1;

    ShowMessage('Imposs�vel Conciliar !!'+cr+cr+'A Concilia��o deve ser:'+cr+cr+
                '1(UM) Marcado para 1(UM) ou DIVERSOS Marcados !!');
    Exit;
  End;

  // Retira Concilia��o ========================================================
  If bConcRetira Then
  Begin
    // Verificva se Transa��o esta Ativa
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

      // Busca Chave do Extrato, Num_Seq e Num_Compl ===========================
      MySql:=' SELECT p.Chv_Extrato, p.Num_Seq, p.Num_Compl'+
             ' From FIN_CONCILIACAO_DEPOSITOS p'+
             ' WHERE p.chv_extrato='+QuotedStr(DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString);
      DMBelShop.CDS_Busca.Close;
      DMBelShop.SDS_Busca.CommandText:=MySql;
      DMBelShop.CDS_Busca.Open;

      // Busca Observa��o de Nao Conciliado ====================================
      MySql:=' SELECT md.cod_linx, md.dta_docto'+
             ' FROM FIN_CONCILIACAO_MOV_DEP md'+
             ' WHERE md.num_seq='+DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString+
             ' AND   md.num_compl='+DMBelShop.CDS_Busca.FieldByName('Num_Compl').AsString;
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      MySql:=' SELECT Trim(m.obs_nao_conc) obs_nao_conc'+
             ' From FIN_CONCILIACAO_MOV_DEP m'+
             ' WHERE m.Ind_Conciliacao=''NAO'''+
             ' AND   TRIM(COALESCE(m.obs_nao_conc,''''))<>'''''+
             ' AND   m.Cod_Linx='+DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Linx').AsString+
             ' AND   m.dta_Docto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Docto').AsString)));
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      sObsNaoConc:='';
      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Obs_Nao_Conc').AsString)<>'' Then
       sObsNaoConc:=DMBelShop.CDS_BuscaRapida.FieldByName('Obs_Nao_Conc').AsString;
      DMBelShop.CDS_BuscaRapida.Close;

      // Acerta FIN_CONCILIACAO_DEPOSITOS ======================================
      While Not DMBelShop.CDS_Busca.Eof do
      Begin
        If Trim(DMConciliacao.CDS_CMExtratosDepTIP_CONCILIACAO.AsString)='' Then
         Begin
           MySql:=' SELECT p.Chv_Extrato, p.Num_Seq, p.Num_Compl'+
                  ' From FIN_CONCILIACAO_DEPOSITOS p'+
                  ' WHERE p.num_seq='+DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString+
                  ' AND   p.num_compl='+DMBelShop.CDS_Busca.FieldByName('Num_Compl').AsString;
           DMBelShop.CDS_BuscaRapida.Close;
           DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
           DMBelShop.CDS_BuscaRapida.Open;
         End
        Else
         Begin
           MySql:=' SELECT p.Chv_Extrato, p.Num_Seq, p.Num_Compl'+
                  ' From FIN_CONCILIACAO_DEPOSITOS p'+
                  ' WHERE p.chv_extrato='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Chv_Extrato').AsString);
           DMBelShop.CDS_BuscaRapida.Close;
           DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
           DMBelShop.CDS_BuscaRapida.Open;
         End; // If Trim(DMConciliacao.CDS_CMExtratosDepTIP_CONCILIACAO.AsString)='' Then

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          If Not bExcPagto Then
           Begin
             // Atualiza Movto Pagto
             MySql:=' UPDATE FIN_CONCILIACAO_MOV_DEP m'+
                    ' SET m.ind_conciliacao='+QuotedStr('NAO')+
                    ', m.obs_nao_conc='+QuotedStr(sObsNaoConc)+
                    ' WHERE m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString+
                    ' AND   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString;
             DMBelShop.SQLC.Execute(MySql,nil,nil);
           End
          Else
           Begin
             // Exclui Movto Pagto Hist�rico Autom�tico
             MySql:=' DELETE FROM FIN_CONCILIACAO_MOV_DEP m'+
                    ' WHERE m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString+
                    ' AND   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString;
             DMBelShop.SQLC.Execute(MySql,nil,nil);
           End; // If Not bExcPagto Then

          MySql:=' DELETE FROM FIN_CONCILIACAO_DEPOSITOS p'+
                 ' WHERE p.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString+
                 ' AND   p.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString+
                 ' AND   p.Chv_Extrato='+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Chv_Extrato').AsString);
          DMBelShop.SQLC.Execute(MySql,nil,nil);

          sNumCompl  :=DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString;
          sNumSeq    :=DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString;
          sChvExtrato:=DMBelShop.CDS_BuscaRapida.FieldByName('Chv_Extrato').AsString;

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
        DMBelShop.CDS_BuscaRapida.Close;

        DMBelShop.CDS_Busca.Next;
      End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
      DMBelShop.CDS_Busca.Close;

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      DMConciliacao.CDS_CMDepositos.Close;
      DMConciliacao.CDS_CMDepositos.Open;

      DMConciliacao.CDS_CMExtratosDep.Close;
      DMConciliacao.CDS_CMExtratosDep.Open;

      If iRecNo=0 Then
       DMConciliacao.CDS_CMDepositos.Locate('NUM_SEQ;NUM_COMPL',VarArrayOf([sNumSeq,sNumCompl]),[])
      Else
       DMConciliacao.CDS_CMDepositos.RecNo:=iRecNo;

      DMConciliacao.CDS_CMExtratosDep.Locate('CHV_EXTRATO', sChvExtrato,[]);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
      Exit;
    Except
      on e : Exception do
      Begin
        HabilitaBotoesDep(True);

        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        exit;
      End; // on e : Exception do
    End; // Try
  End; // If bConcRetira Then

  // Libera Para Grava��o ======================================================
  LiberaClientGravarDep(True);

  // Marca/DesMarca Concilia��o ================================================
  DMConciliacao.CDS_CMExtratosDep.Edit;
  If DMConciliacao.CDS_CMExtratosDepConciliar.AsString='SIM' Then
   Begin
    DMConciliacao.CDS_CMExtratosDepConciliar.AsString:='NAO';
    If bConcRetira Then
    Begin
      DMConciliacao.CDS_CMExtratosDepCOD_USUARIO.AsString:=EmptyStr;
      DMConciliacao.CDS_CMExtratosDepConciliado.AsString:='NAO';
      DMConciliacao.CDS_CMExtratosDepQUEM.AsString:=EmptyStr;
      DMConciliacao.CDS_CMExtratosDepTIP_CONCILIACAO.AsString:=EmptyStr;
      DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString:=EmptyStr;
    End;
   End
  Else // If DMConciliacao.CDS_CMExtratosDepConciliar.AsString='SIM' Then
   Begin
     DMConciliacao.CDS_CMExtratosDepConciliar.AsString:='SIM';
   End; // If DMConciliacao.CDS_CMExtratosDepConciliar.AsString='SIM' Then
  DMConciliacao.CDS_CMExtratosDep.Post;

  // Retira a Libera�ao Para Grava��o ==========================================
  LiberaClientGravarDep(False);

  TotaisMarcadosNaoConciliadosDep;
end;

procedure TFrmBancoExtratos.Rb_ConcConciliadosDepClick(Sender: TObject);
begin

  If (not DMConciliacao.CDS_CMExtratosDep.Active) Or (not DMConciliacao.CDS_CMDepositos.Active) Then
  Begin
    Exit;
  End;

  Dbg_ConcManutExtratoDep.SetFocus;

  AcertaRb_Style(Rb_ConcConciliadosDep);
  AcertaRb_Style(Rb_ConcNaoConciliadosDep);
  AcertaRb_Style(Rb_ConcAmbosDep);

  If Rb_ConcConciliadosDep.Checked Then
  Begin
    DMConciliacao.CDS_CMExtratosDep.Filtered:=False;
    DMConciliacao.CDS_CMExtratosDep.Filter:='QUEM is Not null';
    DMConciliacao.CDS_CMExtratosDep.Filtered:=True;

    DMConciliacao.CDS_CMDepositos.Filtered:=False;
    DMConciliacao.CDS_CMDepositos.Filter:='QUEM is Not null';
    DMConciliacao.CDS_CMDepositos.Filtered:=True;
  End;

  If Rb_ConcNaoConciliadosDep.Checked Then
  Begin
    DMConciliacao.CDS_CMExtratosDep.Filtered:=False;
    DMConciliacao.CDS_CMExtratosDep.Filter:='QUEM is null';
    DMConciliacao.CDS_CMExtratosDep.Filtered:=True;

    DMConciliacao.CDS_CMDepositos.Filtered:=False;
    DMConciliacao.CDS_CMDepositos.Filter:='QUEM is null';
    DMConciliacao.CDS_CMDepositos.Filtered:=True;
  End;

  If Rb_ConcAmbosDep.Checked Then
  Begin
    DMConciliacao.CDS_CMExtratosDep.Filtered:=False;
    DMConciliacao.CDS_CMExtratosDep.Filter:='';

    DMConciliacao.CDS_CMDepositos.Filtered:=False;
    DMConciliacao.CDS_CMDepositos.Filter:='';
  End;

  TotaisMarcadosNaoConciliadosDep;
end;

procedure TFrmBancoExtratos.Dbg_ConcManutExtratoDepDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMConciliacao.CDS_CMExtratosDepQUEM.AsString='SIS' then
     Dbg_ConcManutExtratoDep.Canvas.Brush.Color:=clLime;

    if DMConciliacao.CDS_CMExtratosDepQUEM.AsString='USU' then
     Dbg_ConcManutExtratoDep.Canvas.Brush.Color:=$00BBBBFF;

    if (DMConciliacao.CDS_CMExtratosDepQUEM.AsString='USU') And (DMConciliacao.CDS_CMExtratosTIP_CONCILIACAO.AsString='SExt') then
    Begin
      Dbg_ConcManutExtratoDep.Canvas.Brush.Color:=$00FF75BA;
      Dbg_ConcManutExtratoDep.Canvas.Font.Color:=clWhite; // Cor da Fonte
    End;

    if (Trim(DMConciliacao.CDS_CMExtratosDepQUEM.AsString)='') And (DMConciliacao.CDS_CMExtratosDepConciliar.AsString='SIM') then
     Dbg_ConcManutExtratoDep.Canvas.Brush.Color:=clYellow;

    Dbg_ConcManutExtratoDep.Canvas.FillRect(Rect);
    Dbg_ConcManutExtratoDep.DefaultDrawDataCell(Rect,Column.Field,state);

    DMConciliacao.CDS_CMExtratosDepQUEM.Alignment:=taCenter;
    DMConciliacao.CDS_CMExtratosDepConciliado.Alignment:=taCenter;
    DMConciliacao.CDS_CMExtratosDepNUM_CONTA.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.Alignment:=taLeftJustify;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmBancoExtratos.Dbg_ConcManutExtratoDepEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_ConcManutExtratoDepEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmBancoExtratos.Dbg_ConcManutExtratoDepKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  b: Boolean;
  sValor: String;
begin                                   
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

   // Busca Valor ===============================================================
  If Key=Vk_F4 Then
  Begin
    If Not DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
    Begin
      sValor:='';
      b:=True;
      While b do
      Begin
        If InputQuery('Valor a Localizar','',sValor) then
         Begin
           Try
             StrToCurr(sValor);
             If Not DMConciliacao.CDS_CMExtratosDep.Locate('VLR_DOCTO',sValor,[]) Then
             Begin
               msg('Valor N�o Localizado !!','A');
               Exit;
             End;
             Break;
           Except
             msg('Valor Inv�lido !!','A');
             Break;
           End;
         End
        Else // If InputQuery('Valor a Localizar','',sValor) then
         Begin
           Break;
         End; // If InputQuery('Valor a Localizar','',sValor) then
      End; // While b do
    End; // If Not DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
  End; // If Key=Vk_F4 Then

  // Apresenta Concilia��o =====================================================
  If Key=Vk_F6 Then
  Begin
    If Not DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
    Begin
      If DMConciliacao.CDS_CMExtratosDepConciliado.AsString='SIM' Then
       Begin
         OdirPanApres.Caption:='AGUARDE !! Localizando Concilia��o...';
         OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
         OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBancoExtratos.Width-OdirPanApres.Width)/2));
         OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBancoExtratos.Height-OdirPanApres.Height)/2))-20;
         OdirPanApres.Visible:=True;
         Refresh;

         FrmApresConciliacao:=TFrmApresConciliacao.Create(Self);

         FrmApresConciliacao.Dbg_ConcManutPagto.DataSource:=DMConciliacao.DS_CMApresDepositos;
         FrmApresConciliacao.Dbe_ConcManutTotal.DataSource:=DMConciliacao.DS_CMApresDepositos;

         DMConciliacao.CDS_CMApresDepositos.Close;
         DMConciliacao.SDS_CMApresDepositos.Params.ParamByName('CHV_EXTRATO').AsString:=
                                  DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString;
         DMConciliacao.CDS_CMApresDepositos.Open;

         OdirPanApres.Visible:=False;
         If DMConciliacao.CDS_CMApresDepositos.IsEmpty Then
         Begin
           DMConciliacao.CDS_CMApresDepositos.Close;
           FreeAndNil(FrmApresConciliacao);
           Exit;
         End; // DMConciliacao.CDS_CMApresDepositos.Close;

         DMConciliacao.sgDta1:=sgDtaI;
         DMConciliacao.sgDta2:=sgDtaF;
         FrmApresConciliacao.Gb_ConcManutExtrato.Visible:=False;
         FrmApresConciliacao.Gb_ConcManutPagtos.Align:=alClient;

         FrmApresConciliacao.ShowModal;

         FreeAndNil(FrmApresConciliacao);
       End
      Else // If DMConciliacao.CDS_CMExtratosDepConciliado.AsString='SIM' Then
       Begin
         msg('Extrato N�o Conciliado !!','A')
       End;  // If DMConciliacao.CDS_CMExtratosDepConciliado.AsString='SIM' Then
    End; // If Not DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
  End; // If Key=Vk_F6 Then
end;

procedure TFrmBancoExtratos.Dbg_ConcManutExtratoDepTitleClick(Column: TColumn);
Var
  s, sPesquisa: String;
  b: Boolean;
  i: Integer;
begin

  If Not DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
  Begin
    i:=DMConciliacao.CDS_CMExtratosDep.RecNo;
    sPesquisa:='';
    b:=True;
    While b do
    Begin
      s:=DMConciliacao.CDS_CMExtratosDep.FieldByName(Column.FieldName).DisplayLabel;
      If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Try
           If Column.FieldName='NUM_DOCTO' Then
            sPesquisa:=FormatFloat('000000',StrToInt(sPesquisa));

           If Not DMConciliacao.CDS_CMExtratosDep.Locate(Column.FieldName, sPesquisa,[]) Then
           Begin
             If Not LocalizaRegistro(DMConciliacao.CDS_CMExtratosDep, Column.FieldName, sPesquisa) Then
             Begin
               DMConciliacao.CDS_CMExtratosDep.RecNo:=i;
               msg('N�o Localizado !!','A');
               Exit;
             End;
           End; // If Not DMConciliacao.CDS_CMExtratosDep.Locate(Column.FieldName, sPesquisa,[]) Then
           Break;
         Except
           msg('Informa��o Inv�lida !!','A');
           Break;
         End;
       End
      Else // If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Break;
       End; // If InputQuery('Localizar: '+s,'',sPesquisa) then
    End; // While b do
  End; // If Not DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
end;

procedure TFrmBancoExtratos.Dbg_ConcManutDepositosDblClick(Sender: TObject);
Var
  bExcPagto, bConcRetira: Boolean;
  iRecNo, i: Integer;
  MySql: String;

  sObsNaoConc,
  sNumSeq, sNumCompl, sChvExtrato: String;
begin

  If (DMConciliacao.CDS_CMDepositos.IsEmpty) or (Not DMConciliacao.CDS_CMDepositos.Active) Then
   Exit;

  // N�o Altera Sem Permiss�o ao Usu�rios ======================================
  If Not Bt_CMConciliarDep.Visible Then
   Exit;

  iRecNo:=0;
  bConcRetira:=False;
  bExcPagto:=False;

  sNumCompl  :=DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
  sNumSeq    :=DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString;
  sChvExtrato:=DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString;

  // Verifica se j� esta Conciliado ============================================
  If DMConciliacao.CDS_CMDepositosQUEM.AsString='SIS' Then
  Begin
     If msg('Conciliado Pelo Sistema !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
     Begin
       Exit;
     End
    Else
     Begin
       {
       If Copy(DMConciliacao.CDS_CMDepositosCOD_FORNECEDOR.AsString,1,1)='*' Then
       Begin
         If msg('Concilia��o Hist�rico Autom�tico !!'+cr+'O Movto Pagamento Ser� Exclu�do !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
         Begin
           Exit;
         End;
         iRecNo:=DMConciliacao.CDS_CMDepositos.RecNo;
         bExcPagto:=True;
       End; // If Copy(DMConciliacao.CDS_CMDepositosCOD_FORNECEDOR.AsString)='*' Then
       }
       bConcRetira:=True;
     End;
  End; // If DMConciliacao.CDS_CMDepositosQUEM.AsString='SIS' Then

  // Verifica se j� esta Conciliado Somente por Extrato ========================
  {
  If (DMConciliacao.CDS_CMDepositosQUEM.AsString='USU') And (DMConciliacao.CDS_CMDepositosTIP_CONCILIACAO.AsString='SExt') Then
  Begin
    If msg('Concilia��o Somente por Extrato !!'+cr+'O Movto Pagamento Ser� Exclu�do !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
    Begin
      Exit;
    End;
    iRecNo:=DMConciliacao.CDS_CMDepositos.RecNo;
    bExcPagto:=True;

    bConcRetira:=True;
  End; // If DMConciliacao.CDS_CMDepositosQUEM.AsString='SEx' Then
  }

  If (DMConciliacao.CDS_CMDepositosQUEM.AsString='USU') And (DMConciliacao.CDS_CMDepositosTIP_CONCILIACAO.AsString<>'SExt') Then
  Begin
     If msg('Conciliado Pelo Usu�rio !!'+cr+cr+'Deseja Retira a Concilia��o ?','C')=2 Then
     Begin
       Exit;
     End
    Else
     Begin
       bConcRetira:=True;
     End;
  End; // If DMConciliacao.CDS_CMDepositosQUEM.AsString='USU' Then

  // Verifica se Pode Conciliar ================================================
  i:=1;
  If DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM' Then
   i:=-1;

  If Not PodeConciliarDepositos(0,i) Then
  Begin
    igTotMarcaPag:=igTotMarcaPag-1;

    ShowMessage('Imposs�vel Conciliar !!'+cr+cr+'A Concilia��o deve ser:'+cr+cr+
                '1(UM) Marcado para 1(UM) ou DIVERSOS Marcados !!');
    Exit;
  End;

  // Retira Concilia��o ========================================================
  If bConcRetira Then
  Begin
    // Verificva se Transa��o esta Ativa
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

      // Busca Observa��o de Nao Conciliado ====================================
      MySql:=' SELECT Trim(m.obs_nao_conc) obs_nao_conc'+
             ' From FIN_CONCILIACAO_MOV_DEP m'+
             ' WHERE m.Ind_Conciliacao=''NAO'''+
             ' AND   TRIM(COALESCE(m.obs_nao_conc,''''))<>'''''+
             ' AND   m.Cod_Linx='+Copy(DMConciliacao.CDS_CMDepositosCOD_LOJA.AsString,5,3)+
             ' AND   m.dta_Docto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DMConciliacao.CDS_CMDepositosDTA_DOCTO.AsString)));
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      sObsNaoConc:='';
      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Obs_Nao_Conc').AsString)<>'' Then
       sObsNaoConc:=DMBelShop.CDS_BuscaRapida.FieldByName('Obs_Nao_Conc').AsString;
      DMBelShop.CDS_BuscaRapida.Close;

      // Busca Chave do Extrato ================================================
      MySql:=' SELECT p.Chv_Extrato'+
             ' From FIN_CONCILIACAO_DEPOSITOS p'+
             ' WHERE p.num_seq='+DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString+
             ' AND   p.num_compl='+DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
      DMBelShop.CDS_Busca.Close;
      DMBelShop.SDS_Busca.CommandText:=MySql;
      DMBelShop.CDS_Busca.Open;

      While Not DMBelShop.CDS_Busca.Eof do
      Begin
        MySql:=' SELECT p.Chv_Extrato, p.Num_Seq, p.Num_Compl'+
               ' From FIN_CONCILIACAO_DEPOSITOS p'+
               ' WHERE p.Chv_Extrato='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Chv_Extrato').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          If Not bExcPagto Then
           Begin
             // Atualiza Movto Pagto
             MySql:=' UPDATE FIN_CONCILIACAO_MOV_DEP m'+
                    ' SET m.ind_conciliacao='+QuotedStr('NAO')+
                    ', m.obs_nao_conc='+QuotedStr(sObsNaoConc)+
                    ' WHERE m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString+
                    ' AND   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('Num_Compl').AsString;
             DMBelShop.SQLC.Execute(MySql,nil,nil);
           End
          Else
           Begin
             // Exclui Movto Pagto Hist�rico Autom�tico
             MySql:=' DELETE FROM FIN_CONCILIACAO_MOV_DEP m'+
                    ' WHERE m.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString+
                    ' AND   m.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString;
             DMBelShop.SQLC.Execute(MySql,nil,nil);
           End; // If Not bExcPagto Then

          MySql:=' DELETE FROM FIN_CONCILIACAO_DEPOSITOS p'+
                 ' WHERE p.num_seq='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString+
                 ' AND   p.num_compl='+DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString+
                 ' AND   p.Chv_Extrato='+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Chv_Extrato').AsString);
          DMBelShop.SQLC.Execute(MySql,nil,nil);

          sNumCompl  :=DMBelShop.CDS_BuscaRapida.FieldByName('NUM_COMPL').AsString;
          sNumSeq    :=DMBelShop.CDS_BuscaRapida.FieldByName('NUM_SEQ').AsString;
          sChvExtrato:=DMBelShop.CDS_BuscaRapida.FieldByName('Chv_Extrato').AsString;

          DMBelShop.CDS_BuscaRapida.Next;
        End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
        DMBelShop.CDS_BuscaRapida.Close;

        DMBelShop.CDS_Busca.Next;
      End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
      DMBelShop.CDS_Busca.Close;

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      DMConciliacao.CDS_CMDepositos.Close;
      DMConciliacao.CDS_CMDepositos.Open;

      DMConciliacao.CDS_CMExtratosDep.Close;
      DMConciliacao.CDS_CMExtratosDep.Open;

      If (iRecNo=0) Or (DMConciliacao.CDS_CMDepositos.RecordCount<iRecNo) Then
       DMConciliacao.CDS_CMDepositos.Locate('NUM_SEQ;NUM_COMPL',VarArrayOf([sNumSeq,sNumCompl]),[])
      Else
       DMConciliacao.CDS_CMDepositos.RecNo:=iRecNo;

      DMConciliacao.CDS_CMExtratosDep.Locate('CHV_EXTRATO', sChvExtrato,[]);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
      Exit;
    Except
      on e : Exception do
      Begin
        HabilitaBotoesDep(True);

        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        exit;
      End; // on e : Exception do
    End; // Try
  End; // If bConcRetira Then

  // Libera Para Grava��o ======================================================
  LiberaClientGravarDep(True);

  // Marca/DesMarca Concilia��o ================================================
  DMConciliacao.CDS_CMDepositos.Edit;
  If DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM' Then
   Begin
    DMConciliacao.CDS_CMDepositosConciliar.AsString:='NAO';
    If bConcRetira Then
    Begin
      DMConciliacao.CDS_CMDepositosConciliado.AsString:='NAO';
      DMConciliacao.CDS_CMDepositosQUEM.AsString:='';
      DMConciliacao.CDS_CMDepositosCOD_USUARIO.AsString:='';
      DMConciliacao.CDS_CMDepositosTIP_CONCILIACAO.AsString:='';
    End;
   End
  Else // If DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM' Then
   Begin
     DMConciliacao.CDS_CMDepositosConciliar.AsString:='SIM';
   End; // If DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM' Then
  DMConciliacao.CDS_CMDepositos.Post;

  // Retira a Libera�ao Para Grava��o ==========================================
  LiberaClientGravarDep(False);

  TotaisMarcadosNaoConciliadosDep;
End;

procedure TFrmBancoExtratos.Dbg_ConcManutDepositosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    Dbg_ConcManutDepositos.Canvas.Font.Color:=clWindowText;

    if DMConciliacao.CDS_CMDepositosQUEM.AsString='SIS' then
     Dbg_ConcManutDepositos.Canvas.Brush.Color:=clLime;

    if DMConciliacao.CDS_CMDepositosQUEM.AsString='USU' then
     Dbg_ConcManutDepositos.Canvas.Brush.Color:=$00BBBBFF;

    if (DMConciliacao.CDS_CMDepositosQUEM.AsString='USU') And (DMConciliacao.CDS_CMDepositosTIP_CONCILIACAO.AsString='DINH') then
     Dbg_ConcManutDepositos.Canvas.Brush.Color:=clAqua;

    if (DMConciliacao.CDS_CMDepositosQUEM.AsString='USU') And (DMConciliacao.CDS_CMDepositosTIP_CONCILIACAO.AsString='DESP') then
    Begin
      Dbg_ConcManutDepositos.Canvas.Brush.Color:=clRed;
      Dbg_ConcManutDepositos.Canvas.Font.Color:=clWhite; // Cor da Fonte
    End;

    if (DMConciliacao.CDS_CMDepositosQUEM.AsString='USU') And (DMConciliacao.CDS_CMDepositosTIP_CONCILIACAO.AsString='SExt') then
    Begin
      Dbg_ConcManutDepositos.Canvas.Brush.Color:=$00FF75BA;
      Dbg_ConcManutDepositos.Canvas.Font.Color:=clWhite; // Cor da Fonte
    End;

    if (Trim(DMConciliacao.CDS_CMDepositosQUEM.AsString)='') And (DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM') then
     Dbg_ConcManutDepositos.Canvas.Brush.Color:=clYellow;

    Dbg_ConcManutDepositos.Canvas.FillRect(Rect);
    Dbg_ConcManutDepositos.DefaultDrawDataCell(Rect,Column.Field,state);

    DMConciliacao.CDS_CMDepositosConciliado.Alignment:=taCenter;
    DMConciliacao.CDS_CMDepositosQUEM.Alignment:=taCenter;
    DMConciliacao.CDS_CMDepositosConciliar.Alignment:=taCenter;
    DMConciliacao.CDS_CMDepositosDTA_DOCTO.Alignment:=taCenter;
    DMConciliacao.CDS_CMDepositosNUM_DOCTO.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMDepositosVLR_DOCTO.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMDepositosUSU_LOJA.Alignment:=taRightJustify;
  End; // if not (gdSelected in State) Then
end;

procedure TFrmBancoExtratos.Dbg_ConcManutDepositosEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_ConcManutDepositosEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmBancoExtratos.Dbg_ConcManutDepositosKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Var
  b: Boolean;
  sValor: String;
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

  // Busca Valor ===============================================================
  If Key=Vk_F4 Then
  Begin
    If Not DMConciliacao.CDS_CMDepositos.IsEmpty Then
    Begin
      sValor:='';
      b:=True;
      While b do
      Begin
        If InputQuery('Valor a Localizar','',sValor) then
         Begin
           Try
             StrToCurr(sValor);
             If Not DMConciliacao.CDS_CMDepositos.Locate('VLR_DOCTO',sValor,[]) Then
             Begin
               msg('Valor N�o Localizado !!','A');
               Exit;
             End;
             Break;
           Except
             msg('Valor Inv�lido !!','A');
             Break;
           End;
         End
        Else // If InputQuery('Valor a Localizar','',sValor) then
         Begin
           Break;
         End; // If InputQuery('Valor a Localizar','',sValor) then
      End; // While b do
    End; // If Not DMConciliacao.CDS_CMDepositos.IsEmpty Then
  End; // If Key=Vk_F4 Then

  // Apresenta Concilia��o =====================================================
  If Key=Vk_F6 Then
  Begin
    If Not DMConciliacao.CDS_CMDepositos.IsEmpty Then
    Begin
      If DMConciliacao.CDS_CMDepositosConciliado.AsString='SIM' Then
       Begin

         If DMConciliacao.CDS_CMDepositosTIP_CONCILIACAO.AsString='DINH' Then
         Begin
           msg('Dep�sito Conciliado como DINHEIRO !!','A');
           Exit;
         End;

         If DMConciliacao.CDS_CMDepositosTIP_CONCILIACAO.AsString='DESP' Then
         Begin
           msg('Dep�sito Conciliado como DESPESA !!','A');
           Exit;
         End;

         OdirPanApres.Caption:='AGUARDE !! Localizando Concilia��o...';
         OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
         OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBancoExtratos.Width-OdirPanApres.Width)/2));
         OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBancoExtratos.Height-OdirPanApres.Height)/2))-20;
         OdirPanApres.Visible:=True;
         Refresh;

         FrmApresConciliacao:=TFrmApresConciliacao.Create(Self);
         FrmApresConciliacao.Dbg_ConcManutExtrato.DataSource:=DMConciliacao.DS_CMApresExtratoDep;
         FrmApresConciliacao.Dbe_ConcManutTotal.DataSource:=DMConciliacao.DS_CMApresExtratoDep;

         DMConciliacao.CDS_CMApresExtratosDep.Close;
         DMConciliacao.SDS_CMApresExtratosDep.Params.ParamByName('NUM_SEQ').AsString:=
                                     DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString;
         DMConciliacao.SDS_CMApresExtratosDep.Params.ParamByName('NUM_COMPL').AsString:=
                                   DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
         DMConciliacao.CDS_CMApresExtratosDep.Open;

         OdirPanApres.Visible:=False;
         If DMConciliacao.CDS_CMApresExtratosDep.IsEmpty Then
         Begin
           FreeAndNil(FrmApresConciliacao);
           DMConciliacao.CDS_CMApresExtratosDep.Close;
           Exit;
         End; // If DMConciliacao.CDS_CMApresExtratosDep.IsEmpty Then

         FrmApresConciliacao.Gb_ConcManutPagtos.Visible:=False;
         FrmApresConciliacao.Gb_ConcManutExtrato.Align:=alClient;

         FrmApresConciliacao.ShowModal;

         FreeAndNil(FrmApresConciliacao);
       End
      Else // If DMConciliacao.CDS_CMDepositosConciliado.AsString='SIM' Then
       Begin
         msg('Pagamento N�o Conciliado !!','A')
       End;  // If DMConciliacao.CDS_CMDepositosConciliado.AsString='SIM' Then
    End; // If Not DMConciliacao.CDS_CMDepositos.IsEmpty Then
  End; // If Key=Vk_F6 Then
end;

procedure TFrmBancoExtratos.Dbg_ConcManutDepositosTitleClick(Column: TColumn);
Var
  s, sPesquisa: String;
  b: Boolean;
  i: Integer;
begin
  If Not DMConciliacao.CDS_CMDepositos.IsEmpty Then
  Begin
    i:=DMConciliacao.CDS_CMDepositos.RecNo;
    sPesquisa:='';
    b:=True;
    While b do
    Begin
      s:=DMConciliacao.CDS_CMDepositos.FieldByName(Column.FieldName).DisplayLabel;
      If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Try
           If Not DMConciliacao.CDS_CMDepositos.Locate(Column.FieldName, sPesquisa,[]) Then
           Begin
             If Not LocalizaRegistro(DMConciliacao.CDS_CMDepositos, Column.FieldName, sPesquisa) Then
             Begin
               DMConciliacao.CDS_CMDepositos.RecNo:=i;
               msg('N�o Localizado !!','A');
               Exit;
             End;
           End; // If Not DMConciliacao.CDS_CMDepositos.Locate(Column.FieldName, sPesquisa,[]) Then
           Break;
         Except
           msg('Informa��o Inv�lida !!','A');
           Break;
         End;
       End
      Else // If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Break;
       End; // If InputQuery('Localizar: '+s,'',sPesquisa) then
    End; // While b do
  End; // If Not DMConciliacao.CDS_CMDepositos.IsEmpty Then
end;

procedure TFrmBancoExtratos.Bt_CMConciliarDepClick(Sender: TObject);
Var
  sCodTpConc, sDesTpConc: String;
  sChvExtrato, sNumSeq, sNumCompl: String;
  bConcilia, bConcDespesa, bConcDinheiro, bConcExtrato: Boolean;
begin
  Dbg_ConcManutDepositos.SetFocus;

  If DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
   Exit;

  If DMConciliacao.CDS_CMDepositos.IsEmpty Then
   Exit;

  bgLocate:=True;

  bConcDinheiro:=False;
  bConcExtrato:=False;
  bConcDespesa:=False;

  sChvExtrato:=DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString;
  sNumSeq    :=DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString;
  sNumCompl  :=DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;

  If ((DMConciliacao.CDS_CMExtratosDep.IsEmpty) or (Not DMConciliacao.CDS_CMExtratosDep.Active)) And
     ((DMConciliacao.CDS_CMDepositos.IsEmpty)   or (Not DMConciliacao.CDS_CMDepositos.Active))  Then
  Begin
    Exit;
  End;

  If (igTotMarcaExt=0) And (igTotMarcaPag=0) Then
  Begin
    msg('Sem Registro Selecionado !!','A');
    Dbg_ConcManutExtratoDep.SetFocus;
    Exit;
  End;

  // Concilia��o Como Dinheiro =================================================
  If (igTotMarcaPag<>0) And (igTotMarcaExt=0) Then
  Begin
    FrmConfirmacao:=TFrmConfirmacao.Create(Self);
    FrmConfirmacao.ShowModal;

    If FrmConfirmacao.bgConfimarBotaoUm   Then bConcDinheiro:=True;
    If FrmConfirmacao.bgConfimarBotaoDois Then bConcDespesa :=True;

    FreeAndNil(FrmConfirmacao);

    If (Not bConcDinheiro) and (Not bConcDespesa) Then
    Begin
      Dbg_ConcManutDepositos.SetFocus;
      Exit;
    End;


    // OdirApagar - 11/01/2018
//    If msg('Conciliar como DINHEIRO ??','C')=1 Then
//     Begin
//       bConcDinheiro:=True;
//     End
//    Else
//     Begin
//       Exit;
//     End; // If msg('Conciliar como DINHEIRO ??','C')=1 Then
  End; // If (igTotMarcaPag<>0) Or (igTotMarcaExt=0) Then

  {
  //============================================================================
  // Concilia��o Somente Extrato ===============================================
  //============================================================================
  If (igTotMarcaPag=0) And (igTotMarcaExt<>0) Then
  Begin
    If msg('Conciliar Somente o Extrato  ??','C')=1 Then
     Begin
       b:=True;
       While b do
       Begin
         sgCodLojaExt:=InputBoxInteiro('Loja Respons�vel pelo(s) Extrato(s)', 'Informe o C�digo da Loja',sgCodLojaExt);
         If Trim(sgCodLojaExt)='' Then
          Exit;

         Try
           StrToCurr(sgCodLojaExt);
           MySqlSelect:=' SELECT e.cod_filial'+
                        ' FROM EMP_CONEXOES e'+
                        ' WHERE e.cod_filial='+QuotedStr(FormatFloat('00',StrToInt(sgCodLojaExt)));
           DMBelShop.CDS_BuscaRapida.Close;
           DMBelShop.SDS_BuscaRapida.CommandText:=MySqlSelect;
           DMBelShop.CDS_BuscaRapida.Open;
           sgCodLojaExt:=DMBelShop.CDS_BuscaRapida.FieldByName('cod_filial').AsString;
           DMBelShop.CDS_BuscaRapida.Close;

           If sgCodLojaExt='' Then
            msg('C�digo da Loja � Inv�lido !!','A')
           Else
            Break;
         Except
         End;
       End; // While b do
       bConcExtrato:=True;
     End
    Else // If msg('Conciliar Somente o Extrato  ??','C')=1 Then
     Begin
       Exit;
     End; // If msg('Conciliar Somente o Extrato  ??','C')=1 Then
  End; // If (igTotMarcaPag=0) And (igTotMarcaExt<>0) Then
  // Concilia��o Somente Extrato ===============================================
  //============================================================================
  }

  If ((igTotMarcaPag=0) Or (igTotMarcaExt=0)) And (Not bConcDinheiro) And (Not bConcExtrato) And (Not bConcDespesa) Then
  Begin
    ShowMessage('Imposs�vel Conciliar !!'+cr+cr+'A Concilia��o deve ser:'+cr+cr+
                '1(UM) Marcado para 1(UM) ou DIVERSOS Marcados !!');
    Exit;
  End;

  Rb_ConcAmbosDep.Checked:=True;
  Rb_ConcConciliadosDepClick(Self);

  // Verificva se Transa��o esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  //============================================================================
  // INICIO IM DAS CONCILIA��ES ================================================
  // ===========================================================================
  
  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;

    sCodTpConc:='';
    sDesTpConc:='';

    //==========================================================================
    // Concilia Como Dinheiro ==================================================
    //==========================================================================
    If bConcDinheiro Then
    Begin
      If Not ProcessaConciciacaoDep('Din') Then
      Begin
        DMBelShop.SQLC.Rollback(TD);
        Lb_Obs.Caption:='Tecle <Duplo Click> Para Marcar Concilia��o';
        Exit;
      End; // If Not ProcessaConciciacaoDep('Din') Then

      EdtConcManutExtratoQtdDep.Value:=0;
      EdtConcManutExtratoVlrDep.Value:=0;
      EdtConcManutDepQtd.Value:=0;
      EdtConcManutDepVlr.Value:=0;
      EdtConcManutExtDepDif.Value:=0;
      EdtConcManutExtDepDif.Font.Color:=clWindowText;
    End; // If bConcDinheiro Then
    // Concilia Como Dinheiro ==================================================
    //==========================================================================

    //==========================================================================
    // Concilia Como Despesa ++=================================================
    //==========================================================================
    If bConcDespesa Then
    Begin
      If Not ProcessaConciciacaoDep('Des') Then
      Begin
        DMBelShop.SQLC.Rollback(TD);
        Lb_Obs.Caption:='Tecle <Duplo Click> Para Marcar Concilia��o';
        Exit;
      End; // If Not ProcessaConciciacaoDep('Des') Then

      EdtConcManutExtratoQtdDep.Value:=0;
      EdtConcManutExtratoVlrDep.Value:=0;
      EdtConcManutDepQtd.Value:=0;
      EdtConcManutDepVlr.Value:=0;
      EdtConcManutExtDepDif.Value:=0;
      EdtConcManutExtDepDif.Font.Color:=clWindowText;
    End; // If bConcDespesa Then
    // Concilia Como Despesa ===================================================
    //==========================================================================

    If Trim(sNumSeq)<>'' Then
     DMConciliacao.CDS_CMDepositos.Locate('Num_Seq;Num_Compl', VarArrayOf([sNumSeq,sNumCompl]),[]);

    // Atualiza Valores da Concilia��o =========================================
    cgVlrConciarExt:=EdtConcManutExtratoVlrDep.Value;
    cgVlrConciarPag:=EdtConcManutDepVlr.Value;

    //==========================================================================
    // Concilia Somente Extrato (N�O ESTA LIBERADO) ============================
    //==========================================================================
    If (bConcExtrato) and (Not bConcDinheiro) and (Not bConcDespesa) Then
     Begin
       If Not ProcessaConciciacaoDep('SEx') Then
       Begin
         DMBelShop.SQLC.Rollback(TD);
         Lb_Obs.Caption:='Tecle <Duplo Click> Para Marcar Concilia��o';
         Exit;
       End; // If Not ProcessaConciciacaoDep('SEx') Then
     End // If bConcExtrato Then

    //==========================================================================
    // Concilia Por Deposito ===================================================
    //==========================================================================
    ELSE If (igTotMarcaPag=1) and (Not bConcDinheiro) and (Not bConcDespesa) Then
     Begin
       bConcilia:=True;
       // Valor do Extrato Maior que Deposito (Pergunta Se Concilia) ===========
       If cgVlrConciarExt>cgVlrConciarPag Then
       Begin
//         msg('IMPOSS�VEL Conciliar !!'+cr+'Valores Diferentes:'+cr+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag),'A');
//         bConcilia:=False;
         If msg('Valores a Conciliar Diferentes:'+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag)+cr+cr+'Deseja Conciliar ??','C')=2 Then
          bConcilia:=False;
       End; // If cgVlrConciarExt>cgVlrConciarPag Then

       // Valor do Extrato Menor que Deposito (Pergunta Se Concilia) ===========
       If cgVlrConciarExt<cgVlrConciarPag Then
       Begin
         If msg('Valores a Conciliar Diferentes:'+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag)+cr+cr+'Deseja Conciliar ??','C')=2 Then
          bConcilia:=False;
       End;

       If Not bConcilia Then
       Begin
         // OdirApagar - 30/11/2017
         // If msg('Valores a Conciliar Diferentes:'+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag)+cr+cr+'Deseja Conciliar ??','C')=2 Then
         //Begin
         // msg('IMPOSS�VEL Conciliar !!'+cr+'Valores Diferentes:'+cr+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag),'A');

         If Not DMConciliacao.CDS_CMDepositos.IsEmpty Then
          DMConciliacao.CDS_CMDepositos.Locate('NUM_SEQ;NUM_COMPL', VarArrayOf([sNumSeq,sNumCompl]),[]);

         If Not DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
          DMConciliacao.CDS_CMExtratosDep.Locate('CHV_EXTRATO', sChvExtrato,[]);

         Screen.Cursor:=crDefault;
         Dbg_ConcManutExtratoDep.SetFocus;
         Exit;
       End; // If cgVlrConciarExt<>cgVlrConciarPag Then

       If Not ProcessaConciciacaoDep('Pag') Then
       Begin
         DMBelShop.SQLC.Rollback(TD);
         Exit;
       End;
     End // If (igTotMarcaPag=1) and (Not bConcDinheiro) and (Not bConcDespesa) Then

    //==========================================================================
    // Concila Por Extrato -----------------------------------------------------
    //==========================================================================
    ELSE If (igTotMarcaExt=1) and (Not bConcDinheiro) and (Not bConcDespesa) Then
     Begin
       bConcilia:=True;
       // Valor do Extrato Maior que Deposito (Pergunta Se Concilia) ===========
       If cgVlrConciarExt>cgVlrConciarPag Then
       Begin
//         msg('IMPOSS�VEL Conciliar !!'+cr+'Valores Diferentes:'+cr+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag),'A');
//         bConcilia:=False;
         If msg('Valores a Conciliar Diferentes:'+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag)+cr+cr+'Deseja Conciliar ??','C')=2 Then
          bConcilia:=False;
       End; // If cgVlrConciarExt>cgVlrConciarPag Then

       // Valor do Extrato Menor que Deposito (Pergunta Se Concilia) ===========
       If cgVlrConciarExt<cgVlrConciarPag Then
       Begin
         If msg('Valores a Conciliar Diferentes:'+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag)+cr+cr+'Deseja Conciliar ??','C')=2 Then
          bConcilia:=False;
       End;

       If Not bConcilia Then
       Begin
         // OdirApagar - 30/11/2017
         // If msg('Valores a Conciliar Diferentes:'+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag)+cr+cr+'Deseja Conciliar ??','C')=2 Then
         // Begin
//         msg('IMPOSS�VEL Conciliar !!'+cr+'Valores Diferentes:'+cr+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag),'A');

         If Not DMConciliacao.CDS_CMDepositos.IsEmpty Then
          DMConciliacao.CDS_CMDepositos.Locate('NUM_SEQ;NUM_COMPL', VarArrayOf([sNumSeq,sNumCompl]),[]);

         If Not DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
          DMConciliacao.CDS_CMExtratosDep.Locate('CHV_EXTRATO', sChvExtrato,[]);

         Screen.Cursor:=crDefault;
         Dbg_ConcManutExtratoDep.SetFocus;
         Exit;
       End; // If cgVlrConciarExt<>cgVlrConciarPag Then

       If Not ProcessaConciciacaoDep('Ext')Then
       Begin
         DMBelShop.SQLC.Rollback(TD);
         Exit;
       End;
     End // If (igTotMarcaExt=1) and (Not bConcDinheiro) and (Not bConcDespesa) Then

    //==========================================================================
    // Concilia Extratos e Depositos Diversos ==================================
    //==========================================================================
    ELSE If (igTotMarcaExt>1) and (igTotMarcaPag>1) and (Not bConcDinheiro) and (Not bConcDespesa) Then
     Begin
       bConcilia:=True;
       // Valor do Extrato Maior que Deposito (Pergunta Se Concilia) ===========
       If cgVlrConciarExt>cgVlrConciarPag Then
       Begin
//         msg('IMPOSS�VEL Conciliar !!'+cr+'Valores Diferentes:'+cr+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag),'A');
//         bConcilia:=False;
         If msg('Valores a Conciliar Diferentes:'+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag)+cr+cr+'Deseja Conciliar ??','C')=2 Then
          bConcilia:=False;
       End; // If cgVlrConciarExt>cgVlrConciarPag Then

       // Valor do Extrato Menor que Deposito (Pergunta Se Concilia) ===========
       If cgVlrConciarExt<cgVlrConciarPag Then
       Begin
         If msg('Valores a Conciliar Diferentes:'+cr+'Valor Extrato: '+CurrToStr(cgVlrConciarExt)+' Valor Dep�sito: '+CurrToStr(cgVlrConciarPag)+cr+cr+'Deseja Conciliar ??','C')=2 Then
          bConcilia:=False;
       End;

       If Not bConcilia Then
       Begin
         If Not DMConciliacao.CDS_CMDepositos.IsEmpty Then
          DMConciliacao.CDS_CMDepositos.Locate('NUM_SEQ;NUM_COMPL', VarArrayOf([sNumSeq,sNumCompl]),[]);

         If Not DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
          DMConciliacao.CDS_CMExtratosDep.Locate('CHV_EXTRATO', sChvExtrato,[]);

         Screen.Cursor:=crDefault;
         Dbg_ConcManutExtratoDep.SetFocus;
         Exit;
       End; // If cgVlrConciarExt<>cgVlrConciarPag Then

       If Not ProcessaConciciacaoDep('Div') Then
       Begin
         DMBelShop.SQLC.Rollback(TD);
         Exit;
       End;
     End; // If (igTotMarcaExt>1) and (igTotMarcaPag>1) and (Not bConcDinheiro) and (Not bConcDespesa) Then
    //==========================================================================
    // FIM DAS CONCILIA��ES ====================================================
    // =========================================================================

    igTotMarcaExt:=0;
    igTotMarcaPag:=0;

    EdtConcManutExtratoQtdDep.Value:=0;
    EdtConcManutExtratoVlrDep.Value:=0;
    EdtConcManutDepQtd.Value:=0;
    EdtConcManutDepVlr.Value:=0;
    EdtConcManutExtDepDif.Value:=0;

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    Screen.Cursor:=crDefault;
  Except
    on e : Exception do
    Begin
      HabilitaBotoesDep(True);

      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    End; // on e : Exception do
  End; // Try

  If bgLocate Then
  Begin
    If Not DMConciliacao.CDS_CMDepositos.IsEmpty Then
     DMConciliacao.CDS_CMDepositos.Locate('NUM_SEQ;NUM_COMPL', VarArrayOf([sNumSeq,sNumCompl]),[]);

    If Not DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
     DMConciliacao.CDS_CMExtratosDep.Locate('CHV_EXTRATO', sChvExtrato,[]);
  End; // If bgLocate Then

end;

procedure TFrmBancoExtratos.Rb_ConcConciliadosDepKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_ConcConciliadosDepClick(Self);
end;

procedure TFrmBancoExtratos.Bt_CMDesmarcarDepClick(Sender: TObject);
Var
  ii, i: Integer;
begin
  Dbg_ConcManutExtratoDep.SetFocus;

  If DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
   Exit;

  If DMConciliacao.CDS_CMDepositos.IsEmpty Then
   Exit;

  Screen.Cursor:=crAppStart;

  // Libera Para Grava��o ====================================================
  LiberaClientGravarDep(True);

  DMConciliacao.CDS_CMExtratosDep.DisableControls;
  DMConciliacao.CDS_CMDepositos.DisableControls;

  i:=0;
  DMConciliacao.CDS_CMExtratosDep.First;
  While not DMConciliacao.CDS_CMExtratosDep.Eof do
  Begin
    If (DMConciliacao.CDS_CMExtratosDepConciliar.AsString='SIM') And
       (DMConciliacao.CDS_CMExtratosDepConciliado.AsString='NAO') And
       (Trim(DMConciliacao.CDS_CMExtratosDepQUEM.AsString)='') Then
    Begin
      If i=0 Then
       i:=DMConciliacao.CDS_CMExtratosDep.RecNo;

      DMConciliacao.CDS_CMExtratosDep.Edit;
      DMConciliacao.CDS_CMExtratosDepConciliar.AsString:='NAO';
      DMConciliacao.CDS_CMExtratosDep.Post;
    End;

    DMConciliacao.CDS_CMExtratosDep.Next;
  End; // While not DMConciliacao.CDS_CMExtratosDep.Eof do

  ii:=0;
  DMConciliacao.CDS_CMDepositos.First;
  While not DMConciliacao.CDS_CMDepositos.Eof do
  Begin
    If (DMConciliacao.CDS_CMDepositosConciliar.AsString='SIM') And
       (DMConciliacao.CDS_CMDepositosConciliado.AsString='NAO') And
       (Trim(DMConciliacao.CDS_CMDepositosQUEM.AsString)='') Then
    Begin
      If ii=0 Then
       ii:=DMConciliacao.CDS_CMDepositos.RecNo;

      DMConciliacao.CDS_CMDepositos.Edit;
      DMConciliacao.CDS_CMDepositosConciliar.AsString:='NAO';
      DMConciliacao.CDS_CMDepositos.Post;
    End;

    DMConciliacao.CDS_CMDepositos.Next;
  End; // While not DMConciliacao.CDS_CMDepositos.Eof do

  // Retira a Libera�ao Para Grava��o ==========================================
  LiberaClientGravarDep(False);

  igTotMarcaExt:=0;
  igTotMarcaPag:=0;

  TotaisMarcadosNaoConciliadosDep;

  DMConciliacao.CDS_CMExtratosDep.EnableControls;
  DMConciliacao.CDS_CMDepositos.EnableControls;

  Screen.Cursor:=crDefault;

  // Posiciona
  DMConciliacao.CDS_CMDepositos.First;
  DMConciliacao.CDS_CMExtratosDep.First;
  If ii<>0 Then DMConciliacao.CDS_CMDepositos.RecNo:=ii;
  If  i<>0 Then DMConciliacao.CDS_CMExtratosDep.RecNo:=i;

  Dbg_ConcManutExtratoDep.SetFocus;
end;

procedure TFrmBancoExtratos.EdtConcManutExtratoVlrDepChange(Sender: TObject);
begin
// Odirapagar - 18/01/2018 Trocado Pela Procedure LocalizaValoresConciliar(iTipo: Integer);
//  If EdtConcManutExtratoVlrDep.Value<>0 Then
//  Begin
//    If DMConciliacao.CDS_CMDepositos.Locate('VLR_DOCTO', EdtConcManutExtratoVlrDep.Value,[]) Then
//    Begin
////      Dbg_ConcManutDepositos.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];
////
////      PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
////      msg('Movto com Valor Localizado !!','A');
////
////      Dbg_ConcManutDepositos.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
//      THackDBGrid(Dbg_ConcManutDepositos).SelectedIndex:=7;
//    End;
//  End; // If EdtConcManutExtratoVlrDep.Value<>0 Then

end;

procedure TFrmBancoExtratos.EdtConcManutDepVlrChange(Sender: TObject);
begin
// Odirapagar - 18/01/2018 Trocado Pela Procedure LocalizaValoresConciliar(iTipo: Integer);
//  If EdtConcManutDepVlr.Value<>0 Then
//  Begin
//    If DMConciliacao.CDS_CMExtratosDep.Locate('VLR_DOCTO', EdtConcManutDepVlr.Value,[]) Then
//    Begin
////      Dbg_ConcManutExtratoDep.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];
////
////      PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
////      msg('Extrato com Valor Localizado !!','A');
////
////      Dbg_ConcManutExtratoDep.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
//      THackDBGrid(Dbg_ConcManutExtratoDep).SelectedIndex:=7;
//    End;
//  End; // If EdtConcManutExtratoVlrDep.Value<>0 Then

end;

procedure TFrmBancoExtratos.EdtConcManutExtratoVlrChange(Sender: TObject);
begin
// Odirapagar - 18/01/2018 Trocado Pela Procedure LocalizaValoresConciliar(iTipo: Integer);
//  If EdtConcManutExtratoVlr.Value<>0 Then
//  Begin
//    If DMConciliacao.CDS_CMPagtos.Locate('VLR_DOCTO', EdtConcManutExtratoVlr.Value,[]) Then
//    Begin
////      Dbg_ConcManutPagto.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];
////
////      PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
////      msg('Movto com Valor Localizado !!','A');
////
////      Dbg_ConcManutPagto.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
//      THackDBGrid(Dbg_ConcManutPagto).SelectedIndex:=7;
//    End;
//  End; // If EdtConcManutExtratoVlr.Value<>0 Then
end;

procedure TFrmBancoExtratos.EdtConcManutPagtoVlrChange(Sender: TObject);
begin
// Odirapagar - 18/01/2018 Trocado Pela Procedure LocalizaValoresConciliar(iTipo: Integer);
//  If EdtConcManutPagtoVlr.Value<>0 Then
//  Begin
//    If DMConciliacao.CDS_CMExtratos.Locate('VLR_DOCTO', EdtConcManutPagtoVlr.Value,[]) Then
//    Begin
////      Dbg_ConcManutExtrato.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];
////
////      PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
////      msg('Extrato com Valor Localizado !!','A');
////
////      Dbg_ConcManutExtrato.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
//      THackDBGrid(Dbg_ConcManutExtrato).SelectedIndex:=7;
//    End;
//  End; // If EdtConcManutPagtoVlr.Value<>0 Then

end;

procedure TFrmBancoExtratos.Bt_DepAnaliseVoltarClick(Sender: TObject);
begin
  Dbg_DepAnalise.SetFocus;
  DMConciliacao.CDS_CMDepositosAnalise.Close;

  sgDia:='';

  Ts_ConciliacoesManutDepAnalise.TabVisible:=False;
  Ts_ConciliacoesManutDepositos.TabVisible:=True;
  PC_PrincipalChange(Self);
  Bt_CMRelatorioDep.SetFocus;
end;

procedure TFrmBancoExtratos.Bt_CMRelatorioDepClick(Sender: TObject);
begin
  Dbg_ConcManutDepositos.SetFocus;

  Ts_ConciliacoesManutDepAnalise.TabVisible:=True;
  Ts_ConciliacoesManutDepositos.TabVisible:=False;
  PC_PrincipalChange(Self);
  Dbg_DepAnalise.SetFocus;

end;

procedure TFrmBancoExtratos.Bt_CMObsNaoConcDepClick(Sender: TObject);
Var
  MySql: String;
  b: Boolean;

  sNumSeq, sNumCompl, sChvExtrato,
  sObsNaoConc: String;
begin
  Dbg_ConcManutDepositos.SetFocus;
  
  If DMConciliacao.CDS_CMExtratosDep.IsEmpty Then
   Exit;

  If DMConciliacao.CDS_CMDepositos.IsEmpty Then
   Exit;

  Dbg_ConcManutDepositos.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];
  If msg(DMConciliacao.CDS_CMDepositosRAZAO_SOCIAL.AsString+cr+
         'Dia '+DMConciliacao.CDS_CMDepositosDTA_DOCTO.AsString+cr+cr+
         'O Dia e a Loja Est�o Seleciondas CORRETAMENTE ??','C')=2 Then
  Begin
    Dbg_ConcManutDepositos.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
    Dbg_ConcManutDepositos.SetFocus;
    Exit;
  End;

  // Verifica se Existe Movto Nao Conciliado ===================================
  MySql:=' SELECT m.cod_linx'+
         ' From FIN_CONCILIACAO_MOV_DEP m'+
         ' WHERE m.Ind_Conciliacao=''NAO'''+
         ' AND   m.Cod_Linx='+Copy(DMConciliacao.CDS_CMDepositosCOD_LOJA.AsString,5,3)+
         ' AND   m.dta_Docto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DMConciliacao.CDS_CMDepositosDTA_DOCTO.AsString)));
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If DMBelShop.CDS_BuscaRapida.Eof Then
  Begin
    msg(DMConciliacao.CDS_CMDepositosRAZAO_SOCIAL.AsString+cr+
        'Dia '+DMConciliacao.CDS_CMDepositosDTA_DOCTO.AsString+cr+cr+
        'SEM Movimento N�O CONCILIADO !!','A');
    DMBelShop.CDS_BuscaRapida.Close;
    Dbg_ConcManutDepositos.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
    Dbg_ConcManutDepositos.SetFocus;
    Exit;
  End;

  // Busca Observa��o de Nao Conciliado ========================================
  MySql:=' SELECT  Trim(m.obs_nao_conc) obs_nao_conc'+
         ' From FIN_CONCILIACAO_MOV_DEP m'+
         ' WHERE m.Ind_Conciliacao=''NAO'''+
         ' AND   TRIM(COALESCE(m.obs_nao_conc,''''))<>'''''+
         ' AND   m.Cod_Linx='+Copy(DMConciliacao.CDS_CMDepositosCOD_LOJA.AsString,5,3)+
         ' AND   m.dta_Docto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DMConciliacao.CDS_CMDepositosDTA_DOCTO.AsString)));
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sObsNaoConc:='';

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Obs_Nao_Conc').AsString)<>'' Then
  Begin
    sObsNaoConc:=DMBelShop.CDS_BuscaRapida.FieldByName('Obs_Nao_Conc').AsString;
  End;
  DMBelShop.CDS_BuscaRapida.Close;

  b:=True;
  bgProcessar:=True;
  While b do
  Begin
    If InputQuery('Observa��o de N�o Conciliado','',sObsNaoConc) then
     Begin
       If Trim(sObsNaoConc)='' Then
        Begin
          msg('Favor Informar a Observa��o'+cr+cr+'de N�o Conciliado !!','A');
          bgProcessar:=False;
        End
       Else
        Begin
          Break;
        End; // If Trim(sObsNaoConc)='' Then
     End
    Else // If InputQuery('Observa��o de N�o Conciliado','',sObsNaoConc) then
     Begin
       bgProcessar:=False;
       Break;
     End; // If InputQuery('Observa��o de N�o Conciliado','',sObsNaoConc) then
  End; // While b do

  sNumSeq    :=DMConciliacao.CDS_CMDepositosNUM_SEQ.AsString;
  sNumCompl  :=DMConciliacao.CDS_CMDepositosNUM_COMPL.AsString;
  sChvExtrato:=DMConciliacao.CDS_CMExtratosDepCHV_EXTRATO.AsString;
  If bgProcessar Then
  Begin
    OdirPanApres.Caption:='AGUARDE !! Atualizando Registros N�o Conciliados...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBancoExtratos.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBancoExtratos.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmBancoExtratos;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;

    // Verifica se Transa��o esta Ativa
    If DMBelShop.SQLC.InTransaction Then
     DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try // Try da Transa��o
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      MySql:=' UPDATE FIN_CONCILIACAO_MOV_DEP m'+
             ' SET m.obs_nao_conc='+QuotedStr(sObsNaoConc)+
             ' WHERE m.Ind_Conciliacao=''NAO'''+
             ' AND   m.Cod_Linx='+Copy(DMConciliacao.CDS_CMDepositosCOD_LOJA.AsString,5,3)+
             ' AND   m.dta_Docto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DMConciliacao.CDS_CMDepositosDTA_DOCTO.AsString)));
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ====================================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      // Reabre Clients ========================================================
      DMConciliacao.CDS_CMDepositos.DisableControls;
      DMConciliacao.CDS_CMExtratosDep.DisableControls;

      DMConciliacao.CDS_CMDepositos.Close;
      DMConciliacao.CDS_CMExtratosDep.Close;
      DMConciliacao.CDS_CMExtratosDep.Open;
      DMConciliacao.CDS_CMDepositos.Open;

      DMConciliacao.CDS_CMDepositos.EnableControls;
      DMConciliacao.CDS_CMExtratosDep.EnableControls;

      bgLocate:=False;
      DMConciliacao.CDS_CMDepositos.Locate('NUM_SEQ;NUM_COMPL',VarArrayOf([sNumSeq,sNumCompl]),[]);
      DMConciliacao.CDS_CMExtratosDep.Locate('CHV_EXTRATO', sChvExtrato,[]);
    Except // Except da Transa��o
      on e : Exception do
      Begin
        // Abandona Transacao ==================================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        OdirPanApres.Visible:=False;
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try da Transa��o
  End; // If bgProcessar Then

  Dbg_ConcManutDepositos.Options:=[dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection];
  Dbg_ConcManutDepositos.SetFocus;

end;

procedure TFrmBancoExtratos.Bt_DepAnaliseDiaClick(Sender: TObject);
Var
  MySql: String;
  b: Boolean;
begin
  Dbg_DepAnalise.SetFocus;

  DMConciliacao.CDS_CMDepositosAnalise.Close;

  b:=True;
  bgProcessar:=False;
  sgDia:='';
  While b do
  Begin
    sgDia:=InputBoxData('Analise de Caixa', 'Informe o Dia', sgDia);
    If Trim(sgDia)='' Then
     Break;

    Try
      StrToDate(sgDia);
      bgProcessar:=True;
      Break;
    Except
      msg('Dia Inv�lido !!','A');
    End;
  End; // While b do

  If bgProcessar Then
  Begin
    sgDia:=f_Troca('/','.',f_Troca('-','.',sgDia));

    // Verifia se existe Movtos no Dia =========================================
    MySql:=' SELECT Count(md.cod_linx) tot'+
           ' FROM FIN_CONCILIACAO_MOV_DEP md'+
           ' WHERE md.dta_docto='+QuotedStr(sgDia);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If DMBelShop.CDS_BuscaRapida.FieldByName('tot').AsInteger<1 Then
    Begin
      DMBelShop.CDS_BuscaRapida.Close;
      sgDia:='';
      Dbg_DepAnalise.SetFocus;

      msg('Sem Movtos a Analisar no Dia Solicitado !!','A');
      Exit;
    End; // If DMBelShop.CDS_BuscaRapida.Eof Then
    DMBelShop.CDS_BuscaRapida.Close;

    // Apresenta Dia para Analise ==============================================
    // ----------- TITULO DO RELAT�RIO
    MySql:=' SELECT'+
           ' ''RESULTADO CONCILIA��O CAIXA DO DIA 02/01/2018'' NOME_EMP,'+
           ' NULL CX_MTZ,'+
           ' NULL DEPOSITO,'+
           ' NULL DESPESA,'+
           ' NULL OUTROS,'+
           ' NULL TOTAL,'+
           ' NULL OBSERVACOES,'+
           ' 0 ORDEM'+
           ' FROM RDB$DATABASE'+

    // ----------- LINHA EM BRANCO
           ' UNION'+

           ' SELECT'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' 1 ORDEM'+
           ' FROM RDB$DATABASE'+

    // ----------- TITULO DA PRIMEIRA APRESENTA��O
           ' UNION'+

           ' SELECT'+
           ' ''VALORES CONCILIADOS'','+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' 2 ORDEM'+
           ' FROM RDB$DATABASE'+

    // ----------- LINHA EM BRANCO
           ' UNION'+

           ' SELECT'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' 3 ORDEM'+
           ' FROM RDB$DATABASE'+

    // ----------- APRESENTA VALORES CONCILIADOS
           ' UNION'+

           ' SELECT'+
           ' lj.nome_emp,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) IN (197, 198) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           '  END)'+
           ' , 0.00) CX_MTZ,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) IN (170, 173) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           '  END)'+
           ' , 0.00) DEPOSITO,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) IN (10, 16, 29, 30, 33, 106, 181, 183) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '      0.00'+
           '  END)'+
           ' , 0.00) DESPESA,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) NOT IN (10, 16, 29, 30, 33, 106, 181, 183, 170, 173, 197, 198) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           '  END)'+
           ' ,0.00) OUTROS,'+

           ' SUM(COALESCE(md.vlr_docto,0.00)) TOTAL,'+
           ' NULL,'+
           ' 4 ORDEM'+

           ' FROM FIN_CONCILIACAO_MOV_DEP md, LINXLOJAS lj'+
           ' WHERE md.cod_linx=lj.empresa'+
           ' AND   md.ind_conciliacao=''SIM'''+
           ' AND   md.dta_docto='+QuotedStr(sgDia)+

           ' GROUP BY 1'+

    // ----------- APRESENTA TOTAL DE VALORES CONCILIADOS
           ' UNION'+

           ' SELECT'+
           ' ''TOTAL DE VALORES CONSILIADOS'','+
           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) IN (197, 198) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           ' END)'+
           ' , 0.00) CX_MTZ,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) IN (170, 173) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           ' END)'+
           ' , 0.00) DEPOSITO,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) IN (10, 16, 29, 30, 33, 106, 181, 183) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           ' END)'+
           ' , 0.00) DESPESA,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) NOT IN (10, 16, 29, 30, 33, 106, 181, 183, 170, 173, 197, 198) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           ' END),0.00) OUTROS,'+

           ' SUM(COALESCE(md.vlr_docto,0.00)) TOTAL,'+
           ' NULL,'+
           ' 5 ORDEM'+

           ' FROM FIN_CONCILIACAO_MOV_DEP md, LINXLOJAS lj'+
           ' WHERE md.cod_linx=lj.empresa'+
           ' AND   md.ind_conciliacao=''SIM'''+
           ' AND   md.dta_docto='+QuotedStr(sgDia)+

    //----------- LINHA EM BRANCO
           ' UNION'+

           ' SELECT'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' 6 ORDEM'+
           ' FROM RDB$DATABASE'+

    //----------- TITULO DA SEGUNDA APRESENTA��O
           ' UNION'+

           ' SELECT'+
           ' ''VALORES N�O CONCILIADOS'','+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' 7 ORDEM'+
           ' FROM RDB$DATABASE'+

    //----------- LINHA EM BRANCO
           ' UNION'+
           ' SELECT'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' NULL,'+
           ' 8 ORDEM'+
           ' FROM RDB$DATABASE'+

    //----------- APRESENTA VALORES N�O CONCILIADOS
           ' UNION'+

           ' SELECT'+
           ' lj.nome_emp,'+
           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) IN (197, 198) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           '  END)'+
           ' , 0.00) CX_MTZ,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) IN (170, 173) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           '  END)'+
           ' , 0.00) DEPOSITO,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) IN (10, 16, 29, 30, 33, 106, 181, 183) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           '  END)'+
           ' , 0.00) DESPESA,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) NOT IN (10, 16, 29, 30, 33, 106, 181, 183, 170, 173, 197, 198) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           '  END)'+
           ' ,0.00) OUTROS,'+

           ' SUM(COALESCE(md.vlr_docto,0.00)) TOTAL,'+
           ' TRIM(COALESCE(md.obs_nao_conc,'''')) obs_nao_conc,'+
           ' 9 ORDEM'+

           ' FROM FIN_CONCILIACAO_MOV_DEP md, LINXLOJAS lj'+
           ' WHERE md.cod_linx=lj.empresa'+
           ' AND   md.ind_conciliacao=''NAO'''+
           ' AND   md.dta_docto='+QuotedStr(sgDia)+

           ' GROUP BY 1,7,8'+

    //----------- APRESENTA TOTAL DOS VALORES N�O CONCILIADOS
           ' UNION'+

           ' SELECT'+
           ' ''TOTAL DE VALORES N�O CONSILIADOS'','+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) IN (197, 198) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           '  END)'+
           ' , 0.00) CX_MTZ,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) IN (170, 173) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           '  END)'+
           ' , 0.00) DEPOSITO,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) IN (10, 16, 29, 30, 33, 106, 181, 183) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           '  END)'+
           ' , 0.00) DESPESA,'+

           ' COALESCE(SUM('+
           '  CASE'+
           '     WHEN COALESCE(md.cod_historico,0) NOT IN (10, 16, 29, 30, 33, 106, 181, 183, 170, 173, 197, 198) THEN'+
           '       md.vlr_docto'+
           '     ELSE'+
           '       0.00'+
           '  END)'+
           ' ,0.00) OUTROS,'+

           ' SUM(COALESCE(md.vlr_docto,0.00)) TOTAL,'+
           ' NULL,'+
           ' 10 ORDEM'+

           ' FROM FIN_CONCILIACAO_MOV_DEP md, LINXLOJAS lj'+
           ' WHERE md.cod_linx=lj.empresa'+
           ' AND   md.ind_conciliacao=''NAO'''+
           ' AND   md.dta_docto='+QuotedStr(sgDia)+

    //------------ORDER BY - FIM
           ' ORDER BY 8,1';
    DMConciliacao.CDS_CMDepositosAnalise.Close;
    DMConciliacao.SDS_CMDepositosAnalise.CommandText:=MySql;
    DMConciliacao.CDS_CMDepositosAnalise.Open;
  End; // If bgProcessar Then

  sgDia:='';
end;

procedure TFrmBancoExtratos.Dbg_DepAnaliseDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not (gdSelected in State) Then
  Begin
    Dbg_DepAnalise.Canvas.Font.Color:=clWindowText;

    If DMConciliacao.CDS_CMDepositosAnaliseORDEM.AsInteger in [0, 2, 5, 7, 10] Then
    Begin
      Dbg_DepAnalise.Canvas.Brush.Color:=clYellow;
      Dbg_DepAnalise.Canvas.Font.Style:=[fsBold,fsUnderline];
    End; // If DMConciliacao.CDS_CMDepositosAnaliseORDEM.AsInteger in ['0', '2', '5', '7', '10']) Then

    Dbg_DepAnalise.Canvas.FillRect(Rect);
    Dbg_DepAnalise.DefaultDrawDataCell(Rect,Column.Field,state);

    DMConciliacao.CDS_CMDepositosAnaliseCX_MTZ.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMDepositosAnaliseDEPOSITO.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMDepositosAnaliseDESPESA.Alignment:=taRightJustify;
    DMConciliacao.CDS_CMDepositosAnaliseOUTROS.Alignment:=taRightJustify;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmBancoExtratos.Dbg_ConsExtratoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

end;

procedure TFrmBancoExtratos.Dbg_ConcBancosLojasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

end;

procedure TFrmBancoExtratos.Dbg_ConcExtratoBancosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

end;

procedure TFrmBancoExtratos.Dbg_ConcManutTotalPagtosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

end;

procedure TFrmBancoExtratos.Dbg_HistConcAutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

end;

procedure TFrmBancoExtratos.Dbg_VerifExtratosContasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

end;

procedure TFrmBancoExtratos.Dbg_DepAnaliseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

end;

end.

