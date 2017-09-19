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
  JvExMask, JvToolEdit;

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
    PopM_Forn: TPopupMenu;
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
    Ts_FluxFornGraficos: TTabSheet;
    Edit2: TEdit;
    Panel3: TPanel;
    Bt_FluFornFiltroComprador: TJvXPButton;
    Bt_FluFornSalvaMemoria: TJvXPButton;
    Bt_FluFornIncluir: TJvXPButton;
    Bt_FluFornAlterar: TJvXPButton;
    Bt_FluFornGraficos: TJvXPButton;
    Pan_Lanctos: TPanel;
    Label9: TLabel;
    EdtNumDoc: TEdit;
    EdtSerieDoc: TEdit;
    Label10: TLabel;
    Label5: TLabel;
    Label4: TLabel;
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
    EdtDtOrigemDoc: TcxDateEdit;
    EdtDtCaixaDoc: TcxDateEdit;
    Panel4: TPanel;
    Bt_LanctosSalvar: TJvXPButton;
    Bt_LanctosAbandonar: TJvXPButton;
    EdtFluFornCodFornAcertar: TEdit;
    MEdt_DtaAtualizacao: TMaskEdit;
    Bt_FluFornAcertaSaldos: TJvXPButton;
    Bt_FluFornImprimir: TJvXPButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure PC_PrincipalChange(Sender: TObject);

    // ODIR ====================================================================
    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente

// OdirApagar - 06/07/2017
//    Procedure AtualizaDescComprvCCorrente;

    Procedure CalculaPercReducao;
    Procedure PercReducaoHabiita_GroupBox(bHabilita: Boolean);

    Procedure CalculaFluxoCaixaFornecedores(sDt: String=''; sCodForn: String ='');

    Procedure FiltraComprador(sCompradores: String; iNumLinhas: Integer); // sCompradores: Delimitador = ';'

    Function  DML_Historicos(sTipo, sCodHist: String; sDebCre: String=''; sDesHist: String=''): Boolean;
                          // sTipo: (I)nserir
                          //        (E)xclur

    Procedure BuscaFornecedorNovo;
    Procedure LimpaLancamentos;
    Function  ConsisteLancamentos: Boolean;
    Function  SalvaLancamentos: Boolean;

    // ODIR ====================================================================

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
    procedure Bt_FluFornGraficosClick(Sender: TObject);
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

  bgPodeUsar,      // Se Usuario Pode Usar Eventos
  bgAtualizaDireto
  : Boolean;

  // Lançamentos
  igTabSheet: Integer; // Qual TabSheet.TabIndex Chamou o Grafico

  sgDMLMovto, // (N)Novo Fornecedort (I)Incluir Movto (A)ALterar Movto ()Pesquisa
  sgNum_SeqCC // Usado no Lançamento para Guardar a Sequencia do Dia do Fornecedor
  : String;
  // sgDtaDoc -> FrmBelShop // Usado no Lançamento para Guardar Data de Inicio de ReCalculo do Fornecedor

implementation

uses DK_Procs1, UDMBelShop, UDMConexoes, UDMVirtual, UFrmBelShop,
  UFrmSelectEmpProcessamento, DB, UPesquisa, UFrmSolicitacoes,
  UDMRelatorio;

{$R *.dfm}

//==============================================================================
// ODIR - INICIO ===============================================================
//==============================================================================

// Salva Lançamentos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function  TFrmFluxoFornecedor.SalvaLancamentos: Boolean;
Var
  MySql: String;
  sNumSeqCC, // Num_Seq do Dia do Caixa a Usar
  sDebCre, sCodFornSIDICOM, sCodLojaSIDICOM,
  sUsu_Inclui, sDta_Inclui, sUsu_Altera: String;

