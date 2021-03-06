unit UFrmProdutoCadastro;

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
  dxSkinsdxStatusBarPainter, dxStatusBar, Grids, DBGrids, JvExControls,
  JvXPCore, JvXPButtons, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls,
  Commctrl, // SHOW HINT EM FORMA DE BAL�O
  DBXpress, Math;

type
  TFrmProdutoCadastro = class(TForm)
    Gb_Principal: TGroupBox;
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    Bt_ProdutoSalvar: TJvXPButton;
    Bt_ProdutoAbandonar: TJvXPButton;
    Bt_ProdutoExcluir: TJvXPButton;
    Pan_ProdutoSolic: TPanel;
    Gb_Produto: TGroupBox;
    EdtProdutoDesc: TEdit;
    EdtProdutoCod: TCurrencyEdit;
    Bt_ProdutoBusca: TJvXPButton;
    Gb_ProdutoPcCusto: TGroupBox;
    EdtProdutoPcCusto: TCurrencyEdit;
    Gb_ProdutoUnidade: TGroupBox;
    EdtProdutoUnidade: TEdit;
    Gb_ProdutoCustoMedio: TGroupBox;
    EdtProdutoCustoMedio: TCurrencyEdit;
    Gb_ProdutoPcVenda: TGroupBox;
    EdtProdutoPcVenda: TCurrencyEdit;
    Gb_ProdutoPercMargem: TGroupBox;
    EdtProdutoPercMargem: TCurrencyEdit;
    Gb_ProdutoQtdSaldo: TGroupBox;
    EdtProdutoQtdSaldo: TCurrencyEdit;
    Gb_ProdutoPercMarkUp: TGroupBox;
    EdtProdutoPercMarkUp: TCurrencyEdit;
    Gb_MateriaPrima: TGroupBox;
    Dbg_ProdutoMatPrima: TDBGrid;
    StB_Produto: TdxStatusBar;
    Gb_Producao: TGroupBox;
    Dbg_ProdutoProducao: TDBGrid;
    dxStatusBar1: TdxStatusBar;
    Panel1: TPanel;
    OdirPanApres: TPanel;
    Gb_ProdutoVlrMargem: TGroupBox;
    EdtProdutoVlrMargem: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);

    // Odir ====================================================================

    // Hint em Fortma de Bal�o
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Bal�o
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente

    Procedure LimpaComponentes;
    Procedure ProducaoBusca;

    Function  DMLProduto(sTipo: String): Boolean;
                      // sTipo:
                      // (IA)  Incluir/Alterar Produto
                      // (EX)  Excluir Produto
                      // (IAM) Incluir/Alterar Mat�ria-Prima da Produ��o do Produto
                      // (AM)  Alterar Mat�ria-Prima da Produ��o do Produto
                      // (EXM) Excluir Mat�ria-Prima da Produ��o do Produto

    // Odir ====================================================================

    procedure EdtProdutoCodExit(Sender: TObject);
    procedure Dbg_ProdutoMatPrimaExit(Sender: TObject);
    procedure Dbg_ProdutoMatPrimaEnter(Sender: TObject);
    procedure Dbg_ProdutoMatPrimaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtProdutoCodChange(Sender: TObject);
    procedure Bt_ProdutoBuscaClick(Sender: TObject);
    procedure Bt_ProdutoAbandonarClick(Sender: TObject);
    procedure Bt_ProdutoExcluirClick(Sender: TObject);
    procedure Dbg_ProdutoMatPrimaDblClick(Sender: TObject);
    procedure Bt_ProdutoSalvarClick(Sender: TObject);
    procedure Dbg_ProdutoProducaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Dbg_ProdutoProducaoDblClick(Sender: TObject);
    procedure Dbg_ProdutoProducaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure EdtProdutoDescExit(Sender: TObject);
    procedure EdtProdutoPercMargemChange(Sender: TObject);
    procedure EdtProdutoPercMarkUpChange(Sender: TObject);
    procedure EdtProdutoPcVendaExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const 
  // Show Hint em Forma de Bal�o
  TTS_BALLOON = $40; 
  TTM_SETTITLE = (WM_USER + 32); 
  //////////////////////////////

var
  FrmProdutoCadastro: TFrmProdutoCadastro;

  // Show Hint em Forma de Bal�o
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  TD: TTransactionDesc;

  bgSairProduto: Boolean;

  sgPercProducao, sgQtdProducao,
  sgMensagem: String;

implementation

uses UDMArtesanalis, DK_Procs1, UPesquisa, DB;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// BUSCA Mat�rias-Primas do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmProdutoCadastro.ProducaoBusca;
Begin
  DMArtesanalis.CDS_ProdutoProducao.Close;
  DMArtesanalis.SQLQ_ProdutoProducao.Params.ParamByName('CodProd').AsInteger:=EdtProdutoCod.AsInteger;
  DMArtesanalis.CDS_ProdutoProducao.Open;
end; // BUSCA Mat�rias-Primas do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manipua��o de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmProdutoCadastro.DMLProduto(sTipo: String): Boolean;
Var
  MySql: String;
  iCodMatPri: Integer;
  cCustoMedio, cPcCusto: Currency;
