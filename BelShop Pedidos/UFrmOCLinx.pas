unit UFrmOCLinx;
//OdirRetornar
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, dxGDIPlusClasses,
  JvExControls, JvXPCore, JvXPButtons, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, JvExStdCtrls, JvEdit,
  JvValidateEdit, DBCtrls, Grids, DBGrids, DBGridJul, JvRadioButton,
  JvXPCheckCtrls, JvCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, ComCtrls, cxLocalization, AppEvnts, JvGradientCaption,
  Commctrl, // SHOW HINT EM FORMA DE BALÃO
  MMSystem, // Som Windows
  DBXpress, IBCustomDataSet, IBUpdateSQL, DB, IBQuery,
  IBDatabase, Provider, DBClient, SqlExpr, dxSkinsdxStatusBarPainter,
  dxStatusBar, StrUtils, Math, ActnList, Menus;

type
  TFrmOCLinx = class(TForm)
    PC_OrdemCompra: TPageControl;
    Ts_OCBuscaProdutos: TTabSheet;
    Pan_OC: TPanel;
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
    Pan_FiltroNaoCompra: TPanel;
    Gb_CalculoUtilizarProdNaoCompra: TGroupBox;
    Label190: TLabel;
    Label1: TLabel;
    Ckb_FiltroProdNaoCompra: TJvXPCheckbox;
    Ckb_FiltroProdSoNaoCompra: TJvXPCheckbox;
    Gb_CalculoFiltroNome: TGroupBox;
    Label186: TLabel;
    Label203: TLabel;
    Label204: TLabel;
    Label205: TLabel;
    Label73: TLabel;
    EdtCalculoFiltroNome1: TEdit;
    EdtCalculoFiltroNome4: TEdit;
    EdtCalculoFiltroNome3: TEdit;
    EdtCalculoFiltroNome2: TEdit;
    Dbg_FiltroProduto: TDBGridJul;
    Ts_OCGeraOrdemCompra: TTabSheet;
    Panel33: TPanel;
    Gb_GeraOCFornecedor: TGroupBox;
    Dbe_GeraOCDescItem: TDBEdit;
    Gb_GeraOCDocto: TGroupBox;
    EdtGeraOCBuscaDocto: TCurrencyEdit;
    DtEdt_GeraOCDataDocto: TDateEdit;
    Bt_GeraOCBuscaDocto: TJvXPButton;
    Bt_GeraOCExcluir: TJvXPButton;
    Gb_GeraOCCalculaCompra: TGroupBox;
    Label48: TLabel;
    EdtGeraOCDias: TJvValidateEdit;
    Bt_GeraOCCalcular: TJvXPButton;
    PC_GeraOCApresentacao: TPageControl;
    Ts_GeraOCGrid: TTabSheet;
    Dbg_GeraOCGrid: TDBGridJul;
    Panel22: TPanel;
    Bt_OCFechar: TJvXPButton;
    Bt_OCBuscaProdutos: TJvXPButton;
    Pan_TotalProdutos: TPanel;
    Label70: TLabel;
    Edt_OCTotProdutos: TCurrencyEdit;
    Panel1: TPanel;
    CorCaptionForm: TJvGradientCaption;
    ApplicationEvents1: TApplicationEvents;
    Trad_Localizer: TcxLocalizer;
    Bt_FiltroExcluiForn: TJvXPButton;
    Bt_FiltroExcluiProdtudo: TJvXPButton;
    Bt_FiltroCodBarras: TJvXPButton;
    OdirPanApres: TPanel;
    Dbg_GeraOCGridProd: TDBGrid;
    Gb_GeraOCTotPedido: TGroupBox;
    EdtGeraOCTotalGeral: TCurrencyEdit;
    GroupBox1: TGroupBox;
    Label32: TLabel;
    CB_Mes6: TComboBox;
    Label33: TLabel;
    ME_Ano6: TMaskEdit;
    Label34: TLabel;
    CB_Mes7: TComboBox;
    Label40: TLabel;
    ME_Ano7: TMaskEdit;
    Label41: TLabel;
    CB_Mes8: TComboBox;
    Label42: TLabel;
    ME_Ano8: TMaskEdit;
    GB_CalculoMeses: TGroupBox;
    Panel2: TPanel;
    Label22: TLabel;
    CB_Mes1: TComboBox;
    Label23: TLabel;
    ME_Ano1: TMaskEdit;
    Label24: TLabel;
    CB_Mes2: TComboBox;
    Label25: TLabel;
    ME_Ano2: TMaskEdit;
    Label26: TLabel;
    CB_Mes3: TComboBox;
    Label27: TLabel;
    ME_Ano3: TMaskEdit;
    Label28: TLabel;
    CB_Mes4: TComboBox;
    Label29: TLabel;
    ME_Ano4: TMaskEdit;
    Label30: TLabel;
    CB_Mes5: TComboBox;
    Label31: TLabel;
    ME_Ano5: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bt_OCFechaPedido: TJvXPButton;
    Ts_GeraOCOrdensCompra: TTabSheet;
    Panel35: TPanel;
    Lab_ItensOC: TLabel;
    Lab_Qtds_OC: TLabel;
    DbeGeraOCTotalProdutos: TDBEdit;
    DbeGeraOCQtdOCs: TDBEdit;
    Dbg_GeraOCTotalGeral: TDBGridJul;
    Sb_GeraOC: TdxStatusBar;
    Bt_GeraOCImpEditOC: TJvXPButton;
    procedure Bt_OCFecharClick(Sender: TObject);
    procedure PC_OrdemCompraChange(Sender: TObject);
    procedure PC_FiltrosChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtFiltroCodFornExit(Sender: TObject);

    //==========================================================================
    // Odir ====================================================================
    //==========================================================================

    // Hint em Fortma de Balão =================================================
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl);

    // PEDIDO COMPRAS ==========================================================
    Procedure InicializaMesesLinx;

    Procedure NomeMesesGridLinx;
    Procedure MontaSelectFornecedoresLinx;

    Procedure AlteraAComprar(IBQComprar: TIBQuery; sQual, sNumDoc, sDtaDocto: String);
                            // sQual:
                            //    Q  = Quantidade
                            //    P  = Preco Unitário
                            //    DI = Percentual de Desconto Individual
                            //    DM = Percentual de Desconto no Mix

    // Busca Totais do Pedido OCs
    Procedure TotaisOCLinx(sNrDoc: String);

    // Atualiza OC_COMPRAR_DOCS
    Procedure OC_COMPRAR_DOCS(sTipo, sDoc: String; sOrigem: String='');
                              // sTipo=(I)nsert (D)elete

    Procedure MontaSelecaoProdutos(bProd, bLike: Boolean);
                                   // bProd = True - Seleciona Produto (Codigo)
                                   // bLike = True - Seleciona Produto (Nome)
                                   // Like Montado com Alias < pr. >
                                   //      USAR: MySql:=
                                   //              MySql+f_Troca('pr.','p.',sgLikeProdutos);

    Function  BuscaProdutosAnalise: Boolean;
    Function  CriaPedidoOC: Boolean;
    Procedure AtualizaNumeroDosMeses;
    Procedure OCCalculaSugTransfExc(sNrDoc, sDtaDoc: String); // Calcula Sugestões / Transferencias / Estoque Excedente

    //==========================================================================
    // Odir ====================================================================
    //==========================================================================

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Bt_FiltroExcluiFornClick(Sender: TObject);
    procedure Bt_FiltroBuscaFornClick(Sender: TObject);
    procedure Ckb_FiltroProdNaoCompraClick(Sender: TObject);
    procedure Ckb_FiltroProdNaoCompraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_FiltroFornecedoresEnter(Sender: TObject);
    procedure Dbg_FiltroProdutoEnter(Sender: TObject);
    procedure Bt_FiltroCodBarrasClick(Sender: TObject);
    procedure EdtFiltroCodProdutoExit(Sender: TObject);
    procedure Bt_FiltroExcluiProdtudoClick(Sender: TObject);
    procedure Bt_FiltroBuscaProdtudoClick(Sender: TObject);
    procedure EdtGeraOCBuscaDoctoChange(Sender: TObject);
    procedure EdtGeraOCBuscaDoctoEnter(Sender: TObject);
    procedure EdtGeraOCBuscaDoctoExit(Sender: TObject);
    procedure PC_GeraOCApresentacaoChange(Sender: TObject);
    procedure Bt_GeraOCBuscaDoctoClick(Sender: TObject);
    procedure Bt_GeraOCExcluirClick(Sender: TObject);
    procedure Bt_GeraOCCalcularClick(Sender: TObject);
    procedure Dbg_GeraOCGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_GeraOCGridEnter(Sender: TObject);
    procedure Dbg_GeraOCGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_GeraOCGridProdEnter(Sender: TObject);
    procedure Bt_OCBuscaProdutosClick(Sender: TObject);
    procedure Dbg_GeraOCTotalGeralDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_OCFechaPedidoClick(Sender: TObject);
    procedure Dbg_GeraOCGridExit(Sender: TObject);
    procedure Dbg_GeraOCGridProdExit(Sender: TObject);
    procedure Dbg_GeraOCGridColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure Bt_GeraOCImpEditOCClick(Sender: TObject);
    procedure Dbg_FiltroFornecedoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_FiltroProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  FrmOCLinx: TFrmOCLinx;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  bgSairLinx: Boolean;

  sgFornecedoresLinx: String;

  igColumns,
  igColAComprar, igColEstMinimo,
  igTotInteiro: Integer;

  bgEstMinimo, // Se Estoque Mínimo Pode Ser Alterado
  bgOnChageExec,
  bgDrawColumnCell: Boolean;

  // Montagem de Pedido //////////////////////////
  igTotMeses: Integer;

  sgOrderGrid,
  sgLikeProdutosLinx, sgProdutosLinx,
  sgNumPed: String;

  igNumSeqPed: Integer;
  ////////////////////////////////////////////////


implementation

uses DK_Procs1, UDMVirtual, UDMBelShopPedidos, UPesquisa, UDMOCLinx,
     UFrmProdutoCodBarras, UFrmBelShopPedidos, UDMRelatorio;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// PEDIDO DE COMPRAS - Calcula Sugestões / Transferencias / Estoque Excedente >>
Procedure TFrmOCLinx.OCCalculaSugTransfExc(sNrDoc, sDtaDoc: String);
Var
  MySql: String;
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
   If Not DMBelShopPedidos.IBT_BelShop.Active Then
   Begin
     DMBelShopPedidos.IBT_BelShop.StartTransaction;
   End;
    // Monta Transacao ===========================================================

    // Calcula Matriz ==========================================================
    FrmBelShopPedidos.MontaProgressBar(True, FrmOCLinx);

    // Busca Pedido -------------------------------------------------
    MySql:=' SELECT *'+
           ' FROM  OC_COMPRAR OC'+
           ' WHERE oc.num_documento='+sNrDoc+
           ' AND   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaDoc)))+
           ' AND   oc.cod_empresa='+sgLojaLinx+
           ' AND   oc.ind_oc_gerada=''N'''+
           ' ORDER BY oc.Des_Item';
    DMOCLinx.IBQ_OC_ComprarAdd.Close;
    DMOCLinx.IBQ_OC_ComprarAdd.SQL.Clear;
    DMOCLinx.IBQ_OC_ComprarAdd.SQL.Add(MySql);
    DMOCLinx.IBQ_OC_ComprarAdd.Open;

    If DMOCLinx.IBQ_OC_ComprarAdd.IsEmpty Then
     Exit;

    DMOCLinx.IBQ_OC_ComprarAdd.Last;
    pgProgBar.Properties.Max:=DMOCLinx.IBQ_OC_ComprarAdd.RecordCount;
    pgProgBar.Position:=0;
    DMOCLinx.IBQ_OC_ComprarAdd.First;
    DMOCLinx.IBQ_OC_ComprarAdd.DisableControls;
    While not DMOCLinx.IBQ_OC_ComprarAdd.Eof do
    Begin
      Application.ProcessMessages;
      pgProgBar.Position:=DMOCLinx.IBQ_OC_ComprarAdd.RecNo;

      DMOCLinx.IBQ_OC_ComprarAdd.Edit;

      // QTD_SUGERIDA
      DMOCLinx.IBQ_OC_ComprarAddQTD_SUGERIDA.AsCurrency:=RoundTo(
                        (DMOCLinx.IBQ_OC_ComprarAddQTD_MEDIA_DIA.AsCurrency*
                         DMOCLinx.IBQ_OC_ComprarAddDIAS_ESTOCAGEM.AsInteger),0);

      // Atualiza Sugerida se Necessário
      If (DMOCLinx.IBQ_OC_ComprarAddEST_MINIMO.AsInteger-DMOCLinx.IBQ_OC_ComprarAddQTD_SALDO.AsInteger) > DMOCLinx.IBQ_OC_ComprarAddQTD_SUGERIDA.AsInteger Then
      Begin
        DMOCLinx.IBQ_OC_ComprarAddQTD_SUGERIDA.AsInteger:=
                                 DMOCLinx.IBQ_OC_ComprarAddEST_MINIMO.AsInteger-
                                  DMOCLinx.IBQ_OC_ComprarAddQTD_SALDO.AsInteger;
      End;

      // Atualiza AComprar se Necessário
      If (DMOCLinx.IBQ_OC_ComprarAddEST_MINIMO.AsInteger-DMOCLinx.IBQ_OC_ComprarAddQTD_SALDO.AsInteger) > DMOCLinx.IBQ_OC_ComprarAddQTD_ACOMPRAR.AsInteger Then
       DMOCLinx.IBQ_OC_ComprarAddQTD_ACOMPRAR.AsInteger:=
                                 DMOCLinx.IBQ_OC_ComprarAddEST_MINIMO.AsInteger-
                                   DMOCLinx.IBQ_OC_ComprarAddQTD_SALDO.AsInteger
      Else
       DMOCLinx.IBQ_OC_ComprarAddQTD_ACOMPRAR.AsCurrency:=
                              DMOCLinx.IBQ_OC_ComprarAddQTD_SUGERIDA.AsCurrency;

// OdirApagar - 17/05/2019
//      DMOCLinx.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency:=RoundTo(
//         (DMOCLinx.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency-
//          DMOCLinx.IBQ_OC_ComprarAdd.FieldByName('QTD_DISPONIVEL').AsCurrency),0);
//
//      If DMOCLinx.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency<0 Then
//      Begin
//        DMOCLinx.IBQ_OC_ComprarAdd.FieldByName('IND_QTD_ACIMA').AsCurrency:=Abs(
//              DMOCLinx.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency);
//
//        DMOCLinx.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency:=0;
//      End;

      // QTD_SUGERIDA_ANO
      DMOCLinx.IBQ_OC_ComprarAddQTD_SUGERIDA_ANO.AsCurrency:=RoundTo(
                          (DMOCLinx.IBQ_OC_ComprarAddQTD_DEMANDA_DIA.AsCurrency*
                         DMOCLinx.IBQ_OC_ComprarAddDIAS_ESTOCAGEM.AsInteger),0);

      If DMOCLinx.IBQ_OC_ComprarAddQTD_SUGERIDA_ANO.AsCurrency < DMOCLinx.IBQ_OC_ComprarAddEST_MINIMO.AsCurrency Then
       DMOCLinx.IBQ_OC_ComprarAddQTD_SUGERIDA_ANO.AsCurrency:=
                                DMOCLinx.IBQ_OC_ComprarAddEST_MINIMO.AsCurrency;

      DMOCLinx.IBQ_OC_ComprarAddQTD_SUGERIDA_ANO.AsCurrency:=
                          DMOCLinx.IBQ_OC_ComprarAddQTD_SUGERIDA_ANO.AsCurrency-
                            DMOCLinx.IBQ_OC_ComprarAddQTD_DISPONIVEL.AsCurrency;

      If DMOCLinx.IBQ_OC_ComprarAddQTD_SUGERIDA_ANO.AsCurrency<0 Then
       DMOCLinx.IBQ_OC_ComprarAddQTD_SUGERIDA_ANO.AsCurrency:=0;

// OdirApagar - 17/05/2019
////       QTD_ACOMPRAR
//      If cQtdSugerida<0 Then // Não Processa Pelo estoque Minimo
//       DMOCLinx.IBQ_OC_ComprarAdd.FieldByName('QTD_ACOMPRAR').AsCurrency:=
//              DMOCLinx.IBQ_OC_ComprarAdd.FieldByName('QTD_SUGERIDA').AsCurrency
//      Else
//       DMOCLinx.IBQ_OC_ComprarAdd.FieldByName('QTD_ACOMPRAR').AsCurrency:=cQtdSugerida;
//
      DMOCLinx.IBQ_OC_ComprarAdd.Post;

      DMOCLinx.IBQ_OC_ComprarAdd.Next;
    End; // While not DMOCLinx.IBQ_OC_ComprarAdd.Eof do
    DMOCLinx.IBQ_OC_ComprarAdd.EnableControls;

    // Atualiza Transacao ======================================================
    DMOCLinx.IBQ_OC_ComprarAdd.ApplyUpdates;
    DMBelShopPedidos.IBT_BelShop.CommitRetaining;
    DMBelShopPedidos.IBT_BelShop.Commit;

    // Atualiza OC_COMPRAR_DOCS ================================================
    OC_COMPRAR_DOCS('I', sNrDoc, 'Linx-'+sgUfLoja+sgLojaLinx);

    // Atualiza Totais =========================================================
    DMBelShopPedidos.Doc_CalculaValores(sNrDoc, sDtaDoc);

  Except // Try // IBQ_OC_ComprarAdd
    On e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShopPedidos.IBT_BelShop.Rollback;

      msg('Erro na Geração das Sugestões de Compra !!'+cr+cr+'Loja: '+sgLojaLinx +' !!','A');
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // On e : Exception do
  End; // Try // IBQ_OC_ComprarAdd

  DMOCLinx.IBQ_OC_ComprarAdd.Close;
  FrmBelShopPedidos.MontaProgressBar(False, FrmOCLinx);
  OdirPanApres.Visible:=False;
                     
End; // PEDIDO DE COMPRAS - Calcula Sugestões / Transferencias / Estoque Excedente

// PEDIDO DE COMPRAS - Atualiza Numero dos Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.AtualizaNumeroDosMeses;
Var
  MySql: String;
Begin
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
  DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

End; // PEDIDO DE COMPRAS - Atualiza Numero dos Meses >>>>>>>>>>>>>>>>>>>>>>>>>>

// PEDIDO DE COMPRAS - Calcula Pedido de Compra do Linx >>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmOCLinx.CriaPedidoOC: Boolean;
Var
  MySql: String;

  i: Integer;

  iQtd_Necessaria: Integer;
  eQtd_Necessaria: Extended;

  bUltCompra: Boolean; // Se Encontrou Ultima Compra

  sGenProd: String; // Generator Num_Seq dos Produtos
  sVlrUnitUltCompra, sDiasEstocagem,
  sEstMinimo, sIndCurva, sQtdTransito: String;

  // Tributação
  sCOD_ICMS, sEstado, sTIP_PESSOA,
  sCodICM, sSittributaria, sSomaIPIBase, sSomaFreteBase, sSomaDespesaBase,
  sSubstituicao, sSubstValPer, sSomaIPIBaseSubst, sSomaFreteBaseST,
  sSomaDespesaBaseST: String;
  cAliquota, cReducao, cSubstMargem, cSubstAliquota, cAliqRepasse: Currency;