// sgNum_SeqCC: Num_Seq para Alteração do Registro

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

  sUsu_Inclui:='';
  sDta_Inclui:='';
  sUsu_Altera:='';

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

      // Exclui Lançamento a Ser Alterado =======================================
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
           ' (COD_FORNECEDOR, DES_FORNECEDOR, VLR_ORIGEM, DTA_ORIGEM, DTA_CAIXA,'+
           '  NUM_SEQ, NUM_CHAVENF, COD_EMPRESA, COD_HISTORICO, TXT_OBS,'+
           '  NUM_DOCUMENTO, NUM_SERIE, PER_REDUCAO, TIP_DEBCRE, VLR_CAIXA,'+
           '  VLR_SALDO, CODFORNECEDOR, COD_LOJA_LINX, COD_LOJA_SIDICOM,'+
           '  USU_INCLUI, DTA_INCLUI, USU_ALTERA, DTA_ALTERA)'+

           ' VALUES ('+
           IntToStr(EdtFluFornCodFornecedor.AsInteger)+', '+ // COD_FORNECEDOR
           QuotedStr(EdtFluFornFornecedor.Text)+', '+ // DES_FORNECEDOR
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

    // Acerta Data da Ultima Negociação ========================================
    MySql:=' SELECT min(f.dta_caixa) Data'+
           ' FROM FL_CAIXA_FORNECEDORES f'+
           ' WHERE f.cod_historico=900'+
           ' AND   f.cod_fornecedor='+IntToStr(EdtFluFornCodFornecedor.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
//    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Data').AsString)<>'' Then
//     Begin
//       MySql:=' DELETE FROM TAB_AUXILIAR t'+
//              ' WHERE t.tip_aux=14'+
//              ' AND   t.cod_aux='+IntToStr(EdtFluFornCodFornecedor.AsInteger);
//     End
//    Else
//     Begin
       MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR'+
              ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
              ' VALUES ('+
              ' 14, '+ // TIP_AUX
              IntToStr(EdtFluFornCodFornecedor.AsInteger)+', '+ // COD_AUX - Código do Fornecedor
              ' (SELECT Trim(t.des_aux)'+
              '  FROM TAB_AUXILIAR t'+
              '  WHERE t.tip_aux=14'+
              '  AND t.cod_aux='+IntToStr(EdtFluFornCodFornecedor.AsInteger)+')'+', '+ // DES_AUX - Data Conta Corrente
              QuotedStr(f_Troca('/','.',f_Troca('-','.',Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Data').AsString))))+', '+ // DES_AUX1 - Data da 1ª Negociação
              ' NULL, '+ // VLR_AUX
              ' NULL)'+ // VLR_AUX1

              ' MATCHING (TIP_AUX, COD_AUX)';
//     End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Data').AsString)<>'' Then
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

  Result:=True;
End; // Consiste Lançamentos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpas Componentes de Lancamentos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.LimpaLancamentos;
Begin
  EdtDtOrigemDoc.Date:=Date;
  EdtDtCaixaDoc.Date:=Date;
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
         ' WHERE fo.tipo_cliente in (''F'',''A'')'+
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
         '                 WHERE fl.cod_fornecedor=fo.cod_cliente)'+
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
  EdtDtOrigemDoc.SetFocus;

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
           '               WHERE p.cod_fornecedor = f.cod_fornecedor'+
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
             QuotedStr(FormatFloat('000',StrToInt(EdtFluxFornManutCodComprv.text)))+', '+ // COD_COMPROVANTE
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
             '                      WHERE p.cod_fornecedor = f.cod_fornecedor'+
             '                      AND   p.cod_comprovante = f.cod_historico'+
             '                      AND   p.num_seq = '+sgNumSeq+
             '                      AND   f.dta_caixa BETWEEN p.dta_incio AND COALESCE(p.dta_fim, CAST(''31.12.3000'' AS DATE))),'+
             ' f.vlr_caixa = ROUND(f.vlr_origem * (1 - (COALESCE(f.per_reducao,0.00) / 100)), 2)'+

             ' WHERE EXISTS(SELECT 1'+
             '              FROM FL_CAIXA_PERC_REDUCAO p'+
             '              WHERE p.cod_fornecedor = f.cod_fornecedor'+
             '              AND   p.cod_comprovante = f.cod_historico'+
             '              AND   p.num_seq = '+sgNumSeq+
             '              AND   f.dta_caixa BETWEEN p.dta_incio AND COALESCE(p.dta_fim, CAST(''31.12.3000'' AS DATE)))';
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End; // If Bt_FluxFornManutReducaoSalvar.Caption<>'Excluir' Then]

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    // Recalcula Fluxo de Caixa do Novo Fornecedor =============================
    CalculaFluxoCaixaFornecedores(f_Troca('.','/',f_Troca('-','/',sgDtaMinCC)),IntToStr(EdtFluxFornManutCodForn.AsInteger));

    // Recalcula Fluxo de Caixa do Fornecedor Anterior =========================
    If Bt_FluxFornManutReducaoSalvar.Caption='Alterar' Then
     CalculaFluxoCaixaFornecedores(f_Troca('.','/',f_Troca('-','/',sDtaRedAnt)),sCodFornAnt);

    // Reapresenta Fornecedores =================================================
    If DMBelShop.CDS_FluxoFornecedores.Active Then
     DMBelShop.CDS_FluxoFornecedores.Close;

    FiltraComprador('',0);
    DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR', IntToStr(EdtFluxFornManutCodForn.AsInteger),[]);

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
Var
  i: Integer;
  MySql: String;
Begin
  DMBelShop.CDS_FluxoFornecedor.Close;
  DMBelShop.CDS_FluxoFornecedor.Filtered:=False;
  DMBelShop.CDS_FluxoFornecedor.Filter:='';

  DMBelShop.CDS_FluxoFornecedores.Close;

  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr1').AsString:= EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr2').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr3').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr4').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr5').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr6').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr7').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr8').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr9').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr10').AsString:=EmptyStr;

  If Trim(sCompradores)='' Then
  Begin
    // Busca Códigos de Compradores ==============================================
    MySql:=' SELECT cc.codcentrocusto FORN'+
           ' FROM CENTROCUSTO cc'+
           ' WHERE UPPER(cc.nomecusto)='+QuotedStr('COMPRAS')+
           ' UNION'+
           ' SELECT 0'+
           ' FROM RDB$DATABASE';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr1').AsString:= '99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr2').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr3').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr4').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr5').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr6').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr7').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr8').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr9').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr10').AsString:='99999999';

    iNumLinhas:=0;
    While Not DMBelShop.CDS_BuscaRapida.Eof do
    Begin
      Inc(iNumLinhas);

      sCompradores:=sCompradores+';'+DMBelShop.CDS_BuscaRapida.FieldByName('Forn').AsString;

      DMBelShop.CDS_BuscaRapida.Next;
    End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
    DMBelShop.CDS_BuscaRapida.Close;

    If Trim(sCompradores)<>'' Then
     sCompradores:=sCompradores+';';

  End; // If Trim(sCompradores)='' Then

  For i:=1 to iNumLinhas do
  Begin
    If i=1 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr1').AsString:=Separa_String(sCompradores,i+1);

    If i=2 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr2').AsString:=Separa_String(sCompradores,i+1);

    If i=3 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr3').AsString:=Separa_String(sCompradores,i+1);

    If i=4 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr4').AsString:=Separa_String(sCompradores,i+1);

    If i=5 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr5').AsString:=Separa_String(sCompradores,i+1);

    If i=6 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr6').AsString:=Separa_String(sCompradores,i+1);

    If i=7 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr7').AsString:=Separa_String(sCompradores,i+1);

    If i=8 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr8').AsString:=Separa_String(sCompradores,i+1);

    If i=9 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr9').AsString:=Separa_String(sCompradores,i+1);

    If i=10 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr10').AsString:=Separa_String(sCompradores,i+1);
  End; // For i:=0 to iNumLinhas do
  DMBelShop.CDS_FluxoFornecedores.Open;

