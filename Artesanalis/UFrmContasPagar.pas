unit UFrmContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Mask, ToolEdit, CurrEdit,
  Commctrl, // SHOW HINT EM FORMA DE BALÃO
  StdCtrls, cxCurrencyEdit, Grids, DBGrids, DBXpress, Math;

type
  TFrmContasPagar = class(TForm)
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    Bt_Salvar: TJvXPButton;
    Bt_Abandonar: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    Dbg_Lanctos: TDBGrid;
    Panel1: TPanel;
    Gb_Pessoa: TGroupBox;
    EdtDesPessoa: TEdit;
    EdtCodPessoa: TCurrencyEdit;
    Bt_BuscaPessoa: TJvXPButton;
    Bt_NovaPessoa: TJvXPButton;
    Gb_NumDocto: TGroupBox;
    EdtNumDocto: TCurrencyEdit;
    Gb_DtaDocto: TGroupBox;
    DtEdt_DtaDocto: TcxDateEdit;
    Gb_DtaVencto: TGroupBox;
    DtEdt_DtaVencto: TcxDateEdit;
    Gb_Parcelas: TGroupBox;
    Label25: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    EdtNumParcelas: TCurrencyEdit;
    EdtPrazoDias: TCurrencyEdit;
    Gb_VlrDocto: TGroupBox;
    EdtVlrDocto: TCurrencyEdit;
    Gb_Historico: TGroupBox;
    EdtDesHistorico: TEdit;
    EdtCodHistorico: TCurrencyEdit;
    Bt_BuscaHistorico: TJvXPButton;
    Bt_NovoHistorico: TJvXPButton;
    OdirPanApres: TPanel;
    procedure Bt_FecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    // Odir ====================================================================

    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    Procedure LimpaDocto(bCodigos: Boolean  = True);

    Procedure FluxoFinanceiroBusca;
    Function  ConsisteLancamento: Boolean;
    Function  InsereLancamento: Boolean;

    // Odir ====================================================================

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_SalvarClick(Sender: TObject);
    procedure EdtCodPessoaExit(Sender: TObject);
    procedure Bt_BuscaPessoaClick(Sender: TObject);
    procedure EdtCodPessoaChange(Sender: TObject);
    procedure Dbg_LanctosEnter(Sender: TObject);
    procedure Dbg_LanctosExit(Sender: TObject);
    procedure Dbg_LanctosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_NovaPessoaClick(Sender: TObject);
    procedure EdtCodHistoricoExit(Sender: TObject);
    procedure Bt_AbandonarClick(Sender: TObject);

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
  FrmContasPagar: TFrmContasPagar;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  bgSairCP: Boolean;

  igNumSeq: Integer; // Num_Seq Gravado

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;

implementation

uses DK_Procs1, UDMArtesanalis, UPesquisa, UFrmPessoaCadastro, DB;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Insere Lancamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmContasPagar.InsereLancamento: Boolean;
Var
  cVlrParc, cVlrDif: Currency;
  iDia, i, iQtdParc: Integer;
  MySql: String;
  sNomeDia: String;
  dDta, dDtaVenc: TDate;
  wDia, wMes, wAno: Word;