Begin
  // sTipo:
  // (IA)  Incluir/Alterar Produto
  // (EX)  Excluir Produto
  // (IAM) Incluir/Alterar Mat�ria-Prima da Produ��o do Produto
  // (AM)  Alterar Mat�ria-Prima da Produ��o do Produto
  // (EXM) Excluir Mat�ria-Prima da Produ��o do Produto

  Result:=True;
  sgMensagem:='';

  OdirPanApres.Caption:='AGUARDE !! Atualizando Produto !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmProdutoCadastro.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmProdutoCadastro.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmProdutoCadastro;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica se Transa��o esta Ativa
  If DMArtesanalis.SQLC.InTransaction Then
   DMArtesanalis.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMArtesanalis.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // (IA) Incluir/Alterar Produto ============================================
    // (IAM) Incluir/Alterar Mat�ria-Prima da Produ��o do Produto
    // (AM)  Alterar Mat�ria-Prima da Produ��o do Produto
    // (EXM) Excluir Mat�ria-Prima da Produ��o do Produto
    If (sTipo='IA') Or (sTipo='IAM') Or (sTipo='AM') Or (sTipo='EXM') Then
    Begin
      MySql:=' UPDATE OR INSERT INTO PRODUTO'+
             ' (COD_PRODUTO, DES_PRODUTO, DES_UNIDADE, PRECO_CUSTO, CUSTO_MEDIO,'+
             '  PRECO_VENDA, PER_MARGEM, VLR_MARGEM, PER_MARKUP, QTD_ESTOQUE)'+
             ' VALUES ('+
             IntToStr(EdtProdutoCod.AsInteger)+', '+ // COD_PRODUTO
             QuotedStr(EdtProdutoDesc.Text)+', '+ // DES_PRODUTO
             QuotedStr(EdtProdutoUnidade.Text)+', '+ // DES_UNIDADE,
             QuotedStr(f_Troca(',','.',VarToStr(EdtProdutoPcCusto.Value)))+', '+ // PRECO_CUSTO
             QuotedStr(f_Troca(',','.',VarToStr(EdtProdutoCustoMedio.Value)))+', '+ // CUSTO_MEDIO
             QuotedStr(f_Troca(',','.',VarToStr(EdtProdutoPcVenda.Value)))+', '+ // PRECO_VENDA
             QuotedStr(f_Troca(',','.',VarToStr(EdtProdutoPercMargem.Value)))+', '+ // PER_MARGEM
             QuotedStr(f_Troca(',','.',VarToStr(EdtProdutoVlrMargem.Value)))+', '+ // VLR_MARGEM
             QuotedStr(f_Troca(',','.',VarToStr(EdtProdutoPercMarkUp.Value)))+', '+ // PER_MARKUP
             QuotedStr(f_Troca(',','.',VarToStr(EdtProdutoQtdSaldo.Value)))+')'+ // QTD_ESTOQUE
             ' MATCHING (COD_PRODUTO)';
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='IA' Then

    // (EX) Excluir Produto ====================================================
    If sTipo='EX' Then
    Begin
      MySql:=' DELETE FROM PRODUCAO pd'+
             ' WHERE  pd.cod_produto='+IntToStr(EdtProdutoCod.AsInteger);
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);

      MySql:=' DELETE FROM PRODUTO pr'+
             ' WHERE  pr.cod_produto='+IntToStr(EdtProdutoCod.AsInteger);
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='EX' Then

     // (AM) Alterar Materia-Prima da Produ��o do Produto ======================
    If sTipo='AM' Then
    Begin
      DecimalSeparator:=',';

      iCodMatPri:=DMArtesanalis.CDS_ProdutoProducaoCOD_MATERIAPRIMA.AsInteger;

      MySql:=' UPDATE OR INSERT INTO PRODUCAO'+
             ' (COD_PRODUTO, COD_MATERIAPRIMA, QTD_UTILIZACAO, PER_UTILIZACAO,'+
             '  PRECO_CUSTO, CUSTO_MEDIO, PRECO_VENDA, PER_MARGEM, VLR_MARGEM)'+
             ' VALUES ('+
             IntToStr(EdtProdutoCod.AsInteger)+', '+ // COD_PRODUTO
             IntToStr(DMArtesanalis.CDS_ProdutoProducaoCOD_MATERIAPRIMA.AsInteger)+', '+ // COD_MATERIAPRIMA
             QuotedStr(f_Troca(',','.',sgQtdProducao))+', '+ // PER_UTILIZACAO
             QuotedStr(f_Troca(',','.',sgPercProducao))+', '; // PER_UTILIZACAO

             // PRECO_CUSTO
             cPcCusto:=0.0000;
             If DMArtesanalis.CDS_ProdutoMatPrimaPRECO_CUSTO.AsCurrency<>0 Then
              cPcCusto:=RoundTo(((DMArtesanalis.CDS_ProdutoMatPrimaPRECO_CUSTO.AsCurrency * StrToCurr(sgPercProducao))/100),-4);
      MySql:=
       MySql+QuotedStr(f_Troca(',','.',CurrToStr(cPcCusto)))+', ';

             // CUSTO_MEDIO
             cCustoMedio:=0.0000;
             If DMArtesanalis.CDS_ProdutoMatPrimaCUSTO_MEDIO.AsCurrency<>0 Then
              cCustoMedio:=RoundTo(((DMArtesanalis.CDS_ProdutoMatPrimaCUSTO_MEDIO.AsCurrency * StrToCurr(sgPercProducao))/100),-4);
      MySql:=
       MySql+QuotedStr(f_Troca(',','.',CurrToStr(cCustoMedio)))+', ';

      // PRECO_VENDA, PER_MARGEM, VLR_MARGEM
      MySql:=
       MySql+' 0.00, 0.00, 0.00)'+
             ' MATCHING (COD_PRODUTO, COD_MATERIAPRIMA)';

      DecimalSeparator:='.';
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='AM' Then

    // (IAM) Incluir/Alterar Materia-Prima da Produ��o do Produto ==============
    If sTipo='IAM' Then
    Begin
      DecimalSeparator:=',';

      iCodMatPri:=DMArtesanalis.CDS_ProdutoMatPrimaCOD_MATERIAPRIMA.AsInteger;

      MySql:=' UPDATE OR INSERT INTO PRODUCAO'+
             ' (COD_PRODUTO, COD_MATERIAPRIMA, QTD_UTILIZACAO, PER_UTILIZACAO,'+
             '  PRECO_CUSTO, CUSTO_MEDIO, PRECO_VENDA, PER_MARGEM, VLR_MARGEM)'+
             ' VALUES ('+
             IntToStr(EdtProdutoCod.AsInteger)+', '+ // COD_PRODUTO
             IntToStr(DMArtesanalis.CDS_ProdutoMatPrimaCOD_MATERIAPRIMA.AsInteger)+', '+ // COD_MATERIAPRIMA
             QuotedStr(f_Troca(',','.',sgQtdProducao))+', '+ // QTD_UTILIZACAO
             QuotedStr(f_Troca(',','.',sgPercProducao))+', '; // PER_UTILIZACAO

             // PRECO_CUSTO
             cPcCusto:=0.0000;
             If DMArtesanalis.CDS_ProdutoMatPrimaPRECO_CUSTO.AsCurrency<>0 Then
              cPcCusto:=RoundTo(((DMArtesanalis.CDS_ProdutoMatPrimaPRECO_CUSTO.AsCurrency * StrToCurr(sgPercProducao))/100),-4);
      MySql:=
       MySql+QuotedStr(f_Troca(',','.',CurrToStr(cPcCusto)))+', ';

             // CUSTO_MEDIO
             cCustoMedio:=0.0000;
             If DMArtesanalis.CDS_ProdutoMatPrimaCUSTO_MEDIO.AsCurrency<>0 Then
              cCustoMedio:=RoundTo(((DMArtesanalis.CDS_ProdutoMatPrimaCUSTO_MEDIO.AsCurrency * StrToCurr(sgPercProducao))/100),-4);
      MySql:=
       MySql+QuotedStr(f_Troca(',','.',CurrToStr(cCustoMedio)))+', ';

      // PRECO_VENDA, PER_MARGEM, VLR_MARGEM
      MySql:=
       MySql+' 0.00, 0.00, 0.00)'+
             ' MATCHING (COD_PRODUTO, COD_MATERIAPRIMA)';

      DecimalSeparator:='.';
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='IAM' Then

    // (EXM) Excluir Materia-Prima da Produ��o do Produto ======================
    If sTipo='EXM' Then
    Begin
      MySql:=' DELETE FROM PRODUCAO pd'+
             ' WHERE  pd.cod_produto='+IntToStr(EdtProdutoCod.AsInteger)+
             ' AND    pd.cod_materiaprima='+DMArtesanalis.CDS_ProdutoProducaoCOD_MATERIAPRIMA.AsString;
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='EXM' Then

    // Atualiza Transacao ======================================================
    DMArtesanalis.SQLC.Commit(TD);

    // Reabre Transa��o ========================================================
    DMArtesanalis.SQLC.StartTransaction(TD);

    // Reabre Mat�ria-Prima da Produ��o do Produto =============================
    // (IAM) Incluir/Alterar Mat�ria-Prima da Produ��o do Produto
    // (AM)  Alterar Mat�ria-Prima da Produ��o do Produto
    // (EXM) Excluir Mat�ria-Prima da Produ��o do Produto
    If (sTipo='IAM') Or (sTipo='AM') Or (sTipo='EXM') Then
    Begin
      DMArtesanalis.CDS_ProdutoProducao.Close;
      DMArtesanalis.CDS_ProdutoProducao.Open;
    End;

    // Acertas Valores do Produto ==============================================
    If (sTipo='IAM') Or (sTipo='AM') Or (sTipo='EXM') Then
    Begin
      // Localiza Pre�o de Custo =========================
      DMArtesanalis.CDS_ProdutoProducao.Last;
      cPcCusto   :=RoundTo(DMArtesanalis.CDS_ProdutoProducaoPRECO_CUSTO.AsCurrency,-2);
      cCustoMedio:=RoundTo(DMArtesanalis.CDS_ProdutoProducaoCUSTO_MEDIO.AsCurrency,-2);

      DMArtesanalis.CDS_ProdutoProducao.Locate('COD_MATERIAPRIMA', iCodMatPri,[]);

      MySql:=' SELECT '+
             f_Troca(',','.',CurrToStr(cPcCusto))+' PRECO_CUSTO,'+
             f_Troca(',','.',CurrToStr(cCustoMedio))+' CUSTO_MEDIO,'+

             ' CASE'+
             '   WHEN (pr.preco_venda=0) AND ('+f_Troca(',','.',CurrToStr(cPcCusto))+'=0) THEN'+
             '      0.00'+
             '   WHEN pr.preco_venda=0 THEN'+
             '      -100.00'+
             '   ELSE'+
             '      ((pr.preco_venda - '+f_Troca(',','.',CurrToStr(cPcCusto))+') / pr.preco_venda) * 100'+
             ' end PER_MARGEM,'+
             ' (pr.preco_venda - '+f_Troca(',','.',CurrToStr(cPcCusto))+') VLR_MARGEM,'+

             ' CASE'+
             '   WHEN (pr.preco_venda=0) AND ('+f_Troca(',','.',CurrToStr(cPcCusto))+'=0) THEN'+
             '      0.00'+
             '   WHEN pr.preco_venda=0 THEN'+
             '      -100.00'+
             '   ELSE'+
             '     ((pr.preco_venda - '+f_Troca(',','.',CurrToStr(cPcCusto))+') * 100) / '+f_Troca(',','.',CurrToStr(cPcCusto))+
             ' end PER_MARKUP'+

             ' FROM PRODUCAO pd, PRODUTO pr'+
             ' WHERE pd.cod_produto = pr.cod_produto'+
             ' AND   pr.cod_produto = '+IntToStr(EdtProdutoCod.AsInteger)+

             ' GROUP BY pr.preco_venda';
      DMArtesanalis.CDS_Busca.Close;
      DMArtesanalis.SQLQ_Busca.SQL.Clear;
      DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
      DMArtesanalis.CDS_Busca.Open;

      DecimalSeparator:=',';
      EdtProdutoPcCusto.Value:=0.00;
      If Trim(DMArtesanalis.CDS_Busca.FieldByName('Preco_Custo').AsString)<>'' Then
       EdtProdutoPcCusto.Value:=DMArtesanalis.CDS_Busca.FieldByName('Preco_Custo').AsCurrency;

      EdtProdutoCustoMedio.Value:=0.00;
      If Trim(DMArtesanalis.CDS_Busca.FieldByName('Custo_Medio').AsString)<>'' Then
       EdtProdutoCustoMedio.Value:=DMArtesanalis.CDS_Busca.FieldByName('Custo_Medio').AsCurrency;

      EdtProdutoPercMargem.Value:=0.00;
      If Trim(DMArtesanalis.CDS_Busca.FieldByName('Per_Margem').AsString)<>'' Then
       EdtProdutoPercMargem.Value:=DMArtesanalis.CDS_Busca.FieldByName('Per_Margem').AsCurrency;

      EdtProdutoVlrMargem.Value:=0.00;
      If Trim(DMArtesanalis.CDS_Busca.FieldByName('Vlr_Margem').AsString)<>'' Then
       EdtProdutoVlrMargem.Value:=DMArtesanalis.CDS_Busca.FieldByName('Vlr_Margem').AsCurrency;

      EdtProdutoPercMarkUp.Value:=0.00;
      If Trim(DMArtesanalis.CDS_Busca.FieldByName('Per_MarkUp').AsString)<>'' Then
       EdtProdutoPercMarkUp.Value:=DMArtesanalis.CDS_Busca.FieldByName('Per_MarkUp').AsCurrency;

      DecimalSeparator:='.';
      DMArtesanalis.CDS_Busca.Close;

      MySql:=' UPDATE PRODUTO pr'+
             ' SET pr.preco_custo='+QuotedStr(f_Troca(',','.',FloatToStr(EdtProdutoPcCusto.Value)))+
             ',    pr.custo_medio='+QuotedStr(f_Troca(',','.',FloatToStr(EdtProdutoCustoMedio.Value)))+
             ',    pr.per_margem='+QuotedStr(f_Troca(',','.',FloatToStr(EdtProdutoPercMargem.Value)))+
             ',    pr.vlr_margem='+QuotedStr(f_Troca(',','.',FloatToStr(EdtProdutoVlrMargem.Value)))+
             ',    pr.per_markup='+QuotedStr(f_Troca(',','.',FloatToStr(EdtProdutoPercMarkUp.Value)))+
             ' WHERE pr.cod_produto='+IntToStr(EdtProdutoCod.AsInteger);
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);
    End; // If (sTipo='IAM') Or (sTipo='AM') Or (sTipo='EXM') Then

    // Atualiza Transacao ======================================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMArtesanalis.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;

      Screen.Cursor:=crDefault;
      sgMensagem:=e.message;

      Result:=False;
      Exit;
    End; // on e : Exception do
  End; // Try da Transa��o

  If (sTipo='IA') Then
   msg('Inclus�o/Altera��o Efetuada com SUCESSO !!','A');

