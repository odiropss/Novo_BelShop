unit UFrmPedidoVenda;

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
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar, Grids,
  DBGrids, StdCtrls, ExtCtrls, DBCtrls, JvExControls, JvXPCore,
  JvXPButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Mask,
  Commctrl, // SHOW HINT EM FORMA DE BALÃO
  ToolEdit, CurrEdit, DBXpress;

type
  TFrmPedidoVenda = class(TForm)
    Gb_Principal: TGroupBox;
    Pan_Docto: TPanel;
    Gb_VlrTotal: TGroupBox;
    EdtVlrTotal: TCurrencyEdit;
    Gb_VlrDescontos: TGroupBox;
    EdtVlrDescontos: TCurrencyEdit;
    Gb_NumDocto: TGroupBox;
    EdtNumDocto: TCurrencyEdit;
    Gb_DtaDocto: TGroupBox;
    DtEdt_DtaDocto: TcxDateEdit;
    Gb_Pessoa: TGroupBox;
    EdtDesPessoa: TEdit;
    EdtCodPessoa: TCurrencyEdit;
    Bt_BuscaPessoa: TJvXPButton;
    Bt_NovaPessoa: TJvXPButton;
    EdtNumSeqDocto: TCurrencyEdit;
    Dbe_VlrTotalCalculado: TDBEdit;
    Gb_VlrTotalCalculado: TGroupBox;
    EdtVlrTotalCalculado: TCurrencyEdit;
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    Bt_Salvar: TJvXPButton;
    Bt_Abandonar: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    Rb_Produtos: TRadioGroup;
    Pan_Produto: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    EdtSeqProduto: TCurrencyEdit;
    EdtCodProduto: TCurrencyEdit;
    EdtDesProduto: TEdit;
    EdtQtdProduto: TCurrencyEdit;
    EdtVlrUnitProduto: TCurrencyEdit;
    EdtVlrTotalProduto: TCurrencyEdit;
    Bt_IncluiProduto: TJvXPButton;
    Bt_ExcluiProduto: TJvXPButton;
    Bt_AbandonarProduto: TJvXPButton;
    EdtVlrDescProduto: TCurrencyEdit;
    Dbg_Produtos: TDBGrid;
    OdirPanApres: TPanel;
    StB_Movtos: TdxStatusBar;
    Gb_VlrProdutos: TGroupBox;
    EdtVlrProdutos: TCurrencyEdit;
    Dbe_VlrTotalDesconto: TDBEdit;

    // Odir ====================================================================

    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl);

    Procedure HabilitaDocto(bHabilita: Boolean);
    Procedure HabilitaBotoes(bHabilita: Boolean);
    Procedure LimpaDocto;
    Procedure LimpaProduto(bCodigo: Boolean = True);

    Procedure ProdutoLocaliza;

    Procedure PedidoIncluirExcluir(sDML: String);
                                   // sDML: (I)Inclusão
                                   //       (E)Exclusão

    Procedure CalculaRateiroDescontos;

    // Odir ====================================================================

    procedure Bt_FecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EdtCodPessoaChange(Sender: TObject);
    procedure EdtCodPessoaExit(Sender: TObject);
    procedure EdtCodPessoaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_BuscaPessoaClick(Sender: TObject);
    procedure Bt_NovaPessoaClick(Sender: TObject);
    procedure EdtNumDoctoExit(Sender: TObject);
    procedure EdtCodProdutoEnter(Sender: TObject);
    procedure EdtCodProdutoExit(Sender: TObject);
    procedure EdtCodProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQtdProdutoEnter(Sender: TObject);
    procedure EdtVlrDescProdutoExit(Sender: TObject);
    procedure EdtVlrTotalProdutoEnter(Sender: TObject);
    procedure Bt_IncluiProdutoClick(Sender: TObject);
    procedure Bt_IncluiProdutoEnter(Sender: TObject);
    procedure Bt_ExcluiProdutoEnter(Sender: TObject);
    procedure Bt_ExcluiProdutoClick(Sender: TObject);
    procedure Bt_AbandonarProdutoClick(Sender: TObject);
    procedure Bt_AbandonarProdutoEnter(Sender: TObject);
    procedure Bt_SalvarClick(Sender: TObject);
    procedure EdtVlrProdutosEnter(Sender: TObject);
    procedure Bt_AbandonarClick(Sender: TObject);
    procedure Dbe_VlrTotalCalculadoChange(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    { Public declarations }
    sgOrigem: String; // Origem do Documento
                      //   (M) Documento de Entrada/Saída de Matéria-Prima
                      //   (P) Pedido Venda de Produto
  end;

const
  // Show Hint em Forma de Balão
  TTS_BALLOON = $40;
  TTM_SETTITLE = (WM_USER + 32);
  //////////////////////////////

var
  FrmPedidoVenda: TFrmPedidoVenda;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  TD: TTransactionDesc;

  bgSairMovtos,
  bgProdIncluir,
  bgProdAlterar: Boolean;

  sgMensagem:String;

implementation

uses UDMArtesanalis, UPesquisa, DK_Procs1, UFrmPessoaCadastro, DB, Math;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Calcula Rateio de Descontos nos Produtos do Pedido >>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPedidoVenda.CalculaRateiroDescontos;
Var
  iSeqProdMaiorVlr: Integer;
  cTotalProduto: Currency;
  cMaiorDesconto, cPerDesconto, cVlrDesconto: Currency;
Begin
  If DMArtesanalis.CDS_V_DoctoItens.IsEmpty Then
   Exit;

  // Retira Rateio de Descontos ================================================
  If EdtVlrDescontos.Value=0 Then
  Begin
    DMArtesanalis.CDS_V_DoctoItens.First;
    DMArtesanalis.CDS_V_DoctoItens.DisableControls;
    While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
    Begin
      cTotalProduto:=DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsCurrency*
                     DMArtesanalis.CDS_V_DoctoItensVLR_UNITARIO.AsCurrency;

      DMArtesanalis.CDS_V_DoctoItens.Edit;
      DMArtesanalis.CDS_V_DoctoItensVLR_DESCONTO.AsCurrency:=0.00;
      DMArtesanalis.CDS_V_DoctoItensVLR_TOTAL.AsCurrency:=cTotalProduto;
      DMArtesanalis.CDS_V_DoctoItens.Post;

      DMArtesanalis.CDS_V_DoctoItens.Next;
    End; // While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
    DMArtesanalis.CDS_V_DoctoItens.First;
    DMArtesanalis.CDS_V_DoctoItens.EnableControls;

    Exit;
  End; // If EdtVlrDescontos.Value<>0 Then

  // Calcula Rateio de Descontos ===============================================
  iSeqProdMaiorVlr:=0;
  cMaiorDesconto:=0;

  DMArtesanalis.CDS_V_DoctoItens.DisableControls;
  DMArtesanalis.CDS_V_DoctoItens.First;
  While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
  Begin
    cTotalProduto:=DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsCurrency*
                   DMArtesanalis.CDS_V_DoctoItensVLR_UNITARIO.AsCurrency;

    cPerDesconto:=RoundTo(((cTotalProduto * 100 )/ EdtVlrProdutos.Value),-2);
    cVlrDesconto:=RoundTo(((EdtVlrDescontos.Value*cPerDesconto)/100),-2);

    If cMaiorDesconto<cVlrDesconto Then
    Begin
      iSeqProdMaiorVlr:=DMArtesanalis.CDS_V_DoctoItensNUM_SEQ.AsInteger;
      cMaiorDesconto:=cVlrDesconto;
    End;

    DMArtesanalis.CDS_V_DoctoItens.Edit;
    DMArtesanalis.CDS_V_DoctoItensVLR_DESCONTO.AsCurrency:=cVlrDesconto;
    DMArtesanalis.CDS_V_DoctoItensVLR_TOTAL.AsCurrency:=cTotalProduto-cVlrDesconto;
    DMArtesanalis.CDS_V_DoctoItens.Post;

    DMArtesanalis.CDS_V_DoctoItens.Next;
  End; // While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
  DMArtesanalis.CDS_V_DoctoItens.First;
  DMArtesanalis.CDS_V_DoctoItens.EnableControls;

  // Acerta Residuo de Desconto ==============================================
  cVlrDesconto:=StrToCurr(Dbe_VlrTotalDesconto.Text);
  cVlrDesconto:=EdtVlrDescontos.Value-cVlrDesconto;
  If cVlrDesconto<>0 Then
  Begin
    DMArtesanalis.CDS_V_DoctoItens.Locate('NUM_SEQ', iSeqProdMaiorVlr,[]);

    cTotalProduto:=DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsCurrency*
                   DMArtesanalis.CDS_V_DoctoItensVLR_UNITARIO.AsCurrency;

    DMArtesanalis.CDS_V_DoctoItens.Edit;
    DMArtesanalis.CDS_V_DoctoItensVLR_DESCONTO.AsCurrency:=DMArtesanalis.CDS_V_DoctoItensVLR_DESCONTO.AsCurrency+
                                                           cVlrDesconto;
    DMArtesanalis.CDS_V_DoctoItensVLR_TOTAL.AsCurrency:=cTotalProduto-
                                                        DMArtesanalis.CDS_V_DoctoItensVLR_DESCONTO.AsCurrency;
    DMArtesanalis.CDS_V_DoctoItens.Post;
  End; // If cVlrDesconto>0 Then
End; // Calcula Rateio de Descontos nos Produtos do Pedido >>>>>>>>>>>>>>>>>>>>>

// Inclusão/Exclusão do Pedido >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPedidoVenda.PedidoIncluirExcluir(sDML: String);
Var
  MySql: String;
  sTipoDocto, sQtdSaldo,
  sQtdUni_MP,sQtdBxEst_MP, sVlrTot_MP: String;
Begin

  // sDML: (I)Inclusão
  //       (E)Exclusão

  If sDML='I' Then  OdirPanApres.Caption:='AGUARDE !! Efetuando a Inclusão do Pedido !!';
  If sDML='E' Then  OdirPanApres.Caption:='AGUARDE !! Efetuando a Exclusão do Pedido !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmPedidoVenda.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmPedidoVenda.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmPedidoVenda;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica se Transação esta Ativa
  If DMArtesanalis.SQLC.InTransaction Then
   DMArtesanalis.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMArtesanalis.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    //==========================================================================
    // Exclusão do Pedido ======================================================
    //==========================================================================
    If sDML='E' Then
    Begin
      // Retorna Quantidade da Matéria-Prima Utilizada =========================
      MySql:=' SELECT pm.cod_materiaprima, pm.qtd_baixa_est_mp'+
             ' FROM DOCTOS_ITENS_MP pm'+
             ' WHERE pm.num_seq_docto='+IntToStr(EdtNumSeqDocto.AsInteger);
      DMArtesanalis.CDS_BuscaRapida.Close;
      DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
      DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
      DMArtesanalis.CDS_BuscaRapida.Open;

      DMArtesanalis.CDS_BuscaRapida.DisableControls;
      While Not DMArtesanalis.CDS_BuscaRapida.Eof do
      Begin
        sQtdSaldo:=f_Troca(',','.',DMArtesanalis.CDS_BuscaRapida.FieldByName('qtd_baixa_est_mp').AsString);
        MySql:=' UPDATE MATERIAPRIMA m'+
               ' SET m.qtd_estoque=m.qtd_estoque+'+sQtdSaldo+
               ' WHERE m.cod_materiaprima='+DMArtesanalis.CDS_BuscaRapida.FieldByName('cod_materiaprima').AsString;
        DMArtesanalis.SQLC.Execute(MySql,nil,nil);

        DMArtesanalis.CDS_BuscaRapida.Next;
      End; // While Not DMArtesanalis.CDS_BuscaRapida.Eof do
      DMArtesanalis.CDS_BuscaRapida.EnableControls;
      DMArtesanalis.CDS_BuscaRapida.Close;

      // Exclui Materias-Primas Utilizadas no Pedido ===========================
      MySql:=' DELETE FROM DOCTOS_ITENS_MP pm'+
             ' WHERE pm.num_seq_docto='+IntToStr(EdtNumSeqDocto.AsInteger);
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);

      // Exclui Produtos =======================================================
      MySql:=' DELETE FROM DOCTOS_ITENS i'+
             ' WHERE i.num_seq_docto='+IntToStr(EdtNumSeqDocto.AsInteger);
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);

      // Exclui Pedido ======================================================
      MySql:=' DELETE FROM DOCTOS d'+
             ' WHERE d.num_seq_docto='+IntToStr(EdtNumSeqDocto.AsInteger);
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);

      // Atualiza Produtos =====================================================
      DMArtesanalis.CDS_V_DoctoItens.DisableControls;
      DMArtesanalis.CDS_V_DoctoItens.First;
      While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
      Begin
        // Atualiza Saldo/Preco_Custo do Produto ===============================
        sQtdSaldo:=f_Troca(',','.',DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsString);
        sQtdSaldo:='-'+sQtdSaldo;

        MySql:=' UPDATE PRODUTO p'+
               ' SET p.qtd_estoque=p.qtd_estoque-'+sQtdSaldo+
               ' WHERE p.cod_produto='+DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString;
        DMArtesanalis.SQLC.Execute(MySql,nil,nil);

        DMArtesanalis.CDS_V_DoctoItens.Next;
      End; // While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
      DMArtesanalis.CDS_V_DoctoItens.First;
      DMArtesanalis.CDS_V_DoctoItens.EnableControls;
    End; // If sDML='E' Then
    // Exclusão do Pedido ======================================================

    //==========================================================================
    // Inclusão do Pedido =====================================================
    //==========================================================================
    If sDML='I' Then
    Begin
      // Num_Seq do Pedido =====================================================
      MySql:=' SELECT GEN_ID(GEN_DOCTOS_ID,1) Num_Seq'+
             ' FROM RDB$DATABASE';
      DMArtesanalis.CDS_BuscaRapida.Close;
      DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
      DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
      DMArtesanalis.CDS_BuscaRapida.Open;
      EdtNumSeqDocto.AsInteger:=DMArtesanalis.CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
      DMArtesanalis.CDS_BuscaRapida.Close;

      // Insere Pedido =========================================================
      sTipoDocto:='P';
      MySql:=' INSERT INTO DOCTOS'+
             ' (ORIGEM, NUM_SEQ_DOCTO, TIPO, NUM_DOCTO, NUM_SERIE, DTA_DOCTO, DTA_LANCAMENTO,'+
             '  COD_PESSOA, DES_PESSOA, VLR_PRODUTOS, VLR_DESCONTO, VLR_TOTAL)'+
             ' VALUES ('+
             QuotedStr(sgOrigem)+', '+ // ORIGEM - Pedido de Venda
             IntToStr(EdtNumSeqDocto.AsInteger)+', '+ // NUM_SEQ_DOCTO
             QuotedStr(sTipoDocto)+', '+ // Tipo do Documento (P)edido
             IntToStr(EdtNumDocto.AsInteger)+', '+ // NUM_DOCTO
             'NULL , '+ // NUM_SERIE
             QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaDocto.Date))))+', '+ // DTA_DOCTO
             ' current_date, '+ // DTA_LANCAMENTO
             IntToStr(EdtCodPessoa.AsInteger)+', '+ // COD_PESSOA
             QuotedStr(EdtDesPessoa.Text)+', '+ // DES_PESSOA
             QuotedStr(f_Troca(',','.',VarToStr(EdtVlrProdutos.Value)))+', '+ // VLR_PRODUTOS
             QuotedStr(f_Troca(',','.',VarToStr(EdtVlrDescontos.Value)))+', '+ // VLR_DESCONTO
             QuotedStr(f_Troca(',','.',VarToStr(EdtVlrTotal.Value)))+')'; // VLR_TOTAL
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);

      // Inclusão dos Produtos =================================================
      DMArtesanalis.CDS_V_DoctoItens.DisableControls;
      DMArtesanalis.CDS_V_DoctoItens.First;
      While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
      Begin
         MySql:=' INSERT INTO DOCTOS_ITENS'+
                ' (NUM_SEQ_DOCTO, NUM_SEQ, COD_PRODUTO, DES_PRODUTO, QTD_MOVTO,'+
                ' VLR_UNITARIO, VLR_DESCONTO, VLR_TOTAL)'+
                ' VALUES ('+
                EdtNumSeqDocto.Text+', '+ // NUM_SEQ_DOCTO
                DMArtesanalis.CDS_V_DoctoItensNUM_SEQ.AsString+', '+ // NUM_SEQ
                DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString+', '+ // COD_PRODUTO
                QuotedStr(DMArtesanalis.CDS_V_DoctoItensDES_PRODUTO.AsString)+', '+ // DES_PRODUTO
                QuotedStr(DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsString)+', '+ // QTD_MOVTO
                QuotedStr(DMArtesanalis.CDS_V_DoctoItensVLR_UNITARIO.AsString)+', '+ // VLR_UNITARIO
                QuotedStr(DMArtesanalis.CDS_V_DoctoItensVLR_DESCONTO.AsString)+', '+ // VLR_DESCONTO
                QuotedStr(DMArtesanalis.CDS_V_DoctoItensVLR_TOTAL.AsString)+')'; // VLR_TOTAL
        DMArtesanalis.SQLC.Execute(MySql,nil,nil);

        // Atualiza Saldo/Preco_Custo do Produto ===============================
        sQtdSaldo:=f_Troca(',','.',DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsString);
        MySql:=' UPDATE PRODUTO p'+
               ' SET p.qtd_estoque=p.qtd_estoque+'+sQtdSaldo+
               ' WHERE p.cod_produto='+DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString;
        DMArtesanalis.SQLC.Execute(MySql,nil,nil);

        // Insere Quantidade da Matéria-Prima Utilizada no Produto do Pedido ===
        MySql:=' SELECT pd.cod_materiaprima, pd.per_utilizacao, pd.preco_custo'+
               ' FROM PRODUCAO pd'+
               ' WHERE pd.cod_produto='+DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString;
        DMArtesanalis.CDS_Busca.Close;
        DMArtesanalis.SQLQ_Busca.SQL.Clear;
        DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
        DMArtesanalis.CDS_Busca.Open;

        DMArtesanalis.CDS_Busca.DisableControls;
        While Not DMArtesanalis.CDS_Busca.Eof do
        Begin
          sQtdUni_MP  :=CurrToStr(RoundTo((DMArtesanalis.CDS_Busca.FieldByName('per_utilizacao').AsCurrency / 100),-4));
          sQtdBxEst_MP:=CurrToStr(RoundTo((DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsCurrency*StrToCurr(sQtdUni_MP)),-4));
          sVlrTot_MP  :=CurrToStr(RoundTo((DMArtesanalis.CDS_Busca.FieldByName('preco_custo').AsCurrency*StrToCurr(sQtdBxEst_MP)),-2));

          MySql:=' INSERT INTO DOCTOS_ITENS_MP'+
                 ' (NUM_SEQ_DOCTO, NUM_SEQ, COD_PRODUTO, COD_MATERIAPRIMA,'+
                 '  PER_UTILIZADO_MP, QTD_UNID_UTILIZADA_MP, QTD_BAIXA_EST_MP,'+
                 '  VLR_UNITARIO_MP, VLR_TOTAL_MP)'+
                 ' VALUES ('+
                 EdtNumSeqDocto.Text+', '+ // NUM_SEQ_DOCTO
                 DMArtesanalis.CDS_V_DoctoItensNUM_SEQ.AsString+', '+ // NUM_SEQ
                 DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString+', '+ // COD_PRODUTO
                 DMArtesanalis.CDS_Busca.FieldByName('cod_materiaPrima').AsString+', '+ // COD_MATERIAPRIMA
                 DMArtesanalis.CDS_Busca.FieldByName('per_utilizacao').AsString+', '+ // PER_UTILIZADO_MP
                 QuotedStr(f_Troca(',','.',sQtdUni_MP))+', '+ // QTD_UNID_UTILIZADA_MP
                 QuotedStr(f_Troca(',','.',sQtdBxEst_MP))+', '+ // QTD_BAIXA_EST_MP
                 DMArtesanalis.CDS_Busca.FieldByName('preco_custo').AsString+', '+ // VLR_UNITARIO_MP
                 QuotedStr(f_Troca(',','.',sVlrTot_MP))+')'; // VLR_TOTAL_MP
          DMArtesanalis.SQLC.Execute(MySql,nil,nil);

          // Atualiza Saldo da Matéria-Prima Utilizada no Produto do Pedido ====
          MySql:=' UPDATE MATERIAPRIMA mp'+
                 ' SET mp.qtd_estoque=mp.qtd_estoque-'+f_Troca(',','.',sQtdBxEst_MP)+
                 ' WHERE mp.cod_materiaprima='+DMArtesanalis.CDS_Busca.FieldByName('cod_materiaPrima').AsString;
          DMArtesanalis.SQLC.Execute(MySql,nil,nil);

          DMArtesanalis.CDS_Busca.Next;
        End; // While Not DMArtesanalis.CDS_Busca.Eof do
        DMArtesanalis.CDS_Busca.EnableControls;
        DMArtesanalis.CDS_Busca.Close;

        DMArtesanalis.CDS_V_DoctoItens.Next;
      End; // While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
      DMArtesanalis.CDS_V_DoctoItens.First;
      DMArtesanalis.CDS_V_DoctoItens.EnableControls;
    End; // If sDML='I' Then // Inclusão do Pedido
    // Inclusão do Pedido ======================================================

    // Atualiza Transacao ======================================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

    // Reapresenta Pedido ======================================================
    If sDML='I' Then
    Begin
      msg('Pedido INCLUÍDO com SUCESSO !!','A');
      EdtNumDoctoExit(Self);
      Exit;
    End;

    If sDML='E' Then
    Begin
      msg('Pedido EXCLUÍDO com SUCESSO !!','A');
      Bt_AbandonarClick(Self);
      Exit;
    End;

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMArtesanalis.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);

      Dbg_Produtos.SetFocus;

      Exit;
    End; // on e : Exception do
  End; // Try da Transação