End; // Filtro Fornecedores pelos Compradores Selecionados >>>>>>>>>>>>>>>>>>>>>

// Manutenção DML de Historicos de Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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

// OdirApagar - 06/07/2017
//// Atualiza Descrição dos Comprovantes de Conta Corrente >>>>>>>>>>>>>>>>>>>>>>>
//Procedure TFrmFluxoFornecedor.AtualizaDescComprvCCorrente;
//Var
//  MySql: String;
//Begin
//
//  MySql:=' select H.COD_HISTORICO'+
//         ' from FL_CAIXA_HISTORICOS H'+
//         ' where H.COD_HISTORICO <> 0 and'+
//         '       H.COD_HISTORICO <> 999999';
//  DMBelShop.CDS_Busca.Close;
//  DMBelShop.SDS_Busca.CommandText:=MySql;
//  DMBelShop.CDS_Busca.Open;
//  sgCodigo:='';
//  While not DMBelShop.CDS_Busca.Eof do
//  Begin
//    If sgCodigo='' Then
//     sgCodigo:=QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString)
//    Else
//     sgCodigo:=sgCodigo+', '+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString);
//
//    DMBelShop.CDS_Busca.Next;
//  End;
//  DMBelShop.CDS_Busca.Close;
//
//  If sgCodigo<>'' Then
//  Begin
//    // Verifica se Transação esta Ativa
//    If DMBelShop.SQLC.InTransaction Then
//     DMBelShop.SQLC.Rollback(TD);
//
//    // Monta Transacao ===========================================================
//    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//    TD.IsolationLevel:=xilREADCOMMITTED;
//    DMBelShop.SQLC.StartTransaction(TD);
//    Try
//      DateSeparator:='.';
//      DecimalSeparator:='.';
//
//      MySql:=' select C.CODCOMPROVANTE, C.NOMECOMPROVANTE'+
//             ' from COMPRV C'+
//             ' where C.CODCOMPROVANTE in ('+sgCodigo+')';
//      FrmBelShop.IBQ_MPMS.Close;
//      FrmBelShop.IBQ_MPMS.SQL.Clear;
//      FrmBelShop.IBQ_MPMS.SQL.Add(MySql);
//      FrmBelShop.IBQ_MPMS.Open;
//
//      While Not FrmBelShop.IBQ_MPMS.Eof do
//      Begin
//        MySql:=' update FL_CAIXA_HISTORICOS H'+
//               ' set H.DES_HISTORICO='+QuotedStr(FrmBelShop.IBQ_MPMS.FieldByName('NOMECOMPROVANTE').AsString)+
//               ' where H.COD_HISTORICO='+FrmBelShop.IBQ_MPMS.FieldByName('CODCOMPROVANTE').AsString;
//        DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//        FrmBelShop.IBQ_MPMS.Next;
//      End; // While Not FrmBelShop.IBQ_MPMS.Eof do
//      FrmBelShop.IBQ_MPMS.Close;
//
//      // Atualiza Transacao ======================================================
//      DMBelShop.SQLC.Commit(TD);
//    Except
//      on e : Exception do
//      Begin
//        // Abandona Transacao ====================================================
//        DMBelShop.SQLC.Rollback(TD);
//        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
//      End; // on e : Exception do
//    End; // Try
//    DateSeparator:='/';
//    DecimalSeparator:=',';
//  End; // If sgCodigo<>'' Then
//
//  sgCodigo:='';
//
//End; // Atualiza Descrição dos Comprovantes de Conta Corrente >>>>>>>>>>>>>>>>>>

