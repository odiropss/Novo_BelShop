unit UFrmCentralTrocas;

interface

uses
  Windows, Messages, SysUtils, Forms, Variants,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, {Menus,} AppEvnts,
  JvGradientCaption, dxStatusBar, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Grids, DBGrids, DBGridJul, DBCtrls, Controls, StdCtrls, Mask,
  JvExMask, JvToolEdit, ExtCtrls, JvExStdCtrls, JvEdit, JvValidateEdit,
  JvRadioButton, Graphics, JvExControls, JvXPCore, JvXPButtons, ComCtrls,
  MMSystem, // sons windows
  Dialogs, IBQuery, Classes, DBXpress, printers, Math, Commctrl, ToolEdit,
  CurrEdit, DateUtils, FR_Class, frexpimg, FR_DSet, FR_DBSet,
  frOLEExl, frRtfExp, FR_E_HTML2, FR_E_HTM, FR_E_CSV, FR_E_RTF, FR_E_TXT,
  RelVisual, jpeg, cxSpinEdit, DB, JvCombobox, RTLConsts, DBClient,
  dxGDIPlusClasses, JvXPCheckCtrls, Menus;

type
  TFrmCentralTrocas = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    PC_Principal: TPageControl;
    Ts_NotasEntDev: TTabSheet;
    Panel1: TPanel;
    Bt_NotasEntDevFechar: TJvXPButton;
    Pan_NotasEntDev: TGroupBox;
    Dbg_NotasEntDevProdutos: TDBGridJul;
    Bt_NotasEntDevBuscaProduto: TJvXPButton;
    EdtNotasEntDevDesProduto: TEdit;
    Label1: TLabel;
    EdtNotasEntDevQtdDevulocao: TJvValidateEdit;
    Bt_NotasEntDevIncluir: TJvXPButton;
    Gb_NotasEntDevDocto: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EdtNotasEntDevNumSolicitacao: TJvValidateEdit;
    DtaEdtNotasEntDev: TJvDateEdit;
    Bt_NotasEntDevLocalizar: TJvXPButton;
    Splitter1: TSplitter;
    EdtNotasEntDevCodProduto: TEdit;
    Bt_NotasEntDevBuscaDocto: TJvXPButton;
    OdirPanApres: TPanel;
    Label2: TLabel;
    Cbx_NotasEntDevCondicao: TComboBox;
    Pan_NotasEntDevCondicaoImpressao: TPanel;
    Label5: TLabel;
    Rb_NotasEntDevDocAtual: TJvRadioButton;
    Rb_NotasEntDevDocsDia: TJvRadioButton;
    Bt_NotasEntDevExcluiDocto: TJvXPButton;
    Shape1: TShape;
    Bt_NotasEntDevExcluiItem: TJvXPButton;
    Dbg_NotasEntDevNFE: TDBGridJul;
    Label6: TLabel;
    EdtNotasEntDevContaBarras: TEdit;
    ApplicationEvents1: TApplicationEvents;
    Lab_NotasEntDevTotProd: TLabel;
    Dbe_NotasEntDevTotProd: TDBEdit;
    Dbe_NotasEntDevTotQtd: TDBEdit;
    Bt_NotasEntDevColetor: TJvXPButton;
    Bt_NotasEntDevImprimir: TJvXPButton;
    Ts_ReposLojas: TTabSheet;
    PanReposLojas: TPanel;
    Dbg_ReposLojasItens: TDBGridJul;
    Dbg_ReposLojasDocs: TDBGridJul;
    Sb_ReposLojas: TdxStatusBar;
    Pan_ReposLojas: TPanel;
    Bt_ReposLojasEmissaoDoc: TJvXPButton;
    Bt_ReposLojasAlterarQtd: TJvXPButton;
    Bt_ReposLojasCheckOut: TJvXPButton;
    Bt_ReposLojasFechar: TJvXPButton;
    Bt_ReposLojasPedidosGerados: TJvXPButton;
    Ts_AnaliseReposicoesEndereco: TTabSheet;
    Pan_AnaliseRepos: TPanel;
    Bt_AnaliseReposClipboard: TJvXPButton;
    Pan_AnaliseReposSolic: TPanel;
    Dbg_AnaliseReposicoes: TDBGrid;
    Bt_AnaliseReposBuscar: TJvXPButton;
    Label106: TLabel;
    Cbx_AnaliseReposMes: TComboBox;
    Label107: TLabel;
    EdtAnaliseReposAno: TcxSpinEdit;
    Dbg_AnaliseReposCorredores: TDBGrid;
    Ts_QtdCaixaCD: TTabSheet;
    Pan_QtdCaixaCD: TPanel;
    Gb_QtdCaixaCDProdutos: TGroupBox;
    Gb_QtdCaixaCDGrupos: TGroupBox;
    Pan_QtdCaixaCDProdutos: TPanel;
    Dbg_QtdsCaixaCDProdutos: TDBGridJul;
    EdtQtdCaixaCDCodProd: TEdit;
    EdtQtdCaixaCDDesProd: TEdit;
    Bt_QtdCaixaCDBuscaProd: TJvXPButton;
    Label8: TLabel;
    EdtQtdCaixaCDQtdCxProd: TCurrencyEdit;
    EdtQtdCaixaCDPercCxProd: TCurrencyEdit;
    Label9: TLabel;
    Label10: TLabel;
    Bt_QtdCaixaCDIncluirProd: TJvXPButton;
    Panel2: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EdtQtdCaixaCDDesGrupo: TEdit;
    Bt_QtdCaixaCDBuscaGrupo: TJvXPButton;
    EdtQtdCaixaCDQtdCxGrupo: TCurrencyEdit;
    EdtQtdCaixaCDPercCxGrupo: TCurrencyEdit;
    Bt_QtdCaixaCDIncluirGrupo: TJvXPButton;
    Dbg_QtdsCaixaCDGrupos: TDBGridJul;
    Label14: TLabel;
    Bt_QtdCaixaCDBuscaSubGrupo: TJvXPButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Gb_Bt_ReposLojasPrioridade: TGroupBox;
    Panel4: TPanel;
    PnaDtaReposicao: TPanel;
    DtaEdt_ReposLojas: TcxDateEdit;
    Panel6: TPanel;
    Bt_ReposLojasGeraArquivoLinx: TJvXPButton;
    Ckb_ReposLojasPrioridade0: TJvXPCheckbox;
    Ckb_ReposLojasPrioridade1: TJvXPCheckbox;
    Ckb_ReposLojasPrioridade2: TJvXPCheckbox;
    Ckb_ReposLojasPrioridade3: TJvXPCheckbox;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    Gb_ReposLojasCorredor: TGroupBox;
    CkCbx_ReposLojasCorredor: TJvCheckedComboBox;
    Gb_ReposLojasItens: TGroupBox;
    EdtReposLojasQtdItensPed: TCurrencyEdit;
    Bt_ReposLojasStatusUltimoProc: TJvXPButton;
    Gb_ReposLojasFornecedor: TGroupBox;
    EdtReposLojasDesForn: TEdit;
    Bt_ReposLojasBuscaForn: TJvXPButton;
    Bt_ReposLojasLimpaForn: TJvXPButton;
    EdtReposLojasCodForn: TEdit;
    Bt_ReposLojasGeraPedidoSIDICOM: TJvXPButton;
    Ts_AnaliseReposicoesDiaria: TTabSheet;
    Panel3: TPanel;
    Bt_AnaliseRepDiariaDia: TJvXPButton;
    Bt_AnaliseRepDiariaSalvaClipboard: TJvXPButton;
    Bt_AnaliseRepDiariaFechar: TJvXPButton;
    Dbg_AnaliseRepDiaria: TDBGridJul;
    Bt_AnaliseRepDiariaDoctos: TJvXPButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_NotasEntDevFecharClick(Sender: TObject);
    procedure EdtNotasEntDevCodProdutoExit(Sender: TObject);
    procedure EdtNotasEntDevCodProdutoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Bt_NotasEntDevIncluirClick(Sender: TObject);
    procedure EdtNotasEntDevNumSolicitacaoChange(Sender: TObject);
    procedure Bt_NotasEntDevBuscaProdutoClick(Sender: TObject);
    procedure EdtNotasEntDevNumSolicitacaoExit(Sender: TObject);
    procedure DtaEdtNotasEntDevChange(Sender: TObject);

    // Odir ====================================================================

    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl);

    Procedure AbreSolicitacoes(index: Integer);

    Procedure BuscaMovtoNfTraNfEntLojas(bBuscaTR, bBuscaEN: Boolean); // Busca Movimentos nas Lojas
    Procedure AnalisaNfTransfDevolucao; // Analisa Transferencis para Devolução

    Procedure MarcarComoImpresso;


    // REPOSIÇÕES ==============================================================
    Function  GeraPedidoSidicomCD: Boolean; // Gera Pedido no SIDICOM CD

    Function  VerificaExistenciaItens(bComQtd: Boolean = False): Boolean;
    Function  VerificaPrecosItens: Boolean;

// OdirApagar - 11/08/2017 - Colocado em PFrmTransferencias
    // Function  ProcessaTranferenciasCompras: Boolean; // Localizando Transferencias Setor de Compras (Dia Anterior)

    Procedure AtualizaPROD_CAIXA_CD(sTipo: String); // Atualiza PROD_CAIXA_CD
                                 // sTipo: (iP) Inclui Produto
                                 //        (eP) Exclui Produto
                                 //        (iG) Inclui Grupo/SubGrupo
                                 //        (eG) Exclui Grupo/SubGrupo

    Procedure AtualizaTotaisLojas;

    Procedure CheckOut_BuscaProdCodBarras_AtualizaQtd(sCodBarras: String; iQtdEmbalagem: Integer);
    Procedure ReCalculaPosicaoLeitora;

    Procedure DivergenciasReposicaoLojas;
    Procedure AcertaDivergenciasReposicaoLojas;

    Procedure GeraReposicaoLINX(sPastaArqLinx: String);

    Procedure RomaneioFornecedor;

    Procedure NuvemMovimentoLinx(sDtaInicial, sDtaFinal: String);
    // Odir ====================================================================

    procedure Bt_NotasEntDevBuscaDoctoClick(Sender: TObject);
    procedure Bt_NotasEntDevLocalizarClick(Sender: TObject);
    procedure Dbg_NotasEntDevNFEDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Rb_NotasEntDevDocAtualClick(Sender: TObject);
    procedure Rb_NotasEntDevDocAtualKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_NotasEntDevExcluiDoctoClick(Sender: TObject);
    procedure Bt_NotasEntDevImprimirClick(Sender: TObject);
    procedure Bt_NotasEntDevExcluiItemClick(Sender: TObject);
    procedure EdtNotasEntDevCodProdutoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtNotasEntDevNumSolicitacaoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtNotasEntDevCodProdutoChange(Sender: TObject);
    procedure EdtNotasEntDevContaBarrasChange(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_NotasEntDevProdutosEnter(Sender: TObject);
    procedure Dbg_NotasEntDevNFEEnter(Sender: TObject);
    procedure Bt_NotasEntDevColetorClick(Sender: TObject);
    procedure Dbg_NotasEntDevProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_NotasEntDevProdutosDblClick(Sender: TObject);
    procedure Dbg_ReposLojasDocsKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Dbg_ReposLojasItensEnter(Sender: TObject);
    procedure Dbg_ReposLojasItensExit(Sender: TObject);
    procedure Dbg_ReposLojasItensDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ReposLojasDocsEnter(Sender: TObject);
    procedure Bt_ReposLojasEmissaoDocClick(Sender: TObject);
    procedure Bt_ReposLojasAlterarQtdClick(Sender: TObject);
    procedure Bt_ReposLojasGeraPedidoSIDICOMClick(Sender: TObject);
    procedure Bt_ReposLojasCheckOutClick(Sender: TObject);
    procedure Bt_ReposLojasStatusUltimoProcClick(Sender: TObject);
    procedure EdtReposLojasQtdItensPedExit(Sender: TObject);
    procedure Bt_ReposLojasPedidosGeradosClick(Sender: TObject);
    procedure PC_PrincipalChange(Sender: TObject);
    procedure PanReposLojasClick(Sender: TObject);
    procedure DtaEdt_ReposLojasExit(Sender: TObject);
    procedure DtaEdt_ReposLojasEnter(Sender: TObject);
    procedure DtaEdt_ReposLojasPropertiesChange(Sender: TObject);
    procedure Bt_AnaliseReposBuscarClick(Sender: TObject);
    procedure Bt_AnaliseReposClipboardClick(Sender: TObject);
    procedure Dbg_AnaliseReposicoesTitleClick(Column: TColumn);
    procedure DtEdt_AnaliserReposDtaInicioPropertiesChange(
      Sender: TObject);
    procedure Dbg_AnaliseReposCorredoresDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure CkCbx_ReposLojasCorredorChange(Sender: TObject);
    procedure Dbg_ReposLojasItensDblClick(Sender: TObject);
    procedure Dbg_ReposLojasDocsDblClick(Sender: TObject);
    procedure EdtQtdCaixaCDCodProdExit(Sender: TObject);
    procedure Bt_QtdCaixaCDBuscaProdClick(Sender: TObject);
    procedure Bt_QtdCaixaCDBuscaGrupoClick(Sender: TObject);
    procedure Bt_QtdCaixaCDBuscaSubGrupoClick(Sender: TObject);
    procedure Bt_QtdCaixaCDIncluirGrupoClick(Sender: TObject);
    procedure Bt_QtdCaixaCDIncluirProdClick(Sender: TObject);
    procedure Dbg_QtdsCaixaCDProdutosKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Dbg_QtdsCaixaCDGruposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure Bt_ReposLojasGeraArquivoLinxClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Ckb_ReposLojasPrioridade0Click(Sender: TObject);
    procedure Ckb_ReposLojasPrioridade0KeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Bt_ReposLojasLimpaFornClick(Sender: TObject);
    procedure Bt_ReposLojasBuscaFornClick(Sender: TObject);
    procedure Bt_AnaliseRepDiariaDiaClick(Sender: TObject);
    procedure Bt_AnaliseRepDiariaSalvaClipboardClick(Sender: TObject);
    procedure Bt_AnaliseRepDiariaFecharClick(Sender: TObject);
    procedure Dbg_NotasEntDevProdutosKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Dbg_AnaliseRepDiariaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_AnaliseRepDiariaDoctosClick(Sender: TObject);

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
  FrmCentralTrocas: TFrmCentralTrocas;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  bgTodosCorredores,
  bgEnterTab: Boolean;
  bgSair,
  bgChange: Boolean; // Se Já Executou o Primeiro ENTER na Data;

  sgCorredores,
  sgFilterAtual,
  sgCorredoresFilter,
  sgPrioridadeFilter,
  sgTipoPrioridade,

  sgDia,
  sgCodProduto, sgCodProdLinx,
  sgCodGrupo, sgDesGrupo,
  sgCodSubGrupo, sgDesSubGrupo,
  sgNomeProd: String;

  igCorredores, igQtdInformada: Integer;

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;

  IBQ_Filial  : TIBQuery;
  IBQ_MPMS    : TIBQuery;

  OrderGrid: String;    // Ordenar Grid



implementation

uses DK_Procs1, UDMBelShop, UDMConexoes, UDMVirtual, UFrmBelShop,
     UDMCentralTrocas, UPesquisaIB, UPesquisa,
     UFrmSelectEmpProcessamento, UFrmSolicitacoes, UDMRelatorio,
     UFrmLeitoraCodBarras;

{$R *.dfm}

//==============================================================================
// Odir - INICIO ===============================================================
//==============================================================================

// Atualiza Movimento Nuvem Linx >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.NuvemMovimentoLinx(sDtaInicial, sDtaFinal: String);
Var
  MySql: String;
  sParametros: String;
Begin
  OdirPanApres.Caption:='AGUARDE !! Atualizando Movimento (LINX - CLOUD) Dia '+sDtaInicial+' Loja: Belshop | Centro de Distribuição | RS';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  sParametros:=sgPastaWebService+'PWebServiceLinx.exe LinxMovimento'; // Excutavel e Metodo a Processar
  sParametros:=sParametros+' 2'; // Codigo da Loja a Processar: Belshop | Centro de Distribuição | RS
  sParametros:=sParametros+' "'+IncludeTrailingPathDelimiter(sgPastaWebService+'Metodos')+'"'; // Pasta dos Metodos
  sParametros:=sParametros+' "'+IncludeTrailingPathDelimiter(sgPastaWebService+'Retornos')+'"'; // Pasta dos Retornos
  sParametros:=sParametros+' "'+sDtaInicial+'"'; // Data Inicial
  sParametros:=sParametros+' "'+sDtaFinal+'"'; // Data Final

  // Envia Parametro e Aguarda Termino do Processo =============================
  CreateProcessSimple(sParametros);

  OdirPanApres.Visible:=False;
end; // Atualiza Movimento Nuvem Linx >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Imprime Romaeiros por Fornecedor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.RomaneioFornecedor;
Var
  MySql: String;
  dir_padrao, dir_relat: String;
Begin
  // Busca Docto ===============================================================
  MySql:=' SELECT distinct pr.principalfor, pr.nomefornecedor'+

         ' FROM ES_ESTOQUES_LOJAS lo, ES_ESTOQUES_CD cd,'+
         '      PRODUTO pr'+

         ' WHERE lo.cod_produto=pr.codproduto'+
         ' AND   lo.cod_produto=cd.cod_produto'+
         ' AND   lo.dta_movto=cd.dta_movto'+
         ' AND   CAST(TRIM(COALESCE(lo.num_pedido,''0'')) AS INTEGER)=0'+
         ' AND   lo.dta_movto='+QuotedStr(f_Troca('-','.',(f_Troca('/','.',DateToStr(DtaEdt_ReposLojas.Date)))))+
         ' AND   lo.ind_transf='+QuotedStr('SIM')+
         ' AND   lo.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
         ' AND   lo.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString);

         If sgTipoPrioridade<>'Todas as Prioridades' Then
          MySql:=
           MySql+' AND lo.ind_prioridade in ('+sgTipoPrioridade+')';

         If (sgCorredores<>'') and (Not bgTodosCorredores) Then
          MySql:=
           MySql+' AND cd.end_zona||''.''||cd.end_corredor in ('+sgCorredores+')';

         If Trim(EdtReposLojasCodForn.Text)<>'' Then
          MySql:=
           MySql+' AND pr.principalfor='+QuotedStr(Trim(EdtReposLojasCodForn.Text));

  MySql:=
   MySql+' ORDER BY 2';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  DMBelShop.CDS_Busca.DisableControls;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    Screen.Cursor:=crAppStart;

    OdirPanApres.Caption:='AGUARDE !! Montando Relatório...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2));
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmCentralTrocas;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;

    // Busca Docto =============================================================
    MySql:=' SELECT '+
           ' em.cod_cli_linx||'' - ''||em.razao_social||'+
           QuotedStr(' =>'+DMBelShop.CDS_Busca.FieldByName('nomefornecedor').AsString)+' loja,'+
           ' SUBSTRING(em.num_cnpj FROM 1 FOR 2) || ''.'' ||SUBSTRING(em.num_cnpj FROM 3 FOR 3) || ''.'' ||'+
           ' SUBSTRING(em.num_cnpj FROM 6 FOR 3) || ''/'' ||SUBSTRING(em.num_cnpj FROM 9 FOR 4) || ''-'' ||'+
           ' SUBSTRING(em.num_cnpj FROM 13 FOR 2) CNPJ,'+
           ' lo.num_docto, lo.dta_movto, lo.num_seq Seq,'+
           ' cd.end_prateleira||''.''||cd.end_gaveta Enderecamento,'+
           ' lo.qtd_a_transf,'+
           ' ''_____'' qtd_disponivel,'+
           ' cd.qtd_estoque Saldo_CD,'+
           ' lo.cod_produto, TRIM(pr.codbarra) codbarra, Trim(pr.referencia) referencia, TRIM(pr.apresentacao) Des_produto, '+
           QuotedStr(Des_Usuario)+' Usuario,'+
           ' lo.obs_docto'+

           ' FROM ES_ESTOQUES_LOJAS lo, ES_ESTOQUES_CD cd,'+
           '      PRODUTO pr, EMP_CONEXOES em'+

           ' WHERE lo.cod_produto=pr.codproduto'+
           ' AND   lo.cod_produto=cd.cod_produto'+
           ' AND   lo.dta_movto=cd.dta_movto'+
           ' AND   lo.cod_loja=em.cod_filial'+

           ' AND   CAST(TRIM(COALESCE(lo.num_pedido,''0'')) AS INTEGER)=0'+

           ' AND   lo.dta_movto='+QuotedStr(f_Troca('-','.',(f_Troca('/','.',DateToStr(DtaEdt_ReposLojas.Date)))))+
           ' AND   lo.ind_transf='+QuotedStr('SIM')+
           ' AND   lo.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
           ' AND   lo.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString)+
           ' AND   pr.principalfor='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('principalfor').AsString);

           If sgTipoPrioridade<>'Todas as Prioridades' Then
            MySql:=
             MySql+' AND lo.ind_prioridade in ('+sgTipoPrioridade+')';

           If (sgCorredores<>'') and (Not bgTodosCorredores) Then
            MySql:=
             MySql+' AND cd.end_zona||''.''||cd.end_corredor in ('+sgCorredores+')';

    MySql:=
     MySql+' ORDER BY 6, 11';
    DMCentralTrocas.SDS_RelReposicao.Close;
    DMCentralTrocas.CDS_RelReposicao.Close;
    DMCentralTrocas.SDS_RelReposicao.CommandText:=MySql;
    DMCentralTrocas.CDS_RelReposicao.Open;

    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;

    // Apresenta Relatório =====================================================
    {$IFDEF MSWINDOWS}
      dir_padrao      := ExtractFilePath(Application.ExeName);
      dir_relat       := dir_padrao +'Relatorios\';
    {$ENDIF}

    DMRelatorio.frReport1.LoadFromFile(Dir_Relat+'RomaneioReposicoes_SObs.frf');

    // Apropria DataSet ========================================================
    DMRelatorio.frDBDataSet1.DataSet:=DMCentralTrocas.CDS_RelReposicao;

    // Informa Corredores ======================================================
    If (bgTodosCorredores) or (igCorredores=0) Then
     DMRelatorio.frReport1.Dictionary.Variables.Variable['Corredor']:=#39+'TODOS'+#39
    Else
     DMRelatorio.frReport1.Dictionary.Variables.Variable['Corredor']:=#39+Trim(f_troca('''','',sgCorredores))+#39;

    // Informa Prioridades =======================================================
    DMRelatorio.frReport1.Dictionary.Variables.Variable['Prioridades']:=#39+sgTipoPrioridade+#39;

    DMRelatorio.frReport1.PrepareReport;
    DMRelatorio.frReport1.ShowReport;

    // Retorna para o DBGrid
    DMCentralTrocas.CDS_RelReposicao.Close;

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.EnableControls;
  DMBelShop.CDS_Busca.Close;

End; // // Imprime Romaeiros por Fornecedor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// ReCalcula Posição dos ProgressBar da Leitura de Codigo de Barras >>>>>>>>>>>>
Procedure TFrmCentralTrocas.ReCalculaPosicaoLeitora;
Var
  MySql: String;
Begin
  // Acerta Controle de Processamento ========================================
  MySql:=' SELECT'+
         ' COUNT(lo.cod_produto) Total,'+
         ' SUM(CASE'+
         '       WHEN lo.qtd_a_transf=lo.qtd_checkout Then'+
         '         1'+
         '       ELSE'+
         '         0'+
         '     End) OK,'+
         ' SUM(CASE'+
         '        WHEN lo.qtd_a_transf=lo.qtd_checkout Then'+
         '          0'+
         '        ELSE'+
         '          1'+
         '     End) Erro'+
         ' FROM ES_ESTOQUES_LOJAS lo, ES_ESTOQUES_CD cd, PRODUTO pr'+
         ' WHERE lo.cod_produto=cd.cod_produto'+
         ' AND   lo.dta_movto=cd.dta_movto'+
         ' AND   lo.cod_produto=pr.codproduto'+
         ' AND   CAST(TRIM(COALESCE(lo.num_pedido,''0'')) AS INTEGER)=0'+
         ' AND   lo.ind_transf='+QuotedStr('SIM')+
         ' AND   lo.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString)+
         ' AND   lo.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(FrmCentralTrocas.DtaEdt_ReposLojas.Date))))+
         ' AND   lo.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString;

         If sgTipoPrioridade<>'Todas as Prioridades' Then
          MySql:=
           MySql+' AND   lo.ind_prioridade in ('+sgTipoPrioridade+')';

         If (sgCorredores<>'') and (Not bgTodosCorredores) Then
          MySql:=
           MySql+' AND cd.end_zona||''.''||cd.end_corredor in ('+sgCorredores+')';

         If Trim(EdtReposLojasCodForn.Text)<>'' Then
          MySql:=
           MySql+' AND pr.principalfor='+QuotedStr(Trim(EdtReposLojasCodForn.Text));
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  FrmLeitoraCodBarras.PBar_CheckOut_OK.Max       :=DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsInteger;
  FrmLeitoraCodBarras.PBar_CheckOut_OK.Position  :=DMBelShop.CDS_BuscaRapida.FieldByName('Ok').AsInteger;
  FrmLeitoraCodBarras.PBar_CheckOut_Erro.Max     :=DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsInteger;
  FrmLeitoraCodBarras.PBar_CheckOut_Erro.Position:=DMBelShop.CDS_BuscaRapida.FieldByName('Erro').AsInteger;

  FrmLeitoraCodBarras.Lab_CheckOut_OK.Caption  :=' '+CurrToStr(
          RoundTo((DMBelShop.CDS_BuscaRapida.FieldByName('Ok').AsInteger*100)/
                   DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsInteger,0))+' % ';

  FrmLeitoraCodBarras.Lab_CheckOut_Erro.Caption:=' '+CurrToStr(
          RoundTo((DMBelShop.CDS_BuscaRapida.FieldByName('Erro').AsInteger*100)/
                   DMBelShop.CDS_BuscaRapida.FieldByName('Total').AsInteger,0))+' % ';

  DMBelShop.CDS_BuscaRapida.Close;
End; // ReCalcula Posição dos ProgressBar da Leitura de Codigo de Barras >>>>>>>

// Processo Exportação de Transferencia para o Arqivo Texto >>>>>>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.GeraReposicaoLINX(sPastaArqLinx: String);
Var
  tsArquivo: TStringList;

  MySql: String;
  sNumSeq, sNomeArqLinx: String;
Begin

  OdirPanApres.Caption:='AGUARDE !! Gerando Arquivo Texto_LINX Com Reposições...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
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

    // Busca Sequencia para o Nome do Arquivo Texto ============================
    MySql:=' SELECT GEN_ID(GEN_LINX_REPOSICAO_EXPORT,1) Codigo'+
           ' FROM RDB$DATABASE';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sNumSeq     :=DMBelShop.CDS_BuscaRapida.FieldByName('Codigo').AsString;
    sNomeArqLinx:='Reposicao_Linx_Doc_'+sNumSeq+'.TXT';
    DMBelShop.SDS_BuscaRapida.Close;

    // Cria StringList Para Gerar Arquivo Texto ================================
    tsArquivo:= TStringList.Create;

    // Apresenta Processamento =================================================
    FrmBelShop.MontaProgressBar(True, FrmCentralTrocas);
    pgProgBar.Properties.Max:=DMCentralTrocas.CDS_ReposicaoTransf.RecordCount;
    pgProgBar.Position:=0;

    DMCentralTrocas.CDS_ReposicaoTransf.First;
    DMCentralTrocas.CDS_ReposicaoTransf.DisableControls;
    While Not DMCentralTrocas.CDS_ReposicaoTransf.Eof do
    Begin
      Application.ProcessMessages;

      If (DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsCurrency>0) and
         (DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsString='000000') Then
      Begin
        tsArquivo.Add(Trim(DMCentralTrocas.CDS_ReposicaoTransfCODBARRA.AsString)+';'+
                           IntToStr(DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsInteger));

        // Acerta Banco de Dados =============================================
        MySql:=' UPDATE ES_ESTOQUES_LOJAS lo'+
               ' SET lo.Num_Pedido='+QuotedStr(FormatFloat('000000',StrToInt(sNumSeq)))+
               ',    lo.usu_altera='+QuotedStr(Cod_Usuario)+
               ',    lo.dta_altera=current_timestamp'+

               ' WHERE CAST(TRIM(COALESCE(lo.num_pedido,''0'')) AS INTEGER)=0'+
               ' AND   lo.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString)+
               ' AND   lo.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdt_ReposLojas.Date))))+
               ' AND   lo.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
               ' AND   lo.ind_prioridade='+DMCentralTrocas.CDS_ReposicaoTransfIND_PRIORIDADE.AsString+
               ' AND   lo.num_seq='+DMCentralTrocas.CDS_ReposicaoTransfNUM_SEQ.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);

      End; // If (DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsCurrency>0) and (DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsCurrency='000000') Then
      pgProgBar.Position:=DMCentralTrocas.CDS_ReposicaoTransf.RecNo;

      DMCentralTrocas.CDS_ReposicaoTransf.Next;
    End;
    DMCentralTrocas.CDS_ReposicaoDocsAfterScroll(DMCentralTrocas.CDS_ReposicaoDocs);
    DMCentralTrocas.CDS_ReposicaoTransf.EnableControls;
    DMCentralTrocas.CDS_ReposicaoTransf.First;

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    // Salva o Arquivo Texto
    tsArquivo.SaveToFile(IncludeTrailingPathDelimiter(sPastaArqLinx)+sNomeArqLinx);

    MessageBox(Handle, pChar('Arquivo LINX de Reposições Gerado Com SUCESSO !!!'+cr+cr+
                             'Foi Criado na Pasta:'+cr+cr+IncludeTrailingPathDelimiter(sPastaArqLinx)+cr+cr+
                             'Com o Nome de:'+cr+cr+sNomeArqLinx), 'ATENÇÃO !!', MB_ICONINFORMATION);

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação

  FrmBelShop.MontaProgressBar(False, FrmCentralTrocas);

  DateSeparator:='/';
  DecimalSeparator:=',';

  FreeAndNil(tsArquivo);

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

End; // Processo Exportação de Transferencia para o Arqivo Texto >>>>>>>>>>>>>>>

// Atualiza Divergencias de ChecOut de Reposição de Lojas >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.AcertaDivergenciasReposicaoLojas;
Var
  MySql: String;
Begin
  OdirPanApres.Caption:='AGUARDE !! Atualizando Quantidade Divergentes...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
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

    FrmBelShop.MontaProgressBar(True, FrmCentralTrocas);
    pgProgBar.Properties.Max:=DMCentralTrocas.CDS_V_ReposDivergencias.RecordCount;
    pgProgBar.Position:=0;

    DMCentralTrocas.CDS_V_ReposDivergencias.First;
    DMCentralTrocas.CDS_V_ReposDivergencias.DisableControls;
    While Not DMCentralTrocas.CDS_V_ReposDivergencias.Eof do
    Begin
      Application.ProcessMessages;

      iNumSeqDoc:=DMCentralTrocas.CDS_V_ReposDivergenciasNUM_SEQ.AsInteger;

      If DMCentralTrocas.CDS_V_ReposDivergenciasIND_CORRIGIDO.AsString='SIM' Then
      Begin
        If DMCentralTrocas.CDS_ReposicaoTransf.Locate('NUM_SEQ',iNumSeqDoc,[]) Then
        Begin
          // Acerta ClientDataSet ==============================================
          DMCentralTrocas.CDS_ReposicaoTransf.Edit;
          DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsInteger:=
                  DMCentralTrocas.CDS_V_ReposDivergenciasQTD_A_TRANSF.AsInteger;
          DMCentralTrocas.CDS_ReposicaoTransfQTD_CHECKOUT.AsInteger:=
                  DMCentralTrocas.CDS_V_ReposDivergenciasQTD_A_TRANSF.AsInteger;
          DMCentralTrocas.CDS_ReposicaoTransf.Post;

          // Acerta Banco de Dados =============================================
          MySql:=' UPDATE ES_ESTOQUES_LOJAS lo'+

                 ' SET lo.Qtd_A_Transf='+QuotedStr(IntToStr(DMCentralTrocas.CDS_V_ReposDivergenciasQTD_A_TRANSF.AsInteger))+
                 ',    lo.Qtd_CheckOut='+QuotedStr(IntToStr(DMCentralTrocas.CDS_V_ReposDivergenciasQTD_A_TRANSF.AsInteger))+
                 ',    lo.usu_altera='+QuotedStr(Cod_Usuario)+
                 ',    lo.dta_altera=current_timestamp'+

                 ' WHERE CAST(TRIM(COALESCE(lo.num_pedido,''0'')) AS INTEGER)=0'+
                 ' AND   lo.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString)+
                 ' AND   lo.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdt_ReposLojas.Date))))+
                 ' AND   lo.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
                 ' AND   lo.ind_prioridade='+DMCentralTrocas.CDS_ReposicaoTransfIND_PRIORIDADE.AsString+
                 ' AND   lo.num_seq='+DMCentralTrocas.CDS_ReposicaoTransfNUM_SEQ.AsString;
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End; // If DMCentralTrocas.CDS_ReposicaoTransf.Locate('NUM_SEQ',DMCentralTrocas.CDS_V_ReposDivergenciasNUM_SEQ.AsInteger,[]) Then
      End; // If DMCentralTrocas.CDS_V_ReposDivergenciasIND_CORRIGIDO.AsString='SIM' Then

      pgProgBar.Position:=DMCentralTrocas.CDS_V_ReposDivergencias.RecNo;

      DMCentralTrocas.CDS_V_ReposDivergencias.Next;
    End;
    DMCentralTrocas.CDS_V_ReposDivergencias.EnableControls;
    DMCentralTrocas.CDS_V_ReposDivergencias.Close;

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    msg('Correção de Divergências'+cr+cr+'Executada Com SUCESSO !!!','A');

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação

  FrmBelShop.MontaProgressBar(False, FrmCentralTrocas);

  DateSeparator:='/';
  DecimalSeparator:=',';

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

End; // Atualiza Divergencias de ChecOut de Reposição de Lojas >>>>>>>>>>>>>>>>>

// Apresenta Divergencias de ChecOut de Reposição de Lojas >>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.DivergenciasReposicaoLojas;
Var
  MySql: string;
Begin
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT lo.cod_produto, pr.apresentacao Nome,'+
         ' lo.qtd_a_transf, lo.qtd_checkout,'+
         QuotedStr('NAO')+' ind_corrigido,'+
         ' cd.end_zona||''.''||cd.end_corredor||''.''||cd.end_prateleira||''.''||cd.end_gaveta Enderecamento,'+
         ' Trim(pr.codbarra) codbarra,'+
         ' lo.num_seq'+

         ' FROM ES_ESTOQUES_LOJAS lo, ES_ESTOQUES_CD cd, PRODUTO pr'+

         ' WHERE lo.cod_produto=pr.codproduto'+
         ' AND   lo.cod_produto=cd.cod_produto'+
         ' AND   lo.dta_movto=cd.dta_movto'+
         ' AND   CAST(TRIM(COALESCE(lo.num_pedido,''0'')) AS INTEGER)=0'+
         ' AND   lo.qtd_checkout<>lo.qtd_a_transf'+
         ' AND   lo.ind_transf='+QuotedStr('SIM')+
         ' AND   lo.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString)+
         ' AND   lo.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdt_ReposLojas.Date))))+
         ' AND   lo.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString;

         If sgTipoPrioridade<>'Todas as Prioridades' Then
          MySql:=
           MySql+' AND lo.ind_prioridade in ('+sgTipoPrioridade+')';

         If (sgCorredores<>'') and (Not bgTodosCorredores) Then
          MySql:=
           MySql+' AND cd.end_zona||''.''||cd.end_corredor in ('+sgCorredores+')';

         If Trim(EdtReposLojasCodForn.Text)<>'' Then
          MySql:=
           MySql+' AND pr.principalfor='+QuotedStr(Trim(EdtReposLojasCodForn.Text));

  MySql:=
   MySql+' ORDER BY 2';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  If Trim(DMBelShop.CDS_Busca.FieldByName('Nome').AsString)='' Then
  Begin
    Screen.Cursor:=crDefault;
    DMBelShop.CDS_Busca.Close;
    msg('Docto e Corretor(es) SEM Divergência !!','A');
    Exit;
  End;

  // Não Executa CDS_V_ReposDivergenciasAfterScroll ============================
  DMCentralTrocas.bgAfterScroll:=False;

  // ClientDataSet Virtual para Divergencias ===================================
  If DMCentralTrocas.CDS_V_ReposDivergencias.Active Then
   DMCentralTrocas.CDS_V_ReposDivergencias.Close;

  DMCentralTrocas.CDS_V_ReposDivergencias.CreateDataSet;
  DMCentralTrocas.CDS_V_ReposDivergencias.Open;

  try
    DMCentralTrocas.CDS_V_ReposDivergencias.Data:=DMBelShop.CDS_Busca.Data;
  Except // Except da Transação
    On e : Exception do
    Begin
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End;
  End; // Try da Transação
  DMBelShop.CDS_Busca.Close;

  // Executa CDS_V_ReposDivergenciasAfterScroll ================================
  DMCentralTrocas.bgAfterScroll:=True;
  Screen.Cursor:=crDefault;

  // Apresenta Divergencias para Alteraçãoes ===================================
  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  AbreSolicitacoes(24);

  FrmSolicitacoes.Width:=768; // Padrao: Width=649 - ClientHeight=452 - ClientWidth=633

  FrmSolicitacoes.Caption:=' Reposições Lojas ';
  FrmSolicitacoes.Ts_ReposDivergencias.Caption:=' Divergências ';
  FrmSolicitacoes.Pan_Simples.Parent:=FrmSolicitacoes.Ts_ReposDivergencias;
  FrmSolicitacoes.Bt_SimplesOK.Caption:='Salvar';
  FrmSolicitacoes.Bt_SimplesVoltar.Caption:='Abandonar';

  sgMessagemSimplesOK    :='Deseja Realmente Salvar'+cr+'as Divergência Corrigidas ??';
  sgMessagemSimplesVoltar:='Deseja Realmente ABANDONAR'+cr+'as Divergência Corrigidas ??';

  DMCentralTrocas.CDS_V_ReposDivergenciasAfterScroll(DMCentralTrocas.CDS_V_ReposDivergencias);

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  // Atualiza Divergencias - Quantidade de Transferencias e CheckOut ===========
  If bgProcessar Then
  Begin
    AcertaDivergenciasReposicaoLojas;
  End;

  FreeAndNil(FrmSolicitacoes);

End; // Apresenta Divergencias de ChecOut de Reposição de Lojas >>>>>>>>>>>>>>>>

// Atualiza Totais Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.AtualizaTotaisLojas;
Begin
  sgCodEmp:=DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString;
  DMCentralTrocas.CDS_ReposicaoDocs.DisableControls;
  DMCentralTrocas.CDS_ReposicaoDocs.Close;
  DMCentralTrocas.CDS_ReposicaoDocs.Open;
  While Not DMCentralTrocas.CDS_ReposicaoDocs.Eof do
  Begin
//odirapagar - 23/08/2017
//    sCodFilial:=DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString;
    If DMCentralTrocas.CDS_ReposicaoDocs.RecNo=DMCentralTrocas.CDS_ReposicaoDocs.RecordCount Then
     Break;

    DMCentralTrocas.CDS_ReposicaoDocs.Next;

  End; // While Not DMCentralTrocas.CDS_ReposicaoDocs.Eof do
  DMCentralTrocas.CDS_ReposicaoDocs.EnableControls;

  DMCentralTrocas.CDS_ReposicaoDocs.Locate('COD_LOJA', sgCodEmp,[]);
  sgCodEmp:='';

  Dbg_ReposLojasDocs.Refresh;
  Dbg_ReposLojasItens.Refresh;
  Dbg_ReposLojasDocs.SetFocus;
End; // Atualiza Totais Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produto e Atualiza Quantidade de Reposição >>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.CheckOut_BuscaProdCodBarras_AtualizaQtd(sCodBarras: String; iQtdEmbalagem: Integer);
Var
  MySql: String;
  iQtdCheckOut: Integer;
Begin
  // Busca Produto Linx ========================================================
  MySql:=' SELECT pr.cod_produto, pr.cod_auxiliar, pr.nome'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE pr.cod_barra='+sCodBarras+

         'UNION'+

         ' SELECT cb.cod_produto, pr.cod_auxiliar, pr.nome'+
         ' FROM LINXPRODUTOSCODBAR cb, LINXPRODUTOS pr'+
         ' WHERE cb.cod_produto=pr.cod_produto'+
         ' AND   cb.cod_barra='+sCodBarras;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  sgCodProduto :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Auxiliar').AsString);
  sgCodProdLinx:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString);
  sgNomeProd   :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Nome').AsString);
  DMBelShop.CDS_BuscaRapida.Close;

  // Busca Produto SIDICOM ===================================================
  If Trim(sgCodProduto)='' Then
  Begin
    MySql:=' SELECT pr.codproduto, pr.apresentacao'+
           ' FROM PRODUTO pr'+
           ' WHERE pr.codbarra='+QuotedStr(sCodBarras)+

           'UNION'+

           ' SELECT b.codproduto, p.apresentacao'+
           ' FROM PRODUTOSBARRA b, PRODUTO p'+
           ' WHERE b.codproduto=p.codproduto'+
           ' AND   b.codbarra='+QuotedStr(sCodBarras);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sgCodProduto:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodProduto').AsString);
    sgNomeProd  :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Apresentacao').AsString);
    DMBelShop.CDS_BuscaRapida.Close;
  End; // If Trim(sgCodProduto)='' Then

  // Localiza Produto SIDICOM ================================================
  If Trim(sgCodProduto)='' Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    msg('Produto Não ENCOTRADO no Sistema !!'+cr+cr+'Código de Barras: '+sCodBarras,'A');

    Exit;
  End; // If Trim(sgCodProduto)='' Then

  If Not DMCentralTrocas.CDS_ReposicaoTransf.Locate('COD_PRODUTO', sgCodProduto,[]) Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    msg('Produto Não ENCOTRADO !!'+cr+'no Documento/Correto(es) Selecionado(s) !!'+cr+sgCodProduto+' - '+sgNomeProd+cr+cr+'Código de Barras: '+sCodBarras,'A');
    Exit;
  End; // If Not DMCentralTrocas.CDS_ReposicaoTransf.Locate('COD_PRODUTO', sgCodProduto,[]) Then

  If DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsString<>'000000' Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    msg('Produto Já Transferido !!','A');
    Exit;
  End; // If Not DMCentralTrocas.CDS_ReposicaoTransf.Locate('COD_PRODUTO', sgCodProduto,[]) Then

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

    // Busca na Tabela de PROD_CAIXA_CD ========================================
    If iQtdEmbalagem=0 Then
    Begin
      // Busca Grupo e SubGrupo --------------------------------------
      MySql:=' SELECT Trim(pr.codgrupo) CodGrupo, Trim(pr.codsubgrupo) CodSubGrupo'+
             ' FROM PRODUTO pr'+
             ' WHERE pr.codproduto='+QuotedStr(sgCodProduto);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      // Busca Quantidade Por Caixa ----------------------------------
      MySql:=' SELECT cp.Cod_Produto, cp.Cod_Grupo, cp.Cod_Subgrupo, cp.Qtd_Caixa'+
             ' FROM PROD_CAIXA_CD cp'+
             ' WHERE ((cp.cod_produto='+QuotedStr(sgCodProduto)+')'+
             '        OR'+
             '        ((cp.cod_grupo='+QuotedStr(Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodGrupo').AsString))+') and (cp.cod_subgrupo is null))'+
             '        OR'+
             '        ((cp.cod_grupo='+QuotedStr(Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodGrupo').AsString))+') and (cp.cod_subgrupo='+QuotedStr(Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodSubGrupo').AsString))+')))'+
             ' ORDER BY 1 desc, 4 desc';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      If (Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString)<>'') Or // QtD Caixa
         (Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Grupo').AsString)<>'') Then // Multiplos
      Begin
        iQtdEmbalagem:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Caixa').AsInteger;
      End
      Else
      Begin
        iQtdEmbalagem:=1;
      End; // If (Trim(DMTransferencias.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString)<>'') Or // QtD Caixa ...
      DMBelShop.CDS_BuscaRapida.Close;
    End; // If iQtdEmbalagem=0 Then

    // Acerta Quantidade de CheCkout ===========================================
    iQtdCheckOut:=DMCentralTrocas.CDS_ReposicaoTransfQTD_CHECKOUT.AsInteger;
    If DMCentralTrocas.CDS_ReposicaoTransfIND_LEITORA.AsString='NAO' Then
     iQtdCheckOut:=0;

    iQtdCheckOut:=iQtdCheckOut+iQtdEmbalagem;

    // Salva Produto a Repor ===================================================
    MySql:=' UPDATE ES_ESTOQUES_LOJAS el'+
           ' SET el.qtd_checkout='+IntToStr(iQtdCheckOut)+
           ',    el.ind_leitora='+QuotedStr('SIM')+
           ',    el.usu_altera='+QuotedStr(Cod_Usuario)+
           ',    el.dta_altera=current_timestamp'+
           ' WHERE el.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdt_ReposLojas.Date))))+
           ' AND   el.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString)+
           ' AND   el.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
           ' AND   el.ind_prioridade='+DMCentralTrocas.CDS_ReposicaoTransfIND_PRIORIDADE.AsString+
           ' AND   el.ind_transf='+QuotedStr('SIM')+
           ' AND   el.num_seq='+DMCentralTrocas.CDS_ReposicaoTransfNUM_SEQ.AsString;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    DMCentralTrocas.CDS_ReposicaoTransf.Edit;
    DMCentralTrocas.CDS_ReposicaoTransfQTD_CHECKOUT.AsInteger:=iQtdCheckOut;
    DMCentralTrocas.CDS_ReposicaoTransfIND_LEITORA.AsString:='SIM';
    DMCentralTrocas.CDS_ReposicaoTransf.Post;

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Screen.Cursor:=crDefault;

    If Trim(sgCodProdLinx)='' Then
    Begin
      PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
      MessageBox(Handle, pChar('Produto Não ENCOTRADO no NOVO Sistema Linx !!'+cr+cr+
                               sgCodProduto+' - '+sgNomeProd+cr+cr+
                               'Código de Barras: '+sCodBarras), 'ATENÇÃO !!', MB_ICONINFORMATION);
    End; // If Not DMCentralTrocas.CDS_ReposicaoTransf.Locate('COD_PRODUTO', sgCodProduto,[]) Then

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

end; // // Busca Produto e Atualiza Quantidade de Reposição >>>>>>>>>>>>>>>>>>>>

// Atualiza PROD_CAIXA_CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.AtualizaPROD_CAIXA_CD(sTipo: String);
Var
  MySql: String;
Begin
  // sTipo: (iP) Inclui Produto
  //        (eP) Exclui Produto
  //        (iG) Inclui Grupo/SubGrupo
  //        (eG) Exclui Grupo/SubGrupo

  OdirPanApres.Caption:='AGUARDE !! Atualizando QUANTIDADE/CAIXA CD...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
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

    // Inclui Produto -----------------------------------------------
    If sTipo='iP' Then
    Begin
      MySql:=' UPDATE OR INSERT INTO PROD_CAIXA_CD'+
             ' (COD_PRODUTO, COD_GRUPO, DES_GRUPO, COD_SUBGRUPO, DES_SUBGRUPO,'+
             '  QTD_CAIXA, PER_CORTE, USU_ALTERA, DTA_ALTERA)'+
             ' VALUES ('+
             QuotedStr(sgCodProduto)+', '+
             'NULL, NULL, NULL, NULL, '+
             VarToStr(EdtQtdCaixaCDQtdCxProd.AsInteger)+', '+
             VarToStr(EdtQtdCaixaCDPercCxProd.AsInteger)+', '+
             Cod_Usuario+', current_timestamp)'+
             ' MATCHING (COD_PRODUTO)';
    End; //If sTipo='P' Then

    // Exclui Produto -----------------------------------------------
    If sTipo='eP' Then
    Begin
      MySql:=' DELETE FROM PROD_CAIXA_CD p'+
             ' WHERE p.cod_produto='+QuotedStr(DMCentralTrocas.CDS_QtdCxCDProdutosCODIGO.AsString);
    End; //If sTipo='P' Then

    // Inclui Grupo/SubGrupo ----------------------------------------
    If sTipo='iG' Then
    Begin
      MySql:=' UPDATE OR INSERT INTO PROD_CAIXA_CD'+
             ' (COD_PRODUTO, COD_GRUPO, DES_GRUPO, COD_SUBGRUPO, DES_SUBGRUPO,'+
             '  QTD_CAIXA, PER_CORTE, USU_ALTERA, DTA_ALTERA)'+
             ' VALUES (NULL, '+
             QuotedStr(sgCodGrupo)+', '+
             QuotedStr(sgDesGrupo)+', ';

             If Trim(sgCodSubGrupo)<>'' Then
              MySql:=
               MySql+QuotedStr(sgCodSubGrupo)+', '+
                     QuotedStr(sgDesSubGrupo)+', '
             Else
              MySql:=
               MySql+'NULL, NULL, ';

      MySql:=
       MySql+VarToStr(EdtQtdCaixaCDQtdCxGrupo.AsInteger)+', '+
             VarToStr(EdtQtdCaixaCDPercCxGrupo.AsInteger)+', '+
             Cod_Usuario+', current_timestamp)'+
             ' MATCHING (COD_GRUPO, COD_SUBGRUPO)';
    End; // If sTipo='G' Then

    // Exclui Grupo/SubGrupo ----------------------------------------
    If sTipo='eG' Then
    Begin
      MySql:=' DELETE FROM PROD_CAIXA_CD p'+
             ' WHERE TRIM(p.cod_grupo)||TRIM(COALESCE(p.cod_subgrupo,''''))='+
              QuotedStr(Trim(DMCentralTrocas.CDS_QtdCxCDGruposCODIGO.AsString));
    End; //If sTipo='P' Then
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    If Pos('P', sTipo)<>0 Then
    Begin
      DMCentralTrocas.CDS_QtdCxCDProdutos.Close;
      DMCentralTrocas.CDS_QtdCxCDProdutos.Open;
      DMCentralTrocas.CDS_QtdCxCDProdutos.Locate('CODIGO',sgCodProduto,[]);
    End;

    If Pos('G', sTipo)<>0 Then
    Begin
      DMCentralTrocas.CDS_QtdCxCDGrupos.Close;
      DMCentralTrocas.CDS_QtdCxCDGrupos.Open;
      DMCentralTrocas.CDS_QtdCxCDGrupos.Locate('CODIGO',sgCodGrupo+sgCodSubGrupo,[]);
    End;
    Application.ProcessMessages;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

  DateSeparator:='/';
  DecimalSeparator:=',';

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  // lIMPA cOMPONETES ==========================================================
  sgCodProduto:='';
  EdtQtdCaixaCDCodProd.Clear;
  EdtQtdCaixaCDQtdCxProd.Clear;
  EdtQtdCaixaCDPercCxProd.Clear;
  EdtQtdCaixaCDDesProd.Clear;

  sgCodGrupo   :='';
  sgDesGrupo   :='';
  sgCodSubGrupo:='';
  sgDesSubGrupo:='';

  EdtQtdCaixaCDQtdCxGrupo.Clear;
  EdtQtdCaixaCDPercCxGrupo.Clear;
  EdtQtdCaixaCDDesGrupo.Clear;
  Application.ProcessMessages;

End; // Atualiza PROD_CAIXA_CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Verifica a Existencia de Produtos Sem Preco de Custo a Transferir para Pedido do SIDICOM
Function TFrmCentralTrocas.VerificaPrecosItens: Boolean;
Begin
  Result:=False;

  DMCentralTrocas.CDS_ReposicaoTransf.DisableControls;
  DMCentralTrocas.CDS_ReposicaoTransf.First;
  While Not DMCentralTrocas.CDS_ReposicaoTransf.Eof do
  Begin
    If (DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsCurrency>0.00) And (DMCentralTrocas.CDS_ReposicaoTransfPRECOCOMPRA.AsCurrency<=0.00) Then
    Begin
      Result:=True;
      Break;
    End;
    DMCentralTrocas.CDS_ReposicaoTransf.Next;
  End; // While Not DMCentralTrocas.CDS_ReposicaoTransf.Eof do
  DMCentralTrocas.CDS_ReposicaoTransf.EnableControls;
  DMCentralTrocas.CDS_ReposicaoTransf.First;
End; // Verifica a Existencia de Produtos Sem Preco de Custo a Transferir para Pedido do SIDICOM

// OdirApagar - 11/08/2017 - Colocado em PFrmTransferencias
//// Localizando Transferencias Setor de Compras (Dia Anterior) >>>>>>>>>>>>>>>>>>
//Function TFrmCentralTrocas.ProcessaTranferenciasCompras: Boolean;
//Var
//  MySql,
//  sDocTR,
//  sEnd_Zona, sEnd_Corredor, sEnd_Prateleira, sEnd_Gaveta: String;
//
//  mMemo: TMemo;
//  ii, i: Integer;
//Begin
//
//  Result:=True;
//
//  sgDtaLimTransf:=f_Troca('-','.',(f_Troca('/','.',DateToStr(DtaEdt_ReposLojas.Date))));
//
//  // Verifia se Existe Transferencia a Processar ===============================
//  MySql:=' SELECT oc.cod_empresa'+
//         ' FROM OC_COMPRAR oc'+
//         ' WHERE oc.num_oc_gerada>20160300'+
//         ' AND   oc.ind_transf_cd=''N'''+
//         ' AND   CAST(oc.dta_oc_gerada AS DATE)<'+QuotedStr(sgDtaLimTransf)+
//
//         ' UNION'+
//
//         ' SELECT l.cod_loja cod_empresa'+
//         ' FROM ES_ESTOQUES_LOJAS l'+
//         ' WHERE l.num_tr_gerada <> 0'+
//         ' AND   l.qtd_a_transf > 0'+
//         ' AND   l.ind_transf = ''SIM'''+
//         ' AND   l.num_pedido = ''000000'''+
//         ' AND   CAST(l.dta_movto AS DATE) < '+QuotedStr(sgDtaLimTransf)+
//
//         ' ORDER BY 1';
//  DMBelShop.CDS_Busca.Close;
//  DMBelShop.SDS_Busca.CommandText:=MySql;
//  DMBelShop.CDS_Busca.Open;
//
//  If Trim(DMBelShop.CDS_Busca.FieldByName('Cod_Empresa').AsString)='' Then
//  Begin
//    DMBelShop.CDS_Busca.Close;
//    Exit;
//  End; // If Trim(DMBelShop.CDS_Busca.FieldByName('Cod_Empresa').AsString)='' Then
//
//  // Verifica se Transação esta Ativa
//  If DMBelShop.SQLC.InTransaction Then
//   DMBelShop.SQLC.Rollback(TD);
//
//  // Monta Transacao ===========================================================
//  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//  TD.IsolationLevel:=xilREADCOMMITTED;
//  DMBelShop.SQLC.StartTransaction(TD);
//  Try
//    Screen.Cursor:=crAppStart;
//    DateSeparator:='.';
//    DecimalSeparator:='.';
//
//    // Cria Componente Memo ======================================================
//    mMemo:=TMemo.Create(Self);
//    mMemo.Visible:=False;
//    mMemo.Parent:=FrmCentralTrocas;
//    mMemo.Width:=500;
//    mMemo.Lines.Clear;
//
//    While Not DMBelShop.CDS_Busca.Eof do
//    Begin
//      mMemo.Lines.Add(Trim(DMBelShop.CDS_Busca.FieldByName('Cod_Empresa').AsString));
//
//      DMBelShop.CDS_Busca.Next;
//    End;
//    DMBelShop.CDS_Busca.Close;
//
//    For i:=0 to mMemo.Lines.Count-1 do
//    Begin
//      OdirPanApres.Caption:='AGUARDE !! Analisando Transferencias Setor de Compras. Loja: Bel_'+mMemo.Lines[i];
//      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
//      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
//      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
//      OdirPanApres.Font.Style:=[fsBold];
//      OdirPanApres.Parent:=FrmCentralTrocas;
//      OdirPanApres.BringToFront();
//      OdirPanApres.Visible:=True;
//      Refresh;
//
//      // Verifica se Existe ES_ESTOQUES_LOJAS
//      MySql:=' SELECT  FIRST 1 lo.num_docto'+
//             ' FROM ES_ESTOQUES_LOJAS lo'+
//             ' WHERE lo.cod_loja='+QuotedStr(mMemo.Lines[i])+
//             ' AND   lo.dta_movto='+QuotedStr(sgDtaLimTransf);
//      DMBelShop.CDS_Busca.Close;
//      DMBelShop.SDS_Busca.CommandText:=MySql;
//      DMBelShop.CDS_Busca.Open;
//      sDocTR:=Trim(DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString);
//      DMBelShop.CDS_Busca.Close;
//
//      If sDocTR='' Then
//      Begin
//        // Busca Numero do Docto ===============================================
//        MySql:=' SELECT COALESCE(MAX(el.num_docto)+1 ,1) Nr_Docto'+
//               ' FROM ES_ESTOQUES_LOJAS el';
//        DMBelShop.CDS_BuscaRapida.Close;
//        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
//        DMBelShop.CDS_BuscaRapida.Open;
//        sDocTR:=DMBelShop.CDS_BuscaRapida.FieldByName('Nr_Docto').AsString;
//        DMBelShop.CDS_BuscaRapida.Close;
//      End; // If sDocTR='' Then
//
//      // Atualiza Numerador para Num_Seq da Seleção ============================
//      MySql:=' SELECT COALESCE(MAX(lo.num_seq)+1 ,1) Num_Seq'+
//             ' FROM ES_ESTOQUES_LOJAS lo'+
//             ' WHERE lo.cod_loja='+QuotedStr(mMemo.Lines[i])+
//             ' AND   lo.dta_movto='+QuotedStr(sgDtaLimTransf);
//      DMBelShop.CDS_Busca.Close;
//      DMBelShop.SDS_Busca.CommandText:=MySql;
//      DMBelShop.CDS_Busca.Open;
//
//      MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH '+DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString;
//      DMBelShop.SQLC.Execute(MySql,nil,nil);
//      DMBelShop.CDS_Busca.Close;
//
//      // Busca Produtos de Transferencia =========================================
//      MySql:=' SELECT'+
//             ' o.NUM_SEQ, '+
//             ' GEN_ID(GEN_ODIR,1) NEW_NUM_SEQ, '+
//             QuotedStr(sgDtaLimTransf)+' DTA_MOVTO,'+
//             ' COALESCE(o.num_documento,0) Doc_Origem, '+
//             sDocTR+' NUM_DOCTO,'+
//             ' o.obs_oc,'+
//             ' o.cod_empresa COD_LOJA,'+
//             ' o.cod_item COD_PRODUTO,'+
//             ' o.qtd_saldo QTD_ESTOQUE,'+
//             ' (o.qtd_dem_mes1+o.qtd_dem_mes2+o.qtd_dem_mes3+o.qtd_dem_mes4+'+
//             '  o.qtd_dem_mes5+o.qtd_dem_mes6+o.qtd_dem_mes7+o.qtd_dem_mes8) QTD_VENDAS,'+
//             ' o.cla_curva_abc IND_CURVA,'+
//             ' o.dias_estocagem DIAS_ESTOCAGEM,'+
//             ' o.qtd_dias_ano QTD_DIAS,'+
//             ' o.qtd_demanda_dia QTD_VENDA_DIA,'+
//             ' o.qtd_demanda_dia QTD_DEMANDA,'+
//             ' o.qtd_sugerida QTD_REPOSICAO,'+
//             ' o.num_oc_gerada NUM_TR_GERADA,'+
//             ' o.qtd_transf QTD_TRANSF_OC,'+
//             ' 0 QTD_TRANSF,'+
//             ' o.qtd_acomprar QTD_A_TRANSF,'+
//             ' ''000000'' NUM_PEDIDO,'+
//             ' ''SIM'' IND_TRANSF, '+
//             QuotedStr(Cod_Usuario)+' USU_ALTERA,'+
//             ' current_timestamp DTA_ALTERA,'+
//             ' ''SIM'' Compras'+
//
//             ' FROM OC_COMPRAR o'+
//             ' WHERE o.num_oc_gerada>20160300'+
//             ' AND   o.ind_transf_cd=''N'''+
//             ' AND   Cast(o.dta_oc_gerada As Date)<'+QuotedStr(sgDtaLimTransf)+
//             ' AND   o.cod_empresa='+QuotedStr(mMemo.Lines[i]);
//
//      MySql:=
//       MySql+' UNION'+
//
//             ' SELECT'+
//             ' l.NUM_SEQ, '+
//             ' GEN_ID(GEN_ODIR,1) NEW_NUM_SEQ, '+
//             QuotedStr(sgDtaLimTransf)+' DTA_MOVTO,'+
//             ' l.num_docto Doc_Origem, '+
//             sDocTR+' NUM_DOCTO,'+
//             ' l.OBS_DOCTO,'+
//             ' l.COD_LOJA,'+
//             ' l.COD_PRODUTO,'+
//             ' l.QTD_ESTOQUE,'+
//             ' l.QTD_VENDAS,'+
//             ' l.IND_CURVA,'+
//             ' l.DIAS_ESTOCAGEM,'+
//             ' l.QTD_DIAS,'+
//             ' l.QTD_VENDA_DIA,'+
//             ' l.QTD_DEMANDA,'+
//             ' l.QTD_REPOSICAO,'+
//             ' l.NUM_TR_GERADA,'+
//             ' l.QTD_TRANSF_OC,'+
//             ' l.QTD_TRANSF,'+
//             ' l.QTD_A_TRANSF,'+
//             ' l.NUM_PEDIDO,'+
//             ' l.IND_TRANSF, '+
//             QuotedStr(Cod_Usuario)+' USU_ALTERA,'+
//             ' current_timestamp DTA_ALTERA,'+
//             ' ''NAO'' Compras'+
//
//             ' FROM ES_ESTOQUES_LOJAS l'+
//             ' WHERE l.num_tr_gerada<>0'+
//             ' AND   l.qtd_a_transf>0'+
//             ' AND   l.ind_transf=''SIM'''+
//             ' AND   l.num_pedido=''000000'''+
//             ' AND   Cast(l.dta_movto As Date)<'+QuotedStr(sgDtaLimTransf)+
//             ' AND   l.cod_loja='+QuotedStr(mMemo.Lines[i]);
//      DMBelShop.CDS_Busca.Close;
//      DMBelShop.SDS_Busca.CommandText:=MySql;
//      DMBelShop.CDS_Busca.Open;
//
//      // Retorna Generator para 0 ==============================================
//      MySql:=' ALTER SEQUENCE GEN_ODIR RESTART WITH 0';
//      DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//      // Atualiza ES_ESTOQUE_LOJAS =============================================
//      FrmBelShop.MontaProgressBar(True, FrmCentralTrocas);
//      pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
//      pgProgBar.Position:=0;
//
//      DMBelShop.CDS_Busca.DisableControls;
//      While Not DMBelShop.CDS_Busca.Eof do
//      Begin
//        Application.ProcessMessages;
//
//        pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;
//
//        sgCodProduto:=Trim(DMBelShop.CDS_Busca.FieldByName('Cod_Produto').AsString);
//
//        //======================================================================
//        // Atualiza OC_COMPRAR =================================================
//        //======================================================================
//        If DMBelShop.CDS_Busca.FieldByName('Compras').AsString='SIM' Then
//        Begin
//          MySql:=' UPDATE OC_COMPRAR O'+
//                 ' SET o.ind_transf_cd='+QuotedStr('S')+
//                 ',    o.doc_transf_cd='+QuotedStr(sDocTR)+
//                 ' WHERE o.num_seq='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString)+
//                 ' AND   o.num_documento='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Doc_Origem').AsString)+
//                 ' AND   o.cod_empresa='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_loja').AsString)+
//                 ' AND   o.cod_item='+QuotedStr(sgCodProduto);
//          DMBelShop.SQLC.Execute(MySql,nil,nil);
//        End; // If DMBelShop.CDS_Busca.FieldByName('Doc_Origem').AsInteger<>0 Then
//
//        //======================================================================
//        // Atualiza ES_ESTOQUES_LOJAS =================================================
//        //======================================================================
//        If DMBelShop.CDS_Busca.FieldByName('Compras').AsString='NAO' Then
//        Begin
//          MySql:=' UPDATE ES_ESTOQUES_LOJAS l'+
//                 ' SET l.num_pedido=''999999'''+
//                 ' WHERE l.num_seq='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString)+
//                 ' AND   l.num_docto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Doc_Origem').AsString)+
//                 ' AND   l.cod_loja='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_loja').AsString)+
//                 ' AND   l.num_tr_gerada='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('NUM_TR_GERADA').AsString)+
//                 ' AND   l.ind_transf=''SIM'''+
//                 ' AND   l.cod_produto='+QuotedStr(sgCodProduto);
//          DMBelShop.SQLC.Execute(MySql,nil,nil);
//        End; // If DMBelShop.CDS_Busca.FieldByName('Doc_Origem').AsInteger<>0 Then
//
//        //======================================================================
//        // Verifica se Existe ES_ESTOQUES_CD ===================================
//        //======================================================================
//        MySql:=' SELECT cd.cod_produto'+
//               ' FROM ES_ESTOQUES_CD cd'+
//               ' WHERE cd.dta_movto='+QuotedStr(sgDtaLimTransf)+
//               ' AND   cd.cod_produto='+QuotedStr(sgCodProduto);
//        DMBelShop.CDS_BuscaRapida.Close;
//        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
//        DMBelShop.CDS_BuscaRapida.Open;
//
//        If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString)='' Then
//         Begin
//           DMBelShop.CDS_BuscaRapida.Close;
//
//           // Busca Endereco
//           MySql:=' SELECT'+
//                  ' e.zonaendereco end_zona,'+
//                  ' e.corredor end_corredor,'+
//                  ' e.prateleira end_prateleira,'+
//                  ' e.gaveta end_gaveta'+
//                  ' FROM ESTOQUE e'+
//                  ' WHERE e.codproduto='+QuotedStr(sgCodProduto)+
//                  ' AND   e.codfilial=''99''';
//           IBQ_MPMS.Close;
//           IBQ_MPMS.SQL.Clear;
//           IBQ_MPMS.SQL.Add(MySql);
//           IBQ_MPMS.Open;
//
//           sEnd_Zona      :='0';
//           sEnd_Corredor  :='000';
//           sEnd_Prateleira:='000';
//           sEnd_Gaveta    :='0000';
//
//           If Trim(IBQ_MPMS.FieldByName('end_zona').AsString)<>'' Then
//           Begin
//             sEnd_Zona      :=Trim(IBQ_MPMS.FieldByName('end_zona').AsString);
//             sEnd_Corredor  :=Trim(IBQ_MPMS.FieldByName('end_corredor').AsString);
//             sEnd_Prateleira:=Trim(IBQ_MPMS.FieldByName('end_prateleira').AsString);
//             sEnd_Gaveta    :=Trim(IBQ_MPMS.FieldByName('end_gaveta').AsString);
//           End; // If Trim(IBQ_MPMS.FieldByName('end_zona').AsString)<>'' Then
//           IBQ_MPMS.Close;
//
//           // Insere ES_ESTOQUES_CD
//           MySql:=' INSERT INTO ES_ESTOQUES_CD ('+
//                  ' DTA_MOVTO, COD_PRODUTO, QTD_ESTOQUE, QTD_SAIDAS, QTD_SALDO,'+
//                  ' END_ZONA, END_CORREDOR, END_PRATELEIRA, END_GAVETA)'+
//                  ' VALUES ('+
//                  QuotedStr(sgDtaLimTransf)+', '+ // DTA_MOVTO
//                  QuotedStr(sgCodProduto)+', '+ // COD_PRODUTO
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('Qtd_Estoque').AsString))+', '+ // QTD_ESTOQUE
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('Qtd_Transf_OC').AsString))+', '+ // QTD_SAIDAS
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('Qtd_Estoque').AsString))+', '+ // QTD_SALDO
//                  QuotedStr(sEnd_Zona)+', '+ // END_ZONA
//                  QuotedStr(sEnd_Corredor)+', '+ // END_CORREDOR
//                  QuotedStr(sEnd_Prateleira)+', '+ // END_PRATELEIRA
//                  QuotedStr(sEnd_Gaveta)+')'; // END_GAVETA
//         End
//        Else// If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString)='' Then
//         Begin
//           MySql:=' UPDATE ES_ESTOQUES_CD cd'+
//                  ' SET   cd.Qtd_Saidas=cd.Qtd_Saidas+'+DMBelShop.CDS_Busca.FieldByName('Qtd_Transf_OC').AsString+
//                  ' WHERE cd.dta_movto='+QuotedStr(sgDtaLimTransf)+
//                  ' AND   cd.cod_produto='+QuotedStr(sgCodProduto);
//         End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Produto').AsString)='' Then
//        DMBelShop.SQLC.Execute(MySql,nil,nil);
//        DMBelShop.CDS_BuscaRapida.Close;
//
//        //======================================================================
//        // Atualiza ES_ESTOQUES_LOJAS ==========================================
//        //======================================================================
//        MySql:=' SELECT FIRST 1 lo.num_docto, lo.qtd_a_transf'+
//               ' FROM ES_ESTOQUES_LOJAS lo'+
//               ' WHERE lo.Num_Docto='+QuotedStr(sDocTR)+
//               ' AND   lo.Cod_Loja='+QuotedStr(mMemo.Lines[i])+
//               ' AND   lo.Cod_Produto='+QuotedStr(sgCodProduto)+
//               ' AND   lo.Ind_Transf='+QuotedStr('SIM');
//        DMBelShop.CDS_Busca1.Close;
//        DMBelShop.SDS_Busca1.CommandText:=MySql;
//        DMBelShop.CDS_Busca1.Open;
//
//        If Trim(DMBelShop.CDS_Busca1.FieldByName('Num_Docto').AsString)='' Then
//         Begin
//           MySql:=' INSERT INTO ES_ESTOQUES_LOJAS ('+
//                  ' NUM_SEQ, DTA_MOVTO, NUM_DOCTO, COD_LOJA, COD_PRODUTO,'+
//                  ' QTD_ESTOQUE, QTD_VENDAS, IND_CURVA, DIAS_ESTOCAGEM,'+
//                  ' QTD_DIAS, QTD_VENDA_DIA, QTD_DEMANDA, QTD_REPOSICAO,'+
//                  ' NUM_TR_GERADA, QTD_TRANSF_OC, QTD_TRANSF, QTD_A_TRANSF,'+
//                  ' NUM_PEDIDO, IND_TRANSF, USU_ALTERA, DTA_ALTERA, OBS_DOCTO)'+
//
//                  ' VALUES ('+
//                  QuotedStr(DMBelShop.CDS_Busca.FieldByName('New_Num_Seq').AsString)+', '+ // NUM_SEQ
//                  QuotedStr(sgDtaLimTransf)+', '+ // DTA_MOVTO
//                  QuotedStr(sDocTR)+', '+ // NUM_DOCTO
//                  QuotedStr(mMemo.Lines[i])+', '+ // COD_LOJA
//                  QuotedStr(sgCodProduto)+', '+ // COD_PRODUTO
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('QTD_ESTOQUE').AsString))+', '+ // QTD_ESTOQUE
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('QTD_VENDAS').AsString))+', '+ // QTD_VENDAS
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('IND_CURVA').AsString))+', '+ // IND_CURVA
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('DIAS_ESTOCAGEM').AsString))+', '+ // DIAS_ESTOCAGEM
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('QTD_DIAS').AsString))+', '+ // QTD_DIAS
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('QTD_VENDA_DIA').AsString))+', '+ // QTD_VENDA_DIA
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('QTD_DEMANDA').AsString))+', '+ // QTD_DEMANDA
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('QTD_REPOSICAO').AsString))+', '+ // QTD_REPOSICAO
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('NUM_TR_GERADA').AsString))+', '+ // NUM_TR_GERADA
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('QTD_TRANSF_OC').AsString))+', '+ // QTD_TRANSF_OC
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('QTD_TRANSF').AsString))+', '+ // QTD_TRANSF
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('QTD_A_TRANSF').AsString))+', '+ // QTD_A_TRANSF
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('NUM_PEDIDO').AsString))+', '+ // NUM_PEDIDO
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('IND_TRANSF').AsString))+', '+ // IND_TRANSF
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('USU_ALTERA').AsString))+', '+ // USU_ALTERA
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('DTA_ALTERA').AsString))+', '+ // DTA_ALTERA
//                  QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('OBS_OC').AsString))+')'; // OBS_DOCTO
//         End
//        Else
//         Begin
//           If DMBelShop.CDS_Busca.FieldByName('QTD_TRANSF_OC').AsCurrency>DMBelShop.CDS_Busca1.FieldByName('qtd_a_transf').AsCurrency Then
//           Begin
//           MySql:=' UPDATE  ES_ESTOQUES_LOJAS lo'+
//                  ' SET lo.qtd_transf_oc='+DMBelShop.CDS_Busca.FieldByName('QTD_TRANSF_OC').AsString+
//                  ',    lo.qtd_transf=0'+
//                  ',    lo.qtd_a_transf='+DMBelShop.CDS_Busca.FieldByName('QTD_TRANSF_OC').AsString+
//                  ',    lo.num_tr_gerada='+QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('NUM_TR_GERADA').AsString))+
//                  ',    lo.obs_docto=lo.obs_docto || ascii_char(13) || '+QuotedStr(DMBelShop.CDS_Busca.FieldByName('OBS_OC').AsString)+
//                  ' WHERE lo.Num_Docto='+QuotedStr(sDocTR)+
//                  ' AND   lo.Cod_Loja='+QuotedStr(mMemo.Lines[i])+
//                  ' AND   lo.Ind_Transf='+QuotedStr('SIM')+
//                  ' AND   lo.Cod_Produto='+QuotedStr(sgCodProduto);
//           End; // If DMBelShop.CDS_Busca.FieldByName('QTD_TRANSF_OC').AsCurrency>DMBelShop.CDS_Busca1.FieldByName('qtd_a_transf').AsCurrency Then
//         End; // If Trim(DMBelShop.CDS_Busca1.FieldByName('Num_Docto').AsString)='' Then
//        DMBelShop.CDS_Busca1.Close;
//        DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//        DMBelShop.CDS_Busca.Next;
//      End; // While Not DMBelShop.CDS_Busca.Eof do
//      DMBelShop.CDS_Busca.EnableControls;
//      DMBelShop.CDS_Busca.Close;
//      FrmBelShop.MontaProgressBar(False, FrmCentralTrocas);
//
//      // Acerta Num_Seq ========================================================
//      MySql:=' SELECT lo.num_seq, lo.cod_produto, TRIM(pr.apresentacao) nome_produto,'+
//             ' COALESCE(cd.end_zona,''0'')||''.''||COALESCE(cd.end_corredor,''000'')||''.''||'+
//             ' COALESCE(cd.end_prateleira,''000'')||''.''||COALESCE(cd.end_gaveta,''0000'') Enderecamento'+
//             ' FROM ES_ESTOQUES_LOJAS lo'+
//             '      LEFT JOIN PRODUTO        pr  ON pr.codproduto=lo.cod_produto'+
//             '      LEFT JOIN ES_ESTOQUES_CD cd  ON cd.dta_movto=lo.dta_movto'+
//             '                                  AND cd.cod_produto=lo.cod_produto'+
//             ' WHERE lo.dta_movto='+QuotedStr(sgDtaLimTransf)+
//             ' AND   lo.num_docto='+QuotedStr(sDocTR)+
//             ' AND   lo.cod_loja='+QuotedStr(mMemo.Lines[i])+
//             ' ORDER BY 4,3';
//      DMBelShop.CDS_Busca.Close;
//      DMBelShop.SDS_Busca.CommandText:=MySql;
//      DMBelShop.CDS_Busca.Open;
//
//      ii:=0;
//      While Not DMBelShop.CDS_Busca.Eof do
//      Begin
//        Inc(ii);
//
//        MySql:=' UPDATE ES_ESTOQUES_LOJAS lo'+
//               ' SET lo.num_seq='+IntToStr(ii)+
//               ' WHERE lo.dta_movto='+QuotedStr(sgDtaLimTransf)+
//               ' AND   lo.num_docto='+QuotedStr(sDocTR)+
//               ' AND   lo.cod_loja='+QuotedStr(mMemo.Lines[i])+
//               ' AND   lo.num_seq='+DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString+
//               ' AND   lo.cod_produto='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('cod_produto').AsString);
//        DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//        DMBelShop.CDS_Busca.Next;
//      End; // While Not DMBelShop.CDS_Busca.Eof do
//      DMBelShop.CDS_Busca.Close;
//
//    End; // For i:=0 to mMemo.Lines.Count-1 do
//    FrmBelShop.MontaProgressBar(False, FrmCentralTrocas);
//                                                                        
//    // Atualiza Transacao ======================================================
//    DMBelShop.SQLC.Commit(TD);
//
//    DateSeparator:='/';
//    DecimalSeparator:=',';
//
//    OdirPanApres.Visible:=False;
//    Screen.Cursor:=crDefault;
//
//  Except
//    on e : Exception do
//    Begin
//      // Abandona Transacao ====================================================
//      DMBelShop.SQLC.Rollback(TD);
//      Result:=False;
//
//      DateSeparator:='/';
//      DecimalSeparator:=',';
//
//      Screen.Cursor:=crDefault;
//      OdirPanApres.Visible:=False;
//      FrmBelShop.MontaProgressBar(False, FrmCentralTrocas);
//
//      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
//    End; // on e : Exception do
//  End; // Try
//
//  FreeAndNil(mMemo);
//
//End; // Localizando Transferencias Setor de Compras (Dia Anterior) >>>>>>>>>>>>>

// Verifica se Existe de Itens >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmCentralTrocas.VerificaExistenciaItens(bComQtd: Boolean = False): Boolean;
Var
  MySql: String;
Begin
  Result:=True;

  // Verifica se Existem Itens =================================================
  MySql:=' SELECT first 1 e.cod_loja'+
         ' FROM ES_ESTOQUES_LOJAS e, ES_ESTOQUES_CD cd, PRODUTO pr'+
         ' WHERE e.cod_produto=cd.cod_produto'+
         ' AND   e.dta_movto=cd.dta_movto'+
         ' AND   e.cod_produto=pr.codproduto'+
         ' AND   e.dta_movto='+QuotedStr(f_Troca('-','.',(f_Troca('/','.',DateToStr(DtaEdt_ReposLojas.Date)))))+
         ' AND   e.num_pedido='+QuotedStr('000000')+
         ' AND   e.ind_transf='+QuotedStr('SIM')+
         ' AND   e.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
         ' AND   e.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString);

         If sgTipoPrioridade<>'Todas as Prioridades' Then
          MySql:=
           MySql+' AND   e.ind_prioridade in ('+sgTipoPrioridade+')';

         If bComQtd Then
          MySql:=
           MySql+' AND   e.qtd_a_transf>0';

         If (sgCorredores<>'') and (Not bgTodosCorredores) Then
          MySql:=
           MySql+' AND cd.end_zona||''.''||cd.end_corredor in ('+sgCorredores+')';

         If Trim(EdtReposLojasCodForn.Text)<>'' Then
          MySql:=
           MySql+' AND pr.principalfor='+QuotedStr(Trim(EdtReposLojasCodForn.Text));

  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)='' Then
  Begin
    Result:=False;
  End;
  DMBelShop.CDS_BuscaRapida.Close;

End; // Verifica se Existe Produto não Transferidco para o SIDICOM >>>>>>>>>>>>

// Gera Pedido no SIDICOM CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmCentralTrocas.GeraPedidoSidicomCD: Boolean;
Var
  sCodLoja, sCodComprv, sNumPedidoSid: String;
  MySql: String;
  b: Boolean;

  MySqlEst, // Insert Estoque no CD
  MySqlPedI, MySqlIteI, // Inserts Pedido e Itens
  MySqlPedV, MySqlIteV // Values Pedido e Itens
  : String;

  cAcresVlrBaseICMS, cAcresVlrBaseST, cAcresVlrBaseIPI, cAcresVlrBasePisCofins: Currency;

  // Pedido ---------------------------------------------------------
  sHoraPed,
  ecCodCliente, ecCod_UF, // Dados Cliente
  sCodFiscal, ctNaoSomaEstoque, // Dados Comprovante
  fiCalculaICMSSN, fiCalculaIPISN, fiCalculaSUBSTSN, fiCalculaPISCOFINSSN, // Dados Fiscais
  tfSomaFrete_TotalNota_SN // Dados Frete
  : String;

  // Itens do Pedido ------------------------------------------------
  iSeqItem: Integer;
  cValor,
  cVlrBasePisCofins, cVal_Ret_Pis, cVal_Ret_Cofins, cVal_Pis, cVal_Cofins,
  cVlrBruto, cVlrIPI, cVlrST, cVlrTotal: Currency;

  cldescontaicmspro_sn,
  prUnidadeEstoque, prCodIpiVenda, prIss, prCodPisCofins_Venda, prCodAgrupaCarga, // Dados Produto
  lpPrecoCompra, // Dados Lista de Preços

  ipAliquota, ipIpiPercOuValor, ipOperacaoCreDeb, ipSomaFreteBaseIpi,
  ipSomaDespesaBaseIpi, ipSitTrib_Ipi_Saida,   // Dados IPI

  icAliquota, icReducao, icSubstValPer, icSubstMargem, icSubstAliquota,
  icCodIcm, icSitTributaria, icSubstituicao, icOperacaoCreDeb, icSomaIpiBase,
  icSomaFreteBase, icSomaDespesaBase, icSomaIpiBaseSubst, icSomaFreteBaseST,
  icSomaDespesaBaseST, icAliqIcmOrigem, icPerc_Diferido, // Daos ICMS

  esCustoMedio, // Dados Custo Medio

  pcAliqPis, pcAliqCofins, pcSomaStBasePisCofins, pcSitTrib_PIS_Saida,
  pcSitTrib_COFINS_Saida, pcAliq_Ret_PIS, pcAliq_Ret_COFINS,
  pcPisCofPercOuValor // Dados PIS / COFINS
  : String;


  // Totalizadores do Pedido ----------------------------------------
  iTotItens: Integer; //	Contagem de Produtos no Pedido

  cTotBruto, //	Total das Quantidade Atendidas * Preco
  cTotIPI, //	Soma dos Valores de IPI
  cTotSubstituicao, //	Soma dos Valores de Substituição
  cTotNota, // Soma dos Totais dos Produtos VALTOTAL
  cTotISS, //	Soma dos Valores de ISS
  cTotBasePISCOFINS, // Soma dos Valores das Bases de Calculo PIS e COFINS
  cTotPIS, //	Soma dos Valores de PIS
  cTotCOFINS, // Soma dos Valores de COFINS
  cTot_Ret_PIS, // Soma dos Valores de Retenção do PIS
  cTot_Ret_COFINS, //	Soma dos Valores de Retenção do COFINS
  cTotICMS_Bruto, // Igual a TOTICM
  cTotICM // Soma dos Valores de ICM
  :Currency;

  //============================================================================
  // Gera Controle de Estoque no CD ============================================
  //============================================================================
  Procedure GeraEstoqueCD;
  Begin
    MySqlEst:=' INSERT INTO ESTOQUE (CODFILIAL, CODPRODUTO, CORREDOR, PRATELEIRA,'+
              ' GAVETA, SALDOATUAL, PEDIDOPENDENTE, COMPRAPENDENTE, DATACOMPRA,'+
              ' DATAVENDA, CUSMEDVALOR, CUSMEDITENS, CUSTOMEDIO, LASTPRECOCOMPRA,'+
              ' ESTOQUEIDEAL, ROTACAO, ROTACAOCONTA, ROTACAOATUAL, ROTACAO1, ROTACAO2,'+
              ' ROTACAO3, ROTACAO4, ROTACAO5, ROTACAO6, DM_DEMANDAREAL, DM_DEMANDA,'+
              ' DM_FALTA, DM_DIASDEESTOQUE, LASTCUSTOMEDIO, ZONAENDERECO, PECASSALDOATUAL,'+
              ' PECASPEDIDOPENDENTE, PECASCOMPRAPENDENTE, LASTPRECOCOMPRA_SEMIMP,'+
              ' DATAALTERACADASTRO, DATAALTERAESTOQUE, DATAALTERAESTOQUE_PED, ESTOQUEMAXIMO)'+

              ' VALUES('+
              QuotedStr(sCodLoja)+', '+ // CODFILIAL
              QuotedStr(DMCentralTrocas.CDS_ReposicaoTransfCOD_PRODUTO.AsString)+', '+ // CODPRODUTO
              QuotedStr('000')+', '+ // CORREDOR
              QuotedStr('000')+', '+ // PRATELEIRA
              QuotedStr('0000')+', '+ // GAVETA
              '0.0000, '+ // SALDOATUAL
              '0.0000, '+ // PEDIDOPENDENTE
              '0.0000, '+ // COMPRAPENDENTE
              'current_date, '+ // DATACOMPRA
              'current_date, '+ // DATAVENDA
              '0.00, '+ // CUSMEDVALOR
              '0.00, '+ // CUSMEDITENS
              '0.0000, '+ // CUSTOMEDIO
              'null, '+ // LASTPRECOCOMPRA
              '3.0000, '+ // ESTOQUEIDEAL
              '30, '+ // ROTACAO
              '1, '+ // ROTACAOCONTA
              '0.0000, '+ // ROTACAOATUAL
              '0.0000, '+ // ROTACAO1
              '0.0000, '+ // ROTACAO2
              '0.0000, '+ // ROTACAO3
              '0.0000, '+ // ROTACAO4
              '0.0000, '+ // ROTACAO5
              '0.0000, '+ // ROTACAO6
              '0.0000, '+ // DM_DEMANDAREAL
              '1.0000, '+ // DM_DEMANDA
              '1.0000, '+ // DM_FALTA
              '0, '+ // DM_DIASDEESTOQUE
              '0.0000, '+ // LASTCUSTOMEDIO
              '0, '+ // ZONAENDERECO
              '0, '+ // PECASSALDOATUAL
              '0, '+ // PECASPEDIDOPENDENTE
              '0, '+ // PECASCOMPRAPENDENTE
              'null, '+ // LASTPRECOCOMPRA_SEMIMP
              'current_timestamp, '+ // DATAALTERACADASTRO
              'null, '+ // DATAALTERAESTOQUE
              'null, '+ // DATAALTERAESTOQUE_PED
              '999999.0000 '+ // ESTOQUEMAXIMO
              ')';
    IBQ_MPMS.Close;
    IBQ_MPMS.SQL.Clear;
    IBQ_MPMS.SQL.Add(MySqlEst);
    IBQ_MPMS.ExecSQL;
  End;

  //============================================================================
  // Gera Pedido - INICIO ======================================================
  //============================================================================
  Procedure GeraPedidoSIDICOM;
  Begin
    MySqlPedV:=' VALUES ('+
               QuotedStr(sNumPedidoSid)+', '+ // CODPEDIDO
               QuotedStr(ecCodCliente)+', '+  // CODCLIENTE
               QuotedStr('99')+', '+  // CODFILIAL
               QuotedStr('1')+', '+  // SITUACAO
               QuotedStr('')+', '+  // SITUACAOAUX
               QuotedStr('N')+', '+  // PEDIDOEMUSO
               QuotedStr('')+', '+  // PEDIDOBLOQUEADO
               QuotedStr('N')+', '+  // SEPARAESTOQUE
               QuotedStr('')+', '+  // CODLOTE
               QuotedStr('')+', '+  // CODVENDEDOR
               QuotedStr('')+', '+  // CODVENDEDOR2
               QuotedStr('')+', '+  // CODVENDEDOR3
               QuotedStr('')+', '+  // CODTRANSPORTE
               QuotedStr(sgDtaI)+', '+  // DATAPEDIDO
               QuotedStr(sHoraPed)+', '+  // HORAPEDIDO
               QuotedStr(sgDtaI)+', '+  // DATAEMISSAO
               QuotedStr('')+', '+  // HORAEMISSAO
               QuotedStr(sgDtaI)+', '+  // DATAENTREGA
               QuotedStr('')+', '+  // HORAENTREGA
               QuotedStr('00')+', '+  // CODDIGITADOR
               QuotedStr('001')+', '+  // CODDPTO
               QuotedStr('')+', '+  // REPREFORNECEDOR
               QuotedStr('')+', '+  // REPRECLIENTE
               QuotedStr('')+', '+  // REPRENUMPEDIDO
               QuotedStr('')+', '+  // CONTATOPEDIDO
               QuotedStr('001')+', '+  // CODCONDICAO
               QuotedStr('000')+', '+  // CODBANCO
               QuotedStr(sCodFiscal)+', '+  // CODFISCAL
               QuotedStr('')+', '+  // ESPECIALPEDIDO
               QuotedStr('')+', '+  // ESPECIALCOMPROV
               QuotedStr('')+', '+  // ESPECIALCONDICAO
               QuotedStr('')+', '+  // PENDENTESITUACAO
               QuotedStr('')+', '+  // PENDENTEPONTEIRO
               QuotedStr('')+', '+  // CODCENTROCUSTO
               QuotedStr(fiCalculaICMSSN)+', '+  // ISENTOICM
               QuotedStr(fiCalculaIPISN)+', '+  // ISENTOIPI
               QuotedStr(fiCalculaSUBSTSN)+', '+  // ISENTOSUBST
               QuotedStr('0')+', '+  // TRANFRETE
               QuotedStr('')+', '+  // TRANVOLUME
               QuotedStr('0')+', '+  // TRANQUANTIDADE
               QuotedStr('0')+', '+  // TRANPESOBRUTO
               QuotedStr('0')+', '+  // TRANPESOLIQUIDO
               QuotedStr('0')+', '+  // TRANCUBAGEM
               QuotedStr(IntToStr(iTotItens))+', '+  // TOTITENS - Contagem de Produtos no Pedido
               QuotedStr(IntToStr(iTotItens))+', '+  // TOTATENDIDO - Contagem de Produtos no Pedido
               QuotedStr('0')+', '+  // TOTPARCIAL
               QuotedStr('0')+', '+  // TOTNAOATENDIDO
               QuotedStr(CurrToStr(cTotBruto))+', '+  // TOTBRUTO -  Total das Quantidade Atendidas * Preco
               QuotedStr('0')+', '+  // TOTDESCITEM
               QuotedStr(CurrToStr(cTotIPI))+', '+  // TOTIPI - Soma dos Valores de IPI
               QuotedStr(CurrToStr(cTotSubstituicao))+', '+  // SUBSTITUICAO - Soma dos Valores de Substituição
               QuotedStr('0')+', '+  // TOTFRETE
               QuotedStr('0')+', '+  // TOTDESPESAS
               QuotedStr(CurrToStr(cTotNota))+', '+  // TOTNOTA - Soma dos Totais dos Produtos
               QuotedStr(CurrToStr(cTotISS))+', '+  // TOTISS - Soma dos Valores de ISS
               QuotedStr('')+', '+  // OBSERVACAO
               QuotedStr(sgDtaF)+', '+  // VALIDADEPEDIDO
               QuotedStr('')+', '+  // OBSINTERNA
               QuotedStr('J')+', '+  // CONTRIBUINTE ='J'uridica
               QuotedStr('0')+', '+  // CONFERENCIA
               QuotedStr('0')+', '+  // TOTVALORPAGO
               QuotedStr('')+', '+  // CONVENIADO
               QuotedStr('0')+', '+  // ENDERECOCONVENIO
               QuotedStr(sCodComprv)+', '+  // CODCOMPROVANTEPED
               QuotedStr('')+', '+  // ORCAMENTOSN
               QuotedStr('N')+', '+  // MOSTRASUBUN_SN
               QuotedStr('')+', '+  // PLACA
               QuotedStr('')+', '+  // PLACAESTADO
               QuotedStr(CurrToStr(cTotBasePISCOFINS))+', '+  // TOTBASEPISCOFINS - Soma dos Valores das Bases de Calculo PIS e COFINS
               QuotedStr(CurrToStr(cTotPIS))+', '+  // TOTPIS - Soma dos Valores de PIS
               QuotedStr(CurrToStr(cTotCOFINS))+', '+  // TOTCOFINS - Soma dos Valores de COFINS
               QuotedStr('0')+', '+  // ENTREGASEQUENCIA
               QuotedStr('N')+', '+  // RSICMSN
               QuotedStr('0')+', '+  // TOTDESCONTORS
               QuotedStr('')+', '+  // CODROTEIROMOVIM
               QuotedStr('0')+', '+  // SIMPLESESTADUAL
               QuotedStr(fiCalculaPISCOFINSSN)+', '+  // ISENTOPISCOFINS
               QuotedStr('0')+', '+  // TRANVOLUMESPESO
               QuotedStr('N')+', '+  // PEDIDOFOIPESADOSN
               QuotedStr('')+', '+  // CODPEDIDOORIGEM
               QuotedStr('0')+', '+  // ECOMMERCE_TIPO_PED
               QuotedStr('')+', '+  // UFEMBARQ
               QuotedStr('')+', '+  // LOCEMBARQ
               QuotedStr('0')+', '+  // DESP_VALDESPESASOUTROS
               QuotedStr('0')+', '+  // DESP_VALCUSTOBOLETOBANCO
               QuotedStr('0')+', '+  // DESP_PERACRECIMOCONDPGTO
               QuotedStr('0')+', '+  // DESP_VALACRECIMOCONDPGTO
               QuotedStr('0')+', '+  // PERDESCONTOCONDPGTO
               QuotedStr('')+', '+  // CODVENDEDOR4
               QuotedStr('')+', '+  // CODVENDEDOR5
               QuotedStr('0')+', '+  // TOTDESCONTOSUFRAMA
               QuotedStr('N')+', '+  // DESCONTAICMSPRO_SN
               QuotedStr('')+', '+  // CODFILIALORIGEM
               QuotedStr(tfSomaFrete_TotalNota_SN)+', '+  // SOMOU_FRETE_SN
               QuotedStr('0')+', '+  // TRANPESOCUBADO
               QuotedStr('-1')+', '+  // TRANMODAL_FRETE
               QuotedStr(CurrToStr(cTot_Ret_PIS))+', '+  // TOT_RET_PIS - Soma dos Valores de Retenção do PIS
               QuotedStr(CurrToStr(cTot_Ret_COFINS))+', '+  // TOT_RET_COFINS - Soma dos Valores de Retenção do COFINS
               QuotedStr('')+', '+  // CODPEDIDO_NAOATEND - Sempre NULO
               QuotedStr('1')+', '+  // INDPRES
               QuotedStr('0')+', '+  // CONSUMIDOR_FINAL
               QuotedStr('N')+', '+  // NFCE_SN
               QuotedStr('0')+', '+  // TOTICMS_DIFERIDO
               QuotedStr(CurrToStr(cTotICMS_Bruto))+', '+  // TOTICMS_BRUTO - Igual a cTOTICM
               QuotedStr('0')+', '+  // TOTBASEICMS_DESONERADO
               QuotedStr('0')+', '+  // TOTICMS_DESONERADO
               QuotedStr('0')+', '+  // TOTBASEISS
               QuotedStr('0')+', '+  // TOTDESC_LOTE
               QuotedStr('0')+', '+  // TOTICM_UFDEST
               QuotedStr('0')+', '+  // TOTICM_INTERNO
               QuotedStr('0')+')';   // TOTICM_FCP

    //==================================================================================
    // Campo Sem Informação
    //==================================================================================
    // OBSINTERNA                 BLOB SUB_TYPE 1 SEGMENT SIZE 100,

    //==================================================================================
    // Campos COMPUTED BY:
    //==================================================================================
    // TOTICM COMPUTED BY (COALESCE(TOTICMS_BRUTO, 0) - COALESCE(TOTICMS_DIFERIDO, 0))
    // COMP_TOTNOTA_SEM_DESCLOTE  COMPUTED BY (TOTNOTA + TOTDESC_LOTE)
    //==================================================================================
    IBQ_MPMS.Close;
    IBQ_MPMS.SQL.Clear;
    IBQ_MPMS.SQL.Add(MySqlPedI+MySqlPedV);
    IBQ_MPMS.ExecSQL;

    // Guarda Numero do Pedido =================================================
    If iSeqItem=EdtReposLojasQtdItensPed.AsInteger Then
    Begin
      // Inicializa Variaveis para o Próximo Pedido ============================
      cTotBruto:=0; //	Total das Quantidade Atendidas * Preco
      cTotIPI:=0; //	Soma dos Valores de IPI
      cTotSubstituicao:=0; //	Soma dos Valores de Substituição
      cTotNota:=0; // Soma dos Totais dos Produtos VALTOTAL
      cTotISS:=0; //	Soma dos Valores de ISS
      cTotBasePISCOFINS:=0; // Soma dos Valores das Bases de Calculo PIS e COFINS
      cTotPIS:=0; //	Soma dos Valores de PIS
      cTotCOFINS:=0; // Soma dos Valores de COFINS
      cTot_Ret_PIS:=0; // Soma dos Valores de Retenção do PIS
      cTot_Ret_COFINS:=0; //	Soma dos Valores de Retenção do COFINS
      cTotICMS_Bruto:=0; // Igual a TOTICM
      cTotICM:=0; // Soma dos Valores de ICM

      cAcresVlrBaseICMS:=0;
      cAcresVlrBaseST:=0;
      cAcresVlrBaseIPI:=0;
      cAcresVlrBasePisCofins:=0;

      iSeqItem:=0;
      iTotItens:=0;
    End; // If iSeqItem=EdtReposLojasQtdItensPed.AsInteger Then

  End; // Procedure GeraPedidoSIDICOM;
  //============================================================================
  // Gera Pedido - FIM =========================================================
  //============================================================================

Begin

  Result:=False;

  Screen.Cursor:=crAppStart;
  OdirPanApres.Caption:='AGUARDE !! Gerando Pedido no SIDICOM - CD...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Numero do Pedido ==========================================================
  If Not BuscaNumeradoLoja('01', 'S', '99', sNumPedidoSid) Then
  Begin
    msg(sgMensagem,'A');
    Exit;
  End;

  Try
    ConexaoEmpIndividual('IBDB_MPMS', 'IBT_MPMS', 'A');

    // Abre Transacao ----------------------------------------------
    b:=False;
    While Not b do
    Begin
      b:=IBTransacao('S', 'IBT_MPMS');
    End; // While Not b do

    DateSeparator:='.';
    DecimalSeparator:='.';

    FrmBelShop.MontaProgressBar(True, FrmCentralTrocas);
    pgProgBar.Properties.Max:=DMCentralTrocas.CDS_ReposicaoTransf.RecordCount;
    pgProgBar.Position:=0;

    sCodLoja:=DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString;

    sCodComprv:='020';
    If Pos(sCodLoja, '08')<>0 Then
     sCodComprv:='009';

    // Monta Sqls para Insert Pedido ===========================================
    MySqlPedI:=' INSERT INTO PEDIDO (CODPEDIDO, CODCLIENTE, CODFILIAL, SITUACAO,'+
               ' SITUACAOAUX, PEDIDOEMUSO, PEDIDOBLOQUEADO, SEPARAESTOQUE, CODLOTE,'+
               ' CODVENDEDOR, CODVENDEDOR2, CODVENDEDOR3, CODTRANSPORTE, DATAPEDIDO,'+
               ' HORAPEDIDO, DATAEMISSAO, HORAEMISSAO, DATAENTREGA, HORAENTREGA,'+
               ' CODDIGITADOR, CODDPTO, REPREFORNECEDOR, REPRECLIENTE, REPRENUMPEDIDO,'+
               ' CONTATOPEDIDO, CODCONDICAO, CODBANCO, CODFISCAL, ESPECIALPEDIDO,'+
               ' ESPECIALCOMPROV, ESPECIALCONDICAO, PENDENTESITUACAO, PENDENTEPONTEIRO,'+
               ' CODCENTROCUSTO, ISENTOICM, ISENTOIPI, ISENTOSUBST, TRANFRETE,'+
               ' TRANVOLUME, TRANQUANTIDADE, TRANPESOBRUTO, TRANPESOLIQUIDO,'+
               ' TRANCUBAGEM, TOTITENS, TOTATENDIDO, TOTPARCIAL, TOTNAOATENDIDO,'+
               ' TOTBRUTO, TOTDESCITEM, TOTIPI, SUBSTITUICAO, TOTFRETE, TOTDESPESAS,'+
               ' TOTNOTA, TOTISS, OBSERVACAO, VALIDADEPEDIDO, OBSINTERNA, CONTRIBUINTE,'+
               ' CONFERENCIA, TOTVALORPAGO, CONVENIADO, ENDERECOCONVENIO,'+
               ' CODCOMPROVANTEPED, ORCAMENTOSN, MOSTRASUBUN_SN, PLACA, PLACAESTADO,'+
               ' TOTBASEPISCOFINS, TOTPIS, TOTCOFINS, ENTREGASEQUENCIA, RSICMSN,'+
               ' TOTDESCONTORS, CODROTEIROMOVIM, SIMPLESESTADUAL, ISENTOPISCOFINS,'+
               ' TRANVOLUMESPESO, PEDIDOFOIPESADOSN, CODPEDIDOORIGEM,'+
               ' ECOMMERCE_TIPO_PED, UFEMBARQ, LOCEMBARQ, DESP_VALDESPESASOUTROS,'+
               ' DESP_VALCUSTOBOLETOBANCO, DESP_PERACRECIMOCONDPGTO,'+
               ' DESP_VALACRECIMOCONDPGTO, PERDESCONTOCONDPGTO, CODVENDEDOR4,'+
               ' CODVENDEDOR5, TOTDESCONTOSUFRAMA, DESCONTAICMSPRO_SN, CODFILIALORIGEM,'+
               ' SOMOU_FRETE_SN, TRANPESOCUBADO, TRANMODAL_FRETE, TOT_RET_PIS,'+
               ' TOT_RET_COFINS, CODPEDIDO_NAOATEND, INDPRES, CONSUMIDOR_FINAL, NFCE_SN,'+
               ' TOTICMS_DIFERIDO, TOTICMS_BRUTO, TOTBASEICMS_DESONERADO,'+
               ' TOTICMS_DESONERADO, TOTBASEISS, TOTDESC_LOTE, TOTICM_UFDEST,'+
               ' TOTICM_INTERNO, TOTICM_FCP)';

               //===============================
               // Campos Computer By:
               //===============================
               // - TOTICM
               // - COMP_TOTNOTA_SEM_DESCLOTE
               //===============================

    // Monta Sqls para Insert PedidoIt =========================================
    MySqlIteI:=' INSERT INTO PEDIDOIT (CHAVEPEDIDO, CODPEDIDO, CODPRODUTO, SOMOUESTOQUE,'+
               ' UNIDADEESTOQUE, QUANTPEDIDA, QUANTATENDIDA, QUANTPENDENTE, PRECO,'+
               ' CODLISTA, DESCONTO1, DESCONTO2, DESCONTO3, DESCONTO4, DESCONTOCALC,'+
               ' VALDESCITEM, VALBRUTO, ALIQISS, VALISS,'+
               ' VALFRETE, SOMAFRETEBASEIPI, SOMAFRETEBASEST, SOMAFRETEBASEICM,'+
               ' VALDESPESAS, SOMADESPESABASEIPI, SOMADESPESABASEST, SOMADESPESABASEICM,'+
               ' VALDESCONTORS, ALIQREPASSE, VALREPASSE,'+
               ' ALIQIPI, IPIPERCOUVALOR, VALBASEIPI, VALISENTOIPI, OPERACAOCREDEBIPI,'+
               ' VALIPI, SOMAIPIBASEICM, SOMAIPIBASESUBST, CST_IPI,'+
               ' SUBSTALIQ, SUBSTVALPER, SUBSTMARGEM, SUBSTDESCONTO, SOMASTBASEPISCOFINS,'+
               ' SUBSTITUICAOSN, VALBASESUBST, VALSUBSTITUICAO,'+
               ' VALTOTAL, VALOUTROSIPI,'+
               ' ALIQICM, ALIQICMREDUCAO, ALIQICMORIGEM, VALISENTOICM, VALOUTROSICM,'+
               ' VALICMS_DIFERIDO, VALICMS_BRUTO, VALBASEICMS_DESONERADO,'+
               ' VALICMS_DESONERADO, MOTDESICMS, CST_ICMS, OPERACAOCREDEBICM,'+
               ' CODICMPED, VALBASEICM, VALREDUCAOICM,'+
               ' ALIQPIS, ALIQCOFINS, ALIQ_RET_PIS, ALIQ_RET_COFINS, PERC_DIFERIDO,'+
               ' CST_PIS, CST_COFINS, PISCOFPERCOUVALOR, VALBASEPISCOFINS,'+
               ' VAL_RET_PIS, VAL_RET_COFINS, VALPIS, VALCOFINS,'+
               ' COMISSAO1ALTERA, COMISSAO2ALTERA, COMISSAO3ALTERA, COMISSAO1PERC,'+
               ' COMISSAO2PERC, COMISSAO3PERC, DATAENTREGA,'+
               ' ORDEMCOMPRA, PRECOORIGEM, CODFISCALPRO, SEQUENCIADOPRODUTO,'+
               ' MOMENTOCUSTOMEDIO, MOMENTOPRECOBRUTO, MOMENTOPRECOLIQUIDO,'+
               ' FOIPESADOSN, VALPECAS,'+
               ' PRECOMAXCONSUMIDOR, CODKIT, CODAGRUPACARGA,'+
               ' COMISSAO4ALTERA, COMISSAO5ALTERA, COMISSAO4PERC, COMISSAO5PERC,'+
               ' VALDESCONTOSUFRAMA, USOU_MULTIPLO_SN, VALBASEISS, IPI_COD_ENQ,'+
               ' DESCONTO_LOTE, VALDESC_LOTE, USA_DESC_FAIXA_NA_COMISSAO_SN,'+
               ' REGRA_DESC_FAIXA)';
               //===============================
               // Campos Computer By:
               //===============================
               // - VALICM
               // - COMP_VALTOTAL_SEM_DESCLOTE,
               //===============================

    //==========================================================================
    // Busca Dados do Pedido - INICIO ==========================================
    //==========================================================================
    // sgDtaI, = Data do Pedido --------------------------------------
    // sgDtaF = Data da Validade do Pedido -------------------------------------
    sgDtaI:=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
    sgDtaF:=DateToStr(StrToDate(sgDtaI)+7);
    sHoraPed:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

    // Dados do Cliente ---------------------------------------------
    MySql:=' SELECT LPAD(ec.cod_emp,6,0) CodCliente, COALESCE(Trim(ec.Cod_UF), ''RS'') Cod_UF'+
           ' FROM EMP_CONEXOES ec'+
           ' WHERE ec.cod_filial='+QuotedStr(sCodLoja);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    ecCodCliente:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('CodCliente').AsString);
    ecCod_UF    :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_UF').AsString);

    DMBelShop.CDS_BuscaRapida.Close;

    // Dados Comprovante --------------------------------------------
    MySql:=' SELECT Trim(ct.FiscalEstado) FiscalEstado,'+
           '        Trim(ct.FiscalFora) FiscalFora,'+
           '        Trim(ct.NaoSomaEstoque) NaoSomaEstoque'+
           ' FROM COMPRVTP ct'+
           ' WHERE ct.chavecomprovante='+QuotedStr(sCodComprv+'C');
    IBQ_MPMS.Close;
    IBQ_MPMS.SQL.Clear;
    IBQ_MPMS.SQL.Add(MySql);
    IBQ_MPMS.Open;

    If ecCod_UF='RS' Then
     sCodFiscal:=IBQ_MPMS.FieldByName('FiscalEstado').AsString
    Else
     sCodFiscal:=IBQ_MPMS.FieldByName('FiscalFora').AsString;

    ctNaoSomaEstoque:=IBQ_MPMS.FieldByName('NaoSomaEstoque').AsString;

    IBQ_MPMS.Close;

    // Dados Fiscais ------------------------------------------------
    MySql:=' SELECT'+
           ' CASE Trim(fi.CalculaIcmsSN)'+
           '    WHEN ''N'' THEN ''S'''+
           '    ELSE ''N'''+
           ' END CalculaIcmsSN,'+

           ' CASE Trim(fi.CalculaIpiSN)'+
           '    WHEN ''N'' THEN ''S'''+
           '    ELSE ''N'''+
           ' END CalculaIpiSN,'+

           ' CASE fi.CalculaSubstSN'+
           '    WHEN ''N'' THEN ''S'''+
           '    ELSE ''N'''+
           ' END CalculaSubstSN,'+

           ' CASE fi.CalculaPisCofinsSN'+
           '    WHEN ''N'' THEN ''S'''+
           '    ELSE ''N'''+
           ' END CalculaPisCofinsSN'+

           ' FROM FISCAL fi'+
           ' WHERE fi.codfiscal='+QuotedStr(sCodFiscal);
    IBQ_MPMS.Close;
    IBQ_MPMS.SQL.Clear;
    IBQ_MPMS.SQL.Add(MySql);
    IBQ_MPMS.Open;

    fiCalculaICMSSN     :=IBQ_MPMS.FieldByName('CalculaICMSSN').AsString;
    fiCalculaIPISN      :=IBQ_MPMS.FieldByName('CalculaIPISN').AsString;
    fiCalculaSUBSTSN    :=IBQ_MPMS.FieldByName('CalculaSUBSTSN').AsString;
    fiCalculaPISCOFINSSN:=IBQ_MPMS.FieldByName('CalculaPISCOFINSSN').AsString;

    IBQ_MPMS.Close;

    // Dados Frete --------------------------------------------------
    MySql:=' SELECT Trim(tf.SomaFrete_TotalNota_SN) SomaFrete_TotalNota_SN'+
           ' FROM TIPOFRETE tf'+
           ' WHERE tf.codtipofrete=0';
    IBQ_MPMS.Close;
    IBQ_MPMS.SQL.Clear;
    IBQ_MPMS.SQL.Add(MySql);
    IBQ_MPMS.Open;

    tfSomaFrete_TotalNota_SN:=IBQ_MPMS.FieldByName('SomaFrete_TotalNota_SN').AsString;

    IBQ_MPMS.Close;
    //==========================================================================
    // Busca Dados do Pedido - FIM =============================================
    //==========================================================================

    //==========================================================================
    // Gera o Itens do Pedido - INICIO =========================================
    //==========================================================================
    cTotBruto:=0; //	Total das Quantidade Atendidas * Preco
    cTotIPI:=0; //	Soma dos Valores de IPI
    cTotSubstituicao:=0; //	Soma dos Valores de Substituição
    cTotNota:=0; // Soma dos Totais dos Produtos VALTOTAL
    cTotISS:=0; //	Soma dos Valores de ISS
    cTotBasePISCOFINS:=0; // Soma dos Valores das Bases de Calculo PIS e COFINS
    cTotPIS:=0; //	Soma dos Valores de PIS
    cTotCOFINS:=0; // Soma dos Valores de COFINS
    cTot_Ret_PIS:=0; // Soma dos Valores de Retenção do PIS
    cTot_Ret_COFINS:=0; //	Soma dos Valores de Retenção do COFINS
    cTotICMS_Bruto:=0; // Igual a TOTICM
    cTotICM:=0; // Soma dos Valores de ICM

    cAcresVlrBaseICMS:=0;
    cAcresVlrBaseST:=0;
    cAcresVlrBaseIPI:=0;
    cAcresVlrBasePisCofins:=0;

    iSeqItem:=0;
    iTotItens:=0;
    DMCentralTrocas.CDS_ReposicaoTransf.First;
    DMCentralTrocas.CDS_ReposicaoTransf.DisableControls;
    While Not DMCentralTrocas.CDS_ReposicaoTransf.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMCentralTrocas.CDS_ReposicaoTransf.RecNo;

      If (DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsInteger>0) And
         (DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsString='000000') And
         (DMCentralTrocas.CDS_ReposicaoTransfPRECOCOMPRA.AsCurrency<>0.00) Then
      Begin
        // Verifica se Existe Controle de Estoque no CD =============
        MySql:=' SELECT e.codproduto'+
               ' FROM ESTOQUE e'+
               ' WHERE e.codproduto='+QuotedStr(DMCentralTrocas.CDS_ReposicaoTransfCOD_PRODUTO.AsString)+
               ' AND e.codfilial='+QuotedStr(sCodLoja);
        IBQ_MPMS.Close;
        IBQ_MPMS.SQL.Clear;
        IBQ_MPMS.SQL.Add(MySql);
        IBQ_MPMS.Open;

        // Gera Controle de Estoque no CD ===========================
        If Trim(IBQ_MPMS.FieldByName('CodProduto').AsString)='' Then
        Begin
          GeraEstoqueCD;
        End;
        IBQ_MPMS.Close;

        // Gera Pedido SIDICOM ======================================
        If iSeqItem=EdtReposLojasQtdItensPed.AsInteger Then
        Begin
          GeraPedidoSIDICOM;
          Break;
        End;

        // Sequencia do Item ========================================
        Inc(iSeqItem);

        // Total de Itens -------------------------------------------
        Inc(iTotItens);

        // Dados do Produto -----------------------------------------
        MySql:=' SELECT Trim(pr.UnidadeEstoque) UnidadeEstoque,'+
               '        Trim(pr.CodIpiVenda) CodIpiVenda,'+
               '        COALESCE(Trim(pr.iss),0) Iss,'+
               '        Trim(pr.CodPisCofins_Venda) CodPisCofins_Venda,'+
               '        Trim(pr.CodAgrupaCarga) CodAgrupaCarga'+
               ' FROM PRODUTO pr'+
               ' WHERE pr.codproduto='+QuotedStr(DMCentralTrocas.CDS_ReposicaoTransfCOD_PRODUTO.AsString);
        IBQ_MPMS.Close;
        IBQ_MPMS.SQL.Clear;
        IBQ_MPMS.SQL.Add(MySql);
        IBQ_MPMS.Open;

        prUnidadeEstoque    :=IBQ_MPMS.FieldByName('UnidadeEstoque').AsString;
        prCodIpiVenda       :=IBQ_MPMS.FieldByName('CodIpiVenda').AsString;
        prIss               :=IBQ_MPMS.FieldByName('Iss').AsString;
        prCodPisCofins_Venda:=IBQ_MPMS.FieldByName('CodPisCofins_Venda').AsString;
        prCodAgrupaCarga    :=IBQ_MPMS.FieldByName('CodAgrupaCarga').AsString;

        IBQ_MPMS.Close;

        MySql:=' SELECT COALESCE(Trim(cl.descontaicmspro_sn),''N'') descontaicmspro_sn'+
               ' FROM CLIENTE cl'+
               ' WHERE cl.codcliente='+QuotedStr(ecCodCliente);
        IBQ_MPMS.Close;
        IBQ_MPMS.SQL.Clear;
        IBQ_MPMS.SQL.Add(MySql);
        IBQ_MPMS.Open;

        cldescontaicmspro_sn:=IBQ_MPMS.FieldByName('descontaicmspro_sn').AsString;

        IBQ_MPMS.Close;

        // Dados do Lista de Preços ---------------------------------
        MySql:=' SELECT COALESCE(Trim(lp.PrecoCompra),0) PrecoCompra'+
               ' FROM LISTAPRE lp'+
               ' WHERE lp.codlista='+QuotedStr('0006')+
               ' AND   lp.codproduto='+QuotedStr(DMCentralTrocas.CDS_ReposicaoTransfCOD_PRODUTO.AsString);
        IBQ_MPMS.Close;
        IBQ_MPMS.SQL.Clear;
        IBQ_MPMS.SQL.Add(MySql);
        IBQ_MPMS.Open;

        lpPrecoCompra:=IBQ_MPMS.FieldByName('PrecoCompra').AsString;

        IBQ_MPMS.Close;

        // Dados do IPI ---------------------------------------------
        MySql:=' SELECT COALESCE(Trim(ip.Aliquota),0) Aliquota,'+
               '        Trim(ip.IpiPercOuValor) IpiPercOuValor,'+
               '        Trim(ip.OperacaoCreDeb) OperacaoCreDeb,'+
               '        Trim(ip.SomaFreteBaseIpi) SomaFreteBaseIpi,'+
               '        Trim(ip.SomaDespesaBaseIpi) SomaDespesaBaseIpi,'+
               '        Trim(ip.SitTrib_Ipi_Saida) SitTrib_Ipi_Saida'+
               ' FROM IPIS ip'+
               ' WHERE Ip.CodIpi='+QuotedStr(prCodIpiVenda);
        IBQ_MPMS.Close;
        IBQ_MPMS.SQL.Clear;
        IBQ_MPMS.SQL.Add(MySql);
        IBQ_MPMS.Open;

        ipAliquota          :=IBQ_MPMS.FieldByName('Aliquota').AsString;
        ipIpiPercOuValor    :=IBQ_MPMS.FieldByName('IpiPercOuValor').AsString;
        ipOperacaoCreDeb    :=IBQ_MPMS.FieldByName('OperacaoCreDeb').AsString;
        ipSomaFreteBaseIpi  :=IBQ_MPMS.FieldByName('SomaFreteBaseIpi').AsString;
        ipSomaDespesaBaseIpi:=IBQ_MPMS.FieldByName('SomaDespesaBaseIpi').AsString;
        ipSitTrib_Ipi_Saida :=IBQ_MPMS.FieldByName('SitTrib_Ipi_Saida').AsString;

        IBQ_MPMS.Close;

        // Dados do ICMS --------------------------------------------
        MySql:=' SELECT COALESCE(Trim(ic.Aliquota),0) Aliquota,'+
               '        COALESCE(Trim(ic.Reducao),0) Reducao,'+
               '        Trim(ic.SubstValPer) SubstValPer,'+
               '        COALESCE(Trim(ic.SubstMargem),0) SubstMargem,'+
               '        COALESCE(Trim(ic.SubstAliquota),0) SubstAliquota,'+
               '        Trim(ic.CodIcm) CodIcm,'+
               '        Trim(ic.SitTributaria) SitTributaria,'+
               '        Trim(ic.Substituicao) Substituicao,'+
               '        Trim(ic.OperacaoCreDeb) OperacaoCreDeb,'+
               '        Trim(ic.SomaIpiBase) SomaIpiBase,'+
               '        Trim(ic.SomaFreteBase) SomaFreteBase,'+
               '        Trim(ic.SomaDespesaBase) SomaDespesaBase,'+
               '        Trim(ic.SomaIpiBaseSubst) SomaIpiBaseSubst,'+
               '        Trim(ic.SomaFreteBaseST) SomaFreteBaseST,'+
               '        Trim(ic.SomaDespesaBaseST) SomaDespesaBaseST,'+
               '        COALESCE(Trim(ic.AliqIcmOrigem),0) AliqIcmOrigem,'+
               '        COALESCE(Trim(ic.Perc_Diferido),0) Perc_Diferido'+
               ' FROM TabelaIcms ic'+
               ' WHERE ic.CodComprovante='+QuotedStr(sCodComprv)+
               ' AND   ic.CodIcm='+QuotedStr(prCodIpiVenda)+ // '00' -->> Produto.CodIcmVenda
               ' AND   ic.CliouFor='+QuotedStr('C')+
               ' AND   ic.CodEstado='+QuotedStr(ecCod_UF)+   // 'RS'  --->> ec.Cod_UF
               ' AND   ic.RevendaConsumoFJ='+QuotedStr('J');
        IBQ_MPMS.Close;
        IBQ_MPMS.SQL.Clear;
        IBQ_MPMS.SQL.Add(MySql);
        IBQ_MPMS.Open;

        icAliquota         :=IBQ_MPMS.FieldByName('Aliquota').AsString;
        icReducao          :=IBQ_MPMS.FieldByName('Reducao').AsString;
        icSubstValPer      :=IBQ_MPMS.FieldByName('SubstValPer').AsString;
        icSubstMargem      :=IBQ_MPMS.FieldByName('SubstMargem').AsString;
        icSubstAliquota    :=IBQ_MPMS.FieldByName('SubstAliquota').AsString;
        icCodIcm           :=IBQ_MPMS.FieldByName('CodIcm').AsString;
        icSitTributaria    :=IBQ_MPMS.FieldByName('SitTributaria').AsString;
        icSubstituicao     :=IBQ_MPMS.FieldByName('Substituicao').AsString;
        icOperacaoCreDeb   :=IBQ_MPMS.FieldByName('OperacaoCreDeb').AsString;
        icSomaIpiBase      :=IBQ_MPMS.FieldByName('SomaIpiBase').AsString;
        icSomaFreteBase    :=IBQ_MPMS.FieldByName('SomaFreteBase').AsString;
        icSomaDespesaBase  :=IBQ_MPMS.FieldByName('SomaDespesaBase').AsString;
        icSomaIpiBaseSubst :=IBQ_MPMS.FieldByName('SomaIpiBaseSubst').AsString;
        icSomaFreteBaseST  :=IBQ_MPMS.FieldByName('SomaFreteBaseST').AsString;
        icSomaDespesaBaseST:=IBQ_MPMS.FieldByName('SomaDespesaBaseST').AsString;
        icAliqIcmOrigem    :=IBQ_MPMS.FieldByName('AliqIcmOrigem').AsString;
        icPerc_Diferido    :=IBQ_MPMS.FieldByName('Perc_Diferido').AsString;

        IBQ_MPMS.Close;

        // Dados do Custo Medio -------------------------------------
        MySql:=' SELECT COALESCE(Trim(es.CustoMedio),0) CustoMedio'+
               ' FROM ESTOQUE es'+
               ' WHERE es.codfilial='+QuotedStr('99')+
               ' AND   es.codproduto='+QuotedStr(DMCentralTrocas.CDS_ReposicaoTransfCOD_PRODUTO.AsString);
        IBQ_MPMS.Close;
        IBQ_MPMS.SQL.Clear;
        IBQ_MPMS.SQL.Add(MySql);
        IBQ_MPMS.Open;

        esCustoMedio:=IBQ_MPMS.FieldByName('CustoMedio').AsString;

        IBQ_MPMS.Close;

        // Dados do PIS / COFINS ------------------------------------
        MySql:=' SELECT COALESCE(Trim(pc.AliqPis),0) AliqPis,'+
               '        COALESCE(Trim(pc.AliqCofins),0) AliqCofins,'+
               '        Trim(pc.SomaStBasePisCofins) SomaStBasePisCofins,'+
               '        Trim(pc.SitTrib_PIS_Saida) SitTrib_PIS_Saida,'+
               '        Trim(pc.SitTrib_COFINS_Saida) SitTrib_COFINS_Saida,'+
               '        COALESCE(Trim(pc.Aliq_Ret_PIS),0) Aliq_Ret_PIS,'+
               '        COALESCE(Trim(pc.Aliq_Ret_COFINS),0) Aliq_Ret_COFINS,'+
               '        Trim(pc.PisCofPercOuValor) PisCofPercOuValor'+
               ' FROM TABELA_PISCOFINS pc'+
               ' WHERE pc.CodPisCofins='+QuotedStr(prCodPisCofins_Venda)+  // '00'  --<<=== pr.codpiscofins_venda
               ' AND   pc.revendaconsumo_fj='+QuotedStr('J');
        IBQ_MPMS.Close;
        IBQ_MPMS.SQL.Clear;
        IBQ_MPMS.SQL.Add(MySql);
        IBQ_MPMS.Open;

        pcAliqPis             :=IBQ_MPMS.FieldByName('AliqPis').AsString;
        pcAliqCofins          :=IBQ_MPMS.FieldByName('AliqCofins').AsString;
        pcSomaStBasePisCofins :=IBQ_MPMS.FieldByName('SomaStBasePisCofins').AsString;
        pcSitTrib_PIS_Saida   :=IBQ_MPMS.FieldByName('SitTrib_PIS_Saida').AsString;
        pcSitTrib_COFINS_Saida:=IBQ_MPMS.FieldByName('SitTrib_COFINS_Saida').AsString;
        pcAliq_Ret_PIS        :=IBQ_MPMS.FieldByName('Aliq_Ret_PIS').AsString;
        pcAliq_Ret_COFINS     :=IBQ_MPMS.FieldByName('Aliq_Ret_COFINS').AsString;
        pcPisCofPercOuValor   :=IBQ_MPMS.FieldByName('PisCofPercOuValor').AsString;

        IBQ_MPMS.Close;

        //-----------------------------------------------------------
        // Inclui o Produtos - INICIO -------------------------------
        //-----------------------------------------------------------
        MySqlIteV:=' VALUES('+
                   QuotedStr(sNumPedidoSid+DMCentralTrocas.CDS_ReposicaoTransfCOD_PRODUTO.AsString)+', '+ // CHAVEPEDIDO - sNumPedido + CodProduto
                   QuotedStr(sNumPedidoSid)+', '+ // CODPEDIDO
                   QuotedStr(DMCentralTrocas.CDS_ReposicaoTransfCOD_PRODUTO.AsString)+', '+ // CODPRODUTO
                   QuotedStr(ctNaoSomaEstoque)+', '+ // SOMOUESTOQUE
                   QuotedStr(prUnidadeEstoque)+', '+ // UNIDADEESTOQUE
                   QuotedStr(DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsString)+', '+ // QUANTPEDIDA
                   QuotedStr(DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsString)+', '+ // QUANTATENDIDA
                   QuotedStr('0')+', '+ // QUANTPENDENTE
                   QuotedStr(lpPrecoCompra)+', '+ // PRECO
                   QuotedStr('0006')+', '+ // CODLISTA
                   QuotedStr('0')+', '+ // DESCONTO1
                   QuotedStr('0')+', '+ // DESCONTO2
                   QuotedStr('0')+', '+ // DESCONTO3
                   QuotedStr('0')+', '+ // DESCONTO4
                   QuotedStr('0')+', '+ // DESCONTOCALC
                   QuotedStr('0')+', '; // VALDESCITEM

        cVlrBruto:=DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsCurrency*StrToCurr(lpPrecoCompra);
        cTotBruto:=cTotBruto+cVlrBruto;

        MySqlIteV:=
         MySqlIteV+QuotedStr(CurrToStr(cVlrBruto))+', '+ // VALBRUTO
                   QuotedStr(prIss)+', '+ // ALIQISS
                   QuotedStr(CurrToStr(RoundTo(cVlrBruto*(StrToCurr(prIss)/100),-2)))+', '; // VALISS

        cTotISS:=cTotISS+RoundTo(cVlrBruto*(StrToCurr(prIss)/100),-2);
        //-----------------------------------------------------------

        // Frete ----------------------------------------------------
        MySqlIteV:=
         MySqlIteV+QuotedStr('0')+', '+ // VALFRETE
                   QuotedStr(ipSomaFreteBaseIpi)+', '+ // SOMAFRETEBASEIPI
                   QuotedStr(icSomaFreteBaseST)+', '+ // SOMAFRETEBASEST
                   QuotedStr(icSomaFreteBase)+', '; // SOMAFRETEBASEICM

        If ipSomaFreteBaseIpi='S' Then
         cAcresVlrBaseIPI:=cAcresVlrBaseIPI+0;

        If icSomaFreteBaseST='S' Then
         cAcresVlrBaseST:=cAcresVlrBaseST+0;

        If icSomaFreteBase='S' Then
         cAcresVlrBaseICMS:=cAcresVlrBaseICMS+0;
        //-----------------------------------------------------------

        // Despesas -------------------------------------------------
        MySqlIteV:=
         MySqlIteV+QuotedStr('0')+', '+ // VALDESPESAS
                   QuotedStr(ipSomaDespesaBaseIpi)+', '+ // SOMADESPESABASEIPI
                   QuotedStr(icSomaDespesaBaseST)+', '+ // SOMADESPESABASEST
                   QuotedStr(icSomaDespesaBase)+', '; // SOMADESPESABASEICM

        If ipSomaDespesaBaseIpi='S' Then
         cAcresVlrBaseIPI:=cAcresVlrBaseIPI+0;

        If icSomaDespesaBaseST='S' Then
         cAcresVlrBaseST:=cAcresVlrBaseST+0;

        If icSomaDespesaBase='S' Then
         cAcresVlrBaseICMS:=cAcresVlrBaseICMS+0;
        //-----------------------------------------------------------

        MySqlIteV:=
         MySqlIteV+QuotedStr('0')+', '+ // VALDESCONTORS
                   QuotedStr('0')+', '+ // ALIQREPASSE
                   QuotedStr('0')+', '; // VALREPASSE

        // IPI - (ValBaseIPI * (pi.aliqipi/100) -----------------------
        MySqlIteV:=
         MySqlIteV+QuotedStr(ipAliquota)+', '+ // ALIQIPI
                   QuotedStr(ipIpiPercOuValor)+', '+ // IPIPERCOUVALOR
                   QuotedStr(CurrToStr(cVlrBruto+cAcresVlrBaseIPI))+', '+ // VALBASEIPI
                   QuotedStr('0')+', '+ // VALISENTOIPI
                   QuotedStr(ipOperacaoCreDeb)+', '+ // OPERACAOCREDEBIPI
                   QuotedStr(CurrToStr(RoundTo((cVlrBruto+cAcresVlrBaseIPI)*(StrToCurr(ipAliquota)/100),-2)))+', '+ // VALIPI
                   QuotedStr(icSomaIpiBase)+', '+ // SOMAIPIBASEICM
                   QuotedStr(icSomaIpiBaseSubst)+', '+ // SOMAIPIBASESUBST
                   QuotedStr(ipSitTrib_Ipi_Saida)+', '; // CST_IPI

        cVlrIPI:=RoundTo((cVlrBruto+cAcresVlrBaseIPI)*(StrToCurr(ipAliquota)/100),-2);

        If icSomaIpiBase='S' Then
         cAcresVlrBaseICMS:=cAcresVlrBaseICMS+RoundTo((cVlrBruto+cAcresVlrBaseIPI)*(StrToCurr(ipAliquota)/100),-2);

        If icSomaIpiBaseSubst='S' Then
         cAcresVlrBaseST:=cAcresVlrBaseST+RoundTo((cVlrBruto+cAcresVlrBaseIPI)*(StrToCurr(ipAliquota)/100),-2);

        cTotIPI:=cTotIPI+RoundTo((cVlrBruto+cAcresVlrBaseIPI)*(StrToCurr(ipAliquota)/100),-2);
        //-----------------------------------------------------------

        // Substituição ---------------------------------------------
        MySqlIteV:=
         MySqlIteV+QuotedStr(icSubstAliquota)+', '+ // SUBSTALIQ
                   QuotedStr(icSubstValPer)+', '+ // SUBSTVALPER
                   QuotedStr(icSubstMargem)+', '+ // SUBSTMARGEM
                   QuotedStr('0')+', '+ // SUBSTDESCONTO
                   QuotedStr(pcSomaStBasePisCofins)+', '+ // SOMASTBASEPISCOFINS
                   QuotedStr(icSubstituicao)+', '; // SUBSTITUICAOSN

                   // VALBASESUBST (VALBRUTO - VALDESCITEM + VALIPI)
                   cVlrST:=0;
                   cValor:=0;
                   If icSubstituicao='S' Then
                    Begin
                      cValor:=cVlrBruto-0+RoundTo((cVlrBruto+cAcresVlrBaseIPI)*(StrToCurr(ipAliquota)/100),-2)+cAcresVlrBaseST;
                      MySqlIteV:=
                       MySqlIteV+QuotedStr(CurrToStr(cValor))+', ';

                      // VALSUBSTITUICAO
                      If StrToCurr(icSubstAliquota)>0 Then
                       Begin
                         cVlrST:=RoundTo(cValor*(StrToCurr(icSubstAliquota)/100),-2);
                         MySqlIteV:=
                          MySqlIteV+QuotedStr(CurrToStr(cVlrST))+', ';
                       End
                      Else
                       Begin
                         MySqlIteV:=
                          MySqlIteV+QuotedStr('0')+', ';
                       End;

                      If pcSomaStBasePisCofins='S' Then
                       cAcresVlrBasePisCofins:=cAcresVlrBasePisCofins+cValor;
                    End
                   Else
                    Begin
                      MySqlIteV:=
                       MySqlIteV+QuotedStr('0')+', '+ // VALBASESUBST
                                 QuotedStr('0')+', '; // VALSUBSTITUICAO
                    End; // If icSubstituicao='S' Then

         cTotSubstituicao:=cTotSubstituicao+cVlrST;
        //-----------------------------------------------------------

        // VALTOTAL = ValBruto+ValIPI+ValSubstituicao-ValDescItem ---
        cVlrTotal:=cVlrBruto+cVlrIPI+cVlrST-0;
        MySqlIteV:=
         MySqlIteV+QuotedStr(CurrToStr(cVlrTotal))+', '; //  VALTOTAL

        cTotNota:=cTotNota+(cVlrBruto+cVlrIPI+cVlrST-0);
        //-----------------------------------------------------------

        // Oustos IPI -----------------------------------------------
        MySqlIteV:=
         MySqlIteV+QuotedStr(CurrToStr(cVlrTotal+0+0+0))+', '; //  VALOUTROSIPI (VALTOTAL+VALDESPESAS+VALFRETE+VALDESCONTORS)

        // ICMS -----------------------------------------------------
        MySqlIteV:=
         MySqlIteV+QuotedStr(icAliquota)+', '+ // ALIQICM
                   QuotedStr(icReducao)+', '+ // ALIQICMREDUCAO
                   QuotedStr(icAliqIcmOrigem)+', '+ // ALIQICMORIGEM
                   QuotedStr('0')+', '+ // VALISENTOICM
                   QuotedStr('0')+', '+ // VALOUTROSICM
                   QuotedStr('0')+', '+ // VALICMS_DIFERIDO
                   QuotedStr('0')+', '+ // VALICMS_BRUTO
                   QuotedStr('0')+', '+ // VALBASEICMS_DESONERADO
                   QuotedStr('0')+', '+ // VALICMS_DESONERADO
                   QuotedStr('0')+', '+ // MOTDESICMS
                   QuotedStr(icSitTributaria)+', '+ // CST_ICMS
                   QuotedStr(icOperacaoCreDeb)+', '+ // OPERACAOCREDEBICM
                   QuotedStr(icCodIcm)+', '; //  CODICMPED

        cValor:=0;
        If (fiCalculaICMSSN='N') and (cldescontaicmspro_sn='S') Then
         Begin
           // VALBASEICM - (VALBRUTO-VALDESCITEM+VALIPI+VALSUBSTITUICAO+cAcresVlrBaseICMS)
           cValor:=cVlrBruto-0+cVlrIPI+cVlrST+cAcresVlrBaseICMS;
           MySqlIteV:=
            MySqlIteV+QuotedStr(CurrToStr(cValor))+', ';

           // VALREDUCAOICM
           If StrToCurr(icReducao)>0 Then
            MySqlIteV:=
             MySqlIteV+QuotedStr(CurrToStr(RoundTo(cValor*(StrToCurr(icReducao)/100),-2)))+', '
           Else
            MySqlIteV:=
             MySqlIteV+QuotedStr('0')+', ';
         End
        Else
         Begin
           MySqlIteV:=
            MySqlIteV+QuotedStr('0')+', '+ // VALBASEICM
                      QuotedStr('0')+', '; // VALREDUCAOICM
         End; // If ISENTOICM.AsString:='N' And ...
        //-----------------------------------------------------------

        // PIS / COFINS ---------------------------------------------
        MySqlIteV:=
         MySqlIteV+QuotedStr(pcAliqPis)+', '+ // ALIQPIS
                   QuotedStr(pcAliqCofins)+', '+ // ALIQCOFINS
                   QuotedStr(pcAliq_Ret_PIS)+', '+ // ALIQ_RET_PIS
                   QuotedStr(pcAliq_Ret_COFINS)+', '+ // ALIQ_RET_COFINS
                   QuotedStr(icPerc_Diferido)+', '+ // PERC_DIFERIDO
                   QuotedStr(pcSitTrib_PIS_Saida)+', '+ // CST_PIS
                   QuotedStr(pcSitTrib_COFINS_Saida)+', '+ // CST_COFINS
                   QuotedStr(pcPisCofPercOuValor)+', '; // PISCOFPERCOUVALOR

        // VALBASEPISCOFINS - (VALBRUTO.AsCurrency+cAcresVlrBasePisCofins;)
        cVlrBasePisCofins:=0;
        cVal_Ret_Pis:=0;
        cVal_Ret_Cofins:=0;
        cVal_Pis:=0;
        cVal_Cofins:=0;
        If fiCalculaPISCOFINSSN='S' Then
         Begin
           cVlrBasePisCofins:=cVlrBruto+cAcresVlrBasePisCofins;
           MySqlIteV:=
            MySqlIteV+QuotedStr(CurrToStr(cVlrBasePisCofins));

           // VAL_RET_PIS
           If StrToCurr(pcAliq_Ret_PIS)>0 Then
            Begin
              cVal_Ret_Pis:=RoundTo(cVlrBasePisCofins*(StrToCurr(pcAliq_Ret_PIS)/100),-2);
              MySqlIteV:=
               MySqlIteV+QuotedStr(CurrToStr(cVal_Ret_Pis))+', ';
            End
           Else
            Begin
              MySqlIteV:=
               MySqlIteV+QuotedStr('0')+', ';
            End;

           // VAL_RET_COFINS
           If StrToCurr(pcAliq_Ret_COFINS)>0 Then
            Begin
              cVal_Ret_Cofins:=RoundTo(cVlrBasePisCofins*(StrToCurr(pcAliq_Ret_COFINS)/100),-2);
              MySqlIteV:=
               MySqlIteV+QuotedStr(CurrToStr(cVal_Ret_Cofins))+', ';
            End
           Else
            Begin
              MySqlIteV:=
               MySqlIteV+QuotedStr('0')+', ';
            End;

           // VALPIS
           If StrToCurr(pcAliqPis)>0 Then
            Begin
              cVal_Pis:=RoundTo((cVlrBasePisCofins*(StrToCurr(pcAliqPis)/100))-cVal_Ret_Pis,-2);
              MySqlIteV:=
               MySqlIteV+QuotedStr(CurrToStr(cVal_Pis))+', ';
            End
           Else
            Begin
              MySqlIteV:=
               MySqlIteV+QuotedStr('0')+', ';
            End;

           // VALCOFINS
           If StrToCurr(pcAliqCofins)>0 Then
            Begin
              cVal_Cofins:=RoundTo((cVlrBasePisCofins*(StrToCurr(pcAliqCofins)/100))-cVal_Ret_Cofins,-2);
              MySqlIteV:=
               MySqlIteV+QuotedStr(CurrToStr(cVal_Cofins))+', ';
            End
           Else
            Begin
              MySqlIteV:=
               MySqlIteV+QuotedStr('0')+', ';
            End;
         End
        Else
         Begin
           MySqlIteV:=
            MySqlIteV+QuotedStr('0')+', '+ // VALBASEPISCOFINS
                      QuotedStr('0')+', '+ // VAL_RET_PIS
                      QuotedStr('0')+', '+ // VAL_RET_COFINS
                      QuotedStr('0')+', '+ // VALPIS
                      QuotedStr('0')+', '; // VALCOFINS
         End; // If fiCalculaPISCOFINSSN='S' Then

        cTotBasePISCOFINS:=cTotBasePISCOFINS+cVlrBasePisCofins;
        cTotPIS          :=cTotPIS+cVal_Pis;
        cTotCOFINS       :=cTotCOFINS+cVal_Cofins;
        cTot_Ret_PIS     :=cTot_Ret_PIS+cVal_Ret_Pis;
        cTot_Ret_COFINS  :=cTot_Ret_COFINS+cVal_Ret_Cofins;
        //-----------------------------------------------------------

        MySqlIteV:=
         MySqlIteV+QuotedStr('0')+', '+ // COMISSAO1ALTERA
                   QuotedStr('0')+', '+ // COMISSAO2ALTERA
                   QuotedStr('0')+', '+ // COMISSAO3ALTERA
                   QuotedStr('0')+', '+ // COMISSAO1PERC
                   QuotedStr('0')+', '+ // COMISSAO2PERC
                   QuotedStr('0')+', '+ // COMISSAO3PERC
                   QuotedStr(sgDtaI)+', '+ // DATAENTREGA
                   QuotedStr('')+', '+ // ORDEMCOMPRA
                   QuotedStr(lpPrecoCompra)+', '+ // PRECOORIGEM
                   QuotedStr(sCodFiscal)+', '+ // CODFISCALPRO
                   QuotedStr(IntToStr(iSeqItem))+', '+ // SEQUENCIADOPRODUTO;
                   QuotedStr(esCustoMedio)+', '+ // MOMENTOCUSTOMEDIO
                   QuotedStr(lpPrecoCompra)+', '+ // MOMENTOPRECOBRUTO
                   QuotedStr(lpPrecoCompra)+', '+ // MOMENTOPRECOLIQUIDO
                   QuotedStr('N')+', '+ // FOIPESADOSN
                   QuotedStr('0')+', '+ // VALPECAS
                   QuotedStr('0')+', '+ // PRECOMAXCONSUMIDOR
                   QuotedStr('0')+', '+ // CODKIT
                   QuotedStr(prCodAgrupaCarga)+', '+ // CODAGRUPACARGA

                   QuotedStr('0')+', '+ // COMISSAO4ALTERA
                   QuotedStr('0')+', '+ // COMISSAO5ALTERA
                   QuotedStr('0')+', '+ // COMISSAO4PERC
                   QuotedStr('0')+', '+ // COMISSAO5PERC
                   QuotedStr('0')+', '+ // VALDESCONTOSUFRAMA
                   QuotedStr('N')+', '+ // USOU_MULTIPLO_SN
                   QuotedStr('0')+', '+ // VALBASEISS
                   QuotedStr('999')+', '+ // IPI_COD_ENQ
                   QuotedStr('0')+', '+ // DESCONTO_LOTE,
                   QuotedStr('0')+', '+ // VALDESC_LOTE,
                   QuotedStr('N')+', '+ // USA_DESC_FAIXA_NA_COMISSAO_SN,
                   QuotedStr('0')+')'; // REGRA_DESC_FAIXA

        //===============================
        // Campos Não Utilizados - Default 0
        //===============================
        // SEQORDEMCOMPRA

        //===============================
        // Campos Computer By:
        //===============================
        // - VALICM COMPUTED BY (COALESCE(VALICMS_BRUTO, 0) - COALESCE(VALICMS_DIFERIDO, 0)),
        // - COMP_VALTOTAL_SEM_DESCLOTE COMPUTED BY (VALTOTAL + VALDESC_LOTE),
        //===============================
        IBQ_MPMS.Close;
        IBQ_MPMS.SQL.Clear;
        IBQ_MPMS.SQL.Add(MySqlIteI+MySqlIteV);
        IBQ_MPMS.ExecSQL;

        // Reserva Estoque --------------------------------------------
        MySql:=' UPDATE ESTOQUE rs'+
               ' SET rs.PedidoPendente=rs.PedidoPendente+'+
               IntToStr(DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsInteger)+
               ' WHERE rs.codfilial='+QuotedStr('99')+
               ' AND   rs.codproduto='+QuotedStr(DMCentralTrocas.CDS_ReposicaoTransfCOD_PRODUTO.AsString);
        IBQ_MPMS.Close;
        IBQ_MPMS.SQL.Clear;
        IBQ_MPMS.SQL.Add(MySql);
        IBQ_MPMS.ExecSQL;
        //-------------------------------------------------------------
        // Inclui o Produtos - FIM ------------------------------------
        //-------------------------------------------------------------

        // Salva Numero do Pedido -------------------------------------
        DMCentralTrocas.CDS_ReposicaoTransf.Edit;
        DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsString:=
                                    FormatFloat('000000',StrToInt(sNumPedidoSid));
        DMCentralTrocas.CDS_ReposicaoTransf.Post;
      End; // If (DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsInteger>0) and ...

      DMCentralTrocas.CDS_ReposicaoTransf.Next;
    End; // While Not DMCentralTrocas.CDS_ReposicaoTransf.Eof do
    DMCentralTrocas.CDS_ReposicaoTransf.EnableControls;
    //==========================================================================
    // Gera o Itens do Pedido - FIM ============================================
    //==========================================================================

    //==========================================================================
    // Gera Último Pedido SIDICOM ==============================================
    //==========================================================================
    If iSeqItem<>0 Then
    Begin
      GeraPedidoSIDICOM;
    End;

    // Commit ------------------------------------------------------
    b:=False;
    While Not b do
    Begin
      b:=IBTransacao('C', 'IBT_MPMS');
    End; // While Not b do

    DateSeparator:='/';
    DecimalSeparator:=',';

    Result:=True;
  Except
    On e : Exception do
    Begin
      DMCentralTrocas.CDS_ReposicaoTransf.EnableControls;
      FrmBelShop.MontaProgressBar(False, FrmCentralTrocas);
      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      DateSeparator:='/';
      DecimalSeparator:=',';

      // Retira Numero do Pedido ------------------------------------
      DMCentralTrocas.CDS_ReposicaoTransf.DisableControls;
      DMCentralTrocas.CDS_ReposicaoTransf.Close;
      DMCentralTrocas.CDS_ReposicaoTransf.Open;
      DMCentralTrocas.CDS_ReposicaoTransf.EnableControls;
      DMCentralTrocas.CDS_ReposicaoTransf.First;

      // Rollback Transacao -----------------------------------------
      b:=False;
      While Not b do
      Begin
        b:=IBTransacao('R', 'IBT_MPMS');
      End; // While Not b do

      sgMensagem:=e.message;
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End;
  End; // Try

  DMConexoes.FechaTudoIBDataBases;
  ConexaoEmpIndividual('IBDB_MPMS', 'IBT_MPMS', 'A');

  FrmBelShop.MontaProgressBar(False, FrmCentralTrocas);
  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  DMCentralTrocas.CDS_ReposicaoTransf.First;

End; // Gera Pedido no SIDICOM CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) >>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.AbreSolicitacoes(index: Integer);
Var
  i: Integer;
  TS: TTabSheet;
Begin

  For i:=0 to FrmSolicitacoes.PC_Principal.ControlCount-1 do
  Begin
    FrmSolicitacoes.PC_Principal.TabIndex:=i;

    TS:=FrmSolicitacoes.PC_Principal.ActivePage;

    ts.TabVisible:=False;
    If TS.PageIndex=index Then
     ts.TabVisible:=True;
  End; // For i:=0 to FrmSolicitacoes.PC_Principal.ControlCount-1 do

End; // Abre Form de Solicitações >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Marca Como Produto Impresso >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.MarcarComoImpresso;
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
    MySql:=' UPDATE SIDICOM_TRANSF_ENTADAS te'+
           ' SET te.Ind_Impresso=''S'''+
           ' WHERE te.quant_ent IS NOT NULL'+
           ' AND   te.quant_ent<>0'+
           ' AND   te.ind_impresso=''N'''+
           ' AND te.num_solicitacao='+EdtNotasEntDevNumSolicitacao.Text;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DMCentralTrocas.CDS_Transf_Cd.DisableControls;
    DMCentralTrocas.CDS_Transf_Cd.Close;
    DMCentralTrocas.CDS_Transf_Cd.Open;
    DMCentralTrocas.CDS_Transf_Cd.EnableControls;
    Dbg_NotasEntDevProdutos.SetFocus;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try
End; // Marca Como Produto Impresso >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Analisa Transferencis para Devolução >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.AnalisaNfTransfDevolucao;
Var
  MySql: String;
  sCodLoja, sLojasProc: String;

  i: Integer;

  cQtdCD, cQtdTransf,
  cQtdEncontradaNT, cQtdEncontradaNE: Currency;
Begin
  OdirPanApres.Caption:='AGUARDE !! Analisando Notas Fiscas de Entrada para Devolução !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  OdirPanApres.Refresh;

  FrmBelShop.MontaProgressBar(True, FrmCentralTrocas);
  pgProgBar.Properties.Max:=DMCentralTrocas.CDS_Transf_Cd.RecordCount;
  pgProgBar.Position:=0;

  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    cQtdEncontradaNE:=0;
    cQtdEncontradaNT:=0;
    DMCentralTrocas.CDS_Transf_Cd.First;
    While Not DMCentralTrocas.CDS_Transf_Cd.Eof do
    Begin
      pgProgBar.Position:=DMCentralTrocas.CDS_Transf_Cd.RecNo;
      Application.ProcessMessages;

      If (DMCentralTrocas.CDS_Transf_CdSIT.AsString='A') And
         (Pos(DMCentralTrocas.CDS_Transf_CdPRINCIPALFOR.AsString, sgFornecedores)<>0) Then
      Begin
        cQtdCD:=DMCentralTrocas.CDS_Transf_CdQUANT_CD.AsCurrency;

        // Busca Transfencias ==================================================
        MySql:=' SELECT DISTINCT t.codfilial'+
               ' FROM SIDICOM_TRANSF_BEL_50 t'+
               ' WHERE t.codproduto='+QuotedStr(DMCentralTrocas.CDS_Transf_CdCODPRODUTO.AsString)+
               ' AND   t.quantatendida > t.quant_informada';

               If Not bgTodasEmpresas Then
                MySql:=MySql+' AND t.codfilial in ('+sgCodLojas+')';

        MySql:=
         MySql+' ORDER BY t.datacomprovante DESC, t.codfilial';
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        sLojasProc:='';
        While Not DMBelShop.CDS_BuscaRapida.Eof do
        Begin
          sCodLoja:=DMBelShop.CDS_BuscaRapida.FieldByName('codfilial').AsString;

          If Trim(sLojasProc)='' Then
           sLojasProc:=QuotedStr(sCodLoja)
          Else
           sLojasProc:=sLojasProc+', '+QuotedStr(sCodLoja);

          DMBelShop.CDS_BuscaRapida.Next;
        End;
        DMBelShop.CDS_BuscaRapida.Close;

        // Inicial Processamento ===============================================
        For i:=0 to 10 do
        Begin
          // Busca NF Entrada das Lojas ========================================
          MySql:=' SELECT *'+
                 ' FROM SIDICOM_ENTRADAS e'+
                 ' WHERE e.codproduto='+QuotedStr(DMCentralTrocas.CDS_Transf_CdCODPRODUTO.AsString)+
                 ' AND e.situacaonf=1'+
                 ' AND e.quant > e.quant_informada';

                 If (i=0) And (sLojasProc<>'') Then
                  MySql:=MySql+' AND e.codfilial in ('+sLojasProc+')'
                 Else If (i=1) And (sLojasProc<>'') Then
                  MySql:=MySql+' AND e.codfilial Not in ('+sLojasProc+')';

                 If Cbx_NotasEntDevCondicao.ItemIndex=0 Then
                  MySql:=MySql+' ORDER BY e.datacomprovante desc';

                 If Cbx_NotasEntDevCondicao.ItemIndex=1 Then
                  MySql:=MySql+' ORDER BY e.datacomprovante';
          DMCentralTrocas.CDS_NotasEntr.Close;
          DMCentralTrocas.SDS_NotasEntr.CommandText:=MySql;
          DMCentralTrocas.CDS_NotasEntr.Open;

          While Not DMCentralTrocas.CDS_NotasEntr.Eof do
          Begin
            cQtdEncontradaNE:=DMCentralTrocas.CDS_NotasEntrQUANT.AsCurrency-DMCentralTrocas.CDS_NotasEntrQUANT_INFORMADA.AsCurrency;

            If cQtdCD<=cQtdEncontradaNE Then
             Begin

               MySql:=' UPDATE SIDICOM_ENTRADAS'+
                      ' SET QUANT_INFORMADA=QUANT_INFORMADA+'+f_Troca(',','.',CurrToStr(cQtdCD))+
                      ' WHERE Num_Seq='+DMCentralTrocas.CDS_NotasEntrNUM_SEQ.AsString;
               DMBelShop.SQLC.Execute(MySql,nil,nil);

               cQtdTransf:=cQtdCD;
               cQtdCD:=0;
             End
            Else
             Begin
               MySql:=' UPDATE SIDICOM_ENTRADAS'+
                      ' SET QUANT_INFORMADA=QUANT_INFORMADA+'+f_Troca(',','.',CurrToStr(cQtdEncontradaNE))+
                      ' WHERE Num_Seq='+DMCentralTrocas.CDS_NotasEntrNUM_SEQ.AsString;
               DMBelShop.SQLC.Execute(MySql,nil,nil);

               cQtdTransf:=cQtdEncontradaNE;
               cQtdCD:=cQtdCD-cQtdEncontradaNE;
             End;

            MySql:=' SELECT *'+
                   ' FROM SIDICOM_TRANSF_ENTADAS te'+
                   ' WHERE te.quant_ent IS NULL'+
                   ' AND   te.num_solicitacao='+EdtNotasEntDevNumSolicitacao.Text+
                   ' AND   te.codproduto='+QuotedStr(DMCentralTrocas.CDS_Transf_CdCODPRODUTO.AsString)+
                   ' AND   te.Num_Seq='+QuotedStr(DMCentralTrocas.CDS_Transf_CdNUM_SEQ.AsString);
            DMBelShop.CDS_BuscaRapida.Close;
            DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
            DMBelShop.CDS_BuscaRapida.Open;

            If Not DMBelShop.CDS_BuscaRapida.IsEmpty Then
             Begin
               MySql:=' UPDATE SIDICOM_TRANSF_ENTADAS'+
                      ' SET NUM_SEQ_TRA=999999'+  // DMCentralTrocas.CDS_NotasTransfNUM_SEQ.AsString+
                      ', NUM_SEQ_ENT='+DMCentralTrocas.CDS_NotasEntrNUM_SEQ.AsString+
                      ', QUANT_TRA=0'+  // QuotedStr(f_Troca(',','.',DMCentralTrocas.CDS_NotasTransfQUANTATENDIDA.AsString))+
                      ', QUANT_ENT='+QuotedStr(f_Troca(',','.',CurrToStr(cQtdTransf)))+
                      ' WHERE quant_ent IS NULL'+
                      ' AND   num_solicitacao='+EdtNotasEntDevNumSolicitacao.Text+
                      ' AND   codproduto='+QuotedStr(DMCentralTrocas.CDS_Transf_CdCODPRODUTO.AsString)+
                      ' AND   num_Seq='+QuotedStr(DMCentralTrocas.CDS_Transf_CdNUM_SEQ.AsString);
               DMBelShop.SQLC.Execute(MySql,nil,nil);
             End
            Else
             Begin
               sgDtaFim:=f_Troca('/','.',DateToStr(DtaEdtNotasEntDev.Date));
               sgDtaFim:=f_Troca('-','.',sgDtaFim);

               MySql:=' INSERT INTO SIDICOM_TRANSF_ENTADAS'+
                      ' (NUM_SOLICITACAO, DTA_SOLICITACAO, CODPRODUTO, QUANT_CD,'+
                      '  NUM_SEQ_TRA, NUM_SEQ_ENT, QUANT_TRA, QUANT_ENT,'+
                      '  IND_IMPRESSO, NUM_SEQ, USU_INCLUI)'+
                      ' Values('+
                      QuotedStr(EdtNotasEntDevNumSolicitacao.Text)+', '+ // NUM_SOLICITACAO
                      QuotedStr(sgDtaFim)+', '+ // DTA_SOLICITACAO
                      QuotedStr(DMCentralTrocas.CDS_Transf_CdCODPRODUTO.AsString)+', '+ // CODPRODUTO
                      QuotedStr(f_Troca(',','.',DMCentralTrocas.CDS_Transf_CdQUANT_CD.AsString))+', '+ // QUANT_CD
                      QuotedStr('0')+', '+ // NUM_SEQ_TRA,
                      QuotedStr(DMCentralTrocas.CDS_NotasEntrNUM_SEQ.AsString)+', '+ //  NUM_SEQ_ENT
                      QuotedStr('0')+', '+ // QUANT_TRA
                      QuotedStr(f_Troca(',','.',CurrToStr(cQtdTransf)))+', '+ // QUANT_ENT
                      QuotedStr('N')+', '+ // IND_IMPRESSO
                      QuotedStr(DMCentralTrocas.CDS_Transf_CdNUM_SEQ.AsString)+', '+ // NUM_SEQ
                      QuotedStr(Cod_Usuario)+')'; // USU_INCLUI
               DMBelShop.SQLC.Execute(MySql,nil,nil);
             End; // If DMBelShop.CDS_BuscaRapida.IsEmpty Then
            DMBelShop.CDS_BuscaRapida.Close;

            If cQtdCD=0 Then
             Break;

            DMCentralTrocas.CDS_NotasEntr.Next;
          End; // While Not DMCentralTrocas.CDS_NotasEntr.Eof do
          DMCentralTrocas.CDS_NotasEntr.Close;

          If (i>1) Or (cQtdCD=0) Or (DMCentralTrocas.CDS_Transf_Cd.RecNo<1) Or (sLojasProc='')Then
           Break;
        End; // For i:=0 to 10 do
      End; // If DMCentralTrocas.CDS_Transf_CdSIT.AsString='A' Then

      DMCentralTrocas.CDS_Transf_Cd.Next;
    End; // While Not DMCentralTrocas.CDS_Transf_Cd.Eof do
    DMCentralTrocas.CDS_Transf_Cd.First;
    FrmBelShop.MontaProgressBar(False, FrmCentralTrocas);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      DateSeparator:='/';
      DecimalSeparator:=',';

      Screen.Cursor:=crDefault;
      OdirPanApres.Visible:=False;

      FrmBelShop.MontaProgressBar(False, FrmCentralTrocas);
    End; // on e : Exception do
  End; // Try

End; // Analisa Transferencis para Devolução >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Movimentos nas Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.BuscaMovtoNfTraNfEntLojas(bBuscaTR, bBuscaEN: Boolean);
Var
  MySql: String;
  bSiga: Boolean;
  iNumSeq: Integer;
Begin
  Screen.Cursor:=crAppStart;

  OdirPanApres.Caption:='AGUARDE !! Efetuando Conexão com a Loja: '+sgCodEmp+' - '+sgDesLoja;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  OdirPanApres.Refresh;

  // Conecta Empresa ===========================================================
  If Not ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
   Exit;

  // Cria Query da Empresa ===================================================
  DMCentralTrocas.CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_Filial, True, True);

  OdirPanApres.Visible:=False;
  Dbg_NotasEntDevProdutos.Refresh;
  OdirPanApres.Refresh;

  Try
    //==========================================================================
    // INICIO DA BUSCA DAS TRANSFERENCIAS ======================================
    //==========================================================================
    If bBuscaTR Then
    Begin
      Screen.Cursor:=crAppStart;

      OdirPanApres.Caption:='AGUARDE !! Localizando Notas Fiscas de Transferêncais da Loja: '+sgCodEmp+' - '+sgDesLoja;
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
      OdirPanApres.Font.Style:=[fsBold];
      OdirPanApres.Parent:=FrmCentralTrocas;
      OdirPanApres.BringToFront();
      OdirPanApres.Visible:=True;
      OdirPanApres.Refresh;

      pgProgBar.Position:=0;
      pgProgBar.Refresh;

      DateSeparator:='.';
      DecimalSeparator:='.';

      //========================================================================
      // Movimentos de Notas de Transferencias para Centra de Trocas ===========
      //========================================================================
      MySql:=' SELECT MAX(t.datacomprovante) datacomprovante'+
             ' FROM SIDICOM_TRANSF_BEL_50 t'+
             ' WHERE t.codfilial='+QuotedStr(sgCodEmp);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      sgDtaInicio:='01.01.2012';
      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('datacomprovante').AsString)<>'' Then
      Begin
        sgDtaInicio:=f_Troca('/','.',DateToStr(DMBelShop.CDS_BuscaRapida.FieldByName('datacomprovante').AsDateTime-2));
        sgDtaInicio:=f_Troca('-','.',sgDtaInicio);
      End;
      DMBelShop.CDS_BuscaRapida.Close;

      // Conta para Ver se Existe ==============================================
      MySql:=' SELECT COUNT(COALESCE(M.codfilial,0)) Total'+
             ' FROM MCLI m, MCLIPRO p'+
             ' WHERE m.chavenf=p.chavenf'+
             ' AND   m.codcomprovante in (''015'', ''017'', ''019'', ''020'')'+
             ' AND   m.datacomprovante>='+QuotedStr(sgDtaInicio)+
             ' and   m.codcliente=''010050'''+
             ' and   m.codfilial='+QuotedStr(sgCodEmp);
      IBQ_Filial.Close;
      IBQ_Filial.SQL.Clear;
      IBQ_Filial.SQL.Add(MySql);
      IBQ_Filial.Open;

      If IBQ_Filial.FieldByName('Total').AsInteger>0 Then
      Begin
        pgProgBar.Properties.Max:=IBQ_Filial.FieldByName('Total').AsInteger;
        MySql:=' SELECT m.codfilial, m.codcomprovante, m.numero, m.serie, m.situacaonf,'+
               ' m.datadocumento, m.datacomprovante, m.codcliente,'+
               ' p.codproduto, p.quantatendida'+
               ' FROM MCLI m, MCLIPRO p'+
               ' WHERE m.chavenf=p.chavenf'+
               ' AND   m.codcomprovante in (''015'', ''017'', ''019'', ''020'')'+
               ' AND   m.datacomprovante>='+QuotedStr(sgDtaInicio)+
               ' and   m.codcliente=''010050'''+
               ' and   m.codfilial='+QuotedStr(sgCodEmp);
        IBQ_Filial.Close;
        IBQ_Filial.SQL.Clear;
        IBQ_Filial.SQL.Add(MySql);
        IBQ_Filial.Open;

        // Busca Num_Seq de Notas de Transferencias ==============================
        MySql:=' SELECT Coalesce(max(t.Num_Seq)+1 ,1) Num_Seq'+
               ' FROM SIDICOM_TRANSF_BEL_50 t';
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;
        iNumSeq:=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
        DMBelShop.CDS_BuscaRapida.Close;

        // Inicia Processamento de Busca de Notas de Transferencias ==============
        While Not IBQ_Filial.Eof do
        Begin
          pgProgBar.Position:=IBQ_Filial.RecNo;

          Screen.Cursor:=crAppStart;
          Refresh;
          Application.ProcessMessages;

          MySql:=' SELECT t.Num_Seq'+
                 ' FROM SIDICOM_TRANSF_BEL_50 t'+
                 ' WHERE t.codfilial='+QuotedStr(sgCodEmp)+
                 ' AND   t.numero='+QuotedStr(IBQ_Filial.FieldByName('Numero').AsString)+
                 ' AND   t.serie='+QuotedStr(IBQ_Filial.FieldByName('Serie').AsString)+
                 ' AND   t.codcomprovante='+QuotedStr(IBQ_Filial.FieldByName('CodComprovante').AsString)+
                 ' AND   t.codcliente='+QuotedStr(IBQ_Filial.FieldByName('CodCliente').AsString)+
                 ' AND   t.codproduto='+QuotedStr(IBQ_Filial.FieldByName('CodProduto').AsString)+
                 ' AND   t.datacomprovante='+QuotedStr(IBQ_Filial.FieldByName('DataComprovante').AsString);
          DMBelShop.CDS_BuscaRapida.Close;
          DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
          DMBelShop.CDS_BuscaRapida.Open;
          bSiga:=True;
          If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)<>'' Then
           bSiga:=False;
          DMBelShop.CDS_BuscaRapida.Close;

          If bSiga Then
          Begin
            Inc(iNumSeq);

            MySql:=' INSERT INTO SIDICOM_TRANSF_BEL_50'+
                   ' (NUM_SEQ, CODFILIAL, CODCOMPROVANTE, NUMERO, SERIE, SITUACAONF,'+
                   '  DATADOCUMENTO, DATACOMPROVANTE, CODCLIENTE, CODPRODUTO,'+
                   '  QUANTATENDIDA, QUANT_INFORMADA, DTA_ATUALIZACAO)'+

                   ' VALUES ('+
                   IntToStr(iNumSeq)+', '+
                   QuotedStr(sgCodEmp)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('CodComprovante').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('Numero').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('Serie').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('SituacaoNF').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('DataDocumento').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('DataComprovante').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('CodCliente').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('CodProduto').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('QuantAtendida').AsString)+', '+
                   '0, current_date)';
            DMBelShop.SQLC.Execute(MySql,nil,nil);
          End; // If bSiga Then

          IBQ_Filial.Next;
        End; // While Not IBQ_Filial.Eof do
      End; // If IBQ_Filial.FieldByName('Total').AsInteger>0 Then
      IBQ_Filial.Close;

      DateSeparator:='/';
      DecimalSeparator:=',';

      pgProgBar.Position:=0;
      pgProgBar.Refresh;

      OdirPanApres.Visible:=False;
      Dbg_NotasEntDevProdutos.Refresh;
      OdirPanApres.Refresh;

      Screen.Cursor:=crDefault;
    End; // If bBuscaTR Then
    //==========================================================================
    // FIM DA BUSCA DAS NOTAS DE TRANSFERENCIAS ================================
    //==========================================================================

    //==========================================================================
    // INICIO DA BUSCA DAS NOTAS DE ENTRADAS ===================================
    //==========================================================================
    If bBuscaEN Then
    Begin
      Screen.Cursor:=crAppStart;

      pgProgBar.Position:=0;
      pgProgBar.Refresh;

      DateSeparator:='.';
      DecimalSeparator:='.';

      OdirPanApres.Caption:='AGUARDE !! Localizando Notas Fiscas de Entrada da Loja: '+sgCodEmp+' - '+sgDesLoja;
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
      OdirPanApres.Font.Style:=[fsBold];
      OdirPanApres.Parent:=FrmCentralTrocas;
      OdirPanApres.BringToFront();
      OdirPanApres.Visible:=True;
      OdirPanApres.Refresh;

      MySql:=' SELECT MAX(e.datacomprovante) datacomprovante'+
             ' FROM SIDICOM_ENTRADAS e'+
             ' WHERE e.codfilial='+QuotedStr(sgCodEmp);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      sgDtaInicio:='01.01.2012';
      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('datacomprovante').AsString)<>'' Then
      Begin
        sgDtaInicio:=f_Troca('/','.',DateToStr(DMBelShop.CDS_BuscaRapida.FieldByName('datacomprovante').AsDateTime-2));
        sgDtaInicio:=f_Troca('-','.',sgDtaInicio);
      End;
      DMBelShop.CDS_BuscaRapida.Close;

      // Conta para Ver se Existe ==============================================
      MySql:=' SELECT COUNT(COALESCE(M.codfilial,0)) Total'+
             ' FROM MFOR m, MFORPRO p'+
             ' WHERE m.chavenf=p.chavenf'+
             ' AND   m.codcomprovante = ''010'''+
             ' AND   m.datacomprovante>='+QuotedStr(sgDtaInicio)+
             ' AND   m.codfilial='+QuotedStr(sgCodEmp);
      IBQ_Filial.Close;
      IBQ_Filial.SQL.Clear;
      IBQ_Filial.SQL.Add(MySql);
      IBQ_Filial.Open;

      If IBQ_Filial.FieldByName('Total').AsInteger>0 Then
      Begin
        pgProgBar.Properties.Max:=IBQ_Filial.FieldByName('Total').AsInteger;
        
        // Movimentos de Notas de Entrada ========================================
        MySql:=' SELECT m.codfilial, m.codcomprovante, m.numero, m.serie,'+
               ' m.situacaonf, m.dataentrada, m.datacomprovante, m.codfornecedor,'+
               ' p.codproduto, p.quant'+
               ' FROM MFOR m, MFORPRO p'+
               ' WHERE m.chavenf=p.chavenf'+
               ' AND   m.codcomprovante = ''010'''+
               ' AND   m.datacomprovante>='+QuotedStr(sgDtaInicio)+
               ' AND   m.codfilial='+QuotedStr(sgCodEmp);
        IBQ_Filial.Close;
        IBQ_Filial.SQL.Clear;
        IBQ_Filial.SQL.Add(MySql);
        IBQ_Filial.Open;

        // Busca Num_Seq de Notas de Entrada =====================================
        MySql:=' SELECT Coalesce(max(e.Num_Seq)+1 ,1) Num_Seq'+
               ' FROM SIDICOM_ENTRADAS e';
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;
        iNumSeq:=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
        DMBelShop.CDS_BuscaRapida.Close;

        // Inicia Processamento de Busca de Notas de Entrada =====================
        While Not IBQ_Filial.Eof do
        Begin
          pgProgBar.Position:=IBQ_Filial.RecNo;

          Screen.Cursor:=crAppStart;
          Refresh;
          Application.ProcessMessages;

          MySql:=' SELECT e.Num_Seq'+
                 ' FROM SIDICOM_ENTRADAS e'+
                 ' WHERE e.codfilial='+QuotedStr(sgCodEmp)+
                 ' AND   e.numero='+QuotedStr(IBQ_Filial.FieldByName('Numero').AsString)+
                 ' AND   e.serie='+QuotedStr(IBQ_Filial.FieldByName('Serie').AsString)+
                 ' AND   e.codcomprovante='+QuotedStr(IBQ_Filial.FieldByName('CodComprovante').AsString)+
                 ' AND   e.codfornecedor='+QuotedStr(IBQ_Filial.FieldByName('CodFornecedor').AsString)+
                 ' AND   e.codproduto='+QuotedStr(IBQ_Filial.FieldByName('CodProduto').AsString)+
                 ' AND   e.datacomprovante='+QuotedStr(IBQ_Filial.FieldByName('DataComprovante').AsString);
          DMBelShop.CDS_BuscaRapida.Close;
          DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
          DMBelShop.CDS_BuscaRapida.Open;
          bSiga:=True;
          If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString)<>'' Then
           bSiga:=False;
          DMBelShop.CDS_BuscaRapida.Close;

          If bSiga Then
          Begin
            Inc(iNumSeq);

            MySql:=' INSERT INTO SIDICOM_ENTRADAS'+
                   ' (NUM_SEQ, CODFILIAL, CODCOMPROVANTE, NUMERO, SERIE, SITUACAONF,'+
                   '  DATAENTRADA, DATACOMPROVANTE, CODFORNECEDOR, CODPRODUTO,'+
                   '  QUANT, QUANT_INFORMADA, DTA_ATUALIZACAO)'+

                   ' VALUES ('+
                   IntToStr(iNumSeq)+', '+
                   QuotedStr(sgCodEmp)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('CodComprovante').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('Numero').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('Serie').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('SituacaoNF').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('DataEntrada').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('DataComprovante').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('CodFornecedor').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('CodProduto').AsString)+', '+
                   QuotedStr(IBQ_Filial.FieldByName('Quant').AsString)+', '+
                   '0, current_date)';
            DMBelShop.SQLC.Execute(MySql,nil,nil);
          End; // If bSiga Then

          IBQ_Filial.Next;
        End; // While Not IBQ_Filial.Eof do
      End; // If IBQ_Filial.FieldByName('Total').AsInteger>0 Then
      IBQ_Filial.Close;

      DateSeparator:='/';
      DecimalSeparator:=',';

      pgProgBar.Position:=0;
      pgProgBar.Refresh;

      OdirPanApres.Visible:=False;
      Dbg_NotasEntDevProdutos.Refresh;
      OdirPanApres.Refresh;

      Screen.Cursor:=crDefault;
    End; // If bBuscaEN Then
    //==========================================================================
    // FIM DA BUSCA DAS NOTAS DE ENTRADAS ======================================
    //==========================================================================

    ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

  Except
    Screen.Cursor:=crDefault;
    OdirPanApres.Visible:=False;
    OdirPanApres.Refresh;

    Dbg_NotasEntDevProdutos.Refresh;

    pgProgBar.Position:=0;
    pgProgBar.Refresh;
  End;

  DateSeparator:='/';
  DecimalSeparator:=',';
End; // Busca Movimentos nas Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmCentralTrocas.CreateToolTips(hWnd: Cardinal);
begin
  hTooltip := CreateWindowEx(0, 'Tooltips_Class32', nil, TTS_ALWAYSTIP or TTS_BALLOON,
  Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),Integer(CW_USEDEFAULT),
  Integer(CW_USEDEFAULT), hWnd, 0, hInstance, nil);

  if hTooltip <> 0 then
  begin
    SetWindowPos(hTooltip, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or  SWP_NOSIZE or SWP_NOACTIVATE);
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
    SendMessage(hTooltip, TTM_ADDTOOL, 0, Integer(lpti));
    FillChar(buffer, sizeof(buffer), #0);
    lstrcpy(buffer, Title);

    if (IconType > 3) or (IconType < 0) then 
      IconType := 0; 

    SendMessage(hTooltip, TTM_SETTITLE, IconType, Integer(@buffer)); 
  end; 
end; // Show Hint em Forma de Balão - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmCentralTrocas.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>
//==============================================================================
// Odir - FIM ==================================================================
//==============================================================================

procedure TFrmCentralTrocas.FormCreate(Sender: TObject);
Var
  MySql: String;
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin

  bgSair     :=False;
  bgEnterTab :=True;

  bgTodosCorredores:=True;
  sgCorredores:='';
  sgCorredoresFilter:='';
  sgPrioridadeFilter:='';
  igCorredores:=0;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Balão - INICIO ======================================
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NotasEntDevBuscaProduto.Handle, @ti, TipoDoIcone, 'Busca Produtos', 'PRODUTOS');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NotasEntDevIncluir.Handle,  @ti, TipoDoIcone, 'Incluir Produto na Lista', 'PRODUTOS');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NotasEntDevColetor.Handle,  @ti, TipoDoIcone, 'Ler Dados do Coletor', 'PRODUTOS');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NotasEntDevBuscaDocto.Handle,  @ti, TipoDoIcone, 'Localiza Docto de Solicitação', 'DOCTO SOLICITAÇÃO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NotasEntDevLocalizar.Handle,  @ti, TipoDoIcone, 'Analisa Notas de Entrada', 'NOTA DE ENTRADA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NotasEntDevExcluiDocto.Handle,  @ti, TipoDoIcone, 'Exclui Docto', 'DOCTO SOLICITAÇÃO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NotasEntDevExcluiItem.Handle,  @ti, TipoDoIcone, 'Exclui Produto do Docto', 'DOCTO SOLICITAÇÃO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NotasEntDevImprimir.Handle,  @ti, TipoDoIcone, 'Imprimir Romaneios de Devolução', 'IMPRESSÃO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NotasEntDevFechar.Handle,  @ti, TipoDoIcone, 'Voltar...', 'CENTRAL DE TROCAS');

  CreateToolTips(Self.Handle);
  AddToolTip(DtaEdt_ReposLojas.Handle,  @ti, TipoDoIcone, 'TECLE <Enter>...', 'CENTRAL DE TROCAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Ckb_ReposLojasPrioridade0.Handle,  @ti, TipoDoIcone, 'Produtos de Campanhas, Folhetos, etc !!'+cr+'Se Repetem...', 'PRIORIDADE 0');

  CreateToolTips(Self.Handle);
  AddToolTip(Ckb_ReposLojasPrioridade1.Handle,  @ti, TipoDoIcone, 'Produtos Solicitados pelo Setor de Compras !!'+cr+'Se Repetem...', 'PRIORIDADE 1');

  CreateToolTips(Self.Handle);
  AddToolTip(Ckb_ReposLojasPrioridade2.Handle,  @ti, TipoDoIcone, 'Produtos Solicitados Direto da Loja !!'+cr+'Se Repetem...', 'PRIORIDADE 2');

  CreateToolTips(Self.Handle);
  AddToolTip(Ckb_ReposLojasPrioridade3.Handle,  @ti, TipoDoIcone, 'Produtos Que Não se Encaixam'+cr+'em Outras Prioridades !!'+cr+'Não Se Repetem...', 'PRIORIDADE 3');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ReposLojasBuscaForn.Handle,  @ti, TipoDoIcone, 'Seleciona Fornecedor da Loja !!', 'REPOSIÇÕES');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ReposLojasLimpaForn.Handle,  @ti, TipoDoIcone, 'Retira Fornecedor'+cr+'Selecionado da Loja !!', 'REPOSIÇÕES');
  // Show Hint em Forma de Balão - FIM =========================================

  // Atualiza Endereços para Seleção ===========================================
  Screen.Cursor:=crAppStart;
  MySql:=' SELECT DISTINCT p.zonaendereco||''.''||p.corredor Corredor'+
         ' FROM ESTOQUE p'+
         ' WHERE p.codfilial=''99'''+
         ' AND   p.zonaendereco is not null'+
         ' AND   p.corredor is not null'+
         ' AND   trim(p.zonaendereco)<>'''''+
         ' AND   trim(p.corredor)<>'''''+
         ' ORDER BY 1';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  CkCbx_ReposLojasCorredor.Items.Clear;
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    CkCbx_ReposLojasCorredor.Items.Add(DMBelShop.CDS_BuscaRapida.FieldByName('Corredor').AsString);

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.Close;
  Screen.Cursor:=crDefault;

end;

procedure TFrmCentralTrocas.FormKeyPress(Sender: TObject; var Key: Char);
begin

  If bgEnterTab Then
  Begin
    If Key = #13 Then
    Begin
      Key:=#0;
      SelectNext(ActiveControl,True,True);
    End;
  End;
end;

procedure TFrmCentralTrocas.FormShow(Sender: TObject);
begin
  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmCentralTrocas);

  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgChange   :=True;

  DMRelatorio.FontDialog.Font.Size:=10;
  DMRelatorio.FontDialog.Font.Name:='Arial';
  DMRelatorio.FontDialog.Font.Style:=[];

  DMCentralTrocas.CriaQueryIB('IBDB_99','IBT_99', IBQ_MPMS, True, True);

  PC_PrincipalChange(Self);

  DtaEdt_ReposLojas.Clear;
  If Ts_ReposLojas.TabVisible Then
  Begin
    DtaEdt_ReposLojas.Date:=StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)));
  End;
end;

procedure TFrmCentralTrocas.Bt_NotasEntDevFecharClick(Sender: TObject);
begin
  // Tambem Usado em: - Pan_AnaliseReposicoes
  //                  - Pan_QtdCaixaCD

  DMCentralTrocas.FechaTudoCentralTrocas;
  DMConexoes.FechaTudoIBDataBases;

  EdtReposLojasCodForn.Clear;
  EdtReposLojasDesForn.Clear;
  EdtReposLojasDesForn.Color:=$00E0E0E0;
  EdtReposLojasDesForn.Font.Color:=clWindowText;

  bgSair:=True;

  Close;
end;

procedure TFrmCentralTrocas.EdtNotasEntDevCodProdutoExit(Sender: TObject);
Var
  MySql: String;
  bCodBarras: Boolean;
begin

  // Verifica se é Busca por Codigo dxe Barras =================================
  bCodBarras:=True;
  If Length(EdtNotasEntDevCodProduto.Text)<7 Then
   bCodBarras:=False;

  sgCodProduto:='';
  EdtNotasEntDevDesProduto.Clear;
  EdtNotasEntDevQtdDevulocao.Clear;

  If Trim(EdtNotasEntDevCodProduto.Text)='' Then
   EdtNotasEntDevCodProduto.Text:='0';

  If (Length(EdtNotasEntDevCodProduto.Text)<7) and (Trim(EdtNotasEntDevCodProduto.Text)<>'0') Then
   EdtNotasEntDevCodProduto.Text:=FormatFloat('000000',StrToInt(EdtNotasEntDevCodProduto.Text));

  If (EdtNotasEntDevCodProduto.Text<>'000000') And (EdtNotasEntDevCodProduto.Text<>'0') Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Produtos ==========================================================
    MySql:=' SELECT pr.apresentacao, pr.codproduto'+
           ' FROM PRODUTO pr';

           If bCodBarras Then
            MySql:=
             MySql+' WHERE Trim(pr.codbarra)='+QuotedStr(EdtNotasEntDevCodProduto.Text)
           Else
            MySql:=
             MySql+' WHERE pr.codproduto='+QuotedStr(EdtNotasEntDevCodProduto.Text);
    MySql:=
     MySql+' UNION'+

           ' SELECT p.apresentacao, b.codproduto'+
           ' FROM PRODUTO p, PRODUTOSBARRA b'+
           ' WHERE p.codproduto=b.codproduto';

           If bCodBarras Then
            MySql:=
             MySql+' AND Trim(b.codbarra)='+QuotedStr(EdtNotasEntDevCodProduto.Text)
           Else
            MySql:=
             MySql+' AND   p.codproduto='+QuotedStr(EdtNotasEntDevCodProduto.Text);
    IBQ_MPMS.Close;
    IBQ_MPMS.SQL.Clear;
    IBQ_MPMS.SQL.Add(MySql);
    IBQ_MPMS.Open;

    Screen.Cursor:=crDefault;

    If Trim(IBQ_MPMS.FieldByName('CodProduto').AsString)='' Then
    Begin
      msg('Produto NÃO Encontrado !!!', 'A');
      IBQ_MPMS.Close;
      EdtNotasEntDevCodProduto.Text:='0';
      EdtNotasEntDevCodProduto.SetFocus;
      Exit;
    End; // If Trim(IBQ_MPMS.FieldByName('CodProduto').AsString)='' Then

    sgCodProduto:=IBQ_MPMS.FieldByName('CodProduto').AsString;
    EdtNotasEntDevDesProduto.Text:=IBQ_MPMS.FieldByName('Apresentacao').AsString;
    IBQ_MPMS.Close;
    EdtNotasEntDevQtdDevulocao.SetFocus;

    // Cria Client para Codigos de Barras ======================================
    Try
      DMCentralTrocas.CDS_V_Geral.CreateDataSet;
    Except
      DMCentralTrocas.CDS_V_Geral.EmptyDataSet;
    End;
    DMCentralTrocas.CDS_V_Geral.Open;

    // Busca Codigo de Barras do Produto =======================================
    MySql:=' SELECT Trim(pr.codbarra) codbarra'+
           ' FROM PRODUTO pr'+
           ' WHERE pr.codproduto='+QuotedStr(sgCodProduto)+

           ' UNION'+

           ' SELECT Trim(b.codbarra) codbarra'+
           ' FROM PRODUTOSBARRA b'+
           ' WHERE b.codproduto='+QuotedStr(sgCodProduto);
    IBQ_MPMS.Close;
    IBQ_MPMS.SQL.Clear;
    IBQ_MPMS.SQL.Add(MySql);
    IBQ_MPMS.Open;

    While Not IBQ_MPMS.Eof do
    Begin
      DMCentralTrocas.CDS_V_Geral.Insert;
      DMCentralTrocas.CDS_V_Geral.FieldByName('CodBarras').AsString:=IBQ_MPMS.FieldByName('CodBarra').AsString;
      DMCentralTrocas.CDS_V_Geral.Post;

      IBQ_MPMS.Next;
    End; // While Not IBQ_MPMS.Eof do
    IBQ_MPMS.Close;
  End; // If EdtNotasEntDevCodProduto.Text<>'000000' Then

end;

procedure TFrmCentralTrocas.EdtNotasEntDevCodProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  // Usando também em: EdtQtdsCaixasCDCodProd

  If not (key in ['0'..'9', Chr(8), Chr(22)]) then
  Begin
    Key := #0;
    Exit;
  End;

end;

procedure TFrmCentralTrocas.Bt_NotasEntDevIncluirClick(Sender: TObject);
Var
  MySql, sQtdExistente: String;
begin
  Dbg_NotasEntDevProdutos.SetFocus;

  If (EdtNotasEntDevCodProduto.Text='000000') Or (EdtNotasEntDevCodProduto.Text='0') Then
  Begin
    msg('Favor Informar a'+cr+cr+'Produto a Devolver !!','A');
    EdtNotasEntDevCodProduto.SetFocus;
    Exit;
  End;

  If EdtNotasEntDevQtdDevulocao.Value=0 Then
  Begin
    msg('Favor Informar a'+cr+cr+'Quantidade a Devolver !!','A');
    EdtNotasEntDevQtdDevulocao.SetFocus;
    Exit;
  End;

  sNumDoc:=VarToStr(EdtNotasEntDevNumSolicitacao.Value);
  If EdtNotasEntDevNumSolicitacao.Value=0 Then
  Begin
    // Localiza o Proximo Numero de Documento de Solicitação
    MySql:=' SELECT COALESCE(MAX(te.num_solicitacao)+1 ,1) NumSolic'+
           ' FROM SIDICOM_TRANSF_ENTADAS te';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sNumDoc:=DMBelShop.CDS_BuscaRapida.FieldByName('NumSolic').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    DtaEdtNotasEntDev.Date:=DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor);
  End; // If EdtNotasEntDevNumSolicitacao.Value=0 Then

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;

    sgDtaInicio:=f_Troca('/','.',DateToStr(DtaEdtNotasEntDev.Date));
    sgDtaInicio:=f_Troca('-','.',sgDtaInicio);

    sQtdExistente:='0';
    sgNumSeq:='0';
    MySql:=' SELECT te.quant_cd, te.Num_Seq'+
           ' FROM SIDICOM_TRANSF_ENTADAS te'+
           ' WHERE te.num_solicitacao='+QuotedStr(sNumDoc)+
           ' AND   te.dta_solicitacao='+QuotedStr(sgDtaInicio)+
           ' AND   te.codproduto='+QuotedStr(sgCodProduto)+
           ' AND te.quant_tra IS NULL'+
           ' AND te.quant_ent IS NULL';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('quant_cd').AsString)<>'' Then
    Begin
      sQtdExistente:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('quant_cd').AsString);
      sgNumSeq     :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString);
    End;
    DMBelShop.CDS_BuscaRapida.Close;

    If StrToIntDef(sQtdExistente,0)<>0 Then
    Begin
      MySql:=' DELETE FROM SIDICOM_TRANSF_ENTADAS te'+
             ' WHERE te.num_solicitacao='+QuotedStr(sNumDoc)+
             ' AND   te.dta_solicitacao='+QuotedStr(sgDtaInicio)+
             ' AND   te.codproduto='+QuotedStr(sgCodProduto)+
             ' AND   te.quant_tra IS NULL'+
             ' AND   te.quant_ent IS NULL'+
             ' AND   te.Num_Seq='+sgNumSeq;
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End; // If StrToIntDef(sQtdExistente,0)<>0 Then

    If StrToIntDef(sgNumSeq,0)=0 Then
    Begin
      MySql:=' SELECT Coalesce(max(te.Num_Seq)+1 ,1) Num_Seq'+
             ' FROM SIDICOM_TRANSF_ENTADAS te';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;
      sgNumSeq:=DMBelShop.CDS_BuscaRapida.FieldByName('Num_Seq').AsString;
      DMBelShop.CDS_BuscaRapida.Close;
    End; // If StrToIntDef(sgNumSeq,0)=0 Then

    MySql:=' INSERT INTO SIDICOM_TRANSF_ENTADAS'+
           ' (num_solicitacao, dta_solicitacao, codproduto, quant_cd, ind_impresso, Num_Seq, usu_inclui)'+
           ' VALUES ('+
           QuotedStr(sNumDoc)+', '+
           QuotedStr(sgDtaInicio)+', '+
           QuotedStr(sgCodProduto)+', '+
           QuotedStr(f_Troca(',','.',VarToStr(EdtNotasEntDevQtdDevulocao.Value+StrToCurr(sQtdExistente))))+', '+
           QuotedStr('N')+', '+
           QuotedStr(sgNumSeq)+', '+
           QuotedStr(Cod_Usuario)+')';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    Screen.Cursor:=crDefault;

    EdtNotasEntDevNumSolicitacao.Value:=StrToInt(sNumDoc);
    EdtNotasEntDevNumSolicitacaoExit(Self);
    DMCentralTrocas.CDS_Transf_Cd.Locate('CODPRODUTO', sgCodProduto,[]);

    EdtNotasEntDevCodProduto.Clear;
    EdtNotasEntDevDesProduto.Clear;
    EdtNotasEntDevQtdDevulocao.Clear;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

  EdtNotasEntDevCodProduto.SetFocus;

end;

procedure TFrmCentralTrocas.EdtNotasEntDevNumSolicitacaoChange(Sender: TObject);
Var
  MySql: String;
begin
  // Fecha os dois Clients
  If bgChange Then
  Begin
    DMCentralTrocas.CDS_NotasEntrada.Close;
    DMCentralTrocas.CDS_Transf_Cd.Close;
  End;
  bgChange   :=True;

  EdtNotasEntDevCodProduto.Enabled:=True;
  EdtNotasEntDevQtdDevulocao.Enabled:=True;
  Bt_NotasEntDevBuscaProduto.Enabled:=True;
  Bt_NotasEntDevIncluir.Enabled:=True;
  Bt_NotasEntDevColetor.Enabled:=True;
  Bt_NotasEntDevLocalizar.Enabled:=True;
  Bt_NotasEntDevExcluiDocto.Enabled:=True;
  Bt_NotasEntDevExcluiItem.Enabled:=True;
  Cbx_NotasEntDevCondicao.Enabled:=True;

  If EdtNotasEntDevNumSolicitacao.Value<>0 Then
  Begin
    MySql:=' SELECT FIRST 1 te.num_solicitacao'+
           ' FROM SIDICOM_TRANSF_ENTADAS te'+
           ' WHERE te.quant_ent IS NULL'+
           ' AND   te.num_solicitacao='+VarToStr(EdtNotasEntDevNumSolicitacao.Value);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.fieldByName('Num_Solicitacao').AsString)='' Then
    Begin
      EdtNotasEntDevCodProduto.Enabled:=False;
      EdtNotasEntDevQtdDevulocao.Enabled:=False;

      Bt_NotasEntDevBuscaProduto.Enabled:=False;
      Bt_NotasEntDevIncluir.Enabled:=False;
      Bt_NotasEntDevColetor.Enabled:=False;
      Bt_NotasEntDevLocalizar.Enabled:=False;
      Bt_NotasEntDevExcluiDocto.Enabled:=False;
      Bt_NotasEntDevExcluiItem.Enabled:=False;

      Cbx_NotasEntDevCondicao.Enabled:=False;
    End; // If Trim(DMBelShop.CDS_BuscaRapida.fieldByName('CodFilial').AsString)<>'' Then
    DMBelShop.CDS_BuscaRapida.Close;
  End;
end;

procedure TFrmCentralTrocas.Bt_NotasEntDevBuscaProdutoClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_NotasEntDevProdutos.SetFocus;

  sgCodProduto:='';
  EdtNotasEntDevCodProduto.Clear;
  EdtNotasEntDevDesProduto.Clear;
  EdtNotasEntDevQtdDevulocao.Clear;
  Refresh;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisaIB:=TFrmPesquisaIB.Create(Self);

  FrmPesquisaIB.IBCDS_Pesquisa.DBConnection:=IBQ_MPMS.Database;
  FrmPesquisaIB.IBCDS_Pesquisa.DBTransaction:=IBQ_MPMS.Transaction;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.Apresentacao Produto, p.CodProduto'+
         ' FROM PRODUTO p'+
         ' WHERE p.principalfor NOT IN (''000300'', ''000500'', ''000883'', ''010000'', ''001072'')'+
         ' AND   p.codaplicacao NOT IN (''0016'', ''0015'', ''0017'')'+
         ' Order by p.Apresentacao';
  FrmPesquisaIB.IBCDS_Pesquisa.Close;
  FrmPesquisaIB.IBCDS_Pesquisa.CommandText:=MySql;
  FrmPesquisaIB.IBCDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('CodProduto').AsString)='' Then
  Begin
    msg('Sem Produto a Listar !!','A');
    EdtNotasEntDevCodProduto.Clear;
    FrmPesquisaIB.IBCDS_Pesquisa.Close;
    FreeAndNil(FrmPesquisaIB);
    EdtNotasEntDevCodProduto.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisaIB.Campo_pesquisa:='Produto';
  FrmPesquisaIB.Campo_Codigo:='CodProduto';
  FrmPesquisaIB.Campo_Descricao:='Produto';
  FrmPesquisaIB.EdtDescricao.Clear;
  FrmPesquisaIB.Campo_Retorno1:='';

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisaIB.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then
  Begin
    sgCodProduto:=FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('CodProduto').AsString;

    EdtNotasEntDevCodProduto.Text:=FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('CodProduto').AsString;
    EdtNotasEntDevDesProduto.Text:=FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('Produto').AsString;
    EdtNotasEntDevQtdDevulocao.SetFocus;
  End; // If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then

  FrmPesquisaIB.IBCDS_Pesquisa.Close;
  FreeAndNil(FrmPesquisaIB);
end;

procedure TFrmCentralTrocas.EdtNotasEntDevNumSolicitacaoExit(Sender: TObject);
begin
  If EdtNotasEntDevNumSolicitacao.AsInteger<>0 Then
  Begin
    EdtNotasEntDevCodProduto.Clear;
    EdtNotasEntDevDesProduto.Clear;
    EdtNotasEntDevContaBarras.Clear;

    DMCentralTrocas.CDS_Transf_Cd.Close;
    DMCentralTrocas.SDS_Transf_Cd.Params.ParamByName('NUMERO').Value:=IntToStr(EdtNotasEntDevNumSolicitacao.AsInteger);
    DMCentralTrocas.CDS_Transf_Cd.Open;

    If DMCentralTrocas.CDS_Transf_Cd.IsEmpty Then
    Begin
      DMCentralTrocas.CDS_NotasEntrada.Close;
      DMCentralTrocas.CDS_Transf_Cd.Close;

      msg('Docto Não Encontrado !!','A');
      EdtNotasEntDevNumSolicitacao.Value:=0;
      EdtNotasEntDevNumSolicitacao.SetFocus;
      Exit;
    End;

    bgChange:=False;
    DtaEdtNotasEntDev.Date:=DMCentralTrocas.CDS_Transf_CdDTA_SOLICITACAO.AsDateTime;
    bgChange:=True;
  End; // If EdtNotasEntDevNumSolicitacao.AsInteger<>0 Then

  If EdtNotasEntDevNumSolicitacao.AsInteger=0 Then
  Begin
    DMCentralTrocas.CDS_Transf_Cd.Close;
    DMCentralTrocas.CDS_NotasEntrada.Close;

    EdtNotasEntDevCodProduto.SetFocus;
  End; // If EdtNotasEntDevNumSolicitacao.AsInteger=0 Then

end;

procedure TFrmCentralTrocas.DtaEdtNotasEntDevChange(Sender: TObject);
begin
  // Fecha os dois Clients
  If bgChange Then
  Begin
    If (Sender is TJvDateEdit) Then
    Begin
      If Trim((Sender as TJvDateEdit).Name)='DtaEdtNotasEntDev' Then
      Begin
        DMCentralTrocas.CDS_NotasEntrada.Close;
        DMCentralTrocas.CDS_Transf_Cd.Close;
        EdtNotasEntDevNumSolicitacao.Clear;
      End;
    End; // If (Sender is TJvDateEdit) Then
  End;
  bgChange   :=True;
end;

procedure TFrmCentralTrocas.Bt_NotasEntDevBuscaDoctoClick(Sender: TObject);
Var
  MySql: String;
begin
  Try
    Dbg_NotasEntDevProdutos.SetFocus;

    Try
      StrToDate(DtaEdtNotasEntDev.Text);
    Except
      msg('Data Para Pesquisa Inválida !!','A');
      DtaEdtNotasEntDev.SetFocus;
      Exit
    End;

    EdtNotasEntDevNumSolicitacao.Value:=0;
    EdtNotasEntDevNumSolicitacaoExit(Self);

    // ========== EFETUA A CONEXÃO ===============================================
    FrmPesquisa:=TFrmPesquisa.Create(Self);

    // ========== EXECUTA QUERY PARA PESQUISA ====================================
    Screen.Cursor:=crAppStart;

    sgDtaInicio:=f_Troca('/','.',DateToStr(DtaEdtNotasEntDev.Date));
    sgDtaInicio:=f_Troca('-','.',sgDtaInicio);
    MySql:=' SELECT te.num_solicitacao, te.dta_solicitacao,'+
           ' CASE'+
           '   WHEN te.quant_ent IS NULL THEN'+
           '    ''NAO'''+
           '   ELSE'+
           '    ''SIM'''+
           ' END Processado'+
           ' FROM SIDICOM_TRANSF_ENTADAS te'+
           '   LEFT JOIN  sidicom_entradas en ON te.num_seq_ent=en.num_seq'+
           ' WHERE te.dta_solicitacao='+QuotedStr(sgDtaInicio)+
           ' GROUP BY 1,2,3'+
           ' ORDER BY 3,1 DESC';
    DMBelShop.CDS_Pesquisa.Close;
    DMBelShop.CDS_Pesquisa.Filtered:=False;
    DMBelShop.SDS_Pesquisa.CommandText:=MySql;
    DMBelShop.CDS_Pesquisa.Open;

    Screen.Cursor:=crDefault;

    // ============== Verifica Existencia de Dados ===============================
    If Trim(DMBelShop.CDS_Pesquisa.FieldByName('num_solicitacao').AsString)='' Then
    Begin
      msg('Sem Docto a Listar !!','A');
      DMBelShop.CDS_Pesquisa.Close;
      FreeAndNil(FrmPesquisa);
      DtaEdtNotasEntDev.SetFocus;
      Exit;
    End;

    // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
    FrmPesquisa.Campo_pesquisa:='num_solicitacao';
    FrmPesquisa.Campo_Codigo:='num_solicitacao';
    FrmPesquisa.Campo_Descricao:='num_solicitacao';
  //  FrmPesquisa.EdtDescricao.Clear;

    // ============= ABRE FORM DE PESQUISA =======================================
    FrmPesquisa.ShowModal;
    DMBelShop.CDS_Pesquisa.Close;

    // ============= RETORNO =====================================================
    If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
    Begin
      EdtNotasEntDevNumSolicitacao.Value:=StrToInt(FrmPesquisa.EdtDescricao.Text);
      EdtNotasEntDevNumSolicitacaoExit(Self);
      Dbg_NotasEntDevProdutos.SetFocus;
    End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Except
    on e : Exception do
    Begin
      MessageBox(Handle, pChar(e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End;

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmCentralTrocas.Bt_NotasEntDevLocalizarClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_NotasEntDevProdutos.SetFocus;

  If DMCentralTrocas.CDS_Transf_Cd.IsEmpty Then
  Begin
    msg('Sem Produto a Analisar !!','A');
    Exit;
  end;

  If (Cbx_NotasEntDevCondicao.ItemIndex>1) Or (Cbx_NotasEntDevCondicao.ItemIndex<0) Then
  Begin
    msg('Condição de Pesquisa Inválida !!','A');
    Cbx_NotasEntDevCondicao.SetFocus;
    Exit;
  end;

  // Solicita os Fornecedores a Processar  =====================================
  MySql:=' SELECT DISTINCT ''NAO'' PROC, pr.principalfor, pr.nomefornecedor'+
         ' FROM SIDICOM_TRANSF_ENTADAS te'+
         '     LEFT JOIN produto pr ON pr.codproduto=te.codproduto'+
         ' WHERE te.num_solicitacao='+VarToStr(EdtNotasEntDevNumSolicitacao.Value)+
         ' AND   te.quant_tra IS NULL'+
         ' AND   te.quant_ent IS NULL'+
         ' ORDER BY 2';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  If Trim(DMBelShop.CDS_Busca.FieldByName('principalfor').AsString)='' Then
  Begin
    DMBelShop.CDS_Busca.Close;
    msg('Sem Fornecedor a Analisar !!','A');
    EdtNotasEntDevNumSolicitacao.SetFocus;
    Exit;
  End;

  sgFornecedores:=DMBelShop.CDS_Busca.FieldByName('principalfor').AsString;
  If DMBelShop.CDS_Busca.RecordCount>1 Then
  Begin
    sgFornecedores:='';
    FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
    AbreSolicitacoes(18);

    FrmSolicitacoes.Caption:='Selecione o Fornecedor';
    FrmSolicitacoes.bgOK:=False;

    FrmSolicitacoes.ShowModal;

    // Não Quis Selecionar =====================================================
    If Not FrmSolicitacoes.bgOK Then
    Begin
      FreeAndNil(FrmSolicitacoes);
      Exit;
    End;

    DMBelShop.CDS_Busca.First;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then
      Begin
        If Trim( sgFornecedores)='' Then
         sgFornecedores:=DMBelShop.CDS_Busca.FieldByName('principalfor').AsString
        Else
         sgFornecedores:=sgFornecedores+', '+DMBelShop.CDS_Busca.FieldByName('principalfor').AsString;
      End; // If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
  End; // If DMBelShop.CDS_Busca.RecordCount>1 Then
  FreeAndNil(FrmSolicitacoes);
  DMBelShop.CDS_Busca.Close;

  If Trim(sgFornecedores)=''  Then
  Begin
    msg('Sem Fornecedor a Analisar !!','A');
    EdtNotasEntDevNumSolicitacao.SetFocus;
    Exit;
  End;

  If msg('Deseja Realmente Iniciar a Pesquisa'+cr+cr+'de Notas Fiscais de Entrada ??','C')=2 Then
   Exit;

  // Seleciona Lojas ===========================================================
  sgOutrasEmpresa:='(99)'; // Inclui Outras Empresas
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False; // Empresa 06 Checada
  FrmSelectEmpProcessamento.ShowModal;

  // Verifica se Existe Empresa a Processar ====================================
  If FrmSelectEmpProcessamento.iNrEmpProc=0 Then
  Begin
    FreeAndNil(FrmSelectEmpProcessamento);
    Exit;
  End; // If FrmSelectEmpProcessamento.iNrEmpProc=1 Then
  FreeAndNil(FrmSelectEmpProcessamento);

  // ===========================================================================
  // Verifica se Processa Todas as Empresas ====================================
  // ===========================================================================
  sgCodLojas:='';
  bgTodasEmpresas:=True;
  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
     Begin
       // Ataluza sEmpresa para Sql ---------------------------------
       If sgCodLojas='' Then
        sgCodLojas:=QuotedStr(DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString)
       Else
        sgCodLojas:=sgCodLojas+', '+QuotedStr(DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString);
     End
    Else // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
     Begin
       bgTodasEmpresas:=False;
     End; // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; //   While Not DMBelShop.CDS_EmpProcessa.Eof do

  // Verifica se Transação esta Ativa ==========================================
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try

    DateSeparator:='.';
    DecimalSeparator:='.';

    OdirPanApres.Visible:=False;
    OdirPanApres.Refresh;

    Dbg_NotasEntDevProdutos.Refresh;

    // Analisa Transferencis para Devolução ====================================
    AnalisaNfTransfDevolucao;

    DateSeparator:='.';
    DecimalSeparator:='.';
    // Atualiza os Produtos Sem Nota Fiscal de Entrada =========================
    MySql:=' UPDATE SIDICOM_TRANSF_ENTADAS e'+
           ' SET e.num_seq_tra=0,'+
           '     e.num_seq_ent=0,'+
           '     e.quant_tra=0,'+
           '     e.quant_ent=0'+
           ' WHERE e.num_solicitacao='+VarToStr(EdtNotasEntDevNumSolicitacao.Value)+
           ' AND   e.quant_ent IS NULL'+
           ' AND EXISTS (SELECT 1'+
           '             FROM produto p'+
           '             WHERE p.codproduto=e.codproduto'+
           '             AND   p.principalfor IN ('+sgFornecedores+'))';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    OdirPanApres.Visible:=False;
    OdirPanApres.Refresh;

    Dbg_NotasEntDevProdutos.Refresh;

    DateSeparator:='/';
    DecimalSeparator:=',';

    Screen.Cursor:=crDefault;

    EdtNotasEntDevNumSolicitacaoExit(Self);
    bgChange:=False;
    EdtNotasEntDevNumSolicitacaoChange(Self);
    bgChange:=True;

    msg('Analise de Devoluções'+cr+cr+'Efetuada com SUCESSO !!','A');
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);
      FrmBelShop.MontaProgressBar(False, FrmCentralTrocas);

      OdirPanApres.Visible:=False;
      OdirPanApres.Refresh;

      Dbg_NotasEntDevProdutos.Refresh;

      DateSeparator:='/';
      DecimalSeparator:=',';

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

end;

procedure TFrmCentralTrocas.Dbg_NotasEntDevNFEDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If (Column.FieldName='NFE_FORNECEDOR') Then
  Begin
   If DMCentralTrocas.CDS_NotasEntradaNFE_FORNECEDOR.AsString='NOTA FISCAL DE ENTRADA NÃO ENCONTRADA' Then
   Begin
     Dbg_NotasEntDevNFE.Canvas.Font.Color:=clWhite; // Cor da Fonte
     Dbg_NotasEntDevNFE.Canvas.Font.Style:=[fsBold]; // Estilo da Fonte
     Dbg_NotasEntDevNFE.Canvas.Brush.Color:=clRed;  // Cor da Celula

     Dbg_NotasEntDevNFE.Canvas.FillRect(Rect);
     Dbg_NotasEntDevNFE.DefaultDrawDataCell(Rect,Column.Field,state);
   End;
  End

end;

procedure TFrmCentralTrocas.Rb_NotasEntDevDocAtualClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_NotasEntDevDocAtual);
  AcertaRb_Style(Rb_NotasEntDevDocsDia);

end;

procedure TFrmCentralTrocas.Rb_NotasEntDevDocAtualKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_NotasEntDevDocAtualClick(Self);
end;

procedure TFrmCentralTrocas.Bt_NotasEntDevExcluiDoctoClick(Sender: TObject);
Var
  MySql: String;
  b: Boolean;
begin
  Dbg_NotasEntDevProdutos.SetFocus;

  If DMCentralTrocas.CDS_Transf_Cd.IsEmpty Then
   Exit;

  If EdtNotasEntDevNumSolicitacao.Value=0 Then
   Exit;

  b:=True;
  DMCentralTrocas.CDS_Transf_Cd.First;
  DMCentralTrocas.CDS_Transf_Cd.DisableControls;
  While Not DMCentralTrocas.CDS_Transf_Cd.Eof do
  Begin
    If DMCentralTrocas.CDS_Transf_CdSIT.AsString='F' Then // <F> Fechado
    Begin
      b:=False;
      Break;
    End;
    DMCentralTrocas.CDS_Transf_Cd.Next;
  End;
  DMCentralTrocas.CDS_Transf_Cd.EnableControls;
  DMCentralTrocas.CDS_Transf_Cd.First;

  If Not b Then
  Begin
    msg('Impossível Excluir o Docto !!'+cr+cr+'Existem Produtos Já Fechados !!','A');
    Exit;
  End;

  If Not Bt_NotasEntDevLocalizar.Enabled Then
  Begin
    msg('Impossível Excluir Este Docto !!'+cr+cr+'Docto já Analisado !!','A');
    Exit;
  End;

  If msg('Deseja Realmente Excluir o'+cr+cr+'Docto Número: '+VarToStr(EdtNotasEntDevNumSolicitacao.Value)+' ??','C')=2 Then
   Exit;

  If msg('Todos os Produtos do Docto Serão Excluídos !!'+cr+cr+'Deseja Continuar com a Exclusão do Docto ??','C')=2 Then
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

    MySql:=' DELETE FROM SIDICOM_TRANSF_ENTADAS te'+
           ' WHERE te.num_solicitacao='+VarToStr(EdtNotasEntDevNumSolicitacao.Value);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

    EdtNotasEntDevNumSolicitacao.Value:=0;
    EdtNotasEntDevNumSolicitacaoExit(Self);
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

end;

procedure TFrmCentralTrocas.Bt_NotasEntDevImprimirClick(Sender: TObject);
Var
  MySql: String;
  mMemo: TMemo;
  sCodLoja, sPasta_Relatorio, sImpressos: String;
  iRecNo, i: Integer;

  Printer: TPrinter;
  iIndexImpPadrao, iIndexPDFCreator:integer;
begin
  Dbg_NotasEntDevProdutos.SetFocus;

  If DMCentralTrocas.CDS_Transf_Cd.IsEmpty Then
   Exit;

  If EdtNotasEntDevNumSolicitacao.Value=0 Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Montando Relatório de Romaneio de Devoluções ...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  OdirPanApres.Refresh;

  iRecNo:=DMCentralTrocas.CDS_Transf_Cd.RecNo;

  // Busca Docto(s) e Loja(s) ==================================================
  MySql:=' SELECT te.num_solicitacao, en.codfilial'+

         ' FROM SIDICOM_TRANSF_ENTADAS te'+
         '     LEFT JOIN SIDICOM_ENTRADAS en ON te.num_seq_ent=en.num_seq'+

         ' WHERE te.quant_ent IS NOT NULL'+
         ' AND   te.quant_ent<>0'+
         ' AND   te.Ind_Impresso=''N''';

         If Rb_NotasEntDevDocsDia.Checked Then
          MySql:=MySql+' AND te.dta_solicitacao='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdtNotasEntDev.Date))));

         If Rb_NotasEntDevDocAtual.Checked Then
          MySql:=MySql+' AND te.num_solicitacao='+VarToStr(EdtNotasEntDevNumSolicitacao.Value);

         MySql:=
           MySql+' GROUP BY 1,2'+
                 ' ORDER BY 2';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  If DMBelShop.CDS_Busca.Eof Then
  Begin
    msg('Romaneio Sem Produto a Listar !!','A');
    DMBelShop.CDS_Busca.Close;
    OdirPanApres.Visible:=False;
    OdirPanApres.Refresh;
    Exit;
  End;

  // Cria Componente Memo para Filiais/Lojas ===================================
  mMemo:=TMemo.Create(Self);
  mMemo.Visible:=False;
  mMemo.Parent:=FrmCentralTrocas;
  mMemo.Width:=500;
  mMemo.Lines.Clear;

  sImpressos:='';
  mMemo.Lines.Clear;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    mMemo.Lines.Add(DMBelShop.CDS_Busca.FieldByName('codfilial').AsString);

    If sImpressos='' Then
     Begin
       sImpressos:=DMBelShop.CDS_Busca.FieldByName('num_solicitacao').AsString;
     End
    Else
     Begin
       if Pos(DMBelShop.CDS_Busca.FieldByName('num_solicitacao').AsString, sImpressos) = 0 then
        sImpressos:=sImpressos+' / '+DMBelShop.CDS_Busca.FieldByName('num_solicitacao').AsString;
     End;

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.Close;

  // Diretorio dos Relatórios -------------------------------------
  {$IFDEF MSWINDOWS}
    sPasta_Relatorio:= ExtractFilePath(Application.ExeName)+'Relatorios\';
  {$ENDIF}

  DMRelatorio.frDBDataSet1.DataSet:=DMCentralTrocas.CDS_RomaneioDev;
  DMRelatorio.frReport1.LoadFromFile(sPasta_Relatorio+'RomaneioDevolucoes.frf');

  // Atualiza Variaveis -------------------------------------------
  DMRelatorio.frReport1.Dictionary.Variables.Variable['Impressos']:=#39+sImpressos+#39;

  // Localiza Impressora PDFCreator ========================================
  Printer:=TPrinter.Create;
  Printer.Printers;
  iIndexImpPadrao:=Printer.PrinterIndex;

  For iIndexPDFCreator:=0 to Printer.Printers.Count - 1 do
  Begin
    If Printer.Printers.Strings[iIndexPDFCreator]='PDFCreator' Then
     Break;
  End; // For iIndexPDFCreator:=0 to Printer.Printers.Count - 1 do
  DMRelatorio.frReport1.ChangePrinter(iIndexImpPadrao,iIndexPDFCreator);

  FreeAndNil(Printer);
  
  // Imprime Lojas =============================================================
  sCodLoja:='';
  For i:=0 to mMemo.Lines.Count-1 do
  Begin
    If sCodLoja<>mMemo.Lines[i] Then
    Begin
      MySql:=' SELECT ''Bel_''||en.codfilial||'' - ''||TRIM(em.razao_social) Des_Loja,'+
             ' CASE'+
             '   WHEN SUBSTRING(em.num_cnpj FROM 14 FOR 1)<>'''' THEN'+
             '     SUBSTRING(em.num_cnpj FROM 1 FOR 2) || ''.'' ||'+
             '     SUBSTRING(em.num_cnpj FROM 3 FOR 3) || ''.'' ||'+
             '     SUBSTRING(em.num_cnpj FROM 6 FOR 3) || ''/'' ||'+
             '     SUBSTRING(em.num_cnpj FROM 9 FOR 4) || ''-'' ||'+
             '     SUBSTRING(em.num_cnpj FROM 13 FOR 2)'+
             '   ELSE'+
             '     SUBSTRING(em.num_cnpj FROM 1 FOR 3) || ''.'' ||'+
             '     SUBSTRING(em.num_cnpj FROM 4 FOR 3) || ''.'' ||'+
             '     SUBSTRING(em.num_cnpj FROM 7 FOR 3) || ''-'' ||'+
             '     SUBSTRING(em.num_cnpj FROM 10 FOR 2)'+
             ' END NUM_CNPJ,'+
             ' CASE'+
             '   WHEN TRIM(em.compl_endereco)='''' THEN'+
             '     TRIM(em.des_endereco)||'', ''||TRIM(em.num_endereco)'+
             '   ELSE'+
             '     TRIM(em.des_endereco)||'', ''||TRIM(em.num_endereco)||''/''|| TRIM(em.compl_endereco)'+
             ' END Endereco,'+
             ' TRIM(em.des_bairro) Des_Bairro,'+
             ' TRIM(em.des_cidade) Des_Cidade,'+
             ' TRIM(em.cod_uf) cod_uf, em.cod_cep,'+
             ' TRIM(en.codfornecedor)||'' - ''|| TRIM(fo.nomefornecedor) NomeFornecedor,'+
             ' TRIM(fo.contato) Contato,'+
             ' TRIM(fo.fone1)||'' - ''||TRIM(fo.fone2) Telefones,'+
             ' TRIM(fo.email) Email,'+
             ' en.codcomprovante, TRIM(en.numero) numero, TRIM(en.serie) serie,'+
             ' CASE'+
             '   WHEN en.situacaonf=0 THEN ''Pendente'''+
             '   ELSE ''Lançada'''+
             ' END situacaonf,'+
             ' en.datacomprovante, en.dataentrada,'+
             ' te.codproduto||'' - ''||TRIM(pr.apresentacao) NomeProduto,'+
             ' TRIM(pr.unidade) Unid,'+QuotedStr(Des_Usuario)+' usuario,'+
             ' COALESCE(lp.precocompra,0) PrecoCompra,'+
             ' SUM(te.quant_ent) qtd_devolver'+

             ' FROM SIDICOM_TRANSF_ENTADAS te'+
             '    LEFT JOIN SIDICOM_ENTRADAS en ON en.num_seq   =te.num_seq_ent'+
             '    LEFT JOIN PRODUTO pr          ON pr.codproduto=te.codproduto'+
             '    LEFT JOIN EMP_CONEXOES em     ON em.cod_filial=en.codfilial'+
             '    LEFT JOIN FORNECEDOR fo       ON en.codfornecedor=fo.codfornecedor'+
             '    LEFT JOIN LISTAPRE lp         ON lp.codlista=em.cod_listapre'+
             '                                 AND lp.codproduto=te.codproduto'+

             ' WHERE te.quant_ent IS NOT NULL'+
             ' AND   te.quant_ent<>0'+
             ' AND   te.Ind_Impresso=''N'''+

             ' AND   en.codfilial='+QuotedStr(mMemo.Lines[i]);

             If Rb_NotasEntDevDocsDia.Checked Then
              MySql:=MySql+' AND te.dta_solicitacao='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdtNotasEntDev.Date))));

             If Rb_NotasEntDevDocAtual.Checked Then
              MySql:=MySql+' AND te.num_solicitacao='+VarToStr(EdtNotasEntDevNumSolicitacao.Value);

             MySql:=
               MySql+' GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21'+

                     ' UNION'+

                     ' SELECT ''Bel_''||en1.codfilial||'' - ''||TRIM(em1.razao_social) Des_Loja,'+
                     ' '''' NUM_CNPJ, '''' Endereco, '''' des_bairro, '''' des_cidade,'+
                     ' '''' cod_uf, '''' cod_cep,'+
                     ' ''00 - TRANSFERÊNCIAS DO CD PARA A LOJA:'' NomeFornecedor,'+
                     ' '''' contato, '''' Telefones, '''' email, '''' codcomprovante,'+
                     ' '''' numero, '''' serie,'+
                     ' '''' situacaonf,'+
                     ' current_date datacomprovante,'+
                     ' current_date dataentrada,'+
                     ' te1.codproduto||'' - ''||TRIM(pr1.apresentacao) NomeProduto,'+
                     ' pr1.unidade Unid, '+QuotedStr(Des_Usuario)+' Usuario,'+
                     ' COALESCE(lp1.precocompra,0) PrecoCompra,'+
                     ' SUM(te1.quant_ent) qtd_devolver'+

                     ' FROM SIDICOM_TRANSF_ENTADAS te1'+
                     '    LEFT JOIN SIDICOM_ENTRADAS en1 ON en1.num_seq=te1.num_seq_ent'+
                     '    LEFT JOIN PRODUTO pr1          ON pr1.codproduto=te1.codproduto'+
                     '    LEFT JOIN EMP_CONEXOES em1     ON em1.cod_filial=en1.codfilial'+
                     '    LEFT JOIN LISTAPRE lp1         ON lp1.codlista=em1.cod_listapre'+
                     '                                  AND lp1.codproduto=te1.codproduto'+

                     ' WHERE te1.quant_ent IS NOT NULL'+
                     ' AND   te1.quant_ent<>0'+
                     ' AND   te1.Ind_Impresso=''N'''+

                     ' AND   en1.codfilial='+QuotedStr(mMemo.Lines[i]);

                     If Rb_NotasEntDevDocsDia.Checked Then
                      MySql:=MySql+' AND te1.dta_solicitacao='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtaEdtNotasEntDev.Date))));

                     If Rb_NotasEntDevDocAtual.Checked Then
                      MySql:=MySql+' AND te1.num_solicitacao='+VarToStr(EdtNotasEntDevNumSolicitacao.Value);

                     MySql:=
                       MySql+' GROUP BY 1,8,18,19,20,21'+
                             ' ORDER BY 1,8,13,18';
      DMCentralTrocas.CDS_RomaneioDev.Close;
      DMCentralTrocas.SDS_RomaneioDev.CommandText:=MySql;
      DMCentralTrocas.CDS_RomaneioDev.Open;

      DMRelatorio.frReport1.PrepareReport;
      DMRelatorio.frReport1.ShowReport;

      DMCentralTrocas.CDS_RomaneioDev.Close;
    End; // If sCodLoja<>mMemo.Lines[i] Then

    sCodLoja:=mMemo.Lines[i];
  End; // For i:=0 to mMemo.Lines.Count-1 do

  FreeAndNil(mMemo);

  // Marca como Impresso =======================================================
  MarcarComoImpresso;

  DMCentralTrocas.CDS_Transf_Cd.RecNo:=iRecNo;
  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;
  Refresh;

  msg('Impressão Efetuada com Sucesso !!','A');

end;

procedure TFrmCentralTrocas.Bt_NotasEntDevExcluiItemClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_NotasEntDevProdutos.SetFocus;

  If DMCentralTrocas.CDS_Transf_Cd.IsEmpty Then
   Exit;

  If EdtNotasEntDevNumSolicitacao.Value=0 Then
   Exit;

  If Not Bt_NotasEntDevLocalizar.Enabled Then
  Begin
    msg('Impossível Excluir o Produto Selecionado !!'+cr+cr+'Docto já Analisado !!','A');
    Exit;
  End;

  If msg('Deseja Realmente Excluir o'+cr+'Produto Selecionado: '+cr+cr+DMCentralTrocas.CDS_Transf_CdAPRESENTACAO.AsString+' ??','C')=2 Then
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

    MySql:=' DELETE FROM SIDICOM_TRANSF_ENTADAS te'+
           ' WHERE te.num_solicitacao='+VarToStr(EdtNotasEntDevNumSolicitacao.Value)+
           ' AND   te.codProduto='+QuotedStr(DMCentralTrocas.CDS_Transf_CdCODPRODUTO.AsString);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

    EdtNotasEntDevNumSolicitacaoExit(Self);
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

  EdtNotasEntDevCodProduto.SetFocus;

end;

procedure TFrmCentralTrocas.EdtNotasEntDevCodProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key=VK_F9 Then
  Begin
    If (Sender is TEdit) Then
    Begin
      If Trim((Sender as TEdit).Name)='EdtNotasEntDevCodProduto' Then
       Bt_NotasEntDevBuscaProdutoClick(Self);
    End; // If (Sender is TEdit) Then
  End; // If Key=VK_F9 Then

end;

procedure TFrmCentralTrocas.EdtNotasEntDevNumSolicitacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key=VK_F9 Then
  Begin
    If (Sender is TEdit) Then
    Begin
      If Trim((Sender as TEdit).Name)='EdtNotasEntDevNumSolicitacao' Then
       Bt_NotasEntDevBuscaDoctoClick(Self);
    End; // If (Sender is TEdit) Then
  End; // If Key=VK_F9 Then

end;

procedure TFrmCentralTrocas.EdtNotasEntDevCodProdutoChange(Sender: TObject);
begin
  // Usado em: EdtQtdCaixaCDCodProdChange

  If (Sender is TEdit) Then
  Begin
    If Trim((Sender as TEdit).Name)='EdtNotasEntDevCodProduto' Then
    Begin
      If Length(EdtNotasEntDevCodProduto.Text)=13 Then
      Begin
        EdtNotasEntDevQtdDevulocao.Value:=0;
        EdtNotasEntDevQtdDevulocao.SetFocus;
      End;
    End;

    If Trim((Sender as TEdit).Name)='EdtQtdCaixaCDCodProd' Then
    Begin
      If (Length(EdtQtdCaixaCDCodProd.Text)<6) Or ((Length(EdtQtdCaixaCDCodProd.Text)>6) and (Length(EdtQtdCaixaCDCodProd.Text)<13)) Then
      Begin
        EdtQtdCaixaCDQtdCxProd.Value:=0;
        EdtQtdCaixaCDPercCxProd.Value:=0;
        EdtQtdCaixaCDDesProd.Clear;
      End;
    End;
  End; // If (Sender is TEdit) Then
end;

procedure TFrmCentralTrocas.EdtNotasEntDevContaBarrasChange(Sender: TObject);
Var
 sCodBarras: String;
begin
  If Length(EdtNotasEntDevContaBarras.Text)>12 Then
  Begin
    sCodBarras:=Copy(EdtNotasEntDevContaBarras.Text,1,13);

    //odirfagar - 09/06/2015
    //    If sCodBarras=EdtNotasEntDevCodProduto.Text Then
    If DMCentralTrocas.CDS_V_Geral.Locate('CodBarras',sCodBarras,[]) Then
     Begin
       EdtNotasEntDevQtdDevulocao.Value:=EdtNotasEntDevQtdDevulocao.Value+1;
     End
    Else
     Begin
       PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
       msg('Código de Barras Inválido !!','A');
     End;
    EdtNotasEntDevContaBarras.Clear;
    EdtNotasEntDevContaBarras.SetFocus;
  End; // If Length(EdtNotasEntDevQtdDevulocao.Text)>12 Then

end;

procedure TFrmCentralTrocas.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
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

procedure TFrmCentralTrocas.Dbg_NotasEntDevProdutosEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_NotasEntDevProdutosEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;
end;

procedure TFrmCentralTrocas.Dbg_NotasEntDevNFEEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_NotasEntDevNFEEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmCentralTrocas.Bt_NotasEntDevColetorClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
  tsArquivo: TStringList;

  ii, i: Integer;

  MySql: String;

  sCodBarras, sQtd, sNomeArq,
  sPastaArq, sPastaArqProc : String;

  bErro: Boolean;
  mMemo: TMemo;
begin

  If Not EdtNotasEntDevCodProduto.Enabled Then
  Begin
    msg('Impossível Incluir Produtos !!'+cr+cr+'Documento já Processado (Analisado) !!','A');
    Exit;
  End; // If Not EdtNotasEntDevCodProduto.Enabled Then

  If Not DMCentralTrocas.CDS_Transf_Cd.IsEmpty Then
  Begin
    If msg('Documento já Contém Produtos !!'+cr+cr+'Deseja Incluir mais Produtos ??','C')=2 Then
    Begin
      Exit;
    End;
  End; // If Not DMCentralTrocas.CDS_Transf_Cd.IsEmpty Then

  // Cria Memo para Guardar Arquivo com Produtos Não Encontrados ===============
  mMemo:=TMemo.Create(Self);
  mMemo.Visible:=False;
  mMemo.Parent:=FrmCentralTrocas;
  mMemo.Width:=500;
  mMemo.Lines.Clear;

  OpenDialog := TOpenDialog.Create(OpenDialog);

  with OpenDialog do
  begin
    Options := [ofAllowMultiSelect , ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
    DefaultExt := 'TXT';
    Filter := 'Arquivos do Coletor de Dados (*.txt)|*.TXT';
    FilterIndex := 1;
    Title := 'Localizar Arquivos de Dados do Coletor';
  End;

  if OpenDialog.Execute then
  Begin
    // Analisa Existencia da Pasta para arquivos Processados ===================
    sPastaArqProc:=IncludeTrailingPathDelimiter(ExtractFilePath(OpenDialog.FileName))+'Coletor Processado\';
    if not DirectoryExists(sPastaArqProc) then
     ForceDirectories(sPastaArqProc);

    // Seleciona os Arquivos ===================================================
    For i:=0 to OpenDialog.Files.Count-1 do
    Begin
      Try
        bErro:=False;

        tsArquivo:=TStringList.Create;
        tsArquivo.LoadFromFile(OpenDialog.Files[i]);

        { Realiza um loop em toda a lista }
        For ii:=0 to tsArquivo.Count-1 do
        Begin
          sCodBarras:='';
          sQtd:='';

          sCodBarras:=Separa_String(tsArquivo[ii]+',',1,',');
          sQtd:=Separa_String(tsArquivo[ii]+',',2,',');

          If (Trim(sCodBarras)<>'') and (StrToIntDef(sQtd,0)<>0)  Then
          Begin
            // Verifica se Existe Produto com Codigo de Barras =================
            MySql:=' SELECT Trim(pr.codbarra) codbarra, pr.apresentacao, pr.codproduto'+
                   ' FROM PRODUTO pr'+
                   ' WHERE Trim(pr.codbarra)='+QuotedStr(sCodBarras)+

                   ' UNION'+

                   ' SELECT Trim(b.codbarra) codbarra, p.apresentacao, b.codproduto'+
                   ' FROM PRODUTO p, PRODUTOSBARRA b'+
                   ' WHERE p.codproduto=b.codproduto'+
                   ' AND   Trim(b.codbarra)='+QuotedStr(sCodBarras);
            IBQ_MPMS.Close;
            IBQ_MPMS.SQL.Clear;
            IBQ_MPMS.SQL.Add(MySql);
            IBQ_MPMS.Open;
            sCodBarras:=Trim(IBQ_MPMS.FieldByName('codbarra').AsString);
            IBQ_MPMS.Close;

            If Trim(sCodBarras)<>'' Then
             Begin
               EdtNotasEntDevCodProduto.Text:=sCodBarras;
               EdtNotasEntDevCodProdutoExit(Self);
               EdtNotasEntDevQtdDevulocao.Value:=StrToCurr(sQtd);
               Bt_NotasEntDevIncluirClick(Self);
               Dbg_NotasEntDevProdutos.Refresh;
             End
            Else
             Begin
               bErro:=True;
               tsArquivo[ii]:=tsArquivo[ii]+' - Produto Não Encontrado';
             End;
          End; // If (StrToIntDef(sCodBarras,0)<>0) and (StrToIntDef(sQtd,0)<>0)  Then
        End; // For ii:=0 to tsArquivo.Count-1 do

        tsArquivo.SaveToFile(OpenDialog.Files[i]);

        // Copia Arquivo para Pasta de Processados =============================
        sNomeArq :=ExtractName(OpenDialog.Files[i]);
        sPastaArq:=ExtractFilePath(OpenDialog.Files[i]);
        sNomeArq:=sNomeArq+'_PROC.txt';

        RenameFile(OpenDialog.Files[i],IncludeTrailingPathDelimiter(sPastaArq)+sNomeArq);
        CopyFile(PChar(IncludeTrailingPathDelimiter(sPastaArq)+sNomeArq),PChar(sPastaArqProc+sNomeArq),False);
        DeleteFile(IncludeTrailingPathDelimiter(sPastaArq)+sNomeArq);

        If bErro Then
         mMemo.Lines.Add(ExtractFileName(sNomeArq));

      Finally // Try
        { Libera a instancia da lista da memória }
        FreeAndNil(tsArquivo);
      End; // Try
    End; // For i:=0 to OpenDialog.Files.Count-1 do
  End; // if OpenDialog.Execute then

  // Apresenta Arquivo com Produtos Não Encontrados ============================
  If mMemo.Lines.Count>0 Then
  Begin
    MessageBox(Handle, pChar('Arquivo com Produtos Não Encontrados !!'+cr+
                             'Favor Analizá-los !!'+cr+cr+'Pasta :'+sPastaArqProc+cr+cr+
                             'Arquivos'+cr+cr+
                             mMemo.Lines.Text), 'Erro', MB_ICONERROR);

  End; // If mMemo.Lines.Count>1 Then
  FreeAndNil(mMemo);
  FreeAndNil(OpenDialog);

end;

procedure TFrmCentralTrocas.Dbg_NotasEntDevProdutosDrawColumnCell(Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn;State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMCentralTrocas.CDS_Transf_CdSIT.AsString='F' Then
    Begin
      Dbg_NotasEntDevProdutos.Canvas.Brush.Color:=$00FFFF80;
    End;

    Dbg_NotasEntDevProdutos.Canvas.FillRect(Rect);
    Dbg_NotasEntDevProdutos.DefaultDrawDataCell(Rect,Column.Field,state);

    // Alinhamento
    DMCentralTrocas.CDS_Transf_CdPRINCIPALFOR.Alignment:=taRightJustify;
    DMCentralTrocas.CDS_Transf_CdSIT.Alignment:=taCenter;
    DMCentralTrocas.CDS_Transf_CdIND_IMPRESSO.Alignment:=taCenter;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmCentralTrocas.Dbg_NotasEntDevProdutosDblClick(Sender: TObject);
Var
 MySql, sSimNao: String;
begin
  If DMCentralTrocas.CDS_Transf_CdSIT.AsString='F' Then
  Begin
    DMCentralTrocas.CDS_Transf_Cd.DisableControls;

    // Verifica se Transação esta Ativa
    If DMBelShop.SQLC.InTransaction Then
     DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try

      If DMCentralTrocas.CDS_Transf_CdIND_IMPRESSO.AsString='S' Then
       sSimNao:='N'
      Else
       sSimNao:='S';

      DMCentralTrocas.CDS_Transf_Cd.Edit;
      DMCentralTrocas.CDS_Transf_CdIND_IMPRESSO.AsString:=sSimNao;
      DMCentralTrocas.CDS_Transf_Cd.Post;

      MySql:=' UPDATE SIDICOM_TRANSF_ENTADAS te'+
             ' SET te.Ind_Impresso='+QuotedStr(sSimNao)+
             ' WHERE te.num_solicitacao='+EdtNotasEntDevNumSolicitacao.Text+
             ' AND   te.Num_seq='+DMCentralTrocas.CDS_Transf_CdNUM_SEQ.AsString;
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ====================================================
      DMBelShop.SQLC.Commit(TD);
      DMCentralTrocas.CDS_Transf_Cd.EnableControls;
    Except
      on e : Exception do
      Begin
        // Abandona Transacao ====================================================
        DMBelShop.SQLC.Rollback(TD);

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try
  End; // If DMCentralTrocas.CDS_Transf_CdSIT.AsString='F' Then
end;

procedure TFrmCentralTrocas.Dbg_ReposLojasDocsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s, sSeq1, sSeq2: String;
  iRecNo: Integer;
  MySql: String;
  bZeraLeitora, b: Boolean;
begin

  // Bloquei Ctrl + Delete =====================================================
  If (Shift = [ssCtrl]) and (Key = 46) then
   Key := 0;

  // Ctrl + P (Key = 80) = Emissãso de Docto de Separação ======================
  if (Shift = [ssCtrl]) and (Key = 80) then
  Begin
    Bt_ReposLojasEmissaoDocClick(Self);
  End; // if (Shift = [ssCtrl]) and (Key = VK_KEY_M) then

  // Ctrl + M (Key = 77) = Salvar Totais em Memória ============================
  if (Shift = [ssCtrl]) and (Key = 77) then
  Begin
    If (Not DMCentralTrocas.CDS_ReposicaoDocs.Active) Or (DMCentralTrocas.CDS_ReposicaoDocs.IsEmpty) Then
     Exit;

    Try
      OdirPanApres.Caption:='AGUARDE !! Salvando Totais (Memória)...';
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
      OdirPanApres.Font.Style:=[fsBold];
      OdirPanApres.Parent:=FrmCentralTrocas;
      OdirPanApres.BringToFront();
      OdirPanApres.Visible:=True;
      Refresh;

      Dbg_ReposLojasDocs.SetFocus;
      DBGridClipboard(Dbg_ReposLojasDocs);
      Dbg_ReposLojasItens.SetFocus;

      OdirPanApres.Visible:=False;
      Refresh;

      Exit;
    Except
    End;
  End; // if (Shift = [ssCtrl]) and (Key = 80) then

  // Proximo Registro ==========================================================
  If (Sender is TDBGrid) Then
  Begin
    If Trim((Sender as TDBGrid).Name)='Dbg_ReposLojasItens' Then
    Begin
      If Not DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty Then
      Begin
        If Key=VK_Return Then
        Begin
          DMCentralTrocas.CDS_ReposicaoTransf.Next;
          Dbg_ReposLojasItens.SetFocus;
          Dbg_ReposLojasItens.SelectedIndex:=3;
        End;
      End; // If Not DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty Then
    End; // If Trim((Sender as TDBGrid).Name)='Dbg_ReposLojasItens' Then
  End; // If (Sender is TDBGrid) Then

  // Altera Quantidade de Reposição ============================================
  If Key=VK_F2 Then
  Begin
    If DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty Then
     Exit;

    If DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsString<>'000000' Then
    Begin
      PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
      msg('Produto Já Transferido !!','A');
      Exit;
    End; // If Not DMCentralTrocas.CDS_ReposicaoTransf.Locate('COD_PRODUTO', sgCodProduto,[]) Then

    // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
    FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
    AbreSolicitacoes(21);
    sgDtaInicio:=f_Troca('-','.',(f_Troca('/','.',DateToStr(FrmCentralTrocas.DtaEdt_ReposLojas.Date))));

    FrmSolicitacoes.AutoSize    :=False;
    FrmSolicitacoes.ClientHeight:=213;
    FrmSolicitacoes.ClientWidth :=567;
    FrmSolicitacoes.AutoSize    :=True;

    FrmSolicitacoes.Caption:='Bel_'+DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString+' - '+
                                    DMCentralTrocas.CDS_ReposicaoDocsRAZAO_SOCIAL.AsString;

    FrmSolicitacoes.Ts_ReposLojasDigita.Caption:=FrmSolicitacoes.Ts_ReposLojasDigita.Caption+
                                                 ' (Docto Número: '+
                                                 DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+')';
    FrmSolicitacoes.EdtReposLojasSeq.Value:=DMCentralTrocas.CDS_ReposicaoTransfNUM_SEQ.AsInteger;

    FrmSolicitacoes.bgFechaRepos:=True;
    FrmSolicitacoes.ShowModal;

    FreeAndNil(FrmSolicitacoes);
  End; //

  // Localiza Produto ==========================================================
  If Key=VK_F4 Then
  Begin
    Dbg_ReposLojasItens.SetFocus;

    If DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty Then
     Exit;

    s:='';
    If InputQuery('Localizar Produto','',s) then
    Begin
      if Trim(s)<>'' then
      Begin
        Try
          StrToInt(s);
          DMCentralTrocas.CDS_ReposicaoTransf.Locate('Cod_Produto',FormatFloat('000000',StrToInt(s)),[]);
        Except
          s:=AnsiUpperCase(s);
          LocalizaRegistro(DMCentralTrocas.CDS_ReposicaoTransf, 'Des_Produto', s);
        End;
      End; // if Trim(s)<>'' then
    End; // If InputQuery('Localizar Produto','',s) then
  End; // If Key=VK_F4 Then

  // Altera Quantidade de Reposição para Zero ==================================
  If (Key=VK_F6) And (Bt_ReposLojasAlterarQtd.Enabled) Then
  Begin
    If DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty Then
     Exit;

    sSeq1:='0';
    sSeq2:='0';
    b:=True;
    While b do
    Begin
      sSeq1:=InputBoxInteiro('ZERA QUANTIDADE DE REPOSIÇÃO', 'Informe A Sequncial INICIAL',sSeq1);

      If Trim(sSeq1)='' Then
       Exit;

      Try
        StrToInt(sSeq1);

        Break;
      Except
        msg('Sequencia INICIAL Inválida !!','A');
        Exit;
      End;
    End; // While b do

    b:=True;
    While b do
    Begin
      sSeq2:=InputBoxInteiro('ZERA QUANTIDADE DE REPOSIÇÃO', 'Informe A Sequncial FINAL',sSeq2);

      If Trim(sSeq2)='' Then
       Exit;

      Try
        StrToInt(sSeq2);

        Break;
      Except
        msg('Sequencia FINAL Inválida !!','A');
        Exit;
      End;
    End; // While b do

    If StrToInt(sSeq1)>StrToInt(sSeq2) Then
    Begin

      msg('Sequencia Inválida !!','A');
      Exit;
    End;

    If msg('A Sequencia ESTA CORRETA ??'+cr+cr+'de '+sSeq1+' a '+sSeq2,'C')=2 Then
     Exit;

    bZeraLeitora:=True;
    If msg('Zerar Quantidade Informada Por'+cr+cr+'Leitora de Código de Barras ??','C')=2 Then
     bZeraLeitora:=False;

    iRecNo:=DMCentralTrocas.CDS_ReposicaoTransfNUM_SEQ.AsInteger;

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

      MySql:=' UPDATE ES_ESTOQUES_LOJAS l'+
             ' SET l.qtd_a_transf=0'+
             ',    l.usu_altera='+QuotedStr(Cod_Usuario)+
             ',    l.dta_altera=current_timestamp'+

             ' WHERE l.Num_Pedido='+QuotedStr('000000')+
             ' AND   l.Dta_Movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtaEdt_ReposLojas.Text)))+
             ' AND   l.Num_Docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
             ' And   l.Cod_Loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString)+
             ' And   l.Num_Seq BETWEEN '+sSeq1+' And '+sSeq2;

            If sgTipoPrioridade<>'Todas as Prioridades' Then
             MySql:=
              MySql+' AND   l.Ind_Prioridade in ('+sgTipoPrioridade+')';

             If Not bZeraLeitora Then
              MySql:=
               MySql+' And l.ind_leitora='+QuotedStr('NAO');

             If (sgCorredores<>'') and (Not bgTodosCorredores) Then
              MySql:=
               MySql+' AND EXISTS (SELECT 1'+
                     '             FROM ES_ESTOQUES_CD cd'+
                     '             WHERE cd.cod_produto=l.cod_produto'+
                     '             AND   cd.dta_movto=l.dta_movto'+
                     '             AND   cd.end_zona||''.''||cd.end_corredor in ('+sgCorredores+'))';

             If Trim(EdtReposLojasCodForn.Text)<>'' Then
              MySql:=
               MySql+' AND EXISTS (SELECT 1'+
                     '             FROM PRODUTO pr'+
                     '             WHERE pr.codproduto=l.cod_produto'+
                     '             AND   pr.principalfor='+QuotedStr(Trim(EdtReposLojasCodForn.Text))+')';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ======================================================
      DMBelShop.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      DMCentralTrocas.CDS_ReposicaoTransf.DisableControls;
      DMCentralTrocas.CDS_ReposicaoTransf.Close;
      DMCentralTrocas.CDS_ReposicaoTransf.Open;
      DMCentralTrocas.CDS_ReposicaoTransf.EnableControls;
      DMCentralTrocas.CDS_ReposicaoTransf.Locate('NUM_SEQ', iRecNo,[]);

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
  End; // If (Key=VK_F6) And (Bt_ReposLojasAlterarQtd.Enabled) Then
end;

procedure TFrmCentralTrocas.Dbg_ReposLojasItensEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_ReposLojasItensEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

  bgEnterTab:=False;

end;

procedure TFrmCentralTrocas.Dbg_ReposLojasItensExit(Sender: TObject);
begin
  bgEnterTab:=True;

end;

procedure TFrmCentralTrocas.Dbg_ReposLojasItensDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if not (gdSelected in State) Then
  Begin
    if DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsString<>'000000' Then
     Begin
       Dbg_ReposLojasItens.Canvas.Brush.Color:=clSkyBlue;
     End
    Else if (DMCentralTrocas.CDS_ReposicaoTransfPRECOCOMPRA.AsCurrency<=0.00) And (DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsInteger>0) Then
     Begin
       Dbg_ReposLojasItens.Canvas.Brush.Color:=clRed;
       Dbg_ReposLojasItens.Canvas.Font.Color:=clWhite;
     End;

    If (Column.FieldName='COD_PRODUTO') And (DMCentralTrocas.CDS_ReposicaoTransfQTD_TRANSF_OC.AsInteger<>0) Then
    Begin
      Dbg_ReposLojasItens.Canvas.Font.Style:=[fsBold];
      Dbg_ReposLojasItens.Canvas.Font.Color:=clWhite; // -->> Cor da Fonte
      Dbg_ReposLojasItens.Canvas.Brush.Color:=clBlue; //  -->> Cor da Celula
    End;

    If (Column.FieldName='IND_LEITORA') And (DMCentralTrocas.CDS_ReposicaoTransfIND_LEITORA.AsString='SIM') Then
    Begin
      Dbg_ReposLojasItens.Canvas.Font.Style:=[fsBold];
      Dbg_ReposLojasItens.Canvas.Font.Color:=clWhite; // -->> Cor da Fonte
      Dbg_ReposLojasItens.Canvas.Brush.Color:=clBlue; //  -->> Cor da Celula
    End;

    If (Column.FieldName='QTD_CHECKOUT') And (DMCentralTrocas.CDS_ReposicaoTransfIND_LEITORA.AsString='SIM') Then
    Begin
      If (DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsCurrency<>DMCentralTrocas.CDS_ReposicaoTransfQTD_CHECKOUT.AsCurrency) Then
      Begin
        Dbg_ReposLojasItens.Canvas.Font.Color:=clWhite; // -->> Cor da Fonte
        Dbg_ReposLojasItens.Canvas.Brush.Color:=clRed; //  -->> Cor da Celula
      End;

      If (DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsCurrency=DMCentralTrocas.CDS_ReposicaoTransfQTD_CHECKOUT.AsCurrency) Then
      Begin
        Dbg_ReposLojasItens.Canvas.Brush.Color:=$00FFFF80; //  -->> Cor da Celula
      End;
    End;

    Dbg_ReposLojasItens.Canvas.FillRect(Rect);
    Dbg_ReposLojasItens.DefaultDrawDataCell(Rect,Column.Field,state);

    // Alinhamento
    DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.Alignment:=taRightJustify;
    DMCentralTrocas.CDS_ReposicaoTransfABC.Alignment:=taCenter;
    DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.Alignment:=taRightJustify;
    DMCentralTrocas.CDS_ReposicaoTransfQTD_CHECKOUT.Alignment:=taRightJustify;
    DMCentralTrocas.CDS_ReposicaoTransfIND_LEITORA.Alignment:=taCenter;
    DMCentralTrocas.CDS_ReposicaoTransfIND_PRIORIDADE.Alignment:=taCenter;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmCentralTrocas.Dbg_ReposLojasDocsEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_ReposLojasDocsEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmCentralTrocas.Bt_ReposLojasEmissaoDocClick(Sender: TObject);
Var
  MySql: String;
  dir_padrao, dir_relat: String;
begin
  Dbg_ReposLojasDocs.SetFocus;

  If DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty Then
   Exit;

  If (igCorredores<>CkCbx_ReposLojasCorredor.Items.Count) and (igCorredores>1) Then
  Begin
    msg('Relatório deve Conter: '+cr+'TODOS os Corredores ou Somente UM !!','A');
    Exit;
  End; // If Not bgTodosCorredores Then

  // Verifica se Existem Itens =================================================
  If Not VerificaExistenciaItens() Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    msg('Sem Produto a para Impressão !!'+cr+cr+'Todos já Transferidos !!','A');
    Exit;
  End;

  // Lojas Por Fornecedor ======================================================
//  If (DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString='22') Or
//     (DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString='89') Then
//     (DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString='24') Then
//  Begin
//    RomaneioFornecedor;
//    Exit;
//  End; // If (DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString='22') Or
  If (DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString='24') Then
  Begin
    If msg('Deseja Impressão de Relatório'+cr+'por Fornecedor ??','C')=1 Then
    Begin
      RomaneioFornecedor;
      Exit;
    End;
  End; // If (DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString='22') Or
  Screen.Cursor:=crAppStart;

  OdirPanApres.Caption:='AGUARDE !! Montando Relatório...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2));
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Busca Docto ===============================================================
  MySql:=' SELECT '+

         // OdirApagar - 24/08/2017
         // ''Bel_''||lo.cod_loja||'' - ''||em.razao_social loja,'+
         ' em.cod_cli_linx||'' - ''||em.razao_social loja,'+

         ' SUBSTRING(em.num_cnpj FROM 1 FOR 2) || ''.'' ||SUBSTRING(em.num_cnpj FROM 3 FOR 3) || ''.'' ||'+
         ' SUBSTRING(em.num_cnpj FROM 6 FOR 3) || ''/'' ||SUBSTRING(em.num_cnpj FROM 9 FOR 4) || ''-'' ||'+
         ' SUBSTRING(em.num_cnpj FROM 13 FOR 2) CNPJ,'+

         ' lo.num_docto, lo.dta_movto, lo.num_seq Seq,'+

         // OdirApagar - 24/08/2017
         // ' cd.end_zona||''.''||cd.end_corredor||''.''||cd.end_prateleira||''.''||cd.end_gaveta Enderecamento,'+
         ' cd.end_prateleira||''.''||cd.end_gaveta Enderecamento,'+

         ' lo.qtd_a_transf,'+
         ' ''_____'' qtd_disponivel,'+
         ' cd.qtd_estoque Saldo_CD,'+
         ' lo.cod_produto, TRIM(pr.codbarra) codbarra, Trim(pr.referencia) referencia, TRIM(pr.apresentacao) Des_produto, '+
         QuotedStr(Des_Usuario)+' Usuario,'+
         ' lo.obs_docto'+

         ' FROM ES_ESTOQUES_LOJAS lo, ES_ESTOQUES_CD cd,'+
         '      PRODUTO pr, EMP_CONEXOES em'+

         ' WHERE lo.cod_produto=pr.codproduto'+
         ' AND   lo.cod_produto=cd.cod_produto'+
         ' AND   lo.dta_movto=cd.dta_movto'+
         ' AND   lo.cod_loja=em.cod_filial'+

         ' AND   CAST(TRIM(COALESCE(lo.num_pedido,''0'')) AS INTEGER)=0'+

         ' AND   lo.dta_movto='+QuotedStr(f_Troca('-','.',(f_Troca('/','.',DateToStr(DtaEdt_ReposLojas.Date)))))+
         ' AND   lo.ind_transf='+QuotedStr('SIM')+
         ' AND   lo.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
         ' AND   lo.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString);

         If sgTipoPrioridade<>'Todas as Prioridades' Then
          MySql:=
           MySql+' AND lo.ind_prioridade in ('+sgTipoPrioridade+')';

         If (sgCorredores<>'') and (Not bgTodosCorredores) Then
          MySql:=
           MySql+' AND cd.end_zona||''.''||cd.end_corredor in ('+sgCorredores+')';

         If Trim(EdtReposLojasCodForn.Text)<>'' Then
          MySql:=
           MySql+' AND pr.principalfor='+QuotedStr(Trim(EdtReposLojasCodForn.Text));

  MySql:=
   MySql+' ORDER BY 6, 11';
  DMCentralTrocas.SDS_RelReposicao.Close;
  DMCentralTrocas.CDS_RelReposicao.Close;
  DMCentralTrocas.SDS_RelReposicao.CommandText:=MySql;
  DMCentralTrocas.CDS_RelReposicao.Open;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  If DMCentralTrocas.CDS_RelReposicao.IsEmpty Then
  Begin
    DMCentralTrocas.CDS_RelReposicao.Close;
    msg('Sem Produto a Listar !!','A');
    Exit;
  End;

//OdirApagar - 08/08/2017 - Não Apresenta a Observação
//  If CkB_ReposLojasOBS.Checked Then
//  Begin
//    MySql:=' SELECT DISTINCT l.obs_docto'+
//           ' FROM es_estoques_lojas l, ES_ESTOQUES_CD c'+
//           ' WHERE l.cod_produto=c.cod_produto'+
//           ' AND   l.dta_movto=c.dta_movto'+
//           ' AND   l.dta_movto='+QuotedStr(f_Troca('-','.',(f_Troca('/','.',DateToStr(DtaEdt_ReposLojas.Date)))))+
//           ' AND   l.ind_transf='+QuotedStr('SIM')+
//           ' AND   l.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
//           ' AND   CAST(TRIM(COALESCE(l.num_pedido,''0'')) AS INTEGER)=0';
//
//           If (sgCorredores<>'') and (Not bgTodosCorredores) Then
//            MySql:=
//             MySql+' AND c.end_zona||''.''||c.end_corredor in ('+sgCorredores+')';
//
//           If Rb_ReposLojasPrioridade0.Checked Then
//            MySql:=
//             MySql+' AND l.Ind_Prioridade=0';
//
//           If Rb_ReposLojasPrioridade1.Checked Then
//            MySql:=
//             MySql+' AND l.Ind_Prioridade=1';
//
//           If Rb_ReposLojasPrioridade2.Checked Then
//            MySql:=
//             MySql+' AND l.Ind_Prioridade=2';
//
//           If Rb_ReposLojasPrioridade3.Checked Then
//            MySql:=
//             MySql+' AND l.Ind_Prioridade=3';
//    DMBelShop.CDS_BuscaRapida.Close;
//    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
//    DMBelShop.CDS_BuscaRapida.Open;
//
//    While Not DMBelShop.CDS_BuscaRapida.Eof do
//    Begin
//      FrmBelShop.Memo2.Lines.Add(F_TROCA(''#$D'',''#$D#$A'', DMBelShop.CDS_BuscaRapida.FieldByName('OBS_DOCTO').AsString));
//
//      DMBelShop.CDS_BuscaRapida.Next;
//    End;
//    DMBelShop.CDS_BuscaRapida.Close;
//
//    For i:=0 to FrmBelShop.Memo2.Lines.Count-1 do
//    Begin
//      If (Pos('Calculado em:',FrmBelShop.Memo2.Lines[i])=0) And
//         (Pos('Romaneio de Separação CD Gerado em',FrmBelShop.Memo2.Lines[i])=0) And
//         (Pos('CD Gerado em',FrmBelShop.Memo2.Lines[i])=0) And
//         (Pos(': Corte',FrmBelShop.Memo2.Lines[i])=0) And
//         (Pos('Sem Reposição Pelo',FrmBelShop.Memo2.Lines[i])=0) And
//         (Pos('Pelo Usuário:',FrmBelShop.Memo2.Lines[i])=0) And
//         (Pos('Corte Pelo',FrmBelShop.Memo2.Lines[i])=0) And
//         (Trim(FrmBelShop.Memo2.Lines[i])<>'') Then
//      Begin
//        If FrmBelShop.Mem_Odir.Lines.Count<1 Then
//         FrmBelShop.Mem_Odir.Lines.Add('Observações:');
//
//        FrmBelShop.Mem_Odir.Lines.Add(FrmBelShop.Memo2.Lines[i]);
//      End; // If (Pos('Calculado em:',FrmBelShop.Memo2.Lines[i])=0) And
//    End; // For i:=0 to FrmBelShop.Memo2.Lines.Count-1 do
//  End; // If CkB_ReposLojasOBS.Checked Then

  // Apresenta Relatório =======================================================
  {$IFDEF MSWINDOWS}
    dir_padrao      := ExtractFilePath(Application.ExeName);
    dir_relat       := dir_padrao +'Relatorios\';
  {$ENDIF}

//OdirApagar - 08/08/2017 - Não Apresenta a Observação
//  If FrmBelShop.Mem_Odir.Lines.Count>1 Then
//   Begin
//     DMRelatorio.frReport1.LoadFromFile(Dir_Relat+'RomaneioReposicoes.frf');
//     DMRelatorio.frReport1.Dictionary.Variables.Variable['Obs']:=#39+FrmBelShop.Mem_Odir.Text+#39;
//   End
//  Else
//   Begin
//     DMRelatorio.frReport1.LoadFromFile(Dir_Relat+'RomaneioReposicoes_SObs.frf');
//   End;
  DMRelatorio.frReport1.LoadFromFile(Dir_Relat+'RomaneioReposicoes_SObs.frf');

  // Apropria DataSet ==========================================================
  DMRelatorio.frDBDataSet1.DataSet:=DMCentralTrocas.CDS_RelReposicao;

  // Informa Corredores ========================================================
  If (bgTodosCorredores) or (igCorredores=0) Then
   DMRelatorio.frReport1.Dictionary.Variables.Variable['Corredor']:=#39+'TODOS'+#39
  Else
   DMRelatorio.frReport1.Dictionary.Variables.Variable['Corredor']:=#39+Trim(f_troca('''','',sgCorredores))+#39;

  // Informa Prioridades =======================================================
  DMRelatorio.frReport1.Dictionary.Variables.Variable['Prioridades']:=#39+sgTipoPrioridade+#39;

//OdirApagar - 08/08/2017 - Não Apresenta a Observação
//  If FrmBelShop.Mem_Odir.Lines.Count>0 Then
//   DMRelatorio.frReport1.Dictionary.Variables.Variable['Obs']:=#39+FrmBelShop.Mem_Odir.Text+#39;

  DMRelatorio.frReport1.PrepareReport;
  DMRelatorio.frReport1.ShowReport;

  // Retorna para o DBGrid
  DMCentralTrocas.CDS_RelReposicao.Close;

end;

procedure TFrmCentralTrocas.Bt_ReposLojasAlterarQtdClick(Sender: TObject);
begin
  Dbg_ReposLojasDocs.SetFocus;

  If DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty Then
   Exit;

  // Verifica se Existem Itens =================================================
  If Not VerificaExistenciaItens() Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    msg('Sem Produto a para Alteração !!'+cr+cr+'Todos já Transferidos !!','A');
    Exit;
  End;

  sgMensagem:=sgCorredores;
  If Trim(sgMensagem)='' Then
   sgMensagem:='Todos';

  If Trim(EdtReposLojasCodForn.Text)<>'' Then
   sgMensagem:=sgMensagem+cr+cr+'Fornecedor'+cr+Trim(EdtReposLojasDesForn.Text);

  If Application.MessageBox(PChar('Deseja Realmente Alterar Quantidades De Reposição ??'+cr+cr+
                                  'Docto Nº:  '+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+cr+
                                  'Loja:  '+DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString+' - '+
                                            DMCentralTrocas.CDS_ReposicaoDocsRAZAO_SOCIAL.AsString+cr+
                                  'Prioridade(s):  '+sgTipoPrioridade+cr+
                                  'Corredor(es):  '+sgMensagem), 'ATENÇÃO !!', 292)=IdNo Then
   Exit;
  sgMensagem:='';

  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  AbreSolicitacoes(21);
  sgDtaInicio:=f_Troca('-','.',(f_Troca('/','.',DateToStr(FrmCentralTrocas.DtaEdt_ReposLojas.Date))));

  FrmSolicitacoes.AutoSize    :=False;
  FrmSolicitacoes.ClientHeight:=213;
  FrmSolicitacoes.ClientWidth :=567;
  FrmSolicitacoes.AutoSize    :=True;

  FrmSolicitacoes.Caption:='Bel_'+DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString+' - '+
                                  DMCentralTrocas.CDS_ReposicaoDocsRAZAO_SOCIAL.AsString;

  FrmSolicitacoes.Ts_ReposLojasDigita.Caption:=FrmSolicitacoes.Ts_ReposLojasDigita.Caption+
                                               ' (Docto Número: '+
                                               DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+')';

  FrmSolicitacoes.ShowModal;

  FreeAndNil(FrmSolicitacoes);

end;

procedure TFrmCentralTrocas.Bt_ReposLojasGeraPedidoSIDICOMClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_ReposLojasDocs.SetFocus;

  msg('SIDICOM Desativado !!','A');
  Exit;
  
  If DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty Then
   Exit;

  // Busca Campos SIDICOM.Pedido e SIDICOM.PedidoIt ============================
  MySql:=' SELECT  Trim(cam.RDB$RELATION_NAME) Tabela,'+
         ' CASE'+
         '   WHEN Trim(cam.RDB$RELATION_NAME)=''PEDIDO'' THEN'+
         '     COUNT(cam.RDB$FIELD_NAME)-113'+ // Total de CAMPOS no PEDIDO
         '   ELSE'+
         '     COUNT(cam.RDB$FIELD_NAME)-111'+ // Total de CAMPOS no ITENS DO PEDIDO
         ' END Zerado'+
         ' FROM RDB$RELATION_FIELDS cam'+
         ' WHERE Trim(cam.RDB$RELATION_NAME) IN (''PEDIDO'', ''PEDIDOIT'')'+
         ' GROUP BY 1';
  IBQ_MPMS.Close;
  IBQ_MPMS.SQL.Clear;
  IBQ_MPMS.SQL.Add(MySql);
  IBQ_MPMS.Open;

  bgSiga:=True;
  While Not IBQ_MPMS.Eof do
  Begin
    If IBQ_MPMS.FieldByName('Zerado').AsInteger<>0 Then
    Begin
      bgSiga:=False;

      If IBQ_MPMS.FieldByName('Tabela').AsString='PEDIDO' Then
       MySql:='do PEDIDO - SIDICOM'
      Else
       MySql:='dos ITENS DO PEDIDO - SIDICOM';

      Break;
    End; // If IBQ_MPMS.FieldByName('Zerado').AsInteger<>0 Then

    IBQ_MPMS.Next;
  End; // While Not IBQ_MPMS.Eof do
  IBQ_MPMS.Close;

  If Not bgSiga Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    MessageBox(Handle, pChar('Erro de Estrutura '+MySql+' !!'+cr+cr+
                             'Entrar em Contato com "ODIR" IMEDIATAMENTE !!!!!'+cr+
                             'Celular: 9957-8234'+cr+
                             'E-Mail : odir.opss@gmail.com'), 'ATENÇÃO !!', MB_ICONERROR);
    Exit;
  End;

  // Verifica se Existem Itens =================================================
  If Not VerificaExistenciaItens() Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    msg('Sem Produto a Transferir !!','A');
    Exit;
  End;

  // Verifica se Existem Itens Com Quantidade e Sem Preco a Exportar para o Pedido do SIDICOM =============
  If VerificaPrecosItens Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    If Application.MessageBox(PChar('Existe(m) Produto(s) COM REPOSIÇÃO e SEM PREÇO de CUSCTO'+cr+
                                    'Verifique e Solicite o Cadastramento no SIDICOM !!'+cr+cr+
                                    'Se Desejar Continuar não Irão para o Pedido do SIDICOM !!'+cr+cr+
                                    'DESEJA CONTINUAR ???'), 'ATENÇÃO !!', 292)=IdNo Then
     Exit;
  End;

  If msg('Deseja Realmente Criar Pedido no SIDICOM '+cr+cr+
         'para o Docto Nº '+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
         ' da Loja Bel_'+DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString+' ??', 'C')=2 Then
   Exit;

  // Gera Pedido no SIDICOM CD =================================================
  sgMensagem:='';
  If Not GeraPedidoSidicomCD Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    MessageBox(Handle, pChar('Erro na Geração do Pedido: '+sgMensagem+' !!'+cr+cr+
                             'Entrar em Contato com "ODIR" IMEDIATAMENTE !!!!!'+cr+
                             'Celular: 9957-8234'+cr+
                             'E-Mail : odir.opss@gmail.com'), 'ATENÇÃO !!', MB_ICONERROR);
    Exit;
  End;

  // Atualiza Numero do Pedido =================================================
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

    DMCentralTrocas.CDS_ReposicaoTransf.First;
    DMCentralTrocas.CDS_ReposicaoTransf.DisableControls;
    While Not DMCentralTrocas.CDS_ReposicaoTransf.Eof do
    Begin
      If DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsCurrency>0 Then
      Begin
        MySql:=' UPDATE ES_ESTOQUES_LOJAS e'+
               ' SET e.num_pedido='+QuotedStr(FormatFloat('000000',StrToInt(DMCentralTrocas.CDS_ReposicaoTransfNUM_PEDIDO.AsString)))+
               ' WHERE e.dta_movto='+QuotedStr(f_Troca('-','.',(f_Troca('/','.',DateToStr(DtaEdt_ReposLojas.Date)))))+
               ' AND   e.cod_produto='+QuotedStr(DMCentralTrocas.CDS_ReposicaoTransfCOD_PRODUTO.AsString)+
               ' AND   e.num_docto='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString)+
               ' AND   e.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString)+
               ' AND   e.num_seq='+DMCentralTrocas.CDS_ReposicaoTransfNUM_SEQ.AsString+
               ' AND   e.ind_prioridade='+DMCentralTrocas.CDS_ReposicaoTransfIND_PRIORIDADE.AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If DMCentralTrocas.CDS_ReposicaoTransfQTD_A_TRANSF.AsCurrency>0 Then

      DMCentralTrocas.CDS_ReposicaoTransf.Next;
    End; // While Not DMCentralTrocas.CDS_ReposicaoTransf.Eof do
    DMCentralTrocas.CDS_ReposicaoTransf.First;
    DMCentralTrocas.CDS_ReposicaoTransf.EnableControls;

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
      Exit;
    End; // on e : Exception do
  End; // Try

  msg('Pedidos Gerados no CD com SUCESSO !!'+cr+cr+
      'Tecle <OK> para Verificar os Números'+cr+
      ' dos Pedidos Criados no SIDICOM !!','A');

  // Pedidos Gerados
  MySql:=' SELECT lo.num_docto, lo.num_pedido, count(lo.cod_produto) Tot_Prod'+
         ' FROM ES_ESTOQUES_LOJAS lo'+
         ' WHERE lo.qtd_a_transf>0'+
         ' AND   lo.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
         ' AND   lo.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString)+
         ' AND   lo.dta_movto='+QuotedStr(f_Troca('-','.',f_Troca('/','.',DateToStr(DtaEdt_ReposLojas.Date))));

         If sgTipoPrioridade<>'Todas as Prioridades' Then
          MySql:=
           MySql+' AND lo.ind_prioridade in ('+sgTipoPrioridade+')';

         If (sgCorredores<>'') and (Not bgTodosCorredores) Then
          MySql:=
           MySql+' AND EXISTS (SELECT 1'+
                 '             FROM ES_ESTOQUES_CD cd'+
                 '             WHERE cd.cod_produto=lo.cod_produto'+
                 '             AND   cd.dta_movto=lo.dta_movto'+
                 '             AND   cd.end_zona||''.''||cd.end_corredor in ('+sgCorredores+'))';

         If Trim(EdtReposLojasCodForn.Text)<>'' Then
          MySql:=
           MySql+' AND EXISTS (SELECT 1'+
                 '             FROM PRODUTO pr'+
                 '             WHERE pr.codproduto=lo.cod_produto'+
                 '             AND   pr.principalfor='+QuotedStr(Trim(EdtReposLojasCodForn.Text))+')';

  MySql:=
   MySql+' GROUP BY 1,2'+
         ' ORDER BY 2';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  AbreSolicitacoes(7);

  FrmSolicitacoes.Caption:='Bel_'+DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString+' - '+DMCentralTrocas.CDS_ReposicaoDocsRAZAO_SOCIAL.AsString;
  FrmSolicitacoes.Ts_MargemLucroFormulas.Caption:='REPOSIÇÃO DE MERCADORIAS';

  FrmSolicitacoes.EditorMargemLucro.Lines.Clear;

  FrmSolicitacoes.EditorMargemLucro.Lines.Add('Números dos Pedidos Criados no SIDICOM');
  FrmSolicitacoes.EditorMargemLucro.Lines.Add('=====================================================================');
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    If DMBelShop.CDS_Busca.FieldByName('Num_Pedido').AsString='000000' Then
     FrmSolicitacoes.EditorMargemLucro.Lines.Add('- Nº Docto: '+DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString+
                                                 ' - Pedido Nº: <<AINDA NÃO GERADO>>'+
                                                 ' - Nº Produtos: '+DMBelShop.CDS_Busca.FieldByName('Tot_Prod').AsString)
    Else
     FrmSolicitacoes.EditorMargemLucro.Lines.Add('- Nº Docto: '+DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString+
                                                 ' - Pedido Nº: '+DMBelShop.CDS_Busca.FieldByName('Num_Pedido').AsString+
                                                 ' - Nº Produtos: '+DMBelShop.CDS_Busca.FieldByName('Tot_Prod').AsString);

    DMBelShop.CDS_Busca.Next;;
  End; // While Not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.Close;

  FrmSolicitacoes.EditorMargemLucro.Lines.Add('=====================================================================');
  FrmSolicitacoes.ShowModal;
  FreeAndNil(FrmSolicitacoes);

end;

procedure TFrmCentralTrocas.Bt_ReposLojasCheckOutClick(Sender: TObject);
begin
  Dbg_ReposLojasDocs.SetFocus;

  If DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty Then
   Exit;

  // Verifica se Existem Itens a Exportar ======================================
  If Not VerificaExistenciaItens() Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    msg('Sem Produto para Alteração !!'+cr+cr+'Todos já Exportados !!','A');
    Exit;
  End;

  sgMensagem:=sgCorredores;
  If Trim(sgMensagem)='' Then
   sgMensagem:='Todos';

  If Trim(EdtReposLojasCodForn.Text)<>'' Then
   sgMensagem:=sgMensagem+cr+cr+'Fornecedor'+cr+Trim(EdtReposLojasDesForn.Text);

  If Application.MessageBox(PChar('Deseja Realmente Executar o CheckOut do'+cr+cr+
                                  'Docto Nº:  '+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+cr+
                                  'Loja:  '+DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString+' - '+
                                            DMCentralTrocas.CDS_ReposicaoDocsRAZAO_SOCIAL.AsString+cr+
                                  'Prioridade(s):  '+sgTipoPrioridade+cr+
                                  'Corredor(es):  '+sgMensagem), 'ATENÇÃO !!', 292)=IdNo Then
   Exit;
  sgMensagem:='';

  // Retorna IND_LEITORA=FALSE Quando Entra a 1ª Vez ===========================
  DMCentralTrocas.CDS_ReposicaoTransf.First;
  DMCentralTrocas.CDS_ReposicaoTransf.DisableControls;
  While Not DMCentralTrocas.CDS_ReposicaoTransf.Eof do
  Begin
    DMCentralTrocas.CDS_ReposicaoTransf.Edit;
    DMCentralTrocas.CDS_ReposicaoTransfIND_LEITORA.AsString:='NAO';
    DMCentralTrocas.CDS_ReposicaoTransfQTD_CHECKOUT.AsInteger:=0;
    DMCentralTrocas.CDS_ReposicaoTransf.Post;

    DMCentralTrocas.CDS_ReposicaoTransf.Next;
  End; // While Not DMCentralTrocas.CDS_ReposicaoTransf.Eof do
  DMCentralTrocas.CDS_ReposicaoTransf.EnableControls;
  DMCentralTrocas.CDS_ReposicaoTransf.First;

  // Cria Form da Leitora de Codigos de Barras =================================
  FrmLeitoraCodBarras:=TFrmLeitoraCodBarras.Create(Self);

  // Acerta Controle de Processamento ==========================================
  ReCalculaPosicaoLeitora;

  // Inicia Processo de CheckOut ===============================================
  Dbg_ReposLojasItens.Options:=[dgTitles,dgIndicator,dgRowLines,dgTabs,dgAlwaysShowSelection];
  FrmLeitoraCodBarras.EdtCodBarras.Text:='0';
  FrmLeitoraCodBarras.ShowModal;
  Dbg_ReposLojasItens.Options:=[dgTitles,dgIndicator,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection];

  // Encerra ===================================================================
  FreeAndNil(FrmLeitoraCodBarras);

  // Apresenta Divergencias de ChecOut de Reposição de Lojas ===================
  DivergenciasReposicaoLojas;

  Dbg_ReposLojasItens.SetFocus;
end;

procedure TFrmCentralTrocas.Bt_ReposLojasStatusUltimoProcClick(Sender: TObject);
var
  tsArquivo: TStringList;
  sArqErros, sArq: String;

  i: Integer;
  sDta, sUsuarioWindows, sComputadorWindows: String;
begin
  Dbg_ReposLojasDocs.SetFocus;

  { Instancia a variável arquivo }
  tsArquivo:=TStringList.Create;

  Try
    // Windows: Nome do Usuario e do Computador =================================
    UsuarioComputadorWindows(sUsuarioWindows, sComputadorWindows);

    sDta:=DateToStr(DtaEdt_ReposLojas.Date);
    sDta:=f_Troca('/','',f_Troca('.','',f_Troca('-','',sDta)));

    sArq:='ErrosTransf_'+sDta;

    sArq:='ErrosTransf_'+copy(DateToStr(DtaEdt_ReposLojas.Date),1,2)+
                         copy(DateToStr(DtaEdt_ReposLojas.Date),4,2)+
                         copy(DateToStr(DtaEdt_ReposLojas.Date),7,4)+'.txt';

    sArqErros:=IncludeTrailingPathDelimiter(sPath_Local+'Arquivo Status Transf');

    If (Trim(sgCompServer)<>Trim(sComputadorWindows)) And (Trim(sComputadorWindows)<>'ODIR-PC') Then
    Begin
      sArqErros:=f_Troca('C:\','',sArqErros);
      sArqErros:='\\'+sgIPInternetServer+'\'+sArqErros;
    End;

    if (Not DirectoryExists(sArqErros)) Or (Not FileExists(sArqErros+sArq)) Then
    Begin
      if Not DirectoryExists(sArqErros) Then
      Begin
        msg('Sem Conexão com Servidor...','A');
        Exit;
      End;

      If Not FileExists(sArqErros+sArq) Then
      Begin
        msg('Não Houve Loja a Processar em '+DateToStr(DtaEdt_ReposLojas.Date)+' !!','A');
        Exit;
      End;
    End; // if Not DirectoryExists(sPath) Then

    sArqErros:=sArqErros+sArq;

    // Le o Arquvio de Erros ===================================================
    tsArquivo.LoadFromFile(sArqErros);

    // Cria Apresentação =======================================================
    FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
    AbreSolicitacoes(7);

    FrmSolicitacoes.Caption:='Processamento de Reposições LOJAS';
    FrmSolicitacoes.Ts_MargemLucroFormulas.Caption:='Status do Processamento - '+DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

    FrmSolicitacoes.EditorMargemLucro.Lines.Clear;

    For i:=0 to tsArquivo.Count-1 do
    Begin
      FrmSolicitacoes.EditorMargemLucro.Lines.Add(tsArquivo[i]);
    End; // For i := 0 to tsArquivo.Count - 1 do
    FrmSolicitacoes.EditorMargemLucro.Lines.Add('=====================================================================');
  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsArquivo);
  End; // Try

  FrmSolicitacoes.ShowModal;
  FreeAndNil(FrmSolicitacoes);

end;

procedure TFrmCentralTrocas.EdtReposLojasQtdItensPedExit(Sender: TObject);
Var
  MySql: String;
begin
  // Salva Quantidade de Itens no Pedido SIDICOM ===============================
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;

    MySql:=' UPDATE TAB_AUXILIAR ni'+
           ' SET ni.cod_aux='+VarToStr(EdtReposLojasQtdItensPed.AsInteger)+
           ' WHERE ni.tip_aux=11';
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

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try 

end;

procedure TFrmCentralTrocas.Bt_ReposLojasPedidosGeradosClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_ReposLojasDocs.SetFocus;

  If DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty Then
   Exit;

  // Pedidos Gerados
  MySql:=' SELECT lo.num_docto, lo.num_pedido, count(lo.cod_produto) Tot_Prod'+
         ' FROM ES_ESTOQUES_LOJAS lo'+
         ' WHERE lo.qtd_a_transf>0'+
         ' AND   lo.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
         ' AND   lo.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString)+
         ' AND   lo.dta_movto='+QuotedStr(f_Troca('-','.',f_Troca('/','.',DateToStr(DtaEdt_ReposLojas.Date))));

         If sgTipoPrioridade<>'Todas as Prioridades' Then
          MySql:=
           MySql+' AND lo.ind_prioridade in ('+sgTipoPrioridade+')';

         If (sgCorredores<>'') and (Not bgTodosCorredores) Then
          MySql:=
           MySql+' AND EXISTS (SELECT 1'+
                 '             FROM ES_ESTOQUES_CD cd'+
                 '             WHERE cd.cod_produto=lo.cod_produto'+
                 '             AND   cd.dta_movto=lo.dta_movto'+
                 '             AND   cd.end_zona||''.''||cd.end_corredor in ('+sgCorredores+'))';

         If Trim(EdtReposLojasCodForn.Text)<>'' Then
          MySql:=
           MySql+' AND EXISTS (SELECT 1'+
                 '             FROM PRODUTO pr'+
                 '             WHERE pr.codproduto=lo.cod_produto'+
                 '             AND   pr.principalfor='+QuotedStr(Trim(EdtReposLojasCodForn.Text))+')';

  MySql:=
   MySql+' GROUP BY 1,2'+
         ' ORDER BY 2';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  AbreSolicitacoes(7);

  FrmSolicitacoes.Caption:='Bel_'+DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString+' - '+DMCentralTrocas.CDS_ReposicaoDocsRAZAO_SOCIAL.AsString;
  FrmSolicitacoes.Ts_MargemLucroFormulas.Caption:='REPOSIÇÃO DE MERCADORIAS';

  FrmSolicitacoes.EditorMargemLucro.Lines.Clear;

  FrmSolicitacoes.EditorMargemLucro.Lines.Add('Números dos Pedidos Criados no SIDICOM');
  FrmSolicitacoes.EditorMargemLucro.Lines.Add('=====================================================================');
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    If DMBelShop.CDS_Busca.FieldByName('Num_Pedido').AsString='000000' Then
     FrmSolicitacoes.EditorMargemLucro.Lines.Add('- Nº Docto: '+DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString+
                                                 ' - Pedido Nº: <<AINDA NÃO GERADO>>'+
                                                 ' - Nº Produtos: '+DMBelShop.CDS_Busca.FieldByName('Tot_Prod').AsString)
    Else
     FrmSolicitacoes.EditorMargemLucro.Lines.Add('- Nº Docto: '+DMBelShop.CDS_Busca.FieldByName('Num_Docto').AsString+
                                                 ' - Pedido Nº: '+DMBelShop.CDS_Busca.FieldByName('Num_Pedido').AsString+
                                                 ' - Nº Produtos: '+DMBelShop.CDS_Busca.FieldByName('Tot_Prod').AsString);

    DMBelShop.CDS_Busca.Next;;
  End; // While Not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.Close;

  FrmSolicitacoes.EditorMargemLucro.Lines.Add('=====================================================================');
  FrmSolicitacoes.ShowModal;
  FreeAndNil(FrmSolicitacoes);

end;

procedure TFrmCentralTrocas.PC_PrincipalChange(Sender: TObject);
Var
  MySql: String;
begin
  CorSelecaoTabSheet(PC_Principal);

  If (PC_Principal.ActivePage=Ts_NotasEntDev) And (Ts_NotasEntDev.CanFocus) Then
  Begin
    EdtNotasEntDevCodProduto.SetFocus;
  End;

  If (PC_Principal.ActivePage=Ts_ReposLojas) And (Ts_ReposLojas.CanFocus) Then
  Begin
    FrmCentralTrocas.CorCaptionForm.FormCaption:='CENTRO DE DISTRIBUIÇÃO';

    // Busca o Numero Máximo de Itens no Pedido SIDICOM ==========================
    MySql:=' SELECT ni.cod_aux Nr_Reg'+
           ' FROM TAB_AUXILIAR ni'+
           ' WHERE ni.tip_aux=11';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Nr_Reg').AsString)='' Then
     EdtReposLojasQtdItensPed.AsInteger:=9999
    Else
     EdtReposLojasQtdItensPed.AsInteger:=DMBelShop.CDS_BuscaRapida.FieldByName('Nr_Reg').AsInteger;

    DMBelShop.CDS_BuscaRapida.Close;

    DtaEdt_ReposLojas.SetFocus;
    DtaEdt_ReposLojas.Style.Color:=clTeal;
    DtaEdt_ReposLojas.Style.Font.Color:=clWhite;
    DtaEdt_ReposLojas.Properties.ReadOnly:=True;
  End;

  If (PC_Principal.ActivePage=Ts_AnaliseReposicoesEndereco) And (Ts_AnaliseReposicoesEndereco.CanFocus) Then
  Begin
    Cbx_AnaliseReposMes.ItemIndex:=MonthOf(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor))-1;
    EdtAnaliseReposAno.Text:=IntToStr(YearOf(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)));
    Cbx_AnaliseReposMes.SetFocus;
  End;

  If (PC_Principal.ActivePage=Ts_QtdCaixaCD) And (Ts_QtdCaixaCD.CanFocus) Then
  Begin
    Screen.Cursor:=crAppStart;

    DMCentralTrocas.CDS_QtdCxCDProdutos.Open;
    DMCentralTrocas.CDS_QtdCxCDGrupos.Open;

    EdtQtdCaixaCDCodProd.SetFocus;
    Screen.Cursor:=crDefault;
    Application.ProcessMessages;
  End; // If (PC_Principal.ActivePage=Ts_QtdCaixaCD) And (Ts_QtdCaixaCD.CanFocus) Then

  If (PC_Principal.ActivePage=Ts_AnaliseReposicoesDiaria) And (Ts_AnaliseReposicoesDiaria.CanFocus) Then
  Begin
    Dbg_AnaliseRepDiaria.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_AnaliseReposicoesDiaria) And (Ts_AnaliseReposicoesDiaria.CanFocus) Then
end;

procedure TFrmCentralTrocas.PanReposLojasClick(Sender: TObject);
begin
  If AnsiUpperCase(Des_Usuario)=AnsiUpperCase('Odir') Then
  Begin
    Bt_ReposLojasAlterarQtd.Enabled:=True;
    Bt_ReposLojasCheckOut.Enabled:=True;
    // OdirApagar - 25/10/2017
    // Bt_ReposLojasGeraPedidoSIDICOM.Enabled:=True;
  End;
end;

procedure TFrmCentralTrocas.DtaEdt_ReposLojasExit(Sender: TObject);
Var
  i: Integer;
begin
  OdirPanApres.Caption:='AGUARDE !! Localizando Reposições...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  Screen.Cursor:=crAppStart;
  DtaEdt_ReposLojas.Properties.ReadOnly:=False;

  // Limpa Filtro de Corredores ================================================
  igCorredores      :=0;
  sgCorredores      :='';
  sgCorredoresFilter:='';
  bgTodosCorredores :=True;
  sgFilterAtual     :='';
  For i:=0 to CkCbx_ReposLojasCorredor.Items.Count-1 do
  Begin
    CkCbx_ReposLojasCorredor.Checked[i]:=False;
  End; // for i:=0 to CkCbx_ReposLojasCorredor.Items.Count-1 do

  // Cores da Data =============================================================
  DtaEdt_ReposLojas.Style.Color:=clBlue;
  DtaEdt_ReposLojas.Style.Font.Color:=clWhite;
  DtaEdt_ReposLojas.DroppedDown:=False;

  // Fecha Client's de Reposições ==============================================
  DMCentralTrocas.CDS_ReposicaoDocs.Close;
  DMCentralTrocas.CDS_ReposicaoTransf.Close;
  DMCentralTrocas.CDS_ReposicaoTransf.Filtered:=False;
  DMCentralTrocas.CDS_ReposicaoTransf.Filter:='';

  If Trim(DtaEdt_ReposLojas.Text)='' Then
  Begin
    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
    Bt_ReposLojasFechar.SetFocus;
    Exit;
  End;

  DtaEdt_ReposLojas.Date:=StrToDate(DtaEdt_ReposLojas.Text);
  If DtaEdt_ReposLojas.Date>StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor))) Then
  Begin
    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
    msg('Date Inválida !!','A');
    DtaEdt_ReposLojas.Date:=StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)));
    DtaEdt_ReposLojas.SetFocus;
    Exit;
  End;

  Bt_ReposLojasAlterarQtd.Enabled:=True;
  Bt_ReposLojasCheckOut.Enabled:=True;
  // OdirApagar - 25/10/2017
  //Bt_ReposLojasGeraPedidoSIDICOM.Enabled:=True;
  
  If DtaEdt_ReposLojas.Date<StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor))) Then
  Begin
    Bt_ReposLojasAlterarQtd.Enabled:=False;
    Bt_ReposLojasCheckOut.Enabled:=False;
    // OdirApagar - 25/10/2017
    // Bt_ReposLojasGeraPedidoSIDICOM.Enabled:=False;
  End; // If DtaEdt_ReposLojas.Date<DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor) Then

// OdirApagar - 11/08/2017 - Colocado em PFrmTransferencias
//  // Localizando Transferencias Setor de Compras ===============================
//  If Not ProcessaTranferenciasCompras Then
//  Begin
//    OdirPanApres.Visible:=False;
//    Screen.Cursor:=crDefault;
//    Exit;
//  End;

  DMCentralTrocas.CDS_ReposicaoDocs.DisableControls;
  DMCentralTrocas.CDS_ReposicaoDocs.Close;
  DMCentralTrocas.SDS_ReposicaoDocs.Params.ParamByName('sDta').AsDate:=StrToDate(DateToStr(DtaEdt_ReposLojas.Date));
  DMCentralTrocas.CDS_ReposicaoDocs.Open;
  DMCentralTrocas.CDS_ReposicaoDocs.EnableControls;

  If DMCentralTrocas.CDS_ReposicaoDocs.IsEmpty Then
  Begin
    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
    DMCentralTrocas.CDS_ReposicaoDocs.Close;
    DMCentralTrocas.CDS_ReposicaoTransf.Close;

    If msg('Sem Produtos para Reposição'+cr+'em '+DateToStr(DtaEdt_ReposLojas.Date)+' !!'+cr+cr+'Deseja Sair ??','C')=1 Then
    Begin
      Bt_NotasEntDevFecharClick(Self);
      Exit;
    End;

    DtaEdt_ReposLojas.SetFocus;
    Exit;
  End; // If DMCentralTrocas.CDS_ReposicaoDocs.IsEmpty Then
  DMCentralTrocas.CDS_ReposicaoDocs.First;

  If DMCentralTrocas.CDS_ReposicaoDocsTot_Itens.Value=0 Then
  Begin
    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    MessageBox(Handle, pChar('Erro de CONEXÃO Na Reposição de Estoques !!'+cr+cr+
                             'Entrar em Contato com "ODIR" IMEDIATAMENTE !!!!!'+cr+
                             'Celular: 9957-8234'+cr+
                             'E-Mail : odir.opss@gmail.com'), 'ATENÇÃO !!', MB_ICONERROR);

    DMCentralTrocas.CDS_ReposicaoDocs.Close;
    DMCentralTrocas.CDS_ReposicaoTransf.Close;
    Exit;
  End;
  DMCentralTrocas.CDS_ReposicaoTransf.First;

  // Busca Prioridades
  Ckb_ReposLojasPrioridade0.Checked:=True;
  Ckb_ReposLojasPrioridade0Click(Self);

  If DMCentralTrocas.CDS_ReposicaoDocsTot_Itens.Value=0 Then
  Begin
    Ckb_ReposLojasPrioridade0.Checked:=False;
    Ckb_ReposLojasPrioridade1.Checked:=True;
    Ckb_ReposLojasPrioridade0Click(Self);
  End;

  If DMCentralTrocas.CDS_ReposicaoDocsTot_Itens.Value=0 Then
  Begin
    Ckb_ReposLojasPrioridade1.Checked:=False;
    Ckb_ReposLojasPrioridade2.Checked:=True;
    Ckb_ReposLojasPrioridade0Click(Self);
  End;

  If DMCentralTrocas.CDS_ReposicaoDocsTot_Itens.Value=0 Then
  Begin
    Ckb_ReposLojasPrioridade2.Checked:=False;
    Ckb_ReposLojasPrioridade3.Checked:=True;
    Ckb_ReposLojasPrioridade0Click(Self);
  End;

  // Se nâo Encontrou Nenhuma Prioridade =======================================
  If DMCentralTrocas.CDS_ReposicaoDocsTot_Itens.Value=0 Then
  Begin
    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    MessageBox(Handle, pChar('Erro na Reposição de Estoques !!'+cr+cr+
                             'Não Foi Encontrado Nenhuma Prioridade !!'+cr+
                             'Entrar em Contato com "ODIR" IMEDIATAMENTE !!!!!'+cr+
                             'Celular: 9957-8234'+cr+
                             'E-Mail : odir.opss@gmail.com'), 'ATENÇÃO !!', MB_ICONERROR);

    DMCentralTrocas.CDS_ReposicaoDocs.Close;
    DMCentralTrocas.CDS_ReposicaoTransf.Close;
    Exit;
  End;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;
end;

procedure TFrmCentralTrocas.DtaEdt_ReposLojasEnter(Sender: TObject);
begin
  DtaEdt_ReposLojas.Style.Color:=clTeal;
  DtaEdt_ReposLojas.Style.Font.Color:=clWhite;
end;

procedure TFrmCentralTrocas.DtaEdt_ReposLojasPropertiesChange(Sender: TObject);
begin
  Ckb_ReposLojasPrioridade0.Checked:=False;
  Ckb_ReposLojasPrioridade1.Checked:=False;
  Ckb_ReposLojasPrioridade2.Checked:=False;
  Ckb_ReposLojasPrioridade3.Checked:=False;

  Ckb_ReposLojasPrioridade0.Font.Color:=clRed;
  Ckb_ReposLojasPrioridade1.Font.Color:=clRed;
  Ckb_ReposLojasPrioridade2.Font.Color:=clRed;
  Ckb_ReposLojasPrioridade3.Font.Color:=clRed;

  If DMCentralTrocas.CDS_ReposicaoDocs.Active Then
  Begin
    DMCentralTrocas.CDS_ReposicaoDocs.Close;
    DMCentralTrocas.CDS_ReposicaoTransf.Close;
  End;

  Refresh;
end;

procedure TFrmCentralTrocas.Bt_AnaliseReposBuscarClick(Sender: TObject);
Var
  MySql: String;
  sCampo, sUltDia, sDiaAnt: String;
  i, iMes: Integer;
  dDta: TDateTime;
begin
  Dbg_AnaliseReposicoes.SetFocus;
  AtualizaData(Cbx_AnaliseReposMes, sgPeriodo, EdtAnaliseReposAno.Text);
  sgPeriodo:=f_Troca('/','.',f_Troca('-','.',sgPeriodo));

  // Numero do Mes Informado
  For iMes:=1 to 12 do
  Begin
    If AnsiUpperCase(LongMonthNames[iMes])=Cbx_AnaliseReposMes.Text Then
     Break;
  end;

  sUltDia:=IntToStr(iMes);
  If iMes<10 Then
   sUltDia:='0'+sUltDia;

  // Verifica se é Mes Corrente - Troca para dia Anterior ======================
  dDta:=DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor);

  If PrimUltDia(StrToDate('01/'+sUltDia+'/'+EdtAnaliseReposAno.Text),'P')>dDta Then
  Begin
    msg(' Mês/Ano Inválidos !!'+cr+cr+'MAIORES que Mês/Ano Atuais !!','A');
    Exit;
  end;

  If (iMes=MonthOf(dDta)) And (StrToInt(EdtAnaliseReposAno.Text)=YearOf(dDta)) Then
  Begin
    If DayOf(dDta)=1 Then
    Begin
      msg('Sem Reposição a Analisar !!','A');
      Exit;
    end;
    sUltDia:=DateToStr(PrimUltDia(StrToDate('01/'+sUltDia+'/'+EdtAnaliseReposAno.Text),'U'));
    sDiaAnt:=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)-1);

    sUltDia:=f_Troca('/','.',f_Troca('-','.',sUltDia));
    sDiaAnt:=f_Troca('/','.',f_Troca('-','.',sDiaAnt));
    sgPeriodo:=f_Troca(sUltDia,sDiaAnt,sgPeriodo);
  End; // If (iMes=MonthOf(dDta)) And (StrToInt(EdtAnaliseReposAno.Text)=YearOf(dDta)) Then

  // Buscar Es_Estoques_Lojas ==================================================
  OdirPanApres.Caption:='AGUARDE !! Localizando Reposições do Mês de :'+Cbx_AnaliseReposMes.Text+'/'+EdtAnaliseReposAno.Text;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2));
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;
  Screen.Cursor:=crAppStart;

  // Cria ClientDataSet ========================================================
  DMCentralTrocas.CDS_V_AnaliseReposicao.Close;
  DMCentralTrocas.CDS_V_AnaliseReposicao.FieldDefs.Clear;

  DMCentralTrocas.CDS_V_AnaliseReposicao.FieldDefs.Add('ENDERECAMENTO',ftString,15);
  DMCentralTrocas.CDS_V_AnaliseReposicao.FieldDefs.Add('TOTAL',ftFloat);
  DMCentralTrocas.CDS_V_AnaliseReposicao.FieldDefs.Add('REPOSTO',ftFloat);
  DMCentralTrocas.CDS_V_AnaliseReposicao.FieldDefs.Add('NAO_REPOSTO',ftFloat);
  DMCentralTrocas.CDS_V_AnaliseReposicao.FieldDefs.Add('PER_REPOSICAO',ftFloat);
  DMCentralTrocas.CDS_V_AnaliseReposicao.FieldDefs.Add('MES',ftString,10);
  DMCentralTrocas.CDS_V_AnaliseReposicao.FieldDefs.Add('ORDEM',ftInteger);

  // Busca Dias do Mes que Houveram Movimentos =================================
  MySql:=' Select distinct Cast(lpad(extract(day from ld.dta_movto),2,''0'') as varchar(2)) Dia'+
         ' From es_estoques_lojas ld'+
         ' Where ld.ind_transf='+QuotedStr('SIM')+
         ' And   ld.dta_movto '+sgPeriodo+
         ' Order By 1';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    sCampo:='Dia_'+DMBelShop.CDS_Busca.FieldByName('Dia').AsString;

    MySqlSelect:=MySqlSelect+', 0.00 '+sCampo;
    DMCentralTrocas.CDS_V_AnaliseReposicao.FieldDefs.Add(sCampo,ftFloat);

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.Close;

  DMCentralTrocas.CDS_V_AnaliseReposicao.CreateDataSet;
  DMCentralTrocas.CDS_V_AnaliseReposicao.Open;

  MySql:=' SELECT COALESCE(es.end_zona, ''0'')||''.''||COALESCE(es.end_corredor,''000'') Endereco,'+
         ' (COUNT(lo.num_seq)) Total,'+
         ' (COUNT(lo.num_seq)-COUNT(decode(lo.num_pedido,''000000'',lo.num_seq))) Reposto,'+
         ' (COUNT(DECODE(lo.num_pedido,''000000'',lo.num_seq))) Nao_Reposto,'+
         ' CAST('+
         '      CASE'+
         '         WHEN (COUNT(lo.num_seq))=0 THEN'+
         '            0.00'+
         '         ELSE'+
         '            ((CAST((COUNT(lo.num_seq)-COUNT(DECODE(lo.num_pedido,''000000'',lo.num_seq))) AS NUMERIC(12,2))*100)/'+
         '             (COUNT(lo.num_seq)))'+
         '      END'+
         ' AS NUMERIC(12,2)) Per_Reposicao,'+
         QuotedStr(Cbx_AnaliseReposMes.Text+'/'+EdtAnaliseReposAno.Text)+' Mes,'+
         ' 1 Ordem'+
         MySqlSelect+  // Campos de Dias

         ' FROM ES_ESTOQUES_LOJAS lo, ES_ESTOQUES_CD es'+
         ' WHERE lo.cod_produto=es.cod_produto'+
         ' AND   lo.dta_movto=es.dta_movto'+
         ' AND   lo.ind_transf='+QuotedStr('SIM')+
         ' AND   lo.dta_movto '+sgPeriodo+
         ' GROUP BY 1'+

         ' UNION'+

         ' SELECT ''=> TOTAL'' Endereco,'+
         ' (COUNT(lo.num_seq)) Total,'+
         ' (COUNT(lo.num_seq)-COUNT(DECODE(lo.num_pedido,''000000'',lo.num_seq))) Reposto,'+
         ' (COUNT(DECODE(lo.num_pedido,''000000'',lo.num_seq))) Nao_Reposto,'+
         ' CAST('+
         '      CASE'+
         '         WHEN (COUNT(lo.num_seq))=0 THEN'+
         '           0'+
         '         ELSE'+
         '           ((CAST((COUNT(lo.num_seq)-COUNT(DECODE(lo.num_pedido,''000000'',lo.num_seq))) AS NUMERIC(12,2))*100)/'+
         '            (COUNT(lo.num_seq)))'+
         '      END'+
         ' AS NUMERIC(12,2)) Per_Reposicao,'+
         QuotedStr(Cbx_AnaliseReposMes.Text+'/'+EdtAnaliseReposAno.Text)+' Mes,'+
         ' 0 Ordem'+
         MySqlSelect+  // Campos de Dias

         ' FROM ES_ESTOQUES_LOJAS lo, ES_ESTOQUES_CD es'+
         ' WHERE lo.cod_produto=es.cod_produto'+
         ' AND   lo.dta_movto=es.dta_movto'+
         ' AND   lo.ind_transf='+QuotedStr('SIM')+
         ' AND   lo.dta_movto '+sgPeriodo+

         ' ORDER BY 7, 1';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;
  If DMBelShop.CDS_Busca.IsEmpty Then
  Begin
    DMBelShop.CDS_Busca.Close;
    msg('Sem Movitomentos a Listar !!','A');
    Exit;
  End;
  DMCentralTrocas.CDS_V_AnaliseReposicao.Data:=DMBelShop.CDS_Busca.Data;
  DMBelShop.CDS_Busca.Close;

  // Acerta Alinhamentos de Fields =============================================
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[0].Alignment:=taRightJustify;
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[0].Alignment:=taRightJustify;
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[0].DisplayLabel:='Endereço';
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[0].DisplayWidth:=12;

  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[1].Alignment:=taRightJustify;
  TFloatField(DMCentralTrocas.CDS_V_AnaliseReposicao.FieldByName('TOTAL')).DisplayFormat:='0,';
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[1].DisplayLabel:='Total';
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[1].DisplayWidth:=10;

  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[2].Alignment:=taRightJustify;
  TFloatField(DMCentralTrocas.CDS_V_AnaliseReposicao.FieldByName('REPOSTO')).DisplayFormat:='0,';
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[2].DisplayLabel:='Reposto';
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[2].DisplayWidth:=14;

  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[3].Alignment:=taRightJustify;
  TFloatField(DMCentralTrocas.CDS_V_AnaliseReposicao.FieldByName('NAO_REPOSTO')).DisplayFormat:='0,';
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[3].DisplayLabel:='Não Reposto';
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[3].DisplayWidth:=14;

  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[4].Alignment:=taRightJustify;
  TFloatField(DMCentralTrocas.CDS_V_AnaliseReposicao.FieldByName('PER_REPOSICAO')).DisplayFormat:='0,.00';
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[4].DisplayLabel:='% Reposição';
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[4].DisplayWidth:=14;

  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[5].Alignment:=taRightJustify;
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[5].DisplayLabel:='Mês';
  DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[5].DisplayWidth:=16;

  For i:=7 to DMCentralTrocas.CDS_V_AnaliseReposicao.Fields.Count-1 do
  Begin
    sCampo:=DMCentralTrocas.CDS_V_AnaliseReposicao.Fields[i].FieldName;
    TFloatField(DMCentralTrocas.CDS_V_AnaliseReposicao.FieldByName(sCampo)).DisplayFormat:='0,.00';
    TFloatField(DMCentralTrocas.CDS_V_AnaliseReposicao.FieldByName(sCampo)).DisplayLabel:='% '+f_Troca('DIA','Dia',sCampo);
    TFloatField(DMCentralTrocas.CDS_V_AnaliseReposicao.FieldByName(sCampo)).DisplayWidth:=10;
    Dbg_AnaliseReposicoes.Columns[i].Color:=$00D9FFFF;
  End; // For i:=7 to DMCentralTrocas.CDS_V_AnaliseReposicao.Fields.Count-1 do

  // Acerta Alinhamentos do Dbg_AnaliseReposicoes ==============================
  For i:=0 to Dbg_AnaliseReposicoes.Columns.Count-1 do
  Begin
    Dbg_AnaliseReposicoes.Columns[i].Title.Alignment:=taRightJustify;
    If i in [5] Then
     Dbg_AnaliseReposicoes.Columns[i].Title.Alignment:=taLeftJustify;

    If i in [6] Then
     Dbg_AnaliseReposicoes.Columns[i].Visible:=False;
  End; // For i:=0 to Dbg_AnaliseReposicoes.Columns.Count-1 do

  OdirPanApres.Visible:=False;
  OdirPanApres.Caption:='AGUARDE !! Efetual Calculo de Percentual/Dia';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2));
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  MySql:=' SELECT'+
         ' ''Dia_''||Cast(lpad(extract(day from lo.dta_movto),2,''0'') as varchar(2)) Dia,'+
         ' Coalesce(es.end_zona, ''0'')||''.''||Coalesce(es.end_corredor,''000'') Endereco,'+
         ' CAST('+
         '      CASE'+
         '         WHEN (COUNT(lo.num_seq))=0 THEN'+
         '            0.00'+
         '         ELSE'+
         '            ((CAST((COUNT(lo.num_seq)-COUNT(DECODE(lo.num_pedido,''000000'',lo.num_seq))) as NUMERIC(12,2))*100)/'+
         '             (COUNT(lo.num_seq)))'+
         '      END'+
         ' AS NUMERIC(12,2)) Per_Reposicao'+

         ' FROM ES_ESTOQUES_LOJAS lo, ES_ESTOQUES_CD es'+
         ' WHERE lo.cod_produto=es.cod_produto'+
         ' AND   lo.dta_movto=es.dta_movto'+
         ' AND   lo.ind_transf='+QuotedStr('SIM')+
         ' AND   lo.dta_movto '+sgPeriodo+
         ' GROUP BY 1,2'+

         ' UNION'+

         ' SELECT'+
         ' ''Dia_''||Cast(lpad(extract(day from lo.dta_movto),2,''0'') as varchar(2)) Dia,'+
         ' ''=> TOTAL'' ENDERECO,'+
         ' CAST('+
         '      CASE'+
         '         WHEN (COUNT(lo.num_seq))=0 THEN'+
         '           0'+
         '         ELSE'+
         '           ((CAST((COUNT(lo.num_seq)-COUNT(DECODE(lo.num_pedido,''000000'',lo.num_seq))) as numeric(12,2))*100)/'+
         '            (COUNT(lo.num_seq)))'+
         '      END'+
         ' AS NUMERIC(12,2)) Per_Reposicao'+

         ' FROM ES_ESTOQUES_LOJAS lo, ES_ESTOQUES_CD es'+
         ' WHERE lo.cod_produto=es.cod_produto'+
         ' AND   lo.dta_movto=es.dta_movto'+
         ' AND   lo.ind_transf='+QuotedStr('SIM')+
         ' AND   lo.dta_movto '+sgPeriodo+
         ' GROUP BY 1'+
         ' ORDER BY 1,2';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    Application.ProcessMessages;

    sCampo:=DMBelShop.CDS_Busca.FieldBYName('Endereco').AsString;

    If DMCentralTrocas.CDS_V_AnaliseReposicao.Locate('ENDERECO',sCampo,[]) Then
    Begin
      sCampo:=DMBelShop.CDS_Busca.FieldBYName('Dia').AsString;
      DMCentralTrocas.CDS_V_AnaliseReposicao.Edit;
      DMCentralTrocas.CDS_V_AnaliseReposicao.FieldByName(sCampo).AsCurrency:=
                    DMBelShop.CDS_Busca.FieldBYName('Per_Reposicao').AsCurrency;
      DMCentralTrocas.CDS_V_AnaliseReposicao.Post;
    End;

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do

  Dbg_AnaliseReposCorredores.Columns[0].FieldName:='ENDERECO';
  Dbg_AnaliseReposicoes.Columns[0].Visible:=False;

  DMBelShop.CDS_Busca.Close;
  DMCentralTrocas.CDS_V_AnaliseReposicao.First;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;
end;

procedure TFrmCentralTrocas.Bt_AnaliseReposClipboardClick(Sender: TObject);
begin
  If DMCentralTrocas.CDS_V_AnaliseReposicao.IsEmpty Then
    Exit;

  DBGridClipboard(Dbg_AnaliseReposicoes);
end;

procedure TFrmCentralTrocas.Dbg_AnaliseReposicoesTitleClick(Column: TColumn);
begin
  If DMCentralTrocas.CDS_V_AnaliseReposicao.IsEmpty Then
   Exit;

  With DMCentralTrocas.CDS_V_AnaliseReposicao do
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
end;

procedure TFrmCentralTrocas.DtEdt_AnaliserReposDtaInicioPropertiesChange(Sender: TObject);
begin
  DMCentralTrocas.CDS_V_AnaliseReposicao.Close;
end;

procedure TFrmCentralTrocas.Dbg_AnaliseReposCorredoresDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  ShowScrollBar(Dbg_AnaliseReposCorredores.Handle, SB_VERT, False);
end;

procedure TFrmCentralTrocas.CkCbx_ReposLojasCorredorChange(Sender: TObject);
Var
  i: Integer;
  s: String;
begin
  If DMCentralTrocas.CDS_ReposicaoDocs.IsEmpty Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Analisando Endereçamentos...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;

  Screen.Cursor:=crAppStart;
  Refresh;

  igCorredores:=0;
  sgCorredores:='';
  sgCorredoresFilter:='';
  bgTodosCorredores:=True;
  For i:=0 to CkCbx_ReposLojasCorredor.Items.Count-1 do
  Begin
    If CkCbx_ReposLojasCorredor.Checked[i] Then
     Begin
       If sgCorredoresFilter='' Then
        sgCorredoresFilter:='ENDERECO LIKE '+QuotedStr(CkCbx_ReposLojasCorredor.Items[i]+'%')
       Else
        sgCorredoresFilter:=sgCorredoresFilter+' OR ENDERECO LIKE '+QuotedStr(CkCbx_ReposLojasCorredor.Items[i]+'%');

       If sgCorredores='' Then
        sgCorredores:=QuotedStr(CkCbx_ReposLojasCorredor.Items[i])
       Else
        sgCorredores:=sgCorredores+', '+QuotedStr(CkCbx_ReposLojasCorredor.Items[i]);

       Inc(igCorredores);
     End
    Else
     Begin
       bgTodosCorredores:=False;
     End;
  End; // for i:=0 to CkCbx_ReposLojasCorredor.Items.Count-1 do

  // Busca Movtos ==============================================================
  DMCentralTrocas.CDS_ReposicaoTransf.Filtered:=False;
  DMCentralTrocas.CDS_ReposicaoTransf.Filter:='';

  If (Not DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty) and (sgCorredoresFilter<>'') and (Not bgTodosCorredores) Then
  Begin
    DMCentralTrocas.CDS_ReposicaoTransf.Filter:='('+sgCorredoresFilter+')';

    If Trim(sgPrioridadeFilter)<>'' Then
     DMCentralTrocas.CDS_ReposicaoTransf.Filter:=DMCentralTrocas.CDS_ReposicaoTransf.Filter+' AND ('+sgPrioridadeFilter+')';

    If Trim(EdtReposLojasCodForn.Text)<>'' Then
     DMCentralTrocas.CDS_ReposicaoTransf.Filter:=DMCentralTrocas.CDS_ReposicaoTransf.Filter+' AND (PRINCIPALFOR='+QuotedStr(Trim(EdtReposLojasCodForn.Text))+')';

    DMCentralTrocas.CDS_ReposicaoTransf.Filtered:=True;
  End;

  If (Trim(sgPrioridadeFilter)<>'') And (Not DMCentralTrocas.CDS_ReposicaoTransf.Filtered) Then
  Begin
    DMCentralTrocas.CDS_ReposicaoTransf.Filter:='('+sgPrioridadeFilter+')';

    If Trim(EdtReposLojasCodForn.Text)<>'' Then
     DMCentralTrocas.CDS_ReposicaoTransf.Filter:=DMCentralTrocas.CDS_ReposicaoTransf.Filter+' AND (PRINCIPALFOR='+QuotedStr(Trim(EdtReposLojasCodForn.Text))+')';

    DMCentralTrocas.CDS_ReposicaoTransf.Filtered:=True;
  End; // If Trim(sgPrioridadeFilter)<>'' Then

  If (Trim(EdtReposLojasCodForn.Text)<>'') And (Not DMCentralTrocas.CDS_ReposicaoTransf.Filtered) Then
  Begin
    DMCentralTrocas.CDS_ReposicaoTransf.Filter:='PRINCIPALFOR='+QuotedStr(Trim(EdtReposLojasCodForn.Text));

    DMCentralTrocas.CDS_ReposicaoTransf.Filtered:=True;
  End; // If Trim(EdtReposLojasCodForn.Text)<>'' Then

  // Atualiza Totais ===========================================================
  If DMCentralTrocas.CDS_ReposicaoTransf.Filter<>sgFilterAtual Then
  Begin
    sgFilterAtual:=DMCentralTrocas.CDS_ReposicaoTransf.Filter;
    AtualizaTotaisLojas;
  End;

  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;
  Refresh;

  s:='TODOS os Fornecedores !!';
  If Trim(EdtReposLojasCodForn.Text)<>'' Then
   s:='o Fornecedor'+cr+cr+EdtReposLojasDesForn.Text;

  msg('VOCÊ está Trabalhando com '+s,'A');

  Dbg_ReposLojasDocs.SetFocus;
end;

procedure TFrmCentralTrocas.Dbg_ReposLojasItensDblClick(Sender: TObject);
Var
  sCod, sQtd, sObs: String;
begin
  If DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty Then
   Exit;

  // Apresenta Quantidade Sugerida =============================================
  sCod:=DMCentralTrocas.CDS_ReposicaoTransfCOD_PRODUTO.AsString;
  sObs:='Quantidade de Reposição Sugerida: ';
  sQtd:='Odir';

  If DMCentralTrocas.CDS_ReposicaoTransfQTD_TRANSF_OC.AsInteger<>0 Then
   Begin
     sQtd:=DMCentralTrocas.CDS_ReposicaoTransfQTD_TRANSF_OC.AsString;
     sObs:='Quantidade de Reposição Sugerida (Compras): ';
   End
  Else If DMCentralTrocas.CDS_ReposicaoTransfQTD_TRANSF.AsInteger<>0 Then
   Begin
     sQtd:=DMCentralTrocas.CDS_ReposicaoTransfQTD_TRANSF.AsString;
   End;

  If sQtd<>'Odir' Then
   Application.MessageBox(PChar(sObs+sQtd), PChar('Produto: '+sCod), 48)
  Else
   Application.MessageBox('Entrar em Contato com o ODIR !!', 'ATENÇÃO !!', 48);
end;

procedure TFrmCentralTrocas.Dbg_ReposLojasDocsDblClick(Sender: TObject);
Var
  s: String;
begin
  s:='ODIR PEDRO MARCIO HERALDO WESLEY GEVERTON CHRISTIAN CRISTIANO';

  If Pos(AnsiUpperCase(Des_Login), s)<>0 Then
  Begin
    Bt_ReposLojasAlterarQtd.Enabled:=(Not Bt_ReposLojasAlterarQtd.Enabled);

    // OdirApagar - 25/10/2017
    // Bt_ReposLojasGeraPedidoSIDICOM.Enabled:=(Not Bt_ReposLojasGeraPedidoSIDICOM.Enabled);
    
    Bt_ReposLojasCheckOut.Enabled:=(Not Bt_ReposLojasCheckOut.Enabled);
  End;

end;

procedure TFrmCentralTrocas.EdtQtdCaixaCDCodProdExit(Sender: TObject);
Var
  MySql: String;
  bCodBarras: Boolean;
begin

  // Verifica se é Busca por Codigo dxe Barras =================================
  bCodBarras:=True;
  If Length(EdtQtdCaixaCDCodProd.Text)<7 Then
   bCodBarras:=False;

  sgCodProduto:='';
  EdtQtdCaixaCDQtdCxProd.Value:=0;
  EdtQtdCaixaCDPercCxProd.Value:=0;
  EdtQtdCaixaCDDesProd.Clear;

  If Trim(EdtQtdCaixaCDCodProd.Text)='' Then
   EdtQtdCaixaCDCodProd.Text:='0';

  If (Length(EdtQtdCaixaCDCodProd.Text)<7) and (Trim(EdtQtdCaixaCDCodProd.Text)<>'0') Then
   EdtQtdCaixaCDCodProd.Text:=FormatFloat('000000',StrToInt(EdtQtdCaixaCDCodProd.Text));

  If (EdtQtdCaixaCDCodProd.Text<>'000000') And (EdtQtdCaixaCDCodProd.Text<>'0') Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Produtos ==========================================================
    MySql:=' SELECT pr.apresentacao, pr.codproduto'+
           ' FROM PRODUTO pr';

           If bCodBarras Then
            MySql:=
             MySql+' WHERE Trim(pr.codbarra)='+QuotedStr(EdtQtdCaixaCDCodProd.Text)
           Else
            MySql:=
             MySql+' WHERE pr.codproduto='+QuotedStr(EdtQtdCaixaCDCodProd.Text);

    MySql:=
     MySql+' UNION'+

           ' SELECT p.apresentacao, b.codproduto'+
           ' FROM PRODUTO p, PRODUTOSBARRA b'+
           ' WHERE p.codproduto=b.codproduto';

           If bCodBarras Then
            MySql:=
             MySql+' AND Trim(b.codbarra)='+QuotedStr(EdtQtdCaixaCDCodProd.Text)
           Else
            MySql:=
             MySql+' AND   p.codproduto='+QuotedStr(EdtQtdCaixaCDCodProd.Text);
    IBQ_MPMS.Close;
    IBQ_MPMS.SQL.Clear;
    IBQ_MPMS.SQL.Add(MySql);
    IBQ_MPMS.Open;

    Screen.Cursor:=crDefault;

    If Trim(IBQ_MPMS.FieldByName('CodProduto').AsString)='' Then
    Begin
      msg('Produto NÃO Encontrado !!!', 'A');
      IBQ_MPMS.Close;
      EdtQtdCaixaCDCodProd.Text:='0';
      EdtQtdCaixaCDCodProd.SetFocus;
      Exit;
    End; // If Trim(IBQ_MPMS.FieldByName('CodProduto').AsString)='' Then

    sgCodProduto:=IBQ_MPMS.FieldByName('CodProduto').AsString;
    EdtQtdCaixaCDDesProd.Text:=IBQ_MPMS.FieldByName('Apresentacao').AsString;

    IBQ_MPMS.Close;

    EdtQtdCaixaCDQtdCxProd.SetFocus;
  End; // If EdtQtdCaixaCDCodProd.Text<>'000000' Then
end;

procedure TFrmCentralTrocas.Bt_QtdCaixaCDBuscaProdClick(Sender: TObject);
Var
  MySql: String;
begin
  EdtQtdCaixaCDCodProd.SetFocus;

  sgCodProduto:='';
  EdtQtdCaixaCDCodProd.Clear;
  EdtQtdCaixaCDQtdCxProd.Value:=0;
  EdtQtdCaixaCDPercCxProd.Value:=0;
  EdtQtdCaixaCDDesProd.Clear;
  Refresh;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisaIB:=TFrmPesquisaIB.Create(Self);

  FrmPesquisaIB.IBCDS_Pesquisa.DBConnection:=IBQ_MPMS.Database;
  FrmPesquisaIB.IBCDS_Pesquisa.DBTransaction:=IBQ_MPMS.Transaction;


  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT TRIM(p.Apresentacao) Produto, p.CodProduto'+
         ' FROM PRODUTO p'+
         ' WHERE p.principalfor NOT IN (''000300'', ''000500'', ''000883'', ''010000'', ''001072'')'+
         ' AND   p.codaplicacao NOT IN (''0016'', ''0015'', ''0017'')'+
         ' Order by p.Apresentacao';
  FrmPesquisaIB.IBCDS_Pesquisa.Close;
  FrmPesquisaIB.IBCDS_Pesquisa.CommandText:=MySql;
  FrmPesquisaIB.IBCDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('CodProduto').AsString)='' Then
  Begin
    msg('Sem Produto a Listar !!','A');
    EdtQtdCaixaCDCodProd.Clear;
    FrmPesquisaIB.IBCDS_Pesquisa.Close;
    FreeAndNil(FrmPesquisaIB);
    EdtQtdCaixaCDCodProd.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisaIB.Campo_pesquisa:='Produto';
  FrmPesquisaIB.Campo_Codigo:='CodProduto';
  FrmPesquisaIB.Campo_Descricao:='Produto';
  FrmPesquisaIB.EdtDescricao.Clear;
  FrmPesquisaIB.Campo_Retorno1:='';

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisaIB.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then
  Begin
    sgCodProduto:=FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('CodProduto').AsString;

    EdtQtdCaixaCDCodProd.Text:=FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('CodProduto').AsString;
    EdtQtdCaixaCDDesProd.Text:=FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('Produto').AsString;
    EdtQtdCaixaCDQtdCxProd.SetFocus;
  End; // If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then

  FrmPesquisaIB.IBCDS_Pesquisa.Close;
  FreeAndNil(FrmPesquisaIB);
end;

procedure TFrmCentralTrocas.Bt_QtdCaixaCDBuscaGrupoClick(Sender: TObject);
Var
  MySql: String;
begin
  sgCodGrupo   :='';
  sgDesGrupo   :='';
  sgCodSubGrupo:='';
  sgDesSubGrupo:='';

  EdtQtdCaixaCDDesGrupo.Clear;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisaIB:=TFrmPesquisaIB.Create(Self);

  FrmPesquisaIB.IBCDS_Pesquisa.DBConnection:=IBQ_MPMS.Database;
  FrmPesquisaIB.IBCDS_Pesquisa.DBTransaction:=IBQ_MPMS.Transaction;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' select TRIM(g.NomeGrupo) NomeGrupo, TRIM(g.CodGrupo) CodGrupo'+
         ' from Grupo g'+
         ' order by g.nomegrupo';
  FrmPesquisaIB.IBCDS_Pesquisa.Close;
  FrmPesquisaIB.IBCDS_Pesquisa.CommandText:=MySql;
  FrmPesquisaIB.IBCDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('CodGrupo').AsString)='' Then
  Begin
    msg('Sem Grupo a Listar !!','A');
    FreeAndNil(FrmPesquisaIB);
    Dbg_QtdsCaixaCDGrupos.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisaIB.Campo_pesquisa:='NomeGrupo';
  FrmPesquisaIB.Campo_Codigo:='CodGrupo';
  FrmPesquisaIB.Campo_Descricao:='NomeGrupo';
  FrmPesquisaIB.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisaIB.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') And (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0') Then
  Begin
    EdtQtdCaixaCDDesGrupo.Text:=FrmPesquisaIB.EdtDescricao.Text;

    sgCodGrupo:=FrmPesquisaIB.EdtCodigo.Text;
    sgDesGrupo:=FrmPesquisaIB.EdtDescricao.Text;
  End; // If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') And (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0') Then

  FreeAndNil(FrmPesquisaIB);
end;

procedure TFrmCentralTrocas.Bt_QtdCaixaCDBuscaSubGrupoClick(Sender: TObject);
Var
  MySql: String;
begin
  If Trim(sgDesGrupo)='' Then
  Begin
    msg('Favor Informar o Grupo de Produtos !!','A');
    Dbg_QtdsCaixaCDGrupos.SetFocus;
    Exit;
  End;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisaIB:=TFrmPesquisaIB.Create(Self);

  FrmPesquisaIB.IBCDS_Pesquisa.DBConnection:=IBQ_MPMS.Database;
  FrmPesquisaIB.IBCDS_Pesquisa.DBTransaction:=IBQ_MPMS.Transaction;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' select TRIM(sg.NomeSubGrupo) NomeSubGrupo, TRIM(sg.CodSubGrupo) CodSubGrupo'+
         ' from GrupoSub sg'+
         ' where sg.codgrupo='+QuotedStr(sgCodGrupo)+
         ' order by sg.NomeSubGrupo';
  FrmPesquisaIB.IBCDS_Pesquisa.Close;
  FrmPesquisaIB.IBCDS_Pesquisa.CommandText:=MySql;
  FrmPesquisaIB.IBCDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('CodSubGrupo').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    FreeAndNil(FrmPesquisaIB);
    Dbg_QtdsCaixaCDGrupos.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisaIB.Campo_pesquisa:='NomeSubGrupo';
  FrmPesquisaIB.Campo_Codigo:='CodSubGrupo';
  FrmPesquisaIB.Campo_Descricao:='NomeSubGrupo';
  FrmPesquisaIB.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisaIB.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') And (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0') Then
  Begin
    sgCodSubGrupo:=FrmPesquisaIB.EdtCodigo.Text;
    sgDesSubGrupo:=FrmPesquisaIB.EdtDescricao.Text;

    EdtQtdCaixaCDDesGrupo.Text:=sgDesGrupo+' - '+FrmPesquisaIB.EdtDescricao.Text;
  End; // If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') And (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0') Then

  FreeAndNil(FrmPesquisaIB);
  SelectNext(ActiveControl,True,True);
end;

procedure TFrmCentralTrocas.Bt_QtdCaixaCDIncluirGrupoClick(Sender: TObject);
begin
  If Trim(sgDesGrupo)='' Then
  Begin
    msg('Favor Informar o Grupo de Produtos !!','A');
    Dbg_QtdsCaixaCDGrupos.SetFocus;
    Exit;
  End;

  If Trim(sgCodSubGrupo)='' Then
  Begin
    If msg('SubGrupo Não Informado ??'+cr+cr+'Manter SEM ??','C')=2 Then
    Begin
      Dbg_QtdsCaixaCDGrupos.SetFocus;
      Exit;
    End;
  End;

  If EdtQtdCaixaCDQtdCxGrupo.Value<1 Then
  Begin
    msg('Favor Informar a Quantidade'+cr+cr+'por Caixa do Grupo !!','A');
    EdtQtdCaixaCDQtdCxGrupo.SetFocus;
    Exit;
  End;

  If EdtQtdCaixaCDPercCxGrupo.Value=0 Then
  Begin
    If msg('O Percentual Zero Esta Correto ??','C')=2 Then
    Begin
      EdtQtdCaixaCDPercCxGrupo.SetFocus;
      Exit;
    End;
  End;

  // Verifica a Existencia do Grupo/SubGrupo ===================================
  If DMCentralTrocas.CDS_QtdCxCDGrupos.Locate('CODIGO',sgCodGrupo+sgCodSubGrupo,[]) Then
  Begin
    If msg('Grupo/SubGrupo Já Informado !!'+cr+cr+'Deseja Alterá-lo ??','C')=2 Then
    Begin
      sgCodGrupo   :='';
      sgDesGrupo   :='';
      sgCodSubGrupo:='';
      sgDesSubGrupo:='';

      EdtQtdCaixaCDQtdCxGrupo.Clear;
      EdtQtdCaixaCDPercCxGrupo.Value:=0;
      EdtQtdCaixaCDDesGrupo.Clear;

      Dbg_QtdsCaixaCDGrupos.SetFocus;
      Exit;
    End;
  End;

  // Atualiza PROD_CAIXA_CD ====================================================
  AtualizaPROD_CAIXA_CD('iG');

  Dbg_QtdsCaixaCDGrupos.SetFocus;

end;

procedure TFrmCentralTrocas.Bt_QtdCaixaCDIncluirProdClick(Sender: TObject);
begin
  If Trim(EdtQtdCaixaCDDesProd.Text)='' Then
  Begin
    msg('Favor Informar o Produto !!','A');
    EdtQtdCaixaCDCodProd.SetFocus;
    Exit;
  End;

  If EdtQtdCaixaCDQtdCxProd.Value<1 Then
  Begin
    msg('Favor Informar a Quantidade'+cr+cr+'por Caixa do Produto !!','A');
    EdtQtdCaixaCDQtdCxProd.SetFocus;
    Exit;
  End;

  If EdtQtdCaixaCDPercCxProd.Value=0 Then
  Begin
    If msg('O Percentual Zero Esta Correto ??','C')=2 Then
    Begin
      EdtQtdCaixaCDPercCxProd.SetFocus;
      Exit;
    End;
  End;

  // Verifica a Existencia do Produto ==========================================
  If DMCentralTrocas.CDS_QtdCxCDProdutos.Locate('CODIGO',sgCodProduto,[]) Then
  Begin
    If msg('Produto Já Informado !!'+cr+cr+'Deseja Alterá-lo ??','C')=2 Then
    Begin
      sgCodProduto:='';
      EdtQtdCaixaCDCodProd.Clear;
      EdtQtdCaixaCDQtdCxProd.Value:=0;
      EdtQtdCaixaCDPercCxProd.Value:=0;
      EdtQtdCaixaCDDesProd.Clear;

      EdtQtdCaixaCDCodProd.SetFocus;
      Exit;
    End;
  End;

  // Atualiza PROD_CAIXA_CD ====================================================
  AtualizaPROD_CAIXA_CD('iP');

  EdtQtdCaixaCDCodProd.SetFocus;
end;

procedure TFrmCentralTrocas.Dbg_QtdsCaixaCDProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

  If DMCentralTrocas.CDS_QtdCxCDProdutos.IsEmpty Then
   Exit;

  // Exclui Produto ============================================================
  If (Key=VK_Delete) Then
  Begin
    If msg('Deseja Realmente EXCLUIR'+cr+cr+'o Produto Selecionado ??','C')=2 Then
     Exit;

    AtualizaPROD_CAIXA_CD('eP');
  End; // If (Key=VK_Delete) Then
end;

procedure TFrmCentralTrocas.Dbg_QtdsCaixaCDGruposKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

  If DMCentralTrocas.CDS_QtdCxCDGrupos.IsEmpty Then
   Exit;

  // Exclui Produto ============================================================
  If (Key=VK_Delete) Then
  Begin
    If msg('Deseja Realmente EXCLUIR'+cr+cr+'o Grupo/SubGrupo Selecionado ??','C')=2 Then
     Exit;

    AtualizaPROD_CAIXA_CD('eG');
  End; // If (Key=VK_Delete) Then
end;

procedure TFrmCentralTrocas.FormResize(Sender: TObject);
begin
// CkCbx_ReposLojasCorredor.Width:=Pan_ReposLojasCorredor.Width-88;
end;

procedure TFrmCentralTrocas.Bt_ReposLojasGeraArquivoLinxClick(Sender: TObject);
Var
  sArquivo: TStringList;
  i: Integer;

  sPastaArqLinx: String;
begin
  Dbg_ReposLojasDocs.SetFocus;

  If DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    msg('Sem Produto a Exporta para o LINX !!','A');
    Exit;
  End;

  // Verifica se Existem Itens =================================================
  If Not VerificaExistenciaItens(True) Then
  Begin
    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
    msg('Sem Produto a Exporta para o LINX !!','A');
    Exit;
  End;

  // OdirApagar - 25/08/2017
//  sgMensagem:=DMCentralTrocas.CDS_ReposicaoDocsRAZAO_SOCIAL.AsString+cr+
//  'Deseja Realmente Exportar o Docto Nº '+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString;
//  If (sgCorredores<>'') and (Not bgTodosCorredores) Then
//   sgMensagem:=sgMensagem+cr+'Corredor(es): '+sgCorredores;
//
//  If msg(sgMensagem,'C')=2 Then
//   Exit;
  sgMensagem:=sgCorredores;
  If Trim(sgMensagem)='' Then
   sgMensagem:='Todos';

  If Trim(EdtReposLojasCodForn.Text)<>'' Then
   sgMensagem:=sgMensagem+cr+cr+'Fornecedor'+cr+Trim(EdtReposLojasDesForn.Text);

  If Application.MessageBox(PChar('Deseja Realmente Exportar para o LINX ??'+cr+cr+
                                  'Docto Nº:  '+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+cr+
                                  'Loja:  '+DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString+' - '+
                                            DMCentralTrocas.CDS_ReposicaoDocsRAZAO_SOCIAL.AsString+cr+
                                  'Prioridade(s):  '+sgTipoPrioridade+cr+
                                  'Corredor(es):  '+sgMensagem), 'ATENÇÃO !!', 292)=IdNo Then
   Exit;
  sgMensagem:='';

  // Verifica se Existe Arquivo INI com Pastas Possiveis na REDE ===============
  OdirPanApres.Caption:='AGUARDE !! Localizando Pasta Destino para Gravação do Arquivo Texto_LINX Com Reposições...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  sPastaArqLinx:='';
  If fileexists(IncludeTrailingPathDelimiter(sPath_Local)+'CD_PastaArquivoLinx.ini') then
  Begin
    sPastaArqLinx:='ok';
  End;

  // Verifica se é Possivel Acessar a Pasta Pela REDE ==========================
  If Trim(sPastaArqLinx)='ok' Then
  Begin
    sArquivo:= TStringList.Create;
    Try
      sArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sPath_Local)+'CD_PastaArquivoLinx.ini');

      For i:=0 to sArquivo.Count-1 do
      Begin
       sPastaArqLinx:=IncludeTrailingPathDelimiter(Trim(sArquivo[i]));

       If not DirectoryExists(sPastaArqLinx) Then
        sPastaArqLinx:=''
      End; // For i:=0 to sArquivo.Count-1 do

    Finally // Try
      FreeAndNil(sArquivo);
    End; // Try
    FreeAndNil(sArquivo);
  End; // If Trim(sPastaArqLinx)='' Then

  OdirPanApres.Visible:=False;

  // Se Não Encontrou Pasta na Rede ============================================
  If Trim(sPastaArqLinx)='' Then
  Begin
    msg('Pasta <REDE (B:)> Não Encontrada !!'+cr+cr+'O Arquivo LINX Será Gerado LOCAL em'+cr+'< C:\Logistica\ArquivosLINX\ >','A');
    sPastaArqLinx:='C:\Logistica\ArquivosLINX\';
  End; // If Trim(sPastaArqLinx)='' Then

  // Cria Pasta Local se Necessário ============================================
  If not DirectoryExists(sPastaArqLinx) Then
   ForceDirectories(sPastaArqLinx);

  // Processo Exportação de Transferencia para o Arqivo Texto ==================
  GeraReposicaoLINX(sPastaArqLinx);

end;

procedure TFrmCentralTrocas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if Not bgSair Then
//  Begin
//    PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
//    msg('Para SAIR Tecle no Botão <Fechar>...','A');
//    Action := caNone;
//    Exit;
//  End;

end;

procedure TFrmCentralTrocas.Ckb_ReposLojasPrioridade0Click(Sender: TObject);
Var
  s: String;
begin
  If DMCentralTrocas.CDS_ReposicaoDocs.IsEmpty Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Analisando Prioridades...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;

  Screen.Cursor:=crAppStart;
  Refresh;

  AcertaCkb_Style(Ckb_ReposLojasPrioridade0);
  AcertaCkb_Style(Ckb_ReposLojasPrioridade1);
  AcertaCkb_Style(Ckb_ReposLojasPrioridade2);
  AcertaCkb_Style(Ckb_ReposLojasPrioridade3);

  Ckb_ReposLojasPrioridade0.Font.Color:=clRed;
  Ckb_ReposLojasPrioridade1.Font.Color:=clRed;
  Ckb_ReposLojasPrioridade2.Font.Color:=clRed;
  Ckb_ReposLojasPrioridade3.Font.Color:=clRed;
  Refresh;

  sgPrioridadeFilter:='';
  sgTipoPrioridade  :='';
  If Ckb_ReposLojasPrioridade0.Checked Then
  Begin
    sgPrioridadeFilter:='IND_PRIORIDADE=0';
    sgTipoPrioridade:='0';
    Ckb_ReposLojasPrioridade0.Font.Color:=clBlue;
  End;

  If Ckb_ReposLojasPrioridade1.Checked Then
  Begin
    If Trim(sgPrioridadeFilter)='' Then
     Begin
       sgPrioridadeFilter:='IND_PRIORIDADE=1';
       sgTipoPrioridade:='1';
     End
    Else
     Begin
       sgPrioridadeFilter:=sgPrioridadeFilter+' OR IND_PRIORIDADE=1';
       sgTipoPrioridade:=sgTipoPrioridade+', 1';
     End;
    Ckb_ReposLojasPrioridade1.Font.Color:=clBlue;
  End;

  If Ckb_ReposLojasPrioridade2.Checked Then
  Begin
    If Trim(sgPrioridadeFilter)='' Then
     Begin
       sgPrioridadeFilter:='IND_PRIORIDADE=2';
       sgTipoPrioridade:='2';
     End
    Else
     Begin
       sgPrioridadeFilter:=sgPrioridadeFilter+' OR IND_PRIORIDADE=2';
       sgTipoPrioridade:=sgTipoPrioridade+', 2';
     End;
    Ckb_ReposLojasPrioridade2.Font.Color:=clBlue;
  End;

  If Ckb_ReposLojasPrioridade3.Checked Then
  Begin
    If Trim(sgPrioridadeFilter)='' Then
     Begin
       sgPrioridadeFilter:='IND_PRIORIDADE=3';
       sgTipoPrioridade:='3';
     End
    Else
     Begin
       sgPrioridadeFilter:=sgPrioridadeFilter+' OR IND_PRIORIDADE=3';
       sgTipoPrioridade:=sgTipoPrioridade+', 3';
     End;
    Ckb_ReposLojasPrioridade3.Font.Color:=clBlue;
  End;

  If ((Ckb_ReposLojasPrioridade0.Checked) And (Ckb_ReposLojasPrioridade1.Checked) And
      (Ckb_ReposLojasPrioridade2.Checked) And (Ckb_ReposLojasPrioridade3.Checked)) Or
     ((Not Ckb_ReposLojasPrioridade0.Checked) And (Not Ckb_ReposLojasPrioridade1.Checked) And
      (Not Ckb_ReposLojasPrioridade2.Checked) And (Not Ckb_ReposLojasPrioridade3.Checked)) Or (Trim(sgTipoPrioridade)='') Then
  Begin
   sgTipoPrioridade:='Todas as Prioridades';
  End;

  // Busca Movtos ==============================================================
  DMCentralTrocas.CDS_ReposicaoTransf.Filtered:=False;
  DMCentralTrocas.CDS_ReposicaoTransf.Filter:='';

  If (Not DMCentralTrocas.CDS_ReposicaoTransf.IsEmpty) and (sgCorredoresFilter<>'') and (Not bgTodosCorredores) Then
  Begin
    DMCentralTrocas.CDS_ReposicaoTransf.Filter:='('+sgCorredoresFilter+')';

    If Trim(sgPrioridadeFilter)<>'' Then
     DMCentralTrocas.CDS_ReposicaoTransf.Filter:=DMCentralTrocas.CDS_ReposicaoTransf.Filter+' AND ('+sgPrioridadeFilter+')';

    If Trim(EdtReposLojasCodForn.Text)<>'' Then
     DMCentralTrocas.CDS_ReposicaoTransf.Filter:=DMCentralTrocas.CDS_ReposicaoTransf.Filter+' AND (PRINCIPALFOR='+QuotedStr(Trim(EdtReposLojasCodForn.Text))+')';

    DMCentralTrocas.CDS_ReposicaoTransf.Filtered:=True;
  End;

  If (Trim(sgPrioridadeFilter)<>'') And (Not DMCentralTrocas.CDS_ReposicaoTransf.Filtered) Then
  Begin
    DMCentralTrocas.CDS_ReposicaoTransf.Filter:='('+sgPrioridadeFilter+')';

    If Trim(EdtReposLojasCodForn.Text)<>'' Then
     DMCentralTrocas.CDS_ReposicaoTransf.Filter:=DMCentralTrocas.CDS_ReposicaoTransf.Filter+' AND (PRINCIPALFOR='+QuotedStr(Trim(EdtReposLojasCodForn.Text))+')';

    DMCentralTrocas.CDS_ReposicaoTransf.Filtered:=True;
  End; // If Trim(sgPrioridadeFilter)<>'' Then

  If (Trim(EdtReposLojasCodForn.Text)<>'') And (Not DMCentralTrocas.CDS_ReposicaoTransf.Filtered) Then
  Begin
    DMCentralTrocas.CDS_ReposicaoTransf.Filter:='PRINCIPALFOR='+QuotedStr(Trim(EdtReposLojasCodForn.Text));

    DMCentralTrocas.CDS_ReposicaoTransf.Filtered:=True;
  End; // If Trim(EdtReposLojasCodForn.Text)<>'' Then

  // Atualiza Totais ===========================================================
  If DMCentralTrocas.CDS_ReposicaoTransf.Filter<>sgFilterAtual Then
  Begin
    sgFilterAtual:=DMCentralTrocas.CDS_ReposicaoTransf.Filter;
    AtualizaTotaisLojas;
  End;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;
  Refresh;

  s:='Todos Fornecedores !!';
  If Trim(EdtReposLojasCodForn.Text)<>'' Then
   s:='Fornecedor'+cr+EdtReposLojasDesForn.Text;

  If DMCentralTrocas.CDS_ReposicaoDocsTot_Itens.Value<>0 Then
   msg('VOCÊ irá Trabalhar com a(s) Prioridade(s)'+cr+sgTipoPrioridade+cr+cr+Trim(s),'A');

  Dbg_ReposLojasDocs.SetFocus;
end;

procedure TFrmCentralTrocas.Ckb_ReposLojasPrioridade0KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_ReposLojasPrioridade0Click(Self);
end;

procedure TFrmCentralTrocas.Bt_ReposLojasLimpaFornClick(Sender: TObject);
begin
  EdtReposLojasCodForn.Clear;
  EdtReposLojasDesForn.Clear;
  EdtReposLojasDesForn.Color:=$00E0E0E0;
  EdtReposLojasDesForn.Font.Color:=clWindowText;

  CkCbx_ReposLojasCorredorChange(Self);
end;

procedure TFrmCentralTrocas.Bt_ReposLojasBuscaFornClick(Sender: TObject);
Var
  MySql: String;
Begin
  EdtReposLojasCodForn.Clear;
  EdtReposLojasDesForn.Clear;
  EdtReposLojasDesForn.Color:=$00E0E0E0;
  EdtReposLojasDesForn.Font.Color:=clWindowText;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT DISTINCT pr.nomefornecedor Fornecedor, pr.principalfor Cod '+
         ' FROM ES_ESTOQUES_LOJAS lo, PRODUTO pr'+
         ' WHERE lo.cod_produto=pr.codproduto'+
         ' AND   lo.dta_movto='+QuotedStr(f_Troca('-','.',(f_Troca('/','.',DateToStr(DtaEdt_ReposLojas.Date)))))+
         ' AND   lo.ind_transf='+QuotedStr('SIM')+
         ' AND   lo.num_docto='+DMCentralTrocas.CDS_ReposicaoDocsNUM_DOCTO.AsString+
         ' AND   lo.cod_loja='+QuotedStr(DMCentralTrocas.CDS_ReposicaoDocsCOD_LOJA.AsString)+
         ' ORDER BY 2';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Fornecedor';
  FrmPesquisa.Campo_Codigo:='Cod';
  FrmPesquisa.Campo_Descricao:='Fornecedor';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtReposLojasCodForn.Text:=Trim(FrmPesquisa.EdtCodigo.Text);
    EdtReposLojasDesForn.Text:=Trim(FrmPesquisa.EdtDescricao.Text);
    EdtReposLojasDesForn.Color:=clRed;
    EdtReposLojasDesForn.Font.Color:=clWhite;
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);

  CkCbx_ReposLojasCorredorChange(Self);
end;

procedure TFrmCentralTrocas.Bt_AnaliseRepDiariaDiaClick(Sender: TObject);
Var
  MySql: String;
  b: Boolean;
begin
  Dbg_AnaliseRepDiaria.SetFocus;

  DMCentralTrocas.CDS_AnalRepDiaria.Close;

  b:=True;
  bgProcessar:=False;
  sgDia:='';
  While b do
  Begin
    sgDia:=InputBoxData('Analise de Reposição', 'Informe o Dia', sgDia);
    If Trim(sgDia)='' Then
     Break;

    Try
      StrToDate(sgDia);
      bgProcessar:=True;
      Break;
    Except
      msg('Dia Inválido !!','A');
    End;
  End; // While b do

  If bgProcessar Then
  Begin
    PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
    If msg('Deseja Atualizar Linx (Nuvem)'+cr+cr+'para o dia '+f_Troca('.','/',sgDia)+' ??','C')=1 Then
    Begin
      PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
      if msg('Deseja Realmente ATUALIZAR'+cr+cr+'Dados do Linx (Nuvem) ??', 'C')=1 Then
       NuvemMovimentoLinx(f_Troca('.','/',sgDia),f_Troca('.','/',sgDia));
    End; // If msg('Deseja Atualiza Linx (Nuvem)'+cr+cr+'para o dia '+f_Troca('.','/',sgDia)+' ??','C')=1 Then

    OdirPanApres.Caption:='AGUARDE !! Localizando Documentos do Dia '+sgDia+' !!';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmCentralTrocas;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;

    Screen.Cursor:=crAppStart;
    Refresh;

    sgDia:=f_Troca('/','.',f_Troca('-','.',sgDia));


    // Apresenta Dia para Analise ==============================================
           //=================== TITULO DO RELATÓRIO
    MySql:=' SELECT'+
           ' 0 ORDEM,'+
           ' NULL CODIGO_CLIENTE,'+
           ' ''ANALISE DE REPOSICAO DO DIA ''||'+QuotedStr(f_Troca('.','/',sgDia))+' RAZAO_SOCIAL,'+
           ' NULL DOCS_L,'+
           ' NULL DOCS_G,'+
           ' NULL DOCS_DIF,'+
           ' NULL LINHAS_L,'+
           ' NULL LINHAS_G,'+
           ' NULL LINHAS_DIF,'+
           ' NULL QTDS_L,'+
           ' NULL QTDS_G,'+
           ' NULL QTDS_DIF'+

           ' FROM RDB$DATABASE'+

           //=================== LINHA EM BRANCO
           ' UNION'+

           ' SELECT'+
           ' 1 ORDEM,'+
           ' NULL CODIGO_CLIENTE,'+
           ' NULL RAZAO_SOCIAL,'+
           ' NULL DOCS_L,'+
           ' NULL DOCS_G,'+
           ' NULL DOCS_DIF,'+
           ' NULL LINHAS_L,'+
           ' NULL LINHAS_G,'+
           ' NULL LINHAS_DIF,'+
           ' NULL QTDS_L,'+
           ' NULL QTDS_G,'+
           ' NULL QTDS_DIF'+

           ' FROM RDB$DATABASE'+

           //=================== TOTAIS POR LOJA
           ' UNION'+

           ' SELECT'+
           ' 2 ORDEM,'+
           ' linx.codigo_cliente,'+
           ' linx.razao_social,'+
           ' Linx.DOCS_L,'+
           ' Geren.DOCS_G,'+
           ' (Linx.docs_l-Geren.docs_g) DOCS_DIF,'+
           ' linx.LINHAS_L,'+
           ' geren.LINHAS_G,'+
           ' (linx.linhas_l-geren.linhas_g) LINHAS_DIF,'+
           ' Linx.QTDS_L,'+
           ' Geren.QTDS_G,'+
           ' (Linx.qtds_l-Geren.qtds_g) QTDS_DIF'+

           ' FROM'+
           ' (SELECT e.cod_cli_linx codigo_cliente, e.razao_social,'+
           '         COUNT(Distinct mv.documento) DOCS_L,'+
           '         COUNT(mv.empresa) LINHAS_L,'+
           '         CAST(SUM(COALESCE(mv.quantidade,0)) AS INTEGER) QTDS_L'+
           '  FROM EMP_CONEXOES e'+
           '      LEFT JOIN LINXMOVIMENTO mv  ON mv.codigo_cliente=e.cod_cli_linx'+
           '                                 AND ((mv.operacao=''S'' AND  mv.tipo_transacao=''T'')'+
           '                                       OR'+
           '                                      (mv.operacao=''S'' AND  mv.tipo_transacao IS NULL AND mv.codigo_cliente=347))'+ //Belcenter | Wenceslau Escobar | RS
           '                                 AND   mv.empresa=2'+
           '                                 AND   mv.cancelado=''N'''+
           '                                 AND   mv.excluido =''N'''+
           '                                 AND   CAST(mv.data_lancamento AS dATE)='+QuotedStr(sgDia)+
           '  WHERE e.cod_cli_linx<>0'+
           '  GROUP BY 1,2) Linx,'+

           ' (SELECT e.cod_cli_linx codigo_cliente, e.razao_social,'+
           '         COUNT(DISTINCT l.num_pedido) DOCS_G,'+
           '         COUNT(l.num_seq) linhas_G,'+
           '         CAST(SUM(COALESCE(l.qtd_a_transf,0)) AS INTEGER) QTDS_G'+
           '  FROM EMP_CONEXOES e'+
           '      LEFT JOIN ES_ESTOQUES_LOJAS l  ON l.cod_loja=e.cod_filial'+
           '                                    AND   l.dta_movto='+QuotedStr(sgDia)+
           '                                    AND   l.ind_transf=''SIM'''+
           '                                    AND   l.num_pedido BETWEEN 1 AND 900000'+
           '  WHERE e.cod_cli_linx<>0'+
           '  GROUP BY 1,2) Geren'+

           ' WHERE linx.codigo_cliente=Geren.codigo_cliente'+
           ' AND   (linx.LINHAS_L>0'+
           '        OR'+
           '       geren.linhas_G>0'+
           '        OR'+
           '       Linx.QTDS_L>0'+
           '        OR'+
           '       Geren.QTDS_G>0)';

           //=================== TOTAIS GERAL
    MySqlSelect:=
           ' UNION'+

           ' SELECT 3 ORDEM, NULL codigo_cliente, ''TOTAL GERAL'' razao_social,'+
           '        SUM(Linx.DOCS_L) DOCS_L,'+
           '        SUM(Geren.Docs_G) DOCS_G,'+
           '        SUM((Linx.DOCS_L-Geren.docs_g)) DOCS_DIF,'+
           '        SUM(linx.LINHAS_L) LINHAS_L,'+
           '        SUM(geren.linhas_G) LINHAS_G,'+
           '        SUM((linx.linhas_l-geren.linhas_g)) LINHAS_DIF,'+
           '        SUM(Linx.QTDS_L) QTDS_L,'+
           '        SUM(Geren.QTDS_G) QTDS_G,'+
           '        SUM((Linx.QTDS_L-Geren.QTDS_G)) QTDS_DIF'+

           ' FROM'+
           ' (SELECT e.cod_cli_linx codigo_cliente, e.razao_social,'+
           '         COUNT(DISTINCT mv.documento) DOCS_L,'+
           '         COUNT(mv.empresa) LINHAS_L,'+
           '         Cast(SUM(COALESCE(mv.quantidade,0)) AS INTEGER) QTDS_L'+
           '  FROM EMP_CONEXOES e'+
           '        LEFT JOIN LINXMOVIMENTO mv  ON mv.codigo_cliente=e.cod_cli_linx'+
           '                                   AND   ((mv.operacao=''S'' AND  mv.tipo_transacao=''T'')'+
           '                                          OR'+
           '                                          (mv.operacao=''S'' AND  mv.tipo_transacao IS NULL AND mv.codigo_cliente=347))'+ //Belcenter | Wenceslau Escobar | RS
           '                                   AND   mv.empresa=2'+
           '                                   AND   mv.cancelado=''N'''+
           '                                   AND   mv.excluido =''N'''+
           '                                   AND   CAST(mv.data_lancamento AS DATE)='+QuotedStr(sgDia)+
           '  WHERE e.cod_cli_linx<>0'+
           '  GROUP BY 1,2) Linx,'+

           ' (SELECT e.cod_cli_linx codigo_cliente, e.razao_social,'+
           '         COUNT(DISTINCT l.num_pedido) DOCS_G,'+
           '         COUNT(l.num_seq) linhas_G,'+
           '         CAST(SUM(COALESCE(l.qtd_a_transf,0)) AS INTEGER) QTDS_G'+
           '  FROM EMP_CONEXOES e'+
           '     LEFT JOIN ES_ESTOQUES_LOJAS l  ON l.cod_loja=e.cod_filial'+
           '                                   AND l.dta_movto='+QuotedStr(sgDia)+
           '                                   AND l.ind_transf=''SIM'''+
           '                                   AND l.num_pedido BETWEEN 1 AND 900000'+
           '  WHERE e.cod_cli_linx<>0'+
           '  GROUP BY 1,2) Geren'+

           //=================== FINAL

           ' WHERE linx.codigo_cliente=Geren.codigo_cliente'+
           ' AND   (linx.LINHAS_L>0'+
           '        OR'+
           '        geren.linhas_G>0'+
           '        OR'+
           '        Linx.QTDS_L>0'+
           '        OR'+
           '        Geren.QTDS_G>0)'+

           ' ORDER BY 1,3';
    DMCentralTrocas.CDS_AnalRepDiaria.Close;
    DMCentralTrocas.SDS_AnalRepDiaria.CommandText:=MySql+MySqlSelect;
    DMCentralTrocas.CDS_AnalRepDiaria.Open;

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;
  End; // If bgProcessar Then

end;

procedure TFrmCentralTrocas.Bt_AnaliseRepDiariaSalvaClipboardClick(Sender: TObject);
begin
  Dbg_AnaliseRepDiaria.SetFocus;

  If DMCentralTrocas.CDS_AnalRepDiaria.IsEmpty Then
   Exit;

  DBGridClipboard(Dbg_AnaliseRepDiaria);
end;

procedure TFrmCentralTrocas.Bt_AnaliseRepDiariaFecharClick(Sender: TObject);
begin
  DMCentralTrocas.FechaTudoCentralTrocas;

  bgSair:=True;

  Close;

end;

procedure TFrmCentralTrocas.Dbg_NotasEntDevProdutosKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  {
   Usado em:
   Dbg_NotasEntDevNFE
   Dbg_AnaliseReposCorredores
   Dbg_AnaliseReposicoes
   Dbg_AnaliseRepDiaria
  }
  // Bloquei Ctrl + Delete =====================================================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

end;

procedure TFrmCentralTrocas.Dbg_AnaliseRepDiariaDrawColumnCell(Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If (Column.FieldName='DOCS_DIF') Then
  Begin
    If DMCentralTrocas.CDS_AnalRepDiariaDOCS_DIF.AsInteger<>0 Then
    Begin
      Dbg_AnaliseRepDiaria.Canvas.Font.Color:=clRed; // Cor da Fonte
      Dbg_AnaliseRepDiaria.Canvas.Font.Style:=[fsBold]; // Estilo da Fonte
      //Dbg_AnaliseRepDiaria.Canvas.Brush.Color:=$00DDDDFF;  // Cor da Celula
    End;
  End; // If (Column.FieldName='DOCS_DIF') Then


  If (Column.FieldName='LINHAS_DIF') Then
  Begin
    If DMCentralTrocas.CDS_AnalRepDiariaLINHAS_DIF.AsInteger<>0 Then
    Begin
      Dbg_AnaliseRepDiaria.Canvas.Font.Color:=clRed; // Cor da Fonte
      Dbg_AnaliseRepDiaria.Canvas.Font.Style:=[fsBold]; // Estilo da Fonte
      //Dbg_AnaliseRepDiaria.Canvas.Brush.Color:=$00DDDDFF;  // Cor da Celula
    End;
  End; // If (Column.FieldName='LINHAS_DIF') Then

  If (Column.FieldName='QTDS_DIF') Then
  Begin
    If DMCentralTrocas.CDS_AnalRepDiariaQTDS_DIF.AsInteger<>0 Then
    Begin
      //Dbg_AnaliseRepDiaria.Canvas.Font.Color:=clWhite; // Cor da Fonte
      Dbg_AnaliseRepDiaria.Canvas.Font.Color:=clRed; // Cor da Fonte
      Dbg_AnaliseRepDiaria.Canvas.Font.Style:=[fsBold]; // Estilo da Fonte
      //Dbg_AnaliseRepDiaria.Canvas.Brush.Color:=$00DDDDFF;  // Cor da Celula
    End;
  End; // If (Column.FieldName='QTDS_DIF') Then

  if not (gdSelected in State) Then // Este comando altera cor da Linha
  Begin
    If DMCentralTrocas.CDS_AnalRepDiariaORDEM.AsInteger in [0,3] Then
    Begin
      Dbg_AnaliseRepDiaria.Canvas.Font.Style:=[fsBold]; // Estilo da Fonte
      Dbg_AnaliseRepDiaria.Canvas.Brush.Color:=clSkyBlue;
    End;
  End; // if not (gdSelected in State) Then

  Dbg_AnaliseRepDiaria.Canvas.FillRect(Rect);
  Dbg_AnaliseRepDiaria.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMCentralTrocas.CDS_AnalRepDiariaDOCS_DIF.Alignment:=taRightJustify;
  DMCentralTrocas.CDS_AnalRepDiariaDOCS_G.Alignment:=taRightJustify;
  DMCentralTrocas.CDS_AnalRepDiariaDOCS_L.Alignment:=taRightJustify;
  DMCentralTrocas.CDS_AnalRepDiariaLINHAS_DIF.Alignment:=taRightJustify;
  DMCentralTrocas.CDS_AnalRepDiariaLINHAS_G.Alignment:=taRightJustify;
  DMCentralTrocas.CDS_AnalRepDiariaLINHAS_L.Alignment:=taRightJustify;
  DMCentralTrocas.CDS_AnalRepDiariaQTDS_DIF.Alignment:=taRightJustify;
  DMCentralTrocas.CDS_AnalRepDiariaQTDS_G.Alignment:=taRightJustify;
  DMCentralTrocas.CDS_AnalRepDiariaQTDS_L.Alignment:=taRightJustify;

end;

procedure TFrmCentralTrocas.Bt_AnaliseRepDiariaDoctosClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_AnaliseRepDiaria.SetFocus;

  If DMCentralTrocas.CDS_AnalRepDiaria.IsEmpty Then
   Exit;

  If Trim(DMCentralTrocas.CDS_AnalRepDiariaCODIGO_CLIENTE.AsString)='' Then
  Begin
    msg('Favor Selecionar a Loja !!','A');
    Exit;
  End; // If Trim(DMCentralTrocas.CDS_AnalRepDiariaCODIGO_CLIENTE.AsString)='' Then

  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  AbreSolicitacoes(25);

  FrmSolicitacoes.Caption:='RESOSIÇÕES LOJAS';

  OdirPanApres.Caption:='AGUARDE !! Localizando Documentos LINX / GERENCIADOR do Dia '+sgDia+' !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCentralTrocas.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCentralTrocas.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCentralTrocas;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

         //-============= TITULO
  MySql:=' Select '+
         ' 0 ORDEM,'+
         QuotedStr(DMCentralTrocas.CDS_AnalRepDiariaRAZAO_SOCIAL.AsString)+'||'' - ''||'+QuotedStr(f_Troca('.','/',sgDia))+' DOCUMENTO,'+
         ' NULL TOTAL_LINHAS,'+
         ' NULL TOTAL_QTDS'+
         ' FROM RDB$DATABASE'+

         //============= LINHA EM BRANCO
         ' UNION'+

         ' SELECT'+
         ' 1 ORDEM,'+
         ' NULL DOCUMENTO,'+
         ' NULL TOTAL_LINHAS,'+
         ' NULL TOTAL_QTDS'+
         ' FROM RDB$DATABASE'+

         //============= TITULO LINX
         ' UNION'+

         ' SELECT'+
         ' 2 ORDEM,'+
         ' ''DOCUMENTOS LINX'' DOCUMENTO,'+
         ' NULL TOTAL_LINHAS,'+
         ' NULL TOTAL_QTDS'+
         ' FROM RDB$DATABASE'+

         //============= DOCUMENTOS LINX'+
         ' UNION'+

         ' SELECT'+
         ' 3 ORDEM,'+
         ' mv.documento,'+
         ' COUNT(mv.empresa) Total_Linhas,'+
         ' CAST(sum(mv.quantidade) as Integer) Total_qtds'+

         ' FROM LINXMOVIMENTO mv, EMP_CONEXOES e'+

         ' WHERE mv.codigo_cliente=e.cod_cli_linx'+
         ' AND   ((mv.operacao=''S'' AND  mv.tipo_transacao=''T'')'+
         '         OR'+
         '        (mv.operacao=''S'' AND  mv.tipo_transacao IS NULL AND mv.codigo_cliente=347))'+ // Belcenter | Wenceslau Escobar | RS
         ' AND   mv.empresa=2'+
         ' AND   mv.cancelado=''N'''+
         ' AND   mv.excluido=''N'''+
         ' AND   CAST(mv.data_lancamento AS DATE)='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)))+
         ' AND   mv.codigo_cliente='+DMCentralTrocas.CDS_AnalRepDiariaCODIGO_CLIENTE.AsString+

         ' GROUP BY 1,2'+

         //============= LINHA EM BRANCO
         ' UNION'+

         ' SELECT'+
         ' 4 ORDEM,'+
         ' NULL DOCUMENTO,'+
         ' NULL TOTAL_LINHAS,'+
         ' NULL TOTAL_QTDS'+
         ' FROM RDB$DATABASE'+

         //============= TITULO GERENCIADOR
         ' UNION'+

         ' SELECT'+
         ' 5 ORDEM,'+
         ' ''DOCUMENTOS GERENCIADOR'' DOCUMENTO,'+
         ' NULL TOTAL_LINHAS,'+
         ' NULL TOTAL_QTDS'+
         ' FROM RDB$DATABASE'+

         //============= DOCUMENTOS GERENCIADOR'+
         ' UNION'+

         ' SELECT'+
         ' 6 ORDEM,'+
         ' CAST(CAST(l.num_pedido AS INTEGER) AS VARCHAR(6)) DOCUMENTO,'+
         ' COUNT(l.num_seq) Total_Linhas,'+
         ' CAST(SUM(COALESCE(l.qtd_a_transf,0)) AS INTEGER) total_qtds'+

         ' FROM ES_ESTOQUES_LOJAS l, EMP_CONEXOES e'+

         ' WHERE l.cod_loja=e.cod_filial'+
         ' AND   l.dta_movto='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDia)))+
         ' AND   l.ind_transf=''SIM'''+
         ' AND   l.num_pedido BETWEEN 1 AND 900000'+
         ' AND   e.cod_cli_linx='+DMCentralTrocas.CDS_AnalRepDiariaCODIGO_CLIENTE.AsString+

         ' GROUP BY 1,2'+

         ' ORDER BY 1,2';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  OdirPanApres.Visible:=False;

  bgProcessar:=False;
  FrmSolicitacoes.Dbg_AnaliseRepDiaria.DataSource:=DMBelShop.DS_BuscaRapida;
  FrmSolicitacoes.ShowModal;

  FrmSolicitacoes.Dbg_AnaliseRepDiaria.DataSource:=Nil;
  FreeAndNil(FrmSolicitacoes);

end;

end.

