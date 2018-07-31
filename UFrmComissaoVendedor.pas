unit UFrmComissaoVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, JvExControls, JvXPCore, JvXPButtons, ExtCtrls,
  ComCtrls, StdCtrls, Grids, DBGrids, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar, cxProgressBar,
  DBXpress, DBClient, SqlExpr, IBQuery, Mask, ToolEdit, CurrEdit, DBGridJul,
  AppEvnts, jpeg, JvExStdCtrls, JvRadioButton, JvExMask, JvToolEdit,
  JvCombobox;

type
  TFrmComissaoVendedor = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    Panel38: TPanel;
    Bt_FluFornFechar: TJvXPButton;
    PC_ComissaoVendedor: TPageControl;
    Ts_Produtos: TTabSheet;
    Ts_Comissoes: TTabSheet;
    Gb_UltimaAtualizacao: TGroupBox;
    Gb_ProdutosComissao: TGroupBox;
    Panel1: TPanel;
    Bt_ImportaVendas: TJvXPButton;
    Dbg_UltimaAtualizacao: TDBGrid;
    Dbg_ProdutosComissao: TDBGrid;
    dxStatusBar2: TdxStatusBar;
    OdirPanApres: TPanel;
    dxStatusBar1: TdxStatusBar;
    Ts_ParametrosVendedores: TTabSheet;
    Gb_FamiliaPrecos: TGroupBox;
    Gb_Aplicacoes: TGroupBox;
    Dbg_Aplicacao: TDBGridJul;
    Dbg_FamiliaPrecos: TDBGridJul;
    Pan_Aplicacoes: TPanel;
    Bt_BuscaAplicacao: TJvXPButton;
    EdtCodAplicacao: TCurrencyEdit;
    Pan_FamiliaPrecos: TPanel;
    Bt_BuscaFamiliaPreco: TJvXPButton;
    EdtCodFamiliaPrecos: TCurrencyEdit;
    Panel2: TPanel;
    dxStatusBar3: TdxStatusBar;
    Bt_ImportaProdutos: TJvXPButton;
    Panel3: TPanel;
    Bt_BuscaDocComissao: TJvXPButton;
    EdtCodDocComissao: TCurrencyEdit;
    Label1: TLabel;
    Bt_SalvaComissao: TJvXPButton;
    Bt_CalculaComiisao: TJvXPButton;
    Dbg_ComisVendedores: TDBGrid;
    ApplicationEvents1: TApplicationEvents;
    Bt_Clipboard: TJvXPButton;
    Rb_ComisVendSintetico: TJvRadioButton;
    Rb_ComisVendAnalitico: TJvRadioButton;
    Ts_CampColecao: TTabSheet;
    PC_CampColecao: TPageControl;
    Ts_CampColecaoCadastro: TTabSheet;
    Ts_CampColecaoComissao: TTabSheet;
    Gb_CampColecaoCampanhas: TGroupBox;
    Gb_CampColecaoPessoas: TGroupBox;
    Dbg_CampColecaoPessoas: TDBGrid;
    Dbg_CampColecaoCamp: TDBGrid;
    Pan_CampColecaoPessoas: TPanel;
    Bt_CampColecaoPessoasAlt: TJvXPButton;
    Bt_CampColecaoPessoasAban: TJvXPButton;
    Bt_CampColecaoPessoasInc: TJvXPButton;
    Bt_CampColecaoPessoasExc: TJvXPButton;
    Pan_CampColecaoCamp: TPanel;
    Bt_CampColecaoCampAban: TJvXPButton;
    Bt_CampColecaoCampAlt: TJvXPButton;
    dxStatusBar4: TdxStatusBar;
    EdtCampColecaoPessNome: TEdit;
    EdtCampColecaoPessPerc: TCurrencyEdit;
    EdtCampColecaoPessVlr: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EdtCampColecaoPessCod: TCurrencyEdit;
    Cbx_CampColecaoPessCargo: TComboBox;
    Label6: TLabel;
    EdtCampColecaoCampNome: TEdit;
    Label7: TLabel;
    EdtCampColecaoCampPerc: TCurrencyEdit;
    Label8: TLabel;
    EdtCampColecaoCampVlr: TCurrencyEdit;
    dxStatusBar5: TdxStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FluFornFecharClick(Sender: TObject);
    procedure PC_ComissaoVendedorChange(Sender: TObject);

    //==========================================================================
    // Odir ====================================================================
    //==========================================================================
    Procedure FechaTudoComVend;

    Procedure UltimasAtualizacoes;    // Busca Ultima Atualização das Lojas
    Procedure ProdutosCampanhaVendas; // Busca Produtos da Aplicação e Família Preço

    Procedure Aplicacoes_FamiliaPrecos; // Busca Aplicacoes e FamiliaPrecos

    Procedure MontaProgressBar(bCria: Boolean; Form: TForm);
    Procedure AplicacoesSelecionadas;

    Function  BuscaComissoes(sNrDoc: String): Boolean;

    // CAMPANHA COMISSAO - LinxProdutos.ID_COLECAO
    Procedure CampanhaComissaoTabelas(sTipo: String='');
                                    // sTipo='' Ambos
                                    // sTipo='P' Pessoas
                                    // sTipo='C' Campanhas
    Procedure CampanhaComissaoHabilita(bHabilita: Boolean; sTipo: String='P');
                                    // sTipo='P' Pessoas
                                    // sTipo='C' Campanhas

    Function  CampanhaComissaoConsiste(sTipo: String): Boolean;
                                    // sTipo='P' Pessoas
                                    // sTipo='C' Campanhas

    Procedure CampanhaComissaoDML(sDML: String; sTipo: String='P');
                                 // sTipo='P'essoas / 'C'ampanhas
                                 // sDML='IU'Insert/Update "EX"xclusão

    //==========================================================================
    // Odir ====================================================================
    //==========================================================================

    procedure Dbg_UltimaAtualizacaoDblClick(Sender: TObject);
    procedure Dbg_UltimaAtualizacaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_UltimaAtualizacaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ImportaVendasClick(Sender: TObject);
    procedure Dbg_ProdutosComissaoEnter(Sender: TObject);
    procedure Dbg_ProdutosComissaoExit(Sender: TObject);
    procedure Dbg_ProdutosComissaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ProdutosComissaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ProdutosComissaoKeyPress(Sender: TObject; var Key: Char);
    procedure Dbg_UltimaAtualizacaoTitleClick(Column: TColumn);
    procedure Dbg_FamiliaPrecosExit(Sender: TObject);
    procedure Dbg_FamiliaPrecosEnter(Sender: TObject);
    procedure EdtCodAplicacaoExit(Sender: TObject);
    procedure Dbg_AplicacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodFamiliaPrecosExit(Sender: TObject);
    procedure Bt_BuscaAplicacaoClick(Sender: TObject);
    procedure Bt_BuscaFamiliaPrecoClick(Sender: TObject);
    procedure Dbg_ProdutosComissaoTitleClick(Column: TColumn);
    procedure Bt_ImportaProdutosClick(Sender: TObject);
    procedure Bt_CalculaComiisaoClick(Sender: TObject);
    procedure Bt_BuscaDocComissaoClick(Sender: TObject);
    procedure EdtCodDocComissaoExit(Sender: TObject);
    procedure Dbg_ComisVendedoresDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure EdtCodDocComissaoChange(Sender: TObject);
    procedure Bt_SalvaComissaoClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_UltimaAtualizacaoEnter(Sender: TObject);
    procedure Dbg_ComisVendedoresEnter(Sender: TObject);
    procedure Dbg_AplicacaoEnter(Sender: TObject);
    procedure Bt_ClipboardClick(Sender: TObject);
    procedure Dbg_ComisVendedoresExit(Sender: TObject);
    procedure Rb_ComisVendSinteticoClick(Sender: TObject);
    procedure Rb_ComisVendSinteticoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PC_CampColecaoChange(Sender: TObject);
    procedure Dbg_CampColecaoPessoasEnter(Sender: TObject);
    procedure Dbg_UltimaAtualizacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ComisVendedoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_CampColecaoPessoasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_CampColecaoPessoasDblClick(Sender: TObject);
    procedure Bt_CampColecaoPessoasAbanClick(Sender: TObject);
    procedure Dbg_CampColecaoPessoasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_CampColecaoCampKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_CampColecaoPessoasIncClick(Sender: TObject);
    procedure Bt_CampColecaoPessoasExcClick(Sender: TObject);
    procedure Dbg_CampColecaoCampEnter(Sender: TObject);
    procedure Dbg_CampColecaoCampDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_CampColecaoCampDblClick(Sender: TObject);
    procedure Bt_CampColecaoCampAbanClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
   THackDBGrid = class(TDBGrid);
  
var
  FrmComissaoVendedor: TFrmComissaoVendedor;

  bgSairComVend: Boolean;
  OrderGridDtaAtual, OrderGridProd: String;    // Ordenar Grid

  IBQ_ConsultaFilial  : TIBQuery;

implementation

uses DK_Procs1, UDMComissaoVendedor, UDMBelShop, UFrmBelShop, DB,
  UPesquisaIB, UFrmPeriodoApropriacao, cxCalendar, UPesquisa,
  UFrmSelectEmpProcessamento;

{$R *.dfm}

//==============================================================================
// Odir - INICIO ===============================================================
//==============================================================================
// CAMPANHA COMISSAO - Apresenta Pessoas e Companhas >>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.CampanhaComissaoTabelas(sTipo: String='');
Var
  MySql: String;
  cPerc, cVlr: Currency;