Begin

  Result:=True;

  //============================================================================
  // Novo Processo de Calculo Usando IBQ_OC_ComprarAdd =========================
  //============================================================================
  // Verifica se Transação esta Ativa
  If DMBelShopPedidos.SQLC.InTransaction Then
   DMBelShopPedidos.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShopPedidos.SQLC.StartTransaction(TD);
  Try // IBQ_OC_ComprarAdd
    DateSeparator:='.';
    DecimalSeparator:='.';

    DMOCLinx.IBQ_OC_ComprarAdd.Last;
    pgProgBar.Properties.Max:=DMOCLinx.IBQ_OC_ComprarAdd.RecordCount;
    Edt_OCTotProdutos.Value:=DMOCLinx.IBQ_OC_ComprarAdd.RecordCount;
    DMOCLinx.IBQ_OC_ComprarAdd.First;
    pgProgBar.Position:=0;
    sgMensagem:='Produtos a Processar: '+IntToStr(DMOCLinx.IBQ_OC_ComprarAdd.RecordCount)+' Procesados: ';

    OdirPanApres.Caption:=sgMensagem+'0';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmOCLinx.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmOCLinx.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmOCLinx;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Screen.Cursor:=crAppStart;
    Refresh;

    // Efetua o Calculo Para Analise Matriz ====================================
    sCOD_ICMS  :='';
    sEstado    :='';
    sTIP_PESSOA:='';
    sVlrUnitUltCompra:='';
    sDiasEstocagem:='';
    sEstMinimo:='';
    sIndCurva:='';
    sQtdTransito:='';

    // Parametro: Estoque Minimo Padrão e Dias de Estocagem ====================
    DMOCLinx.CDS_ParamCurvaABC.Open;

    //==========================================================================
    // INICIA PROCESSO =========================================================
    //==========================================================================
    DMOCLinx.IBQ_OC_ComprarAdd.First;
    DMOCLinx.IBQ_OC_ComprarAdd.DisableControls;
    While not DMOCLinx.IBQ_OC_ComprarAdd.Eof do
    Begin
      pgProgBar.Position:=DMOCLinx.IBQ_OC_ComprarAdd.RecNo;
      OdirPanApres.Caption:=sgMensagem+IntToStr(DMOCLinx.IBQ_OC_ComprarAdd.RecNo);
      Application.ProcessMessages;

      //========================================================================
      // Efetua Processo Normal ================================================
      //========================================================================
      // Tributação ----------------------------------------------------------
      If (sCOD_ICMS  <>DMOCLinx.IBQ_OC_ComprarAddCOD_ICMS.AsString) Or
         (sEstado    <>DMOCLinx.IBQ_OC_ComprarAddESTADO.AsString)   Or
         (sTIP_PESSOA<>DMOCLinx.IBQ_OC_ComprarAddTIP_PESSOA.AsString) Then
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

        sCOD_ICMS  :=DMOCLinx.IBQ_OC_ComprarAddCOD_ICMS.AsString;
        sEstado    :=DMOCLinx.IBQ_OC_ComprarAddESTADO.AsString;
        sTIP_PESSOA:=DMOCLinx.IBQ_OC_ComprarAddTIP_PESSOA.AsString;
      End; // If (sCOD_ICMS  <>DMOCLinx.IBQ_OC_ComprarAddCOD_ICMS.AsString) Or ...

      // Busca Ultima Compra =================================================
      MySql:=' select FIRST 1'+
             ' ml.data_lancamento DTA_ULT_COMPRA,'+
             ' ml.codigo_cliente COD_FOR_ULT_COMPRA,'+
             ' SUBSTRING(TRIM(fo.nome_cliente) FROM 1 FOR 40) DES_FOR_ULT_COMPRA,'+
             ' ml.quantidade QTD_ULT_COMPRA,'+
             ' ml.valor_liquido VLR_UNI_ULT_COMPRA,'+
             ' ml.valor_total VLR_TOT_ULT_COMPRA,'+
             ' ml.valor_liquido VLR_UNI_COMPRA,'+
             ' ml.preco_unitario,'+
             ' ml.cst_ipi COD_IPI,'+
             ' ml.aliquota_ipi PER_IPI,'+
             ' SUBSTRING(ml.cst_icms FROM (POSITION(''.'', ml.cst_icms))+1 for 2) COD_ICMS,'+
             ' ml.aliquota_icms PER_ICMS,'+
             ' ml.aliquota_icms_st PER_ST'+

             ' FROM LINXMOVIMENTO ml, LINXCLIENTESFORNEC fo'+
             ' WHERE ml.codigo_cliente=fo.cod_cliente'+
             ' AND   ml.operacao=''E'''+
             ' AND   COALESCE(ml.tipo_transacao,''E'')=''E'''+
             ' AND   COALESCE(ml.id_cfop,0) not in (1910, 2910)'+
             ' AND   ml.cancelado=''N'''+
             ' AND   ml.excluido=''N'''+
             ' AND   ml.data_lancamento=(SELECT MAX(ml1.data_lancamento)'+
             '                           FROM LINXMOVIMENTO ml1'+
             '                           WHERE ml1.cod_produto= ml.cod_produto'+
             '                           AND   ml1.empresa    = ml.empresa'+
             '                           AND   ml1.operacao   = ml.operacao'+
             '                           AND   ml1.id_cfop    = ml.id_cfop'+
             '                           AND   ml1.cancelado  = ml.cancelado'+
             '                           AND   ml1.excluido   = ml.excluido'+
             '                           AND   ml1.documento  = ml.documento'+
             '                           AND   ml1.codigo_cliente  = ml.codigo_cliente'+
             '                           AND   COALESCE(ml1.tipo_transacao,''E'')=''E'')'+
             ' AND   ml.cod_produto='+DMOCLinx.IBQ_OC_ComprarAddCOD_ITEM.AsString+
             ' AND   ml.empresa='+sgLojaLinx;
      DMOCLinx.CDS_PedUltCompra.Close;
      DMOCLinx.SQLQ_PedUltCompra.SQL.Clear;
      DMOCLinx.SQLQ_PedUltCompra.SQL.Add(MySql);
      DMOCLinx.CDS_PedUltCompra.Open;

      sVlrUnitUltCompra:=DMOCLinx.CDS_PedUltCompraVLR_UNI_COMPRA.AsString;
      bUltCompra:=True;
      If DMOCLinx.CDS_PedUltCompra.IsEmpty Then
      Begin
        bUltCompra:=False;
        DMOCLinx.CDS_PedUltCompra.Close;

        MySql:=' SELECT pt.preco_custo'+
               ' FROM LINXPRODUTOSDETALHES pt'+
               ' WHERE pt.empresa='+sgLojaLinx+
               ' AND   pt.cod_produto='+DMOCLinx.IBQ_OC_ComprarAddCOD_ITEM.AsString;
        DMBelShopPedidos.CDS_BuscaRapida.Close;
        DMBelShopPedidos.SQLQ_BuscaRapida.Close;
        DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
        DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
        DMBelShopPedidos.CDS_BuscaRapida.Open;

        If DMBelShopPedidos.CDS_BuscaRapida.IsEmpty Then
        Begin
          MySql:=' SELECT pt.preco_custo'+
                 ' FROM LINXPRODUTOSDETALHES pt'+
                 ' WHERE pt.empresa=2'+
                 ' AND   pt.cod_produto='+DMOCLinx.IBQ_OC_ComprarAddCOD_ITEM.AsString;
          DMBelShopPedidos.CDS_BuscaRapida.Close;
          DMBelShopPedidos.SQLQ_BuscaRapida.Close;
          DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
          DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
          DMBelShopPedidos.CDS_BuscaRapida.Open;
        End; // If DMBelShopPedidos.CDS_BuscaRapida.IsEmpty Then
        sVlrUnitUltCompra:=DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Preco_Custo').AsString;

        DMBelShopPedidos.CDS_BuscaRapida.Close;
      End; // If DMOCLinx.CDS_PedUltCompra.IsEmpty Then

      // Busca Quantidae em Transito =========================================
      MySql:=' SELECT CAST(COALESCE(SUM(m.quant_ref), 0) AS INTEGER) Qtd_Transito'+
             ' FROM MOVTOS_EMPRESAS m'+
             ' WHERE m.ind_tipo=''TR'''+
             ' AND   m.cod_linx='+sgLojaLinx+
             ' AND   m.cod_prod_linx='+DMOCLinx.IBQ_OC_ComprarAddCOD_ITEM.AsString;
      DMBelShopPedidos.SQLQuery1.Close;
      DMBelShopPedidos.SQLQuery1.SQL.Clear;
      DMBelShopPedidos.SQLQuery1.SQL.Add(MySql);
      DMBelShopPedidos.SQLQuery1.Open;
      sQtdTransito:=DMBelShopPedidos.SQLQuery1.FieldByName('Qtd_Transito').AsString;
      DMBelShopPedidos.SQLQuery1.Close;

      // Busca Estoque Minimo e Curva ========================================
      sEstMinimo:='0';
      sIndCurva:='E';
      MySql:=' SELECT c.ind_curva, c.est_minimo'+
             ' FROM ES_FINAN_CURVA_ABC c'+
             ' WHERE c.cod_linx='+sgLojaLinx+
             ' AND   c.cod_prod_linx='+DMOCLinx.IBQ_OC_ComprarAddCOD_ITEM.AsString;
      DMBelShopPedidos.SQLQuery1.Close;
      DMBelShopPedidos.SQLQuery1.SQL.Clear;
      DMBelShopPedidos.SQLQuery1.SQL.Add(MySql);
      DMBelShopPedidos.SQLQuery1.Open;

      If Trim(DMBelShopPedidos.SQLQuery1.FieldByName('Ind_Curva').AsString)<>'' Then
       sIndCurva:=Trim(DMBelShopPedidos.SQLQuery1.FieldByName('Ind_Curva').AsString);

      If Trim(DMBelShopPedidos.SQLQuery1.FieldByName('Est_Minimo').AsString)<>'' Then
       sEstMinimo:=Trim(DMBelShopPedidos.SQLQuery1.FieldByName('Est_Minimo').AsString);

      DMBelShopPedidos.SQLQuery1.Close;

      // Acerta Estoque Minimo e Dias de Estocagem ===========================
      sDiasEstocagem:='0';
      DMOCLinx.CDS_ParamCurvaABC.Locate('CURVA', DMOCLinx.IBQ_OC_ComprarAdd.FieldByName('CLA_CURVA_ABC').AsString,[]);
      If DMOCLinx.CDS_ParamCurvaABCQTD_DIAS.AsInteger<>0 Then
       sDiasEstocagem:=DMOCLinx.CDS_ParamCurvaABCQTD_DIAS.AsString;

      If (DMOCLinx.CDS_ParamCurvaABCQTD_MIN.AsInteger<>0) and (sEstMinimo='0') Then
       sEstMinimo:=DMOCLinx.CDS_ParamCurvaABCQTD_MIN.AsString;

      //======================================================================
      // Edit Documento OC_COMPRAR ===========================================
      //======================================================================
      MySql:=' UPDATE OC_COMPRAR oc'+
             ' SET oc.num_seq=999999'+
             ', oc.est_minimo='+QuotedStr(sEstMinimo)+
             ', oc.qtd_transito='+QuotedStr(sQtdTransito)+
             ', oc.qtd_disponivel=(oc.qtd_saldo + oc.qtd_transito)'+
             ', oc.dias_estocagem='+QuotedStr(sDiasEstocagem);

             If Trim(DMOCLinx.CDS_PedUltCompraCOD_IPI.AsString)<>'' Then
              MySql:=
               MySql+', oc.cod_ipi='+QuotedStr(DMOCLinx.CDS_PedUltCompraCOD_IPI.AsString);

             If Trim(DMOCLinx.CDS_PedUltCompraCOD_IPI.AsString)<>'' Then
              MySql:=
               MySql+', oc.per_ipi='+QuotedStr(DMOCLinx.CDS_PedUltCompraPER_IPI.AsString);

             If Trim(DMOCLinx.CDS_PedUltCompraCOD_IPI.AsString)<>'' Then
              MySql:=
               MySql+', oc.cod_icms='+QuotedStr(DMOCLinx.CDS_PedUltCompraCOD_ICMS.AsString);

             If Trim(DMOCLinx.CDS_PedUltCompraCOD_IPI.AsString)<>'' Then
              MySql:=
               MySql+', oc.per_icms='+QuotedStr(DMOCLinx.CDS_PedUltCompraPER_ICMS.AsString);

             If Trim(DMOCLinx.CDS_PedUltCompraCOD_IPI.AsString)<>'' Then
              MySql:=
               MySql+', oc.per_st='+QuotedStr(DMOCLinx.CDS_PedUltCompraPER_ST.AsString);

            If (bUltCompra) Then
            Begin
              MySql:=
               MySql+', oc.dta_ult_compra='+QuotedStr(f_Troca('/','.',f_Troca('-','.',
                            DMOCLinx.CDS_PedUltCompraDTA_ULT_COMPRA.AsString)))+
                     ', oc.cod_for_ult_compra='+QuotedStr(
                          DMOCLinx.CDS_PedUltCompraCOD_FOR_ULT_COMPRA.AsString)+
                     ', oc.des_for_ult_compra='+QuotedStr(
                           DMOCLinx.CDS_PedUltCompraDES_FOR_ULT_COMPRA.AsString)+
                     ', oc.qtd_ult_compra='+QuotedStr(
                              DMOCLinx.CDS_PedUltCompraQTD_ULT_COMPRA.AsString)+
                     ', oc.vlr_uni_ult_compra='+QuotedStr(
                          DMOCLinx.CDS_PedUltCompraVLR_UNI_ULT_COMPRA.AsString)+
                     ', oc.vlr_tot_ult_compra='+QuotedStr(
                          DMOCLinx.CDS_PedUltCompraVLR_TOT_ULT_COMPRA.AsString)+
                     ', oc.vlr_uni_compra='+QuotedStr(sVlrUnitUltCompra);
            End; // If (bUltCompra) Then

            //==================================================================
            // Calcula Necessidade de Compras ==================================
            //==================================================================
            iQtd_Necessaria:=0;
            If DMOCLinx.IBQ_OC_ComprarAddQTD_DIAS_ANO.AsInteger < StrToInt(sDiasEstocagem) Then // Qtds Saldo de Estocqgem em dias
            Begin

              // Quantidade Necessaria para Estocagem ==========================
              iQtd_Necessaria:= StrToInt(CurrToStr( Round_5((DMOCLinx.IBQ_OC_ComprarAddQTD_MEDIA_DIA.AsCurrency * StrToCurr(sDiasEstocagem)),0)));

              If DMOCLinx.IBQ_OC_ComprarAddQTD_SALDO.AsInteger < iQtd_Necessaria Then
               iQtd_Necessaria:=iQtd_Necessaria - DMOCLinx.IBQ_OC_ComprarAddQTD_SALDO.AsInteger;

              If (DMOCLinx.IBQ_OC_ComprarAddQTD_SALDO.AsInteger < StrToInt(sEstMinimo)) And (iQtd_Necessaria < StrToInt(sEstMinimo)) Then
              Begin
                If ((DMOCLinx.IBQ_OC_ComprarAddQTD_SALDO.AsInteger + iQtd_Necessaria)< StrToInt(sEstMinimo)) Then
                 iQtd_Necessaria:=StrToInt(sEstMinimo) - (DMOCLinx.IBQ_OC_ComprarAddQTD_SALDO.AsInteger + iQtd_Necessaria)
              End; // If (DMOCLinx.IBQ_OC_ComprarAddQTD_SALDO.AsInteger < StrToInt(sEstMinimo)) And (iQtd_Necessaria<StrToInt(sEstMinimo)) Then
            End; // If DMOCLinx.IBQ_OC_ComprarAddQTD_DIAS_ANO.AsInteger < StrToInt(sDiasEstocagem) Then // Qtds Saldo de Estocqgem em dias
            // Calcula Necessidade de Compras ==================================
            //==================================================================

      // Atualiza Sugerida
      MySql:=
        MySql+', oc.qtd_sugerida='+QuotedStr(IntToStr(iQtd_Necessaria));

      // Atualiza AComprar
      MySql:=
       MySql+', oc.qtd_acomprar='+QuotedStr(IntToStr(iQtd_Necessaria));

      MySql:=
       MySql+' WHERE oc.cod_empresa='+sgLojaLinx+
             ' AND   oc.num_documento='+sgNumPed+
             ' AND   oc.cod_item='+DMOCLinx.IBQ_OC_ComprarAddCOD_ITEM.AsString;
      DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);
      // Edit Documento OC_COMPRAR ===========================================
      //======================================================================

      DMOCLinx.CDS_PedUltCompra.Close;
      // Efetua Processo Normal ================================================
      //========================================================================

      If DMOCLinx.IBQ_OC_ComprarAdd.RecNo Mod 100=0 Then
      Begin
        DMBelShopPedidos.SQLC.Commit(TD);

        TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
        TD.IsolationLevel:=xilREADCOMMITTED;
        DMBelShopPedidos.SQLC.StartTransaction(TD);
      End; // If i Mod 1000=0 Then

      DMOCLinx.IBQ_OC_ComprarAdd.Next;
    End; // While not DMOCLinx.IBQ_OC_ComprarAdd.Eof do
    DMOCLinx.IBQ_OC_ComprarAdd.EnableControls;
    // INICIA PROCESSO =========================================================
    //==========================================================================

    //==========================================================================
    // Atualiza Num_Seq dos Produtos ===========================================
    //==========================================================================
    // Cria Sequence's dos Produtos --------------------------------------------
    sGenProd :='Gen_Prod'+'10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time);

    MySql:=' CREATE SEQUENCE '+sGenProd;
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

    MySql:=' ALTER SEQUENCE '+sGenProd+' RESTART WITH 0';
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

    MySql:=' DELETE FROM OC_COMPRAR oc'+
           ' WHERE oc.cod_empresa='+sgLojaLinx+
           ' AND   oc.num_documento='+sgNumPed+
           ' AND   oc.num_seq=0';
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

    MySql:=' UPDATE OC_COMPRAR oc'+
           ' SET oc.num_seq=GEN_ID('+sGenProd+',1)'+
           ' WHERE oc.cod_empresa='+sgLojaLinx+
           ' AND   oc.num_documento='+sgNumPed+
           ' ORDER BY oc.des_item';
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

    // Drop Sequence's dos Produtos ============================================
    MySql:=' DROP SEQUENCE '+sGenProd;
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);
    // Atualiza Num_Seq dos Produtos ===========================================
    //==========================================================================

    //==========================================================================
    // Atualiza Totais =========================================================
    //==========================================================================
    MySql:=' Update OC_COMPRAR'+
           ' Set VLR_DESCONTOS=((QTD_ACOMPRAR*VLR_UNI_COMPRA)*(PER_DESCONTO/100))'+
           ', VLR_BRUTO=(QTD_ACOMPRAR*VLR_UNI_COMPRA)-VLR_DESCONTOS'+
           ', VLR_BASE_ICMS=VLR_BRUTO'+
           ', VLR_ICMS=Cast(((VLR_BASE_ICMS*PER_ICMS)/100) as Numeric(12,2))'+
           ', VLR_IPI=Cast(((VLR_BRUTO*PER_IPI)/100) as Numeric(12,2))'+
           ', VLR_BASE_ST=VLR_BRUTO+(Cast(((VLR_BRUTO*PER_MARGEM_ST)/100) as Numeric(12,2)))'+
           ', VLR_ST=(Cast(((VLR_BASE_ST*PER_ST)/100) as Numeric(12,2))-VLR_ICMS)'+
           ', VLR_TOT_COMPRA=VLR_BRUTO+VLR_ST+VLR_IPI'+
           ', VLR_TOT_VENDA=QTD_ACOMPRAR*VLR_UNI_VENDA'+

           ' WHERE cod_empresa='+sgLojaLinx+
           ' AND   num_documento='+sgNumPed;
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);
    // Atualiza Totais =========================================================
    //==========================================================================

    //==========================================================================
    // Grava Meses da OC =======================================================
    //==========================================================================
    AtualizaNumeroDosMeses;
    // Grava Meses da OC =======================================================
    //==========================================================================

    //==========================================================================
    // Grava Cabeçalho da OC ===================================================
    //==========================================================================
    OC_COMPRAR_DOCS('I', sgNumPed, 'Linx-'+sgUfLoja+sgLojaLinx);
    // Grava Cabeçalho da OC ===================================================
    //==========================================================================

    // Atualiza Transacao ======================================================
    DMBelShopPedidos.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    DMOCLinx.CDS_ParamCurvaABC.Close;
    DMOCLinx.IBQ_OC_ComprarAdd.Close;
  Except // Try // IBQ_OC_ComprarAdd
    On e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShopPedidos.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      DMOCLinx.CDS_ParamCurvaABC.Close;
      DMOCLinx.IBQ_OC_ComprarAdd.Close;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Result:=False;
    End; // On e : Exception do
  End; // Try // IBQ_OC_ComprarAdd

  //==========================================================================
  // ERRO: Exclui Tudo =======================================================
  //==========================================================================
  If not Result Then
  Begin
    If DMBelShopPedidos.SQLC.InTransaction Then
     DMBelShopPedidos.SQLC.Rollback(TD);

    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShopPedidos.SQLC.StartTransaction(TD);
    Try // Try da Transação
      // Exlui Mese da OC -------------------------------------------
      MySql:=' DELETE FROM OC_COMPRAR_MESES m'+
             ' WHERE m.num_documento='+sgNumPed;
      DMBelShopPedidos.SQLC.Execute(MySql,Nil,Nil);

      // Exlui Cabeçalho da OC --------------------------------------
      MySql:=' DELETE FROM OC_COMPRAR_DOCS d'+
             ' WHERE d.num_docto='+sgNumPed+
             ' AND   d.cod_comprador='+sgCodUsuLoja+
             ' AND   d.dta_docto=CURRENT_DATE';
      DMBelShopPedidos.SQLC.Execute(MySql,Nil,Nil);

      // Exlui OC ---------------------------------------------------
      MySql:=' DELETE FROM OC_COMPRAR oc'+
             ' WHERE o.cod_empresa='+sgLojaLinx+
             ' AND   o.num_documento='+sgNumPed;
      DMBelShopPedidos.SQLC.Execute(MySql,Nil,Nil);

      DMBelShopPedidos.SQLC.Commit(TD);
    Except // Except da Transação
      // Abandona Transacao ====================================================
      DMBelShopPedidos.SQLC.Rollback(TD);
    End; // Try da Transação
  End; // If not Result Then
  // ERRO: Exclui Tudo =======================================================
  //==========================================================================

  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;

End; // PEDIDO DE COMPRAS - Calcula Pedido de Compra do Linx >>>>>>>>>>>>>>>>>>>

// PEDIDO DE COMPRAS - Busca Produtos para Analise >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmOCLinx.BuscaProdutosAnalise: Boolean;
Var
  MySql: String;
  sDtaPed: String;
