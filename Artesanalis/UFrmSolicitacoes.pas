unit UFrmSolicitacoes;

{
Formulário: FrmSolicitacoes
                Padrão  Pagamentos
ClientHeight =  464     198
ClientWidth  =  700     362
==============================================
  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  AbreSolicitacoes(0);

  // Cria ClientDataSet Virtual - CDS_V_ProfSeleciona ========================
  If DMSalao.CDS_V_ProfSeleciona.Active Then
   DMSalao.CDS_V_ProfSeleciona.Close;

  DMSalao.CDS_V_ProfSeleciona.CreateDataSet;
  DMSalao.CDS_V_ProfSeleciona.Open;

  FrmSolicitacoes.EdtSolicExpDoctoOrigem.Value:=EdtGeraOCBuscaDocto.Value;
  FrmSolicitacoes.EdtSolicExpLoja.Text:=DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString+' - '+
                                        DMBelShop.IBQ_AComprarDES_EMPRESA.AsString;

  FrmSolicitacoes.EdtSolicExpDoctoDestino.Value:=0;
  FrmSolicitacoes.EdtSolicExpTpExportacao.Text:='TODOS OS PRODUTOS';
  FrmSolicitacoes.EdtSolicExpTpExportacao.Color:=clRed;

  FrmSolicitacoes.Ckb_SolicExpExcProduto.Checked:=True;
  FrmSolicitacoes.Ckb_SolicExpExcProdutoClick(Self);

  FrmSolicitacoes.Ckb_SolicExpSoProduto.Checked:=False;
  FrmSolicitacoes.Ckb_SolicExpSoProdutoClick(Self);

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    EdtGeraOCBuscaDoctoExit(Self);
  End; // If bgProcessar Then
  FreeAndNil(FrmSolicitacoes);

TabIndex:
   0 = Contas a Pagar - Data e Valor de Pagamento - Ts_CP_Pagamento
   1 = Contas a Pagar - Cadastro de Históricos  - Ts_CP_CadastroHistoticos
   2 =
   3 =
   4 =
   5 =
   6 =
   7 =
   8 =
   9 =
  10 =
}

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
  dxSkinXmas2008Blue, JvExControls, JvXPCore, JvXPButtons, ExtCtrls,
  StdCtrls, Mask, ToolEdit, CurrEdit, cxTextEdit, cxMaskEdit,
  Commctrl, // SHOW HINT EM FORMA DE BALÃO
  cxDropDownEdit, cxCalendar, ComCtrls, DBXpress, RXCtrls, JvExStdCtrls,
  JvRadioButton, RelVisual, JvEdit, JvValidateEdit;