Begin
  // sTipo='P' Pessoas
  // sTipo='C' Campanhas

  //============================================================================
  // Campanhas =================================================================
  //============================================================================
  If (sTipo='C') Or (sTipo='')  Then
  Begin
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try // Try da Transação

      // Busca Campanhas =======================================================
      MySql:=' SELECT DISTINCT p.id_colecao, p.desc_colecao'+
             ' FROM LINXPRODUTOS P'+
             ' WHERE UPPER(p.desc_colecao) LIKE ''CAMPANHA %''';
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      DMBelShop.CDS_BuscaRapida.DisableControls;
      While Not DMBelShop.CDS_BuscaRapida.Eof do
      Begin
        // Inicializa Valores ==================================================
        MySql:=' SELECT COALESCE(t.vlr_aux, 0.00) PER_VENDAS,'+
               '        COALESCE(t.vlr_aux1,0.00) VLR_UNID'+
               ' FROM TAB_AUXILIAR t'+
               ' WHERE t.tip_aux=28'+
               ' AND   t.des_aux='+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('desc_colecao').AsString);
        DMBelShop.SQLQuery3.Close;
        DMBelShop.SQLQuery3.SQL.Clear;
        DMBelShop.SQLQuery3.SQL.Add(MySql);
        DMBelShop.SQLQuery3.Open;
        cPerc:=0.00;
        If Trim(DMBelShop.SQLQuery3.FieldByName('Per_Vendas').AsString)<>'' Then
         cPerc:=DMBelShop.SQLQuery3.FieldByName('Per_Vendas').AsCurrency;

        cVlr:=0.00;
        If Trim(DMBelShop.SQLQuery3.FieldByName('Vlr_Unid').AsString)<>'' Then
         cVlr:=DMBelShop.SQLQuery3.FieldByName('Vlr_Unid').AsCurrency;
        DMBelShop.SQLQuery3.Close;

        // Insere Campanhas ====================================================
        MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR '+
               ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
               ' VALUES (28,'+ // TIP_AUX - 28 => CALCULO DE COMISSÃO SOBRE CAMPANHAS sobre Venda LinxProduto.Id_Colecao
               DMBelShop.CDS_BuscaRapida.FieldByName('Id_Colecao').AsString+', '+ // COD_AUX = Código da Campanha: LinxProduto.Id_Colecao
               QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('Desc_Colecao').AsString)+', '+ // DES_AUX  = Descrição da Campanha
               ' NULL, '+ // DES_AUX1 = --> Não Usado
               QuotedStr(f_Troca(',','.',CurrToStr(cPerc)))+', '+ // VLR_AUX  = Percentual Sobre Faturamento
               QuotedStr(f_Troca(',','.',CurrToStr(cVlr)))+')'+ // VLR_AUX1 = Preço Sobre Unidades Vendidas
               ' MATCHING (TIP_AUX, COD_AUX)';
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        DMBelShop.CDS_BuscaRapida.Next;
      End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
      DMBelShop.CDS_BuscaRapida.EnableControls;
      DMBelShop.CDS_BuscaRapida.Close;

      // Atualiza Transacao ====================================================
      DMBelShop.SQLC.Commit(TD);

      // Apresenta Campanhas ===================================================
      DMComissaoVendedor.CDS_CampCampanhas.Close;
      DMComissaoVendedor.CDS_CampCampanhas.Open;

    Except // Except da Transação
      on e : Exception do
      Begin
        // Abandona Transacao ==================================================
        DMBelShop.SQLC.Rollback(TD);

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try da Transação
  End; // If sTipo='C' Then
  // Campanhas =================================================================
  //============================================================================

  //============================================================================
  // Busca Gerente/Supervidores/Assistentes ====================================
  //============================================================================
  If (sTipo='P') Or (sTipo='')  Then
  Begin
    MySql:=' SELECT'+
           ' t.cod_aux,'+
           ' CAST((t.cod_aux/100) AS INTEGER) COD_LOJA,'+
           ' t.des_aux PESSOA,'+
           ' t.des_aux1 CARGO,'+
           ' t.vlr_aux PER_FAT,'+
           ' t.vlr_aux1 VLR_UNID,'+
           ' UPPER(TRIM(a.nome_abrev)) ORDEM'+

           ' FROM TAB_AUXILIAR t, LINXLOJAS_ABREVIATURAS a'+

           ' WHERE CAST((t.cod_aux/100) AS INTEGER)=a.empresa'+
           ' AND   t.tip_aux=27'+ // 27 => CALCULO DE COMISSÃO SOBRE CAMPANHAS sobre Venda LinxProduto.Id_Colecao

           ' UNION'+

           ' SELECT DISTINCT'+
           ' 0 COD_AUX,'+
           ' CAST((t.cod_aux/100) AS INTEGER) COD_LOJA,'+
           ' UPPER(TRIM(a.nome_abrev)) PESSOA,'+
           ' NULL CARGO,'+
           ' NULL PER_FAT,'+
           ' NULL VLR_UNID,'+
           ' UPPER(TRIM(a.nome_abrev)) ORDEM'+

           ' FROM TAB_AUXILIAR t, LINXLOJAS_ABREVIATURAS a'+

           ' WHERE CAST((t.cod_aux/100) AS INTEGER)=a.empresa'+
           ' AND   t.tip_aux=27'+ // 27 => CALCULO DE COMISSÃO SOBRE CAMPANHAS sobre Venda LinxProduto.Id_Colecao

           ' ORDER BY 7,1';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If DMComissaoVendedor.CDS_V_CampPessoas.Active Then
     DMComissaoVendedor.CDS_V_CampPessoas.Close;

    DMComissaoVendedor.CDS_V_CampPessoas.CreateDataSet;
    DMComissaoVendedor.CDS_V_CampPessoas.Open;

    DMComissaoVendedor.CDS_V_CampPessoas.Data:=DMBelShop.CDS_BuscaRapida.Data;
    DMBelShop.CDS_BuscaRapida.Close;
  End; // If sTipo='P' Then
  // Busca Gerente/Supervidores/Assistentes ====================================
  //============================================================================
End; // CAMPANHA COMISSAO - Apresenta Pessoas e Companhas >>>>>>>>>>>>>>>>>>>>>>

// CAMPANHA COMISSAO - Update / Insert Tabelas Pessoa/Campanhas>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.CampanhaComissaoDML(sDML: String; sTipo: String='P');
Var
  MySql: String;
Begin
  // sTipo="P"essoas
  //       "C"ampanhas
  // sDML="IU" Insert/Update
  //      "EX"xclusão

  If sTipo='P' Then
  Begin
    // Manutenção de Pessoa ====================================================
    OdirPanApres.Caption:='AGUARDE !! Manutenção de Pessoas...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmComissaoVendedor;
    OdirPanApres.BringToFront();
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;

    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try // Try da Transação
      Screen.Cursor:=crAppStart;
      DateSeparator:='.';
      DecimalSeparator:='.';


      // Altera ou Inclui Pessoa ===============================================
      If sDML='UI' Then
      Begin
      MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR'+
             ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
             ' VALUES (27,'+ // TIP_AUX - 27 => CALCULO DE COMISSÃO SOBRE CAMPANHAS sobre Venda LinxProduto.Id_Colecao
             IntToStr(EdtCampColecaoPessCod.AsInteger)+', '+ // COD_AUX - Código da Loja + Codigo da Função:
             QuotedStr(EdtCampColecaoPessNome.Text)+', '+ // DES_AUX - Nome da Pessoa
             QuotedStr(Cbx_CampColecaoPessCargo.Text)+', '+ // DES_AUX1 - Descrição do Cargo: GERENTE / SUPERVIDOR / ASSISTENTE
             QuotedStr(f_Troca(',','.',CurrToStr(EdtCampColecaoPessPerc.Value)))+', '+ // VLR_AUX - Percentual Sobre Faturamento
             QuotedStr(f_Troca(',','.',CurrToStr(EdtCampColecaoPessVlr.Value)))+')'+ // VLR_AUX1 - Preço Sobre Unidades Vendidas
             ' MATCHING (TIP_AUX, COD_AUX)';
      End; // If sDML='UI' Then

      // Exclui Pessoa =========================================================
      If sDML='EX' Then
      Begin
        MySql:=' DELETE FROM TAB_AUXILIAR t'+
               ' WHERE t.tip_aux=27'+ // 27 => CALCULO DE COMISSÃO SOBRE CAMPANHAS sobre Venda LinxProduto.Id_Colecao
               ' AND  t.cod_aux='+IntToStr(EdtCampColecaoPessCod.AsInteger);
      End; // If sDML='EX' Then
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ====================================================
      DMBelShop.SQLC.Commit(TD);

      CampanhaComissaoTabelas('P');

    Except // Except da Transação
      on e : Exception do
      Begin
        // Abandona Transacao ==================================================
        DMBelShop.SQLC.Rollback(TD);

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try da Transação
    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;
  End; // If sTipo='P' Then
End; // CAMPANHA COMISSAO - Update / Insert Tabelas Pessoa/Campanhas>>>>>>>>>>>>

// CAMPANHA COMISSAO - Consiste Dados de Pessoa >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmComissaoVendedor.CampanhaComissaoConsiste(sTipo: String): Boolean;
Begin
  // sTipo='P' Pessoas
  // sTipo='C' Campanhas
  Result:=False;

  If sTipo='P' Then
  Begin
    If Trim(EdtCampColecaoPessNome.Text)='' Then
    Begin
      msg('Favor Informar o Nome da Pessoa !!','A');
      EdtCampColecaoPessNome.SetFocus;
      Exit;
    End;

    If Trim(Cbx_CampColecaoPessCargo.Text)='' Then
    Begin
      msg('Favor Informar o Cargo a Pessoa !!','A');
      Cbx_CampColecaoPessCargo.SetFocus;
      Exit;
    End;

    If (EdtCampColecaoPessPerc.Value=0) and (EdtCampColecaoPessVlr.Value=0) Then
    Begin
      msg('Favor Informar o %/Venda ou $/Unid !!','A');
      EdtCampColecaoPessPerc.SetFocus;
      Exit;
    End;
  End; // If sTipo='P' Then
  Result:=True;
End; // CAMPANHA COMISSAO - Consiste Dados de Pessoa >>>>>>>>>>>>>>>>>>>>>>>>>>>

// CAMPANHA COMISSAO - Habilia/Desabilita Componentes >>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.CampanhaComissaoHabilita(bHabilita: Boolean; sTipo: String='P');
Begin
// sTipo='P' Pessoas
// sTipo='C' Campanhas

  If sTipo='P' Then
  Begin
    Bt_CampColecaoPessoasAlt.Enabled :=bHabilita;
    Bt_CampColecaoPessoasInc.Enabled :=Not bHabilita;
    Bt_CampColecaoPessoasExc.Enabled :=bHabilita;
    Bt_CampColecaoPessoasAban.Enabled:=bHabilita;

    If Not bHabilita Then
    Begin
      EdtCampColecaoPessCod.Clear;
      EdtCampColecaoPessNome.Clear;
      Cbx_CampColecaoPessCargo.ItemIndex:=-1;
      EdtCampColecaoPessPerc.Clear;
      EdtCampColecaoPessVlr.Clear;
    End; // If bHabilita Then
  End; // If sTipo='P' Then
End; // CAMPANHA COMISSAO - Habilia/Desabilita Componentes >>>>>>>>>>>>>>>>>>>>>

// Busca Aplicações Selecionadas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.AplicacoesSelecionadas;
Var
  MySql: String;
Begin
  sgAplicacoes:='';
  MySql:=' SELECT ap.des_aux'+
         ' FROM TAB_AUXILIAR ap'+
         ' WHERE ap.tip_aux=15'; // Comissão Vendedores (Aplicações Utilizadas)
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    If sgAplicacoes='' Then
     sgAplicacoes:=QuotedStr(DMBelShop.CDS_Busca.FieldByName('Des_Aux').AsString)
    Else
     sgAplicacoes:=sgAplicacoes+', '+
                 QuotedStr(DMBelShop.CDS_Busca.FieldByName('Des_Aux').AsString);

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.Close;
End; // Busca Aplicações Selecionadas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Comissões >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmComissaoVendedor.BuscaComissoes(sNrDoc: String): Boolean;
Var
  MySql: String;
