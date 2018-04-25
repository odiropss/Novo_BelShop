unit UFrmMovimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinsdxStatusBarPainter, JvExControls, JvXPCore, JvXPButtons,
  dxStatusBar, Grids, DBGrids, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls,
  DBXpress, ComCtrls, JvExComCtrls, JvDateTimePicker, JvDBDateTimePicker,
  Commctrl, // SHOW HINT EM FORMA DE BALÃO
  JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,
  JvDBDatePickerEdit, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit,  MaskUtils, ACBrBase, ACBrValidador,
  DBCtrls;

type
  TFrmMovimentos = class(TForm)
    Gb_Principal: TGroupBox;
    Pan_Docto: TPanel;
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    Bt_Salvar: TJvXPButton;
    Bt_Abandonar: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    OdirPanApres: TPanel;
    Gb_SerieDocto: TGroupBox;
    EdtSerieDocto: TEdit;
    Gb_VlrProdutos: TGroupBox;
    EdtVlrProdutos: TCurrencyEdit;
    Gb_NumDocto: TGroupBox;
    EdtNumDocto: TCurrencyEdit;
    Gb_DtaDocto: TGroupBox;
    DtEdt_DtaDocto: TcxDateEdit;
    Gb_Pessoa: TGroupBox;
    EdtDesPessoa: TEdit;
    EdtCodPessoa: TCurrencyEdit;
    Bt_BuscaPessoa: TJvXPButton;
    Gb_VlrTotal: TGroupBox;
    EdtVlrTotal: TCurrencyEdit;
    Rb_Produtos: TRadioGroup;
    Pan_Produto: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdtSeqProduto: TCurrencyEdit;
    EdtCodProduto: TCurrencyEdit;
    EdtDesProduto: TEdit;
    EdtQtdProduto: TCurrencyEdit;
    EdtVlrUnitProduto: TCurrencyEdit;
    EdtVlrTotalProduto: TCurrencyEdit;
    Dbg_Produtos: TDBGrid;
    Bt_IncluiProduto: TJvXPButton;
    Bt_ExcluiProduto: TJvXPButton;
    StB_Movtos: TdxStatusBar;
    Bt_NovaPessoa: TJvXPButton;
    EdtNumSeqDocto: TCurrencyEdit;
    Gb_TipoDocto: TGroupBox;
    CBx_TipoDocto: TComboBox;
    ACBrValidador: TACBrValidador;
    Bt_AbandonarProduto: TJvXPButton;
    Dbe_VlrTotalCalculado: TDBEdit;
    Label8: TLabel;
    EdtVlrDescProduto: TCurrencyEdit;
    Gb_VlrTotalCalculado: TGroupBox;
    EdtVlrTotalCalculado: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);

    // Odir ====================================================================

    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl);

    Procedure HabilitaDocto(bHabilita: Boolean);
    Procedure HabilitaBotoes(bHabilita: Boolean);
    Procedure LimpaDocto;
    Procedure LimpaProduto(bCodigo: Boolean = True);

    Procedure ProdutoLocaliza;

    Procedure DocumentoIncluirExcluir(sDML: String);
                                   // sDML: (I)Inclusão
                                   //       (E)Exclusão

    // Odir ====================================================================

    procedure EdtNumDoctoExit(Sender: TObject);
    procedure EdtCodPessoaChange(Sender: TObject);
    procedure Bt_AbandonarClick(Sender: TObject);
    procedure Dbg_ProdutosEnter(Sender: TObject);
    procedure Dbg_ProdutosExit(Sender: TObject);
    procedure EdtCodProdutoEnter(Sender: TObject);
    procedure EdtCodPessoaExit(Sender: TObject);
    procedure Bt_BuscaPessoaClick(Sender: TObject);
    procedure Bt_NovaPessoaClick(Sender: TObject);
    procedure CBx_TipoDoctoSelect(Sender: TObject);
    procedure EdtCodPessoaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodProdutoExit(Sender: TObject);
    procedure Bt_ExcluiProdutoClick(Sender: TObject);
    procedure Bt_IncluiProdutoClick(Sender: TObject);
    procedure EdtVlrTotalProdutoEnter(Sender: TObject);
    procedure Bt_SalvarClick(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
    procedure Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ProdutosDblClick(Sender: TObject);
    procedure Bt_AbandonarProdutoClick(Sender: TObject);
    procedure Bt_IncluiProdutoEnter(Sender: TObject);
    procedure Bt_ExcluiProdutoEnter(Sender: TObject);
    procedure Bt_AbandonarProdutoEnter(Sender: TObject);
    procedure Dbe_VlrTotalCalculadoChange(Sender: TObject);
    procedure EdtVlrDescProdutoExit(Sender: TObject);
    procedure EdtQtdProdutoEnter(Sender: TObject);
    procedure EdtVlrTotalCalculadoChange(Sender: TObject); // Posiciona no Componente

  private
    { Private declarations }
  public
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
  FrmMovimentos: TFrmMovimentos;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  TD: TTransactionDesc;

  bgSairMovtos,
  bgProdIncluir,
  bgProdAlterar: Boolean;

  sgMensagem,
  sgTpPesSelect, // Tipo de Pessoa na Seleção
  sgTpPesDocto  // Tipo de Pessoa no Tipo de Documento
  :String;

implementation

uses DK_Procs1, UDMArtesanalis, UPesquisa, DB, UFrmMateriaPrimaCadastro,
  UFrmPessoaCadastro;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Inclusão/Exclusão do Documento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovimentos.DocumentoIncluirExcluir(sDML: String);
Var
  MySql: String;
  sTipoPessoa, sTipoDocto,
  sQtdSaldo: String;
Begin
  // sDML: (I)Inclusão
  //       (E)Exclusão

  If sDML='I' Then  OdirPanApres.Caption:='AGUARDE !! Efetuando a Inclusão do Documento !!';
  If sDML='E' Then  OdirPanApres.Caption:='AGUARDE !! Efetuando a Exclusão do Documento !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmMovimentos.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmMovimentos.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmMovimentos;
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

    // Tipo de Documento =======================================================
    If CBx_TipoDocto.ItemIndex=0 Then sTipoDocto:='E';
    If CBx_TipoDocto.ItemIndex=1 Then sTipoDocto:='S';
    If CBx_TipoDocto.ItemIndex=2 Then sTipoDocto:='DE';
    If CBx_TipoDocto.ItemIndex=3 Then sTipoDocto:='DS';
    If CBx_TipoDocto.ItemIndex=4 Then sTipoDocto:='BE';
    If CBx_TipoDocto.ItemIndex=5 Then sTipoDocto:='BS';

    //==========================================================================
    // Exclusão do Documento ===================================================
    //==========================================================================
    If sDML='E' Then
    Begin
      // Exclui Produtos =======================================================
      MySql:=' DELETE FROM DOCTOS_ITENS i'+
             ' WHERE i.num_seq_docto='+IntToStr(EdtNumSeqDocto.AsInteger);
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);

      // Exclui Documento ======================================================
      MySql:=' DELETE FROM DOCTOS d'+
             ' WHERE d.num_seq_docto='+IntToStr(EdtNumSeqDocto.AsInteger);
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);

      // Atualiza Produtos =====================================================
      DMArtesanalis.CDS_V_DoctoItens.DisableControls;
      DMArtesanalis.CDS_V_DoctoItens.First;
      While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
      Begin
        If sTipoDocto='E' Then
        Begin
          // Calcula/Atualiza Novo Custo Médio =================================
          MySql:=' SELECT sum(i.vlr_total)/sum(i.qtd_movto) Custo_Medio'+
                 ' FROM DOCTOS_ITENS i'+
                 ' WHERE i.cod_produto='+DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString+
                 ' AND   EXISTS(SELECT 1'+
                 '              FROM DOCTOS dc'+
                 '              WHERE dc.origem = '+QuotedStr(sgOrigem)+ // Matéria-Prima
                 '              AND   dc.tipo=''E'''+
                 '              AND   dc.num_seq_docto = i.num_seq_docto)';
          DMArtesanalis.CDS_BuscaRapida.Close;
          DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
          DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
          DMArtesanalis.CDS_BuscaRapida.Open;
          If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Custo_Medio').AsString)<>'' Then
          Begin
            MySql:=' UPDATE MATERIAPRIMA m'+
                   ' SET m.custo_medio='+QuotedStr(f_Troca(',','.',DMArtesanalis.CDS_BuscaRapida.FieldByName('Custo_Medio').AsString))+
                   ' WHERE m.cod_materiaprima='+DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString;
            DMArtesanalis.SQLC.Execute(MySql,nil,nil);
          End;
          DMArtesanalis.CDS_BuscaRapida.Close;

          // Busca Preço Último Preço de Custo =================================
          MySql:=' SELECT it.vlr_unitario'+
                 ' FROM DOCTOS_ITENS it'+
                 ' WHERE it.cod_produto='+DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString+
                 ' AND   it.num_seq_docto in (SELECT MAX(dc.num_seq_docto)'+
                 '                            FROM doctos dc'+
                 '                            WHERE dc.origem = '+QuotedStr(sgOrigem)+ // Matéria-Prima
                 '                            AND   dc.tipo='+QuotedStr('E')+')';
          DMArtesanalis.CDS_BuscaRapida.Close;
          DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
          DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
          DMArtesanalis.CDS_BuscaRapida.Open;
          If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Vlr_Unitario').AsString)<>'' Then
          Begin
            MySql:=' UPDATE MATERIAPRIMA m'+
                   ' SET m.preco_custo='+QuotedStr(f_Troca(',','.',DMArtesanalis.CDS_BuscaRapida.FieldByName('Vlr_Unitario').AsString))+
                   ' WHERE m.cod_materiaprima='+DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString;
            DMArtesanalis.SQLC.Execute(MySql,nil,nil);
          End;
          DMArtesanalis.CDS_BuscaRapida.Close;
        End; // If sTipoDocto='E' Then

        // Atualiza Saldo/Preco_Custo do Produto ===============================
        sQtdSaldo:=f_Troca(',','.',DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsString);
        If (sTipoDocto='E') Or (sTipoDocto='DE') Or (sTipoDocto='BE') Then
         sQtdSaldo:='-'+sQtdSaldo;

        MySql:=' UPDATE MATERIAPRIMA m'+
               ' SET m.qtd_estoque=m.qtd_estoque+'+sQtdSaldo+
               ' WHERE m.cod_materiaprima='+DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString;
        DMArtesanalis.SQLC.Execute(MySql,nil,nil);

        DMArtesanalis.CDS_V_DoctoItens.Next;
      End; // While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
      DMArtesanalis.CDS_V_DoctoItens.First;
      DMArtesanalis.CDS_V_DoctoItens.EnableControls;
    End; // If sDML='E' Then
    // Exclusão do Documento ===================================================

    //==========================================================================
    // Inclusão do Documento ===================================================
    //==========================================================================
    If sDML='I' Then
    Begin
      // Num_Seq do Documento ==================================================
      MySql:=' SELECT GEN_ID(GEN_DOCTOS_ID,1) Num_Seq'+
             ' FROM RDB$DATABASE';
      DMArtesanalis.CDS_BuscaRapida.Close;
      DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
      DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
      DMArtesanalis.CDS_BuscaRapida.Open;
      EdtNumSeqDocto.AsInteger:=DMArtesanalis.CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
      DMArtesanalis.CDS_BuscaRapida.Close;

      // Insere Documento ======================================================
      MySql:=' INSERT INTO DOCTOS'+
             ' (ORIGEM, NUM_SEQ_DOCTO, TIPO, NUM_DOCTO, NUM_SERIE, DTA_DOCTO, DTA_LANCAMENTO,'+
             '  COD_PESSOA, DES_PESSOA, VLR_PRODUTOS, VLR_DESCONTO, VLR_TOTAL)'+
             ' VALUES ('+
             QuotedStr(sgOrigem)+', '+ // ORIGEM - Matéria-Prima
             IntToStr(EdtNumSeqDocto.AsInteger)+', '+ // NUM_SEQ_DOCTO
             QuotedStr(sTipoDocto)+', '+ // Tipo do Documento
             IntToStr(EdtNumDocto.AsInteger)+', '+ // NUM_DOCTO
             QuotedStr(EdtSerieDocto.Text)+', '+ // NUM_SERIE
             QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaDocto.Date))))+', '+ // DTA_DOCTO
             ' current_date, '+ // DTA_LANCAMENTO
             IntToStr(EdtCodPessoa.AsInteger)+', '+ // COD_PESSOA
             QuotedStr(EdtDesPessoa.Text)+', '+ // DES_PESSOA
             QuotedStr(f_Troca(',','.',VarToStr(EdtVlrProdutos.Value)))+', '+ // VLR_PRODUTOS
             QuotedStr(f_Troca(',','.',DMArtesanalis.CDS_V_DoctoItensVlr_TotalDesconto.AsString))+', '+ // VLR_DESCONTO
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

        // Calcula/Atualiza Novo Custo Médio ===================================
        If sTipoDocto='E' Then
        Begin
          MySql:=' SELECT sum(i.vlr_total)/sum(i.qtd_movto) Custo_Medio'+
                 ' FROM DOCTOS_ITENS i'+
                 ' WHERE i.cod_produto='+DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString+
                 ' AND   EXISTS(SELECT 1'+
                 '              FROM DOCTOS dc'+
                 '              WHERE dc.origem = '+QuotedStr(sgOrigem)+ // ORIGEM - Matéria-Prima
                 '              AND   dc.tipo=''E'''+
                 '              AND   dc.num_seq_docto = i.num_seq_docto)';
          DMArtesanalis.CDS_BuscaRapida.Close;
          DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
          DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
          DMArtesanalis.CDS_BuscaRapida.Open;
          If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Custo_Medio').AsString)<>'' Then
          Begin
            MySql:=' UPDATE MATERIAPRIMA m'+
                   ' SET m.custo_medio='+QuotedStr(f_Troca(',','.',DMArtesanalis.CDS_BuscaRapida.FieldByName('Custo_Medio').AsString))+
                   ' WHERE m.cod_materiaprima='+DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString;
            DMArtesanalis.SQLC.Execute(MySql,nil,nil);
          End;
          DMArtesanalis.CDS_BuscaRapida.Close;
        End; // If sTipoDocto='E' Then

        // Atualiza Saldo/Preco_Custo do Produto ===============================
        sQtdSaldo:=f_Troca(',','.',DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsString);
        If (sTipoDocto='S') Or (sTipoDocto='DS') Or (sTipoDocto='BS') Then
         sQtdSaldo:='-'+sQtdSaldo;

        MySql:=' UPDATE MATERIAPRIMA m'+
               ' SET m.qtd_estoque=m.qtd_estoque+'+sQtdSaldo;

               If sTipoDocto='E' Then
                MySql:=
                 MySql+', m.preco_custo='+QuotedStr(DMArtesanalis.CDS_V_DoctoItensVLR_UNITARIO.AsString);

        MySql:=
         MySql+' WHERE m.cod_materiaprima='+DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString;
        DMArtesanalis.SQLC.Execute(MySql,nil,nil);

        DMArtesanalis.CDS_V_DoctoItens.Next;
      End; // While Not DMArtesanalis.CDS_V_DoctoItens.Eof do
      DMArtesanalis.CDS_V_DoctoItens.First;
      DMArtesanalis.CDS_V_DoctoItens.EnableControls;
    End; // If sDML='I' Then // Inclusão do Documento
    // Inclusão do Documento ===================================================

    // Tipo Pessoa =============================================================
    sTipoPessoa:=sgTpPesSelect;
    If sgTpPesDocto<>sgTpPesSelect Then
     sTipoPessoa:='A'; // Ambos

    MySql:=' UPDATE PESSOAS p'+
           ' SET p.tipo='+QuotedStr(sTipoPessoa)+
           ' WHERE p.cod_pessoa='+IntToStr(EdtCodPessoa.AsInteger);
    DMArtesanalis.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

    // Reapresenta Documento ===================================================
    If sDML='I' Then
    Begin
      msg('Documento INCLUÍDO com SUCESSO !!','A');
      EdtNumDoctoExit(Self);
      Exit;
    End;

    If sDML='E' Then
    Begin
      msg('Documento EXCLUÍDO com SUCESSO !!','A');
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
End; // Inclusão/Exclusão do Documento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Localiza/Inclui Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovimentos.ProdutoLocaliza;
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);
  FrmPesquisa.Bt_PesquisaNovo.Visible:=True;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT m.des_materiaprima Materia_Prima,  m.cod_materiaprima Codigo'+
         ' FROM MATERIAPRIMA m'+
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
  FrmPesquisa.Campo_pesquisa:='Materia_Prima';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Materia_Prima';
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

  If FrmPesquisa.bgIncluirNovo Then
   bgProdIncluir:=True;

  FreeAndNil(FrmPesquisa);