Begin
  Result:=False;

  // Insere Lancamento =========================================================
  OdirPanApres.Caption:='AGUARDE !! Incluindo Lançamento...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmContasPagar.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmContasPagar.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmContasPagar;
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

    // Calucla valor(es) da(s) Parcela(s) ========================================
    iQtdParc:=EdtNumParcelas.AsInteger;
    cVlrParc:=RoundTo(EdtVlrDocto.Value/iQtdParc,-2);
    cVlrDif:=cVlrParc*iQtdParc;
    cVlrDif:=EdtVlrDocto.Value-cVlrDif;

    For i:=1 to iQtdParc do
    Begin
      If i=1 Then // Primeiro
       Begin
         DecodeDate(DtEdt_DtaVencto.Date, wAno, wMes, wDia);
         iDia:=wDia;

         dDta:=DtEdt_DtaVencto.Date
       End
      Else // If i=1 Then // Primeiro Registro
       Begin
         If EdtPrazoDias.Value=0 Then
          Begin
            // Próximo Mês e Desmembra Data
            dDta:=PrimUltDia(dDta,'U')+1;
            DecodeDate(dDta, wAno, wMes, wDia);

            // Monta Novo Vencimento
            dDta:=EncodeDate(wAno, wMes, iDia);
          End
         Else
          Begin
            dDta:=dDta+EdtPrazoDias.Value;
          End;
       End; // If i=1 Then // Primeiro Registro

      dDtaVenc:=dDta;

      // Acerta Vencimentos de Sábado ou Domingo ===============================
      sNomeDia:=AnsiUpperCase(DiaSemanaNome(dDtaVenc));
      If sNomeDia='SÁBADO' Then
       dDtaVenc:=dDtaVenc+2;

      If sNomeDia='DOMINGO' Then
       dDtaVenc:=dDtaVenc+1;

      MySql:=' INSERT INTO FLUXO_FINANCEIRO'+
             ' (COD_FORNECEDOR, COD_HISTORICO, NUM_DOCTO, DTA_EMISSAO,'+
             '  VLR_ORIGINAL, NUM_PRESTACOES, NUM_PRAZO, DTA_PRIM_VENC,'+
             '  NUM_PRESTACAO, DTA_VENCIMENTO, VLR_PRESTACAO)'+

             ' VALUES ('+
             EdtCodPessoa.Text+', '+ // COD_FORNECEDOR
             EdtCodHistorico.Text+', '+ // COD_HISTORICO
             EdtNumDocto.Text+', '+ // NUM_DOCTO
             QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaDocto.Date))))+', '+ // DTA_EMISSAO
             QuotedStr(f_Troca(',','.',EdtVlrDocto.Text))+', '+ // VLR_ORIGINAL
             EdtNumParcelas.Text+', '+ // NUM_PRESTACOES
             EdtPrazoDias.Text+', '+ // NUM_PRAZO
             QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaVencto.Date))))+', '+ // DTA_PRIM_VENC
             IntToStr(i)+', '+ // NUM_PRESTACAO
             QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(dDtaVenc))))+', '; // DTA_VENCIMENTO

             // VLR_PRESTACAO
             If i=1 Then
              Begin
                MySql:=
                 MySql+QuotedStr(f_Troca(',','.',CurrToStr(cVlrParc+cVlrDif)))+')'
              End
             Else
              Begin
                MySql:=
                 MySql+QuotedStr(f_Troca(',','.',CurrToStr(cVlrParc)))+')';
              End; // If i=1 Then
      DMArtesanalis.SQLC.Execute(MySql,Nil,Nil);

      // Busca Num_Seq do Primeiro Registro --------------------------
      If i=1 Then
      Begin
        MySql:='SELECT GEN_ID(GEN_FLUXO_FINANCEIRO_ID,0) Num_Seq'+
               ' FROM RDB$DATABASE';
        DMArtesanalis.CDS_BuscaRapida.Close;
        DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
        DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
        DMArtesanalis.CDS_BuscaRapida.Open;
        igNumSeq:=DMArtesanalis.CDS_BuscaRapida.FieldByName('Num_Seq').AsInteger;
        DMArtesanalis.CDS_BuscaRapida.Close;
      End; // If i=1 Then
    End; // For i:=1 to iQtdParc do

    // Atualiza Transacao ======================================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
    Result:=True;

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
      Exit;
    End; // on e : Exception do
  End; // Try da Transação

