unit UFrmFluxFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls,
  Mask, ToolEdit, CurrEdit, JvExControls, JvXPCore, JvXPButtons, IBQuery,
  DBXpress, StrUtils, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar, AppEvnts,
  Menus, Commctrl, JvExStdCtrls, JvRadioButton, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, JvExComCtrls,
  JvDateTimePicker, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,
  JvExMask, JvToolEdit, DBGridJul, dxGDIPlusClasses;

type
  TFrmFluxoFornecedor = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    Gb_FluFornFornecedor: TGroupBox;
    Bt_FluFornBuscaFornecedor: TJvXPButton;
    EdtFluFornFornecedor: TEdit;
    EdtFluFornCodFornecedor: TCurrencyEdit;
    PC_Principal: TPageControl;
    Ts_FluxFornApres: TTabSheet;
    Ts_FluxFornCaixa: TTabSheet;
    Panel38: TPanel;
    Gb_FluxFornFornec: TGroupBox;
    Dbg_FluFornFornec: TDBGrid;
    OdirPanApres: TPanel;
    Bt_FluFornFechar: TJvXPButton;
    Dbg_FluFornCaixa: TDBGrid;
    ApplicationEvents1: TApplicationEvents;
    PopM_Forn_DtaCCDesaticado: TPopupMenu;
    PopM_FluFornSIM: TMenuItem;
    PopM_FluFornNAO: TMenuItem;
    Stb_FluForn: TdxStatusBar;
    PC_FluxFornParametros: TPageControl;
    Ts_FluxFornParamComprv: TTabSheet;
    Ts_FluxFornParamReducao: TTabSheet;
    Pan_FluFornComprov: TPanel;
    Bt_FluFornComprovante: TJvXPButton;
    EdtFluFornComprovante: TEdit;
    Rb_FluFornDebito: TJvRadioButton;
    Rb_FluFornCredito: TJvRadioButton;
    Dbg_FluFornComprov: TDBGrid;
    Stb_FluFornComprv: TdxStatusBar;
    Pan_FluFornReducao: TPanel;
    Dbg_FluFornPercReducao: TDBGrid;
    Dbg_FluFornFornReducao: TDBGrid;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Bt_FluxFornManutReducaoExcluir: TJvXPButton;
    Bt_FluxFornManutReducaoIncluir: TJvXPButton;
    Bt_FluxFornManutReducaoAlterar: TJvXPButton;
    Panel1: TPanel;
    Ts_FluxFornManutReducao: TTabSheet;
    Gb_FluxFornManutReducao: TGroupBox;
    Panel2: TPanel;
    Bt_FluxFornManutReducaoVoltar: TJvXPButton;
    Bt_FluxFornManutReducaoSalvar: TJvXPButton;
    Gb_FluxFornManutForn: TGroupBox;
    Bt_FluxFornManutBuscaForn: TJvXPButton;
    EdtFluxFornManutDesForn: TEdit;
    Gb_FluxFornManutValidade: TGroupBox;
    DtEdt_FluxFornManutDtaInicial: TcxDateEdit;
    DtEdt_FluxFornManutDtaFinal: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Gb_FluxFornManutPercent: TGroupBox;
    EdtFluxFornManutPercentual: TCurrencyEdit;
    EdtFluxFornManutCodForn: TCurrencyEdit;
    Gb_FluxFornManutComprv: TGroupBox;
    Bt_FluxFornManutBuscaComprv: TJvXPButton;
    EdtFluxFornManutDesComprv: TEdit;
    EdtFluxFornManutCodComprv: TCurrencyEdit;
    Ts_FluxFornLanctos: TTabSheet;
    Ts_FluxFornVinculos: TTabSheet;
    Panel3: TPanel;
    Bt_FluFornFiltroComprador: TJvXPButton;
    Bt_FluFornSalvaMemoria: TJvXPButton;
    Bt_FluFornIncluir: TJvXPButton;
    Bt_FluFornAlterar: TJvXPButton;
    Bt_FluFornVinculos: TJvXPButton;
    Pan_Lanctos: TPanel;
    Label9: TLabel;
    EdtNumDoc: TEdit;
    EdtSerieDoc: TEdit;
    Label10: TLabel;
    EdtValorDoc: TCurrencyEdit;
    Label3: TLabel;
    EdtCodLojaDoc: TCurrencyEdit;
    EdtCodHistDoc: TCurrencyEdit;
    Label11: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    EdtObsDoc: TEdit;
    EdtBuscaLojaDoc: TJvXPButton;
    EdtBuscaHistDoc: TJvXPButton;
    EdtLojaDoc: TEdit;
    EdtHistDoc: TEdit;
    EdtDebCreDoc: TEdit;
    Lab_Lanctos: TLabel;
    Panel4: TPanel;
    Bt_LanctosSalvar: TJvXPButton;
    Bt_LanctosAbandonar: TJvXPButton;
    EdtFluFornCodFornAcertar: TEdit;
    MEdt_DtaAtualizacao: TMaskEdit;
    Bt_FluFornAcertaSaldos: TJvXPButton;
    Bt_FluFornImprimir: TJvXPButton;
    Panel5: TPanel;
    Gb_FornVinculados: TGroupBox;
    Gb_FornVinculo: TGroupBox;
    Panel6: TPanel;
    Bt_FluxoVinculoExcluir: TJvXPButton;
    Dbg_FornVinculo: TDBGrid;
    Dbg_FornVinculados: TDBGrid;
    Gb_FornVinculado: TGroupBox;
    Cbx_FornVinculado: TComboBox;
    Label12: TLabel;
    EdtFornVinculoCodForn: TCurrencyEdit;
    Bt_FluxoVinculoBuscaForn: TJvXPButton;
    Panel7: TPanel;
    Label13: TLabel;
    Bt_FluxoVinculadoExcluir: TJvXPButton;
    EdtFornVinculadoCodForn: TCurrencyEdit;
    Bt_FluxoVinculadoBuscaForn: TJvXPButton;
    Bt_AvariasCentralTrocas: TButton;
    Label14: TLabel;
    Bt_FluFornAcrescCampanhas: TJvXPButton;
    Ts_FluxFornPercCampanhas: TTabSheet;
    Gb_FornAcrescCampanhas: TGroupBox;
    Pan_FornAcrescCampanhas: TPanel;
    Dbg_FornAcrescCampanhas: TDBGrid;
    EdtFornAcrescCampCodForn: TCurrencyEdit;
    Bt_FornAcrescCampBuscaFornec: TJvXPButton;
    EdtFornAcrescCampDescForn: TEdit;
    Label15: TLabel;
    EdtFornAcrescCampPercentual: TCurrencyEdit;
    Label16: TLabel;
    Stb_FornAcrescCampanhas: TdxStatusBar;
    Bt_FornAcrescCampSalvar: TJvXPButton;
    Label17: TLabel;
    EdtFornAcrescCampOBS: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    EdtDtCaixaDoc: TcxDateEdit;
    EdtDtOrigemDoc: TcxDateEdit;
    Pan_Datas: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure PC_PrincipalChange(Sender: TObject);

    // =========================================================================
    // ODIR ====================================================================
    // =========================================================================
    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente

    // FORNECEDORES CONTA CORRENTE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Procedure CalculaPercReducao;
    Procedure PercReducaoHabiita_GroupBox(bHabilita: Boolean);

    Procedure CalculaFluxoCaixaFornecedores(sDt: String=''; sCodForn: String ='');

    Procedure FiltraComprador(sCompradores: String; iNumLinhas: Integer); // sCompradores: Delimitador = ';'

    // NÃO é Mais Usado
    Function  DML_Historicos(sTipo, sCodHist: String; sDebCre: String=''; sDesHist: String=''): Boolean;
                          // sTipo: (I)nserir
                          //        (E)xclur

    Procedure BuscaFornecedorNovo;
    Procedure LimpaLancamentos;
    Function  ConsisteLancamentos: Boolean;
    Function  SalvaLancamentos: Boolean;

    Procedure CarregaComboBoxFornecedorVinculados(sFornVinculo: String);

    Procedure CriaLancamentoAbertura;

    Function  FornPercAcrescCampanhas(bIncluir: Boolean): Boolean;

    // FORNECEDORES VINCULADOS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Procedure AcertaCodVinculado; // Acerta os Codigo Vinculados = null
    Procedure FornVincAtualizaVinculos;

    // =========================================================================
    // ODIR ====================================================================
    // =========================================================================

    procedure Dbg_FluFornFornecKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Dbg_FluFornFornecKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_FluFornAcertaSaldosClick(Sender: TObject);
    procedure Dbg_FluFornFornecDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
                                              State: TGridDrawState);
    procedure Dbg_FluFornFornecTitleClick(Column: TColumn);
    procedure Bt_FluFornFecharClick(Sender: TObject);
    procedure EdtFluFornCodFornecedorChange(Sender: TObject);
    procedure EdtFluFornCodFornecedorExit(Sender: TObject);
    procedure Dbg_FluFornCaixaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure Dbg_FluFornCaixaEnter(Sender: TObject);
    procedure Dbg_FluFornCaixaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Dbg_FluFornFornecEnter(Sender: TObject);
    procedure Dbg_FluFornComprovEnter(Sender: TObject);
    procedure Bt_FluFornBuscaFornecedorClick(Sender: TObject);
    procedure Dbg_FluFornFornecDblClick(Sender: TObject);
    procedure Bt_FluFornSalvaMemoriaClick(Sender: TObject);
    procedure Dbg_FluFornComprovDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PopM_FluFornSIMClick(Sender: TObject);
    procedure Bt_FluFornComprovanteClick(Sender: TObject);
    procedure Rb_FluFornDebitoClick(Sender: TObject);
    procedure Rb_FluFornDebitoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_FluFornFiltroCompradorClick(Sender: TObject);
    procedure Dbg_FluFornComprovKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PC_FluxFornParametrosChange(Sender: TObject);
    procedure Bt_FluxFornManutReducaoVoltarClick(Sender: TObject);
    procedure Bt_FluxFornManutReducaoIncluirClick(Sender: TObject);
    procedure Ts_FluxFornManutReducaoExit(Sender: TObject);
    procedure Bt_FluxFornManutReducaoSalvarClick(Sender: TObject);
    procedure Dbg_FluFornPercReducaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Dbg_FluFornFornReducaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtFluxFornManutCodFornExit(Sender: TObject);
    procedure Bt_FluxFornManutBuscaFornClick(Sender: TObject);
    procedure EdtFluxFornManutCodComprvExit(Sender: TObject);
    procedure Bt_FluxFornManutBuscaComprvClick(Sender: TObject);
    procedure Bt_FluxFornManutReducaoAlterarClick(Sender: TObject);
    procedure Bt_FluxFornManutReducaoExcluirClick(Sender: TObject);
    procedure Bt_FluFornIncluirClick(Sender: TObject);
    procedure Bt_FluFornVinculosClick(Sender: TObject);
    procedure Pan_LanctosEnter(Sender: TObject);
    procedure EdtCodLojaDocExit(Sender: TObject);
    procedure EdtCodLojaDocChange(Sender: TObject);
    procedure EdtBuscaLojaDocClick(Sender: TObject);
    procedure EdtCodHistDocChange(Sender: TObject);
    procedure EdtCodHistDocExit(Sender: TObject);
    procedure EdtBuscaHistDocClick(Sender: TObject);
    procedure Bt_LanctosSalvarClick(Sender: TObject);
    procedure Bt_LanctosAbandonarClick(Sender: TObject);
    procedure EdtDtOrigemDoc1DropDown(Sender: TObject);
    procedure Dbg_FluFornCaixaTitleClick(Column: TColumn);
    procedure Dbg_FornVinculoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_FornVinculoExit(Sender: TObject);
    procedure Dbg_FornVinculoEnter(Sender: TObject);
    procedure EdtFornVinculoCodFornExit(Sender: TObject);
    procedure Bt_FluxoVinculoBuscaFornClick(Sender: TObject);
    procedure Dbg_FornVinculoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Dbg_FornVinculadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_FluxoVinculoExcluirClick(Sender: TObject);
    procedure Bt_FluxoVinculadoExcluirClick(Sender: TObject);
    procedure EdtFornVinculadoCodFornExit(Sender: TObject);
    procedure Bt_FluxoVinculadoBuscaFornClick(Sender: TObject);
    procedure Bt_AvariasCentralTrocasClick(Sender: TObject);
    procedure Dbg_FornVinculadosEnter(Sender: TObject);
    procedure Bt_FluFornAcrescCampanhasClick(Sender: TObject);
    procedure EdtFornAcrescCampCodFornChange(Sender: TObject);
    procedure EdtFornAcrescCampCodFornExit(Sender: TObject);
    procedure Bt_FornAcrescCampBuscaFornecClick(Sender: TObject);
    procedure Dbg_FornAcrescCampanhasEnter(Sender: TObject);
    procedure Bt_FornAcrescCampSalvarClick(Sender: TObject);
    procedure Dbg_FornAcrescCampanhasKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Dbg_FornAcrescCampanhasDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    bgAltVinculos: Boolean; // Se Houveram Alterações nos Vinculos
  end;

const
  // Show Hint em Forma de Balão
  TTS_BALLOON = $40;
  TTM_SETTITLE = (WM_USER + 32);
  //////////////////////////////

var
  FrmFluxoFornecedor: TFrmFluxoFornecedor;

  IBQ_ConsultaFilial: TIBQuery;
  TD : TTransactionDesc; // Ponteiro de Transação

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  bgVoltaPerReducao, // Se Deve Fechar Ts_FluxFornManutReducao Automatico
  bgSairFF, bgExcluiFF: Boolean;

  sgDtaMinCC, // Menor Data do Conta Correte para Recalculo do Fornecedor
  OrderGrid   // Ordenar Grid
  : String;

  bgSoObs,     // Alterar Somente Observação no Lancamento
  bgPodeUsar, // Se Usuario Pode Usar Eventos
  bgAtualizaDireto
  : Boolean;

  // Lançamentos
  igTabSheet,  // Qual TabSheet.TabIndex Chamou o Grafico
  igFornPosicao: Integer; // Guarda a Posição do Ultimo Fornecedor


  sgDMLMovto, // (N)Novo Fornecedor (I)Incluir Movto (A)Alterar Movto ()Pesquisa
  sgNum_SeqCC // Usado no Lançamento para Guardar a Sequencia do Dia do Fornecedor
  : String;
  // sgDtaDoc -> FrmBelShop // Usado no Lançamento para Guardar Data de Inicio de ReCalculo do Fornecedor

implementation

uses DK_Procs1, UDMBelShop, UDMConexoes, UDMVirtual, UFrmBelShop, DB, UPesquisa,
     UFrmSelectEmpProcessamento, UFrmSolicitacoes, UDMRelatorio, DBClient,
  SysConst;

{$R *.dfm}

//==============================================================================
// ODIR - INICIO ===============================================================
//==============================================================================

// Manuteção no Percentual de Acrescimos no Valor da Campanha - COLEÇÃO >>>>>>>>
Function TFrmFluxoFornecedor.FornPercAcrescCampanhas(bIncluir: Boolean): Boolean;
Var
  MySql: String;
Begin
  Result:=True;

  OdirPanApres.Caption:='AGUARDE !! Salvando Fornecedor...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmFluxoFornecedor;
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
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Altera/Inclui Lançamento ================================================
    // 30 => CONTA CORRENTE DE FORNECEDORES
    //       - COMISSÕES POR CAMPANHAS <COLEÇÃO>: Percentuais de Acrescimos na Cobrança
    //         - COD_AUX  = Código do Fornecedor Linx
    //         - DES_AUX  = Código do Usuário
    //         - DES_AUX1 = Data da Inclusão
    //         - VLR_AUX  = Percentual de Acrescimo
    //         - VLR_AUX1 = Se Lançamento Ativo (0=NÃO 1=SIM)
    If bIncluir Then
    Begin
      MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR'+
             ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
             ' VALUES('+
             '30, '+ // TIP_AUX
             IntToStr(EdtFornAcrescCampCodForn.AsInteger)+', '+ // COD_AUX  = Código do Fornecedor Linx
             QuotedStr(Cod_Usuario)+', '+ // DES_AUX  = Código do Usuário
             QuotedStr(Trim(EdtFornAcrescCampOBS.Text))+', '+ // DES_AUX1 = Observações
             QuotedStr(f_Troca(',','.',VarToStr(EdtFornAcrescCampPercentual.Value)))+', '+ // VLR_AUX  = Percentual de Acrescimo
             'NULL)'+
             ' MATCHING (TIP_AUX, COD_AUX)';
    End; // If bIncluir Then

    If Not bIncluir Then
    Begin
      MySql:=' DELETE FROM TAB_AUXILIAR t'+
             ' WHERE t.tip_aux=30'+
             ' AND   t.cod_aux='+DMBelShop.CDS_Join.FieldByName('Cod_Fornecedor').AsString;
    End; // If bIncluir Then
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);
      Result:=False;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação

  DateSeparator:='/';
  DecimalSeparator:=',';

  OdirPanApres.Visible:=False;

  Screen.Cursor:=crDefault;

End; // Manuteção no Percentual de Acrescimos no Valor da Campanha - COLEÇÃO >>>

// Cria Lançamento de Abertura em Caso de Vinculo de Fornecedor Novo >>>>>>>>>>>
Procedure TFrmFluxoFornecedor.CriaLancamentoAbertura;
Var
  MySql: String;
  sDtaInicioLinx: String;

  Procedure CriaLancamento(sCodigo, sNome: String);
  Var
    bCria: Boolean;

    sNumSeq,
    sCodHist, sDebCre, sObs,
    sCodFornSID: String;

    i: Integer;
  Begin
    MySql:=' SELECT f.cod_vinculado'+
           ' FROM FL_CAIXA_FORNECEDORES f'+
           ' WHERE f.cod_vinculado='+sCodigo;
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    bCria:=(Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Vinculado').AsString)='');
    DMBelShop.CDS_BuscaRapida.Close;

    If bCria Then
    Begin
      // Busca Código Fornecedor SIDICOM =========================================
      MySql:=' SELECT fs.codfornecedor'+
             ' FROM FORNECEDOR fs'+
             ' WHERE EXISTS (SELECT 1'+
             '               FROM  LINXCLIENTESFORNEC fl'+
             '               WHERE REPLACE(REPLACE(REPLACE(TRIM(fl.doc_cliente), ''/'', ''''),''.'',''''),''-'','''')='+
             '                     REPLACE(REPLACE(REPLACE(TRIM(fs.numerocgcmf), ''/'', ''''),''.'',''''),''-'','''')'+
             '               AND   fl.cod_cliente='+sCodigo+')';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      sCodFornSID:='0';
      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodFornecedor').AsString)<>'' Then
       sCodFornSID:=DMBelShop.CDS_BuscaRapida.FieldByName('CodFornecedor').AsString;
      DMBelShop.CDS_BuscaRapida.Close;

      // Insere Lancamento de Abertura Débito e Crédito ========================
      bCria:=True;
      i:=0;
      While bCria do
      Begin
        Inc(i);

        If i=1 Then
         Begin
           sNumSeq:='1';
           sCodHist:='900';
           sDebCre:='D';
           sObs:='Lançamento de Abertura de Conta Corrente (Débito)';
         End
        Else
         Begin
           sNumSeq:='2';
           sCodHist:='955';
           sDebCre:='C';
           sObs:='Lançamento de Abertura de Conta Corrente (Crédito)';
         End;

        MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES'+
               ' (COD_FORNECEDOR, DES_FORNECEDOR, COD_VINCULADO, DES_VINCULADO,'+
               '  VLR_ORIGEM, DTA_ORIGEM, DTA_CAIXA,'+
               '  NUM_SEQ, NUM_CHAVENF, COD_EMPRESA, COD_HISTORICO, TXT_OBS,'+
               '  NUM_DOCUMENTO, NUM_SERIE, PER_REDUCAO, TIP_DEBCRE, VLR_CAIXA,'+
               '  VLR_SALDO, CODFORNECEDOR, COD_LOJA_LINX, COD_LOJA_SIDICOM)'+

               ' VALUES ('+
               sCodigo+', '+ // COD_FORNECEDOR
               QuotedStr(sNome)+', '+ // DES_FORNECEDOR
               sCodigo+', '+ // COD_VINCULADO
               QuotedStr(sNome)+', '+ // DES_VINCULADO
               ' 0.01, '+ // VLR_ORIGEM de Abertura
               QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicioLinx)))+', '+ // DTA_ORIGEM de Inicio Linx
               QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicioLinx)))+', '+ // DTA_CAIXA de Inicio Linx
               sNumSeq+', '+ // NUM_SEQ
               'NULL, '+ // NUM_CHAVENF
               '2 , '+ // COD_EMPRESA
               sCodHist+', '+ // COD_HISTORICO - (900 - CONTA CORRENTE (D)) (955 - REEMBOLSO FIN FORN (C))
               QuotedStr(sObs)+', '+ // TXT_OBS
               QuotedStr('999999')+', '+ // NUM_DOCUMENTO
               ' NULL, '+ // NUM_SERIE
               '0.00, '+ // PER_REDUCAO
               QuotedStr(sDebCre)+', '+ // TIP_DEBCRE
               '0.01 , '+ // VLR_CAIXA
               '0.00 , '+ // VLR_SALDO
               QuotedStr(sCodFornSID)+', '+ // CODFORNECEDOR
               '2, '+ // COD_LOJA_LINX
               QuotedStr('99')+')'; // COD_LOJA_SIDICOM
        DMBelShop.SQLC.Execute(MySql, nil, nil);

        If i=2 Then
         Break;
      End; // While bCria do

    End; // If bCria Then
  End; // Procedure CriaLancamento(sCodigo, sNome: String);
Begin
  // Pega Data de Inicio do Linx =============================================
  MySql:=' SELECT Min(e.dta_inicio_linx) Dta_inicio'+
         ' FROM EMP_CONEXOES e';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sDtaInicioLinx:=DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Inicio').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  //==========================================================================
  //  Processa os Incluídos IND_SITUACAO='I' =================================
  //==========================================================================
  DMBelShop.CDS_FluxoFornVinculo.First;
  While Not DMBelShop.CDS_FluxoFornVinculo.Eof do
  Begin
    // VINCULO.IND_SITUACAO='N' Ou 'I' =======================================
    If (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='N') Or (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='I') Then
    Begin
      // Novos Lancamento de Abertura Fornecedor Vinculo
      If DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='I' Then
      Begin
        CriaLancamento(DMBelShop.CDS_FluxoFornVinculoCOD_FORNECEDOR.AsString, DMBelShop.CDS_FluxoFornVinculoDES_FORNECEDOR.AsString);
      End; // If DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='I' Then

      // Novos Lancamento de Abertura Fornecedor Vinculados
      DMBelShop.CDS_FluxoFornVinculados.First;
      While Not DMBelShop.CDS_FluxoFornVinculados.Eof do
      Begin
        If DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString='I' Then
        Begin
          CriaLancamento(DMBelShop.CDS_FluxoFornVinculadosCOD_VINCULADO.AsString, DMBelShop.CDS_FluxoFornVinculadosDES_VINCULADO.AsString);
        End; // If DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString='I' Then

        DMBelShop.CDS_FluxoFornVinculados.Next;
      End; // While Not DMBelShop.CDS_FluxoFornVinculados.Eof do
      DMBelShop.CDS_FluxoFornVinculados.First;

    End; // If (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='N') Or (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='I') Then
 
    DMBelShop.CDS_FluxoFornVinculo.Next;
  End; // While Not DMBelShop.CDS_FluxoFornVinculo.Eof do
  DMBelShop.CDS_FluxoFornVinculo.First;
  //  Processa os Incluídos IND_SITUACAO='I' =================================
  //==========================================================================

End; // Cria Lançamento de Abertura em Caso de Vinculo de Fornecedor Novo >>>>>>

// FORNECEDORES VINCULADOS - Atualiza Vinculos dos Fornecedore >>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.FornVincAtualizaVinculos;
Var
  MySql: String;
  mMemo: TMemo;
  i: Integer;
  bProc: Boolean;

  Procedure AdicionaCodForn(sCodVinc: String);
  Var
    bEncontrou: Boolean;
    i: Integer;
  Begin
    bEncontrou:=False;
    For i:=0 to mMemo.Lines.Count-1 do
    Begin
      If mMemo.Lines[i]=sCodVinc Then
      Begin
        bEncontrou:=True;
      End;
    End; // For i:=0 to mMemo.Lines.Count-1 do

    If Not bEncontrou Then
     mMemo.Lines.Add(sCodVinc);
  End;

