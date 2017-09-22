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
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmSolicTransf = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    Pan_Loja: TPanel;
    ApplicationEvents1: TApplicationEvents;
    OdirPanApres: TPanel;
    PC_Principal: TPageControl;
    Ts_Produtos: TTabSheet;
    Gb_Produto: TGroupBox;
    Label75: TLabel;
    Label1: TLabel;
    EdtCodProdLinx: TCurrencyEdit;
    Bt_BuscaProdtudo: TJvXPButton;
    EdtDescProduto: TEdit;
    EdtQtdTransf: TCurrencyEdit;
    Dbg_Produtos: TDBGridJul;
    Bt_Incluir: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    Label2: TLabel;
    EdtQtdEstoque: TCurrencyEdit;
    Stb_ParamTransf: TdxStatusBar;
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

    // ODIR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_IncluirClick(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
    procedure Dbg_ProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQtdTransfExit(Sender: TObject); // Posiciona no Componente

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
begin
  If not(fileexists(IncludeTrailingPathDelimiter(sgPastaExecutavel)+'Loja.ini')) then
  Begin
  
    msg('Definição da Loja Não Encontrada !!'+cr+'Entrar em Contato com o ODIR'+cr+'Celcular:  999-578-234','A');
    Application.Terminate;
    Exit;
  End;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Descrição do Loja =========================================================
  // Loja.Ini = Cod_Loja_Sidicom ; Cod_Loja_Linx ; Descriçãso do Loja ;
  tsgArquivo:=TStringList.Create;
  tsgArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sgPastaExecutavel)+'Loja.ini');

  sgLojaLinx   :='';
  sgLojaSidicom:='';
  sgNomeLoja   :='';
  sErro        :='';
  Try
    If Trim(tsgArquivo[0])='' Then
     sErro:='SIM';

    If sErro='' Then
    Begin
      sgLojaSidicom:=Separa_String(tsgArquivo[0],1);
      sgLojaLinx   :=Separa_String(tsgArquivo[0],2);
      sgNomeLoja   :=Separa_String(tsgArquivo[0],3);

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

  // Busca Numero/Quantidade Máxima dse Transferencia ==========================
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
  Stb_ParamTransf.Panels[2].Text:='Nº Maximo de Produtos/Dia: '+IntToStr(igNumMaxProd);
  Stb_ParamTransf.Panels[3].Text:='Quantidade Maxima Por Produto: '+IntToStr(igQtdMaxProd);

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

  PC_PrincipalChange(Self);
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
      EdtDescProduto.Clear;
      EdtCodProdLinx.Clear;
      EdtQtdEstoque.Clear;
      EdtQtdTransf.Clear;
      EdtCodProdLinx.SetFocus;
      Exit;
    End; // If Not bMultiplo Then

    Screen.Cursor:=crAppStart;

    MySql:=' SELECT pr.Cod_Produto, pr.Nome, pr.Cod_Auxiliar, pr.DesAtivado'+
           ' FROM LINXPRODUTOS pr'+
           ' WHERE pr.cod_produto='+IntToStr(EdtCodProdLinx.AsInteger);
    DMSolicTransf.CDS_Busca.Close;
    DMSolicTransf.SQLQ_Busca.Close;
    DMSolicTransf.SQLQ_Busca.SQL.Clear;
    DMSolicTransf.SQLQ_Busca.SQL.Add(MySql);
    DMSolicTransf.CDS_Busca.Open;

    EdtDescProduto.Text:=Trim(DMSolicTransf.CDS_Busca.FieldByName('Nome').AsString);
    sDesAtivado        :=Trim(DMSolicTransf.CDS_Busca.FieldByName('DesAtivado').AsString);
    sgCodProdLinx   :=DMSolicTransf.CDS_Busca.FieldByName('Cod_Produto').AsString;
    sgCodProdSidicom:=Trim(DMSolicTransf.CDS_Busca.FieldByName('Cod_Auxiliar').AsString);

    DMSolicTransf.CDS_Busca.Close;

    Screen.Cursor:=crDefault;
    If EdtDescProduto.Text='' Then
    Begin
      msg('Produto (Linx) NÃO Encontrado !!!', 'A');
      EdtDescProduto.Clear;
      EdtCodProdLinx.Clear;
      EdtQtdEstoque.Clear;
      EdtQtdTransf.Clear;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If sDesAtivado='S' Then
    Begin
      msg('Produto (Linx) Desativado !!!', 'A');
      EdtDescProduto.Clear;
      EdtCodProdLinx.Clear;
      EdtQtdEstoque.Clear;
      EdtQtdTransf.Clear;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    If Trim(sgCodProdSidicom)='' Then
    Begin
      msg('Produto Não Encontrado no CD !!!', 'A');
      EdtDescProduto.Clear;
      EdtCodProdLinx.Clear;
      EdtQtdEstoque.Clear;
      EdtQtdTransf.Clear;
      EdtCodProdLinx.SetFocus;
      Exit;
    End;

    EdtQtdEstoque.SetFocus;
  End; // If EdtFiltroCodProdLinx.Value<>0 Then
end;

procedure TFrmSolicTransf.EdtCodProdLinxChange(Sender: TObject);
begin
  EdtDescProduto.Clear;
end;

procedure TFrmSolicTransf.Bt_BuscaProdtudoClick(Sender: TObject);
Var
  MySql: String;
  b:Boolean;
  sNome: String;
Begin

  EdtCodProdLinx.Clear;
  EdtDescProduto.Clear;
  EdtQtdEstoque.Clear;
  EdtQtdTransf.Clear;

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

  If (PC_Principal.ActivePage=Ts_Produtos) And (Ts_Produtos.CanFocus) Then
   EdtCodProdLinx.SetFocus;


end;

procedure TFrmSolicTransf.Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Bloquei Ctrl + Delete =====================================================
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
    EdtDescProduto.Clear;
    EdtCodProdLinx.Clear;
    EdtQtdEstoque.Clear;
    EdtQtdTransf.Clear;
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
           sgLojaSidicom+', '+ // COD_LOJA_SIDI
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

  EdtCodProdLinx.Clear;
  EdtDescProduto.Clear;
  EdtQtdEstoque.Clear;
  EdtQtdTransf.Clear;

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
end;

procedure TFrmSolicTransf.Dbg_ProdutosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sValor, sCodProd: String;
  b: Boolean;
begin
  If DMSolicTransf.CDS_Solicitacao.IsEmpty Then
   Exit;

  sCodProd:= DMSolicTransf.CDS_SolicitacaoCOD_PROD_LINX.AsString;

  // Localizar Produto =========================================================
  If Key=Vk_F4 Then
  Begin
    If Not DMSolicTransf.CDS_Solicitacao.IsEmpty Then
    Begin
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
    End; // If Not DMSolicTransf.CDS_Solicitacao.IsEmpty Then
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
         bMultiplo:=True;
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
         bMultiplo:=True;
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
end;

end.