End; // Manipua��o de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Procedure TFrmProdutoCadastro.LimpaComponentes;
Var
  i: Integer;
Begin
  For i:=0 to FrmProdutoCadastro.ComponentCount-1 do
  Begin
    If FrmProdutoCadastro.Components[i] is TEdit Then
     (FrmProdutoCadastro.Components[i] as TEdit).Clear;

    If FrmProdutoCadastro.Components[i] is TCurrencyEdit Then
     (FrmProdutoCadastro.Components[i] as TCurrencyEdit).Value:=0;
  End; // For i:=0 to FrmProdutoCadastro.ComponentCount-1 do

  Bt_ProdutoSalvar.Enabled   :=False;
  Bt_ProdutoAbandonar.Enabled:=False;
  Bt_ProdutoExcluir.Enabled  :=False;

  DMArtesanalis.CDS_ProdutoProducao.Close;
End;

// Show Hint em Forma de Bal�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmProdutoCadastro.CreateToolTips(hWnd: Cardinal);
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
end; // Show Hint em Forma de Bal�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Bal�o - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>>>>>>
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
end; // Show Hint em Forma de Bal�o - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Bal�o - Posiciona do Componente >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmProdutoCadastro.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Bal�o - Posiciona do Componente >>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmProdutoCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Not bgSairProduto Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Bot�o <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  DMArtesanalis.CDS_ProdutoMatPrima.Close;
  DMArtesanalis.CDS_ProdutoProducao.Close;

  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('Cadastro de Produto');