End; // Inclusão/Exclusão do Pedido >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Localiza/Inclui Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPedidoVenda.ProdutoLocaliza;
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.des_produto,  p.cod_produto Codigo'+
         ' FROM PRODUTO p'+
         ' Order by 1';
  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMArtesanalis.CDS_Pesquisa.FieldByName('Codigo').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Pesquisa.Close;
    msg('Sem Produto a Listar !!','A');
    EdtCodProduto.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_produto';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Des_produto';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtCodProduto.AsInteger:=StrToInt(FrmPesquisa.EdtCodigo.Text);
    EdtCodProdutoExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
End; // Localiza/Inclui Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita Dados do Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPedidoVenda.HabilitaDocto(bHabilita: Boolean);
Var
  i: Integer;
Begin

  For i:=0 to FrmPedidoVenda.ComponentCount-1 do
  Begin
    If FrmPedidoVenda.Components[i] is TEdit Then
     (FrmPedidoVenda.Components[i] as TEdit).Enabled:=bHabilita;

    If FrmPedidoVenda.Components[i] is TCurrencyEdit Then
     (FrmPedidoVenda.Components[i] as TCurrencyEdit).Enabled:=bHabilita;

    If FrmPedidoVenda.Components[i] is TcxDateEdit Then
     (FrmPedidoVenda.Components[i] as TcxDateEdit).Enabled:=bHabilita;

    If FrmPedidoVenda.Components[i] is TComboBox Then
     (FrmPedidoVenda.Components[i] as TComboBox).Enabled:=bHabilita;
  End; // For i:=0 to FrmPedidoVenda.ComponentCount-1 do

  EdtSeqProduto.Enabled:=False;