Begin
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

    // Cria Componente Memo ======================================================
    mMemo:=TMemo.Create(Self);
    mMemo.Visible:=False;
    mMemo.Parent:=FrmFluxoFornecedor;
    mMemo.Width:=500;
    mMemo.Lines.Clear;

    //==========================================================================
    //  Processa os Excluídos IND_SITUACAO='E' =================================
    //==========================================================================
    OdirPanApres.Caption:='AGUARDE !! Fase 1/2 - Excluindo Vínculos de Fornecedores...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmFluxoFornecedor;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;

    //==========================================================================
    // Cria Lançamento de Abertura de Conta Corrente ===========================
    //==========================================================================
    CriaLancamentoAbertura;
    // Cria Lançamento de Abertura de Conta Corrente ===========================
    //==========================================================================
    FrmBelShop.MontaProgressBar(True, FrmFluxoFornecedor);
    pgProgBar.Properties.Max:=DMBelShop.CDS_FluxoFornVinculo.RecordCount;
    pgProgBar.Position:=0;

    DMBelShop.CDS_FluxoFornVinculo.First;
    While Not DMBelShop.CDS_FluxoFornVinculo.Eof do
    Begin
      Application.ProcessMessages;

      // VINCULO.IND_SITUACAO='E' ==============================================
      If DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='E' Then
      Begin
        // Retorna Todos Vinculados para Não Vinculados
        DMBelShop.CDS_FluxoFornVinculados.First;
        While Not DMBelShop.CDS_FluxoFornVinculados.Eof do
        Begin
          // Retira os Vinculos
          MySql:=' UPDATE FL_CAIXA_FORNECEDORES f'+
                 ' SET f.cod_fornecedor=f.cod_vinculado,'+
                 '     f.des_fornecedor=f.des_vinculado,'+
                 '     f.num_seq=(SELECT COALESCE(MAX(ff.num_seq)+1,1)'+
                 '                FROM FL_CAIXA_FORNECEDORES ff'+
                 '                WHERE ff.num_seq NOT IN (0, 999999)'+
                 '                AND   ff.cod_fornecedor=f.cod_vinculado'+
                 '                AND   ff.dta_caixa=f.dta_caixa)'+

                 ' WHERE f.num_seq not in (0, 999999)'+
                 ' AND   f.cod_vinculado='+Trim(DMBelShop.CDS_FluxoFornVinculadosCOD_VINCULADO.AsString);
          DMBelShop.SQLC.Execute(MySql,nil,nil);

          // Guardar Codigo Para Calculo do Conta Corrente
          AdicionaCodForn(Trim(DMBelShop.CDS_FluxoFornVinculoCOD_FORNECEDOR.AsString));
          AdicionaCodForn(Trim(DMBelShop.CDS_FluxoFornVinculadosCOD_VINCULADO.AsString));

          DMBelShop.CDS_FluxoFornVinculados.Next;
        End; // While Not DMBelShop.CDS_FluxoFornVinculados.Eof do
      End; // If DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='E' Then

      // VINCULO.IND_SITUACAO='N' ==============================================
      If DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='N' Then
      Begin
        // Retorna Todos Vinculados para Não Vinculados
        DMBelShop.CDS_FluxoFornVinculados.First;
        While Not DMBelShop.CDS_FluxoFornVinculados.Eof do
        Begin
          If DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString='E' Then
          Begin
            // Retira os Vinculos
            MySql:=' UPDATE FL_CAIXA_FORNECEDORES f'+
                   ' SET f.cod_fornecedor=f.cod_vinculado,'+ // --> Fornecedor Vinculado a Tira Vinculo
                   '     f.des_fornecedor=f.des_vinculado,'+
                   '     f.num_seq=(SELECT COALESCE(MAX(ff.num_seq)+1,1)'+
                   '                FROM FL_CAIXA_FORNECEDORES ff'+
                   '                WHERE ff.num_seq NOT IN (0, 999999)'+
                   '                AND   ff.cod_fornecedor=f.cod_vinculado'+ // --> Fornecedor Vinculado a Tira Vinculo
                   '                AND   ff.dta_caixa=f.dta_caixa)'+

                   ' WHERE f.num_seq not in (0, 999999)'+
                   ' AND   f.cod_vinculado='+Trim(DMBelShop.CDS_FluxoFornVinculadosCOD_VINCULADO.AsString); // --> Fornecedor Vinculado a Tira Vinculo
            DMBelShop.SQLC.Execute(MySql,nil,nil);

            // Guardar Codigo Para Calculo do Conta Corrente
            AdicionaCodForn(Trim(DMBelShop.CDS_FluxoFornVinculoCOD_FORNECEDOR.AsString));
            AdicionaCodForn(Trim(DMBelShop.CDS_FluxoFornVinculadosCOD_VINCULADO.AsString));
          End; // If DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString='E' Then

          DMBelShop.CDS_FluxoFornVinculados.Next;
        End; // While Not DMBelShop.CDS_FluxoFornVinculados.Eof do
      End; // If DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='N' Then

      pgProgBar.Position:=DMBelShop.CDS_FluxoFornVinculo.RecNo;

      DMBelShop.CDS_FluxoFornVinculo.Next;
    End; // While Not DMBelShop.CDS_FluxoFornVinculo.Eof do
    FrmBelShop.MontaProgressBar(False, FrmFluxoFornecedor);
    //  Processa os Excluídos IND_SITUACAO='E' =================================
    //==========================================================================

    //==========================================================================
    //  Processa os Incluídos IND_SITUACAO='I' =================================
    //==========================================================================
    OdirPanApres.Caption:='AGUARDE !! Fase 2/2 - Incluindo Novos Vínculos de Fornecedores.. ';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmFluxoFornecedor;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;

    FrmBelShop.MontaProgressBar(True, FrmFluxoFornecedor);
    pgProgBar.Properties.Max:=DMBelShop.CDS_FluxoFornVinculo.RecordCount;
    pgProgBar.Position:=0;

    DMBelShop.CDS_FluxoFornVinculo.First;
    While Not DMBelShop.CDS_FluxoFornVinculo.Eof do
    Begin
      Application.ProcessMessages;

      // VINCULO.IND_SITUACAO='N' Ou 'I' =======================================
      If (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='N') Or (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='I') Then
      Begin
        // Insere Novos Vinculos
        DMBelShop.CDS_FluxoFornVinculados.First;
        While Not DMBelShop.CDS_FluxoFornVinculados.Eof do
        Begin
          If DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString='I' Then
          Begin
            // Retira os Vinculos
            MySql:=' UPDATE FL_CAIXA_FORNECEDORES f'+
                   ' SET f.cod_fornecedor='+DMBelShop.CDS_FluxoFornVinculoCOD_FORNECEDOR.AsString+','+ // --> Novo Fornecedor de Vinculo
                   '     f.des_fornecedor='+QuotedStr(DMBelShop.CDS_FluxoFornVinculoDES_FORNECEDOR.AsString)+','+
                   '     f.num_seq=(SELECT COALESCE(MAX(ff.num_seq)+1,1)'+
                   '                FROM FL_CAIXA_FORNECEDORES ff'+
                   '                WHERE ff.num_seq not in (0, 999999)'+
                   '                AND   ff.cod_fornecedor='+DMBelShop.CDS_FluxoFornVinculoCOD_FORNECEDOR.AsString+ // --> Novo Fornecedor de Vinculo
                   '                AND   ff.dta_caixa=f.dta_caixa)'+
                   ' WHERE f.num_seq not in (0, 999999)'+
                   ' AND   f.cod_vinculado='+Trim(DMBelShop.CDS_FluxoFornVinculadosCOD_VINCULADO.AsString); // --> Fornecedor a Vincular
            DMBelShop.SQLC.Execute(MySql,nil,nil);

            // Exclui registros de Saldo Inicial e Final
            MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES f'+
                   ' WHERE f.cod_fornecedor='+Trim(DMBelShop.CDS_FluxoFornVinculadosCOD_VINCULADO.AsString)+
                   ' AND (f.num_seq=0 OR f.num_seq=999999)';
            DMBelShop.SQLC.Execute(MySql,nil,nil);

            // Codigo Para Calculo do Conta Corrente
            AdicionaCodForn(Trim(DMBelShop.CDS_FluxoFornVinculoCOD_FORNECEDOR.AsString));
            // AdicionaCodForn(Trim(DMBelShop.CDS_FluxoFornVinculadosCOD_VINCULADO.AsString));
          End; // If DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString='I' Then

          DMBelShop.CDS_FluxoFornVinculados.Next;
        End; // While Not DMBelShop.CDS_FluxoFornVinculados.Eof do
      End; // If (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='N') Or (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='I') Then

      pgProgBar.Position:=DMBelShop.CDS_FluxoFornVinculo.RecNo;

      DMBelShop.CDS_FluxoFornVinculo.Next;
    End; // While Not DMBelShop.CDS_FluxoFornVinculo.Eof do
    //  Processa os Incluídos IND_SITUACAO='I' =================================
    //==========================================================================

    FrmBelShop.MontaProgressBar(False, FrmFluxoFornecedor);

    // Acerta Nome dos Fornecedores ============================================
    MySql:=' UPDATE FL_CAIXA_FORNECEDORES f'+
           ' SET f.des_fornecedor=(SELECT'+
           '                       CASE'+
           '                          WHEN TRIM(COALESCE(fl.nome_cliente,''''))<>'''' THEN'+
           '                            TRIM(fl.nome_cliente)'+
           '                          ELSE'+
           '                            TRIM(fl.razao_cliente)'+
           '                       END'+
           '                       FROM LINXCLIENTESFORNEC fl'+
           '                       WHERE fl.cod_cliente=f.cod_fornecedor)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    MySql:=' UPDATE FL_CAIXA_FORNECEDORES f'+
           ' SET f.des_vinculado=(SELECT'+
           '                      CASE'+
           '                         WHEN TRIM(COALESCE(fl.nome_cliente,''''))<>'''' THEN'+
           '                           TRIM(fl.nome_cliente)'+
           '                         ELSE'+
           '                           TRIM(fl.razao_cliente)'+
           '                      END'+
           '                      FROM LINXCLIENTESFORNEC fl'+
           '                      WHERE fl.cod_cliente=f.cod_vinculado)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);
    bgAltVinculos:=False;

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;

    DMBelShop.CDS_FluxoFornVinculo.First;

    bProc:=True;
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      FrmBelShop.MontaProgressBar(False, FrmFluxoFornecedor);
      Screen.Cursor:=crDefault;

      DMBelShop.CDS_FluxoFornVinculo.First;
      bProc:=False;

      MessageBox(Handle, pChar('Erro: '+OdirPanApres.Caption+cr+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação

  If Not bProc Then
   Exit;

  // Recalcula Conta Corrente do Fornecedores Envolvidos nas Alterações ========
  For i:=0 to mMemo.Lines.Count-1 do
  Begin
    If Trim(mMemo.Lines[i])<>'' Then
     EdtFluFornCodFornAcertar.Text:=Trim(mMemo.Lines[i]);

    bgAtualizaDireto:=True;            //
    Bt_FluFornAcertaSaldosClick(Self); //<<<==== Atualiza Saldos do Fornecedor
  End; // For i:=0 to mMemo.Lines.Count-1 do
  FreeAndNil(mMemo);

  DMBelShop.CDS_FluxoFornVinculo.Close;
  DMBelShop.CDS_FluxoFornVinculados.Close;

  DMBelShop.CDS_FluxoFornecedores.DisableControls;
  DMBelShop.CDS_FluxoFornecedores.Close;
  DMBelShop.CDS_FluxoFornecedores.Open;
  DMBelShop.CDS_FluxoFornecedores.Last;
  DMBelShop.CDS_FluxoFornecedores.First;
  DMBelShop.CDS_FluxoFornecedores.EnableControls;

  msg('Atualizações de Vínculos de'+cr+cr+'Fornecedores Efetudas com SUCESSO !!','A');

  // Retorna
  Ts_FluxFornApres.TabVisible :=True;
  Ts_FluxFornCaixa.TabVisible :=True;
  Ts_FluxFornLanctos.TabVisible:=False;
  Ts_FluxFornVinculos.TabVisible:=False;
  Ts_FluxFornPercCampanhas.TabVisible:=False;

  igTabSheet:=0;
  PC_Principal.TabIndex:=igTabSheet;
  PC_PrincipalChange(Self);

End; // FORNECEDORES VINCULADOS - Atualiza Vinculos dos Fornecedore >>>>>>>>>>>>

// FORNECEDORES VINCULADOS - Acerta os Codigo Vinculados = null >>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.AcertaCodVinculado;
Var
  MySql: String;
Begin
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\\
  //>>>>>>>>>>>>>>>> No Inicio do FrmFluxFornecedor >>>>>>>>>\\
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\\

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

    MySql:=' UPDATE FL_CAIXA_FORNECEDORES f'+
           ' SET f.cod_vinculado=f.cod_fornecedor'+
           ' , f.des_vinculado=f.des_fornecedor'+
           ' WHERE f.cod_vinculado IS NULL'+
           ' AND   f.num_seq NOT IN (0,999999)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação

End; // FORNECEDORES VINCULADOS - Acerta os Codigo Vinculados = null >>>>>>>>>>>

// Carrega ComboBox com Fornecedor Vinculados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.CarregaComboBoxFornecedorVinculados(sFornVinculo: String);
Var
  MySql: String;
Begin
  MySql:=' SELECT DISTINCT f.cod_vinculado||''-''||f.des_vinculado Forn_Vinc'+
         ' FROM fl_caixa_fornecedores f'+
         ' WHERE f.num_seq<>0'+
         ' AND   f.num_seq<>999999'+
         ' AND   f.cod_fornecedor='+sFornVinculo+
         ' AND   f.cod_vinculado<>'+sFornVinculo;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  Cbx_FornVinculado.Items.Clear;
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    If Cbx_FornVinculado.Items.Count<1 Then
     Cbx_FornVinculado.Items.Add('');

    Cbx_FornVinculado.Items.Add(DMBelShop.CDS_BuscaRapida.FieldByName('Forn_Vinc').AsString);

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.Close;
End; // Carrega ComboBox com Fornecedor Vinculados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Salva Lançamentos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function  TFrmFluxoFornecedor.SalvaLancamentos: Boolean;
Var
  MySql: String;

  i: Integer;

  sCodFornVinculado, sDesFornVinculado,
  sNumSeqCC, // Num_Seq do Dia do Caixa a Usar
  sDebCre, sCodFornSIDICOM, sCodLojaSIDICOM,
  sUsu_Inclui, sDta_Inclui, sUsu_Altera: String;

  bBuscaNumSeq: Boolean;
Begin

  Result:=False;

  OdirPanApres.Caption:='AGUARDE !! Salvando Conta Corrente...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmFluxoFornecedor;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  sCodFornVinculado:='';
  sDesFornVinculado:='';
  sUsu_Inclui:='';
  sDta_Inclui:='';
  sUsu_Altera:='';

  sCodFornVinculado:=IntToStr(EdtFluFornCodFornecedor.AsInteger);
  sDesFornVinculado:=EdtFluFornFornecedor.Text;
  If (Gb_FornVinculado.Visible) And (Trim(Cbx_FornVinculado.Text)<>'') Then
  Begin
    i:=pos('-',Cbx_FornVinculado.Text);

    sCodFornVinculado:=Trim(Copy(Cbx_FornVinculado.Text,1,i-1));
    sDesFornVinculado:=Trim(Copy(Cbx_FornVinculado.Text,i+1,Length(Cbx_FornVinculado.Text)));
  End; // If (Gb_FornVinculado.Visible) And (Trim(Cbx_FornVinculado.Text)<.'') Then

  // Acerta Data para Processamento do Conta Corrente ==========================
  If Trim(sgDtaDoc)='' Then
   sgDtaDoc:=DateToStr(EdtDtCaixaDoc.Date);

  If StrToDate(sgDtaDoc)>StrToDate(DateToStr(EdtDtCaixaDoc.Date)) Then
   sgDtaDoc:=DateToStr(EdtDtCaixaDoc.Date);

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

    // (Inclusão/Novo) Busca do Num_Seq do Caixa ===============================
    bBuscaNumSeq:=False;
    If (sgDMLMovto='I') Or (sgDMLMovto='N')Then
    Begin
      bBuscaNumSeq:=True;

      // Usuario que Incluiu ----------------------------------------
      sUsu_Inclui:=Cod_Usuario;
      sDta_Inclui:='';
      sUsu_Altera:=Cod_Usuario;
    End; // If (sgDMLMovto='I') Or (sgDMLMovto='N')Then

    // (Alteração) Busca do Num_Seq do Caixa ===================================
    If sgDMLMovto='A' Then
    Begin
      sNumSeqCC:=sgNum_SeqCC;

      If StrToDate(DateToStr(DMBelShop.CDS_FluxoFornecedorDATA.AsDateTime))<>StrToDate(DateToStr(EdtDtCaixaDoc.Date)) Then
      Begin
        bBuscaNumSeq:=True;
      End;

      // Usuario que Alterou ----------------------------------------
      sUsu_Inclui:=IntToStr(DMBelShop.CDS_FluxoFornecedorUSU_INCLUI.AsInteger);
      sDta_Inclui:=DMBelShop.CDS_FluxoFornecedorDTA_INCLUI.AsString;
      sUsu_Altera:=Cod_Usuario;

      // Exclui Lançamento a Ser Alterado ======================================
      MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES f'+
             ' WHERE f.cod_fornecedor='+IntToStr(DMBelShop.CDS_FluxoFornecedorCOD_FORNECEDOR.AsInteger)+
             ' AND   f.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DMBelShop.CDS_FluxoFornecedorDATA.AsDateTime))))+
             ' AND   f.num_seq='+IntToStr(DMBelShop.CDS_FluxoFornecedorNUM_SEQ.AsInteger);
      DMBelShop.SQLC.Execute(MySql, nil, nil);
    End; // If sgDMLMovto='A' Then

    If bBuscaNumSeq Then
    Begin
      MySql:=' SELECT coalesce(max(cf.num_seq)+1 ,1) Num_Seq'+
             ' FROM FL_CAIXA_FORNECEDORES cf'+
             ' WHERE cf.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(EdtDtCaixaDoc.Date))))+
             ' AND   cf.cod_fornecedor='+IntToStr(EdtFluFornCodFornecedor.AsInteger)+
             ' AND   cf.num_seq>0'+
             ' AND   cf.num_seq<999999';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      sNumSeqCC:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString);
      DMBelShop.CDS_BuscaRapida.Close;
    End; // If bBuscaNumSeq Then

    // Guarda se Debito / Credito ==============================================
    sDebCre:=Copy(EdtDebCreDoc.Text,1,1);

    // Busca Código Fornecedor SIDICOM =========================================
    MySql:=' SELECT fs.codfornecedor'+
           ' FROM FORNECEDOR fs'+
           ' WHERE EXISTS (SELECT 1'+
           '               FROM  LINXCLIENTESFORNEC fl'+
           '               WHERE REPLACE(REPLACE(REPLACE(TRIM(fl.doc_cliente), ''/'', ''''),''.'',''''),''-'','''')='+
           '                     REPLACE(REPLACE(REPLACE(TRIM(fs.numerocgcmf), ''/'', ''''),''.'',''''),''-'','''')'+
           '               AND   fl.cod_cliente='+IntToStr(EdtFluFornCodFornecedor.AsInteger)+')';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sCodFornSIDICOM:='0';
    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodFornecedor').AsString)<>'' Then
     sCodFornSIDICOM:=DMBelShop.CDS_BuscaRapida.FieldByName('CodFornecedor').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    // Busca Loja SIDICOM ======================================================
    sCodLojaSIDICOM:='99';
    If EdtCodLojaDoc.AsInteger<>2 Then // 2 = BelShop CD
    Begin
      MySql:=' SELECT e.cod_filial'+
             ' FROM EMP_CONEXOES e'+
             ' WHERE e.cod_linx='+IntToStr(EdtCodLojaDoc.AsInteger);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString)<>'' Then
       sCodLojaSIDICOM:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Filial').AsString;
      DMBelShop.CDS_BuscaRapida.Close;
    End; // If EdtCodLojaDoc.AsInteger<>2 Then // 2 = BelShop CD

    //==========================================================================
    // Insere Novo Lançamento do Conta Correto =================================
    //==========================================================================
    MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES'+
           ' (COD_FORNECEDOR, DES_FORNECEDOR, COD_VINCULADO, DES_VINCULADO,'+
           '  VLR_ORIGEM, DTA_ORIGEM, DTA_CAIXA,'+
           '  NUM_SEQ, NUM_CHAVENF, COD_EMPRESA, COD_HISTORICO, TXT_OBS,'+
           '  NUM_DOCUMENTO, NUM_SERIE, PER_REDUCAO, TIP_DEBCRE, VLR_CAIXA,'+
           '  VLR_SALDO, CODFORNECEDOR, COD_LOJA_LINX, COD_LOJA_SIDICOM,'+
           '  USU_INCLUI, DTA_INCLUI, USU_ALTERA, DTA_ALTERA)'+

           ' VALUES ('+
           IntToStr(EdtFluFornCodFornecedor.AsInteger)+', '+ // COD_FORNECEDOR
           QuotedStr(EdtFluFornFornecedor.Text)+', '+ // DES_FORNECEDOR
           sCodFornVinculado+', '+ // COD_VINCULADO
           QuotedStr(sDesFornVinculado)+', '+ // DES_VINCULADO
           f_Troca(',','.',VarToStr(EdtValorDoc.Value))+', '+ // VLR_ORIGEM
           QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(EdtDtOrigemDoc.Date))))+', '+ // DTA_ORIGEM
           QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(EdtDtCaixaDoc.Date))))+', '+ // DTA_CAIXA
           sNumSeqCC+', '+ // NUM_SEQ
           'NULL, '+ // NUM_CHAVENF
           IntToStr(EdtCodLojaDoc.AsInteger)+', '+ // COD_EMPRESA
           IntToStr(EdtCodHistDoc.AsInteger)+', '+ // COD_HISTORICO
           QuotedStr(EdtObsDoc.Text)+', '+ // TXT_OBS
           QuotedStr(EdtNumDoc.Text)+', '+ // NUM_DOCUMENTO
           QuotedStr(EdtSerieDoc.Text)+', '+ // NUM_SERIE
           '0.00, '+ // PER_REDUCAO
           QuotedStr(sDebCre)+', '+ // TIP_DEBCRE
           f_Troca(',','.',VarToStr(EdtValorDoc.Value))+', '+ // VLR_CAIXA
           '0.00 , '+ // VLR_SALDO
           QuotedStr(sCodFornSIDICOM)+', '+ // CODFORNECEDOR
           IntToStr(EdtCodLojaDoc.AsInteger)+', '+ // COD_LOJA_LINX
           QuotedStr(sCodLojaSIDICOM)+', '+ // COD_LOJA_SIDICOM
           sUsu_Inclui+', '; // USU_INCLUI

           // DTA_INCLUI
           If Trim(sDta_Inclui)='' Then
            MySql:=
             MySql+'current_timestamp, '
           Else
            MySql:=
             MySql+QuotedStr(sDta_Inclui)+', ';

    MySql:=
     MySql+sUsu_Altera+', '+ // USU_ALTERA
           'current_timestamp)'; // DTA_ALTERA
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    // UPDATE nos Nomes do Fornecedor ==========================================
    MySql:=' UPDATE FL_CAIXA_FORNECEDORES ff'+
           ' SET ff.des_fornecedor=(SELECT fl.nome_cliente'+
           '                        FROM LINXCLIENTESFORNEC fl'+
           '                        WHERE fl.cod_cliente=ff.cod_fornecedor)'+
           ' WHERE ff.cod_fornecedor='+IntToStr(EdtFluFornCodFornecedor.AsInteger);
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    MySql:=' UPDATE FL_CAIXA_FORNECEDORES ff'+
           ' SET ff.des_vinculado=(SELECT fl.nome_cliente'+
           '                       FROM LINXCLIENTESFORNEC fl'+
           '                       WHERE fl.cod_cliente=ff.cod_vinculado)'+
           ' WHERE ff.cod_fornecedor='+IntToStr(EdtFluFornCodFornecedor.AsInteger);
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    // Acerta Data da Ultima Negociação ========================================
    MySql:=' SELECT min(f.dta_caixa) Data'+
           ' FROM FL_CAIXA_FORNECEDORES f'+
           ' WHERE f.cod_historico=900'+
           ' AND   f.cod_fornecedor='+IntToStr(EdtFluFornCodFornecedor.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR'+
           ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
           ' VALUES ('+
           ' 14, '+ // TIP_AUX - Data de Início de Apresentação do Conta Correte do Fornecedor
           IntToStr(EdtFluFornCodFornecedor.AsInteger)+', '+ // COD_AUX - Código do Fornecedor
           ' (SELECT Trim(t.des_aux)'+
           '  FROM TAB_AUXILIAR t'+
           '  WHERE t.tip_aux=14'+ // Data de Início de Apresentação do Conta Correte do Fornecedor
           '  AND t.cod_aux='+IntToStr(EdtFluFornCodFornecedor.AsInteger)+')'+', '+ // DES_AUX - Data Conta Corrente
           QuotedStr(f_Troca('/','.',f_Troca('-','.',Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Data').AsString))))+', '+ // DES_AUX1 - Data da 1ª Negociação
           ' NULL, '+ // VLR_AUX
           ' NULL)'+ // VLR_AUX1

           ' MATCHING (TIP_AUX, COD_AUX)';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;

    Result:=True;

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação
End; // Salva Lançamentos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Consiste Lançamentos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function  TFrmFluxoFornecedor.ConsisteLancamentos:Boolean;
Begin
  Result:=False;

  // EdtNumDoc =================================================================
  Try
    If StrToInt(EdtNumDoc.Text)=0 Then
    Begin
      msg('Número do Docto Inválido !!','A');
      EdtNumDoc.SetFocus;
      Exit;
    End;
  Except
    msg('Número do Docto Inválido !!','A');
    EdtNumDoc.SetFocus;
    Exit;
  End;

  // EdtSerieDoc ===============================================================
  If Trim(EdtSerieDoc.Text)='' Then
  Begin
    msg('Série do Docto Inválida !!','A');
    EdtSerieDoc.SetFocus;
    Exit;
  End;

  // Datas =====================================================================
  If StrToDate(DateToStr(EdtDtCaixaDoc.Date))<StrToDate(DateToStr(EdtDtOrigemDoc.Date)) Then
  Begin
    msg('Data do Caixa NÃO Pode Ser'+cr+cr+'Menor que a Data de Origem !!','A');
    EdtDtOrigemDoc.SetFocus;
    Exit;
  End;

  // EdtCodLojaDoc =============================================================
  If (EdtValorDoc.Value=0) Or (EdtValorDoc.Value<0) Then
  Begin
    msg('Valor Inválido !!','A');
    EdtValorDoc.SetFocus;
    Exit;
  End;

  // EdtCodLojaDoc =============================================================
  If EdtCodLojaDoc.AsInteger=0 Then
  Begin
    msg('Favor Informar a Loja (Linx) !!','A');
    EdtCodLojaDoc.SetFocus;
    Exit;
  End;

  // EdtCodHistDoc =============================================================
  If EdtCodHistDoc.AsInteger=0 Then
  Begin
    msg('Favor Informar o Histórico !!','A');
    EdtCodHistDoc.SetFocus;
    Exit;
  End;

  // EdtObsDoc =================================================================
  If Trim(EdtObsDoc.Text)='' Then
  Begin
    msg('Favor Informar o PORQUE deste'+cr+cr+'Lançamento na Observação !!','A');
    EdtObsDoc.SetFocus;
    Exit;
  End;

  If Gb_FornVinculado.Visible Then
  Begin
    sgMensagem:=Cbx_FornVinculado.Text;
    If Trim(sgMensagem)='' Then
     sgMensagem:=EdtFluFornFornecedor.Text;

    If msg('O Fornecedor '+cr+sgMensagem+cr+cr+'Vinculado a Este Lançamento !!'+cr+'ESTA CORRETO ??','C')=2 Then
    Begin
      sgMensagem:='';
      Cbx_FornVinculado.SetFocus;
      Exit;
    End;
    sgMensagem:='';
  End; // If Gb_FornVinculado.Visible Then

  Result:=True;
End; // Consiste Lançamentos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpas Componentes de Lancamentos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.LimpaLancamentos;
Begin
  EdtDtOrigemDoc.Date:=StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)));
  EdtDtCaixaDoc.Date :=StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)));
  EdtValorDoc.Clear;
  EdtCodLojaDoc.Clear;
  EdtLojaDoc.Clear;
  EdtCodHistDoc.Clear;
  EdtHistDoc.Clear;
  EdtDebCreDoc.Clear;
  EdtObsDoc.Clear;

End; // Limpas Componentes de Lancamentos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Buscar Fornecedor Novo >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.BuscaFornecedorNovo;
Var
  MySql: String;
begin

  EdtFluFornFornecedor.Clear;

  Screen.Cursor:=crAppStart;

  // Busca Fornecedor Novo ===================================================
  MySql:=' SELECT fo.cod_cliente, fo.razao_cliente'+
         ' FROM LINXCLIENTESFORNEC fo'+
         ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
         ' AND NOT ('+
         '         (UPPER(fo.razao_cliente) LIKE ''%NAO USAR%'')'+
         '         OR'+
         '         (UPPER(fo.razao_cliente) LIKE ''%NÃO USAR%'')'+
         '         OR'+
         '         (UPPER(fo.nome_cliente) LIKE ''%NAO USAR%'')'+
         '         OR'+
         '         (UPPER(fo.nome_cliente) LIKE ''%NÃO USAR%'')'+
         '        )'+
         ' AND NOT EXISTS (SELECT 1'+
         '                 FROM FL_CAIXA_FORNECEDORES fl'+
         '                 WHERE fl.cod_vinculado=fo.cod_cliente)'+
         ' AND fo.cod_cliente='+IntToStr(EdtFluFornCodFornecedor.AsInteger);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Cliente').AsString)='' Then
  Begin
    msg('Fornecedor Novo NÃO Encontrado !!!', 'A');
    Screen.Cursor:=crDefault;
    EdtFluFornCodFornecedor.Clear;
    EdtFluFornCodFornecedor.SetFocus;
    DMBelShop.CDS_BuscaRapida.Close;
    Exit;
  End;

  EdtFluFornFornecedor.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Cliente').AsString;
  EdtValorDoc.SetFocus;

  DMBelShop.CDS_BuscaRapida.Close;

  Screen.Cursor:=crDefault;
End; // Buscar Fornecedor Novo >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita/Desabilita GroupBox de Percentual de Redução >>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.PercReducaoHabiita_GroupBox(bHabilita: Boolean);
Begin
  Gb_FluxFornManutForn.Enabled    :=bHabilita;
  Gb_FluxFornManutComprv.Enabled  :=bHabilita;
  Gb_FluxFornManutValidade.Enabled:=bHabilita;
  Gb_FluxFornManutPercent.Enabled :=bHabilita;
End; // Habilita/Desabilita GroupBox de Percentual de Redução >>>>>>>>>>>>>>>>>>

// Calcula Percentual de Redução >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.CalculaPercReducao;
Var
  MySql,
  sCodFornAnt, // Código do Fornecedor do Percentual de Redução Anterior para Recalculo do Fornecedor
  sDtaRedAnt   // Data do Conta Correte para Recalculo do Fornecedor Anterior Percentual de Redução
  : String;