type
  TFrmSolicitacoes = class(TForm)
    PC_Principal: TPageControl;
    Ts_CP_Pagamento: TTabSheet;
    Pan_Principal: TPanel;
    Bt_OK: TJvXPButton;
    Bt_Retornar: TJvXPButton;
    Gb_DtaPagto: TGroupBox;
    DtEdt_DtaPagto: TcxDateEdit;
    Gb_VlrPagto: TGroupBox;
    EdtVlrPagto: TCurrencyEdit;
    Ts_CP_CadastroHistoticos: TTabSheet;
    GroupBox1: TGroupBox;
    EdtDesHistorico: TEdit;
    GroupBox2: TGroupBox;
    EdtDesCentroCusto: TEdit;
    Bt_BuscaCentrosCusto: TJvXPButton;
    EdtCodCentroCusto: TEdit;
    OdirPanApres: TPanel;
    EdtCodHistorico: TEdit;
    Gb_Desembolso: TGroupBox;
    Rb_DesembolsoLixissse: TRadioButton;
    Rb_DesembolsoBelshop: TRadioButton;
    Ts_CP_Relatorio: TTabSheet;
    Gb_Relatorio: TGroupBox;
    Gb_TipoConta: TGroupBox;
    Rb_APagar: TJvRadioButton;
    Rb_Pagas: TJvRadioButton;
    Pan_TipoPesquisa: TPanel;
    Label7: TLabel;
    Rb_PesqDtaVencto: TJvRadioButton;
    Rb_PesqDtaPagto: TJvRadioButton;
    Bt_Imprimir: TJvXPButton;
    Gb_Periodo: TGroupBox;
    Label6: TLabel;
    DtEdt_DtaFim: TcxDateEdit;
    DtEdt_DtaInicio: TcxDateEdit;
    Pan_Desembolso: TPanel;
    Lab_Desembolso: TLabel;
    Ckb_Desembolso: TRxCheckListBox;
    v1: TJvValidateEdit;
    v2: TJvValidateEdit;
    a3: TEdit;
    a2: TEdit;
    a1: TEdit;
    v3: TJvValidateEdit;
    v4: TJvValidateEdit;
    a4: TEdit;
    a5: TEdit;
    v5: TJvValidateEdit;
    v6: TJvValidateEdit;
    a6: TEdit;
    a7: TEdit;
    v7: TJvValidateEdit;
    v8: TJvValidateEdit;
    a8: TEdit;
    a9: TEdit;
    v9: TJvValidateEdit;
    a11: TEdit;
    v11: TJvValidateEdit;
    procedure Bt_OKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_RetornarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PC_PrincipalChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    // Odir ====================================================================

    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl);

    Procedure AbreSolicitacoes(index: Integer);
    procedure Bt_BuscaCentrosCustoClick(Sender: TObject);

    Function  CP_InsereHistorico: Boolean;
    procedure Rb_DesembolsoLixissseClick(Sender: TObject);
    procedure Rb_DesembolsoLixissseKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Rb_APagarClick(Sender: TObject);
    procedure Rb_APagarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Rb_PesqDtaVenctoClick(Sender: TObject);
    procedure Rb_PesqDtaVenctoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_ImprimirClick(Sender: TObject);
    procedure Ckb_DesembolsoClick(Sender: TObject);
    procedure Ckb_DesembolsoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    // Odir ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
    bgProcessado: Boolean;
  end;

const
  // Show Hint em Forma de Balão
  TTS_BALLOON = $40;
  TTM_SETTITLE = (WM_USER + 32);
  //////////////////////////////

var
  FrmSolicitacoes: TFrmSolicitacoes;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  // Cria Ponteiro de Transacão
  TD: TTransactionDesc;

implementation

uses DK_Procs1, UPesquisa, UDMArtesanalis, DB, UDMRelatorios;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Contas a Pagar - Insere Historico >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSolicitacoes.CP_InsereHistorico: Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  OdirPanApres.Caption:='AGUARDE !! Salvando Histórico ...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicitacoes;
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

    // Busca Codigo do Histórico ===============================================
    MySql:=' SELECT COALESCE(MAX(pl.cod_historico)+1 ,1) Codigo'+
           ' FROM PLANO_CONTAS pl';
    DMArtesanalis.CDS_BuscaRapida.Close;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMArtesanalis.CDS_BuscaRapida.Open;
    EdtCodHistorico.Text:=DMArtesanalis.CDS_BuscaRapida.FieldByName('Codigo').AsString;
    DMArtesanalis.CDS_BuscaRapida.Close;

    MySql:=' INSERT INTO PLANO_CONTAS'+
           ' (cod_historico, cod_centrocustos, des_historico)'+
           ' VALUES ('+
           EdtCodHistorico.Text+', '+ // COD_HISTORICO
           EdtCodCentroCusto.Text+', '+ // COD_CENTROCUSTOS
           QuotedStr(EdtDesHistorico.Text)+')'; // DES_HISTORICO
    DMArtesanalis.SQLC.Execute(MySql,nil,nil);

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

End; // Contas a Pagar - Insere Historico >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmSolicitacoes.CreateToolTips(hWnd: Cardinal);
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
Procedure TFrmSolicitacoes.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>


// Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) >>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.AbreSolicitacoes(index: Integer);
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

End; // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) >>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmSolicitacoes.Bt_OKClick(Sender: TObject);
begin
  {
  Usado em:
  Ts_CP_CadastroHistoticos
  }

  // Insere Histórico ==========================================================
  If Ts_CP_CadastroHistoticos.Visible Then
  Begin
    // Consiste Historico
    If Trim(EdtDesHistorico.Text)='' Then
    Begin
      msg('Favor Informar a'+cr+cr+'Descrição do Histórico !!', 'A');
      EdtDesHistorico.SetFocus;
      Exit;
    End; // if Trim(EdtDesHistorico.Text)='' Then

    If Trim(EdtCodCentroCusto.Text)='' Then
    Begin
      msg('Favor Informar o Centro de Custos !!', 'A');
      EdtDesHistorico.SetFocus;
      Exit;
    End; // if Trim(EdtDesHistorico.Text)='' Then

    If Not CP_InsereHistorico Then
     Exit;
  End; // If Ts_CP_CadastroHistoticos.Visible Then

  bgProcessado:=True;

  Close;
