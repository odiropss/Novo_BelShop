unit UFrmPrioridadesReposicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, AppEvnts, JvExControls, JvXPCore,
  JvXPButtons, ExtCtrls, StdCtrls, Grids, DBGrids, JvExStdCtrls,
  JvCheckBox, Mask, JvExMask, JvToolEdit, ToolEdit, CurrEdit, JvRadioButton,
  Commctrl,DBXpress, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmPrioridadesReposicao = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    CorCaptionForm: TJvGradientCaption;
    Panel38: TPanel;
    Bt_Fechar: TJvXPButton;
    Pan_PrioridadesInforma: TPanel;
    Label5: TLabel;
    Rb_PrioridadesAtivas: TJvRadioButton;
    Rb_PrioridadesInativas: TJvRadioButton;
    Rb_PrioridadesAmbas: TJvRadioButton;
    Panel1: TPanel;
    Pan_ProdutosInforma: TPanel;
    Bt_ExcluiFornecedor: TJvXPButton;
    Bt_ExcluiProduto: TJvXPButton;
    Pan_Prioridades: TPanel;
    Panel6: TPanel;
    PanManutPrioridade: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtDesPrioridade: TEdit;
    EdtDtaInicial: TJvDateEdit;
    EdtDtaFinal: TJvDateEdit;
    CkB_Ativo: TJvCheckBox;
    Bt_PrioridadeSalvar: TJvXPButton;
    Bt_PrioridadeDesfazer: TJvXPButton;
    EdtCodPrioridade: TCurrencyEdit;
    Dbg_Prioridades: TDBGrid;
    Pan_Produtos: TPanel;
    PanManutProduto: TPanel;
    Label75: TLabel;
    Label74: TLabel;
    Label6: TLabel;
    EdtCodProdLinx: TCurrencyEdit;
    EdtCodProduto: TCurrencyEdit;
    Bt_BuscaProdtudo: TJvXPButton;
    EdtCodForn: TCurrencyEdit;
    Bt_BuscaForn: TJvXPButton;
    EdtDesFornecedor: TEdit;
    Dbg_Produto: TDBGrid;
    Sb_GeraOC: TdxStatusBar;
    dxStatusBar1: TdxStatusBar;
    OdirPanApres: TPanel;
    Label7: TLabel;
    Bt_BuscaArquivoTXT: TJvXPButton;
    Pan_Informacao: TPanel;
    EdtArquivoTXT: TEdit;
    Label8: TLabel;
    Rb_CodLinx: TJvRadioButton;
    Rb_CodSidicom: TJvRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure Dbg_PrioridadesEnter(Sender: TObject);
    procedure Dbg_PrioridadesExit(Sender: TObject);
    procedure Bt_PrioridadeSalvarClick(Sender: TObject);
    procedure Dbg_ProdutoEnter(Sender: TObject);

    // Odir ====================================================================

    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente

    Procedure LimpaComponentes;

    Procedure SalvarPrioridade;
    Procedure SalvarProduto(sCodLinx, sCodSidicom: String);
    Procedure InserirProdutosFornecedor(sCodForn: String);

    Procedure ExcluirProdutos(sCodProd, sCodForn: String);

    // Odir ====================================================================

    procedure Dbg_ProdutoExit(Sender: TObject);
    procedure Rb_PrioridadesAtivasClick(Sender: TObject);
    procedure Rb_PrioridadesAtivasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CkB_AtivoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CkB_AtivoClick(Sender: TObject);
    procedure Bt_PrioridadeDesfazerClick(Sender: TObject);
    procedure Dbg_PrioridadesDblClick(Sender: TObject);
    procedure EdtDesPrioridadeChange(Sender: TObject);
    procedure Bt_ExcluiFornecedorClick(Sender: TObject);
    procedure EdtCodProdLinxExit(Sender: TObject);
    procedure EdtCodProdutoExit(Sender: TObject);
    procedure Dbg_PrioridadesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_BuscaProdtudoClick(Sender: TObject);
    procedure EdtCodFornExit(Sender: TObject);
    procedure Bt_BuscaFornClick(Sender: TObject);
    procedure Bt_BuscaArquivoTXTClick(Sender: TObject);
    procedure Rb_CodLinxClick(Sender: TObject);
    procedure Rb_CodLinxKeyUp(Sender: TObject; var Key: Word;
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
  FrmPrioridadesReposicao: TFrmPrioridadesReposicao;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;

  bgSairPR,
  bgProduto: Boolean; // Se pode Informar Produtos

implementation

uses DK_Procs1, UDMBelShop, RTLConsts, UFrmBelShop, DB, UPesquisa,
  UFrmSolicitacoes;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exclui Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPrioridadesReposicao.ExcluirProdutos(sCodProd, sCodForn: String);
Var
  MySql: String;
Begin
  If Trim(sCodProd)<>'' Then
   OdirPanApres.Caption:='AGUARDE !! Excluindo Produto: '+DMBelShop.CDS_PrioridadeProdNOME.AsString;

  If Trim(sCodForn)<>'' Then
   OdirPanApres.Caption:='AGUARDE !! Excluindo Produtos do Fornecedor: '+DMBelShop.CDS_PrioridadeProdRAZAO_CLIENTE.AsString;

  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmPrioridadesReposicao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmPrioridadesReposicao.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmPrioridadesReposicao;
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

    MySql:=' DELETE FROM ES_REP_PRIORIDADES_PROD pp'+
           ' WHERE pp.cod_prioridade='+DMBelShop.CDS_PrioridadesCOD_PRIORIDADE.AsString;

           If Trim(sCodProd)<>'' Then
            MySql:=
             MySql+' AND   pp.cod_produto='+DMBelShop.CDS_PrioridadeProdCOD_PRODUTO.AsString;

           If Trim(sCodForn)<>'' Then
            MySql:=
             MySql+' AND   EXISTS (SELECT 1'+
                   '               FROM LINXPRODUTOS pr'+
                   '               WHERE pr.cod_produto=pp.cod_produto'+
                   '               AND   pr.cod_fornecedor='+DMBelShop.CDS_PrioridadeProdCOD_FORNECEDOR.AsString+')';
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
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
      Exit;
    End; // on e : Exception do
  End; // Try da Transação

  DMBelShop.CDS_PrioridadesAfterScroll(DMBelShop.CDS_Prioridades);

  msg('Produtos Excluídos com SUCESSO !!','A');

End; // Exclui Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Insere Produtos de Fornecedor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPrioridadesReposicao.InserirProdutosFornecedor(sCodForn: String);
Var
  MySql: String;
  sCodProd: String;
  i, iCodLinx: Integer;
  mMemo: TMemo;
Begin
  OdirPanApres.Caption:='AGUARDE !! Salvando Produto...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmPrioridadesReposicao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmPrioridadesReposicao.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmPrioridadesReposicao;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  Screen.Cursor:=crAppStart;

  // Cria Componente Memo ======================================================
  mMemo:=TMemo.Create(Self);
  mMemo.Visible:=False;
  mMemo.Parent:=FrmPrioridadesReposicao;
  mMemo.Width:=500;
  mMemo.Lines.Clear;

  MySql:=' SELECT pr.cod_produto, pr.nome'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE pr.desativado=''N'''+
         ' AND   pr.cod_fornecedor='+sCodForn;
  DMBelShop.CDS_SQLQ_Busca.Close;
  DMBelShop.SQLQ_Busca.SQL.Clear;
  DMBelShop.SQLQ_Busca.SQL.Add(MySql);
  DMBelShop.CDS_SQLQ_Busca.Open;

  FrmBelShop.MontaProgressBar(True, FrmPrioridadesReposicao);
  pgProgBar.Properties.Max:=DMBelShop.CDS_SQLQ_Busca.RecordCount;
  pgProgBar.Position:=0;

  While Not DMBelShop.CDS_SQLQ_Busca.Eof do
  Begin
    Application.ProcessMessages;

    sCodProd:=Trim(DMBelShop.LINX_BuscaCodigoSIDICOM(Trim(DMBelShop.CDS_SQLQ_Busca.FieldByName('Cod_produto').AsString)));
    If sCodProd='' Then
    Begin
      mMemo.Lines.Add(DMBelShop.CDS_SQLQ_Busca.FieldByName('Cod_produto').AsString+' - '+Trim(DMBelShop.CDS_SQLQ_Busca.FieldByName('Nome').AsString));
    End;

    // Insere Produto ==========================================================
    If sCodProd<>'' Then
    Begin
      If Not DMBelShop.CDS_PrioridadeProd.Locate('CODPRODUTO', StrToInt(sCodProd),[]) Then
      Begin
        iCodLinx:=DMBelShop.CDS_SQLQ_Busca.FieldByName('Cod_Produto').AsInteger;
        SalvarProduto(IntToStr(iCodLinx), sCodProd);
      End;
    End;

    pgProgBar.Position:=DMBelShop.CDS_SQLQ_Busca.RecNo;

    DMBelShop.CDS_SQLQ_Busca.Next;
  End;
  FrmBelShop.MontaProgressBar(False, FrmPrioridadesReposicao);
  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;

  // Apresenta Codigo Linx Não Encontrados =====================================
  If mMemo.Lines.Count>0 Then
  Begin
    FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
    FrmSolicitacoes.ClientWidth:=1000;
    FrmBelShop.AbreSolicitacoes(7);

    FrmSolicitacoes.Caption:='PRODUTOS COM REPOSIÇÃO PRIORITÁRIA';
    FrmSolicitacoes.Ts_MargemLucroFormulas.Caption:='RELAÇÃO DE PRODUTOS';

    FrmSolicitacoes.EditorMargemLucro.Lines.Add('Produtos LINX SEM Produtos Correspondente no SIDICOM');
    FrmSolicitacoes.EditorMargemLucro.Lines.Add('====================================================');
    FrmSolicitacoes.EditorMargemLucro.Lines.Add('');
    For i:=0 to mMemo.Lines.Count-1 do
    Begin
       FrmSolicitacoes.EditorMargemLucro.Lines.Add(mMemo.Lines[i]);
    End; // For i:=0 to mMemo.Lines.Count-1 do

    msg('Foram Encontrados Produtos LINX'+cr+'SEM Correspondente Produtos SIDICOM !!'+' Tecle <OK>> Para Verificar ...','A');

    FrmSolicitacoes.ShowModal;
    FreeAndNil(FrmSolicitacoes);
  End;

  FreeAndNil(mMemo);
  DMBelShop.CDS_PrioridadesAfterScroll(DMBelShop.CDS_Prioridades);

  DMBelShop.CDS_PrioridadeProd.Locate('COD_PRODUTO', iCodLinx,[]);

  msg('Produtos Inseridos com SUCESSO !!','A');

End; // Insere Produtos de Fornecedor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Salva Produtos da Prioridade >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPrioridadesReposicao.SalvarProduto(sCodLinx, sCodSidicom: String);
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
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE OR INSERT INTO ES_REP_PRIORIDADES_PROD'+
           ' (COD_PRIORIDADE, COD_PRODUTO, CODPRODUTO,'+
           '  USU_INCLUI, DTA_INCLUI)'+

           ' VALUES ('+
           DMBelShop.CDS_PrioridadesCOD_PRIORIDADE.AsString+', '+ // COD_PRIORIDADE
           sCodLinx+', '+ // COD_PRODUTO LINX
           QuotedStr(FormatFloat('000000',StrToInt(sCodSidicom)))+', '+ // CODPRODUTO SIDICOM
           Cod_Usuario+', '+ // USU_INCLUI
           ' CURRENT_TIMESTAMP)'+ // DTA_INCLUI

           ' MATCHING (COD_PRIORIDADE, COD_PRODUTO, CODPRODUTO)';
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;
  Except // Except da Transação
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
  End; // Try da Transação

End; // Salva Produtos da Prioridade >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Componetes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPrioridadesReposicao.LimpaComponentes;
Begin
  EdtCodPrioridade.Clear;
  EdtDesPrioridade.Clear;
  EdtDtaInicial.Clear;
  EdtDtaFinal.Clear;
  CkB_Ativo.Checked:=True;
  CkB_AtivoClick(Self);

  EdtCodProdLinx.Clear;
  EdtCodProduto.Clear;
  EdtCodForn.Clear;
  EdtDesFornecedor.Clear;

  EdtDesPrioridade.SetFocus;
End; // Limpa Componetes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Salva Prioridade >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPrioridadesReposicao.SalvarPrioridade;
Var
  MySql: String;
  iCodigo: Integer;
Begin
  OdirPanApres.Caption:='AGUARDE !! Salvando Prioridade...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmPrioridadesReposicao.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmPrioridadesReposicao.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmPrioridadesReposicao;
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

    MySql:=' UPDATE OR INSERT INTO ES_REP_PRIORIDADES'+
           ' (COD_PRIORIDADE, DES_PRIORIDADE, IND_ATIVO, DTA_INICIAL, DTA_FINAL,'+
           ' USU_ALTERA, DTA_ALTERA';

           If EdtCodPrioridade.AsInteger=0 Then
            MySql:=
             MySql+', USU_INCLUI, DTA_INCLUI';

    MySql:=
     MySql+')'+
           ' VALUES (';

           // COD_PRIORIDADE
           If EdtCodPrioridade.AsInteger=0 Then
            Begin
              MySql:=
               MySql+'null, ';

              MySqlSelect:=' SELECT GEN_ID(GEN_ES_REP_PRIORIDADES_ID,0) ID'+
                           ' FROM RDB$DATABASE';
              DMBelShop.CDS_BuscaRapida.Close;
              DMBelShop.SDS_BuscaRapida.CommandText:=MySqlSelect;
              DMBelShop.CDS_BuscaRapida.Open;
              iCodigo:=(DMBelShop.CDS_BuscaRapida.FieldByName('Id').AsInteger + 1);
              DMBelShop.CDS_BuscaRapida.Close;
              MySqlSelect:='';
             End
           Else
            Begin
              MySql:=
               MySql+IntToStr(EdtCodPrioridade.AsInteger)+', ';

              iCodigo:=EdtCodPrioridade.AsInteger;
            End;

    MySql:=
     MySql+QuotedStr(EdtDesPrioridade.Text)+', '+ // DES_PRIORIDADE
           QuotedStr(CkB_Ativo.Caption)+', '+     // IND_ATIVO
           QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(EdtDtaInicial.Date))))+', '; // DTA_INICIAL

           // DTA_FINAL
           If (Trim(EdtDtaFinal.Text)='/  /') Or (Trim(EdtDtaFinal.Text)='.  .') Then
            MySql:=
             MySql+'null, '
           Else
            MySql:=
             MySql+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(EdtDtaFinal.Date))))+', ';

    MySql:=
     MySql+Cod_Usuario+', '+ // USU_ALTERA
           ' CURRENT_TIMESTAMP';  // DTA_ALTERA

           If EdtCodPrioridade.AsInteger=0 Then
            MySql:=
             MySql+', '+Cod_Usuario+', '+ // USU_INCLUI
                   ' CURRENT_TIMESTAMP';  // DTA_INCLUI
    MySql:=
     MySql+')'+
           ' MATCHING (COD_PRIORIDADE)';
    DMBelShop.SQLC.Execute(MySql,nil,nil);
    MySql:='';

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Bt_PrioridadeDesfazerClick(Self);

    DMBelShop.CDS_PrioridadeProd.Close;
    DMBelShop.CDS_Prioridades.Close;
    DMBelShop.CDS_Prioridades.Open;

    DMBelShop.CDS_Prioridades.Locate('COD_PRIORIDADE', iCodigo,[]);

    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
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
      Exit;
    End; // on e : Exception do
  End; // Try da Transação

End; // Salva Prioridade >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmPrioridadesReposicao.CreateToolTips(hWnd: Cardinal);
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
Procedure TFrmPrioridadesReposicao.FocoToControl(Sender: TControl);
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

procedure TFrmPrioridadesReposicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairPR Then
   Begin
     Action :=caHide;// caFree;
   End
  Else
   Begin
     msg('Para Fechar Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmPrioridadesReposicao.FormCreate(Sender: TObject);
const  
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Acertar Erro na Rolagem do Mouse ==========================================
  Application.OnMessage := ApplicationEvents1Message;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  //============================================================================
  // Show Hint em Forma de Balão ===============================================
  //============================================================================
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaArquivoTXT.Handle, @ti, TipoDoIcone, 'Busca Arquivo Texto', 'PRODUTOS !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaForn.Handle, @ti, TipoDoIcone, 'Fornecedor (LINX)', 'SELECIONAR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaProdtudo.Handle, @ti, TipoDoIcone, 'Produto (LINX)', 'SELECIONAR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ExcluiFornecedor.Handle, @ti, TipoDoIcone, 'Produtos do Fornecedor', 'EXCLUIR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ExcluiProduto.Handle, @ti, TipoDoIcone, 'Produto Selecionado', 'EXCLUIR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Fechar.Handle, @ti, TipoDoIcone, 'Sair...', 'FECHAR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_PrioridadeDesfazer.Handle, @ti, TipoDoIcone, 'Desfazer da Selecinada', 'PRIORIDADE !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_PrioridadeSalvar.Handle, @ti, TipoDoIcone, 'Salvar...', 'PRIORIDADE !!');
  // Show Hint em Forma de Balão ===============================================
  //============================================================================
end;

procedure TFrmPrioridadesReposicao.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
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

procedure TFrmPrioridadesReposicao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmPrioridadesReposicao.FormShow(Sender: TObject);
begin
  Pan_Produtos.Align   :=alNone;
  Pan_Prioridades.Align:=alNone;
  Pan_Prioridades.Align:=alLeft;
  Pan_Produtos.Align   :=alClient;

  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmPrioridadesReposicao);

  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairPR:=False;

  Rb_PrioridadesAtivasClick(Self);

  EdtDesPrioridade.SetFocus;
end;

procedure TFrmPrioridadesReposicao.Bt_FecharClick(Sender: TObject);
begin
  DMBelShop.CDS_PrioridadeProd.Close;
  DMBelShop.CDS_Prioridades.Close;

  bgSairPR:=True;
  Close;
  Exit;
end;

procedure TFrmPrioridadesReposicao.Dbg_PrioridadesEnter(Sender: TObject);
begin
  {
  Usado em:
    Pan_PrioridadesInformaEnter
  }

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  If (Sender is TDBGrid) Then
  Begin
    If (Sender as TDBGrid).Name='Dbg_Prioridades' Then
    Begin
      ApplicationEvents1.OnActivate:=Dbg_PrioridadesEnter;
      Application.OnMessage := ApplicationEvents1Message;
      ApplicationEvents1.Activate;
    End;
  End; // If (Sender is TDBGrid) Then

  Dbg_Prioridades.Color:=clMoneyGreen;
  Pan_PrioridadesInforma.Color:=clMoneyGreen;
end;

procedure TFrmPrioridadesReposicao.Dbg_PrioridadesExit(Sender: TObject);
begin
  {
  Usado em:
    Pan_PrioridadesInformaExit
  }

  Pan_PrioridadesInforma.Color:=clBtnFace;
  Dbg_Prioridades.Color:=$00E4F2F3;
end;

procedure TFrmPrioridadesReposicao.Bt_PrioridadeSalvarClick(Sender: TObject);
begin
  Dbg_Prioridades.SetFocus;

  // Consiste Dados da Prioridade ==============================================
  If Trim(EdtDesPrioridade.Text)='' Then
  Begin
    msg('Favor Informar a Descrição'+cr+cr+'da Prioridade !!','A');
    EdtDesPrioridade.SetFocus;
    Exit;
  End;

  Try
    StrToDate(EdtDtaInicial.Text);
  Except
    msg('Data da Vigência Inicial Inválida !!','A');
    EdtDtaInicial.SetFocus;
    Exit;
  End;

  Try
    StrToDate(EdtDtaFinal.Text);
    If EdtDtaFinal.Date<EdtDtaInicial.Date Then
    Begin
      msg('Data da Vigência Final MENOR Que Inicial !!','A');
      EdtDesPrioridade.SetFocus;
      Exit;
    End;
  Except
  End;

  If Not CkB_Ativo.Checked Then
  Begin
    If msg('Esta Prioridade Será Gravada como Inativa !!'+cr+cr+'Esrta CORRETA esta Informação ??','C')=2 Then
    Begin
      CkB_Ativo.SetFocus;
      Exit;
    End;
  End; // If Not CkB_Ativo.Checked Then

  // Salva Prioridade ==========================================================
  SalvarPrioridade;
end;

procedure TFrmPrioridadesReposicao.Dbg_ProdutoEnter(Sender: TObject);
begin
  {
  Usado em:
    Pan_ProdutosInformaEnter
  }

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  If (Sender is TDBGrid) Then
  Begin
    If (Sender as TDBGrid).Name='Dbg_Produto' Then
    Begin
      ApplicationEvents1.OnActivate:=Dbg_ProdutoEnter;
      Application.OnMessage := ApplicationEvents1Message;
      ApplicationEvents1.Activate;
    End;
  End; //   If (Sender is TDBGrid) Then

  Dbg_Produto.Color:=clMoneyGreen;
  Pan_ProdutosInforma.Color:=clMoneyGreen;

end;

procedure TFrmPrioridadesReposicao.Dbg_ProdutoExit(Sender: TObject);
begin
  {
  Usado em:
    Pan_ProdutosInformaExit
  }


  Pan_ProdutosInforma.Color:=clBtnFace;
  Dbg_Produto.Color:=$00E4F2F3;

end;

procedure TFrmPrioridadesReposicao.Rb_PrioridadesAtivasClick(Sender: TObject);
Var
  sSim, sNao: String;
begin

  LimpaComponentes;

  AcertaRb_Style(Rb_PrioridadesAtivas);
  AcertaRb_Style(Rb_PrioridadesInativas);
  AcertaRb_Style(Rb_PrioridadesAmbas);

  sSim:='SIM';
  sNao:='NAO';
  If Rb_PrioridadesAtivas.Checked   Then sNao:='SIM';
  If Rb_PrioridadesInativas.Checked Then sSim:='NAO';

  DMBelShop.CDS_PrioridadeProd.Close;

  DMBelShop.CDS_Prioridades.Close;
  DMBelShop.SDS_Prioridades.Params.ParamByName('SIM').AsString:=sSim;
  DMBelShop.SDS_Prioridades.Params.ParamByName('NAO').AsString:=sNao;
  DMBelShop.CDS_Prioridades.Open;

  Dbg_Prioridades.SetFocus;

end;

procedure TFrmPrioridadesReposicao.Rb_PrioridadesAtivasKeyUp(Sender: TObject;
   var Key: Word; Shift: TShiftState);
begin
  Rb_PrioridadesAtivasClick(Self);
end;

procedure TFrmPrioridadesReposicao.CkB_AtivoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CkB_AtivoClick(Self);
end;

procedure TFrmPrioridadesReposicao.CkB_AtivoClick(Sender: TObject);
begin
  AcertaCkb_SN(CkB_Ativo);
end;

procedure TFrmPrioridadesReposicao.Bt_PrioridadeDesfazerClick(Sender: TObject);
begin
  Dbg_Prioridades.SetFocus;
  LimpaComponentes;
end;

procedure TFrmPrioridadesReposicao.Dbg_PrioridadesDblClick(Sender: TObject);
begin
  If (Not Pan_Produtos.Enabled) Or (DMBelShop.CDS_Prioridades.IsEmpty) Then
   Exit;

  EdtCodPrioridade.AsInteger:=DMBelShop.CDS_PrioridadesCOD_PRIORIDADE.AsInteger;
  EdtDesPrioridade.Text     :=DMBelShop.CDS_PrioridadesDES_PRIORIDADE.AsString;
  EdtDtaInicial.Date        :=DMBelShop.CDS_PrioridadesDTA_INICIAL.AsDateTime;
  EdtDtaFinal.Text          :=DMBelShop.CDS_PrioridadesDTA_FINAL.AsString;
  CkB_Ativo.Checked         :=(DMBelShop.CDS_PrioridadesIND_ATIVO.AsString='SIM');
  CkB_AtivoClick(Self);

  EdtDesPrioridade.SetFocus;
end;

procedure TFrmPrioridadesReposicao.EdtDesPrioridadeChange(Sender: TObject);
begin
  Pan_Produtos.Enabled:=True;
  Pan_Informacao.Visible:=False;

  If Trim(EdtDesPrioridade.Text)<>'' Then
  Begin
    Pan_Produtos.Enabled:=False;
    Pan_Informacao.Left:=16;
    Pan_Informacao.Top:=42;
    Pan_Informacao.Visible:=True;
  End;

end;

procedure TFrmPrioridadesReposicao.Bt_ExcluiFornecedorClick(Sender: TObject);
Var
  sCodProd, sCodForn,
  sDescricao: String;
begin
  {
  Usado em:
    Bt_ExcluiProdutoClick
  }

  If (Not Pan_Produtos.Enabled) Or (DMBelShop.CDS_PrioridadeProd.IsEmpty) Then
   Exit;

  Dbg_Produto.SetFocus;

  sCodProd:='';
  sCodForn:='';

  // Verifica Qual o Botao Acionou =============================================
  If (Sender is TJvXPButton) Then
  Begin
    If (Sender as TJvXPButton).Name='Bt_ExcluiProduto' Then
    Begin
      sCodProd:=Trim(DMBelShop.CDS_PrioridadeProdCOD_PRODUTO.AsString);
      sDescricao:='o Produto:'+cr+cr+Trim(DMBelShop.CDS_PrioridadeProdNOME.AsString);
    End;

    If (Sender as TJvXPButton).Name='Bt_ExcluiFornecedor' Then
    Begin
      sCodForn:=Trim(DMBelShop.CDS_PrioridadeProdCOD_FORNECEDOR.AsString);
      sDescricao:='os Produtos'+cr+'do Fornecedor:'+cr+Trim(DMBelShop.CDS_PrioridadeProdRAZAO_CLIENTE.AsString);
    End;
  End; //   If (Sender is TDBGrid) Then

  If msg('Deseja Realmente Excluir '+sDescricao+' ??','C')=2 Then
   Exit;

  ExcluirProdutos(sCodProd, sCodForn);
end;

procedure TFrmPrioridadesReposicao.EdtCodProdLinxExit(Sender: TObject);
Var
  MySql: String;
  sCodProd, sNome,
  sSitProd: String;
begin
  If EdtCodProdLinx.AsInteger<>0 Then
  Begin
    MySql:=' SELECT pr.nome, pr.Desativado'+
           ' FROM LINXPRODUTOS pr'+
           ' WHERE pr.cod_produto='+IntToStr(EdtCodProdLinx.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sNome   :=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Nome').AsString);
    sSitProd:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Desativado').AsString);
    DMBelShop.CDS_BuscaRapida.Close;

    If sNome='' Then
    Begin
      msg('Produto LINX Não Encontrado !!','A');
      EdtCodProdLinx.Clear;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If sSitProd='S' Then
    Begin
      msg('Situação do Produto Inválida !!'+cr+cr+'Destivado','A');
      EdtCodProdLinx.Clear;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    sCodProd:=Trim(DMBelShop.LINX_BuscaCodigoSIDICOM(IntToStr(EdtCodProdLinx.AsInteger)));
    If sCodProd='' Then
    Begin
      msg('Produto SIDICOM Não Encontrado !!','A');
      EdtCodProdLinx.Clear;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    // Salva Produto Se Não Encontra ===========================================
    If Not DMBelShop.CDS_PrioridadeProd.Locate('COD_PRODUTO', EdtCodProdLinx.AsInteger,[]) Then
    Begin
      SalvarProduto(IntToStr(EdtCodProdLinx.AsInteger), sCodProd);

      DMBelShop.CDS_PrioridadesAfterScroll(DMBelShop.CDS_Prioridades);

      DMBelShop.CDS_PrioridadeProd.Locate('COD_PRODUTO', EdtCodProdLinx.AsInteger,[]);
    End;

    EdtCodProdLinx.Clear;
    EdtCodProdLinx.SetFocus;
  End; // If EdtCodProdLinx.AsInteger<>0 Then

end;

procedure TFrmPrioridadesReposicao.EdtCodProdutoExit(Sender: TObject);
Var
  MySql: String;
  sCodProd, sNome: String;
  iSitProd: Integer;
begin
  If EdtCodProduto.AsInteger<>0 Then
  Begin
    MySql:=' SELECT pr.apresentacao Nome, pr.SituacaoPro'+
           ' FROM PRODUTO pr'+
           ' WHERE pr.codproduto='+FormatFloat('000000',EdtCodProduto.AsInteger);
    FrmBelShop.IBQ_MPMS.Close;
    FrmBelShop.IBQ_MPMS.SQL.Clear;
    FrmBelShop.IBQ_MPMS.SQL.Add(MySql);
    FrmBelShop.IBQ_MPMS.Open;
    sNome   :=Trim(FrmBelShop.IBQ_MPMS.FieldByName('Nome').AsString);
    iSitProd:=FrmBelShop.IBQ_MPMS.FieldByName('SituacaoPro').AsInteger;
    FrmBelShop.IBQ_MPMS.Close;

    If sNome='' Then
    Begin
      msg('Produto SIDICOM Não Encontrado !!','A');
      EdtCodProduto.Clear;
      EdtCodProduto.SetFocus;
      Exit;
    End;

    If iSitProd in [1, 2, 4] Then
    Begin
      msg('Situação do Produto Inválida !!'+cr+cr+'Bloqueado, Excluido ou Não Venda','A');
      EdtCodProduto.Clear;
      EdtCodProduto.SetFocus;
      Exit;
    End;

    sCodProd:=Trim(DMBelShop.LINX_BuscaCodigoLINX(IntToStr(EdtCodProduto.AsInteger)));
    If sCodProd='' Then
    Begin
      msg('Produto LINX Não Encontrado !!','A');
      EdtCodProduto.Clear;
      EdtCodProduto.SetFocus;
      Exit;
    End;

    // Salva Produto Se Não Encontra ===========================================
    If Not DMBelShop.CDS_PrioridadeProd.Locate('COD_PRODUTO', StrToInt(sCodProd),[]) Then
    Begin
      SalvarProduto(sCodProd, IntToStr(EdtCodProduto.AsInteger));

      DMBelShop.CDS_PrioridadesAfterScroll(DMBelShop.CDS_Prioridades);

      DMBelShop.CDS_PrioridadeProd.Locate('COD_PRODUTO', sCodProd,[]);
    End;

    EdtCodProduto.Clear;
    EdtCodProduto.SetFocus;
  End; // If EdtCodProduto.AsInteger<>0 Then

end;

procedure TFrmPrioridadesReposicao.Dbg_PrioridadesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sCodPrioridade, sValor: String;
  b: Boolean;
begin
  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if ((Shift=[ssCtrl]) and (key=vk_delete)) THEN
   Abort;

  sCodPrioridade:=DMBelShop.CDS_PrioridadesCOD_PRIORIDADE.AsString;

  // Localizar Produto =========================================================
  If Key=Vk_F4 Then
  Begin
    If Not DMBelShop.CDS_Prioridades.IsEmpty Then
    Begin
      sValor:='';
      b:=True;
      While b do
      Begin
        If InputQuery('Localizar Prioridade','',sValor) then
         Begin
           Try
             StrToInt(sValor);

             If Not DMBelShop.CDS_Prioridades.Locate('COD_PRIORIDADE', sValor,[]) Then
             Begin
              If Not LocalizaRegistro(DMBelShop.CDS_Prioridades, 'COD_PRIORIDADE', sValor) Then
               b:=False;
             End; // If Not DMBelShop.CDS_Prioridades.Locate('COD_FORNECEDOR', sValor,[]) Then
             Break;
           Except
             If Not DMBelShop.CDS_Prioridades.Locate('DES_PRIORIDADE', sValor,[]) Then
             Begin
               If Not LocalizaRegistro(DMBelShop.CDS_Prioridades, 'DES_PRIORIDADE', sValor) Then
                b:=False;
             End; // If Not DMBelShop.CDS_Prioridades.Locate('DES_PRIORIDADE', sValor,[]) Then
             Break;
           End;
         End
        Else // If InputQuery('Localizar Prioridade','',sValor) then
         Begin
           Break;
         End; // If InputQuery('Localizar Prioridade','',sValor) then
      End; // While b do

      If Not b Then
      Begin
        DMBelShop.CDS_Prioridades.Locate('COD_PRIORIDADE',sCodPrioridade,[]);
        msg('Prioridade Não Localizada !!','A');
      End;
    End; // If Not DMBelShop.CDS_Prioridades.IsEmpty Then
  End; // If Key=Vk_F4 Then

end;

procedure TFrmPrioridadesReposicao.Dbg_ProdutoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sCodProduto, sValor, sTitulo: String;
  b: Boolean;
begin
  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if ((Shift=[ssCtrl]) and (key=vk_delete)) THEN
   Abort;

  sCodProduto:=DMBelShop.CDS_PrioridadeProdCOD_PRODUTO.AsString;

  // Localizar Produto =========================================================
  If (Key=Vk_F4) Or (Key=Vk_F3) Then
  Begin
    If Not DMBelShop.CDS_PrioridadeProd.IsEmpty Then
    Begin
      sTitulo:='LINX';
      If (Key=Vk_F4) Then
       sTitulo:='SIDICOM';

      sValor:='';
      b:=True;
      While b do
      Begin
        If InputQuery('Localizar Produto '+sTitulo,'',sValor) then
         Begin
           Try
             StrToInt(sValor);

             If (Key=Vk_F4) Then
             Begin
               If Not DMBelShop.CDS_PrioridadeProd.Locate('CODPRODUTO', FormatFloat('000000',StrToInt(sValor)),[]) Then
                b:=False;
             End;

             If (Key=Vk_F3) Then
             Begin
               If Not DMBelShop.CDS_PrioridadeProd.Locate('COD_PRODUTO', sValor,[]) Then
                b:=False;
             End;
             Break;
           Except
             If Not DMBelShop.CDS_PrioridadeProd.Locate('NOME', sValor,[]) Then
             Begin
               If Not LocalizaRegistro(DMBelShop.CDS_PrioridadeProd, 'NOME', sValor) Then
                b:=False;
             End; // If Not DMBelShop.CDS_Prioridades.Locate('DES_PRIORIDADE', sValor,[]) Then
             Break;
           End;
         End
        Else // If InputQuery('Localizar Prioridade','',sValor) then
         Begin
           Break;
         End; // If InputQuery('Localizar Prioridade','',sValor) then
      End; // While b do

      If Not b Then
      Begin
        DMBelShop.CDS_PrioridadeProd.Locate('COD_PRODUTO',sCodProduto,[]);
        msg('Produto Não Localizado !!','A');
      End;
    End; // If Not DMBelShop.CDS_Prioridades.IsEmpty Then
  End; // If (Key=Vk_F4) Or (Key=Vk_F3) Then
end;

procedure TFrmPrioridadesReposicao.Bt_BuscaProdtudoClick(Sender: TObject);
Var
  MySql: String;
begin
  EdtCodProdLinx.Clear;
  EdtCodProdLinx.SetFocus;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT pr.nome, pr.cod_produto'+
         ' FROM linxprodutos pr'+
         ' WHERE pr.desativado=''N'''+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Cod_produto').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Produto a Listar !!','A');
    EdtCodProdLinx.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Nome';
  FrmPesquisa.Campo_Codigo:='Cod_Produto';
  FrmPesquisa.Campo_Descricao:='Nome';
  // FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtCodProdLinx.AsInteger:=StrToInt(FrmPesquisa.EdtCodigo.Text);
     FreeAndNil(FrmPesquisa);
     EdtCodProdLinxExit(Self);
     Exit;
   End
  Else
   Begin
     EdtCodProdLinx.Clear;
     EdtCodProdLinx.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmPrioridadesReposicao.EdtCodFornExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtDesFornecedor.Clear;

  If EdtCodForn.AsInteger<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Aplicaçoes ========================================================
    MySql:=' SELECT fo.cod_cliente, fo.razao_cliente'+
           ' FROM LINXCLIENTESFORNEC fo'+
           ' WHERE fo.tipo_cliente IN (''F'', ''A'')'+
           ' AND EXISTS (SELECT 1'+
           '             FROM LINXPRODUTOS pr'+
           '             WHERE pr.cod_fornecedor=fo.cod_cliente)'+
           ' AND   fo.cod_cliente='+IntToStr(EdtCodForn.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    Screen.Cursor:=crDefault;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Cliente').AsString)='' Then
    Begin
      msg('Fornecedor (LINX) NÃO Encontrado !!!', 'A');
      Screen.Cursor:=crDefault;
      DMBelShop.CDS_BuscaRapida.Close;
      EdtCodForn.Clear;
      EdtCodForn.SetFocus;
      Exit;
    End;

    EdtDesFornecedor.Text:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('razao_cliente').AsString);
    DMBelShop.CDS_BuscaRapida.Close;

    DMBelShop.CDS_PrioridadeProd.Locate('COD_FORNECEDOR',EdtCodForn.AsInteger,[]);

    Screen.Cursor:=crDefault;
    If msg('Deseja Relamente Inserir Todos os'+cr+cr+'Produtos do Fornecedor Selecionado ??','C')=1 Then
     InserirProdutosFornecedor(IntToStr(EdtCodForn.AsInteger));

    EdtDesFornecedor.Clear;
    EdtCodForn.Clear;
    EdtCodForn.SetFocus;
  End;