End; // Insere Lancamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Consiste Lançamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmContasPagar.ConsisteLancamento: Boolean;
Begin
  Result:=False;

  // Histórico =================================================================
  If EdtCodHistorico.AsInteger=0 Then
  Begin
    msg('Favor Informar o Histórico !!','A');
    EdtCodHistorico.SetFocus;
    Exit;
  End;

  // Numero do Docto ===========================================================
  If EdtNumDocto.AsInteger=0 Then
  Begin
    msg('Favor Informar o Nº do Docto !!','A');
    EdtNumDocto.SetFocus;
    Exit;
  End;

  // Data do Docto =============================================================
  try
    StrToDate(DtEdt_DtaDocto.Text);
  Except
    msg('Data do Documento Inválida !!','A');
    DtEdt_DtaDocto.SetFocus;
    Exit;
  End;

  // Data do Vencimento ========================================================
  try
    StrToDate(DtEdt_DtaVencto.Text);
  Except
    msg('Data de Vencimento Inválida !!','A');
    DtEdt_DtaVencto.SetFocus;
    Exit;
  End;

  If DtEdt_DtaDocto.Date>DtEdt_DtaVencto.Date Then
  Begin
    msg('Data de Vencimento MENOR'+cr+cr+'Que Data do Docto !!','A');
    DtEdt_DtaVencto.SetFocus;
    Exit;
  End;

  // Valor =====================================================================
  If EdtVlrDocto.AsInteger=0 Then
  Begin
    msg('Favor Informar o Valor do Docto !!','A');
    EdtVlrDocto.SetFocus;
    Exit;
  End;

  If EdtNumParcelas.Value=0 Then
  Begin
    msg('Favor Informar o'+cr+cr+'Número de Parcelas !!','A');
    EdtNumParcelas.SetFocus;
    Exit;
  End;

  Result:=True;

End; // Consiste Lançamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Apresenta Movtos de Fluxo Financeiro >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmContasPagar.FluxoFinanceiroBusca;
Var
  MySql: String;
Begin
  MySql:=' SELECT ff.num_seq, ff.cod_historico, pl.des_historico,'+
         ' ff.cod_fornecedor, fo.des_pessoa,'+
         ' ff.num_docto, ff.dta_emissao,'+
         ' ff.vlr_original, ff.num_prestacao, ff.num_prazo,'+
         ' ff.dta_vencimento, ff.vlr_prestacao'+

         ' FROM FLUXO_FINANCEIRO ff, PESSOAS fo, PLANO_CONTAS pl'+

         ' WHERE ff.cod_fornecedor=fo.cod_pessoa'+
         ' AND   ff.cod_historico=pl.cod_historico';

         If EdtCodPessoa.AsInteger<>0 Then
          MySql:=
           MySql+' AND   ff.cod_fornecedor='+EdtCodPessoa.Text;

         If EdtCodHistorico.AsInteger<>0 Then
          MySql:=
           MySql+' AND   ff.cod_historico='+EdtCodHistorico.Text;

  MySql:=
   MySql+' ORDER BY pl.des_historico, fo.des_pessoa, ff.num_docto, ff.dta_vencimento';
  DMArtesanalis.CDS_FluxoFinanceiro.Close;
  DMArtesanalis.SQLQ_FluxoFinanceiro.SQL.Clear;
  DMArtesanalis.SQLQ_FluxoFinanceiro.SQL.Add(MySql);
  DMArtesanalis.CDS_FluxoFinanceiro.Open;

End; // Apresenta Movtos de Fluxo Financeiro >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Campos do Docto na Tela >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmContasPagar.LimpaDocto(bCodigos: Boolean  = True);
Var
  i: Integer;
Begin

  For i:=0 to FrmContasPagar.ComponentCount-1 do
  Begin
    // TEdit
    If FrmContasPagar.Components[i] is TEdit Then
    Begin
     If bCodigos Then
      (FrmContasPagar.Components[i] as TEdit).Clear
     Else If ((FrmContasPagar.Components[i] as TEdit).Name<>'EdtDesPessoa') And
             ((FrmContasPagar.Components[i] as TEdit).Name<>'EdtDesHistorico') Then
      (FrmContasPagar.Components[i] as TEdit).Clear;


    End; // If FrmContasPagar.Components[i] is TEdit Then

    // TCurrencyEdit
    If FrmContasPagar.Components[i] is TCurrencyEdit Then
    Begin

     If bCodigos Then
      (FrmContasPagar.Components[i] as TCurrencyEdit).Value:=0
     Else If ((FrmContasPagar.Components[i] as TCurrencyEdit).Name<>'EdtCodPessoa') And
             ((FrmContasPagar.Components[i] as TCurrencyEdit).Name<>'EdtCodHistorico') Then
      (FrmContasPagar.Components[i] as TCurrencyEdit).Value:=0;

    End; // If FrmContasPagar.Components[i] is TCurrencyEdit Then

    // TcxDateEdit
    If FrmContasPagar.Components[i] is TcxDateEdit Then
     (FrmContasPagar.Components[i] as TcxDateEdit).Clear;

  End; // For i:=0 to FrmContasPagar.ComponentCount-1 do