end;

procedure TFrmSolicitacoes.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  bgProcessado:=False;

  // Show Hint em Forma de Balão
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_OK.Handle, @ti, TipoDoIcone, 'Aceita Informações !!', 'FECHAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Retornar.Handle, @ti, TipoDoIcone, 'Ignora Informações !!', 'FECHAR');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaCentrosCusto.Handle, @ti, TipoDoIcone, 'Localizar !!', 'CENTRO DE CUSTO');

end;

procedure TFrmSolicitacoes.Bt_RetornarClick(Sender: TObject);
begin
  {
  Usado em:
  Ts_CP_CadastroHistoticos
  Ts_CP_Relatorio
  }

  Close;
end;

procedure TFrmSolicitacoes.FormShow(Sender: TObject);
begin
  AutoSize:=True;
  PC_PrincipalChange(Self);
end;

procedure TFrmSolicitacoes.PC_PrincipalChange(Sender: TObject);
begin
  Try
    CorSelecaoTabSheet(PC_Principal);
  Except
  End;

  // CP - Contas a Pagar - Pagamentos ==========================================
  If (PC_Principal.ActivePage=Ts_CP_Pagamento) And (Ts_CP_Pagamento.CanFocus) Then
  Begin
    DtEdt_DtaPagto.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_CP_Pagamento) And (Ts_CP_Pagamento.CanFocus) Then

  // CP - Contas a Pagar - Cadastro de Históricos ==============================
  If (PC_Principal.ActivePage=Ts_CP_CadastroHistoticos) And (Ts_CP_CadastroHistoticos.CanFocus) Then
  Begin
    EdtDesHistorico.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_CP_Pagamento) And (Ts_CP_Pagamento.CanFocus) Then
end;

procedure TFrmSolicitacoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmSolicitacoes.Bt_BuscaCentrosCustoClick(Sender: TObject);
Var
  MySql: String;
begin
  EdtDesHistorico.SetFocus;
  EdtDesCentroCusto.Clear;
  EdtCodCentroCusto.Clear;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT cc.des_aux Historico, cc.cod_aux Codigo'+
         ' FROM TAB_AUXILIAR cc'+
         ' WHERE cc.tip_aux=1'+
         ' ORDER BY 1';
  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMArtesanalis.CDS_Pesquisa.FieldByName('Historico').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Pesquisa.Close;
    msg('Sem Centro de Custo a Listar !!','A');
    EdtDesHistorico.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Historico';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Historico';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtCodCentroCusto.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtDesCentroCusto.Text:=Trim(FrmPesquisa.EdtDescricao.Text);

     EdtDesHistorico.SetFocus;
   End
  Else
   Begin
     EdtDesHistorico.SetFocus;
   End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmSolicitacoes.Rb_DesembolsoLixissseClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_DesembolsoBelshop);
  AcertaRb_Style(Rb_DesembolsoLixissse);
end;

procedure TFrmSolicitacoes.Rb_DesembolsoLixissseKeyUp(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  Rb_DesembolsoLixissseClick(Self);
end;

procedure TFrmSolicitacoes.Rb_APagarClick(Sender: TObject);
Var
  i: Integer;
begin
  AcertaRb_Style(Rb_APagar);
  AcertaRb_Style(Rb_Pagas);

                                          Pan_TipoPesquisa.Visible:=False;
  If Rb_APagar.Checked Then
  Begin
    For i:=0 to Ckb_Desembolso.Items.Count-1 do
     Ckb_Desembolso.Checked[i]:=False;
  End;

  If Rb_Pagas.Checked Then
  Begin
    Rb_PesqDtaVencto.Checked:=True;
    Pan_TipoPesquisa.Visible:=True;
  End;
end;

procedure TFrmSolicitacoes.Rb_APagarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_APagarClick(Self);

end;

procedure TFrmSolicitacoes.Rb_PesqDtaVenctoClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_PesqDtaPagto);
  AcertaRb_Style(Rb_PesqDtaVencto);