// Calcula Fluxo de Caixo de Fornecedor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.CalculaFluxoCaixaFornecedores(sDt: String=''; sCodForn: String ='');
Var
  MySql:String;
  cVlrSaldo: Currency;
  iUltmio: Integer;
  sCodigo: String;
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

    // Busca Fornecedores ========================================================
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
     MySql+' ORDER BY c.COD_FORNECEDOR';
    DMBelShop.CDS_While.Close;
    DMBelShop.SDS_While.CommandText:=MySql;
    DMBelShop.CDS_While.Open;

    FrmBelShop.MontaProgressBar(True, FrmFluxoFornecedor);
    pgProgBar.Properties.Max:=DMBelShop.CDS_While.RecordCount;

    sCodigo:=DMBelShop.CDS_While.FieldByName('Cod_Fornecedor').AsString;
    cVlrSaldo:=0;
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

      DMBelShop.CDS_Pesquisa.Last;
      iUltmio:=DMBelShop.CDS_Pesquisa.RecNo;
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
        End; // If (DMBelShop.CDS_Pesquisa.RecNo<>iUltmio) and (DMBelShop.CDS_Pesquisa.RecNo<>1)Then

        // Verifica Registro de Saldo Final ====================================
        If DMBelShop.CDS_Pesquisa.RecNo=iUltmio Then
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
        End; // If DMBelShop.CDS_Pesquisa.RecNo=iUltmio Then

        DMBelShop.CDS_Pesquisa.Next;
      End; // While Not DMBelShop.CDS_Pesquisa.Eof do

      sCodigo:=DMBelShop.CDS_While.FieldByName('Cod_Fornecedor').AsString;

      DMBelShop.CDS_While.Next;
    End; // While Not DMBelShop.CDS_While.Eof do
    DMBelShop.CDS_While.Close;
    DMBelShop.CDS_Pesquisa.Close;
    FrmBelShop.MontaProgressBar(False, FrmFluxoFornecedor);


    // Exclui Caixas Sem Movtos do Ultimo Fornecedor ===========================
    MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES fe'+
           ' WHERE fe.cod_fornecedor='+sCodigo+
           ' AND  NOT EXISTS (SELECT 1'+
           '                  FROM FL_CAIXA_FORNECEDORES f'+
           '                  WHERE f.cod_fornecedor=fe.cod_fornecedor'+
           '                  AND   f.dta_caixa=fe.dta_caixa'+
           '                  AND   f.num_seq BETWEEN 1 AND 999998)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    OdirPanApres.Visible:=False;
    Refresh;

    // Fecha Transacao =========================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;
  Except
    on e : Exception do
    Begin
      FrmBelShop.MontaProgressBar(False, FrmFluxoFornecedor);

      DMBelShop.SQLC.Rollback(TD);

      OdirPanApres.Visible:=False;

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End;
  End;

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

  //============================================================================
  // Show Hint em Forma de Balão ===============================================
  //============================================================================
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FluFornComprovante.Handle, @ti, TipoDoIcone, 'Selecione o Comprovante'+#13+'a Incluir', 'INCLUIR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FluFornBuscaFornecedor.Handle, @ti, TipoDoIcone, 'Selecionar o'+#13+'Fornecedor', 'SELECIONAR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FluFornSalvaMemoria.Handle, @ti, TipoDoIcone, 'Salvar Resultado'+#13+'em Memória', 'CONTA CORRENTE !!');
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
  Stb_FluForn.Panels[0].Visible:=False;
  Stb_FluForn.Panels[1].Visible:=False;

  Dbg_FluFornFornec.PopupMenu:=nil;

  If AnsiUpperCase(Des_Login)='ODIR' Then
  Begin
    MEdt_DtaAtualizacao.Visible:=True;
    EdtFluFornCodFornAcertar.Visible:=True;
    Bt_FluFornAcertaSaldos.Visible:=True;
  End; // If AnsiUpperCase(Des_Login)='ODIR' Then

  bgPodeUsar:=False;
  // Renato / Anna / Zilandra
  If (Cod_Usuario='1') Or (Cod_Usuario='3') Or (Cod_Usuario='11') Or (AnsiUpperCase(Des_Login)='ODIR') Then
  Begin
    bgPodeUsar:=True;

    Pan_FluFornReducao.Visible:=True;
    Pan_FluFornComprov.Visible:=True;

    Stb_FluFornComprv.Visible:=True;
    Stb_FluForn.Panels[0].Visible:=True;
    Stb_FluForn.Panels[1].Visible:=True;

    Dbg_FluFornFornec.PopupMenu:=PopM_Forn;
  End;

  PC_Principal.TabIndex:=0;
  Ts_FluxFornLanctos.TabVisible:=False;
  Ts_FluxFornGraficos.TabVisible:=False;
  PC_PrincipalChange(Self);

  PC_FluxFornParametros.TabIndex:=0;
  Ts_FluxFornManutReducao.TabVisible:=False;
  PC_FluxFornParametrosChange(Self);

  bgSairFF:=False;

  bgVoltaPerReducao:=False;
  PercReducaoHabiita_GroupBox(True);