Begin
  Result:=True;
  DMComissaoVendedor.CDS_ComisVendedores.Close;
  DMComissaoVendedor.CDS_ComisVendedores.DisableControls;

  // Aplicacoes Selecionadas ===================================================
  AplicacoesSelecionadas;

  // Monta Select ==============================================================
  MySql:=' select'+
         ' ''Bel_''||cv.cod_loja cod_loja, em.razao_social Loja,'+
         ' Trim(cv.cod_vendedor) cod_vendedor, cv.des_vendedor,'+
         ' Count(distinct coalesce(cv.numero, 0)) Qtd_Notas,'+
         ' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)) Qtd_Venda,';

  If sNrDoc='0' Then
   MySql:=
    MySql+' coalesce(cp.fat_conversao, 0.00) VLR_CONVERSAO,'+
          ' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cp.fat_conversao, 0.00)) VLR_COMISSAO'
  Else
   MySql:=
    MySql+' coalesce(cv.vlr_conversao, 0.00) VLR_CONVERSAO,'+
          ' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cv.vlr_conversao, 0.00)) VLR_COMISSAO';

  MySql:=
   MySql+' from FIN_VEND_COMISSAO_VENDAS cv'+
         '       Left Join emp_conexoes em            on em.cod_filial=cv.cod_loja';

  If sNrDoc='0' Then
   MySql:=
    MySql+'       Left Join fin_vend_comissao_prod cp  on cp.cod_produto=cv.cod_produto';

  MySql:=
   MySql+' Where cv.num_docto='+sNrDoc;

  If sNrDoc='0' Then
   MySql:=
    MySql+' and cv.dta_docto between '+QuotedStr(sgDtaInicio)+' and '+QuotedStr(sgDtaFim)+
          ' and cv.cod_aplicacao in ('+sgAplicacoes+')';

  MySql:=
   MySql+' group by 1,2,3,4,7'+

         'UNION'+

         ' select'+
         ' ''Bel_''||cv.cod_loja cod_loja, em.razao_social Loja,'+
         ' ''TOTAL'' cod_vendedor, cv.des_vendedor,'+
         ' Count(distinct coalesce(cv.numero, 0)) Qtd_Notas,'+
         ' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)) Qtd_Venda,'+
         ' 0.00 VLR_CONVERSAO,';

  If sNrDoc='0' Then
   MySql:=
    MySql+' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cp.fat_conversao, 0.00)) VLR_COMISSAO'
  Else
   MySql:=
    MySql+' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cv.vlr_conversao, 0.00)) VLR_COMISSAO';

  MySql:=
   MySql+' from fin_vend_comissao_vendas cv'+
         '       Left Join emp_conexoes em            on em.cod_filial=cv.cod_loja';

  If sNrDoc='0' Then
   MySql:=
    MySql+'      Left Join fin_vend_comissao_prod cp  on cp.cod_produto=cv.cod_produto';

  MySql:=
   MySql+' Where cv.num_docto='+sNrDoc;

  If sNrDoc='0' Then
   MySql:=
    MySql+' and cv.dta_docto between '+QuotedStr(sgDtaInicio)+' and '+QuotedStr(sgDtaFim)+
          ' and cv.cod_aplicacao in ('+sgAplicacoes+')';

  MySql:=
   MySql+' group by 1,2,3,4'+

         ' UNION'+

         ' select'+
         ' ''Bel_''||cv.cod_loja cod_loja, em.razao_social Loja,'+
         ' ''TOTAL DA LOJA'' cod_vendedor, '''' des_vendedor,'+
         ' Count(distinct coalesce(cv.numero, 0)) Qtd_Notas,'+
         ' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)) Qtd_Venda,'+
         ' 0.00 VLR_CONVERSAO,';

  If sNrDoc='0' Then
   MySql:=
    MySql+' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cp.fat_conversao, 0.00)) VLR_COMISSAO'
  Else
   MySql:=
    MySql+' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cv.vlr_conversao, 0.00)) VLR_COMISSAO';

  MySql:=
   MySql+' from fin_vend_comissao_vendas cv'+
         '       Left Join emp_conexoes em            on em.cod_filial=cv.cod_loja';

  If sNrDoc='0' Then
   MySql:=
    MySql+'      Left Join fin_vend_comissao_prod cp  on cp.cod_produto=cv.cod_produto';

  MySql:=
   MySql+' Where cv.num_docto='+sNrDoc;

  If sNrDoc='0' Then
   MySql:=
    MySql+' and cv.dta_docto between '+QuotedStr(sgDtaInicio)+' and '+QuotedStr(sgDtaFim)+
          ' and cv.cod_aplicacao in ('+sgAplicacoes+')';

  MySql:=
   MySql+' group by 1,2,3,4'+

         ' UNION'+

         ' select'+

         ' '''' cod_loja, ''TOTAL DA EMPRESA: ''||'+QuotedStr(sgDtaInicio)+'||'' a ''||'+QuotedStr(sgDtaFim)+' Loja,'+
         ' '''' cod_vendedor, ''CAMPANHA DE VENDAS'' des_vendedor,'+
         ' Count(distinct coalesce(cv.numero, 0)) Qtd_Notas,'+
         ' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)) Qtd_Venda,'+
         ' 0.00 VLR_CONVERSAO,';

  If sNrDoc='0' Then
   MySql:=
    MySql+' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cp.fat_conversao, 0.00)) VLR_COMISSAO'
  Else
   MySql:=
    MySql+' sum(Cast(coalesce(cv.qtd_atendida, 0) as Integer)*coalesce(cv.vlr_conversao, 0.00)) VLR_COMISSAO';

  MySql:=
   MySql+' from fin_vend_comissao_vendas cv'+
         '       Left Join emp_conexoes em            on em.cod_filial=cv.cod_loja';

  If sNrDoc='0' Then
   MySql:=
    MySql+'      Left Join fin_vend_comissao_prod cp  on cp.cod_produto=cv.cod_produto';

  MySql:=
   MySql+' Where cv.num_docto='+sNrDoc;

  If sNrDoc='0' Then
   MySql:=
    MySql+' and cv.dta_docto between '+QuotedStr(sgDtaInicio)+' and '+QuotedStr(sgDtaFim)+
          ' and cv.cod_aplicacao in ('+sgAplicacoes+')';

  MySql:=
   MySql+' order by 1,4,3,2';
  DMComissaoVendedor.CDS_ComisVendedores.Close;
  DMComissaoVendedor.SDS_ComisVendedores.CommandText:=MySql;
  DMComissaoVendedor.CDS_ComisVendedores.Open;

  Rb_ComisVendAnalitico.Checked:=True;
  Rb_ComisVendSinteticoClick(Self);

  DMComissaoVendedor.CDS_ComisVendedores.EnableControls;

  sgAplicacoes:='';

  If DMComissaoVendedor.CDS_ComisVendedores.RecordCount<2 Then
  Begin
    Result:=False;
    If sNrDoc='0' Then
     msg('Sem Comissão no Período de'+cr+cr+QuotedStr(sgDtaInicio)+' a '+QuotedStr(sgDtaFim),'A')
    Else
     msg('Documento Não Encontrado !!','A');

    DMComissaoVendedor.CDS_ComisVendedores.Close;
  End;
End; // Busca Comissões >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Aplicacoes e FamiliaPrecos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.Aplicacoes_FamiliaPrecos;
Var
  MySql: String;
Begin
  // Busca Aplicaçoes ==========================================================
  MySql:=' SELECT DISTINCT Trim(pr.nomeaplicacao) DES_APLICACAO,'+
         '                 Trim(pr.codaplicacao)  COD_APLICACAO'+
         ' FROM PRODUTO pr, TAB_AUXILIAR ap'+
         ' WHERE Trim(pr.codaplicacao)=Trim(ap.Des_Aux)'+
         ' AND   ap.tip_aux=15'+ // Comissão Vendedores (Aplicações Utilizadas)
         ' ORDER BY 2';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If DMComissaoVendedor.CDS_V_Aplicacao.Active Then
   DMComissaoVendedor.CDS_V_Aplicacao.Close;

  DMComissaoVendedor.CDS_V_Aplicacao.CreateDataSet;
  DMComissaoVendedor.CDS_V_Aplicacao.Open;

  DMComissaoVendedor.CDS_V_Aplicacao.Data:=DMBelShop.CDS_BuscaRapida.Data;
  DMBelShop.CDS_BuscaRapida.Close;

  // Busca Familia de Preços ===================================================
  MySql:=' SELECT DISTINCT Trim(pr.nomefamiliapreco) des_familia,'+
         '        Trim(pr.codfamiliapreco) cod_familia,'+
         '        fa.vlr_aux vlr_conversao'+
         ' FROM PRODUTO pr, TAB_AUXILIAR fa'+
         ' WHERE Trim(pr.codfamiliapreco)=Trim(fa.Des_Aux)'+
         ' AND   fa.tip_aux=16'+ // Comissão Vendedores (Familias Preço Utilizadas)
         ' ORDER BY 2';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If DMComissaoVendedor.CDS_V_FamiliaPrecos.Active Then
   DMComissaoVendedor.CDS_V_FamiliaPrecos.Close;

  DMComissaoVendedor.CDS_V_FamiliaPrecos.CreateDataSet;
  DMComissaoVendedor.CDS_V_FamiliaPrecos.Open;

  DMComissaoVendedor.CDS_V_FamiliaPrecos.Data:=DMBelShop.CDS_BuscaRapida.Data;
  DMBelShop.CDS_BuscaRapida.Close;

End; // Busca Aplicacoes e FamiliaPrecos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Produtos da Aplicação e Família Preço >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.ProdutosCampanhaVendas;
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

    // Inclui Novos Produtos da Aplicação 0006
    MySql:=' INSERT INTO FIN_VEND_COMISSAO_PROD'+
           ' SELECT pr.codproduto COD_PRODUTO,'+
           ' COALESCE(fp.vlr_aux, 0.00) FAT_CONVERSAO,'+
           ' TRIM(pr.codaplicacao) COD_APLICACAO,'+
           ' TRIM(pr.codfamiliapreco) COD_FAMILIA_PRECO,'+
           ' NULL DTA_VALIDADE_INI, NULL DTA_VALIDADE_FIM, '+
           QuotedStr(Cod_Usuario)+' USU_INCLUI, CURRENT_TIMESTAMP DTA_INCLUI,'+
           ' NULL USU_ALTERA, NULL DTA_ALTERA'+

           ' FROM PRODUTO pr'+
           '       LEFT JOIN  TAB_AUXILIAR fp  ON Trim(fp.des_aux)=Trim(pr.codfamiliapreco)'+
           '                                  AND fp.tip_aux=16'+ // Comissão Vendedores (Familias Preço Utilizadas)

           ' WHERE pr.codaplicacao=''0006'''+
           ' AND NOT EXISTS (SELECT 1'+
           '                 FROM FIN_VEND_COMISSAO_PROD vp'+
           '                 WHERE vp.cod_produto=pr.codproduto)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Delete Novos Produtos que Não São Mais da Aplicação 0006
    MySql:=' DELETE FROM FIN_VEND_COMISSAO_PROD vp'+
           ' WHERE NOT EXISTS(SELECT 1'+
           '                  FROM PRODUTO pr'+
           '                  WHERE pr.codaplicacao = ''0006'''+
           '                  AND   pr.codproduto = vp.cod_produto)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Apresenta Produtos da Aplicação 0006
    MySql:=' SELECT vp.COD_PRODUTO, pr.APRESENTACAO, vp.FAT_CONVERSAO,'+
           '        vp.DTA_VALIDADE_INI, vp.DTA_VALIDADE_FIM'+
           ' FROM FIN_VEND_COMISSAO_PROD vp, PRODUTO pr'+
           ' WHERE vp.COD_PRODUTO=pr.CODPRODUTO'+
           ' ORDER BY 2';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If DMComissaoVendedor.CDS_V_Produtos.Active Then
     DMComissaoVendedor.CDS_V_Produtos.Close;

    DMComissaoVendedor.CDS_V_Produtos.CreateDataSet;
    DMComissaoVendedor.CDS_V_Produtos.Open;
    DMComissaoVendedor.CDS_V_Produtos.Data:=DMBelShop.CDS_BuscaRapida.Data;
    DMComissaoVendedor.CDS_V_ProdutosDTA_VALIDADE_INI.EditMask:='!99/99/2\099;1;_';
    DMComissaoVendedor.CDS_V_ProdutosDTA_VALIDADE_FIM.EditMask:='!99/99/2\099;1;_';

    DMBelShop.CDS_BuscaRapida.Close;

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

End; // Busca Produtos da Aplicação e Família Preço >>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta ProgressBar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.MontaProgressBar(bCria: Boolean; Form: TForm);
Begin
  If bCria Then
  Begin
    pgProgBar:=TcxProgressBar.Create(Self);
    pgProgBar.Parent:=Form;
    pgProgBar.Visible:=True;
    pgProgBar.Style.Font.Style:=[fsBold];
    pgProgBar.Left:=100;
    pgProgBar.Top:=302;
    pgProgBar.Width:=Form.ClientWidth-200;
    pgProgBar.BringToFront;

    // Disabilita Formulario
    Form.Enabled:=False;
  End; // If bCria Then

  If Not bCria Then
  Begin
    FreeAndNil(pgProgBar);

    // Habilita Formulario
    Form.Enabled:=True;
  End;

  Refresh;
End; // Monta ProgressBar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.FechaTudoComVend;
Var
  i: Integer;
Begin

  // Fecha Componentes DMBelShop ===============================================
  For i:=0 to DMComissaoVendedor.ComponentCount-1 do
  Begin
    If DMComissaoVendedor.Components[i] is TClientDataSet Then
     If (DMComissaoVendedor.Components[i] as TClientDataSet).Active Then
     (DMComissaoVendedor.Components[i] as TClientDataSet).Close;

    If DMComissaoVendedor.Components[i] is TSQLQuery Then
     If (DMComissaoVendedor.Components[i] as TSQLQuery).Active Then
     (DMComissaoVendedor.Components[i] as TSQLQuery).Close;
  End;
end; // Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Ultimas Atualizações das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmComissaoVendedor.UltimasAtualizacoes;
Var
  MySql: String;
Begin
  MySql:=' SELECT ''NAO'' Imp, ''Bel_''||e.cod_filial Codigo,'+
         ' e.razao_social Loja, e.dta_ult_atual_vend Data'+
         ' FROM EMP_CONEXOES e'+
         ' WHERE e.ind_ativo='+QuotedStr('SIM');
//         ' Order by 2';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If DMComissaoVendedor.CDS_V_UltimaAtualizacao.Active Then
   DMComissaoVendedor.CDS_V_UltimaAtualizacao.Close;

  DMComissaoVendedor.CDS_V_UltimaAtualizacao.CreateDataSet;
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.IndexFieldNames:='Codigo';
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.Open;

  DMComissaoVendedor.CDS_V_UltimaAtualizacao.Data:=DMBelShop.CDS_BuscaRapida.Data;

  DMBelShop.CDS_BuscaRapida.Close;
End; // Busca Ultimas Atualizações das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//==============================================================================
// Odir - FIM ==================================================================
//==============================================================================