End; // Habilita Dados do Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita Botoes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPedidoVenda.HabilitaBotoes(bHabilita: Boolean);
Begin
  Bt_Salvar.Enabled   :=bHabilita;
  Bt_Abandonar.Enabled:=Not bHabilita;
  Bt_Excluir.Enabled  :=bHabilita;

  Bt_BuscaPessoa.Enabled:=bHabilita;
  Bt_NovaPessoa.Enabled :=bHabilita;

  Bt_IncluiProduto.Enabled   :=bHabilita;
  Bt_ExcluiProduto.Enabled   :=bHabilita;
  Bt_AbandonarProduto.Enabled:=bHabilita;

End; // Habilita Botoes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Todo o Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPedidoVenda.LimpaDocto;
Var
  i: Integer;
Begin

  For i:=0 to FrmPedidoVenda.ComponentCount-1 do
  Begin
    If FrmPedidoVenda.Components[i] is TEdit Then
     (FrmPedidoVenda.Components[i] as TEdit).Clear;

    If FrmPedidoVenda.Components[i] is TCurrencyEdit Then
     (FrmPedidoVenda.Components[i] as TCurrencyEdit).Value:=0;

    If FrmPedidoVenda.Components[i] is TcxDateEdit Then
     (FrmPedidoVenda.Components[i] as TcxDateEdit).Clear;
  End; // For i:=0 to FrmPedidoVenda.ComponentCount-1 do