end;

procedure TFrmProdutoCadastro.FormCreate(Sender: TObject);
const  
  TipoDoIcone = 1; // Show Hint em Forma de Bal�o
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // N�o Permite Movimentar o Formul�rio =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  // Show Hint em Forma de Bal�o
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ProdutoBusca.Handle, @ti, TipoDoIcone, 'Localizar', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ProdutoSalvar.Handle, @ti, TipoDoIcone, 'Incluir/Alterar', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ProdutoAbandonar.Handle, @ti, TipoDoIcone, 'Abandonar', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ProdutoExcluir.Handle, @ti, TipoDoIcone, 'Excluir', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Fechar.Handle, @ti, TipoDoIcone, 'Fechar', 'PRODUTO');
end;

procedure TFrmProdutoCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmProdutoCadastro.FormShow(Sender: TObject);
begin
  bgSairProduto:=False;

  LimpaComponentes;

  EdtProdutoCod.SetFocus;
end;

procedure TFrmProdutoCadastro.Bt_FecharClick(Sender: TObject);
begin
  bgSairProduto:=True;

  Close;
end;

procedure TFrmProdutoCadastro.EdtProdutoCodExit(Sender: TObject);
Var
  MySql: String;
begin
  If EdtProdutoCod.AsInteger=0 Then
  Begin
    LimpaComponentes;
  End;

  If EdtProdutoCod.AsInteger<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Produtos ============================================================
    MySql:=' SELECT *'+
           ' FROM PRODUTO pr'+
           ' WHERE pr.cod_produto='+IntToStr(EdtProdutoCod.AsInteger);
    DMArtesanalis.CDS_Busca.Close;
    DMArtesanalis.SQLQ_Busca.SQL.Clear;
    DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
    DMArtesanalis.CDS_Busca.Open;

    Screen.Cursor:=crDefault;

    If Trim(DMArtesanalis.CDS_Busca.FieldByName('Cod_Produto').AsString)<>'' Then
    Begin
      EdtProdutoDesc.Text       :=DMArtesanalis.CDS_Busca.FieldByName('DES_PRODUTO').AsString;
      EdtProdutoUnidade.Text    :=DMArtesanalis.CDS_Busca.FieldByName('DES_UNIDADE').AsString;

      EdtProdutoPcCusto.Value   :=DMArtesanalis.CDS_Busca.FieldByName('PRECO_CUSTO').AsFloat;
      EdtProdutoCustoMedio.Value:=DMArtesanalis.CDS_Busca.FieldByName('CUSTO_MEDIO').AsFloat;
      EdtProdutoPcVenda.Value   :=DMArtesanalis.CDS_Busca.FieldByName('PRECO_VENDA').AsFloat;
      EdtProdutoPercMargem.Value:=DMArtesanalis.CDS_Busca.FieldByName('PER_MARGEM').AsFloat;
      EdtProdutoVlrMargem.Value :=DMArtesanalis.CDS_Busca.FieldByName('VLR_MARGEM').AsFloat;
      EdtProdutoPercMarkUp.Value:=DMArtesanalis.CDS_Busca.FieldByName('PER_MARKUP').AsFloat;
      EdtProdutoQtdSaldo.Value  :=DMArtesanalis.CDS_Busca.FieldByName('QTD_ESTOQUE').AsFloat;
                         
      ProducaoBusca;

      Bt_ProdutoSalvar.Enabled   :=True;
      Bt_ProdutoAbandonar.Enabled:=True;
      Bt_ProdutoExcluir.Enabled  :=True;
    End; // If Trim(DMArtesanalis.CDS_Busca.FieldByName('Cod_Produto').AsString)<>'' Then
    DMArtesanalis.CDS_Busca.Close;

    EdtProdutoDesc.SetFocus;
  End; // If EdtProdutoCod.AsInteger<>0 Then