Begin
  OdirPanApres.Caption:='AGUARDE !! Atualizando Percentuais de Redução...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmFluxoFornecedor;
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

    // Guarda Codigo Fornecedor Anterior =======================================
    sDtaRedAnt:='';
    If Bt_FluxFornManutReducaoSalvar.Caption='Alterar' Then
    Begin
      MySql:=' SELECT r.cod_fornecedor, r.dta_incio'+
             ' FROM FL_CAIXA_PERC_REDUCAO r'+
             ' WHERE r.num_seq='+sgNumSeq;
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      sCodFornAnt:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Fornecedor').AsString;
      sDtaRedAnt :=DMBelShop.CDS_BuscaRapida.FieldByName('dta_incio').AsString;
      DMBelShop.CDS_BuscaRapida.Close;
    End; // If Bt_FluxFornManutReducaoSalvar.Caption='Alterar' Then

    // Zera Percentual de Redução do Num_Seq ===================================
    MySql:=' UPDATE FL_CAIXA_FORNECEDORES f'+
           ' SET f.per_reducao = 0.00,'+
           '     f.vlr_caixa = f.vlr_origem'+
           ' WHERE EXISTS (SELECT 1'+
           '               FROM FL_CAIXA_PERC_REDUCAO p'+
           '               WHERE p.cod_fornecedor=f.cod_vinculado'+
           '               AND   p.cod_comprovante = f.cod_historico'+
           '               AND   p.num_seq = '+sgNumSeq+
           '               AND   f.dta_caixa BETWEEN p.dta_incio AND COALESCE(p.dta_fim, CAST(''31.12.3000'' AS DATE)))';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Excluir Registro de Percentualde Redução ================================
    If Bt_FluxFornManutReducaoSalvar.Caption='Excluir' Then
    Begin
      MySql:=' DELETE FROM FL_CAIXA_PERC_REDUCAO r'+
             ' WHERE r.num_seq = '+sgNumSeq;
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End; // If Bt_FluxFornManutReducaoSalvar.Caption='Excluir' Then

    // INSERE OU ALTERA Registro de Percentualde Redução =======================
    If Bt_FluxFornManutReducaoSalvar.Caption<>'Excluir' Then
    Begin
      // Insere Novo Novo Percentual de Redução do Num_Seq =======================
      MySql:=' UPDATE OR INSERT INTO FL_CAIXA_PERC_REDUCAO'+
             ' (NUM_SEQ, COD_FORNECEDOR, COD_COMPROVANTE, PER_REDUCAO, DTA_INCIO, DTA_FIM)'+
             ' VALUES ('+
             QuotedStr(sgNumSeq)+', '+ // NUM_SEQ
             IntToStr(EdtFluxFornManutCodForn.AsInteger)+', '+ // COD_FORNECEDOR
             QuotedStr(EdtFluxFornManutCodComprv.text)+', '+ // COD_COMPROVANTE / COD_HISTORICO
             f_Troca(',','.',EdtFluxFornManutPercentual.Text)+', '+ // PER_REDUCAO
             QuotedStr(f_Troca('/','.',f_Troca('-','.',DtEdt_FluxFornManutDtaInicial.Text)))+', '; // DTA_INCIO

             // DTA_FIM
             If (Trim(DtEdt_FluxFornManutDtaFinal.Text)='') Or (Trim(DtEdt_FluxFornManutDtaFinal.Text)='/  /') Then
              MySql:=
               MySql+' null)'
             Else
              MySql:=
               MySql+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtEdt_FluxFornManutDtaFinal.Text)))+')';

      MySql:=
       MySql+' MATCHING (NUM_SEQ)';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Novo Percentual de Redução do Num_Seq ==========================
      MySql:=' UPDATE FL_CAIXA_FORNECEDORES f'+
             ' SET f.per_reducao = (SELECT p.per_reducao'+
             '                      FROM FL_CAIXA_PERC_REDUCAO p'+
             '                      WHERE p.cod_fornecedor = f.cod_vinculado'+
             '                      AND   p.cod_comprovante = f.cod_historico'+
             '                      AND   p.num_seq = '+sgNumSeq+
             '                      AND   f.dta_caixa BETWEEN p.dta_incio AND COALESCE(p.dta_fim, CAST(''31.12.3000'' AS DATE))),'+
             ' f.vlr_caixa = ROUND(f.vlr_origem * (1 - (COALESCE(f.per_reducao,0.00) / 100)), 2)'+

             ' WHERE EXISTS(SELECT 1'+
             '              FROM FL_CAIXA_PERC_REDUCAO p'+
             '              WHERE p.cod_fornecedor = f.cod_vinculado'+
             '              AND   p.cod_comprovante = f.cod_historico'+
             '              AND   p.num_seq = '+sgNumSeq+
             '              AND   f.dta_caixa BETWEEN p.dta_incio AND COALESCE(p.dta_fim, CAST(''31.12.3000'' AS DATE)))';
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End; // If Bt_FluxFornManutReducaoSalvar.Caption<>'Excluir' Then]

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    // Busca Fornecedor de Vinculo =============================================
    DMBelShop.BuscaFornVinculo(EdtFluxFornManutCodForn.AsInteger);

    // Recalcula Fluxo de Caixa do Novo Fornecedor =============================
    CalculaFluxoCaixaFornecedores(f_Troca('.','/',f_Troca('-','/',sgDtaMinCC)),IntToStr(DMBelShop.igFornVinculo));

    // Recalcula Fluxo de Caixa do Fornecedor Anterior =========================
    If Bt_FluxFornManutReducaoSalvar.Caption='Alterar' Then
    Begin
      // Busca Fornecedor de Vinculo =============================================
      DMBelShop.BuscaFornVinculo(StrToInt(sCodFornAnt));

      CalculaFluxoCaixaFornecedores(f_Troca('.','/',f_Troca('-','/',sDtaRedAnt)),IntToStr(DMBelShop.igFornVinculo));
    End;

    // Reapresenta Fornecedores =================================================
    If DMBelShop.CDS_FluxoFornecedores.Active Then
     DMBelShop.CDS_FluxoFornecedores.Close;

    // Busca Fornecedor de Vinculo =============================================
    DMBelShop.BuscaFornVinculo(EdtFluxFornManutCodForn.AsInteger);

    FiltraComprador('',0);
    DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR', DMBelShop.igFornVinculo,[]);

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

End; // Calcula Percentual de Redução >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Filtro Fornecedores pelos Compradores Selecionados >>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.FiltraComprador(sCompradores: String; iNumLinhas: Integer); // sCompradores: Delimitador = ';'
Begin
  DMBelShop.CDS_FluxoFornecedor.Close;
  DMBelShop.CDS_FluxoFornecedor.Filtered:=False;
  DMBelShop.CDS_FluxoFornecedor.Filter:='';

  DMBelShop.CDS_FluxoFornecedores.DisableControls;
  DMBelShop.CDS_FluxoFornecedores.Close;
  DMBelShop.CDS_FluxoFornecedores.Open;
  DMBelShop.CDS_FluxoFornecedores.Last;
  DMBelShop.CDS_FluxoFornecedores.First;
  DMBelShop.CDS_FluxoFornecedores.EnableControls;

End; // Filtro Fornecedores pelos Compradores Selecionados >>>>>>>>>>>>>>>>>>>>>

// (NÃO é Mais Usado) Manutenção DML de Historicos de Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmFluxoFornecedor.DML_Historicos(sTipo, sCodHist: String; sDebCre: String=''; sDesHist: String=''): Boolean;
Var
  MySql: String;
Begin
// sTipo: (I)nserir
//        (E)xclur

  sgMensagemERRO:='';
  Result:=False;

  If sTipo='E' Then
  Begin
    // Verifica se Pode Excluir -----------------------------------
    MySql:=' SELECT FIRST 1 h.cod_historico'+
           ' FROM FL_CAIXA_FORNECEDORES h'+
           ' WHERE h.cod_historico='+sCodHist;
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    MySql:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Historico').AsString);
    DMBelShop.CDS_BuscaRapida.Close;

    If Trim(MySql)<>'' Then
    Begin
      sgMensagemERRO:='Impossivel Excluir o Comprovante '+MySql+cr+cr+'Contém Movimento(s) !!'+cr+cr+'ENTRAR EM CONTATO COM O ODIR !!';
      Exit;
    End; // If Trim(MySql)<>'' Then
  End; // If sTipo='E' Then

  OdirPanApres.Caption:='AGUARDE !! Excutanto DML Comprovante...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmFluxoFornecedor;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  Screen.Cursor:=crAppStart;
  DateSeparator:='.';
  DecimalSeparator:='.';

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    // Insere Comprovante -------------------------------------------
    If sTipo='I' Then
    Begin
      MySql:=' INSERT INTO FL_CAIXA_HISTORICOS'+
             ' (COD_HISTORICO, DES_HISTORICO, IND_DEBCRE)'+

             ' VALUES ('+
             QuotedStr(sCodHist)+', '+ // COD_HISTORICO
             QuotedStr(sDesHist)+', '+ // DES_HISTORICO
             QuotedStr(sDebCre)+')'; // IND_DEBCRE
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='I' Then

    // Exclui Comprovante -------------------------------------------
    If sTipo='E' Then
    Begin
      MySql:=' DELETE FROM FL_CAIXA_HISTORICOS h'+
             ' WHERE h.cod_historico='+sCodHist;
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='E' Then

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    If DMBelShop.CDS_FluxoFornHistorico.Active Then
     DMBelShop.CDS_FluxoFornHistorico.Close;
    DMBelShop.CDS_FluxoFornHistorico.Open;

    If sTipo='I' Then
     DMBelShop.CDS_FluxoFornHistorico.Locate('COD_HISTORICO',sCodHist,[]);

    Result:=True;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      sgMensagemERRO:='Mensagem de erro do sistema:'+#13+e.message;
    End; // on e : Exception do
  End; // Try

  OdirPanApres.Visible:=False;
  DateSeparator:='/';
  DecimalSeparator:=',';
End; // Manutenção DML de Historicos de Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmFluxoFornecedor.CreateToolTips(hWnd: Cardinal);
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

// Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>

// Calcula Fluxo de Caixo de Fornecedor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.CalculaFluxoCaixaFornecedores(sDt: String=''; sCodForn: String ='');
Var
  MySql:String;
  cVlrSaldo: Currency;

  iUltimo: Integer;

  sCodigo, sNumSeqIF: String; // Cria Saldo Inicial Final

  b: Boolean;
Begin
  DMBelShop.CDS_FluxoFornecedor.Close;

  OdirPanApres.Caption:='AGUARDE !! Atualizando Saldos Conta Corrente do Fornecedor: '+sCodForn;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2));
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.BringToFront();
  OdirPanApres.Parent:=FrmFluxoFornecedor;
  OdirPanApres.Visible:=True;

  Application.ProcessMessages;

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;

    DateSeparator:='.';
    DecimalSeparator:='.';

    // Exclui Saldos Iniciais e Finais Sem Movimento ===========================
    MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES cf'+
           ' WHERE cf.num_seq in (0, 999999)'+
           ' AND NOT EXISTS (SELECT 1'+
           '                 FROM fl_caixa_fornecedores f'+
           '                 WHERE f.num_seq NOT IN (0, 999999)'+
           '                 AND   f.dta_caixa=cf.dta_caixa'+
           '                 AND   f.cod_fornecedor=cf.cod_fornecedor)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Busca Fornecedores ======================================================
    MySql:=' SELECT distinct c.COD_FORNECEDOR, c.DTA_CAIXA'+
           ' FROM FL_CAIXA_FORNECEDORES c';

           If Trim(sDt)<>'' Then
            MySql:=
             MySql+' WHERE c.DTA_CAIXA>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDt)));

           If (Trim(sCodForn)<>'') and (Trim(sDt)<>'') Then
            MySql:=
             MySql+' And c.COD_FORNECEDOR='+sCodForn;

           If (Trim(sCodForn)<>'') and (Trim(sDt)='') Then
            MySql:=
             MySql+' WHERE c.COD_FORNECEDOR='+sCodForn;

    MySql:=
     MySql+' ORDER BY c.COD_FORNECEDOR, c.DTA_CAIXA';
    DMBelShop.CDS_While.Close;
    DMBelShop.SDS_While.CommandText:=MySql;
    DMBelShop.CDS_While.Open;

    FrmBelShop.MontaProgressBar(True, FrmFluxoFornecedor);
    pgProgBar.Properties.Max:=DMBelShop.CDS_While.RecordCount;

    sCodigo:=DMBelShop.CDS_While.FieldByName('Cod_Fornecedor').AsString;
    cVlrSaldo:=0;
    iUltimo:=0;

    DMBelShop.CDS_While.DisableControls;
    While Not DMBelShop.CDS_While.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_While.RecNo;
      Refresh;

      If sCodigo<>DMBelShop.CDS_While.FieldByName('Cod_Fornecedor').AsString Then
      Begin
        cVlrSaldo:=0;

        // Exclui Caixas Sem Movtos ============================================
        MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES fe'+
               ' WHERE fe.cod_fornecedor='+sCodigo+
               ' AND  NOT EXISTS (SELECT 1'+
               '                  FROM FL_CAIXA_FORNECEDORES f'+
               '                  WHERE f.cod_fornecedor=fe.cod_fornecedor'+
               '                  AND   f.dta_caixa=fe.dta_caixa'+
               '                  AND   f.num_seq BETWEEN 1 AND 999998)';
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If sCodigo<>DMBelShop.CDS_While.FieldByName('Cod_Fornecedor').AsString Then

      // Busca Fluxo de Caixa Fornecedores =========================================
      MySql:=' SELECT cx.COD_FORNECEDOR, cx.DES_FORNECEDOR, cx.DTA_CAIXA, cx.NUM_SEQ,'+
             '        cx.TIP_DEBCRE, cx.VLR_CAIXA, cx.VLR_SALDO'+

             ' FROM FL_CAIXA_FORNECEDORES cx'+

             ' WHERE cx.DTA_CAIXA='+QuotedStr(DMBelShop.CDS_While.FieldByName('Dta_Caixa').AsString)+
             ' And   cx.COD_FORNECEDOR='+QuotedStr(DMBelShop.CDS_While.FieldByName('Cod_Fornecedor').AsString)+
             ' ORDER BY DTA_CAIXA, NUM_SEQ';
      DMBelShop.CDS_Pesquisa.Close;
      DMBelShop.CDS_Pesquisa.Filtered:=False;
      DMBelShop.SDS_Pesquisa.CommandText:=MySql;
      DMBelShop.CDS_Pesquisa.Open;

      DMBelShop.CDS_Pesquisa.DisableControls;
      DMBelShop.CDS_Pesquisa.Last;
      iUltimo:=DMBelShop.CDS_Pesquisa.RecNo;
      DMBelShop.CDS_Pesquisa.First;
      While Not DMBelShop.CDS_Pesquisa.Eof do
      Begin
        Refresh;

        // Verifica Registro de Saldo Inicial ==================================
        If DMBelShop.CDS_Pesquisa.RecNo=1 Then
        Begin
          If DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>0 Then
           Begin
             // Busca Saldo Final do Dia Anterior ---------------------
             MySql:='SELECT Max(c.DTA_CAIXA) DtAnterior, c.vlr_saldo'+

                    ' FROM FL_CAIXA_FORNECEDORES c'+

                    ' WHERE c.num_seq=999999'+
                    ' AND c.DTA_CAIXA<'+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                    ' And c.COD_FORNECEDOR='+QuotedStr(DMBelShop.CDS_While.FieldByName('COD_FORNECEDOR').AsString)+

                    ' GROUP BY c.vlr_saldo'+
                    ' ORDER BY DtAnterior desc';
             DMBelShop.CDS_Busca.Close;
             DMBelShop.SDS_Busca.CommandText:=MySql;
             DMBelShop.CDS_Busca.Open;

             MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES ('+
                    ' COD_FORNECEDOR, DES_FORNECEDOR, DTA_CAIXA, NUM_SEQ,'+
                    ' COD_HISTORICO, PER_REDUCAO, VLR_SALDO)'+
                    ' Values ('+
                    QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Cod_Fornecedor').AsString)+', '+
                    QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Des_Fornecedor').AsString)+', '+
                    QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+', '+
                    QuotedStr('0')+', '+
                    QuotedStr('0')+', '+
                    ' NULL, ';

                   If Trim(DMBelShop.CDS_Busca.FieldByName('DtAnterior').AsString)='' Then
                    Begin
                      MySql:=
                       MySql+QuotedStr('0')+')';
                      cVlrSaldo:=0;
                    End
                   Else // If Trim(DMBelShop.CDS_Busca.FieldByName('DtAnterior').AsString)='' Then
                    Begin
                      MySql:=
                       MySql+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Vlr_Saldo').AsString)+')';
                      cVlrSaldo:=DMBelShop.CDS_Busca.FieldByName('Vlr_Saldo').AsCurrency;
                    End;
             DMBelShop.SQLC.Execute(MySql,nil,nil);

             DMBelShop.CDS_Busca.Close;
           End
          Else // If DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>0 Then
           Begin
             If DMBelShop.CDS_While.RecNo=1 Then
              Begin
                cVlrSaldo:=DMBelShop.CDS_Pesquisa.FieldByName('Vlr_Saldo').AsCurrency;
              End
             Else // If DMBelShop.CDS_While.RecNo=1 Then
              Begin
                // Atualiza Saldo Incial --------------------------------
                 MySql:=' UPDATE FL_CAIXA_FORNECEDORES'+
                        ' SET Vlr_Saldo='+QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)));

                        If (DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger=0) Or
                           (DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger=999999) Then
                        Begin
                          MySql:=
                           MySql+', Per_Reducao=null';
                        End;

                 MySql:=
                  MySql+' WHERE DTA_CAIXA='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                        ' AND Num_Seq='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsString)+
                        ' AND COD_FORNECEDOR='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('COD_FORNECEDOR').AsString);
                 DMBelShop.SQLC.Execute(MySql,nil,nil);
              End; // If DMBelShop.CDS_While.RecNo=1 Then
           End; // If DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>0 Then
        End; // If DMBelShop.CDS_Pesquisa.RecNo=1 Then

        // Atualiza Movtos =====================================================
        If (DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>0) and
           (DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999) Then
        Begin
          // Atualiza Movto --------------------------------------
          MySql:='UPDATE FL_CAIXA_FORNECEDORES';

          If DMBelShop.CDS_Pesquisa.FieldByName('TIP_DEBCRE').AsString='C' Then
           cVlrSaldo:=
            cVlrSaldo+DMBelShop.CDS_Pesquisa.FieldByName('Vlr_Caixa').AsCurrency
          Else
           cVlrSaldo:=
            cVlrSaldo-DMBelShop.CDS_Pesquisa.FieldByName('Vlr_Caixa').AsCurrency;

          MySql:=
           MySql+' SET Vlr_Saldo='+QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)))+
                 ' WHERE DTA_CAIXA='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                 ' AND   NUM_SEQ='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsString)+
                 ' AND   COD_FORNECEDOR='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('COD_FORNECEDOR').AsString);
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End; // If (DMBelShop.CDS_Pesquisa.RecNo<>iUltimo) and (DMBelShop.CDS_Pesquisa.RecNo<>1)Then

        // Verifica Registro de Saldo Final ====================================
        If DMBelShop.CDS_Pesquisa.RecNo=iUltimo Then
        Begin
          If DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999 Then
           Begin
             // Insere Saldo Final ----------------------------------
             MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES ('+
                    ' COD_FORNECEDOR, DES_FORNECEDOR, DTA_CAIXA, NUM_SEQ,'+
                    ' COD_HISTORICO, PER_REDUCAO, VLR_SALDO)'+
                    ' VALUES ('+
                    QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Cod_Fornecedor').AsString)+', '+ // COD_FORNECEDOR
                    QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Des_Fornecedor').AsString)+', '+ // DES_FORNECEDOR
                    QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+', '+ // DTA_CAIXA
                    QuotedStr('999999')+', '+ // NUM_SEQ
                    QuotedStr('999999')+', '+ // COD_HISTORICO
                    ' NULL,'+ // PER_REDUCAO
                    QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)))+')'; // VLR_SALDO
             DMBelShop.SQLC.Execute(MySql,nil,nil);
           End
          Else // If DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999 Then
           Begin
             // Atualiza Movto --------------------------------------
             MySql:=' UPDATE FL_CAIXA_FORNECEDORES'+
                    ' SET Vlr_Saldo='+QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)));

                    If (DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger=0) Or
                       (DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger=999999) Then
                    Begin
                      MySql:=
                       MySql+', Per_Reducao=null';
                    End;

             MySql:=
              MySql+' WHERE DTA_CAIXA='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                    ' AND Num_Seq='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsString)+
                    ' AND COD_FORNECEDOR='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('COD_FORNECEDOR').AsString);
             DMBelShop.SQLC.Execute(MySql,nil,nil);
           End; // If DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999 Then
        End; // If DMBelShop.CDS_Pesquisa.RecNo=iUltimo Then

        DMBelShop.CDS_Pesquisa.Next;
      End; // While Not DMBelShop.CDS_Pesquisa.Eof do
      DMBelShop.CDS_Pesquisa.EnableControls;

      sCodigo:=DMBelShop.CDS_While.FieldByName('Cod_Fornecedor').AsString;

      DMBelShop.CDS_While.Next;
    End; // While Not DMBelShop.CDS_While.Eof do
    DMBelShop.CDS_While.Close;
    DMBelShop.CDS_Pesquisa.Close;
    DMBelShop.CDS_While.EnableControls;
    FrmBelShop.MontaProgressBar(False, FrmFluxoFornecedor);

    // Exclui Caixas Sem Movtos do Ultimo Fornecedor ===========================
    If Trim(sCodigo)<>'' Then
    Begin
      MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES fe'+
             ' WHERE fe.cod_fornecedor='+sCodigo+
             ' AND  NOT EXISTS (SELECT 1'+
             '                  FROM FL_CAIXA_FORNECEDORES f'+
             '                  WHERE f.cod_fornecedor=fe.cod_fornecedor'+
             '                  AND   f.dta_caixa=fe.dta_caixa'+
             '                  AND   f.num_seq BETWEEN 1 AND 999998)';
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End; // If Trim(sCodigo)<>'' Then

    // Fecha Transacao =========================================================
    DMBelShop.SQLC.Commit(TD);

    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
    Refresh;
  Except
    on e : Exception do
    Begin
      FrmBelShop.MontaProgressBar(False, FrmFluxoFornecedor);

      DMBelShop.SQLC.Rollback(TD);

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Erro Fornecedor:'+sCodigo+#13+e.message), 'Erro', MB_ICONERROR);
    End;
  End;
  DateSeparator:='/';
  DecimalSeparator:=',';
End; // Calcula Fluxo de Caixo de Fornecedor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//==============================================================================
// ODIR - FIM ==================================================================
//==============================================================================

procedure TFrmFluxoFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairFF Then
   Begin
     Action :=caHide;// caFree;
   End
  Else
   Begin
     msg('Para Sair Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmFluxoFornecedor.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin

  // Acertar Erro na Rolagem do Mouse ==========================================
  Application.OnMessage := ApplicationEvents1Message;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  igTabSheet:=0;
  bgAltVinculos:=False;

  //============================================================================
  // Show Hint em Forma de Balão ===============================================
  //============================================================================
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FluFornComprovante.Handle, @ti, TipoDoIcone, 'Selecione o Comprovante'+#13+'a Incluir', 'INCLUIR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FluFornBuscaFornecedor.Handle, @ti, TipoDoIcone, 'Selecionar o'+#13+'Fornecedor', 'SELECIONAR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FluFornAcrescCampanhas.Handle, @ti, TipoDoIcone, '% de Acrescimos'+#13+'Campanhas'+#13+'<Coleções>', 'CAMPANHAS !!');

  //  CreateToolTips(Self.Handle);
//  AddToolTip(Bt_FluFornSalvaMemoria.Handle, @ti, TipoDoIcone, 'Salvar Resultado'+#13+'em Memória', 'CONTA CORRENTE !!');
  // Show Hint em Forma de Balão ===============================================
  //============================================================================

  sgDMLMovto:='';
  sgDtaDoc:=''; // Usado no Lançamento para Guardar Data de Inicio de ReCalculo do Fornecedor

  bgAtualizaDireto:=False;
end;

procedure TFrmFluxoFornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;
end;

procedure TFrmFluxoFornecedor.FormShow(Sender: TObject);
Var
  MySql: String;
begin
  Screen.Cursor:=crAppStart;

  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmFluxoFornecedor);

  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  // Componentes do Odir =======================================================
  Bt_FluFornAcertaSaldos.Visible:=False;
  EdtFluFornCodFornAcertar.Visible:=False;
  MEdt_DtaAtualizacao.Visible:=False;

  // Componentes do Odir/Anna/Renato ===========================================
  Pan_FluFornReducao.Visible:=False;
  Pan_FluFornComprov.Visible:=False;
  Stb_FluFornComprv.Visible:=False;

  Stb_FluFornComprv.Visible:=False;
  Stb_FluForn.Panels[0].Visible:=False;
  Stb_FluForn.Panels[1].Visible:=False;

  Dbg_FluFornFornec.PopupMenu:=nil;

  If AnsiUpperCase(Des_Login)='ODIR' Then
  Begin
    MEdt_DtaAtualizacao.Visible:=True;
    EdtFluFornCodFornAcertar.Visible:=True;
    Bt_FluFornAcertaSaldos.Visible:=True;
    Bt_AvariasCentralTrocas.Visible:=True;
  End; // If AnsiUpperCase(Des_Login)='ODIR' Then

  bgPodeUsar:=False;
  // Renato / Anna / Zilandra
  If (Cod_Usuario='1') Or (Cod_Usuario='3') Or (Cod_Usuario='11') Or (AnsiUpperCase(Des_Login)='ODIR') Then
  Begin
    bgPodeUsar:=True;

    Pan_FluFornReducao.Visible:=True;
    // Pan_FluFornComprov.Visible:=True;
    Stb_FluFornComprv.Visible:=False;

    Stb_FluFornComprv.Visible:=True;
    Stb_FluForn.Panels[0].Visible:=True;
    Stb_FluForn.Panels[1].Visible:=True;

    // Dbg_FluFornFornec.PopupMenu:=PopM_Forn;
  End;

  PC_Principal.TabIndex:=0;
  Ts_FluxFornLanctos.TabVisible:=False;
  Ts_FluxFornVinculos.TabVisible:=False;
  Ts_FluxFornPercCampanhas.TabVisible:=False;
  PC_PrincipalChange(Self);

  PC_FluxFornParametros.TabIndex:=0;
  Ts_FluxFornManutReducao.TabVisible:=False;
  PC_FluxFornParametrosChange(Self);

  bgSairFF:=False;

  bgVoltaPerReducao:=False;
  PercReducaoHabiita_GroupBox(True);

  // Acerta os Codigo Vinculados = null (No Inicio do FrmFluxFornecedor ========
  AcertaCodVinculado;
  Screen.Cursor:=crAppStart;

  // Apresenta Históricos ======================================================
  If DMBelShop.CDS_FluxoFornHistorico.Active Then
   DMBelShop.CDS_FluxoFornHistorico.Close;
  try
    DMBelShop.CDS_FluxoFornHistorico.Open;
  except
    on e : Exception do
    Begin
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Screen.Cursor:=crDefault;
      Exit;
    End; // on e : Exception do
  End;

  // Apresenta Percentuais de Redução ==========================================
  If DMBelShop.CDS_FluxoFornReducao.Active Then
   DMBelShop.CDS_FluxoFornReducao.Close;

  try
    DMBelShop.CDS_FluxoFornReducao.Open;
  except
    on e : Exception do
    Begin
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Screen.Cursor:=crDefault;
      Exit;
    End; // on e : Exception do
  End;

  // Apresernta Fornecedores ===================================================
  If DMBelShop.CDS_FluxoFornecedores.Active Then
   DMBelShop.CDS_FluxoFornecedores.Close;

  FiltraComprador('',0);
  Screen.Cursor:=crDefault;

  Dbg_FluFornFornec.SetFocus;
end;

procedure TFrmFluxoFornecedor.PC_PrincipalChange(Sender: TObject);
Var
  MySql: String;