end; // Limpa Todo o Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Somente Digitação do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPedidoVenda.LimpaProduto(bCodigo: Boolean = True);
Begin

  If bCodigo Then
  Begin
    EdtCodProduto.Value:=0;
    EdtSeqProduto.Value:=0;
  End;

  EdtDesProduto.Clear;
  EdtQtdProduto.Value:=0;
  EdtVlrUnitProduto.Value:=0;
  EdtVlrDescProduto.Value:=0;
  EdtVlrTotalProduto.Value:=0;

  bgProdAlterar:=False;
End; // Limpa Somente Digitação do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmPedidoVenda.CreateToolTips(hWnd: Cardinal);
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
Procedure TFrmPedidoVenda.FocoToControl(Sender: TControl);
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
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmPedidoVenda.Bt_FecharClick(Sender: TObject);
begin
  Dbg_Produtos.SetFocus;

  If DMArtesanalis.CDS_V_DoctoItens.Active Then
   DMArtesanalis.CDS_V_DoctoItens.Close;

  bgSairMovtos:=True;

  Close;

end;

procedure TFrmPedidoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Not bgSairMovtos Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Botão <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('PRODUTO - Pedido de Vendas');

end;

procedure TFrmPedidoVenda.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Balão
  CreateToolTips(Self.Handle);
  AddToolTip(EdtCodProduto.Handle, @ti, TipoDoIcone, 'Localizar/Incluir! Tecle <F9>', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Salvar.Handle, @ti, TipoDoIcone, 'Incluir/Alterar', 'PEDIDO DE VENDA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Abandonar.Handle, @ti, TipoDoIcone, 'Abandonar', 'PEDIDO DE VENDA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Excluir.Handle, @ti, TipoDoIcone, 'Excluir', 'PEDIDO DE VENDA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Fechar.Handle, @ti, TipoDoIcone, 'Fechar', 'PEDIDO DE VENDA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaPessoa.Handle, @ti, TipoDoIcone, 'Localizar', 'PESSOA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NovaPessoa.Handle, @ti, TipoDoIcone, 'Incluir', 'PESSOA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_IncluiProduto.Handle, @ti, TipoDoIcone, 'Incluir', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ExcluiProduto.Handle, @ti, TipoDoIcone, 'Excluir', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_AbandonarProduto.Handle, @ti, TipoDoIcone, 'Abandonar Seleção', 'PRODUTO');

  // Limpa Tela ================================================================
  LimpaDocto;
  LimpaProduto();
  HabilitaBotoes(False);