Begin
  Result:=False;

  // Verifica se Transação esta Ativa
  If DMBelShopPedidos.SQLC.InTransaction Then
   DMBelShopPedidos.SQLC.Rollback(TD);

  //============================================================================
  // Monta Transacao ===========================================================
  //============================================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShopPedidos.SQLC.StartTransaction(TD);
  Try // Try da Transação
    DateSeparator:='.';
    DecimalSeparator:='.';

    //==========================================================================
    // Busca Numero de Documento ===============================================
    //==========================================================================
    MySql:=' SELECT GEN_ID(GEN_NUM_DOC_CALCULO_LINX,1) Codigo'+
           ' FROM RDB$DATABASE';
    DMBelShopPedidos.CDS_Busca.Close;
    DMBelShopPedidos.SQLQ_Busca.Close;
    DMBelShopPedidos.SQLQ_Busca.SQL.Clear;
    DMBelShopPedidos.SQLQ_Busca.SQL.Add(MySql);
    DMBelShopPedidos.CDS_Busca.Open;
    sgNumPed:=DMBelShopPedidos.CDS_Busca.FieldByName('Codigo').AsString;
    DMBelShopPedidos.CDS_Busca.Close;
    // Busca Numero de Documento ===============================================
    //==========================================================================

    //==========================================================================
    // Data de Documento =======================================================
    //==========================================================================
    sDtaPed:=f_Troca('/','.',f_Troca('-','.',DateTimeToStr(DataHoraServidorFI(DMBelShopPedidos.SQLQuery1))));
    // Data de Documento =======================================================
    //==========================================================================

    //==========================================================================
    // Cria Pedido de Produtos =================================================
    //==========================================================================
    MySql      :=' INSERT INTO OC_COMPRAR'+
                 ' (DES_ITEM, COD_ITEM, NUM_SEQ, NUM_DOCUMENTO, DTA_DOCUMENTO,'+
                 '  IND_OC_GERADA, DTA_OC_GERADA, NUM_OC_GERADA, OBS_OC,'+
                 '  COD_EMPRESA, DES_EMPRESA, QTD_SUGERIDA, QTD_ACOMPRAR, QTD_SALDO,'+
                 '  QTD_TRANSITO, QTD_DISPONIVEL, QTD_MEDIA_MES, QTD_MEDIA_DIA,'+
                 '  QTD_DEM_MES1, QTD_DEM_MES2, QTD_DEM_MES3, QTD_DEM_MES4,'+
                 '  QTD_DEM_MES5, QTD_DEM_MES6, QTD_DEM_MES7, QTD_DEM_MES8,'+
                 '  UNI_COMPRA, UNI_VENDA, COD_BARRAS, COD_GRUPO, DES_GRUPO, COD_SUBGRUPO,'+
                 '  DES_SUBGRUPO, DES_GENERICO, COD_APLICACAO, DES_APLICACAO, COD_REFERENCIA,'+
                 '  CLA_CURVA_ABC, COD_FAMILIA_PRECO, DES_FAMILIA_PRECO, DTA_ULT_COMPRA,'+
                 '  COD_FOR_ULT_COMPRA, DES_FOR_ULT_COMPRA, QTD_ULT_COMPRA, VLR_UNI_ULT_COMPRA,'+
                 '  VLR_TOT_ULT_COMPRA, VLR_UNI_COMPRA, PER_DESCONTO, DTA_ULT_VENDA,'+
                 '  COD_CLI_ULT_VENDA, DES_CLI_ULT_VENDA, QTD_ULT_VENDA, VLR_UNI_ULT_VENDA,'+
                 '  VLR_TOT_ULT_VENDA, VLR_UNI_VENDA, COD_LISTA_VENDA, DES_LISTA_VENDA,'+
                 '  COD_LISTA_COMPRA, DES_LISTA_COMPRA, VLR_CUSTO_MEDIO, VLR_TOT_VENDA,'+
                 '  VLR_TOT_COMPRA, VLR_BRUTO, VLR_DESCONTOS, VLR_DESPESAS, VLR_FRETE,'+
                 '  IND_SOMA_IPI_BASE_ICMS, IND_SOMA_FRETE_BASE_ICMS,'+
                 '  IND_SOMA_DESPESA_BASE_ICMS, IND_SOMA_IPI_BASE_ST, IND_SOMA_FRETE_BASE_ST,'+
                 '  IND_SOMA_DESPESA_BASE_ST, COD_SIT_TRIBUTARIA, COD_IPI, IND_IPI,'+
                 '  PER_IPI, VLR_IPI, COD_ICMS, PER_REDUCAO_ICMS, VLR_REDUCAO_ICMS,'+
                 '  VLR_BASE_ICMS, PER_ICMS, VLR_ICMS, COD_GRUPO_ST, DES_GRUPO_ST,'+
                 '  PER_MARGEM_ST, IND_ST, VLR_BASE_ST, PER_ST, VLR_ST, PER_REPASSE,'+
                 '  VLR_REPASSE, COD_COMPROVANTE_ICMS, COD_REFERENCIA_FORN, COD_FORNECEDOR,'+
                 '  DES_FORNECEDOR, TIP_PESSOA, DES_EMAIL, QTD_NR_DIAS, QTD_NR_MESES,'+
                 '  QTD_TOT_MESES, COD_COMPRADOR, BLOB_TEXTO, IND_TRANSF, DTA_LIM_TRANSF,'+
                 '  QTD_TRANSF, IND_USAR, IND_QTD_ACIMA, QTD_SUGERIDA_ANO, QTD_TRANSF_PERIODO,'+
                 '  QTD_TRANSF_ANO, EST_MINIMO, DIAS_ESTOCAGEM, QTD_DEMANDA_DIA,'+
                 '  QTD_DEMANDA_ANO, QTD_DIAS_ANO, DATAINCLUSAO, ESTADO, DATAALTERACAO,'+
                 '  IND_TRANSF_CD, DOC_TRANSF_CD)';

    MySqlSelect:=' SELECT'+
                 ' TRIM(pr.nome) DES_ITEM,'+
                 ' pr.cod_produto COD_ITEM,'+
                 ' 0 NUM_SEQ, '+ // Acerta Depois
                 sgNumPed+' NUM_DOCUMENTO, '+
                 QuotedStr(sDtaPed)+' DTA_DOCUMENTO,'+
                 ' ''N'' IND_OC_GERADA,'+
                 ' NULL DTA_OC_GERADA,'+
                 ' NULL NUM_OC_GERADA, '+
                 QuotedStr('Calculado em: '+sDtaPed+' por '+sgNomeUsuario)+' OBS_OC, '+
                 sgLojaLinx+' COD_EMPRESA, '+
                 QuotedStr(sgNomeLoja)+' DES_EMPRESA,'+
                 ' 0 QTD_SUGERIDA,'+
                 ' 0 QTD_ACOMPRAR,'+
                 ' COALESCE(es.quantidade,0) QTD_SALDO,'+
                 ' 0 QTD_TRANSITO,'+
                 ' COALESCE(es.quantidade,0) QTD_DISPONIVEL,'+

                 ' CAST(((COALESCE(dm.qtd_venda_m5,0.0000) +'+
                 '        COALESCE(dm.qtd_venda_m4,0.0000) +'+
                 '        COALESCE(dm.qtd_venda_m3,0.0000) +'+
                 '        COALESCE(dm.qtd_venda_m2,0.0000) +'+
                 '        COALESCE(dm.qtd_venda_m1,0.0000)) / 5.0000)'+
                 ' AS NUMERIC(12,4)) QTD_MEDIA_MES,'+
                 ' COALESCE(dm.qtd_venda_dia,0.0000) QTD_MEDIA_DIA,'+

                 ' COALESCE(dm.qtd_venda_m5,0)  QTD_DEM_MES1,'+
                 ' COALESCE(dm.qtd_venda_m4,0)  QTD_DEM_MES2,'+
                 ' COALESCE(dm.qtd_venda_m3,0)  QTD_DEM_MES3,'+
                 ' COALESCE(dm.qtd_venda_m2,0)  QTD_DEM_MES4,'+
                 ' COALESCE(dm.qtd_venda_m1,0)  QTD_DEM_MES5,'+
                 ' 0 QTD_DEM_MES6, 0 QTD_DEM_MES7, 0 QTD_DEM_MES8,'+

                 ' 0 UNI_COMPRA,'+ // LINX ?
                 ' 0 UNI_VENDA,'+ // LINX ?

                 ' TRIM(pr.cod_barra) COD_BARRAS,'+
                 ' pr.id_setor COD_GRUPO, TRIM(pr.desc_setor) DES_GRUPO,'+
                 ' pr.id_linha COD_SUBGRUPO, TRIM(pr.desc_linha) DES_SUBGRUPO,'+
                 ' NULL DES_GENERICO,'+
                 ' pr.id_classificacao COD_APLICACAO, pr.desc_classificacao DES_APLICACAO,'+
                 ' TRIM(pr.referencia) COD_REFERENCIA,'+
                 ' ''E'' CLA_CURVA_ABC,'+ // ALTERAR

                 ' NULL COD_FAMILIA_PRECO, NULL DES_FAMILIA_PRECO,'+

                 // ULTIMA COMPRA - Por Fora
                 ' NULL DTA_ULT_COMPRA,'+
                 ' 0 COD_FOR_ULT_COMPRA,'+
                 ' NULL DES_FOR_ULT_COMPRA,'+
                 ' 0.00 QTD_ULT_COMPRA,'+
                 ' 0.00 VLR_UNI_ULT_COMPRA,'+
                 ' 0.00 VLR_TOT_ULT_COMPRA,'+
                 ' 0.00 VLR_UNI_COMPRA,'+   // Igual ao  VLR_UNI_ULT_COMPRA

                 ' 0 PER_DESCONTO,'+

                 // Ultima Venda Não Utilizado
                 ' NULL DTA_ULT_VENDA,'+
                 ' NULL COD_CLI_ULT_VENDA,'+
                 ' NULL DES_CLI_ULT_VENDA,'+
                 ' NULL QTD_ULT_VENDA,'+
                 ' NULL VLR_UNI_ULT_VENDA,'+
                 ' NULL VLR_TOT_ULT_VENDA,'+
                 ' CAST(ROUND(COALESCE(es.PRECO_VENDA,0.00),2) AS NUMERIC(12,2)) VLR_UNI_VENDA,'+

                 ' NULL COD_LISTA_VENDA, NULL DES_LISTA_VENDA,'+
                 ' NULL COD_LISTA_COMPRA, NULL DES_LISTA_COMPRA,'+

                 ' COALESCE(es.CUSTO_MEDIO,0.00) VLR_CUSTO_MEDIO,'+

                 ' 0.00 VLR_TOT_VENDA,'+
                 ' 0.00 VLR_TOT_COMPRA,'+
                 ' 0.00 VLR_BRUTO,'+
                 ' 0.00 VLR_DESCONTOS,'+
                 ' 0.00 VLR_DESPESAS,'+
                 ' 0.00 VLR_FRETE,'+

                 ' ''N'' IND_SOMA_IPI_BASE_ICMS,'+
                 ' ''N'' IND_SOMA_FRETE_BASE_ICMS,'+
                 ' ''N'' IND_SOMA_DESPESA_BASE_ICMS,'+
                 ' ''N'' IND_SOMA_IPI_BASE_ST,'+
                 ' ''N'' IND_SOMA_FRETE_BASE_ST,'+
                 ' ''N'' IND_SOMA_DESPESA_BASE_ST,'+
                 ' NULL COD_SIT_TRIBUTARIA,'+
                 ' ''00'' COD_IPI,'+
                 ' ''P'' IND_IPI,'+
                 ' 0.00 PER_IPI,'+
                 ' 0.00 VLR_IPI,'+
                 ' null COD_ICMS,'+
                 ' 0.00 PER_REDUCAO_ICMS,'+
                 ' 0.00 VLR_REDUCAO_ICMS,'+
                 ' 0.00 VLR_BASE_ICMS,'+
                 ' 0.00 PER_ICMS,'+
                 ' 0.00 VLR_ICMS,'+

                 ' NULL COD_GRUPO_ST, NULL DES_GRUPO_ST,'+

                 ' 0.00 PER_MARGEM_ST,'+
                 ' NULL IND_ST,'+
                 ' 0.00 VLR_BASE_ST,'+
                 ' 0.00 PER_ST,'+
                 ' 0.00 VLR_ST,'+
                 ' 0.00 PER_REPASSE, 0.00 VLR_REPASSE,'+
                 ' NULL COD_COMPROVANTE_ICMS,'+
                 ' TRIM(pr.referencia) COD_REFERENCIA_FORN,'+

                 ' pr.cod_fornecedor COD_FORNECEDOR,'+
                 ' SUBSTRING(TRIM(fo.nome_cliente) FROM 1 FOR 40) DES_FORNECEDOR,'+
                 ' fo.tipo_cliente TIP_PESSOA,'+
                 ' TRIM(fo.email_cliente) DES_EMAIL,'+

                 ' COALESCE(dm.dias_uteis,0) QTD_NR_DIAS,'+
                 ' 5 QTD_NR_MESES,'+
                 ' 5 QTD_TOT_MESES, '+

                 sgCodUsuLoja+' COD_COMPRADOR, '+
                 QuotedStr('Calculado em: '+sDtaPed+' por '+sgNomeUsuario)+' BLOB_TEXTO,'+

                 ' ''N'' IND_TRANSF,'+
                 ' NULL DTA_LIM_TRANSF,'+
                 ' 0 QTD_TRANSF,'+
                 ' ''SIM'' IND_USAR,'+
                 ' 0 IND_QTD_ACIMA,'+

                 ' 0 QTD_SUGERIDA_ANO,'+
                 ' 0 QTD_TRANSF_PERIODO,'+
                 ' 0 QTD_TRANSF_ANO,'+

                 ' 0 EST_MINIMO,'+

                 ' 0 DIAS_ESTOCAGEM,'+
                 ' COALESCE(DM.qtd_venda,0) QTD_DEMANDA_DIA,'+
                 ' 0 QTD_DEMANDA_ANO,'+

                 // Utilizado para Apresentar dia de estocagem do Saldo
                 ' CAST(CASE'+
                 '        WHEN ( ((COALESCE(es.quantidade,0))=0) or (COALESCE(dm.qtd_venda_dia,0.0000)=0) ) THEN'+
                 '          0'+
                 '        WHEN (COALESCE(dm.qtd_venda_dia,0.0000)=0) THEN'+
                 '          0'+
                 '        ELSE'+
                 '         (COALESCE(es.quantidade,0) / COALESCE(dm.qtd_venda_dia,0.0000))'+
                 '      END'+
                 ' AS INTEGER) QTD_DIAS_ANO,'+

                 ' pr.dt_inclusao DATAINCLUSAO,'+
                 ' TRIM(fo.uf_cliente) ESTADO,'+
                 ' pr.dt_update DATAALTERACAO,'+
                 ' ''N'' IND_TRANSF_CD,'+
                 ' 0 DOC_TRANSF_CD';

    MySqlClausula1:=' FROM LINXPRODUTOS pr'+
                    '          LEFT JOIN LINXPRODUTOSDETALHES es   ON es.cod_produto=pr.cod_produto'+
                    '                                             AND es.empresa='+sgLojaLinx+
                    '          LEFT JOIN LINXCLIENTESFORNEC fo     ON fo.cod_cliente=pr.cod_fornecedor'+
                    '          LEFT JOIN ES_DEMANDAS_4MESES dm     ON dm.cod_linx=es.empresa'+
                    '                                             AND dm.cod_prod_linx=pr.cod_produto'+

                    ' WHERE pr.desativado=''N'''+

                    // Setor: 17-IMOBILIZADOS 20-MOVEIS SALÃO 25 - USO E CONSUMO
                    ' AND NOT (COALESCE(pr.id_setor,0) in (17, 20, 25))'+
                    // Linha: 33 - Brindes
                    ' AND NOT (COALESCE(pr.id_linha ,0) in (33))'+
                    // Coleção: 197 - DESCONTINUADO-CAMPANHA DE R$0,50 (Antigo Não Compra)
                    ' AND NOT (COALESCE(pr.id_colecao ,0) = 197)'+
                    // Coleção: 294 - BRINDE 587 - KIDS
                    ' AND NOT (COALESCE(pr.id_colecao ,0) in (294, 587))';

                   // Produtos Codigos e/ou Produtos Like -----------
                   If (Trim(sgProdutosLinx)<>'') And (Trim(sgLikeProdutosLinx)<>'') Then
                    MySqlClausula1:=
                     MySqlClausula1+' AND (pr.cod_produto IN ('+sgProdutosLinx+') OR '+sgLikeProdutosLinx+')'
                   Else If Trim(sgProdutosLinx)<>'' Then
                    MySqlClausula1:=
                     MySqlClausula1+' AND pr.cod_produto IN ('+sgProdutosLinx+')'
                   Else If Trim(sgLikeProdutosLinx)<>'' Then
                    MySqlClausula1:=
                     MySqlClausula1+' AND'+sgLikeProdutosLinx;

                   // Fornecedores ----------------------------------
                   If Trim(sgFornecedoresLinx)<>'' Then
                    MySqlClausula1:=
                     MySqlClausula1+' AND pr.cod_fornecedor IN ('+sgFornecedoresLinx+')'
                   Else
                    MySqlClausula1:=
                     MySqlClausula1+' AND NOT (COALESCE(pr.cod_fornecedor,0) in (6, 1014, 260))';
    DMBelShopPedidos.SQLC.Execute(MySql+MySqlSelect+MySqlClausula1, nil, nil);
    // Cria Pedido de Produtos =================================================
    //==========================================================================

    // Atualiza Transacao ======================================================
    DMBelShopPedidos.SQLC.Commit(TD);
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShopPedidos.SQLC.Rollback(TD);
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação
  // Monta Transacao ===========================================================
  //============================================================================

  // Busca Pedido Criado =======================================================
  MySql:=' SELECT *'+
         ' FROM OC_COMPRAR oc'+
         ' WHERE oc.cod_empresa='+sgLojaLinx+
         ' AND   oc.num_documento='+sgNumPed+
         ' AND   ((EXISTS (SELECT 1'+
         '                 FROM LINX_PRODUTOS_LOJAS pl'+
         '                 WHERE pl.cod_loja_linx=oc.cod_empresa'+
         '                 AND   pl.cod_produto=oc.cod_item'+
         '                 AND   pl.dta_processa='+QuotedStr(sgDtaProdLj)+'))'+
         '        OR'+
         '        (EXISTS (SELECT 1'+
         '                 FROM ES_FINAN_CURVA_ABC cv'+
         '                 WHERE cv.cod_linx=oc.cod_empresa'+
         '                 AND   cv.cod_prod_linx=oc.cod_item'+
         '                 AND   cv.est_minimo>0)))';
  DMOCLinx.IBQ_OC_ComprarAdd.Close;
  DMOCLinx.IBQ_OC_ComprarAdd.SQL.Clear;
  DMOCLinx.IBQ_OC_ComprarAdd.SQL.Add(MySql);
  DMOCLinx.IBQ_OC_ComprarAdd.Open;

  If DMOCLinx.IBQ_OC_ComprarAdd.IsEmpty Then
  Begin
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShopPedidos.SQLC.StartTransaction(TD);

    MySql:=' DELETE FROM OC_COMPRAR oc'+
           ' WHERE oc.cod_empresa='+sgLojaLinx+
           ' AND   oc.num_documento='+sgNumPed;
    DMBelShopPedidos.SQLC.Execute(MySql, nil, nil);

    DMBelShopPedidos.SQLC.Commit(TD);
    DMOCLinx.IBQ_OC_ComprarAdd.Close;
    Exit;
  End; // If DMOCLinx.IBQ_OC_ComprarAdd.IsEmpty Then

  DateSeparator:='/';
  DecimalSeparator:=',';

  sgDtaDoc:=DateToStr(DMOCLinx.IBQ_OC_ComprarAdd.FieldByName('DTA_DOCUMENTO').AsDateTime);
  Try
    sgDtaDoc:=DateToStr(StrToDateTime(sgDtaDoc));
  Except
    Try
      sgDtaDoc:=DateToStr(StrToDateTime(f_Troca('.','/',f_Troca('-','/',sgDtaDoc))));
    Except
      sgDtaDoc:=DateToStr(StrToDateTime(f_Troca('/','.',f_Troca('-','.',sgDtaDoc))));
    End;
  End;

  Result:=True;
End; // PEDIDO DE COMPRAS - Busca Produtos para Analise >>>>>>>>>>>>>>>>>>>>>>>>

// PEDIDO DE COMPRAS - Seleciona Produtos TS_Filtros >>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.MontaSelecaoProdutos(bProd, bLike: Boolean);
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
End; // PEDIDO DE COMPRAS - Seleciona Produtos TS_Filtros >>>>>>>>>>>>>>>>>>>>>>

// PEDIDO COMPRAS - Manutenção do Arquivo de Documentos de OC >>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.OC_COMPRAR_DOCS(sTipo, sDoc: String; sOrigem: String='');
Var
  MySql: String;

  sDtaDoc, sCodForn: String;
Begin
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // OBS: DEVE ESTAR DENTRO DE UMA TRANSAÇÃO
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  // sTipo=(I)nsert (D)elete

  // Inclui Documento ==========================================================
  If sTipo='I' Then
  Begin
    MySql:=' SELECT FIRST 1'+
           '        COALESCE(c.cod_fornecedor,0) COD_FORNECEDOR,'+
           '        CAST(c.dta_documento AS DATE) DTA_DOC'+
           ' FROM OC_COMPRAR c'+
           ' WHERE c.num_documento='+sDoc+
           ' AND   C.cod_empresa  ='+sgLojaLinx+
           ' AND   CAST(c.dta_documento AS DATE)=CURRENT_DATE';
    DMBelShopPedidos.SQLQuery1.Close;
    DMBelShopPedidos.SQLQuery1.SQL.Clear;
    DMBelShopPedidos.SQLQuery1.SQL.Add(MySql);
    DMBelShopPedidos.SQLQuery1.Open;
    sDtaDoc :=f_Troca('/','.',(f_Troca('-','.',DMBelShopPedidos.SQLQuery1.FieldByName('Dta_Doc').AsString)));
    sCodForn:=DMBelShopPedidos.SQLQuery1.FieldByName('Cod_Fornecedor').AsString;
    DMBelShopPedidos.SQLQuery1.Close;

    MySql:=' SELECT d.num_docto'+
           ' FROM OC_COMPRAR_DOCS d'+
           ' WHERE d.num_docto='+sDoc+
           ' AND   d.dta_docto='+QuotedStr(sDtaDoc)+
           ' AND   UPPER(TRIM(d.origem))='+QuotedStr(AnsiUpperCase(sOrigem))+
           ' AND   EXISTS (SELECT 1'+
           '               FROM OC_COMPRAR o'+
           '               WHERE o.num_documento=d.num_docto'+
           '               AND   CAST(o.dta_documento AS DATE)=d.dta_docto'+
           '               AND   o.cod_empresa='+sgLojaLinx+')';
    DMBelShopPedidos.CDS_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMBelShopPedidos.CDS_BuscaRapida.Open;

    If Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('num_docto').AsString)='' Then
    Begin
      MySql:=' INSERT INTO OC_COMPRAR_DOCS'+
             ' (NUM_DOCTO, DTA_DOCTO, COD_COMPRADOR, DES_COMPRADOR,'+
             '  ORIGEM, COD_FORNECEDOR)'+
             ' VALUES ('+
             QuotedStr(sDoc)+', '+ // NUM_DOCTO
             QuotedStr(sDtaDoc)+', '+ // DTA_DOCTO
             sgCodUsuLoja+', '+ // COD_COMPRADOR
             QuotedStr(sgNomeLoja)+', '+ // DES_COMPRADOR
             QuotedStr(sOrigem)+', '+ // ORIGEM
             QuotedStr(sCodForn)+')'; // COD_FORNECEDOR
      DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);
    End; // If Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('num_docto').AsString)='' Then
    DMBelShopPedidos.CDS_BuscaRapida.Close;

  End; // If sTipo='I' Then
End; // PEDIDO COMPRAS - Manutenção do Arquivo de Documentos de OC >>>>>>>>>>>>>

// PEDIDO COMPRAS - Acerta Nome dos Meses de Demandas no Grid >>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.NomeMesesGridLinx;
Var
  i: Integer;
  MySql: String;

  // Meses e Anos de Demanda
  sMes1, sMes2, sMes3, sMes4, sMes5, sMes6, sMes7, sMes8,
  sAno1, sAno2, sAno3, sAno4, sAno5, sAno6, sAno7, sAno8: String;
Begin

  sMes1:='';
  sMes2:='';
  sMes3:='';
  sMes4:='';
  sMes5:='';
  sMes6:='';
  sMes7:='';
  sMes8:='';

  sAno1:='';
  sAno2:='';
  sAno3:='';
  sAno4:='';
  sAno5:='';
  sAno6:='';
  sAno7:='';
  sAno8:='';

  //============================================================================
  // Busca Meses do Pedido =====================================================
  //============================================================================
  MySql:=' SELECT om.*'+
         ' FROM OC_COMPRAR_MESES om, OC_COMPRAR_DOCS od'+
         ' WHERE om.num_documento=od.num_docto'+
         ' AND   UPPER(TRIM(od.origem)) LIKE '+QuotedStr('LINX%')+
         ' AND   EXISTS (SELECT 1'+
         '               FROM OC_COMPRAR O'+
         '               WHERE o.num_documento=od.num_docto'+
         '               AND   CAST(o.dta_documento AS DATE)=od.dta_docto'+
         '               AND   o.cod_empresa='+sgLojaLinx+')'+
         ' AND   om.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value);
  DMBelShopPedidos.CDS_Busca.Close;
  DMBelShopPedidos.SQLQ_Busca.Close;
  DMBelShopPedidos.SQLQ_Busca.SQL.Clear;
  DMBelShopPedidos.SQLQ_Busca.SQL.Add(MySql);
  DMBelShopPedidos.CDS_Busca.Open;
  // Busca Meses do Pedido =====================================================
  //============================================================================

  //============================================================================
  // Monta Nomes e Anos do Pedido ==============================================
  //============================================================================
  If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes1').AsString)<>'' Then
  Begin
    sMes1:=Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes1').AsString);
    sAno1:=Copy(sMes1,7,2);
    sMes1:=Copy(sMes1,1,3);

    For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
    Begin
     If AnsiUpperCase(ShortMonthNames[i])=AnsiUpperCase(sMes1) Then
     Begin
       sMes1:=FormatFloat('00',i);
       Break;
     End;
    End; // For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
  End; // If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes1').AsString)<>'' Then

  If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes2').AsString)<>'' Then
  Begin
    sMes2:=Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes2').AsString);
    sAno2:=Copy(sMes2,7,2);
    sMes2:=Copy(sMes2,1,3);

    For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
    Begin
     If AnsiUpperCase(ShortMonthNames[i])=AnsiUpperCase(sMes2) Then
     Begin
       sMes2:=FormatFloat('00',i);
       Break;
     End;
    End; // For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
  End; // If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes2').AsString)<>'' Then

  If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes3').AsString)<>'' Then
  Begin
    sMes3:=Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes3').AsString);
    sAno3:=Copy(sMes3,7,2);
    sMes3:=Copy(sMes3,1,3);

    For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
    Begin
     If AnsiUpperCase(ShortMonthNames[i])=AnsiUpperCase(sMes3) Then
     Begin
       sMes3:=FormatFloat('00',i);
       Break;
     End;
    End; // For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
  End; // If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes3').AsString)<>'' Then

  If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes4').AsString)<>'' Then
  Begin
    sMes4:=Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes4').AsString);
    sAno4:=Copy(sMes4,7,2);
    sMes4:=Copy(sMes4,1,3);

    For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
    Begin
     If AnsiUpperCase(ShortMonthNames[i])=AnsiUpperCase(sMes4) Then
     Begin
       sMes4:=FormatFloat('00',i);
       Break;
     End;
    End; // For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
  End; // If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes4').AsString)<>'' Then

  If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes5').AsString)<>'' Then
  Begin
    sMes5:=Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes5').AsString);
    sAno5:=Copy(sMes5,7,2);
    sMes5:=Copy(sMes5,1,3);

    For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
    Begin
     If AnsiUpperCase(ShortMonthNames[i])=AnsiUpperCase(sMes5) Then
     Begin
       sMes5:=FormatFloat('00',i);
       Break;
     End;
    End; // For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
  End; // If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes5').AsString)<>'' Then

  If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes6').AsString)<>'' Then
  Begin
    sMes6:=Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes6').AsString);
    sAno6:=Copy(sMes6,7,2);
    sMes6:=Copy(sMes6,1,3);

    For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
    Begin
     If AnsiUpperCase(ShortMonthNames[i])=AnsiUpperCase(sMes6) Then
     Begin
       sMes6:=FormatFloat('00',i);
       Break;
     End;
    End; // For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
  End; // If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes6').AsString)<>'' Then

  If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes7').AsString)<>'' Then
  Begin
    sMes7:=Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes7').AsString);
    sAno7:=Copy(sMes7,7,2);
    sMes7:=Copy(sMes7,1,3);

    For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
    Begin
     If AnsiUpperCase(ShortMonthNames[i])=AnsiUpperCase(sMes7) Then
     Begin
       sMes7:=FormatFloat('00',i);
       Break;
     End;
    End; // For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
  End; // If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes7').AsString)<>'' Then

  If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes8').AsString)<>'' Then
  Begin
    sMes8:=Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes8').AsString);
    sAno8:=Copy(sMes8,7,2);
    sMes8:=Copy(sMes8,1,3);

    For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
    Begin
     If AnsiUpperCase(ShortMonthNames[i])=AnsiUpperCase(sMes8) Then
     Begin
       sMes8:=FormatFloat('00',i);
       Break;
     End;
    End; // For i:=Low(ShortMonthNames) to High(ShortMonthNames) do
  End; // If Trim(DMBelShopPedidos.CDS_Busca.FieldByname('Mes8').AsString)<>'' Then
  DMBelShopPedidos.CDS_Busca.Close;
  // Monta Nomes e Anos do Pedido ==============================================
  //============================================================================

  //============================================================================
  // Acerta Nomes e Anos do Pedido =============================================
  //============================================================================
  For i:=0 to Dbg_GeraOCGrid.Columns.Count-1 do
  Begin
    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES1' Then
    Begin
      If Trim(sMes1)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(sMes1)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=sMes1+'/'+sAno1;
       End; // If Trim(sMes1)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES1' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES2' Then
    Begin
      If Trim(sMes2)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(sMes2)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=sMes2+'/'+sAno2;
       End; // If Trim(sMes2)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES2' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES3' Then
    Begin
      If Trim(sMes3)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(sMes3)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=sMes3+'/'+sAno3;
       End; // If Trim(sMes3)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES3' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES4' Then
    Begin
      If Trim(sMes4)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(sMes4)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=sMes4+'/'+sAno4;
       End; // If Trim(sMes4)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES4' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES5' Then
    Begin
      If Trim(sMes5)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(sMes5)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=sMes5+'/'+sAno5;
       End; // If Trim(sMes5)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES5' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES6' Then
    Begin
      If Trim(sMes6)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(sMes6)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=sMes6+'/'+sAno6;
       End; // If Trim(sMes6)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES6' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES7' Then
    Begin
      If Trim(sMes7)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(sMes7)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=sMes7+'/'+sAno7;
       End; // If Trim(sMes7)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES7' Then

    If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES8' Then
    Begin
      If Trim(sMes8)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=False;
       End
      Else // If Trim(sMes8)='' Then
       Begin
         Dbg_GeraOCGrid.Columns[i].Visible:=True;
         Dbg_GeraOCGrid.Columns[i].Title.Caption:=sMes8+'/'+sAno8;
       End; // If Trim(sMes8)='' Then
    End; // If Dbg_GeraOCGrid.Columns[i].FieldName='QTD_DEM_MES8' Then
  End; // For i:=0 to Dbg_GeraOCGrid.Columns.Count-1 do
  // Acerta Nomes e Anos do Pedido =============================================
  //============================================================================