begin

  CorSelecaoTabSheet(PC_Principal);

  Bt_FluFornAcrescCampanhas.Visible:=False;

  // Usado para Percentuais de Acrescimentos nos Fornecedores nas Campanhas
  DMBelShop.CDS_Join.Close;
  DMBelShop.SDS_Join.CommandText:='';

  // Ts_FluxFornApres
  If (PC_Principal.ActivePage=Ts_FluxFornApres) And (Ts_FluxFornApres.CanFocus) Then
  Begin
    LimpaLancamentos;

    If sgDMLMovto='N' Then
    Begin
      EdtFluFornCodFornecedor.Clear;
      EdtFluFornFornecedor.Clear;
    End; // If sgDMLMovto='N' Then

    sgDMLMovto:='';

    DMBelShop.CDS_FluxoFornecedor.Filtered:=False;
    DMBelShop.CDS_FluxoFornecedor.Filter:='';

    If Not Gb_FluFornFornecedor.Visible Then
     Gb_FluFornFornecedor.Visible:=True;

    Bt_FluFornVinculos.Visible:=PermissaoComponente(Cod_Usuario, 'FrmFluxFornecedor', 'Bt_FluFornVinculos', DMBelShop.SDS_DtaHoraServidor);
    Bt_FluFornVinculos.Caption:='Vinculos de Fornecedores';
    Bt_FluFornIncluir.Visible:=True;
    Bt_FluFornIncluir.Caption:='    Incluir Fornecedor';

    Bt_FluFornImprimir.Visible:=False;
    Bt_FluFornAlterar.Visible:=False;
    Bt_FluFornSalvaMemoria.Visible:=True;
    Bt_FluFornSalvaMemoria.Caption:='Salva em'+cr+' Memória';

    Bt_FluFornFiltroComprador.Visible:=True;
    Bt_FluFornFiltroComprador.Caption:='Seleciona Comprador';

    Bt_FluFornAcrescCampanhas.Visible:=True;

    Bt_FluFornFechar.Caption:='Fechar';
    Bt_FluFornFechar.Tag:=99;
    Bt_FluFornFechar.Glyph:=Nil;

    EdtFluFornCodFornecedor.Enabled:=True;
    Bt_FluFornBuscaFornecedor.Enabled:=True;

    Dbg_FluFornFornec.SetFocus;

  End; // Ts_FluxFornApres

  // Ts_FluxFornCaixa
  If (PC_Principal.ActivePage=Ts_FluxFornCaixa) And (Ts_FluxFornCaixa.CanFocus) Then
  Begin
    If Not Gb_FluFornFornecedor.Visible Then
     Gb_FluFornFornecedor.Visible:=True;

    Bt_FluFornVinculos.Visible:=True;
    Bt_FluFornVinculos.Caption:='Localiza Avarias';
    Bt_FluFornIncluir.Visible:=True;
    Bt_FluFornIncluir.Caption:='    Incluir Lançamento';

    Bt_FluFornImprimir.Visible:=True;
    Bt_FluFornAlterar.Visible:=True;
    Bt_FluFornSalvaMemoria.Visible:=True;
    Bt_FluFornSalvaMemoria.Caption:='Salva em'+cr+' Memória';

    Bt_FluFornFiltroComprador.Visible:=True;
    Bt_FluFornFiltroComprador.Caption:='Seleciona Histórico';

    Bt_FluFornFechar.Caption:='Voltar';
    Bt_FluFornFechar.Tag:=90;
    Bt_FluFornFechar.Glyph:=Nil;

    EdtFluFornCodFornecedor.Enabled:=True;
    Bt_FluFornBuscaFornecedor.Enabled:=True;

    Dbg_FluFornCaixa.SetFocus;
  End; // Ts_FluxFornCaixa

  // Ts_FluxFornLanctos
  If (PC_Principal.ActivePage=Ts_FluxFornLanctos) And (Ts_FluxFornLanctos.CanFocus) Then
  Begin
    If Not Gb_FluFornFornecedor.Visible Then
     Gb_FluFornFornecedor.Visible:=True;

    Bt_FluFornVinculos.Visible:=False;
    Bt_FluFornImprimir.Visible:=False;
    Bt_FluFornAlterar.Visible:=False;
    Bt_FluFornIncluir.Visible:=False;
    Bt_FluFornSalvaMemoria.Visible:=False;
    Bt_FluFornFiltroComprador.Visible:=False;

    Bt_FluFornFechar.Caption:='Voltar';
    Bt_FluFornFechar.Tag:=90;
    Bt_FluFornFechar.Glyph:=Nil;

    If (sgDMLMovto='I') Or (sgDMLMovto='A') Then
     Begin
       If Not bgSoObs Then
        EdtValorDoc.SetFocus
       Else
        EdtObsDoc.SetFocus
     End
    Else
     Begin
       EdtFluFornCodFornecedor.SetFocus;
     End;
  End; // Ts_FluxFornLanctos

  // Ts_FluxFornVinculos
  If (PC_Principal.ActivePage=Ts_FluxFornVinculos) And (Ts_FluxFornVinculos.CanFocus) Then
  Begin
    Gb_FluFornFornecedor.Visible:=False;

    Bt_FluFornVinculos.Visible:=False;
    Bt_FluFornImprimir.Visible:=False;
    Bt_FluFornAlterar.Visible:=False;
    Bt_FluFornIncluir.Visible:=False;
    Bt_FluFornFiltroComprador.Visible:=False;

    Bt_FluFornSalvaMemoria.Visible:=True;
    Bt_FluFornSalvaMemoria.Caption:='  Salvar'+cr+'Alterações';

    Bt_FluFornFechar.Caption:='Voltar';
    Bt_FluFornFechar.Tag:=90;
    Bt_FluFornFechar.Glyph:=Nil;

    EdtFornVinculoCodForn.SetFocus;
  End; // Ts_FluxFornVinculos

  // Ts_FluxFornCaixa
  If (PC_Principal.ActivePage=Ts_FluxFornPercCampanhas) And (Ts_FluxFornPercCampanhas.CanFocus) Then
  Begin
    Gb_FluFornFornecedor.Visible:=False;

    Bt_FluFornFiltroComprador.Visible:=False;
    Bt_FluFornVinculos.Visible:=False;
    Bt_FluFornIncluir.Visible:=False;
    Bt_FluFornSalvaMemoria.Visible:=False;

    Bt_FluFornFechar.Caption:='Voltar';
    Bt_FluFornFechar.Tag:=90;
    Bt_FluFornFechar.Glyph:=Nil;

    EdtFornAcrescCampCodForn.Clear;
    EdtFornAcrescCampPercentual.Clear;
    EdtFornAcrescCampDescForn.Clear;

    // Busca Fornecedores Com Acrescimos =====================
    MySql:=' SELECT'+
           ' t.cod_aux COD_FORNECEDOR,'+
           ' f.nome_cliente NOME_FORNECEDOR,'+
           ' t.vlr_aux PERC_ACRESCIMOS,'+
           ' t.des_aux1 TXT_OBS,'+
           ' CAST(t.des_aux AS INTEGER) COD_USUARIO,'+
           ' u.des_usuario NOME_USUARIO'+

           ' FROM TAB_AUXILIAR t'+
           '    LEFT JOIN LINXCLIENTESFORNEC f  on f.cod_cliente=t.cod_aux'+
           '    LEFT JOIN PS_USUARIOS u         on u.cod_usuario=t.des_aux'+

           ' WHERE t.tip_aux=30'+ // CONTA CORRENTE DE FORNECEDORES
                                  // COMISSÕES POR CAMPANHAS <COLEÇÃO>
                                  // Percentuais de Acrescimos na Cobrança
           ' ORDER BY 2';
    DMBelShop.CDS_Join.Close;
    DMBelShop.SDS_Join.CommandText:=MySql;
    DMBelShop.CDS_Join.Open;
    TNumericField(DMBelShop.CDS_Join.FieldByName('PERC_ACRESCIMOS')).DisplayFormat:='0.,00';

    EdtFornAcrescCampCodForn.SetFocus;
  End; // Ts_FluxFornCaixa


  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmFluxoFornecedor);

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornecKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if (Shift=[ssCtrl]) and (Key=46) then
    Key:=0;

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornecKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sForn, sValor: String;
  b: Boolean;
  MySql: String;
begin
  If (DMBelShop.CDS_FluxoFornecedores.IsEmpty) Or (DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger<3) Then
   Exit;

  sForn:= DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsString;

  // Altera Data do Conta Corrente (Processamento) =============================
  If (Key=Vk_F2) And (bgPodeUsar) Then
  Begin
    //function InputBoxData(ACaption, APrompt: string; sData: string=''; bErro: Boolean=True): string; ForWard;
                                                                     // bErro=False - Passa Data = 99/99/9999
    b:=True;
    While b do
    Begin
      // Solicita Data do Conta Corrente ----------------------------
      sgDtaInicio:=DMBelShop.CDS_FluxoFornecedoresDTA_CC.AsString;
      sgDtaInicio:=InputBoxData('Data Conta Corrente', 'Alteração (99/99/9999 = Retira Data)', sgDtaInicio, False);

      If Trim(sgDtaInicio)='' Then
      Begin
        Exit;
      End;

      // Analisa Data Informada -------------------------------------
      If f_Troca('/','.',f_Troca('-','.',sgDtaInicio))<>'99.99.9999' Then
      Begin
        Try
          StrToDate(sgDtaInicio);
        Except
          msg('Data Inválida !!','A');
          Exit;
        End;

        If StrToDate(sgDtaInicio)>StrToDate(DMBelShop.CDS_FluxoFornecedoresDTA_FINAL.AsString) Then
        Begin
          msg('Data Não Pode Ser Superior'+cr+cr+'a Data Final do CC !!','A');
          sgDtaInicio:='';
          Exit;
        End;
      End; // If f_Troca('/','.',f_Troca('-','.',sgDtaInicio))<>'99.99.9999' Then
      sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',sgDtaInicio));

      // Salva Nova Data de Conta Corrente --------------------------
      OdirPanApres.Caption:='AGUARDE !! Alterado Data CC';
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2))-20;
      OdirPanApres.Font.Style:=[fsBold];
      OdirPanApres.Parent:=FrmFluxoFornecedor;
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

        If Trim(sgDtaInicio)<>'99.99.9999' Then
         Begin
           MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
                  ' values (14,'+ // TIP_AUX - Data de Início de Apresentação do Conta Correte do Fornecedor
                  DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsString+', '+ // COD_AUX
                  QuotedStr(sgDtaInicio)+', '+ // DES_AUX

                  ' (SELECT Trim(t.des_aux1)'+
                  '  FROM TAB_AUXILIAR t'+
                  '  WHERE t.tip_aux=14'+ // Data de Início de Apresentação do Conta Correte do Fornecedor
                  '  AND   t.cod_aux='+DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsString+')'+', '+ // DES_AUX1 - Data do Primeiro Lançamento do Histórico 900 - CONTA CORRENTE

                  ' NULL, NULL)'+ // VLR_AUX, VLR_AUX1
                  ' matching (TIP_AUX, COD_AUX)';
         End
        Else
         Begin
           MySql:=' UPDATE TAB_AUXILIAR t'+
                  ' SET DES_AUX=NULL'+ // TIP_AUX
                  ' WHERE TIP_AUX=14'+ // Data de Início de Apresentação do Conta Correte do Fornecedor
                  ' AND   COD_AUX='+DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsString;
         End; // If Trim(sgDtaInicio)<>'99.99.9999' Then
        DMBelShop.SQLC.Execute(MySql,nil,nil);
        sgDtaInicio:='';

        // Atualiza Transacao ======================================================
        DMBelShop.SQLC.Commit(TD);

        DMBelShop.CDS_FluxoFornecedores.DisableControls;
        DMBelShop.CDS_FluxoFornecedores.Close;
        DMBelShop.CDS_FluxoFornecedores.Open;
        DMBelShop.CDS_FluxoFornecedores.Last;
        DMBelShop.CDS_FluxoFornecedores.First;
        DMBelShop.CDS_FluxoFornecedores.EnableControls;

        DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR',sForn,[]);
      Except
        on e : Exception do
        Begin
          // Abandona Transacao ====================================================
          DMBelShop.SQLC.Rollback(TD);

          MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        End; // on e : Exception do
      End; // Try
      DateSeparator:='/';
      DecimalSeparator:=',';
      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR',sForn,[]);
      b:=False;
    End; // While b do
  End; // If Key=Vk_F2 Then

  // Localizar Fornecedor ======================================================
  If Key=Vk_F4 Then
  Begin
    If Not DMBelShop.CDS_FluxoFornecedores.IsEmpty Then
    Begin
      sValor:='';
      b:=True;
      While b do
      Begin
        If InputQuery('Localizar Fornecedor','',sValor) then
         Begin
           Try
             StrToInt(sValor);
             If Not DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR', sValor,[]) Then
             Begin
              If Not LocalizaRegistro(DMBelShop.CDS_FluxoFornecedores, 'COD_FORNECEDOR', sValor) Then
               b:=False;
             End; // If Not DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR', sValor,[]) Then
             Break;
           Except
             If Not DMBelShop.CDS_FluxoFornecedores.Locate('NOMEFORNECEDOR', sValor,[]) Then
             Begin
               If Not LocalizaRegistro(DMBelShop.CDS_FluxoFornecedores, 'NOMEFORNECEDOR', sValor) Then
                b:=False;
             End; // If Not DMBelShop.CDS_FluxoFornecedores.Locate('NOMEFORNECEDOR', sValor,[]) Then
             Break;
           End;
         End
        Else // If InputQuery('Localizar Fornecedor','',sValor) then
         Begin
           Break;
         End; // If InputQuery('Localizar Fornecedor','',sValor) then
      End; // While b do

      If Not b Then
      Begin
        DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR',sForn,[]);
        msg('Fornecedor'+cr+sValor+cr+'Não Localizado na Lista !!'+cr+'Poder Estar Vinculado !!'+cr+'Tente Pesquisar pelo Nome...','A');
        Bt_FluFornBuscaFornecedorClick(Self);
        Exit;
      End;
    End; // If Not DMBelShop.CDS_FluxoFornecedores.IsEmpty Then
  End; // If Key=Vk_F4 Then

  Dbg_FluFornFornec.SetFocus;
end;

procedure TFrmFluxoFornecedor.Bt_FluFornAcertaSaldosClick(Sender: TObject);
Var
  i: Integer;
begin
  If (PC_Principal.ActivePage=Ts_FluxFornApres) And (Ts_FluxFornApres.CanFocus) Then
   EdtFluFornCodFornecedor.SetFocus;

  If Not bgAtualizaDireto Then
  Begin
    If msg('ATENÇÃO !!'+cr+cr+'Deseja Realmente Acertar Saldos ??','C')=2 Then
    Begin
      MEdt_DtaAtualizacao.SetFocus;
      Exit;
    End;
  End; // If Not bgAtualizaDireto Then

  If (Trim(EdtFluFornCodFornAcertar.Text)<>'Cód a Acertar') and (Trim(EdtFluFornCodFornAcertar.Text)<>'') Then
  Begin
    If MEdt_DtaAtualizacao.Text='  .  .20  ' Then
     CalculaFluxoCaixaFornecedores('',EdtFluFornCodFornAcertar.Text)
    Else
     CalculaFluxoCaixaFornecedores(MEdt_DtaAtualizacao.Text,EdtFluFornCodFornAcertar.Text);

    MEdt_DtaAtualizacao.Text:='  .  .20  ';
    EdtFluFornCodFornAcertar.Text:='Cód a Acertar';

    // Posiciona no Fornecedor =================================================
    igFornPosicao:=DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsInteger;

    If DMBelShop.CDS_FluxoFornecedores.Active Then
     DMBelShop.CDS_FluxoFornecedores.Close;

    FiltraComprador('',0);
    DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR', igFornPosicao,[]);
    igFornPosicao:=0;

    Exit;
  End;

  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=' SELECT DISTINCT f.cod_fornecedor FROM fl_caixa_fornecedores f ORDER BY 1';
  DMBelShop.CDS_Busca.Open;
  FrmBelShop.Mem_Odir.Lines.Clear;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    FrmBelShop.Mem_Odir.Lines.Add(DMBelShop.CDS_Busca.FieldByName('cod_fornecedor').AsString);

    DMBelShop.CDS_Busca.Next;
  End;
  DMBelShop.CDS_Busca.Close;

  // Calcula Fluxo de Caixa do Fornecedore =====================================
  For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do
  Begin
    CalculaFluxoCaixaFornecedores('',FrmBelShop.Mem_Odir.Lines[i]);
  End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do

  // Reabre Fornecedores =======================================================
  igFornPosicao:=DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsInteger;

  If DMBelShop.CDS_FluxoFornecedores.Active Then
   DMBelShop.CDS_FluxoFornecedores.Close;

  FiltraComprador('',0);
  DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR', igFornPosicao,[]);
  igFornPosicao:=0;

  If Not bgAtualizaDireto Then
  Begin
    If (Trim(EdtFluFornCodFornAcertar.Text)<>'Cód a Acertar') and (Trim(EdtFluFornCodFornAcertar.Text)<>'') and (DMBelShop.CDS_FluxoFornecedores.Active)Then
     DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR', EdtFluFornCodFornAcertar.Text,[]);

    msg('Processamento Efetuado com SUCESSO !!','A');
  End; // If Not bgAtualizaDireto Then

  MEdt_DtaAtualizacao.Text:='  .  .20  ';
  EdtFluFornCodFornAcertar.Text:='Cód a Acertar';
  bgAtualizaDireto:=False;
end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornecDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If DMBelShop.CDS_FluxoFornecedores.IsEmpty Then
   Exit;

  // Apresentacao dos Saldos em Débito ------------------------------
  If (Column.FieldName='VLR_SALDO') Then
  Begin
    If DMBelShop.CDS_FluxoFornecedoresVLR_SALDO.AsCurrency<0 then
    Begin
      Dbg_FluFornFornec.Canvas.Font.Style:=[fsBold];
      Dbg_FluFornFornec.Canvas.Font.Color:=clRed;
    End;

    If DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger<3 then
    Begin
      Dbg_FluFornFornec.Canvas.Font.Style:=[fsBold];
    End;
  End;

  If (Column.FieldName='LIMITE') Then
  Begin
    If DMBelShop.CDS_FluxoFornecedoresLIMITE.AsString='SIM' then
    Begin
      Dbg_FluFornFornec.Canvas.Font.Style:=[fsBold];
      Dbg_FluFornFornec.Canvas.Font.Color:=clRed;
    End;
  End;
  
  // Apresentacao dos Totais ----------------------------------------
  if not (gdSelected in State) Then
  Begin
    // Total de Créditos
    If DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger=0 Then
    Begin
      Dbg_FluFornFornec.Canvas.Brush.Color:=$00AAFFAA; //clSkyBlue;
    End;

    // Total de Débitos
    If DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger=1 Then
    Begin
      Dbg_FluFornFornec.Canvas.Brush.Color:=$00B9B9FF; //clSkyBlue;
    End;

    If DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger=2 Then
    Begin
      Dbg_FluFornFornec.Canvas.Brush.Color:=clSkyBlue;
    End;
  End; // if not (gdSelected in State) Then

  Dbg_FluFornFornec.Canvas.FillRect(Rect);
  Dbg_FluFornFornec.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.Alignment:=taRightJustify;
  DMBelShop.CDS_FluxoFornecedoresDTA_INICIAL.Alignment:=taCenter;
  DMBelShop.CDS_FluxoFornecedoresDTA_FINAL.Alignment:=taCenter;
  DMBelShop.CDS_FluxoFornecedoresVLR_SALDO.Alignment:=taRightJustify;
  DMBelShop.CDS_FluxoFornecedoresDTA_CC.Alignment:=taCenter;
  DMBelShop.CDS_FluxoFornecedoresLIMITE.Alignment:=taCenter;
  DMBelShop.CDS_FluxoFornecedoresDTA_HIST900.Alignment:=taCenter;
end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornecTitleClick(Column: TColumn);
begin
  If DMBelShop.CDS_FluxoFornecedores.IsEmpty Then
   Exit;

  With DMBelShop.CDS_FluxoFornecedores do
  Begin
    If IndexDefs.Count>0 Then
     IndexDefs.Delete(0);

   IndexFieldNames:='';
   IndexName:='';
   If (OrderGrid='') or (OrderGrid='Crescente') Then
    Begin
      AddIndex(Column.FieldName,'ORDEM;'+Column.FieldName,[],Column.FieldName); // ,'',0);
      IndexName:= Column.FieldName;
      IndexDefs.Update;

      OrderGrid:='Descendente';
    End
   Else
    Begin
      IndexFieldNames:='ORDEM;'+Column.FieldName;
      OrderGrid:='Crescente';
    End; // If (OrderGrid='') or (OrderGrid='Crescente') Then
  End; // With DMCentralTrocas.CDS_V_AnaliseReposicao do

  DMBelShop.CDS_FluxoFornecedores.RecNo:=3;

end;

procedure TFrmFluxoFornecedor.Bt_FluFornFecharClick(Sender: TObject);
begin
  If (Sender is TJvXPButton) Then
  Begin
    If (Sender as TJvXPButton).Caption='Voltar' Then
    Begin
      If (PC_Principal.ActivePage=Ts_FluxFornVinculos) And (Ts_FluxFornVinculos.CanFocus) And (bgAltVinculos)Then
      Begin
        If msg('TODAS as Alterações Efetuadas Serão PERDIDAS !!'+cr+'Deseja Realmente RETORNAR ??','C')=2 Then
        Begin
          EdtFornVinculoCodForn.SetFocus;
          Exit;
        End;
      End; // If (PC_Principal.ActivePage=Ts_FluxFornVinculos) And (Ts_FluxFornVinculos.CanFocus) Then

      Ts_FluxFornApres.TabVisible :=True;
      Ts_FluxFornCaixa.TabVisible :=True;
      Ts_FluxFornLanctos.TabVisible:=False;
      Ts_FluxFornVinculos.TabVisible:=False;
      Ts_FluxFornPercCampanhas.TabVisible:=False;

      PC_Principal.TabIndex:=igTabSheet;
      PC_PrincipalChange(Self);

      igTabSheet:=0;
      sgDMLMovto:='';
      sgDtaDoc  :='';

      LimpaLancamentos;

      DMBelShop.CDS_FluxoFornVinculo.Close;
      DMBelShop.CDS_FluxoFornVinculados.Close;

      // Usado para Percentuais de Acrescimentos nos Fornecedores nas Campanhas
      DMBelShop.CDS_Join.Close;
      DMBelShop.SDS_Join.CommandText:='';

      Exit;
    End;

    If (Sender as TJvXPButton).Caption='Fechar' Then
    Begin
      DMBelShop.CDS_FluxoFornecedor.Close;
      DMBelShop.CDS_FluxoFornHistorico.Close;
      bgSairFF:=True;
      Close;
      Exit;
    End;
  End; // If (Sender is TJvXPButton) Then
end;

procedure TFrmFluxoFornecedor.EdtFluFornCodFornecedorChange(Sender: TObject);
begin
  DMBelShop.CDS_FluxoFornecedor.Close;

  EdtFluFornFornecedor.Clear;

end;

procedure TFrmFluxoFornecedor.EdtFluFornCodFornecedorExit(Sender: TObject);
Var
  MySql: String;
  cValor: Currency;
  sDtaLimite: String;
begin
  If sgDMLMovto='N' Then
  Begin
    If EdtFluFornCodFornecedor.asInteger=0 Then
     Exit;

    BuscaFornecedorNovo;
    Exit;
  End; // If sgDMLMovto='N' Then

  EdtFluFornFornecedor.Clear;
  DMBelShop.CDS_FluxoFornecedor.Close;

  If EdtFluFornCodFornecedor.AsInteger=0 Then
   Exit;

  PC_Principal.ActivePage:=Ts_FluxFornApres;
  PC_PrincipalChange(Self);

  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ========================================================
  MySql:=' SELECT DISTINCT c.des_fornecedor nomefornecedor,'+
         '                 c.cod_fornecedor codfornecedor,'+
         '                 c.des_vinculado  nomevinculado'+
         ' FROM FL_CAIXA_FORNECEDORES c'+
         ' WHERE (c.cod_fornecedor='+IntToStr(EdtFluFornCodFornecedor.AsInteger)+
         '        Or'+
         '        c.cod_vinculado='+IntToStr(EdtFluFornCodFornecedor.AsInteger)+')';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('codfornecedor').AsString)='' Then
  Begin
    msg('Fornecedor NÃO Encontrado !!', 'A');
    Screen.Cursor:=crDefault;
    EdtFluFornCodFornecedor.Clear;
    EdtFluFornCodFornecedor.SetFocus;
    DMBelShop.CDS_BuscaRapida.Close;
    Exit;
  End;

  EdtFluFornFornecedor.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('NomeVinculado').AsString;
  If EdtFluFornCodFornecedor.AsInteger<>DMBelShop.CDS_BuscaRapida.FieldByName('CodFornecedor').AsInteger Then
  Begin
    msg('Fornecedor Vinculado ao Fornecedor'+cr+DMBelShop.CDS_BuscaRapida.FieldByName('NomeFornecedor').AsString,'A');
  End;
  EdtFluFornCodFornecedor.AsInteger:=DMBelShop.CDS_BuscaRapida.FieldByName('CodFornecedor').AsInteger;
  EdtFluFornFornecedor.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('NomeFornecedor').AsString;

  DMBelShop.CDS_BuscaRapida.Close;

  // Verifica se Fornecedor esta na Lista ======================================
  If not DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR', EdtFluFornCodFornecedor.AsInteger,[]) Then
  Begin
    msg('Fornecedor NÃO Encontrado !!!', 'A');
    Screen.Cursor:=crDefault;
    EdtFluFornCodFornecedor.Clear;
    EdtFluFornCodFornecedor.SetFocus;
    Exit;
  End;

  // Busca Valor da Data Limite de Conta Corrente ==============================
  cValor:=0.00;
  sDtaLimite:='01.01.1900';
  If DMBelShop.CDS_FluxoFornecedoresLIMITE.AsString='SIM' Then
   sDtaLimite:=DMBelShop.CDS_FluxoFornecedoresDTA_CC.AsString;

  sDtaLimite:=f_Troca('/','.',f_Troca('-','.',sDtaLimite));

  // Acerta Data Limite ========================================================
  If sDtaLimite<>'01.01.1900' Then
   Begin
     MySql:=' SELECT MIN(ff.dta_caixa) dta_caixa'+
            ' FROM FL_CAIXA_FORNECEDORES ff'+
            ' WHERE ff.cod_historico=0'+
            ' AND   ff.cod_fornecedor='+IntToStr(EdtFluFornCodFornecedor.AsInteger)+
            ' AND   ff.dta_caixa>='+QuotedStr(sDtaLimite);
     DMBelShop.CDS_BuscaRapida.Close;
     DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
     DMBelShop.CDS_BuscaRapida.Open;

     If Not DMBelShop.CDS_BuscaRapida.IsEmpty Then
      sDtaLimite:=DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Caixa').AsString;
     DMBelShop.CDS_BuscaRapida.Close;

     sDtaLimite:=f_Troca('/','.',f_Troca('-','.',sDtaLimite));

     // Busca Valor do Saldo Inicial ---------------------------------
     MySql:=' SELECT ff.vlr_saldo'+
            ' FROM fl_caixa_fornecedores ff'+
            ' WHERE ff.cod_historico = 0'+
            ' AND   ff.cod_fornecedor='+IntToStr(EdtFluFornCodFornecedor.AsInteger)+
            ' AND   ff.dta_caixa='+QuotedStr(sDtaLimite);
     DMBelShop.CDS_BuscaRapida.Close;
     DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
     DMBelShop.CDS_BuscaRapida.Open;

     If Not DMBelShop.CDS_BuscaRapida.IsEmpty Then
      cValor:=DMBelShop.CDS_BuscaRapida.FieldByName('Vlr_Saldo').AsCurrency;
     DMBelShop.CDS_BuscaRapida.Close;
   End
  Else
   Begin
     MySql:=' SELECT MIN(ff.dta_caixa) dta_caixa'+
            ' FROM FL_CAIXA_FORNECEDORES ff'+
            ' WHERE ff.cod_historico=0'+
            ' AND   ff.cod_fornecedor='+IntToStr(EdtFluFornCodFornecedor.AsInteger)+
            ' AND   ff.dta_caixa>='+QuotedStr(sDtaLimite);
     DMBelShop.CDS_BuscaRapida.Close;
     DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
     DMBelShop.CDS_BuscaRapida.Open;

     If Not DMBelShop.CDS_BuscaRapida.IsEmpty Then
      sDtaLimite:=DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Caixa').AsString;
     DMBelShop.CDS_BuscaRapida.Close;
   End; // If sDtaLimite<>'01.01.1900' Then
  sDtaLimite:=f_Troca('/','.',f_Troca('-','.',sDtaLimite));

  // Busca Conta Corrente ======================================================
  OdirPanApres.Caption:='AGUARDE !! Localizando Conta Corrente...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmFluxoFornecedor;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  DMBelShop.CDS_FluxoFornecedor.DisableControls;
  DMBelShop.CDS_FluxoFornecedor.Close;
  DMBelShop.SDS_FluxoFornecedor.Params[0].AsCurrency:=cValor;
  DMBelShop.SDS_FluxoFornecedor.Params[1].AsCurrency:=cValor;
  DMBelShop.SDS_FluxoFornecedor.Params[2].AsInteger:=EdtFluFornCodFornecedor.AsInteger;
  DMBelShop.SDS_FluxoFornecedor.Params[3].AsString:=sDtaLimite;

  DMBelShop.SDS_FluxoFornecedor.Params[4].AsCurrency:=cValor;
  DMBelShop.SDS_FluxoFornecedor.Params[5].AsCurrency:=cValor;
  DMBelShop.SDS_FluxoFornecedor.Params[6].AsInteger:=EdtFluFornCodFornecedor.AsInteger;
  DMBelShop.SDS_FluxoFornecedor.Params[7].AsString:=sDtaLimite;
  DMBelShop.CDS_FluxoFornecedor.Open;
  DMBelShop.CDS_FluxoFornecedor.EnableControls;
  OdirPanApres.Visible:=False;

  If DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
  Begin
    Screen.Cursor:=crDefault;
    EdtFluFornFornecedor.Clear;
    EdtFluFornCodFornecedor.Clear;

    DMBelShop.CDS_FluxoFornecedor.Close;
    msg('Sem Movimento de Caixa a Listar','A');
    Exit;
  End;
  PC_Principal.ActivePage:=Ts_FluxFornCaixa;
  PC_PrincipalChange(Self);

  DMBelShop.CDS_FluxoFornecedor.Last;

  Dbg_FluFornCaixa.SetFocus;

  Screen.Cursor:=crDefault;