end;

procedure TFrmPrioridadesReposicao.Bt_BuscaFornClick(Sender: TObject);
Var
  MySql: String;
begin
  Dbg_Produto.SetFocus;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtCodForn.Clear;
  EdtDesFornecedor.Clear;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT fo.razao_cliente Fornecedor, fo.cod_cliente Codigo'+
         ' FROM LINXCLIENTESFORNEC fo'+
         ' WHERE fo.tipo_cliente IN (''F'', ''A'')'+
         ' AND EXISTS (SELECT 1'+
         '             FROM LINXPRODUTOS pr'+
         '             WHERE pr.cod_fornecedor=fo.cod_cliente)'+
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
    EdtCodForn.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Fornecedor';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Fornecedor';
  // FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtCodForn.AsInteger:=StrToInt(FrmPesquisa.EdtCodigo.Text);
     FreeAndNil(FrmPesquisa);
     EdtCodFornExit(Self);
     Exit;
   End
  Else
   Begin
     EdtCodForn.Clear;
     EdtDesFornecedor.Clear;
     EdtCodForn.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmPrioridadesReposicao.Bt_BuscaArquivoTXTClick(Sender: TObject);
var
  MySql: String;

  OpenDialog: TOpenDialog;
  mMemo: TMemo;

  tsArquivo: TStringList;
  i: Integer;
  bSiga: Boolean;

  sCodLinx, sCodSidicom: String;