End; // PEDIDO COMPRAS - Acerta Nome dos Meses de Demandas no Grid >>>>>>>>>>>>>

// PEDIDO COMPRAS - Busca Totais do Pedido OCs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmOCLinx.TotaisOCLinx(sNrDoc: String);
Var
  MySql: String;
Begin

  EdtGeraOCTotalGeral.Value:=0;
  DMOCLinx.CDS_AComprarOCs.Close;
  If EdtGeraOCBuscaDocto.Value<>0 Then
  Begin
    MySql:=' SELECT'+
           ' ''N'' GERAR,'+

           ' CASE'+
           '    WHEN COALESCE(oc.num_oc_gerada, 0) > 0 THEN'+
           '      ''OC'''+
           '    ELSE'+
           '      ''PD'''+
           ' END TIPO,'+

           ' oc.cod_empresa COD_EMP_FIL,'+
           ' oc.des_empresa DES_EMP_FIL,'+
           ' Cast(oc.cod_empresa as integer) COD_LINX,'+
           ' oc.ind_oc_gerada,'+
           ' oc.cod_fornecedor,'+
           ' oc.des_fornecedor FORNECEDOR,'+
           ' SUM(COALESCE(oc.vlr_bruto, 0.00)) TOTAL_BRUTO,'+
           ' SUM(COALESCE(oc.vlr_descontos, 0.00)) TOTAL_DESCONTOS,'+
           ' SUM(COALESCE(oc.vlr_ipi, 0.00)) TOTAL_IPI,'+
           ' SUM(COALESCE(oc.vlr_despesas, 0.00)) TOTAL_DESPESAS,'+
           ' SUM(COALESCE(oc.vlr_st, 0.00)) TOTAL_ST,'+
           ' SUM(COALESCE(oc.vlr_frete, 0.00)) TOTAL_FRETE,'+
           ' SUM(COALESCE(oc.vlr_icms, 0.00)) TOTAL_ICMS,'+
           ' SUM(COALESCE(oc.vlr_repasse, 0.00)) TOTAL_REPASSE,'+

           ' SUM(CASE'+
           '        WHEN oc.qtd_transf = 0 THEN'+
           '          COALESCE(oc.vlr_tot_compra, 0.00)'+
           '        ELSE'+
           '          0'+
           ' END) TOTAL_OCS,'+

           ' SUM(COALESCE(oc.vlr_tot_compra, 0.00)) TOTAL_OC,'+
           ' SUM(COALESCE(oc.vlr_tot_venda, 0.00)) TOTAL_VENDA,'+
           ' oc.num_documento,'+
           ' oc.num_oc_gerada,'+
           ' CAST(oc.dta_oc_gerada AS DATE) DTA_OC_GERADA,'+
           ' oc.cod_comprovante_icms,'+
           ' COUNT(oc.cod_item) TOTAL_ITENS,'+
           ' SUM(COALESCE(oc.qtd_acomprar, 0)) TOTAL_QTD,'+
           ' SUM(COALESCE(oc.qtd_transf, 0)) TOTAL_QTD_TRANSF,'+

           ' SUM(CASE'+
           '        WHEN oc.qtd_acomprar > 0 THEN'+
           '          1'+
           '        ELSE'+
           '          0'+
           ' END) TOTAL_ITENS_ACOMPRAR,'+

           ' CASE'+
           '   WHEN oc.ind_oc_gerada=''S'' THEN'+
           '     ''OC GERADA'''+
           '   WHEN UPPER(TRIM(dc.origem)) = ''LINX'' THEN'+
           '     ''FECHADO'''+
           '   ELSE'+
           '     ''ABERTO'''+
           ' END SITUACAO'+

           ' FROM OC_COMPRAR oc, OC_COMPRAR_DOCS dc'+

           ' WHERE oc.num_documento = dc.num_docto'+
           ' AND   CAST(oc.dta_documento AS DATE) = dc.dta_docto'+
           ' AND   oc.cod_comprador = dc.cod_comprador'+
           ' AND   UPPER(TRIM(dc.origem)) LIKE '+QuotedStr('LINX%')+
           ' AND   oc.num_documento='+sNrDoc+
           ' AND   oc.cod_empresa='+sgLojaLinx+

           ' GROUP BY TIPO, oc.cod_empresa, oc.des_empresa, COD_LINX,'+
           '          oc.ind_oc_gerada, oc.cod_fornecedor, oc.des_fornecedor,'+
           '          oc.num_documento, oc.num_oc_gerada,'+
           '          CAST(oc.dta_oc_gerada AS DATE), oc.cod_comprovante_icms,'+
           '          SITUACAO'+

           ' ORDER BY oc.cod_empresa, oc.des_fornecedor, oc.num_oc_gerada';
    DMOCLinx.CDS_AComprarOCs.Close;
    DMOCLinx.SQLQ_AComprarOCs.Close;
    DMOCLinx.SQLQ_AComprarOCs.SQL.Clear;
    DMOCLinx.SQLQ_AComprarOCs.SQL.Add(MySql);
    DMOCLinx.CDS_AComprarOCs.Open;

    EdtGeraOCTotalGeral.Value:=DMOCLinx.CDS_AComprarOCsTOTALGERAL.AsVariant;
  End; // If EdtGeraOCBuscaDocto.Value<>0 Then
End; // PEDIDO COMPRAS - Busca Totais do Pedido OCs >>>>>>>>>>>>>>>>>>>>>>>>>>>>

// PEDIDO COMPRAS - Altera Quantidade ou Preço Unitário a Comparar >>>>>>>>>>>>>
Procedure TFrmOCLinx.AlteraAComprar(IBQComprar: TIBQuery; sQual, sNumDoc, sDtaDocto: String);
Var
  sValorNew, sValorOld: String;
  s, sCodEmp, sNumSeq: String;
  MySql: String;

  bLinx: Boolean;
Begin

  // Q  = Quantidade
  // P  = Preco Unitário
  // DI = Percentual de Desconto Individual
  // DM = Percentual de Desconto no Mix

  // Verifica se é Linx Puro ===================================================
  MySql:=' SELECT TRIM(d.origem) origem'+
         ' FROM OC_COMPRAR_DOCS d'+
         ' WHERE d.num_docto='+sNumDoc+
         ' AND   d.dta_docto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaDocto)))+
         ' AND   EXISTS (SELECT 1'+
         '               FROM OC_COMPRAR o'+
         '               WHERE o.num_documento=d.num_docto'+
         '               AND   CAST(o.dta_documento AS DATE) = d.dta_docto'+
         '               AND   o.cod_empresa='+sgLojaLinx+')';
  DMBelShopPedidos.CDS_BuscaRapida.Close;
  DMBelShopPedidos.SQLQ_BuscaRapida.Close;
  DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
  DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMBelShopPedidos.CDS_BuscaRapida.Open;

  sCodEmp:=AnsiUpperCase(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('origem').AsString);
  bLinx:=(AnsiContainsStr(sCodEmp, 'LINX')=True);
  DMBelShopPedidos.CDS_BuscaRapida.Close;

  sCodEmp:=IBQComprar.FieldByName('COD_EMPRESA').AsString;
  sNumSeq:=IBQComprar.FieldByName('NUM_SEQ').AsString;

  If IBQComprar.FieldByName('IND_OC_GERADA').AsString='S' Then
  Begin
    If IBQComprar.FieldByName('NUM_OC_GERADA').AsInteger<1000000 Then
     sgMensagem:='Ordem de Compra Já Gerada !!'
    Else
     sgMensagem:='Romaneiro de Separação Já Gerado !!';

    msg(sgMensagem+cr+cr+'Numero: '+IBQComprar.FieldByName('NUM_OC_GERADA').AsString+' de '+
                                   IBQComprar.FieldByName('DTA_OC_GERADA').AsString,'A');

    // Busca Totais do Pedido OCs ==============================================
    TotaisOCLinx(sNumDoc);

    Exit;
  End; // If IBQComprar.FieldByName('IND_OC_GERADA').AsString='S' Then

  // Preco Unitario Individual --------------------------------------
  If sQual='P' Then
  Begin
    sValorNew:=IBQComprar.FieldByName('VLR_UNI_COMPRA').AsString;
    sValorOld:=IBQComprar.FieldByName('VLR_UNI_COMPRA').AsString;
    s:='Novo Preço Unitário do Produto...'
  End;

  // Percentual de Desconto Individual ------------------------------
  If sQual='DI' Then
  Begin
    sValorNew:=IBQComprar.FieldByName('PER_DESCONTO').AsString;
    sValorOld:=IBQComprar.FieldByName('PER_DESCONTO').AsString;
    s:='Percentual de Desconto do Produto...'
  End;

  // Percentual de Desconto para o Mix ------------------------------
  If sQual='DM' Then
  Begin
    If msg('Deseja Realmente Informar o DESCONTO'+cr+cr+'Para TODOS os Produtos','C')=2 Then
     Exit;

    sValorNew:=IBQComprar.FieldByName('PER_DESCONTO').AsString;
    sValorOld:=IBQComprar.FieldByName('PER_DESCONTO').AsString;
    s:='Percentual de Desconto Para o Mix...'
  End;

  // Calcular Somente Quantidade ===============================================
  If sQual='Q' Then
  Begin
    DecimalSeparator:='.';
    MySql:=' UpDate OC_COMPRAR oc'+
           ' Set oc.VLR_DESCONTOS=((oc.QTD_ACOMPRAR*oc.VLR_UNI_COMPRA)*(oc.PER_DESCONTO/100))'+
           ', oc.VLR_BRUTO=(oc.QTD_ACOMPRAR*oc.VLR_UNI_COMPRA)-oc.VLR_DESCONTOS'+
           ', oc.VLR_BASE_ICMS=oc.VLR_BRUTO'+
           ', oc.VLR_ICMS=Cast(((oc.VLR_BASE_ICMS*oc.PER_ICMS)/100) as Numeric(12,2))'+
           ', oc.VLR_IPI=Cast(((oc.VLR_BRUTO*oc.PER_IPI)/100) as Numeric(12,2))'+
           ', oc.VLR_BASE_ST=oc.VLR_BRUTO+(Cast(((oc.VLR_BRUTO*oc.PER_MARGEM_ST)/100) as Numeric(12,2)))'+
           ', oc.VLR_ST=(Cast(((oc.VLR_BASE_ST*oc.PER_ST)/100) as Numeric(12,2))-oc.VLR_ICMS)'+
           ', oc.VLR_TOT_COMPRA=oc.VLR_BRUTO+oc.VLR_ST+oc.VLR_IPI'+
           ', oc.VLR_TOT_VENDA=oc.QTD_ACOMPRAR*oc.VLR_UNI_VENDA'+

           ' Where oc.Ind_OC_Gerada=''N'''+
           ' And   oc.Num_Documento='+QuotedStr(sNumDoc)+
           ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaDocto)))+
           ' And   oc.cod_empresa='+sgLojaLinx+
           ' And   oc.Cod_Item='+QuotedStr(IBQComprar.FieldByName('COD_ITEM').AsString);
    DMOCLinx.IBQ_Executa.Close;
    DMOCLinx.IBQ_Executa.SQL.Clear;
    DMOCLinx.IBQ_Executa.SQL.Add(MySql);
    DMOCLinx.IBQ_Executa.ExecSQL;

    DMBelShopPedidos.IBT_BelShop.CommitRetaining;
    DecimalSeparator:=',';

//OdirApagar - 28/03/2019
//    // Reabre IBQ_AComprar =====================================================
//    IBQComprar.DisableControls;
//    IBQComprar.Close;
//    IBQComprar.Open;
//    IBQComprar.Locate('Num_Seq', sNumSeq,[]);
//    IBQComprar.EnableControls;

    // Busca Totais do Pedido OCs ==============================================
    TotaisOCLinx(sNumDoc);

    Exit;
  End; // If sQual='Q' Then

  // Solicita Preço e Descontos ================================================
  If InputQuery(s,'',sValorNew) then
  Begin
    Try
      StrToCurr(sValorNew);
      If (sQual='P') and (StrToCurr(sValorNew)=0) Then
      Begin
        msg('Preço Unitário Inválido !!','A');
        Dbg_GeraOCGrid.SelectedIndex:=0;
        Dbg_GeraOCGrid.SelectedIndex:=igColAComprar;
        Dbg_GeraOCGrid.SetFocus;
        Exit;
      End;

      If ((sQual='DI') or (sQual='DM')) and ((StrToCurr(sValorNew)>100) Or (StrToCurr(sValorNew)<0) )Then
      Begin
        msg('Percentual de Desconto Inválido !!','A');
        Dbg_GeraOCGrid.SelectedIndex:=0;
        Dbg_GeraOCGrid.SelectedIndex:=igColAComprar;
        Dbg_GeraOCGrid.SetFocus;
        Exit;
      End;

      // Preco Unitário --------------------------------
      If sQual='P' Then
      Begin
        DecimalSeparator:='.';
        MySql:=' UpDate OC_COMPRAR oc'+
               ' Set oc.Vlr_Uni_Compra='+QuotedStr(f_Troca(',','.',sValorNew))+
               ', oc.VLR_DESCONTOS=((oc.QTD_ACOMPRAR*oc.VLR_UNI_COMPRA)*(oc.PER_DESCONTO/100))'+
               ', oc.VLR_BRUTO=(oc.QTD_ACOMPRAR*oc.VLR_UNI_COMPRA)-oc.VLR_DESCONTOS'+
               ', oc.VLR_BASE_ICMS=oc.VLR_BRUTO'+
               ', oc.VLR_ICMS=Cast(((oc.VLR_BASE_ICMS*oc.PER_ICMS)/100) as Numeric(12,2))'+
               ', oc.VLR_IPI=Cast(((oc.VLR_BRUTO*oc.PER_IPI)/100) as Numeric(12,2))'+
               ', oc.VLR_BASE_ST=oc.VLR_BRUTO+(Cast(((oc.VLR_BRUTO*oc.PER_MARGEM_ST)/100) as Numeric(12,2)))'+
               ', oc.VLR_ST=(Cast(((oc.VLR_BASE_ST*oc.PER_ST)/100) as Numeric(12,2))-oc.VLR_ICMS)'+
               ', oc.VLR_TOT_COMPRA=oc.VLR_BRUTO+oc.VLR_ST+oc.VLR_IPI'+

               ', oc.BLOB_TEXTO=oc.BLOB_TEXTO||ascii_char(13)||'+
                             QuotedStr('Alterado em: '+DateTimeToStr(
                             DataHoraServidorFI(DMBelShopPedidos.SQLQuery1))+
                             ' por '+sgNomeUsuario+
                             ' - Preço Anterior: '+sValorOld+
                             ' - Preço Atual: '+sValorNew)+

               ' Where oc.Ind_OC_Gerada=''N'''+
               ' and   oc.cod_empresa='+sgLojaLinx+
               ' And   oc.Num_Documento='+QuotedStr(sNumDoc)+
               ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaDocto)))+
               ' And   oc.Cod_Item='+QuotedStr(IBQComprar.FieldByName('COD_ITEM').AsString);
        DMOCLinx.IBQ_Executa.Close;
        DMOCLinx.IBQ_Executa.SQL.Clear;
        DMOCLinx.IBQ_Executa.SQL.Add(MySql);
        DMOCLinx.IBQ_Executa.ExecSQL;

        DMBelShopPedidos.IBT_BelShop.CommitRetaining;

        DecimalSeparator:=',';
      End; // If sQual='P' Then

      // Percentual de Desconto Individual ------------------------
      If sQual='DI' Then
      Begin
        DecimalSeparator:='.';
        MySql:=' UpDate OC_COMPRAR oc'+
               ' Set oc.Per_Desconto='+QuotedStr(f_Troca(',','.',sValorNew))+
               ', oc.VLR_DESCONTOS=((oc.QTD_ACOMPRAR*oc.VLR_UNI_COMPRA)*(oc.PER_DESCONTO/100))'+
               ', oc.VLR_BRUTO=(oc.QTD_ACOMPRAR*oc.VLR_UNI_COMPRA)-oc.VLR_DESCONTOS'+
               ', oc.VLR_BASE_ICMS=oc.VLR_BRUTO'+
               ', oc.VLR_ICMS=Cast(((oc.VLR_BASE_ICMS*oc.PER_ICMS)/100) as Numeric(12,2))'+
               ', oc.VLR_IPI=Cast(((oc.VLR_BRUTO*oc.PER_IPI)/100) as Numeric(12,2))'+
               ', oc.VLR_BASE_ST=oc.VLR_BRUTO+(Cast(((oc.VLR_BRUTO*oc.PER_MARGEM_ST)/100) as Numeric(12,2)))'+
               ', oc.VLR_ST=(Cast(((oc.VLR_BASE_ST*oc.PER_ST)/100) as Numeric(12,2))-oc.VLR_ICMS)'+
               ', oc.VLR_TOT_COMPRA=oc.VLR_BRUTO+oc.VLR_ST+oc.VLR_IPI'+

               ', oc.BLOB_TEXTO=oc.BLOB_TEXTO||ascii_char(13)||'+
                             QuotedStr('Alterado em: '+DateTimeToStr(
                             DataHoraServidorFI(DMBelShopPedidos.SQLQuery1))+
                             ' por '+sgNomeUsuario+
                             ' - Desconto Anterior: '+sValorOld+
                             ' - Desconto Atual: '+sValorNew)+

               ' Where oc.Ind_OC_Gerada=''N'''+
               ' And   oc.qtd_transf=0'+
               ' and   oc.cod_empresa='+sgLojaLinx+
               ' And   oc.Num_Documento='+QuotedStr(sNumDoc)+
               ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaDocto)))+
               ' And   oc.Cod_Item='+QuotedStr(IBQComprar.FieldByName('COD_ITEM').AsString);
        DMOCLinx.IBQ_Executa.Close;
        DMOCLinx.IBQ_Executa.SQL.Clear;
        DMOCLinx.IBQ_Executa.SQL.Add(MySql);
        DMOCLinx.IBQ_Executa.ExecSQL;

        DMBelShopPedidos.IBT_BelShop.CommitRetaining;
        DecimalSeparator:=',';
      End; // If sQual='DI' Then

      // Percentual de Desconto Mix ------------------------
      If sQual='DM' Then
      Begin
        DecimalSeparator:='.';
        MySql:=' UpDate OC_COMPRAR oc'+
               ' Set oc.Per_Desconto='+QuotedStr(f_Troca(',','.',sValorNew))+
               ', oc.VLR_DESCONTOS=((oc.QTD_ACOMPRAR*oc.VLR_UNI_COMPRA)*(oc.PER_DESCONTO/100))'+
               ', oc.VLR_BRUTO=(oc.QTD_ACOMPRAR*oc.VLR_UNI_COMPRA)-oc.VLR_DESCONTOS'+
               ', oc.VLR_BASE_ICMS=oc.VLR_BRUTO'+
               ', oc.VLR_ICMS=Cast(((oc.VLR_BASE_ICMS*oc.PER_ICMS)/100) as Numeric(12,2))'+
               ', oc.VLR_IPI=Cast(((oc.VLR_BRUTO*oc.PER_IPI)/100) as Numeric(12,2))'+
               ', oc.VLR_BASE_ST=oc.VLR_BRUTO+(Cast(((oc.VLR_BRUTO*oc.PER_MARGEM_ST)/100) as Numeric(12,2)))'+
               ', oc.VLR_ST=(Cast(((oc.VLR_BASE_ST*oc.PER_ST)/100) as Numeric(12,2))-oc.VLR_ICMS)'+
               ', oc.VLR_TOT_COMPRA=oc.VLR_BRUTO+oc.VLR_ST+oc.VLR_IPI'+

               ', oc.BLOB_TEXTO=oc.BLOB_TEXTO||ascii_char(13)||'+
                             QuotedStr('Alterado em: '+DateTimeToStr(
                             DataHoraServidorFI(DMBelShopPedidos.SQLQuery1))+
                             ' por '+sgNomeUsuario+
                             ' - Desconto (MIX) Anterior: '+sValorOld+
                             ' - Desconto (MIX) Atual: '+sValorNew)+

               ' Where oc.Ind_OC_Gerada=''N'''+
               ' And   oc.qtd_transf=0'+
               ' And   oc.cod_empresa='+sgLojaLinx+
               ' And   oc.Num_Documento='+QuotedStr(sNumDoc)+
               ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaDocto)));
        DMOCLinx.IBQ_Executa.Close;
        DMOCLinx.IBQ_Executa.SQL.Clear;
        DMOCLinx.IBQ_Executa.SQL.Add(MySql);
        DMOCLinx.IBQ_Executa.ExecSQL;

        DMBelShopPedidos.IBT_BelShop.CommitRetaining;
        DecimalSeparator:=',';
      End; // If sQual='DM' Then

      // Reabre IBQ_Comprar ====================================================
      IBQComprar.DisableControls;
      IBQComprar.Close;
      IBQComprar.Open;
      IBQComprar.Locate('Num_Seq', sNumSeq,[]);
      IBQComprar.EnableControls;

      // Busca Totais do Pedido OCs ============================================
      If Not bLinx Then
       Begin
        TotaisOCLinx(sNumDoc)
       End
      Else
       Begin
         TotaisOCLinx(sNumDoc)
       End; // If Not bLinx Then

    Except
      msg('Valor Inválido !!','A');
    End;
  End; // If InputQuery(s,'',sValorNew) then