procedure TFrmComissaoVendedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairComVend Then
   Begin
     Action := caFree;

     FechaTudoComVend;
   End
  Else
   Begin
     msg('Para Sair Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmComissaoVendedor.FormCreate(Sender: TObject);
begin
  bEnterTab:=True;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;

  // Busca Ultimas Atualizações e Produtos da Aplicação, e Familia de Preços ===
  If sgDescricao='Comissao' Then
  Begin
    UltimasAtualizacoes;
    ProdutosCampanhaVendas;
  End;

  // Busca Aplicacoes e FamiliaPrecos ==========================================
  If sgDescricao='Parametros' Then
  Begin
    Aplicacoes_FamiliaPrecos;
  End;
end;

procedure TFrmComissaoVendedor.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmComissaoVendedor.FormShow(Sender: TObject);
begin
  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmComissaoVendedor);

  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairComVend:=False;

  PC_ComissaoVendedor.TabIndex:=0;

  // Habilia/Desabilitar Componestes ===========================================
  If sgDescricao='Campanhas-Colecao' Then
  Begin
    CampanhaComissaoHabilita(False);
  End;

  If (PC_ComissaoVendedor.ActivePage=Ts_ParametrosVendedores) And (Ts_ParametrosVendedores.CanFocus) Then
  Begin
    Dbg_Aplicacao.SetFocus;
  End;

  PC_ComissaoVendedorChange(Self);
end;

procedure TFrmComissaoVendedor.Bt_FluFornFecharClick(Sender: TObject);
begin
  bgSairComVend:=True;
  Close;

end;

procedure TFrmComissaoVendedor.PC_ComissaoVendedorChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_ComissaoVendedor);

  If (PC_ComissaoVendedor.ActivePage=Ts_Produtos) And (Ts_Produtos.CanFocus) Then
  Begin
    Bt_Clipboard.Visible:=False;
    Rb_ComisVendSintetico.Visible:=False;
    Rb_ComisVendAnalitico.Visible:=False;
    Dbg_UltimaAtualizacao.SetFocus;
  End;

  If (PC_ComissaoVendedor.ActivePage=Ts_ParametrosVendedores) And (Ts_ParametrosVendedores.CanFocus) Then
  Begin
    Bt_Clipboard.Visible:=False;
    Rb_ComisVendSintetico.Visible:=False;
    Rb_ComisVendAnalitico.Visible:=False;
    Dbg_Aplicacao.SetFocus;
  End;

  If (PC_ComissaoVendedor.ActivePage=Ts_Comissoes) And (Ts_Comissoes.CanFocus) Then
  Begin
    Bt_Clipboard.Visible:=True;
    Rb_ComisVendSintetico.Visible:=True;
    Rb_ComisVendAnalitico.Visible:=True;
    Dbg_ComisVendedores.SetFocus;
  End;

  If (PC_ComissaoVendedor.ActivePage=Ts_CampColecao) And (Ts_CampColecao.CanFocus) Then
  Begin
    Bt_Clipboard.Visible:=False;
    Rb_ComisVendSintetico.Visible:=False;
    Rb_ComisVendAnalitico.Visible:=False;

    // Busca Gerente/Supervidores/Assistentes e Campanhas ======================
    CampanhaComissaoTabelas();
  End;
end;

procedure TFrmComissaoVendedor.Dbg_UltimaAtualizacaoDblClick( Sender: TObject);
begin
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.Edit;

  If DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString='SIM' Then
   DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString:='NAO'
  Else
   DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString:='SIM';

  DMComissaoVendedor.CDS_V_UltimaAtualizacao.Post;
end;

procedure TFrmComissaoVendedor.Dbg_UltimaAtualizacaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    if DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString='SIM' Then
    Begin
      Dbg_UltimaAtualizacao.Canvas.Brush.Color:=clSkyBlue;
      Dbg_UltimaAtualizacao.Canvas.FillRect(Rect);
      Dbg_UltimaAtualizacao.DefaultDrawDataCell(Rect,Column.Field,state);
    end;
  End; // if not (gdSelected in State) Then

end;

procedure TFrmComissaoVendedor.Dbg_UltimaAtualizacaoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sMarcar: String;
begin

  // Marca / Desmarca Todas as Lojas para Importação de Vendas =================
  If key=Vk_F5 Then
  Begin
    DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;

    sMarcar:='SIM';
    If DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString='SIM' Then
     sMarcar:='NAO';

    While Not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do
    Begin
      DMComissaoVendedor.CDS_V_UltimaAtualizacao.Edit;
      DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString:=sMarcar;
      DMComissaoVendedor.CDS_V_UltimaAtualizacao.Post;

      DMComissaoVendedor.CDS_V_UltimaAtualizacao.Next;
    End; // While Not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do
    DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;
  End; // If key=Vk_F5 Then
end;

procedure TFrmComissaoVendedor.Bt_ImportaVendasClick(Sender: TObject);
Var
  bProcOK, bSiga: Boolean;
  dDtaI, dDtaF: TDate;
  MySql: String;
  i: Integer;
