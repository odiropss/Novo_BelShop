{
Pasta para Instalação em: C:\SolicitacaoTransferencias\
}

unit UFrmSolicTransf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, StdCtrls, ExtCtrls, Grids, DBGrids,
  DBGridJul, AppEvnts, JvExControls, JvXPCore, JvXPButtons, Mask, ToolEdit,
  CurrEdit, DBXpress, ComCtrls, Commctrl, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Shellapi;

type
  TFrmSolicTransf = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    Pan_Loja: TPanel;
    ApplicationEvents1: TApplicationEvents;
    OdirPanApres: TPanel;
    PC_Principal: TPageControl;
    Ts_Produtos: TTabSheet;
    Gb_Solicitacao: TGroupBox;
    Label1: TLabel;
    EdtQtdTransf: TCurrencyEdit;
    Dbg_Produtos: TDBGridJul;
    Bt_Incluir: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    Label2: TLabel;
    EdtQtdEstoque: TCurrencyEdit;
    Stb_ParamTransf: TdxStatusBar;
    Lab_Unidade: TLabel;
    Ts_Consultas: TTabSheet;
    Gb_Verifica: TGroupBox;
    Gb_Produto: TGroupBox;
    EdtCodProdLinx: TCurrencyEdit;
    Bt_BuscaProdtudo: TJvXPButton;
    EdtDescProduto: TEdit;
    DtEdt_DtaInicio: TcxDateEdit;
    Label75: TLabel;
    DtEdt_DtaFim: TcxDateEdit;
    Label3: TLabel;
    Bt_Verificar: TJvXPButton;
    Dbg_VerificaProdutos: TDBGridJul;
    Label4: TLabel;
    dxStatusBar1: TdxStatusBar;
    DBGridJul1: TDBGridJul;
    Label5: TLabel;
    EdtQtdEstoqueCD: TCurrencyEdit;
    Lab_UnidadeCD: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_ProdutosEnter(Sender: TObject);
    procedure EdtCodProdLinxExit(Sender: TObject);
    procedure EdtCodProdLinxChange(Sender: TObject);
    procedure Bt_BuscaProdtudoClick(Sender: TObject);
    procedure PC_PrincipalChange(Sender: TObject);

    // ODIR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl);

    Function  CriaLimitesLoja: Boolean;

    Procedure LimpaEdts;

    Function  ExcluiVersaoTabAuxiliar: Boolean;
    Procedure NovaVersao;

    // ODIR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_IncluirClick(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
    procedure Dbg_ProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQtdTransfExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Dbg_VerificaProdutosEnter(Sender: TObject);
    procedure Bt_VerificarClick(Sender: TObject);
    procedure Dbg_VerificaProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_VerificaProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject); // Posiciona no Componente

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
  FrmSolicTransf: TFrmSolicTransf;

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;

  tsgArquivo: TStringList;

  sgLojaLinx, sgLojaSidicom, sgNomeLoja,
  sgNumSolicitacao,
  sgCodProdLinx, sgCodProdSidicom
  : String;

  sgCodLojaVersaoOK: String;
  
  igNumMaxProd, igQtdMaxProd: Integer;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

implementation

uses DK_Procs1, UDMSolicTransf, UPesquisa, DB;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Nova Versão do Sistema >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicTransf.NovaVersao;
Var
  MySql: String;
  sCliente: String;
Begin
  // Verifica se é Para Atualizar ==============================================
  MySql:=' SELECT t.cod_aux'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux=20'+
         ' AND   t.cod_aux='+sgLojaLinx;
  DMSolicTransf.CDS_BuscaRapida.Close;
  DMSolicTransf.SQLQ_BuscaRapida.Close;
  DMSolicTransf.SQLQ_BuscaRapida.SQL.Clear;
  DMSolicTransf.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMSolicTransf.CDS_BuscaRapida.Open;
  sCliente:=Trim(DMSolicTransf.CDS_BuscaRapida.FieldByName('Cod_Aux').AsString);
  DMSolicTransf.CDS_BuscaRapida.Close;

  // Busca Nova Versão =========================================================
  If sCliente<>'' Then
  Begin
    // MONTA PARAMETRO: IP da Internet ; Porta ; Código Loja Linx ==============
    MySql:=' SELECT t.des_aux IP, t.des_aux1 Porta'+
           ' FROM TAB_AUXILIAR t'+
           ' WHERE t.tip_aux=20'+
           ' AND   t.cod_aux=0';
    DMSolicTransf.CDS_BuscaRapida.Close;
    DMSolicTransf.SQLQ_BuscaRapida.Close;
    DMSolicTransf.SQLQ_BuscaRapida.SQL.Clear;
    DMSolicTransf.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMSolicTransf.CDS_BuscaRapida.Open;
    sCliente:=IncludeTrailingPathDelimiter(sgPastaExecutavel)+'PCliente.exe '+
              Trim(DMSolicTransf.CDS_BuscaRapida.FieldByName('IP').AsString)+';'+
              Trim(DMSolicTransf.CDS_BuscaRapida.FieldByName('Porta').AsString)+';'+
              sgLojaLinx+';';
    DMSolicTransf.CDS_BuscaRapida.Close;

    msg('Existe Nova Versão do Sistema !!'+cr+cr+'Tecle <OK> Para Atualizar...','A');
    ShellExecute(Handle, 'open',Pchar(sCliente), nil, nil, 1);
    Application.Terminate;
    Exit;
  End;
End; // Atualiza Nova Versão do Sistema >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Exclui Informação de Nova Versão do Sistema >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSolicTransf.ExcluiVersaoTabAuxiliar: Boolean;
Var
  MySql: String;