// OdirApagar - 06/07/2017
//  // Atualiza Descrição dos Comprovantes de Conta Corrente =====================
//  If FrmBelShop.ConectaMPMS Then
//  Begin
//    AtualizaDescComprvCCorrente;
//  End;

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
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  CorSelecaoTabSheet(PC_Principal);

  // Ts_FluxFornApres
  If (PC_Principal.ActivePage=Ts_FluxFornApres) And (Ts_FluxFornApres.CanFocus) Then
  Begin
    LimpaLancamentos;

    If sgDMLMovto='N' Then
    Begin
      EdtFluFornCodFornecedor.Clear;
      EdtFluFornFornecedor.Clear;
    End;
    sgDMLMovto:='';

    DMBelShop.CDS_FluxoFornecedor.Filtered:=False;
    DMBelShop.CDS_FluxoFornecedor.Filter:='';

    If Not Gb_FluFornFornecedor.Visible Then
     Gb_FluFornFornecedor.Visible:=True;

    Bt_FluFornGraficos.Visible:=True;
    Bt_FluFornIncluir.Visible:=True;
    Bt_FluFornIncluir.Caption:='    Incluir Fornecedor';

    Bt_FluFornImprimir.Visible:=False;
    Bt_FluFornAlterar.Visible:=False;
    Bt_FluFornSalvaMemoria.Visible:=False;
    Bt_FluFornFiltroComprador.Visible:=True;
    Bt_FluFornFiltroComprador.Caption:='Seleciona Comprador';

    Bt_FluFornFechar.Caption:='Fechar';
    Bt_FluFornFechar.Tag:=99;
    Bt_FluFornFechar.Glyph:=Nil;

    EdtFluFornCodFornecedor.Enabled:=True;
    Bt_FluFornBuscaFornecedor.Enabled:=True;

    Dbg_FluFornFornec.SetFocus;
  End;

  // Ts_FluxFornCaixa
  If (PC_Principal.ActivePage=Ts_FluxFornCaixa) And (Ts_FluxFornCaixa.CanFocus) Then
  Begin
    If Not Gb_FluFornFornecedor.Visible Then
     Gb_FluFornFornecedor.Visible:=True;

    Bt_FluFornGraficos.Visible:=True;
    Bt_FluFornIncluir.Visible:=True;
    Bt_FluFornIncluir.Caption:='    Incluir Lançamento';

    Bt_FluFornImprimir.Visible:=True;
    Bt_FluFornAlterar.Visible:=True;
    Bt_FluFornSalvaMemoria.Visible:=True;
    Bt_FluFornFiltroComprador.Visible:=True;
    Bt_FluFornFiltroComprador.Caption:='Seleciona Histórico';

    Bt_FluFornFechar.Caption:='Voltar';
    Bt_FluFornFechar.Tag:=90;
    Bt_FluFornFechar.Glyph:=Nil;

    EdtFluFornCodFornecedor.Enabled:=True;
    Bt_FluFornBuscaFornecedor.Enabled:=True;

    Dbg_FluFornCaixa.SetFocus;
  End;

  // Ts_FluxFornLanctos
  If (PC_Principal.ActivePage=Ts_FluxFornLanctos) And (Ts_FluxFornLanctos.CanFocus) Then
  Begin
    If Not Gb_FluFornFornecedor.Visible Then
     Gb_FluFornFornecedor.Visible:=True;

    Bt_FluFornGraficos.Visible:=False;
    Bt_FluFornImprimir.Visible:=False;
    Bt_FluFornAlterar.Visible:=False;
    Bt_FluFornIncluir.Visible:=False;
    Bt_FluFornSalvaMemoria.Visible:=False;
    Bt_FluFornFiltroComprador.Visible:=False;

    Bt_FluFornFechar.Caption:='Voltar';
    Bt_FluFornFechar.Tag:=90;
    Bt_FluFornFechar.Glyph:=Nil;

    If (sgDMLMovto='I') Or (sgDMLMovto='A') Then
     EdtDtOrigemDoc.SetFocus
    Else
     EdtFluFornCodFornecedor.SetFocus;
  End;

  // Ts_FluxFornGraficos
  If (PC_Principal.ActivePage=Ts_FluxFornGraficos) And (Ts_FluxFornGraficos.CanFocus) Then
  Begin
    Gb_FluFornFornecedor.Visible:=False;

    Bt_FluFornGraficos.Visible:=False;
    Bt_FluFornImprimir.Visible:=False;
    Bt_FluFornAlterar.Visible:=False;
    Bt_FluFornIncluir.Visible:=False;
    Bt_FluFornSalvaMemoria.Visible:=False;
    Bt_FluFornFiltroComprador.Visible:=False;

    Bt_FluFornFechar.Caption:='Voltar';
    Bt_FluFornFechar.Tag:=90;
    Bt_FluFornFechar.Glyph:=Nil;

    Edit2.SetFocus;
  End;

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
                  ' values (14,'+ // TIP_AUX
                  DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsString+', '+ // COD_AUX
                  QuotedStr(sgDtaInicio)+', '+ // DES_AUX
                  ' NULL, NULL, NULL)'+ // DES_AUX1, VLR_AUX, VLR_AUX1
                  ' matching (TIP_AUX, COD_AUX)';
         End
        Else
         Begin
           MySql:=' DELETE FROM TAB_AUXILIAR'+
                  ' WHERE TIP_AUX=14'+
                  ' AND   COD_AUX='+DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsString;
         End; // If Trim(sgDtaInicio)<>'99.99.9999' Then
        DMBelShop.SQLC.Execute(MySql,nil,nil);
        sgDtaInicio:='';

        // Atualiza Transacao ======================================================
        DMBelShop.SQLC.Commit(TD);

        DMBelShop.CDS_FluxoFornecedores.DisableControls;
        DMBelShop.CDS_FluxoFornecedores.Close;
        DMBelShop.CDS_FluxoFornecedores.Open;
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
        msg('Fornecedor Não Localizado !!','A');
      End;
    End; // If Not DMBelShop.CDS_FluxoFornecedores.IsEmpty Then
  End; // If Key=Vk_F4 Then

  Dbg_FluFornFornec.SetFocus;