begin
  Dbg_Produto.SetFocus;

  EdtArquivoTXT.Clear;

  If msg('O Arquivo Texto DEVE Conter'+cr+'UM Código de Produto Por Linha !!'+cr+cr+'O Arquivo Esta CORRETO ??','C')=2 Then
   Exit;

  // Consiste o Codigo a Usar ==================================================
  If Rb_CodLinx.Checked    Then sgMensagem:='Usar Código(s) LINX !!'+cr+cr+'Esta CORRETO ?';
  If Rb_CodSidicom.Checked Then sgMensagem:='Usar Código(s) SIDICOM !!'+cr+cr+'Esta CORRETO ?';
  If msg(sgMensagem,'C')=2 Then
  Begin
    sgMensagem:='';
    Exit;
  End;

  { Instancia a variável arquivo }
  OpenDialog:=TOpenDialog.Create(OpenDialog);
  tsArquivo :=TStringList.Create;

  Try
    { Carrega o conteúdo do arquivo texto para a   memória }
    With OpenDialog do
    Begin
      Options := [ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
      DefaultExt := 'TXT';
      Filter := 'Arquivo Texto (*.txt)|*.TXT';
      FilterIndex := 1;
      Title := 'Busca Arquivos Texto';

      If Execute then
       Begin
         EdtArquivoTXT.Text:=FileName;
         tsArquivo.LoadFromFile(FileName);
       End
      Else
      Begin
        Free;
        Exit;
      End;
      Free;
    End; // With OpenDialog do

    If msg('O Arquivo Texto Selecionado'+cr+cr+'Esta CORRETO ??','C')=2 Then
    Begin
      EdtArquivoTXT.Clear;
      Exit;
    End;

    OdirPanApres.Caption:='AGUARDE !! Salvando Produto...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmPrioridadesReposicao.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmPrioridadesReposicao.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmPrioridadesReposicao;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;
    Screen.Cursor:=crAppStart;

    // Cria Componente Memo ======================================================
    mMemo:=TMemo.Create(Self);
    mMemo.Visible:=False;
    mMemo.Parent:=FrmPrioridadesReposicao;
    mMemo.Width:=500;
    mMemo.Lines.Clear;

    FrmBelShop.MontaProgressBar(True, FrmPrioridadesReposicao);
    pgProgBar.Properties.Max:=tsArquivo.Count;
    pgProgBar.Position:=0;

    { Realiza um loop em toda a lista }
    For i := 0 to tsArquivo.Count - 1 do
    Begin
      Application.ProcessMessages;

      // Arquivo Texto com Codigo LINX =========================================
      If Rb_CodLinx.Checked Then
      Begin
        Try
          sCodLinx:=Trim(tsArquivo[i]);
          StrToInt(sCodLinx);
          bSiga:=True;
        Except
          bSiga:=False;
        End;

        // Processa Codigo =====================================================
        If bSiga Then
        Begin
          sCodSidicom:=DMBelShop.LINX_BuscaCodigoSIDICOM(sCodLinx);

          If sCodSidicom='' Then
          Begin
            MySql:=' SELECT p.nome'+
                   ' FROM LINXPRODUTOS p'+
                   ' WHERE p.cod_produto='+sCodLinx;
            DMBelShop.CDS_BuscaRapida.Close;
            DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
            DMBelShop.CDS_BuscaRapida.Open;

            If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Nome').AsString)='' Then
             mMemo.Lines.Add(sCodLinx+' - Código LINX Não Encontrado')
            Else
             mMemo.Lines.Add(sCodLinx+' - '+Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Nome').AsString));

            DMBelShop.CDS_BuscaRapida.Close;
          End;

          // Insere Produto ==========================================================
          If sCodSidicom<>'' Then
          Begin
            If Not DMBelShop.CDS_PrioridadeProd.Locate('COD_PRODUTO', StrToInt(sCodLinx),[]) Then
            Begin
              SalvarProduto(sCodLinx, sCodSidicom);
            End;
          End;
        End; // If bSiga Then
      End; // If Rb_CodLinx.Checked Then

      // Arquivo Texto com Codigo SIDICOM ======================================
      If Rb_CodSidicom.Checked Then
      Begin
        Try
          sCodSidicom:=FormatFloat('000000',StrToInt(Trim(tsArquivo[i])));
          StrToInt(sCodSidicom);
          bSiga:=True;
        Except
          bSiga:=False;
        End;

        // Processa Codigo =====================================================
        If bSiga Then
        Begin
          sCodLinx:=DMBelShop.LINX_BuscaCodigoLINX(sCodSidicom);

          If sCodLinx='' Then
          Begin
            MySql:=' SELECT p.Apresentacao Nome'+
                   ' FROM PRODUTO p'+
                   ' WHERE p.CodProduto='+QuotedStr(sCodSidicom);
            DMBelShop.CDS_BuscaRapida.Close;
            DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
            DMBelShop.CDS_BuscaRapida.Open;

            If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Nome').AsString)='' Then
             mMemo.Lines.Add(sCodSidicom+' - Código SIDICOM Não Encontrado')
            Else
             mMemo.Lines.Add(sCodSidicom+' - '+Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Nome').AsString));

            DMBelShop.CDS_BuscaRapida.Close;
          End;

          // Insere Produto ==========================================================
          If sCodLinx<>'' Then
          Begin
            If Not DMBelShop.CDS_PrioridadeProd.Locate('COD_PRODUTO', StrToInt(sCodLinx),[]) Then
            Begin
              SalvarProduto(sCodLinx, sCodSidicom);
            End;
          End;
        End; // If bSiga Then
      End; // If Rb_CodSidicom.Checked Then

      pgProgBar.Position:=i+1;
    End; // For i := 0 to tsArquivo.Count - 1 do
    FrmBelShop.MontaProgressBar(False, FrmPrioridadesReposicao);

  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsArquivo);
  End; // Try
  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;

  // Apresenta Codigo SIDICOM/LINX Não Encontrados =============================
  If mMemo.Lines.Count>0 Then
  Begin
    FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
    FrmSolicitacoes.ClientWidth:=1000;
    FrmBelShop.AbreSolicitacoes(7);

    FrmSolicitacoes.Caption:='PRODUTOS COM REPOSIÇÃO PRIORITÁRIA';
    FrmSolicitacoes.Ts_MargemLucroFormulas.Caption:='RELAÇÃO DE PRODUTOS';

    If Rb_CodLinx.Checked Then
    Begin
      FrmSolicitacoes.EditorMargemLucro.Lines.Add('Produtos LINX SEM Produtos Correspondente no SIDICOM');
      sgMensagem:='Foram Encontrados Produtos LINX'+cr+'SEM Correspondente Produtos SIDICOM !!'+' Tecle <OK>> Para Verificar ...'
    End;

    If Rb_CodSidicom.Checked Then
    Begin
      FrmSolicitacoes.EditorMargemLucro.Lines.Add('Produtos SIDICOM SEM Produtos Correspondente no LINX');
      sgMensagem:='Foram Encontrados Produtos SIDICOM'+cr+'SEM Correspondente Produtos LINX !!'+' Tecle <OK>> Para Verificar ...'
    End;

    FrmSolicitacoes.EditorMargemLucro.Lines.Add('====================================================');
    FrmSolicitacoes.EditorMargemLucro.Lines.Add('');

    For i:=0 to mMemo.Lines.Count-1 do
    Begin
       FrmSolicitacoes.EditorMargemLucro.Lines.Add(mMemo.Lines[i]);
    End; // For i:=0 to mMemo.Lines.Count-1 do

    msg(sgMensagem,'A');

    FrmSolicitacoes.ShowModal;
    FreeAndNil(FrmSolicitacoes);
  End;

  FreeAndNil(mMemo);
  EdtArquivoTXT.Clear;

  DMBelShop.CDS_PrioridadesAfterScroll(DMBelShop.CDS_Prioridades);

  If sCodSidicom<>'' Then
   DMBelShop.CDS_PrioridadeProd.Locate('CODPRODUTO', sCodSidicom,[])
  Else If sCodLinx<>'' Then
   DMBelShop.CDS_PrioridadeProd.Locate('COD_PRODUTO', sCodLinx,[]);

  msg('Produtos Inseridos com SUCESSO !!','A');

end;

procedure TFrmPrioridadesReposicao.Rb_CodLinxClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_CodLinx);
  AcertaRb_Style(Rb_CodSidicom);
end;

procedure TFrmPrioridadesReposicao.Rb_CodLinxKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Rb_CodLinxClick(Self);
end;

end.