Begin

  Result:=True;

  // Verifica se Transação esta Ativa
  If DMSolicTransf.SQLC.InTransaction Then
   DMSolicTransf.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMSolicTransf.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' DELETE FROM TAB_AUXILIAR t'+
           ' WHERE t.tip_aux=20'+
           ' AND   t.cod_aux='+sgLojaLinx;
    DMSolicTransf.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMSolicTransf.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      Result:=False;

      DMSolicTransf.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação
End; // Exclui Informação de Nova Versão do Sistema >>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Todos os Edts e Datas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmSolicTransf.LimpaEdts;
Begin
  EdtCodProdLinx.Clear;
  EdtDescProduto.Clear;
  EdtQtdEstoqueCD.Clear;
  EdtQtdEstoque.Clear;
  EdtQtdTransf.Clear;
  Lab_UnidadeCD.Caption:='';
  Lab_Unidade.Caption:='';

//  DtEdt_DtaInicio.Clear;
//  DtEdt_DtaFim.Clear;
End; // Limpa Todos os Edts e Datas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Cria Limites da Loja em Tab_Auxiliar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmSolicTransf.CriaLimitesLoja: Boolean;
Var
  MySql: String;
Begin

  Result:=True;

  // Verifica se Transação esta Ativa
  If DMSolicTransf.SQLC.InTransaction Then
   DMSolicTransf.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMSolicTransf.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR'+
           ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
           ' VALUES ('+
           ' 19, '+ // TIP_AUX
           sgLojaLinx+', '+ // COD_AUX
           '25, '+ // DES_AUX
           '24, '+ // DES_AUX1
           ' NULL, '+ // VLR_AUX
           ' NULL)'+ // VLR_AUX1
           ' MATCHING (TIP_AUX, COD_AUX)';
    DMSolicTransf.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMSolicTransf.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      Result:=False;

      DMSolicTransf.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação
End; // Cria Limites da Loja em Tab_Auxiliar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmSolicTransf.CreateToolTips(hWnd: Cardinal);
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
Procedure TFrmSolicTransf.FocoToControl(Sender: TControl);
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
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmSolicTransf.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
Var
  MySql: String;
  sErro: String;
  b: Boolean;
  i: Integer;