end;

procedure TFrmFluxoFornecedor.Bt_FluFornAcertaSaldosClick(Sender: TObject);
Var
  i: Integer;
begin
//odirapagar - 07/07/2017
//  If (PC_Principal.ActivePage=Ts_FluxFornApres) And (Ts_FluxFornApres.CanFocus) Then
//   Dbg_FluFornFornec.SetFocus;
//
//  If (PC_Principal.ActivePage=Ts_FluxFornCaixa) And (Ts_FluxFornCaixa.CanFocus) Then
//   Dbg_FluFornCaixa.SetFocus;

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
  DMBelShop.CDS_FluxoFornecedores.Close;
  FiltraComprador('',0);

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
      Ts_FluxFornApres.TabVisible :=True;
      Ts_FluxFornCaixa.TabVisible :=True;
      Ts_FluxFornLanctos.TabVisible:=False;
      Ts_FluxFornGraficos.TabVisible:=False;

      PC_Principal.TabIndex:=igTabSheet;
      PC_PrincipalChange(Self);

      igTabSheet:=0;
      sgDMLMovto:='';
      sgDtaDoc  :='';

      LimpaLancamentos;

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
  End;

  EdtFluFornFornecedor.Clear;
  DMBelShop.CDS_FluxoFornecedor.Close;

  If EdtFluFornCodFornecedor.AsInteger=0 Then
   Exit;

  PC_Principal.ActivePage:=Ts_FluxFornApres;
  PC_PrincipalChange(Self);

  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ========================================================
  MySql:=' SELECT DISTINCT c.des_fornecedor nomefornecedor,'+
         '                 c.cod_fornecedor codfornecedor'+
         ' FROM FL_CAIXA_FORNECEDORES c'+
         ' WHERE c.cod_fornecedor='+IntToStr(EdtFluFornCodFornecedor.AsInteger);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('codfornecedor').AsString)='' Then
  Begin
    msg('Fornecedor NÃO Encontrado !!!', 'A');
    Screen.Cursor:=crDefault;
    EdtFluFornCodFornecedor.Clear;
    EdtFluFornCodFornecedor.SetFocus;
    DMBelShop.CDS_BuscaRapida.Close;
    Exit;
  End;
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
  cValor:=0;
  sDtaLimite:='01.01.1900';
  If DMBelShop.CDS_FluxoFornecedoresLIMITE.AsString='SIM' Then
   sDtaLimite:=DMBelShop.CDS_FluxoFornecedoresDTA_CC.AsString;

  sDtaLimite:=f_Troca('/','.',f_Troca('-','.',sDtaLimite));

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
  End;

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
    End;

    If DMBelShop.CDS_FluxoFornecedorNUM_SEQ.AsInteger=999999 then
    Begin
      Dbg_FluFornCaixa.Canvas.Brush.Color:=clSilver;
      Dbg_FluFornCaixa.Canvas.Font.Style:=[fsBold];
    End;

    If (Column.FieldName='PER_REDUCAO') Then // Este comando altera cor da Celula
    Begin
      If DMBelShop.CDS_FluxoFornecedorPER_REDUCAO.AsCurrency>0.00 then
       Dbg_FluFornCaixa.Canvas.Font.Style:=[fsBold];
    End;

    Dbg_FluFornCaixa.Canvas.FillRect(Rect);
    Dbg_FluFornCaixa.DefaultDrawDataCell(Rect,Column.Field,state);
  End;
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

  If sgDMLMovto='' Then
   MySql:=' SELECT DISTINCT c.des_fornecedor nomefornecedor,'+
          '                 c.cod_fornecedor codfornecedor'+
          ' FROM FL_CAIXA_FORNECEDORES c'+
          ' ORDER BY 2';

  If sgDMLMovto='N' Then
   MySql:=' SELECT fo.razao_cliente nomefornecedor, fo.cod_cliente codfornecedor'+
          ' FROM LINXCLIENTESFORNEC fo'+
          ' WHERE fo.tipo_cliente in (''F'',''A'')'+
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
          '                 WHERE fl.cod_fornecedor=fo.cod_cliente)'+
          ' ORDER BY 1';

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
  If (PC_Principal.ActivePage=Ts_FluxFornApres) And (Ts_FluxFornApres.CanFocus) Then
   Dbg_FluFornFornec.SetFocus;

  If (PC_Principal.ActivePage=Ts_FluxFornCaixa) And (Ts_FluxFornCaixa.CanFocus) Then
   Dbg_FluFornCaixa.SetFocus;

  If Not DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
  Begin
    DBGridClipboard(Dbg_FluFornCaixa);
    Dbg_FluFornCaixa.SetFocus;
  End;
                                 
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
  ii, i: Integer;
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
    If DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
     Exit;

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
      i:=0;
      ii:=0;
      s:='';
      bFiltra:=True;
      DMBelShop.CDS_Busca.First;
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

      DMBelShop.CDS_FluxoFornecedor.Filtered:=False;
      DMBelShop.CDS_FluxoFornecedor.Filter:='';
      If bFiltra Then
      Begin
        DMBelShop.CDS_FluxoFornecedor.Filter:=s;
        DMBelShop.CDS_FluxoFornecedor.Filtered:=True;
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

 Ts_FluxFornParamComprv.TabVisible:=True;
 Ts_FluxFornParamReducao.TabVisible:=True;
 Ts_FluxFornManutReducao.TabVisible:=False;

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
         ' AND   fr.cod_comprovante='+QuotedStr(FormatFloat('000',StrToInt(EdtFluxFornManutCodComprv.text)))+

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
    MySql:=' SELECT distinct cf.cod_fornecedor codfornecedor,'+
           '                 cf.des_fornecedor nomefornecedor'+
           ' FROM FL_CAIXA_FORNECEDORES cf'+
           ' WHERE  cf.cod_fornecedor='+IntToStr(EdtFluxFornManutCodForn.AsInteger);
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
  MySql:=' SELECT distinct cf.des_fornecedor nomefornecedor,'+
         '                 cf.cod_fornecedor codfornecedor'+
         ' FROM FL_CAIXA_FORNECEDORES cf'+
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
        msg('É Permitido Alterar Somente os Históricos:'+cr+cr+sHist,'A');
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
      If DMBelShop.CDS_FluxoFornecedores.IsEmpty Then
       Exit;

      If (Trim(DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.AsString)='') Or
         ((DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.AsInteger<>900)    And
          (DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.AsInteger<>955))   Then
      Begin
        msg('É Permitido Alterar Somente os Históricos:'+cr+cr+sHist,'A');
        Dbg_FluFornCaixa.SetFocus;
        Exit;
      End;

      // Atualiza Componentes ====================================================
      EdtNumDoc.Text     :=DMBelShop.CDS_FluxoFornecedorNUM_DOCUMENTO.AsString;
      EdtSerieDoc.Text   :=DMBelShop.CDS_FluxoFornecedorNUM_SERIE.AsString;
      EdtDtOrigemDoc.Date:=StrToDate(DateToStr(DMBelShop.CDS_FluxoFornecedorDTA_ORIGEM.AsDateTime));
      EdtDtCaixaDoc.Date :=StrToDate(DateToStr(DMBelShop.CDS_FluxoFornecedorDATA.AsDateTime));
      EdtValorDoc.Value  :=DMBelShop.CDS_FluxoFornecedorVLR_ORIGEM.AsCurrency;
      EdtCodLojaDoc.Text :=DMBelShop.CDS_FluxoFornecedorCOD_EMPRESA.AsString;
      EdtCodLojaDocExit(Self);
      EdtCodHistDoc.Text :=DMBelShop.CDS_FluxoFornecedorCOD_HISTORICO.AsString;
      EdtCodHistDocExit(Self);
      EdtObsDoc.Text     :=DMBelShop.CDS_FluxoFornecedorTXT_OBS.AsString;

      sgDtaDoc :=DateToStr(DMBelShop.CDS_FluxoFornecedorDATA.AsDateTime);
      sgNum_SeqCC:=DMBelShop.CDS_FluxoFornecedorNUM_SEQ.AsString;

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

     // Atualiza Componentes ====================================================
     MySql:=' SELECT GEN_ID(GEN_DOC_CC,1) Docto'+
            ' FROM RDB$DATABASE';
     DMBelShop.CDS_Busca.Close;
     DMBelShop.SDS_Busca.CommandText:=MySql;
     DMBelShop.CDS_Busca.Open;
     EdtNumDoc.Text  :=DMBelShop.CDS_Busca.FieldByName('Docto').AsString;
     EdtSerieDoc.Text:='UNIC';
     DMBelShop.CDS_Busca.Close;
   End; // If sgDMLMovto='A' Then

  Ts_FluxFornLanctos.TabVisible:=True;

  PC_PrincipalChange(Self);