end;

procedure TFrmSolicitacoes.Rb_PesqDtaVenctoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Rb_PesqDtaVenctoClick(Self);

end;

procedure TFrmSolicitacoes.Bt_ImprimirClick(Sender: TObject);
Var
  i: Integer;

  sDesembolso,
  MySql: String;
begin
  // Data Inicio do Periodo=====================================================
  Try
    StrToDate(DtEdt_DtaInicio.Text);
  Except
    msg('Data do Início do Período'+cr+cr+'é Inválida !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  // Data Fim do Periodo========================================================
  try
    StrToDate(DtEdt_DtaFim.Text);
  Except
    msg('Data do Fim do Período'+cr+cr+'é Inválida !!','A');
    DtEdt_DtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_DtaInicio.Date>DtEdt_DtaFim.Date Then
  Begin
    msg('Data de Final MENOR'+cr+cr+'Que Data Inicial do Período !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  OdirPanApres.Caption:='AGUARDE !! Preparando Relatório de Contas a Pagar...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicitacoes.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicitacoes.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicitacoes;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Tipo de Empresa de Desembolso =============================================
  sDesembolso:='';
  for i:=0 to Ckb_Desembolso.Items.Count - 1 do
  Begin
   if Ckb_Desembolso.Checked[i] Then
   Begin
     // Lixisse ===============================
     If i=1 Then
     Begin
       If sDesembolso<>'' Then
        sDesembolso:=sDesembolso+', '+QuotedStr('L');

       If sDesembolso='' Then
        sDesembolso:=QuotedStr('L');
     End; // If i=1 Then

     // BeShop ===============================
     If i=2 Then
     Begin
       If sDesembolso<>'' Then
        sDesembolso:=sDesembolso+', '+QuotedStr('B');

       If sDesembolso='' Then
        sDesembolso:=QuotedStr('B');
     End; // If i=1 Then
   End; // if Ckb_Desembolso.Checked[i] Then
  End; // for i:=0 to Ckb_Desembolso.Count - 1 do

  // Busca Doctos ==============================================================
  MySql:=' SELECT ff.dta_pagamento, ff.dta_vencimento,';


  MySql:=
   MySql+' ps.des_pessoa nome,'+
         ' ff.dta_emissao,'+
         ' ff.num_docto,'+
         ' hi.des_historico,'+
         ' ff.vlr_original,'+
         ' ff.num_prestacoes,'+
         ' ff.num_prestacao,'+
         ' ff.vlr_prestacao,'+
         ' ff.vlr_pagamento,';

         If (Rb_Pagas.Checked) and (Rb_PesqDtaPagto.Checked) Then
          MySql:=
           MySql+' ff.dta_pagamento,'
         Else
          MySql:=
           MySql+' ff.dta_vencimento,';

  MySql:=
   MySql+' CASE'+
         '     WHEN ff.ind_desembolso=''A'' THEN'+
         '       ''Ambas'''+
         '     WHEN ff.ind_desembolso=''B'' THEN'+
         '       ''BelShop'''+
         '     WHEN ff.ind_desembolso=''L'' THEN'+
         '       ''Lixisse'''+
         ' END Desembolso,'+
         ' ff.obs_texto'+

         ' FROM FLUXO_FINANCEIRO ff, PESSOAS ps, PLANO_CONTAS hi'+

         ' WHERE ff.cod_fornecedor=ps.cod_pessoa'+
         ' AND   ff.cod_historico=hi.cod_historico';

         If (Rb_Pagas.Checked) and (Rb_PesqDtaPagto.Checked) Then
          MySql:=
           MySql+' AND   ff.dta_pagamento BETWEEN '
         Else
          MySql:=
           MySql+' AND   ff.dta_vencimento BETWEEN ';

  MySql:=
   MySql+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaInicio.Date))))+' AND '+
         QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaFim.Date))));

         If Rb_Pagas.Checked Then
          MySql:=
           MySql+' AND   ff.vlr_pagamento>0.00';

         If Rb_APagar.Checked Then
          MySql:=
           MySql+' AND   ff.vlr_pagamento=0.00';

         If sDesembolso<>'' Then
          MySql:=
           MySql+' AND   ff.ind_desembolso in ('+sDesembolso+')';

           If (Rb_Pagas.Checked) and (Rb_PesqDtaPagto.Checked) Then
            MySql:=
             MySql+' ORDER BY 1,4'
           Else
            MySql:=
             MySql+' ORDER BY 2,4';
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;

  If Trim(DMArtesanalis.CDS_Busca.FieldByName('dta_emissao').AsString)='' Then
  Begin
    OdirPanApres.Visible:=False;
    DMArtesanalis.CDS_Busca.Close;
    msg('Sem Doctos a Listar no período Solicitado !!','A');
    Exit;
  End;

  With DMRelatorios.RelVisual do
  Begin
    ClientDataSet:=DMArtesanalis.CDS_Busca;
    Destino:=toVisualiza;
    Orientacao:=toPaisagem;

    Fonte.Assign(DMRelatorios.FontDialog.Font);

    RodapeGrupo:=True;

    TextoRodape:='';
    TextoRodapeGrupo:='';
    Zoom:=160;

    ImprimirTarjaCinza:=False;
    ImprimirVisto:=False;

    Cabecalho1Esquerda:='LÍXISSE';
    If Rb_APagar.Checked Then Cabecalho1Centro:='CONTAS A PAGAR';
    If Rb_Pagas.Checked Then  Cabecalho1Centro:='CONTAS PAGAS';
    Cabecalho1Direita:='#Data';

    Cabecalho2Esquerda:='Período de '+DateToStr(DtEdt_DtaInicio.Date)+' a '+DateToStr(DtEdt_DtaFim.Date);
    Cabecalho2Centro:=EmptyStr;
    Cabecalho2Direita:=EmptyStr;

    Cabecalho3Esquerda:=EmptyStr;
    Cabecalho3Centro:=EmptyStr;
    Cabecalho3Direita:=EmptyStr;

    // Monta Relatório =========================================================
    DefinicaoCampos.Clear;

    //==========================================================================
    // Somente Contas A Pagar ==================================================
    //==========================================================================
    If (Rb_APagar.Checked) Then
    Begin
      DefinicaoCampos.Add('D0;62;E;;NOME;Nome'); // v1 a1
      DefinicaoCampos.Add('D0;18;E;;DTA_EMISSAO;Emissão'); // v2 a2
      DefinicaoCampos.Add('D0;12;D;;NUM_DOCTO;Docto');   // v3 a3
      DefinicaoCampos.Add('D0;62;E;;DES_HISTORICO;Histórico');   // v4 a4
      DefinicaoCampos.Add('D0;18;D;#,##0.00;VLR_ORIGINAL;Vlr Docto');  // v5 a5
      DefinicaoCampos.Add('D0;14;C;#,##0;NUM_PRESTACOES;TotPres'); // v6 a6
      DefinicaoCampos.Add('D0;12;C;#,##0;NUM_PRESTACAO;NrPres'); // v7 a7
      DefinicaoCampos.Add('D1;18;D;#,##0.00;VLR_PRESTACAO;Vlr A Pagar'); // v8 a8
      DefinicaoCampos.Add('D0;20;E;;Desembolso;Desembolso'); // v11 a11
      DefinicaoCampos.Add('D0;106;E;;obs_texto;Observações');
    End; // If (Rb_APagar.Checked) Then
    // Somente Contas A Pagar ==================================================
    //==========================================================================

    //==========================================================================
    // Somente Contas Pagas ====================================================
    //==========================================================================
    If Rb_Pagas.Checked Then
    Begin
      DefinicaoCampos.Add('D0;50;E;;NOME;Nome'); // v1 a1
      DefinicaoCampos.Add('D0;18;E;;DTA_EMISSAO;Emissão'); // v2 a2
      DefinicaoCampos.Add('D0;10;D;;NUM_DOCTO;Docto');   // v3 a3
      DefinicaoCampos.Add('D0;50;E;;DES_HISTORICO;Histórico');   // v4 a4
      DefinicaoCampos.Add('D0;18;D;#,##0.00;VLR_ORIGINAL;Vlr Docto');  // v5 a5
      DefinicaoCampos.Add('D0;9;C;#,##0;NUM_PRESTACOES;TotPres'); // v6 a6
      DefinicaoCampos.Add('D0;8;C;#,##0;NUM_PRESTACAO;NrPres'); // v7 a7
      DefinicaoCampos.Add('D1;16;D;#,##0.00;VLR_PRESTACAO;Vlr A Pagar'); // v8 a8
      DefinicaoCampos.Add('D1;16;D;#,##0.00;VLR_PAGAMENTO;Vlr Pago'); // v9 a9

      // Data de Pagamento =====================================================
      If Rb_PesqDtaPagto.Checked Then
       DefinicaoCampos.Add('D0;18;D;;DTA_VENCIMENTO;Data Vencto');  // v10 a10

      // Data de Vencimento ====================================================
      If Rb_PesqDtaVencto.Checked Then
       DefinicaoCampos.Add('D0;18;D;;DTA_PAGAMENTO;Data Pagto');  // v10 a10

      DefinicaoCampos.Add('D0;20;E;;Desembolso;Desembolso'); // v11 a11
      DefinicaoCampos.Add('D0;106;E;;obs_texto;Observações');
    End; // If Rb_Pagas.Checked Then
    // Somente Contas Pagas ====================================================
    //==========================================================================