end;

procedure TFrmPedidoVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmPedidoVenda.FormShow(Sender: TObject);
begin
  bgSairMovtos:=False;

  LimpaDocto;
  LimpaProduto();

  HabilitaBotoes(False);
  HabilitaDocto(False);

  EdtCodPessoa.Enabled:=True;
  Bt_BuscaPessoa.Enabled:=True;
  Bt_NovaPessoa.Enabled:=True;

  EdtNumDocto.Enabled:=True;

  // Incicializa Produtos ======================================================
  If DMArtesanalis.CDS_V_DoctoItens.Active Then
   DMArtesanalis.CDS_V_DoctoItens.Close;

  DMArtesanalis.CDS_V_DoctoItens.CreateDataSet;
  DMArtesanalis.CDS_V_DoctoItens.Open;

  EdtCodPessoa.SetFocus;

end;

procedure TFrmPedidoVenda.EdtCodPessoaChange(Sender: TObject);
begin
  // Incicializa Produtos ======================================================
  If DMArtesanalis.CDS_V_DoctoItens.Active Then
   DMArtesanalis.CDS_V_DoctoItens.Close;

  DMArtesanalis.CDS_V_DoctoItens.CreateDataSet;
  DMArtesanalis.CDS_V_DoctoItens.Open;

end;

procedure TFrmPedidoVenda.EdtCodPessoaExit(Sender: TObject);
Var
  MySql: String;
begin
  bgProdAlterar:=False;

  If EdtCodPessoa.asInteger=0 Then
   Exit;

  Screen.Cursor:=crAppStart;

  EdtDesPessoa.Clear;

  MySql:=' SELECT p.des_pessoa nome, Tipo'+
         ' FROM PESSOAS p'+
         ' WHERE p.Tipo in (''A'', ''C'')'+
         ' AND p.cod_pessoa='+IntToStr(EdtCodPessoa.AsInteger);
  DMArtesanalis.CDS_BuscaRapida.Close;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMArtesanalis.CDS_BuscaRapida.Open;

  If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Nome').AsString)='' Then
  Begin
    Screen.Cursor:=crDefault;
    DMArtesanalis.CDS_BuscaRapida.Close;
    msg('Cliente Não Encontrado !!'+cr+'Ou Não é Cliente !!','A');
    EdtCodPessoa.SetFocus;
    Exit;
  End;
  EdtDesPessoa.Text:=Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Nome').AsString);
  DMArtesanalis.CDS_BuscaRapida.Close;

  Screen.Cursor:=crDefault;
  EdtNumDocto.SetFocus;
end;

procedure TFrmPedidoVenda.EdtCodPessoaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // <F9> Busca Pessoa =========================================================
  If Key=VK_F9 Then
   Bt_BuscaPessoaClick(Self);

end;

procedure TFrmPedidoVenda.Bt_BuscaPessoaClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_Produtos.SetFocus;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.des_pessoa Nome, p.cod_pessoa Codigo'+
         ' FROM PESSOAS p'+
         ' WHERE p.Tipo in (''A'', ''C'')'+
         ' ORDER BY p.des_pessoa';
  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMArtesanalis.CDS_Pesquisa.FieldByName('Nome').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Pesquisa.Close;
    msg('Sem Cliente a Listar !!','A');
    EdtCodPessoa.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Nome';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Nome';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtCodPessoa.AsInteger:=StrToInt(FrmPesquisa.EdtCodigo.Text);
    EdtCodPessoaExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmPedidoVenda.Bt_NovaPessoaClick(Sender: TObject);
begin
  Dbg_Produtos.SetFocus;

  FrmCadastroPessoa.bgTransportar:=True;

  FrmCadastroPessoa.ShowModal;

  If FrmCadastroPessoa.bgTransportar Then
  Begin
    EdtCodPessoa.AsInteger:=StrToInt(FrmCadastroPessoa.sgCodPesTransportar);
    EdtCodPessoaExit(Self);
  End;

end;

procedure TFrmPedidoVenda.EdtNumDoctoExit(Sender: TObject);
Var
  MySql: String;