End; // PEDIDO COMPRAS - Altera Quantidade ou Preço Unitário a Comparar >>>>>>>>

// PEDIDO COMPRAS - Monta sgFornecedoresLinx >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
End; // PEDIDO COMPRAS - Monta sgFornecedoresLinx >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// PEDIDO COMPRAS - Inicializa Meses de Demandas para Calculo de Médias >>>>>>>>
Procedure TFrmOCLinx.InicializaMesesLinx;
Var
  Dt1: TDate;
  i, Index:Integer;
begin

  sgOrderGrid:='';

  // Acerta Meses de Calculo ===================================================
  DecodeDate(DataHoraServidorFI(DMBelShopPedidos.SQLQuery1)-1, wgAnoH, wgMesH, wgDiaH);

  For i:=1 to 5 do
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

    If i=5 Then
    Begin
      CB_Mes5.ItemIndex:=Index+1;
      ME_Ano5.Text:=IntToStr(wgAnoH);
    End;

    Dt1:=Dt1-1;
    DecodeDate(Dt1, wgAnoH, wgMesH, wgDiaH);
  End; // For i:=1 to 5 do
End; // PEDIDO COMPRAS - Inicializa Meses de Demandas para Calculo de Médias >>>


// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmOCLinx.CreateToolTips(hWnd: Cardinal);
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
Procedure TFrmOCLinx.FocoToControl(Sender: TControl);
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
// ODIR FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmOCLinx.Bt_OCFecharClick(Sender: TObject);
begin
  bgSairLinx:=True;

  DMBelShopPedidos.FechaTudo;

  Close;
end;

procedure TFrmOCLinx.PC_OrdemCompraChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_OrdemCompra);

  Bt_OCBuscaProdutos.Visible:=False;
  Bt_OCFechaPedido.Visible:=False;
  Pan_TotalProdutos.Visible:=False;

  If (PC_OrdemCompra.ActivePage=Ts_OCBuscaProdutos) And (Ts_OCBuscaProdutos.CanFocus) Then
  Begin
    PC_Filtros.TabIndex:=0;
    Bt_OCBuscaProdutos.Visible:=True;

    EdtFiltroCodForn.SetFocus;
  End; // If (PC_OrdemCompra.ActivePage=Ts_OCBuscaProdutos) And (Ts_OCBuscaProdutos.CanFocus) Then

  If (PC_OrdemCompra.ActivePage=Ts_OCGeraOrdemCompra) And (Ts_OCGeraOrdemCompra.CanFocus) Then
  Begin
    PC_GeraOCApresentacao.TabIndex:=0;

    If Trim(DtEdt_GeraOCDataDocto.Text)='/  /' Then
     DtEdt_GeraOCDataDocto.Date:=DataHoraServidorFI(DMBelShopPedidos.SQLQuery1);

    Pan_TotalProdutos.Visible:=True;
    Bt_OCFechaPedido.Visible:=True;

    If DMOCLinx.IBQ_AComprar.Active Then
     Dbg_GeraOCGrid.SetFocus
    Else
     EdtGeraOCBuscaDocto.SetFocus;
  End;

  If (PC_OrdemCompra.ActivePage=Ts_GeraOCOrdensCompra) And (Ts_GeraOCOrdensCompra.CanFocus) Then
  Begin
    Dbg_GeraOCTotalGeral.SetFocus
  End;
end;

procedure TFrmOCLinx.PC_FiltrosChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Filtros);

  If (PC_Filtros.ActivePage=TS_FiltroFornecedor) and (TS_FiltroFornecedor.CanFocus) Then
   EdtFiltroCodForn.SetFocus;

  If (PC_Filtros.ActivePage=TS_FiltroProdutos) and (TS_FiltroProdutos.CanFocus) Then
   EdtFiltroCodProduto.SetFocus;


end;

procedure TFrmOCLinx.FormShow(Sender: TObject);
Var
  MySql: String;
begin
  bgEnterTab:=True;
  bgOnChageExec:=True;
  bgDrawColumnCell:=True;
  sgOrderGrid:='';

  // Acerta Meses de Calculo ===================================================
  InicializaMesesLinx;

  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairLinx:=False;

  // Visible=False para Componetes Não Usados ==================================
  Painel_FiltroOC.Visible:=False;
  Gb_CalculoCurvaABC.Visible:=False;
  Gb_CalculoTpCurvaABC.Visible:=False;
  Gb_CalculoApresCurva.Visible:=False;
  Pan_FiltroNaoCompra.Visible:=False;

  // Curva ABC =================================================================
//  Rb_CalculoApresCurvaEstCom.Checked:=True;
//  Ckb_CalculoCurvaTodas.Checked:=True;
//  Ckb_CalculoCurvaTodasClick(Self);
//  Rb_CalculoTpCurvaABCLoja.Checked:=True;
//  Rb_CalculoTpCurvaABCLojaClick(Self);
//
//  Gb_CalculoTpCurvaABC.Enabled:=False;
//  Gb_CalculoApresCurva.Enabled:=False;

  // Inicializa Tabelas Virtuais para Filtros ==================================
  If DMVirtual.CDS_V_Produtos.Active Then
   DMVirtual.CDS_V_Produtos.Close;

  DMVirtual.CDS_V_Produtos.CreateDataSet;
  DMVirtual.CDS_V_Produtos.IndexFieldNames:='';
  DMVirtual.CDS_V_Produtos.Open;

  If DMVirtual.CDS_V_Fornecedores.Active Then
   DMVirtual.CDS_V_Fornecedores.Close;

  DMVirtual.CDS_V_Fornecedores.CreateDataSet;
  DMVirtual.CDS_V_Fornecedores.IndexFieldNames:='';
  DMVirtual.CDS_V_Fornecedores.Open;

  MontaSelectFornecedoresLinx;

  // Ajusta PaggControls =======================================================
  PC_OrdemCompra.TabIndex:=0;
  PC_OrdemCompraChange(Self);
  PC_Filtros.TabIndex:=1;
  PC_Filtros.TabIndex:=0;
  PC_FiltrosChange(Self);

  // Verifica se libera Estoque Minimo para Alteração no Pedido ================
  MySql:=' SELECT e.est_minimo'+
         ' FROM EMP_CONEXOES e'+
         ' WHERE e.cod_linx='+sgLojaLinx;
  DMBelShopPedidos.SQLQuery3.Close;
  DMBelShopPedidos.SQLQuery3.SQL.Clear;
  DMBelShopPedidos.SQLQuery3.SQL.Add(MySql);
  DMBelShopPedidos.SQLQuery3.Open;
  bgEstMinimo:=(DMBelShopPedidos.SQLQuery3.FieldByname('Est_Minimo').AsString='SIM');
  DMBelShopPedidos.SQLQuery3.Close;
  
  // Ajusta Tamnhas da Colunas em Dbg_GeraOCGrid ===============================
  For igColumns:=0 to Dbg_GeraOCGrid.Columns.Count-1 do
  Begin
    Dbg_GeraOCGrid.Columns[igColumns].ReadOnly:=True;

    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='UNI_COMPRA' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=24;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='CLA_CURVA_ABC' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=30;

    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='EST_MINIMO' Then
    Begin
      Dbg_GeraOCGrid.Columns[igColumns].Width:=52;

      Dbg_GeraOCGrid.Columns[igColumns].ReadOnly:=True;
      If bgEstMinimo Then
       Dbg_GeraOCGrid.Columns[igColumns].ReadOnly:=False;

      igColEstMinimo:=igColumns;
    End; // If Dbg_GeraOCGrid.Columns[igColumns].FieldName='EST_MINIMO' Then

    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_SUGERIDA' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=60;

    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_ACOMPRAR' Then
     Begin
       Dbg_GeraOCGrid.Columns[igColumns].Width:=66;
       Dbg_GeraOCGrid.Columns[igColumns].ReadOnly:=False;
       igColAComprar:=igColumns;
     End;

    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='VLR_IPI' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=60;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='VLR_ST' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=60;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='VLR_UNI_COMPRA' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=72;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='VLR_TOT_COMPRA' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=66;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_SALDO' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=50;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_DIAS_ANO' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=60;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_ULT_COMPRA' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=64;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='VLR_UNI_ULT_COMPRA' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=72;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='DTA_ULT_COMPRA' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=66;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_DEM_MES1' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=40;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_DEM_MES2' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=40;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_DEM_MES3' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=40;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_DEM_MES4' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=40;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_DEM_MES5' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=40;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_DEM_MES6' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=40;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_DEM_MES7' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=40;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_DEM_MES8' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=40;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_MEDIA_DIA' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=58;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_MEDIA_MES' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=58;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='PER_DESCONTO' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=50;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='VLR_DESCONTOS' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=60;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='DIAS_ESTOCAGEM' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=50;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_DEMANDA_DIA' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=56;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='COD_BARRAS' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=82;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='VLR_CUSTO_MEDIO' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=50;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='COD_FORNECEDOR' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=56;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='DES_FORNECEDOR' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=200;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='NUM_OC_GERADA' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=48;
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='DTA_OC_GERADA' Then
     Dbg_GeraOCGrid.Columns[igColumns].Width:=110;
  End; // For i:=0 to Dbg_GeraOCGrid.Columns.Count-1 do

end;

procedure TFrmOCLinx.EdtFiltroCodFornExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtFiltroCodForn.Value<>0 Then
  Begin
    If DMVirtual.CDS_V_Fornecedores.RecordCount>0 Then
    Begin
      msg('Só é Permitido UM Fornecedor para Calculo !!','A');
      EdtFiltroCodForn.Clear;
      EdtFiltroCodForn.SetFocus;
      Exit;
    End; // If DMVirtual.CDS_V_Fornecedores.RecordCount>0 Then

    Screen.Cursor:=crAppStart;

    // Busca Fornecedores ======================================================
    MySql:=' SELECT fo.nome_cliente nomefornecedor, fo.cod_cliente codfornecedor, fo.doc_cliente CNPJ'+
           ' FROM LINXCLIENTESFORNEC fo, LINX_PRODUTOS_LOJAS pl'+
           ' WHERE fo.cod_cliente=pl.cod_fornecedor'+
           ' AND   pl.cod_loja_linx='+sgLojaLinx+
           ' AND   pl.dta_processa='+QuotedStr(sgDtaProdLj)+
           ' AND   fo.cod_cliente = '+EdtFiltroCodForn.Text;
    DMBelShopPedidos.CDS_Busca.Close;
    DMBelShopPedidos.SQLQ_Busca.Close;
    DMBelShopPedidos.SQLQ_Busca.SQL.Clear;
    DMBelShopPedidos.SQLQ_Busca.SQL.Add(MySql);
    DMBelShopPedidos.CDS_Busca.Open;

    Screen.Cursor:=crDefault;

    If Trim(DMBelShopPedidos.CDS_Busca.FieldByName('codfornecedor').AsString)='' Then
    Begin
      msg('Fornecedor NÃO Encontrado !!!', 'A');
      DMBelShopPedidos.CDS_Busca.Close;
      EdtFiltroCodForn.Clear;
      EdtFiltroCodForn.SetFocus;
      Exit;
    End;

    If DMVirtual.CDS_V_Fornecedores.Locate('Cod_Fornecedor',DMBelShopPedidos.CDS_Busca.FieldByName('CodFornecedor').AsString,[]) Then
    Begin
      Begin
        msg('Fornecedor Já Informado !!','A');
        DMBelShopPedidos.CDS_Busca.Close;
        EdtFiltroCodForn.Clear;
        EdtFiltroCodForn.SetFocus;
        Exit;
      End;
    End;

    // Inclui Fornecedor =======================================================
    DMVirtual.CDS_V_Fornecedores.Insert;
    DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString:=DMBelShopPedidos.CDS_Busca.FieldByName('CodFornecedor').AsString;
    DMVirtual.CDS_V_FornecedoresDes_Fornecedor.AsString:=DMBelShopPedidos.CDS_Busca.FieldByName('NomeFornecedor').AsString;
    DMVirtual.CDS_V_Fornecedores.Post;

    // Monta sFornecedore
    MontaSelectFornecedoresLinx;

    DMBelShopPedidos.CDS_Busca.Close;
    EdtFiltroCodForn.Text:='0';
    EdtFiltroCodForn.SetFocus;
  End; // If EdtFiltroCodForn.Value<>0 Then
end;
                                                                                                             
procedure TFrmOCLinx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairLinx Then
   Begin
     Action := caFree;
                     
     DMBelShopPedidos.FechaTudo;
   End
  Else
   Begin
     msg('Para Sair Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmOCLinx.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Acertar Erro na Rolagem do Mouse ==========================================
  Application.OnMessage := ApplicationEvents1Message;

  // ===========================================================================
  // Show Hint em Forma de Balão ===============================================
  // ===========================================================================
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_OCBuscaProdutos.Handle, @ti, TipoDoIcone, 'Montar', 'PEDIDO DE COMPRA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_OCFechaPedido.Handle, @ti, TipoDoIcone, 'Fechar', 'PEDIDO DE COMPRA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FiltroBuscaForn.Handle, @ti, TipoDoIcone, 'Selecionar', 'FORNECEDOR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FiltroExcluiForn.Handle, @ti, TipoDoIcone, 'Excluir', 'FORNECEDOR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FiltroBuscaProdtudo.Handle, @ti, TipoDoIcone, 'Selecionar', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FiltroExcluiProdtudo.Handle, @ti, TipoDoIcone, 'Excluir', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FiltroCodBarras.Handle, @ti, TipoDoIcone, 'Selecionar', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_OCFechar.Handle, @ti, TipoDoIcone, 'Sair', 'FECHAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GeraOCCalcular.Handle, @ti, TipoDoIcone, 'Necessidade de Compra', 'CALCULAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GeraOCImpEditOC.Handle, @ti, TipoDoIcone, 'Pedido/Ordem de Compra', 'IMPRESSÃO');

  // ===========================================================================

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
  If bgEnterTab Then
  Begin
    If Key = #13 Then
    Begin
      Key:=#0;
      SelectNext(ActiveControl,True,True);
    End;
  End; // If bgEnterTab Then

end;

procedure TFrmOCLinx.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  iSentido: SmallInt;
begin
  // (ERRO) ACERTA ROLAGEM DO MOUSE (SCROLL)
//  If (ActiveControl is TDBGrid) Or (ActiveControl is TDBGridJul)
  If (Screen.ActiveControl is TDBGrid) Or (Screen.ActiveControl is TDBGridJul) Then
  Begin
    With TDBGrid(ActiveControl) do
    Begin
      If Msg.message = WM_MOUSEWHEEL Then
      Begin
        Msg.message := WM_KEYDOWN;
        Msg.lParam := 0;

        iSentido := HiWord(Msg.wParam);
        If iSentido > 0 Then
         Msg.wParam := VK_UP
        Else
        Msg.wParam := VK_DOWN;

        Handled := False;
      End; // If Msg.message = WM_MOUSEWHEEL Then
    End; // With TDBGrid(ActiveControl) do
  End; // if (Screen.ActiveControl is TDBGrid) then
//
//
//  If Msg.message = WM_MOUSEWHEEL then // primeiramente verificamos se é o evento a ser tratado...
//  Begin
//    If (ActiveControl is TDBGrid) Or (ActiveControl is TDBGridJul) then // If Somente DBGRID *** Testa se Classe é TDBGRID
//    Begin
//      Msg.message := WM_KEYDOWN;
//      Msg.lParam := 0;
//      Sentido := HiWord(Msg.wParam);
//      if Sentido > 0 then
//       Msg.wParam := VK_UP
//      else
//       Msg.wParam := VK_DOWN;
//
//      Handled := False;
//    End; // If (ActiveControl is TDBGrid) Or (ActiveControl is TDBGridJul) then // If Somente DBGRID *** Testa se Classe é TDBGRID
//  End; // if Msg.message = WM_MOUSEWHEEL then

end;

procedure TFrmOCLinx.Bt_FiltroExcluiFornClick(Sender: TObject);
begin
  Dbg_FiltroFornecedores.SetFocus;

  If Not DMVirtual.CDS_V_Fornecedores.IsEmpty Then
  Begin
    If msg('Deseja Realmente Excluir o Fornecedor Selecionado ??','C')=2 Then
     Exit;

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

procedure TFrmOCLinx.Bt_FiltroBuscaFornClick(Sender: TObject);
Var
  MySql: String;
  b:Boolean;
  sNome: String;
begin
  Dbg_FiltroFornecedores.SetFocus;

  If DMVirtual.CDS_V_Fornecedores.RecordCount>0 Then
  Begin
    msg('Só é Permitido UM Fornecedor para Calculo !!','A');
    EdtFiltroCodForn.Clear;
    EdtFiltroCodForn.SetFocus;
    Exit;
  End; // If DMVirtual.CDS_V_Fornecedores.RecordCount>0 Then

  b:=True;
  While b do
  Begin
    If InputQuery('Informe Parte do Nome','',sNome) then
     Begin
       Try
         If Trim(sNome)='' Then
          msg('Informe Parte'+cr+'do Nome do Fornecedor !!','A')
         Else
          Break;
       Except
       End;
     End
    Else // If InputQuery('Informe Parte do Nome','',sNome) then
     Begin
       Exit;
     End; // If InputQuery('Informe Parte do Nome','',sNome) then
  End; // While b do

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ========================================================
  MySql:=' SELECT DISTINCT fo.nome_cliente nomefornecedor, fo.cod_cliente codfornecedor, fo.doc_cliente CNPJ'+
         ' FROM LINXCLIENTESFORNEC fo, LINX_PRODUTOS_LOJAS pl'+
         ' WHERE fo.cod_cliente=pl.cod_fornecedor'+
         ' AND   pl.cod_loja_linx='+sgLojaLinx+
         ' AND   pl.dta_processa='+QuotedStr(sgDtaProdLj)+
         ' AND   UPPER(fo.nome_cliente) LIKE ''%'+AnsiUpperCase(sNome)+'%'''+
         ' ORDER BY fo.nome_cliente';
  DMBelShopPedidos.CDS_Pesquisa.Close;
  DMBelShopPedidos.SQLQ_Pesquisa.Close;
  DMBelShopPedidos.SQLQ_Pesquisa.SQL.Clear;
  DMBelShopPedidos.SQLQ_Pesquisa.SQL.Add(MySql);
  DMBelShopPedidos.CDS_Pesquisa.Filtered:=False;
  DMBelShopPedidos.CDS_Pesquisa.Filter:='';
  DMBelShopPedidos.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShopPedidos.CDS_Pesquisa.FieldByName('codfornecedor').AsString)='' Then
  Begin
    msg('Sem Fornecedor a Listar !!','A');
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
  FrmPesquisa.Campo_Retorno1:='CNPJ';

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    EdtFiltroCodForn.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtFiltroCodFornExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmOCLinx.Ckb_FiltroProdNaoCompraClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_FiltroProdNaoCompra);

  If Not Ckb_FiltroProdNaoCompra.Checked Then
   Ckb_FiltroProdSoNaoCompra.Checked:=False;

  AcertaCkb_SN(Ckb_FiltroProdSoNaoCompra);

end;

procedure TFrmOCLinx.Ckb_FiltroProdNaoCompraKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_FiltroProdNaoCompraClick(Self);

end;

procedure TFrmOCLinx.Dbg_FiltroFornecedoresEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_FiltroFornecedoresEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmOCLinx.Dbg_FiltroProdutoEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_FiltroFornecedoresEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmOCLinx.Bt_FiltroCodBarrasClick(Sender: TObject);
begin
  EdtFiltroCodProduto.Clear;
  EdtFiltroCodProduto.SetFocus;

  FrmProdutoCodBarras:=TFrmProdutoCodBarras.Create(Self);
  FrmProdutoCodBarras.ShowModal;

  // Busca Produto ============================================================
  If Trim(FrmProdutoCodBarras.sgProdLinx)<>'' Then
  Begin
    EdtFiltroCodProduto.Text:=Trim(FrmProdutoCodBarras.sgProdLinx);
    FreeAndNil(FrmProdutoCodBarras);
    EdtFiltroCodProdutoExit(Self);
    Exit;
  End; // If Trim(FrmProdutoCodBarras.sgProdLinx) Then
  FreeAndNil(FrmProdutoCodBarras);

end;