End; // Localiza/Inclui Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita Dados do Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovimentos.HabilitaDocto(bHabilita: Boolean);
Var
  i: Integer;
Begin

  For i:=0 to FrmMovimentos.ComponentCount-1 do
  Begin
    If FrmMovimentos.Components[i] is TEdit Then
     (FrmMovimentos.Components[i] as TEdit).Enabled:=bHabilita;

    If FrmMovimentos.Components[i] is TCurrencyEdit Then
     (FrmMovimentos.Components[i] as TCurrencyEdit).Enabled:=bHabilita;

    If FrmMovimentos.Components[i] is TcxDateEdit Then
     (FrmMovimentos.Components[i] as TcxDateEdit).Enabled:=bHabilita;

    If FrmMovimentos.Components[i] is TComboBox Then
     (FrmMovimentos.Components[i] as TComboBox).Enabled:=bHabilita;
  End; // For i:=0 to FrmMovimentos.ComponentCount-1 do

  EdtSeqProduto.Enabled:=False;
End; // Habilita Dados do Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita Botoes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovimentos.HabilitaBotoes(bHabilita: Boolean);
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
Procedure TFrmMovimentos.LimpaDocto;
Var
  i: Integer;
Begin

  For i:=0 to FrmMovimentos.ComponentCount-1 do
  Begin
    If FrmMovimentos.Components[i] is TEdit Then
     (FrmMovimentos.Components[i] as TEdit).Clear;

    If FrmMovimentos.Components[i] is TCurrencyEdit Then
     (FrmMovimentos.Components[i] as TCurrencyEdit).Value:=0;

    If FrmMovimentos.Components[i] is TcxDateEdit Then
     (FrmMovimentos.Components[i] as TcxDateEdit).Clear;

    If FrmMovimentos.Components[i] is TComboBox Then
     (FrmMovimentos.Components[i] as TComboBox).ItemIndex:=-1;
  End; // For i:=0 to FrmMovimentos.ComponentCount-1 do