end;

procedure TFrmFluxoFornecedor.Dbg_FluFornCaixaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If not (gdSelected in State) Then
  Begin
    If DMBelShop.CDS_FluxoFornecedorNUM_SEQ.AsInteger=0 then
    Begin
      Dbg_FluFornCaixa.Canvas.Brush.Color:=clSkyBlue;
      Dbg_FluFornCaixa.Canvas.Font.Style:=[fsBold];
    End; // If DMBelShop.CDS_FluxoFornecedorNUM_SEQ.AsInteger=0 then

    If DMBelShop.CDS_FluxoFornecedorNUM_SEQ.AsInteger=999999 then
    Begin
      Dbg_FluFornCaixa.Canvas.Brush.Color:=clSilver;
      Dbg_FluFornCaixa.Canvas.Font.Style:=[fsBold];
    End; // If DMBelShop.CDS_FluxoFornecedorNUM_SEQ.AsInteger=999999 then

    If (Column.FieldName='PER_REDUCAO') Then // Este comando altera cor da Celula
    Begin
      If DMBelShop.CDS_FluxoFornecedorPER_REDUCAO.AsCurrency>0.00 then
       Dbg_FluFornCaixa.Canvas.Font.Style:=[fsBold];
    End; // If (Column.FieldName='PER_REDUCAO') Then // Este comando altera cor da Celula

    If (Column.FieldName='VLR_SALDO') Then // Este comando altera cor da Celula
    Begin
      If DMBelShop.CDS_FluxoFornecedorVLR_SALDO.AsCurrency<0.00 then
      Begin
        Dbg_FluFornCaixa.Canvas.Font.Color:=clRed;
      End;
    End; // If (Column.FieldName='VLR_SALDO') Then // Este comando altera cor da Celula

    Dbg_FluFornCaixa.Canvas.FillRect(Rect);
    Dbg_FluFornCaixa.DefaultDrawDataCell(Rect,Column.Field,state);
  End; // If not (gdSelected in State) Then

  // Alinhamentos
  DMBelShop.CDS_FluxoFornecedorDATA.Alignment:=taCenter;
  DMBelShop.CDS_FluxoFornecedorLOJA.Alignment:=taCenter;
  DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.Alignment:=taRightJustify;
  DMBelShop.CDS_FluxoFornecedorNUM_DOCUMENTO.Alignment:=taRightJustify;
  DMBelShop.CDS_FluxoFornecedorDTA_ORIGEM.Alignment:=taCenter;
  DMBelShop.CDS_FluxoFornecedorNUM_DOCUMENTO.Alignment:=taRightJustify;
  DMBelShop.CDS_FluxoFornecedorVLR_ORIGEM.Alignment:=taRightJustify;
  DMBelShop.CDS_FluxoFornecedorPER_REDUCAO.Alignment:=taRightJustify;
  DMBelShop.CDS_FluxoFornecedorVLR_CREDITO.Alignment:=taRightJustify;
  DMBelShop.CDS_FluxoFornecedorVLR_DEBITO.Alignment:=taRightJustify;
  DMBelShop.CDS_FluxoFornecedorVLR_SALDO.Alignment:=taRightJustify;
  DMBelShop.CDS_FluxoFornecedorCOD_EMPRESA.Alignment:=taRightJustify;

end;

procedure TFrmFluxoFornecedor.ApplicationEvents1Message(var Msg: tagMSG;var Handled: Boolean);
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

procedure TFrmFluxoFornecedor.Dbg_FluFornCaixaEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_FluFornCaixaEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;
end;

procedure TFrmFluxoFornecedor.Dbg_FluFornCaixaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if ((Shift=[ssCtrl]) and (key=vk_delete)) THEN
   Abort;

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornecEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_FluFornFornecEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornComprovEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_FluFornComprovEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmFluxoFornecedor.Bt_FluFornBuscaFornecedorClick(Sender: TObject);
Var
  MySql: String;
begin
  EdtFluFornCodFornecedor.Clear;
  EdtFluFornFornecedor.Clear;

  If sgDMLMovto='' Then
   DMBelShop.CDS_FluxoFornecedor.Close;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Consulta Normal
  If sgDMLMovto='' Then
  Begin
    MySql:=' SELECT DISTINCT c.des_vinculado nomefornecedor,'+
           '                 c.cod_vinculado codfornecedor'+
           ' FROM FL_CAIXA_FORNECEDORES c'+
           ' WHERE c.num_seq<>0'+
           ' AND   c.num_seq<>999999'+
           ' ORDER BY 2';
  End; // If sgDMLMovto='' Then

  // Busca Fornecedor Novo =====================================================
  If sgDMLMovto='N' Then
  Begin
    MySql:=' SELECT fo.razao_cliente nomefornecedor, fo.cod_cliente codfornecedor'+
           ' FROM LINXCLIENTESFORNEC fo'+
           ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
           ' AND NOT ('+
           '         (UPPER(fo.razao_cliente) LIKE ''%NAO USAR%'')'+
           '         OR'+
           '         (UPPER(fo.razao_cliente) LIKE ''%NÃO USAR%'')'+
           '         OR'+
           '         (UPPER(fo.nome_cliente) LIKE ''%NAO USAR%'')'+
           '         OR'+
           '         (UPPER(fo.nome_cliente) LIKE ''%NÃO USAR%'')'+
           '        )'+
           ' AND NOT EXISTS (SELECT 1'+
           '                 FROM FL_CAIXA_FORNECEDORES fl'+
           '                 WHERE (fl.cod_fornecedor=fo.cod_cliente'+
           '                        Or'+
           '                        fl.cod_vinculado=fo.cod_cliente))'+
           ' ORDER BY 1';
  End; // If sgDMLMovto='N' Then
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('codfornecedor').AsString)='' Then
  Begin
    msg('Sem FORNECEDOR a Listar !!','A');
    EdtFluFornCodFornecedor.Clear;
    FreeAndNil(FrmPesquisa);
    EdtFluFornCodFornecedor.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='NomeFornecedor';
  FrmPesquisa.Campo_Codigo:='CodFornecedor';
  FrmPesquisa.Campo_Descricao:='NomeFornecedor';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    EdtFluFornCodFornecedor.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtFluFornCodFornecedorExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornecDblClick(Sender: TObject);
begin
  If (DMBelShop.CDS_FluxoFornecedores.IsEmpty) Or (DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger<3) Then
   Exit;

  EdtFluFornCodFornecedor.Text:=DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsString;
  EdtFluFornCodFornecedorExit(Self);
end;

procedure TFrmFluxoFornecedor.Bt_FluFornSalvaMemoriaClick(Sender: TObject);
begin
  //============================================================================
  // Salva Lista de Fornecedores ===============================================
  //============================================================================
  If (PC_Principal.ActivePage=Ts_FluxFornApres) And (Ts_FluxFornApres.CanFocus) Then
  Begin
    DMBelShop.bgFluxoFornAfterScroll:=False;
    Dbg_FluFornFornec.SetFocus;

    If Not DMBelShop.CDS_FluxoFornecedores.IsEmpty Then
    Begin
      DBGridClipboard(Dbg_FluFornFornec);
      Dbg_FluFornFornec.SetFocus;
    End;
    DMBelShop.bgFluxoFornAfterScroll:=True;
  End; // If (PC_Principal.ActivePage=Ts_FluxFornApres) And (Ts_FluxFornApres.CanFocus) Then
  // Salva Lista de Fornecedores ===============================================
  //============================================================================

  //============================================================================
  // Salva Conta Corrente do Fornecedor ========================================
  //============================================================================
  If (PC_Principal.ActivePage=Ts_FluxFornCaixa) And (Ts_FluxFornCaixa.CanFocus) Then
  Begin
    Dbg_FluFornCaixa.SetFocus;

    If Not DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
    Begin
      DBGridClipboard(Dbg_FluFornCaixa);
      Dbg_FluFornCaixa.SetFocus;
    End;
  End; // If (PC_Principal.ActivePage=Ts_FluxFornCaixa) And (Ts_FluxFornCaixa.CanFocus) Then
  // Salva Conta Corrente do Fornecedor ========================================
  //============================================================================

  //============================================================================
  // Processa Fornecedores Vinculados ==========================================
  //============================================================================
  If (PC_Principal.ActivePage=Ts_FluxFornVinculos) And (Ts_FluxFornVinculos.CanFocus) Then
  Begin
    Dbg_FornVinculo.SetFocus;

    If msg('Deseja Realmente Salvar'+cr+cr+'Alterações Efetuadas ??','C')=2 Then
     Exit;

    FornVincAtualizaVinculos;
  End; // If (PC_Principal.ActivePage=Ts_FluxFornCaixa) And (Ts_FluxFornCaixa.CanFocus) Then
  // Processa Fornecedores Vinculados ==========================================
  //============================================================================

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornComprovDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If DMBelShop.CDS_FluxoFornHistorico.IsEmpty Then
   Exit;

  If (Column.FieldName='DEB_CRE') Then
  Begin
    If DMBelShop.CDS_FluxoFornHistoricoDEB_CRE.AsString='Crédito' then
     Dbg_FluFornComprov.Canvas.Brush.Color:=$00BBFFDD
    Else
     Dbg_FluFornComprov.Canvas.Brush.Color:=$00D2D2FF;

    Dbg_FluFornComprov.Canvas.FillRect(Rect);
    Dbg_FluFornComprov.DefaultDrawDataCell(Rect,Column.Field,state);
  End;


end;

procedure TFrmFluxoFornecedor.PopM_FluFornSIMClick(Sender: TObject);
begin
  If (DMBelShop.CDS_FluxoFornecedores.IsEmpty) Or (DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger<3) Then
   Exit;

  If Trim(DMBelShop.CDS_FluxoFornecedoresDTA_CC.AsString)='' Then
  Begin
    ShowMessage('Sem Data Conta Corrente !!');
    Exit;
  End;

  DMBelShop.CDS_FluxoFornecedores.Edit;

  If (Sender is TMenuItem) Then
  Begin
    If Trim((Sender as TMenuItem).Name)='PopM_FluFornSIM' Then
     DMBelShop.CDS_FluxoFornecedoresLIMITE.AsString:='SIM';

    If Trim((Sender as TMenuItem).Name)='PopM_FluFornNAO' Then
     DMBelShop.CDS_FluxoFornecedoresLIMITE.AsString:='NAO';
  End; // If (Sender is TMenuItem) Then

  DMBelShop.CDS_FluxoFornecedores.Post;
end;

procedure TFrmFluxoFornecedor.Bt_FluFornComprovanteClick(Sender: TObject);
Var
  MySql: String;
  s, sDesHist: String;
begin
  EdtFluFornComprovante.Clear;
  Dbg_FluFornComprov.SetFocus;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT c.nomecomprovante Descricao, c.codcomprovante Codigo'+
         ' FROM COMPRV c'+
         ' WHERE c.codloja='+QuotedStr('99')+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Codigo').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    EdtFluFornComprovante.Clear;
    FreeAndNil(FrmPesquisa);
    Bt_FluFornComprovante.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Descricao';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Descricao';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.Dbg_Pesquisa.Columns[0].Width:=400;
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    sDesHist:=FrmPesquisa.EdtCodigo.Text+' - '+Trim(FrmPesquisa.EdtDescricao.Text);
    EdtFluFornComprovante.Text:=sDesHist;

    // Verifica se Já Existe ----------------------------------------
    If DMBelShop.CDS_FluxoFornHistorico.Locate('COD_HISTORICO',Trim(FrmPesquisa.EdtCodigo.Text),[]) Then
    Begin
      msg('Comprovante Já Informado !!','A');
      EdtFluFornComprovante.Clear;
      FreeAndNil(FrmPesquisa);
      Bt_FluFornComprovante.SetFocus;
      Exit;
    End;

    s:='Débito';
    If Rb_FluFornCredito.Checked Then
     s:='Crédito';

    If msg('O Comprovante Selecionado'+cr+' Como '+s+cr+cr+'Esta Correto ?','C')=2 Then
    Begin
      EdtFluFornComprovante.Clear;
      Exit;
    End;

    If Not DML_Historicos('I',FrmPesquisa.EdtCodigo.Text, Copy(s,1,1), Trim(FrmPesquisa.EdtDescricao.Text)) Then
     MessageBox(Handle, pChar(sgMensagemERRO), 'Erro', MB_ICONERROR);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  OdirPanApres.Visible:=False;
  EdtFluFornComprovante.Clear;
  Screen.Cursor:=crDefault;
  FreeAndNil(FrmPesquisa);
end;

procedure TFrmFluxoFornecedor.Rb_FluFornDebitoClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_FluFornCredito);
  AcertaRb_Style(Rb_FluFornDebito);
end;

procedure TFrmFluxoFornecedor.Rb_FluFornDebitoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Rb_FluFornDebitoClick(Self);

end;

procedure TFrmFluxoFornecedor.Bt_FluFornFiltroCompradorClick(Sender: TObject);
Var
  s, MySql: String;
  ii, i, iRecno: Integer;
  bFiltra: Boolean;
begin

  If (PC_Principal.ActivePage=Ts_FluxFornApres) And (Ts_FluxFornApres.CanFocus) Then
  Begin
    Dbg_FluFornFornec.SetFocus;
    If DMBelShop.CDS_FluxoFornecedores.IsEmpty Then
     Exit;
  End;

  If (PC_Principal.ActivePage=Ts_FluxFornCaixa) And (Ts_FluxFornCaixa.CanFocus) Then
  Begin
    Dbg_FluFornCaixa.SetFocus;
    If DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
     Exit;
  End;

  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(18);

  // Seleciona Comprador =======================================================
  If Bt_FluFornFiltroComprador.Caption='Seleciona Comprador' Then
  Begin
    msg('Opção Desativada Momentaneamente !!','A');
     Exit;

    // Apresenta Compradores ===================================================
    MySql:=' SELECT ''NAO'' PROC, CC.NOMESUBCUSTO comprador, COALESCE(CC.CODCENTROCUSTO,0) codigo'+
           ' FROM CENTROCUSTO CC'+
           ' WHERE  CC.NOMECUSTO=''COMPRAS'''+
           ' UNION'+
           ' SELECT ''NAO'', ''SEM COMPRADOR'', 0'+
           ' FROM RDB$DATABASE'+
           ' ORDER BY 2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    FrmSolicitacoes.Caption:='SELECIONAR COMPRADOR';
  End; // If Bt_FluFornFiltroComprador.Caption='Seleciona Comprador' Then

  // Seleciona Comprovante =====================================================
  If Bt_FluFornFiltroComprador.Caption='Seleciona Histórico' Then
  Begin
    // Apresenta Comprovantes ==================================================
    MySql:=' SELECT ''NAO'' PROC, H.COD_HISTORICO, H.DES_HISTORICO,'+
           ' CASE'+
           '   WHEN H.IND_DEBCRE=''D'' THEN'+
           '     ''DÉBITO'''+
           '   ELSE'+
           '     ''CRÉDITO'''+
           ' END DEB_CRE'+
           ' FROM FL_CAIXA_HISTORICOS H'+
           ' WHERE H.COD_HISTORICO<>0'+
           ' AND   H.COD_HISTORICO<>999999'+
           ' ORDER BY 2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    FrmSolicitacoes.Caption:='SELECIONAR COMPROVANTE';
  End; // If Bt_FluFornFiltroComprador.Caption='Seleciona Histórico' Then

  FrmSolicitacoes.bgOK:=False;
  FrmSolicitacoes.ShowModal;

  Screen.Cursor:=crAppStart;
  If DMBelShop.CDS_FluxoFornecedor.Filtered Then
  Begin
    DMBelShop.CDS_FluxoFornecedor.Filtered:=False;
    DMBelShop.CDS_FluxoFornecedor.Filter:='';
  End;

  If FrmSolicitacoes.bgOK Then
  Begin
    If Bt_FluFornFiltroComprador.Caption='Seleciona Comprador' Then
    Begin
      i:=0;
      DMBelShop.CDS_Busca.First;
      While Not DMBelShop.CDS_Busca.Eof do
      Begin
        If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then
        Begin
          Inc(i);
          s:=s+';'+DMBelShop.CDS_Busca.FieldByName('Codigo').AsString;
        End;

        DMBelShop.CDS_Busca.Next;
      End; // While Not DMBelShop.CDS_Busca.Eof do
      DMBelShop.CDS_Busca.Close;

      If Trim(s)<>'' Then
       s:=s+';';

      FiltraComprador(s,i);
    End; // If Bt_FluFornFiltroComprador.Caption='Seleciona Comprador' Then

    If Bt_FluFornFiltroComprador.Caption='Seleciona Histórico' Then
    Begin
      iRecno:=DMBelShop.CDS_FluxoFornecedor.RecNo;

      i:=0;
      ii:=0;
      s:='';
      bFiltra:=True;
      DMBelShop.CDS_Busca.First;
      DMBelShop.CDS_Busca.DisableControls;
      While Not DMBelShop.CDS_Busca.Eof do
      Begin
        If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then
         Begin
           Inc(i);

           If Trim(s)='' Then
            s:='COD_HISTORICO='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString)
           Else
            s:=s+' OR COD_HISTORICO='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString);
         End
        Else
         Begin
           inc(ii);
         End;

        DMBelShop.CDS_Busca.Next;
      End; // While Not DMBelShop.CDS_Busca.Eof do
      If (i=DMBelShop.CDS_Busca.RecordCount) Or (ii=DMBelShop.CDS_Busca.RecordCount)  Then
       bFiltra:=False;

      DMBelShop.CDS_Busca.Close;
      DMBelShop.CDS_Busca.EnableControls;

      DMBelShop.CDS_FluxoFornecedor.DisableControls;
      DMBelShop.CDS_FluxoFornecedor.Filtered:=False;
      DMBelShop.CDS_FluxoFornecedor.Filter:='';
      If bFiltra Then
      Begin
        DMBelShop.CDS_FluxoFornecedor.Filter:=s;
        DMBelShop.CDS_FluxoFornecedor.Filtered:=True;

        If DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
        Begin
          msg('Histórico Não Encontrado'+cr+cr+'no Movimento do Fornecedor !! ','A');
          DMBelShop.CDS_FluxoFornecedor.Filtered:=False;
          DMBelShop.CDS_FluxoFornecedor.Filter:='';
          DMBelShop.CDS_FluxoFornecedor.RecNo:=iRecno;
        End; // If DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
        DMBelShop.CDS_FluxoFornecedor.EnableControls;
      End;
    End; // If Bt_FluFornFiltroComprador.Caption='Seleciona Histórico' Then
  End; // If FrmSolicitacoes.bgOK Then
  Screen.Cursor:=crDefault;

  DMBelShop.CDS_Busca.Close;

  FreeAndNil(FrmSolicitacoes);

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornComprovKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If DMBelShop.CDS_FluxoFornHistorico.IsEmpty Then
   Exit;

  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if (Shift=[ssCtrl]) and (Key=46) then
    Key:=0;

  // Exclui Comprovante ========================================================
//  if (Key=VK_Delete) And (bgPodeUsar) Then
//  Begin
//    If Not DML_Historicos('E',DMBelShop.CDS_FluxoFornHistoricoCOD_HISTORICO.AsString) Then
//     MessageBox(Handle, pChar(sgMensagemERRO), 'Erro', MB_ICONERROR);
//  End; // if (Key=VK_Delete) Then

end;

procedure TFrmFluxoFornecedor.PC_FluxFornParametrosChange(Sender: TObject);
begin

  If bgPodeUsar Then
   CorSelecaoTabSheet(PC_FluxFornParametros);

  If (PC_FluxFornParametros.ActivePage=Ts_FluxFornParamComprv) And (Ts_FluxFornParamComprv.CanFocus) Then
  Begin
    Dbg_FluFornComprov.SetFocus;
  End;

  If (PC_FluxFornParametros.ActivePage=Ts_FluxFornParamReducao) And (Ts_FluxFornParamReducao.CanFocus) Then
  Begin
    Ts_FluxFornManutReducao.TabVisible:=False;
    Dbg_FluFornFornReducao.SetFocus;
  End;

  If (PC_FluxFornParametros.ActivePage=Ts_FluxFornManutReducao) And (Ts_FluxFornManutReducao.CanFocus) Then
  Begin
    Try
      EdtFluxFornManutCodForn.SetFocus;
    Except
     Gb_FluxFornManutReducao.SetFocus;
    End;
  End;
end;

procedure TFrmFluxoFornecedor.Bt_FluxFornManutReducaoVoltarClick(Sender: TObject);
begin
 bgVoltaPerReducao:=False;
 PercReducaoHabiita_GroupBox(True);

 Ts_FluxFornParamReducao.TabVisible:=True;
 Ts_FluxFornManutReducao.TabVisible:=False;
 Ts_FluxFornParamComprv.TabVisible:=True;

 Dbg_FluFornFornec.SetFocus;
end;

procedure TFrmFluxoFornecedor.Bt_FluxFornManutReducaoIncluirClick(Sender: TObject);
begin

  // Inicializa Campos =========================================================
  EdtFluxFornManutCodForn.Clear;
  EdtFluxFornManutDesForn.Clear;
  EdtFluxFornManutCodComprv.Clear;
  EdtFluxFornManutDesComprv.Clear;

  sgDtaMinCC:='';

  DtEdt_FluxFornManutDtaInicial.Date:=StrToDate(DateToStr(
                            DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)));
  DtEdt_FluxFornManutDtaFinal.Clear;

  EdtFluxFornManutPercentual.Value:=0.00;

  // Libera Campos se Sair do Ts_FluxFornManutReducao ==========================
  bgVoltaPerReducao:=True;
  PercReducaoHabiita_GroupBox(True);

  // Apresenta Ts_FluxFornManutReducao =========================================
  Ts_FluxFornParamComprv.TabVisible:=False;
  Ts_FluxFornParamReducao.TabVisible:=False;
  Ts_FluxFornManutReducao.TabVisible:=True;
  PC_FluxFornParametrosChange(Self);
  Bt_FluxFornManutReducaoSalvar.Caption:='Incluir';

end;

procedure TFrmFluxoFornecedor.Ts_FluxFornManutReducaoExit(Sender: TObject);
begin
  If bgVoltaPerReducao Then
   Bt_FluxFornManutReducaoVoltarClick(Self);

  PercReducaoHabiita_GroupBox(True);
end;

procedure TFrmFluxoFornecedor.Bt_FluxFornManutReducaoSalvarClick(Sender: TObject);
Var
  MySql: String;
begin
  Gb_FluxFornManutReducao.SetFocus;

  //============================================================================
  // EXCUIR PERCENTUAL DE REDUÇÃO ==============================================
  //============================================================================
  If Bt_FluxFornManutReducaoSalvar.Caption='Excluir' Then
  Begin
    If msg('Deseja Realmente EXCLUIR o Percentual'+cr+cr+'de Redução Selecionado ??','C')=2 Then
    Begin
      Bt_FluxFornManutReducaoVoltarClick(Self);
      Exit
    End;

    sgNumSeq:=DMBelShop.CDS_FluxoPercReducaoNUM_SEQ.AsString;

    // Processa Percentual de Redução ============================================
    CalculaPercReducao;

    // Reabre Client's de Percentual de Redução ==================================
    DMBelShop.CDS_FluxoPercReducao.Close;

    DMBelShop.CDS_FluxoFornReducao.Close;
    DMBelShop.CDS_FluxoFornReducao.Open;

    // Posiciona no Fornecedor =================================================
    DMBelShop.CDS_FluxoFornReducao.Locate('COD_FORNECEDOR', EdtFluxFornManutCodForn.AsInteger,[]);

    DMBelShop.CDS_FluxoPercReducao.Locate('NUM_SEQ', sgNumSeq,[]);

    sgNumSeq  :='';
    sgDtaF    :='';
    sgDtaI    :='';
    sgDtaMinCC:='';

    // Volta =====================================================================
    Bt_FluxFornManutReducaoVoltarClick(Self);

    Exit
  End; // If Bt_FluxFornManutReducaoSalvar.Caption='Excluir' Then

  //============================================================================
  // Consiste - INICIO =========================================================
  //============================================================================
  If EdtFluxFornManutCodForn.AsInteger=0 Then
  Begin
    msg('Favor Informar o Fornecedor !!','A');
    EdtFluxFornManutCodForn.SetFocus;
    Exit;
  End;

  If EdtFluxFornManutCodComprv.AsInteger=0 Then
  Begin
    msg('Favor Informar o Comprovante !!','A');
    EdtFluxFornManutCodComprv.SetFocus;
    Exit;
  End;

  // Consiste Período ==========================================================
  If (Trim(DtEdt_FluxFornManutDtaInicial.Text)<>'') Or (Trim(DtEdt_FluxFornManutDtaFinal.Text)<>'') Then
   Begin
     Try
       StrToDate(DtEdt_FluxFornManutDtaInicial.Text);
     Except
       msg('Data Inicial do Período Inválida !!','A');
       DtEdt_FluxFornManutDtaInicial.SetFocus;
       Exit;
     End;

     If Trim(DtEdt_FluxFornManutDtaFinal.Text)<>'' Then
     Begin
       Try
         StrToDate(DtEdt_FluxFornManutDtaFinal.Text);
       Except
         msg('Data Final do Período Inválida !!','A');
         DtEdt_FluxFornManutDtaFinal.SetFocus;
         Exit;
       End;

       If DtEdt_FluxFornManutDtaFinal.Date<DtEdt_FluxFornManutDtaInicial.Date Then
       Begin
         msg('Período Inválido !!','A');
         DtEdt_FluxFornManutDtaInicial.SetFocus;
         Exit;
       End;
     End; // If Trim(DtEdt_FluxFornManutDtaFinal.Text)<>'') Then
   End
  Else // If (Trim(DtEdt_FluxFornManutDtaInicial.Text)<>'') Or (Trim(DtEdt_FluxFornManutDtaFinal.Text)<>'') Then
   Begin
     msg('Período Inválido !!','A');
     DtEdt_FluxFornManutDtaInicial.SetFocus;
     Exit;
   End; // If (Trim(DtEdt_FluxFornManutDtaInicial.Text)<>'') Or (Trim(DtEdt_FluxFornManutDtaFinal.Text)<>'') Then
  //============================================================================
  // Consiste - FIM ============================================================
  //============================================================================

  // Examina Conflito de Datas =================================================
  sgDtaI:=f_Troca('/','.',f_Troca('-','.',DtEdt_FluxFornManutDtaInicial.Text));
  sgDtaF:=f_Troca('/','.',f_Troca('-','.',DtEdt_FluxFornManutDtaFinal.Text));

  // Acerta Data Minima para Calculo ===========================================
  If Trim(sgDtaMinCC)='' Then
   sgDtaMinCC:=sgDtaI;

  If StrToDate(f_Troca('.','/',sgDtaMinCC))>StrToDate(f_Troca('.','/',sgDtaI)) Then
   sgDtaMinCC:=sgDtaI;

  // Apropria Num_Seq ==========================================================
  sgNumSeq:='';
  If Bt_FluxFornManutReducaoSalvar.Caption='Alterar' Then
   sgNumSeq:=DMBelShop.CDS_FluxoPercReducaoNUM_SEQ.AsString;

  MySql:=' SELECT fr.num_seq'+
         ' FROM FL_CAIXA_PERC_REDUCAO fr'+
         ' WHERE fr.cod_fornecedor='+IntToStr(EdtFluxFornManutCodForn.AsInteger)+
         ' AND   fr.cod_comprovante='+QuotedStr(EdtFluxFornManutCodComprv.text)+

         ' AND ((CAST('+QuotedStr(sgDtaI)+' AS DATE) BETWEEN fr.dta_incio AND COALESCE(fr.dta_fim,cast(''31.12.3000'' as Date)))'+
         '       OR';

         If Trim(sgDtaF)<>'' Then
          MySql:=
           MySql+'      (CAST('+QuotedStr(sgDtaF)+' AS DATE) BETWEEN fr.dta_incio AND COALESCE(fr.dta_fim,cast(''31.12.3000'' as Date))))'
         Else
          MySql:=
           MySql+'      (CAST(''31.12.3000'' AS DATE) BETWEEN fr.dta_incio AND COALESCE(fr.dta_fim,cast(''31.12.3000'' as Date))))';

         If Trim(sgNumSeq)<>'' Then
          MySql:=
           MySql+' AND   fr.num_seq<>'+QuotedStr(sgNumSeq);
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  If Trim(DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString)<>'' Then
  Begin
    msg('Detectado Conflito de Datas !!'+cr+cr+'Favor Examinar !!', 'A');
    DMBelShop.CDS_Busca.Close;
    EdtFluxFornManutCodForn.SetFocus;
    Exit;
  End;
  DMBelShop.CDS_Busca.Close;

  // Busca Num_Seq =============================================================
  If Trim(sgNumSeq)='' Then
  Begin
    MySql:=' SELECT COALESCE(MAX(r.num_seq) + 1, 1) num_seq'+
           ' FROM FL_CAIXA_PERC_REDUCAO r';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;
    sgNumSeq:=DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString;
    DMBelShop.CDS_Busca.Close;
  End; // If Trim(sgNumSeq)='' Then

  // Processa Percentual de Redução ============================================
  CalculaPercReducao;

  // Reabre Client's de Percentual de Redução ==================================
  DMBelShop.CDS_FluxoFornReducao.Close;
  DMBelShop.CDS_FluxoFornReducao.Open;
  DMBelShop.CDS_FluxoFornReducao.Locate('COD_FORNECEDOR', EdtFluxFornManutCodForn.AsInteger,[]);

  DMBelShop.CDS_FluxoPercReducao.Locate('NUM_SEQ', sgNumSeq,[]);

  sgNumSeq  :='';
  sgDtaF    :='';
  sgDtaI    :='';
  sgDtaMinCC:='';

  // Volta =====================================================================
  Bt_FluxFornManutReducaoVoltarClick(Self);

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornPercReducaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if (Shift=[ssCtrl]) and (Key=46) then
    Key:=0;

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornReducaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if (Shift=[ssCtrl]) and (Key=46) then
    Key:=0;