begin
  Dbg_UltimaAtualizacao.SetFocus;

  // Verifica se Existe loja a Importar ========================================
  bSiga:=False;
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.DisableControls;
  While not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do
  Begin
    If DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString='SIM' Then
    Begin
      bSiga:=True;
      Break;
    End;

    DMComissaoVendedor.CDS_V_UltimaAtualizacao.Next;
  End; // While not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.EnableControls;
  DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;

  If Not bSiga Then
  Begin
    msg('Sem Loja Selecionada para'+cr+cr+'Importação de Vendas !!','A');
    Exit;
  End;

  // Solicita o Periodo de Apropriação de Vendas dos Vendedores ===============
  bgSiga:=False;
  FrmPeriodoApropriacao:=TFrmPeriodoApropriacao.Create(Self);
  FrmPeriodoApropriacao.sgTipoProc:='CV'; // Comissão de Vendedores
  If Trim(DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsString)='' Then
   sgDtaInicio:='01/09/2016'
  Else
   sgDtaInicio:=DateToStr(DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsDateTime+1);

  FrmPeriodoApropriacao.ShowModal;

  dDtaI:=FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date;
  dDtaF:=FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date;

  FreeAndNil(FrmPeriodoApropriacao);

  If Not bgSiga Then
   Exit;

  Screen.Cursor:=crAppStart;

  // Aplicacoes Selecionadas ===================================================
  AplicacoesSelecionadas;

  // Importa Vendas ============================================================
  sgLojasNConectadas:='';
  bProcOK:=False;

  sgDtaFim:=DateToStr(dDtaF);
  sgDtaFim:=f_Troca('/','.',f_Troca('-','.',sgDtaFim));

  DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;
  While Not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do
  Begin
    Application.ProcessMessages;

    If Trim(DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsString)='' Then
     sgDtaInicio:=DateToStr(dDtaI)
    Else
     sgDtaInicio:=DateToStr(DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsDateTime+1);

    if (DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString='SIM') And (StrToDate(sgDtaInicio)<dDtaF) Then
    Begin
      sgCodEmp:=Copy(DMComissaoVendedor.CDS_V_UltimaAtualizacaoCODIGO.AsString,5,2);
      sgDesLoja:=DMComissaoVendedor.CDS_V_UltimaAtualizacaoLOJA.AsString;

      // Apresentacao ==========================================================
      OdirPanApres.Caption:='AGUARDE !! Processando Empresa: '+sgCodEmp+' - '+sgDesLoja;
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Height-OdirPanApres.Height)/2))-20;
      OdirPanApres.Font.Style:=[fsBold];
      OdirPanApres.Parent:=FrmComissaoVendedor;
      OdirPanApres.BringToFront();
      OdirPanApres.Visible:=True;
      Application.ProcessMessages;

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
          sgLojasNConectadas:=DMComissaoVendedor.CDS_V_UltimaAtualizacaoCODIGO.AsString
         Else
          sgLojasNConectadas:=', '+DMComissaoVendedor.CDS_V_UltimaAtualizacaoCODIGO.AsString;
       End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

      // Inicia Processamento ==================================================
      If bSiga Then // Empresa Conectada
      Begin
        // Cria Query da Empresa ------------------------------------
        FrmBelShop.CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True, True);

        // Monta SQL ------------------------------------------------
        sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',sgDtaInicio));

        MySql:=' SELECT 0 NUM_DOCTO, nt.codfilial COD_LOJA,'+
               ' nt.datadocumento DTA_DOCTO, nt.datacomprovante DTA_COMPRV,'+
               ' nt.chavenf, nt.numero, nt.numerocupom, nt.serie,'+
               ' Trim(nt.codvendedor) COD_VENDEDOR, Trim(vd.nomevendedor) DES_VENDEDOR,'+
               ' nt.codcomprovante COD_COMPROVANTE,'+
               ' it.codproduto COD_PRODUTO, pr.apresentacao DES_PRODUTO,'+
               ' pr.codaplicacao COD_APLICACAO, ap.nomeaplicacao DES_APLICACAO,'+
               ' pr.codfamiliapreco COD_FAMILIA_PRECO, fa.nomefamiliapreco DES_FAMILIAPRECO,'+
               ' it.quantatendida QTD_ATENDIDA,'+
               ' it.preco VLR_PRECO, it.valbruto VLR_BRUTO, it.valdescitem VLR_DESCITEM,'+
               ' it.valtotal VLR_TOTAL, 0.00 VLR_CONVERSAO';

  // Monta para Contagem
  MySqlSelect:=' FROM MCLI nt'+
               '       LEFT JOIN MCLIPRO  it  ON it.chavenf=nt.chavenf'+
               '       LEFT JOIN VENDEDOR vd  ON vd.codvendedor=nt.codvendedor'+
               '       LEFT JOIN PRODUTO  pr  ON pr.codproduto=it.codproduto'+
               '       LEFT JOIN APLICA   ap  ON ap.codaplicacao=pr.codaplicacao'+
               '       LEFT JOIN FAMILIAP fa  ON fa.codfamiliapreco=pr.codfamiliapreco'+

               ' WHERE nt.codcomprovante in (''002'', ''007'')';

               If Trim(sgAplicacoes)<>'' Then
                MySqlSelect:=
                 MySqlSelect+' AND   pr.codaplicacao in ('+sgAplicacoes+')';

  MySqlSelect:=
   MySqlSelect+' AND   nt.datadocumento Between '+QuotedStr(sgDtaInicio)+' AND '+QuotedStr(sgDtaFim)+
               ' AND   nt.codfilial='+QuotedStr(sgCodEmp);

        // Abre Query -----------------------------------------------
        i:=0;
        bSiga:=False;
        While Not bSiga do
        Begin
          Try
            igTotInteiro:=FrmBelShop.TotalRegistros(IBQ_ConsultaFilial, MySqlSelect);

            IBQ_ConsultaFilial.SQL.Clear;
            IBQ_ConsultaFilial.SQL.Add(MySql+MySqlSelect);
            IBQ_ConsultaFilial.Open;
            bSiga:=True;
          Except
            Inc(i);
          End; // Try

          If i>2 Then
          Begin
            If sgLojasNConectadas='' Then
             sgLojasNConectadas:=DMComissaoVendedor.CDS_V_UltimaAtualizacaoCODIGO.AsString
            Else
             sgLojasNConectadas:=', '+DMComissaoVendedor.CDS_V_UltimaAtualizacaoCODIGO.AsString;

            Break;
          End; // If i>2 Then
        End; // While Not bSiga do

        // Processamento =======================================================
        If bSiga Then // Query Executada
        Begin
          MontaProgressBar(True, FrmComissaoVendedor);
          pgProgBar.Properties.Max:=igTotInteiro;
          pgProgBar.Position:=0;

          Application.ProcessMessages;
          IBQ_ConsultaFilial.First;

          // Monta Transacao ===================================================
          TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
          TD.IsolationLevel:=xilREADCOMMITTED;
          DMBelShop.SQLC.StartTransaction(TD);
          Try
            Screen.Cursor:=crAppStart;
            DateSeparator:='.';
            DecimalSeparator:='.';

            While Not IBQ_ConsultaFilial.Eof do
            Begin
              Application.ProcessMessages;
              bProcOK:=True;

              // Insere Movimento de Vendas -------------------------
              MySql:=' INSERT INTO FIN_VEND_COMISSAO_VENDAS ('+
                     ' NUM_DOCTO, COD_LOJA, DTA_DOCTO, DTA_COMPRV, CHAVENF, NUMERO,'+
                     ' NUMEROCUPOM, SERIE, COD_VENDEDOR, DES_VENDEDOR,'+
                     ' COD_COMPROVANTE, COD_PRODUTO, DES_PRODUTO,'+
                     ' COD_APLICACAO, DES_APLICACAO,'+
                     ' COD_FAMILIA_PRECO, DES_FAMILIAPRECO,'+
                     ' QTD_ATENDIDA, VLR_PRECO,'+
                     ' VLR_BRUTO, VLR_DESCITEM, VLR_TOTAL, VLR_CONVERSAO)'+
                     ' VALUES ('+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('NUM_DOCTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('COD_LOJA').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('DTA_DOCTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('DTA_COMPRV').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('CHAVENF').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('NUMERO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('NUMEROCUPOM').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('SERIE').AsString)+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('COD_VENDEDOR').AsString))+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('DES_VENDEDOR').AsString))+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('COD_COMPROVANTE').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('COD_PRODUTO').AsString)+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('DES_PRODUTO').AsString))+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('COD_APLICACAO').AsString))+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('DES_APLICACAO').AsString))+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('COD_FAMILIA_PRECO').AsString))+', '+
                     QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('DES_FAMILIAPRECO').AsString))+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('QTD_ATENDIDA').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('VLR_PRECO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('VLR_BRUTO').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('VLR_DESCITEM').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('VLR_TOTAL').AsString)+', '+
                     QuotedStr(IBQ_ConsultaFilial.FieldByName('VLR_CONVERSAO').AsString)+')';
              DMBelShop.SQLC.Execute(MySql,nil,nil);

              pgProgBar.Position:=IBQ_ConsultaFilial.RecNo;

              IBQ_ConsultaFilial.Next;
            End; // While Not IBQ_ConsultaFilial.Eof do
            IBQ_ConsultaFilial.Close;
            MontaProgressBar(False, FrmComissaoVendedor);

            // Atualiza ultima Inportação ---------------------------
            MySql:=' UPDATE EMP_CONEXOES e'+
                   ' SET e.dta_ult_atual_vend='+QuotedStr(sgDtaFim)+
                   ' WHERE e.cod_filial='+QuotedStr(sgCodEmp);
            DMBelShop.SQLC.Execute(MySql,nil,nil);

            DMComissaoVendedor.CDS_V_UltimaAtualizacao.Edit;
            DMComissaoVendedor.CDS_V_UltimaAtualizacaoDATA.AsDateTime:=dDtaF;
            DMComissaoVendedor.CDS_V_UltimaAtualizacaoIMP.AsString:='NAO';
            DMComissaoVendedor.CDS_V_UltimaAtualizacao.Post;

            // Fecha Transacao =================================================
            DMBelShop.SQLC.Commit(TD);

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
              MontaProgressBar(False, FrmComissaoVendedor);

              MessageBox(Handle, pChar(sgCodEmp+#13+e.message), 'Erro', MB_ICONERROR);
              Refresh;
            End; // on e : Exception do
          End; // Try

        End; // If bSiga Then // Query Executada
      End; // If bSiga Then // Empresa Conectada

      // Fecha Conexão =========================================================
      ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

    End; // if DMComissaoVendedor.CDS_V_UltimaAtualizacaoPROC.AsString='SIM' Then

    Application.ProcessMessages;

    DMComissaoVendedor.CDS_V_UltimaAtualizacao.Next;
  End; // While Not DMComissaoVendedor.CDS_V_UltimaAtualizacao.Eof do

  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;

  Refresh;

  If bProcOK Then
   Begin
     DMComissaoVendedor.CDS_V_UltimaAtualizacao.First;
     msg('Importação Efetuada com SUCESSO !!','A');
   End // If bProcOK Then
  Else
   Begin
     msg('IMPORTAÇÃO NÃO REALIZADA !!','A');
   End; //  // If bProcOK Then

  If sgLojasNConectadas<>'' Then
   msg('Lojas Não Conctadas: '+cr+cr+sgLojasNConectadas,'A');

end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoEnter(Sender: TObject);
begin
  bEnterTab:=False;
  THackDBGrid(Dbg_ProdutosComissao).SelectedIndex:=2;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ProdutosComissaoEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoExit(Sender: TObject);
begin
  If (DMComissaoVendedor.CDS_V_Produtos.State=dsInsert) Or (DMComissaoVendedor.CDS_V_Produtos.State=dsEdit) Then
   DMComissaoVendedor.CDS_V_ProdutosAfterPost(DMComissaoVendedor.CDS_V_Produtos);

  ApplicationEvents1.OnActivate:=nil;
  Application.OnMessage := nil;

  bEnterTab:=True;
end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
begin
  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
   Key := 0;

  // Localiza Produto ==========================================================
  If Key=VK_F4 Then
  Begin
    If Not DMComissaoVendedor.CDS_V_Produtos.IsEmpty Then
    Begin
      i:=DMComissaoVendedor.CDS_V_Produtos.RecNo;

      s:='';
      If InputQuery('Localizar Produto','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            If Not DMComissaoVendedor.CDS_V_Produtos.Locate('COD_PRODUTO',FormatFloat('000000',StrToInt(s)),[]) Then
            Begin
              DMComissaoVendedor.CDS_V_Produtos.RecNo:=i;
              msg('Produto Não Encontrado !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMComissaoVendedor.CDS_V_Produtos, 'APRESENTACAO', s) Then
            Begin
              DMComissaoVendedor.CDS_V_Produtos.RecNo:=i;
              msg('Produto Não Encontrado !!','A');
            End;
          End;
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Produto','',s) then

      THackDBGrid(Dbg_ProdutosComissao).SelectedIndex:=2;
    End; // If Not DMComissaoVendedor.CDS_V_Produtos.IsEmpty Then
  End; // If Key=VK_F4 Then

end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  // Este comando altera cor da Celula
  If (Column.FieldName='FAT_CONVERSAO') Then
  Begin
    If Trim(DMComissaoVendedor.CDS_V_ProdutosFAT_CONVERSAO.AsString)='' Then
    Begin
      Dbg_ProdutosComissao.Canvas.Brush.Color:=clRed;
    End;
  End;

  If (Column.FieldName='DTA_VALIDADE_INI') Then
  Begin
    If (Trim(DMComissaoVendedor.CDS_V_ProdutosDTA_VALIDADE_INI.AsString)='') And
       (Trim(DMComissaoVendedor.CDS_V_ProdutosDTA_VALIDADE_FIM.AsString)<>'') Then
    Begin
      Dbg_ProdutosComissao.Canvas.Brush.Color:=clRed;
    End;
  End;

  If (Column.FieldName='DTA_VALIDADE_FIM') Then
  Begin
    If (Trim(DMComissaoVendedor.CDS_V_ProdutosDTA_VALIDADE_FIM.AsString)='') And
       (Trim(DMComissaoVendedor.CDS_V_ProdutosDTA_VALIDADE_INI.AsString)<>'') Then
    Begin
      Dbg_ProdutosComissao.Canvas.Brush.Color:=clRed;
    End;
  End;

  // Funciona Somente com Isto
  Dbg_ProdutosComissao.Canvas.FillRect(Rect);
  Dbg_ProdutosComissao.DefaultDrawDataCell(Rect,Column.Field,state);

end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoKeyPress(
  Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
   DMComissaoVendedor.CDS_V_Produtos.Next;

end;

procedure TFrmComissaoVendedor.Dbg_UltimaAtualizacaoTitleClick(Column: TColumn);
begin
  If DMComissaoVendedor.CDS_V_UltimaAtualizacao.IsEmpty Then
   Exit;

  With DMComissaoVendedor.CDS_V_UltimaAtualizacao do
  Begin
    If IndexDefs.Count>0 Then
     IndexDefs.Delete(0);

   IndexFieldNames:='';
   IndexName:='';
   If (OrderGridDtaAtual='') or (OrderGridDtaAtual='Crescente') Then
    Begin
      AddIndex(Column.FieldName,Column.FieldName,[],Column.FieldName);
      IndexName:= Column.FieldName;
      IndexDefs.Update;

      OrderGridDtaAtual:='Descendente';
    End
   Else
    Begin
      IndexFieldNames:=Column.FieldName;
      OrderGridDtaAtual:='Crescente';
    End; // If (OrderGridDtaAtual='') or (OrderGridDtaAtual='Crescente') Then
  End; // With DMComissaoVendedor.CDS_V_UltimaAtualizacao do

end;

procedure TFrmComissaoVendedor.Dbg_FamiliaPrecosExit(Sender: TObject);
begin
  If (DMComissaoVendedor.CDS_V_FamiliaPrecos.State=dsInsert) Or (DMComissaoVendedor.CDS_V_FamiliaPrecos.State=dsEdit) Then
   DMComissaoVendedor.CDS_V_FamiliaPrecosAfterPost(DMComissaoVendedor.CDS_V_FamiliaPrecos);

  ApplicationEvents1.OnActivate:=nil;
  Application.OnMessage := nil;

  bEnterTab:=True;
end;

procedure TFrmComissaoVendedor.Dbg_FamiliaPrecosEnter(Sender: TObject);
begin
  bEnterTab:=False;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_FamiliaPrecosEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;
end;

procedure TFrmComissaoVendedor.EdtCodAplicacaoExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtCodAplicacao.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    If Not ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A') Then
    Begin
      msg('Erro de Conexão ao Banco de Dados do CD !!','X');
      Exit;
    end;

    FrmBelShop.CriaQueryIB('IBDB_99','IBT_99', IBQ_ConsultaFilial, True, True);

    // Busca Aplicaçoes ========================================================
    MySql:=' SELECT a.NomeAplicacao, a.CodAplicacao'+
           ' FROM APLICA a'+
           ' WHERE a.CodAplicacao='+VarToStr(EdtCodAplicacao.Value);
    IBQ_ConsultaFilial.Close;
    IBQ_ConsultaFilial.SQL.Clear;
    IBQ_ConsultaFilial.SQL.Add(MySql);
    IBQ_ConsultaFilial.Open;

    Screen.Cursor:=crDefault;

    If Trim(IBQ_ConsultaFilial.FieldByName('CodAplicacao').AsString)='' Then
    Begin
      msg('Aplicação NÃO Encontrada !!!', 'A');

      IBQ_ConsultaFilial.Close;
      ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
      EdtCodAplicacao.Clear;
      EdtCodAplicacao.SetFocus;
      Exit;
    End; // If Trim(IBQ_ConsultaFilial.FieldByName('CodAplicacao').AsString)='' Then

    If DMComissaoVendedor.CDS_V_Aplicacao.Locate('Cod_Aplicacao',Trim(IBQ_ConsultaFilial.FieldByName('CodAplicacao').AsString),[]) Then
    Begin
      Begin
        msg('Aplicação Já Informada !!','A');

        IBQ_ConsultaFilial.Close;
        ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
        EdtCodAplicacao.Clear;
        EdtCodAplicacao.SetFocus;
        Exit;
      End;
    End;

    DMComissaoVendedor.CDS_V_Aplicacao.Insert;
    DMComissaoVendedor.CDS_V_AplicacaoCod_Aplicacao.AsString:=
                  Trim(IBQ_ConsultaFilial.FieldByName('CodAplicacao').AsString);
    DMComissaoVendedor.CDS_V_AplicacaoDes_Aplicacao.AsString:=
                 Trim(IBQ_ConsultaFilial.FieldByName('NomeAplicacao').AsString);
    DMComissaoVendedor.CDS_V_Aplicacao.Post;

    IBQ_ConsultaFilial.Close;
    EdtCodAplicacao.Text:='0';
    EdtCodAplicacao.SetFocus;

    ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F')
  End;
end;

procedure TFrmComissaoVendedor.Dbg_AplicacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquea TECLA Ctrl+Del ====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  //============================================================================
  // Tratamento Grid Dbg_Aplicacao =============================================
  //============================================================================
  If (Sender is TDBGrid) Then
  Begin
    If (Sender as TDBGrid).Name='Dbg_Aplicacao' Then
    Begin
      // Delete Aplicação ---------------------------------------------
      If (Key=VK_Delete) And (Not DMComissaoVendedor.CDS_V_Aplicacao.IsEmpty) Then
      Begin
        If Trim(DMComissaoVendedor.CDS_V_AplicacaoCOD_APLICACAO.AsString)='0006' Then
        Begin
          msg('Impossível Excluir a Aplicação'+cr+cr+Trim(DMComissaoVendedor.CDS_V_AplicacaoDES_APLICACAO.AsString),'A');
          Exit;
        End;

        If msg('Deseja Realmente EXCLUIR a'+cr+'Aplicação SELECIONADA ??','C')=2 Then
         Exit;

        DMComissaoVendedor.CDS_V_Aplicacao.Delete;
      End; // If (Key=VK_Delete) And (Not DMComissaoVendedor.CDS_V_Aplicacao.IsEmpty) Then

      Dbg_Aplicacao.SetFocus;
    End; // If (Sender as TDBGrid).Name='Dbg_Aplicacao' Then

    //============================================================================
    // Tratamento Grid Dbg_FamiliaPrecos =========================================
    //============================================================================
    If (Sender as TDBGrid).Name='Dbg_FamiliaPrecos' Then
    Begin
      // Delete Familia de Preço --------------------------------------
      If (Key=VK_Delete) And (Not DMComissaoVendedor.CDS_V_FamiliaPrecos.IsEmpty) Then
      Begin
        If msg('Deseja Realmente EXCLUIR o'+cr+'Agrupamento de Preço'+cr+'SELECIONADO ??','C')=2 Then
         Exit;

        DMComissaoVendedor.CDS_V_FamiliaPrecos.Delete;
      End; // If (Key=VK_Delete) And (Not DMComissaoVendedor.CDS_V_FamiliaPrecos.IsEmpty) Then

      Dbg_FamiliaPrecos.SetFocus;
    End; // If (Sender as TDBGrid).Name='Dbg_FamiliaPrecos' Then
  End; // If (Sender is TDBGrid) Then

end;

procedure TFrmComissaoVendedor.EdtCodFamiliaPrecosExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtCodFamiliaPrecos.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    If Not ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A') Then
    Begin
      msg('Erro de Conexão ao Banco de Dados do CD !!','X');
      Exit;
    end;

    FrmBelShop.CriaQueryIB('IBDB_99','IBT_99', IBQ_ConsultaFilial, True, True);

    // Busca Aplicaçoes ========================================================
    MySql:=' SELECT f.NomeFamiliaPreco, f.CodFamiliaPreco'+
           ' FROM FAMILIAP f'+
           ' WHERE f.CodFamiliaPreco='+VarToStr(EdtCodFamiliaPrecos.Value);
    IBQ_ConsultaFilial.Close;
    IBQ_ConsultaFilial.SQL.Clear;
    IBQ_ConsultaFilial.SQL.Add(MySql);
    IBQ_ConsultaFilial.Open;

    Screen.Cursor:=crDefault;

    If Trim(IBQ_ConsultaFilial.FieldByName('CodFamiliaPreco').AsString)='' Then
    Begin
      msg('Familia Preço NÃO Encontrada !!!', 'A');

      IBQ_ConsultaFilial.Close;
      ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
      EdtCodFamiliaPrecos.Clear;
      EdtCodFamiliaPrecos.SetFocus;
      Exit;
    End; // If Trim(IBQ_ConsultaFilial.FieldByName('CodFamiliaPreco').AsString)='' Then

    If DMComissaoVendedor.CDS_V_FamiliaPrecos.Locate('Cod_Familia',Trim(IBQ_ConsultaFilial.FieldByName('CodFamiliaPreco').AsString),[]) Then
    Begin
      Begin
        msg('Familia Preço Já Informada !!','A');

        IBQ_ConsultaFilial.Close;
        ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
        EdtCodFamiliaPrecos.Clear;
        EdtCodFamiliaPrecos.SetFocus;
        Exit;
      End;
    End;

    DMComissaoVendedor.CDS_V_FamiliaPrecos.Insert;
    DMComissaoVendedor.CDS_V_FamiliaPrecosCOD_FAMILIA.AsString:=
               Trim(IBQ_ConsultaFilial.FieldByName('CodFamiliaPreco').AsString);
    DMComissaoVendedor.CDS_V_FamiliaPrecosDES_FAMILIA.AsString:=
              Trim(IBQ_ConsultaFilial.FieldByName('NomeFamiliaPreco').AsString);
    DMComissaoVendedor.CDS_V_FamiliaPrecosFAT_CONVERSAO.AsCurrency:=0.00;
    DMComissaoVendedor.CDS_V_FamiliaPrecos.Post;

    IBQ_ConsultaFilial.Close;
    EdtCodFamiliaPrecos.Text:='0';
    EdtCodFamiliaPrecos.SetFocus;

    ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F')
  End;
end;

procedure TFrmComissaoVendedor.Bt_BuscaAplicacaoClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_Aplicacao.SetFocus;
  
  If Not ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A') Then
  Begin
    msg('Erro de Conexão ao Banco de Dados do CD !!','X');
    Exit;
  End;

  FrmBelShop.CriaQueryIB('IBDB_99','IBT_99', IBQ_ConsultaFilial, True, True);

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisaIB:=TFrmPesquisaIB.Create(Self);

  FrmPesquisaIB.IBCDS_Pesquisa.DBConnection:=IBQ_ConsultaFilial.Database;
  FrmPesquisaIB.IBCDS_Pesquisa.DBTransaction:=IBQ_ConsultaFilial.Transaction;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Aplicações ==========================================================
  MySql:=' SELECT a.NomeAplicacao, a.CodAplicacao'+
         ' FROM APLICA a'+
         ' ORDER BY a.NomeAplicacao';
  FrmPesquisaIB.IBCDS_Pesquisa.Close;
  FrmPesquisaIB.IBCDS_Pesquisa.CommandText:=MySql;
  FrmPesquisaIB.IBCDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('CodAplicacao').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    EdtCodAplicacao.Clear;
    ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
    FreeAndNil(FrmPesquisaIB);
    EdtCodAplicacao.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisaIB.Campo_pesquisa:='NomeAplicacao';
  FrmPesquisaIB.Campo_Codigo:='CodAplicacao';
  FrmPesquisaIB.Campo_Descricao:='NomeAplicacao';
  FrmPesquisaIB.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisaIB.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then
  Begin
    If DMComissaoVendedor.CDS_V_Aplicacao.Locate('COD_APLICACAO',Trim(FrmPesquisaIB.EdtCodigo.Text),[]) Then
    Begin
      Begin
        msg('Aplicação Já Informada !!','A');
        EdtCodAplicacao.Clear;
        ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
        FreeAndNil(FrmPesquisaIB);
        EdtCodAplicacao.SetFocus;
        Exit;
      End;
    End;

    DMComissaoVendedor.CDS_V_Aplicacao.Insert;
    DMComissaoVendedor.CDS_V_AplicacaoCOD_APLICACAO.AsString:=Trim(FrmPesquisaIB.EdtCodigo.Text);
    DMComissaoVendedor.CDS_V_AplicacaoDES_APLICACAO.AsString:=Trim(FrmPesquisaIB.EdtDescricao.Text);
    DMComissaoVendedor.CDS_V_Aplicacao.Post;

  End; // If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then

  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
  FreeAndNil(FrmPesquisaIB);
end;

procedure TFrmComissaoVendedor.Bt_BuscaFamiliaPrecoClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_FamiliaPrecos.SetFocus;

  If Not ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A') Then
  Begin
    msg('Erro de Conexão ao Banco de Dados do CD !!','X');
    Exit;
  End;

  FrmBelShop.CriaQueryIB('IBDB_99','IBT_99', IBQ_ConsultaFilial, True, True);

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisaIB:=TFrmPesquisaIB.Create(Self);

  FrmPesquisaIB.IBCDS_Pesquisa.DBConnection:=IBQ_ConsultaFilial.Database;
  FrmPesquisaIB.IBCDS_Pesquisa.DBTransaction:=IBQ_ConsultaFilial.Transaction;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Aplicações ==========================================================
  MySql:=' SELECT f.NomeFamiliaPreco, f.CodFamiliaPreco'+
         ' FROM FAMILIAP f'+
         ' ORDER BY f.NomeFamiliaPreco';
  FrmPesquisaIB.IBCDS_Pesquisa.Close;
  FrmPesquisaIB.IBCDS_Pesquisa.CommandText:=MySql;
  FrmPesquisaIB.IBCDS_Pesquisa.Open;
                                                           
  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(FrmPesquisaIB.IBCDS_Pesquisa.FieldByName('CodFamiliaPreco').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    EdtCodFamiliaPrecos.Clear;
    ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
    FreeAndNil(FrmPesquisaIB);
    EdtCodFamiliaPrecos.SetFocus;
    Exit;
  End;                                 

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisaIB.Campo_pesquisa:='NomeFamiliaPreco';
  FrmPesquisaIB.Campo_Codigo:='CodFamiliaPreco';
  FrmPesquisaIB.Campo_Descricao:='NomeFamiliaPreco';
  FrmPesquisaIB.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisaIB.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then
  Begin
    If DMComissaoVendedor.CDS_V_FamiliaPrecos.Locate('COD_FAMILIA',Trim(FrmPesquisaIB.EdtCodigo.Text),[]) Then
    Begin
      Begin
        msg('Agrupamento de Precos Já Informada !!','A');
        EdtCodFamiliaPrecos.Clear;
        ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
        FreeAndNil(FrmPesquisaIB);
        EdtCodFamiliaPrecos.SetFocus;
        Exit;
      End;
    End;

    DMComissaoVendedor.CDS_V_FamiliaPrecos.Insert;
    DMComissaoVendedor.CDS_V_FamiliaPrecosCOD_FAMILIA.AsString:=Trim(FrmPesquisaIB.EdtCodigo.Text);
    DMComissaoVendedor.CDS_V_FamiliaPrecosDES_FAMILIA.AsString:=Trim(FrmPesquisaIB.EdtDescricao.Text);
    DMComissaoVendedor.CDS_V_FamiliaPrecosFAT_CONVERSAO.AsCurrency:=0.00;
    DMComissaoVendedor.CDS_V_FamiliaPrecos.Post;

  End; // If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then

  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
  FreeAndNil(FrmPesquisaIB);
end;

procedure TFrmComissaoVendedor.Dbg_ProdutosComissaoTitleClick(Column: TColumn);
begin
  If DMComissaoVendedor.CDS_V_Produtos.IsEmpty Then
   Exit;

  With DMComissaoVendedor.CDS_V_Produtos do
  Begin
    If IndexDefs.Count>0 Then
     IndexDefs.Delete(0);

   IndexFieldNames:='';
   IndexName:='';
   If (OrderGridProd='') or (OrderGridProd='Crescente') Then
    Begin
      AddIndex(Column.FieldName,Column.FieldName,[],Column.FieldName);
      IndexName:= Column.FieldName;
      IndexDefs.Update;

      OrderGridProd:='Descendente';
    End
   Else
    Begin
      IndexFieldNames:=Column.FieldName;
      OrderGridProd:='Crescente';
    End; // If (OrderGridProd='') or (OrderGridProd='Crescente') Then
  End; // With DMComissaoVendedor.CDS_V_Produtos do

end;

procedure TFrmComissaoVendedor.Bt_ImportaProdutosClick(Sender: TObject);
Var
  MySql: String;
begin
  If Not ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A') Then
  Begin
    msg('Erro de Conexão ao Banco de Dados do CD !!','X');
    Exit;
  End;

  If msg('Deseja Realmente IMPORTAR'+cr+'PRODUTOS AGORA ??','C')=2 Then
   Exit;

  Dbg_Aplicacao.SetFocus;

  OdirPanApres.Caption:='AGUARDE !! Importando Produtos';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmComissaoVendedor;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Application.ProcessMessages;

  FrmBelShop.CriaQueryIB('IBDB_99','IBT_99', DMComissaoVendedor.IBQ_ProdutoMPMS, True, False);

  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    DMComissaoVendedor.IBQ_ProdutoMPMS.Close;
    DMComissaoVendedor.IBQ_ProdutoMPMS.Open;

    While Not DMComissaoVendedor.IBQ_ProdutoMPMS.Eof do
    Begin
      MySql:=DMComissaoVendedor.IBQ_ProdutoMPMSUPDATE_INSERT.AsString;
      DMBelShop.SQLC.Execute(MySql,nil,nil);

     DMComissaoVendedor.IBQ_ProdutoMPMS.Next;
    End; // While Not DMComissaoVendedor.IBQ_ProdutoMPMS.Eof do
    DMComissaoVendedor.IBQ_ProdutoMPMS.Close;

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    msg('Importação de Produtos'+cr+'Efetuado com Sucesso !!','A');

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      DMComissaoVendedor.IBQ_ProdutoMPMS.Close;

      DateSeparator:='/';
      DecimalSeparator:=',';
      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
            
    End; // on e : Exception do
  End; // Try

  OdirPanApres.Visible:=False;

  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
end;

procedure TFrmComissaoVendedor.Bt_CalculaComiisaoClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_ComisVendedores.SetFocus;

  Bt_SalvaComissao.Enabled:=False;
  EdtCodDocComissao.Clear;

  // Solicita o Periodo de Apropriação de Vendas dos Vendedores ===============
  bgSiga:=False;
  FrmPeriodoApropriacao:=TFrmPeriodoApropriacao.Create(Self);
  FrmPeriodoApropriacao.sgTipoProc:='';

  FrmPeriodoApropriacao.ShowModal;

  sgDtaInicio:=DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date);
  sgDtaFim   :=DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date);

  FreeAndNil(FrmPeriodoApropriacao);

  If Not bgSiga Then
   Exit;

  // Analisa Data de Inicio do Periodo
  MySql:=' SELECT Max(d.cod_aux) docto'+
         ' FROM TAB_AUXILIAR d'+
         ' WHERE d.tip_aux=17'; // Comissão Vendedores (DOCTOS GERADOS)
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  If Trim(DMBelShop.CDS_Busca.FieldByName('Docto').AsString)<>'' Then
  Begin
    MySql:=' SELECT d.des_aux, d.des_aux1'+
           ' FROM TAB_AUXILIAR d'+
           ' WHERE d.tip_aux=17'+ // Comissão Vendedores (DOCTOS GERADOS)
           ' AND  d.cod_aux='+DMBelShop.CDS_Busca.FieldByName('Docto').AsString;
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    If (DMBelShop.CDS_Busca.FieldByName('Des_Aux1').AsDateTime>=StrToDate(sgDtaFim)) Or
       (DMBelShop.CDS_Busca.FieldByName('Des_Aux1').AsDateTime>=StrToDate(sgDtaInicio)) Then
    Begin
      msg('Período Informado: '+cr+sgDtaInicio+' a '+sgDtaFim+cr+cr+' Diverge com o Período do Último Calculo:'+cr+
          DMBelShop.CDS_Busca.FieldByName('Des_Aux').AsString+' a '+DMBelShop.CDS_Busca.FieldByName('Des_Aux1').AsString,'A');

      DMBelShop.CDS_Busca.Close;
      Exit;
    End;
  End; // If Not DMBelShop.CDS_Busca.IsEmpty Then
  DMBelShop.CDS_Busca.Close;

  // Apresenta Comissiões -----------------------------------------
  sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',sgDtaInicio));
  sgDtaFim   :=f_Troca('/','.',f_Troca('-','.',sgDtaFim));

  If Not BuscaComissoes('0') Then
   Exit;

  Bt_SalvaComissao.Enabled:=True;
end;

procedure TFrmComissaoVendedor.Bt_BuscaDocComissaoClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_ComisVendedores.SetFocus;
  Bt_SalvaComissao.Enabled:=False;

  DMComissaoVendedor.CDS_ComisVendedores.Close;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtCodDocComissao.Clear;
  EdtCodDocComissao.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;
  DMBelShop.CDS_Pesquisa.Close;
  MySql:=' SELECT d.cod_aux DOCTO, d.des_aux || '' a '' || d.des_aux1 PERIODO'+
         ' FROM TAB_AUXILIAR d'+
         ' WHERE d.tip_aux=17'+ // Comissão Vendedores (DOCTOS GERADOS)
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('DOCTO').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Documento a Listar !!','A');
    EdtCodDocComissao.SetFocus;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Periodo';
  FrmPesquisa.Campo_Codigo:='Docto';
  FrmPesquisa.Campo_Descricao:='Periodo';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtCodDocComissao.Value:=StrToInt(FrmPesquisa.EdtCodigo.Text);
    EdtCodDocComissaoExit(Self);
  End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmComissaoVendedor.EdtCodDocComissaoExit(Sender: TObject);
Var
  MySql: String;
begin
  If EdtCodDocComissao.Value<>0 Then
  Begin
    Bt_SalvaComissao.Enabled:=False;
    Dbg_ComisVendedores.SetFocus;

    DMComissaoVendedor.CDS_ComisVendedores.Close;

    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' SELECT d.cod_aux DOCTO, d.des_aux, d.des_aux1'+
           ' FROM TAB_AUXILIAR d'+
           ' WHERE d.tip_aux=17'+ // Comissão Vendedores (DOCTOS GERADOS)
           ' AND d.Cod_Aux='+VarToStr(EdtCodDocComissao.Value);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Docto').AsString)='' Then
    Begin
      msg('Documento NÃO Encontrado !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtCodDocComissao.Clear;
      EdtCodDocComissao.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;

    sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',DMBelShop.CDS_BuscaRapida.FieldByName('Des_Aux').AsString));
    sgDtaFim   :=f_Troca('/','.',f_Troca('-','.',DMBelShop.CDS_BuscaRapida.FieldByName('Des_Aux1').AsString));

    // Apresenta Comissiões -----------------------------------------
    BuscaComissoes(DMBelShop.CDS_BuscaRapida.FieldByName('Docto').AsString);

    DMBelShop.CDS_BuscaRapida.Close;
    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmComissaoVendedor.Dbg_ComisVendedoresDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If Not DMComissaoVendedor.CDS_ComisVendedores.IsEmpty Then
  Begin
    If not (gdSelected in State) Then
    Begin
      If Copy(Trim(DMComissaoVendedor.CDS_ComisVendedoresLOJA.AsString),1,16)='TOTAL DA EMPRESA' Then
      Begin
        Dbg_ComisVendedores.Canvas.Brush.Color:=clBlue;
        Dbg_ComisVendedores.Canvas.Font.Color :=clWhite;
      End;

      If Trim(DMComissaoVendedor.CDS_ComisVendedoresCOD_VENDEDOR.AsString)='TOTAL DA LOJA' Then
      Begin
        Dbg_ComisVendedores.Canvas.Brush.Color:=clRed;
        Dbg_ComisVendedores.Canvas.Font.Color :=clWhite;
      End;

      If Trim(DMComissaoVendedor.CDS_ComisVendedoresCOD_VENDEDOR.AsString)='TOTAL' Then
      Begin
        Dbg_ComisVendedores.Canvas.Brush.Color:=clSkyBlue;
        Dbg_ComisVendedores.Canvas.Font.Style :=[fsBold];
      End;

      Dbg_ComisVendedores.Canvas.FillRect(Rect);
      Dbg_ComisVendedores.DefaultDrawDataCell(Rect,Column.Field,state);
    End; // if not (gdSelected in State) Then
  End; // If Not DMComissaoVendedor.CDS_ComisVendedores.IsEmpty Then

end;

procedure TFrmComissaoVendedor.EdtCodDocComissaoChange(Sender: TObject);
begin
  DMComissaoVendedor.CDS_ComisVendedores.Close;
  Bt_SalvaComissao.Enabled:=False;

end;

procedure TFrmComissaoVendedor.Bt_SalvaComissaoClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_ComisVendedores.SetFocus;

  If DMComissaoVendedor.CDS_ComisVendedores.IsEmpty Then
   Exit;

  If msg('Deseja Realmente Salvar o'+cr+'Documento Listado ??','C')=2 Then
   Exit;

  // Apresentacao ==========================================================
  OdirPanApres.Caption:='AGUARDE !! Salvando Documento...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmComissaoVendedor.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmComissaoVendedor;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Application.ProcessMessages;

  // Aplicacoes Selecionadas ===================================================
  AplicacoesSelecionadas;

  // Numero do Proximo Docto ===================================================
  MySql:=' SELECT COALESCE(MAX(d.cod_aux) + 1, 1) NrDoc'+
         ' FROM TAB_AUXILIAR d'+
         ' WHERE d.tip_aux=17'; // Comissão Vendedores (DOCTOS GERADOS)
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;
  sNumDoc:=DMBelShop.CDS_Busca.FieldByName('NrDoc').AsString;
  DMBelShop.CDS_Busca.Close;

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

    // Grava Valores de Conversão e Numero do Docto ============================
    MySql:=' UPDATE FIN_VEND_COMISSAO_VENDAS cv'+
           ' SET cv.num_docto = '+QuotedStr(sNumDoc)+
           ', cv.vlr_conversao = (COALESCE((SELECT COALESCE(cp.fat_conversao, 0.00)'+
           '                                FROM fin_vend_comissao_prod cp'+
           '                                WHERE cp.cod_produto = cv.cod_produto), 0.00))'+
           ' WHERE cv.dta_docto between '+QuotedStr(sgDtaInicio)+' and '+QuotedStr(sgDtaFim)+
           ' AND   cv.cod_aplicacao in ('+sgAplicacoes+')'+
           ' AND   cv.num_docto = 0';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Grava  Numero e Periodo do Docto ========================================
    MySql:=' INSERT INTO TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1)'+
           ' VALUES ('+
           QuotedStr('17')+', '+    // TIP_AUX - Comissão Vendedores (DOCTOS GERADOS)
           QuotedStr(sNumDoc)+', '+ // COD_AUX  = Número do Documento Gerado
           QuotedStr(f_Troca('.','/',f_Troca('-','/',sgDtaInicio)))+', '+ // DES_AUX  = Data do Inicio do Período
           QuotedStr(f_Troca('.','/',f_Troca('-','/',sgDtaFim)))+')';    // DES_AUX1 = Data do Fim do Período
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;
    OdirPanApres.Visible:=False;

    EdtCodDocComissao.Value:=StrToInt(sNumDoc);
    EdtCodDocComissaoExit(Self);


    msg('Documento Número: '+sNumDoc+cr+cr+'Salvo com SUCESSO !!','A');
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
      OdirPanApres.Visible:=False;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

end;

procedure TFrmComissaoVendedor.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
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

procedure TFrmComissaoVendedor.Dbg_UltimaAtualizacaoEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_UltimaAtualizacaoEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmComissaoVendedor.Dbg_ComisVendedoresEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ComisVendedoresEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmComissaoVendedor.Dbg_AplicacaoEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_AplicacaoEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmComissaoVendedor.Bt_ClipboardClick(Sender: TObject);
begin

  If DMComissaoVendedor.CDS_ComisVendedores.IsEmpty Then
   Exit;

  Dbg_ComisVendedores.SetFocus;

  DBGridClipboard(Dbg_ComisVendedores);
end;

procedure TFrmComissaoVendedor.Dbg_ComisVendedoresExit(Sender: TObject);
begin
  {
   Usado em:
   Dbg_CampColecaoPessoasExit
   Dbg_CampColecaoCampExit
  }
  ApplicationEvents1.OnActivate:=nil;
  Application.OnMessage := nil;

end;

procedure TFrmComissaoVendedor.Rb_ComisVendSinteticoClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_ComisVendSintetico);
  AcertaRb_Style(Rb_ComisVendAnalitico);

  If DMComissaoVendedor.CDS_ComisVendedores.IsEmpty Then
   Exit;

  DMComissaoVendedor.CDS_ComisVendedores.Filtered:=False;
  DMComissaoVendedor.CDS_ComisVendedores.Filter:='';

  If Rb_ComisVendSintetico.Checked Then
  Begin
    DMComissaoVendedor.CDS_ComisVendedores.Filter:='TRIM(DES_VENDEDOR)=''CAMPANHA DE VENDAS'' OR TRIM(COD_VENDEDOR)=''TOTAL'' OR TRIM(COD_VENDEDOR)=''TOTAL DA LOJA''';
    DMComissaoVendedor.CDS_ComisVendedores.Filtered:=True;
  End;

  Dbg_ComisVendedores.SetFocus;

end;

procedure TFrmComissaoVendedor.Rb_ComisVendSinteticoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_ComisVendSinteticoClick(Self);

end;

procedure TFrmComissaoVendedor.PC_CampColecaoChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_CampColecao);

end;

procedure TFrmComissaoVendedor.Dbg_CampColecaoPessoasEnter(
  Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_CampColecaoPessoasEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmComissaoVendedor.Dbg_UltimaAtualizacaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquea TECLA Ctrl+Del ====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmComissaoVendedor.Dbg_ComisVendedoresKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Bloquea TECLA Ctrl+Del ====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmComissaoVendedor.Dbg_CampColecaoPessoasDrawColumnCell(Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Quando é Loja a Cor na Linha ==============================================
  if not (gdSelected in State) Then // Este comando altera cor da Linha
  Begin
    If Trim(DMComissaoVendedor.CDS_V_CampPessoasCARGO.AsString)='' Then
    Begin
      Dbg_CampColecaoPessoas.Canvas.Brush.Color:=clYellow;
      Dbg_CampColecaoPessoas.Canvas.Font.Style:=[fsBold];
    End;
  End; // if not (gdSelected in State) Then

  // Quando Percentual e Valor Igual a Zero Celular = Vermelha =================
  If ((Column.FieldName='PER_FAT') Or (Column.FieldName='VLR_UNID')) And (Trim(DMComissaoVendedor.CDS_V_CampPessoasCARGO.AsString)<>'') Then // Este comando altera cor da Celula
  Begin
    If (DMComissaoVendedor.CDS_V_CampPessoasPER_FAT.AsCurrency=0.00) And
       (DMComissaoVendedor.CDS_V_CampPessoasVLR_UNID.AsCurrency=0.00) Then
    Begin
      Dbg_CampColecaoPessoas.Canvas.Font.Style:=[fsBold];
      Dbg_CampColecaoPessoas.Canvas.Font.Color:=clWhite; // Cor da Fonte
      Dbg_CampColecaoPessoas.Canvas.Brush.Color:=clRed; // Cor da Celula
    End;
  End; // If (Column.FieldName='PER_FAT') Or (Column.FieldName='VLR_UNID') Then // Este comando altera cor da Celula

  Dbg_CampColecaoPessoas.Canvas.FillRect(Rect);
  Dbg_CampColecaoPessoas.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMComissaoVendedor.CDS_V_CampPessoasPER_FAT.Alignment:=taRightJustify;
  DMComissaoVendedor.CDS_V_CampPessoasVLR_UNID.Alignment:=taRightJustify;

end;

procedure TFrmComissaoVendedor.Dbg_CampColecaoPessoasDblClick(Sender: TObject);
begin
  If DMComissaoVendedor.CDS_V_CampPessoas.IsEmpty Then
   Exit;

  If DMComissaoVendedor.CDS_V_CampPessoasCOD_AUX.AsInteger<>0 Then
  Begin
    EdtCampColecaoPessCod.AsInteger:=DMComissaoVendedor.CDS_V_CampPessoasCOD_AUX.AsInteger;
    EdtCampColecaoPessNome.Text    :=DMComissaoVendedor.CDS_V_CampPessoasPESSOA.AsString;
    Cbx_CampColecaoPessCargo.ItemIndex:=Cbx_CampColecaoPessCargo.Items.IndexOf(Trim(DMComissaoVendedor.CDS_V_CampPessoasCARGO.AsString));

    EdtCampColecaoPessPerc.Value   :=DMComissaoVendedor.CDS_V_CampPessoasPER_FAT.AsCurrency;
    EdtCampColecaoPessVlr.Value    :=DMComissaoVendedor.CDS_V_CampPessoasVLR_UNID.AsCurrency;

    CampanhaComissaoHabilita(True);

    EdtCampColecaoPessNome.SetFocus;
  End; // If DMComissaoVendedor.CDS_V_CampPessoasCOD_AUX.AsInteger<>0 Then
end;

procedure TFrmComissaoVendedor.Bt_CampColecaoPessoasAbanClick(Sender: TObject);
Var
  i: Integer;
begin
  i:=EdtCampColecaoPessCod.AsInteger;

  CampanhaComissaoHabilita(False);

  DMComissaoVendedor.CDS_V_CampPessoas.Locate('COD_AUX',i,[]);

  Dbg_CampColecaoPessoas.SetFocus;

end;

procedure TFrmComissaoVendedor.Dbg_CampColecaoPessoasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
begin
  // Bloquea TECLA Ctrl+Del ====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  If DMComissaoVendedor.CDS_V_CampPessoas.IsEmpty Then
   Exit;

  // Localiza Pessoa ===========================================================
  If Key=VK_F4 Then
  Begin
    i:=DMComissaoVendedor.CDS_V_CampPessoas.RecNo;

    s:='';
    If InputQuery('Localizar Pessoa','',s) then
    Begin
      if Trim(s)<>'' then
      Begin
        s:=AnsiUpperCase(s);
        bgAfterScroll:=False;
        If Not LocalizaRegistro(DMComissaoVendedor.CDS_V_CampPessoas, 'PESSOA', s) Then
        Begin
          DMComissaoVendedor.CDS_V_CampPessoas.RecNo:=i;
          msg('Pessoa Não Encontrada !!','A');
        End;
        bgAfterScroll:=True;
        DMComissaoVendedor.CDS_V_CampPessoasAfterScroll(DMComissaoVendedor.CDS_V_CampPessoas);
      End; // if Trim(s)<>'' then
    End; // If InputQuery('Localizar Pessoa','',s) then
  End; // If Key=VK_F4 Then

end;

procedure TFrmComissaoVendedor.Dbg_CampColecaoCampKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Bloquea TECLA Ctrl+Del ====================================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmComissaoVendedor.Bt_CampColecaoPessoasIncClick(Sender: TObject);
Var
  b: Boolean;
  MySql: String;
  iCodLoja, iMinLoja, iMaxLoja: Integer;
begin
  {
   Usado em:
   Bt_CampColecaoPessoasAlt
  }

  // Incluir Pessoa ==========================================================
  If (Sender as TJvXPButton).Name='Bt_CampColecaoPessoasInc' Then
  Begin
    If Not CampanhaComissaoConsiste('P') Then
     Exit;

    // Solicita Empresas =====================================================
    FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
    FrmSelectEmpProcessamento.bUsarMatriz:=False;

    FrmSelectEmpProcessamento.Bt_SelectEmpProcMarcaTodos.Visible:=False;
    FrmSelectEmpProcessamento.Bt_SelectEmpProcDesMarcaTodos.Visible:=False;

    While b do
    Begin
      FrmSelectEmpProcessamento.ShowModal;

      // Somente uma Loja ====================================================
      If FrmSelectEmpProcessamento.iNrEmpProc<>1 Then
       msg('Selecione uma Loja !!','A')
      Else
      b:=False;
    End; // While b do
    FreeAndNil(FrmSelectEmpProcessamento);

    // Busca Loja Selecionada ================================================
    DMBelShop.CDS_EmpProcessa.First;
    While Not DMBelShop.CDS_EmpProcessa.Eof do
    Begin
      If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
      Begin
        iCodLoja:=DMBelShop.CDS_EmpProcessaCOD_LINX.AsInteger;
        Break;
      End; // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

      DMBelShop.CDS_EmpProcessa.Next;
    End; // While Not DMBelShop.CDS_EmpProcessa.Eof do
    DMBelShop.CDS_EmpProcessa.Close;

    // Busca o Proximo Código da Loja da Pessoa ==============================
    // - COD_AUX  = Código da Loja + Codigo da Função:
    //           01 a 30 - Gerente    = Exemplo Loja 15 = 1501, 1502, ... 1530
    //           31 a 60 - Supervidor = Exemplo Loja 15 = 1531, 1532, ... 1560
    //           61 a 99 - Assistente = Exemplo Loja 15 = 1561, 1562, ... 1599
    If Cbx_CampColecaoPessCargo.Text='GERENTE' Then
    Begin
      iMinLoja:=1;
      iMaxLoja:=30;
    End;

    If Cbx_CampColecaoPessCargo.Text='SUPERVISOR' Then
    Begin
      iMinLoja:=31;
      iMaxLoja:=60;
    End;

    If Cbx_CampColecaoPessCargo.Text='ASSISTENTE' Then
    Begin
      iMinLoja:=61;
      iMaxLoja:=99;
    End;

    // Busca o Proximo Código da Loja da Pessoa ==============================
    MySql:=' SELECT COALESCE(MAX(t.cod_aux)+1 ,('+IntToStr(iCodLoja)+'*100)+1) CODIGO'+
           ' FROM TAB_AUXILIAR t'+
           ' WHERE t.tip_aux=27'+ // 27 => CALCULO DE COMISSÃO SOBRE CAMPANHAS sobre Venda LinxProduto.Id_Colecao
           ' AND   t.cod_aux BETWEEN ('+IntToStr(iCodLoja)+'*100)+'+IntToStr(iMinLoja)+' AND ('+
                                        IntToStr(iCodLoja)+'*100)+'+IntToStr(iMaxLoja);
    DMBelShop.SQLQuery3.Close;
    DMBelShop.SQLQuery3.SQL.Clear;
    DMBelShop.SQLQuery3.SQL.Add(MySql);
    DMBelShop.SQLQuery3.Open;
    EdtCampColecaoPessCod.AsInteger:=DMBelShop.SQLQuery3.FieldByName('Codigo').AsInteger;
    DMBelShop.SQLQuery3.Close;
  End;

  CampanhaComissaoDML('UI', 'P');

  Bt_CampColecaoPessoasAbanClick(Self);
end;

procedure TFrmComissaoVendedor.Bt_CampColecaoPessoasExcClick(Sender: TObject);
begin
  If msg('Deseja Realmente Excluir a'+cr+cr+'Pessoa Selecionada no Grid ??', 'C')=2 Then
   Exit;

  CampanhaComissaoDML('EX','P');
  Bt_CampColecaoPessoasAbanClick(Self);
end;

procedure TFrmComissaoVendedor.Dbg_CampColecaoCampEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_CampColecaoCampEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmComissaoVendedor.Dbg_CampColecaoCampDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  // Quando Percentual e Valor Igual a Zero Celular = Vermelha =================
  If ((Column.FieldName='PER_FAT') Or (Column.FieldName='VLR_UNID')) And (Trim(DMComissaoVendedor.CDS_V_CampPessoasCARGO.AsString)<>'') Then // Este comando altera cor da Celula
  Begin
    If (DMComissaoVendedor.CDS_CampCampanhasPER_FAT.AsCurrency=0.00) And
       (DMComissaoVendedor.CDS_CampCampanhasVLR_UNID.AsCurrency=0.00) Then
    Begin
      Dbg_CampColecaoCamp.Canvas.Font.Style:=[fsBold];
      Dbg_CampColecaoCamp.Canvas.Font.Color:=clWhite; // Cor da Fonte
      Dbg_CampColecaoCamp.Canvas.Brush.Color:=clRed; // Cor da Celula
    End;
  End; // If (Column.FieldName='PER_FAT') Or (Column.FieldName='VLR_UNID') Then // Este comando altera cor da Celula

  Dbg_CampColecaoCamp.Canvas.FillRect(Rect);
  Dbg_CampColecaoCamp.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMComissaoVendedor.CDS_CampCampanhasCOD_CAMPANHA.Alignment:=taRightJustify;
  DMComissaoVendedor.CDS_CampCampanhasPER_FAT.Alignment:=taRightJustify;
  DMComissaoVendedor.CDS_CampCampanhasVLR_UNID.Alignment:=taRightJustify;

end;

procedure TFrmComissaoVendedor.Dbg_CampColecaoCampDblClick(Sender: TObject);
begin
  If DMComissaoVendedor.CDS_CampCampanhas.IsEmpty Then
   Exit;

  EdtCampColecaoCampNome.Text :=DMComissaoVendedor.CDS_CampCampanhasDES_CAMPANHA.AsString;
  EdtCampColecaoCampPerc.Value:=DMComissaoVendedor.CDS_CampCampanhasPER_FAT.AsCurrency;
  EdtCampColecaoCampVlr.Value :=DMComissaoVendedor.CDS_CampCampanhasVLR_UNID.AsCurrency;

end;

procedure TFrmComissaoVendedor.Bt_CampColecaoCampAbanClick(Sender: TObject);
Var
  i: Integer;
begin
  i:=DMComissaoVendedor.CDS_CampCampanhasCOD_CAMPANHA.AsInteger

  CampanhaComissaoTabelas('C');

  DMComissaoVendedor.CDS_CampCampanhas.Locate('COD_CAMPANHA',i,[]);

  Dbg_CampColecaoCamp.SetFocus;

end;

end.