end; // Limpa Todo o Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Somente Digitação do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovimentos.LimpaProduto(bCodigo: Boolean = True);
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
procedure TFrmMovimentos.CreateToolTips(hWnd: Cardinal);
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
Procedure TFrmMovimentos.FocoToControl(Sender: TControl);
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

procedure TFrmMovimentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Not bgSairMovtos Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Botão <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('MATÉRIA-PRIMA - Movimentações');

end;

procedure TFrmMovimentos.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  // Show Hint em Forma de Balão
  CreateToolTips(Self.Handle);
  AddToolTip(EdtCodProduto.Handle, @ti, TipoDoIcone, 'Localizar/Incluir! Tecle <F9>', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Salvar.Handle, @ti, TipoDoIcone, 'Incluir/Alterar', 'DOCUMENTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Abandonar.Handle, @ti, TipoDoIcone, 'Abandonar', 'DOCUMENTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Excluir.Handle, @ti, TipoDoIcone, 'Excluir', 'DOCUMENTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Fechar.Handle, @ti, TipoDoIcone, 'Fechar', 'DOCUMENTO');

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

procedure TFrmMovimentos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmMovimentos.FormShow(Sender: TObject);
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

procedure TFrmMovimentos.Bt_FecharClick(Sender: TObject);
begin
  Dbg_Produtos.SetFocus;

  If DMArtesanalis.CDS_V_DoctoItens.Active Then
   DMArtesanalis.CDS_V_DoctoItens.Close;
   
  bgSairMovtos:=True;

  Close;

end;

procedure TFrmMovimentos.EdtNumDoctoExit(Sender: TObject);
Var
  MySql: String;
  s: String;
begin
  bgProdAlterar:=False;

  If EdtCodPessoa.Value=0 Then
  Begin
    msg('Favor Informar o Fornecedor !!','A');
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
         ' WHERE dc.origem='+QuotedStr(sgOrigem)+ // ORIGEM - Matéria-Prima
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

    CBx_TipoDocto.SetFocus;

    Exit;
  End;

  MySql:=' SELECT dc.num_seq_docto, dc.tipo, dc.num_docto, dc.num_serie, dc.dta_docto,'+
         '        dc.cod_pessoa, dc.des_pessoa,'+
         '        dc.vlr_produtos, dc.vlr_desconto, dc.vlr_total,'+
         '        di.num_seq, di.cod_produto, di.des_produto,'+
         '        di.qtd_movto, di.vlr_unitario, di.vlr_desconto, di.vlr_total'+
         ' FROM DOCTOS dc, DOCTOS_ITENS di'+
         ' WHERE dc.num_seq_docto=di.num_seq_docto'+
         ' AND   dc.origem='+QuotedStr(sgOrigem)+// ORIGEM - Matéria-Prima
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

  // Tipo de Documento
  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Tipo').AsString)='E'  Then  s:='Documento   de Entrada';
  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Tipo').AsString)='S'  Then  s:='Documento   de Saída';
  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Tipo').AsString)='DE' Then  s:='Devolução   de Entrada';
  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Tipo').AsString)='DS' Then  s:='Devolução   de Saída';
  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Tipo').AsString)='BE' Then  s:='Bonificação de Entrada';
  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Tipo').AsString)='BS' Then  s:='Bonificação de Saída';
  CBx_TipoDocto.ItemIndex := CBx_TipoDocto.Items.IndexOf(s);

  EdtSerieDocto.Text   :=DMArtesanalis.CDS_Busca.FieldByName('num_serie').AsString;
  DtEdt_DtaDocto.Date  :=DMArtesanalis.CDS_Busca.FieldByName('dta_docto').AsDateTime;
  EdtVlrProdutos.Value :=DMArtesanalis.CDS_Busca.FieldByName('vlr_produtos').AsCurrency;
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

procedure TFrmMovimentos.EdtCodPessoaChange(Sender: TObject);
begin
  // Incicializa Produtos ======================================================
  If DMArtesanalis.CDS_V_DoctoItens.Active Then
   DMArtesanalis.CDS_V_DoctoItens.Close;

  DMArtesanalis.CDS_V_DoctoItens.CreateDataSet;
  DMArtesanalis.CDS_V_DoctoItens.Open;
  sgTpPesSelect:='';
end;

procedure TFrmMovimentos.Bt_AbandonarClick(Sender: TObject);
begin
  Dbg_Produtos.SetFocus;

  FormShow(Self);
end;

procedure TFrmMovimentos.Dbg_ProdutosEnter(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clMoneyGreen;
end;

procedure TFrmMovimentos.Dbg_ProdutosExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clWindow;
end;

procedure TFrmMovimentos.EdtCodProdutoEnter(Sender: TObject);
begin
  FocoToControl(EdtCodProduto);
end;

procedure TFrmMovimentos.EdtCodPessoaExit(Sender: TObject);
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
         ' WHERE p.cod_pessoa='+IntToStr(EdtCodPessoa.AsInteger);
  DMArtesanalis.CDS_BuscaRapida.Close;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMArtesanalis.CDS_BuscaRapida.Open;

  If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Nome').AsString)='' Then
  Begin
    Screen.Cursor:=crDefault;
    DMArtesanalis.CDS_BuscaRapida.Close;
    msg('Cliente/Fornecedor Não Encontrado !!','A');
    EdtCodPessoa.SetFocus;
    Exit;
  End;
  EdtDesPessoa.Text:=Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Nome').AsString);
  sgTpPesSelect    :=Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Tipo').AsString);
  DMArtesanalis.CDS_BuscaRapida.Close;

  Screen.Cursor:=crDefault;
  EdtNumDocto.SetFocus;

end;

procedure TFrmMovimentos.Bt_BuscaPessoaClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_Produtos.SetFocus;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.des_pessoa Nome, p.cod_pessoa Codigo'+
         ' FROM PESSOAS p'+
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
    msg('Sem Cliente/Fornecedor a Listar !!','A');
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

procedure TFrmMovimentos.Bt_NovaPessoaClick(Sender: TObject);
begin
  Dbg_Produtos.SetFocus;

  FrmCadastroPessoa.bgTransportar:=True;
  FrmCadastroPessoa.sgTipoPessoa:='';
  FrmCadastroPessoa.ShowModal;

  If FrmCadastroPessoa.bgTransportar Then
  Begin
    EdtCodPessoa.AsInteger:=StrToInt(FrmCadastroPessoa.sgCodPesTransportar);
    EdtCodPessoaExit(Self);
  End;

end;

procedure TFrmMovimentos.CBx_TipoDoctoSelect(Sender: TObject);
begin
  If pos('Saída',CBx_TipoDocto.Text)<>0 Then
   sgTpPesDocto:='C'
  Else
   sgTpPesDocto:='F';

end;

procedure TFrmMovimentos.EdtCodPessoaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // <F9> Busca Pessoa =========================================================
  If Key=VK_F9 Then
   Bt_BuscaPessoaClick(Self);
end;

procedure TFrmMovimentos.EdtCodProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // <F9> Busca Produto ========================================================
  If Key=VK_F9 Then
  Begin
    If Not bgProdAlterar Then
     LimpaProduto();

    // Busca Produtos -----------------------------------------------
    bgProdIncluir:=False;
    ProdutoLocaliza;

    If bgProdIncluir Then
    Begin
      DMArtesanalis.CDS_MateriaPrima.Open;

      FrmMateriaPrimaCadastro.bgTransportar:=True;

      FrmMateriaPrimaCadastro.ShowModal;

      If FrmMateriaPrimaCadastro.bgTransportar Then
      Begin
        EdtCodProduto.AsInteger:=FrmMateriaPrimaCadastro.EdtMateriaPrimaCod.AsInteger;
        EdtCodProdutoExit(Self);
      End;
    End; // If bgProdIncluir Then
  End; // If Key=VK_F9 Then

end;

procedure TFrmMovimentos.EdtCodProdutoExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtCodProduto.asInteger=0 Then
   Exit;

  Screen.Cursor:=crAppStart;

  MySql:=' SELECT m.des_materiaprima,  m.cod_materiaprima'+
         ' FROM MATERIAPRIMA m'+
         ' WHERE m.cod_materiaprima='+IntToStr(EdtCodProduto.AsInteger);
  DMArtesanalis.CDS_BuscaRapida.Close;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMArtesanalis.CDS_BuscaRapida.Open;

  If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('cod_materiaprima').AsString)='' Then
  Begin
    Screen.Cursor:=crDefault;
    DMArtesanalis.CDS_BuscaRapida.Close;
    msg('Produto Não Encontrado !!','A');
    EdtCodProduto.SetFocus;
    Exit;
  End;
  EdtDesProduto.Text:=Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('des_materiaprima').AsString);
  DMArtesanalis.CDS_BuscaRapida.Close;

  Screen.Cursor:=crDefault;

  EdtQtdProduto.SetFocus;