begin

  If not(fileexists(IncludeTrailingPathDelimiter(sgPastaExecutavel)+'Loja.ini')) then
  Begin
    msg('Definição da Loja Não Encontrada !!'+cr+'Entrar em Contato com o ODIR'+cr+'Celcular:  999-578-234','A');
    Application.Terminate;
    Exit;
  End;
                       
  // Verifica Parametro Enviado ================================================
  sgCodLojaVersaoOK:='';
  for i:=1 to ParamCount do
   sgCodLojaVersaoOK:=ParamStr(i);

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Descrição do Loja =========================================================
  // Loja.Ini = Cod_Loja_Sidicom ; Cod_Loja_Linx ; Descriçãso do Loja ;
  tsgArquivo:=TStringList.Create;
  tsgArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sgPastaExecutavel)+'Loja.ini');

  sgLojaLinx     :='';
  sgLojaSidicom  :='';
  sgNomeLoja     :='';
  sErro          :='';
  Try
    If Trim(tsgArquivo[0])='' Then
     sErro:='SIM';

    If sErro='' Then
    Begin
      sgLojaSidicom  :=Separa_String(tsgArquivo[0],1);
      sgLojaLinx     :=Separa_String(tsgArquivo[0],2);
      sgNomeLoja     :=Separa_String(tsgArquivo[0],3);

      StrToInt(sgLojaLinx);
      StrToInt(sgLojaSidicom);

      If Trim(sgNomeLoja)='' Then
       sErro:='SIM';
    End; // If sErro='' Then
  Except
    sErro:='SIM'
  End;

  If (Trim(sErro)<>'') or (Trim(sgNomeLoja)='Limite Superado') Then
  Begin
    msg('Definição da Loja Inválida !!'+cr+'Entrar em Contato com o ODIR'+cr+'Celcular:  999-578-234','A');
    Application.Terminate;
    Exit;
  End;

  FreeAndNil(tsgArquivo);
  Pan_Loja.Caption:=sgNomeLoja;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;

  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  // Show Hint em Forma de Balão ===============================================
  CreateToolTips(Self.Handle);
  AddToolTip(EdtCodProdLinx.Handle, @ti, TipoDoIcone, 'Informar Código Linx', 'CÓDIGO DO PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaProdtudo.Handle, @ti, TipoDoIcone, 'Busca Produtos Linx', 'SELECIONA PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(EdtQtdTransf.Handle, @ti, TipoDoIcone, 'Informar Quantidade a Transferir', 'QUANTIDADE !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Incluir.Handle, @ti, TipoDoIcone, 'Inclui/Sobscreve'+cr+'Produto da Solicitação', 'INCLUIR PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Excluir.Handle, @ti, TipoDoIcone, 'Exclui Produto Selecionado'+cr+'na Solicitação', 'EXCLUIR PRODUTO !!');

  // Verifica Conexão ==========================================================
  If Not DMSolicTransf.SQLC.Connected Then
   DMSolicTransf.SQLC.Connected:=True;

  // Busca Numero/Quantidade Máxima de Transferencia ===========================
  b:=True;
  While b do
  Begin
    MySql:=' SELECT t.des_aux Num_Prod, t.des_aux1 Qtd_Prod'+
           ' FROM TAB_AUXILIAR t'+
           ' WHERE t.tip_aux=19'+
           ' AND   t.cod_aux='+sgLojaLinx;
    DMSolicTransf.CDS_Busca.Close;
    DMSolicTransf.SQLQ_Busca.Close;
    DMSolicTransf.SQLQ_Busca.SQL.Clear;
    DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
    DMSolicTransf.CDS_Busca.Open;
    If Trim(DMSolicTransf.CDS_Busca.FieldByName('Num_Prod').AsString)='' Then
     Begin
       // Cria Limites da Loja em Tab_Auxiliar
       If Not CriaLimitesLoja Then
       Begin
         msg('Erro ao Criar Limites da Loja !!','A');
         Application.Terminate;
         Exit;
       End;
     End
    Else
     Begin
       Break;
     End; // If Trim(DMSolicTransf.CDS_Busca.FieldByName('Num_Prod').AsString)='' Then
  End; // While b do
  igNumMaxProd:=DMSolicTransf.CDS_Busca.FieldByName('Num_Prod').AsInteger;
  igQtdMaxProd:=DMSolicTransf.CDS_Busca.FieldByName('Qtd_Prod').AsInteger;
  DMSolicTransf.CDS_Busca.Close;
  Stb_ParamTransf.Panels[3].Text:='Nº Maximo de Produtos/Dia: '+IntToStr(igNumMaxProd);
  Stb_ParamTransf.Panels[4].Text:='Quantidade Maxima Por Produto: '+IntToStr(igQtdMaxProd);

  // Busca Solicitação do Dia ==================================================
  MySql:=' SELECT tr.dta_solicitacao, tr.num_solicitacao,'+
         '        tr.cod_prod_linx, TRIM(pr.nome) nome,'+
         '        tr.qtd_estoque, tr.qtd_transf'+
         ' FROM SOL_TRANSFERENCIA_CD tr, LINXPRODUTOS pr'+
         ' WHERE tr.cod_prod_linx=pr.cod_produto'+
         ' AND  tr.dta_solicitacao=CURRENT_DATE'+
         ' AND  tr.cod_loja_linx='+sgLojaLinx+
         ' ORDER BY pr.nome';
  DMSolicTransf.CDS_Solicitacao.Close;
  DMSolicTransf.SQLQ_Solicitacao.Close;
  DMSolicTransf.SQLQ_Solicitacao.SQL.Clear;
  DMSolicTransf.SQLQ_Solicitacao.SQL.Add(MySql);
  DMSolicTransf.CDS_Solicitacao.Open;
  sgNumSolicitacao:=DMSolicTransf.CDS_SolicitacaoNUM_SOLICITACAO.AsString;

  // Busca Numero da Solicitação ===============================================
  If Trim(sgNumSolicitacao)='' Then
  Begin
    MySql:=' SELECT GEN_ID(GEN_SOLIC_TRANSFERENCIAS,1) Numero'+
           ' FROM RDB$DATABASE';
    DMSolicTransf.CDS_Busca.Close;
    DMSolicTransf.SQLQ_Busca.Close;
    DMSolicTransf.SQLQ_Busca.SQL.Clear;
    DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
    DMSolicTransf.CDS_Busca.Open;
    sgNumSolicitacao:=DMSolicTransf.CDS_Busca.FieldByName('Numero').AsString;
    DMSolicTransf.CDS_Busca.Close;
  End; // If Trim(sgNumSolicitacao)='' Then
end;

procedure TFrmSolicTransf.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;
end;

procedure TFrmSolicTransf.FormShow(Sender: TObject);
begin
  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  PC_Principal.TabIndex:=0;
  PC_PrincipalChange(Self);

// odirApagar - 04/10/2017 - Versão com Servidor / Client ======================  
//  // Se Versao já Atualizada - Parametros vem do Cliente de Transferencia do Aplicativo
//  If Trim(sgCodLojaVersaoOK)<>'' Then
//  Begin
//    If Not ExcluiVersaoTabAuxiliar Then
//    Begin
//      msg('Erro ao Verificar Versão do Sistema  !!','A');
//      Application.Terminate;
//      Exit;
//    End;
//  End; //If Trim(sgCodLojaVersaoOK<>'') Then
//
//  // Atualiza Novca Versão do Sistema ==========================================
//  NovaVersao;
end;

procedure TFrmSolicTransf.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
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

procedure TFrmSolicTransf.Dbg_ProdutosEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ProdutosEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicTransf.EdtCodProdLinxExit(Sender: TObject);
Var
  MySql,
  sDesAtivado: String;
begin

  If EdtCodProdLinx.Value<>0 Then
  Begin
    If DMSolicTransf.CDS_Solicitacao.RecNo>=igNumMaxProd Then
    Begin
      msg('Número Máximo de Produtos por'+cr+'Transferêcia Diária Esta Completo !!'+cr+IntToStr(igNumMaxProd)+' Produtos por Dia !!','A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End; // If Not bMultiplo Then

    Screen.Cursor:=crAppStart;

    // Verifica Conexão ========================================================
    If Not DMSolicTransf.SQLC.Connected Then
     DMSolicTransf.SQLC.Connected:=True;

    MySql:=' SELECT pr.Cod_Produto, pr.Nome, pr.Cod_Auxiliar,'+
           '        pr.DesAtivado, pr.Unidade,'+
           '        COALESCE(pd.Quantidade,0) Quantidade'+
           ' FROM LINXPRODUTOS pr, LINXPRODUTOSDETALHES pd'+
           ' WHERE pr.cod_produto=pd.cod_produto'+
           ' AND   pd.empresa=2'+
           ' AND   pr.cod_produto='+IntToStr(EdtCodProdLinx.AsInteger);
    DMSolicTransf.CDS_Busca.Close;
    DMSolicTransf.SQLQ_Busca.Close;
    DMSolicTransf.SQLQ_Busca.SQL.Clear;
    DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
    DMSolicTransf.CDS_Busca.Open;

    EdtDescProduto.Text      :=Trim(DMSolicTransf.CDS_Busca.FieldByName('Nome').AsString);
    EdtQtdEstoqueCD.AsInteger:=DMSolicTransf.CDS_Busca.FieldByName('Quantidade').AsInteger;
    sDesAtivado              :=Trim(DMSolicTransf.CDS_Busca.FieldByName('DesAtivado').AsString);
    sgCodProdLinx            :=DMSolicTransf.CDS_Busca.FieldByName('Cod_Produto').AsString;
    sgCodProdSidicom         :=Trim(DMSolicTransf.CDS_Busca.FieldByName('Cod_Auxiliar').AsString);
    Lab_Unidade.Caption      :=Trim(DMSolicTransf.CDS_Busca.FieldByName('Unidade').AsString);
    Lab_UnidadeCD.Caption    :=Trim(DMSolicTransf.CDS_Busca.FieldByName('Unidade').AsString);

    DMSolicTransf.CDS_Busca.Close;

    Screen.Cursor:=crDefault;
    If EdtDescProduto.Text='' Then
    Begin
      msg('Produto (Linx) NÃO Encontrado !!!', 'A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If sDesAtivado='S' Then
    Begin
      msg('Produto (Linx) Desativado !!!', 'A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If Trim(sgCodProdSidicom)='' Then
    Begin
      msg('Produto Não Encontrado no CD !!!', 'A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If EdtQtdEstoqueCD.AsInteger<1 Then
    Begin
      msg('Produto SEM ESTOQUE no CD !!!', 'A');
      LimpaEdts;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If EdtQtdEstoque.CanFocus   Then EdtQtdEstoque.SetFocus;
    If DtEdt_DtaInicio.CanFocus Then DtEdt_DtaInicio.SetFocus;
  End; // If EdtFiltroCodProdLinx.Value<>0 Then
end;

procedure TFrmSolicTransf.EdtCodProdLinxChange(Sender: TObject);
begin
  EdtDescProduto.Clear;
  Lab_Unidade.Caption:='';
  Lab_UnidadeCD.Caption:='';
end;

procedure TFrmSolicTransf.Bt_BuscaProdtudoClick(Sender: TObject);
Var
  MySql: String;
  b:Boolean;
  sNome: String;
Begin

  LimpaEdts;
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
    Else // If InputQuery('Informe o Desconto','',sVlrDesc) then
     Begin
       Exit;
     End; // If InputQuery('Informe o Desconto','',sVlrDesc) then
  End; // While b do

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  OdirPanApres.Caption:='AGUARDE !! Localizando Produtos no Servidor BelShop ...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicTransf.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicTransf.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicTransf;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica Conexão ==========================================================
  If Not DMSolicTransf.SQLC.Connected Then
   DMSolicTransf.SQLC.Connected:=True;

  MySql:=' SELECT TRIM(pr.nome) nome, pr.cod_produto'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE pr.desativado=''N'''+
         ' AND pr.Nome LIKE ''%'+AnsiUpperCase(sNome)+'%'''+
         ' ORDER BY pr.nome';
  DMSolicTransf.CDS_Pesquisa.Close;
  DMSolicTransf.SQLQ_Pesquisa.Close;
  DMSolicTransf.SQLQ_Pesquisa.SQL.Clear;
  DMSolicTransf.SQLQ_Pesquisa.SQL.Add(MySql);
  DMSolicTransf.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;
  OdirPanApres.Visible:=False;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMSolicTransf.CDS_Pesquisa.FieldByName('Nome').AsString)='' Then
  Begin
    msg('Sem Produto a Listar !!','A');
    DMSolicTransf.CDS_Pesquisa.Close;
    FreeAndNil(FrmPesquisa);
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Nome';
  FrmPesquisa.Campo_Codigo:='Cod_Produto';
  FrmPesquisa.Campo_Descricao:='Nome';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMSolicTransf.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtCodProdLinx.AsInteger:=StrToInt(FrmPesquisa.EdtCodigo.Text);
    EdtCodProdLinxExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmSolicTransf.PC_PrincipalChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Principal);

  LimpaEdts;

  If (PC_Principal.ActivePage=Ts_Produtos) And (Ts_Produtos.CanFocus) Then
  Begin
    Gb_Produto.Parent:=Gb_Solicitacao;
  End;

  If (PC_Principal.ActivePage=Ts_Consultas) And (Ts_Consultas.CanFocus) Then
  Begin
    Gb_Produto.Parent:=Gb_Verifica;
  End;

  Gb_Produto.TabOrder:=0;
  EdtCodProdLinx.SetFocus;
end;

procedure TFrmSolicTransf.Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
  // Usado em:
  //=====================
  // Dbg_Produtos
  // Dbg_VerificaProdutos
  //=====================
  If ((Shift = [ssCtrl]) And (key = vk_delete)) Then
   Abort;

end;

procedure TFrmSolicTransf.Bt_IncluirClick(Sender: TObject);
Var
  MySql: String;
begin
  If DMSolicTransf.CDS_Solicitacao.RecNo>=igNumMaxProd Then
  Begin
    msg('Número Máximo de Produtos por'+cr+'Transferêcia Diária Esta Completo !!'+cr+IntToStr(igNumMaxProd)+' Produtos por Dia !!','A');
    LimpaEdts;
    EdtCodProdLinx.SetFocus;
    Exit;
  End; // If Not bMultiplo Then

  // Consiste ==================================================================
  If EdtCodProdLinx.AsInteger=0 Then
  Begin
    msg('Favor Informar o Produto !!','A');
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  If EdtQtdTransf.AsInteger=0 Then
  Begin
    msg('Quantidade a Transferir é Inválida !!','A');
    EdtQtdTransf.SetFocus;
    Exit;
  End;

  If EdtQtdEstoque.AsInteger<0 Then
  Begin
    msg('Estoque Físico Inválido (Negativo) !!','A');
    EdtQtdEstoque.SetFocus;
    Exit;
  End;

  OdirPanApres.Caption:='AGUARDE !! Incluindo Produto na Solicitação';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicTransf.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicTransf.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicTransf;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica Conexão ==========================================================
  If Not DMSolicTransf.SQLC.Connected Then
   DMSolicTransf.SQLC.Connected:=True;

  // Verifica se Transação esta Ativa
  If DMSolicTransf.SQLC.InTransaction Then
   DMSolicTransf.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMSolicTransf.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;

    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE OR INSERT INTO SOL_TRANSFERENCIA_CD'+
           ' (DTA_SOLICITACAO, NUM_SOLICITACAO, COD_LOJA_SIDI, COD_LOJA_LINX,'+
           '  COD_PROD_LINX, COD_PROD_SIDI, QTD_ESTOQUE, QTD_TRANSF)'+
           ' VALUES (CURRENT_DATE,'+ // DTA_SOLICITACAO
           sgNumSolicitacao+', '+ // NUM_SOLICITACAO
           QuotedStr(sgLojaSidicom)+', '+ // COD_LOJA_SIDI
           sgLojaLinx+', '+ // COD_LOJA_LINX
           sgCodProdLinx+', '; // COD_PROD_LINX

           // COD_PROD_SIDI
           If Trim(sgCodProdSidicom)<>'' Then
            MySql:=
             MySql+QuotedStr(sgCodProdSidicom)+', '
           Else
            MySql:=
             MySql+'NULL , ';

    MySql:=
     MySql+IntToStr(EdtQtdEstoque.AsInteger)+', '+ // QTD_ESTOQUE
           IntToStr(EdtQtdTransf.AsInteger)+')'+ // QTD_TRANSF
           ' MATCHING (DTA_SOLICITACAO, NUM_SOLICITACAO, COD_LOJA_LINX, COD_PROD_LINX)';
    DMSolicTransf.SQLC.Execute(MySql,nil,nil);

    DMSolicTransf.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

    DMSolicTransf.CDS_Solicitacao.Close;
    DMSolicTransf.CDS_Solicitacao.Open;
    DMSolicTransf.CDS_Solicitacao.Locate('COD_PROD_LINX', sgCodProdLinx,[]);
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMSolicTransf.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try da Transação

  LimpaEdts;
  
  EdtCodProdLinx.SetFocus;
end;

procedure TFrmSolicTransf.Bt_ExcluirClick(Sender: TObject);
Var
  MySql: String;
begin

  If DMSolicTransf.CDS_Solicitacao.IsEmpty Then
   Exit;

  If msg('Excluir o Produto Selecionado ?'+cr+DMSolicTransf.CDS_SolicitacaoNOME.AsString,'C')=2 Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Excluindo Produto da Solicitação...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicTransf.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicTransf.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicTransf;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica Conexão ==========================================================
  If Not DMSolicTransf.SQLC.Connected Then
   DMSolicTransf.SQLC.Connected:=True;

  // Verifica se Transação esta Ativa
  If DMSolicTransf.SQLC.InTransaction Then
   DMSolicTransf.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMSolicTransf.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' DELETE FROM SOL_TRANSFERENCIA_CD so'+
           ' WHERE so.dta_solicitacao=CURRENT_DATE'+
           ' AND   so.num_solicitacao='+DMSolicTransf.CDS_SolicitacaoNUM_SOLICITACAO.AsString+
           ' AND   so.cod_prod_linx='+DMSolicTransf.CDS_SolicitacaoCOD_PROD_LINX.AsString;
    DMSolicTransf.SQLC.Execute(MySql,nil,nil);

    DMSolicTransf.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

    DMSolicTransf.CDS_Solicitacao.Close;
    DMSolicTransf.CDS_Solicitacao.Open;

    msg('Exclusão Efetuada com SUCESSO !!','A');

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMSolicTransf.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação

  EdtCodProdLinx.SetFocus;
end;

procedure TFrmSolicTransf.Dbg_ProdutosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sValor, sCodProd: String;
  b: Boolean;
begin
  If DMSolicTransf.CDS_Solicitacao.IsEmpty Then
   Exit;

  // Localizar Produto =========================================================
  If Key=Vk_F4 Then
  Begin
    sCodProd:= DMSolicTransf.CDS_SolicitacaoCOD_PROD_LINX.AsString;
    
    sValor:='';
    b:=True;
    While b do
    Begin
      If InputQuery('Localizar Produto','',sValor) then
       Begin
         Try
           StrToInt(sValor);

           If Not DMSolicTransf.CDS_Solicitacao.Locate('COD_PROD_LINX', sValor,[]) Then
           Begin
            If Not LocalizaRegistro(DMSolicTransf.CDS_Solicitacao, 'COD_PROD_LINX', sValor) Then
             b:=False;
           End; // If Not DMSolicTransf.CDS_Solicitacao.Locate('COD_PROD_LINX', sValor,[]) Then

           Break;
         Except
           If Not DMSolicTransf.CDS_Solicitacao.Locate('NOME', sValor,[]) Then
           Begin
             If Not LocalizaRegistro(DMSolicTransf.CDS_Solicitacao, 'NOME', sValor) Then
              b:=False;
           End; // If Not DMSolicTransf.CDS_Solicitacao.Locate('NOME', sValor,[]) Then

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
      DMSolicTransf.CDS_Solicitacao.Locate('COD_PROD_LINX',sCodProd,[]);
      msg('Produto Não Localizado !!','A');
    End;
  End; // If Key=Vk_F4 Then

end;

procedure TFrmSolicTransf.EdtQtdTransfExit(Sender: TObject);
Var
  MySql: String;
  sCodGrupo, sCodSubGrupo, sQtdCaixa: String;
  iQtdMultiplo: Integer;
  bMultiplo: Boolean;
begin

  If EdtQtdTransf.AsInteger=0 Then
  Begin
    msg('Quantidade de Transferência'+cr+'INVÁLIDA !!','A');
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  If EdtCodProdLinx.AsInteger=0 Then
  Begin
    msg('Favor Informar o Produto !!','A');
    EdtCodProdLinx.SetFocus;
    Exit;
  End;

  // Verifica Conexão ==========================================================
  If Not DMSolicTransf.SQLC.Connected Then
   DMSolicTransf.SQLC.Connected:=True;

  // Busca Produto Caixa Embarque ==============================================
  MySql:=' SELECT Trim(pr.codgrupo) CodGrupo, Trim(pr.codsubgrupo) CodSubGrupo'+
         ' FROM PRODUTO pr'+
         ' WHERE pr.codproduto='+QuotedStr(sgCodProdSidicom);
  DMSolicTransf.CDS_Busca.Close;
  DMSolicTransf.SQLQ_Busca.Close;
  DMSolicTransf.SQLQ_Busca.SQL.Clear;
  DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
  DMSolicTransf.CDS_Busca.Open;
  sCodGrupo   :=DMSolicTransf.CDS_Busca.FieldByName('CodGrupo').AsString;
  sCodSubGrupo:=DMSolicTransf.CDS_Busca.FieldByName('CodSubGrupo').AsString;
  DMSolicTransf.CDS_Busca.Close;

  MySql:=' SELECT cp.Cod_Produto, cp.Cod_Grupo, cp.Cod_Subgrupo,'+
         '        cp.Qtd_Caixa, cp.Per_Corte'+
         ' FROM PROD_CAIXA_CD cp'+
         ' WHERE ((cp.cod_produto='+QuotedStr(sgCodProdSidicom)+')'+
         '        OR'+
         '        ((cp.cod_grupo='+QuotedStr(sCodGrupo)+') and (cp.cod_subgrupo is null))'+
         '        OR'+
         '        ((cp.cod_grupo='+QuotedStr(sCodGrupo)+') and (cp.cod_subgrupo='+QuotedStr(sCodSubGrupo)+')))'+
         ' ORDER BY 1 desc, 4 desc';
  DMSolicTransf.CDS_Busca.Close;
  DMSolicTransf.SQLQ_Busca.Close;
  DMSolicTransf.SQLQ_Busca.SQL.Clear;
  DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
  DMSolicTransf.CDS_Busca.Open;

  sQtdCaixa:=DMSolicTransf.CDS_Busca.FieldByName('Qtd_Caixa').AsString;
  DMSolicTransf.CDS_Busca.Close;

  bMultiplo:=False;
  If Trim(sQtdCaixa)<>'' Then
  Begin
    bMultiplo:=True;
    If StrToInt(sQtdCaixa)<>igQtdMaxProd Then
    Begin
      MessageBox(Application.Handle, Pchar('PRODUTO com CAIXA de Transferência'+cr+
                                           'com '+sQtdCaixa+' Produtos por Caixa'), 'Aviso', MB_ICONEXCLAMATION);

      If EdtQtdTransf.AsInteger<StrToInt(sQtdCaixa) Then
       Begin
         EdtQtdTransf.AsInteger:=StrToInt(sQtdCaixa)
       End
      Else If EdtQtdTransf.AsInteger>StrToInt(sQtdCaixa) Then // Calcula Multiplo
       Begin
         iQtdMultiplo:=StrToInt(sQtdCaixa);
         While bMultiplo do
         Begin
           If iQtdMultiplo>igQtdMaxProd Then
           Begin
             EdtQtdTransf.AsInteger:=iQtdMultiplo;
             Break;
           End;

           If EdtQtdTransf.AsInteger<iQtdMultiplo Then
           Begin
             EdtQtdTransf.AsInteger:=iQtdMultiplo;
             Break;
           End;

           If EdtQtdTransf.AsInteger=iQtdMultiplo Then
            Begin
              Break;
            End
           Else
            Begin
              iQtdMultiplo:=iQtdMultiplo+StrToInt(sQtdCaixa);
            End;
         End; // While bMultiplo do
       End; // If EdtQtdTransf.AsInteger<StrToInt(sQtdCaixa) Then
    End; // If StrToInt(sQtdCaixa)<>igQtdMaxProd Then
    Bt_Incluir.SetFocus;
  End; // If Trim(sQtdCaixa)<>'' Then

  If (Not bMultiplo) And (EdtQtdTransf.AsInteger>igQtdMaxProd) Then
  Begin
    msg('Quantidade de Transferência Inválida !!'+cr+'Superior ao Maximo de '+IntToStr(igQtdMaxProd)+' por Produto','A');
    EdtQtdTransf.SetFocus;
    Exit;
  End; // If Not bMultiplo Then

  Bt_Incluir.SetFocus;
end;

procedure TFrmSolicTransf.FormCloseQuery(Sender: TObject;  var CanClose: Boolean);
begin
  // Encerra Conexão ===========================================================
  If DMSolicTransf.SQLC.Connected Then
   DMSolicTransf.SQLC.Connected:=False;

end;

procedure TFrmSolicTransf.Dbg_VerificaProdutosEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_VerificaProdutosEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmSolicTransf.Bt_VerificarClick(Sender: TObject);
Var
  MySql: String;
begin
  Try
    StrToDate(DtEdt_DtaInicio.Text);
  Except
    msg('Data Inicial Inválida !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_DtaFim.Text);
  Except
    msg('Data Final Inválida !!','A');
    DtEdt_DtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_DtaFim.Date>=dgDtaHoje Then
  Begin
    msg('Data Final Deve Ser'+cr+cr+'MENOR que Hoje !!','A');
    DtEdt_DtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_DtaFim.Date<DtEdt_DtaInicio.Date Then
  Begin
    msg('Período Inválido !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  If (DtEdt_DtaFim.Date-DtEdt_DtaInicio.Date)>10 Then
  Begin
    msg('Período a Verificar deve Conter'+cr+cr+'no Máximo 10 (DEZ) Dias !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  MySql:=' SELECT so.dta_solicitacao, pl.nome,'+

         ' CASE'+
         '   WHEN so.doc_gerado=0 THEN'+
         '     ''NÃO'''+
         '   ELSE'+
         '     ''SIM'''+
         ' END enviado_cd,'+

         ' CASE'+
         '   WHEN (COALESCE(el.num_pedido,''000000'')<>''000000'') AND (CAST(COALESCE(el.num_pedido,''0'') AS INTEGER)<999990) THEN'+
         '     ''SIM'''+
         '   ELSE'+
         '     ''NÃO'''+
         ' END transf_loja,'+

         ' so.qtd_transf Qtd_Solicitada,'+
         ' el.qtd_transf Qtd_De_Transf,'+

         ' CASE'+
         '   WHEN (COALESCE(el.num_pedido,''000000'')<>''000000'') AND (CAST(COALESCE(el.num_pedido,''0'') AS INTEGER)<999990) THEN'+
         '     el.qtd_a_transf'+
         '   ELSE'+
         '     0'+
         ' END qtd_a_transf,'+

         ' so.cod_prod_sidi, so.cod_prod_linx,'+
         ' so.dta_processamento, so.doc_gerado, el.obs_docto, so.num_solicitacao'+

         ' FROM SOL_TRANSFERENCIA_CD so'+
         '    LEFT JOIN LINXPRODUTOS      pl  ON pl.cod_produto=so.cod_prod_linx'+
         '    LEFT JOIN ES_ESTOQUES_LOJAS el  ON el.dta_movto  =so.dta_processamento'+
         '                                   AND el.num_docto  =so.doc_gerado'+
         '                                   AND el.cod_produto=so.cod_prod_sidi'+
         '                                   AND el.cod_loja   =so.cod_loja_sidi'+

         ' WHERE so.dta_solicitacao BETWEEN '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaInicio.Date))))+' AND '+
                                              QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaFim.Date))))+
         ' AND   so.cod_loja_linx='+sgLojaLinx;

         If EdtCodProdLinx.AsInteger<>0 Then
          MySql:=
           MySql+' AND   so.cod_prod_linx='+IntToStr(EdtCodProdLinx.AsInteger);

  MySql:=
   MySql+' ORDER BY 2, 1';
  DMSolicTransf.CDS_Verifica.Close;
  DMSolicTransf.SQLQ_Verifica.Close;
  DMSolicTransf.SQLQ_Verifica.SQL.Clear;
  DMSolicTransf.SQLQ_Verifica.SQL.Add(MySql);
  DMSolicTransf.CDS_Verifica.Open;

  If Trim(DMSolicTransf.CDS_VerificaCOD_PROD_LINX.AsString)='' Then
  Begin
    msg('Sem Solicitação a'+cr+cr+'Lista no Período !!','A');
    DMSolicTransf.CDS_Verifica.Close;
    LimpaEdts;
    EdtCodProdLinx.SetFocus;
    Exit;
  End;
  Dbg_VerificaProdutos.SetFocus;