End; // Limpa Campos do Docto na Tela >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmContasPagar.CreateToolTips(hWnd: Cardinal);
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
Procedure TFrmContasPagar.FocoToControl(Sender: TControl);
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

procedure TFrmContasPagar.Bt_FecharClick(Sender: TObject);
begin

  If DMArtesanalis.CDS_FluxoFinanceiro.Active Then
   DMArtesanalis.CDS_FluxoFinanceiro.Close;

  bgSairCP:=True;

  Close;

end;

procedure TFrmContasPagar.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  // Show Hint em Forma de Balão
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Salvar.Handle, @ti, TipoDoIcone, 'Incluir/Alterar', 'LANÇAMEMTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Abandonar.Handle, @ti, TipoDoIcone, 'Abandonar', 'LANÇAMEMTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Excluir.Handle, @ti, TipoDoIcone, 'Excluir Lançto'+cr+'Selecionado', 'LANÇAMEMTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Fechar.Handle, @ti, TipoDoIcone, 'Fechar', 'CONTAS A PAGAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaPessoa.Handle, @ti, TipoDoIcone, 'Localizar', 'FORNECEDOR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NovaPessoa.Handle, @ti, TipoDoIcone, 'Incluir', 'FORNECEDOR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaHistorico.Handle, @ti, TipoDoIcone, 'Localizar', 'HISTÓRICO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NovoHistorico.Handle, @ti, TipoDoIcone, 'Incluir', 'HISTÓRICO');
end;

procedure TFrmContasPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Not bgSairCP Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Botão <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('FINANCEIRO - Contas a Pagar');

end;

procedure TFrmContasPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmContasPagar.FormShow(Sender: TObject);
begin
  bgSairCP:=False;

  // Limpa Tela ================================================================
  LimpaDocto();

  EdtCodPessoa.SetFocus;

end;

procedure TFrmContasPagar.Bt_SalvarClick(Sender: TObject);
begin
  If EdtPrazoDias.AsInteger=0 Then
   EdtPrazoDias.AsInteger:=1;

  If Not ConsisteLancamento Then
   Exit;

  // Insere Lancamento =========================================================
  If Not InsereLancamento Then
   Exit;

  // Limpa Tela ================================================================
  LimpaDocto(False);

  // Busca Fluxo Financeiro ====================================================
  FluxoFinanceiroBusca;

  If igNumSeq<>0 Then
   DMArtesanalis.CDS_FluxoFinanceiro.Locate('NUM_SEQ',igNumSeq,[]);

  EdtCodPessoa.SetFocus;

end;

procedure TFrmContasPagar.EdtCodPessoaExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtDesPessoa.Clear;
  DMArtesanalis.CDS_FluxoFinanceiro.Close;

  // Fornecedor ================================================================
  If EdtCodPessoa.AsInteger=0 Then
  Begin
    If msg('Lançamento SEM Fornecedor !!'+cr+cr+'Esta CORRETO ??','C')=2 Then
    Begin
      EdtCodPessoa.SetFocus;
      Exit;
    End;
  End;
  
  If EdtCodPessoa.asInteger<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    EdtDesPessoa.Clear;

    MySql:=' SELECT p.des_pessoa nome, Tipo'+
           ' FROM PESSOAS p'+
           ' WHERE p.Tipo in (''A'', ''F'')'+
           ' AND p.cod_pessoa='+IntToStr(EdtCodPessoa.AsInteger);
    DMArtesanalis.CDS_BuscaRapida.Close;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMArtesanalis.CDS_BuscaRapida.Open;

    If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Nome').AsString)='' Then
    Begin
      Screen.Cursor:=crDefault;
      DMArtesanalis.CDS_BuscaRapida.Close;
      msg('Fornecedor Não Encontrado !!'+cr+'Ou Não é Fornecedor !!','A');
      EdtCodPessoa.SetFocus;
      Exit;
    End;
    EdtDesPessoa.Text:=Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Nome').AsString);
    DMArtesanalis.CDS_BuscaRapida.Close;
  End; // If EdtCodPessoa.asInteger<>0 Then

  // Busca Fluxo Financeiro ====================================================
  FluxoFinanceiroBusca;

  Screen.Cursor:=crDefault;
  EdtCodHistorico.SetFocus;
