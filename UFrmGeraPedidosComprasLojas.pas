unit UFrmGeraPedidosComprasLojas;

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
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxSkinscxPCPainter,
  RXSpin, StdCtrls, JvExStdCtrls, JvRadioButton, JvCheckBox, cxPC,
  dxStatusBar, Grids, DBGrids, DBGridJul, ExtCtrls, JvEdit, JvValidateEdit,
  JvXPCheckCtrls, ToolEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Mask, CurrEdit, JvExControls, JvXPCore, JvXPButtons, ComCtrls,
  DBClient, DBXpress, DB, IdFTP, IdFTPCommon, StrUtils, DateUtils, Math,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdAntiFreezeBase, IdAntiFreeze;
  // Ultimo: DateUtils

{
- Arquivo
  - Servidor_Adm.ini
    ================
    - Contendo:
        \\SERVIDORCD_PC\C\
        01
        TCP/IP
        #Linha 0 = Pasta do Servidor
        #		- Colocar <C:\> Para LOjas
        #Linha 1 = Loja Unica
        # 		- Deixar em Branco quando for o CD
        # 		- Iniciar com 999999 para sistema trocar pelo Codigo da Empresa
        #Linha 2= Tipo de Conexão:
            - TCP/IP
            - NetBEUI
            - Sem Informação = NetBEUI
Parametros Lojas:
Tipos:
	0 - Percentual PADRÃO do Limite para Faturamento de Fornecedor - POR LOJA
	1 - Considerar SALDO ATUAL no Calculo de Necessidade de Compra
	2 - Considerar Produto em Transito, se Houver, no Calculo de Necessidade de Compra ?
	3 - Numero de Dias para Calculo de Necessidade de Compra - POR LOJA
	4 - Percentual Limite para Faturamento de Fornecedor - POR FORNECEDOR E LOJA
	    SE O FORNECEDOR NÃO EXISTIR PERCENTUAL PADRÃO - IND_TIPO = 0
	5 - Utilizar Estoque Ideal (Estoque mínimo) ?  - POR PRODUTO - SIDICOM: ESTOQUE.EstoqueIdeal
	6 - Utilizar Percentual Limite de Caixa de Embarque para Compra - POR PRODUTO - SIDICOM: PRODUTO.Unidade -- PRODUFOR.UnidadeCaixa
	7 - Fornecedores a Comprar por Dia

Montagem do Arquivo FTP:
    08_DataHora.SQL
    Onde:
    08 = Cod_Loja
    DataHora  = yyyymmdd + hhnnss Data e Hora da Geração do Arquivo;
}

type
  TFrmGeraPedidosComprasLojas = class(TForm)
    Panel11: TPanel;
    PC_OrdemCompra: TPageControl;
    Ts_OCBuscaProdutos: TTabSheet;
    Pan_OC: TPanel;
    Panel22: TPanel;
    Label192: TLabel;
    Bt_OCFechar: TJvXPButton;
    Bt_OCBuscaProdutos: TJvXPButton;
    Edt_OCTotProdutos: TCurrencyEdit;
    Ts_OCGeraOrdemCompra: TTabSheet;
    Panel19: TPanel;
    Pan_GeraOC: TPanel;
    Bt_GeraOCVoltar: TJvXPButton;
    Bt_GeraOCExcluir: TJvXPButton;
    Bt_GeraOCFechaDoc: TJvXPButton;
    Panel33: TPanel;
    Gb_GeraOCDocto: TGroupBox;
    EdtGeraOCBuscaDocto: TCurrencyEdit;
    DtEdt_GeraOCDataDocto: TDateEdit;
    Bt_GeraOCBuscaDocto: TJvXPButton;
    PC_GeraOCApresentacao: TPageControl;
    Ts_GeraOCGrid: TTabSheet;
    Dbg_GeraOCGrid: TDBGridJul;
    Gb_GeraOCEstoqueTransito: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Ckb_GeraOCCalculoEstoque: TJvXPCheckbox;
    Ckb_GeraOCCalculoTransito: TJvXPCheckbox;
    Gb_GeraOCCalculaCompra: TGroupBox;
    Label48: TLabel;
    EdtGeraOCDias: TJvValidateEdit;
    Bt_GeraOCCalcular: TJvXPButton;
    Pan_CalculoOC: TPanel;
    Gb_CalculoMeses: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
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
    Gb_CalculoListaPreco: TGroupBox;
    EdtOCCodListaPreco: TCurrencyEdit;
    EdtOCListaPreco: TEdit;
    Gb_EmpresaProc: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Lb_EmpAprocessar: TLabel;
    Lb_EmpProcessadas: TLabel;
    Gb_CalculoProdNovos: TGroupBox;
    DtEdt_CalculoProdNovos: TcxDateEdit;
    OdirPanApres: TPanel;
    Label59: TLabel;
    Dbg_GeraOCGridItens: TDBGridJul;
    Splitter1: TSplitter;
    Sb_SelectEmpProc2: TdxStatusBar;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Ts_ParametrosLojas: TTabSheet;
    Panel1: TPanel;
    Pan_Apresentacao: TPanel;
    Bt_ParamLjFechar: TJvXPButton;
    Bt_ParamLjSalvar: TJvXPButton;
    PC_ParametroLojas: TcxPageControl;
    Ts_ParamLjCalculo: TcxTabSheet;
    Ts_ParamLjFornecedores: TcxTabSheet;
    Gb_ParamLjCalculo: TGroupBox;
    Pan_ParamLjSolic1: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Ckb_ParamLjSaldo: TJvCheckBox;
    Ckb_ParamLjTransito: TJvCheckBox;
    Gb_ParamLjDiasPerc: TGroupBox;
    Dbg_ParamLjDias: TDBGridJul;
    Pan_ParamLjSolic2: TPanel;
    Label2: TLabel;
    Ckb_ParamLjEstMinimo: TJvCheckBox;
    Label3: TLabel;
    Ckb_ParamLjCxEmbarque: TJvCheckBox;
    EdtParamLjPerCxEmbarque: TCurrencyEdit;
    PC_ParamLjFornecedores: TcxPageControl;
    Ts_ParamLjLimiteFat: TcxTabSheet;
    Ts_ParamLjFornCalcular: TcxTabSheet;
    Dbg_ParamLjPerLimites: TDBGridJul;
    Dbg_ParamLjPerLimForn: TDBGridJul;
    Gb_ParamLjPerLimReplicar: TGroupBox;
    Gb_ParamLjPerLimAlterar: TPanel;
    Bt_ParamLjReplTUDO: TJvXPButton;
    Pan_ParamLjLocaliza: TPanel;
    Label7: TLabel;
    EdtParamLjLocaliza: TEdit;
    Rb_ParamLjPerLimLojas: TJvRadioButton;
    Rb_ParamLjPerLimLojasFornec: TJvRadioButton;
    Rb_ParamLjPerLimFornec: TJvRadioButton;
    Gb_ParamLjDiasForn: TGroupBox;
    Dbg_ParamLjDiasForn: TDBGridJul;
    Bt_ParamLjDiasFornIncluir: TJvXPButton;
    Bt_ParamLjDiasFornExcluir: TJvXPButton;
    Ts_ParamLjFornDias: TcxTabSheet;
    Gb_ParamLjDiasFornSelec: TGroupBox;
    Lbx_ParamLjDiasFornSelec: TListBox;
    Gb_ParamLjDiasFornDiasMeses: TGroupBox;
    Panel2: TPanel;
    Bt_ParamLjDiasFornVoltar: TJvXPButton;
    Bt_ParamLjDiasFornOK: TJvXPButton;
    PC_ParamLjDiasForn: TcxPageControl;
    Ts_ParamLjDias: TcxTabSheet;
    Ts_ParamLjSemana: TcxTabSheet;
    Ts_ParamLjMeses: TcxTabSheet;
    Pan_ParamLjSemana: TPanel;
    Pan_ParamLjMeses: TPanel;
    Label13: TLabel;
    EdtParamLjSemanaCadaSemana: TRxSpinEdit;
    Label12: TLabel;
    Label14: TLabel;
    Ckb_ParamLjSemana_Seg: TCheckBox;
    Ckb_ParamLjSemana_Ter: TCheckBox;
    Ckb_ParamLjSemana_Qua: TCheckBox;
    Ckb_ParamLjSemana_Qui: TCheckBox;
    Ckb_ParamLjSemana_Sex: TCheckBox;
    Cbx_ParamLjMesesPosicao: TComboBox;
    Cbx_ParamLjMesesDias: TComboBox;
    Lb_CadaMes: TLabel;
    Ckb_ParamLjMeses_Jan: TCheckBox;
    Ckb_ParamLjMeses_Jul: TCheckBox;
    Ckb_ParamLjMeses_Fev: TCheckBox;
    Ckb_ParamLjMeses_Ago: TCheckBox;
    Ckb_ParamLjMeses_Mar: TCheckBox;
    Ckb_ParamLjMeses_Set: TCheckBox;
    Ckb_ParamLjMeses_Abr: TCheckBox;
    Ckb_ParamLjMeses_Out: TCheckBox;
    Ckb_ParamLjMeses_Mai: TCheckBox;
    Ckb_ParamLjMeses_Nov: TCheckBox;
    Ckb_ParamLjMeses_Jun: TCheckBox;
    Ckb_ParamLjMeses_Dez: TCheckBox;
    Pan_ParamLjDias: TPanel;
    Lb_Dias: TLabel;
    Rb_ParamLjTodosDias: TRadioButton;
    Rb_ParamLjACada: TRadioButton;
    EdtParamLjCadaDia: TRxSpinEdit;
    Gb_ParamLjDiasFornLojas: TGroupBox;
    Dbg_ParamLjDiasFornLojas: TDBGridJul;
    StBar_ParamLjDiasForn: TdxStatusBar;
    Panel3: TPanel;
    Bt_ParamLjDiasFornMarcaTodos: TJvXPButton;
    Bt_ParamLjDiasFornDesMarcaTodos: TJvXPButton;
    Bt_ParamLjReplDesFazer: TJvXPButton;
    Ckb_GeraOCCalculoEstMinino: TJvXPCheckbox;
    Label1: TLabel;
    Label4: TLabel;
    Ckb_GeraOCCalculoCxEmbarque: TJvXPCheckbox;
    Bt_OCBuscaFornecDia: TJvXPButton;
    Ts_GeraOCTotFornec: TTabSheet;
    Dbg_GeraOCTotFornc: TDBGridJul;
    Panel4: TPanel;
    Label39: TLabel;
    EdtGeraOCTotalGeral: TCurrencyEdit;
    EdtGeraOCTotalItens: TCurrencyEdit;
    NUM: TCurrencyEdit;
    Ftp_Loja1: TIdFTP;
    IdAntiFreeze1: TIdAntiFreeze;
    IdFTP1: TIdFTP;
    Lb_CalculoFTP: TLabel;
    procedure Bt_OCFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PC_OrdemCompraChange(Sender: TObject);
    procedure PC_GeraOCApresentacaoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_GeraOCBuscaDoctoClick(Sender: TObject);
    procedure EdtGeraOCBuscaDoctoChange(Sender: TObject);
    procedure EdtGeraOCBuscaDoctoEnter(Sender: TObject);
    procedure EdtGeraOCBuscaDoctoExit(Sender: TObject);
    procedure Bt_OCBuscaProdutosClick(Sender: TObject);
    procedure Ckb_GeraOCCalculoEstoqueClick(Sender: TObject);
    procedure Ckb_GeraOCCalculoEstoqueKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ckb_GeraOCCalculoTransitoClick(Sender: TObject);
    procedure Ckb_GeraOCCalculoTransitoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_GeraOCCalcularClick(Sender: TObject);
    procedure Bt_GeraOCVoltarClick(Sender: TObject);

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Function  BuscaProdutosAnalise: Boolean;

    Procedure BuscaDemanda(Cbbx_Mes: TComboBox; Me_Ano: TMaskEdit; sCodProduto, sFilial: String;
                           Var Demanda: Currency; var iNrDias: Integer;
                           Var iNrMeses: Integer; bConsulta: Boolean);

    Function  ConsisteBuscaProdutos: Boolean;

    Procedure NomeMesesGrid;

    Procedure TotaisOC;

    Procedure AtualizaNumeroDosMeses;

    Procedure CalculoAnaliseMatriz;

    // Desabilita e Habilita Scroll do Mouse no DBGrid
    Procedure DesabilitaScrollMouse(var Msg: TMsg; var Handled: Boolean);
    Procedure HabilitaScrollMouse(var Msg: TMsg; var Handled: Boolean);

    // Acerta Entrada dos Parametros de Lojas
    Function  ParametrosEntrada: Boolean;

    // Acerta Cor do Fornecedor Principal
    Procedure AcertaCorFornPrincipal;

    // Salva as Ocorrencias de Fornecedores/Dia
    Function SalvaOcorrencias: Boolean;
    Function ProcessaOcorrenciasPorDias(sTipo, sCodLoja: String): Boolean;

    // Salva Arquivos Para Transferencia FTP para Lojas
    Function SalvarArquivosFTP: Boolean;

    // Envia Arquivo.SQL Para o Servidor FTP =====================================
    Procedure EnviaArqFTPServer;

    // FTP - Busca Parametros de Loja Unica
    Function LojaBuscaParametros:Boolean;

    // Atualiza Parametros da Loja
    Procedure LojaAtualizaParamLoja(sArq_DML: String);

    // Verifica Fornecedor a Comprar
    Function LojaFornecedoresComprarDia: Boolean;

    // Apresenta Solicitações em Aberto
    Procedure LojaApresSolicitacoesAbertas;

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure Dbg_GeraOCGridColEnter(Sender: TObject);
    procedure Dbg_GeraOCGridColExit(Sender: TObject);
    procedure Dbg_GeraOCGridDrawColumnCell(Sender: TObject;
              const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Dbg_GeraOCGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_GeraOCExcluirClick(Sender: TObject);
    procedure Bt_GeraOCFechaDocClick(Sender: TObject);
    procedure Dbg_GeraOCGridItensEnter(Sender: TObject);
    procedure Dbg_GeraOCGridEnter(Sender: TObject);
    procedure Dbg_GeraOCGridItensExit(Sender: TObject);
    procedure Dbg_GeraOCGridExit(Sender: TObject);
    procedure Ts_OCBuscaProdutosEnter(Sender: TObject);
    procedure PC_ParametroLojasChange(Sender: TObject);
    procedure Ckb_ParamLjSaldoClick(Sender: TObject);
    procedure Ckb_ParamLjSaldoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Dbg_ParamLjDiasEnter(Sender: TObject);
    procedure Dbg_ParamLjDiasExit(Sender: TObject);
    procedure Dbg_ParamLjDiasColEnter(Sender: TObject);
    procedure Dbg_ParamLjDiasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_ParamLjSalvarClick(Sender: TObject);
    procedure PC_ParamLjFornecedoresChange(Sender: TObject);
    procedure EdtParamLjLocalizaChange(Sender: TObject);
    procedure Bt_ParamLjReplTUDOClick(Sender: TObject);
    procedure Rb_ParamLjPerLimLojasClick(Sender: TObject);
    procedure Rb_ParamLjPerLimLojasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Dbg_ParamLjPerLimFornEnter(Sender: TObject);
    procedure Dbg_ParamLjPerLimFornExit(Sender: TObject);
    procedure Dbg_ParamLjPerLimFornKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Dbg_ParamLjPerLimitesEnter(Sender: TObject);
    procedure Dbg_ParamLjPerLimitesExit(Sender: TObject);
    procedure Dbg_ParamLjPerLimitesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_ParamLjFecharClick(Sender: TObject);
    procedure Dbg_ParamLjDiasFornEnter(Sender: TObject);
    procedure Dbg_ParamLjDiasFornExit(Sender: TObject);
    procedure Dbg_ParamLjDiasFornKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_ParamLjDiasFornIncluirClick(Sender: TObject);
    procedure Bt_ParamLjDiasFornExcluirClick(Sender: TObject);
    procedure Bt_ParamLjDiasFornVoltarClick(Sender: TObject);
    procedure Dbg_ParamLjDiasFornDblClick(Sender: TObject);
    procedure Dbg_ParamLjDiasFornDrawColumnCell(Sender: TObject;
              const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PC_ParamLjDiasFornChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxPageControl1Change(Sender: TObject);
    procedure Rb_ParamLjTodosDiasClick(Sender: TObject);
    procedure Rb_ParamLjTodosDiasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ckb_ParamLjSemana_SegClick(Sender: TObject);
    procedure Cbx_ParamLjMesesDiasChange(Sender: TObject);
    procedure Ckb_ParamLjSemana_SegKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ckb_ParamLjMeses_JanClick(Sender: TObject);
    procedure Ckb_ParamLjMeses_JanKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_ParamLjDiasFornOKClick(Sender: TObject);
    procedure Dbg_ParamLjDiasFornLojasDblClick(Sender: TObject);
    procedure Dbg_ParamLjDiasFornLojasDrawColumnCell(Sender: TObject; const Rect: TRect;
              DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Dbg_ParamLjDiasFornLojasEnter(Sender: TObject);
    procedure Dbg_ParamLjDiasFornLojasExit(Sender: TObject);
    procedure Dbg_ParamLjDiasFornLojasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_ParamLjDiasFornMarcaTodosClick(Sender: TObject);
    procedure Bt_ParamLjReplDesFazerClick(Sender: TObject);
    procedure Ckb_GeraOCCalculoEstMininoClick(Sender: TObject);
    procedure Ckb_GeraOCCalculoEstMininoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ckb_GeraOCCalculoCxEmbarqueClick(Sender: TObject);
    procedure Ckb_GeraOCCalculoCxEmbarqueKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_OCBuscaFornecDiaClick(Sender: TObject);
    procedure Dbg_GeraOCTotForncDblClick(Sender: TObject);
    procedure Dbg_GeraOCTotForncDrawColumnCell(Sender: TObject;
              const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
   THackDBGrid = class(TDBGrid);

var
  FrmGeraPedidosComprasLojas: TFrmGeraPedidosComprasLojas;

  TD : TTransactionDesc; // Ponteiro de Transação

  bgAltTrasito: Boolean;
  gDS: TDataSource;

  bgSolicFechada, bgSolicFechadaParcial: Boolean;

  sgFTP: string;

implementation

uses UDMBelShop, UDMConexoes, UDMVirtual, UFrmBelShop, DK_Procs1,
  UPesquisa, UFrmSelectEmpProcessamento, UFrmSolicitacoes, UVerTransito,
  UDMLojaUnica, IBCustomDataSet, IBQuery;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Apresenta Solicitações em Aberto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGeraPedidosComprasLojas.LojaApresSolicitacoesAbertas;
Var
  MySql: String;
Begin
  MySql:=' SELECT DISTINCT oc.num_documento, CAST(oc.dta_documento AS DATE) dta_documento,'+
         ' us.des_usuario Comprador'+

         ' FROM OC_COMPRAR oc'+
         '    LEFT JOIN PS_USUARIOS  us ON oc.cod_comprador=us.cod_usuario'+

         ' WHERE oc.ind_oc_gerada='+QuotedStr('N')+
         ' AND oc.num_documento<>'+VarToStr(EdtGeraOCBuscaDocto.Value)+
         ' ORDER BY 1';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(7);
  FrmSolicitacoes.EditorMargemLucro.Lines.Clear;
  FrmSolicitacoes.EditorMargemLucro.Lines.Add(BrancosEsquerda('Nº Solicitação',14)+#9+
                                              BrancosDireita('Data',10)+#9+
                                              BrancosDireita('Comprador',30));
  FrmSolicitacoes.EditorMargemLucro.Lines.Add(BrancosEsquerda('==============',14)+#9+
                                              BrancosDireita('==========',10)+#9+
                                              BrancosDireita('==============================',30));

  sgMensagem:='';
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    sgMensagem:='OK';

    FrmSolicitacoes.EditorMargemLucro.Lines.Add(
            BrancosEsquerda(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Documento').AsString,14)+#9+
            BrancosEsquerda(DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Documento').AsString,10)+#9+
            BrancosDireita(DMBelShop.CDS_BuscaRapida.FieldByName('Comprador').AsString,30));
    DMBelShop.CDS_BuscaRapida.Next;
  End;
  DMBelShop.CDS_BuscaRapida.Close;

  If Trim(sgMensagem)<>'' Then
  Begin
    FrmSolicitacoes.EditorMargemLucro.Lines.Add(BrancosEsquerda('==============',14)+#9+
                                                BrancosDireita('==========',10)+#9+
                                                BrancosDireita('==============================',30));
    FrmSolicitacoes.Ts_MargemLucroFormulas.Caption:='SOLICITAÇÃO EM ABERTO';
    FrmSolicitacoes.ShowModal;
  End;

  FreeAndNil(FrmSolicitacoes);
End; // Apresenta Solicitações em Aberto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Envia Arquivo.SQL Para o Servidor FTP >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGeraPedidosComprasLojas.EnviaArqFTPServer;
Var
  Ltbx: TListBox;
  i: Integer;
  sArq_DML: String;
  Ftp_Loja: TIdFTP;
Begin
//opssaqui - Inicio - 15/09/2014

  If Ftp_Loja<>nil then
  Begin
    FreeAndNil(Ftp_Loja);
  End;

//  If (sgFTP='') Or (sgFTP='Ftp_Loja') Then
   Ftp_Loja:=TIdFTP.Create(Ftp_Loja);

  If sgNomeComputador<>sgCompServer Then
  Begin
    sArq_DML:='*_DML_*.SQL';

    // ListBox com Nomes dos Arquivos que estao no Servidor de FTP ===============
    Ltbx:=TListBox.Create(Self);
    Ltbx.Visible:=False;
    Ltbx.Parent:=FrmGeraPedidosComprasLojas;
    Ltbx.Width:=500;
    Ltbx.Items.Clear;

    // Arquivo a Transferir para o Servidor FTP ================================
    OrdenaArqDataCriacao(Ltbx, sgPastaAreaFTP, sArq_DML, False);

    Try // Transfere o Arquivo ------------------------------------------
//      If sgFTP='Ftp_Loja1' Then
//      Begin
//        Ftp_Loja1.Disconnect;
//        Ftp_Loja1.Username:=sgFTPUser;
//        Ftp_Loja1.Password:=sgFTPSenha;
//        Ftp_Loja1.Passive := True;
//        Ftp_Loja1.TransferType:= ftBinary;
//      End;

//      If (sgFTP='') Or (sgFTP='Ftp_Loja') Then
//      Begin
        Ftp_Loja.Disconnect;
        Ftp_Loja.Username:=sgFTPUser;
        Ftp_Loja.Password:=sgFTPSenha;
        Ftp_Loja.Port:=21;
        Ftp_Loja.ReadTimeout := 10000;
        Ftp_Loja.Passive := True;
        Ftp_Loja.TransferType:= ftBinary;
//      End;

      // Conecta Servidor FTP ==========================
      Try
        Try
//          If sgFTP='Ftp_Loja1' Then
//          Begin
//            //Ftp_Loja1.Host:=sgIPServer;
//            Ftp_Loja1.Host:=sgIPInternetServer;
//            Ftp_Loja1.Connect;
//          End;

//          If (sgFTP='') Or (sgFTP='Ftp_Loja') Then
//          Begin
            Ftp_Loja.Host:=sgIPInternetServer;
            //Ftp_Loja.Host:=sgIPServer;
            Ftp_Loja.Connect;
//          End;
        Except
//          If sgFTP='Ftp_Loja1' Then
//          Begin
//            Ftp_Loja1.Host:=sgIPServer;
//            //Ftp_Loja1.Host:=sgIPInternetServer;
//            Ftp_Loja1.Connect;
//          End;

//          If (sgFTP='') Or (sgFTP='Ftp_Loja') Then
//          Begin
            Ftp_Loja.Host:=sgIPServer;
            //Ftp_Loja.Host:=sgIPInternetServer;
            Ftp_Loja.Connect;
//          End;
        End;
      Except // Conexão
        Begin
          // Desconceta Servidor FTP ===============================================
//          If sgFTP='Ftp_Loja1' Then
//           Ftp_Loja1.Disconnect;

//          If (sgFTP='') Or (sgFTP='Ftp_Loja') Then
           Ftp_Loja.Disconnect;

          Ltbx.Free;
          Ltbx:=Nil;

//          If (sgFTP='') Or (sgFTP='Ftp_Loja') Then
//          Begin
            Ftp_Loja.Free;
            Ftp_Loja:=nil;
//          End;

          Exit;
        End;
      End; // Conexão

      //==========================================================================
      // Transmissão FTP e Processamebnto DML de Parametros - INICIO =============
      //==========================================================================
      Try
        For i:=0 to Ltbx.Items.Count-1 do
        Begin
//          If sgFTP='Ftp_Loja1' Then
//           Ftp_Loja1.Put(sgPastaAreaFTP+Trim(Ltbx.Items.Strings[i]), Trim(Ltbx.Items.Strings[i]), True);
                // Pasta e Arquivo Origem, Arquivo no Servidor FTP

//          If (sgFTP='') Or (sgFTP='Ftp_Loja') Then
           Ftp_Loja.Put(sgPastaAreaFTP+Trim(Ltbx.Items.Strings[i]), Trim(Ltbx.Items.Strings[i]), True);
                // Pasta e Arquivo Origem, Arquivo no Servidor FTP
        End;

//        If sgFTP='Ftp_Loja1' Then
//         Ftp_Loja1.Disconnect;

//        If (sgFTP='') Or (sgFTP='Ftp_Loja') Then
         Ftp_Loja.Disconnect;
               
        // Apaga Arquivos do Servidor FTP =============================
        For i:=0 to Ltbx.Items.Count-1 do
        Begin
          DeleteFile(sgPastaAreaFTP+Ltbx.Items.Strings[i]); // Arquivo Local
        End;

        Ltbx.Free;
        Ltbx:=Nil;

//        If (sgFTP='') Or (sgFTP='Ftp_Loja') Then
//        Begin
          Ftp_Loja.Free;
          Ftp_Loja:=nil;
//        End;
      Except
        on e : Exception do
        Begin
//          If sgFTP='Ftp_Loja1' Then
//          Begin
//            Ftp_Loja1.Disconnect;
//            sgFTP:='Ftp_Loja'
//          End
//          Else If (sgFTP='') Or (sgFTP='Ftp_Loja') Then
//          Begin
            Ftp_Loja.Disconnect;
            sgFTP:='Ftp_Loja1';
//          End;

          MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);

          EnviaArqFTPServer;
        End; // on e : Exception do
      End; // Try

      If Ftp_Loja<>nil then
      Begin
        Ftp_Loja.Disconnect;
        Ftp_Loja.Free;
        Ftp_Loja:=nil;
      End;

    Except
      on e : Exception do
      Begin
//        If sgFTP='Ftp_Loja1' Then
//         Ftp_Loja1.Disconnect;

//        If (sgFTP='') Or (sgFTP='Ftp_Loja') Then
         Ftp_Loja.Disconnect;

        Ltbx.Free;
        Ltbx:=Nil;

        If Ftp_Loja<>nil then
        Begin
          Ftp_Loja.Disconnect;
          FreeAndNil(Ftp_Loja);
        End;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        exit;
      End; // on e : Exception do
    End; // Try - Transfere o Arquivo -------------------------------

//    If (sgFTP='') Or (sgFTP='Ftp_Loja') Then
//     sgFTP:='Ftp_Loja1'
//    Else
//     sgFTP:='Ftp_Loja';
  End; // If sgNomeComputador<>sgCompServer Then
//opssaqui - Fim - 15/09/2014
          //Ftp_Loja1
          // Disconnect;
          // sgFTP='Ftp_Loja
End;

// Verifica Fornecedor a Comprar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmGeraPedidosComprasLojas.LojaFornecedoresComprarDia: Boolean;
Var
  MySql: String;
  dDta, dDtaHoje: TDate;
  sDtaUltCalc, sDtaProxCalc: String;

  sDiasSemana, sDiaSemana: String;
  i: Integer;
  b: Boolean;

  sMes, sMeses, sProxMes: String;
  sPosDiaSemana: String;

  sDiariamente, sSemanalmente, sMensalmente: String;

Begin
  Result:=False;
  sgMensagem:='';

  dDtaHoje:=StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)));

  If (DiaSemanaNome(dDtaHoje)='Sábado') Or (DiaSemanaNome(dDtaHoje)='Domingo') Then
  Begin
    Result:=True;
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

    MySql:=' SELECT *'+
           ' FROM PARAMETROS_LOJAS e'+
           ' WHERE E.cod_loja='+QuotedStr(sgCodLojaUnica)+
           ' AND e.ind_tipo=7'+
           ' ORDER BY e.ind_diariamente, e.ind_semanamente, e.ind_mensalmente, e.num_seq';
    DMLojaUnica.CDS_ParametrosLoja.Close;
    DMLojaUnica.SDS_ParametrosLoja.CommandText:=MySql;
    DMLojaUnica.CDS_ParametrosLoja.Open;

    While Not DMLojaUnica.CDS_ParametrosLoja.Eof do
    Begin
      sDtaUltCalc  :='';
      sDtaProxCalc :='';
      sDiasSemana  :='';
      sDiaSemana   :='';
      sMes         :='';
      sMeses       :='';
      sProxMes     :='';
      sPosDiaSemana:='';

      // Verifica se o Fornecedor já foi calclual para Hoje ====================
      sDiariamente :=DMLojaUnica.CDS_ParametrosLojaIND_DIARIAMENTE.AsString;
      sSemanalmente:=DMLojaUnica.CDS_ParametrosLojaIND_SEMANAMENTE.AsString;
      sMensalmente :=DMLojaUnica.CDS_ParametrosLojaIND_MENSALMENTE.AsString;

      If Trim(DMLojaUnica.CDS_ParametrosLojaDTA_PROX_CALCULO.AsString)<>'' Then
      Begin
        dDta:=StrToDate(DateToStr(DMLojaUnica.CDS_ParametrosLojaDTA_PROX_CALCULO.AsDateTime));

        If dDta>=dDtaHoje Then
        Begin
          sDiariamente :='NAO';
          sSemanalmente:='NAO';
          sMensalmente :='NAO';
        End;
      End; // If Trim(DMLojaUnica.CDS_ParametrosLojaDTA_PROX_CALCULO.AsString)<>'' Then

      //========================================================================
      // Fornecedores a Comprar Diariamente - INICIO ===========================
      //========================================================================
      If Trim(sDiariamente)='SIM' Then
      Begin
        If Trim(DMLojaUnica.CDS_ParametrosLojaDTA_PROX_CALCULO.AsString)='' Then
         Begin
           sDtaUltCalc :=DateToStr(dDtaHoje);
           sDtaProxCalc:=DateToStr(dDtaHoje);
         End
        Else If StrToDate(DateToStr(DMLojaUnica.CDS_ParametrosLojaDTA_PROX_CALCULO.AsDateTime))<=dDtaHoje Then
         Begin
           sDtaUltCalc :=DateToStr(DMLojaUnica.CDS_ParametrosLojaDTA_PROX_CALCULO.AsDateTime);
           sDtaProxCalc:=DateToStr(DMLojaUnica.CDS_ParametrosLojaDTA_PROX_CALCULO.AsDateTime);

           While StrToDate(sDtaProxCalc)<dDtaHoje do
           Begin
             If Trim(DMLojaUnica.CDS_ParametrosLojaIND_TODOS_DIAS.AsString)='SIM' Then
              sDtaProxCalc:=DateToStr(StrToDate(sDtaProxCalc)+1)
             Else
              sDtaProxCalc:=DateToStr(StrToDate(sDtaProxCalc)+DMLojaUnica.CDS_ParametrosLojaCADA_NUM_DIAS.AsInteger);

             If DiaSemanaNome(StrToDate(sDtaProxCalc))='Sábado' Then
              sDtaProxCalc:=DateToStr(StrToDate(sDtaProxCalc)+2);

             If DiaSemanaNome(StrToDate(sDtaProxCalc))='Domingo' Then
              sDtaProxCalc:=DateToStr(StrToDate(sDtaProxCalc)+1);
           End; //While DtaProximCalculo.Date<CalendHoje.DateFirst do

         End; // If Trim(DMLojaUnica.CDS_ParametrosLojaDTA_PROX_CALCULO.AsString)='' Then
      End; // If Trim(DMLojaUnica.CDS_ParametrosLojaIND_DIARIAMENTE.AsString)='SIM' Then
      //========================================================================
      // Fornecedores a Comprar Diariamente - FIM ==============================
      //========================================================================

      //========================================================================
      // Fornecedores a Comprar Semanalmente - INICIO ==========================
      //========================================================================
      If Trim(sSemanalmente)='SIM' Then
      Begin
        If Trim(DMLojaUnica.CDS_ParametrosLojaDTA_ULT_CALCULO.AsString)<>'' Then
         sDtaUltCalc:=DateToStr(DMLojaUnica.CDS_ParametrosLojaDTA_ULT_CALCULO.AsDateTime);

        If Trim(DMLojaUnica.CDS_ParametrosLojaDTA_PROX_CALCULO.AsString)<>'' Then
         sDtaProxCalc:=DateToStr(DMLojaUnica.CDS_ParametrosLojaDTA_PROX_CALCULO.AsDateTime);

        // Monta Dias para Calculo ==============================================
        If Trim(DMLojaUnica.CDS_ParametrosLojaDIA_SEG.AsString)='SIM' Then sDiasSemana:=sDiasSemana+AnsiUpperCase('Segunda ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaDIA_TER.AsString)='SIM' Then sDiasSemana:=sDiasSemana+AnsiUpperCase('Terça ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaDIA_QUA.AsString)='SIM' Then sDiasSemana:=sDiasSemana+AnsiUpperCase('Quarta ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaDIA_QUI.AsString)='SIM' Then sDiasSemana:=sDiasSemana+AnsiUpperCase('Quinta ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaDIA_SEX.AsString)='SIM' Then sDiasSemana:=sDiasSemana+AnsiUpperCase('Sexta ');

        If Trim(sDtaUltCalc)='' Then
         Begin
           dDta:=dDtaHoje;
           b:=True;
           While b do
           Begin
             sDiaSemana:=AnsiUpperCase(DiaSemanaNome(dDta));

             If AnsiContainsStr(sDiasSemana,sDiaSemana) Then
             Begin
               sDtaProxCalc:=DateToStr(dDta);
               sDtaUltCalc :=DateToStr(dDta);
               b:=False;
             End;
             dDta:=dDta+1;
           End; // While b do
         End
        Else If StrToDate(sDtaProxCalc)<dDtaHoje Then
         Begin
           i:=0;
           dDta:=StrToDate(sDtaUltCalc);

           b:=True;
           While b do
           Begin
             dDta:=dDta+1;
             sDiaSemana:=AnsiUpperCase(DiaSemanaNome(dDta));

             // Conta a Semana
             If sDiaSemana=AnsiUpperCase('Domingo') Then
              Inc(i);

             If (AnsiContainsStr(sDiasSemana,sDiaSemana)) and ((i=0) Or (i=DMLojaUnica.CDS_ParametrosLojaCADA_NUM_SEMANA.AsInteger)) Then
             Begin
               sDtaProxCalc:=DateToStr(dDta);
               sDtaUltCalc :=DateToStr(dDta);
               b:=False;
             End;
           End; // While b do
         End; // If StrToDate(sDtaProxCalc)<dDtaHoje Then
      End; // If Trim(DMLojaUnica.CDS_ParametrosLojaInd_Semanalmente.AsString)='SIM' Then
      //========================================================================
      // Fornecedores a Comprar Semanalmente - FIM =============================
      //========================================================================

      //========================================================================
      // Fornecedores a Comprar Mensalmente - INICIO ===========================
      //========================================================================
      If Trim(sMensalmente)='SIM' Then
      Begin
        If Trim(DMLojaUnica.CDS_ParametrosLojaDTA_PROX_CALCULO.AsString)<>'' Then
         sDtaUltCalc :=DateToStr(DMLojaUnica.CDS_ParametrosLojaDTA_PROX_CALCULO.AsDateTime);

        sDtaProxCalc:='';

        dDta:=dDtaHoje;
        sDiaSemana:=DateToStr(dDta);
        dDta:=StrToDate(sDiaSemana);

        // Monta Dias para Calculo ==============================================
        If Trim(DMLojaUnica.CDS_ParametrosLojaDIA_SEG.AsString)='SIM' Then sDiasSemana:=sDiasSemana+AnsiUpperCase('Segunda ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaDIA_TER.AsString)='SIM' Then sDiasSemana:=sDiasSemana+AnsiUpperCase('Terça ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaDIA_QUA.AsString)='SIM' Then sDiasSemana:=sDiasSemana+AnsiUpperCase('Quarta ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaDIA_QUI.AsString)='SIM' Then sDiasSemana:=sDiasSemana+AnsiUpperCase('Quinta ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaDIA_SEX.AsString)='SIM' Then sDiasSemana:=sDiasSemana+AnsiUpperCase('Sexta ');

        // Monta Meses para Calculo ============================================
        If Trim(DMLojaUnica.CDS_ParametrosLojaMES_JAN.AsString)='SIM' Then sMeses:=sMeses+AnsiUpperCase('jan ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaMES_FEV.AsString)='SIM' Then sMeses:=sMeses+AnsiUpperCase('fev ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaMES_MAR.AsString)='SIM' Then sMeses:=sMeses+AnsiUpperCase('mar ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaMES_ABR.AsString)='SIM' Then sMeses:=sMeses+AnsiUpperCase('abr ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaMES_MAI.AsString)='SIM' Then sMeses:=sMeses+AnsiUpperCase('mai ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaMES_JUN.AsString)='SIM' Then sMeses:=sMeses+AnsiUpperCase('jun ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaMES_JUL.AsString)='SIM' Then sMeses:=sMeses+AnsiUpperCase('jul ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaMES_AGO.AsString)='SIM' Then sMeses:=sMeses+AnsiUpperCase('ago ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaMES_SET.AsString)='SIM' Then sMeses:=sMeses+AnsiUpperCase('set ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaMES_OUT.AsString)='SIM' Then sMeses:=sMeses+AnsiUpperCase('out ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaMES_NOV.AsString)='SIM' Then sMeses:=sMeses+AnsiUpperCase('nov ');
        If Trim(DMLojaUnica.CDS_ParametrosLojaMES_DEZ.AsString)='SIM' Then sMeses:=sMeses+AnsiUpperCase('dez ');

        sMes:=AnsiUpperCase(ShortMonthNames[MonthOf(dDta)]);
        sDiaSemana:=AnsiUpperCase(DiaSemanaNome(dDta));
        sPosDiaSemana:=DiaNoMes(dDta);

        If AnsiContainsStr(sMeses,sMes) Then
        Begin
          b:=True;
          While b do
          Begin

            If (Trim(DMLojaUnica.CDS_ParametrosLojaDES_POSICAO.AsString)='Todas(os)') And
               (Trim(DMLojaUnica.CDS_ParametrosLojaDIA_DIAS.AsString)='SIM') Then
            Begin
              If Trim(sDtaUltCalc)='' Then
               Begin
                 sDtaProxCalc:=DateToStr(dDta);
               End
              Else // If Trim(sDtaUltCalc)='' Then
               Begin
                 If Trim(sDtaProxCalc)='' Then
                 Begin
                   sProxMes:=AnsiUpperCase(ShortMonthNames[MonthOf(StrToDate(sDtaUltCalc)+1)]);
                   If AnsiContainsStr(sMeses,sProxMes) Then
                    sDtaProxCalc:=DateToStr(StrToDate(sDtaUltCalc)+1)
                   Else
                    sDtaProxCalc:=DateToStr(dDta);
                 End
                 Else
                 Begin
                   sProxMes:=AnsiUpperCase(ShortMonthNames[MonthOf(StrToDate(sDtaProxCalc)+1)]);
                   If AnsiContainsStr(sMeses,sProxMes) Then
                    sDtaProxCalc:=DateToStr(StrToDate(sDtaProxCalc)+1)
                   Else
                    sDtaProxCalc:=DateToStr(dDta);
                 End;
               End;

               If DiaSemanaNome(StrToDate(sDtaProxCalc))='Sábado' Then
               Begin
                sProxMes:=AnsiUpperCase(ShortMonthNames[MonthOf(StrToDate(sDtaProxCalc)+2)]);
                If AnsiContainsStr(sMeses,sProxMes) Then
                 sDtaProxCalc:=DateToStr(StrToDate(sDtaProxCalc)+2)
                Else
                 Begin
                   sDtaProxCalc:=DateToStr(StrToDate(sDtaProxCalc)+1);
                   Break;
                 End;
               End
              Else If DiaSemanaNome(StrToDate(sDtaProxCalc))='Domingo'Then
               Begin
                sProxMes:=AnsiUpperCase(ShortMonthNames[MonthOf(StrToDate(sDtaProxCalc)+1)]);
                If AnsiContainsStr(sMeses,sProxMes) Then
                 Begin
                   sDtaProxCalc:=DateToStr(StrToDate(sDtaProxCalc)+1)
                 End
                Else
                 Begin
                   sDtaProxCalc:=DateToStr(StrToDate(sDtaProxCalc)-1);
                   Break;
                 End;
               End;

              If StrToDate(sDtaProxCalc)>=dDta Then
               Break;
            End
            Else If (Trim(DMLojaUnica.CDS_ParametrosLojaDES_POSICAO.AsString)='Todas(os)') And
                    (AnsiContainsStr(sDiasSemana,sDiaSemana)) Then // (AnsiUpperCase(Trim(DMLojaUnica.CDS_ParametrosLojaDIA_DIAS.AsString))=sDiaSemana) Then
            Begin
              sDtaProxCalc:=DateToStr(dDta);
              Break;
            End
            Else If (Trim(DMLojaUnica.CDS_ParametrosLojaDES_POSICAO.AsString)=sPosDiaSemana) And
                    (AnsiContainsStr(sDiasSemana,sDiaSemana)) Then // (AnsiUpperCase(Trim(DMLojaUnica.CDS_ParametrosLojaDIA_DIAS.AsString))=sDiaSemana) Then
            Begin
              sDtaProxCalc:=DateToStr(dDta);
              Break;
            End
            Else If (Trim(DMLojaUnica.CDS_ParametrosLojaDES_POSICAO.AsString)=sPosDiaSemana) And
                    (Trim(DMLojaUnica.CDS_ParametrosLojaDIA_DIAS.AsString)='SIM') Then
            Begin
              sDtaProxCalc:=DateToStr(dDta);
              Break;
            End
            Else
            Begin
              Break;
            End;
          End; // If (Trim(DMLojaUnica.CDS_ParametrosLojaDES_POSICAO.AsString)='Todas(os)') And
               //    (Trim(DMLojaUnica.CDS_ParametrosLojaDIA_DIAS.AsString)=='SIM') Then
        End; // If AnsiContainsStr(sMeses,sMes) Then
      End; // If Trim(DMLojaUnica.CDS_ParametrosLojaIND_MENSALMENTE.AsString)='SIM' Then
      //========================================================================
      // Fornecedores a Comprar Mensalmente - FIM ==============================
      //========================================================================

      // Grava Datas de Processamentos dos Fronecedores ========================
      MySqlSelect:='';
      If (Trim(sDtaUltCalc)<>'') Or (Trim(sDtaProxCalc)<>'') Then
      Begin
        MySql:=' UPDATE parametros_lojas pl';

               If Trim(sDtaUltCalc)<>'' Then
               Begin
                 If Trim(MySqlSelect)='' Then
                  MySqlSelect:=' SET pl.dta_ult_calculo='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaUltCalc)))
                 Else
                  MySqlSelect:=MySqlSelect+', pl.dta_ult_calculo='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaUltCalc)));
               End;

               If Trim(sDtaProxCalc)<>'' Then
               Begin
                 If Trim(MySqlSelect)='' Then
                  MySqlSelect:=' SET pl.dta_prox_calculo='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaProxCalc)))
                 Else
                  MySqlSelect:=MySqlSelect+', pl.dta_prox_calculo='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaProxCalc)));
               End;

               MySql:=MySql+MySqlSelect+' WHERE pl.num_seq='+QuotedStr(DMLojaUnica.CDS_ParametrosLojaNUM_SEQ.AsString);
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End;

      DMLojaUnica.CDS_ParametrosLoja.Next;
    End; // While Not DMLojaUnica.CDS_ParametrosLoja.Eof do
    DMLojaUnica.CDS_ParametrosLoja.Close;

    Result:=True;

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

      sgMensagem:=e.message;
      Exit;
    End; // on e : Exception do
  End; // Try
End; // Verifica Fornecedor a Comprar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Parametros da Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGeraPedidosComprasLojas.LojaAtualizaParamLoja(sArq_DML: String);
var
  slAtualiza : TStringList;
  i : integer;
  MySql: String;
begin
  If Trim(sArq_DML)<>'' Then
  Begin
    slAtualiza := TStringList.Create;
    slAtualiza.LoadFromFile(sArq_DML);
    i := 0;

    // Processa Arquivo ==========================================================
    If slAtualiza.Strings[i] <> '[INICIO]' Then
    Begin
      FreeAndNil(slAtualiza);
      Exit;
    End
    Else // if slAtualiza.Strings[i] <> '[INICIO]' then
    Begin
      Try
        FrmBelShop.LB_DML.Visible:=True;

        MySql:='';
        While i < slAtualiza.Count do
        Begin
          If slAtualiza.Strings[i] = '[INICIO]' Then
          Begin
            i := i + 1;
            With DMBelShop.SQLC do
            Begin
              While slAtualiza.Strings[i] <> '[FIM]' do
              Begin
                Refresh;

                MySql:=MySql+' '+slAtualiza.Strings[i];
                i := i + 1;
              End; // while slAtualiza.Strings[i] <> '[FIM]' do

              FrmBelShop.LB_DML.Caption := MySql;

              Execute(MySql, nil, nil);

              MySql:='';
            End; // With DMBelShop.SQLC do
          End; // if slAtualiza.Strings[i] = '[INICIO]' then

          i := i + 1;
        End; // While i < slAtualiza.Count do

        // Exclui Arquivo Processado =============================================
        DeleteFile(sArq_DML);

        Screen.Cursor:=crDefault;

        FrmBelShop.LB_DML.Visible:=False;

      Except // Try
        on e : Exception do
        Begin
          sgMensagem:='Erro ao Atualizar Parametros !!'+cr+cr+'Mensagem de erro do Sistema:'+#13+e.message;

          FrmBelShop.LB_DML.Visible:=False;
          FreeAndNil(slAtualiza);
          exit;
        End;

      End; // Try
      FreeAndNil(slAtualiza);
    End; // if slAtualiza.Strings[i] <> '[INICIO]' then
  End; // If Trim(sArq_DML)<>'' Then

  // Atualzia Novos registro do Tipo=7 =========================================
  MySql:=' SELECT pl.num_dia_calculo, pl.dta_ult_calculo, pl.dta_prox_calculo'+
         ' FROM  PARAMETROS_LOJAS pl'+
         ' WHERE pl.ind_dml='+QuotedStr('EXC')+
         ' AND   pl.num_seq=0'+
         ' AND   pl.ind_tipo=7';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    sgDtaI:=DMBelShop.CDS_BuscaRapida.FieldByName('dta_ult_calculo').AsString;
    sgDtaI:=f_Troca('-','.',f_Troca('/','.',sgDtaI));

    sgDtaF:=DMBelShop.CDS_BuscaRapida.FieldByName('dta_prox_calculo').AsString;
    sgDtaF:=f_Troca('-','.',f_Troca('/','.',sgDtaF));

    MySql:=' UPDATE PARAMETROS_LOJAS pl';

           If Trim(sgDtaI)<>'' Then
            MySql:=MySql+' SET pl.dta_ult_calculo='+QuotedStr(sgDtaI)
           Else
            MySql:=MySql+' SET pl.dta_ult_calculo=NULL';

           If Trim(sgDtaF)<>'' Then
            MySql:=MySql+', pl.dta_prox_calculo='+QuotedStr(sgDtaF)
           Else
            MySql:=MySql+', pl.dta_prox_calculo=NULL';

           MySql:=MySql+' WHERE pl.Num_Seq='+DMBelShop.CDS_BuscaRapida.FieldByName('num_dia_calculo').AsString;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DMBelShop.CDS_BuscaRapida.Next;
  End;

  DMBelShop.CDS_BuscaRapida.Close;

  // Exclui os IND_DML='EXC' ===================================================
  MySql:=' DELETE FROM PARAMETROS_LOJAS pl'+
         ' WHERE pl.ind_dml='+QuotedStr('EXC')+
         ' AND   pl.num_seq=0'+
         ' AND   pl.ind_tipo=7';
  DMBelShop.SQLC.Execute(MySql,nil,nil);

End; // Atualiza Parametros da Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// FTP - Busca e Atualiza Parametros de Loja Unica >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmGeraPedidosComprasLojas.LojaBuscaParametros:Boolean;
Var
  Ltbx: TListBox;
  i: Integer;
  sArq_DML: String;
  MySql: String;

  Ftp_Loja: TIdFTP;
Begin
  Screen.Cursor:=crAppStart;

  Result:=False;

//OdirFTP - INICIO
  // Cria Componente de FTP ====================================================
  If sgFTPUsar='SIM' Then
  Begin
    If Ftp_Loja<>nil then
    Begin
      FreeAndNil(Ftp_Loja);
    End;
    Ftp_Loja:=TIdFTP.Create(Ftp_Loja);

    sgMensagem:='Erro de Conexão FTP com a MATRIZ !!'+cr+cr+
                'Entre em Contato com a Matriz !!'+cr+cr+
                'O SISTEMA Será Encerrado !!';
  End; // If sgFTPUsar='SIM' Then
//OdirFTP - FIM

  // ListBox com Nomes dos Arquivos que estao no Servidor de FTP ===============
  Ltbx:=TListBox.Create(Self);
  Ltbx.Visible:=False;
  Ltbx.Parent:=FrmGeraPedidosComprasLojas;
  Ltbx.Width:=500;
  Ltbx.Items.Clear;

  // Arquivos Buscar ===========================================================
  sArq_DML:=sgCodLojaUnica+'_DML_*.SQL';

  // Verifica se Transação esta Ativa ==========================================
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);

  // Busca Parametros da Loja ==================================================
  Try // Try Geral
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';

//OdirFTP - INICIO
    // Desconecta Servidor de FTP e Informa Senha e usuario de FTP =============
    If sgFTPUsar='SIM' Then
    Begin
      Ftp_Loja.Disconnect;
      Ftp_Loja.Username:=sgFTPUser;
      Ftp_Loja.Password:=sgFTPSenha;
      Ftp_Loja.Passive := True;

      // Conecta Servidor FTP e Guarda Aqruivos ==================================
      Try // Conexão
        Try
          Ftp_Loja.Host:=sgIPServer;
          Ftp_Loja.Connect;
          Ftp_Loja.List(Ltbx.Items, sArq_DML,false);
        Except
          Ftp_Loja.Host:=sgIPInternetServer;
          Ftp_Loja.Connect;
          Ftp_Loja.List(Ltbx.Items, sArq_DML,false);
        End;
      Except // Conexão
        // Desconceta Servidor FTP ===============================================
        Ftp_Loja.Disconnect;
        Ftp_Loja.Free;
        Ftp_Loja:=nil;

        Ltbx.Free;
        Ltbx:=Nil;
        Exit;
      End; // Conexão

      //==========================================================================
      // Transmissão FTP e Processamebnto DML de Parametros - INICIO =============
      //==========================================================================
      Try
        // Busca Arquivos do Servidor FTP =============================
        For i:=0 to Ltbx.Items.Count-1 do
        Begin
          Ftp_Loja.Get(Ltbx.Items.Strings[i], sgPastaAreaFTP+Ltbx.Items.Strings[i], false);
              // (Arquivo no Servidor  , Pasta e Arquivo Destino)
          sgMensagem:='Erro ao Tentar Buscar Arquivos FTP';
        End;

        // Apaga Arquivos do Servidor FTP =============================
        For i:=0 to Ltbx.Items.Count-1 do
        Begin
          Ftp_Loja.Delete(Ltbx.Items[i]); // Arquivo no Servidor FTP
          sgMensagem:='Erro ao Tentar Deletar Arquivos FTP';
        End;

        // Desconceta Servidor FTP ====================================
        Ftp_Loja.Disconnect;
        Ftp_Loja.Free;
        Ftp_Loja:=nil;

        // Buscar Nome dos Arquivoa a Processar Em Ordem de Data de Criação ======
        Ltbx.Items.Clear;
        OrdenaArqDataCriacao(Ltbx, sgPastaAreaFTP, sArq_DML, False);

        // Atualiza Parametros da Loja ================================
        For i:=0 to Ltbx.Items.Count-1 do
        Begin
          If FileExists(sgPastaAreaFTP+Ltbx.Items[i]) Then
          Begin
            LojaAtualizaParamLoja(sgPastaAreaFTP+Ltbx.Items[i]);
          End;
        End;
      Except
        on e : Exception do
        Begin
          // Desconceta Servidor FTP ==================================
          Ftp_Loja.Disconnect;
          Ftp_Loja.Free;
          Ftp_Loja:=nil;

          DMBelShop.SQLC.Rollback(TD);

          DateSeparator:='/';
          Screen.Cursor:=crDefault;

          Ltbx.Free;
          Ltbx:=Nil;
          Exit;
        End; // on e : Exception do
      End; // Try
      //==========================================================================
      // Transmissão FTP e Processamebnto DML de Parametros - FIM ================
      //==========================================================================
    End; // If sgFTPUsar='SIM' Then
//OdirFTP - FIM

    // Inicializa Data para Busca Para Atualizações ============================
    sgDtaInicio:=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)-10);

    //==========================================================================
    // Atualiza Lista de Precos - INICIO =======================================
    //==========================================================================
    MySql:=' SELECT lp.codlista'+
           ' FROM LISTAPRE lp'+
           ' WHERE Cast(lp.dta_atualizacao as Date)=CURRENT_DATE';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodLista').AsString)='' Then
    Begin
      FrmBelShop.OdirPanApres.Visible:=False;
      FrmBelShop.OdirPanApres.Caption:='AGUARDE !! Atualizando Parâmetros de Lista de Preços...';
      FrmBelShop.OdirPanApres.Width:=Length(FrmBelShop.OdirPanApres.Caption)*10;
      FrmBelShop.OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShop.Width-FrmBelShop.OdirPanApres.Width)/2));
      FrmBelShop.OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShop.Height-FrmBelShop.OdirPanApres.Height)/2))-20;
      FrmBelShop.OdirPanApres.Visible:=True;

      sgMensagem:='Erro ao Atualizar Lista de Preços !!'+cr+cr+
                  'Entre em Contato com a Matriz !!'+cr+cr+
                  'O SISTEMA Será Encerrado !!';

      MySql:=' SELECT'+
             ' l.CODLISTA, l.CODPRODUTO, l.PRECOCOMPRA, l.MARGEM, l.PRECOVENDA, l.PRECOANTERIOR,'+
             ' l.DATAALTERACAO, l.HORAALTERACAO, l.DESCONTO, l.DESCONTOMAX, l.DESATIVADO,'+
             ' l.PRECODOLAR, l.ACRECIMOLISTA, l.CUSTOSLISTA, CURRENT_DATE DTA_ATUALIZACAO'+

             ' FROM LISTAPRE l'+

             ' WHERE Cast(l.dataalteracao as Date)>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaInicio)))+
             ' ORDER BY 1';
      FrmBelShop.IBQ_Matriz.Close;
      FrmBelShop.IBQ_Matriz.SQL.Clear;
      FrmBelShop.IBQ_Matriz.SQL.Add(MySql);
      FrmBelShop.IBQ_Matriz.Open;

      FrmBelShop.MontaProgressBar(True, FrmBelShop);
      FrmBelShop.IBQ_Matriz.Last;
      pgProgBar.Properties.Max:=FrmBelShop.IBQ_Matriz.RecordCount;
      pgProgBar.Position:=0;
      FrmBelShop.IBQ_Matriz.First;

      DMLojaUnica.CDS_ImpListaPreco.Open;
      While not FrmBelShop.IBQ_Matriz.Eof do
      Begin
        Application.ProcessMessages;

        pgProgBar.Position:=FrmBelShop.IBQ_Matriz.RecNo;

        MySql:=' Delete From LISTAPRE lp'+
               ' Where lp.CodProduto='+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('CODPRODUTO').AsString)+
               ' And   lp.CodLista='+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('CODLISTA').AsString);
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        DMLojaUnica.CDS_ImpListaPreco.Insert;
        For i:=0 to FrmBelShop.IBQ_Matriz.FieldCount-1 do
         DMLojaUnica.CDS_ImpListaPreco.Fields[i].Assign(FrmBelShop.IBQ_Matriz.Fields[i]);

        DMLojaUnica.CDS_ImpListaPreco.Post;

        FrmBelShop.IBQ_Matriz.Next;
      End; // While not FrmBelShop.IBQ_Matriz.Eof do

      DMLojaUnica.CDS_ImpListaPreco.ApplyUpdates(0);
      FrmBelShop.IBQ_Matriz.Close;
      DMLojaUnica.CDS_ImpListaPreco.Close;

      FrmBelShop.OdirPanApres.Visible:=False;
      FrmBelShop.MontaProgressBar(False, FrmBelShop);
    End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodLista').AsString)='' Then
    DMBelShop.CDS_BuscaRapida.Close;
    //==========================================================================
    // Atualiza Lista de Precos - FIM ==========================================
    //==========================================================================

    //==========================================================================
    // Atualiza Fornecedores - INICIO ==========================================
    //==========================================================================
    MySql:=' SELECT FIRST 1 f.codfornecedor'+
           ' FROM FORNECEDOR f'+
           ' WHERE CAST(f.dta_atualizacao AS Date)=CURRENT_DATE';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodFornecedor').AsString)='' Then
    Begin
      FrmBelShop.OdirPanApres.Visible:=False;
      FrmBelShop.OdirPanApres.Caption:='AGUARDE !! Atualizando Parâmetros de Fornecedores...';
      FrmBelShop.OdirPanApres.Width:=Length(FrmBelShop.OdirPanApres.Caption)*10;
      FrmBelShop.OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShop.Width-FrmBelShop.OdirPanApres.Width)/2));
      FrmBelShop.OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShop.Height-FrmBelShop.OdirPanApres.Height)/2))-20;
      FrmBelShop.OdirPanApres.Visible:=True;

      sgMensagem:='Erro ao Atualizar Fornecedores !!'+cr+cr+
                  'Entre em Contato com a Matriz !!'+cr+cr+
                  'O SISTEMA Será Encerrado !!';

      MySql:=' SELECT'+
             ' f.CODFORNECEDOR, f.NOMEFORNECEDOR, f.EFILIAL, f.CODTIPOFOR, f.CIDADE,'+
             ' f.ESTADO, f.CODIGOPOSTAL, f.NUMEROCGCMF, f.NUMEROINSC, f.NUMEROISSQN,'+
             ' f.NUMEROCPF, f.PESSOA, f.FONE1, f.FONE2, f.FONEFAX, f.INTERNET, f.EMAIL,'+
             ' f.CLASSEFOR, f.CONTATO, f.OBSERVACAO, f.BAIRRO, f.SIMPLESESTADUAL,'+
             ' f.CODCENTROCUSTO, f.LOGRADOURO, f.LOGNUMERO, f.LOGCOMPL, f.CODPAIS, f.RAZAOSOCIAL,'+
             ' f.DATAALTERACAO, f.FORISENTOICM, f.FORISENTOIPI, f.FORISENTOSUBST,'+
             ' f.FORISENTOPISCOFINS, f.USAICMCOMPRA2_SN,'+
             ' CURRENT_TIMESTAMP DTA_ATUALIZACAO'+

             ' FROM FORNECED f'+

             ' WHERE Cast(f.dataalteracao as Date)>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaInicio)))+
             ' ORDER BY 1';
      FrmBelShop.IBQ_Matriz.Close;
      FrmBelShop.IBQ_Matriz.SQL.Clear;
      FrmBelShop.IBQ_Matriz.SQL.Add(MySql);
      FrmBelShop.IBQ_Matriz.Open;

      FrmBelShop.MontaProgressBar(True, FrmBelShop);
      FrmBelShop.IBQ_Matriz.Last;
      pgProgBar.Properties.Max:=FrmBelShop.IBQ_Matriz.RecordCount;
      pgProgBar.Position:=0;
      FrmBelShop.IBQ_Matriz.First;

      DMLojaUnica.CDS_ImpFornecedor.Open;
      While not FrmBelShop.IBQ_Matriz.Eof do
      Begin
        Application.ProcessMessages;

        pgProgBar.Position:=FrmBelShop.IBQ_Matriz.RecNo;

        MySql:=' DELETE FROM FORNECEDOR f'+
               ' WHERE f.codfornecedor='+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('CODFORNECEDOR').AsString);
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        DMLojaUnica.CDS_ImpFornecedor.Insert;
        For i:=0 to FrmBelShop.IBQ_Matriz.FieldCount-1 do
         DMLojaUnica.CDS_ImpFornecedor.Fields[i].Assign(FrmBelShop.IBQ_Matriz.Fields[i]);

        DMLojaUnica.CDS_ImpFornecedor.Post;

        FrmBelShop.IBQ_Matriz.Next;
      End; // While not FrmBelShop.IBQ_Matriz.Eof do

      DMLojaUnica.CDS_ImpFornecedor.ApplyUpdates(0);
      FrmBelShop.IBQ_Matriz.Close;
      DMLojaUnica.CDS_ImpFornecedor.Close;

      FrmBelShop.OdirPanApres.Visible:=False;
      FrmBelShop.MontaProgressBar(False, FrmBelShop);
    End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodFornecedor').AsString)='' Then
    DMBelShop.CDS_BuscaRapida.Close;
    //==========================================================================
    // Atualiza Fornecedores - FIM =============================================
    //==========================================================================

    //==========================================================================
    // Atualiza Produtos - INICIO ==============================================
    //==========================================================================
    MySql:=' SELECT FIRST 1 p.codproduto'+
           ' FROM PRODUTO p'+
           ' WHERE cast(p.dta_atualizacao as Date)=CURRENT_DATE';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodProduto').AsString)='' Then
    Begin
      FrmBelShop.OdirPanApres.Visible:=False;
      FrmBelShop.OdirPanApres.Caption:='AGUARDE !! Atualizando Parâmetros de Produtos...';
      FrmBelShop.OdirPanApres.Width:=Length(FrmBelShop.OdirPanApres.Caption)*10;
      FrmBelShop.OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShop.Width-FrmBelShop.OdirPanApres.Width)/2));
      FrmBelShop.OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShop.Height-FrmBelShop.OdirPanApres.Height)/2))-20;
      FrmBelShop.OdirPanApres.Visible:=True;
      Refresh;

      sgMensagem:='Erro ao Atualizar Produtos !!'+cr+cr+
                  'Entre em Contato com a Matriz !!'+cr+cr+
                  'O SISTEMA Será Encerrado !!';

      MySql:=' SELECT'+
             ' pr.codproduto, pr.apresentacao, pr.codbarra, pr.situacaopro,'+
             ' pr.unidade, pr.unidadeestoque, pr.classeabc, pr.principalfor,'+
             ' fo.nomefornecedor, pr.referencia, pr.codgruposub, gr.codgrupo,'+
             ' gr.nomegrupo, sg.codsubgrupo, sg.nomesubgrupo, pr.codfamiliapreco,'+
             ' fp.nomefamiliapreco, pr.nomegenerico, pr.codaplicacao, ap.nomeaplicacao,'+
             ' pr.codicmvenda, pr.codicmcompra, pr.codipicompra, pr.codipivenda, pr.iss,'+
             ' pr.peso, pr.pesobruto, pr.codnacionalidade, pr.controlalote, pr.diasvencelote,'+
             ' pr.naovendezerado, pr.codmercosulncm, pr.grupostmva, pr.codpiscofins_venda,'+
             ' pr.codpiscofins_compra, pr.ecommerce_sn, pr.datainclusao, pr.dataalteracao,'+
             ' CURRENT_DATE DTA_ATUALIZACAO'+

             ' FROM PRODUTO pr'+
             '      LEFT JOIN GRUPOSUB sg  ON sg.codgruposub=pr.codgruposub'+
             '      LEFT JOIN GRUPO    gr  ON gr.codgrupo=sg.codgrupo'+
             '      LEFT JOIN FAMILIAP fp  ON fp.codfamiliapreco=pr.codfamiliapreco'+
             '      LEFT JOIN APLICA   ap  ON ap.codaplicacao=pr.codaplicacao'+
             '      LEFT JOIN FORNECED fo  ON fo.codfornecedor=pr.principalfor'+

             ' WHERE ((CAST(pr.datainclusao AS DATE)>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaInicio)))+
             '         OR CAST(pr.dataalteracao AS DATE)>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaInicio)))+'))';
      FrmBelShop.IBQ_Matriz.Close;
      FrmBelShop.IBQ_Matriz.SQL.Clear;
      FrmBelShop.IBQ_Matriz.SQL.Add(MySql);
      FrmBelShop.IBQ_Matriz.Open;

      FrmBelShop.MontaProgressBar(True, FrmBelShop);
      FrmBelShop.IBQ_Matriz.Last;
      pgProgBar.Properties.Max:=FrmBelShop.IBQ_Matriz.RecordCount;
      pgProgBar.Position:=0;
      FrmBelShop.IBQ_Matriz.First;

      DMLojaUnica.CDS_ImpProdutos.Open;
      While not FrmBelShop.IBQ_Matriz.Eof do
      Begin
        Application.ProcessMessages;

        pgProgBar.Position:=FrmBelShop.IBQ_Matriz.RecNo;

        MySql:=' DELETE FROM PRODUTO p'+
               ' WHERE p.codproduto='+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('CODPRODUTO').AsString);
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        DMLojaUnica.CDS_ImpProdutos.Insert;
        For i:=0 to FrmBelShop.IBQ_Matriz.FieldCount-1 do
         DMLojaUnica.CDS_ImpProdutos.Fields[i].Assign(FrmBelShop.IBQ_Matriz.Fields[i]);

        DMLojaUnica.CDS_ImpProdutos.Post;

        FrmBelShop.IBQ_Matriz.Next;
      End; // While not FrmBelShop.IBQ_Matriz.Eof do

      DMLojaUnica.CDS_ImpProdutos.ApplyUpdates(0);
      FrmBelShop.IBQ_Matriz.Close;
      DMLojaUnica.CDS_ImpProdutos.Close;

      FrmBelShop.OdirPanApres.Visible:=False;
      FrmBelShop.MontaProgressBar(False, FrmBelShop);
    End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodProduto').AsString)='' Then
    DMBelShop.CDS_BuscaRapida.Close;
    //==========================================================================
    // Atualiza Produtos - FIM =================================================
    //==========================================================================
    sgDtaInicio:='';

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);
    sgMensagem:='';

    Ltbx.Free;
    Ltbx:=Nil;

    FrmBelShop.OdirPanApres.Visible:=False;
    DateSeparator:='/';
    Screen.Cursor:=crDefault;
    Result:=True;

    msg('Parâmetros Importados com SUCESSO !!','A');

  Except // Try Geral
    on e : Exception do
    Begin
//OdirFTP - INICIO
      // Desconceta Servidor FTP ====================================
      If sgFTPUsar='SIM' Then
      Begin
        Ftp_Loja.Disconnect;
        FreeAndNil(Ftp_Loja);
      End; // If sgFTPUsar='SIM' Then
//OdirFTP - FIM

      DMBelShop.SQLC.Rollback(TD);

      FrmBelShop.MontaProgressBar(False, FrmBelShop);
      DateSeparator:='/';
      FrmBelShop.OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      FreeAndNil(Ltbx);

      Exit;
    End; // on e : Exception do
  End; // Try Geral

End; // FTP - Busca e Atualiza Parametros de Loja Unica >>>>>>>>>>>>>>>>>>>>>>>>

// Salva Arquivos Para Transferencia FTP para Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmGeraPedidosComprasLojas.SalvarArquivosFTP: Boolean;
Var
  mMemoExcuir: TMemo;
  b: Boolean;

  sPastaExecutavel, MySql: String;
  sArq: String;

  tsArquivo: TStringList;
  i: Integer;
Begin
  Result:=False;

  // Cria Memo Para Guarde NUm_Seq para Exclusão ===============================
  mMemoExcuir:=TMemo.Create(Self);
  mMemoExcuir.Visible:=False;
  mMemoExcuir.Parent:=FrmGeraPedidosComprasLojas;
  mMemoExcuir.Width:=500;
  mMemoExcuir.Lines.Clear;

  OdirPanApres.Caption:='AGUARDE !! Gerando Arquivo de Transmissão de Parêmetros para as Lojas...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Height-OdirPanApres.Height)/2));
  OdirPanApres.Visible:=True;
  Refresh;

  // Pasta do Executavel =======================================================
  sPastaExecutavel:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

  // Busca Parametros Alterados ================================================
  DMLojaUnica.CDS_ParamLojasFTP.Close;
  DMLojaUnica.CDS_ParamLojasFTP.Filtered:=False;
  DMLojaUnica.CDS_ParamLojasFTP.Filter:='';
  DMLojaUnica.CDS_ParamLojasFTP.Open;
  If Trim(DMLojaUnica.CDS_ParamLojasFTPIND_TIPO.AsString)='' Then
  Begin
    DMLojaUnica.CDS_ParamLojasFTP.Close;
    Result:=True;
    Exit;
  End;

  // Busca Lojas ===============================================================
  MySql:=' SELECT e.cod_filial'+
         ' FROM emp_conexoes e'+
         ' WHERE e.ind_ativo='+QuotedStr('SIM')+
         ' ORDER BY 1';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    Refresh;

    // Busca Parametros da Loja =====================================
    sCodFilial:=DMBelShop.CDS_Busca.FieldByName('Cod_Filial').AsString;
    sgMensagem:='Bel_'+sCodFilial;

    DMLojaUnica.CDS_ParamLojasFTP.Filtered:=False;
    DMLojaUnica.CDS_ParamLojasFTP.Filter:='(Cod_Loja='+QuotedStr(sCodFilial)+' or cod_loja is null)';
    DMLojaUnica.CDS_ParamLojasFTP.Filtered:=True;

    If Trim(DMLojaUnica.CDS_ParamLojasFTPIND_TIPO.AsString)<>'' Then
    Begin
      // Cria Arquivo FTP ===========================================
      sArq:=sgPastaAreaFTP+sCodFilial+'_DML_'+FormatDateTime('yyyymmdd',date)+FormatDateTime('hhnnss',time)+'.SQL';
      tsArquivo:= TStringList.Create;

      Try // tsArquivo

        // Criar Arquivo Com Exclusões ==============================
        DMLojaUnica.CDS_ParamLojasFTP.First;
        While Not DMLojaUnica.CDS_ParamLojasFTP.Eof do
        Begin
          If Trim(DMLojaUnica.CDS_ParamLojasFTPDML_EXC.AsString)<>'' Then
          Begin
            tsArquivo.Add('[INICIO]');
            tsArquivo.Add(DMLojaUnica.CDS_ParamLojasFTPDML_EXC.AsString);
            tsArquivo.Add('[FIM]');
          End; // If Trim(DMLojaUnica.CDS_ParamLojasFTPDML_EXC.AsString)<>'' Then

          DMLojaUnica.CDS_ParamLojasFTP.Next;
        End; // While Not DMLojaUnica.CDS_ParamLojasFTP.Eof do

        // Criar Arquivo Com Inclusões ==============================
        DMLojaUnica.CDS_ParamLojasFTP.First;
        While Not DMLojaUnica.CDS_ParamLojasFTP.Eof do
        Begin
          If Trim(DMLojaUnica.CDS_ParamLojasFTPDML_INC.AsString)<>'' Then
          Begin
           tsArquivo.Add('[INICIO]');
           tsArquivo.Add(DMLojaUnica.CDS_ParamLojasFTPDML_INC.AsString);
           tsArquivo.Add('[FIM]');
          End; // If Trim(DMLojaUnica.CDS_ParamLojasFTPDML_INC.AsString)<>'' Then

          // Atualiza Parametros de Lojas no CD (MATRIZ) =============
          If Trim(DMLojaUnica.CDS_ParamLojasFTPCOD_LOJA.AsString)<>'' Then
           Begin
            // Atualiza Para de Lojas no CD (MATRIZ) =================
            If Trim(DMLojaUnica.CDS_ParamLojasFTPIND_DML.AsString)='EXC' Then
             Begin
               MySql:=' DELETE FROM PARAMETROS_LOJAS pl'+
                      ' WHERE pl.num_seq='+DMLojaUnica.CDS_ParamLojasFTPNUM_SEQ.AsString;
               DMBelShop.SQLC.Execute(MySql,nil,nil);
             End
            Else // If Trim(DMLojaUnica.CDS_ParamLojasFTPIND_DML.AsString)='EXC' Then
             Begin
               MySql:=' UPDATE PARAMETROS_LOJAS pl'+
                      ' SET pl.ind_dml=NULL'+
                      ' WHERE pl.num_seq='+DMLojaUnica.CDS_ParamLojasFTPNUM_SEQ.AsString;
               DMBelShop.SQLC.Execute(MySql,nil,nil);
             End; // If Trim(DMLojaUnica.CDS_ParamLojasFTPIND_DML.AsString)='EXC' Then
           End
          Else // If Trim(DMLojaUnica.CDS_ParamLojasFTPCOD_LOJA.AsString)<>'' Then
           Begin
             b:=True;
             For i:=0 to mMemoExcuir.Lines.Count-1 do
             Begin
               If mMemoExcuir.Lines[i]=DMLojaUnica.CDS_ParamLojasFTPNUM_SEQ.AsString Then
               Begin
                 b:=False;
                 Break;
               End;
             End; // For i:=0 to mMemoExcuir.Lines.Count-1 do

             If b Then
             Begin
               mMemoExcuir.Lines.Add(DMLojaUnica.CDS_ParamLojasFTPNUM_SEQ.AsString);
             end;
           End; // If Trim(DMLojaUnica.CDS_ParamLojasFTPCOD_LOJA.AsString)<>'' Then

          DMLojaUnica.CDS_ParamLojasFTP.Next;
        End; // While Not DMLojaUnica.CDS_ParamLojasFTP.Eof do

        tsArquivo.SaveToFile(sArq);
      Finally // Try // tsArquivo
        { Libera a instancia da lista da memória }
        FreeAndNil(tsArquivo);
      End; // Try // tsArquivo

      tsArquivo.Free;
      tsArquivo:=nil;
    End; // If Trim(DMLojaUnica.CDS_ParamLojasFTPIND_TIPO.AsString)<>'' Then

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.Close;
  DMLojaUnica.CDS_ParamLojasFTP.Close;

  Try
    tsArquivo:= TStringList.Create;
    tsArquivo.Add('ODIR');
    tsArquivo.SaveToFile(sgPastaAreaFTP+'ODIR');
  Finally // Try // tsArquivo
    FreeAndNil(tsArquivo);
  End; // Try // tsArquivo
  tsArquivo.Free;
  tsArquivo:=nil;

  DeleteFile(sgPastaAreaFTP+'ODIR');

  // Exluir Parametros =========================================================
  For i:=0 to mMemoExcuir.Lines.Count-1 do
  Begin
    MySql:=' UPDATE PARAMETROS_LOJAS pl'+
           ' SET pl.ind_dml=NULL'+
           ' WHERE pl.num_seq='+mMemoExcuir.Lines[i];
    DMBelShop.SQLC.Execute(MySql,nil,nil);
  End;

  FreeAndNil(mMemoExcuir);

  // Envia Arquivo.SQL Para o Servidor FTP =====================================
//OdirFTP - INICIO
  If sgFTPUsar='SIM' Then
  Begin
    EnviaArqFTPServer;
  End; // If sgFTPUsar='SIM' Then
//OdirFTP - FIM

  Result:=True;
  OdirPanApres.Visible:=False;

End; // Salva Arquivos Para Transferencia FTP para Lojas >>>>>>>>>>>>>>>>>>>>>>>

// Acerta Cor do Fornecedor Principal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGeraPedidosComprasLojas.AcertaCorFornPrincipal;
Begin
  sgCodigo:='';
  sgCodProd:='';

  DMLojaUnica.CDS_ParamLjFornDia.First;
  DMLojaUnica.CDS_ParamLjFornDia.DisableControls;
  While Not DMLojaUnica.CDS_ParamLjFornDia.Eof do
  Begin
    If sgCodigo=DMLojaUnica.CDS_ParamLjFornDiaCODFORNECEDOR.AsString Then
    Begin
      If sgCodProd<>sgCodigo Then
      Begin
        DMLojaUnica.CDS_ParamLjFornDia.Prior;

        DMLojaUnica.CDS_ParamLjFornDia.Edit;
        DMLojaUnica.CDS_ParamLjFornDiaFORN.AsString:='SIM';
        DMLojaUnica.CDS_ParamLjFornDia.Post;

        DMLojaUnica.CDS_ParamLjFornDia.Next;

        sgCodProd:=sgCodigo;
      End; // If sgCodProd<>sgCodigo Then

      If sgCodProd=sgCodigo Then
      Begin
        DMLojaUnica.CDS_ParamLjFornDia.Edit;
        DMLojaUnica.CDS_ParamLjFornDiaFORN.AsString:='FIL';
        DMLojaUnica.CDS_ParamLjFornDia.Post;
      End; // If sgCodProd=sgCodigo Then
    End; // If sgCodigo=DMLojaUnica.CDS_ParamLjFornDiaCODFORNECEDOR.AsString Then

    sgCodigo:=DMLojaUnica.CDS_ParamLjFornDiaCODFORNECEDOR.AsString;

    DMLojaUnica.CDS_ParamLjFornDia.Next;
  End; // While Not DMLojaUnica.CDS_ParamLjFornDia.Eof do
  DMLojaUnica.CDS_ParamLjFornDia.EnableControls;
  DMLojaUnica.CDS_ParamLjFornDia.First;

End; // Acerta Cor do Fornecedor Principal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Salva Ocorrencias por Dias >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmGeraPedidosComprasLojas.ProcessaOcorrenciasPorDias(sTipo, sCodLoja: String): Boolean;
Var
  sCodForn, MySql:String;
  ii, i: Integer;
Begin

  Try
    // Fornecedores Selecionados ===============================================
    For i:=0 to Lbx_ParamLjDiasFornSelec.Count - 1 do
    Begin
      ii:=pos('-',Trim(Lbx_ParamLjDiasFornSelec.Items[i]));

      sCodForn:=Trim(Copy(Lbx_ParamLjDiasFornSelec.Items[i],1,ii-1));

      MySql:=' UPDATE parametros_lojas pl'+
             ' SET   pl.Ind_DML='+QuotedStr('EXC')+
             ' WHERE pl.ind_tipo=7'+
             ' AND   pl.cod_loja='+QuotedStr(sCodLoja)+
             ' AND   pl.cod_fornecedor='+QuotedStr(sCodForn);
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      sgMensagem:='parametros_lojas - EXC';

      MySql:=' Insert Into parametros_lojas ('+
             ' NUM_SEQ, IND_TIPO, COD_LOJA, COD_FORNECEDOR, IND_DML,'+

             ' IND_DIARIAMENTE, IND_TODOS_DIAS, CADA_NUM_DIAS,'+

             ' IND_SEMANAMENTE, CADA_NUM_SEMANA,'+

             ' DIA_SEG, DIA_TER, DIA_QUA, DIA_QUI, DIA_SEX,'+ // Usado em IND_SEMANAMENTE e IND_MENSALMENTE

             ' IND_MENSALMENTE, DES_POSICAO, DIA_DIAS,'+
             ' MES_JAN, MES_FEV, MES_MAR, MES_ABR, MES_MAI, MES_JUN,'+
             ' MES_JUL, MES_AGO, MES_SET, MES_OUT, MES_NOV, MES_DEZ)'+

             ' Values ('+
             'GEN_ID(GEN_PARAM_LOJAS,1)'+ // NUM_SEQ
             ', '+QuotedStr('7')+         // IND_TIPO
             ', '+QuotedStr(sCodLoja)+    // COD_LOJA
             ', '+QuotedStr(sCodForn)+    // COD_FORNECEDOR
             ', '+QuotedStr('INC');       // IND_DML

      //==========================================================================
      // DIARIAMENTE - INICIO ====================================================
      //==========================================================================
      If sTipo='Dia' Then
      Begin
        // Todos os Dias ---------------------------------------------
        If Rb_ParamLjTodosDias.Checked Then
        Begin
          MySql:=MySql+', '+QuotedStr('SIM')+ // IND_DIARIAMENTE
                       ', '+QuotedStr('SIM')+ // IND_TODOS_DIAS
                       ', NULL';              // CADA_NUM_DIAS'+
        End; // If Rb_ParamLjTodosDias.Checked Then

        // A Cada Dias -----------------------------------------------
        If Rb_ParamLjACada.Checked Then
        Begin
          MySql:=MySql+', '+QuotedStr('SIM')+                  // IND_DIARIAMENTE
                       ', '+QuotedStr('NAO')+                  // IND_TODOS_DIAS
                       ', '+QuotedStr(EdtParamLjCadaDia.Text); // CADA_NUM_DIAS'+
        End; // If Rb_ParamLjACada.Checked Then

        // Nulos -----------------------------------------------------
        MySql:=MySql+', NULL'+              // IND_SEMANAMENTE
                     ', NULL'+              // CADA_NUM_SEMANA
                     ', NULL'+              // DIA_SEG
                     ', NULL'+              // DIA_TER
                     ', NULL'+              // DIA_QUA
                     ', NULL'+              // DIA_QUI
                     ', NULL'+              // DIA_SEX
                     ', NULL'+              // IND_MENSALMENTE
                     ', NULL'+              // DES_POSICAO
                     ', NULL'+              // DIA_DIAS
                     ', NULL'+              // MES_JAN
                     ', NULL'+              // MES_FEV
                     ', NULL'+              // MES_MAR
                     ', NULL'+              // MES_ABR
                     ', NULL'+              // MES_MAI
                     ', NULL'+              // MES_JUN
                     ', NULL'+              // MES_JUL
                     ', NULL'+              // MES_AGO
                     ', NULL'+              // MES_SET
                     ', NULL'+              // MES_OUT
                     ', NULL'+              // MES_NOV
                     ', NULL';              // MES_DEZ

        sgMensagem:='Diariamente';
      End; // If sTipo='Dia' Then
      //==========================================================================
      // DIARIAMENTE - FIM =======================================================
      //==========================================================================

      //==========================================================================
      // SEMANALMENTE - INICIO ===================================================
      //==========================================================================
      If sTipo='Semana' Then
      Begin
        MySql:=MySql+', NULL'+                                        // IND_DIARIAMENTE
                     ', NULL'+                                        // IND_TODOS_DIAS
                     ', NULL'+                                        // CADA_NUM_DIAS'+
                     ', '+QuotedStr('SIM')+                           // IND_SEMANAMENTE
                     ', '+QuotedStr(EdtParamLjSemanaCadaSemana.Text); // CADA_NUM_SEMANA

                     // DIA_SEG
                     If Ckb_ParamLjSemana_Seg.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // DIA_TER
                     If Ckb_ParamLjSemana_Ter.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // DIA_QUA
                     If Ckb_ParamLjSemana_QUA.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // DIA_QUI
                     If Ckb_ParamLjSemana_QUI.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // DIA_SEX
                     If Ckb_ParamLjSemana_SEX.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

        // Nulos -----------------------------------------------------
        MySql:=MySql+', NULL'+              // IND_MENSALMENTE
                     ', NULL'+              // DES_POSICAO
                     ', NULL'+              // DIA_DIAS
                     ', NULL'+              // MES_JAN
                     ', NULL'+              // MES_FEV
                     ', NULL'+              // MES_MAR
                     ', NULL'+              // MES_ABR
                     ', NULL'+              // MES_MAI
                     ', NULL'+              // MES_JUN
                     ', NULL'+              // MES_JUL
                     ', NULL'+              // MES_AGO
                     ', NULL'+              // MES_SET
                     ', NULL'+              // MES_OUT
                     ', NULL'+              // MES_NOV
                     ', NULL';              // MES_DEZ

        sgMensagem:='Semanalmente';
      End; // If sTipo='Semana' Then
      //==========================================================================
      // SEMANALMENTE - FIM ======================================================
      //==========================================================================

      //==========================================================================
      // MENSALMENTE - INICIO ====================================================
      //==========================================================================
      If sTipo='Mes' Then
      Begin
        // Nulos ------------------------------------------------------
        MySql:=MySql+', NULL'+ // IND_DIARIAMENTE
                     ', NULL'+ // IND_TODOS_DIAS
                     ', NULL'+ // CADA_NUM_DIAS
                     ', NULL'+ // IND_SEMANAMENTE
                     ', NULL'; // CADA_NUM_SEMANA

                     // DIA_SEG
                     If (Cbx_ParamLjMesesDias.Text='Segunda') Or (Cbx_ParamLjMesesDias.Text='Dias') Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // DIA_TER
                     If (Cbx_ParamLjMesesDias.Text='Terça') Or (Cbx_ParamLjMesesDias.Text='Dias') Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // DIA_QUA
                     If (Cbx_ParamLjMesesDias.Text='Quarta') Or (Cbx_ParamLjMesesDias.Text='Dias') Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // DIA_QUI
                     If (Cbx_ParamLjMesesDias.Text='Quinta') Or (Cbx_ParamLjMesesDias.Text='Dias') Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // DIA_SEX
                     If (Cbx_ParamLjMesesDias.Text='Sexta') Or (Cbx_ParamLjMesesDias.Text='Dias') Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     MySql:=MySql+', '+QuotedStr('SIM')+                        // IND_MENSALMENTE
                                  ', '+QuotedStr(Cbx_ParamLjMesesPosicao.Text); // DES_POSICAO

                     // DIA_DIAS
                     If Cbx_ParamLjMesesDias.Text='Dias' Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // MES_JAN
                     If Ckb_ParamLjMeses_Jan.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // MES_FEV
                     If Ckb_ParamLjMeses_Fev.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // MES_MAR
                     If Ckb_ParamLjMeses_Mar.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // MES_ABR
                     If Ckb_ParamLjMeses_Abr.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // MES_MAI
                     If Ckb_ParamLjMeses_Mai.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // MES_JUN
                     If Ckb_ParamLjMeses_Jun.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // MES_JUL
                     If Ckb_ParamLjMeses_Jul.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // MES_AGO
                     If Ckb_ParamLjMeses_Ago.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // MES_SET
                     If Ckb_ParamLjMeses_Set.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // MES_OUT
                     If Ckb_ParamLjMeses_Out.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // MES_NOV
                     If Ckb_ParamLjMeses_Nov.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

                     // MES_DEZ
                     If Ckb_ParamLjMeses_Dez.Checked Then
                      MySql:=MySql+', '+QuotedStr('SIM')
                     Else
                      MySql:=MySql+', '+QuotedStr('NAO');

        sgMensagem:='Mensalmente';
      End; // If sTipo='Mes' Then
      //==========================================================================
      // MENSALMENTE - FIM =======================================================
      //==========================================================================

      MySql:=MySql+')';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

    End; // For i:=0 to Lbx_ParamLjDiasFornSelec.Count - 1 do
    Result:=True;
  Except
    Result:=False;
  End;
End; // Salva Ocorrencias por Dias >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Salva as Ocorrencias de Fornecedores/Dia >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmGeraPedidosComprasLojas.SalvaOcorrencias: Boolean;
Var
  sTipoProc: String;
Begin
  Result:=False;
  sgMensagem:='';

  If PC_ParamLjDiasForn.ActivePage=Ts_ParamLjDias Then
  Begin
    If msg('Deseja Realmente Aplicar a'+cr+cr+'Ocorrencia "Diariamente" ??','C')=2 Then
     Exit;

    sTipoProc:='Dia'
  End; // If PC_ParamLjDiasForn.ActivePage=Ts_ParamLjDias Then

  If PC_ParamLjDiasForn.ActivePage=Ts_ParamLjSemana Then
  Begin
    If msg('Deseja Realmente Aplicar a'+cr+cr+'Ocorrencia "Semanalmente" ??','C')=2 Then
     Exit;

    sTipoProc:='Semana'
  End; // If PC_ParamLjDiasForn.ActivePage=Ts_ParamLjSemana Then

  If PC_ParamLjDiasForn.ActivePage=Ts_ParamLjMeses Then
  Begin
    If msg('Deseja Realmente Aplicar a'+cr+cr+'Ocorrencia "Mensalmente" ??','C')=2 Then
     Exit;

    sTipoProc:='Mes'
  End; // If PC_ParamLjDiasForn.ActivePage=Ts_ParamLjMeses Then

  // Loja a Processar ==========================================================
  DMBelShop.CDS_EmpBusca.First;
  While Not DMBelShop.CDS_EmpBusca.Eof do
  Begin
    If DMBelShop.CDS_EmpBusca.FieldByName('PROC').AsString='SIM' Then
    Begin
      If Not ProcessaOcorrenciasPorDias(sTipoProc, DMBelShop.CDS_EmpBusca.FieldByName('Cod_loja').AsString) Then
       Exit;
    End;

    DMBelShop.CDS_EmpBusca.Next;
  End; // While Not DMBelShop.CDS_EmpBusca.Eof do

  DMBelShop.CDS_EmpBusca.First;
  Result:=True;

End; // // Salva as Ocorrencias de Fornecedores/Dia >>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Acerta Entrada dos Parametros de Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmGeraPedidosComprasLojas.ParametrosEntrada: Boolean;
Var
  sLefts, MySql: String;
  ii, i: Integer;
Begin
  Result:=False;

  //============================================================================
  // 1 - Considerar SALDO ATUAL no Calculo de Necessidade de Compra ============
  //============================================================================
  MySql:=' SELECT pl.ind_sim_nao'+
         ' FROM parametros_lojas pl'+
         ' WHERE pl.ind_tipo=1';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;
  Ckb_ParamLjSaldo.Checked:=(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString='SIM');
  DMBelShop.CDS_Busca.Close;

  //============================================================================
  // 2 - Considerar Produto em Transito, se Houver, no Calculo de Necessidade de Compra ?
  //============================================================================
  MySql:=' SELECT pl.ind_sim_nao'+
         ' FROM parametros_lojas pl'+
         ' WHERE pl.ind_tipo=2';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;
  Ckb_ParamLjTransito.Checked:=(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString='SIM');
  DMBelShop.CDS_Busca.Close;

  //============================================================================
  // 3 - Numero de Dias para Calculo de Necessidade de Compra - POR LOJA  ======
  //============================================================================
  If DMVirtual.gCDS_V1<>nil Then
  Begin
    FreeAndNil(DMVirtual.gCDS_V1);
    FreeAndNil(DMVirtual.gDS_V1);
  End;

  try
    DMVirtual.gCDS_V1:=TClientDataSet.Create(Self);
    DMVirtual.gDS_V1:=TDataSource.Create(Self);
  Except
    DMVirtual.gCDS_V1.EmptyDataSet;
  End;

  DMVirtual.gCDS_V1.FieldDefs.Clear;

  DMVirtual.gCDS_V1.FieldDefs.Add('COD_LOJA',ftString,2);
  DMVirtual.gCDS_V1.FieldDefs.Add('RAZAO_SOCIAL',ftString,60);
  DMVirtual.gCDS_V1.FieldDefs.Add('CNPJ',ftString,18);
  DMVirtual.gCDS_V1.FieldDefs.Add('NUM_DIAS',ftInteger);
  DMVirtual.gCDS_V1.FieldDefs.Add('PER_LIM_FAT_FORN',ftFloat);

  DMVirtual.gCDS_V1.CreateDataSet;
  DMVirtual.gCDS_V1.Open;

  (DMVirtual.gCDS_V1.FieldByName('Per_Lim_Fat_Forn') as TFloatField).DisplayFormat:='0.,00';

  DMVirtual.gDS_V1.DataSet:=DMVirtual.gCDS_V1;
  Dbg_ParamLjDias.DataSource:=DMVirtual.gDS_V1;

  MySql:=' SELECT em.cod_filial cod_loja, em.razao_social,'+
         ' SUBSTRING(em.num_cnpj FROM 1 FOR 2) || ''.'' ||'+
         ' SUBSTRING(em.num_cnpj FROM 3 FOR 3) || ''.'' ||'+
         ' SUBSTRING(em.num_cnpj FROM 6 FOR 3) || ''/'' ||'+
         ' SUBSTRING(em.num_cnpj FROM 9 FOR 4) || ''-'' ||'+
         ' SUBSTRING(em.num_cnpj FROM 13 FOR 2) CNPJ,'+
         ' COALESCE(pDia.num_dia_calculo,30) num_dias,'+
         ' COALESCE(pLim.per_aceito,0) Per_Lim_Fat_Forn'+

         ' FROM emp_conexoes em'+
         '   LEFT JOIN parametros_lojas pDia  ON pDia.cod_loja=em.cod_filial'+
         '                                   AND pDia.ind_tipo=3'+
         '   LEFT JOIN parametros_lojas pLim  ON pLim.cod_loja=em.cod_filial'+
         '                                   AND pLim.ind_tipo=0'+
         ' WHERE em.ind_ativo=''SIM'''+
         ' ORDER BY 1';
  DMBelShop.CDS_While.Close;
  DMBelShop.SDS_While.CommandText:=MySql;
  DMBelShop.CDS_While.Open;

  While Not DMBelShop.CDS_While.Eof do
  Begin
    DMVirtual.gCDS_V1.Append;
    DMVirtual.gCDS_V1.FieldByName('COD_LOJA').AsString:=
                           DMBelShop.CDS_While.FieldByName('COD_LOJA').AsString;
    DMVirtual.gCDS_V1.FieldByName('RAZAO_SOCIAL').AsString:=
                       DMBelShop.CDS_While.FieldByName('RAZAO_SOCIAL').AsString;
    DMVirtual.gCDS_V1.FieldByName('CNPJ').AsString:=
                               DMBelShop.CDS_While.FieldByName('CNPJ').AsString;
    DMVirtual.gCDS_V1.FieldByName('NUM_DIAS').AsString:=
                           DMBelShop.CDS_While.FieldByName('NUM_DIAS').AsString;
    DMVirtual.gCDS_V1.FieldByName('PER_LIM_FAT_FORN').AsCurrency:=
                 DMBelShop.CDS_While.FieldByName('PER_LIM_FAT_FORN').AsCurrency;
    DMVirtual.gCDS_V1.Post;

    DMBelShop.CDS_While.Next;
  End; // While Not DMBelShop.CDS_While.Eof do
  DMVirtual.gCDS_V1.First;

  //============================================================================
  // 4 - Percentual Limite para Faturamento de Fornecedor - POR FORNECEDOR E LOJA
  //============================================================================
  If DMVirtual.gCDS_V2<>nil Then
  Begin
    DMVirtual.gCDS_V2.Free;
    DMVirtual.gCDS_V2:=nil;
    DMVirtual.gDS_V2.Free;
    DMVirtual.gDS_V2:=nil;
  End;

  try
    DMVirtual.gCDS_V2:=TClientDataSet.Create(Self);
    DMVirtual.gDS_V2:=TDataSource.Create(Self);
  Except
    DMVirtual.gCDS_V2.EmptyDataSet;
  End;

  DMVirtual.gCDS_V2.FieldDefs.Clear;

  DMVirtual.gCDS_V2.FieldDefs.Add('COD_FORN',ftString,3);
  DMVirtual.gCDS_V2.FieldDefs.Add('FORNECEDOR',ftString,60);

  i:=2;
  DMBelShop.CDS_While.First;
  While Not DMBelShop.CDS_While.Eof do
  Begin
    Refresh;
    Inc(i);

    DMVirtual.gCDS_V2.FieldDefs.Add('Bel_'+DMBelShop.CDS_While.FieldByName('COD_LOJA').AsString,ftFloat);

    DMBelShop.CDS_While.Next;
  End; // While Not DMBelShop.CDS_While.Eof do
  DMVirtual.gCDS_V2.CreateDataSet;
  DMVirtual.gCDS_V2.Open;

  For ii:=2 to i-1 do
   (DMVirtual.gCDS_V2.FieldByName(DMVirtual.gCDS_V2.Fields[ii].FieldName) as TFloatField).DisplayFormat:='0.,00';

  // Acerta DataSource =========================================================
  DMVirtual.gDS_V2.DataSet:=DMVirtual.gCDS_V2;
  Dbg_ParamLjPerLimForn.DataSource:=DMVirtual.gDS_V2;

  Dbg_ParamLjPerLimites.DataSource:=DMVirtual.gDS_V2;

  MySql:=' SELECT fr.codfornecedor, fr.nomefornecedor';

         sLefts:='';
         DMBelShop.CDS_While.First;
         While Not DMBelShop.CDS_While.Eof do
         Begin
           Refresh;

           sgCodEmp:=DMBelShop.CDS_While.FieldByName('COD_LOJA').AsString;

           MySql:=MySql+', coalesce(pl'+sgCodEmp+'.per_aceito,0) Bel_'+sgCodEmp;
           sLefts:=sLefts+' Left join parametros_lojas pl'+sgCodEmp+'  on pl'+sgCodEmp+'.cod_loja='+QuotedStr(sgCodEmp)+
                          '                                           And pl'+sgCodEmp+'.cod_fornecedor=fr.codfornecedor'+
                          '                                           And pl'+sgCodEmp+'.ind_tipo=4';

           DMBelShop.CDS_While.Next;
         End; // While Not DMBelShop.CDS_While.Eof do

         MySql:=MySql+' FROM fornecedor fr'+
                      sLefts+
                      ' WHERE EXISTS (SELECT 1'+
                      '               FROM Produto pr'+
                      '               WHERE pr.principalfor=fr.codfornecedor'+
                      '               AND   COALESCE(pr.situacaopro,0) IN (0,3))'+
                      ' ORDER BY 2';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  DMVirtual.gCDS_V2.Data:=DMBelShop.CDS_Busca.Data;

  DMVirtual.gCDS_V2.First;

  // Acerta Aopresentação do DBGris ============================================
  For i:=0 to Dbg_ParamLjPerLimites.Columns.Count-1 do
  Begin
    If i<2 Then
     Begin
       Dbg_ParamLjPerLimites.Columns[i].Visible:=False;
     End
    Else // If i<2 Then
     Begin
       Dbg_ParamLjPerLimites.Columns[i].Alignment:=taRightJustify;
       Dbg_ParamLjPerLimites.Columns[i].Title.Alignment:=taRightJustify;
       Dbg_ParamLjPerLimites.Columns[i].Width:=55
     End; // If i<2 Then
  End; // For i:=0 to Dbg_ParamLjPerLimites.Columns.Count-1 do

  //============================================================================
  // 5 - Utilizar Estoque Ideal (Estoque mínimo) ?  - POR PRODUTO - SIDICOM: ESTOQUE.EstoqueIdeal
  //============================================================================
  MySql:=' SELECT pl.ind_sim_nao'+
         ' FROM parametros_lojas pl'+
         ' WHERE pl.ind_tipo=5';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;
  Ckb_ParamLjEstMinimo.Checked:=(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString='SIM');
  DMBelShop.CDS_Busca.Close;

  //============================================================================
  // 6 - Utilizar Percentual Limite de Caixa de Embarque para Compra - POR PRODUTO - SIDICOM: PRODUFOR.UnidadeCaixa
  //============================================================================
  MySql:=' SELECT pl.ind_sim_nao, pl.per_aceito'+
         ' FROM parametros_lojas pl'+
         ' WHERE pl.ind_tipo=6';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;
  Ckb_ParamLjCxEmbarque.Checked:=(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString='SIM');

  If Trim(DMBelShop.CDS_Busca.FieldByName('per_aceito').AsString)<>'' Then
   EdtParamLjPerCxEmbarque.Value:=DMBelShop.CDS_Busca.FieldByName('per_aceito').AsCurrency;
  DMBelShop.CDS_Busca.Close;

  //============================================================================
  // 7 - Fornecedores a Comprar por Dia ========================================
  //============================================================================
  Lbx_ParamLjDiasFornSelec.Items.Clear;

  DMLojaUnica.CDS_ParamLjFornDia.Close;
  DMLojaUnica.CDS_ParamLjFornDia.Open;

  // Acerta Cor do Fornecedor Principal ========================================
  AcertaCorFornPrincipal;
  DMLojaUnica.CDS_ParamLjFornDia.First;

  //============================================================================
  // Apresenta Formulario ======================================================
  //============================================================================

  // Acerta os CheckBox's ======================================================
  Ckb_ParamLjSaldoClick(Self);

  DMBelShop.CDS_While.Close;

  // Acerta TabSheets ==========================================================
  Ts_ParametrosLojas.TabVisible:=True;
  PC_ParametroLojas.ActivePage:=Ts_ParamLjCalculo;
  PC_ParamLjFornecedores.ActivePage:=Ts_ParamLjLimiteFat;
  PC_ParamLjDiasForn.ActivePage:=Ts_ParamLjDias;

  Pan_Apresentacao.Visible:=True;
  Ts_ParamLjFornCalcular.TabVisible:=True;
  Ts_ParamLjLimiteFat.TabVisible:=True;
  Ts_ParamLjCalculo.TabVisible:=True;
  Ts_ParamLjFornDias.TabVisible:=False;

  Ts_OCGeraOrdemCompra.TabVisible:=False;
  Ts_OCBuscaProdutos.TabVisible:=False;
  Ts_ParamLjFornDias.TabVisible:=False;
  FrmGeraPedidosComprasLojas.Caption:='Parâmetros de Lojas';

  PC_ParamLjFornecedoresChange(Self);

  //============================================================================
  // Monta Transacao Global para Parametros de Lojas ===========================
  //============================================================================
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);

  Result:=True;
End; // Acerta Entrada dos Parametros de Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// DIVERSOS - Desbilita o Scroll do Mouse no DbGrid >>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGeraPedidosComprasLojas.DesabilitaScrollMouse(var Msg: TMsg; var Handled: Boolean);
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
procedure TFrmGeraPedidosComprasLojas.HabilitaScrollMouse(var Msg: TMsg; var Handled: Boolean);
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


// Busca Demanda e Numeros de Dias e Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGeraPedidosComprasLojas.BuscaDemanda(Cbbx_Mes: TComboBox; Me_Ano: TMaskEdit;
                           sCodProduto, sFilial: String;
                           Var Demanda: Currency; var iNrDias: Integer;
                           Var iNrMeses: Integer; bConsulta: Boolean);
Var
  ii: Integer;
  MySql: String;
  sDem1, sDem2, sDem3, sDem4, sDem5, sDem6, sDem7, sDem8: String;

  sCaseDemanda, sCaseMeses: String;
Begin

  // Busca Demanda se Necessario ===============================================
  If bConsulta Then
  Begin
    // Monta Case para Demandas ================================================
    sCaseMeses:='';
    sCaseDemanda:='Case';

    If CB_Mes1.Text<>'NAO USAR' Then // Mes1
    Begin
      sCaseDemanda:=sCaseDemanda+' When m.comp_anomes='+QuotedStr(ME_Ano1.Text+'/'+
                                   IntToStr(StrToInt(NumeroMes(CB_Mes1.Text))))+' Then ''Dem1''';

      If sCaseMeses='' Then
       sCaseMeses:=' AND (m.comp_anomes='+QuotedStr(ME_Ano1.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes1.Text))))
      Else
       sCaseMeses:=sCaseMeses+' OR m.comp_anomes='+QuotedStr(ME_Ano1.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes1.Text))));
    End;

    If CB_Mes2.Text<>'NAO USAR' Then // Mes2
    Begin
      sCaseDemanda:=sCaseDemanda+' When m.comp_anomes='+QuotedStr(ME_Ano2.Text+'/'+
                                   IntToStr(StrToInt(NumeroMes(CB_Mes2.Text))))+' Then ''Dem2''';

      If sCaseMeses='' Then
       sCaseMeses:=' AND (m.comp_anomes='+QuotedStr(ME_Ano2.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes2.Text))))
      Else
       sCaseMeses:=sCaseMeses+' OR m.comp_anomes='+QuotedStr(ME_Ano2.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes2.Text))));
    End;

    If CB_Mes3.Text<>'NAO USAR' Then // Mes3
    Begin
      sCaseDemanda:=sCaseDemanda+' When m.comp_anomes='+QuotedStr(ME_Ano3.Text+'/'+
                                   IntToStr(StrToInt(NumeroMes(CB_Mes3.Text))))+' Then ''Dem3''';

      If sCaseMeses='' Then
       sCaseMeses:=' AND (m.comp_anomes='+QuotedStr(ME_Ano3.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes3.Text))))
      Else
       sCaseMeses:=sCaseMeses+' OR m.comp_anomes='+QuotedStr(ME_Ano3.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes3.Text))));
    End;

    If CB_Mes4.Text<>'NAO USAR' Then // Mes4
    Begin
      sCaseDemanda:=sCaseDemanda+' When m.comp_anomes='+QuotedStr(ME_Ano4.Text+'/'+
                                   IntToStr(StrToInt(NumeroMes(CB_Mes4.Text))))+' Then ''Dem4''';

      If sCaseMeses='' Then
       sCaseMeses:=' AND (m.comp_anomes='+QuotedStr(ME_Ano4.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes4.Text))))
      Else
       sCaseMeses:=sCaseMeses+' OR m.comp_anomes='+QuotedStr(ME_Ano4.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes4.Text))));
    End;

    If CB_Mes5.Text<>'NAO USAR' Then // Mes5
    Begin
      sCaseDemanda:=sCaseDemanda+' When m.comp_anomes='+QuotedStr(ME_Ano5.Text+'/'+
                                   IntToStr(StrToInt(NumeroMes(CB_Mes5.Text))))+' Then ''Dem5''';

      If sCaseMeses='' Then
       sCaseMeses:=' AND (m.comp_anomes='+QuotedStr(ME_Ano5.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes5.Text))))
      Else
       sCaseMeses:=sCaseMeses+' OR m.comp_anomes='+QuotedStr(ME_Ano5.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes5.Text))));
    End;

    If CB_Mes6.Text<>'NAO USAR' Then // Mes6
    Begin
      sCaseDemanda:=sCaseDemanda+' When m.comp_anomes='+QuotedStr(ME_Ano6.Text+'/'+
                                   IntToStr(StrToInt(NumeroMes(CB_Mes6.Text))))+' Then ''Dem6''';

      If sCaseMeses='' Then
       sCaseMeses:=' AND (m.comp_anomes='+QuotedStr(ME_Ano6.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes6.Text))))
      Else
       sCaseMeses:=sCaseMeses+' OR m.comp_anomes='+QuotedStr(ME_Ano6.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes6.Text))));
    End;

    If CB_Mes7.Text<>'NAO USAR' Then // Mes7
    Begin
      sCaseDemanda:=sCaseDemanda+' When m.comp_anomes='+QuotedStr(ME_Ano7.Text+'/'+
                                   IntToStr(StrToInt(NumeroMes(CB_Mes7.Text))))+' Then ''Dem7''';

      If sCaseMeses='' Then
       sCaseMeses:=' AND (m.comp_anomes='+QuotedStr(ME_Ano7.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes7.Text))))
      Else
       sCaseMeses:=sCaseMeses+' OR m.comp_anomes='+QuotedStr(ME_Ano7.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes7.Text))));
    End;

    If CB_Mes8.Text<>'NAO USAR' Then // Mes8
    Begin
      sCaseDemanda:=sCaseDemanda+' When m.comp_anomes='+QuotedStr(ME_Ano8.Text+'/'+
                                   IntToStr(StrToInt(NumeroMes(CB_Mes8.Text))))+' Then ''Dem8''';

      If sCaseMeses='' Then
       sCaseMeses:=' AND (m.comp_anomes='+QuotedStr(ME_Ano8.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes8.Text))))
      Else
       sCaseMeses:=sCaseMeses+' OR m.comp_anomes='+QuotedStr(ME_Ano8.Text+'/'+IntToStr(StrToInt(NumeroMes(CB_Mes8.Text))));
    End;
    sCaseDemanda:=sCaseDemanda+' End demanda,';

    If sCaseMeses<>'' Then
     sCaseMeses:=sCaseMeses+')';

    // Monta Select de Busca de Demandas =======================================
    MySql:=' SELECT p.codproduto, m.comp_anomes,'+
           sCaseDemanda+

           ' Cast(LPAD(SUBSTRING(m.comp_anomes FROM 6 FOR 2),2,0)  as VarChar(2)) Mes,'+
           ' Cast(SUBSTRING(m.comp_anomes FROM 1 FOR 4) as VarChar(4)) Ano,'+

           ' CASE'+
           '   WHEN (LPAD(SUBSTRING(m.comp_anomes FROM 6 FOR 2),2,0)=Cast(lpad(extract(month from current_date),2,''0'') as varchar(2)))'+
           '         AND'+
           '        (SUBSTRING(m.comp_anomes FROM 1 FOR 4)=Cast(extract(Year from current_date) as varchar(4))) Then'+
           '           Cast(lpad(extract(day from current_date),2,''0'') as integer)-1'+
           '   Else'+
           '        (DATEDIFF(DAY FROM CAST(''01.''||LPAD(SUBSTRING(m.comp_anomes FROM 6 FOR 2),2,0)||''.''||SUBSTRING(m.comp_anomes FROM 1 FOR 4) AS DATE) TO'+
           '         CAST(''01.''||LPAD(SUBSTRING(m.comp_anomes FROM 6 FOR 2),2,0)||''.''||SUBSTRING(m.comp_anomes FROM 1 FOR 4) AS DATE) -'+
           '         EXTRACT(DAY FROM CAST(''01.''||LPAD(SUBSTRING(m.comp_anomes FROM 6 FOR 2),2,0)||''.''||SUBSTRING(m.comp_anomes FROM 1 FOR 4) AS DATE)) + 32 -'+
           '         EXTRACT(DAY FROM CAST(''01.''||LPAD(SUBSTRING(m.comp_anomes FROM 6 FOR 2),2,0)||''.''||SUBSTRING(m.comp_anomes FROM 1 FOR 4) AS DATE) -'+
           '         EXTRACT(DAY FROM CAST(''01.''||LPAD(SUBSTRING(m.comp_anomes FROM 6 FOR 2),2,0)||''.''||SUBSTRING(m.comp_anomes FROM 1 FOR 4) AS DATE)) + 32 )))+1'+
           ' END DIAS,'+
           ' SUM(COALESCE(p.quantatendida,0)) dem'+

           ' FROM mcli m, mclipro p'+

           ' WHERE m.chavenf=p.chavenf'+
           ' AND p.somouestoque=''S'''+
           ' AND (m.codcomprovante=''002'' OR m.codcomprovante=''007'')'+
           ' AND p.codproduto='+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('Cod_Item').AsString)+
           ' AND m.codfilial='+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('Cod_Empresa').AsString);

           If sCaseMeses<>'' Then
            MySql:=MySql+sCaseMeses;

           MySql:=MySql+' GROUP BY 1,2 ORDER BY 2';
    FrmBelShop.IBQ_ConsultaMatriz.Close;
    FrmBelShop.IBQ_ConsultaMatriz.SQL.Clear;
    FrmBelShop.IBQ_ConsultaMatriz.SQL.Add(MySql);
    FrmBelShop.IBQ_ConsultaMatriz.Open;

    // Monta Select de Demandas ================================================
    sDem1:='0';
    If FrmBelShop.IBQ_ConsultaMatriz.Locate('Demanda','Dem1',[]) Then
     sDem1:=FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Dem').AsString;

    If sMes2<>'0' Then
    Begin
      sDem2:='0';
      If FrmBelShop.IBQ_ConsultaMatriz.Locate('Demanda','Dem2',[]) Then
       sDem2:=FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Dem').AsString;
    End;

    If sMes3<>'0' Then
    Begin
      sDem3:='0';
      If FrmBelShop.IBQ_ConsultaMatriz.Locate('Demanda','Dem3',[]) Then
       sDem3:=FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Dem').AsString;
    End;

    If sMes4<>'0' Then
    Begin
      sDem4:='0';
      If FrmBelShop.IBQ_ConsultaMatriz.Locate('Demanda','Dem4',[]) Then
       sDem4:=FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Dem').AsString;
    End;

    If sMes5<>'0' Then
    Begin
      sDem5:='0';
      If FrmBelShop.IBQ_ConsultaMatriz.Locate('Demanda','Dem5',[]) Then
       sDem5:=FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Dem').AsString;
    End;

    If sMes6<>'0' Then
    Begin
      sDem6:='0';
      If FrmBelShop.IBQ_ConsultaMatriz.Locate('Demanda','Dem6',[]) Then
       sDem6:=FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Dem').AsString;
    End;

    If sMes7<>'0' Then
    Begin
      sDem7:='0';
      If FrmBelShop.IBQ_ConsultaMatriz.Locate('Demanda','Dem7',[]) Then
       sDem7:=FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Dem').AsString;
    End;

    If sMes8<>'0' Then
    Begin
      sDem8:='0';
      If FrmBelShop.IBQ_ConsultaMatriz.Locate('Demanda','Dem8',[]) Then
       sDem8:=FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Dem').AsString;
    End;

    // Calculo numero de Dias e Meses ==========================================
    FrmBelShop.IBQ_ConsultaMatriz.First;
    iNrDias:=0;
    iNrMeses:=0;
    DecodeDate(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor), wgAnoH, wgMesH, wgDiaH);
    While Not FrmBelShop.IBQ_ConsultaMatriz.Eof do
    Begin
      ii:=StrToInt(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Mes').AsString);

      If AnsiUpperCase(ShortMonthNames[wgMesH])+IntToStr(wgAnoH)<>
         AnsiUpperCase(ShortMonthNames[ii])+FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Dem').AsString Then
       Inc(iNrMeses);

       iNrDias:=iNrDias+FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Dias').AsInteger;

      FrmBelShop.IBQ_ConsultaMatriz.Next;
    End;

    // Monta SQL com as Demandas ===============================================
    MySql:='Select '+sDem1+' Dem1';
           If sDem2<>'' Then MySql:=MySql+', '+sDem2+' Dem2';
           If sDem3<>'' Then MySql:=MySql+', '+sDem3+' Dem3';
           If sDem4<>'' Then MySql:=MySql+', '+sDem4+' Dem4';
           If sDem5<>'' Then MySql:=MySql+', '+sDem5+' Dem5';
           If sDem6<>'' Then MySql:=MySql+', '+sDem6+' Dem6';
           If sDem7<>'' Then MySql:=MySql+', '+sDem7+' Dem7';
           If sDem8<>'' Then MySql:=MySql+', '+sDem8+' Dem8';
           MySql:=MySql+' From RDB$DATABASE';
    DMBelShop.CDS_Demandas.Close;
    DMBelShop.SDS_Demandas.CommandText:=MySql;
    DMBelShop.CDS_Demandas.Open;
  End; // If bConsulta Then

End; // Busca Demanda e Numeros de Dias e Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produtos para Analise >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmGeraPedidosComprasLojas.BuscaProdutosAnalise: Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  Screen.Cursor:=crAppStart;

  // Produtos Selecionados =====================================================
  sgProdutos:='';
  If Not DMVirtual.CDS_V_Produtos.IsEmpty Then
  Begin

    DMVirtual.CDS_V_Produtos.First;
    While Not DMVirtual.CDS_V_Produtos.Eof do
    Begin
      Refresh;

      If sgProdutos='' Then
       sgProdutos:=QuotedStr(DMVirtual.CDS_V_ProdutosCod_Produto.AsString)
      Else
       sgProdutos:=sgProdutos+', '+
                        QuotedStr(DMVirtual.CDS_V_ProdutosCod_Produto.AsString);

      DMVirtual.CDS_V_Produtos.Next;
    End; // While Not DMVirtual.CDS_V_Produtos.Eof do
    DMVirtual.CDS_V_Produtos.First;

  End; // If Not DMVirtual.CDS_V_Produtos.IsEmpty Then

  // Grupos e SubGrupos Selecionados ===========================================
  sgGrupos:='';
  sgSubGrupos:='';
  If Not DMVirtual.CDS_V_GruposProdutos.IsEmpty Then
  Begin

    DMVirtual.CDS_V_GruposProdutos.First;
    While Not DMVirtual.CDS_V_GruposProdutos.Eof do
    Begin
      Refresh;

      If sgGrupos='' Then
       sgGrupos:='(gr.codgrupo='+
                     QuotedStr(DMVirtual.CDS_V_GruposProdutosCod_Grupo.AsString)
      Else
       sgGrupos:=sgGrupos+' Or gr.codgrupo='+
                    QuotedStr(DMVirtual.CDS_V_GruposProdutosCod_Grupo.AsString);

      If Not DMVirtual.CDS_V_SubGruposProdutos.IsEmpty Then
      Begin
        While Not DMVirtual.CDS_V_SubGruposProdutos.Eof do
        Begin
          Refresh;

          If sgSubGrupos='' Then
           sgSubGrupos:=QuotedStr(DMVirtual.CDS_V_SubGruposProdutosCod_GrupoSub.AsString)
          Else
           sgSubGrupos:=sgSubGrupos+', '+
              QuotedStr(DMVirtual.CDS_V_SubGruposProdutosCod_GrupoSub.AsString);

          DMVirtual.CDS_V_SubGruposProdutos.Next;
        End; // While Not DMVirtual.CDS_V_SubGruposProdutos.Eof do
        DMVirtual.CDS_V_SubGruposProdutos.First;

      End; // If Not DMVirtual.CDS_V_SubGruposProdutos.IsEmpty Then

      If sgSubGrupos<>'' Then
       sgGrupos:=sgGrupos+' and pr.codgruposub in ('+sgSubGrupos+')';

      sgSubGrupos:='';

      DMVirtual.CDS_V_GruposProdutos.Next;
    End; // While Not DMVirtual.CDS_V_GruposProdutos.Eof do
    DMVirtual.CDS_V_GruposProdutos.First;

    If sgGrupos<>'' Then
     sgGrupos:=sgGrupos+')';

  End; // If Not DMVirtual.CDS_V_GruposProdutos.IsEmpty Then

  // Aplicacoes Selecionadas ===================================================
  sgAplicacoes:='';
  If Not DMVirtual.CDS_V_Aplicacao.IsEmpty Then
  Begin

    DMVirtual.CDS_V_Aplicacao.First;
    While Not DMVirtual.CDS_V_Aplicacao.Eof do
    Begin
      Refresh;

      If sgAplicacoes='' Then
       sgAplicacoes:=QuotedStr(DMVirtual.CDS_V_AplicacaoCod_Aplicacao.AsString)
      Else
       sgAplicacoes:=sgAplicacoes+', '+
                     QuotedStr(DMVirtual.CDS_V_AplicacaoCod_Aplicacao.AsString);

      DMVirtual.CDS_V_Aplicacao.Next;
    End; // While Not DMVirtual.CDS_V_Aplicacao.Eof do
    DMVirtual.CDS_V_Aplicacao.First;

  End; // If Not DMVirtual.CDS_V_Aplicacao.IsEmpty Then

  // Familias Preços Selecionadas ==============================================
  sgFamiliaPrecos:='';
  If Not DMVirtual.CDS_V_FamiliaPrecos.IsEmpty Then
  Begin

    DMVirtual.CDS_V_FamiliaPrecos.First;
    While Not DMVirtual.CDS_V_FamiliaPrecos.Eof do
    Begin
      Refresh;

      If sgFamiliaPrecos='' Then
       sgFamiliaPrecos:=
               QuotedStr(DMVirtual.CDS_V_FamiliaPrecosCod_FamiliaPreco.AsString)
      Else
       sgFamiliaPrecos:=sgFamiliaPrecos+', '+
              QuotedStr(DMVirtual.CDS_V_FamiliaPrecosCod_FamiliaPreco.AsString);

      DMVirtual.CDS_V_FamiliaPrecos.Next;
    End; // While Not DMVirtual.CDS_V_FamiliaPrecos.Eof do
    DMVirtual.CDS_V_FamiliaPrecos.First;

  End; // If Not DMVirtual.CDS_V_FamiliaPrecos.IsEmpty Then

  // Grupos ST =================================================================
  sgGruposST:='';
  If Not DMVirtual.CDS_V_GrupoST.IsEmpty Then
  Begin

    DMVirtual.CDS_V_GrupoST.First;
    While Not DMVirtual.CDS_V_GrupoST.Eof do
    Begin
      Refresh;

      If sgGruposST='' Then
       sgGruposST:=QuotedStr(DMVirtual.CDS_V_GrupoSTCod_GrupoST.AsString)
      Else
       sgGruposST:=sgGruposST+', '+
                         QuotedStr(DMVirtual.CDS_V_GrupoSTCod_GrupoST.AsString);

      DMVirtual.CDS_V_GrupoST.Next;
    End; // While Not DMVirtual.CDS_V_GrupoST.Eof do
    DMVirtual.CDS_V_GrupoST.First;

  End; // If Not DMVirtual.CDS_V_GrupoST.IsEmpty Then

  sgCurvas:='';
  // Curva ABC dos Produtos por Loja ou MPMS -----------------------------------
  If Not (FrmBelShop.Rb_CalculoTpCurvaABCMix.Checked) Then
  Begin
    If Not FrmBelShop.Ckb_CalculoCurvaTodas.Checked Then
    Begin
      If FrmBelShop.Ckb_CalculoCurvaA.Checked Then
       sgCurvas:=QuotedStr('A');

      If FrmBelShop.Ckb_CalculoCurvaB.Checked Then
      Begin
        If sgCurvas='' Then
         sgCurvas:=QuotedStr('B')
        Else
         sgCurvas:=sgCurvas+', '+QuotedStr('B');
      End;

      If FrmBelShop.Ckb_CalculoCurvaC.Checked Then
      Begin
        If sgCurvas='' Then
         sgCurvas:=QuotedStr('C')
        Else
         sgCurvas:=sgCurvas+', '+QuotedStr('C');
      End;

      If FrmBelShop.Ckb_CalculoCurvaD.Checked Then
      Begin
        If sgCurvas='' Then
         sgCurvas:=QuotedStr('D')
        Else
         sgCurvas:=sgCurvas+', '+QuotedStr('D');
      End;

      If FrmBelShop.Ckb_CalculoCurvaE.Checked Then
      Begin
        If sgCurvas='' Then
         sgCurvas:=QuotedStr('E')
        Else
         sgCurvas:=sgCurvas+', '+QuotedStr('E');
      End;
    End; // If Not FrmBelShop.Ckb_CalculoCurvaTodas.Checked Then
  End; //   If Not (FrmBelShop.Rb_CalculoTpCurvaABCMix.Checked) Then

  // Curva ABC dos Produtos por Mix de Loja ------------------------------------
  If FrmBelShop.Rb_CalculoTpCurvaABCMix.Checked Then
   FrmBelShop.BuscaMixLoja(sgCodLojaUnica);

  If Trim(sgCurvas)='' Then
   sgCurvas:=QuotedStr('A')+', '+QuotedStr('B')+', '+QuotedStr('C')+', '+
             QuotedStr('D')+', '+QuotedStr('E');

  sgDtaInicio:=DateToStr(DtEdt_CalculoProdNovos.Date);
  sgDtaInicio:=f_Troca('/','.',sgDtaInicio);
  sgDtaInicio:=f_Troca('-','.',sgDtaInicio);

  // Busca Produtos MPMS =======================================================
  MySqlSelect:=' SELECT fi.codfilial COD_EMPRESA, cl.nomecliente Des_Empresa,'+
               ' pr.codproduto COD_ITEM, pr.apresentacao des_item, pr.referencia,'+
               ' pr.datainclusao, pr.codicmcompra, pr.codipicompra, pf.codauxiliar,'+
               ' Coalesce(es.customedio,0) customedio,'+
               ' Coalesce(es.saldoatual,0) Qtd_Saldo,'+
               ' coalesce(pf.unidadecaixa,1) uni_compra,'+

               ' Coalesce(pr.unidadeestoque,1) uni_venda,'+
               ' pr.codbarra,'+
               ' pr.codgruposub, gr.codgrupo, gr.nomegrupo, gs.codsubgrupo, gs.nomesubgrupo,'+
               ' pr.codfamiliapreco, fp.nomefamiliapreco,'+
               ' pr.nomegenerico, pr.codaplicacao, ap.nomeaplicacao,'+
               ' fo.codfornecedor, fo.nomefornecedor, fo.pessoa, fo.email, fo.estado,'+
               ' pr.grupostmva Grupo_ST,'+
               ' Case pr.grupostmva'+
               '   when  0 Then ''Não usa'''+
               '   when  1 Then ''Autopeças'''+
               '   when  2 Then ''Ração'''+
               '   when  3 Then ''Colchões'''+
               '   when  4 Then ''Cosméticos'''+
               '   when  5 Then ''Arroz beneficiado'''+
               '   when  6 Then ''Correias de Transmissão e Rolamentos'''+
               '   when  7 Then ''Tintas e Vernizes'''+
               '   when  8 Then ''Sucos de Frutas e Bebidas não Alcoólicas'''+
               '   when  9 Then ''Ferramentas'''+
               '   when 10 Then ''Materiais Elétricos'''+
               '   when 11 Then ''Mat. Construção, Acabamento, Bricolagem ou Adorno'''+
               '   when 12 Then ''Bicicletas'''+
               '   when 13 Then ''Brinquedos'''+
               '   when 14 Then ''Material de Limpeza'''+
               '   when 15 Then ''Produtos Alimentícios'''+
               '   when 16 Then ''Artefatos de Uso Doméstico'''+
               '   when 17 Then ''Bebidas Quentes'''+
               '   when 18 Then ''Artigos de Papelaria'''+
               '   when 19 Then ''Instrumentos Musicais'''+
               '   when 20 Then ''Prod. Eletronicos, Eletroeletronicos, Eletrodomésticos'''+
               ' End Des_Grupo_ST';

  MySqlClausula1:=' FROM produto pr'+
                  '                 left join estoque es   on pr.codproduto=es.codproduto'+
                  '                                       and es.codfilial = '+QuotedStr(sgCodLojaUnica)+
                  '                 left join filial fi    on es.codfilial=fi.codfilial'+
                  '                 left join cliente cl   on fi.codnocliente=cl.codcliente'+
                  '                 left join gruposub gs  on pr.codgruposub=gs.codgruposub'+
                  '                 left join grupo gr     on gr.codgrupo=gs.codgrupo'+
                  '                 left join aplica ap    on pr.codaplicacao=ap.codaplicacao'+
                  '                 left join forneced fo  on pr.principalfor=fo.codfornecedor'+
                  '                 left join familiap fp  on pr.codfamiliapreco=fp.codfamiliapreco'+
                  '                 left join produfor pf  on pf.chaveforpro=pr.principalfor||pr.codproduto';

                 // Produtos Não Compra -------------------------------------
                 If Not FrmBelShop.Ckb_FiltroProdNaoCompra.Checked Then
                  MySqlClausula1:=MySqlClausula1+' where COALESCE(pr.situacaopro,0)=0'
                 Else
                  MySqlClausula1:=MySqlClausula1+' where COALESCE(pr.situacaopro,0) in (0,3)';

                 // Produtos ------------------------------------------------
                 If Trim(sgProdutos)<>'' Then
                  MySqlClausula1:=MySqlClausula1+' and pr.CodProduto in ('+sgProdutos+')';

                 // Fornecedores --------------------------------------------
                 If Trim(sgFornecedores)<>'' Then
                  MySqlClausula1:=MySqlClausula1+' and pr.principalfor in ('+sgFornecedores+')'
                 Else
                  MySqlClausula1:=MySqlClausula1+' AND pr.principalfor Not in (10000, 300, 500, 1072)';

                 // Grupos e SubGrupos --------------------------------------
                 If Trim(sgGrupos)<>'' Then
                  MySqlClausula1:=MySqlClausula1+' and '+sgGrupos;

                 // Aplicacoes ----------------------------------------------
                 If Trim(sgAplicacoes)<>'' Then
                  MySqlClausula1:=MySqlClausula1+' and pr.CodAplicacao in ('+sgAplicacoes+')';

                 // Familias Preços -----------------------------------------
                 If Trim(sgFamiliaPrecos)<>'' Then
                  MySqlClausula1:=MySqlClausula1+' and pr.CodFamiliaPreco in ('+sgFamiliaPrecos+')';

                 // Grupos ST -----------------------------------------------
                 If Trim(sgGruposST)<>'' Then
                  MySqlClausula1:=MySqlClausula1+' and pr.grupostmva in ('+sgGruposST+')';

  MySqlOrderGrup:=' order by pr.apresentacao';
  FrmBelShop.IBQ_Matriz.Close;
  FrmBelShop.IBQ_Matriz.SQL.Clear;
  FrmBelShop.IBQ_Matriz.SQL.Add(MySqlSelect+MySqlClausula1+MySqlOrderGrup);
  FrmBelShop.IBQ_Matriz.Open;

  If Not FrmBelShop.IBQ_Matriz.IsEmpty Then
  Begin
    Result:=True;

    // Cruva ABC da Loja
    MySql:=' SELECT c.cod_loja, c.cod_produto, c.ind_curva, p.datainclusao dta_inclusao,'+
           ' CASE'+
           '   WHEN (c.ind_curva IN ('+sgCurvas+') OR (p.datainclusao>='+QuotedStr(sgDtaInicio)+'))  Then ''SIM'''+
           '   ELSE ''NAO'''+
           ' END Usar_Curva'+
           ' FROM ES_FINAN_CURVA_ABC c, PRODUTO p'+
           ' WHERE c.cod_produto = p.codproduto'+
           ' AND   c.cod_loja='+QuotedStr(sgCodLojaUnica);
    DMBelShop.CDS_Join.Close;
    DMBelShop.SDS_Join.CommandText:=MySql;
    DMBelShop.CDS_Join.Open;
  End; // If Not FrmBelShop.IBQ_Matriz.IsEmpty Then

  Screen.Cursor:=crDefault;

  OdirPanApres.Visible:=False;

End; // Busca Produtos para Analise >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Efetua o Calculo Para Analise >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGeraPedidosComprasLojas.CalculoAnaliseMatriz;
Var
  MySql: String;
  cDemanda, cMediaMes: Currency; // Busca Demanda
  bUsarCurva: Boolean; // Se produto esta na Faixa da Curva ABC Solicitada
Begin
  // Substitui Valores ---------------------------------------------------------
  If bgProcCurva Then
   ValuesCampos:=f_Troca(' NUM_SEQ ',' '+QuotedStr(IntToStr(iNumSeqDoc))+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' NUM_SEQ ',' '+QuotedStr('9999999')+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' NUM_DOCUMENTO ',' '+QuotedStr(sNumDoc)+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' DTA_DOCUMENTO ',' '+QuotedStr(DateTimeToStr(
           DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)))+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' IND_OC_GERADA ',' '+QuotedStr('N')+' ',ValuesCampos);
  ValuesCampos:=f_Troca(' DTA_OC_GERADA ',' NULL ',ValuesCampos);
  ValuesCampos:=f_Troca(' NUM_OC_GERADA ',' NULL ',ValuesCampos);
  ValuesCampos:=f_Troca(' OBS_OC ',' '+QuotedStr('Calculado em: '+
                DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor))+
                                         ' por '+Des_Usuario)+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' COD_EMPRESA ',' '+QuotedStr(sCodMatriz)+' ',ValuesCampos);
  ValuesCampos:=f_Troca(' DES_EMPRESA ',' '+QuotedStr(Trim(
             FrmBelShop.IBQ_Matriz.FieldByName('DES_EMPRESA').AsString))+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' COD_ITEM ',' '+QuotedStr(
                 FrmBelShop.IBQ_Matriz.FieldByName('COD_ITEM').AsString)+' ',ValuesCampos);
  ValuesCampos:=f_Troca(' DES_ITEM ',' '+QuotedStr(Trim(
                FrmBelShop.IBQ_Matriz.FieldByName('DES_ITEM').AsString))+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_Matriz.FieldByName('CODAUXILIAR').AsString)<>'' Then
   ValuesCampos:=f_Troca(' COD_REFERENCIA_FORN ',' '+QuotedStr(Trim(
              Copy(FrmBelShop.IBQ_Matriz.FieldByName('CODAUXILIAR').AsString,1,30)))+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' COD_REFERENCIA_FORN ',' NULL ',ValuesCampos);

  // Cruva ABC 
  bUsarCurva:=DMBelShop.CDS_Join.FieldByName('Usar_Curva').AsString='SIM';
  ValuesCampos:=f_Troca(' CLA_CURVA_ABC ',' '+QuotedStr(
                          DMBelShop.CDS_Join.FieldByName('Ind_Curva').AsString)+
                                                              ' ',ValuesCampos);

  ValuesCampos:=f_Troca(' COD_BARRAS ',' '+QuotedStr(Trim(
                FrmBelShop.IBQ_Matriz.FieldByName('CODBARRA').AsString))+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_Matriz.FieldByName('CODGRUPO').AsString)<>'' Then
   ValuesCampos:=f_Troca(' COD_GRUPO ',' '+QuotedStr(
                  FrmBelShop.IBQ_Matriz.FieldByName('CODGRUPO').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' COD_GRUPO ',' NULL ',ValuesCampos);

  ValuesCampos:=f_Troca(' DES_GRUPO ',' '+QuotedStr(Trim(
               FrmBelShop.IBQ_Matriz.FieldByName('NOMEGRUPO').AsString))+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_Matriz.FieldByName('CODSUBGRUPO').AsString)<>'' Then
   ValuesCampos:=f_Troca(' COD_SUBGRUPO ',' '+QuotedStr(
               FrmBelShop.IBQ_Matriz.FieldByName('CODSUBGRUPO').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' COD_SUBGRUPO ',' NULL ',ValuesCampos);

  ValuesCampos:=f_Troca(' DES_SUBGRUPO ',' '+QuotedStr(Trim(
            FrmBelShop.IBQ_Matriz.FieldByName('NOMESUBGRUPO').AsString))+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_Matriz.FieldByName('CODFAMILIAPRECO').AsString)<>'' Then
   ValuesCampos:=f_Troca(' COD_FAMILIA_PRECO ',' '+QuotedStr(
           FrmBelShop.IBQ_Matriz.FieldByName('CODFAMILIAPRECO').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' COD_FAMILIA_PRECO ',' NULL ',ValuesCampos);

  ValuesCampos:=f_Troca(' DES_FAMILIA_PRECO ',' '+QuotedStr(Trim(
        FrmBelShop.IBQ_Matriz.FieldByName('NOMEFAMILIAPRECO').AsString))+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' DES_GENERICO ',' '+QuotedStr(Trim(
            FrmBelShop.IBQ_Matriz.FieldByName('NOMEGENERICO').AsString))+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_Matriz.FieldByName('CODAPLICACAO').AsString)<>'' Then
   ValuesCampos:=f_Troca(' COD_APLICACAO ',' '+QuotedStr(
              FrmBelShop.IBQ_Matriz.FieldByName('CODAPLICACAO').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' COD_APLICACAO ',' NULL ',ValuesCampos);

  ValuesCampos:=f_Troca(' DES_APLICACAO ',' '+QuotedStr(Trim(
           FrmBelShop.IBQ_Matriz.FieldByName('NOMEAPLICACAO').AsString))+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' COD_REFERENCIA ',' '+QuotedStr(Trim(
              Copy(FrmBelShop.IBQ_Matriz.FieldByName('REFERENCIA').AsString,1,30)))+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' COD_FORNECEDOR ',' '+QuotedStr(
            FrmBelShop.IBQ_Matriz.FieldByName('CODFORNECEDOR').AsString)+' ',ValuesCampos);
  ValuesCampos:=f_Troca(' DES_FORNECEDOR ',' '+QuotedStr(Trim(
          FrmBelShop.IBQ_Matriz.FieldByName('NOMEFORNECEDOR').AsString))+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' TIP_PESSOA ',' '+QuotedStr(
                   FrmBelShop.IBQ_Matriz.FieldByName('PESSOA').AsString)+' ',ValuesCampos);
  ValuesCampos:=f_Troca(' DES_EMAIL ',' '+QuotedStr(Trim(
                   FrmBelShop.IBQ_Matriz.FieldByName('EMAIL').AsString))+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_Matriz.FieldByName('GRUPO_ST').AsString)<>'' Then
   ValuesCampos:=f_Troca(' COD_GRUPO_ST ',' '+QuotedStr(
                  FrmBelShop.IBQ_Matriz.FieldByName('GRUPO_ST').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' COD_GRUPO_ST ',' NULL ',ValuesCampos);

  ValuesCampos:=f_Troca(' DES_GRUPO_ST ',' '+QuotedStr(Trim(
            FrmBelShop.IBQ_Matriz.FieldByName('DES_GRUPO_ST').AsString))+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' UNI_COMPRA ',' '+QuotedStr(IntToStr(StrToIntDef(
                   Trim(FrmBelShop.IBQ_Matriz.FieldByName('UNI_COMPRA').AsString),1)))+' ',
                                                                  ValuesCampos);
  ValuesCampos:=f_Troca(' UNI_VENDA ',' '+QuotedStr(IntToStr(StrToIntDef(
                    Trim(FrmBelShop.IBQ_Matriz.FieldByName('UNI_VENDA').AsString),1)))+' ',
                                                                  ValuesCampos);

  ValuesCampos:=f_Troca(' VLR_CUSTO_MEDIO ',' '+QuotedStr(
               FrmBelShop.IBQ_Matriz.FieldByName('CUSTOMEDIO').AsString)+' ',ValuesCampos);

  // Ultima Compra -------------------------------------------------------------
  MySql:=' SELECT p.codproduto, m.dataentrada dta_ref,'+
         ' pr.principalfor codfornecedor, f.nomefornecedor,'+
         ' p.quant quant_ref, P.preco, P.valtotal vlr_total_ref'+

         ' FROM mfor m, mforpro p, produto pr, forneced f'+

         ' WHERE m.chavenf=p.chavenf'+
         ' AND p.codproduto=pr.codproduto'+
         ' AND pr.principalfor=f.codfornecedor'+
         ' AND m.codcomprovante IN (''010'', ''012'')'+
         ' AND m.dataentrada=(SELECT MAX(m1.dataentrada)'+
         '                    FROM mfor m1, mforpro p1'+
         '                    WHERE m1.chavenf=p1.chavenf'+
         '                    AND p1.entradasaida = ''E'''+
         '                    AND m1.codfilial = '+QuotedStr(sCodMatriz)+
         '                    AND m1.codcomprovante IN (''010'', ''012'')'+
         '                    AND p1.codproduto=p.codproduto)'+
         ' AND p.entradasaida = ''E'''+
         ' AND m.codfilial = '+QuotedStr(sCodMatriz)+
         ' AND p.codproduto='+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('Cod_Item').AsString);
  FrmBelShop.IBQ_ConsultaMatriz.Close;
  FrmBelShop.IBQ_ConsultaMatriz.SQL.Clear;
  FrmBelShop.IBQ_ConsultaMatriz.SQL.Add(MySql);
  FrmBelShop.IBQ_ConsultaMatriz.Open;

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('CodProduto').AsString)<>'' Then
   Begin
     ValuesCampos:=f_Troca(' DTA_ULT_COMPRA ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('DTA_REF').AsString)+
                                                              ' ',ValuesCampos);
     ValuesCampos:=f_Troca(' COD_FOR_ULT_COMPRA ',' '+QuotedStr(
           FrmBelShop.IBQ_ConsultaMatriz.FieldByName('CODFORNECEDOR').AsString)+
                                                              ' ',ValuesCampos);
     ValuesCampos:=f_Troca(' DES_FOR_ULT_COMPRA ',' '+QuotedStr(Trim(
         FrmBelShop.IBQ_ConsultaMatriz.FieldByName('NOMEFORNECEDOR').AsString))+
                                                              ' ',ValuesCampos);
     ValuesCampos:=f_Troca(' QTD_ULT_COMPRA ',' '+QuotedStr(f_Troca('-','',
              FrmBelShop.IBQ_ConsultaMatriz.FieldByName('QUANT_REF').AsString))+
                                                              ' ',ValuesCampos);
     ValuesCampos:=f_Troca(' VLR_UNI_ULT_COMPRA ',' '+QuotedStr(
                   FrmBelShop.IBQ_ConsultaMatriz.FieldByName('PRECO').AsString)+
                                                              ' ',ValuesCampos);
     ValuesCampos:=f_Troca(' VLR_TOT_ULT_COMPRA ',' '+QuotedStr(
           FrmBelShop.IBQ_ConsultaMatriz.FieldByName('VLR_TOTAL_REF').AsString)+
                                                              ' ',ValuesCampos);
   End
  Else // If Trim(IBQ_ConsultaMatriz.FieldByName('codfornecedor').AsString)<>'' Then
   Begin
     ValuesCampos:=f_Troca(' DTA_ULT_COMPRA ',' NULL ',ValuesCampos);
     ValuesCampos:=f_Troca(' COD_FOR_ULT_COMPRA ',' NULL ',ValuesCampos);
     ValuesCampos:=f_Troca(' DES_FOR_ULT_COMPRA ',' NULL ',ValuesCampos);
     ValuesCampos:=f_Troca(' QTD_ULT_COMPRA ',' 0 ',ValuesCampos);
     ValuesCampos:=f_Troca(' VLR_UNI_ULT_COMPRA ',' 0 ',ValuesCampos);
     ValuesCampos:=f_Troca(' VLR_TOT_ULT_COMPRA ',' 0 ',ValuesCampos);
   End;  // If Trim(IBQ_ConsultaMatriz.FieldByName('codfornecedor').AsString)<>'' Then
  FrmBelShop.IBQ_ConsultaMatriz.Close;

//OPSS_Normal
//  // Ultima Venda --------------------------------------------------------------
//  MySql:='select m.codcliente, c.nomecliente,'+
//         ' m.datadocumento, p.quantatendida, p.PRECO, p.VALTOTAL'+
//
//         ' from mcli m, mclipro p,  cliente c, estoque e'+
//
//         ' where m.chavenf=p.chavenf'+
//         ' and m.codcliente=c.codCliente'+
//         ' and m.codfilial = e.codfilial'+
//         ' and p.codproduto = e.codproduto'+
//         ' and m.datadocumento = e.datavenda'+
//
//         ' and p.CHAVENFPRO>'''''+
//         ' and p.entradasaida=''S'''+
//         ' and p.somouestoque=''S'''+
//         ' and p.codproduto = '+
//         QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('Cod_Item').AsString)+
//         ' and m.codfilial = '+QuotedStr(sCodMatriz);
//  IBQ_ConsultaMatriz.Close;
//  IBQ_ConsultaMatriz.SQL.Clear;
//  IBQ_ConsultaMatriz.SQL.Add(MySql);
//  IBQ_ConsultaMatriz.Open;
//
//  If Trim(IBQ_ConsultaMatriz.FieldByName('codcliente').AsString)<>'' Then
//   Begin
//     ValuesCampos:=f_Troca(' DTA_ULT_VENDA ',' '+QuotedStr(
//                      IBQ_ConsultaMatriz.FieldByName('DataDocumento').AsString)+
//                                                              ' ',ValuesCampos);
//     ValuesCampos:=f_Troca(' COD_CLI_ULT_VENDA ',' '+QuotedStr(
//                         IBQ_ConsultaMatriz.FieldByName('CodCliente').AsString)+
//                                                              ' ',ValuesCampos);
//     ValuesCampos:=f_Troca(' DES_CLI_ULT_VENDA ',' '+QuotedStr(Trim(
//                       IBQ_ConsultaMatriz.FieldByName('NomeCliente').AsString))+
//                                                              ' ',ValuesCampos);
//     ValuesCampos:=f_Troca(' QTD_ULT_VENDA ',' '+QuotedStr(
//                      IBQ_ConsultaMatriz.FieldByName('QuantAtendida').AsString)+
//                                                              ' ',ValuesCampos);
//     ValuesCampos:=f_Troca(' VLR_UNI_ULT_VENDA ',' '+QuotedStr(
//                              IBQ_ConsultaMatriz.FieldByName('Preco').AsString)+
//                                                              ' ',ValuesCampos);
//     ValuesCampos:=f_Troca(' VLR_TOT_ULT_VENDA ',' '+QuotedStr(
//                           IBQ_ConsultaMatriz.FieldByName('ValTotal').AsString)+
//                                                              ' ',ValuesCampos);
//   End
//  Else // If Trim(IBQ_ConsultaMatriz.FieldByName('codcliente').AsString)<>'' Then
//   Begin
     ValuesCampos:=f_Troca(' DTA_ULT_VENDA ',' NULL ',ValuesCampos);
     ValuesCampos:=f_Troca(' COD_CLI_ULT_VENDA ',' NULL ',ValuesCampos);
     ValuesCampos:=f_Troca(' DES_CLI_ULT_VENDA ',' NULL ',ValuesCampos);
     ValuesCampos:=f_Troca(' QTD_ULT_VENDA ',' 0 ',ValuesCampos);
     ValuesCampos:=f_Troca(' VLR_UNI_ULT_VENDA ',' 0 ',ValuesCampos);
     ValuesCampos:=f_Troca(' VLR_TOT_ULT_VENDA ',' 0 ',ValuesCampos);
//OPSS_Normal
//   End;
//  IBQ_ConsultaMatriz.Close;

  // Lista de Precos -----------------------------------------------------------
  ValuesCampos:=f_Troca(' COD_LISTA_VENDA ',' '+QuotedStr(sgCodListaPrePadrao)+' ',ValuesCampos);
  ValuesCampos:=f_Troca(' DES_LISTA_VENDA ',' '+QuotedStr(Trim(sgDesListaPrePadrao))+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' COD_LISTA_COMPRA ',' '+QuotedStr(sgCodListaPrePadrao)+' ',ValuesCampos);
  ValuesCampos:=f_Troca(' DES_LISTA_COMPRA ',' '+QuotedStr(Trim(sgDesListaPrePadrao))+' ',ValuesCampos);

  // Preço de Venda e Compra ---------------------------------------------------
  MySql:='select lpi.codlista, lpi.codproduto, lpi.precocompra,'+
         ' lpi.precovenda, lpi.margem, lpi.desconto, lpi.descontomax,'+
         ' lpi.acrecimolista'+

         ' FROM lista lp, listapre lpi'+

         ' Where lpi.codlista=lp.codlista'+

         ' and lpi.desativado=0'+
         ' and lp.desativada=''N'''+

         ' and lpi.codlista = '+QuotedStr(sgCodListaPrePadrao)+
         ' and lpi.codproduto = '+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('Cod_Item').AsString);
  FrmBelShop.IBQ_ConsultaMatriz.Close;
  FrmBelShop.IBQ_ConsultaMatriz.SQL.Clear;
  FrmBelShop.IBQ_ConsultaMatriz.SQL.Add(MySql);
  FrmBelShop.IBQ_ConsultaMatriz.Open;

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('CodLista').AsString)<>'' Then
   Begin
     If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('PrecoVenda').AsString)<>'' Then
      ValuesCampos:=f_Troca(' VLR_UNI_VENDA ',' '+QuotedStr(
                         FrmBelShop.IBQ_ConsultaMatriz.FieldByName('PrecoVenda').AsString)+
                                                               ' ',ValuesCampos)
     Else
      ValuesCampos:=f_Troca(' VLR_UNI_VENDA ',' 0 ',ValuesCampos);

     If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('PrecoCompra').AsString)<>'' Then
      ValuesCampos:=f_Troca(' VLR_UNI_COMPRA ',' '+QuotedStr(
                        FrmBelShop.IBQ_ConsultaMatriz.FieldByName('PrecoCompra').AsString)+
                                                               ' ',ValuesCampos)
     Else
      ValuesCampos:=f_Troca(' VLR_UNI_COMPRA ',' 0 ',ValuesCampos);
   End
  Else // If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('CodLista').AsString)<>'' Then
   Begin
     ValuesCampos:=f_Troca(' VLR_UNI_VENDA ',' 0 ',ValuesCampos);
     ValuesCampos:=f_Troca(' VLR_UNI_COMPRA ',' 0 ',ValuesCampos);
   End; // If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('CodLista').AsString)<>'' Then
  FrmBelShop.IBQ_ConsultaMatriz.Close;

  // Saldo e Disponivel --------------------------------------------------------
  ValuesCampos:=f_Troca(' QTD_SALDO ',' '+QuotedStr(
                FrmBelShop.IBQ_Matriz.FieldByName('QTD_SALDO').AsString)+' ',ValuesCampos);

  // Busca Transito e Acerta Saldo Disponível ---------------------
  MySql:=' SELECT oci.CODPRODUTO, SUM(COALESCE(oci.QUANTIDADE,0)) Qtd_Transito'+
         ' FROM ordem oc, ordemite oci'+
         ' WHERE oc.codoc = oci.codoc'+
         ' AND oc.situacao < 2'+
         ' AND oc.codfilial='+QuotedStr(sCodMatriz)+
         ' AND oci.codproduto='+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('Cod_Item').AsString)+
         ' GROUP BY 1';
  FrmBelShop.IBQ_ConsultaMatriz.Close;
  FrmBelShop.IBQ_ConsultaMatriz.SQL.Clear;
  FrmBelShop.IBQ_ConsultaMatriz.SQL.Add(MySql);
  FrmBelShop.IBQ_ConsultaMatriz.Open;

  If FrmBelShop.IBQ_ConsultaMatriz.FieldByName('QTD_TRANSITO').AsCurrency>0 Then
   Begin
     ValuesCampos:=f_Troca(' QTD_TRANSITO ',' '+QuotedStr(
            FrmBelShop.IBQ_ConsultaMatriz.FieldByName('QTD_TRANSITO').AsString)+
                                                            ' ',ValuesCampos);
     ValuesCampos:=f_Troca(' QTD_DISPONIVEL ',' '+QuotedStr(CurrToStr(
                      FrmBelShop.IBQ_Matriz.FieldByName('QTD_SALDO').AsCurrency+
         FrmBelShop.IBQ_ConsultaMatriz.FieldByName('QTD_TRANSITO').AsCurrency))+
                                                            ' ',ValuesCampos);
   End
  Else // If DMBelShop.CDS_BuscaRapida.FieldByName('QTD_TRANSITO').AsCurrency>0 Then
   Begin
     ValuesCampos:=f_Troca(' QTD_TRANSITO ',' 0 ',ValuesCampos);
     ValuesCampos:=f_Troca(' QTD_DISPONIVEL ',' '+QuotedStr(
                                FrmBelShop.IBQ_Matriz.FieldByName('QTD_SALDO').AsString)+
                                                            ' ',ValuesCampos);
   End; // If DMBelShop.CDS_BuscaRapida.FieldByName('QTD_TRANSITO').AsCurrency>0 Then
  FrmBelShop.IBQ_ConsultaMatriz.Close;

  // Inicializa Variaveis de Demanda -------------------------------------------
  igNrDias:=0;
  igNrMeses:=0;
  igTotMeses:=0;
  cgOutras_Demandas:=0;
  cgTotal_Demandas:=0;

  // Busca Demandas e Totais Dias para Mes 1 -----------------------------
  BuscaDemanda(CB_Mes1, ME_Ano1, FrmBelShop.IBQ_Matriz.FieldByName('Cod_Item').AsString,
                FrmBelShop.IBQ_Matriz.FieldByName('Cod_Empresa').AsString, cDemanda,
                igNrDias, igNrMeses, True);

  // Numero de Meses Total =====================================================
  igTotMeses:=igTotMeses+1;

  If Trim(DMBelShop.CDS_Demandas.FieldByName('Dem1').AsString)<>'' Then
   Begin
     cgTotal_Demandas:=cgTotal_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem1').AsCurrency;
     ValuesCampos:=f_Troca(' QTD_DEM_MES1 ',' '+QuotedStr(
                           DMBelShop.CDS_Demandas.FieldByName('Dem1').AsString)+
                                                              ' ',ValuesCampos);
   End
  Else // If Trim(DMBelShop.CDS_Demandas.FieldByName('Dem1').AsString)<>'' Then
   Begin
     ValuesCampos:=f_Troca(' QTD_DEM_MES1 ',' 0 ',ValuesCampos);
   End; // If Trim(DMBelShop.CDS_Demandas.FieldByName('Dem1').AsString)<>'' Then

  // Demanda Mes 2 -------------------------------------------------------
  If (sMes2<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem2').AsString)<>'') Then
   Begin
     cgOutras_Demandas:=cgOutras_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem2').AsCurrency;
     cgTotal_Demandas:=cgTotal_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem2').AsCurrency;
     ValuesCampos:=f_Troca(' QTD_DEM_MES2 ',' '+QuotedStr(
                           DMBelShop.CDS_Demandas.FieldByName('Dem2').AsString)+
                                                              ' ',ValuesCampos);
   End
  Else
   Begin
     ValuesCampos:=f_Troca(' QTD_DEM_MES2 ',' 0 ',ValuesCampos);
   End; // If (sMes2<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem2').AsString)<>'') Then

  // Demanda Mes 3 -------------------------------------------------------
  If (sMes3<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem3').AsString)<>'') Then
   Begin
     cgOutras_Demandas:=cgOutras_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem3').AsCurrency;
     cgTotal_Demandas:=cgTotal_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem3').AsCurrency;
     ValuesCampos:=f_Troca(' QTD_DEM_MES3 ',' '+QuotedStr(
                           DMBelShop.CDS_Demandas.FieldByName('Dem3').AsString)+
                                                              ' ',ValuesCampos);
   End
  Else
   Begin
     ValuesCampos:=f_Troca(' QTD_DEM_MES3 ',' 0 ',ValuesCampos);
   End; // If (sMes3<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem3').AsString)<>'') Then

  // Demanda Mes 4 -------------------------------------------------------
  If (sMes4<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem4').AsString)<>'') Then
   Begin
     cgOutras_Demandas:=cgOutras_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem4').AsCurrency;
     cgTotal_Demandas:=cgTotal_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem4').AsCurrency;
     ValuesCampos:=f_Troca(' QTD_DEM_MES4 ',' '+QuotedStr(
                           DMBelShop.CDS_Demandas.FieldByName('Dem4').AsString)+
                                                              ' ',ValuesCampos);
   End
  Else
   Begin
     ValuesCampos:=f_Troca(' QTD_DEM_MES4 ',' 0 ',ValuesCampos);
   End; // If (sMes4<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem4').AsString)<>'') Then

  // Demanda Mes 5 -------------------------------------------------------
  If (sMes5<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem5').AsString)<>'') Then
   Begin
     cgOutras_Demandas:=cgOutras_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem5').AsCurrency;
     cgTotal_Demandas:=cgTotal_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem5').AsCurrency;
     ValuesCampos:=f_Troca(' QTD_DEM_MES5 ',' '+QuotedStr(
                           DMBelShop.CDS_Demandas.FieldByName('Dem5').AsString)+
                                                              ' ',ValuesCampos);
   End
  Else
   Begin
     ValuesCampos:=f_Troca(' QTD_DEM_MES5 ',' 0 ',ValuesCampos);
   End; // If (sMes5<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem5').AsString)<>'') Then

  // Demanda Mes 6 -------------------------------------------------------
  If (sMes6<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem6').AsString)<>'') Then
   Begin
     cgOutras_Demandas:=cgOutras_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem6').AsCurrency;
     cgTotal_Demandas:=cgTotal_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem6').AsCurrency;
     ValuesCampos:=f_Troca(' QTD_DEM_MES6 ',' '+QuotedStr(
                           DMBelShop.CDS_Demandas.FieldByName('Dem6').AsString)+
                                                              ' ',ValuesCampos);
   End
  Else // If (sMes6<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem6').AsString)<>'') Then
   Begin
     ValuesCampos:=f_Troca(' QTD_DEM_MES6 ',' 0 ',ValuesCampos);
   End;

  // Demanda Mes 7 -------------------------------------------------------
  If (sMes7<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem7').AsString)<>'') Then
   Begin
     cgOutras_Demandas:=cgOutras_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem7').AsCurrency;
     cgTotal_Demandas:=cgTotal_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem7').AsCurrency;
     ValuesCampos:=f_Troca(' QTD_DEM_MES7 ',' '+QuotedStr(
                           DMBelShop.CDS_Demandas.FieldByName('Dem7').AsString)+
                                                              ' ',ValuesCampos);
   End
  Else
   Begin
     ValuesCampos:=f_Troca(' QTD_DEM_MES7 ',' 0 ',ValuesCampos);
   End; // If (sMes7<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem7').AsString)<>'') Then

  // Demanda Mes 8 -------------------------------------------------------
  If (sMes8<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem8').AsString)<>'') Then
   Begin
     cgOutras_Demandas:=cgOutras_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem8').AsCurrency;
     cgTotal_Demandas:=cgTotal_Demandas+
                          DMBelShop.CDS_Demandas.FieldByName('Dem8').AsCurrency;
     ValuesCampos:=f_Troca(' QTD_DEM_MES8 ',' '+QuotedStr(
                           DMBelShop.CDS_Demandas.FieldByName('Dem8').AsString)+
                                                              ' ',ValuesCampos);
   End
  Else
   Begin
     ValuesCampos:=f_Troca(' QTD_DEM_MES8 ',' 0 ',ValuesCampos);
   End; // If (sMes7<>'0') and (Trim(DMBelShop.CDS_Demandas.FieldByName('Dem7').AsString)<>'') Then

  DMBelShop.CDS_Demandas.Close;

  // Totais Dias para Mes 2 ----------------------------------------------------
  If CB_Mes2.Text<>'NAO USAR' Then
  Begin
    // Numero de Meses Total =====================================================
     igTotMeses:=igTotMeses+1;
  End; // If CB_Mes2.Text<>'NAO USAR' Then

  // Totais Dias para Mes 3 ----------------------------------------------------
  If CB_Mes3.Text<>'NAO USAR' Then
  Begin
    // Numero de Meses Total =====================================================
     igTotMeses:=igTotMeses+1;
  End; // If CB_Mes3.Text<>'NAO USAR' Then

  // Totais Dias para Mes 4 ----------------------------------------------------
  If CB_Mes4.Text<>'NAO USAR' Then
  Begin
    // Numero de Meses Total =====================================================
     igTotMeses:=igTotMeses+1;
  End; // If CB_Mes4.Text<>'NAO USAR' Then

  // Totais Dias para Mes 5 ----------------------------------------------------
  If CB_Mes5.Text<>'NAO USAR' Then
  Begin
    // Numero de Meses Total =====================================================
     igTotMeses:=igTotMeses+1;
  End; // If CB_Mes5.Text<>'NAO USAR' Then

  // Totais Dias para Mes 6 ----------------------------------------------------
  If CB_Mes6.Text<>'NAO USAR' Then
  Begin
    // Numero de Meses Total =====================================================
     igTotMeses:=igTotMeses+1;
  End; // If CB_Mes6.Text<>'NAO USAR' Then

  // Totais Dias para Mes 7 ----------------------------------------------------
  If CB_Mes7.Text<>'NAO USAR' Then
  Begin
    // Numero de Meses Total =====================================================
     igTotMeses:=igTotMeses+1;
  End; // If CB_Mes7.Text<>'NAO USAR' Then

  // Totais Dias para Mes 8 ----------------------------------------------------
  If CB_Mes8.Text<>'NAO USAR' Then
  Begin
    // Numero de Meses Total =====================================================
     igTotMeses:=igTotMeses+1;
  End; // If CB_Mes8.Text<>'NAO USAR' Then

  ValuesCampos:=f_Troca(' QTD_NR_DIAS ',' '+QuotedStr(IntToStr(igNrDias))+
                                                              ' ',ValuesCampos);
  ValuesCampos:=f_Troca(' QTD_NR_MESES ',' '+QuotedStr(IntToStr(igNrMeses))+
                                                              ' ',ValuesCampos);
  ValuesCampos:=f_Troca(' QTD_TOT_MESES ',' '+QuotedStr(IntToStr(igTotMeses))+
                                                              ' ',ValuesCampos);
  // Calulo das Medias ---------------------------------------------------------
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
  ValuesCampos:=f_Troca(' QTD_MEDIA_MES ',' '+QuotedStr(CurrToStr(cMediaMes))+' ',ValuesCampos);

  If igNrDias<>0 Then
   ValuesCampos:=f_Troca(' QTD_MEDIA_DIA ',' '+QuotedStr(
           CurrToStr(RoundTo((cgTotal_Demandas/igNrDias),-4)))+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' QTD_MEDIA_DIA ',' '+QuotedStr('0')+' ',ValuesCampos);

  // Informa Quantidade a Transferir -------------------------------------
  If Not bUsarCurva Then
   Begin
     If FrmBelShop.IBQ_Matriz.FieldByName('QTD_SALDO').AsCurrency>cMediaMes Then
      cMediaMes:=RoundTo((FrmBelShop.IBQ_Matriz.FieldByName('QTD_SALDO').AsCurrency-cMediaMes),0)
     Else
      cMediaMes:=0;
   End
  Else
   Begin
     cMediaMes:=0;
   End;

  ValuesCampos:=f_Troca(' QTD_TRANSF ',' '+QuotedStr('0')+' ',ValuesCampos);
  ValuesCampos:=f_Troca(' IND_QTD_ACIMA ',' '+QuotedStr('0')+' ',ValuesCampos);

  // Quandidades Sugerida para Compra ------------------------------------------
  ValuesCampos:=f_Troca(' QTD_SUGERIDA ',' 0 ',ValuesCampos);
  ValuesCampos:=f_Troca(' QTD_ACOMPRAR ',' 0 ',ValuesCampos);
  ValuesCampos:=f_Troca(' PER_DESCONTO ',' 0 ',ValuesCampos);

  // Valores de Compra ---------------------------------------------------------
  ValuesCampos:=f_Troca(' VLR_BRUTO ',' 0 ',ValuesCampos);
  ValuesCampos:=f_Troca(' VLR_DESCONTOS ',' 0 ',ValuesCampos);
  ValuesCampos:=f_Troca(' VLR_DESPESAS ',' 0 ',ValuesCampos);
  ValuesCampos:=f_Troca(' VLR_FRETE ',' 0 ',ValuesCampos);
  ValuesCampos:=f_Troca(' VLR_TOT_VENDA ',' 0 ',ValuesCampos);
  ValuesCampos:=f_Troca(' VLR_TOT_COMPRA ',' 0 ',ValuesCampos);

  // Impostos (ICMS) -----------------------------------------------------------
  ValuesCampos:=f_Troca(' COD_ICMS ',' '+QuotedStr(
             FrmBelShop.IBQ_Matriz.FieldByName('CODICMCOMPRA').AsString)+' ',ValuesCampos);

  MySql:='select CODICM, SITTRIBUTARIA, ALIQUOTA, REDUCAO, SOMAIPIBASE,'+
         ' SOMAFRETEBASE, SOMADESPESABASE, SUBSTITUICAO, SUBSTVALPER,'+
         ' SUBSTMARGEM, SUBSTALIQUOTA, SOMAIPIBASESUBST, ALIQREPASSE,'+
         ' SOMAFRETEBASEST, SOMADESPESABASEST'+

         ' from tabelaicms'+

         ' Where CODCOMPROVANTE=''012'''+  // Sempre 012 = Ordem de Compra
         ' and CLIOUFOR=''F'''+
         ' and CODICM='+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('CodIcmCompra').AsString)+
         ' and CODESTADO='+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('Estado').AsString)+
         ' and REVENDACONSUMOFJ='+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('Pessoa').AsString);
  FrmBelShop.IBQ_ConsultaMatriz.Close;
  FrmBelShop.IBQ_ConsultaMatriz.SQL.Clear;
  FrmBelShop.IBQ_ConsultaMatriz.SQL.Add(MySql);
  FrmBelShop.IBQ_ConsultaMatriz.Open;

  ValuesCampos:=f_Troca(' COD_SIT_TRIBUTARIA ',' '+QuotedStr(
                FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SITTRIBUTARIA').AsString)+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SOMAIPIBASE').AsString)<>'' Then
   ValuesCampos:=f_Troca(' IND_SOMA_IPI_BASE_ICMS ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SOMAIPIBASE').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' IND_SOMA_IPI_BASE_ICMS ',' '+QuotedStr('N')+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SOMAFRETEBASE').AsString)<>'' Then
   ValuesCampos:=f_Troca(' IND_SOMA_FRETE_BASE_ICMS ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SOMAFRETEBASE').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' IND_SOMA_FRETE_BASE_ICMS ',' '+QuotedStr('N')+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SOMADESPESABASE').AsString)<>'' Then
   ValuesCampos:=f_Troca(' IND_SOMA_DESPESA_BASE_ICMS ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SOMADESPESABASE').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' IND_SOMA_DESPESA_BASE_ICMS ',' '+QuotedStr('N')+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SOMAIPIBASESUBST').AsString)<>'' Then
   ValuesCampos:=f_Troca(' IND_SOMA_IPI_BASE_ST ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SOMAIPIBASESUBST').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' IND_SOMA_IPI_BASE_ST ',' '+QuotedStr('N')+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SOMAFRETEBASEST').AsString)<>'' Then
   ValuesCampos:=f_Troca(' IND_SOMA_FRETE_BASE_ST ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SOMAFRETEBASEST').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' IND_SOMA_FRETE_BASE_ST ',' '+QuotedStr('N')+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SOMADESPESABASEST').AsString)<>'' Then
   ValuesCampos:=f_Troca(' IND_SOMA_DESPESA_BASE_ST ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SOMADESPESABASEST').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' IND_SOMA_DESPESA_BASE_ST ',' '+QuotedStr('N')+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' VLR_BASE_ICMS ',' '+QuotedStr('0')+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('REDUCAO').AsString)<>'' Then
   ValuesCampos:=f_Troca(' PER_REDUCAO_ICMS ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('REDUCAO').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' PER_REDUCAO_ICMS ',' '+QuotedStr('0')+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' VLR_REDUCAO_ICMS ',' '+QuotedStr('0')+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('ALIQUOTA').AsString)<>'' Then
   ValuesCampos:=f_Troca(' PER_ICMS ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('ALIQUOTA').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' PER_ICMS ',' '+QuotedStr('0')+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' VLR_ICMS ',' '+QuotedStr('0')+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SUBSTMARGEM').AsString)<>'' Then
   ValuesCampos:=f_Troca(' PER_MARGEM_ST ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SUBSTMARGEM').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' PER_MARGEM_ST ',' '+QuotedStr('0')+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SUBSTVALPER').AsString)<>'' Then
   ValuesCampos:=f_Troca(' IND_ST ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SUBSTVALPER').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' IND_ST ',' '+QuotedStr('P')+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' VLR_BASE_ST ',' '+QuotedStr('0')+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SUBSTALIQUOTA').AsString)<>'' Then
   ValuesCampos:=f_Troca(' PER_ST ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('SUBSTALIQUOTA').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' PER_ST ',' '+QuotedStr('0')+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' VLR_ST ',' '+QuotedStr('0')+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('ALIQREPASSE').AsString)<>'' Then
   ValuesCampos:=f_Troca(' PER_REPASSE ',' '+QuotedStr(
                 FrmBelShop.IBQ_ConsultaMatriz.FieldByName('ALIQREPASSE').AsString)+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' PER_REPASSE ',' '+QuotedStr('0')+' ',ValuesCampos);

  FrmBelShop.IBQ_ConsultaMatriz.Close;

  ValuesCampos:=f_Troca(' VLR_REPASSE ',' '+QuotedStr('0')+' ',ValuesCampos);
  ValuesCampos:=f_Troca(' COD_COMPROVANTE_ICMS ',' '+QuotedStr('012')+' ',ValuesCampos);

  // Impostos (IPI) ------------------------------------------------------------
  ValuesCampos:=f_Troca(' COD_IPI ',' '+QuotedStr(
             FrmBelShop.IBQ_Matriz.FieldByName('CODIPICOMPRA').AsString)+' ',ValuesCampos);

  If Trim(FrmBelShop.IBQ_Matriz.FieldByName('CODIPICOMPRA').AsString)<>'' Then
   Begin
     MySql:='select CODIPI, ALIQUOTA, IPIPERCOUVALOR'+
            ' from ipis'+
            ' where codipi='+
            QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('CODIPICOMPRA').AsString);
     FrmBelShop.IBQ_ConsultaMatriz.Close;
     FrmBelShop.IBQ_ConsultaMatriz.SQL.Clear;
     FrmBelShop.IBQ_ConsultaMatriz.SQL.Add(MySql);
     FrmBelShop.IBQ_ConsultaMatriz.Open;

     If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('IPIPERCOUVALOR').AsString)<>'' Then
      ValuesCampos:=f_Troca(' IND_IPI ',' '+QuotedStr(
                    FrmBelShop.IBQ_ConsultaMatriz.FieldByName('IPIPERCOUVALOR').AsString)+' ',ValuesCampos)
     Else
      ValuesCampos:=f_Troca(' IND_IPI ',' '+QuotedStr('P')+' ',ValuesCampos);

     If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('ALIQUOTA').AsString)<>'' Then
      ValuesCampos:=f_Troca(' PER_IPI ',' '+QuotedStr(
                    FrmBelShop.IBQ_ConsultaMatriz.FieldByName('ALIQUOTA').AsString)+' ',ValuesCampos)
     Else
      ValuesCampos:=f_Troca(' PER_IPI ',' '+QuotedStr('0')+' ',ValuesCampos);

     FrmBelShop.IBQ_ConsultaMatriz.Close;

     ValuesCampos:=f_Troca(' VLR_IPI ',' '+QuotedStr('0')+' ',ValuesCampos);
   End
  Else
   Begin
     ValuesCampos:=f_Troca(' IND_IPI ',' '+QuotedStr('P')+' ',ValuesCampos);
     ValuesCampos:=f_Troca(' PER_IPI ',' '+QuotedStr('0')+' ',ValuesCampos);
     ValuesCampos:=f_Troca(' VLR_IPI ',' '+QuotedStr('0')+' ',ValuesCampos);
   End;

  ValuesCampos:=f_Troca(' COD_COMPRADOR ',' '+Cod_Usuario+' ',ValuesCampos);
  ValuesCampos:=f_Troca(' BLOB_TEXTO ',' '+QuotedStr(
       'Aberturta do Aplicativo: '+sgDataHoraAplicativo)+'|| ascii_char(13) ||'+
       QuotedStr('Calculado em: '+DateTimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor))+
                                         ' por '+Des_Usuario)+' ',ValuesCampos);

//opss Transf INICIO
//  // Analise Possibilidade de Transferencia ------------------------------------
//  If FrmBelShop.IBQ_Matriz.FieldByName('QTD_SALDO').AsCurrency>0 Then
//   Begin
//     If sgDtaLimTransf<>'' Then
//      Begin
//        ValuesCampos:=f_Troca(' DTA_LIM_TRANSF ',' '+QuotedStr(sgDtaLimTransf)+' ',ValuesCampos);
////opss
//        MySql:=' Select first 1 m.codfilial'+
//               ' From movtos_empresas m'+
//               ' Where m.ind_tipo=''DM'''+
//               ' And m.CodFilial='+QuotedStr(sCodMatriz)+
//               ' And m.codproduto='+QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('COD_ITEM').AsString)+
//               ' and m.DTA_REF>'+QuotedStr(sgDtaLimTransf);
//        DMBelShop.SDS_BuscaRapida.Close;
//        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
//        DMBelShop.SDS_BuscaRapida.Open;
//
//        If Trim(DMBelShop.SDS_BuscaRapida.FieldByName('CodFilial').AsString)='' Then
//         ValuesCampos:=f_Troca(' IND_TRANSF ',' '+QuotedStr('S')+' ',ValuesCampos)
//        Else
//         ValuesCampos:=f_Troca(' IND_TRANSF ',' '+QuotedStr('N')+' ',ValuesCampos);
//
//        DMBelShop.SDS_BuscaRapida.Close;
//      End
//     Else // If sgDtaLimTransf<>'' Then
//      Begin
//        ValuesCampos:=f_Troca(' DTA_LIM_TRANSF ',' NULL ',ValuesCampos);
//        ValuesCampos:=f_Troca(' IND_TRANSF ',' '+QuotedStr('N')+' ',ValuesCampos);
//      End; // If sgDtaLimTransf<>'' Then
//   End
//  Else // If FrmBelShop.IBQ_Matriz.FieldByName('QTD_SALDO').AsCurrency>0 Then
//   Begin
//     If sgDtaLimTransf<>'' Then
//      ValuesCampos:=f_Troca(' DTA_LIM_TRANSF ',' '+QuotedStr(sgDtaLimTransf)+' ',ValuesCampos)
//     Else
//opss Transf FIM

      ValuesCampos:=f_Troca(' DTA_LIM_TRANSF ',' NULL ',ValuesCampos);

     ValuesCampos:=f_Troca(' IND_TRANSF ',' '+QuotedStr('N')+' ',ValuesCampos);
//opss Transf   End; // If FrmBelShop.IBQ_Matriz.FieldByName('QTD_SALDO').AsCurrency>0 Then

  If bUsarCurva Then
   ValuesCampos:=f_Troca(' IND_USAR ',' '+QuotedStr('SIM')+' ',ValuesCampos)
  Else
   ValuesCampos:=f_Troca(' IND_USAR ',' '+QuotedStr('NAO')+' ',ValuesCampos);

  ValuesCampos:=f_Troca(' IND_QTD_ACIMA ',' '+QuotedStr('0')+' ',ValuesCampos);

End; // Efetua o Calculo Para Analise >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Numero dos Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGeraPedidosComprasLojas.AtualizaNumeroDosMeses;
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

  If CB_Mes1.ItemIndex=0  Then sMes1:='01';
  If CB_Mes1.ItemIndex=1  Then sMes1:='02';
  If CB_Mes1.ItemIndex=2  Then sMes1:='03';
  If CB_Mes1.ItemIndex=3  Then sMes1:='04';
  If CB_Mes1.ItemIndex=4  Then sMes1:='05';
  If CB_Mes1.ItemIndex=5  Then sMes1:='06';
  If CB_Mes1.ItemIndex=6  Then sMes1:='07';
  If CB_Mes1.ItemIndex=7  Then sMes1:='08';
  If CB_Mes1.ItemIndex=8  Then sMes1:='09';
  If CB_Mes1.ItemIndex=9  Then sMes1:='10';
  If CB_Mes1.ItemIndex=10 Then sMes1:='11';
  If CB_Mes1.ItemIndex=11 Then sMes1:='12';
  sAno1:=Trim(ME_Ano1.Text);

  If CB_Mes2.ItemIndex=1  Then sMes2:='01';
  If CB_Mes2.ItemIndex=2  Then sMes2:='02';
  If CB_Mes2.ItemIndex=3  Then sMes2:='03';
  If CB_Mes2.ItemIndex=4  Then sMes2:='04';
  If CB_Mes2.ItemIndex=5  Then sMes2:='05';
  If CB_Mes2.ItemIndex=6  Then sMes2:='06';
  If CB_Mes2.ItemIndex=7  Then sMes2:='07';
  If CB_Mes2.ItemIndex=8  Then sMes2:='08';
  If CB_Mes2.ItemIndex=9  Then sMes2:='09';
  If CB_Mes2.ItemIndex=10 Then sMes2:='10';
  If CB_Mes2.ItemIndex=11 Then sMes2:='11';
  If CB_Mes2.ItemIndex=12 Then sMes2:='12';
  sAno2:=Trim(ME_Ano2.Text);

  If CB_Mes3.ItemIndex=1  Then sMes3:='01';
  If CB_Mes3.ItemIndex=2  Then sMes3:='02';
  If CB_Mes3.ItemIndex=3  Then sMes3:='03';
  If CB_Mes3.ItemIndex=4  Then sMes3:='04';
  If CB_Mes3.ItemIndex=5  Then sMes3:='05';
  If CB_Mes3.ItemIndex=6  Then sMes3:='06';
  If CB_Mes3.ItemIndex=7  Then sMes3:='07';
  If CB_Mes3.ItemIndex=8  Then sMes3:='08';
  If CB_Mes3.ItemIndex=9  Then sMes3:='09';
  If CB_Mes3.ItemIndex=10 Then sMes3:='10';
  If CB_Mes3.ItemIndex=11 Then sMes3:='11';
  If CB_Mes3.ItemIndex=12 Then sMes3:='12';
  sAno3:=Trim(ME_Ano3.Text);

  If CB_Mes4.ItemIndex=1  Then sMes4:='01';
  If CB_Mes4.ItemIndex=2  Then sMes4:='02';
  If CB_Mes4.ItemIndex=3  Then sMes4:='03';
  If CB_Mes4.ItemIndex=4  Then sMes4:='04';
  If CB_Mes4.ItemIndex=5  Then sMes4:='05';
  If CB_Mes4.ItemIndex=6  Then sMes4:='06';
  If CB_Mes4.ItemIndex=7  Then sMes4:='07';
  If CB_Mes4.ItemIndex=8  Then sMes4:='08';
  If CB_Mes4.ItemIndex=9  Then sMes4:='09';
  If CB_Mes4.ItemIndex=10 Then sMes4:='10';
  If CB_Mes4.ItemIndex=11 Then sMes4:='11';
  If CB_Mes4.ItemIndex=12 Then sMes4:='12';
  sAno4:=Trim(ME_Ano4.Text);

  If CB_Mes5.ItemIndex=1  Then sMes5:='01';
  If CB_Mes5.ItemIndex=2  Then sMes5:='02';
  If CB_Mes5.ItemIndex=3  Then sMes5:='03';
  If CB_Mes5.ItemIndex=4  Then sMes5:='04';
  If CB_Mes5.ItemIndex=5  Then sMes5:='05';
  If CB_Mes5.ItemIndex=6  Then sMes5:='06';
  If CB_Mes5.ItemIndex=7  Then sMes5:='07';
  If CB_Mes5.ItemIndex=8  Then sMes5:='08';
  If CB_Mes5.ItemIndex=9  Then sMes5:='09';
  If CB_Mes5.ItemIndex=10 Then sMes5:='10';
  If CB_Mes5.ItemIndex=11 Then sMes5:='11';
  If CB_Mes5.ItemIndex=12 Then sMes5:='12';
  sAno5:=Trim(ME_Ano5.Text);

  If CB_Mes6.ItemIndex=1  Then sMes6:='01';
  If CB_Mes6.ItemIndex=2  Then sMes6:='02';
  If CB_Mes6.ItemIndex=3  Then sMes6:='03';
  If CB_Mes6.ItemIndex=4  Then sMes6:='04';
  If CB_Mes6.ItemIndex=5  Then sMes6:='05';
  If CB_Mes6.ItemIndex=6  Then sMes6:='06';
  If CB_Mes6.ItemIndex=7  Then sMes6:='07';
  If CB_Mes6.ItemIndex=8  Then sMes6:='08';
  If CB_Mes6.ItemIndex=9  Then sMes6:='09';
  If CB_Mes6.ItemIndex=10 Then sMes6:='10';
  If CB_Mes6.ItemIndex=11 Then sMes6:='11';
  If CB_Mes6.ItemIndex=12 Then sMes6:='12';
  sAno6:=Trim(ME_Ano6.Text);

  If CB_Mes7.ItemIndex=1  Then sMes7:='01';
  If CB_Mes7.ItemIndex=2  Then sMes7:='02';
  If CB_Mes7.ItemIndex=3  Then sMes7:='03';
  If CB_Mes7.ItemIndex=4  Then sMes7:='04';
  If CB_Mes7.ItemIndex=5  Then sMes7:='05';
  If CB_Mes7.ItemIndex=6  Then sMes7:='06';
  If CB_Mes7.ItemIndex=7  Then sMes7:='07';
  If CB_Mes7.ItemIndex=8  Then sMes7:='08';
  If CB_Mes7.ItemIndex=9  Then sMes7:='09';
  If CB_Mes7.ItemIndex=10 Then sMes7:='10';
  If CB_Mes7.ItemIndex=11 Then sMes7:='11';
  If CB_Mes7.ItemIndex=12 Then sMes7:='12';
  sAno7:=Trim(ME_Ano7.Text);

  If CB_Mes8.ItemIndex=1  Then sMes8:='01';
  If CB_Mes8.ItemIndex=2  Then sMes8:='02';
  If CB_Mes8.ItemIndex=3  Then sMes8:='03';
  If CB_Mes8.ItemIndex=4  Then sMes8:='04';
  If CB_Mes8.ItemIndex=5  Then sMes8:='05';
  If CB_Mes8.ItemIndex=6  Then sMes8:='06';
  If CB_Mes8.ItemIndex=7  Then sMes8:='07';
  If CB_Mes8.ItemIndex=8  Then sMes8:='08';
  If CB_Mes8.ItemIndex=9  Then sMes8:='09';
  If CB_Mes8.ItemIndex=10 Then sMes8:='10';
  If CB_Mes8.ItemIndex=11 Then sMes8:='11';
  If CB_Mes8.ItemIndex=12 Then sMes8:='12';
  sAno8:=Trim(ME_Ano8.Text);

  // Guarde Mese para Demonstratrar no Grid ====================================
  MySql:='Insert Into OC_COMPRAR_MESES'+
         ' Values('+sNumDoc+', '+
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

End; // Atualiza Numero dos Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Totais das OCs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGeraPedidosComprasLojas.TotaisOC;
Var
  MySql, sForn: String;
  i: Integer;
Begin
  EdtGeraOCTotalItens.Value:=0;
  EdtGeraOCTotalGeral.Value:=0;

  // Guarda Fornecedores Selecionados ==========================================
  sForn:='';
  Try
    If Not DMLojaUnica.CDS_V_OCTotForn.IsEmpty Then
    Begin
      i:=DMLojaUnica.CDS_V_OCTotForn.RecNo;
      DMLojaUnica.CDS_V_OCTotForn.First;
      DMLojaUnica.CDS_V_OCTotForn.DisableControls;
      While Not DMLojaUnica.CDS_V_OCTotForn.Eof do
      Begin
        If DMLojaUnica.CDS_V_OCTotFornPROC.AsString='SIM' Then
         sForn:=sForn+'-'+DMLojaUnica.CDS_V_OCTotFornCOD_FORN.AsString+'-';

        DMLojaUnica.CDS_V_OCTotForn.Next;
      End; // While Not DMLojaUnica.CDS_V_OCTotForn.Eof do
      DMLojaUnica.CDS_V_OCTotForn.EnableControls;
    End; // If Not DMLojaUnica.CDS_V_OCTotForn.IsEmpty Then
  Except
  End;

  // Busca Totais ==============================================================
  If EdtGeraOCBuscaDocto.Value<>0 Then
  Begin
    MySql:=' SELECT ''N'' Gerar,'+
           ' CASE WHEN oc.qtd_transf>0 Then ''TR'' ELSE ''OC'' END Tipo,'+
           ' oc.cod_empresa Cod_Emp_Fil, oc.des_empresa des_emp_fil,'+
           ' oc.ind_oc_gerada, oc.cod_fornecedor,  oc.des_fornecedor Fornecedor,'+
           ' sum(oc.vlr_bruto) Total_Bruto,'+
           ' sum(oc.vlr_descontos) Total_Descontos,'+
           ' sum(oc.vlr_ipi) Total_IPI,'+
           ' sum(oc.vlr_despesas) Total_Despesas,'+
           ' sum(oc.vlr_st) Total_ST,'+
           ' sum(oc.vlr_frete) Total_Frete,'+
           ' sum(oc.vlr_icms) Total_ICMS,'+
           ' sum(oc.vlr_repasse) Total_Repasse,'+
           ' sum(oc.vlr_tot_compra) Total_OC,'+
           ' sum(oc.vlr_tot_venda) Total_Venda,'+
           ' oc.num_documento, oc.num_oc_gerada,'+
           ' cast(oc.dta_oc_gerada as Date) dta_oc_gerada,'+
           ' oc.cod_comprovante_icms,'+
           ' Count(oc.cod_item) Total_Itens,'+
           ' SUM(oc.qtd_acomprar) Total_Qtd,'+
           ' SUM('+
           '     Case'+
           '       When oc.QTD_ACOMPRAR>0 Then'+
           '        1'+
           '       Else'+
           '        0'+
           '    End'+
           ' ) Total_Itens_Acomprar'+
           ' FROM oc_comprar oc'+
           ' WHERE oc.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value)+
           ' GROUP BY Tipo, cod_emp_fil, oc.des_empresa, oc.ind_oc_gerada,'+
           '          oc.cod_fornecedor, Fornecedor, oc.num_documento,'+
           '          oc.num_oc_gerada, cast(oc.dta_oc_gerada as Date),'+
           '          oc.cod_comprovante_icms'+
           ' ORDER BY Cod_Emp_Fil, Fornecedor, oc.num_oc_gerada';
    DMLojaUnica.CDS_AComprarOCs.Close;
    DMLojaUnica.SDS_AComprarOCs.CommandText:=MySql;
    DMLojaUnica.CDS_AComprarOCs.Open;

    // Totais por Fornecedores =================================================
    try
      DMLojaUnica.CDS_V_OCTotForn.CreateDataSet;
      DMLojaUnica.CDS_V_OCTotForn.Open;
    Except
      DMLojaUnica.CDS_V_OCTotForn.EmptyDataSet;
      DMLojaUnica.CDS_V_OCTotForn.Open;
    End;

    Bt_GeraOCCalcular.Enabled:=False;
    While Not DMLojaUnica.CDS_AComprarOCs.Eof do
    Begin
      If DMLojaUnica.CDS_AComprarOCsIND_OC_GERADA.AsString='N' Then
       Bt_GeraOCCalcular.Enabled:=True;

      If Not DMLojaUnica.CDS_V_OCTotForn.Locate('COD_FORN',DMLojaUnica.CDS_AComprarOCsCOD_FORNECEDOR.AsString,[]) Then
       Begin
         DMLojaUnica.CDS_V_OCTotForn.Insert;
         DMLojaUnica.CDS_V_OCTotFornCOD_FORN.AsString:=
                               DMLojaUnica.CDS_AComprarOCsCOD_FORNECEDOR.AsString;
         DMLojaUnica.CDS_V_OCTotFornDES_FORNECEDOR.AsString:=
                                   DMLojaUnica.CDS_AComprarOCsFORNECEDOR.AsString;

         if AnsiContainsStr(sForn, '-'+DMLojaUnica.CDS_AComprarOCsCOD_FORNECEDOR.AsString+'-') then
          Begin
            DMLojaUnica.CDS_V_OCTotFornPROC.AsString:='SIM';
            EdtGeraOCTotalItens.Value:=EdtGeraOCTotalItens.Value+
                                 DMLojaUnica.CDS_AComprarOCsTOTAL_ITENS.AsVariant;
            EdtGeraOCTotalGeral.Value:=EdtGeraOCTotalGeral.Value+
                                    DMLojaUnica.CDS_AComprarOCsTOTAL_OC.AsVariant;
          End
         Else
          Begin
            DMLojaUnica.CDS_V_OCTotFornPROC.AsString:='NAO';
          End; // if AnsiContainsStr(sForn, '-'+DMLojaUnica.CDS_AComprarOCsCOD_FORNECEDOR.AsString+'-') then

         DMLojaUnica.CDS_V_OCTotFornQTD_TOTAL.AsString:=
                                    DMLojaUnica.CDS_AComprarOCsTOTAL_QTD.AsString;
         DMLojaUnica.CDS_V_OCTotFornTOT_ITENS.AsString:=
                                  DMLojaUnica.CDS_AComprarOCsTOTAL_ITENS.AsString;
         DMLojaUnica.CDS_V_OCTotFornTOT_ITENS_ACOMPRAR.AsString:=
                         DMLojaUnica.CDS_AComprarOCsTOTAL_ITENS_ACOMPRAR.AsString;
         DMLojaUnica.CDS_V_OCTotFornVLR_COMPRAS.AsString:=
                                     DMLojaUnica.CDS_AComprarOCsTOTAL_OC.AsString;
         DMLojaUnica.CDS_V_OCTotFornVLR_VENDAS.AsString:=
                                  DMLojaUnica.CDS_AComprarOCsTOTAL_VENDA.AsString;

         If DMLojaUnica.CDS_AComprarOCsIND_OC_GERADA.AsString='N' Then
          DMLojaUnica.CDS_V_OCTotFornIND_TRANSF.AsString:='NAO'
         Else
          DMLojaUnica.CDS_V_OCTotFornIND_TRANSF.AsString:='SIM';

       End
      Else // If Not DMLojaUnica.CDS_V_OCTotForn.Locate('COD_FORN',DMLojaUnica.CDS_AComprarOCsCOD_FORNECEDOR.AsString,[]) Then
       Begin
         DMLojaUnica.CDS_V_OCTotForn.Edit;

         if AnsiContainsStr(sForn, '-'+DMLojaUnica.CDS_AComprarOCsCOD_FORNECEDOR.AsString+'-') then
          Begin
            DMLojaUnica.CDS_V_OCTotFornPROC.AsString:='SIM';
            EdtGeraOCTotalItens.Value:=EdtGeraOCTotalItens.Value+
                                 DMLojaUnica.CDS_AComprarOCsTOTAL_ITENS.AsVariant;
            EdtGeraOCTotalGeral.Value:=EdtGeraOCTotalGeral.Value+
                                    DMLojaUnica.CDS_AComprarOCsTOTAL_OC.AsVariant;
          End
         Else
          Begin
            DMLojaUnica.CDS_V_OCTotFornPROC.AsString:='NAO';
          End; // if AnsiContainsStr(sForn, '-'+DMLojaUnica.CDS_AComprarOCsCOD_FORNECEDOR.AsString+'-') then

         DMLojaUnica.CDS_V_OCTotFornQTD_TOTAL.AsCurrency:=
                                DMLojaUnica.CDS_V_OCTotFornQTD_TOTAL.AsCurrency+
                                  DMLojaUnica.CDS_AComprarOCsTOTAL_QTD.AsCurrency;
         DMLojaUnica.CDS_V_OCTotFornTOT_ITENS.AsCurrency:=
                                DMLojaUnica.CDS_V_OCTotFornTOT_ITENS.AsCurrency+
                                DMLojaUnica.CDS_AComprarOCsTOTAL_ITENS.AsCurrency;
         DMLojaUnica.CDS_V_OCTotFornTOT_ITENS_ACOMPRAR.AsCurrency:=
                       DMLojaUnica.CDS_V_OCTotFornTOT_ITENS_ACOMPRAR.AsCurrency+
                       DMLojaUnica.CDS_AComprarOCsTOTAL_ITENS_ACOMPRAR.AsCurrency;
         DMLojaUnica.CDS_V_OCTotFornVLR_COMPRAS.AsCurrency:=
                              DMLojaUnica.CDS_V_OCTotFornVLR_COMPRAS.AsCurrency+
                                   DMLojaUnica.CDS_AComprarOCsTOTAL_OC.AsCurrency;
         DMLojaUnica.CDS_V_OCTotFornVLR_VENDAS.AsCurrency:=
                               DMLojaUnica.CDS_V_OCTotFornVLR_VENDAS.AsCurrency+
                                DMLojaUnica.CDS_AComprarOCsTOTAL_VENDA.AsCurrency;
       End; // If Not DMLojaUnica.CDS_V_OCTotForn.Locate('COD_FORN',DMLojaUnica.CDS_AComprarOCsCOD_FORNECEDOR.AsString,[]) Then

      DMLojaUnica.CDS_V_OCTotForn.Post;

      DMLojaUnica.CDS_AComprarOCs.Next;
    End; // While Not DMLojaUnica.CDS_AComprarOCs.Eof do

    If i>0 Then
     DMLojaUnica.CDS_V_OCTotForn.RecNo:=i
    Else
     DMLojaUnica.CDS_V_OCTotForn.First;

    // Rebre Totais de Fornecedores Selecionados ===============================
    If Trim(sgFornLojas)<>'' Then
    Begin
      MySql:=' SELECT ''N'' Gerar,'+
             ' CASE WHEN oc.qtd_transf>0 Then ''TR'' ELSE ''OC'' END Tipo,'+
             ' oc.cod_empresa Cod_Emp_Fil, oc.des_empresa des_emp_fil,'+
             ' oc.ind_oc_gerada, oc.cod_fornecedor,  oc.des_fornecedor Fornecedor,'+
             ' sum(oc.vlr_bruto) Total_Bruto,'+
             ' sum(oc.vlr_descontos) Total_Descontos,'+
             ' sum(oc.vlr_ipi) Total_IPI,'+
             ' sum(oc.vlr_despesas) Total_Despesas,'+
             ' sum(oc.vlr_st) Total_ST,'+
             ' sum(oc.vlr_frete) Total_Frete,'+
             ' sum(oc.vlr_icms) Total_ICMS,'+
             ' sum(oc.vlr_repasse) Total_Repasse,'+
             ' sum(oc.vlr_tot_compra) Total_OC,'+
             ' sum(oc.vlr_tot_venda) Total_Venda,'+
             ' oc.num_documento, oc.num_oc_gerada,'+
             ' cast(oc.dta_oc_gerada as Date) dta_oc_gerada,'+
             ' oc.cod_comprovante_icms,'+
             ' Count(oc.cod_item) Total_Itens,'+
             ' SUM(oc.qtd_acomprar) Total_Qtd,'+
             ' SUM('+
             '     Case'+
             '       When oc.QTD_ACOMPRAR>0 Then'+
             '        1'+
             '       Else'+
             '        0'+
             '    End'+
             ' ) Total_Itens_Acomprar'+
             ' FROM oc_comprar oc'+
             ' WHERE oc.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value);

             If Trim(sgFornLojas)<>'' Then
              MySql:=MySql+' AND oc.Cod_Fornecedor in ('+sgFornLojas+')';

             MySql:=MySql+' GROUP BY Tipo, cod_emp_fil, oc.des_empresa, oc.ind_oc_gerada,'+
                          '          oc.cod_fornecedor, Fornecedor, oc.num_documento,'+
                          '          oc.num_oc_gerada, cast(oc.dta_oc_gerada as Date),'+
                          '          oc.cod_comprovante_icms'+
                          ' ORDER BY Cod_Emp_Fil, Fornecedor, oc.num_oc_gerada';
      DMLojaUnica.CDS_AComprarOCs.Close;
      DMLojaUnica.SDS_AComprarOCs.CommandText:=MySql;
      DMLojaUnica.CDS_AComprarOCs.Open;
      sgFornLojas:='';
    End; // If Trim(sgFornLojas)<>'' Then

    // Totais Geral ============================================================
    EdtGeraOCTotalItens.Value:=DMLojaUnica.CDS_AComprarOCsTOTALITENS.AsVariant;
    EdtGeraOCTotalGeral.Value:=DMLojaUnica.CDS_AComprarOCsTOTALGERAL.AsVariant;
  End; // If EdtGeraOCBuscaDocto.Value<>0 Then

End; // Busca Totais das OCs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Acerta Nome dos Meses de Demandas no Grid >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGeraPedidosComprasLojas.NomeMesesGrid;
Var
  i: Integer;
  MySql: String;
Begin
  MySql:=' Select *'+
         ' From OC_COMPRAR_MESES'+
         ' Where Num_Documento='+VarToStr(EdtGeraOCBuscaDocto.Value);
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
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=
                               DMBelShop.CDS_Busca.FieldByName('Mes3').AsString;
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
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=
                               DMBelShop.CDS_Busca.FieldByName('Mes5').AsString;
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
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=
                               DMBelShop.CDS_Busca.FieldByName('Mes6').AsString;
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
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=
                               DMBelShop.CDS_Busca.FieldByName('Mes7').AsString;
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
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=
                             DMBelShop.CDS_Busca.FieldByName('Mes8').AsString;
       End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Mes8').AsString)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES8' Then

  End; // For i:=0 to Dbg_GeraOCGrid.Columns.Count-1 do
  DMBelShop.CDS_Busca.Close;

End; // Acerta Nome dos Meses de Demandas no Grid >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Verifica se Existe Meses Iguais >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmGeraPedidosComprasLojas.ConsisteBuscaProdutos: Boolean;
Begin
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

  // Lista de Preços ===========================================================
  If EdtOCCodListaPreco.Value=0 Then
  Begin
    EdtOCCodListaPreco.SetFocus;
    msg('Favor Informar a Lista de Preços'+cr+cr+'a ser Utilizada !!','A');
    Exit;
  End;

  Result:=True;

End; // Verifica se Existe Meses Iguais >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmGeraPedidosComprasLojas.Bt_OCFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmGeraPedidosComprasLojas.FormShow(Sender: TObject);
Var
  MySql: String;
begin

  // Alinha mento do Form ======================================================
  Align:=alClient;
  WindowState:=wsMaximized;
  AutoSize:=True;
  FrmBelShop.PC_FiltrosChange(Self);
  Refresh;

//opssaqui - ver isto ???? - Inicio
//  // Busca Parametros de Lojas =================================================
//  OdirPanApres.Caption:='AGUARDE !! Verificando Parâmetros Enviados Pela MATRIZ ...';
//  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
//  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmBelShop.Width-OdirPanApres.Width)/2));
//  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmBelShop.Height-OdirPanApres.Height)/2))-20;
//  OdirPanApres.Visible:=True;
//  Refresh;
//
//  // Busca Parametros de Lojas =================================================
//  If Des_Usuario='ODIR' Then
//   Begin
//     If msg('Buscar Paramentros Lojá Única ??','C')=1 Then
//     Begin
//       If Not LojaBuscaParametros Then
//       Begin
//         OdirPanApres.Visible:=False;
//         msg(sgMensagem,'A');
//       End;
//     End;
//   End
//  Else
//   Begin
//     If Not LojaBuscaParametros Then
//     Begin
//       OdirPanApres.Visible:=False;
//       msg(sgMensagem,'A');
//     End;
//   End;
//  OdirPanApres.Visible:=False;
//opssaqui - ver isto ???? - Fim

  // Posiciona TabSheet ========================================================
  PC_GeraOCApresentacao.TabIndex:=0;
  PC_GeraOCApresentacaoChange(Self);

  PC_OrdemCompra.TabIndex:=0;
  PC_OrdemCompraChange(Self);

  // Verifica Pastas da Area de FTP ============================================
  if not DirectoryExists(sgPastaAreaFTP) then
   ForceDirectories(sgPastaAreaFTP);

  if not DirectoryExists(sgPastaAreaFTP+'ArquivosProcessados\') then
   ForceDirectories(sgPastaAreaFTP+'ArquivosProcessados\');

  // Parametros Loja para Calculo ==============================================
  If sgCodLojaUnica<>'' Then
  Begin
    MySql:=' SELECT p.num_seq, p.ind_tipo, p.ind_sim_nao, p.num_dia_calculo, p.per_aceito'+
           ' FROM parametros_lojas p'+
           ' WHERE p.ind_tipo IN (0, 1, 2, 3, 5, 6)'+
           ' AND ((p.cod_loja='+QuotedStr(sgCodLojaUnica)+') OR (p.cod_loja IS NULL))'+
           ' ORDER BY p.ind_tipo';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    FrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoEstoque.Checked:=False;
    FrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoTransito.Checked:=False;
    FrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoEstMinino.Checked:=False;
    FrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoCxEmbarque.Checked:=False;
    While Not DMBelShop.CDS_BuscaRapida.Eof do
    Begin
      // 0 - Percentual PADRÃO do Limite para Faturamento de Fornecedor - POR LOJA
      If DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Tipo').AsInteger=0 Then
      Begin
       cgLojaPerLimFornPadrao:=DMBelShop.CDS_BuscaRapida.FieldByName('Per_Aceito').AsCurrency;
      End;

      // 1 - Considerar SALDO ATUAL no Calculo de Necessidade de Compra ?
      If DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Tipo').AsInteger=1 Then
      Begin
        bgLojaEstoque:=(DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Sim_Nao').AsString='SIM');
        FrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoEstoque.Checked:=bgLojaEstoque;
      End;

      // 2 - Considerar Produto em Transito, se Houver, no Calculo de Necessidade de Compra ?
      If DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Tipo').AsInteger=2 Then
      Begin
        bgLojaTransito:=(DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Sim_Nao').AsString='SIM');
        FrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoTransito.Checked:=bgLojaTransito;
      End;

      // 3 - Numero de Dias para Calculo de Necessidade de Compra - POR LOJA
      If DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Tipo').AsInteger=3 Then
      Begin
        sgLojaNrDias:=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Dia_Calculo').AsString;
        FrmGeraPedidosComprasLojas.EdtGeraOCDias.Value:=sgLojaNrDias;
      End;

      // 5 - Utilizar Estoque Ideal (Estoque mínimo) ?  - POR PRODUTO - SIDICOM: ESTOQUE.EstoqueIdeal
      If DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Tipo').AsInteger=5 Then
      Begin
        bgLojaEstMinino:=(DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Sim_Nao').AsString='SIM');
        FrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoEstMinino.Checked:=bgLojaEstMinino;
      End;

      // 6 - Utilizar Percentual Limite de Caixa de Embarque para Compra - POR PRODUTO - SIDICOM: PRODUFOR.UnidadeCaixa
      If DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Tipo').AsInteger=6 Then
      Begin
        bgLojaCXEmbarque:=(DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Sim_Nao').AsString='SIM');
        FrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoCxEmbarque.Checked:=bgLojaCXEmbarque;
        cgPerCxEmpbarque:=DMBelShop.CDS_BuscaRapida.FieldByName('Per_Aceito').AsCurrency;
      End;

      DMBelShop.CDS_BuscaRapida.Next;
    End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
    DMBelShop.CDS_BuscaRapida.Close;

    FrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoEstoqueClick(Self);
    FrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoTransitoClick(Self);
    FrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoEstMininoClick(Self);
    FrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoCxEmbarqueClick(Self);

    // 7 - Fornecedores a Comprar por Dia
    OdirPanApres.Caption:='AGUARDE !! Localizando Fornecedores a Comprar no Dia...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Height-OdirPanApres.Height)/2));
    OdirPanApres.Visible:=True;
    Refresh;

    Bt_OCBuscaProdutos.Visible:=True;
    If Not LojaFornecedoresComprarDia Then
    Begin
      OdirPanApres.Visible:=False;
      msg('Erro ao Atualizar Fornecedor do Dia!!'+cr+sgMensagem,'A');
      Bt_OCBuscaProdutos.Visible:=False;
    End;
    OdirPanApres.Visible:=False;

  End; // If PC_OrdemCompra.ActivePage=Ts_ParametrosLojas Then

end;

procedure TFrmGeraPedidosComprasLojas.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmGeraPedidosComprasLojas.PC_OrdemCompraChange(Sender: TObject);
begin
  Try
    CorSelecaoTabSheet(PC_OrdemCompra);

    If (PC_OrdemCompra.ActivePage=Ts_OCBuscaProdutos) And (Ts_OCBuscaProdutos.CanFocus) Then
    Begin
      Bt_OCBuscaFornecDia.SetFocus;
    End;

    If (PC_OrdemCompra.ActivePage=Ts_OCGeraOrdemCompra) And (Ts_OCGeraOrdemCompra.CanFocus) Then
    Begin
      EdtGeraOCBuscaDocto.SetFocus;
    End;

    If (PC_OrdemCompra.ActivePage=Ts_ParametrosLojas) And (Ts_ParametrosLojas.CanFocus) Then
    Begin
      PC_ParametroLojasChange(Self);
    End;
  Except
  End;
end;

procedure TFrmGeraPedidosComprasLojas.PC_GeraOCApresentacaoChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_GeraOCApresentacao);

  Try
    If (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCGrid) And (Ts_GeraOCGrid.CanFocus) Then
    Begin
      Pan_GeraOC.Visible:=True;
      Dbg_GeraOCGrid.SelectedIndex:=4;
      Dbg_GeraOCGrid.SetFocus;
    End;

    If (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCTotFornec) And (Ts_GeraOCTotFornec.CanFocus) Then
    Begin
      Pan_GeraOC.Visible:=False;
      Dbg_GeraOCTotFornc.SetFocus;
    End;

  Except
  End;
end;

procedure TFrmGeraPedidosComprasLojas.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  UsuarioComputadorWindows(sgNomeUsuario, sgNomeComputador);

  // NÃO PERMITIR MOVIMENTAR O FORM
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

end;

procedure TFrmGeraPedidosComprasLojas.Bt_GeraOCBuscaDoctoClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtGeraOCBuscaDocto.Clear;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  OdirPanApres.Caption:='AGUARDE !! Localizando Solicitação de Compras...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Height-OdirPanApres.Height)/2));
  OdirPanApres.Visible:=True;
  Refresh;

  MySql:=' SELECT CAST(d.num_docto AS VARCHAR(15)) Num_Documento,'+
         '        d.des_comprador, d.origem, d.dta_docto Dta_Documento, d.cod_comprador'+
         ' FROM oc_comprar_docs d'+
         ' WHERE d.dta_docto='+QuotedStr(f_Troca('/','.',(f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date)))))+
         ' AND   d.Origem<>'+QuotedStr('Linx')+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Num_Documento').AsString)='' Then
  Begin
    msg('Sem Solicitação a Listar !!','A');
    DMBelShop.CDS_Pesquisa.Close;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
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
     FrmPesquisa.Free;
     FrmPesquisa:=nil;
     EdtGeraOCBuscaDocto.Clear;
     EdtGeraOCBuscaDocto.SetFocus;
     Exit;
   End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

  EdtGeraOCBuscaDoctoExit(self);
end;

procedure TFrmGeraPedidosComprasLojas.EdtGeraOCBuscaDoctoChange(Sender: TObject);
begin
  Bt_GeraOCCalcular.Visible:=False;

  DMBelShop.IBQ_AComprar.Close;
  DMBelShop.CDS_AComprarItens.Close;
  DMLojaUnica.CDS_AComprarOCs.Close;

  Sb_SelectEmpProc2.Panels[0].Text:='';

end;

procedure TFrmGeraPedidosComprasLojas.EdtGeraOCBuscaDoctoEnter(Sender: TObject);
begin
  bEnterTab:=True;

end;

procedure TFrmGeraPedidosComprasLojas.EdtGeraOCBuscaDoctoExit(Sender: TObject);
Var
  b: Boolean;
  MySql: String;
begin
  LojaApresSolicitacoesAbertas;

  If EdtGeraOCBuscaDocto.Value=0 Then
   Exit;

  PC_GeraOCApresentacao.ActivePage:=Ts_GeraOCGrid;
  PC_GeraOCApresentacaoChange(Self);

  DecimalSeparator:=',';

  Dbg_GeraOCGrid.SetFocus;

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
  DMLojaUnica.CDS_AComprarOCs.Close;

  OdirPanApres.Caption:='AGUARDE !! Localizando Solicitação...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Height-OdirPanApres.Height)/2));
  OdirPanApres.Visible:=True;
  Refresh;

  // Busca Itens do Documento ------------------------------------------------
  MySql:=' SELECT DISTINCT oc.cod_item, oc.des_item, oc.num_documento,'+
         '                 oc.dta_documento, oc.cod_comprador, us.des_usuario'+
         ' FROM OC_COMPRAR oc'+
         '       LEFT JOIN PS_USUARIOS us     ON us.cod_usuario = oc.cod_comprador'+
         '       LEFT JOIN OC_COMPRAR_DOCS od ON od.num_docto = oc.num_documento'+
         ' WHERE od.origem<>'+QuotedStr('Linx')+
         ' AND   oc.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value)+
         ' ORDER BY oc.des_item';
  DMBelShop.CDS_AComprarItens.Close;
  DMBelShop.SDS_AComprarItens.CommandText:=MySql;
  DMBelShop.CDS_AComprarItens.Open;

  OdirPanApres.Visible:=False;

  If DMBelShop.CDS_AComprarItens.IsEmpty Then
  Begin
    msg('Solicitação Número: '+VarToStr(EdtGeraOCBuscaDocto.Value)+cr+cr+' Não Encontrada !!','A');

    EdtGeraOCBuscaDocto.Clear;
    EdtGeraOCBuscaDocto.SetFocus;
    Screen.Cursor:=crDefault;
    Exit;
  End; // If DMBelShop.CDS_AComprarItens.IsEmpty Then

  If (DMBelShop.CDS_AComprarItensCOD_COMPRADOR.AsString<>Cod_Usuario) And (Not bgSiga) Then
  Begin
    If msg('Solicitação Número: '+VarToStr(EdtGeraOCBuscaDocto.Value)+cr+
           'Pertence ao Comprador: '+
           DMBelShop.CDS_AComprarItensDES_USUARIO.AsString+cr+cr+
           'Deseja Continuar Assim MESMO ??','C')=2 Then
    Begin
      DMBelShop.CDS_AComprarItens.Close;
      EdtGeraOCBuscaDocto.Value:=0;
      EdtGeraOCBuscaDocto.SetFocus;
      Screen.Cursor:=crDefault;
      Exit;
    End;
  End; // If DMBelShop.CDS_AComprarItens.IsEmpty Then

  // Inicailiza Data ===========================================================
  DtEdt_GeraOCDataDocto.Date:=DMBelShop.CDS_AComprarItensDTA_DOCUMENTO.AsDateTime;

  // Botao de Calculo ==========================================================
  Bt_GeraOCCalcular.Visible:=True;

  // Busca Dados dos Itens do Documento ========================================
  MySqlSelect:=' Select *'+
               ' From oc_comprar oc'+
               ' Where oc.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value)+
               ' Order By (oc.qtd_dem_mes1+oc.qtd_dem_mes2+oc.qtd_dem_mes3+oc.qtd_dem_mes4+oc.qtd_dem_mes5+oc.qtd_dem_mes6+oc.qtd_dem_mes7+oc.qtd_dem_mes8) desc, oc.des_item';
  DMBelShop.IBQ_AComprar.Close;
  DMBelShop.IBQ_AComprar.SQL.Clear;
  DMBelShop.IBQ_AComprar.SQL.Add(MySqlSelect);
  DMBelShop.IBQ_AComprar.Open;

  // Acerta Nome dos Meses de Demandas no Grid =================================
  NomeMesesGrid;

  // Busca Totais das OCs ======================================================
  TotaisOC;

  // Posiciona na Empresa ======================================================
  If Trim(sgCodEmp)<>'' Then
  Begin
    DMBelShop.IBQ_AComprar.Locate('Cod_Empresa',sgCodEmp,[]);
  End;

  If PC_GeraOCApresentacao.ActivePage=Ts_GeraOCGrid Then
   Dbg_GeraOCGrid.SetFocus;

  Screen.Cursor:=crDefault;

  // Libera para Digitação de Nao Transferido para o CD ========================
  bgSolicFechadaParcial:=False;
  bgSolicFechada:=False;
  If DMBelShop.IBQ_AComprar.Locate('IND_OC_GERADA','S',[]) Then
   bgSolicFechada:=True;

  If (bgSolicFechada) and (DMBelShop.IBQ_AComprar.Locate('IND_OC_GERADA','N',[])) Then
   Begin
     msg('Existe(m) Fornecedore(s) em Aberto !!'+cr+'Nesta Solicitação !!','A');
     bgSolicFechada:=False;
     bgSolicFechadaParcial:=True;
   End
  Else If bgSolicFechada Then
   Begin
     msg('Impossível Alterar !!'+cr+cr+'Solicitação Já Fechada e Transferida'+cr+cr+'para a Matriz !!','A')
   End;

  PC_GeraOCApresentacaoChange(Self);
end;

procedure TFrmGeraPedidosComprasLojas.Bt_OCBuscaProdutosClick(Sender: TObject);
Var
  MySql: String;
  hHrInicio, hHrFim: String;
  b: Boolean;
begin
  PAN_OC.SetFocus;
  Lb_EmpAprocessar.Caption:='0';

  If DMVirtual.CDS_V_Fornecedores.IsEmpty Then
  Begin
    msg('Sem Fornecedor a Calcular...','A');
    Exit;
  End;
  sgOutrasEmpresa:='';
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=True;

  FrmSelectEmpProcessamento.ShowModal;
  Lb_EmpAprocessar.Caption:=IntToStr(FrmSelectEmpProcessamento.iNrEmpProc);
  FrmSelectEmpProcessamento.Free;
  FrmSelectEmpProcessamento:=nil;

  // Verifica se Existe Empresa a Processar ====================================
  If DMBelShop.CDS_EmpProcessa.Eof Then
  Begin
    PAN_OC.SetFocus;
    Exit;
  End;

  If msg('Deseja Realmente Iniciar a'+cr+cr+'Busca de Produtos ??','C')=2 Then
  Begin
    Lb_EmpAprocessar.Caption:='0';
    PAN_OC.SetFocus;
    Exit;
  End;

  // Inicia o Processameto =====================================================
  hHrInicio:='';
  hHrFim:='';

  PAN_OC.SetFocus;
  Lb_EmpProcessadas.Caption:='0';

  If Not ConsisteBuscaProdutos Then
   Exit;

  hHrInicio:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

  OdirPanApres.Caption:='AGUARDE !! Localizando os Produtos...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Height-OdirPanApres.Height)/2));
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Inicializa Data Limite de Transferencia ===================================
  MySql:=' Select e.dta_lim_transf'+
         ' From emp_conexoes e'+
         ' Where e.cod_filial='+QuotedStr(sgCodLojaUnica);
  DMBelShop.SDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.SDS_BuscaRapida.Open;

  sgDtaLimTransf:='';
  If Trim(DMBelShop.SDS_BuscaRapida.FieldByName('dta_lim_transf').AsString)<>'' Then
  Begin
    sgDtaLimTransf:=DMBelShop.SDS_BuscaRapida.FieldByName('dta_lim_transf').AsString;
    sgDtaLimTransf:=f_Troca('/','.',sgDtaLimTransf);
    sgDtaLimTransf:=f_Troca('-','.',sgDtaLimTransf);
  End;
  DMBelShop.SDS_BuscaRapida.Close;

  // Busca os Produtos =========================================================
  If Not BuscaProdutosAnalise Then
  Begin
    FrmBelShop.IBQ_Matriz.Close;

    OdirPanApres.Visible:=False;
    msg('SEM Produto para Analisar !!','A');

    hHrInicio:='';
    hHrFim:='';
    PAN_OC.SetFocus;
    Exit;
  End;

  Screen.Cursor:=crAppStart;

  // Busca Numero de Documento =================================================
  MySql:=' SELECT GEN_ID(GEN_NUM_DOC_CALCULO,1) Codigo'+
         ' FROM RDB$DATABASE';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  sNumDoc:=DMBelShop.CDS_Busca.FieldByName('Codigo').AsString;
  DMBelShop.SDS_Busca.Close;

  // Atualiza Numero dos Meses =================================================
  AtualizaNumeroDosMeses;

  // Efetua o Calculo Para Analise Matriz ======================================
  Try
    // Monta Transacao ---------------------------------------------------------
    TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);

    // Busca de Estrutura de Tabela --------------------------------------------
    CamposTableInterFire(DMBelShop.SQLQuery1,'OC_COMPRAR',Campos);

    // Apresentacao do Processamento -------------------------------------------
    DMVirtual.CDS_V_EmpConexoes.Locate('COD_FILIAL',sgCodLojaUnica,[]);

    OdirPanApres.Caption:='AGUARDE !! Processando Empresa Matriz: '+
                           DMVirtual.CDS_V_EmpConexoesCOD_FILIAL.AsString+' - '+
                           DMVirtual.CDS_V_EmpConexoesRAZAO_SOCIAL.AsString;
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Height-OdirPanApres.Height)/2));
    OdirPanApres.Visible:=True;
    Refresh;

    // Calcula Matriz ==========================================================
    FrmBelShop.MontaProgressBar(True, FrmGeraPedidosComprasLojas);

    iNrRegistros:=FrmBelShop.TotalRegistros(FrmBelShop.IBQ_Matriz, MySqlClausula1);
    pgProgBar.Properties.Max:=iNrRegistros;
    pgProgBar.Position:=0;
    Edt_OCTotProdutos.Value:=iNrRegistros;

    DecimalSeparator:='.';
    DateSeparator:='.';

    // Busca Produtos da Empresa MPMS (MATRIZ) =================================
    iNumSeqDoc:=0;
    FrmBelShop.IBQ_Matriz.First;
    While Not FrmBelShop.IBQ_Matriz.Eof do
    Begin
      Application.ProcessMessages;
      num.AsInteger:=FrmBelShop.IBQ_Matriz.RecNo;
      pgProgBar.Position:=FrmBelShop.IBQ_Matriz.RecNo;
      Refresh;

      bgProcCurva:=True;
      b:=False;
      While Not b do // Verifica se Existe na Tabela ES_FINAN_CURVA_ABC
      Begin
        If DMBelShop.CDS_Join.Locate('COD_PRODUTO',FrmBelShop.IBQ_Matriz.FieldByName('COD_ITEM').AsString,[]) Then
         Begin
           b:=True;

           // Curvas Por Loja ou Por MPMS
           If ((FrmBelShop.Gb_CalculoTpCurvaABC.Visible) Or (FrmBelShop.Gb_CalculoApresCurva.Visible)) and (FrmBelShop.Gb_CalculoApresCurva.Visible) Then
           Begin
             If (DMBelShop.CDS_Join.FieldByName('Usar_Curva').AsString='NAO') and (Not FrmBelShop.Ckb_CalculoApresCurvaFora.Checked) Then
              Begin
                bgProcCurva:=False;
              End
             Else If (DMBelShop.CDS_Join.FieldByName('Usar_Curva').AsString='NAO') and (FrmBelShop.Ckb_CalculoApresCurvaFora.Checked) Then
              Begin
                If (FrmBelShop.Rb_CalculoApresCurvaEstCom.Checked) and (FrmBelShop.IBQ_Matriz.FieldByName('QTD_SALDO').AsInteger=0) Then
                  bgProcCurva:=False
                Else If (FrmBelShop.Rb_CalculoApresCurvaEstSem.Checked) and (FrmBelShop.IBQ_Matriz.FieldByName('QTD_SALDO').AsInteger<>0) Then
                  bgProcCurva:=False
              End;
           End; // If Gb_CalculoTpCurvaABC.Visible Then

         End // If DMBelShop.CDS_Join.Locate('COD_PRODUTO',FrmBelShop.IBQ_Matriz.FieldByName('COD_ITEM').AsString,[]) Then
        Else
         Begin
           b:=True;
         End;

// OdirApagar - 16/12/2016
//         Begin
//           If StrToDate(FrmBelShop.IBQ_Matriz.FieldByName('datainclusao').AsString)>=StrToDate(sgDtaInicio) Then
//            Begin
//              DMBelShop.CDS_Join.Close;
//              MySql:=' Insert into ES_CURVA_ABC'+
//                      ' (COD_LOJA, COD_PRODUTO, IND_CURVA, DTA_INCLUSAO)'+
//                      ' Values ('+
//                      QuotedStr(sCodMatriz)+', '+
//                      QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('COD_ITEM').AsString)+', '+
//                      QuotedStr('E')+', '+
//                      QuotedStr(FrmBelShop.IBQ_Matriz.FieldByName('datainclusao').AsString)+')';
//              DMBelShop.SQLC.Execute(MySql,nil,nil);
//              DMBelShop.CDS_Join.Open;
//            End
//           Else
//            Begin
//              b:=True;
//            End;
//         End;
      End; // While Not b do // Verifica se Existe na Tabela ES_FINAN_CURVA_ABC

      // Num_Seq de Documento --------------------------------------------------
      If bgProcCurva Then
       Inc(iNumSeqDoc);

      // Atualiza Variavel -----------------------------------------------------
      ValuesCampos:=Campos;

      // Busca Dados do Produto ------------------------------------------------
      CalculoAnaliseMatriz;

      // Grava Produto ---------------------------------------------------------
      MySql:='Insert into OC_COMPRAR ('+Campos+')'+
             ' Values ('+ValuesCampos+')';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      FrmBelShop.IBQ_Matriz.Next;
    End; // While Not FrmBelShop.IBQ_Matriz.Eof do
    FrmBelShop.IBQ_Matriz.Close;
    DMBelShop.CDS_Join.Close;

    // Atualiza OC_COMPRAR_DOCS ================================================
    OC_COMPRAR_DOCS('I', sNumDoc, 'BelShop');

    FrmBelShop.MontaProgressBar(False, FrmGeraPedidosComprasLojas);

    Lb_EmpProcessadas.Caption:=IntToStr(StrToInt(Lb_EmpProcessadas.Caption)+1);

    DMBelShop.SQLC.Commit(TD);

  Except
    on e : Exception do
    Begin
      FrmBelShop.MontaProgressBar(False, FrmGeraPedidosComprasLojas);

      DecimalSeparator:=',';
      DateSeparator:='/';
      Screen.Cursor:=crDefault;

      DMBelShop.SQLC.Rollback(TD);

      FrmBelShop.IBQ_Matriz.Close;
      DMBelShop.CDS_Join.Close;

      msg('Erro na Geração dos Produtos !!'+cr+cr+'Filial: '+sCodMatriz +' !!','A');
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);

      Exit;
    End;
  End; // Try
  OdirPanApres.Visible:=False;

  DecimalSeparator:=',';
  DateSeparator:='/';

  // Elimina Produtos da Matriz - Que não é para Processar =====================
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

    MySql:=' Delete from oc_comprar oc'+
           ' where oc.cod_empresa='+QuotedStr(sCodMatriz)+
           ' and oc.num_seq=9999999'+
           ' and oc.num_documento='+QuotedStr(sNumDoc);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

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

  Screen.Cursor:=crDefault;

  // Busca Totais das OCs ======================================================
  TotaisOC;

  hHrFim:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

  Edt_OCTotProdutos.Value:=0;

  msg('Analise dos Produtos'+cr+'Efetuada com SUCESSO !!'+cr+cr+
      ' TEMPO: '+TimeToStr(StrToTime(hHrFim)-StrToTime(hHrInicio)),'A');

  If sgLojasNConectadas<>'' Then
   msg('Lojas Não Conectadas: '+cr+cr+sgLojasNConectadas,'A');

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

  Lb_EmpAprocessar.Caption:='0';
  Lb_EmpProcessadas.Caption:='0';

  PC_OrdemCompra.TabIndex:=1;
  PC_OrdemCompraChange(Self);

  EdtGeraOCBuscaDocto.Value:=StrToInt(sNumDoc);
  EdtGeraOCBuscaDoctoExit(Sender);

  // Limpa Fornecedores do Dia =================================================
  try
    DMVirtual.CDS_V_Fornecedores.CreateDataSet;
    DMVirtual.CDS_V_Fornecedores.Open;
  Except
    DMVirtual.CDS_V_Fornecedores.EmptyDataSet;
    DMVirtual.CDS_V_Fornecedores.Open;
  End;
  FrmBelShop.MontaSelectFornecedores;

end;

procedure TFrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoEstoqueClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_GeraOCCalculoEstoque);

end;

procedure TFrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoEstoqueKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_GeraOCCalculoEstoqueClick(Self);

end;

procedure TFrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoTransitoClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_GeraOCCalculoTransito);

end;

procedure TFrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoTransitoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_GeraOCCalculoTransitoClick(Self);

end;

procedure TFrmGeraPedidosComprasLojas.Bt_GeraOCCalcularClick(Sender: TObject);
Var
  cPerApurCxEmb, cQtdACompra: Currency;
  MySql: String;
begin

  If DMBelShop.IBQ_AComprar.IsEmpty Then
   Exit;

  DtEdt_GeraOCDataDocto.SetFocus;
  If EdtGeraOCDias.Value<1 Then
  Begin
    msg('Número de Dias Para Cálculo Inválido !!', 'A');
    EdtGeraOCBuscaDocto.SetFocus;
    Exit;
  End;

  If msg('Deseja Realmente Calcular'+cr+cr+'Necessidade de COMPRA ??','C')=2 Then
   Exit;

  Screen.Cursor:=crAppStart;

  // Busca Produtos ===========================================================
  DMBelShop.CDS_Sugestao.Close;
  DMBelShop.SDS_Sugestao.Params.ParamByName('NumDocto').Value:=
                                                      EdtGeraOCBuscaDocto.Value;
  DMBelShop.CDS_Sugestao.Open;

  // Inicia Processamento =====================================================
  FrmBelShop.MontaProgressBar(True, FrmGeraPedidosComprasLojas);
  pgProgBar.Properties.Max:=DMBelShop.CDS_Sugestao.RecordCount;
  pgProgBar.Position:=0;

  While Not DMBelShop.CDS_Sugestao.Eof do
  Begin
    Application.ProcessMessages;

    pgProgBar.Position:=DMBelShop.CDS_Sugestao.RecNo;
    Refresh;

    If DMBelShop.CDS_SugestaoIND_OC_GERADA.AsString<>'S' Then
    Begin
      // Calcula Acomprar ------------------------------------------
      cQtdACompra:=RoundTo(
                 DMBelShop.CDS_Sugestao.FieldByName('QTD_MEDIA_DIA').AsCurrency*
                                                         EdtGeraOCDias.Value,0);

      // Verifica Se Utiliza Saldo ---------------------------------
      If Ckb_GeraOCCalculoEstoque.Checked Then
       cQtdACompra:=cQtdACompra-
                     DMBelShop.CDS_Sugestao.FieldByName('QTD_SALDO').AsCurrency;

      // Verifica Se Utiliza Transito ------------------------------
      If Ckb_GeraOCCalculoTransito.Checked Then
       cQtdACompra:=cQtdACompra-
                  DMBelShop.CDS_Sugestao.FieldByName('QTD_TRANSITO').AsCurrency;

      If cQtdACompra<0 Then
       cQtdACompra:=0;

      // Verifica Caixa de Embarque --------------------------------
      If (bgLojaCXEmbarque) And (cQtdACompra>0) And (DMBelShop.CDS_SugestaoUNI_COMPRA.AsCurrency>0) Then
      Begin
        cPerApurCxEmb:=RoundTo((cQtdACompra/DMBelShop.CDS_SugestaoUNI_COMPRA.AsCurrency),-2);

        igTotInteiro:=ParteInteiro(VarToStr(cPerApurCxEmb));
        cPerApurCxEmb:=cPerApurCxEmb-igTotInteiro;

        If ((cPerApurCxEmb*100)>=cgPerCxEmpbarque) Then
         igTotInteiro:=igTotInteiro+1;

        cQtdACompra:=igTotInteiro*DMBelShop.CDS_SugestaoUNI_COMPRA.AsCurrency;
      End; // If Ckb_GeraOCCalculoCxEmbarque.Checked Then

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
      Else // If (DMBelShop.CDS_Sugestao.FieldByName('QTD_ACOMPRAR').AsCurrency<>0) and (DMBelShop.CDS_Sugestao.FieldByName('VLR_UNI_COMPRA').AsCurrency<>0) Then
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
         DMBelShop.CDS_SugestaoVLR_TOT_VENDA.AsCurrency:=0;
       End; // If (DMBelShop.CDS_Sugestao.FieldByName('QTD_ACOMPRAR').AsCurrency<>0) and


      // VLR_TOT_VENDA ----------------------------------------------
      DMBelShop.CDS_SugestaoVLR_TOT_VENDA.AsCurrency:=
                                  DMBelShop.CDS_SugestaoQTD_ACOMPRAR.AsCurrency*
                                 DMBelShop.CDS_SugestaoVLR_UNI_VENDA.AsCurrency;
      DecimalSeparator:='.';
      MySql:='UpDate OC_COMPRAR'+
             ' Set Qtd_AComprar='+
             QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('QTD_ACOMPRAR').AsString)+', '+
             ' Qtd_Sugerida='+
             QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('QTD_SUGERIDA').AsString)+', '+
             ' Vlr_Uni_Compra='+
             QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_UNI_COMPRA').AsString)+', '+
             ' Vlr_Uni_Venda='+
             QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_UNI_VENDA').AsString)+', '+
             ' Vlr_Bruto='+
             QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_BRUTO').AsString)+', '+
             ' Vlr_Base_ICMS='+
             QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_BASE_ICMS').AsString)+', '+
             ' Vlr_ICMS='+
             QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_ICMS').AsString)+', '+
             ' Vlr_IPI='+
             QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_IPI').AsString)+', '+
             ' Vlr_Base_ST='+
             QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_BASE_ST').AsString)+', '+
             ' Vlr_ST='+
             QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_ST').AsString)+', '+
             ' Vlr_Tot_Compra='+
             QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_TOT_COMPRA').AsString)+', '+
             ' Vlr_Tot_Venda='+
             QuotedStr(DMBelShop.CDS_Sugestao.FieldByName('VLR_TOT_VENDA').AsString)+

             ' Where Num_Documento='+
             DMBelShop.CDS_Sugestao.FieldByName('NUM_DOCUMENTO').AsString+
             ' And Num_Seq='+DMBelShop.CDS_Sugestao.FieldByName('NUM_SEQ').AsString;
      DMBelShop.SQLC.Execute(MySql,nil,nil);
      DecimalSeparator:=',';

      // Busca Totais das OCs ======================================================
      TotaisOC;
    End; // If DMBelShop.CDS_SugestaoIND_OC_GERADA.AsString<>'S' Then

    // Vai para o Proximo Produto ---------------------------------------------
    Screen.Cursor:=crAppStart;

    DMBelShop.CDS_Sugestao.Next
  End; // While Not DMBelShop.CDS_Sugestao.Eof do
  FrmBelShop.MontaProgressBar(False, FrmGeraPedidosComprasLojas);

  bgSiga:=True;
  EdtGeraOCBuscaDoctoExit(Self);
  bgSiga:=False;

  // Encerra Processamento ====================================================
  Screen.Cursor:=crDefault;
  msg('Processmento Efetuado com Sucesso !!','A');

  DMBelShop.IBT_BelShop.Commit;

  DMBelShop.IBQ_AComprar.Close;
  DMBelShop.IBQ_AComprar.Open;

  PC_GeraOCApresentacao.TabIndex:=0;
  PC_GeraOCApresentacaoChange(Self);

  Dbg_GeraOCGrid.SelectedIndex:=4;
  Dbg_GeraOCGrid.SetFocus;
end;

procedure TFrmGeraPedidosComprasLojas.Bt_GeraOCVoltarClick(Sender: TObject);
begin
  PC_OrdemCompra.TabIndex:=0;
  PC_OrdemCompraChange(Sender);
  FrmBelShop.PC_Filtros.ActivePage:=FrmBelShop.TS_FiltroFornecedor;
  FrmBelShop.PC_FiltrosChange(Sender);
  Bt_OCBuscaFornecDia.SetFocus;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_GeraOCGridColEnter(Sender: TObject);
begin
  bEnterTab:=False;
end;

procedure TFrmGeraPedidosComprasLojas.Dbg_GeraOCGridColExit(Sender: TObject);
begin
  bEnterTab:=True;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_GeraOCGridDrawColumnCell(Sender: TObject; const Rect: TRect;
          DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  If (Column.FieldName='QTD_SALDO') Or (Column.FieldName='QTD_TRANSF')Then
  Begin
    If (DMBelShop.IBQ_AComprarIND_TRANSF.AsString='S') Or (DMBelShop.IBQ_AComprarIND_QTD_ACIMA.AsCurrency>0) Then
     Begin
       Dbg_GeraOCGrid.Canvas.Font.Color:=clRed;
       Dbg_GeraOCGrid.Canvas.Font.Style:=[fsBold];
     End
    Else
     Begin
       Dbg_GeraOCGrid.Canvas.Font.Color:=clWindowText;
       Dbg_GeraOCGrid.Canvas.Font.Style:=[];
     End
  End; // If (Column.FieldName='QTD_SALDO') Then

  If (Column.FieldName='QTD_ACOMPRAR') Then
  Begin
    If DMBelShop.IBQ_AComprarQTD_ACOMPRAR.AsCurrency=0 Then
     Dbg_GeraOCGrid.Canvas.Font.Style:=[]
    Else
     Dbg_GeraOCGrid.Canvas.Font.Style:=[fsBold];
  End; // If (Column.FieldName='QTD_ACOMPRAR') Then

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
  End;   

  Dbg_GeraOCGrid.Canvas.FillRect(Rect);
  Dbg_GeraOCGrid.DefaultDrawDataCell(Rect,Column.Field,state);

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_GeraOCGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
begin
  If DMBelShop.IBQ_AComprar.IsEmpty Then
   Exit;

  If key=Vk_Return Then
  Begin
    DMBelShop.IBQ_AComprar.Next;
    Dbg_GeraOCGrid.SetFocus;
    Dbg_GeraOCGrid.SelectedIndex:=4;
    bEnterTab:=False;
    Exit;
  End;

  // Localiza Produto ==========================================================
  If Key=VK_F4 Then
  Begin
    s:='';
    If InputQuery('Localizar Produto','',s) then
    Begin
      if Trim(s)<>'' then
      Begin
        Try
          StrToInt(s);
          DMBelShop.IBQ_AComprar.Locate('Cod_Item',FormatFloat('000000',StrToInt(s)),[]);
        Except
          s:=AnsiUpperCase(s);
          DMBelShop.IBQ_AComprar.Locate('Des_Item',s,[loPartialKey]);
        End;
      End; // if Trim(s)<>'' then
    End; // If InputQuery('Localizar Produto','',s) then
  End; // If Key=VK_F4 Then

  // Transito ==================================================================
  If Key=VK_F6 Then
  Begin
    If DMBelShop.IBQ_AComprarQTD_TRANSITO.AsCurrency=0 Then
    Begin
      msg('Produto Sem Quantidade em Trânsito !!', 'A');
      Dbg_GeraOCGrid.SetFocus;
      Exit;
    End;
    Screen.Cursor:=crAppStart;

    // Busca Transito ==========================================================
    MySqlSelect:=' SELECT oc.CODOC Num_Ref, oc.DATAPEDIDO Dta_ref, oc.SITUACAO Cod_Situacao,'+
                 ' CASE oc.SITUACAO'+
                 '   WHEN 0 THEN ''ABERTA'''+
                 '   WHEN 1 THEN ''ABERTA - PENDENTE FORNECEDOR'''+
                 '   WHEN 2 THEN ''ENTREGUE'''+
                 '   WHEN 3 THEN ''CANCELADA'''+
                 ' END DES_SITUACAO,'+
                 ' oc.CODFORNECEDOR,'+
                 ' fr.NOMEFORNECEDOR,'+
                 ' COALESCE(oci.QUANTIDADE,0) Quant_Ref,'+
                 ' COALESCE(oci.PRECO,0) Preco,'+
                 ' Coalesce(oci.VALBRUTO,0) ValBruto,'+
                 ' Coalesce(oci.VALDESCONTO,0) ValDesconto,'+
                 ' Coalesce(oci.VALSUBSTITUICAO,0) ValSubstituicao,'+
                 ' Coalesce(oci.TOTALITEM,0) Vlr_Total_ref,'+
                 ' oc.codfilial'+

                 ' FROM ordem oc, ordemite oci, forneced fr'+

                 ' WHERE oc.codoc = oci.codoc'+
                 ' AND   oc.codfornecedor=fr.codfornecedor'+
                 ' AND   oc.situacao < 2'+
                 ' AND   oci.codproduto='+QuotedStr(DMBelShop.IBQ_AComprarCOD_ITEM.AsString)+
                 ' AND   oc.codfilial='+QuotedStr(sCodMatriz);
    FrmBelShop.IBQ_ConsultaMatriz.Close;
    FrmBelShop.IBQ_ConsultaMatriz.SQL.Clear;
    FrmBelShop.IBQ_ConsultaMatriz.SQL.Add(MySqlSelect);
    FrmBelShop.IBQ_ConsultaMatriz.Open;

    // Acerta Apresentação de Valores ==========================================
    TNumericField(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('QUANT_REF')).DisplayFormat:='0.,00';
    TNumericField(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('PRECO')).DisplayFormat:='0.,00';
    TNumericField(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('VALBRUTO')).DisplayFormat:='0.,00';
    TNumericField(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('VALDESCONTO')).DisplayFormat:='0.,00';
    TNumericField(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('VALSUBSTITUICAO')).DisplayFormat:='0.,00';

    Screen.Cursor:=crDefault;

    If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Num_Ref').AsString)<>'' Then
    Begin
      FrmVerTransito:=TFrmVerTransito.Create(Self);

      FrmVerTransito.Dbe_VerTransitoCodProduto.DataSource:=DMBelShop.DS_AComprar;
      FrmVerTransito.Dbe_VerTransitoDesProduto.DataSource:=DMBelShop.DS_AComprar;

      bgAltTrasito:=False;
      If (Not bgAltTrasito) Or (DMBelShop.IBQ_AComprarIND_OC_GERADA.AsString='S') Then
       FrmVerTransito.Pan_VerTransitoFechaOC.Visible:=False;

      FrmVerTransito.Pan_VerTransitoEmpresa.Caption:=
      'Ordens de Compra em Trânsito/Em Aberto - Empresa: '+
                                     DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString+
                                     ' - '+
                                     DMBelShop.IBQ_AComprarDes_Empresa.AsString;


      gDS:=TDataSource.Create(Self);
      gDS.DataSet:=FrmBelShop.IBQ_ConsultaMatriz;
      If sgCodLojaUnica='' Then
       Begin
         FrmVerTransito.Dbg_VerTransitoOCs.DataSource:=DMBelShop.DS_VerTransito;
         FrmVerTransito.Dbg_VerTransitoOCsValores.DataSource:=DMBelShop.DS_VerTransito;
       End
      Else
       Begin
         FrmVerTransito.Dbg_VerTransitoOCs.DataSource:=gDS;
         FrmVerTransito.Dbg_VerTransitoOCsValores.DataSource:=gDS;
       End; // If sgCodLojaUnica='' Then

      FrmVerTransito.ShowModal;
      FrmVerTransito.Dbg_VerTransitoOCs.DataSource:=DMBelShop.DS_VerTransito;

      FrmVerTransito.Free;
      FrmVerTransito:=nil;
      gDS.Free;
      gDS:=nil;
    End; // If Trim(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('Num_Ref').AsString)<>'' Then

    // Retorna Apresentação de Valores =========================================
    TNumericField(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('QUANT_REF')).DisplayFormat:='';
    TNumericField(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('PRECO')).DisplayFormat:='';
    TNumericField(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('VALBRUTO')).DisplayFormat:='';
    TNumericField(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('VALDESCONTO')).DisplayFormat:='';
    TNumericField(FrmBelShop.IBQ_ConsultaMatriz.FieldByName('VALSUBSTITUICAO')).DisplayFormat:='';

  End; // Transito - If Key=VK_F6 Then

end;

procedure TFrmGeraPedidosComprasLojas.Bt_GeraOCExcluirClick(Sender: TObject);
Var
  MySql: String;
  bExcFornSolic: Boolean;
begin
  // Apresenta Solicitações em Aberto ==========================================
  LojaApresSolicitacoesAbertas;

  Dbg_GeraOCGrid.SetFocus;

  If DMBelShop.IBQ_AComprar.IsEmpty Then
   Exit;

  bExcFornSolic:=False;
  If (bgSolicFechada) Or ((Not bgSolicFechada) and(bgSolicFechadaParcial)) Then
  Begin
    If Not bgSolicFechadaParcial Then
     Begin
       msg('Impossível Excluir a Solicitação'+cr+cr+'Já Transferida para a MATRIZ !!','A');
       Exit;
     End
    Else
     Begin
       bExcFornSolic:=True;
       If msg('Impossível Excluir a Solicitação'+cr+'Já Transferida Parcialmente para a MATRIZ !!'+cr+cr+
              'DESEJA EXCLUIR OS FORNECEDORES NÃO TRANSFERIDOS ??','C')=2 Then
       Begin
          Exit;
       End;
     End;
  End;

  PC_GeraOCApresentacao.TabIndex:=0;
  PC_GeraOCApresentacaoChange(Self);
  Dbg_GeraOCGrid.SetFocus;

  If Not bExcFornSolic Then
  Begin
    If msg('Deseja Realmente Excluir a'+cr+cr+'Solicitação Selecionada ??','C')=2 Then
    Begin
      Dbg_GeraOCGrid.SetFocus;
      Exit;
    End;
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
    MySql:=' DELETE from OC_COMPRAR o'+
           ' WHERE o.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value);

           If bExcFornSolic Then
            MySql:=MySql+' AND   o.ind_oc_gerada='+QuotedStr('N');
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Deleta OC_COMPRAR_DOCS ==================================================
    If Not bExcFornSolic Then
     OC_COMPRAR_DOCS('D', VarToStr(EdtGeraOCBuscaDocto.Value), '<>''Linx''');

    // Exclui Docto de OC Importada ============================================
    If Not bExcFornSolic Then
    Begin
      MySql:=' DELETE from OC_IMPORTADAS i'+
             ' WHERE i.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value);
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End;

    If Not bExcFornSolic Then
    Begin
      MySql:=' DELETE from OC_COMPRAR_MESES m'+
             ' WHERE m.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value);
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End;

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

  If Not bExcFornSolic Then
   Begin
     EdtGeraOCBuscaDocto.Value:=0;
     EdtGeraOCBuscaDocto.SetFocus;

     msg('Solicitação Excluida com SUCESSO !!','A');
   End
  Else
   Begin
     msg('Fornecedores Excluídos com SUCESSO !!','A');
     EdtGeraOCBuscaDoctoExit(Self);
   End
end;

procedure TFrmGeraPedidosComprasLojas.Bt_GeraOCFechaDocClick(Sender: TObject);
Var
  i: Integer;
  b: Boolean;

  mMemo: TMemo;
  MySql, sArquivo: String;
  sDtaGeracao: String;

  Ftp_Loja: TIdFTP;

  sFornSemLimite: String;

  // Guarda Períodos de Demandas
  slArqSolicitacao: Tstrings;
begin
  // Apresenta Solicitações em Aberto ==========================================
  LojaApresSolicitacoesAbertas;

  PC_GeraOCApresentacao.ActivePage:=Ts_GeraOCGrid;
  PC_GeraOCApresentacaoChange(Self);
  Dbg_GeraOCGrid.SetFocus;

  If DMBelShop.IBQ_AComprar.IsEmpty Then
   Exit;

  If bgSolicFechada Then
  Begin
    msg('Solicitação Já Transferida para a MATRIZ !!','A');
    Exit;
  End;

  // Acerta Totais nas Solictações de Lojas ====================================
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

    MySql:=' UPDATE OC_COMPRAR'+
           ' SET VLR_DESCONTOS=((QTD_ACOMPRAR*VLR_UNI_COMPRA)*(PER_DESCONTO/100))'+
           ' , VLR_BRUTO=(QTD_ACOMPRAR*VLR_UNI_COMPRA)-VLR_DESCONTOS'+
           ' , VLR_BASE_ICMS=VLR_BRUTO'+
           ' , VLR_ICMS=CAST(((VLR_BASE_ICMS*PER_ICMS)/100) AS NUMERIC(12,2))'+
           ' , VLR_IPI=CAST(((VLR_BRUTO*PER_IPI)/100) AS NUMERIC(12,2))'+
           ' , VLR_BASE_ST=VLR_BRUTO+(CAST(((VLR_BRUTO*PER_MARGEM_ST)/100) AS NUMERIC(12,2)))'+
           ' , VLR_ST=(CAST(((VLR_BASE_ST*PER_ST)/100) AS NUMERIC(12,2))-VLR_ICMS)'+
           ' , VLR_TOT_COMPRA=VLR_BRUTO+VLR_ST+VLR_IPI'+
           ' , VLR_TOT_VENDA=QTD_ACOMPRAR*VLR_UNI_VENDA'+

           ' WHERE qtd_acomprar<>0'+
           ' AND vlr_tot_compra=0'+
           ' AND vlr_uni_compra<>0';
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

  // Busca Limite para Faturamento do Fornecedores =============================
  MySql:=' SELECT oc.cod_fornecedor,'+
         ' COALESCE(pp.per_aceito,0) per_aceito_Padrao,'+
         ' COALESCE(pf.per_aceito,0) per_aceito_Forn,'+

         ' CAST('+
         ' CASE'+
         '   WHEN (COALESCE(pf.per_aceito,0)=0) AND (COALESCE(pp.per_aceito,0)<>0) THEN'+
         '        (SUM((oc.qtd_dem_mes1+oc.qtd_dem_mes2+ oc.qtd_dem_mes3+ oc.qtd_dem_mes4+'+
         '         oc.qtd_dem_mes5+ oc.qtd_dem_mes6+ oc.qtd_dem_mes7+ oc.qtd_dem_mes8)* oc.VLR_UNI_VENDA)) *'+
         '         (1+(COALESCE(pp.per_aceito,0)/100))'+
         '   WHEN (COALESCE(pf.per_aceito,0)>0) THEN'+
         '        (SUM((oc.qtd_dem_mes1+oc.qtd_dem_mes2+ oc.qtd_dem_mes3+ oc.qtd_dem_mes4+'+
         '         oc.qtd_dem_mes5+ oc.qtd_dem_mes6+ oc.qtd_dem_mes7+ oc.qtd_dem_mes8)* oc.VLR_UNI_VENDA)) *'+
         '         (1+(COALESCE(pf.per_aceito,0)/100))'+
         '   ELSE'+
         '        SUM((oc.qtd_dem_mes1+oc.qtd_dem_mes2+ oc.qtd_dem_mes3+ oc.qtd_dem_mes4+'+
         '        oc.qtd_dem_mes5+ oc.qtd_dem_mes6+ oc.qtd_dem_mes7+ oc.qtd_dem_mes8)* oc.VLR_UNI_VENDA)'+
         ' END'+
         ' AS NUMERIC(12,2)) Vlr_Lim_Fat'+

         ' FROM OC_COMPRAR oc'+
         '    LEFT JOIN parametros_lojas pp  ON pp.cod_loja=oc.cod_empresa'+
         '                                  AND pp.ind_tipo=0'+
         '    LEFT JOIN parametros_lojas pf  ON pf.cod_loja=oc.cod_empresa'+
         '                                  AND pf.ind_tipo=4'+
         '                                  AND pf.cod_fornecedor=oc.cod_fornecedor'+

         ' WHERE oc.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value)+
         ' AND   oc.ind_oc_gerada='+QuotedStr('N')+
         ' GROUP BY 1,2,3';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  PC_GeraOCApresentacao.ActivePage:=Ts_GeraOCTotFornec;
  PC_GeraOCApresentacaoChange(Self);

  // Retira a Seleção dos Fornecedores =========================================
  sFornSemLimite:='';
  DMLojaUnica.CDS_V_OCTotForn.First;
  DMLojaUnica.CDS_V_OCTotForn.DisableControls;
  While Not DMLojaUnica.CDS_V_OCTotForn.Eof do
  Begin
    DMLojaUnica.CDS_V_OCTotForn.Edit;
    DMLojaUnica.CDS_V_OCTotFornPROC.AsString:='NAO';
    DMLojaUnica.CDS_V_OCTotForn.Post;

    If DMBelShop.CDS_Busca.Locate('Cod_Fornecedor',DMLojaUnica.CDS_V_OCTotFornCOD_FORN.AsString,[]) Then
    Begin
      If (DMLojaUnica.CDS_V_OCTotFornVLR_VENDAS.AsCurrency>DMBelShop.CDS_Busca.FieldByName('Vlr_Lim_Fat').AsCurrency) And
         (DMBelShop.CDS_Busca.FieldByName('Vlr_Lim_Fat').AsCurrency<>0) Then
      Begin
        DMLojaUnica.CDS_V_OCTotForn.Edit;
        DMLojaUnica.CDS_V_OCTotFornPROC.AsString:='SIM';
        DMLojaUnica.CDS_V_OCTotForn.Post;

        If sFornSemLimite='' Then
         sFornSemLimite:=QuotedStr(DMLojaUnica.CDS_V_OCTotFornCOD_FORN.AsString)
        Else
         sFornSemLimite:=sFornSemLimite+', '+QuotedStr(DMLojaUnica.CDS_V_OCTotFornCOD_FORN.AsString);
      End; // If DMLojaUnica.CDS_V_OCTotFornVLR_VENDAS.AsCurrency>DMBelShop.CDS_Busca.FieldByName('Vlr_Lim_Fat').AsCurrency Then
    End; // If DMBelShop.CDS_Busca.Locate('Cod_Fornecedor',DMLojaUnica.CDS_V_OCTotFornCOD_FORN.AsString,[]) Then

    DMLojaUnica.CDS_V_OCTotForn.Next;
  End; // While Not DMLojaUnica.CDS_V_OCTotForn.Eof do
  DMLojaUnica.CDS_V_OCTotForn.EnableControls;
  DMLojaUnica.CDS_V_OCTotForn.First;

  DMBelShop.CDS_Busca.Close;

  If sFornSemLimite<>'' Then
  Begin
    // Busca Dados dos Itens do Documento ========================================
    MySql:=' Select *'+
           ' From oc_comprar oc'+
           ' Where oc.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value)+
           ' And oc.Cod_Fornecedor in ('+sFornSemLimite+')'+
           ' Order By (oc.qtd_dem_mes1+oc.qtd_dem_mes2+oc.qtd_dem_mes3+oc.qtd_dem_mes4+oc.qtd_dem_mes5+oc.qtd_dem_mes6+oc.qtd_dem_mes7+oc.qtd_dem_mes8) desc, oc.des_item';
    DMBelShop.IBQ_AComprar.Close;
    DMBelShop.IBQ_AComprar.SQL.Clear;
    DMBelShop.IBQ_AComprar.SQL.Add(MySql);
    DMBelShop.IBQ_AComprar.Open;

    TotaisOC;

    sgMensagem:='        Existem Fornecedores que Ultrapassaram'+cr+
                '           o Valor Limite para COMPRA !!'+cr+cr+
                'Eles Estarão MARCADOS na ABA: Solicitação/Fornecedores'+cr+
                '   e NÃO Terão sua Solicitação de Compras FECHADA !!'+cr+cr+
                '          Deseja CONTINUAR Assim MESMO ??';
    If Application.MessageBox(pChar(sgMensagem), 'ATENÇÃO !!', 292)= IdNo Then
     Exit;
  End; // If sFornSemLimite<>'' Then

  // Retorna Solicatação com Todos os Fornecedores Nao Transferidos ============
  PC_GeraOCApresentacao.ActivePage:=Ts_GeraOCGrid;
  PC_GeraOCApresentacaoChange(Self);
  Dbg_GeraOCGrid.SetFocus;

  MySql:=' Select *'+
         ' From oc_comprar oc'+
         ' Where oc.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value);

         If Trim(sFornSemLimite)<>'' Then
          MySql:=MySql+' And oc.Cod_Fornecedor Not in ('+sFornSemLimite+')';

         MySql:=MySql+' And oc.Ind_OC_Gerada='+QuotedStr('N')+
                      ' Order By (oc.qtd_dem_mes1+oc.qtd_dem_mes2+oc.qtd_dem_mes3+oc.qtd_dem_mes4+oc.qtd_dem_mes5+oc.qtd_dem_mes6+oc.qtd_dem_mes7+oc.qtd_dem_mes8) desc, oc.des_item';
  DMBelShop.IBQ_AComprar.Close;
  DMBelShop.IBQ_AComprar.SQL.Clear;
  DMBelShop.IBQ_AComprar.SQL.Add(MySql);
  DMBelShop.IBQ_AComprar.Open;

  TotaisOC;

  If EdtGeraOCTotalGeral.Value=0 Then
  Begin
    msg('Solicitação SEM Produto a Comprar !!','A');
    EdtGeraOCBuscaDoctoExit(Self);
    Exit;
  End;

  If msg('Deseja Realmente Fechar a Solicitação ??' ,'C')=2 Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Fechando Solicitação de Compras e Transferindo para Matriz...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Height-OdirPanApres.Height)/2));
  OdirPanApres.Visible:=True;
  Refresh;

  // Cria Componente de FTP ====================================================
//OdirFTP - INICIO
  If sgFTPUsar='SIM' Then
  Begin
    If Ftp_Loja<>nil then
    Begin
      FreeAndNil(Ftp_Loja);
    End;
    Ftp_Loja:=TIdFTP.Create(Ftp_Loja);
  End; // If sgFTPUsar='SIM' Then
//OdirFTP - FIM

  // Cria Componente Memo ======================================================
  mMemo:=TMemo.Create(Self);
  mMemo.Visible:=False;
  mMemo.Parent:=FrmGeraPedidosComprasLojas;
  mMemo.Width:=500;
  mMemo.Lines.Clear;

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DecimalSeparator:=',';
    DateSeparator:='.';

    // Cria Nome do Arquivo -----------------------------------------
    sArquivo:=sgPastaAreaFTP+'Sol_'+sCodMatriz+'_'+EdtGeraOCBuscaDocto.Text+'.TXT';

    // Verifica se Já Existe o Arquivo ------------------------------
    b:=True;
    i:=0;
    While b do
    Begin
      inc(i);

      If FileExists(sArquivo) Then
       sArquivo:=sgPastaAreaFTP+'Sol_'+sCodMatriz+'_'+EdtGeraOCBuscaDocto.Text+'_'+IntToStr(i) +'.TXT'
      Else
       Break;
    End; // While b do

    // Gera o Arquivo -----------------------------------------------
    SalvaResultado_IBQuery(DMBelShop.IBQ_AComprar, Dbg_GeraOCGrid, mMemo, sArquivo, False);

    // Acresecenta os Períodos Utlizados na Solicitação -------------
    Try
      slArqSolicitacao:=TStringList.Create;
      slArqSolicitacao.LoadFromFile(sArquivo);

      MySql:=' SELECT cm.NUM_DOCUMENTO,'+
             ' COALESCE(cm.MES1,'''') MES1,'+
             ' COALESCE(cm.MES2,'''') MES2,'+
             ' COALESCE(cm.MES3,'''') MES3,'+
             ' COALESCE(cm.MES4,'''') MES4,'+
             ' COALESCE(cm.MES8,'''') MES5,'+
             ' COALESCE(cm.MES8,'''') MES6,'+
             ' COALESCE(cm.MES7,'''') MES7,'+
             ' COALESCE(cm.MES8,'''') MES8'+
             ' FROM OC_COMPRAR_MESES cm'+
             ' WHERE cm.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      slArqSolicitacao.Add('DEMANDA;'+sCodMatriz+';'+
           DMBelShop.CDS_BuscaRapida.FieldByName('Num_Documento').AsString+';'+
                    DMBelShop.CDS_BuscaRapida.FieldByName('Mes1').AsString+';'+
                    DMBelShop.CDS_BuscaRapida.FieldByName('Mes2').AsString+';'+
                    DMBelShop.CDS_BuscaRapida.FieldByName('Mes3').AsString+';'+
                    DMBelShop.CDS_BuscaRapida.FieldByName('Mes4').AsString+';'+
                    DMBelShop.CDS_BuscaRapida.FieldByName('Mes5').AsString+';'+
                    DMBelShop.CDS_BuscaRapida.FieldByName('Mes6').AsString+';'+
                    DMBelShop.CDS_BuscaRapida.FieldByName('Mes7').AsString+';'+
                    DMBelShop.CDS_BuscaRapida.FieldByName('Mes8').AsString+';');
      DMBelShop.CDS_BuscaRapida.Close;

      slArqSolicitacao.SaveToFile(sArquivo);
    Finally // Try
      FreeAndNil(slArqSolicitacao);
    End; // Try

    slArqSolicitacao.Free;

    // Transfere o Arquivo ------------------------------------------
//OdirFTP - INICIO
    If sgFTPUsar='SIM' Then
    Begin
      Try
        Ftp_Loja.Disconnect;
        Ftp_Loja.Username:=sgFTPUser;
        Ftp_Loja.Password:=sgFTPSenha;
        Ftp_Loja.Passive := True;

        // Conecta Servidor FTP ==========================
        Try
          Ftp_Loja.Host:=sgIPServer;
          Ftp_Loja.Connect;
        Except
          Ftp_Loja.Host:=sgIPInternetServer;
          Ftp_Loja.Connect;
        End;

        // Envia Arquivo =================================
        Try
          Ftp_Loja.Put(sArquivo, ExtractFileName(sArquivo), False);
                  // Pasta e Arquivo Origem, Arquivo no Servidor FTP
          Ftp_Loja.Disconnect;
          Ftp_Loja.Free;
          Ftp_Loja:=nil;
        Except
          on e : Exception do
          Begin
            Ftp_Loja.Disconnect;
            Ftp_Loja.Free;
            Ftp_Loja:=nil;

            DMBelShop.SQLC.Rollback(TD);

            DateSeparator:='/';
            OdirPanApres.Visible:=False;
            Screen.Cursor:=crDefault;

            mMemo.Free;
            mMemo:=Nil;

            // Delete Arquivo da Solicitação Gerado ====================
            DeleteFile(sArquivo);

            sgMensagem:='Sistema Não Pode Fechar a Solicitação !!'+cr+cr+
                        'Erro ao Enivar Solicitação de Compras para Matriz BelShop !!'+cr+cr+
                        'Erro Apresentado: '+cr+e.Message+cr+cr+
                        'Tente Fechá-la mais TARDE...';
            MessageBox(Handle, pChar(sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

            Exit;
          End; // on e : Exception do
        End; // Try

      Except
        on e : Exception do
        Begin
          Ftp_Loja.Disconnect;
          FreeAndNil(Ftp_Loja);

          DMBelShop.SQLC.Rollback(TD);

          DateSeparator:='/';
          OdirPanApres.Visible:=False;
          Screen.Cursor:=crDefault;

          FreeAndNil(mMemo);

          // Delete Arquivo da Solicitação Gerado ====================
          DeleteFile(sArquivo);

          sgMensagem:='Sistema Não Pode Fechar a Solicitação !!'+cr+cr+
                      'Erro no Protocolo de FTP !!'+cr+cr+
                      'Erro Apresentado: '+cr+e.Message+cr+cr+
                      'Tente Fechá-la mais TARDE...';
          MessageBox(Handle, pChar(sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

          Exit;
        End; // on e : Exception do
      End; // Try
    End; // If sgFTPUsar='SIM' Then
//OdirFTP - FIM

    sDtaGeracao:=f_Troca('/','.',f_Troca('-','.',DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor))));

    MySql:=' Update OC_COMPRAR'+
           ' Set IND_OC_GERADA='+QuotedStr('S')+
           ', DTA_OC_GERADA='+QuotedStr(sDtaGeracao)+
           ', NUM_OC_GERADA='+EdtGeraOCBuscaDocto.Text+

           ', OBS_OC=OBS_OC||ascii_char(13)||'+
                         QuotedStr('Solicitação Fechada e Transferida em '+sDtaGeracao+
                         ' Pelo Usuário: '+Des_Usuario)+

           ', BLOB_TEXTO=BLOB_TEXTO||ascii_char(13)||'+
                         QuotedStr('Aberturta do Aplicativo: '+sgDataHoraAplicativo)+
                         '||ascii_char(13)||'+QuotedStr('- Solicitação Nº '+EdtGeraOCBuscaDocto.Text+' Fechada e Transferida em: '+sDtaGeracao+
                         ' por '+Des_Usuario)+
           ' Where Num_Documento='+EdtGeraOCBuscaDocto.Text;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

//OdirFTP - INICIO
    // Delete Arquivo da Solicitação Gerado ====================
    If sgFTPUsar='SIM' Then
    Begin
      DeleteFile(sArquivo);
    End; // If sgFTPUsar='SIM' Then
//OdirFTP - FIM

    mMemo.Free;
    mMemo:=Nil;

    DateSeparator:='/';
    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      DeleteFile(sArquivo);

      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      FreeAndNil(mMemo);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try

//OdirFTP - INICIO
  If sgFTPUsar='NAO' Then
  Begin
    msg('Favor AVISAR o ODIR para que ele possa'+cr+' Liberar a Solicitação para o Setor de Compras !!','A');
  End; // If sgFTPUsar='NAO Then
//OdirFTP - FIM
  EdtGeraOCBuscaDoctoExit(Self);

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_GeraOCGridItensEnter(Sender: TObject);
begin
  // Desabilita Mouse No Grid ==================================================
  Application.OnMessage:=DesabilitaScrollMouse;

  Dbg_GeraOCGrid.SelectedIndex:=4;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_GeraOCGridEnter(Sender: TObject);
begin                                 
  // Desabilita Mouse No Grid ==================================================
  Application.OnMessage:=DesabilitaScrollMouse;

  Dbg_GeraOCGrid.SelectedIndex:=4;
end;

procedure TFrmGeraPedidosComprasLojas.Dbg_GeraOCGridItensExit(Sender: TObject);
begin
  // Habilita Mouse No Grid ====================================================
  Application.OnMessage:=HabilitaScrollMouse;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_GeraOCGridExit(Sender: TObject);
begin
  // Habilita Mouse No Grid ====================================================
  Application.OnMessage:=HabilitaScrollMouse;

  Dbg_GeraOCGrid.SelectedIndex:=4;

end;

procedure TFrmGeraPedidosComprasLojas.Ts_OCBuscaProdutosEnter(Sender: TObject);
begin
  bEnterTab:=True;
end;

procedure TFrmGeraPedidosComprasLojas.PC_ParametroLojasChange(Sender: TObject);
begin
  If (PC_ParametroLojas.ActivePage=Ts_ParamLjCalculo) And (Ts_ParamLjCalculo.CanFocus) Then
  Begin
    Pan_ParamLjLocaliza.Visible:=False;
    Try
      Dbg_ParamLjDias.SetFocus;
    Except
    End;
  End;

  If (PC_ParametroLojas.ActivePage=Ts_ParamLjFornecedores) And (Ts_ParamLjFornecedores.CanFocus) Then
  Begin
    PC_ParamLjFornecedoresChange(Self);
  End;
end;

procedure TFrmGeraPedidosComprasLojas.Ckb_ParamLjSaldoClick(Sender: TObject);
begin

  If EdtParamLjPerCxEmbarque.Value<>0 Then
   cgPerPadrao:=EdtParamLjPerCxEmbarque.Value;

  AcertaCkb_SN(Ckb_ParamLjSaldo);
  AcertaCkb_SN(Ckb_ParamLjTransito);
  AcertaCkb_SN(Ckb_ParamLjEstMinimo);
  AcertaCkb_SN(Ckb_ParamLjCxEmbarque);

  Try
    If (Sender is TJvCheckBox) Then
    Begin
      If Trim((Sender as TJvCheckBox).Name)='Ckb_ParamLjCxEmbarque' Then
      Begin
        If Ckb_ParamLjCxEmbarque.Checked Then
         Begin
           EdtParamLjPerCxEmbarque.Enabled:=True;
           EdtParamLjPerCxEmbarque.Value:=cgPerPadrao;

           EdtParamLjPerCxEmbarque.SetFocus;
         End
        Else // If Ckb_ParamLjCxEmbarque.Checked Then
         Begin
           EdtParamLjPerCxEmbarque.Enabled:=False;
           EdtParamLjPerCxEmbarque.Value:=0;
         End; // If Ckb_ParamLjCxEmbarque.Checked Then
      End; // If Trim((Sender as TJvCheckBox).Name)='Ckb_ParamLjCxEmbarque' Then
    End; // If (Sender is TJvCheckBox) Then
  Except
  End;
end;

procedure TFrmGeraPedidosComprasLojas.Ckb_ParamLjSaldoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 Ckb_ParamLjSaldoClick(Self);
end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasEnter(Sender: TObject);
begin
  // Desabilita Mouse No Grid ==================================================
  Application.OnMessage:=DesabilitaScrollMouse;

  bEnterTab:=False;

  if THackDBGrid(Dbg_ParamLjDias).SelectedIndex<3 Then
   Dbg_ParamLjDias.SelectedIndex:=3;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasExit(Sender: TObject);
begin
  // Habilita Mouse No Grid ====================================================
  Application.OnMessage:=HabilitaScrollMouse;

  bEnterTab:=True;
end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasColEnter(Sender: TObject);
begin
  if THackDBGrid(Dbg_ParamLjDias).SelectedIndex<3 Then
   Dbg_ParamLjDias.SelectedIndex:=3;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Não Permite Deletar =======================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
   Key := 0;

  If Key=Vk_Return Then
  Begin
    DMVirtual.gCDS_V1.Next;
    If DMVirtual.gCDS_V1.RecNo<0 Then
     DMVirtual.gCDS_V1.First;

  End;

  if THackDBGrid(Dbg_ParamLjDias).SelectedIndex<3 Then
    Dbg_ParamLjDias.SelectedIndex:=3;

end;

procedure TFrmGeraPedidosComprasLojas.Bt_ParamLjSalvarClick(Sender: TObject);
Var
  MySql: String;
  sSimNao, sCampo: String;
  i: Integer;
begin
  If (Ckb_ParamLjCxEmbarque.Checked) and (EdtParamLjPerCxEmbarque.Value=0) Then
  Begin
    msg('Favor Informar o'+cr+cr+'Percentual de Caixa de Embarque !!','A');
    PC_ParametroLojas.ActivePage:=Ts_ParamLjCalculo;
    EdtParamLjPerCxEmbarque.SetFocus;
    Exit;
  End;

  If msg('Deseja Realmente SALVA as Alterações'+cr+cr+'Efetuadas nos Parâmetro das Lojas ??','C')=2 Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Salvando Parâmetros das Lojas...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Height-OdirPanApres.Height)/2));
  OdirPanApres.Visible:=True;
  Refresh;
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    //==========================================================================
    // 1 - Considerar SALDO ATUAL no Calculo de Necessidade de Compra
    //==========================================================================
    PC_ParametroLojas.ActivePage:=Ts_ParamLjCalculo;
    Refresh;

    sSimNao:='NAO';
    If Ckb_ParamLjSaldo.Checked Then sSimNao:='SIM';

    MySql:=' SELECT pl.ind_sim_nao'+
           ' FROM parametros_lojas pl'+
           ' WHERE pl.ind_tipo=1';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    MySql:='';
    If Trim(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString)='' Then
     Begin
       MySql:=' INSERT INTO PARAMETROS_LOJAS (Num_Seq, ind_tipo, ind_sim_nao, ind_dml)'+
              ' VALUES ('+
              'GEN_ID(GEN_PARAM_LOJAS,1)'+ // NUM_SEQ
              ', '+QuotedStr('1')+
              ', '+QuotedStr(sSimNao)+
              ', '+QuotedStr('INC')+')';
     End
    Else If Ckb_ParamLjSaldo.Checked<>(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString='SIM') Then
     Begin
       MySql:=' UPDATE PARAMETROS_LOJAS'+
              ' SET ind_sim_nao='+QuotedStr(sSimNao)+
              ', ind_dml='+QuotedStr('ALT')+
              ' WHERE Ind_Tipo=1';
     End; // If Trim(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString)='' Then
    DMBelShop.CDS_Busca.Close;

    // Grava Registro ==========================================================
    If MySql<>'' Then
    Begin
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End;

    //==========================================================================
    // 2 - Considerar Produto em Transito, se Houver, no Calculo de Necessidade de Compra ?
    //==========================================================================
    sSimNao:='NAO';
    If Ckb_ParamLjTransito.Checked Then sSimNao:='SIM';

    MySql:=' SELECT pl.ind_sim_nao'+
           ' FROM parametros_lojas pl'+
           ' WHERE pl.ind_tipo=2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    MySql:='';
    If Trim(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString)='' Then
     Begin
       MySql:=' INSERT INTO PARAMETROS_LOJAS (Num_Seq, ind_tipo, ind_sim_nao, ind_dml)'+
              ' VALUES ('+
              'GEN_ID(GEN_PARAM_LOJAS,1)'+ // NUM_SEQ
              ', '+QuotedStr('2')+
              ', '+QuotedStr(sSimNao)+
              ', '+QuotedStr('INC')+')';
     End
    Else If Ckb_ParamLjTransito.Checked<>(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString='SIM') Then
     Begin
       MySql:=' UPDATE PARAMETROS_LOJAS'+
              ' SET ind_sim_nao='+QuotedStr(sSimNao)+
              ', ind_dml='+QuotedStr('ALT')+
              ' WHERE Ind_Tipo=2';
     End; // If Trim(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString)='' Then
    DMBelShop.CDS_Busca.Close;

    // Grava Registro ==========================================================
    If MySql<>'' Then
    Begin
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End;

    //==========================================================================
    // 0 - Percentual PADRÃO do Limite para Faturamento de Fornecedor - POR LOJA
    // 3 - Numero de Dias para Calculo de Necessidade de Compra - POR LOJA  ====
    //==========================================================================
    FrmBelShop.MontaProgressBar(True, FrmGeraPedidosComprasLojas);
    pgProgBar.Properties.Max:=DMVirtual.gCDS_V1.RecordCount;
    pgProgBar.Position:=0;

    DMVirtual.gCDS_V1.First;
    While Not DMVirtual.gCDS_V1.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMVirtual.gCDS_V1.RecNo;

      //========================================================================
      // 0 - Percentual PADRÃO do Limite para Faturamento de Fornecedor - POR LOJA
      //========================================================================
      If (DMVirtual.gCDS_V1.FieldByName('Per_Lim_Fat_Forn').NewValue<>DMVirtual.gCDS_V1.FieldByName('Per_Lim_Fat_Forn').OldValue) Or
         (DMVirtual.gCDS_V1.FieldByName('Per_Lim_Fat_Forn').AsCurrency=0) Then
      Begin
        MySql:=' SELECT pl.ind_tipo, pl.cod_loja, pl.per_aceito, pl.ind_dml'+
               ' FROM PARAMETROS_LOJAS pl'+
               ' WHERE pl.ind_tipo=0'+
               ' AND pl.cod_loja='+QuotedStr(DMVirtual.gCDS_V1.FieldByName('Cod_Loja').AsString);
        DMBelShop.CDS_Busca.Close;
        DMBelShop.SDS_Busca.CommandText:=MySql;
        DMBelShop.CDS_Busca.Open;

        MySql:='';
        If Trim(DMBelShop.CDS_Busca.FieldByName('ind_tipo').AsString)='' Then
         Begin
           MySql:=' INSERT INTO PARAMETROS_LOJAS (Num_Seq, ind_tipo, cod_loja, per_aceito, ind_dml)'+
                  ' VALUES ('+
                  'GEN_ID(GEN_PARAM_LOJAS,1)'+ // NUM_SEQ
                  ', '+QuotedStr('0')+
                  ', '+QuotedStr(DMVirtual.gCDS_V1.FieldByName('Cod_Loja').AsString)+
                  ', '+QuotedStr(DMVirtual.gCDS_V1.FieldByName('Per_Lim_Fat_Forn').AsString)+
                  ', '+QuotedStr('INC')+')';
         End
        Else If DMVirtual.gCDS_V1.FieldByName('Per_Lim_Fat_Forn').AsCurrency<>DMBelShop.CDS_Busca.FieldByName('per_aceito').AsCurrency Then
         Begin
           MySql:=' UPDATE PARAMETROS_LOJAS'+
                  ' SET per_aceito='+QuotedStr(DMVirtual.gCDS_V1.FieldByName('Per_Lim_Fat_Forn').AsString)+
                  ', ind_dml='+QuotedStr('ALT')+
                  ' WHERE Ind_Tipo=0'+
                  ' AND cod_loja='+QuotedStr(DMVirtual.gCDS_V1.FieldByName('Cod_Loja').AsString);
         End; // If Trim(DMBelShop.CDS_Busca.FieldByName('ind_tipo').AsString)='' Then
        DMBelShop.CDS_Busca.Close;

        // Grava Registro ========================================================
        If MySql<>'' Then
        Begin
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End;
      End; // If DMVirtual.gCDS_V1.FieldByName('NUM_DIAS').NewValue<>DMVirtual.gCDS_V1.FieldByName('NUM_DIAS').OldValue Then

      //========================================================================
      // 3 - Numero de Dias para Calculo de Necessidade de Compra - POR LOJA
      //========================================================================
      If DMVirtual.gCDS_V1.FieldByName('NUM_DIAS').NewValue<>DMVirtual.gCDS_V1.FieldByName('NUM_DIAS').OldValue Then
      Begin
        MySql:=' SELECT pl.ind_tipo, pl.cod_loja, pl.num_dia_calculo, pl.ind_dml'+
               ' FROM PARAMETROS_LOJAS pl'+
               ' WHERE pl.ind_tipo=3'+
               ' AND pl.cod_loja='+QuotedStr(DMVirtual.gCDS_V1.FieldByName('Cod_Loja').AsString);
        DMBelShop.CDS_Busca.Close;
        DMBelShop.SDS_Busca.CommandText:=MySql;
        DMBelShop.CDS_Busca.Open;

        MySql:='';
        If Trim(DMBelShop.CDS_Busca.FieldByName('ind_tipo').AsString)='' Then
         Begin
           MySql:=' INSERT INTO PARAMETROS_LOJAS (Num_Seq, ind_tipo, cod_loja, num_dia_calculo, ind_dml)'+
                  ' VALUES ('+
                  'GEN_ID(GEN_PARAM_LOJAS,1)'+ // NUM_SEQ
                  ', '+QuotedStr('3')+
                  ', '+QuotedStr(DMVirtual.gCDS_V1.FieldByName('Cod_Loja').AsString)+
                  ', '+QuotedStr(DMVirtual.gCDS_V1.FieldByName('NUM_DIAS').AsString)+
                  ', '+QuotedStr('INC')+')';
         End
        Else If DMVirtual.gCDS_V1.FieldByName('NUM_DIAS').AsInteger<>DMBelShop.CDS_Busca.FieldByName('num_dia_calculo').AsInteger Then
         Begin
           MySql:=' UPDATE PARAMETROS_LOJAS'+
                  ' SET num_dia_calculo='+QuotedStr(DMVirtual.gCDS_V1.FieldByName('NUM_DIAS').AsString)+
                  ', ind_dml='+QuotedStr('ALT')+
                  ' WHERE Ind_Tipo=3'+
                  ' AND cod_loja='+QuotedStr(DMVirtual.gCDS_V1.FieldByName('Cod_Loja').AsString);
         End; // If Trim(DMBelShop.CDS_Busca.FieldByName('ind_tipo').AsString)='' Then
        DMBelShop.CDS_Busca.Close;

        // Grava Registro ========================================================
        If MySql<>'' Then
        Begin
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End;
      End; // If DMVirtual.gCDS_V1.FieldByName('NUM_DIAS').NewValue<>DMVirtual.gCDS_V1.FieldByName('NUM_DIAS').OldValue Then

      DMVirtual.gCDS_V1.Next;
    End; // While Not DMVirtual.gCDS_V1.Eof do
    DMVirtual.gCDS_V1.First;
    FrmBelShop.MontaProgressBar(False, FrmGeraPedidosComprasLojas);

    //==========================================================================
    // 4 - Percentual Limite para Faturamento de Fornecedor - POR FORNECEDOR E LOJA
    //     SE O FORNECEDOR NÃO EXISTIR PERCENTUAL PADRÃO - IND_TIPO = 0
    //==========================================================================
    PC_ParametroLojas.ActivePage:=Ts_ParamLjFornecedores;
    PC_ParamLjFornecedores.ActivePage:=Ts_ParamLjLimiteFat;
    Refresh;

    FrmBelShop.MontaProgressBar(True, FrmGeraPedidosComprasLojas);
    pgProgBar.Properties.Max:=DMVirtual.gCDS_V2.RecordCount;
    pgProgBar.Position:=0;

    DMVirtual.gCDS_V2.First;
    DMVirtual.gCDS_V2.DisableControls;
    While Not DMVirtual.gCDS_V2.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMVirtual.gCDS_V2.RecNo;

      For i:=2 to DMVirtual.gCDS_V2.Fields.Count-1 do
      Begin
        Refresh;

        If (DMVirtual.gCDS_V2.Fields[i].NewValue<>DMVirtual.gCDS_V2.Fields[i].OldValue) Then
        Begin
          sCampo:=DMVirtual.gCDS_V2.Fields[i].FieldName;
          sCampo:=Copy(sCampo,5,2);

          MySql:=' SELECT pl.ind_tipo, pl.cod_loja, pl.cod_fornecedor, pl.per_aceito, pl.ind_dml'+
                 ' FROM PARAMETROS_LOJAS pl'+
                 ' WHERE pl.ind_tipo=4'+
                 ' AND   pl.cod_loja='+QuotedStr(sCampo)+
                 ' AND   pl.cod_fornecedor='+QuotedStr(DMVirtual.gCDS_V2.FieldByName('CodFornecedor').AsString);
          DMBelShop.CDS_Busca.Close;
          DMBelShop.SDS_Busca.CommandText:=MySql;
          DMBelShop.CDS_Busca.Open;

          MySql:='';
          If Trim(DMBelShop.CDS_Busca.FieldByName('ind_tipo').AsString)='' Then
           Begin
             MySql:=' INSERT INTO PARAMETROS_LOJAS (Num_Seq, ind_tipo, cod_loja, cod_fornecedor, per_aceito, ind_dml)'+
                    ' VALUES ('+
                    'GEN_ID(GEN_PARAM_LOJAS,1)'+ // NUM_SEQ
                    ', '+QuotedStr('4')+
                    ', '+QuotedStr(sCampo)+
                    ', '+QuotedStr(DMVirtual.gCDS_V2.FieldByName('CodFornecedor').AsString)+
                    ', '+QuotedStr(DMVirtual.gCDS_V2.FieldByName('BEL_'+sCampo).AsString)+
                    ', '+QuotedStr('INC')+')';
           End
          Else If DMVirtual.gCDS_V2.FieldByName('BEL_'+sCampo).AsInteger<>DMBelShop.CDS_Busca.FieldByName('per_aceito').AsInteger Then
           Begin
             MySql:=' UPDATE PARAMETROS_LOJAS'+
                    ' SET per_aceito='+QuotedStr(DMVirtual.gCDS_V2.FieldByName('BEL_'+sCampo).AsString)+
                    ', ind_dml='+QuotedStr('ALT')+
                    ' WHERE ind_tipo=4'+
                    ' AND   cod_loja='+QuotedStr(sCampo)+
                    ' AND   cod_fornecedor='+QuotedStr(DMVirtual.gCDS_V2.FieldByName('CodFornecedor').AsString);
           End; // If Trim(DMBelShop.CDS_Busca.FieldByName('ind_tipo').AsString)='' Then
          DMBelShop.CDS_Busca.Close;

          // Grava Registro ======================================================
          If MySql<>'' Then
          Begin
            DMBelShop.SQLC.Execute(MySql,nil,nil);
          End;
        End; // If DMVirtual.gCDS_V2.Fields[i].Value<>DMVirtual.gCDS_V2.Fields[i].OldValue Then
      End; // For i:=2 to DMVirtual.gCDS_V2.Fields.Count-1 do

      DMVirtual.gCDS_V2.Next;
    End; // While Not DMVirtual.gCDS_V2.Eof do
    DMVirtual.gCDS_V2.EnableControls;
    DMVirtual.gCDS_V2.First;

    FrmBelShop.MontaProgressBar(False, FrmGeraPedidosComprasLojas);

    //==========================================================================
    // 5 - Utilizar Estoque Ideal (Estoque mínimo) ?  - POR PRODUTO - SIDICOM: ESTOQUE.EstoqueIdeal
    //==========================================================================
    PC_ParametroLojas.ActivePage:=Ts_ParamLjCalculo;
    Refresh;

    sSimNao:='NAO';
    If Ckb_ParamLjEstMinimo.Checked Then sSimNao:='SIM';

    MySql:=' SELECT pl.ind_sim_nao'+
           ' FROM parametros_lojas pl'+
           ' WHERE pl.ind_tipo=5';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    MySql:='';
    If Trim(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString)='' Then
     Begin
       MySql:=' INSERT INTO PARAMETROS_LOJAS (Num_Seq, ind_tipo, ind_sim_nao, ind_dml)'+
              ' VALUES ('+
              'GEN_ID(GEN_PARAM_LOJAS,1)'+ // NUM_SEQ
              ', '+QuotedStr('5')+
              ', '+QuotedStr(sSimNao)+
              ', '+QuotedStr('INC')+')';
     End
    Else If Ckb_ParamLjEstMinimo.Checked<>(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString='SIM') Then
     Begin
       MySql:=' UPDATE PARAMETROS_LOJAS'+
              ' SET ind_sim_nao='+QuotedStr(sSimNao)+
              ', ind_dml='+QuotedStr('ALT')+
              ' WHERE Ind_Tipo=5';
     End; // If Trim(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString)='' Then
    DMBelShop.CDS_Busca.Close;

    // Grava Registro ==========================================================
    If MySql<>'' Then
    Begin
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End;

    //==========================================================================
    // 6 - Utilizar Percentual Limite de Caixa de Embarque para Compra - POR PRODUTO - SIDICOM: PRODUFOR.UnidadeCaixa
    //==========================================================================
    sSimNao:='NAO';
    If Ckb_ParamLjCxEmbarque.Checked Then sSimNao:='SIM';

    MySql:=' SELECT pl.ind_sim_nao, pl.per_aceito'+
           ' FROM parametros_lojas pl'+
           ' WHERE pl.ind_tipo=6';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    MySql:='';
    If Trim(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString)='' Then
     Begin
       MySql:=' INSERT INTO PARAMETROS_LOJAS (Num_Seq, ind_tipo, ind_sim_nao, per_aceito, ind_dml)'+
              ' VALUES ('+
              'GEN_ID(GEN_PARAM_LOJAS,1)'+ // NUM_SEQ
              ', '+QuotedStr('6')+
              ', '+QuotedStr(sSimNao)+
              ', '+QuotedStr(VarToStr(EdtParamLjPerCxEmbarque.Value))+
              ', '+QuotedStr('INC')+')';
     End
    Else If Ckb_ParamLjCxEmbarque.Checked<>(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString='SIM') Then
     Begin
       MySql:=' UPDATE PARAMETROS_LOJAS'+
              ' SET ind_sim_nao='+QuotedStr(sSimNao)+
              ', per_aceito='+QuotedStr(VarToStr(EdtParamLjPerCxEmbarque.Value))+
              ', ind_dml='+QuotedStr('ALT')+
              ' WHERE Ind_Tipo=6';
     End; // If Trim(DMBelShop.CDS_Busca.FieldByName('ind_sim_nao').AsString)='' Then
    DMBelShop.CDS_Busca.Close;

    // Grava Registro ==========================================================
    If MySql<>'' Then
    Begin
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End;

    //==========================================================================
    // Salva Arquivos Para Transferencia FTP para Lojas ========================
    //==========================================================================
    OdirPanApres.Visible:=False;
    If Not SalvarArquivosFTP Then
    Begin
      msg('Erro ao Gerar o Arquivo de Tansmissão'+cr+cr+'de Parâmetros Para a Loja: '+sgMensagem,'A');
    End;

    //==========================================================================
    // Atualiza Transacao ======================================================
    //==========================================================================
    DMBelShop.SQLC.Commit(TD);

    msg('Parâmetros de Lojas Salvos com SUCESSO !!','A');

    // Encerra =================================================================
    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;
    OdirPanApres.Visible:=False;

    PC_ParametroLojas.ActivePage:=Ts_ParamLjCalculo;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
      OdirPanApres.Visible:=False;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Falar com Odir !!', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try

  Close;
end;

procedure TFrmGeraPedidosComprasLojas.PC_ParamLjFornecedoresChange(Sender: TObject);
begin
  EdtParamLjLocaliza.Clear;
  If (PC_ParamLjFornecedores.ActivePage=Ts_ParamLjLimiteFat) And (Ts_ParamLjLimiteFat.CanFocus) Then
  Begin
    Pan_ParamLjLocaliza.Visible:=True;
    Dbg_ParamLjPerLimites.SetFocus;
  End;

  If (PC_ParamLjFornecedores.ActivePage=Ts_ParamLjFornCalcular) And (Ts_ParamLjFornCalcular.CanFocus) Then
  Begin
    Pan_ParamLjLocaliza.Visible:=True;
    Dbg_ParamLjDiasForn.SetFocus;
  End;

  If (PC_ParamLjFornecedores.ActivePage=Ts_ParamLjFornDias) And (Ts_ParamLjFornDias.CanFocus) Then
  Begin
    Pan_ParamLjLocaliza.Visible:=False;
    Dbg_ParamLjDiasFornLojas.SetFocus;
  End;


end;

procedure TFrmGeraPedidosComprasLojas.EdtParamLjLocalizaChange(Sender: TObject);
begin

  If (PC_ParamLjFornecedores.ActivePage=Ts_ParamLjLimiteFat) And (Ts_ParamLjLimiteFat.CanFocus) Then
  Begin
    If DMVirtual.gCDS_V2.IsEmpty Then
     Exit;

    if Trim(EdtParamLjLocaliza.Text)<>'' then
    Begin
      Try
        StrToInt(EdtParamLjLocaliza.Text);
        DMVirtual.gCDS_V2.Locate('CODFORNECEDOR',FormatFloat('000000',StrToInt(EdtParamLjLocaliza.Text)),[]);
      Except
        LocalizaRegistro(DMVirtual.gCDS_V2,'NOMEFORNECEDOR', Trim(EdtParamLjLocaliza.Text));
      End;
    End;
  End;

  If (PC_ParamLjFornecedores.ActivePage=Ts_ParamLjFornCalcular) And (Ts_ParamLjFornCalcular.CanFocus) Then
  Begin
    If DMLojaUnica.CDS_ParamLjFornDia.IsEmpty Then
     Exit;

    if Trim(EdtParamLjLocaliza.Text)<>'' then
    Begin
      Try
        StrToInt(EdtParamLjLocaliza.Text);
        DMLojaUnica.CDS_ParamLjFornDia.Locate('CODFORNECEDOR',FormatFloat('000000',StrToInt(EdtParamLjLocaliza.Text)),[]);
      Except
        LocalizaRegistro(DMLojaUnica.CDS_ParamLjFornDia,'NOMEFORNECEDOR', Trim(EdtParamLjLocaliza.Text));
      End;
    End;
  End;

end;

procedure TFrmGeraPedidosComprasLojas.Bt_ParamLjReplTUDOClick(Sender: TObject);
Var
  i, iLinha, iCelula: Integer;
  cValor: Currency;
  sColuna: String;
begin
  Dbg_ParamLjPerLimites.SetFocus;

  If (Not Rb_ParamLjPerLimLojas.Checked) And (Not Rb_ParamLjPerLimFornec.Checked) And (Not Rb_ParamLjPerLimLojasFornec.Checked) Then
  Begin
    msg('Favor Selecionar o Tipo de Replicação !!','A');
    Exit;
  End;

  //============================================================================
  // Replicar Percentual Para Todas as Lojas do Fornecedor Selecionado =========
  //============================================================================
  If Rb_ParamLjPerLimLojas.Checked Then
  Begin
    If msg('Deseja Realmente Replicar o Percentual'+cr+'Para Todas as Lojas do'+cr+'Fornecedor Selecionado !!','C')=2 Then
     Exit;

    sColuna:=Dbg_ParamLjPerLimites.Columns[Dbg_ParamLjPerLimites.SelectedIndex].FieldName;
    cValor:=DMVirtual.gCDS_V2.FieldByName(sColuna).AsCurrency;

    iLinha:=DMVirtual.gCDS_V2.RecNo;
    iCelula:=Dbg_ParamLjPerLimites.SelectedIndex;

    DMVirtual.gCDS_V2.Edit;
    For i:=2 to DMVirtual.gCDS_V2.Fields.Count-1 do
     DMVirtual.gCDS_V2.Fields[i].AsCurrency:=cValor;
    DMVirtual.gCDS_V2.Post;

    DMVirtual.gCDS_V2.RecNo:=iLinha;
    THackDBGrid(Dbg_ParamLjPerLimites).SelectedIndex:=iCelula;

  End; // If Rb_ParamLjPerLimLojas.Checked Then

  //============================================================================
  // Replicar Percentual Para Todos os Fornecedores da Loja Selecionada ========
  //============================================================================
  If Rb_ParamLjPerLimFornec.Checked Then
  Begin
    If msg('Deseja Realmente Replicar o Percentual'+cr+'Para Todos os Fornecedores da'+cr+'Loja Selecionada !!','C')=2 Then
     Exit;

    sColuna:=Dbg_ParamLjPerLimites.Columns[Dbg_ParamLjPerLimites.SelectedIndex].FieldName;
    cValor:=DMVirtual.gCDS_V2.FieldByName(sColuna).AsCurrency;

    iLinha:=DMVirtual.gCDS_V2.RecNo;
    iCelula:=Dbg_ParamLjPerLimites.SelectedIndex;

    DMVirtual.gCDS_V2.First;
    DMVirtual.gCDS_V2.DisableControls;
    While Not DMVirtual.gCDS_V2.Eof do
    Begin
      DMVirtual.gCDS_V2.Edit;
      DMVirtual.gCDS_V2.FieldByName(sColuna).AsCurrency:=cValor;
      DMVirtual.gCDS_V2.Post;

      DMVirtual.gCDS_V2.Next;
    End; // While Not DMVirtual.gCDS_V2.Eof do
    DMVirtual.gCDS_V2.EnableControls;

    DMVirtual.gCDS_V2.RecNo:=iLinha;
    THackDBGrid(Dbg_ParamLjPerLimites).SelectedIndex:=iCelula;

  End; // If Rb_ParamLjPerLimLojas.Checked Then

  //============================================================================
  // Replicar Percentual Para Todas as Lojas e Fornecedores ====================
  //============================================================================
  If Rb_ParamLjPerLimLojasFornec.Checked Then
  Begin
    If msg('Deseja Realmente Replicar o Percentual Selecionado'+cr+'Para Todas as Lojas e Fornecedores !!','C')=2 Then
     Exit;

    sColuna:=Dbg_ParamLjPerLimites.Columns[Dbg_ParamLjPerLimites.SelectedIndex].FieldName;
    cValor:=DMVirtual.gCDS_V2.FieldByName(sColuna).AsCurrency;

    iLinha:=DMVirtual.gCDS_V2.RecNo;
    iCelula:=Dbg_ParamLjPerLimites.SelectedIndex;

    DMVirtual.gCDS_V2.First;
    DMVirtual.gCDS_V2.DisableControls;
    While Not DMVirtual.gCDS_V2.Eof do
    Begin
      DMVirtual.gCDS_V2.Edit;
      For i:=2 to DMVirtual.gCDS_V2.Fields.Count-1 do
       DMVirtual.gCDS_V2.Fields[i].AsCurrency:=cValor;
      DMVirtual.gCDS_V2.Post;

      DMVirtual.gCDS_V2.Next;
    End; // While Not DMVirtual.gCDS_V2.Eof do
    DMVirtual.gCDS_V2.EnableControls;

    DMVirtual.gCDS_V2.RecNo:=iLinha;
    THackDBGrid(Dbg_ParamLjPerLimites).SelectedIndex:=iCelula;

  End; // If Rb_ParamLjPerLimLojas.Checked Then

  Rb_ParamLjPerLimLojas.Checked:=False;
  Rb_ParamLjPerLimFornec.Checked:=False;
  Rb_ParamLjPerLimLojasFornec.Checked:=False;
  Rb_ParamLjPerLimLojasClick(Self);

  Dbg_ParamLjPerLimites.SetFocus;

end;

procedure TFrmGeraPedidosComprasLojas.Rb_ParamLjPerLimLojasClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_ParamLjPerLimLojas);
  AcertaRb_Style(Rb_ParamLjPerLimFornec);
  AcertaRb_Style(Rb_ParamLjPerLimLojasFornec);
end;

procedure TFrmGeraPedidosComprasLojas.Rb_ParamLjPerLimLojasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_ParamLjPerLimLojasClick(Self);
end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjPerLimFornEnter(Sender: TObject);
begin
  // Desabilita Mouse No Grid ==================================================
  Application.OnMessage:=DesabilitaScrollMouse;

  bEnterTab:=False;

  Dbg_ParamLjPerLimites.SetFocus;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjPerLimFornExit(Sender: TObject);
begin
  // Habilita Mouse No Grid ====================================================
  Application.OnMessage:=HabilitaScrollMouse;

  bEnterTab:=True;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjPerLimFornKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Não Permite Deletar =======================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
   Key := 0;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjPerLimitesEnter(Sender: TObject);
begin
  // Desabilita Mouse No Grid ==================================================
  Application.OnMessage:=DesabilitaScrollMouse;

  bEnterTab:=False;


end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjPerLimitesExit(Sender: TObject);
begin
  // Habilita Mouse No Grid ====================================================
  Application.OnMessage:=HabilitaScrollMouse;

  bEnterTab:=True;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjPerLimitesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Não Permite Deletar =======================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
   Key := 0;

end;

procedure TFrmGeraPedidosComprasLojas.Bt_ParamLjFecharClick(Sender: TObject);
begin
  Close;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasFornEnter(Sender: TObject);
begin
  // Desabilita Mouse No Grid ==================================================
  Application.OnMessage:=DesabilitaScrollMouse;

  bEnterTab:=False;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasFornExit(Sender: TObject);
begin
  // Habilita Mouse No Grid ====================================================
  Application.OnMessage:=HabilitaScrollMouse;

  bEnterTab:=True;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasFornKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Não Permite Deletar =======================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
   Key := 0;

end;

procedure TFrmGeraPedidosComprasLojas.Bt_ParamLjDiasFornIncluirClick(Sender: TObject);
Var
  MySql: String;
begin
  If (DMLojaUnica.CDS_ParamLjFornDia.IsEmpty) Or (Lbx_ParamLjDiasFornSelec.Items.Count<1) Then
  Begin
    msg('Favor Selecionar Fornecedor !!','A');
    Dbg_ParamLjDiasForn.SetFocus;
    Exit;
  End; // If (DMLojaUnica.CDS_ParamLjFornDia.IsEmpty) Or (Lbx_ParamLjDiasFornSelec.Items.Count<1) Then

  // Busca Lojas ===============================================================
  MySql:=' SELECT ''NAO'' PROC, em.cod_filial cod_loja, em.razao_social,'+
         ' SUBSTRING(em.num_cnpj FROM 1 FOR 2) || ''.'' ||'+
         ' SUBSTRING(em.num_cnpj FROM 3 FOR 3) || ''.'' ||'+
         ' SUBSTRING(em.num_cnpj FROM 6 FOR 3) || ''/'' ||'+
         ' SUBSTRING(em.num_cnpj FROM 9 FOR 4) || ''-'' ||'+
         ' SUBSTRING(em.num_cnpj FROM 13 FOR 2) CNPJ'+

         ' FROM emp_conexoes em'+
         ' WHERE em.ind_ativo=''SIM'''+
         ' ORDER BY 2';
  DMBelShop.CDS_EmpBusca.Close;
  DMBelShop.SDS_EmpBusca.CommandText:=MySql;
  DMBelShop.CDS_EmpBusca.Open;
  Dbg_ParamLjDiasFornLojas.DataSource:=DMBelShop.DS_EmpBusca;

  Ts_ParamLjFornDias.TabVisible:=True;
  PC_ParamLjFornecedores.ActivePage:=Ts_ParamLjFornDias;
  PC_ParamLjFornecedoresChange(Self);

  Pan_Apresentacao.Visible:=False;
  Ts_ParamLjFornCalcular.TabVisible:=False;
  Ts_ParamLjLimiteFat.TabVisible:=False;
  Ts_ParamLjCalculo.TabVisible:=False;

  // Posiciona Paineis =========================================================
  Pan_ParamLjDias.Left:=ParteInteiro(VarToStr((Ts_ParamLjDias.Width-361)/2));
  Pan_ParamLjSemana.Left:=ParteInteiro(VarToStr((Ts_ParamLjSemana.Width-387)/2));
  Pan_ParamLjMeses.Left:=ParteInteiro(VarToStr((Ts_ParamLjMeses.Width-361)/2));

  // Ajusta Conteudo do Dbg_ParamLjDiasForn ====================================
  Dbg_ParamLjDiasFornLojas.Columns[2].Width:=ParteInteiro(VarToStr((Dbg_ParamLjDiasFornLojas.Width*63)/100));

  PC_ParamLjDiasForn.ActivePage:=Ts_ParamLjDias;

end;

procedure TFrmGeraPedidosComprasLojas.Bt_ParamLjDiasFornExcluirClick(Sender: TObject);
Var
  MySql: String;
  i: Integer;
begin
  Dbg_ParamLjDiasForn.SetFocus;

  If (DMLojaUnica.CDS_ParamLjFornDia.IsEmpty) Or (Lbx_ParamLjDiasFornSelec.Items.Count<1) Then
  Begin
    msg('Favor Selecionar Fornecedor(es)/Loja(s) !!','A');
    Dbg_ParamLjDiasForn.SetFocus;
    Exit;
  End; // If (DMLojaUnica.CDS_ParamLjFornDia.IsEmpty) Or (Lbx_ParamLjDiasFornSelec.Items.Count<1) Then

  If msg('Deseja Realmente Excluir o(s)'+cr+cr+'Fornecedor(es)/Loja(s) Selecionados ??','C')= 2 Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Excluindo Fornecedores/Lojas Selecionados...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmGeraPedidosComprasLojas.Height-OdirPanApres.Height)/2));
  OdirPanApres.Visible:=True;
  Refresh;

  i:=0;
  DMLojaUnica.CDS_ParamLjFornDia.First;
  DMLojaUnica.CDS_ParamLjFornDia.DisableControls;
  While Not DMLojaUnica.CDS_ParamLjFornDia.Eof do
  Begin
    Refresh;

    If DMLojaUnica.CDS_ParamLjFornDiaPROC.AsString='SIM' Then
    Begin
      If i=0 Then
       i:=DMLojaUnica.CDS_ParamLjFornDia.RecNo;

      If Trim(DMLojaUnica.CDS_ParamLjFornDiaCOD_LOJA.AsString)<>'' Then
      Begin
        MySql:=' UPDATE PARAMETROS_LOJAS pl'+
               ' SET pl.ind_dml='+QuotedStr('EXC')+
               ' WHERE pl.ind_tipo=7'+
               ' AND pl.cod_loja='+QuotedStr(DMLojaUnica.CDS_ParamLjFornDiaCOD_LOJA.AsString)+
               ' AND pl.cod_fornecedor='+QuotedStr(DMLojaUnica.CDS_ParamLjFornDiaCODFORNECEDOR.AsString);
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If Trim(DMLojaUnica.CDS_ParamLjFornDiaCOD_LOJA.AsString)<>'' Then
    End; // If DMLojaUnica.CDS_ParamLjFornDiaPROC.AsString='SIM' Then

    DMLojaUnica.CDS_ParamLjFornDia.Next;
  End; // While Not DMLojaUnica.CDS_ParamLjFornDia.Eof do
  DMLojaUnica.CDS_ParamLjFornDia.EnableControls;

  DMLojaUnica.CDS_ParamLjFornDia.Close;
  DMLojaUnica.CDS_ParamLjFornDia.Open;

  // Acerta Cor do Fornecedor Principal ========================================
  AcertaCorFornPrincipal;
  If i<>0 Then DMLojaUnica.CDS_ParamLjFornDia.RecNo:=i;

  Lbx_ParamLjDiasFornSelec.Items.Clear;
  OdirPanApres.Visible:=False;

  msg('Exclusão Efetuada Com SUCESSO !!','A');

end;

procedure TFrmGeraPedidosComprasLojas.Bt_ParamLjDiasFornVoltarClick(Sender: TObject);
begin
  DMBelShop.CDS_EmpBusca.Close;
  Dbg_ParamLjDiasFornLojas.DataSource:=nil;

  Pan_Apresentacao.Visible:=True;
  Ts_ParamLjFornCalcular.TabVisible:=True;
  Ts_ParamLjLimiteFat.TabVisible:=True;
  Ts_ParamLjCalculo.TabVisible:=True;
  Ts_ParamLjFornDias.TabVisible:=False;

  PC_ParamLjFornecedores.ActivePage:=Ts_ParamLjFornCalcular;
  PC_ParamLjFornecedoresChange(Self);

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasFornDblClick(Sender: TObject);
Var
  i: Integer;
  sForn: String;
  bIncluir: Boolean;
begin
  DMLojaUnica.CDS_ParamLjFornDia.Edit;
  If DMLojaUnica.CDS_ParamLjFornDiaPROC.AsString='SIM' Then
   DMLojaUnica.CDS_ParamLjFornDiaPROC.AsString:='NAO'
  Else
   DMLojaUnica.CDS_ParamLjFornDiaPROC.AsString:='SIM';

  // Acerta Fornecedores Selecionados ==========================================
  sForn:=DMLojaUnica.CDS_ParamLjFornDiaCODFORNECEDOR.AsString+' - '+DMLojaUnica.CDS_ParamLjFornDiaNOMEFORNECEDOR.AsString;

  bIncluir:=True;
  For i:=0 to Lbx_ParamLjDiasFornSelec.Count - 1 do
  Begin
    if (Lbx_ParamLjDiasFornSelec.Items[i]=sForn) and (DMLojaUnica.CDS_ParamLjFornDiaPROC.AsString='NAO') Then
    Begin
      Lbx_ParamLjDiasFornSelec.Items.Delete(i);
      bIncluir:=False;
      Break;
    End;

    if (Lbx_ParamLjDiasFornSelec.Items[i]=sForn) and (DMLojaUnica.CDS_ParamLjFornDiaPROC.AsString='SIM') Then
    Begin
      DMLojaUnica.CDS_ParamLjFornDiaPROC.AsString:='NAO';
      bIncluir:=False;
      Break;
    End;
  End; // For i:=0 to Lbx_ParamLjDiasFornSelec.Count - 1 do

  If bIncluir Then
  Begin
    Lbx_ParamLjDiasFornSelec.Items.Add(sForn);
  End; // If DMLojaUnica.CDS_ParamLjFornDiaPROC.AsString='SIM' Then

  DMLojaUnica.CDS_ParamLjFornDia.Post;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasFornDrawColumnCell(Sender: TObject; const Rect: TRect;
          DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMLojaUnica.CDS_ParamLjFornDiaPROC.AsString='SIM' then
     Dbg_ParamLjDiasForn.Canvas.Brush.Color:=clSkyBlue
    Else
     Dbg_ParamLjDiasForn.Canvas.Brush.Color:=clWindow;

    If (Column.FieldName='TIPO_CALCULO') Then //--> Este comando altera cor da Celula
    Begin
      If Trim(DMLojaUnica.CDS_ParamLjFornDiaTIPO_CALCULO.AsString)='Diariamente' Then
       Dbg_ParamLjDiasForn.Canvas.Brush.Color:=$009FFFFF;  //-->> Cor da Celula

      If Trim(DMLojaUnica.CDS_ParamLjFornDiaTIPO_CALCULO.AsString)='Semanalmente' Then
       Dbg_ParamLjDiasForn.Canvas.Brush.Color:=$00B0FFB0;  //-->> Cor da Celula

      If Trim(DMLojaUnica.CDS_ParamLjFornDiaTIPO_CALCULO.AsString)='Mensalmente' Then
       Dbg_ParamLjDiasForn.Canvas.Brush.Color:=$00FFFFB3;  //-->> Cor da Celula
    End; // If (Column.FieldName='TIPO_CALCULO') Then //--> Este comando altera cor da Celula

    If (Column.FieldName='NOMEFORNECEDOR') Then //--> Este comando altera cor da Celula
    Begin
      If Trim(DMLojaUnica.CDS_ParamLjFornDiaFORN.AsString)='SIM' Then
      Begin
        Dbg_ParamLjDiasForn.Canvas.Font.Color:=clWindow; //-->> Cor da Fonte
        Dbg_ParamLjDiasForn.Canvas.Brush.Color:=clBlue;  //-->> Cor da Celula
      End;

      If Trim(DMLojaUnica.CDS_ParamLjFornDiaFORN.AsString)='FIL' Then
      Begin
        Dbg_ParamLjDiasForn.Canvas.Brush.Color:=$00FFFFCE;  //-->> Cor da Celula
      End;
    End; // If (Column.FieldName='PINTA_FORN') Then //--> Este comando altera cor da Celula

    Dbg_ParamLjDiasForn.Canvas.FillRect(Rect);
    Dbg_ParamLjDiasForn.DefaultDrawDataCell(Rect,Column.Field,state);
  End;
end;

procedure TFrmGeraPedidosComprasLojas.PC_ParamLjDiasFornChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_ParamLjDiasForn);
end;

procedure TFrmGeraPedidosComprasLojas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Retorna Situação Normal dos Filtros =======================================
  FrmBelShop.EdtFiltroCodForn.Enabled:=True;
  FrmBelShop.Bt_FiltroBuscaForn.Enabled:=True;

  FrmBelShop.FechaTudo;

end;

procedure TFrmGeraPedidosComprasLojas.cxPageControl1Change(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_ParamLjDiasForn);
end;

procedure TFrmGeraPedidosComprasLojas.Rb_ParamLjTodosDiasClick(Sender: TObject);
begin
  EdtParamLjCadaDia.Enabled:=True;
  EdtParamLjCadaDia.Visible:=True;
  Lb_Dias.Visible:=True;

  If (Sender is TRadioButton) Then
  Begin
    If Trim((Sender as TRadioButton).Name)='Rb_ParamLjTodosDias' Then
    Begin
      EdtParamLjCadaDia.Enabled:=False;
      EdtParamLjCadaDia.Visible:=False;
      Lb_Dias.Visible:=False;
    End;
  End; // If (Sender is TRadioButton) Then

  AcertaRb_Style(Rb_ParamLjTodosDias);
  AcertaRb_Style(Rb_ParamLjACada);
end;

procedure TFrmGeraPedidosComprasLojas.Rb_ParamLjTodosDiasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_ParamLjTodosDiasClick(Self);
end;

procedure TFrmGeraPedidosComprasLojas.Ckb_ParamLjSemana_SegClick(Sender: TObject);
begin
  If (Not Ckb_ParamLjSemana_Seg.Checked) And (Not Ckb_ParamLjSemana_Ter.Checked) And
     (Not Ckb_ParamLjSemana_Qua.Checked) And (Not Ckb_ParamLjSemana_Qui.Checked) And
     (Not Ckb_ParamLjSemana_Sex.Checked) Then
  Begin
    msg('Ao Memos Um Dia Deverá estar Marcado !!','A');

    If (Sender is TCheckBox) Then
     (Sender as TCheckBox).Checked:=True;
  End;
  
  AcertaCkb_Style(Ckb_ParamLjSemana_Seg);
  AcertaCkb_Style(Ckb_ParamLjSemana_Ter);
  AcertaCkb_Style(Ckb_ParamLjSemana_Qua);
  AcertaCkb_Style(Ckb_ParamLjSemana_Qui);
  AcertaCkb_Style(Ckb_ParamLjSemana_Sex);
end;

procedure TFrmGeraPedidosComprasLojas.Cbx_ParamLjMesesDiasChange(Sender: TObject);
begin
  If Cbx_ParamLjMesesDias.ItemIndex=0 Then
   Cbx_ParamLjMesesPosicao.ItemIndex:=0;

end;

procedure TFrmGeraPedidosComprasLojas.Ckb_ParamLjSemana_SegKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ParamLjSemana_SegClick(Self
  );
end;

procedure TFrmGeraPedidosComprasLojas.Ckb_ParamLjMeses_JanClick(Sender: TObject);
begin
  If (Not Ckb_ParamLjMeses_Jan.Checked) And (Not Ckb_ParamLjMeses_Fev.Checked) And
     (Not Ckb_ParamLjMeses_Mar.Checked) And (Not Ckb_ParamLjMeses_Abr.Checked) And
     (Not Ckb_ParamLjMeses_Mai.Checked) And (Not Ckb_ParamLjMeses_Jun.Checked) And
     (Not Ckb_ParamLjMeses_Jul.Checked) And (Not Ckb_ParamLjMeses_Ago.Checked) And
     (Not Ckb_ParamLjMeses_Set.Checked) And (Not Ckb_ParamLjMeses_Out.Checked) And
     (Not Ckb_ParamLjMeses_Nov.Checked) And (Not Ckb_ParamLjMeses_Dez.Checked) Then
  Begin
    msg('Ao Memos Um Mês Deverá estar Marcado !!','A');

    If (Sender is TCheckBox) Then
     (Sender as TCheckBox).Checked:=True;
  End;

  AcertaCkb_Style(Ckb_ParamLjMeses_Jan);
  AcertaCkb_Style(Ckb_ParamLjMeses_Fev);
  AcertaCkb_Style(Ckb_ParamLjMeses_Mar);
  AcertaCkb_Style(Ckb_ParamLjMeses_Abr);
  AcertaCkb_Style(Ckb_ParamLjMeses_Mai);
  AcertaCkb_Style(Ckb_ParamLjMeses_Jun);
  AcertaCkb_Style(Ckb_ParamLjMeses_Jul);
  AcertaCkb_Style(Ckb_ParamLjMeses_Ago);
  AcertaCkb_Style(Ckb_ParamLjMeses_Set);
  AcertaCkb_Style(Ckb_ParamLjMeses_Out);
  AcertaCkb_Style(Ckb_ParamLjMeses_Nov);
  AcertaCkb_Style(Ckb_ParamLjMeses_Dez);
end;

procedure TFrmGeraPedidosComprasLojas.Ckb_ParamLjMeses_JanKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ParamLjMeses_JanClick(Self);
end;

procedure TFrmGeraPedidosComprasLojas.Bt_ParamLjDiasFornOKClick(Sender: TObject);
Var
  b: Boolean;
  i: Integer;
begin

  b:=False;
  DMBelShop.CDS_EmpBusca.First;
  While Not DMBelShop.CDS_EmpBusca.Eof do
  Begin
    If DMBelShop.CDS_EmpBusca.FieldByName('PROC').AsString='SIM' Then
    Begin
      b:=True;
      Break;
    End;
    DMBelShop.CDS_EmpBusca.Next;
  End;
  DMBelShop.CDS_EmpBusca.First;

  If Not b Then
  Begin
    msg('Favor Selecionar a(s) Loja(s)'+cr+'Para Aplicação das Ocorrências !!','A');
    Exit;
  End;

  // Salva Ocorrencias de Fornecedores por Dias ================================
  If Not SalvaOcorrencias Then
  Begin
    If sgMensagem<>'' Then
     msg('Erro ao Salvar Ocorrências:'+cr+sgMensagem,'A');

    Exit;
  End;

  // Desmarca Fornecedores =====================================================
  i:=DMLojaUnica.CDS_ParamLjFornDia.RecNo;
  DMLojaUnica.CDS_ParamLjFornDia.Close;
  DMLojaUnica.CDS_ParamLjFornDia.Open;

  // Acerta Cor do Fornecedor Principal ========================================
  AcertaCorFornPrincipal;
  DMLojaUnica.CDS_ParamLjFornDia.RecNo:=i;

  Lbx_ParamLjDiasFornSelec.Items.Clear;

  Bt_ParamLjDiasFornVoltarClick(Self);
end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasFornLojasDblClick(Sender: TObject);
begin
  DMBelShop.CDS_EmpBusca.Edit;
  If DMBelShop.CDS_EmpBusca.FieldByName('PROC').AsString='SIM' Then
   DMBelShop.CDS_EmpBusca.FieldByName('PROC').AsString:='NAO'
  Else
   DMBelShop.CDS_EmpBusca.FieldByName('PROC').AsString:='SIM';

  DMBelShop.CDS_EmpBusca.Post;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasFornLojasDrawColumnCell(Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMBelShop.CDS_EmpBusca.FieldByName('PROC').AsString='SIM' then
     Dbg_ParamLjDiasFornLojas.Canvas.Brush.Color:=$0080FF80
    Else
     Dbg_ParamLjDiasFornLojas.Canvas.Brush.Color:=clWindow;

    Dbg_ParamLjDiasFornLojas.Canvas.FillRect(Rect);
    Dbg_ParamLjDiasFornLojas.DefaultDrawDataCell(Rect,Column.Field,state);
  End;
  DMBelShop.CDS_EmpBusca.FieldByName('PROC').Alignment:=taCenter;
  DMBelShop.CDS_EmpBusca.FieldByName('COD_LOJA').Alignment:=taCenter;
  DMBelShop.CDS_EmpBusca.FieldByName('Razao_Social').Alignment:=taLeftJustify;
  DMBelShop.CDS_EmpBusca.FieldByName('CNPJ').Alignment:=taRightJustify;
end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasFornLojasEnter(Sender: TObject);
begin
  // Desabilita Mouse No Grid ==================================================
  Application.OnMessage:=DesabilitaScrollMouse;

  bEnterTab:=False;


end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasFornLojasExit(Sender: TObject);
begin
  // Habilita Mouse No Grid ====================================================
  Application.OnMessage:=HabilitaScrollMouse;

  bEnterTab:=True;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_ParamLjDiasFornLojasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Não Permite Deletar =======================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
   Key := 0;

end;

procedure TFrmGeraPedidosComprasLojas.Bt_ParamLjDiasFornMarcaTodosClick(Sender: TObject);
begin
  DMBelShop.CDS_EmpBusca.First;
  While Not DMBelShop.CDS_EmpBusca.Eof do
  Begin
    Refresh;

    DMBelShop.CDS_EmpBusca.Edit;

    If (Sender is TJvXPButton) Then
    Begin
      If (Sender as TJvXPButton).Name='Bt_ParamLjDiasFornMarcaTodos' Then
       DMBelShop.CDS_EmpBusca.FieldByName('PROC').AsString:='SIM';

      If (Sender as TJvXPButton).Name='Bt_ParamLjDiasFornDesMarcaTodos' Then
       DMBelShop.CDS_EmpBusca.FieldByName('PROC').AsString:='NAO';
    End; // If (Sender is TJvXPButton) Then
    DMBelShop.CDS_EmpBusca.Post;

    DMBelShop.CDS_EmpBusca.Next;
  End;
  DMBelShop.CDS_EmpBusca.First;

end;

procedure TFrmGeraPedidosComprasLojas.Bt_ParamLjReplDesFazerClick(Sender: TObject);
Var
  i, iLinha, iCelula: Integer;
begin
  Dbg_ParamLjPerLimites.SetFocus;

  //============================================================================
  // DeFazer a Replicação ======================================================
  //============================================================================
  If msg('Deseja Realmente DesFazer a Replicação de Percentual ??','C')=2 Then
     Exit;

  iLinha:=DMVirtual.gCDS_V2.RecNo;
  iCelula:=Dbg_ParamLjPerLimites.SelectedIndex;

  DMVirtual.gCDS_V2.First;
  DMVirtual.gCDS_V2.DisableControls;
  While Not DMVirtual.gCDS_V2.Eof do
  Begin
    DMVirtual.gCDS_V2.Edit;
    For i:=2 to DMVirtual.gCDS_V2.Fields.Count-1 do
     DMVirtual.gCDS_V2.Fields[i].AsCurrency:=DMVirtual.gCDS_V2.Fields[i].OldValue;
    DMVirtual.gCDS_V2.Post;

    DMVirtual.gCDS_V2.Next;
  End; // While Not DMVirtual.gCDS_V2.Eof do
  DMVirtual.gCDS_V2.EnableControls;

  DMVirtual.gCDS_V2.RecNo:=iLinha;
  THackDBGrid(Dbg_ParamLjPerLimites).SelectedIndex:=iCelula;

  Rb_ParamLjPerLimLojas.Checked:=False;
  Rb_ParamLjPerLimFornec.Checked:=False;
  Rb_ParamLjPerLimLojasFornec.Checked:=False;
  Rb_ParamLjPerLimLojasClick(Self);

  Dbg_ParamLjPerLimites.SetFocus;
end;

procedure TFrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoEstMininoClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_GeraOCCalculoEstMinino);

end;

procedure TFrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoEstMininoKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_GeraOCCalculoEstMininoClick(Self);
end;

procedure TFrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoCxEmbarqueClick( Sender: TObject);
begin
  AcertaCkb_SN(Ckb_GeraOCCalculoCxEmbarque);
end;

procedure TFrmGeraPedidosComprasLojas.Ckb_GeraOCCalculoCxEmbarqueKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_GeraOCCalculoCxEmbarqueClick(Self);
end;

procedure TFrmGeraPedidosComprasLojas.Bt_OCBuscaFornecDiaClick(Sender: TObject);
Var
  MySql: String;
begin

  // Apresenta Solicitações em Aberto ==========================================
  LojaApresSolicitacoesAbertas;

  // Cria Clent Virtual de Fornecedores ========================================
  try
    DMVirtual.CDS_V_Fornecedores.CreateDataSet;
    DMVirtual.CDS_V_Fornecedores.Open;
  Except
    DMVirtual.CDS_V_Fornecedores.EmptyDataSet;
    DMVirtual.CDS_V_Fornecedores.Open;
  End;                                               
  FrmBelShop.MontaSelectFornecedores;

  // Busca Fornecedores do Dia ===============================================
  MySql:=' SELECT pl.cod_fornecedor, fo.nomefornecedor'+

         ' FROM parametros_lojas pl, fornecedor fo'+

         ' WHERE pl.cod_fornecedor=fo.codfornecedor'+
         ' AND pl.ind_tipo=7'+
         ' AND pl.cod_loja='+QuotedStr(sgCodLojaUnica)+
         ' AND pl.dta_prox_calculo='+
         QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)))))+
         ' AND NOT EXISTS (SELECT 1'+
         '                 FROM oc_comprar oc'+
         '                 WHERE CAST(oc.dta_documento AS DATE)=pl.dta_prox_calculo'+
         '                 AND oc.cod_fornecedor=pl.cod_fornecedor)'+

         ' ORDER BY 2';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Fornecedor').AsString)='' Then
  Begin
    msg('SEM Fornecedor a Comprar no Dia !!','A');
    DMBelShop.CDS_BuscaRapida.Close;
    Exit;
  End;

  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    DMVirtual.CDS_V_Fornecedores.Insert;
    DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString:=
             DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Fornecedor').AsString;
    DMVirtual.CDS_V_FornecedoresDes_Fornecedor.AsString:=
             DMBelShop.CDS_BuscaRapida.FieldByName('NomeFornecedor').AsString;
    DMVirtual.CDS_V_Fornecedores.Post;

    DMBelShop.CDS_BuscaRapida.Next;
  End;

  // Monta sFornecedore
  FrmBelShop.MontaSelectFornecedores;
  DMBelShop.CDS_BuscaRapida.Close;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_GeraOCTotForncDblClick(Sender: TObject);
Var
  i: Integer;
  MySql: String;
begin

  i:=DMLojaUnica.CDS_V_OCTotForn.RecNo;

  DMLojaUnica.CDS_V_OCTotForn.Edit;
  If DMLojaUnica.CDS_V_OCTotFornPROC.AsString='SIM' Then
   DMLojaUnica.CDS_V_OCTotFornPROC.AsString:='NAO'
  Else
   DMLojaUnica.CDS_V_OCTotFornPROC.AsString:='SIM';

  sgFornLojas:='';

  DMLojaUnica.CDS_V_OCTotForn.First;
  DMLojaUnica.CDS_V_OCTotForn.DisableControls;
  While Not DMLojaUnica.CDS_V_OCTotForn.Eof do
  Begin
    If DMLojaUnica.CDS_V_OCTotFornPROC.AsString='SIM' Then
    Begin
      If sgFornLojas='' Then
       sgFornLojas:=QuotedStr(DMLojaUnica.CDS_V_OCTotFornCOD_FORN.AsString)
      Else
       sgFornLojas:=sgFornLojas+', '+QuotedStr(DMLojaUnica.CDS_V_OCTotFornCOD_FORN.AsString);

    End;

   DMLojaUnica.CDS_V_OCTotForn.Next;
  End; // While Not DMLojaUnica.CDS_V_OCTotForn.Eof do
  DMLojaUnica.CDS_V_OCTotForn.EnableControls;
  DMLojaUnica.CDS_V_OCTotForn.RecNo:=i;

  // Busca Dados dos Itens do Documento ========================================
  MySql:=' Select *'+
         ' From oc_comprar oc'+
         ' Where oc.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value);

         If sgFornLojas<>'' Then
          MySql:=MySql+' And oc.Cod_Fornecedor in ('+sgFornLojas+')';

         MySql:=MySql+' Order By (oc.qtd_dem_mes1+oc.qtd_dem_mes2+oc.qtd_dem_mes3+oc.qtd_dem_mes4+oc.qtd_dem_mes5+oc.qtd_dem_mes6+oc.qtd_dem_mes7+oc.qtd_dem_mes8) desc, oc.des_item';
  DMBelShop.IBQ_AComprar.Close;
  DMBelShop.IBQ_AComprar.SQL.Clear;
  DMBelShop.IBQ_AComprar.SQL.Add(MySql);
  DMBelShop.IBQ_AComprar.Open;

  TotaisOC;

end;

procedure TFrmGeraPedidosComprasLojas.Dbg_GeraOCTotForncDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMLojaUnica.CDS_V_OCTotFornIND_TRANSF.AsString='SIM' then
     Dbg_GeraOCTotFornc.Canvas.Brush.Color:=clSkyBlue
    Else
     Dbg_GeraOCTotFornc.Canvas.Brush.Color:=clWindow;

    Dbg_GeraOCTotFornc.Canvas.FillRect(Rect);
    Dbg_GeraOCTotFornc.DefaultDrawDataCell(Rect,Column.Field,state);
  End;
    
end;

end.