end;

procedure TFrmSolicTransf.Dbg_VerificaProdutosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If (Column.FieldName='ENVIADO_CD') Then // Este comando altera cor da Celula
  Begin
    If DMSolicTransf.CDS_VerificaENVIADO_CD.AsString='SIM' Then
    Begin
      Dbg_VerificaProdutos.Canvas.Font.Style:=[fsBold];
      Dbg_VerificaProdutos.Canvas.Font.Color:=clBlue; // Cor da Fonte
    End;
  End;

  If (Column.FieldName='TRANSF_LOJA') Then // Este comando altera cor da Celula
  Begin
    If DMSolicTransf.CDS_VerificaTRANSF_LOJA.AsString='SIM' Then
    Begin
      Dbg_VerificaProdutos.Canvas.Font.Style:=[fsBold];
      Dbg_VerificaProdutos.Canvas.Font.Color:=clBlue; // Cor da Fonte
    End;
  End;

  If (Column.FieldName='QTD_A_TRANSF') Then // Este comando altera cor da Celula
  Begin
    If DMSolicTransf.CDS_VerificaQTD_A_TRANSF.AsCurrency<>0.00 Then
    Begin
      Dbg_VerificaProdutos.Canvas.Font.Style:=[fsBold];
      Dbg_VerificaProdutos.Canvas.Font.Color:=clBlue; // Cor da Fonte
    End;
  End;
  Dbg_VerificaProdutos.Canvas.FillRect(Rect);
  Dbg_VerificaProdutos.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMSolicTransf.CDS_VerificaDTA_SOLICITACAO.Alignment:=taCenter;
  DMSolicTransf.CDS_VerificaENVIADO_CD.Alignment:=taCenter;
  DMSolicTransf.CDS_VerificaTRANSF_LOJA.Alignment:=taCenter;
  DMSolicTransf.CDS_VerificaQTD_DE_TRANSF.Alignment:=taRightJustify;
  DMSolicTransf.CDS_VerificaQTD_A_TRANSF.Alignment:=taRightJustify;
  DMSolicTransf.CDS_VerificaCOD_PROD_LINX.Alignment:=taRightJustify;
  DMSolicTransf.CDS_VerificaCOD_PROD_SIDI.Alignment:=taRightJustify;
  DMSolicTransf.CDS_VerificaDTA_PROCESSAMENTO.Alignment:=taCenter;
  DMSolicTransf.CDS_VerificaDOC_GERADO.Alignment:=taRightJustify;
  DMSolicTransf.CDS_VerificaNUM_SOLICITACAO.Alignment:=taRightJustify;