end;

procedure TFrmMovimentos.Bt_ExcluiProdutoClick(Sender: TObject);
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
    i:=0;
    DMArtesanalis.CDS_V_DoctoItens.DisableControls;
    DMArtesanalis.CDS_V_DoctoItens.First;
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

procedure TFrmMovimentos.Bt_IncluiProdutoClick(Sender: TObject);
Var
  iSeqProd: Integer;
  c: Currency;
begin
  Dbg_Produtos.SetFocus;

  c:=(EdtQtdProduto.AsInteger*EdtVlrUnitProduto.Value)-EdtVlrDescProduto.Value;
  If EdtVlrTotalProduto.Value<>(c) Then
  Begin
    msg('Valor Total do Produto Não esta Fechando !!'+cr+cr+'Valor Correto: '+cr+cr+FormatFloat('0,.00',c),'A');
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
  DMArtesanalis.CDS_V_DoctoItens.Locate('NUM_SEQ', iSeqProd,[]);

  EdtCodProduto.SetFocus;
end;

procedure TFrmMovimentos.EdtVlrTotalProdutoEnter(Sender: TObject);
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

procedure TFrmMovimentos.Bt_SalvarClick(Sender: TObject);
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
    msg('Favor Informar o'+cr+cr+'Número do Documento !!','A');
    EdtNumDocto.SetFocus;
    Exit;
  End;

  If CBx_TipoDocto.ItemIndex<0 Then
  Begin
    msg('Favor Informar o '+cr+cr+'Tipo do Documento !!','A');
    CBx_TipoDocto.SetFocus;
    Exit;
  End;

  If Trim(EdtSerieDocto.Text)='' Then
  Begin
    msg('Favor Informar a'+cr+cr+'Série do Documento !!','A');
    EdtSerieDocto.SetFocus;
    Exit;
  End;

  try
    StrToDate(DtEdt_DtaDocto.Text);
  Except
    msg('Favor Informar a Data de '+cr+cr+'Emissão do Documento !!','A');
    DtEdt_DtaDocto.SetFocus;
    Exit;
  End;

  If DtEdt_DtaDocto.Date>Date Then
  Begin
    msg('Data de Emissão Maior'+cr+cr+'Que Data de Hoje !!','A');
    DtEdt_DtaDocto.SetFocus;
    Exit;
  End;

  If EdtVlrProdutos.Value<=0 Then
  Begin
    msg('Favor Informar o'+cr+cr+'Valor dos Produtos !!','A');
    EdtVlrProdutos.SetFocus;
    Exit;
  End;

  If EdtVlrTotal.Value<=0 Then
  Begin
    msg('Favor Informar o'+cr+cr+'Valor Total do Documento !!','A');
    EdtVlrTotal.SetFocus;
    Exit;
  End;

  If DMArtesanalis.CDS_V_DoctoItens.IsEmpty Then
  Begin
    msg('Impossível Salvar !!'+cr+'Documento Sem Produto !!','A');
    EdtCodProduto.SetFocus;
    Exit;
  End;

  If EdtVlrTotal.Value<>EdtVlrTotalCalculado.Value Then
  Begin
    msg('Valor Total do Documento'+cr+cr+'Diferente do Valor Total Calculado !!','A');
    EdtVlrTotal.SetFocus;
    Exit;
  End;

  // Inclui Novo Documento =====================================================
  DocumentoIncluirExcluir('I');