{
    DefinicaoCampos.Add('D0;'+v1.Text+';'+a1.Text+';;NOME;Nome'); // v1 a1
    DefinicaoCampos.Add('D0;'+v2.Text+';'+a2.Text+';;DTA_EMISSAO;Emissão'); // v2 a2
    DefinicaoCampos.Add('D0;'+v3.Text+';'+a3.Text+';;NUM_DOCTO;Docto');  // v3 a3
    DefinicaoCampos.Add('D0;'+v4.Text+';'+a4.Text+';;DES_HISTORICO;Histórico'); // v4 a4
    DefinicaoCampos.Add('D1;'+v5.Text+';'+a5.Text+';#,##0.00;VLR_ORIGINAL;Vlr Docto'); // v5 a5
    DefinicaoCampos.Add('D0;'+v6.Text+';'+a6.Text+';#,##0;NUM_PRESTACOES;TotPres'); // v6 a6
    DefinicaoCampos.Add('D0;'+v7.Text+';'+a7.Text+';#,##0;NUM_PRESTACAO;NrPres'); // v7 a7
    DefinicaoCampos.Add('D1;'+v8.Text+';'+a8.Text+';#,##0.00;VLR_PRESTACAO;Vlr A Pagar'); // v8 a8

    // Somente Quando Pago =====================================================
    If (Rb_Pagas.Checked) Then
    DefinicaoCampos.Add('D1;'+v9.Text+';'+a9.Text+';#,##0.00;VLR_PAGAMENTO;Vlr Pago'); // v9 a9

    // Somente Quando Pago e por Data de Pagamento =============================
    If (Rb_Pagas.Checked) and (Rb_PesqDtaPagto.Checked) Then
     DefinicaoCampos.Add('D0;'+v10.Text+';'+a10.Text+';;DTA_PAGAMENTO;Data Pagto');  // v10 a10
    Else
     DefinicaoCampos.Add('D0;'+v10.Text+';'+a10.Text+';;DTA_VENCIMENTO;Data Vencto');  // v10 a10

    DefinicaoCampos.Add('D0;'+v11.Text+';'+a11.Text+';;Desembolso;Desembolso'); // v11 a11
}




    // Quebra de Grupos ========================================================
    If (Rb_Pagas.Checked) and (Rb_PesqDtaPagto.Checked) Then // Quando Pago
     Begin
       DefinicaoCampos.Add('G1;100;E;;DTA_PAGAMENTO;Data Pagamento');
     End
    Else // Quando Não Pago
     Begin
      DefinicaoCampos.Add('G1;100;E;;DTA_VENCIMENTO;Data Vencimento');
     End;

    OdirPanApres.Visible:=False;
    Execute;
    DMArtesanalis.CDS_Busca.Close;
  End; // With DMRelatorio.RelVisual do
end;

procedure TFrmSolicitacoes.Ckb_DesembolsoClick(Sender: TObject);
Var
  i: Integer;
begin
  If Rb_APagar.Checked Then
  Begin
    For i:=0 to Ckb_Desembolso.Items.Count-1 do
     Ckb_Desembolso.Checked[i]:=False;
  End;

end;

procedure TFrmSolicitacoes.Ckb_DesembolsoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Ckb_DesembolsoClick(Self);
end;

end.