end;

procedure TFrmSolicTransf.Dbg_VerificaProdutosKeyUp(Sender: TObject; Var Key: Word; Shift: TShiftState);
Var
  sValor, sCodProd: String;
  b: Boolean;
begin

  If DMSolicTransf.CDS_Verifica.IsEmpty Then
   Exit;

  // Localizar Produto =========================================================
  If Key=Vk_F4 Then
  Begin
    sCodProd:= DMSolicTransf.CDS_VerificaCOD_PROD_LINX.AsString;

    sValor:='';
    b:=True;
    While b do
    Begin
      If InputQuery('Localizar Produto','',sValor) then
       Begin
         Try
           StrToInt(sValor);

           If Not DMSolicTransf.CDS_Verifica.Locate('COD_PROD_LINX', sValor,[]) Then
           Begin
            If Not LocalizaRegistro(DMSolicTransf.CDS_Verifica, 'COD_PROD_LINX', sValor) Then
             b:=False;
           End; // If Not DMSolicTransf.CDS_Verifica.Locate('COD_PROD_LINX', sValor,[]) Then

           Break;
         Except
           If Not DMSolicTransf.CDS_Verifica.Locate('NOME', sValor,[]) Then
           Begin
             If Not LocalizaRegistro(DMSolicTransf.CDS_Verifica, 'NOME', sValor) Then
              b:=False;
           End; // If Not DMSolicTransf.CDS_Verifica.Locate('NOME', sValor,[]) Then

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
      DMSolicTransf.CDS_Verifica.Locate('COD_PROD_LINX',sCodProd,[]);
      msg('Produto Não Localizado !!','A');
    End;
  End; // If Key=Vk_F4 Then