end;

procedure TFrmProdutoCadastro.Dbg_ProdutoMatPrimaExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clWindow;
end;

procedure TFrmProdutoCadastro.Dbg_ProdutoMatPrimaEnter(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clMoneyGreen;

  (Sender as TDBGrid).SetFocus;
end;

procedure TFrmProdutoCadastro.Dbg_ProdutoMatPrimaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
Begin
  // N�o Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  // Localiza Materia-Prima ====================================================
  If Key=VK_F4 Then
  Begin
    If Not DMArtesanalis.CDS_ProdutoMatPrima.IsEmpty Then
    Begin
      i:=DMArtesanalis.CDS_ProdutoMatPrima.RecNo;

      s:='';
      If InputQuery('Localizar Mat�ria-Prima','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            If Not DMArtesanalis.CDS_ProdutoMatPrima.Locate('COD_MATERIAPRIMA',StrToInt(s),[]) Then
            Begin
              DMArtesanalis.CDS_ProdutoMatPrima.RecNo:=i;
              msg('Mat�ria-Prima N�o Encontrada !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMArtesanalis.CDS_ProdutoMatPrima, 'DES_MATERIAPRIMA', s) Then
            Begin
              DMArtesanalis.CDS_ProdutoMatPrima.RecNo:=i;
              msg('Mat�ria-Prima N�o Encontrada !!','A');
            End;
          End; // Try
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Mat�ria-Prima','',s) then
    End; // If Not DMArtesanalis.CDS_ProdutoMatPrima.IsEmpty Then
  End; //If Key=VK_F4 Then
end;

procedure TFrmProdutoCadastro.EdtProdutoCodChange(Sender: TObject);
begin
  If EdtProdutoCod.AsInteger=0 Then
  Begin
    LimpaComponentes;
  End;
end;

procedure TFrmProdutoCadastro.Bt_ProdutoBuscaClick(Sender: TObject);
Var
  MySql: String;
begin

  LimpaComponentes;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT pr.des_produto, pr.cod_produto'+
         ' FROM PRODUTO pr'+
         ' ORDER BY pr.des_produto';
  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMArtesanalis.CDS_Pesquisa.FieldByName('Des_Produto').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Pesquisa.Close;
    msg('Sem Produto a Listar !!','A');
    EdtProdutoCod.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Produto';
  FrmPesquisa.Campo_Codigo:='Cod_Produto';
  FrmPesquisa.Campo_Descricao:='Des_Produto';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtProdutoCod.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtProdutoCodExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmProdutoCadastro.Bt_ProdutoAbandonarClick(Sender: TObject);
begin
  Dbg_ProdutoMatPrima.SetFocus;

  LimpaComponentes;
  EdtProdutoCod.SetFocus;
end;

procedure TFrmProdutoCadastro.Bt_ProdutoExcluirClick(Sender: TObject);
begin
  Dbg_ProdutoMatPrima.SetFocus;

  If EdtProdutoCod.AsInteger=0 Then
   Exit;

  If msg('Deseja Realmente Excluir o'+cr+'Produdo Selecionado ??','C')=2 Then
  Begin
    EdtProdutoCod.SetFocus;
    Exit;
  End;

  // (EX) Excluir Produto ======================================================
  If not DMLProduto('EX') Then
   MessageBox(Handle, pChar('Erro ao Excluir o Produto !!'+#13+sgMensagem), 'ATEN��O !!', MB_ICONERROR);

  LimpaComponentes;
  EdtProdutoCod.SetFocus;

end;

procedure TFrmProdutoCadastro.Dbg_ProdutoMatPrimaDblClick(Sender: TObject);
Var
  b: Boolean;
  MySql: String;
begin
  If DMArtesanalis.CDS_ProdutoMatPrima.IsEmpty Then
   Exit;

  // Verifica Cadastramento do Produto =========================================
  If (EdtProdutoCod.AsInteger=0) And ((Trim(EdtProdutoDesc.Text)<>'') Or (Trim(EdtProdutoUnidade.Text)<>'')) Then
  Begin
    msg('Favor, Primeiramente, Salvar o Produto !!','A');
    EdtProdutoDesc.SetFocus;
    Exit;
  End;

  If EdtProdutoCod.AsInteger=0 Then
  Begin
    msg('Favor Selecionar um Produto !!','A');
    EdtProdutoCod.SetFocus;
    Exit;
  End;

  MySql:=' SELECT pr.cod_produto'+
         ' FROM PRODUTO pr'+
         ' WHERE pr.cod_produto='+IntToStr(EdtProdutoCod.AsInteger);
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;

  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Cod_Produto').AsString)='' Then
  Begin
    msg('Favor, Primeiramente, Salvar o Produto !!','A');
    EdtProdutoDesc.SetFocus;
    Exit;
  End;
  DMArtesanalis.CDS_Busca.Close;

  sgPercProducao:='';
  sgQtdProducao :='';

  // Verifica se Materia-Prima ja esta Cadastrada ==============================
  If Not DMArtesanalis.CDS_ProdutoProducao.IsEmpty Then
  Begin
    If DMArtesanalis.CDS_ProdutoProducao.Locate('COD_MATERIAPRIMA', DMArtesanalis.CDS_ProdutoMatPrimaCOD_MATERIAPRIMA.AsInteger,[]) Then
    Begin
      If msg('Mat�ria-Prima j� Cadastrada como Produ��o !!'+cr+cr+'Deseja Continuar ??','C')=2 Then
       Exit;

      sgQtdProducao:=DMArtesanalis.CDS_ProdutoProducaoQTD_UTILIZACAO.AsString;
    End; // If DMArtesanalis.CDS_ProdutoProducao.Locate('COD_MATERIAPRIMA', DMArtesanalis.CDS_ProdutoMatPrimaCOD_MATERIAPRIMA.AsInteger,[]) Then
  End; // If Not DMArtesanalis.CDS_ProdutoProducao.IsEmpty Then

  b:=True;
  While b do
  Begin
    If InputQuery('Quantidade de Utiliza��o','',sgQtdProducao) then
     Begin
       Try
         StrToInt(sgQtdProducao);
         If StrToInt(sgQtdProducao)<=0 Then
          Begin
            msg('Quantidade de Utiliza��o Inv�lida !!'+cr+'N�o Pode Ser Menor/Igual a 0 <Zero>','A');
          End
         Else
          Begin
            Break;
          End;
       Except
         msg('Quantidade de Utiliza��o'+cr+cr+'Deve ser um INTEIRO !!','A')
       End; // Try
     End
    Else
     Begin
       sgPercProducao:='';
       sgQtdProducao :='';
       Break;
     End; // If InputBoxInteiro('Informe a Quantidade de Utiliza��o','',sgQtdProducao) then
  End; // While b do

  Dbg_ProdutoMatPrima.SetFocus;

  If Trim(sgQtdProducao)='' Then
   Exit;

  // (IAM) Incluir/Alterar Mat�ria-Prima da Produ��o do Produto ================
  sgPercProducao:=CurrToStr(RoundTo(((1 / StrToCurr(sgQtdProducao))*100),-5));
  If not DMLProduto('IAM') Then
   MessageBox(Handle, pChar('Erro ao Incluir/Altera a Mat�ria-Prima'+cr+'da Produ��o do Produto !!'+#13+sgMensagem), 'ATEN��O !!', MB_ICONERROR);

end;

procedure TFrmProdutoCadastro.Bt_ProdutoSalvarClick(Sender: TObject);
begin
  Dbg_ProdutoMatPrima.SetFocus;

  // Consiste a C�digo do Produto ==============================================
  If EdtProdutoCod.AsInteger=0 Then
  Begin
    msg('Favor Informar o'+cr+cr+'C�digo do Produto !!','A');
    EdtProdutoCod.SetFocus;
    Exit;
  End;

  // Consiste a Descri��o Produto ==============================================
  If Trim(EdtProdutoDesc.Text)='' Then
  Begin
    msg('Favor Informar a'+cr+cr+'Descri��o da Produto !!','A');
    EdtProdutoDesc.SetFocus;
    Exit;
  End;

  // Consiste a Descri��o Produto ==============================================
  If Trim(EdtProdutoUnidade.Text)='' Then
  Begin
    msg('Favor Informar a'+cr+cr+'Unidade da Produto !!','A');
    EdtProdutoUnidade.SetFocus;
    Exit;
  End;

  // (IA) Incluir/Alterar Produto ==============================================
  If not DMLProduto('IA') Then
   MessageBox(Handle, pChar('Erro ao Incluir/Altera o Produto !!'+#13+sgMensagem), 'ATEN��O !!', MB_ICONERROR);

  EdtProdutoCod.SetFocus;
  EdtProdutoCodExit(Self);
end;

procedure TFrmProdutoCadastro.Dbg_ProdutoProducaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
begin
  // N�o Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  If DMArtesanalis.CDS_ProdutoProducao.IsEmpty Then
   Exit ;

  // Exclur Materia-Prima da Produ��o ==========================================
  If Key=VK_Delete Then
  Begin
    If msg('Deseja Realmente Excluir'+cr+'a Mat�ria-Prima da Produ��o'+cr+'Selecionada ??','C')=2 Then
    Begin
      Dbg_ProdutoProducao.SetFocus;
      Exit;
    End;

    // (EX) Excluir Materia-Prima da Produ��o do Produto =======================
    If not DMLProduto('EXM') Then
     MessageBox(Handle, pChar('Erro ao Excluir a Mat�ria-Prima'+cr+'da Produ��o do Produto !!'+#13+sgMensagem), 'ATEN��O !!', MB_ICONERROR);

  End; // If Key=VK_Delete Then

  // Localiza Materia-Prima ====================================================
  If Key=VK_F4 Then
  Begin
    i:=DMArtesanalis.CDS_ProdutoProducao.RecNo;

    s:='';
    If InputQuery('Localizar Mat�ria-Prima','',s) then
    Begin
      if Trim(s)<>'' then
      Begin
        Try
          StrToInt(s);
          If Not DMArtesanalis.CDS_ProdutoProducao.Locate('COD_MATERIAPRIMA',StrToInt(s),[]) Then
          Begin
            DMArtesanalis.CDS_ProdutoProducao.RecNo:=i;
            msg('Mat�ria-Prima N�o Encontrada !!','A');
          End;
        Except
          s:=AnsiUpperCase(s);
          If Not LocalizaRegistro(DMArtesanalis.CDS_ProdutoProducao, 'DES_MATERIAPRIMA', s) Then
          Begin
            DMArtesanalis.CDS_ProdutoProducao.RecNo:=i;
            msg('Mat�ria-Prima N�o Encontrada !!','A');
          End;
        End; // Try
      End; // if Trim(s)<>'' then
    End; // If InputQuery('Localizar Mat�ria-Prima','',s) then
  End; //If Key=VK_F4 Then
end;

procedure TFrmProdutoCadastro.Dbg_ProdutoProducaoDblClick(Sender: TObject);
Var
  b: Boolean;
begin
  If (DMArtesanalis.CDS_ProdutoProducao.IsEmpty) Or (DMArtesanalis.CDS_ProdutoProducaoCOD_MATERIAPRIMA.AsInteger=999999) Then
   Exit;

  If Not DMArtesanalis.CDS_ProdutoMatPrima.Locate('COD_MATERIAPRIMA',DMArtesanalis.CDS_ProdutoProducaoCOD_MATERIAPRIMA.AsString,[]) Then
  Begin
    msg('Mat�ria-Prima N�o Encontrada'+cr+cr+'na Rela��o de Mat�rias-Primas !!','A');
    Dbg_ProdutoProducao.SetFocus;
    Exit;
  End;

  sgQtdProducao:=DMArtesanalis.CDS_ProdutoProducaoQTD_UTILIZACAO.AsString;
  sgPercProducao:='';
  b:=True;
  While b do
  Begin
    If InputQuery('Quantidade de Utiliza��o','',sgQtdProducao) then
     Begin
       Try
         StrToInt(sgQtdProducao);
         If StrToInt(sgQtdProducao)<=0 Then
          Begin
            msg('Quantidade de Utiliza��o Inv�lida !!','A');
          End
         Else
          Begin
            Break;
          End; // If StrToInt(sgQtdProducao)<=0 Then
       Except
         msg('Quantidade de Utiliza��o'+cr+cr+'Deve ser um INTEIRO !!','A')
       End; // Try
     End
    Else
     Begin
       sgPercProducao:='';
       sgQtdProducao :='';
       Break;
     End; // If InputBoxInteiro('Informe a Quantidade de Utiliza��o','',sgQtdProducao) then
  End; // While b do

  Dbg_ProdutoMatPrima.SetFocus;

  If Trim(sgQtdProducao)='' Then
   Exit;

  // (IAM) Incluir/Alterar Mat�ria-Prima da Produ��o do Produto ================
  sgPercProducao:=CurrToStr(RoundTo(((1 / StrToCurr(sgQtdProducao))*100),-5));
  If not DMLProduto('AM') Then
   MessageBox(Handle, pChar('Erro ao Incluir/Altera a Mat�ria-Prima'+cr+'da Produ��o do Produto !!'+#13+sgMensagem), 'ATEN��O !!', MB_ICONERROR);
end;

procedure TFrmProdutoCadastro.Dbg_ProdutoProducaoDrawColumnCell( Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then
  Begin
    If DMArtesanalis.CDS_ProdutoProducaoCOD_MATERIAPRIMA.AsInteger=999999 Then
    Begin
      Dbg_ProdutoProducao.Canvas.Brush.Color:=clSkyBlue;
      Dbg_ProdutoProducao.Canvas.Font.Style:=[fsBold];

      Dbg_ProdutoProducao.Canvas.FillRect(Rect);
      Dbg_ProdutoProducao.DefaultDrawDataCell(Rect,Column.Field,state);
    End;
  End; // if not (gdSelected in State) Then

  // Alinhamento
  DMArtesanalis.CDS_ProdutoProducaoCOD_MATERIAPRIMA.Alignment:=taRightJustify;
  DMArtesanalis.CDS_ProdutoProducaoPER_UTILIZACAO.Alignment:=taRightJustify;
  DMArtesanalis.CDS_ProdutoProducaoPRECO_CUSTO.Alignment:=taRightJustify;
  DMArtesanalis.CDS_ProdutoProducaoCUSTO_MEDIO.Alignment:=taRightJustify;

end;

procedure TFrmProdutoCadastro.EdtProdutoDescExit(Sender: TObject);
begin
  Bt_ProdutoSalvar.Enabled   :=True;
  Bt_ProdutoAbandonar.Enabled:=True;
  Bt_ProdutoExcluir.Enabled  :=True;
end;

procedure TFrmProdutoCadastro.EdtProdutoPercMargemChange(Sender: TObject);
begin

  EdtProdutoPercMargem.Color:=clMoneyGreen;
  EdtProdutoPercMargem.Font.Style:=[];
  EdtProdutoPercMargem.Font.Color:=clWindowText;
  If EdtProdutoPercMargem.Value<0 Then
   Begin
     EdtProdutoPercMargem.Color:=clRed;
     EdtProdutoPercMargem.Font.Style:=[fsBold];
     EdtProdutoPercMargem.Font.Color:=clWhite;
   End
  Else If EdtProdutoPercMargem.Value>0 Then
   Begin
     EdtProdutoPercMargem.Color:=clBlue;
     EdtProdutoPercMargem.Font.Style:=[fsBold];
     EdtProdutoPercMargem.Font.Color:=clWhite;
   End;
end;

procedure TFrmProdutoCadastro.EdtProdutoPercMarkUpChange(Sender: TObject);
begin
  // Valor Margens Negativa ====================================================
  EdtProdutoPercMarkUp.Color:=clMoneyGreen;
  EdtProdutoPercMarkUp.Font.Style:=[];
  EdtProdutoPercMarkUp.Font.Color:=clWindowText;
  If EdtProdutoPercMarkUp.Value<0 Then
   Begin
     EdtProdutoPercMarkUp.Color:=clRed;
     EdtProdutoPercMarkUp.Font.Style:=[fsBold];
     EdtProdutoPercMarkUp.Font.Color:=clWhite;
   End
  Else If EdtProdutoPercMarkUp.Value>0 Then
   Begin
     EdtProdutoPercMarkUp.Color:=clBlue;
     EdtProdutoPercMarkUp.Font.Style:=[fsBold];
     EdtProdutoPercMarkUp.Font.Color:=clWhite;
   End;
end;

procedure TFrmProdutoCadastro.EdtProdutoPcVendaExit(Sender: TObject);
begin
  If EdtProdutoPcCusto.Value<>0 Then
  Begin
    EdtProdutoPercMargem.Value:=((EdtProdutoPcVenda.Value - EdtProdutoPcCusto.Value) / EdtProdutoPcVenda.Value) * 100;
    EdtProdutoVlrMargem.Value :=EdtProdutoPcVenda.Value-EdtProdutoPcCusto.Value;
    EdtProdutoPercMarkUp.Value:=((EdtProdutoPcVenda.Value - EdtProdutoPcCusto.Value) / EdtProdutoPcCusto.Value) * 100;
  End; // If EdtProdutoPcCusto.Value<>0 Then
end;

end.