begin
  bgProdAlterar:=False;

  If EdtCodPessoa.Value=0 Then
  Begin
    msg('Favor Informar o Cliente !!','A');
    EdtCodPessoa.SetFocus;
    Exit;
  End;

  If EdtNumDocto.AsInteger=0 Then
  Begin
    EdtCodPessoa.SetFocus;
    Exit;
  End;

  Screen.Cursor:=crAppStart;
  EdtNumSeqDocto.AsInteger:=0;

  // Busca Docto =============================================================
  MySql:=' SELECT dc.num_docto, dc.dta_docto Emissao,'+
         '        dc.des_pessoa Fornecedor, dc.vlr_total, dc.cod_pessoa Codigo'+
         ' FROM DOCTOS dc'+
         ' WHERE dc.origem='+QuotedStr(sgOrigem)+ // ORIGEM - Pedido de Venda
         ' AND   dc.num_docto='+IntToStr(EdtNumDocto.AsInteger)+
         ' AND   dc.Cod_Pessoa='+IntToStr(EdtCodPessoa.AsInteger)+
         ' ORDER BY dc.des_pessoa';
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;

  Screen.Cursor:=crDefault;

  Bt_IncluiProduto.Enabled   :=False;
  Bt_ExcluiProduto.Enabled   :=False;
  Bt_AbandonarProduto.Enabled:=False;

  If Trim(DMArtesanalis.CDS_Busca.FieldByName('num_docto').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Busca.Close;
    HabilitaDocto(True);

    Bt_IncluiProduto.Enabled   :=True;
    Bt_ExcluiProduto.Enabled   :=True;
    Bt_AbandonarProduto.Enabled:=True;
    Bt_Salvar.Enabled:=True;

    DtEdt_DtaDocto.SetFocus;

    Exit;
  End;

  MySql:=' SELECT dc.num_seq_docto, dc.tipo, dc.num_docto, dc.num_serie, dc.dta_docto,'+
         '        dc.cod_pessoa, dc.des_pessoa, dc.vlr_produtos, dc.vlr_total,'+
         '        di.num_seq, di.cod_produto, di.des_produto,'+
         '        di.qtd_movto, di.vlr_unitario, di.vlr_desconto, di.vlr_total'+
         ' FROM DOCTOS dc, DOCTOS_ITENS di'+
         ' WHERE dc.num_seq_docto=di.num_seq_docto'+
         ' AND   dc.origem='+QuotedStr(sgOrigem)+// ORIGEM - Pedido de Venda
         ' AND   dc.num_docto='+DMArtesanalis.CDS_Busca.FieldByName('num_docto').AsString+
         ' AND   dc.cod_pessoa='+DMArtesanalis.CDS_Busca.FieldByName('Codigo').AsString+
         ' ORDER BY di.num_seq';
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;

  EdtCodPessoa.Text:=DMArtesanalis.CDS_Busca.FieldByName('cod_pessoa').AsString;
  EdtDesPessoa.Text:=DMArtesanalis.CDS_Busca.FieldByName('des_pessoa').AsString;

  EdtNumSeqDocto.AsInteger:=DMArtesanalis.CDS_Busca.FieldByName('num_seq_docto').AsInteger;

  DtEdt_DtaDocto.Date  :=DMArtesanalis.CDS_Busca.FieldByName('dta_docto').AsDateTime;
  EdtVlrTotal.Value    :=DMArtesanalis.CDS_Busca.FieldByName('vlr_total').AsCurrency;

  // Incicializa Produtos ======================================================
  If DMArtesanalis.CDS_V_DoctoItens.Active Then
   DMArtesanalis.CDS_V_DoctoItens.Close;

  DMArtesanalis.CDS_V_DoctoItens.CreateDataSet;
  DMArtesanalis.CDS_V_DoctoItens.Open;

  DMArtesanalis.CDS_Busca.DisableControls;
  While Not DMArtesanalis.CDS_Busca.Eof do
  Begin
    DMArtesanalis.CDS_V_DoctoItens.Append;
    DMArtesanalis.CDS_V_DoctoItensNUM_SEQ_DOCTO.AsString:=DMArtesanalis.CDS_Busca.FieldByName('NUM_SEQ_DOCTO').AsString;
    DMArtesanalis.CDS_V_DoctoItensNUM_SEQ.AsString      :=DMArtesanalis.CDS_Busca.FieldByName('NUM_SEQ').AsString;
    DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString  :=DMArtesanalis.CDS_Busca.FieldByName('COD_PRODUTO').AsString;
    DMArtesanalis.CDS_V_DoctoItensDES_PRODUTO.AsString  :=DMArtesanalis.CDS_Busca.FieldByName('DES_PRODUTO').AsString;
    DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsString    :=DMArtesanalis.CDS_Busca.FieldByName('QTD_MOVTO').AsString;
    DMArtesanalis.CDS_V_DoctoItensVLR_UNITARIO.AsString :=DMArtesanalis.CDS_Busca.FieldByName('VLR_UNITARIO').AsString;
    DMArtesanalis.CDS_V_DoctoItensVLR_DESCONTO.AsString :=DMArtesanalis.CDS_Busca.FieldByName('VLR_DESCONTO').AsString;
    DMArtesanalis.CDS_V_DoctoItensVLR_TOTAL.AsString    :=DMArtesanalis.CDS_Busca.FieldByName('VLR_TOTAL').AsString;

    DMArtesanalis.CDS_V_DoctoItens.Post;

    DMArtesanalis.CDS_Busca.Next;
  End; // While Not DMArtesanalis.CDS_Busca.Eof do
  DMArtesanalis.CDS_Busca.EnableControls;
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.CDS_V_DoctoItens.First;

  HabilitaBotoes(False);
  Bt_Excluir.Enabled:=True;

  HabilitaDocto(False);

  Dbg_Produtos.SetFocus;
end;

procedure TFrmPedidoVenda.EdtCodProdutoEnter(Sender: TObject);
begin
  FocoToControl(EdtCodProduto);

end;

procedure TFrmPedidoVenda.EdtCodProdutoExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtCodProduto.asInteger=0 Then
   Exit;

  Screen.Cursor:=crAppStart;
  EdtDesProduto.Clear;

  MySql:=' SELECT p.des_produto, p.cod_produto, preco_venda'+
         ' FROM PRODUTO p'+
         ' WHERE p.cod_produto='+IntToStr(EdtCodProduto.AsInteger);
  DMArtesanalis.CDS_BuscaRapida.Close;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMArtesanalis.CDS_BuscaRapida.Open;

  If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('cod_produto').AsString)='' Then
  Begin
    Screen.Cursor:=crDefault;
    DMArtesanalis.CDS_BuscaRapida.Close;
    msg('Produto Não Encontrado !!','A');
    EdtCodProduto.SetFocus;
    Exit;
  End;
  EdtDesProduto.Text:=Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('des_produto').AsString);
  EdtVlrUnitProduto.Value:=DMArtesanalis.CDS_BuscaRapida.FieldByName('preco_venda').AsCurrency;

  // Verifica se Existe Produção ===============================================
  MySql:=' SELECT COUNT(pd.cod_produto) tot_itens'+
         ' FROM PRODUCAO pd'+
         ' where pd.cod_produto='+IntToStr(EdtCodProduto.AsInteger);
  DMArtesanalis.CDS_BuscaRapida.Close;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMArtesanalis.CDS_BuscaRapida.Open;

  If DMArtesanalis.CDS_BuscaRapida.FieldByName('Tot_Itens').AsInteger=0 Then
  Begin
    Screen.Cursor:=crDefault;
    DMArtesanalis.CDS_BuscaRapida.Close;
    msg('Produto Sem Produção'+cr+cr+'Favor Cadastrar a Produção !!','A');
    EdtCodProduto.SetFocus;
    Exit;
  End;

  DMArtesanalis.CDS_BuscaRapida.Close;

  Screen.Cursor:=crDefault;

  EdtQtdProduto.SetFocus;