end;

procedure TFrmSolicTransf.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Versão do Sistema =========================================================
  If Key=Vk_F3 Then
  Begin
    msg('Data da Última Alteração: '+Copy(DateTimeToStr(FileDateToDateTime(
        FileAge(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+
        ExtractFileName(Application.ExeName)))),1,19),'A');
  End;

end;

procedure TFrmSolicTransf.Button1Click(Sender: TObject);
Var
  MySql: String;
begin
{
  MySql:=' select distinct  DOC_NA_SEPARACAO, NUM_DOCTO_ATUAL, NUM_SOLICITACAO,'+
         ' DOC_GERADO_SOLICITACAO, DTA_SOLICITACAO, COD_LOJA_SIDI, COD_LOJA_LINX,'+
         ' COD_PROD_LINX, COD_PROD_SIDI'+
         ' FROM APAGAR';
  DMSolicTransf.CDS_Busca.Close;
  DMSolicTransf.SQLQ_Busca.Close;
  DMSolicTransf.SQLQ_Busca.SQL.Clear;
  DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
  DMSolicTransf.CDS_Busca.Open;

  OdirPanApres.Caption:='AGUARDE !! Alterado Data CC';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmSolicTransf.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmSolicTransf.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmSolicTransf;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica se Transação esta Ativa
  If DMSolicTransf.SQLC.InTransaction Then
   DMSolicTransf.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMSolicTransf.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    EdtQtdEstoque.AsInteger:=DMSolicTransf.CDS_Busca.RecordCount;

    DMSolicTransf.CDS_Busca.DisableControls;
    While Not DMSolicTransf.CDS_Busca.Eof do
    Begin
      Application.ProcessMessages;

      MySql:=' update sol_transferencia_cd t'+
             ' set t.doc_gerado='+DMSolicTransf.CDS_Busca.FieldByName('num_docto_atual').AsString+
             ', t.dta_processamento=current_date'+
             ' where t.num_solicitacao='+DMSolicTransf.CDS_Busca.FieldByName('NUM_SOLICITACAO').AsString+
             ' and t.doc_gerado='+DMSolicTransf.CDS_Busca.FieldByName('DOC_GERADO_SOLICITACAO').AsString+
             ' and t.dta_solicitacao='+QuotedStr(DMSolicTransf.CDS_Busca.FieldByName('DTA_SOLICITACAO').AsString)+
             ' and t.cod_loja_sidi='+QuotedStr(DMSolicTransf.CDS_Busca.FieldByName('cod_loja_sidi').AsString)+
             ' and t.cod_loja_linx='+DMSolicTransf.CDS_Busca.FieldByName('cod_loja_linx').AsString+
             ' and t.cod_prod_linx='+DMSolicTransf.CDS_Busca.FieldByName('cod_prod_linx').AsString+
             ' and t.cod_prod_sidi='+QuotedStr(DMSolicTransf.CDS_Busca.FieldByName('cod_prod_sidi').AsString);
      DMSolicTransf.SQLC.Execute(MySql,nil,nil);

      EdtQtdTransf.AsInteger:=DMSolicTransf.CDS_Busca.RecNo;

      DMSolicTransf.CDS_Busca.Next;
    End;
    DMSolicTransf.CDS_Busca.EnableControls;
    DMSolicTransf.CDS_Busca.Close;

    // Atualiza Transacao ======================================================
    DMSolicTransf.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMSolicTransf.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try da Transação

  DMSolicTransf.CDS_Busca.Close
}
end;

end.