end;

procedure TFrmContasPagar.Bt_BuscaPessoaClick(Sender: TObject);
Var
  MySql: String;
begin
  EdtCodPessoa.Clear;
  EdtDesPessoa.Clear;
  Dbg_Lanctos.SetFocus;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.des_pessoa Nome, p.cod_pessoa Codigo'+
         ' FROM PESSOAS p'+
         ' WHERE p.Tipo in (''A'', ''F'')'+
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
    msg('Sem Fornecedor a Listar !!','A');
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

procedure TFrmContasPagar.EdtCodPessoaChange(Sender: TObject);
begin
  If (Sender is TCurrencyEdit) Then
  Begin
    If (Sender as TCurrencyEdit).Name='EdtCodPessoa' Then
    Begin
      EdtDesPessoa.Clear;
    End;

    If (Sender as TCurrencyEdit).Name='EdtCodHistorico' Then
    Begin
      EdtDesHistorico.Clear;
    End;
  End; // If (Sender is TComboBoxJul) Then

  DMArtesanalis.CDS_FluxoFinanceiro.Close;
end;

procedure TFrmContasPagar.Dbg_LanctosEnter(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clMoneyGreen;

end;

procedure TFrmContasPagar.Dbg_LanctosExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clWindow;

end;

procedure TFrmContasPagar.Dbg_LanctosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Não Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

end;

procedure TFrmContasPagar.Bt_NovaPessoaClick(Sender: TObject);
begin
  Dbg_Lanctos.SetFocus;

  FrmCadastroPessoa.bgTransportar:=True;

  FrmCadastroPessoa.ShowModal;

  If FrmCadastroPessoa.bgTransportar Then
  Begin
    EdtCodPessoa.AsInteger:=StrToInt(FrmCadastroPessoa.sgCodPesTransportar);
    EdtCodPessoaExit(Self);
  End;

end;

procedure TFrmContasPagar.EdtCodHistoricoExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtDesHistorico.Clear;
  DMArtesanalis.CDS_FluxoFinanceiro.Close;

  If EdtCodHistorico.asInteger<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    EdtDesHistorico.Clear;

    MySql:=' SELECT pl.des_historico, pl.cod_historico, pl.cod_centrocustos'+
           ' FROM PLANO_CONTAS pl'+
           ' WHERE pl.cod_historico='+IntToStr(EdtCodHistorico.AsInteger);
    DMArtesanalis.CDS_BuscaRapida.Close;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMArtesanalis.CDS_BuscaRapida.Open;

    If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('cod_historico').AsString)='' Then
    Begin
      Screen.Cursor:=crDefault;
      DMArtesanalis.CDS_BuscaRapida.Close;
      msg('Histórico Não Encontrado !!','A');
      EdtCodHistorico.SetFocus;
      Exit;
    End;
    EdtDesHistorico.Text:=Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Des_Historico').AsString);
    DMArtesanalis.CDS_BuscaRapida.Close;
  End; // If EdtCodHistorico.asInteger<>0 Then

  // Busca Fluxo Financeiro ====================================================
  FluxoFinanceiroBusca;

  Screen.Cursor:=crDefault;
  EdtNumDocto.SetFocus;
end;

procedure TFrmContasPagar.Bt_AbandonarClick(Sender: TObject);
begin
  LimpaDocto();

  EdtCodPessoa.SetFocus;
end;

end.