end;

procedure TFrmPedidoVenda.EdtCodProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // <F9> Busca Produto ========================================================
  If Key=VK_F9 Then
  Begin
    If Not bgProdAlterar Then
     LimpaProduto();

    // Busca Produtos -----------------------------------------------
    bgProdIncluir:=False;
    ProdutoLocaliza;
  End; // If Key=VK_F9 Then

end;

procedure TFrmPedidoVenda.EdtQtdProdutoEnter(Sender: TObject);
begin

  EdtVlrTotalProduto.Value:=(EdtQtdProduto.AsInteger*EdtVlrUnitProduto.Value)-EdtVlrDescProduto.Value;

end;

procedure TFrmPedidoVenda.EdtVlrDescProdutoExit(Sender: TObject);
begin
  If EdtVlrDescProduto.Value > (EdtQtdProduto.AsInteger*EdtVlrUnitProduto.Value) Then
  Begin
    msg('Valor de Desconto NÃO Pode SER Maior'+cr+cr+'que o Valor Total do Produto !!','A');
    EdtVlrDescProduto.Value:=0;
    EdtVlrDescProduto.SetFocus;
    Exit;
  End;

  EdtQtdProdutoEnter(Self);

end;

procedure TFrmPedidoVenda.EdtVlrTotalProdutoEnter(Sender: TObject);
begin

  If EdtQtdProduto.AsInteger=0 Then
  Begin
    msg('Favor Informar a Quantidade'+cr+cr+'do Produto!!','A');
    EdtQtdProduto.SetFocus;
    Exit;
  End;

  If EdtVlrUnitProduto.Value=0 Then
  Begin
    msg('Favor Informar o Valor Unitário'+cr+cr+'do Produto !!','A');
    EdtVlrUnitProduto.SetFocus;
    Exit;
  End;

  EdtVlrTotalProduto.Value:=(EdtQtdProduto.AsInteger*EdtVlrUnitProduto.Value)-EdtVlrDescProduto.Value;

end;

procedure TFrmPedidoVenda.Bt_IncluiProdutoClick(Sender: TObject);
Var
  iSeqProd: Integer;
  cTotalProduto: Currency;
begin

  Dbg_Produtos.SetFocus;

  cTotalProduto:=EdtQtdProduto.AsInteger*EdtVlrUnitProduto.Value;
  If EdtVlrTotalProduto.Value<>(cTotalProduto) Then
  Begin
    msg('Valor Total do Produto Não esta Fechando !!'+cr+cr+'Valor Correto: '+cr+cr+FormatFloat('0,.00',cTotalProduto),'A');
    EdtQtdProduto.SetFocus;
    Exit;
  End;

  If EdtCodProduto.AsInteger=0 Then
  Begin
    msg('Favor Informar o Produto !!','A');
    EdtCodProduto.SetFocus;
    Exit;
  End;

  If EdtQtdProduto.AsInteger=0 Then
  Begin
    msg('Favor Informar a Quantidade'+cr+cr+'do Produto!!','A');
    EdtQtdProduto.SetFocus;
    Exit;
  End;

  If EdtVlrUnitProduto.Value=0 Then
  Begin
    msg('Favor Informar o Valor Unitário'+cr+cr+'do Produto !!','A');
    EdtVlrUnitProduto.SetFocus;
    Exit;
  End;

  If EdtVlrTotalProduto.Value=0 Then
  Begin
    msg('Favor Informar o Valor Total'+cr+cr+'do Produto !!','A');
    EdtVlrUnitProduto.SetFocus;
    Exit;
  End;

  // Busca Sequencia do Produtos ===============================================
  iSeqProd:=1;
  If Not DMArtesanalis.CDS_V_DoctoItens.IsEmpty Then
  Begin
    DMArtesanalis.CDS_V_DoctoItens.DisableControls;
    DMArtesanalis.CDS_V_DoctoItens.Last;
    iSeqProd:=DMArtesanalis.CDS_V_DoctoItensNUM_SEQ.AsInteger+1;
    DMArtesanalis.CDS_V_DoctoItens.First;
    DMArtesanalis.CDS_V_DoctoItens.EnableControls;
  End; // If Not DMArtesanalis.CDS_V_DoctoItens.IsEmpty Then

  // Inclui Produto ============================================================
  If bgProdAlterar Then
   iSeqProd:=EdtSeqProduto.AsInteger;

  If DMArtesanalis.CDS_V_DoctoItens.Locate('NUM_SEQ', iSeqProd,[]) Then
   DMArtesanalis.CDS_V_DoctoItens.Edit
  Else
   DMArtesanalis.CDS_V_DoctoItens.Append;

  DMArtesanalis.CDS_V_DoctoItensNUM_SEQ_DOCTO.AsInteger:=EdtNumSeqDocto.AsInteger;
  DMArtesanalis.CDS_V_DoctoItensNUM_SEQ.AsInteger      :=iSeqProd;
  DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsInteger  :=EdtCodProduto.AsInteger;
  DMArtesanalis.CDS_V_DoctoItensDES_PRODUTO.AsString   :=EdtDesProduto.Text;
  DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsCurrency   :=EdtQtdProduto.Value;
  DMArtesanalis.CDS_V_DoctoItensVLR_UNITARIO.AsCurrency:=EdtVlrUnitProduto.Value;
  DMArtesanalis.CDS_V_DoctoItensVLR_DESCONTO.AsCurrency:=EdtVlrDescProduto.Value;
  DMArtesanalis.CDS_V_DoctoItensVLR_TOTAL.AsCurrency   :=EdtVlrTotalProduto.Value;
  DMArtesanalis.CDS_V_DoctoItens.Post;

  LimpaProduto();
  Refresh;

  // Rateio de Descontos nos Produtos ==========================================
  CalculaRateiroDescontos;

  // Posiciona no Produto ======================================================
  DMArtesanalis.CDS_V_DoctoItens.Locate('NUM_SEQ', iSeqProd,[]);

  EdtCodProduto.SetFocus;