end;

procedure TFrmMovimentos.Bt_ExcluirClick(Sender: TObject);
begin
  Dbg_Produtos.SetFocus;

  If (DMArtesanalis.CDS_V_DoctoItens.IsEmpty) Or (EdtCodProduto.Enabled) Then
   Exit;

  If msg('Deseja Realmente Excluir'+cr+cr+'O Documento Selecionado ??','C')=2 Then
   Exit;

  DocumentoIncluirExcluir('E');

end;

procedure TFrmMovimentos.Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  i: Integer;
  s: String;
begin
  // Não Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  // Localiza Materia-Prima ====================================================
  If Key=VK_F4 Then
  Begin
    If Not DMArtesanalis.CDS_V_DoctoItens.IsEmpty Then
    Begin
      i:=DMArtesanalis.CDS_V_DoctoItens.RecNo;

      s:='';
      If InputQuery('Localizar Produto','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            If Not DMArtesanalis.CDS_V_DoctoItens.Locate('COD_PRODUTO',StrToInt(s),[]) Then
            Begin
              DMArtesanalis.CDS_V_DoctoItens.RecNo:=i;
              msg('Produto Não Encontrado !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMArtesanalis.CDS_V_DoctoItens, 'DES_PRODUTO', s) Then
            Begin
              DMArtesanalis.CDS_V_DoctoItens.RecNo:=i;
              msg('Produto Não Encontrado !!','A');
            End;
          End; // Try
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Produto','',s) then
    End; // If Not DMArtesanalis.CDS_V_DoctoItens.IsEmpty Then
  End; //If Key=VK_F4 Then

end;

procedure TFrmMovimentos.Dbg_ProdutosDblClick(Sender: TObject);
begin
  If (DMArtesanalis.CDS_V_DoctoItens.IsEmpty) Or (not EdtCodProduto.Enabled) Then
   Exit;

  LimpaProduto();

  EdtSeqProduto.AsInteger :=DMArtesanalis.CDS_V_DoctoItensNUM_SEQ.AsInteger;
  EdtCodProduto.AsInteger :=DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsInteger;
  EdtDesProduto.Text      :=DMArtesanalis.CDS_V_DoctoItensDES_PRODUTO.AsString;
  EdtQtdProduto.Value     :=DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsCurrency;
  EdtVlrUnitProduto.Value :=DMArtesanalis.CDS_V_DoctoItensVLR_UNITARIO.AsCurrency;
  EdtVlrDescProduto.Value :=DMArtesanalis.CDS_V_DoctoItensVLR_DESCONTO.AsCurrency;
  EdtVlrTotalProduto.Value:=DMArtesanalis.CDS_V_DoctoItensVLR_TOTAL.AsCurrency;

  bgProdAlterar:=True;
  EdtCodProduto.SetFocus;
end;

procedure TFrmMovimentos.Bt_AbandonarProdutoClick(Sender: TObject);
begin
  LimpaProduto();

  bgProdAlterar:=False;

  EdtCodProduto.SetFocus;
end;

procedure TFrmMovimentos.Bt_IncluiProdutoEnter(Sender: TObject);
begin
  FocoToControl(Bt_IncluiProduto);
end;

procedure TFrmMovimentos.Bt_ExcluiProdutoEnter(Sender: TObject);
begin
  FocoToControl(Bt_ExcluiProduto);

end;

procedure TFrmMovimentos.Bt_AbandonarProdutoEnter(Sender: TObject);
begin
  FocoToControl(Bt_AbandonarProduto);

end;

procedure TFrmMovimentos.Dbe_VlrTotalCalculadoChange(Sender: TObject);
begin
  Try
    EdtVlrTotalCalculado.Value:=DMArtesanalis.CDS_V_DoctoItensVlr_TotalCalculado.Value;
  Except
    EdtVlrTotalCalculado.Value:=0.00;
  End;
end;

procedure TFrmMovimentos.EdtVlrDescProdutoExit(Sender: TObject);
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

procedure TFrmMovimentos.EdtQtdProdutoEnter(Sender: TObject);
begin
  EdtVlrTotalProduto.Value:=(EdtQtdProduto.AsInteger*EdtVlrUnitProduto.Value)-EdtVlrDescProduto.Value;

end;

procedure TFrmMovimentos.EdtVlrTotalCalculadoChange(Sender: TObject);
begin
  Try
    EdtVlrTotalCalculado.Value:=DMArtesanalis.CDS_V_DoctoItensVlr_TotalCalculado.Value;
  Except
    EdtVlrTotalCalculado.Value:=0.00;
  End;

end;

End.
