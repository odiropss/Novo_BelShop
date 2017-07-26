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
    OdirPanApres: TPanel;
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
    Lab_Informacao: TLabel;
    Sb_GeraOC: TdxStatusBar;
    dxStatusBar1: TdxStatusBar;
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

    Procedure SalvarPrioridade;
    Procedure LimpaComponentes;

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

uses DK_Procs1, UDMBelShop, RTLConsts, UFrmBelShop, DB;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
           '  USU_INCLUI, DTA_INCLUI, USU_ALTERA, DTA_ALTERA)'+
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
     MySql+QuotedStr(Cod_Usuario)+', '+ // USU_INCLUI
           ' CURRENT_DATE, '+           // DTA_INCLUI
           QuotedStr(Cod_Usuario)+', '+ // USU_ALTERA
           ' CURRENT_DATE)'+            // DTA_ALTERA

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
  AddToolTip(Bt_BuscaForn.Handle, @ti, TipoDoIcone, 'Fornecedor', 'SELECIONAR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaProdtudo.Handle, @ti, TipoDoIcone, 'Produto', 'SELECIONAR !!');

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
  End; //   If (Sender is TDBGrid) Then

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
  LimpaComponentes;
  Dbg_Prioridades.SetFocus;
end;

procedure TFrmPrioridadesReposicao.Dbg_PrioridadesDblClick(Sender: TObject);
begin
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
  Lab_Informacao.Visible:=False;

  If Trim(EdtDesPrioridade.Text)<>'' Then
  Begin
    Pan_Produtos.Enabled:=False;
    Lab_Informacao.Visible:=True;
  End;

end;

procedure TFrmPrioridadesReposicao.Bt_ExcluiFornecedorClick(Sender: TObject);
begin
  If Not Pan_Produtos.Enabled Then
   Exit;
end;

procedure TFrmPrioridadesReposicao.EdtCodProdLinxExit(Sender: TObject);
Var
  MySql: String;
  sCodProd, sNome: String;
begin
  If EdtCodProdLinx.AsInteger<>0 Then
  Begin
    MySql:=' SELECT pr.nome'+
           ' FROM LINXPRODUTOS pr'+
           ' WHERE pr.cod_produto='+IntToStr(EdtCodProdLinx.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sNome:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Nome').AsString);
    DMBelShop.CDS_BuscaRapida.Close;
    If sNome='' Then
    Begin
      msg('Produto LINX Não Encontrado !!','A');
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    sCodProd:=Trim(DMBelShop.LINX_BuscaCodigoSIDICOM(IntToStr(EdtCodProdLinx.AsInteger)));
    If sCodProd='' Then
    Begin
      msg('Produto SIDICOM Não Encontrado !!','A');
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    EdtCodProdLinx.SetFocus;
  End; // If EdtCodProdLinx.AsInteger<>0 Then

  // Salva Produto =============================================================


end;

procedure TFrmPrioridadesReposicao.EdtCodProdutoExit(Sender: TObject);
Var
  MySql: String;
  sCodProd, sNome: String;
begin
  If EdtCodProdLinx.AsInteger<>0 Then
  Begin
    MySql:=' SELECT pr.apresentacao Nome'+
           ' FROM PRODUTO pr'+
           ' WHERE pr.codproduto='+IntToStr(EdtCodProduto.AsInteger);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    sNome:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Nome').AsString);
    DMBelShop.CDS_BuscaRapida.Close;
    If sNome='' Then
    Begin
      msg('Produto SIDICOM Não Encontrado !!','A');
      EdtCodProduto.SetFocus;
      Exit;
    End;

    sCodProd:=Trim(DMBelShop.LINX_BuscaCodigoLINX(IntToStr(EdtCodProduto.AsInteger)));
    If sCodProd='' Then
    Begin
      msg('Produto LINX Não Encontrado !!','A');
      EdtCodProduto.SetFocus;
      Exit;
    End;
    EdtCodProduto.SetFocus;
    
  End; // If EdtCodProdLinx.AsInteger<>0 Then

  // Salva Produto =============================================================

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

end.