end;

procedure TFrmFluxoFornecedor.EdtFluxFornManutCodFornExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtFluxFornManutDesForn.Clear;
  If EdtFluxFornManutCodForn.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Fornecedores ======================================================
    MySql:=' SELECT distinct cf.cod_vinculado codfornecedor,'+
           '                 cf.des_vinculado nomefornecedor'+
           ' FROM FL_CAIXA_FORNECEDORES cf'+
           ' WHERE cf.num_seq<>0'+
           ' AND   cf.num_seq<>999999'+
           ' AND   cf.cod_vinculado='+IntToStr(EdtFluxFornManutCodForn.AsInteger);
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    Screen.Cursor:=crDefault;

    If Trim(DMBelShop.CDS_Busca.FieldByName('codfornecedor').AsString)='' Then
    Begin
      msg('Fornecedor NÃO Encontrado !!!', 'A');
      DMBelShop.CDS_Busca.Close;
      EdtFluxFornManutCodForn.Clear;
      EdtFluxFornManutCodForn.SetFocus;
      Exit;
    End;

    EdtFluxFornManutDesForn.Text:=Trim(DMBelShop.CDS_Busca.FieldByName('NomeFornecedor').AsString);

    DMBelShop.CDS_Busca.Close;
  End;
end;

procedure TFrmFluxoFornecedor.Bt_FluxFornManutBuscaFornClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtFluxFornManutCodForn.Clear;
  EdtFluxFornManutDesForn.Clear;
  EdtFluxFornManutCodForn.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ======================================================
  MySql:=' SELECT distinct cf.des_vinculado nomefornecedor,'+
         '                 cf.cod_vinculado codfornecedor'+
         ' FROM FL_CAIXA_FORNECEDORES cf'+
         ' WHERE cf.num_seq<>0'+
         ' AND   cf.num_seq<>999999'+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('CodFornecedor').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Fornecedor a Listar !!','A');
    EdtFluxFornManutCodForn.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='nomefornecedor';
  FrmPesquisa.Campo_Codigo:='codfornecedor';
  FrmPesquisa.Campo_Descricao:='nomefornecedor';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtFluxFornManutCodForn.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtFluxFornManutCodFornExit(Self);
   End
  Else
   Begin
     EdtFluxFornManutCodForn.Clear;
     EdtFluxFornManutDesForn.Clear;
     EdtFluxFornManutCodForn.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmFluxoFornecedor.EdtFluxFornManutCodComprvExit(Sender: TObject);
Var
  MySql: String;
begin
                          
  EdtFluxFornManutDesComprv.Clear;
  If EdtFluxFornManutCodComprv.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Fornecedores ======================================================
    MySql:=' SELECT hi.des_historico, hi.cod_historico'+
           ' FROM FL_CAIXA_HISTORICOS hi'+
           ' WHERE hi.cod_historico NOT IN (0, 999999)'+
           ' AND   hi.cod_historico='+EdtFluxFornManutCodComprv.Text;
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    Screen.Cursor:=crDefault;

    If Trim(DMBelShop.CDS_Busca.FieldByName('cod_historico').AsString)='' Then
    Begin
      msg('Comprovante NÃO Encontrado !!!', 'A');
      DMBelShop.CDS_Busca.Close;
      EdtFluxFornManutCodComprv.Clear;
      EdtFluxFornManutCodComprv.SetFocus;
      Exit;
    End;

    EdtFluxFornManutDesComprv.Text:=Trim(DMBelShop.CDS_Busca.FieldByName('Des_Historico').AsString);

    DMBelShop.CDS_Busca.Close;
  End;
end;

procedure TFrmFluxoFornecedor.Bt_FluxFornManutBuscaComprvClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtFluxFornManutCodComprv.Clear;
  EdtFluxFornManutDesComprv.Clear;
  EdtFluxFornManutCodComprv.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

    // Busca Fornecedores ======================================================
    MySql:=' SELECT hi.des_historico, hi.cod_historico'+
           ' FROM FL_CAIXA_HISTORICOS hi'+
           ' WHERE hi.cod_historico NOT IN (0, 999999)'+
           ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('cod_historico').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Comprovante a Listar !!','A');
    EdtFluxFornManutCodComprv.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='des_historico';
  FrmPesquisa.Campo_Codigo:='cod_historico';
  FrmPesquisa.Campo_Descricao:='des_historico';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtFluxFornManutCodComprv.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtFluxFornManutCodComprvExit(Self);
   End
  Else
   Begin
     EdtFluxFornManutCodComprv.Clear;
     EdtFluxFornManutDesComprv.Clear;
     EdtFluxFornManutCodComprv.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmFluxoFornecedor.Bt_FluxFornManutReducaoAlterarClick(Sender: TObject);
begin
  If DMBelShop.CDS_FluxoFornReducao.IsEmpty Then
   Exit;

  // Inicializa Campos =========================================================
  EdtFluxFornManutCodForn.AsInteger:=DMBelShop.CDS_FluxoFornReducaoCOD_FORNECEDOR.AsInteger;
  EdtFluxFornManutDesForn.Text:=DMBelShop.CDS_FluxoFornReducaoNOMEFORNECEDOR.AsString;
  EdtFluxFornManutCodComprv.Text:=DMBelShop.CDS_FluxoPercReducaoCOD_COMPRV.AsString;
  EdtFluxFornManutDesComprv.Text:=DMBelShop.CDS_FluxoPercReducaoNOMECOMPROVANTE.AsString;

  DtEdt_FluxFornManutDtaInicial.Text:=DMBelShop.CDS_FluxoPercReducaoDTA_INCIO.AsString;
  DtEdt_FluxFornManutDtaFinal.Text:=DMBelShop.CDS_FluxoPercReducaoDTA_FIM.AsString;

  EdtFluxFornManutPercentual.Value:=DMBelShop.CDS_FluxoPercReducaoPER_REDUCAO.AsFloat;

  sgDtaMinCC:=DMBelShop.CDS_FluxoPercReducaoDTA_INCIO.AsString;

  // Libera Campos se Sair do Ts_FluxFornManutReducao ==========================
  bgVoltaPerReducao:=True;
  PercReducaoHabiita_GroupBox(True);

  // Apresenta Ts_FluxFornManutReducao =========================================
  Ts_FluxFornParamComprv.TabVisible:=False;
  Ts_FluxFornParamReducao.TabVisible:=False;
  Ts_FluxFornManutReducao.TabVisible:=True;
  PC_FluxFornParametrosChange(Self);
  Bt_FluxFornManutReducaoSalvar.Caption:='Alterar';

end;

procedure TFrmFluxoFornecedor.Bt_FluxFornManutReducaoExcluirClick(Sender: TObject);
begin
  If DMBelShop.CDS_FluxoFornReducao.IsEmpty Then
   Exit;

  // Inicializa Campos =========================================================
  EdtFluxFornManutCodForn.AsInteger:=DMBelShop.CDS_FluxoFornReducaoCOD_FORNECEDOR.AsInteger;
  EdtFluxFornManutDesForn.Text:=DMBelShop.CDS_FluxoFornReducaoNOMEFORNECEDOR.AsString;
  EdtFluxFornManutCodComprv.Text:=DMBelShop.CDS_FluxoPercReducaoCOD_COMPRV.AsString;
  EdtFluxFornManutDesComprv.Text:=DMBelShop.CDS_FluxoPercReducaoNOMECOMPROVANTE.AsString;

  DtEdt_FluxFornManutDtaInicial.Text:=DMBelShop.CDS_FluxoPercReducaoDTA_INCIO.AsString;
  DtEdt_FluxFornManutDtaFinal.Text:=DMBelShop.CDS_FluxoPercReducaoDTA_FIM.AsString;

  EdtFluxFornManutPercentual.Value:=DMBelShop.CDS_FluxoPercReducaoPER_REDUCAO.AsFloat;

  sgDtaMinCC:=DMBelShop.CDS_FluxoPercReducaoDTA_INCIO.AsString;

  // Habilita/Desabilita GroupBox de Percentual de Redução =====================
  PercReducaoHabiita_GroupBox(False);

  // Libera Campos se Sair do Ts_FluxFornManutReducao ==========================
  bgVoltaPerReducao:=True;
  PercReducaoHabiita_GroupBox(False);

  // Apresenta Ts_FluxFornManutReducao =========================================
  Ts_FluxFornParamComprv.TabVisible:=False;
  Ts_FluxFornParamReducao.TabVisible:=False;
  Ts_FluxFornManutReducao.TabVisible:=True;
  PC_FluxFornParametrosChange(Self);
  Bt_FluxFornManutReducaoSalvar.Caption:='Excluir';
end;

procedure TFrmFluxoFornecedor.Bt_FluFornIncluirClick(Sender: TObject);
Var
  MySql, sHist: String;
begin
  Gb_FornVinculado.Enabled:=True;
  EdtValorDoc.Enabled:=True;
  EdtCodLojaDoc.Enabled:=True;
  EdtCodHistDoc.Enabled:=True;

  // Não é Só Observação =======================================================
  bgSoObs:=False;

  // Busca Historicos Utilizados ===============================================
  DMBelShop.CDS_FluxoFornHistorico.Locate('COD_HISTORICO',900,[]);
  sHist:=DMBelShop.CDS_FluxoFornHistoricoDES_HISTORICO.AsString;
  DMBelShop.CDS_FluxoFornHistorico.Locate('COD_HISTORICO',955,[]);
  sHist:=
   sHist+cr+DMBelShop.CDS_FluxoFornHistoricoDES_HISTORICO.AsString;
  DMBelShop.CDS_FluxoFornHistorico.First;

  // Verifica TabSheet Atual ===================================================
  If (PC_Principal.ActivePage=Ts_FluxFornApres) And (Ts_FluxFornApres.CanFocus) Then
   Dbg_FluFornFornec.SetFocus;

  If (PC_Principal.ActivePage=Ts_FluxFornCaixa) And (Ts_FluxFornCaixa.CanFocus) Then
  Begin
    Dbg_FluFornCaixa.SetFocus;

    If DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
     Exit;
  End; // If (PC_Principal.ActivePage=Ts_FluxFornCaixa) And (Ts_FluxFornCaixa.CanFocus) Then

  //============================================================================
  // Relatório Lançamento Débito / Crédito =====================================
  //============================================================================
  If (Sender is TJvXPButton) Then
  Begin
    If (PC_Principal.ActivePage=Ts_FluxFornCaixa) and ((Sender as TJvXPButton).Name='Bt_FluFornImprimir') Then
    Begin
      If (Trim(DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.AsString)='') Or
         ((DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.AsInteger<>900)    And
          (DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.AsInteger<>955))   Then
      Begin
        msg('Impressão Somente dos Históricos:'+cr+cr+sHist,'A');
        Dbg_FluFornCaixa.SetFocus;
        Exit;
      End;

      OdirPanApres.Caption:='AGUARDE !! Montando Relatório..';
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2))-20;
      OdirPanApres.Font.Style:=[fsBold];
      OdirPanApres.Parent:=FrmFluxoFornecedor;
      OdirPanApres.BringToFront();
      OdirPanApres.Visible:=True;
      Refresh;

      // Busca Docto --------------------------------------------------
      MySql:=' SELECT'+
             ' CASE cc.tip_debcre'+
             '    When ''D'' Then ''CONTA CORRENTE DE FORNECEDOR: Documento de DÉBITO'''+
             ' ELSE ''CONTA CORRENTE DE FORNECEDOR: Documento de CRÉDITO'''+
             ' END Tipo,'+
             ' cc.txt_obs,'+
             ' cc.cod_empresa, lj.nome_emp,'+
             ' cc.cod_fornecedor, cc.des_fornecedor,'+
             ' cc.num_documento, cc.num_serie,'+
             ' cc.dta_origem, cc.vlr_origem,'+
             ' cc.dta_caixa, cc.vlr_caixa,'+
             ' cc.cod_historico, hi.des_historico,'+
             ' cc.dta_inclui, cc.dta_altera,'+

             ' ''Usuário Inclusão: ''||ui.des_usuario||'' em ''||'+
             ' Cast(lpad(extract(day   from CAST(cc.dta_inclui as Date)),2,''0'') as varchar(2))||''/''||'+
             ' Cast(lpad(extract(month from CAST(cc.dta_inclui as Date)),2,''0'') as varchar(2))||''/''||'+
             ' Cast(extract(Year from CAST(cc.dta_inclui as Date)) as varchar(4)) usu_incluiu,'+

             ' ''Usuário Alteração: ''||ua.des_usuario||'' em ''||'+
             ' Cast(lpad(extract(day   from CAST(cc.dta_altera as Date)),2,''0'') as varchar(2))||''/''||'+
             ' Cast(lpad(extract(month from CAST(cc.dta_altera as Date)),2,''0'') as varchar(2))||''/''||'+
             ' Cast(extract(Year from CAST(cc.dta_altera as Date)) as varchar(4)) Usu_Alterou,'+

             QuotedStr(Des_Usuario)+' USU_EMISSAO'+

             ' FROM  FL_CAIXA_FORNECEDORES cc'+
             '     LEFT JOIN LINXLOJAS lj           on lj.empresa=cc.cod_empresa'+
             '     LEFT JOIN FL_CAIXA_HISTORICOS hi on hi.cod_historico=cc.cod_historico'+
             '     LEFT JOIN PS_USUARIOS ui         on ui.cod_usuario=cc.usu_inclui'+
             '     LEFT JOIN PS_USUARIOS ua         on ua.cod_usuario=cc.usu_altera'+

             ' WHERE cc.cod_fornecedor='+DMBelShop.CDS_FluxoFornecedorCOD_FORNECEDOR.AsString+
             ' AND   cc.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',
                                    DMBelShop.CDS_FluxoFornecedorDATA.AsString)))+
             ' AND   cc.num_seq  ='+QuotedStr(DMBelShop.CDS_FluxoFornecedorNUM_SEQ.AsString);
      DMBelShop.CDS_Busca1.Close;
      DMBelShop.SDS_Busca1.CommandText:=MySql;
      DMBelShop.CDS_Busca1.Open;

      // Apresenta Relatório =======================================================
      DMRelatorio.frReport1.LoadFromFile(sgPastaRelatorios+'ContaCorrenteLançamento.frf');

      // Apropria DataSet ==========================================================
      DMRelatorio.frDBDataSet1.DataSet:=DMBelShop.CDS_Busca1;

      DMRelatorio.frReport1.PrepareReport;
      DMRelatorio.frReport1.ShowReport;

      // Retorna para o DBGrid
      DMBelShop.CDS_Busca1.Close;

      OdirPanApres.Visible:=False;
      Exit;
    End; // If (PC_Principal.ActivePage=Ts_FluxFornCaixa) and ((Sender as TJvXPButton).Name='Bt_FluFornImprimir') Then
  End; // If (Sender is TJvXPButton) Then
  // Relatório Lançamento Débito / Crédito =====================================
  //============================================================================

  // Data para Processamento dod Caixa =========================================
  sgDtaDoc :='';
  sgNum_SeqCC:='';

  //============================================================================
  // Novo Lançamento (Fornecedor Novo) =========================================
  //============================================================================
  If (PC_Principal.ActivePage=Ts_FluxFornApres) Then
  Begin
    DMBelShop.CDS_FluxoFornecedor.Close;
    igTabSheet:=PC_Principal.TabIndex;
    sgDMLMovto:='N';

    EdtFluFornCodFornecedor.Clear;
    EdtFluFornFornecedor.Clear;
  End; // If (PC_Principal.ActivePage=Ts_FluxFornApres) Then
  // Novo Lançamento (Fornecedor Novo) =========================================
  //============================================================================

  //============================================================================
  // Novo Lançamento (Fornecedor Existente) ====================================
  //============================================================================
  If (Sender is TJvXPButton) Then
  Begin
    If (PC_Principal.ActivePage=Ts_FluxFornCaixa) and ((Sender as TJvXPButton).Name='Bt_FluFornIncluir') Then
    Begin
      Gb_FornVinculado.Visible:=True;
      CarregaComboBoxFornecedorVinculados(DMBelShop.CDS_FluxoFornecedorCOD_FORNECEDOR.AsString);
      If Cbx_FornVinculado.Items.Count<1 Then
       Gb_FornVinculado.Visible:=False;

      igTabSheet:=PC_Principal.TabIndex;
      sgDMLMovto:='I';

      EdtFluFornCodFornecedor.Enabled:=False;
      Bt_FluFornBuscaFornecedor.Enabled:=False;
    End; // If (PC_Principal.ActivePage=Ts_FluxFornCaixa) and ((Sender as TJvXPButton).Name='Bt_FluFornIncluir') Then
  End; // If (Sender is TJvXPButton) Then
  // Novo Lançamento (Fornecedor Existente) ====================================
  //============================================================================

  //============================================================================
  // Altera Lançamento (Fornecedor Existente) ==================================
  //============================================================================
  If (Sender is TJvXPButton) Then
  Begin
    If (PC_Principal.ActivePage=Ts_FluxFornCaixa) and ((Sender as TJvXPButton).Name='Bt_FluFornAlterar') Then
    Begin
      If Trim(DMBelShop.CDS_FluxoFornecedorTXT_OBS.AsString)='DESCARTE DE AVARIAS - Central de Trocas - 13/12/2016' Then
      Begin
        msg('Alteração NÃO Permitida Neste Lançamento !!','A');
        Dbg_FluFornCaixa.SetFocus;
        Exit;
      End; // If Trim(DMBelShop.CDS_FluxoFornecedorTXT_OBS.AsString)='DESCARTE DE AVARIAS - Central de Trocas - 13/12/2016' Then

      If (DMBelShop.CDS_FluxoFornecedores.IsEmpty) Or (Trim(DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.AsString)='') Then
      Begin
        Dbg_FluFornCaixa.SetFocus;
        Exit;
      End; // If (DMBelShop.CDS_FluxoFornecedores.IsEmpty) Or (Trim(DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.AsString)='') Then

      Gb_FornVinculado.Visible:=True;
      CarregaComboBoxFornecedorVinculados(DMBelShop.CDS_FluxoFornecedorCOD_FORNECEDOR.AsString);
      MySql:=DMBelShop.CDS_FluxoFornecedorCOD_VINCULADO.AsString+'-'+DMBelShop.CDS_FluxoFornecedorDES_VINCULADO.AsString;

      Cbx_FornVinculado.ItemIndex := Cbx_FornVinculado.Items.IndexOf(MySql);

      If Cbx_FornVinculado.Items.Count<1 Then
       Gb_FornVinculado.Visible:=False;

      If (DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.AsInteger<>900) And
         (DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.AsInteger<>955) Then
      Begin
        msg('É Permitido Alterar Somente a Observação'+cr+'dos Históricos Diferentes de:'+cr+cr+sHist,'A');
        bgSoObs:=True;

        Gb_FornVinculado.Enabled:=False;
        EdtValorDoc.Enabled:=False;
        EdtCodLojaDoc.Enabled:=False;
        EdtCodHistDoc.Enabled:=False;
      End;

      // Atualiza Componentes ====================================================
      EdtNumDoc.Text     :=DMBelShop.CDS_FluxoFornecedorNUM_DOCUMENTO.AsString;
      EdtSerieDoc.Text   :=DMBelShop.CDS_FluxoFornecedorNUM_SERIE.AsString;
      EdtDtOrigemDoc.Date:=StrToDate(DateToStr(DMBelShop.CDS_FluxoFornecedorDTA_ORIGEM.AsDateTime));
      EdtDtCaixaDoc.Date :=StrToDate(DateToStr(DMBelShop.CDS_FluxoFornecedorDATA.AsDateTime));
      EdtValorDoc.Value  :=DMBelShop.CDS_FluxoFornecedorVLR_ORIGEM.AsCurrency;

      EdtCodLojaDoc.Text :=DMBelShop.CDS_FluxoFornecedorCOD_EMPRESA.AsString;
      If bgSoObs Then
       EdtLojaDoc.Text   :=DMBelShop.CDS_FluxoFornecedorRAZAO_SOCIAL.AsString
      Else
       EdtCodLojaDocExit(Self);

      EdtCodHistDoc.Text :=DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.AsString;
      If bgSoObs Then
       EdtHistDoc.Text   :=DMBelShop.CDS_FluxoFornecedorDES_HISTORICO.AsString
      Else
       EdtCodHistDocExit(Self);

      EdtObsDoc.Text:=DMBelShop.CDS_FluxoFornecedorTXT_OBS.AsString;
      sgDtaDoc      :=DateToStr(DMBelShop.CDS_FluxoFornecedorDATA.AsDateTime);
      sgNum_SeqCC   :=DMBelShop.CDS_FluxoFornecedorNUM_SEQ.AsString;

      // Apresenta Alteração =====================================================
      igTabSheet:=PC_Principal.TabIndex;
      sgDMLMovto:='A';

      EdtFluFornCodFornecedor.Enabled:=False;
      Bt_FluFornBuscaFornecedor.Enabled:=False;
    End; // If (PC_Principal.ActivePage=Ts_FluxFornCaixa) and ((Sender as TJvXPButton).Name='Bt_FluFornAlterar') Then
  End; // If (Sender is TJvXPButton) Then
  // Altera Lançamento (Fornecedor Existente) ==================================
  //============================================================================

  Ts_FluxFornApres.TabVisible :=False;
  Ts_FluxFornCaixa.TabVisible :=False;
  sHist:='';

  If sgDMLMovto='A' Then
   Begin
     Lab_Lanctos.Caption:='Alteração de Débito/Crédito'
   End
  Else // If sgDMLMovto='A' Then
   Begin
     Lab_Lanctos.Caption:='Inclusão de Débito/Crédito';

     // Busca Numero do Docto/Serie ============================================
     MySql:=' SELECT GEN_ID(GEN_DOC_CC,1) Docto'+
            ' FROM RDB$DATABASE';
     DMBelShop.CDS_Busca.Close;
     DMBelShop.SDS_Busca.CommandText:=MySql;
     DMBelShop.CDS_Busca.Open;
     EdtNumDoc.Text  :=DMBelShop.CDS_Busca.FieldByName('Docto').AsString;
     EdtSerieDoc.Text:='UNIC';
     DMBelShop.CDS_Busca.Close;

     If (Cbx_FornVinculado.Items.Count<1) Or (sgDMLMovto='N') Then
     Begin
       Cbx_FornVinculado.Items.Clear;
       Gb_FornVinculado.Visible:=False;
     End; // If sgDMLMovto='I' Then
   End; // If sgDMLMovto='A' Then

  Ts_FluxFornLanctos.TabVisible:=True;

  PC_PrincipalChange(Self);

end;

procedure TFrmFluxoFornecedor.Bt_FluFornVinculosClick(Sender: TObject);
Var
  MySql: String;