procedure TFrmOCLinx.EdtFiltroCodProdutoExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtFiltroCodProduto.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Produtos ==========================================================
    MySql:=' SELECT pr.nome DES_PRODUTO, pr.cod_produto, pr.cod_fornecedor,'+
           ' CASE'+
           '    WHEN ( (COALESCE(pl.cod_produto,'''')='''') AND (COALESCE(cv.est_minimo, 0)<1) )  THEN'+
           '      ''N'''+
           '    ELSE'+
           '      ''S'''+
           ' END IND_TRABALHA,'+
           ' COALESCE(pr.id_colecao,0) ID_COLECAO,'+ // Coleção: 197 - DESCONTINUADO-CAMPANHA DE R$0,50 (Antigo Não Compra)
           ' pr.desc_colecao'+

           ' FROM LINXPRODUTOS pr'+
           '       LEFT JOIN LINX_PRODUTOS_LOJAS pl   ON pl.cod_produto=pr.cod_produto'+
           '                                         AND pl.cod_loja_linx='+sgLojaLinx+
           '                                         AND pl.dta_processa='+QuotedStr(sgDtaProdLj)+
           '       LEFT JOIN ES_FINAN_CURVA_ABC cv    ON cv.cod_linx='+sgLojaLinx+
           '                                         AND cv.cod_prod_linx=pr.cod_produto'+

           ' WHERE pr.desativado = ''N'''+
           // Setor: 17-IMOBILIZADOS 20-MOVEIS SALÃO 25 - USO E CONSUMO
           ' AND   NOT (COALESCE(pr.id_setor,0) in (17, 20, 25))'+
           // Linha: 33 - Brindes
           ' AND   NOT (COALESCE(pr.id_linha ,0) in (33))'+
           // Coleção: 294 - BRINDE 587 - KIDS
           ' AND   NOT (COALESCE(pr.id_colecao ,0) in (294, 587))'+
           // Fornecedor Não
           ' AND   NOT (COALESCE(pr.cod_fornecedor,0) in (6, 1014, 260))'+
           ' AND   pr.cod_produto='+IntToStr(EdtFiltroCodProduto.AsInteger);

           If Trim(sgFornecedoresLinx)<>'' Then
            MySql:=
             MySql+' And pr.cod_fornecedor in ('+sgFornecedoresLinx+')';
    DMBelShopPedidos.CDS_Busca.Close;
    DMBelShopPedidos.SQLQ_Busca.Close;
    DMBelShopPedidos.SQLQ_Busca.SQL.Clear;
    DMBelShopPedidos.SQLQ_Busca.SQL.Add(MySql);
    DMBelShopPedidos.CDS_Busca.Open;

    Screen.Cursor:=crDefault;

    // Verifica se Produto Esta Autorizado para a Loja ou Descontinuado ========
    If (Trim(DMBelShopPedidos.CDS_Busca.FieldByName('Ind_Trabalha').AsString)='N') Or // Não Autorizado
       (DMBelShopPedidos.CDS_Busca.FieldByName('Id_Colecao').AsInteger=197) Then     // Descontianuado
    Begin
      Screen.Cursor:=crDefault;

      PlaySound(PChar('SystemQuestion'), 0, SND_ASYNC);
      PlaySound(PChar('SystemAsterisk'), 0, SND_ASYNC);
      PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
      PlaySound(PChar('SystemQuestion'), 0, SND_ASYNC);

      // Mensagem: Não Autorizado ou Descontianuado
      If Trim(DMBelShopPedidos.CDS_Busca.FieldByName('Ind_Trabalha').AsString)='N' Then
      Begin
        sgMensagem:='O Produto: '+DMBelShopPedidos.CDS_Busca.FieldByName('Des_Produto').AsString+cr+cr+
                    'NÃO Esta Autorizado para Venda na Sua Loja !!'+cr+
                    'Favor Entrar em Contato com o Setor de Compras para Liberação !!';
      End; // If Trim(DMBelShopPedidos.CDS_Busca.FieldByName('Ind_Trabalha').AsString)='N' Then

      If DMBelShopPedidos.CDS_Busca.FieldByName('Id_Colecao').AsInteger=197 Then
      Begin
        sgMensagem:='O Produto: '+DMBelShopPedidos.CDS_Busca.FieldByName('Des_Produto').AsString+cr+cr+
                    'NÃO PODE SER SOLICITADO !!'+cr+
                    'No momento Pertence ao Grupo de Coleção: '+
                    DMBelShopPedidos.CDS_Busca.FieldByName('Desc_Colecao').AsString+' !!';
      End; // If DMBelShopPedidos.CDS_Busca.FieldByName('Id_Colecao').AsInteger)=197 Then
      DMBelShopPedidos.CDS_Busca.Close;

      Application.MessageBox(PChar(sgMensagem), 'ATENÇÃO !!', 16);
      sgMensagem:='';
      EdtFiltroCodProduto.Clear;
      EdtFiltroCodProduto.SetFocus;
      Exit;
    End; // If Trim(DMBelShopPedidos.CDS_Busca.FieldByName('Ind_Trabalha').AsString)='N' Then

    If Trim(DMBelShopPedidos.CDS_Busca.FieldByName('Cod_Produto').AsString)='' Then
    Begin
      If Trim(sgFornecedoresLinx)='' Then
       msg('Produto NÃO Encontrado !!!', 'A')
      Else
       msg('Produto NÃO Encontrado no'+cr+'Fornecedor Selecionado !!!', 'A');

      DMBelShopPedidos.CDS_Busca.Close;
      EdtFiltroCodProduto.Clear;
      EdtFiltroCodProduto.SetFocus;
      Exit;
    End;

    If DMVirtual.CDS_V_Produtos.Locate('Cod_Produto',DMBelShopPedidos.CDS_Busca.FieldByName('Cod_Produto').AsString,[]) Then
    Begin
      msg('Produto Já Informado !!','A');
      DMBelShopPedidos.CDS_Busca.Close;
      EdtFiltroCodProduto.Clear;
      EdtFiltroCodProduto.SetFocus;
      Exit;
    End;

    DMVirtual.CDS_V_Produtos.Insert;
    DMVirtual.CDS_V_ProdutosCod_Produto.AsString:=DMBelShopPedidos.CDS_Busca.FieldByName('Cod_Produto').AsString;
    DMVirtual.CDS_V_ProdutosDes_Produto.AsString:=DMBelShopPedidos.CDS_Busca.FieldByName('Des_Produto').AsString;
    DMVirtual.CDS_V_ProdutosCod_Fornecedor.AsString:=DMBelShopPedidos.CDS_Busca.FieldByName('Cod_Fornecedor').AsString;
    DMVirtual.CDS_V_Produtos.Post;

    DMBelShopPedidos.CDS_Busca.Close;
    EdtFiltroCodProduto.Text:='0';
    EdtFiltroCodProduto.SetFocus;
  End;
end;

procedure TFrmOCLinx.Bt_FiltroExcluiProdtudoClick(Sender: TObject);
begin
  Dbg_FiltroProduto.SetFocus;

  If Not DMVirtual.CDS_V_Produtos.IsEmpty Then
  Begin
    If msg('Deseja Realmente Excluir'+cr+'o Produto Selecionado ??','C')=2 Then
     Exit;

    DMVirtual.CDS_V_Produtos.Delete;
  End; // If Not DMVirtual.CDS_V_Produtos.IsEmpty Then

  Dbg_FiltroProduto.SetFocus;

end;

procedure TFrmOCLinx.Bt_FiltroBuscaProdtudoClick(Sender: TObject);
Var
  MySql: String;
  b:Boolean;
  sNome: String;
begin
  Dbg_FiltroProduto.SetFocus;

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
    Else // If InputQuery('Informe Parte do Nome','',sNome) then
     Begin
       Exit;
     End; // If InputQuery('Informe Parte do Nome','',sNome) then
  End; // While b do

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT TRIM(pr.nome) Des_Produto, pr.cod_produto, pr.cod_fornecedor'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE pr.desativado=''N'''+
         // Setor: 17-IMOBILIZADOS 20-MOVEIS SALÃO 25 - USO E CONSUMO
         ' AND   NOT (COALESCE(pr.id_setor,0) in (17, 20, 25))'+
         // Linha: 33 - Brindes
         ' AND   NOT (COALESCE(pr.id_linha ,0) in (33))'+
         // Coleção: 294 - BRINDE 587 - KIDS
         ' AND   NOT (COALESCE(pr.id_colecao ,0) in (294, 587))'+
         // Fornecedor Não
         ' AND   NOT (COALESCE(pr.cod_fornecedor,0) in (6, 1014, 260))'+

         ' AND   UPPER(pr.Nome) LIKE ''%'+AnsiUpperCase(sNome)+'%''';

         If Trim(sgFornecedoresLinx)<>'' Then
          MySql:=
           MySql+' And pr.cod_fornecedor in ('+sgFornecedoresLinx+')';
  MySql:=
   MySql+' Order by pr.Nome';
  DMBelShopPedidos.CDS_Pesquisa.Close;
  DMBelShopPedidos.SQLQ_Pesquisa.Close;
  DMBelShopPedidos.SQLQ_Pesquisa.SQL.Clear;
  DMBelShopPedidos.SQLQ_Pesquisa.SQL.Add(MySql);
  DMBelShopPedidos.CDS_Pesquisa.Filtered:=False;
  DMBelShopPedidos.CDS_Pesquisa.Filter:='';
  DMBelShopPedidos.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim( DMBelShopPedidos.CDS_Pesquisa.FieldByName('Cod_Fornecedor').AsString)='' Then
  Begin
    msg('Sem Produto a a Listar !!','A');
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
    EdtFiltroCodProduto.AsInteger:=StrToInt(FrmPesquisa.EdtCodigo.Text);
    EdtFiltroCodProdutoExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmOCLinx.EdtGeraOCBuscaDoctoChange(Sender: TObject);
begin
  bgEnterTab:=True;

  If bgOnChageExec Then
  Begin
    DMOCLinx.IBQ_AComprar.Close;
    DMOCLinx.CDS_AComprarOCs.Close;

    PC_GeraOCApresentacao.TabIndex:=0;
    PC_GeraOCApresentacaoChange(Self);

    Bt_GeraOCCalcular.Visible:=False;
  End; // If bgOnChageExec Then

end;

procedure TFrmOCLinx.EdtGeraOCBuscaDoctoEnter(Sender: TObject);
begin
  bgEnterTab:=True;

end;

procedure TFrmOCLinx.EdtGeraOCBuscaDoctoExit(Sender: TObject);
Var
  b, bReabrePed: Boolean;
  MySql: String;
begin
  If (EdtGeraOCBuscaDocto.Value=0) Or (PC_OrdemCompra.ActivePage<>Ts_OCGeraOrdemCompra) Then
   Exit;

  If PC_GeraOCApresentacao.ActivePage=Ts_GeraOCGrid Then
   Dbg_GeraOCGrid.SetFocus;

  // OdirApagar - 19/03/2019
  // If PC_GeraOCApresentacao.ActivePage=Ts_GeraOCOrdensCompra Then
  //  Dbg_GeraOCTotalGeral.SetFocus;

  DecimalSeparator:=',';

  OdirPanApres.Caption:='AGUARDE !! Localizando Documento...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmOCLinx.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmOCLinx.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmOCLinx;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Screen.Cursor:=crAppStart;

  Bt_GeraOCCalcular.Visible:=False;

  b:=False;
  If Not DMBelShopPedidos.IBDB_BelShop.Connected Then
  Begin
    While Not b do
    Begin
      Try
        DMBelShopPedidos.IBDB_BelShop.Connected:=True;
        b:=True;
      Except
      End;
    End; // While Not b do
  End; // If Not DMBelShopPedidos.IBDB_BelShop.Connected Then

  DMOCLinx.CDS_AComprarOCs.Close;

  // Botao de Calculo ==========================================================
  Bt_GeraOCCalcular.Visible:=True;

  // Busca Dados dos Itens do Documento ========================================
  bReabrePed:=False;
  If (DMOCLinx.IBQ_AComprar.Active) Then
   If DMOCLinx.IBQ_AComprarNUM_DOCUMENTO.AsInteger<>EdtGeraOCBuscaDocto.AsInteger Then
    bReabrePed:=True;

  If (Not DMOCLinx.IBQ_AComprar.Active) Then
   bReabrePed:=True;

  If bReabrePed Then
  Begin
    DMOCLinx.IBQ_AComprar.DisableControls;
    DMOCLinx.IBQ_AComprar.Close;
    DMOCLinx.IBQ_AComprar.Params.ParamByName('Num_Documento').AsInteger:=EdtGeraOCBuscaDocto.AsInteger;
    DMOCLinx.IBQ_AComprar.Params.ParamByName('Cod_Loja').AsString:=sgLojaLinx;
    DMOCLinx.IBQ_AComprar.Open;
    DMOCLinx.IBQ_AComprar.EnableControls;
  End; // If bReabrePed Then

  If DMOCLinx.IBQ_AComprar.IsEmpty Then
  Begin
    OdirPanApres.Visible:=True;
    Screen.Cursor:=crDefault;

    msg('Documento Número: '+VarToStr(EdtGeraOCBuscaDocto.Value)+cr+cr+'Não Encontrado !!','A');

    EdtGeraOCBuscaDocto.AsInteger:=0;
    EdtGeraOCBuscaDocto.SetFocus;
    Exit;
  End; // If DMOCLinx.IBQ_AComprar.IsEmpty Then

  // Inicailiza Data ===========================================================
  bgOnChageExec:=False;
  DtEdt_GeraOCDataDocto.Date:=DMOCLinx.IBQ_AComprarDTA_DOCUMENTO.AsDateTime;
  bgOnChageExec:=True;

  // Toal de Produtos ==========================================================
  DMOCLinx.IBQ_AComprar.Last;
  Edt_OCTotProdutos.Value:=DMOCLinx.IBQ_AComprar.RecordCount;
  DMOCLinx.IBQ_AComprar.First;;

  // Acerta Nome dos Meses de Demandas no Grid =================================
  NomeMesesGridLinx;

  // Busca Totais do Pedido OCs ================================================
  TotaisOCLinx(IntToStr(EdtGeraOCBuscaDocto.AsInteger));

  // Verifica se Pedido Ja Esta Fechado ========================================
  MySql:=' SELECT TRIM(d.origem) origem'+
         ' FROM OC_COMPRAR_DOCS d'+
         ' WHERE d.num_docto='+VarToStr(EdtGeraOCBuscaDocto.Value)+
         ' AND   d.dta_docto='+QuotedStr(f_Troca('/','.',(f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date)))))+
         ' AND   UPPER(TRIM(d.origem)) LIKE '+QuotedStr('LINX%')+
         ' AND   EXISTS (SELECT 1'+
         '               FROM OC_COMPRAR o'+
         '               WHERE o.num_documento=d.num_docto'+
         '               AND   CAST(o.dta_documento AS DATE) = d.dta_docto'+
         '               AND   o.cod_empresa='+sgLojaLinx+')';
  DMBelShopPedidos.CDS_BuscaRapida.Close;
  DMBelShopPedidos.SQLQ_BuscaRapida.Close;
  DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
  DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMBelShopPedidos.CDS_BuscaRapida.Open;

  Bt_OCFechaPedido.Caption:='Fechar Pedido';

  Bt_OCFechaPedido.Font.Color:=clWindowText;

  Dbg_GeraOCGrid.Columns[igColEstMinimo].ReadOnly:=True;
  If bgEstMinimo Then
   Dbg_GeraOCGrid.Columns[igColEstMinimo].ReadOnly:=False;

  Dbg_GeraOCGrid.Columns[igColAComprar].ReadOnly :=False;

  If AnsiUpperCase(Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByname('Origem').AsString))='LINX' Then
  Begin
    OdirPanApres.Visible:=True;
    Screen.Cursor:=crDefault;

    Bt_OCFechaPedido.Caption:='Pedido FECHADO';
    Dbg_GeraOCGrid.Columns[igColAComprar].ReadOnly :=True;
    Dbg_GeraOCGrid.Columns[igColEstMinimo].ReadOnly:=True;
    Bt_OCFechaPedido.Font.Color:=clRed;

    msg('Impossível Alterar !!'+cr+cr+'Pedido Já Fechado !!', 'A');
  End; // If AnsiUpperCase(Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByname('Origem').AsString))='LINX' Then
  DMBelShopPedidos.CDS_BuscaRapida.Close;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;
end;

procedure TFrmOCLinx.PC_GeraOCApresentacaoChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_GeraOCApresentacao);

  If (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCGrid) And (Ts_GeraOCGrid.CanFocus) Then
  Begin
    If Not DMOCLinx.IBQ_AComprar.IsEmpty Then
    Begin
      Dbg_GeraOCGrid.SelectedIndex:=0;
      Dbg_GeraOCGrid.SelectedIndex:=igColAComprar;
      Dbg_GeraOCGrid.SetFocus;
    End; // If Not DMOCLinx.IBQ_AComprar.IsEmpty Then
  End; // If (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCGrid) And (Ts_GeraOCGrid.CanFocus) Then

  If (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCOrdensCompra) And (Ts_GeraOCOrdensCompra.CanFocus) Then
  Begin
     Dbg_GeraOCTotalGeral.SetFocus;
  End; // If (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCOrdensCompra) And (Ts_GeraOCOrdensCompra.CanFocus) Then
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

  MySql:=' SELECT DISTINCT'+
         '        d.num_docto NR_DOCTO,'+
         '        d.dta_docto DTA_DOCTO,'+
         '        f.nome_cliente FORNECEDOR,'+
         '        d.cod_fornecedor COD_FORN,'+
         '        d.des_comprador COMPRADOR,'+
         ' CASE'+
         '   WHEN c.ind_oc_gerada=''S'' THEN'+
         '     ''OC GERADA'''+
         '   WHEN UPPER(TRIM(d.origem)) = ''LINX'' THEN'+
         '     ''FECHADO'''+
         '   ELSE'+
         '     ''ABERTO'''+
         ' END SITUACAO'+

         ' FROM OC_COMPRAR_DOCS d'+
         '       LEFT JOIN LINXCLIENTESFORNEC f  ON f.cod_cliente=d.cod_fornecedor'+
         '       LEFT JOIN OC_COMPRAR c          ON c.num_documento=d.num_docto'+
         '                                      AND CAST(c.dta_documento AS DATE) = d.dta_docto'+
         '                                      AND ((c.qtd_sugerida<>0) or (c.qtd_acomprar<>0))'+
         '                                      AND c.cod_empresa='+sgLojaLinx+

         ' WHERE d.dta_docto='+QuotedStr(f_Troca('/','.',(f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date)))))+
         ' AND   UPPER(TRIM(d.origem)) LIKE '+QuotedStr('LINX%')+
         ' AND   d.cod_comprador='+sgCodUsuLoja+
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
  If Trim(DMBelShopPedidos.CDS_Pesquisa.FieldByName('NR_DOCTO').AsString)='' Then
  Begin
    msg('Sem Documento a Listar !!','A');
    DMBelShopPedidos.CDS_Pesquisa.Close;
    FreeAndNil(FrmPesquisa);
    EdtGeraOCBuscaDocto.SetFocus;
    Exit;
  End;

  // Acerta Celulas em Dbg_Pesquisa ============================================
  FrmPesquisa.Dbg_PesquisaPesquisaDoctosOC;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='NR_DOCTO';
  FrmPesquisa.Campo_Codigo:='NR_DOCTO';
  FrmPesquisa.Campo_Descricao:='NR_DOCTO';//Dta_Documento';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShopPedidos.CDS_Pesquisa.Close;

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

  If DMOCLinx.IBQ_AComprar.IsEmpty Then
   Exit;

  // Verifica se Existe OC Gerada ==============================================
  MySql:=' SELECT FIRST 1 o.num_oc_gerada, d.Origem'+
         ' FROM OC_COMPRAR o, OC_COMPRAR_DOCS d'+
         ' WHERE o.num_documento=d.num_docto'+
         ' AND   CAST(o.dta_documento AS DATE) = d.dta_docto'+
         ' AND   o.num_oc_gerada is not null'+
         ' AND   UPPER(TRIM(d.origem)) LIKE '+QuotedStr('LINX%')+
         ' AND   o.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value)+
         ' AND   o.cod_empresa='+sgLojaLinx;
  DMBelShopPedidos.CDS_BuscaRapida.Close;
  DMBelShopPedidos.SQLQ_BuscaRapida.Close;
  DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
  DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMBelShopPedidos.CDS_BuscaRapida.Open;

  If AnsiUpperCase(Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Origem').AsString))='LINX' Then
  Begin
    msg('Impossível Excluir !!'+cr+cr+'Pedido Já Fechado !!','A');
    DMBelShopPedidos.CDS_BuscaRapida.Close;
    Dbg_GeraOCGrid.SetFocus;
    Exit;
  End;
  DMBelShopPedidos.CDS_BuscaRapida.Close;

  If msg('Deseja Realmente Excluir o'+cr+cr+'Pedido Selecionado ??','C')=2 Then
  Begin
    Dbg_GeraOCGrid.SetFocus;
    Exit;
  End;

  // Verifica se Transação esta Ativa
  If DMBelShopPedidos.SQLC.InTransaction Then
   DMBelShopPedidos.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShopPedidos.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Exclui Controle de Meses do Docto =======================================
    MySql:=' DELETE FROM OC_COMPRAR_MESES m'+
           ' WHERE m.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value)+
           ' AND   EXISTS (SELECT 1'+
           '               FROM OC_COMPRAR o, OC_COMPRAR_DOCS d'+
           '               WHERE o.num_documento=d.num_docto'+
           '               AND   CAST(o.dta_documento AS DATE) = d.dta_docto'+
           '               AND   o.num_documento=m.num_documento'+
           '               AND   CAST(o.dta_documento AS DATE) = '+QuotedStr(f_Troca('/','.',(f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date)))))+
           '               AND   o.cod_empresa='+sgLojaLinx+
           '               AND   UPPER(TRIM(d.origem)) LIKE '+QuotedStr('LINX-'+sgUfLoja+sgLojaLinx)+')';
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

    // Deleta OC_COMPRAR_DOCS ==================================================
    MySql:=' DELETE'+
           ' FROM OC_COMPRAR_DOCS d'+
           ' WHERE d.num_docto ='+VarToStr(EdtGeraOCBuscaDocto.Value)+
           ' AND   d.dta_docto = '+QuotedStr(f_Troca('/','.',(f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date)))))+
           ' AND   UPPER(TRIM(d.origem))='+QuotedStr('LINX-'+sgUfLoja+sgLojaLinx)+
           ' AND   EXISTS (SELECT 1'+
           '               FROM OC_COMPRAR o'+
           '               WHERE o.num_documento=d.num_docto'+
           '               AND   CAST(o.dta_documento AS DATE) = d.dta_docto'+
           '               AND   o.cod_empresa='+sgLojaLinx+')';
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

    // Exclui Docto ============================================================
    MySql:=' DELETE FROM OC_COMPRAR o'+
           ' WHERE o.num_documento='+VarToStr(EdtGeraOCBuscaDocto.Value)+
           ' AND   CAST(o.dta_documento AS DATE) = '+QuotedStr(f_Troca('/','.',(f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date)))))+
           ' AND   o.cod_empresa='+sgLojaLinx;
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMBelShopPedidos.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShopPedidos.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    End; // on e : Exception do
  End; // Try

  EdtGeraOCBuscaDocto.Value:=0;
  EdtGeraOCBuscaDocto.SetFocus;

  msg('Documento Excluído com SUCESSO !!','A');
end;

procedure TFrmOCLinx.Bt_GeraOCCalcularClick(Sender: TObject);
Var
  cQtdACompra: Currency;
  MySql: String;