end;

procedure TFrmFluxoFornecedor.Bt_FluFornGraficosClick(Sender: TObject);
begin
  msg('Opção em Desenvolvimento !!','A');
  Exit;

  If (PC_Principal.ActivePage=Ts_FluxFornApres) And
     (Ts_FluxFornApres.CanFocus) And
     (DMBelShop.CDS_FluxoFornecedores.IsEmpty) Then
    Exit;

  If (PC_Principal.ActivePage=Ts_FluxFornCaixa) And
     (Ts_FluxFornCaixa.CanFocus) And
     (DMBelShop.CDS_FluxoFornecedor.IsEmpty) Then
    Exit;

  igTabSheet:=PC_Principal.TabIndex;

  Ts_FluxFornApres.TabVisible :=False;
  Ts_FluxFornCaixa.TabVisible :=False;
  Ts_FluxFornGraficos.TabVisible:=True;

  PC_PrincipalChange(Self);

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
begin
  EdtDtOrigemDoc.SetFocus;

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

  // Atualiza Saldos do Fornecedor =============================================
  EdtFluFornCodFornAcertar.Text:=sCodForn;
  MEdt_DtaAtualizacao.Text:=f_Troca('/','.',f_Troca('-','.',sgDtaDoc));

                                     //=========================================
  bgAtualizaDireto:=True;            //
  Bt_FluFornAcertaSaldosClick(Self); //<<<==== Atualiza Saldos do Fornecedor
                                     //=========================================

  // Libera Nova Posição do Conta Corrente =====================================
  EdtFluFornCodFornecedor.AsInteger:=0;
  EdtFluFornFornecedor.Text:='';

  // Apresernta Fornecedores ===================================================
  If DMBelShop.CDS_FluxoFornecedores.Active Then
   DMBelShop.CDS_FluxoFornecedores.Close;

  FiltraComprador('',0);

  Ts_FluxFornApres.TabVisible :=True;
  Ts_FluxFornCaixa.TabVisible :=True;
  Ts_FluxFornLanctos.TabVisible:=False;
  Ts_FluxFornGraficos.TabVisible:=False;
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
  EdtDtOrigemDoc.SetFocus;

  LimpaLancamentos;

  If sgDMLMovto='A' Then
   Bt_FluFornFecharClick(Bt_FluFornFechar);

end;

procedure TFrmFluxoFornecedor.EdtDtOrigemDoc1DropDown(Sender: TObject);
begin
  SelectNext(ActiveControl,True,True);
end;

end.

{
hint balao revisar
}