begin
  If (Sender is TJvXPButton) Then
  Begin
    //==========================================================================
    // Vinculos de Fornecedores ================================================
    //==========================================================================
    If Trim((Sender as TJvXPButton).Caption)='Vinculos de Fornecedores' Then
    Begin
      Dbg_FluFornFornec.SetFocus;

      DMBelShop.CDS_FluxoFornVinculo.Close;
      DMBelShop.CDS_FluxoFornVinculo.Open;

      Ts_FluxFornApres.TabVisible :=False;
      Ts_FluxFornCaixa.TabVisible :=False;
      Ts_FluxFornVinculos.TabVisible:=True;

      PC_PrincipalChange(Self);
    End; // If Trim((Sender as TJvXPButton).Caption)='Vinculos de Fornecedores' Then
    // Vinculos de Fornecedores ================================================
    //==========================================================================

    //==========================================================================
    // Apresenta Avarias =======================================================
    //==========================================================================
    If Trim((Sender as TJvXPButton).Caption)='Apresenta Avarias' Then
    Begin
      If DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
       Exit;

      // Busca total Avarias ===================================================
             // PRODUTOS - Ordem 4
      MySql:=' SELECT'+
             ' pr.apresentacao DES_PRODUTO,'+
             ' CAST(ct.saldo AS INTEGER) QTD_AVARIAS,'+
             ' CAST(ct.vlr_unit AS NUMERIC(12,2)) VLR_UNITARIO,'+
             ' CAST((ct.saldo * ct.vlr_unit) AS NUMERIC(12,2)) TOT_FINANCEIRO,'+
             ' 4 ORDEM'+
             ' FROM CENTRAL_TROCAS ct, PRODUTO pr'+
             ' WHERE ct.codproduto=pr.codproduto'+
             ' AND   COALESCE(ct.saldo,0)<>0'+
             ' AND   ct.cod_fornecedor= :Forn'+

              // TITULO DO RELATORIO - Ordem 0
             ' UNION'+
             ' SELECT'+
             QuotedStr('RELAÇÃO DE AVARIAS')+','+ // DES_PRODUTO
             ' NULL,'+ // QTD_AVARIAS
             ' NULL,'+ // VLR_UNITARIO
             ' NULL,'+ // TOT_FINANCEIRO
             ' 0'+     // ORDEM
             ' FROM RDB$DATABASE'+

             // LINHA EM BRANCO - Ordem 1
             ' UNION'+
             ' SELECT'+
             ' NULL,'+ // DES_PRODUTO
             ' NULL,'+ // QTD_AVARIAS
             ' NULL,'+ // VLR_UNITARIO
             ' NULL,'+ // TOT_FINANCEIRO
             ' 1'+     // ORDEM
             ' FROM RDB$DATABASE'+

             // FORNECEDOR - Ordem 2
             ' UNION'+
             ' SELECT'+
             ' CASE'+
             '   WHEN TRIM(COALESCE(fo.nome_cliente,''''))<>'''' THEN'+
             '     fo.cod_cliente||'' - ''||fo.nome_cliente'+
             '   ELSE'+
             '     fo.cod_cliente||'' - ''||fo.razao_cliente'+
             ' END,'+  // DES_PRODUTO
             ' NULL,'+ // QTD_AVARIAS
             ' NULL,'+ // VLR_UNITARIO
             ' NULL,'+ // TOT_FINANCEIRO
             ' 2'+     // ORDEM
             ' FROM LINXCLIENTESFORNEC fo'+
             ' WHERE fo.cod_cliente= :Forn'+

             // LINHA EM BRANCO - Ordem 3

             ' UNION'+
             ' SELECT'+
             ' NULL,'+ // DES_PRODUTO
             ' NULL,'+ // QTD_AVARIAS
             ' NULL,'+ // VLR_UNITARIO
             ' NULL,'+ // TOT_FINANCEIRO
             ' 3'+     // ORDEM
             ' FROM RDB$DATABASE'+

             // LINHA EM BRANCO - Ordem 5
             ' UNION'+
             ' SELECT'+
             ' NULL,'+ // DES_PRODUTO
             ' NULL,'+ // QTD_AVARIAS
             ' NULL,'+ // VLR_UNITARIO
             ' NULL,'+ // TOT_FINANCEIRO
             ' 5'+     // ORDEM
             ' FROM RDB$DATABASE'+

             // TOTAL DO FORNECEDOR - Ordem 6
             ' UNION'+
             ' SELECT'+
             QuotedStr('TOTAL DO FORNECEDOR')+','+ // DES_PRODUTO
             ' CAST(SUM(ct.saldo) aS INTEGER),'+ // QTD_AVARIAS
             ' NULL,'+ // VLR_UNITARIO,
             ' CAST(SUM(ct.saldo * ct.vlr_unit) AS NUMERIC(12,2)),'+ // TOT_FINANCEIRO
             ' 6'+     // ORDEM
             ' FROM CENTRAL_TROCAS ct'+
             ' WHERE COALESCE(ct.saldo,0)<>0'+
             ' AND   ct.cod_fornecedor= :Forn'+

             ' ORDER BY 5,1';
      DMBelShop.CDS_Busca1.Close;
      DMBelShop.SDS_Busca1.CommandText:=MySql;
      If (Trim(DMBelShop.CDS_FluxoFornecedorCOD_VINCULADO.AsString)<>'') And (DMBelShop.CDS_FluxoFornecedorCOD_VINCULADO.AsInteger<>0) Then
       DMBelShop.SDS_Busca1.Params.ParamByName('Forn').AsInteger:=DMBelShop.CDS_FluxoFornecedorCOD_VINCULADO.AsInteger
      Else
       DMBelShop.SDS_Busca1.Params.ParamByName('Forn').AsInteger:=DMBelShop.CDS_FluxoFornecedorCOD_FORNECEDOR.AsInteger;

      DMBelShop.CDS_Busca1.Open;
      TNumericField(DMBelShop.CDS_Busca1.FieldByName('QTD_AVARIAS')).DisplayFormat:=',0';
      TNumericField(DMBelShop.CDS_Busca1.FieldByName('VLR_UNITARIO')).DisplayFormat:='0.,00';
      TNumericField(DMBelShop.CDS_Busca1.FieldByName('TOT_FINANCEIRO')).DisplayFormat:='0.,00';


      FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
      FrmBelShop.AbreSolicitacoes(19);

      bgProcessar:=False;
      FrmSolicitacoes.GridNewCriar(DMBelShop.DS_Busca1, 'Apresenta Avarias', True);
      FrmSolicitacoes.Caption:='CONTA CORRENTE FORNECEDORES';
      FrmSolicitacoes.Ts_QualquerCoisa.Caption:='AVARIAS'; // Usado no Botão TFrmSolicitacoes.Bt_QualquerCoisaSalvarClick

      FrmSolicitacoes.AutoSize:=False;
      FrmSolicitacoes.Width:=610;
      FrmSolicitacoes.AutoSize:=True;
      FrmSolicitacoes.ShowModal;

      DMBelShop.CDS_Busca1.Close;
      FreeAndNil(FrmSolicitacoes);

      Dbg_FluFornCaixa.SetFocus;
    End; // If Trim((Sender as TJvXPButton).Caption)='Apresenta Avarias' Then
    // Apresenta Avarias =======================================================
    //==========================================================================

    //==========================================================================
    // Localiza Avarias ========================================================
    //==========================================================================
    If Trim((Sender as TJvXPButton).Caption)='Localiza Avarias' Then
    Begin
      If DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
       Exit;

      If Not DMBelShop.CDS_FluxoFornecedor.Locate('TXT_OBS','DESCARTE DE AVARIAS - Central de Trocas - 13/12/2016',[]) Then
      Begin
        msg('Fornecedor Sem Avarias !!','A');
      End; // If Not DMBelShop.CDS_FluxoFornecedor.Locate('TXT_OBS','DESCARTE DE AVARIAS - Central de Trocas - 13/12/2016',[]) Then

      Dbg_FluFornCaixa.SetFocus;
    End; // If Trim((Sender as TJvXPButton).Caption)='Localiza Avarias' Then
    // Localiza Avarias ========================================================
    //==========================================================================
  End; // If (Sender is TJvXPButton) Then
end;

procedure TFrmFluxoFornecedor.Pan_LanctosEnter(Sender: TObject);
begin
  If EdtFluFornCodFornecedor.asInteger=0 Then
  Begin
    msg('Selecione o Fornecedor Novo'+cr+'ou'+cr+'Tecle em Voltar...','A');
    EdtFluFornCodFornecedor.SetFocus;
    Exit;
  End;

end;