begin
  DtEdt_GeraOCDataDocto.SetFocus;

  If DMOCLinx.IBQ_AComprar.IsEmpty Then
   Exit;

  If Bt_OCFechaPedido.Caption='Pedido FECHADO' Then
  Begin
    msg('Pedido Já Fechado !!', 'A');
    Exit;
  End; // If Bt_OCFechaPedido.Caption:='Pedido FECHADO' Then

  If EdtGeraOCDias.Value<1 Then
  Begin
    msg('Número de Dias Para Cálculo Inválido !!', 'A');
    EdtGeraOCDias.SetFocus;
    Exit;
  End;

  If msg('Deseja Realmente Calcular'+cr+cr+'Necessidade de COMPRA'+cr+cr+'para '+EdtGeraOCDias.Text+' Dias ??','C')=2 Then
   Exit;

  PC_GeraOCApresentacao.TabIndex:=1;
  PC_GeraOCApresentacaoChange(Self);

  If msg('Produtos Sem Preço Unitário'+cr+'Ficarão COM QUANTIDADE SUGERIDA e'+cr+
         'SEM QUANTIDADE a COMPRAR !!'+cr+cr+'Deseja Realmente Continuar ??','C')=2 Then
   Exit;

  Screen.Cursor:=crAppStart;

  // Busca Produtos ===========================================================
  DMOCLinx.CDS_Sugestao.Close;
  DMOCLinx.SQLQ_Sugestao.Params.ParamByName('NumDocto').Value:=EdtGeraOCBuscaDocto.Value;
  DMOCLinx.SQLQ_Sugestao.Params.ParamByName('Dta').AsDate:=DtEdt_GeraOCDataDocto.Date;
  DMOCLinx.SQLQ_Sugestao.Params.ParamByName('CodLoja').Value:=sgLojaLinx;
  DMOCLinx.CDS_Sugestao.Open;

  // Inicia Processamento =====================================================
  FrmBelShopPedidos.MontaProgressBar(True, FrmOCLinx);
  pgProgBar.Properties.Max:=DMOCLinx.CDS_Sugestao.RecordCount;
  pgProgBar.Position:=0;

  DMOCLinx.CDS_Sugestao.DisableControls;
  While Not DMOCLinx.CDS_Sugestao.Eof do
  Begin
    Application.ProcessMessages;

    pgProgBar.Position:=DMOCLinx.CDS_Sugestao.RecNo;
    Refresh;

    If DMOCLinx.CDS_SugestaoCOD_ITEM.AsInteger=17861 Then
     pgProgBar.Position:=DMOCLinx.CDS_Sugestao.RecNo;

    DMOCLinx.CDS_Sugestao.Edit;

    If (DMOCLinx.CDS_SugestaoIND_OC_GERADA.AsString<>'S') and (DMOCLinx.CDS_SugestaoQTD_TRANSF.AsCurrency=0) Then
    Begin
      // Calcula Acomprar -------------------------------------------
      cQtdACompra:=RoundTo(DMOCLinx.CDS_SugestaoQTD_MEDIA_DIA.AsCurrency*EdtGeraOCDias.Value,0);
      DMOCLinx.CDS_SugestaoQTD_SUGERIDA.AsCurrency:=cQtdACompra;

      // Atualiza Sugerida se Necessário ----------------------------
      If (DMOCLinx.CDS_SugestaoEST_MINIMO.AsInteger-DMOCLinx.CDS_SugestaoQTD_SALDO.AsInteger) >
         DMOCLinx.CDS_SugestaoQTD_SUGERIDA.AsInteger Then
      Begin
        DMOCLinx.CDS_SugestaoQTD_SUGERIDA.AsInteger:=
                                      DMOCLinx.CDS_SugestaoEST_MINIMO.AsInteger-
                                       DMOCLinx.CDS_SugestaoQTD_SALDO.AsInteger;
      End; // If (DMOCLinx.CDS_SugestaoEST_MINIMO.AsInteger-...

      // Atualiza AComprar se Necessário ----------------------------
      If (DMOCLinx.CDS_SugestaoEST_MINIMO.AsInteger-DMOCLinx.CDS_SugestaoQTD_SALDO.AsInteger) >
         DMOCLinx.CDS_SugestaoQTD_ACOMPRAR.AsInteger Then
       Begin
        DMOCLinx.CDS_SugestaoQTD_ACOMPRAR.AsInteger:=
                                      DMOCLinx.CDS_SugestaoEST_MINIMO.AsInteger-
                                       DMOCLinx.CDS_SugestaoQTD_SALDO.AsInteger;
       End
      Else // If (DMOCLinx.CDS_SugestaoEST_MINIMO.AsInteger-...
       Begin
        DMOCLinx.CDS_SugestaoQTD_ACOMPRAR.AsCurrency:=DMOCLinx.CDS_SugestaoQTD_SUGERIDA.AsCurrency;
       End; // If (DMOCLinx.CDS_SugestaoEST_MINIMO.AsInteger-...

// OdirApagar - 17/05/2019
//      // Verifica Se Utiliza Saldo ----------------------------------
//      If Ckb_GeraOCCalculoEstoque.Checked Then
//       cQtdACompra:=cQtdACompra-DMOCLinx.CDS_SugestaoQTD_SALDO.AsCurrency;
//
//      // Verifica Se Utiliza Transito -------------------------------
//      If Ckb_GeraOCCalculoTransito.Checked Then
//       cQtdACompra:=cQtdACompra-DMOCLinx.CDS_SugestaoQTD_TRANSITO.AsCurrency;

      cQtdACompra:=DMOCLinx.CDS_SugestaoQTD_SUGERIDA.AsCurrency;
      If cQtdACompra<0 Then
       cQtdACompra:=0;

      // Analisa Estoque Minimo -------------------------------------
      If cQtdACompra<DMOCLinx.CDS_SugestaoEST_MINIMO.AsCurrency Then
      Begin
        cQtdACompra:=DMOCLinx.CDS_SugestaoEST_MINIMO.AsCurrency;
      End;

      If DMOCLinx.CDS_SugestaoVLR_UNI_COMPRA.AsCurrency>0 Then
       DMOCLinx.CDS_SugestaoQTD_SUGERIDA.AsCurrency:=cQtdACompra
      Else
       DMOCLinx.CDS_SugestaoQTD_SUGERIDA.AsCurrency:=0;

      DMOCLinx.CDS_SugestaoQTD_ACOMPRAR.AsCurrency:=DMOCLinx.CDS_SugestaoQTD_SUGERIDA.AsCurrency;

      // Calcula Totais do Produto ----------------------------------
      If (DMOCLinx.CDS_SugestaoQTD_ACOMPRAR.AsCurrency<>0) And
         (DMOCLinx.CDS_SugestaoVLR_UNI_COMPRA.AsCurrency<>0) Then
      Begin
        // Valor Bruto ----------------------------------------------
        DMOCLinx.CDS_SugestaoVLR_BRUTO.AsCurrency:=
                                  (DMOCLinx.CDS_SugestaoQTD_ACOMPRAR.AsCurrency*
                                DMOCLinx.CDS_SugestaoVLR_UNI_COMPRA.AsCurrency);

        // Valor Base ICMS ------------------------------------------
        DMOCLinx.CDS_SugestaoVLR_BASE_ICMS.AsCurrency:=DMOCLinx.CDS_SugestaoVLR_BRUTO.AsCurrency;

        // Valor ICMS -----------------------------------------------
        If DMOCLinx.CDS_SugestaoPER_ICMS.AsCurrency<>0 Then
         DMOCLinx.CDS_SugestaoVLR_ICMS.AsCurrency:=Roundto(
                                 (DMOCLinx.CDS_SugestaoVLR_BASE_ICMS.AsCurrency*
                              DMOCLinx.CDS_SugestaoPER_ICMS.AsCurrency)/100,-2);

        // Valor IPI ------------------------------------------------
        If DMOCLinx.CDS_SugestaoPER_IPI.AsCurrency<>0 Then
         DMOCLinx.CDS_SugestaoVLR_IPI.AsCurrency:=Roundto(
                               (DMOCLinx.CDS_SugestaoVLR_BRUTO.AsCurrency*
                               DMOCLinx.CDS_SugestaoPER_IPI.AsCurrency)/100,-2);

        // Valores ST -----------------------------------------------
        If DMOCLinx.CDS_SugestaoPER_ST.AsCurrency<>0 Then
        Begin
          // Valor Base ST ------------------------------------------
          If DMOCLinx.CDS_SugestaoPER_MARGEM_ST.AsCurrency=0 Then
           DMOCLinx.CDS_SugestaoVLR_BASE_ST.AsCurrency:=DMOCLinx.CDS_SugestaoVLR_BRUTO.AsCurrency
          Else
           DMOCLinx.CDS_SugestaoVLR_BASE_ST.AsCurrency:=
                       DMOCLinx.CDS_SugestaoVLR_BRUTO.AsCurrency+
                       (Roundto(((DMOCLinx.CDS_SugestaoVLR_BRUTO.AsCurrency*
                       DMOCLinx.CDS_SugestaoPER_MARGEM_ST.AsCurrency)/100),-2));

          // Valor ST -----------------------------------------------
          DMOCLinx.CDS_SugestaoVLR_ST.AsCurrency:=(Roundto(
                               ((DMOCLinx.CDS_SugestaoVLR_BASE_ST.AsCurrency*
                               DMOCLinx.CDS_SugestaoPER_ST.AsCurrency)/100),-2)-
                               DMOCLinx.CDS_SugestaoVLR_ICMS.AsCurrency);

        End; // If DMOCLinx.CDS_SugestaoPER_ST.AsCurrency<>0 Then

        // Valor Total do Item --------------------------------------
        DMOCLinx.CDS_SugestaoVLR_TOT_COMPRA.AsCurrency:=
                                      DMOCLinx.CDS_SugestaoVLR_BRUTO.AsCurrency+
                                      DMOCLinx.CDS_SugestaoVLR_ST.AsCurrency+
                                      DMOCLinx.CDS_SugestaoVLR_IPI.AsCurrency;
        End
      Else // If (DMOCLinx.CDS_SugestaoQTD_ACOMPRAR.AsCurrency<>0) and (DMOCLinx.CDS_SugestaoVLR_UNI_COMPRA.AsCurrency<>0) Then
       Begin
         // Zera todo
         // Valor Bruto ---------------------------------------------
         DMOCLinx.CDS_SugestaoVLR_BRUTO.AsCurrency:=0;

         // Valor Base ICMS -----------------------------------------
         DMOCLinx.CDS_SugestaoVLR_BASE_ICMS.AsCurrency:=0;

         // Valor ICMS ----------------------------------------------
         DMOCLinx.CDS_SugestaoVLR_ICMS.AsCurrency:=0;

         // Valor IPI -----------------------------------------------
         DMOCLinx.CDS_SugestaoVLR_IPI.AsCurrency:=0;

         // Valor Base ST -------------------------------------------
         DMOCLinx.CDS_SugestaoVLR_BASE_ST.AsCurrency:=0;

         // Valor ST ------------------------------------------------
         DMOCLinx.CDS_SugestaoVLR_ST.AsCurrency:=0;

         // Valor Total do Item -------------------------------------
         DMOCLinx.CDS_SugestaoVLR_TOT_COMPRA.AsCurrency:=0;
       End; // If (DMOCLinx.CDS_SugestaoQTD_ACOMPRAR.AsCurrency<>0) and

      DecimalSeparator:='.';
      MySql:='UpDate OC_COMPRAR oc'+
             ' Set oc.Qtd_AComprar='+QuotedStr(DMOCLinx.CDS_SugestaoQTD_ACOMPRAR.AsString)+', '+
             ' oc.Qtd_Sugerida='+QuotedStr(DMOCLinx.CDS_SugestaoQTD_SUGERIDA.AsString)+', '+
             ' oc.Vlr_Uni_Compra='+QuotedStr(DMOCLinx.CDS_SugestaoVLR_UNI_COMPRA.AsString)+', '+
             ' oc.Vlr_Bruto='+QuotedStr(DMOCLinx.CDS_SugestaoVLR_BRUTO.AsString)+', '+
             ' oc.Vlr_Base_ICMS='+QuotedStr(DMOCLinx.CDS_SugestaoVLR_BASE_ICMS.AsString)+', '+
             ' oc.Vlr_ICMS='+QuotedStr(DMOCLinx.CDS_SugestaoVLR_ICMS.AsString)+', '+
             ' oc.Vlr_IPI='+QuotedStr(DMOCLinx.CDS_SugestaoVLR_IPI.AsString)+', '+
             ' oc.Vlr_Base_ST='+QuotedStr(DMOCLinx.CDS_SugestaoVLR_BASE_ST.AsString)+', '+
             ' oc.Vlr_ST='+QuotedStr(DMOCLinx.CDS_SugestaoVLR_ST.AsString)+', '+
             ' oc.Vlr_Tot_Compra='+QuotedStr(DMOCLinx.CDS_SugestaoVLR_TOT_COMPRA.AsString)+

             ' Where oc.Num_Documento='+DMOCLinx.CDS_SugestaoNUM_DOCUMENTO.AsString+
             ' And   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DMOCLinx.CDS_SugestaoDTA_DOCUMENTO.AsDateTime))))+
             ' And   oc.Num_Seq='+DMOCLinx.CDS_SugestaoNUM_SEQ.AsString+
             ' And   oc.cod_empresa='+sgLojaLinx;
      DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);
      DecimalSeparator:=',';

      // Busca Totais do Pedido OCs ============================================
      TotaisOCLinx(DMOCLinx.CDS_SugestaoNUM_DOCUMENTO.AsString);
    End; // If DMOCLinx.CDS_SugestaoIND_OC_GERADA.AsString<>'S' Then

    DMOCLinx.CDS_Sugestao.Next
  End; // While Not DMOCLinx.CDS_Sugestao.Eof do
  DMOCLinx.CDS_Sugestao.EnableControls;
  DMOCLinx.CDS_Sugestao.Close;
  FrmBelShopPedidos.MontaProgressBar(False, FrmOCLinx);

  bgSiga:=True;
  EdtGeraOCBuscaDoctoExit(Self);
  bgSiga:=False;

  // Encerra Processamento ====================================================
  Screen.Cursor:=crDefault;
  msg('Processmento Efetuado com Sucesso !!','A');
  EdtGeraOCDias.Value:=0;

  DMBelShopPedidos.IBT_BelShop.Commit;

  DMOCLinx.IBQ_AComprar.Close;
  DMOCLinx.IBQ_AComprar.Open;

  Gb_GeraOCCalculaCompra.Visible:=True;

  PC_GeraOCApresentacao.TabIndex:=0;
  PC_GeraOCApresentacaoChange(Self);

  Dbg_GeraOCGrid.SelectedIndex:=0;
  Dbg_GeraOCGrid.SelectedIndex:=igColAComprar;
  Dbg_GeraOCGrid.SetFocus;

end;

procedure TFrmOCLinx.Dbg_GeraOCGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
  i: Integer;
  sColuna: String;
begin

  //============================================================================
  // Cor das Demandas ==========================================================
  //============================================================================
  For i:=0 to Dbg_GeraOCGrid.Columns.Count-1 do
  Begin
    sColuna:=Dbg_GeraOCGrid.Columns[i].FieldName;

    If (sColuna='QTD_DEM_MES1') Or (sColuna='QTD_DEM_MES2') Or (sColuna='QTD_DEM_MES3') Or (sColuna='QTD_DEM_MES4') Or
       (sColuna='QTD_DEM_MES5') Or (sColuna='QTD_DEM_MES6') Or (sColuna='QTD_DEM_MES7') Or (sColuna='QTD_DEM_MES8') Then
    Begin
      If (Column.FieldName=sColuna) Then
      Begin
        If (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency>0) Then
        Begin
          Dbg_GeraOCGrid.Canvas.Font.Style:=[fsBold];
          Dbg_GeraOCGrid.Canvas.Font.Color:=clBlack;
        End;

        // 1 a 10
        If (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency>0) And
           (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency<=10) Then
         Dbg_GeraOCGrid.Canvas.Brush.Color:=$00D9FFD9;

        // 11 a 20
        If (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency>10) And
           (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency<=20) Then
         Dbg_GeraOCGrid.Canvas.Brush.Color:=$00B0FFB0;

        // 21 a 30
        If (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency>20) And
           (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency<=30) Then
         Dbg_GeraOCGrid.Canvas.Brush.Color:=$0075FF75;

        // 31 a 40
        If (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency>30) And
           (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency<=40) Then
         Dbg_GeraOCGrid.Canvas.Brush.Color:=$0051FF51;

        // 41 a 50
        If (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency>40) And
           (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency<=50) Then
         Dbg_GeraOCGrid.Canvas.Brush.Color:=$0011FF11;

        // 51 a 60
        If (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency>50) And
           (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency<=60) Then
         Dbg_GeraOCGrid.Canvas.Brush.Color:=$0000E800;

        // Maior que 60
        If (DMOCLinx.IBQ_AComprar.FieldByName(sColuna).AsCurrency>60) Then
         Dbg_GeraOCGrid.Canvas.Brush.Color:=$0000B000
      End; // If (Column.FieldName='QTD_DEM_MES1') Then
    End; // If (sColuna='QTD_DEM_MES1') Or (sColuna='QTD_DEM_MES2') Or (sColuna='QTD_DEM_MES3') Or (sColuna='QTD_DEM_MES4') Or...
  End; // For i:=0 to Dbg_GeraOCGrid.Columns.Count-1 do
  // Cor das Demandas ==========================================================
  //============================================================================

  //============================================================================
  // Cor dos Saldos ============================================================
  //============================================================================
  If (Column.FieldName='QTD_SALDO') Then
  Begin
    If DMOCLinx.IBQ_AComprarQTD_SALDO.AsCurrency>0 Then
    Begin
      Dbg_GeraOCGrid.Canvas.Font.Color:=clWindowText;
      Dbg_GeraOCGrid.Canvas.Brush.Color:=$0080FF00;
    End; // If DMOCLinx.IBQ_AComprarQTD_SALDO.AsCurrency>0 Then

    If DMOCLinx.IBQ_AComprarQTD_SALDO.AsCurrency<0 Then
    Begin
      Dbg_GeraOCGrid.Canvas.Font.Color:=clWindowText;
      Dbg_GeraOCGrid.Canvas.Brush.Color:=$005353FF;
    End; // If DMOCLinx.IBQ_AComprarQTD_SALDO.AsCurrency<0 Then
  End; // If (Column.FieldName='QTD_SALDO') Then
  // Cor dos Saldos ============================================================
  //============================================================================

  If (Column.FieldName='QTD_ACOMPRAR') Then
  Begin
     Dbg_GeraOCGrid.Canvas.Font.Style:=[fsBold];

    If DMOCLinx.IBQ_AComprarQTD_ACOMPRAR.AsCurrency=0 Then
     Dbg_GeraOCGrid.Canvas.Font.Style:=[]
    Else If (DMOCLinx.IBQ_AComprarQTD_ACOMPRAR.AsCurrency<>0) and (DMOCLinx.IBQ_AComprarQTD_TRANSF.AsCurrency<>0) Then
     Begin
       Dbg_GeraOCGrid.Canvas.Font.Color:=clRed;
     End;
  End; // If (Column.FieldName='QTD_ACOMPRAR') Then

  If (Column.FieldName='QTD_TRANSF') Then
  Begin
    If DMOCLinx.IBQ_AComprarQTD_TRANSF.AsCurrency=0 Then
     Dbg_GeraOCGrid.Canvas.Font.Style:=[]
    Else
     Dbg_GeraOCGrid.Canvas.Font.Style:=[fsBold];
  End; // If (Column.FieldName='QTD_TRANSF') Then

  If (Column.FieldName='VLR_UNI_COMPRA') Then
  Begin
    If DMOCLinx.IBQ_AComprarVLR_UNI_COMPRA.AsCurrency=0 Then
     Begin
       Dbg_GeraOCGrid.Canvas.Font.Style:=[];

       If DMOCLinx.IBQ_AComprarIND_OC_GERADA.AsString='N' Then
       Begin
         Dbg_GeraOCGrid.Canvas.Font.Color:=clWhite;
         Dbg_GeraOCGrid.Canvas.Brush.Color:=clRed;
       End; // If DMOCLinx.IBQ_AComprarIND_OC_GERADA.AsString='N' Then
     End
    Else
     Begin
       Dbg_GeraOCGrid.Canvas.Font.Style:=[fsBold];
     End; // If DMOCLinx.IBQ_AComprarVLR_UNI_COMPRA.AsCurrency=0 Then
  End; // If (Column.FieldName='VLR_UNI_COMPRA') Then

  if not (gdSelected in State) Then
  Begin
    if DMOCLinx.IBQ_AComprarCOD_EMPRESA.AsString='99' Then
      Dbg_GeraOCGrid.Canvas.Brush.Color:=$0080FFFF; //$00DDFFDD;

    If DMOCLinx.IBQ_AComprarIND_USAR.AsString='NAO'  Then
     Dbg_GeraOCGrid.Canvas.Brush.Color:=$00C6FFC6;

    if DMOCLinx.IBQ_AComprarIND_OC_GERADA.AsString='S' Then
      Dbg_GeraOCGrid.Canvas.Brush.Color:=clSkyBlue;
  End; // if not (gdSelected in State) Then

  Dbg_GeraOCGrid.Canvas.FillRect(Rect);
  Dbg_GeraOCGrid.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMOCLinx.IBQ_AComprarUNI_COMPRA.Alignment:=taCenter;
  DMOCLinx.IBQ_AComprarCLA_CURVA_ABC.Alignment:=taCenter;
  DMOCLinx.IBQ_AComprarQTD_SUGERIDA.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_ACOMPRAR.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarVLR_UNI_COMPRA.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarVLR_TOT_COMPRA.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_SALDO.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_DIAS_ANO.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_ULT_COMPRA.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarVLR_UNI_ULT_COMPRA.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarDTA_ULT_COMPRA.Alignment:=taCenter;
  DMOCLinx.IBQ_AComprarQTD_DEM_MES1.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_DEM_MES2.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_DEM_MES3.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_DEM_MES4.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_DEM_MES5.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_DEM_MES6.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_DEM_MES7.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_DEM_MES8.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_MEDIA_DIA.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_MEDIA_MES.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarPER_DESCONTO.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarVLR_DESCONTOS.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarDIAS_ESTOCAGEM.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarEST_MINIMO.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarQTD_DEMANDA_DIA.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarCOD_BARRAS.Alignment:=taCenter;
  DMOCLinx.IBQ_AComprarVLR_CUSTO_MEDIO.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarCOD_FORNECEDOR.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarNUM_OC_GERADA.Alignment:=taRightJustify;
  DMOCLinx.IBQ_AComprarDTA_OC_GERADA.Alignment:=taCenter;
end;

procedure TFrmOCLinx.Dbg_GeraOCGridEnter(Sender: TObject);
begin
  bgEnterTab:=False;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_GeraOCGridEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmOCLinx.Dbg_GeraOCGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sValor, sCodProd: String;
  b: Boolean;
begin
  {
   Usado em:
   Dbg_GeraOCGridProd
  }

  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

  If DMOCLinx.IBQ_AComprar.IsEmpty Then
   Exit;

  // Altera Seta Para Baixo para Enter/Return ==================================
  If (key=Vk_Down) Then
   key:=Vk_Return;

  // Executa Enter/Return ======================================================
  If (key=Vk_Return) Then
  Begin
    If DMOCLinx.IBQ_AComprar.RecordCount=1 Then
     Begin
       If DMOCLinx.IBQ_AComprar.RecNo=DMOCLinx.IBQ_AComprar.RecordCount Then
        DMOCLinx.IBQ_AComprar.First
       Else
        DMOCLinx.IBQ_AComprar.Next;
     End
    Else
     Begin
       DMOCLinx.IBQ_AComprar.Next;
     End; // If DMOCLinx.IBQ_AComprar.RecordCount=1 Then

    If Dbg_GeraOCGrid.SelectedIndex<>igColAComprar Then
    Begin
      Dbg_GeraOCGrid.SelectedIndex:=0;
      Dbg_GeraOCGrid.SelectedIndex:=igColAComprar;
    End;

    Dbg_GeraOCGrid.SetFocus;
    bgEnterTab:=False;
    Exit;
  End; // If (key=Vk_Return) Then

  // Executa Seta Para Cima ====================================================
  If (key=VK_UP) and (DMOCLinx.IBQ_AComprar.RecordCount=1) Then
  Begin
    If DMOCLinx.IBQ_AComprar.RecNo<>1 Then
     DMOCLinx.IBQ_AComprar.Prior;
  End; // If (key=Key_Down) and (DMOCLinx.IBQ_AComprar.RecordCount=1) Then

  // Localiza Produto ==========================================================
  If (Key=VK_F4) And ((PC_GeraOCApresentacao.ActivePage=Ts_GeraOCGrid) And (Ts_GeraOCGrid.CanFocus)) Then
  Begin
    sCodProd:= DMOCLinx.IBQ_AComprarCOD_ITEM.AsString;

    sValor:='';
    b:=True;
    While b do
    Begin
      If InputQuery('Localizar Produto','',sValor) then
       Begin
         Try
           StrToInt(sValor);

           If Not DMOCLinx.IBQ_AComprar.Locate('COD_ITEM', sValor,[]) Then
           Begin
            If Not LocalizaRegistro(DMOCLinx.IBQ_AComprar, 'COD_ITEM', sValor) Then
             b:=False;
           End; // If Not DMOCLinx.IBQ_AComprar.Locate('COD_ITEM', sValor,[]) Then

           Break;
         Except
           If Not DMOCLinx.IBQ_AComprar.Locate('DES_ITEM', sValor,[]) Then
           Begin
             If Not LocalizaRegistro(DMOCLinx.IBQ_AComprar, 'DES_ITEM', sValor) Then
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
      DMOCLinx.IBQ_AComprar.Locate('COD_ITEM',sCodProd,[]);
      msg('Produto Não Localizado !!','A');
    End;
  End; // If Key=VK_F4 Then