end;

procedure TFrmPedidoVenda.Bt_IncluiProdutoEnter(Sender: TObject);
begin
  FocoToControl(Bt_IncluiProduto);

end;

procedure TFrmPedidoVenda.Bt_ExcluiProdutoEnter(Sender: TObject);
begin
  FocoToControl(Bt_ExcluiProduto);

end;

procedure TFrmPedidoVenda.Bt_ExcluiProdutoClick(Sender: TObject);
Var
  i: Integer;
begin
  Dbg_Produtos.SetFocus;

  If EdtSeqProduto.AsInteger=0 Then
  Begin
    msg('Favor Selecionar o Produto a Excluir !!','A');
    LimpaProduto();
    Dbg_Produtos.SetFocus;
    Exit;
  End;

  if msg('Deseja Realmente Incluir'+cr+cr+'O Produto Selecionado ??','C')=2 Then
   Exit;

  If Not DMArtesanalis.CDS_V_DoctoItens.Locate('NUM_SEQ', EdtSeqProduto.AsInteger,[]) Then
  Begin
    msg('Produto Não Encontrado na Lista !!','A');
    bgProdAlterar:=False;
    LimpaProduto();
    Dbg_Produtos.SetFocus;
    Exit;
  End;

  DMArtesanalis.CDS_V_DoctoItens.Delete;

  // Acerta Num_seq Produtos ===================================================
  If Not DMArtesanalis.CDS_V_DoctoItens.IsEmpty Then
  Begin
    DMArtesanalis.CDS_V_DoctoItens.DisableControls;
    DMArtesanalis.CDS_V_DoctoItens.First;
    i:=0;
    While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
    Begin
      Inc(i);
      DMArtesanalis.CDS_V_DoctoItens.Edit;
      DMArtesanalis.CDS_V_DoctoItensNUM_SEQ.AsInteger:=i;
      DMArtesanalis.CDS_V_DoctoItens.Post;

      DMArtesanalis.CDS_V_DoctoItens.Next;
    End; // While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
    DMArtesanalis.CDS_V_DoctoItens.First;
    DMArtesanalis.CDS_V_DoctoItens.EnableControls;

    LimpaProduto();
  End; // If Not DMArtesanalis.CDS_V_DoctoItens.IsEmpty Then

  bgProdAlterar:=False;
end;

procedure TFrmPedidoVenda.Bt_AbandonarProdutoClick(Sender: TObject);
begin
  LimpaProduto();

  bgProdAlterar:=False;

  EdtCodProduto.SetFocus;

end;

procedure TFrmPedidoVenda.Bt_AbandonarProdutoEnter(Sender: TObject);
begin
  FocoToControl(Bt_AbandonarProduto);

end;

procedure TFrmPedidoVenda.Bt_SalvarClick(Sender: TObject);
begin
  Dbg_Produtos.SetFocus;

  If EdtCodPessoa.AsInteger=0 Then
  Begin
    msg('Favor Informar o'+cr+cr+'Cliente/Fornecedor !!','A');
    EdtCodPessoa.SetFocus;
    Exit;
  End;

  If EdtNumDocto.AsInteger=0 Then
  Begin
    msg('Favor Informar o'+cr+cr+'Número do Pedido !!','A');
    EdtNumDocto.SetFocus;
    Exit;
  End;

  try
    StrToDate(DtEdt_DtaDocto.Text);
  Except
    msg('Favor Informar a Data de '+cr+cr+'Emissão do Pedido !!','A');
    DtEdt_DtaDocto.SetFocus;
    Exit;
  End;

  If DtEdt_DtaDocto.Date>Date Then
  Begin
    msg('Data de Emissão Maior'+cr+cr+'Que Data de Hoje !!','A');
    DtEdt_DtaDocto.SetFocus;
    Exit;
  End;

  If EdtVlrTotal.Value<=0 Then
  Begin
    msg('Favor Informar o'+cr+cr+'Valor Total do Pedido !!','A');
    EdtVlrTotal.SetFocus;
    Exit;
  End;

  If DMArtesanalis.CDS_V_DoctoItens.IsEmpty Then
  Begin
    msg('Impossível Salvar !!'+cr+'Pedido Sem Produto !!','A');
    EdtCodProduto.SetFocus;
    Exit;
  End;

  If EdtVlrTotal.Value<>EdtVlrTotalCalculado.Value Then
  Begin
    msg('Valor Total do Pedido'+cr+cr+'Diferente do Valor Total Calculado !!','A');
    EdtVlrTotal.SetFocus;
    Exit;
  End;

  // Inclui Novo Pedido ========================================================
  PedidoIncluirExcluir('I');
end;

procedure TFrmPedidoVenda.EdtVlrProdutosEnter(Sender: TObject);
begin
  EdtVlrTotal.Value:=EdtVlrProdutos.Value-EdtVlrDescontos.Value;

   // Rateio de Descontos nos Produtos ==========================================
  CalculaRateiroDescontos;
end;

procedure TFrmPedidoVenda.Bt_AbandonarClick(Sender: TObject);
begin
  Dbg_Produtos.SetFocus;

  FormShow(Self);

end;

procedure TFrmPedidoVenda.Dbe_VlrTotalCalculadoChange(Sender: TObject);
begin
  Try
    EdtVlrTotalCalculado.Value:=DMArtesanalis.CDS_V_DoctoItensVlr_TotalCalculado.Value;
  Except
    EdtVlrTotalCalculado.Value:=0.00;
  End;

end;

procedure TFrmPedidoVenda.Bt_ExcluirClick(Sender: TObject);
begin
  Dbg_Produtos.SetFocus;

  If (DMArtesanalis.CDS_V_DoctoItens.IsEmpty) Or (EdtCodProduto.Enabled) Then
   Exit;

  If msg('Deseja Realmente Excluir'+cr+cr+'O Pedido Selecionado ??','C')=2 Then
   Exit;

  PedidoIncluirExcluir('E');

end;

end.