procedure TFrmFluxoFornecedor.EdtCodLojaDocExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtCodLojaDoc.AsInteger<>0 Then
  Begin
    EdtLojaDoc.Clear;

    Screen.Cursor:=crAppStart;

    // Busca Fornecedor Novo ===================================================
    MySql:=' SELECT l.empresa, l.nome_emp'+
           ' FROM LINXLOJAS l'+
           ' WHERE l.empresa='+IntToStr(EdtCodLojaDoc.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Empresa').AsString)='' Then
    Begin
      msg('Loja NÃO Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtCodLojaDoc.Clear;
      EdtCodLojaDoc.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;

    EdtLojaDoc.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Nome_Emp').AsString;

    DMBelShop.CDS_BuscaRapida.Close;

    Screen.Cursor:=crDefault;
  End; // If EdtCodLojaDoc.AsInteger<>0 Then
end;

procedure TFrmFluxoFornecedor.EdtCodLojaDocChange(Sender: TObject);
begin
  EdtLojaDoc.Clear;

end;

procedure TFrmFluxoFornecedor.EdtBuscaLojaDocClick(Sender: TObject);
Var
  MySql: String;
begin
  EdtCodLojaDoc.Clear;
  EdtLojaDoc.Clear;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT l.empresa Cod_Emp, l.nome_emp'+
         ' FROM LINXLOJAS l'+
         ' ORDER BY 2';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Cod_Emp').AsString)='' Then
  Begin
    msg('Sem EMPRESA a Listar !!','A');
    EdtCodLojaDoc.Clear;
    FreeAndNil(FrmPesquisa);
    EdtCodLojaDoc.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Nome_Emp';
  FrmPesquisa.Campo_Codigo:='Cod_Emp';
  FrmPesquisa.Campo_Descricao:='Nome_Emp';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    EdtCodLojaDoc.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtCodLojaDoc.SetFocus;
    EdtCodLojaDocExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmFluxoFornecedor.EdtCodHistDocChange(Sender: TObject);
begin
  EdtHistDoc.Clear;
end;

procedure TFrmFluxoFornecedor.EdtCodHistDocExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtCodHistDoc.AsInteger<>0 Then
  Begin
    EdtHistDoc.Clear;
    EdtDebCreDoc.Clear;

    Screen.Cursor:=crAppStart;

    // Busca Fornecedor Novo ===================================================
    MySql:=' SELECT h.cod_historico, h.des_historico,'+
           ' CASE'+
           '   WHEN h.ind_debcre=''C'' THEN'+
           '    ''Crédito'''+
           '   ELSE'+
           '    ''Débito'''+
           ' End ind_debcre'+
           ' FROM FL_CAIXA_HISTORICOS h'+
           ' WHERE h.cod_historico in (900, 955)'+
           ' and   h.cod_historico='+IntToStr(EdtCodHistDoc.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Historico').AsString)='' Then
    Begin
      msg('Histórico NÃO Encontrado !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtCodHistDoc.Clear;
      EdtCodHistDoc.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;

    EdtHistDoc.Text  :=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Historico').AsString;
    EdtDebCreDoc.Text:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('ind_debcre').AsString);

    DMBelShop.CDS_BuscaRapida.Close;

    Screen.Cursor:=crDefault;
  End; // If EdtCodHistDoc.AsInteger<>0 Then

end;

procedure TFrmFluxoFornecedor.EdtBuscaHistDocClick(Sender: TObject);
Var
  MySql: String;
begin
  EdtCodHistDoc.Clear;
  EdtHistDoc.Clear;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT h.des_historico, h.cod_historico,'+
         ' CASE'+
         '   WHEN h.ind_debcre=''C'' THEN'+
         '    ''Crédito'''+
         '   ELSE'+
         '    ''Débito'''+
         ' End ind_debcre'+
         ' FROM FL_CAIXA_HISTORICOS h'+
         ' WHERE h.cod_historico in (900, 955)'+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('cod_historico').AsString)='' Then
  Begin
    msg('Sem HISTÓRICO a Listar !!','A');
    EdtCodHistDoc.Clear;
    FreeAndNil(FrmPesquisa);
    EdtCodHistDoc.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='des_historico';
  FrmPesquisa.Campo_Codigo:='cod_historico';
  FrmPesquisa.Campo_Descricao:='des_historico';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    EdtCodHistDoc.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtCodHistDoc.SetFocus;
    EdtCodHistDocExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmFluxoFornecedor.Bt_LanctosSalvarClick(Sender: TObject);
Var
  sCodForn, sNrDoc, sDtaDoc: String;
  MySql: String;
begin
  // Altera Somente a Observação ===============================================
  If bgSoObs Then
  Begin
    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try // Try da Transação
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      MySql:=' Update FL_CAIXA_FORNECEDORES f'+
             ' Set f.txt_obs='+QuotedStr(EdtObsDoc.Text)+
             ' WHERE f.cod_fornecedor='+IntToStr(DMBelShop.CDS_FluxoFornecedorCOD_FORNECEDOR.AsInteger)+
             ' AND   f.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DMBelShop.CDS_FluxoFornecedorDATA.AsDateTime))))+
             ' AND   f.num_seq='+IntToStr(DMBelShop.CDS_FluxoFornecedorNUM_SEQ.AsInteger);
      DMBelShop.SQLC.Execute(MySql, nil, nil);

      DMBelShop.CDS_FluxoFornecedor.Edit;
      DMBelShop.CDS_FluxoFornecedorTXT_OBS.AsString:=EdtObsDoc.Text;
      DMBelShop.CDS_FluxoFornecedor.Post;
      // Atualiza Transacao ====================================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      Screen.Cursor:=crDefault;

    Except // Except da Transação
      on e : Exception do
      Begin
        // Abandona Transacao ==================================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        Exit;
      End; // on e : Exception do
    End; // Try da Transação

    LimpaLancamentos;
    Gb_FornVinculado.Enabled:=True;
    EdtValorDoc.Enabled:=True;
    EdtCodLojaDoc.Enabled:=True;
    EdtCodHistDoc.Enabled:=True;

    Ts_FluxFornApres.TabVisible :=True;
    Ts_FluxFornCaixa.TabVisible :=True;
    Ts_FluxFornLanctos.TabVisible:=False;
    Ts_FluxFornVinculos.TabVisible:=False;
    Ts_FluxFornPercCampanhas.TabVisible:=False;
    PC_Principal.TabIndex:=1;
    PC_PrincipalChange(Self);

    Exit;
  End; // If bgSoObs Then

  EdtValorDoc.SetFocus;

  sCodForn:=IntToStr(EdtFluFornCodFornecedor.AsInteger);
  sNrDoc  :=EdtNumDoc.Text;
  sDtaDoc :=f_Troca('.','/',f_Troca('-','/',DateToStr(EdtDtCaixaDoc.Date)));

  If Not ConsisteLancamentos Then
   Exit;

  If Not SalvaLancamentos Then
   Exit;

  Screen.Cursor:=crAppStart;

  // Fecha Conta Corrente Fornecedor ===========================================
  If DMBelShop.CDS_FluxoFornecedor.Active Then
   DMBelShop.CDS_FluxoFornecedor.Close;

  // Coloca Data do Caixa para 30 Dias Atras ===================================
  sgDtaDoc:=DateToStr((IncMonth(StrToDate(sgDtaDoc),-1)));

  // Atualiza Saldos do Fornecedor =============================================
  EdtFluFornCodFornAcertar.Text:=sCodForn;
  MEdt_DtaAtualizacao.Text:=f_Troca('/','.',f_Troca('-','.',sgDtaDoc));

  LimpaLancamentos;
  Gb_FornVinculado.Enabled:=True;
  EdtValorDoc.Enabled:=True;
  EdtCodLojaDoc.Enabled:=True;
  EdtCodHistDoc.Enabled:=True;

  Ts_FluxFornApres.TabVisible :=True;
  Ts_FluxFornCaixa.TabVisible :=True;
  Ts_FluxFornLanctos.TabVisible:=False;
  Ts_FluxFornVinculos.TabVisible:=False;
  Ts_FluxFornPercCampanhas.TabVisible:=False;
  PC_Principal.TabIndex:=1;
  PC_PrincipalChange(Self);

                                     //=========================================
  bgAtualizaDireto:=True;            //
  Bt_FluFornAcertaSaldosClick(Self); //<<<==== Atualiza Saldos do Fornecedor
                                     //=========================================

  // Libera Nova Posição do Conta Corrente =====================================
  EdtFluFornCodFornecedor.AsInteger:=0;
  EdtFluFornFornecedor.Clear;

  // Apresernta Fornecedores ===================================================
  If DMBelShop.CDS_FluxoFornecedores.Active Then
   DMBelShop.CDS_FluxoFornecedores.Close;

  FiltraComprador('',0);

  Ts_FluxFornApres.TabVisible :=True;
  Ts_FluxFornCaixa.TabVisible :=True;
  Ts_FluxFornLanctos.TabVisible:=False;
  Ts_FluxFornVinculos.TabVisible:=False;
  Ts_FluxFornPercCampanhas.TabVisible:=False;
  PC_Principal.TabIndex:=0;
  PC_PrincipalChange(Self);

  // Posiciona no Conta Corrente ===============================================
  igTabSheet:=0;
  EdtFluFornCodFornecedor.AsInteger:=StrToInt(sCodForn);
  EdtFluFornCodFornecedorExit(Self);
  DMBelShop.CDS_FluxoFornecedor.Locate('DATA; NUM_DOCUMENTO', VarArrayOf([sDtaDoc, sNrDoc]),[]);

  // Retorna ===================================================================
  Screen.Cursor:=crDefault;
  LimpaLancamentos;

end;

procedure TFrmFluxoFornecedor.Bt_LanctosAbandonarClick(Sender: TObject);
begin
  EdtObsDoc.SetFocus;

  LimpaLancamentos;

  If (sgDMLMovto='A') Or (sgDMLMovto='I')  Then
   Bt_FluFornFecharClick(Bt_FluFornFechar);

end;

procedure TFrmFluxoFornecedor.EdtDtOrigemDoc1DropDown(Sender: TObject);
begin
  SelectNext(ActiveControl,True,True);
end;

procedure TFrmFluxoFornecedor.Dbg_FluFornCaixaTitleClick(Column: TColumn);
Var
  s, sPesquisa: String;
  b: Boolean;
  i: Integer;
begin

  If Not DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
  Begin
    i:=DMBelShop.CDS_FluxoFornecedor.RecNo;
    sPesquisa:='';
    b:=True;
    While b do
    Begin
      s:=DMBelShop.CDS_FluxoFornecedor.FieldByName(Column.FieldName).DisplayLabel;
      If InputQuery('Localizar: '+s,'',sPesquisa) then
       Begin
         Try
           If Not DMBelShop.CDS_FluxoFornecedor.Locate(Column.FieldName, sPesquisa,[]) Then
           Begin
             If Not LocalizaRegistro(DMBelShop.CDS_FluxoFornecedor, Column.FieldName, sPesquisa) Then
             Begin
               DMBelShop.CDS_FluxoFornecedor.RecNo:=i;
               msg('Não Localizado !!','A');
               Exit;
             End;
           End; // If Not DMBelShop.CDS_FluxoFornecedor.Locate(Column.FieldName, sPesquisa,[]) Then
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
  End; // If Not DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
end;

procedure TFrmFluxoFornecedor.Dbg_FornVinculoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  {
  USADO EM:
  Dbg_FornVinculados
  }
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

end;

procedure TFrmFluxoFornecedor.Dbg_FornVinculoExit(Sender: TObject);
begin
  {
  USADO EM:
  Dbg_FornVinculo
  Dbg_FornVinculados
  }
  If (Sender is TDBGrid) Then
   (Sender as TDBGrid).Color:=$00F4F4F4;
end;

procedure TFrmFluxoFornecedor.Dbg_FornVinculoEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_FornVinculoEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

  If (Sender is TDBGrid) Then
   (Sender as TDBGrid).Color:=clWindow;
end;

procedure TFrmFluxoFornecedor.EdtFornVinculoCodFornExit(Sender: TObject);
Var
  MySql: String;

  iCodForn: Integer;
  sDesForn: String;
begin

  If EdtFornVinculoCodForn.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    MySql:=' SELECT fo.cod_cliente   cod_fornecedor,'+
           '        fo.razao_cliente des_fornecedor'+
           ' FROM LINXCLIENTESFORNEC fo'+
           ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
           ' AND   COALESCE(fo.ativo,''S'')=''S'''+
           ' AND   fo.cod_cliente='+IntToStr(EdtFornVinculoCodForn.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Fornecedor').AsString)='' Then
    Begin
      Screen.Cursor:=crDefault;
      msg('Fornecedor NÃO Encontrado !!!', 'A');
      DMBelShop.CDS_BuscaRapida.Close;
      EdtFornVinculoCodForn.Clear;
      EdtFornVinculoCodForn.SetFocus;
      Exit;
    End;
    iCodForn:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Fornecedor').AsInteger;
    sDesForn:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Fornecedor').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    // Verifica Vinculados =====================================================
    If DMBelShop.CDS_FluxoFornVinculados.Active Then
    Begin
      DMBelShop.CDS_FluxoFornVinculados.DisableControls;
      DMBelShop.CDS_FluxoFornVinculados.Filtered:=False;

      If (DMBelShop.CDS_FluxoFornVinculados.Locate('Cod_Vinculado;ind_Situacao',VarArrayOf([EdtFornVinculoCodForn.AsInteger,'I']),[])) Or
         (DMBelShop.CDS_FluxoFornVinculados.Locate('Cod_Vinculado;ind_Situacao',VarArrayOf([EdtFornVinculoCodForn.AsInteger,'N']),[])) Then
      Begin
        Screen.Cursor:=crDefault;
        DMBelShop.CDS_FluxoFornVinculados.EnableControls;

        // Apresetna já Vinculado
        DMBelShop.CDS_FluxoFornVinculo.Locate('Cod_Fornecedor',DMBelShop.CDS_FluxoFornVinculadosCOD_FORNECEDOR.AsInteger,[]);
        If Not DMBelShop.CDS_FluxoFornVinculados.Locate('Cod_Vinculado;ind_Situacao',VarArrayOf([EdtFornVinculoCodForn.AsInteger,'N']),[]) Then
         DMBelShop.CDS_FluxoFornVinculados.Locate('Cod_Vinculado;ind_Situacao',VarArrayOf([EdtFornVinculoCodForn.AsInteger,'I']),[]);

        msg('Fornecedor'+cr+sDesForn+cr+cr+'Já Vinculado !!','A');
        EdtFornVinculoCodForn.Text:='0';
        EdtFornVinculoCodForn.SetFocus;
        Exit;
      End; // If (DMBelShop.CDS_FluxoFornVinculados.Locate('Cod_Vinculado;ind_Situacao',VarArrayOf([EdtFornVinculoCodForn.AsInteger,'I']),[])) Or
      DMBelShop.CDS_FluxoFornVinculados.Filtered:=True;
      DMBelShop.CDS_FluxoFornVinculados.EnableControls;
    End; // If DMBelShop.CDS_FluxoFornVinculados.Active Then

    // Verifica Vinculos =======================================================
    If (DMBelShop.CDS_FluxoFornVinculo.Locate('Cod_Fornecedor;ind_Situacao',VarArrayOf([EdtFornVinculoCodForn.AsInteger,'I']),[])) Or
       (DMBelShop.CDS_FluxoFornVinculo.Locate('Cod_Fornecedor;ind_Situacao',VarArrayOf([EdtFornVinculoCodForn.AsInteger,'N']),[])) Then
    Begin
      If DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString<>'E' Then
      Begin
        Screen.Cursor:=crDefault;
        msg('Fornecedor'+cr+sDesForn+cr+cr+'Já Existe como Vinculo !!','A');
        EdtFornVinculoCodForn.Clear;
        EdtFornVinculoCodForn.SetFocus;
        Exit;
      End;
    End; // If (DMBelShop.CDS_FluxoFornVinculo.Locate('Cod_Fornecedor;ind_Situacao',VarArrayOf([EdtFornVinculoCodForn.AsInteger,'I']),[])) Or

    // Verifica se Existe Conta Corrente =======================================
    MySql:=' SELECT cod_fornecedor'+
           ' FROM FL_CAIXA_FORNECEDORES c'+
           ' WHERE c.num_seq NOT IN (0, 999999)'+
           ' AND   c.cod_vinculado='+IntToStr(EdtFornVinculoCodForn.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Fornecedor').AsString)='' Then
    Begin
      Screen.Cursor:=crDefault;
      If MessageBox(Handle, pChar('Fornecedor'+cr+sDesForn+cr+cr+'NÃO Contém Conta Corrente !!'+cr+'Criar com Negociação de R$ 0,01 ??'), 'ATENÇÃO !!', 292)=IdNo Then
      Begin                                                                                                                         
        DMBelShop.CDS_BuscaRapida.Close;
        EdtFornVinculoCodForn.Clear;
        EdtFornVinculoCodForn.SetFocus;
        Exit;
      End;
      Screen.Cursor:=crAppStart;
    End;
    DMBelShop.CDS_BuscaRapida.Close;

    DMBelShop.CDS_FluxoFornVinculo.Insert;
    DMBelShop.CDS_FluxoFornVinculoCOD_FORNECEDOR.AsInteger:=iCodForn;
    DMBelShop.CDS_FluxoFornVinculoDES_FORNECEDOR.AsString :=sDesForn;
    DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString   :='I';
    DMBelShop.CDS_FluxoFornVinculoIND_SIT_ORIGEM.AsString :='S'; // Sem Origem
    DMBelShop.CDS_FluxoFornVinculo.Post;

    DMBelShop.CDS_FluxoFornVinculo.Locate('Cod_Fornecedor',iCodForn,[]);

    EdtFornVinculoCodForn.Text:='0';
    EdtFornVinculoCodForn.SetFocus;
    Screen.Cursor:=crDefault;
  End; // If EdtFornVinculoCodForn.Value<>0 Then
end;

procedure TFrmFluxoFornecedor.Bt_FluxoVinculoBuscaFornClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_FornVinculo.SetFocus;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ======================================================
  MySql:=' SELECT fo.razao_cliente des_fornecedor,'+
         '        fo.cod_cliente cod_fornecedor'+
         ' FROM LINXCLIENTESFORNEC fo'+
         ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
         ' AND   COALESCE(fo.ativo,''S'')=''S'''+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Cod_Fornecedor').AsString)='' Then
  Begin
    FreeAndNil(FrmPesquisa);
    msg('Sem FORNECEDOR a Listar !!','A');
    EdtFornVinculoCodForn.Clear;
    EdtFornVinculoCodForn.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Fornecedor';
  FrmPesquisa.Campo_Codigo:='Cod_Fornecedor';
  FrmPesquisa.Campo_Descricao:='Des_Fornecedor';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    EdtFornVinculoCodForn.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtFornVinculoCodFornExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmFluxoFornecedor.Dbg_FornVinculoDrawColumnCell(Sender: TObject; const Rect:
                      TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If not (gdSelected in State) Then
  Begin
    // Novo Fornecedor Vinculado ===============================================
    If DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='I' then
    Begin
      Dbg_FornVinculo.Canvas.Brush.Color:=$00B7FFB7;
      Dbg_FornVinculo.Canvas.Font.Color:=clBlue;
    End;

    // Fornecedor Vinculado a Excluir ==========================================
    If DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='E' then
    Begin
      Dbg_FornVinculo.Canvas.Brush.Color:=$008484FF;
      Dbg_FornVinculo.Canvas.Font.Color:=clWhite;
    End;

    Dbg_FornVinculo.Canvas.FillRect(Rect);
    Dbg_FornVinculo.DefaultDrawDataCell(Rect,Column.Field,state);
  End;

  // Alinhamentos
  DMBelShop.CDS_FluxoFornVinculoCOD_FORNECEDOR.Alignment:=taRightJustify;
end;

procedure TFrmFluxoFornecedor.Dbg_FornVinculadosDrawColumnCell(Sender: TObject; const Rect:
                          TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If not (gdSelected in State) Then
  Begin
    // Novo Fornecedor Vinculado ===============================================
    If DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString='I' then
    Begin
      Dbg_FornVinculados.Canvas.Brush.Color:=$00B7FFB7;
      Dbg_FornVinculados.Canvas.Font.Color:=clBlue;
    End;

    // Fornecedor Vinculado a Excluir ==========================================
    If DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString='E' then
    Begin
      Dbg_FornVinculados.Canvas.Brush.Color:=$008484FF;
      Dbg_FornVinculados.Canvas.Font.Color:=clWhite;
    End;

    Dbg_FornVinculados.Canvas.FillRect(Rect);
    Dbg_FornVinculados.DefaultDrawDataCell(Rect,Column.Field,state);
  End;

  // Alinhamentos
  DMBelShop.CDS_FluxoFornVinculadosCOD_VINCULADO.Alignment:=taRightJustify;

end;

procedure TFrmFluxoFornecedor.Bt_FluxoVinculoExcluirClick(Sender: TObject);
begin
  Dbg_FornVinculo.SetFocus;

  If DMBelShop.CDS_FluxoFornVinculo.IsEmpty Then
   Exit;

  If (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='E') and (DMBelShop.CDS_FluxoFornVinculoIND_SIT_ORIGEM.AsString='N') Then
  Begin
    msg('Fornecedor Já Excluído !!'+cr+cr+'Inclua Novamente ou Techa em <Voltar>'+cr+'para ABANDONAR as Alterações Efetuadas !!','A');
    // EdtFornVinculoCodForn.AsInteger:=DMBelShop.CDS_FluxoFornVinculoCOD_FORNECEDOR.AsInteger;
    //  EdtFornVinculoCodFornExit(Self);

    Exit;
  End; // If (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='E') and (DMBelShop.CDS_FluxoFornVinculoIND_SIT_ORIGEM.AsString='N') Then

  If msg('Deseja Realmente RETIRAR Vínculos do'+cr+'Fornecedor'+cr+DMBelShop.CDS_FluxoFornVinculoDES_FORNECEDOR.AsString,'C')=2 Then
   Exit;

  //============================================================================
  // Exclui da Lista Fornecedor Vinculo e Vinculados ===========================
  //============================================================================
  If (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='I') and (DMBelShop.CDS_FluxoFornVinculoIND_SIT_ORIGEM.AsString='S') Then
  Begin
    // Exclui os Vinculados ============================================
    DMBelShop.CDS_FluxoFornVinculados.First;
    DMBelShop.CDS_FluxoFornVinculados.DisableControls;
    While Not DMBelShop.CDS_FluxoFornVinculados.Eof do
    Begin
      DMBelShop.CDS_FluxoFornVinculados.Delete;
    End; // While Not DMBelShop.CDS_FluxoFornVinculados.Eof do
    DMBelShop.CDS_FluxoFornVinculados.EnableControls;
    DMBelShop.CDS_FluxoFornVinculados.First;

    // Marca Excluidos o Vinculado =====================================
    DMBelShop.CDS_FluxoFornVinculo.Delete;
    DMBelShop.CDS_FluxoFornVinculo.First;

    Exit;
  End; //If (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='I') and (DMBelShop.CDS_FluxoFornVinculoIND_SIT_ORIGEM.AsString='S') Then
  // Exclui da Lista Fornecedor Vinculo e Vinculados ===========================
  //============================================================================

  //============================================================================
  // Marca Excluido Fornecedor Vinculo e Vinculados ============================
  //============================================================================
  If (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='N') and (DMBelShop.CDS_FluxoFornVinculoIND_SIT_ORIGEM.AsString='N') Then
  Begin
    // Marca Excluidos os Vinculados ===================================
    DMBelShop.CDS_FluxoFornVinculados.First;
    DMBelShop.CDS_FluxoFornVinculados.DisableControls;
    While Not DMBelShop.CDS_FluxoFornVinculados.Eof do
    Begin
      If DMBelShop.CDS_FluxoFornVinculadosIND_SIT_ORIGEM.AsString='S' Then
       DMBelShop.CDS_FluxoFornVinculados.Delete;

      If DMBelShop.CDS_FluxoFornVinculadosIND_SIT_ORIGEM.AsString='N' Then
      Begin
        DMBelShop.CDS_FluxoFornVinculados.Edit;
        DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString:='E';
        DMBelShop.CDS_FluxoFornVinculados.Post;
      End;

      DMBelShop.CDS_FluxoFornVinculados.Next;
    End; // While Not DMBelShop.CDS_FluxoFornVinculados.Eof do
    DMBelShop.CDS_FluxoFornVinculados.EnableControls;
    DMBelShop.CDS_FluxoFornVinculados.First;

    // Marca Excluidos o Vinculado =====================================
    DMBelShop.CDS_FluxoFornVinculo.Edit;
    DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString:='E';
    DMBelShop.CDS_FluxoFornVinculo.Post;
  End; // If (DMBelShop.CDS_FluxoFornVinculoIND_SITUACAO.AsString='I') and (DMBelShop.CDS_FluxoFornVinculoIND_SIT_ORIGEM.AsString='N') Then
  // Marca Excluido Fornecedor Vinculo e Vinculados ============================
  //============================================================================
end;

procedure TFrmFluxoFornecedor.Bt_FluxoVinculadoExcluirClick(Sender: TObject);
Begin

  Dbg_FornVinculados.SetFocus;

  If DMBelShop.CDS_FluxoFornVinculados.IsEmpty Then
   Exit;

  If (DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString='E') and (DMBelShop.CDS_FluxoFornVinculadosIND_SIT_ORIGEM.AsString='N') Then
  Begin
    msg('Fornecedor Já Excluído !!'+cr+cr+'Inclua Novamente ou Techa em <Voltar>'+cr+'para ABANDONAR as Alterações Efetuadas !!','A');
    Exit;
  End;

  If msg('Deseja Realmente RETIRAR Vínculos do'+cr+'Fornecedor'+cr+DMBelShop.CDS_FluxoFornVinculadosDES_VINCULADO.AsString,'C')=2 Then
   Exit;

  //============================================================================
  // Exclui da Lista Fornecedor Vinculado ======================================
  //============================================================================
  If (DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString='I') and (DMBelShop.CDS_FluxoFornVinculadosIND_SIT_ORIGEM.AsString='S') Then
  Begin
    DMBelShop.CDS_FluxoFornVinculados.Delete;
    Exit;
  End;
  // Exclui da Lista Fornecedor Vinculado ======================================
  //============================================================================

  //============================================================================
  // Marca Excluido Fornecedor Vinculado =======================================
  //============================================================================
  If (DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString='N') and (DMBelShop.CDS_FluxoFornVinculadosIND_SIT_ORIGEM.AsString='N') Then
  Begin
    DMBelShop.CDS_FluxoFornVinculados.Edit;
    DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString  :='E';
    DMBelShop.CDS_FluxoFornVinculados.Post;
  End; // If (DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString='N') and (DMBelShop.CDS_FluxoFornVinculadosIND_SIT_ORIGEM.AsString='N') Then
  // Marca Excluido Fornecedor Vinculo e Vinculados ============================
  //============================================================================
end;

procedure TFrmFluxoFornecedor.EdtFornVinculadoCodFornExit(Sender: TObject);
Var
  MySql: String;

  iCodForn: Integer;
  sDesForn: String;
begin

  If EdtFornVinculadoCodForn.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    MySql:=' SELECT fo.cod_cliente   cod_fornecedor,'+
           '        fo.razao_cliente des_fornecedor'+
           ' FROM LINXCLIENTESFORNEC fo'+
           ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
           ' AND   COALESCE(fo.ativo,''S'')=''S'''+
           ' AND   fo.cod_cliente='+IntToStr(EdtFornVinculadoCodForn.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Fornecedor').AsString)='' Then
    Begin
      Screen.Cursor:=crDefault;
      msg('Fornecedor NÃO Encontrado !!!', 'A');
      DMBelShop.CDS_BuscaRapida.Close;
      EdtFornVinculadoCodForn.Clear;
      EdtFornVinculadoCodForn.SetFocus;
      Exit;
    End;
    iCodForn:=DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Fornecedor').AsInteger;
    sDesForn:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Fornecedor').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    // Verifica Vinculados =====================================================
    If DMBelShop.CDS_FluxoFornVinculados.Active Then
    Begin
      DMBelShop.CDS_FluxoFornVinculados.DisableControls;
      DMBelShop.CDS_FluxoFornVinculados.Filtered:=False;

      If (DMBelShop.CDS_FluxoFornVinculados.Locate('Cod_Vinculado;ind_Situacao',VarArrayOf([EdtFornVinculadoCodForn.AsInteger,'I']),[])) Or
         (DMBelShop.CDS_FluxoFornVinculados.Locate('Cod_Vinculado;ind_Situacao',VarArrayOf([EdtFornVinculadoCodForn.AsInteger,'N']),[])) Then
      Begin
        DMBelShop.CDS_FluxoFornVinculados.EnableControls;
        Screen.Cursor:=crDefault;

        // Apresetna já Vinculado
        DMBelShop.CDS_FluxoFornVinculo.Locate('Cod_Fornecedor',DMBelShop.CDS_FluxoFornVinculadosCOD_FORNECEDOR.AsInteger,[]);
        If Not DMBelShop.CDS_FluxoFornVinculados.Locate('Cod_Vinculado;ind_Situacao',VarArrayOf([EdtFornVinculadoCodForn.AsInteger,'N']),[]) Then
         DMBelShop.CDS_FluxoFornVinculados.Locate('Cod_Vinculado;ind_Situacao',VarArrayOf([EdtFornVinculadoCodForn.AsInteger,'I']),[]);

        msg('Fornecedor'+cr+sDesForn+cr+cr+'Já Vinculado !!','A');
        EdtFornVinculadoCodForn.Text:='0';
        EdtFornVinculadoCodForn.SetFocus;
        Exit;
      End; // If (DMBelShop.CDS_FluxoFornVinculados.Locate('Cod_Vinculado;ind_Situacao',VarArrayOf([EdtFornVinculadoCodForn.AsInteger,'I']),[])) Or
      DMBelShop.CDS_FluxoFornVinculados.Filtered:=True;
      DMBelShop.CDS_FluxoFornVinculados.EnableControls;
    End; // If DMBelShop.CDS_FluxoFornVinculados.Active Then

    // Verifica Vinculos =======================================================
    If (DMBelShop.CDS_FluxoFornVinculo.Locate('Cod_Fornecedor;ind_Situacao',VarArrayOf([EdtFornVinculadoCodForn.AsInteger,'I']),[])) Or
       (DMBelShop.CDS_FluxoFornVinculo.Locate('Cod_Fornecedor;ind_Situacao',VarArrayOf([EdtFornVinculadoCodForn.AsInteger,'N']),[])) Then
    Begin
      Screen.Cursor:=crDefault;
      msg('Fornecedor'+cr+sDesForn+cr+cr+'Já Existe como Vinculo !!','A');
      EdtFornVinculadoCodForn.Clear;
      EdtFornVinculadoCodForn.SetFocus;
      Exit;
    End; // If (DMBelShop.CDS_FluxoFornVinculo.Locate('Cod_Fornecedor;ind_Situacao',VarArrayOf([EdtFornVinculadoCodForn.AsInteger,'I']),[])) Or

    // Verifica se Existe Conta Corrente ========================================
    MySql:=' SELECT DISTINCT c.cod_fornecedor'+
           ' FROM FL_CAIXA_FORNECEDORES c'+
           ' WHERE c.num_seq NOT IN (0, 999999)'+
           ' AND   c.cod_vinculado='+IntToStr(EdtFornVinculadoCodForn.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Fornecedor').AsString)='' Then
    Begin
      If MessageBox(Handle, pChar('Fornecedor'+cr+sDesForn+cr+cr+'NÃO Contém Conta Corrente !!'+cr+'Criar com Negociação de R$ 0,01 ??'), 'ATENÇÃO !!', 292)=IdNo Then
      Begin
        Screen.Cursor:=crDefault;
        DMBelShop.CDS_BuscaRapida.Close;
        EdtFornVinculadoCodForn.Clear;
        EdtFornVinculadoCodForn.SetFocus;
        Exit;
      End; // If MessageBox(Handle, pChar('Fornecedor'+cr+sDesForn+cr+cr+'NÃO Contém Conta Corrente !!'+cr+'Criar com Negociação de R$ 0,01 ??'), 'ATENÇÃO !!', MB_ICONERROR)=IdNo Then
    End;
    DMBelShop.CDS_BuscaRapida.Close;

    DMBelShop.CDS_FluxoFornVinculados.Insert;
    DMBelShop.CDS_FluxoFornVinculadosCOD_FORNECEDOR.AsInteger:=DMBelShop.CDS_FluxoFornVinculoCOD_FORNECEDOR.AsInteger;
    DMBelShop.CDS_FluxoFornVinculadosCOD_VINCULADO.AsInteger :=iCodForn;
    DMBelShop.CDS_FluxoFornVinculadosDES_VINCULADO.AsString  :=sDesForn;
    DMBelShop.CDS_FluxoFornVinculadosIND_SITUACAO.AsString   :='I';
    DMBelShop.CDS_FluxoFornVinculadosIND_SIT_ORIGEM.AsString :='S'; // Sem Origem
    DMBelShop.CDS_FluxoFornVinculados.Post;

    DMBelShop.CDS_FluxoFornVinculados.Locate('Cod_Vinculado',EdtFornVinculadoCodForn.AsInteger,[]);

    Screen.Cursor:=crDefault;
    EdtFornVinculadoCodForn.Text:='0';
    EdtFornVinculadoCodForn.SetFocus;
  End; // If EdtFornVinculadoCodForn.Value<>0 Then
end;

procedure TFrmFluxoFornecedor.Bt_FluxoVinculadoBuscaFornClick(Sender: TObject);
Var
  MySql: String;
begin

  Dbg_FornVinculados.SetFocus;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ======================================================
  MySql:=' SELECT fo.razao_cliente des_fornecedor,'+
         '        fo.cod_cliente cod_fornecedor'+
         ' FROM LINXCLIENTESFORNEC fo'+
         ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
         ' AND   COALESCE(fo.ativo,''S'')=''S'''+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;
  
  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Cod_Fornecedor').AsString)='' Then
  Begin
    Screen.Cursor:=crDefault;
    FreeAndNil(FrmPesquisa);
    msg('Sem FORNECEDOR a Listar !!','A');
    EdtFornVinculadoCodForn.Clear;
    EdtFornVinculadoCodForn.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Fornecedor';
  FrmPesquisa.Campo_Codigo:='Cod_Fornecedor';
  FrmPesquisa.Campo_Descricao:='Des_Fornecedor';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    EdtFornVinculadoCodForn.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtFornVinculadoCodFornExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmFluxoFornecedor.Bt_AvariasCentralTrocasClick(Sender: TObject);
Var
  MySql: String;

  sPercRed,
  sCodForn, sDesForn,
  sDtaCaixa, sNumSeq,
  sNumDocto, sSerieDocto: String;
begin
  If AnsiUpperCase(Des_Login)<>'ODIR' Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Atualizando CC Avarias...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmFluxoFornecedor;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD1);

  // Monta Transacao ===========================================================
  Try // Try da Transação
   MySql:=' SELECT'+
          ' ct.cod_fornecedor COD_FORNECEDOR,'+
          ' fo.nome_cliente NOME_FORNECEDOR,'+
          ' fs.codfornecedor COD_FOR_SID,'+
          ' fs.nomefornecedor NOME_FORN_SID,'+
          ' cast(sum(ct.saldo * ct.vlr_unit) as numeric(12,2)) TOT_FINANCEIRO'+

          ' FROM CENTRAL_TROCAS ct, LINXCLIENTESFORNEC fo, FORNECEDOR fs'+

          ' WHERE ct.cod_fornecedor=fo.cod_cliente'+
          ' AND   ct.codfornecedor=fs.codfornecedor'+
          ' AND   COALESCE(ct.saldo,0)<>0'+

          ' GROUP BY 1,2,3,4'+
          ' ORDER BY 1,3';
    DMBelShop.CDS_Busca1.Close;
    DMBelShop.SDS_Busca1.CommandText:=MySql;
    DMBelShop.CDS_Busca1.Open;

    Bt_AvariasCentralTrocas.Caption:=IntToStr(DMBelShop.CDS_Busca1.RecordCount);

    DMBelShop.CDS_Busca1.DisableControls;
    While Not DMBelShop.CDS_Busca1.Eof do
    Begin
      Application.ProcessMessages;

      TD1.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD1.IsolationLevel:=xilREADCOMMITTED;
      DMBelShop.SQLC.StartTransaction(TD1);
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';

      // Busca Codigo Fornecedor pelo Codigo Vinculado =========================
      MySql:=' SELECT ff.cod_fornecedor, ff.des_fornecedor'+
             ' FROM fl_caixa_fornecedores ff'+
             ' WHERE ff.cod_vinculado='+DMBelShop.CDS_Busca1.FieldByName('COD_FORNECEDOR').AsString;
      DMBelShop.SQLQuery3.Close;
      DMBelShop.SQLQuery3.SQL.Clear;
      DMBelShop.SQLQuery3.SQL.Add(MySql);
      DMBelShop.SQLQuery3.Open;

      sCodForn:=DMBelShop.CDS_Busca1.FieldByName('Cod_Fornecedor').AsString;
      sDesForn:=DMBelShop.CDS_Busca1.FieldByName('Nome_Fornecedor').AsString;
      If Trim(DMBelShop.SQLQuery3.FieldByName('cod_fornecedor').AsString)<>'' Then
      Begin
        sCodForn:=DMBelShop.SQLQuery3.FieldByName('Cod_Fornecedor').AsString;
        sDesForn:=DMBelShop.SQLQuery3.FieldByName('Des_Fornecedor').AsString;
      End;
      DMBelShop.SQLQuery3.Close;

      // Data do Caixa =========================================================
      sDtaCaixa:=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
      sPercRed:='0.00';

      // Busca Num_Seq do Dia do Fornecedor ====================================
      MySql:=' SELECT COALESCE(MAX(cf.num_seq)+1 ,1) Num_Seq'+
             ' FROM FL_CAIXA_FORNECEDORES cf'+
             ' WHERE cf.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaCaixa)))+
             ' AND   cf.cod_fornecedor='+sCodForn+
             ' AND   cf.num_seq NOT IN (0,999999)';
      DMBelShop.SQLQuery3.Close;
      DMBelShop.SQLQuery3.SQL.Clear;
      DMBelShop.SQLQuery3.SQL.Add(MySql);
      DMBelShop.SQLQuery3.Open;
      sNumSeq:=DMBelShop.SQLQuery3.FieldByName('Num_Seq').AsString;
      DMBelShop.SQLQuery3.Close;

      // Busca Numero do Docto/Serie ===========================================
      MySql:=' SELECT GEN_ID(GEN_DOC_CC,1) Docto'+
             ' FROM RDB$DATABASE';
      DMBelShop.SQLQuery3.Close;
      DMBelShop.SQLQuery3.SQL.Clear;
      DMBelShop.SQLQuery3.SQL.Add(MySql);
      DMBelShop.SQLQuery3.Open;
      sNumDocto:=DMBelShop.SQLQuery3.FieldByName('Docto').AsString;
      sSerieDocto:='UNIC';
      DMBelShop.SQLQuery3.Close;

      // Insere Caixa ==========================================================
      MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES ('+
             ' COD_FORNECEDOR, DES_FORNECEDOR,'+
             ' COD_VINCULADO, DES_VINCULADO,'+
             ' VLR_ORIGEM, DTA_ORIGEM, DTA_CAIXA, NUM_SEQ,'+
             ' NUM_CHAVENF, COD_EMPRESA, COD_HISTORICO, TXT_OBS,'+
             ' NUM_DOCUMENTO, NUM_SERIE, PER_REDUCAO, TIP_DEBCRE, VLR_CAIXA, VLR_SALDO,'+
             ' CODFORNECEDOR, COD_LOJA_LINX, COD_LOJA_SIDICOM)'+
             ' VALUES ('+
             sCodForn+', '+ // COD_FORNECEDOR (LINX) - Fornecedor de Vinculo
             QuotedStr(sDesForn)+', '+ // DES_FORNECEDOR (LINX) - Fornecedor de Vinculo
             DMBelShop.CDS_Busca1.FieldByName('COD_FORNECEDOR').AsString+', '+ // COD_VINCULADO (LINX) - Fornecedor Vinculado
             QuotedStr(DMBelShop.CDS_Busca1.FieldByName('NOME_FORNECEDOR').AsString)+', '+ // DES_VINCULADO (LINX) - Fornecedor Vinculado
             DMBelShop.CDS_Busca1.FieldByName('TOT_FINANCEIRO').AsString+', '+ // VLR_ORIGEM
             QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaCaixa)))+', '+ // DTA_ORIGEM
             QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaCaixa)))+', '+ // DTA_CAIXA
             sNumSeq+', '+ // NUM_SEQ
             'NULL, '+ // NUM_CHAVENF
             '2, '+ // COD_EMPRESA (2 = CD)
             '900, '+ // COD_HISTORICO (900 = Conta Corrente Débito)
             '''DESCARTE DE AVARIAS - Central de Trocas - 13/12/2016'', '+ // TXT_OBS
             QuotedStr(sNumDocto)+', '+ // NUM_DOCUMENTO
             QuotedStr(sSerieDocto)+', '+ // NUM_SERIE
             sPercRed+', '+ // PER_REDUCAO,
             QuotedStr('D')+', '+ // TIP_DEBCRE

             'CAST(('+DMBelShop.CDS_Busca1.FieldByName('TOT_FINANCEIRO').AsString+
                    '-(('+sPercRed+' * '+DMBelShop.CDS_Busca1.FieldByName('TOT_FINANCEIRO').AsString+
                    ') / 100)) AS NUMERIC(12,2)), '+ // VLR_CAIXA

             '0.00, '+ // VLR_SALDO
             QuotedStr(DMBelShop.CDS_Busca1.FieldByName('COD_FOR_SID').AsString)+', '+ // CODFORNECEDOR VARCHAR(6)
             '2, '+ // COD_LOJA_LINX INTEGER (2 = CD)
             QuotedStr('50')+')'; // COD_LOJA_SIDICOM VARCHAR(2) = 50 = Central de Trocas
      DMBelShop.SQLC.Execute(MySql, nil, nil);

      // Atualiza Transacao ====================================================
      DMBelShop.SQLC.Commit(TD1);

      // Recalcula Conta Corrente ==============================================
      EdtFluFornCodFornAcertar.Text:=sCodForn;
      MEdt_DtaAtualizacao.Text:=f_Troca('/','.',f_Troca('-','.',DateToStr(StrToDate(sDtaCaixa)-30)));
      bgAtualizaDireto:=True;
      Bt_FluFornAcertaSaldosClick(Self);

      EdtFluFornCodFornAcertar.Text:='Cód a Acertar';
      MEdt_DtaAtualizacao.Text:='  .  .20  ';

      Bt_AvariasCentralTrocas.Caption:=IntToStr(DMBelShop.CDS_Busca1.RecordCount)+' - '+
                                       IntToStr(DMBelShop.CDS_Busca1.RecNo);

      DMBelShop.CDS_Busca1.Next;
    End; // While Not DMBelShop.CDS_Busca1.Eof do
    DMBelShop.CDS_Busca1.EnableControls;
    DMBelShop.CDS_Busca1.Close;
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD1);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação

  DateSeparator:='/';
  DecimalSeparator:=',';
  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;
  FrmBelShop.MontaProgressBar(False, FrmFluxoFornecedor);

end;

procedure TFrmFluxoFornecedor.Dbg_FornVinculadosEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_FornVinculadosEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

  If (Sender is TDBGrid) Then
   (Sender as TDBGrid).Color:=clWindow;

end;

procedure TFrmFluxoFornecedor.Bt_FluFornAcrescCampanhasClick(Sender: TObject);
begin
  Ts_FluxFornApres.TabVisible :=False;
  Ts_FluxFornCaixa.TabVisible :=False;
  Ts_FluxFornPercCampanhas.TabVisible:=True;
  PC_Principal.ActivePage:=Ts_FluxFornPercCampanhas;
  PC_PrincipalChange(Self);

end;

procedure TFrmFluxoFornecedor.EdtFornAcrescCampCodFornChange(Sender: TObject);
begin
  EdtFornAcrescCampDescForn.Clear;
  EdtFornAcrescCampPercentual.Value:=0;
end;

procedure TFrmFluxoFornecedor.EdtFornAcrescCampCodFornExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtFornAcrescCampDescForn.Clear;

  If EdtFornAcrescCampCodForn.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;
    // Busca Fornecedores =======================================================
    MySql:=' SELECT fo.cod_cliente   cod_fornecedor,'+
           '        fo.razao_cliente des_fornecedor'+
           ' FROM LINXCLIENTESFORNEC fo'+
           ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
           ' AND   COALESCE(fo.ativo,''S'')=''S'''+
           ' AND   fo.cod_cliente='+IntToStr(EdtFornAcrescCampCodForn.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Fornecedor').AsString)='' Then
    Begin
      Screen.Cursor:=crDefault;
      msg('Fornecedor NÃO Encontrado !!!', 'A');
      DMBelShop.CDS_BuscaRapida.Close;
      EdtFornAcrescCampCodForn.Clear;
      EdtFornAcrescCampCodForn.SetFocus;
      Exit;
    End;
    Screen.Cursor:=crDefault;

    EdtFornAcrescCampDescForn.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Des_Fornecedor').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    If DMBelShop.CDS_Join.Locate('Cod_Fornecedor', EdtFornAcrescCampCodForn.AsInteger,[]) Then
     Dbg_FornAcrescCampanhasDblClick(Self);

    EdtFornAcrescCampPercentual.SetFocus;
  End; // If EdtFornAcrescCampCodForn.Value<>0 Then
end;

procedure TFrmFluxoFornecedor.Bt_FornAcrescCampBuscaFornecClick(Sender: TObject);
Var
  MySql: String;
begin
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtFornAcrescCampCodForn.Clear;
  EdtFornAcrescCampDescForn.Clear;

  EdtFornAcrescCampCodForn.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedor ==========================================================
  MySql:=' SELECT fo.razao_cliente Des_Fornecedor,'+
         '        fo.cod_cliente   Codigo'+
         ' FROM LINXCLIENTESFORNEC fo'+
         ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
         ' AND   COALESCE(fo.ativo,''S'')=''S'''+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Codigo').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Fornecedor a Listar !!','A');
    EdtFornAcrescCampCodForn.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Fornecedor';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Des_Fornecedor';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtFornAcrescCampCodForn.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtFornAcrescCampDescForn.Text:=FrmPesquisa.EdtDescricao.Text;
     EdtFornAcrescCampCodFornExit(Self);
   End
  Else
   Begin
     EdtFornAcrescCampCodForn.Clear;
     EdtFornAcrescCampDescForn.Clear;
     EdtFornAcrescCampCodForn.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmFluxoFornecedor.Dbg_FornAcrescCampanhasEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_FornAcrescCampanhasEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmFluxoFornecedor.Bt_FornAcrescCampSalvarClick(Sender: TObject);
begin
  Dbg_FornAcrescCampanhas.SetFocus;

  If EdtFornAcrescCampCodForn.AsInteger=0 Then
  Begin
    msg('Favor Informa o Fornecedor !!','A');
    EdtFornAcrescCampCodForn.SetFocus;
    Exit;
  End; // If EdtFornAcrescCampCodForn.AsInteger=0 Then

  If EdtFornAcrescCampPercentual.AsInteger=0 Then
  Begin
    If msg('O Percentual de Acrescimos Zerado !!'+cr+cr+'Esta CORRETO ??','C')=2 Then
    Begin
      EdtFornAcrescCampPercentual.SetFocus;
      Exit;
    End;
  End; // If EdtFornAcrescCampCodForn.AsInteger=0 Then

  If DMBelShop.CDS_Join.Locate('COD_FORNECEDOR', EdtFornAcrescCampCodForn.AsInteger,[]) Then
  Begin
    If msg('Fornecedor Já Incluído !!'+cr+cr+'DESEJA SUBSTITUÍ-LO ?? !!','C')=2 Then
    Begin
      EdtFornAcrescCampCodForn.Clear;
      EdtFornAcrescCampPercentual.Clear;
      EdtFornAcrescCampDescForn.Clear;
      EdtFornAcrescCampCodForn.SetFocus;
      Exit;
    End;
  End; // If EdtFornAcrescCampCodForn.AsInteger=0 Then

  // Inclui/Substitui Fornacedor ===============================================
  If FornPercAcrescCampanhas(True) Then
  Begin
    DMBelShop.CDS_Join.DisableControls;
    DMBelShop.CDS_Join.Close;
    DMBelShop.CDS_Join.Open;
    TNumericField(DMBelShop.CDS_Join.FieldByName('PERC_ACRESCIMOS')).DisplayFormat:='0.,00';
    DMBelShop.CDS_Join.Locate('COD_FORNECEDOR', EdtFornAcrescCampCodForn.AsInteger,[]);
    DMBelShop.CDS_Join.EnableControls;

    EdtFornAcrescCampCodForn.Clear;
    EdtFornAcrescCampPercentual.Clear;
    EdtFornAcrescCampDescForn.Clear;
    EdtFornAcrescCampCodForn.SetFocus;
  End; // If FornPercAcrescCampanhas(True) Then

end;

procedure TFrmFluxoFornecedor.Dbg_FornAcrescCampanhasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin


  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

  // Excluir Fornecedor ========================================================
  If Key=VK_Delete Then
  Begin
    If DMBelShop.CDS_Join.IsEmpty Then
     Exit;

    If msg('Deseja Realmente Excluir o'+cr+cr+'Fornecedor Selecionado ??','C')=2 Then
     Exit;

    If FornPercAcrescCampanhas(False) Then
    Begin
      DMBelShop.CDS_Join.DisableControls;
      DMBelShop.CDS_Join.Close;
      DMBelShop.CDS_Join.Open;
      TNumericField(DMBelShop.CDS_Join.FieldByName('PERC_ACRESCIMOS')).DisplayFormat:='0.,00';
      DMBelShop.CDS_Join.EnableControls;

      Dbg_FornAcrescCampanhas.SetFocus;
    End; // If FornPercAcrescCampanhas(False) Then
 End;

end;

procedure TFrmFluxoFornecedor.Dbg_FornAcrescCampanhasDblClick(Sender: TObject);
begin
  If DMBelShop.CDS_Join.IsEmpty Then
   Exit;

  EdtFornAcrescCampCodForn.AsInteger:=DMBelShop.CDS_Join.FieldByName('Cod_Fornecedor').AsInteger;
  EdtFornAcrescCampPercentual.Value :=DMBelShop.CDS_Join.FieldByName('Perc_Acrescimos').AsCurrency;
  EdtFornAcrescCampDescForn.Text    :=DMBelShop.CDS_Join.FieldByName('Nome_Fornecedor').AsString;
  EdtFornAcrescCampOBS.Text         :=DMBelShop.CDS_Join.FieldByName('Txt_Obs').AsString;
  EdtFornAcrescCampPercentual.SetFocus;
end;

end.

{
hint balao revisar
}