end;

procedure TFrmOCLinx.Dbg_GeraOCGridProdEnter(Sender: TObject);
begin
  bgEnterTab:=False;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_GeraOCGridProdEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmOCLinx.Bt_OCBuscaProdutosClick(Sender: TObject);
Var
  MySql: String;

  hHrInicio, hHrFim: String;

  bCriaPedidoOC, // Se é para Criar Pedido de Compra
  bCriouPed // Se Criou Pedido de Compra
  : Boolean;
begin

  PC_Filtros.TabIndex:=0;
  Dbg_FiltroFornecedores.SetFocus;

  If (Trim(sgFornecedoresLinx)='') And (DMVirtual.CDS_V_Produtos.IsEmpty) Then
  Begin
    msg('Favor Selecionar'+cr+cr+'Fornecedor e/ou Produto !!', 'A');
    EdtFiltroCodForn.SetFocus;
    Exit;
  End; // If (Trim(sgFornecedoresLinx)='') And (DMVirtual.CDS_V_Produtos.IsEmpty) Then

  If msg('Deseja Realmente Iniciar o Calculo ??','C')=2 Then
  Begin
    Exit;
  End;

  // Inicia o Processameto =====================================================
  hHrInicio:=TimeToStr(DataHoraServidorFI(DMBelShopPedidos.SQLQuery1));
  hHrFim:='';

  OdirPanApres.Caption:='AGUARDE !! Inicializando Processos...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmOCLinx.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmOCLinx.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmOCLinx;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Screen.Cursor:=crAppStart;
  Refresh;

//OdirApagar - 26/03/2019
//  // Numero de Meses Total - ES_DEMANDAS_4MESES ================================
//  igTotMeses:=5;

  // Produtos Selecionados =====================================================
  MontaSelecaoProdutos(True, True);
  Screen.Cursor:=crAppStart;

  // OdirApagar - 21/03/2019
  // Calcula Dias Uteis no Ultimo Ano ==========================================
//  DecodeDate(DataHoraServidorFI(DMBelShopPedidos.SQLQuery1), wgAnoH, wgMesH, wgDiaH);
//  sgDtaIniAno:=DateToStr(EncodeDate(wgAnoH-1, wgMesH, 1));
//  sgDtaFimAno:=DateToStr(EncodeDate(wgAnoH, wgMesH, wgDiaH));
//
//  igNrDiasAno:=DiasUteisBelShop(StrToDateTime(sgDtaIniAno),StrToDateTime(sgDtaFimAno)-1, False, True);

  //============================================================================
  // PROCESSA LOJAS ============================================================
  //============================================================================
  DecimalSeparator:='.';
  DateSeparator:='.';
  igNumSeqPed:=0;
  sgNumPed:='0';

  FrmBelShopPedidos.MontaProgressBar(True, FrmOCLinx);

  OdirPanApres.Caption:='AGUARDE !! Analisando e Calculando Pedido da Loja (Linx): '+sgLojaLinx+' - '+sgNomeLoja;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmOCLinx.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmOCLinx.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmOCLinx;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Screen.Cursor:=crAppStart;
  Refresh;

  // Busca Produtos ============================================================
  bCriouPed:=False;
  bCriaPedidoOC:=True;
  If Not BuscaProdutosAnalise Then
   bCriaPedidoOC:=False;

  Screen.Cursor:=crAppStart;

  // Cria Pedido de Compras ====================================================
  If bCriaPedidoOC Then
  Begin
    // Cria Pedido --------------------------------------------------
    If Not CriaPedidoOC Then
    Begin
      Screen.Cursor:=crDefault;
      FrmBelShopPedidos.MontaProgressBar(False, FrmOCLinx);
      OdirPanApres.Visible:=False;
      DecimalSeparator:=',';
      DateSeparator:='/';

      PC_Filtros.TabIndex:=0;
      EdtFiltroCodForn.SetFocus;
      Exit;
    End; // If Not CriaPedidoOC Then
    bCriouPed:=True;
  End; // If bCriaPedidoOC Then
  Screen.Cursor:=crAppStart;

  FrmBelShopPedidos.MontaProgressBar(False, FrmOCLinx);

  OdirPanApres.Visible:=False;

  DecimalSeparator:=',';
  DateSeparator:='/';

  //============================================================================
  // Se Não Criou Peido Encerra ================================================
  //============================================================================
  If Not bCriouPed Then
  Begin
    Screen.Cursor:=crDefault;
    msg('SEM Produto para Geração'+cr+cr+'do Pedido de Compra !!','A');
    Exit;
  End; // If Not bCriouPed Then
  // Se Não Criou Peido Encerra ================================================
  //============================================================================

  //============================================================================
  // Calcula Sugestões / Transferencias / Estoque Excedente ====================
  //============================================================================
//  OCCalculaSugTransfExc(sgNumPed, sgDtaDoc);
  Screen.Cursor:=crAppStart;
  // Calcula Sugestões / Transferencias / Estoque Excedente ====================
  //============================================================================

  // Busca Totais do Pedido OCs ==============================================
  TotaisOCLinx(sgNumPed);

  Screen.Cursor:=crDefault;

  // Encerramento ==============================================================
  hHrFim:=TimeToStr(DataHoraServidorFI(DMBelShopPedidos.SQLQuery1));

  Edt_OCTotProdutos.Value:=0;

  msg('Geração do Pedido de Compras'+cr+'Efetuada com SUCESSO !!'+cr+cr+'TEMPO: '+TimeToStr(StrToTime(hHrFim)-StrToTime(hHrInicio)),'A');

  PC_OrdemCompra.TabIndex:=1;
  PC_OrdemCompraChange(Self);

  EdtGeraOCBuscaDocto.Value:=StrToInt(sgNumPed);
  EdtGeraOCBuscaDoctoExit(Sender);
end;

procedure TFrmOCLinx.Dbg_GeraOCTotalGeralDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if Trim(DMOCLinx.CDS_AComprarOCsIND_OC_GERADA.AsString)='S' Then
     Dbg_GeraOCTotalGeral.Canvas.Brush.Color:=clSkyBlue;
  End;

  If (Column.FieldName='NUM_OC_GERADA') or (Column.FieldName='DTA_OC_GERADA') Then
   Dbg_GeraOCTotalGeral.Canvas.Font.Color:=clBlue;

  If (Column.FieldName='TIPO') Then
  Begin
    If DMOCLinx.CDS_AComprarOCsTIPO.AsString='PD' Then
     Begin
       Dbg_GeraOCTotalGeral.Canvas.Brush.Color:=clRed;
       Dbg_GeraOCTotalGeral.Canvas.Font.Color:=clWhite;
     End
    Else If DMOCLinx.CDS_AComprarOCsTIPO.AsString='OC' Then
     Begin
       Dbg_GeraOCTotalGeral.Canvas.Font.Style:=[fsBold];
     End
  End;

  // Funciona Somente com Isto
  Dbg_GeraOCTotalGeral.Canvas.FillRect(Rect);
  Dbg_GeraOCTotalGeral.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMOCLinx.CDS_AComprarOCsTIPO.Alignment:=taCenter;
  DMOCLinx.CDS_AComprarOCsGERAR.Alignment:=taCenter;
  DMOCLinx.CDS_AComprarOCsCOD_EMP_FIL.Alignment:=taCenter;
  DMOCLinx.CDS_AComprarOCsCOD_LINX.Alignment:=taCenter;
  DMOCLinx.CDS_AComprarOCsTOTAL_OC.Alignment:=taRightJustify;
  DMOCLinx.CDS_AComprarOCsNUM_OC_GERADA.Alignment:=taRightJustify;
  DMOCLinx.CDS_AComprarOCsDTA_OC_GERADA.Alignment:=taCenter;
  DMOCLinx.CDS_AComprarOCsTOTAL_BRUTO.Alignment:=taRightJustify;
  DMOCLinx.CDS_AComprarOCsTOTAL_DESCONTOS.Alignment:=taRightJustify;
  DMOCLinx.CDS_AComprarOCsTOTAL_IPI.Alignment:=taRightJustify;
  DMOCLinx.CDS_AComprarOCsTOTAL_DESPESAS.Alignment:=taRightJustify;
  DMOCLinx.CDS_AComprarOCsTOTAL_ST.Alignment:=taRightJustify;
  DMOCLinx.CDS_AComprarOCsTOTAL_FRETE.Alignment:=taRightJustify;
  DMOCLinx.CDS_AComprarOCsTOTAL_ICMS.Alignment:=taRightJustify;
  DMOCLinx.CDS_AComprarOCsTOTAL_REPASSE.Alignment:=taRightJustify;

end;

procedure TFrmOCLinx.Bt_OCFechaPedidoClick(Sender: TObject);
Var
  MySql: String;
begin
  If (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCGrid) And (Ts_GeraOCGrid.CanFocus) Then
   Dbg_GeraOCGridProd.SetFocus;

  If (PC_GeraOCApresentacao.ActivePage=Ts_GeraOCOrdensCompra) And (Ts_GeraOCOrdensCompra.CanFocus) Then
   Dbg_GeraOCTotalGeral.SetFocus;

  If (EdtGeraOCBuscaDocto.AsInteger=0) Or (Not DMOCLinx.IBQ_AComprar.Active) Or (DMOCLinx.IBQ_AComprar.IsEmpty) Then
   Exit;

  If Bt_OCFechaPedido.Caption='Pedido FECHADO' Then
  Begin
    msg('Pedido Já Fechado !!', 'A');
    Exit;
  End; // If Bt_OCFechaPedido.Caption:='Pedido FECHADO' Then

  If msg('Deseja Realmente Fechar o Pedido ??','C')=2 Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Efetuando o Fechamento do Pedido !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmOCLinx.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmOCLinx.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmOCLinx;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

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

    Mysql:=' UPDATE OC_COMPRAR_DOCS d'+
           ' SET d.origem=''Linx'''+
           ' WHERE d.num_docto='+VarToStr(EdtGeraOCBuscaDocto.AsInteger)+
           ' AND   d.dta_docto='+QuotedStr(f_Troca('/','.',(f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date)))))+
           ' AND   EXISTS (SELECT 1'+
           '               FROM OC_COMPRAR o'+
           '               WHERE o.num_documento=d.num_docto'+
           '               AND   CAST(o.dta_documento AS DATE) = d.dta_docto'+
           '               AND   o.cod_empresa='+sgLojaLinx+')';
    DMBelShopPedidos.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShopPedidos.SQLC.Commit(TD);

    Bt_OCFechaPedido.Caption:='Pedido FECHADO';
    Dbg_GeraOCGrid.Columns[igColAComprar].ReadOnly:=True;
    Bt_OCFechaPedido.Font.Color:=clRed;

    msg('Pedido FECHADO Corretamente !!','A');

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShopPedidos.SQLC.Rollback(TD);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação
  DateSeparator:='/';
  DecimalSeparator:=',';
  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;
end;

procedure TFrmOCLinx.Dbg_GeraOCGridExit(Sender: TObject);
begin
  bgEnterTab:=True;

end;

procedure TFrmOCLinx.Dbg_GeraOCGridProdExit(Sender: TObject);
begin
  bgEnterTab:=True;

end;

procedure TFrmOCLinx.Dbg_GeraOCGridColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
begin
  For igColumns:=0 to Dbg_GeraOCGrid.Columns.Count-1 do
  Begin
    If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_ACOMPRAR' Then
    Begin
      Dbg_GeraOCGrid.Columns[igColumns].ReadOnly:=False;
      igColAComprar:=igColumns;
      Break;
    End; // If Dbg_GeraOCGrid.Columns[igColumns].FieldName='QTD_ACOMPRAR' Then
  End; // For igColumns:=0 to Dbg_GeraOCGrid.Columns.Count-1 do

end;

procedure TFrmOCLinx.Bt_GeraOCImpEditOCClick(Sender: TObject);
Var
  MySql: String;

  sEmpTelefone, sEmpCcontato, sEmpEmail,
  sFornCNPJ, sFornEndereco, sFornBairro, sFornCidade, sFornEstado, sFornCodCep,
  sFornFones, sFornEmail, sFornContato: String;
begin
// msg('Opção em Desenvolvimento !!','A');
// Exit;

  Dbg_GeraOCTotalGeral.SetFocus;

  If DMOCLinx.CDS_AComprarOCs.IsEmpty Then
   Exit;

  // Imprime OC ================================================================
  If Bt_GeraOCImpEditOC.Caption='Imprimir' Then
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
    MySql:=' SELECT'+
           ' oc.des_empresa,'+
           ' CASE'+
           '   WHEN COALESCE(oc.num_oc_gerada,0)=0 THEN'+
           '     ''Pedido de Compra Número: ''||oc.num_documento'+
           '   ELSE'+
           '     ''Ordem de Compra Número: ''||oc.num_oc_gerada'+
           ' END PEDIDOOC,'+

           ' CASE co.complement_emp'+
           '   WHEN '''' THEN'+
           '    co.endereco_emp ||'', ''|| co.num_emp'+
           '  ELSE'+
           '    co.endereco_emp ||'', ''|| co.num_emp ||'' - ''|| co.complement_emp'+
           ' End ENDERECO,'+

           ' co.bairro_emp DES_BAIRRO,'+
           ' CAST(co.cidade_emp AS VARCHAR(60)) DES_CIDADE,'+
           ' co.estado_emp COD_UF,'+
           ' CAST(co.cep_emp AS VARCHAR(9)) COD_CEP,'+

           ' CAST(( SUBSTRING(co.cnpj_emp FROM 1 FOR 2) ||''.''||'+
           '        SUBSTRING(co.cnpj_emp FROM 3 FOR 3) ||''.''||'+
           '        SUBSTRING(co.cnpj_emp FROM 6 FOR 3) ||''/''||'+
           '        SUBSTRING(co.cnpj_emp FROM 9 FOR 4) ||''-''||'+
           '        SUBSTRING(co.cnpj_emp FROM 13 FOR 2 ))'+
           ' AS VARCHAR(18)) NUM_CNPJ,'+

           ' co.inscricao_emp inscr_estadual,'+
           ' CAST(oc.dta_documento AS DATE) DTA_PEDIDO,'+
           ' CAST(oc.dta_oc_gerada AS DATE) DTA_ENTREGA,'+
           ' oc.cod_fornecedor, oc.des_fornecedor,'+
           ' oc.cod_item, oc.cod_barras, oc.cod_referencia_forn, oc.des_item,'+
           ' oc.uni_compra, oc.uni_venda,'+
           ' oc.qtd_acomprar, oc.vlr_uni_compra,'+
           ' oc.per_desconto, oc.vlr_tot_compra,'+
           ' oc.per_icms, oc.vlr_icms,'+
           ' oc.per_ipi, oc.vlr_ipi,'+
           ' oc.per_st, oc.vlr_st,'+
           ' oc.obs_oc,'+
           ' oc.cod_comprador, us.des_usuario,'+

           ' CASE'+
           '   WHEN oc.ind_oc_gerada=''S'' THEN'+
           '     ''OC GERADA'''+
           '   WHEN UPPER(TRIM(dc.origem)) = ''LINX'' THEN'+
           '     ''FECHADO'''+
           '   ELSE'+
           '     ''ABERTO'''+
           ' END SITUACAO'+

           ' FROM OC_COMPRAR oc'+
           '    LEFT JOIN LINXLOJAS    co     ON co.empresa=oc.cod_empresa'+
           '    LEFT JOIN PS_USUARIOS  us     ON us.cod_usuario=oc.cod_comprador'+
           '    LEFT JOIN OC_COMPRAR_DOCS dc  ON dc.num_docto=oc.num_documento'+
           '                                 AND dc.dta_docto=CAST(oc.dta_documento AS DATE)'+
           '                                 AND dc.cod_comprador=oc.cod_comprador'+

           ' WHERE oc.qtd_acomprar>0'+
           ' AND   oc.num_documento='+QuotedStr(IntToStr(EdtGeraOCBuscaDocto.AsInteger))+
           ' AND   Cast(oc.dta_documento as Date)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_GeraOCDataDocto.Date))))+
           ' AND   oc.cod_empresa='+QuotedStr(DMOCLinx.CDS_AComprarOCsCOD_EMP_FIL.AsString)+
           ' AND   oc.cod_fornecedor='+DMOCLinx.CDS_AComprarOCsCOD_FORNECEDOR.AsString;

           If Trim(DMOCLinx.CDS_AComprarOCsNUM_OC_GERADA.AsString)<>'' Then
            MySql:=
             MySql+' AND   oc.num_oc_gerada='+QuotedStr(DMOCLinx.CDS_AComprarOCsNUM_OC_GERADA.AsString)
           Else
            MySql:=
             MySql+' AND   oc.num_oc_gerada IS NULL';
    MySql:=
     MySql+' ORDER BY oc.des_item';
    DMOCLinx.IBQ_OrdemCompra.Close;
    DMOCLinx.IBQ_OrdemCompra.SQL.Clear;
    DMOCLinx.IBQ_OrdemCompra.SQL.Add(MySql);
    DMOCLinx.IBQ_OrdemCompra.Open;

    If DMOCLinx.IBQ_OrdemCompra.IsEmpty Then
    Begin
      Screen.Cursor:=crDefault;
      OdirPanApres.Visible:=False;
      DMOCLinx.IBQ_OrdemCompra.Close;
      msg('Sem Pedido ou'+cr+cr+'Ordem de Compra a Listar !!','A');
      Exit;
    End;

    // Dados da Filial ----------------------------------------------
    MySql:=' SELECT lo.fone_emp telefone, null contato, lo.email_emp email'+
           ' FROM LINXLOJAS lo'+
           ' WHERE lo.empresa='+DMOCLinx.CDS_AComprarOCsCOD_EMP_FIL.AsString;
    DMBelShopPedidos.CDS_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMBelShopPedidos.CDS_BuscaRapida.Open;

    sEmpTelefone  :=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Telefone').AsString);
    sEmpCcontato  :=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Contato').AsString);
    sEmpEmail     :=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Email').AsString);
    DMBelShopPedidos.CDS_BuscaRapida.Close;

    // Dados do Fornecedor ------------------------------------------
    MySql:=' SELECT'+
           ' CASE'+
           '   WHEN CHAR_LENGTH(TRIM(fo.doc_cliente))=14 THEN'+
           '      CAST(SUBSTRING(fo.doc_cliente FROM 1  FOR 2) ||''.''||'+
           '           SUBSTRING(fo.doc_cliente FROM 3  FOR 3) ||''.''||'+
           '           SUBSTRING(fo.doc_cliente FROM 6  FOR 3) ||''/''||'+
           '           SUBSTRING(fo.doc_cliente FROM 9  FOR 4) ||''-''||'+
           '           SUBSTRING(fo.doc_cliente FROM 13 FOR 2) AS VARCHAR(18))'+
           '   WHEN CHAR_LENGTH(TRIM(fo.doc_cliente))=11 THEN'+
           '           SUBSTRING(TRIM(fo.doc_cliente) FROM 1 for 3) || ''.'' ||'+
           '           SUBSTRING(TRIM(fo.doc_cliente) FROM 4 for 3) || ''.'' ||'+
           '           SUBSTRING(TRIM(fo.doc_cliente) FROM 7 for 3) || ''-'' ||'+
           '           SUBSTRING(TRIM(fo.doc_cliente) FROM 10 for 2)'+
           '   ELSE'+
           '     TRIM(fo.doc_cliente)'+
           ' END NUM_CNPJ,'+

           ' CASE'+
           '   WHEN TRIM(fo.complement_end_cli) <> '''' THEN'+
           '     fo.endereco_cliente || '', '' || fo.numero_rua_cliente || ''/'' || fo.complement_end_cli'+
           '   ELSE'+
           '     fo.endereco_cliente || '','' || fo.numero_rua_cliente'+
           ' END ENDERECO,'+

           ' fo.bairro_cliente bairro, fo.cidade_cliente cidade,'+
           ' fo.uf_cliente estado, fo.cep_cliente cod_cep,'+
           ' fo.fone_cliente fone1, fo.fax_cliente fonefax, fo.email_cliente email, NULL contato'+

           ' FROM LINXCLIENTESFORNEC fo'+
           ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
           ' AND   fo.cod_cliente='+DMOCLinx.CDS_AComprarOCsCOD_FORNECEDOR.AsString;
    DMBelShopPedidos.CDS_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.Close;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Clear;
    DMBelShopPedidos.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMBelShopPedidos.CDS_BuscaRapida.Open;

    sFornCNPJ     :=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Num_Cnpj').AsString);
    sFornEndereco :=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Endereco').AsString);
    sFornBairro   :=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Bairro').AsString);
    sFornCidade   :=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Cidade').AsString);
    sFornEstado   :=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Estado').AsString);
    sFornCodCep   :=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Cod_Cep').AsString);

    If (Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Fone1').AsString)<>'') And
       (Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('FoneFax').AsString)<>'') Then
     sFornFones:='Fone: '+Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Fone1').AsString)+
                ' FoneFax: '+Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('FoneFax').AsString);

    If (Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Fone1').AsString)<>'') And
       (Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('FoneFax').AsString)='') Then
     sFornFones:='Fone: '+Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Fone1').AsString);

    If (Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Fone1').AsString)='') And
       (Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('FoneFax').AsString)<>'') Then
     sFornFones:='FoneFax: '+Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('FoneFax').AsString);

    sFornEmail    :=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('EMail').AsString);
    sFornContato  :=Trim(DMBelShopPedidos.CDS_BuscaRapida.FieldByName('Contato').AsString);
    DMBelShopPedidos.CDS_BuscaRapida.Close;

    // Diretorio dos Relatórios -------------------------------------
    // dir_relat       :=  ExtractFilePath(Application.ExeName)+'Relatorios\';

    DMRelatorio.frDBDataSet1.DataSet:=DMOCLinx.IBQ_OrdemCompra;
    DMRelatorio.frReport1.LoadFromFile(sgPastaExecutavel+'OrdemCompra.frf');

    // Atualiza Variaveis -------------------------------------------
    DMRelatorio.frReport1.Dictionary.Variables.Variable['Telefone']:=#39+sEmpTelefone+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['Contato']:=#39+sEmpCcontato+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['EMail']:=#39+sEmpEmail+#39;

    DMRelatorio.frReport1.Dictionary.Variables.Variable['CnpjForn']:=#39+sFornCNPJ+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['EnderecoForn']:=#39+sFornEndereco+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['BairroForn']:=#39+sFornBairro+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['CidadeForn']:=#39+sFornCidade+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['EstadoForn']:=#39+sFornEstado+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['CepForn']:=#39+sFornCodCep+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['FonesForn']:=#39+sFornFones+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['EmailForn']:=#39+sFornEmail+#39;
    DMRelatorio.frReport1.Dictionary.Variables.Variable['ContatoForn']:=#39+sFornContato+#39;

    DMRelatorio.frReport1.PrepareReport;
    DMRelatorio.frReport1.ShowReport;

    Screen.Cursor:=crDefault;
    OdirPanApres.Visible:=False;
    Refresh;
  End; // If Bt_GeraOCImpEditOC.Caption='Imprimir' Then
end;

procedure TFrmOCLinx.Dbg_FiltroFornecedoresKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

  If (Key=VK_Delete) Then
  Begin
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
  End; // If (Key=VK_Delete) Then
  Dbg_FiltroFornecedores.SetFocus;

end;

procedure TFrmOCLinx.Dbg_FiltroProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

  If Key=VK_Delete Then
  Begin
    If Not DMVirtual.CDS_V_Produtos.IsEmpty Then
     DMVirtual.CDS_V_Produtos.Delete;
  End; // If Key=VK_Delete Then

  Dbg_FiltroProduto.SetFocus;
   
end;

end.
