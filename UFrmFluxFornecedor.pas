unit UFrmFluxFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls,
  Mask, ToolEdit, CurrEdit, JvExControls, JvXPCore, JvXPButtons, IBQuery,
  DBXpress, StrUtils, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar, AppEvnts,
  Menus, Commctrl, JvExStdCtrls, JvRadioButton;

type
  TFrmFluxoFornecedor = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    Gb_FluFornFornecedor: TGroupBox;
    Bt_FluFornBuscaFornecedor: TJvXPButton;
    EdtFluFornFornecedor: TEdit;
    EdtFluFornCodFornecedor: TCurrencyEdit;
    PC_Principal: TPageControl;
    Ts_FluxFornApres: TTabSheet;
    Ts_FluxFornCaixa: TTabSheet;
    Panel38: TPanel;
    Bt_FluFornAtualizar: TJvXPButton;
    Bt_FluFornSalvaExcel: TJvXPButton;
    Gb_FluxFornComprov: TGroupBox;
    Gb_FluxFornFornec: TGroupBox;
    Dbg_FluFornFornec: TDBGrid;
    Dbg_FluFornComprov: TDBGrid;
    OdirPanApres: TPanel;
    Panel1: TPanel;
    dxStatusBar1: TdxStatusBar;
    Bt_FluFornAcertaSaldos: TJvXPButton;
    EdtFluFornCodFornAcertar: TEdit;
    Bt_FluFornFechar: TJvXPButton;
    Dbg_FluFornCaixa: TDBGrid;
    ApplicationEvents1: TApplicationEvents;
    MaskEdit1: TMaskEdit;
    PopM_Forn: TPopupMenu;
    PopM_FluFornSIM: TMenuItem;
    PopM_FluFornNAO: TMenuItem;
    Stb_FluForn: TdxStatusBar;
    Bt_FluFornComprovante: TJvXPButton;
    EdtFluFornComprovante: TEdit;
    Rb_FluFornDebito: TJvRadioButton;
    Rb_FluFornCredito: TJvRadioButton;
    Bt_FluFornFiltroComprador: TJvXPButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure PC_PrincipalChange(Sender: TObject);
    procedure Bt_FluFornAtualizarClick(Sender: TObject);

    // ODIR ====================================================================
    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente

    Procedure AtualizaDescComprvCCorrente;

    Procedure BuscaMovtosDebCre;

    Procedure CalculaFluxoCaixaFornecedores(sDt: String=''; sCodForn: String ='');

    Procedure FiltraComprador(sCompradores: String; iNumLinhas: Integer); // sCompradores: Delimitador = ';'

    Function  DML_Historicos(sTipo, sCodHist: String; sDebCre: String=''; sDesHist: String=''): Boolean;
                          // sTipo: (I)nserir
                          //        (E)xclur
    // ODIR ====================================================================

    procedure Dbg_FluFornFornecKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Dbg_FluFornFornecKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_FluFornAcertaSaldosClick(Sender: TObject);
    procedure Dbg_FluFornFornecDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_FluFornFornecTitleClick(Column: TColumn);
    procedure Bt_FluFornFecharClick(Sender: TObject);
    procedure EdtFluFornCodFornecedorChange(Sender: TObject);
    procedure EdtFluFornCodFornecedorExit(Sender: TObject);
    procedure Dbg_FluFornCaixaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_FluFornCaixaEnter(Sender: TObject);
    procedure Dbg_FluFornCaixaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_FluFornFornecEnter(Sender: TObject);
    procedure Dbg_FluFornComprovEnter(Sender: TObject);
    procedure Bt_FluFornBuscaFornecedorClick(Sender: TObject);
    procedure Dbg_FluFornFornecDblClick(Sender: TObject);
    procedure Bt_FluFornSalvaExcelClick(Sender: TObject);
    procedure Dbg_FluFornComprovDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PopM_FluFornSIMClick(Sender: TObject);
    procedure Bt_FluFornComprovanteClick(Sender: TObject);
    procedure Rb_FluFornDebitoClick(Sender: TObject);
    procedure Rb_FluFornDebitoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_FluFornFiltroCompradorClick(Sender: TObject);

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
  FrmFluxoFornecedor: TFrmFluxoFornecedor;

  bgSairFF, bgExcluiFF: Boolean;

  OrderGrid: String;    // Ordenar Grid

  IBQ_ConsultaFilial: TIBQuery;
  TD : TTransactionDesc; // Ponteiro de Transação

  // Show Hint em Forma de Balão
  hTooltip: Cardinal; 
  ti: TToolInfo; 
  buffer : array[0..255] of char;
  ///////////////////////////////

implementation

uses DK_Procs1, UDMBelShop, UDMConexoes, UDMVirtual, UFrmBelShop,
  UFrmSelectEmpProcessamento, DB, UPesquisa, UFrmSolicitacoes;

{$R *.dfm}

//==============================================================================
// ODIR - INICIO ===============================================================
//==============================================================================

// Filtro Fornecedores pelos Compradores Selecionados >>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.FiltraComprador(sCompradores: String; iNumLinhas: Integer); // sCompradores: Delimitador = ';'
Var
  i: Integer;
  MySql: String;
Begin
  DMBelShop.CDS_FluxoFornecedor.Close;
  DMBelShop.CDS_FluxoFornecedor.Filtered:=False;
  DMBelShop.CDS_FluxoFornecedor.Filter:='';

  DMBelShop.CDS_FluxoFornecedores.Close;

  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr1').AsString:= EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr2').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr3').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr4').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr5').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr6').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr7').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr8').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr9').AsString :=EmptyStr;
  DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr10').AsString:=EmptyStr;

  If Trim(sCompradores)='' Then
  Begin
    // Busca Códigos de Compradores ==============================================
    MySql:=' SELECT DISTINCT COALESCE(FF.CODCENTROCUSTO, 0) FORN'+
           ' FROM FORNECEDOR FF';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr1').AsString:= '99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr2').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr3').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr4').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr5').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr6').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr7').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr8').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr9').AsString :='99999999';
    DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr10').AsString:='99999999';

    iNumLinhas:=0;
    While Not DMBelShop.CDS_BuscaRapida.Eof do
    Begin
      Inc(iNumLinhas);

      sCompradores:=sCompradores+';'+DMBelShop.CDS_BuscaRapida.FieldByName('Forn').AsString;

      DMBelShop.CDS_BuscaRapida.Next;
    End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
    DMBelShop.CDS_BuscaRapida.Close;

    If Trim(sCompradores)<>'' Then
     sCompradores:=sCompradores+';';

  End; // If Trim(sCompradores)='' Then

  For i:=1 to iNumLinhas do
  Begin
    If i=1 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr1').AsString:=Separa_String(sCompradores,i+1);

    If i=2 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr2').AsString:=Separa_String(sCompradores,i+1);

    If i=3 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr3').AsString:=Separa_String(sCompradores,i+1);

    If i=4 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr4').AsString:=Separa_String(sCompradores,i+1);

    If i=5 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr5').AsString:=Separa_String(sCompradores,i+1);

    If i=6 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr6').AsString:=Separa_String(sCompradores,i+1);

    If i=7 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr7').AsString:=Separa_String(sCompradores,i+1);

    If i=8 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr8').AsString:=Separa_String(sCompradores,i+1);

    If i=9 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr9').AsString:=Separa_String(sCompradores,i+1);

    If i=10 Then
     DMBelShop.SDS_FluxoFornecedores.Params.ParamByName('Compr10').AsString:=Separa_String(sCompradores,i+1);
  End; // For i:=0 to iNumLinhas do
  DMBelShop.CDS_FluxoFornecedores.Open;

End; // Filtro Fornecedores pelos Compradores Selecionados >>>>>>>>>>>>>>>>>>>>>

// Manutenção DML de Historicos de Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmFluxoFornecedor.DML_Historicos(sTipo, sCodHist: String; sDebCre: String=''; sDesHist: String=''): Boolean;
Var
  MySql: String;
Begin
// sTipo: (I)nserir
//        (E)xclur

  sgMensagemERRO:='';
  Result:=False;

  If sTipo='E' Then
  Begin
    // Verifica se Pode Excluir -----------------------------------
    MySql:=' SELECT FIRST 1 h.cod_historico'+
           ' FROM FL_CAIXA_FORNECEDORES h'+
           ' WHERE h.cod_historico='+sCodHist;
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    MySql:=Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Historico').AsString);
    DMBelShop.CDS_BuscaRapida.Close;

    If Trim(MySql)<>'' Then
    Begin
      sgMensagemERRO:='Impossivel Excluir o Comprovante '+MySql+cr+cr+'Contém Movimento(s) !!'+cr+cr+'ENTRAR EM CONTATO COM O ODIR !!';
      Exit;
    End; // If Trim(MySql)<>'' Then
  End; // If sTipo='E' Then

  OdirPanApres.Caption:='AGUARDE !! Excutanto DML Comprovante...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmFluxoFornecedor;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  Screen.Cursor:=crAppStart;
  DateSeparator:='.';
  DecimalSeparator:='.';

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    // Insere Comprovante -------------------------------------------
    If sTipo='I' Then
    Begin
      MySql:=' INSERT INTO FL_CAIXA_HISTORICOS'+
             ' (COD_HISTORICO, DES_HISTORICO, IND_DEBCRE)'+

             ' VALUES ('+
             QuotedStr(sCodHist)+', '+ // COD_HISTORICO
             QuotedStr(sDesHist)+', '+ // DES_HISTORICO
             QuotedStr(sDebCre)+')'; // IND_DEBCRE
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='I' Then

    // Exclui Comprovante -------------------------------------------
    If sTipo='E' Then
    Begin
      MySql:=' DELETE FROM FL_CAIXA_HISTORICOS h'+
             ' WHERE h.cod_historico='+sCodHist;
      DMBelShop.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='E' Then

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    If DMBelShop.CDS_FluxoFornHistorico.Active Then
     DMBelShop.CDS_FluxoFornHistorico.Close;
    DMBelShop.CDS_FluxoFornHistorico.Open;

    If sTipo='I' Then
     DMBelShop.CDS_FluxoFornHistorico.Locate('COD_HISTORICO',sCodHist,[]);

    Result:=True;
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      sgMensagemERRO:='Mensagem de erro do sistema:'+#13+e.message;
    End; // on e : Exception do
  End; // Try

  OdirPanApres.Visible:=False;
  DateSeparator:='/';
  DecimalSeparator:=',';
End; // Manutenção DML de Historicos de Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmFluxoFornecedor.CreateToolTips(hWnd: Cardinal);
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
Procedure TFrmFluxoFornecedor.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>

// Atualiza Descrição dos Comprovantes de Conta Corrente >>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.AtualizaDescComprvCCorrente;
Var
  MySql: String;
Begin
  MySql:=' select H.COD_HISTORICO'+
         ' from FL_CAIXA_HISTORICOS H'+
         ' where H.COD_HISTORICO <> 0 and'+
         '       H.COD_HISTORICO <> 999999';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;
  sgCodigo:='';
  While not DMBelShop.CDS_Busca.Eof do
  Begin
    If sgCodigo='' Then
     sgCodigo:=QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString)
    Else
     sgCodigo:=sgCodigo+', '+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString);

    DMBelShop.CDS_Busca.Next;
  End;
  DMBelShop.CDS_Busca.Close;

  If sgCodigo<>'' Then
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

      MySql:=' select C.CODCOMPROVANTE, C.NOMECOMPROVANTE'+
             ' from COMPRV C'+
             ' where C.CODCOMPROVANTE in ('+sgCodigo+')';
      FrmBelShop.IBQ_MPMS.Close;
      FrmBelShop.IBQ_MPMS.SQL.Clear;
      FrmBelShop.IBQ_MPMS.SQL.Add(MySql);
      FrmBelShop.IBQ_MPMS.Open;

      While Not FrmBelShop.IBQ_MPMS.Eof do
      Begin
        MySql:=' update FL_CAIXA_HISTORICOS H'+
               ' set H.DES_HISTORICO='+QuotedStr(FrmBelShop.IBQ_MPMS.FieldByName('NOMECOMPROVANTE').AsString)+
               ' where H.COD_HISTORICO='+FrmBelShop.IBQ_MPMS.FieldByName('CODCOMPROVANTE').AsString;
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        FrmBelShop.IBQ_MPMS.Next;
      End; // While Not FrmBelShop.IBQ_MPMS.Eof do
      FrmBelShop.IBQ_MPMS.Close;

      // Atualiza Transacao ======================================================
      DMBelShop.SQLC.Commit(TD);
    Except
      on e : Exception do
      Begin
        // Abandona Transacao ====================================================
        DMBelShop.SQLC.Rollback(TD);
        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try
    Screen.Cursor:=crDefault;
    DateSeparator:='/';
    DecimalSeparator:=',';
  End; // If sgCodigo<>'' Then

  sgCodigo:='';

End; // Atualiza Descrição dos Comprovantes de Conta Corrente >>>>>>>>>>>>>>>>>>

// Calcula Fluxo de Caixo de Fornecedor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.CalculaFluxoCaixaFornecedores(sDt: String=''; sCodForn: String ='');
Var
  MySql:String;
  cVlrSaldo: Currency;
  iUltmio: Integer;
  sCodigo: String;
Begin
  DMBelShop.CDS_FluxoFornecedor.Close;

  OdirPanApres.Caption:='AGUARDE !! Atualizando Saldos Conta Corrente do Fornecedor: '+sCodForn;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2));
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.BringToFront();
  OdirPanApres.Parent:=FrmFluxoFornecedor;
  OdirPanApres.Visible:=True;

  Application.ProcessMessages;

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);

  Try
    Screen.Cursor:=crAppStart;

    DateSeparator:='.';
    DecimalSeparator:='.';

    // Busca Fornecedores ========================================================
    MySql:=' SELECT distinct c.COD_FORNECEDOR, c.DTA_CAIXA'+
           ' FROM FL_CAIXA_FORNECEDORES c';

           If Trim(sDt)<>'' Then
            MySql:=
             MySql+' WHERE c.DTA_CAIXA>='+QuotedStr(f_Troca('/','.',sDt));

           If (Trim(sCodForn)<>'') and (Trim(sDt)<>'') Then
            MySql:=MySql+' And c.COD_FORNECEDOR='+QuotedStr(sCodForn);

           If (Trim(sCodForn)<>'') and (Trim(sDt)='') Then
            MySql:=MySql+' WHERE c.COD_FORNECEDOR='+QuotedStr(sCodForn);

           MySql:=MySql+' ORDER BY c.COD_FORNECEDOR';
    DMBelShop.CDS_While.Close;
    DMBelShop.SDS_While.CommandText:=MySql;
    DMBelShop.CDS_While.Open;

    FrmBelShop.MontaProgressBar(True, FrmFluxoFornecedor);
    pgProgBar.Properties.Max:=DMBelShop.CDS_While.RecordCount;
    sCodigo:='0';

    While Not DMBelShop.CDS_While.Eof do
    Begin
      Application.ProcessMessages;

      pgProgBar.Position:=DMBelShop.CDS_While.RecNo;
      Refresh;

      If sCodigo<>DMBelShop.CDS_While.FieldByName('Cod_Fornecedor').AsString Then
       cVlrSaldo:=0;

      // Busca Fluxo de Caixa Fornecedores =========================================
      MySql:=' SELECT cx.COD_FORNECEDOR, cx.DES_FORNECEDOR, cx.DTA_CAIXA, cx.NUM_SEQ,'+
             ' cx.TIP_DEBCRE, cx.VLR_CAIXA, cx.VLR_SALDO'+
             ' FROM FL_CAIXA_FORNECEDORES cx'+
             ' WHERE cx.DTA_CAIXA='+QuotedStr(DMBelShop.CDS_While.FieldByName('Dta_Caixa').AsString)+
             ' And cx.COD_FORNECEDOR='+QuotedStr(DMBelShop.CDS_While.FieldByName('Cod_Fornecedor').AsString)+
             ' ORDER BY DTA_CAIXA, NUM_SEQ';
      DMBelShop.CDS_Pesquisa.Close;
      DMBelShop.SDS_Pesquisa.CommandText:=MySql;
      DMBelShop.CDS_Pesquisa.Open;

      DMBelShop.CDS_Pesquisa.Last;
      iUltmio:=DMBelShop.CDS_Pesquisa.RecNo;
      DMBelShop.CDS_Pesquisa.First;

      While Not DMBelShop.CDS_Pesquisa.Eof do
      Begin
        Refresh;

        // Verifica Registro de Saldo Inicial ==================================
        If DMBelShop.CDS_Pesquisa.RecNo=1 Then
        Begin
          If DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>0 Then
           Begin
             // Busca Saldo Final do Dia Anterior ---------------------
             MySql:='SELECT Max(c.DTA_CAIXA) DtAnterior, c.vlr_saldo'+

                    ' FROM FL_CAIXA_FORNECEDORES c'+

                    ' WHERE c.num_seq=999999'+
                    ' AND c.DTA_CAIXA<'+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                    ' And c.COD_FORNECEDOR='+QuotedStr(DMBelShop.CDS_While.FieldByName('COD_FORNECEDOR').AsString)+

                    ' GROUP BY c.vlr_saldo'+
                    ' ORDER BY DtAnterior desc';
             DMBelShop.CDS_Busca.Close;
             DMBelShop.SDS_Busca.CommandText:=MySql;
             DMBelShop.CDS_Busca.Open;

             MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES ('+
                    ' COD_FORNECEDOR, DES_FORNECEDOR, DTA_CAIXA, NUM_SEQ,'+
                    ' COD_HISTORICO, VLR_SALDO)'+
                    ' Values ('+
                    QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Cod_Fornecedor').AsString)+', '+
                    QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Des_Fornecedor').AsString)+', '+
                    QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+', '+
                    QuotedStr('0')+', '+
                    QuotedStr('0')+', ';

                   If Trim(DMBelShop.CDS_Busca.FieldByName('DtAnterior').AsString)='' Then
                    Begin
                      MySql:=MySql+QuotedStr('0')+')';
                      cVlrSaldo:=0;
                    End
                   Else // If Trim(DMBelShop.CDS_Busca.FieldByName('DtAnterior').AsString)='' Then
                    Begin
                      MySql:=MySql+QuotedStr(
                      DMBelShop.CDS_Busca.FieldByName('Vlr_Saldo').AsString)+')';
                      cVlrSaldo:=DMBelShop.CDS_Busca.FieldByName('Vlr_Saldo').AsCurrency;
                    End;
             DMBelShop.SQLC.Execute(MySql,nil,nil);

             DMBelShop.CDS_Busca.Close;
           End
          Else // If DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>0 Then
           Begin
             If DMBelShop.CDS_While.RecNo=1 Then
              Begin
                cVlrSaldo:=DMBelShop.CDS_Pesquisa.FieldByName('Vlr_Saldo').AsCurrency;
              End
             Else // If DMBelShop.CDS_While.RecNo=1 Then
              Begin
                // Atualiza Saldo Incial --------------------------------
                 MySql:=' UPDATE FL_CAIXA_FORNECEDORES'+
                        ' SET Vlr_Saldo='+QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)))+
                        ' WHERE DTA_CAIXA='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                        ' AND Num_Seq='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsString)+
                        ' AND COD_FORNECEDOR='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('COD_FORNECEDOR').AsString);
                 DMBelShop.SQLC.Execute(MySql,nil,nil);
              End; // If DMBelShop.CDS_While.RecNo=1 Then
           End; // If DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>0 Then
        End; // If DMBelShop.CDS_Pesquisa.RecNo=1 Then

        // Atualiza Movtos =====================================================
        If (DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>0) and
           (DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999) Then
        Begin
          // Atualiza Movto --------------------------------------
          MySql:='UPDATE FL_CAIXA_FORNECEDORES';

          If DMBelShop.CDS_Pesquisa.FieldByName('TIP_DEBCRE').AsString='C' Then
           cVlrSaldo:=cVlrSaldo+DMBelShop.CDS_Pesquisa.FieldByName('Vlr_Caixa').AsCurrency
          Else
           cVlrSaldo:=cVlrSaldo-DMBelShop.CDS_Pesquisa.FieldByName('Vlr_Caixa').AsCurrency;

          MySql:=MySql+' SET Vlr_Saldo='+QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)))+
                       ' WHERE DTA_CAIXA='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                       ' And NUM_SEQ='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsString)+
                       ' And COD_FORNECEDOR='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('COD_FORNECEDOR').AsString);
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End; // If (DMBelShop.CDS_Pesquisa.RecNo<>iUltmio) and (DMBelShop.CDS_Pesquisa.RecNo<>1)Then

        // Verifica Registro de Saldo Final ====================================
        If DMBelShop.CDS_Pesquisa.RecNo=iUltmio Then
        Begin
          If DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999 Then
           Begin
             // Insere Saldo Final ----------------------------------
             MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES ('+
                    ' COD_FORNECEDOR, DES_FORNECEDOR, DTA_CAIXA, NUM_SEQ,'+
                    ' COD_HISTORICO, VLR_SALDO)'+
                    ' VALUES ('+
                    QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Cod_Fornecedor').AsString)+', '+
                    QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Des_Fornecedor').AsString)+', '+
                    QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+', '+
                    QuotedStr('999999')+', '+
                    QuotedStr('999999')+', '+
                    QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)))+')';
             DMBelShop.SQLC.Execute(MySql,nil,nil);
           End
          Else // If DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999 Then
           Begin
             // Atualiza Movto --------------------------------------
             MySql:=' UPDATE FL_CAIXA_FORNECEDORES'+
                    ' SET Vlr_Saldo='+QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)))+
                    ' WHERE DTA_CAIXA='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                    ' AND Num_Seq='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsString)+
                    ' AND COD_FORNECEDOR='+QuotedStr(DMBelShop.CDS_Pesquisa.FieldByName('COD_FORNECEDOR').AsString);
             DMBelShop.SQLC.Execute(MySql,nil,nil);
           End; // If DMBelShop.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999 Then
        End; // If DMBelShop.CDS_Pesquisa.RecNo=iUltmio Then

        DMBelShop.CDS_Pesquisa.Next;
      End; // While Not DMBelShop.CDS_Pesquisa.Eof do

      sCodigo:=DMBelShop.CDS_While.FieldByName('Cod_Fornecedor').AsString;

      DMBelShop.CDS_While.Next;
    End; // While Not DMBelShop.CDS_While.Eof do
    FrmBelShop.MontaProgressBar(False, FrmFluxoFornecedor);

    OdirPanApres.Visible:=False;
    Refresh;

    DMBelShop.CDS_Pesquisa.Close;

    // Fecha Transacao =========================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

//    msg('Atualização de Saldos Efetuada'+cr+'com SUCESSO !!','A');
  Except
    on e : Exception do
    Begin
      FrmBelShop.MontaProgressBar(False, FrmFluxoFornecedor);

      DMBelShop.SQLC.Rollback(TD);

      OdirPanApres.Visible:=False;

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End;
  End;

End; // Calcula Fluxo de Caixo de Fornecedor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Movtos de Debito/Credito de Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmFluxoFornecedor.BuscaMovtosDebCre;
Var
   bSiga: Boolean;
   i: Integer;
   MySql: String;
   sCodForn: String;
Begin
  bSiga:=False;

  // Conecta Loja =======================================================
  If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
   Begin
     // Cria Query da Empresa ------------------------------------
     FrmBelShop.CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True, True);
     bSiga:=True;
   End
  Else
   Begin
     bSiga:=False;

     If sgLojasNConectadas='' Then
      sgLojasNConectadas:='Bel_'+sgCodEmp
     Else
      sgLojasNConectadas:=sgLojasNConectadas+', Bel_'+sgCodEmp;
   End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

  If bSiga Then
  Begin
    Screen.Cursor:=crAppStart;

    // Abre Query -----------------------------------------------
    i:=0;
    bSiga:=False;
    While Not bSiga do
    Begin
      Try
        IBQ_ConsultaFilial.Close;
        IBQ_ConsultaFilial.SQL.Clear;
        IBQ_ConsultaFilial.SQL.Add(MySqlSelect);
        IBQ_ConsultaFilial.ParamByName('CodLoja').AsString:=sgCodEmp;
        IBQ_ConsultaFilial.Open;

        bSiga:=True;
      Except
        Inc(i);
      End; // Try

      If i>2 Then
      Begin
        If sgLojasNConectadas='' Then
         sgLojasNConectadas:='Bel_'+sgCodEmp
        Else If Not AnsiContainsStr(sgLojasNConectadas, 'Bel_'+sgCodEmp) then
         sgLojasNConectadas:=sgLojasNConectadas+', Bel_'+sgCodEmp;

        Break;
      End; // If i>10 Then
    End; // While Not bSiga do

    // Processamento ===========================================================
    If bSiga Then // Query Executada
    Begin
      FrmBelShop.MontaProgressBar(True, FrmFluxoFornecedor);

      IBQ_ConsultaFilial.Last;
      pgProgBar.Properties.Max:=IBQ_ConsultaFilial.RecordCount;
      pgProgBar.Position:=0;
      IBQ_ConsultaFilial.First;

      // Monta Transacao =======================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMBelShop.SQLC.StartTransaction(TD);
      Try
        Screen.Cursor:=crAppStart;
        DateSeparator:='.';
        DecimalSeparator:='.';

//        // Exclui Lançamentos para Substituição e Inclução de todos ============
//        If bgExcluiFF Then
//        Begin
//          sCodForn:='';
//          If (Trim(EdtFluFornCodFornAcertar.Text)<>'Cód a Acertar') and (Trim(EdtFluFornCodFornAcertar.Text)<>'') Then
//           sCodForn:=FormatFloat('000000',StrToInt(EdtFluFornCodFornAcertar.text));
//
//          MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES f'+
//                 ' WHERE f.cod_empresa='+QuotedStr(sgCodEmp);
//
//          If MaskEdit1.Text<>'  .  .20  ' Then
//           MySql:=
//            MySql+' AND f.dta_caixa>='+QuotedStr(MaskEdit1.Text);
//
//          If (Trim(sCodForn)<>'') Then
//           MySql:=
//            MySql+' AND f.cod_fornecedor='+QuotedStr(sCodForn);
//           DMBelShop.SQLC.Execute(MySql,nil,nil);
//        End;
        // Exclui Lançamentos para Substituição e Inclução de todos ============
        sCodForn:='';
        If (Trim(EdtFluFornCodFornAcertar.Text)<>'Cód a Acertar') and (Trim(EdtFluFornCodFornAcertar.Text)<>'') Then
         sCodForn:=FormatFloat('000000',StrToInt(EdtFluFornCodFornAcertar.text));

        MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES f'+
               ' WHERE f.cod_empresa='+QuotedStr(sgCodEmp);

        If MaskEdit1.Text<>'  .  .20  ' Then
         MySql:=
          MySql+' AND f.dta_caixa>='+QuotedStr(MaskEdit1.Text);

        If (Trim(sCodForn)<>'') Then
         MySql:=
          MySql+' AND f.cod_fornecedor='+QuotedStr(sCodForn);
         DMBelShop.SQLC.Execute(MySql,nil,nil);

        While Not IBQ_ConsultaFilial.Eof do
        Begin
          Application.ProcessMessages;

          sCodForn:=IBQ_ConsultaFilial.FieldByName('codfornecedor').AsString;
          sgDtaInicio:=IBQ_ConsultaFilial.FieldByName('dataentrada').AsString;

          // Busca Num_seq do Dia do Fornecedor ---------------------
          MySql:=' select coalesce(max(cf.num_seq)+1 ,1) Num_Seq'+
                 ' from FL_CAIXA_FORNECEDORES cf'+
                 ' where cf.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaInicio)))+
                 ' and cf.cod_fornecedor='+QuotedStr(sCodForn)+
                 ' and cf.num_seq>0'+
                 ' and cf.num_seq<999999';
          DMBelShop.CDS_Busca.Close;
          DMBelShop.SDS_Busca.CommandText:=MySql;
          DMBelShop.CDS_Busca.Open;

          sgNumSeq:=Trim(DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString);
          DMBelShop.CDS_Busca.Close;

          // Insere Caixa -----------------------------------------------
          MySql:=' INSERT INTO FL_CAIXA_fORNECEDORES ('+
                 ' COD_FORNECEDOR, DES_FORNECEDOR, DTA_CAIXA, NUM_SEQ,'+
                 ' NUM_CHAVENF, COD_EMPRESA, COD_HISTORICO, TXT_OBS,'+
                 ' NUM_DOCUMENTO, NUM_SERIE, TIP_DEBCRE, VLR_CAIXA, VLR_SALDO)'+

                 ' VALUES ('+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODFORNECEDOR').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('NOMEFORNECEDOR').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('DATAENTRADA').AsString)+', '+
                 sgNumSeq+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CHAVENF').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODFILIAL').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODCOMPROVANTE').AsString)+', '+
                 QuotedStr(AnsiUpperCase(IBQ_ConsultaFilial.FieldByName('OBSERVACAO').AsString))+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('NUMERO').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('SERIE').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('TP_DEBCRE').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('VLR_TOTAL').AsString)+', '+
                 ' 0)';
          DMBelShop.SQLC.Execute(MySql, nil, nil);

          pgProgBar.Position:=IBQ_ConsultaFilial.RecNo;

          // Guarda Codigo do Fornecedor ----------------------------
          bgProcessar:=True;
          For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do
          Begin
             If FrmBelShop.Mem_Odir.Lines[i]=sCodForn Then
             Begin
               bgProcessar:=False;
               Break;
             End;
          End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do

          If bgProcessar Then
           FrmBelShop.Mem_Odir.Lines.Add(sCodForn);

          IBQ_ConsultaFilial.Next;
        End; // While Not IBQ_ConsultaFilial.Eof do
        IBQ_ConsultaFilial.Close;
        FrmBelShop.MontaProgressBar(False, FrmFluxoFornecedor);

        // Fecha Transacao =================================================
        DMBelShop.SQLC.Commit(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

      Except
        on e : Exception do
        Begin

          FrmBelShop.MontaProgressBar(False, FrmFluxoFornecedor);

          DMBelShop.SQLC.Rollback(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';
          Screen.Cursor:=crDefault;

          MessageBox(Handle, pChar(sgCodEmp+#13+e.message), 'Erro', MB_ICONERROR);
        End; // on e : Exception do
      End; // Try
    End; // If bSiga Then
  End; // If bSiga Then
  sgDtaInicio:='';

  // Fecha Conexão =========================================================
  ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

end; // Busca Movtos de Debito/Credito de Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>

//==============================================================================
// ODIR - FIM ==================================================================
//==============================================================================

procedure TFrmFluxoFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairFF Then
   Begin
     Action :=caHide;// caFree;
   End
  Else
   Begin
     msg('Para Fechar Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmFluxoFornecedor.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Acertar Erro na Rolagem do Mouse ==========================================
  Application.OnMessage := ApplicationEvents1Message;

  // Atualiza Descrição dos Comprovantes de Conta Corrente =====================
  If FrmBelShop.ConectaMPMS Then
  Begin
    AtualizaDescComprvCCorrente;
  End;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Balão
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FluFornComprovante.Handle, @ti, TipoDoIcone, 'Selecione o Comprovante'+#13+'a Incluir', 'INCLUIR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_FluFornBuscaFornecedor.Handle, @ti, TipoDoIcone, 'Selecionar o'+#13+'Fornecedor', 'SELECIONAR !!');

end;

procedure TFrmFluxoFornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin

  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;


end;

procedure TFrmFluxoFornecedor.FormShow(Sender: TObject);
Var
  MySql: String;
begin
  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmFluxoFornecedor);

  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairFF:=False;

  Bt_FluFornAtualizar.Visible:=False;
  Bt_FluFornAcertaSaldos.Visible:=False;
  EdtFluFornCodFornAcertar.Visible:=False;
  MaskEdit1.Visible:=False;
  If AnsiUpperCase(Des_Login)='ODIR' Then
  Begin
    MaskEdit1.Visible:=True;
    EdtFluFornCodFornAcertar.Visible:=True;
    Bt_FluFornAcertaSaldos.Visible:=True;
    Bt_FluFornAtualizar.Visible:=True;
  End; // If AnsiUpperCase(Des_Login)='ODIR' Then

  PC_Principal.TabIndex:=0;
  PC_PrincipalChange(Self);

  If DMBelShop.CDS_FluxoFornHistorico.Active Then
   DMBelShop.CDS_FluxoFornHistorico.Close;
  DMBelShop.CDS_FluxoFornHistorico.Open;

  If DMBelShop.CDS_FluxoFornecedores.Active Then
   DMBelShop.CDS_FluxoFornecedores.Close;

  FiltraComprador('',0);

  Dbg_FluFornFornec.SetFocus;
end;

procedure TFrmFluxoFornecedor.PC_PrincipalChange(Sender: TObject);
begin
  If (PC_Principal.ActivePage=Ts_FluxFornApres) And (Ts_FluxFornApres.CanFocus) Then
  Begin
    DMBelShop.CDS_FluxoFornecedor.Filtered:=False;
    DMBelShop.CDS_FluxoFornecedor.Filter:='';

    Bt_FluFornSalvaExcel.Visible:=False;
    Bt_FluFornFiltroComprador.Caption:='Seleciona Comprador';

    Bt_FluFornFechar.Caption:='Fechar';
    Bt_FluFornFechar.Tag:=99;
    Bt_FluFornFechar.Glyph:=Nil;

    Dbg_FluFornFornec.SetFocus;
  End;

  If (PC_Principal.ActivePage=Ts_FluxFornCaixa) And (Ts_FluxFornCaixa.CanFocus) Then
  Begin
    Bt_FluFornSalvaExcel.Visible:=True;
    Bt_FluFornFiltroComprador.Caption:='Seleciona Comprovante';


    Bt_FluFornFechar.Caption:='Voltar';
    Bt_FluFornFechar.Tag:=90;
    Bt_FluFornFechar.Glyph:=Nil;

    Dbg_FluFornCaixa.SetFocus;
  End;

  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmFluxoFornecedor);

end;

procedure TFrmFluxoFornecedor.Bt_FluFornAtualizarClick(Sender: TObject);
Var
  MySql: String;
  i: Integer;
  sCompDeb, sCompCre, sCodForn: String;
begin
  PC_Principal.TabIndex:=0;
  Dbg_FluFornFornec.SetFocus;

  If msg('ATENÇÃO !!'+cr+cr+'Deseja Realmente Atualizar  ??','C')=2 Then
  Begin
    MaskEdit1.SetFocus;
    Exit;
  End;

  sCodForn:='';
  If (Trim(EdtFluFornCodFornAcertar.Text)<>'Cód a Acertar') and (Trim(EdtFluFornCodFornAcertar.Text)<>'') Then
   sCodForn:=FormatFloat('000000',StrToInt(EdtFluFornCodFornAcertar.text));

  // Busca Comprovantes ========================================================
  MySql:=' SELECT LPAD(h.cod_historico, 3, ''0'') cod_comprv, h.ind_debcre'+
         ' FROM FL_CAIXA_HISTORICOS h'+
         ' WHERE h.cod_historico <> 0'+
         ' AND   h.cod_historico <> 999999';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  sCompCre:='';
  sCompDeb:='';
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    If DMBelShop.CDS_BuscaRapida.FieldByName('ind_debcre').AsString='D' Then
    Begin
      If Trim(sCompDeb)='' Then
       sCompDeb:=QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('cod_comprv').AsString)
      Else
       sCompDeb:=sCompDeb+', '+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('cod_comprv').AsString);
    End;

    If DMBelShop.CDS_BuscaRapida.FieldByName('ind_debcre').AsString='C' Then
    Begin
      If Trim(sCompCre)='' Then
       sCompCre:=QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('cod_comprv').AsString)
      Else
       sCompCre:=sCompCre+', '+QuotedStr(DMBelShop.CDS_BuscaRapida.FieldByName('cod_comprv').AsString);
    End;

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.Close;

  // Fecha FrmSelectEmpProcessamento no Create - sgCodLojaUnica = 9999
  // Somente Efetua o Select e Não Faz Nada
  sgCodLojaUnica:='';
  sgOutrasEmpresa:='(50,99)';
  sgEmpresaNao:='';
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False;
  FrmSelectEmpProcessamento.iNrEmpProc:=0;
  FrmSelectEmpProcessamento.ShowModal;

  i:=FrmSelectEmpProcessamento.iNrEmpProc;
  FreeAndNil(FrmSelectEmpProcessamento);

  If i=0 Then
   Exit;

  DMBelShop.CDS_FluxoFornecedores.Close;

  sgLojasNConectadas:='';

  // Monta Select de Busca de Debitos e Créditos ===============================
  MySqlSelect:=' SELECT mf.codfornecedor, f.nomefornecedor,'+
               ' mf.dataentrada, mf.codcomprovante,'+
               ' CASE'+
               '   WHEN mf.codcomprovante IN ('+sCompCre+') Then'+
               '    ''C'''+
               '   WHEN mf.codcomprovante IN ('+sCompDeb+') Then'+
               '    ''D'''+
               ' End Tp_DebCre,'+
               ' mf.codfilial, mf.observacao, mf.chavenf, mf.numero, mf.serie,'+
               ' ABS(COALESCE(mf.totnota,0.00)) Vlr_Total'+

               ' FROM MFOR mf, FORNECED f'+
               ' WHERE  mf.codfornecedor=f.codfornecedor'+
               ' AND    mf.codfilial=:CodLoja'+
               ' AND    mf.codcomprovante in ('+sCompCre+', '+sCompDeb+')';

               If MaskEdit1.Text<>'  .  .20  ' Then
                MySqlSelect:=
                 MySqlSelect+' AND mf.dataentrada>='+QuotedStr(MaskEdit1.Text);

               If (Trim(sCodForn)<>'') Then
                MySqlSelect:=
                 MySqlSelect+' AND mf.codfornecedor='+QuotedStr(sCodForn);

               MySqlSelect:=
                MySqlSelect+' ORDER BY mf.codfornecedor, mf.dataentrada';
  FrmBelShop.Mem_Odir.Lines.Clear;

  bgExcluiFF:=True;
  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    if DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
    Begin
      sgCodEmp:=DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString;
      sgDesLoja:=DMBelShop.CDS_EmpProcessaRAZAO_SOCIAL.AsString;

      // Apresentacao ==========================================================
      OdirPanApres.Caption:='AGUARDE !! Processando Empresa: '+sgCodEmp+' - '+sgDesLoja;
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2));
      OdirPanApres.Font.Style:=[fsBold];
      OdirPanApres.BringToFront();
      OdirPanApres.Parent:=FrmFluxoFornecedor;
      OdirPanApres.Visible:=True;
      Application.ProcessMessages;

      BuscaMovtosDebCre;
    End; // if DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do
  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  // Calcula Fluxo de Caixa do Fornecedore =====================================
  For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do
  Begin
    If MaskEdit1.Text<>'  .  .20  ' Then
     CalculaFluxoCaixaFornecedores(MaskEdit1.Text,FrmBelShop.Mem_Odir.Lines[i])
    Else
     CalculaFluxoCaixaFornecedores('',FrmBelShop.Mem_Odir.Lines[i]);
  End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do

  If sgLojasNConectadas<>'' Then
   msg('Lojas Não Conectadas: '+cr+cr+sgLojasNConectadas,'A');

  msg('Processamento Efetuado com SUCESSO !!','A');

  DMBelShop.CDS_FluxoFornecedores.Open;
  EdtFluFornCodFornecedorExit(Self);

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornecKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If DMBelShop.CDS_FluxoFornHistorico.IsEmpty Then
   Exit;

  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if (Shift=[ssCtrl]) and (Key=46) then
    Key:=0;

  // Exclui Comprovante ========================================================
  if (Key=VK_Delete) Then
  Begin
    If Not DML_Historicos('E',DMBelShop.CDS_FluxoFornHistoricoCOD_HISTORICO.AsString) Then
     MessageBox(Handle, pChar(sgMensagemERRO), 'Erro', MB_ICONERROR);
  End; // if (Key=VK_Delete) Then

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornecKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  sForn, sValor: String;
  b: Boolean;
  MySql: String;
begin
  If (DMBelShop.CDS_FluxoFornecedores.IsEmpty) Or (DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger<3) Then
   Exit;

  sForn:= DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsString;

  // Altera Data do Conta Corrente (Processamento) =============================
  If Key=Vk_F2 Then
  Begin
    //function InputBoxData(ACaption, APrompt: string; sData: string=''; bErro: Boolean=True): string; ForWard;
                                                                     // bErro=False - Passa Data = 99/99/9999
    b:=True;
    While b do
    Begin
      // Solicita Data do Conta Corrente ----------------------------
      sgDtaInicio:=DMBelShop.CDS_FluxoFornecedoresDTA_CC.AsString;
      sgDtaInicio:=InputBoxData('Data Conta Corrente', 'Alteração (99/99/9999 = Retira Data)', sgDtaInicio, False);

      If Trim(sgDtaInicio)='' Then
      Begin
        Exit;
      End;

      // Analisa Data Informada -------------------------------------
      If f_Troca('/','.',f_Troca('-','.',sgDtaInicio))<>'99.99.9999' Then
      Begin
        Try
          StrToDate(sgDtaInicio);
        Except
          msg('Data Inválida !!','A');
          Exit;
        End;

        If StrToDate(sgDtaInicio)>StrToDate(DMBelShop.CDS_FluxoFornecedoresDTA_FINAL.AsString) Then
        Begin
          msg('Data Não Pode Ser Superior'+cr+cr+'a Data Final do CC !!','A');
          sgDtaInicio:='';
          Exit;
        End;
      End; // If f_Troca('/','.',f_Troca('-','.',sgDtaInicio))<>'99.99.9999' Then
      sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',sgDtaInicio));

      // Salva Nova Data de Conta Corrente --------------------------
      OdirPanApres.Caption:='AGUARDE !! Alterado Data CC';
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmFluxoFornecedor.Height-OdirPanApres.Height)/2))-20;
      OdirPanApres.Font.Style:=[fsBold];
      OdirPanApres.Parent:=FrmFluxoFornecedor;
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
      Try
        Screen.Cursor:=crAppStart;
        DateSeparator:='.';
        DecimalSeparator:='.';

        If Trim(sgDtaInicio)<>'99.99.9999' Then
         Begin
           MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
                  ' values (14,'+ // TIP_AUX
                  DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsString+', '+ // COD_AUX
                  QuotedStr(sgDtaInicio)+', '+ // DES_AUX
                  ' NULL, NULL, NULL)'+ // DES_AUX1, VLR_AUX, VLR_AUX1
                  ' matching (TIP_AUX, COD_AUX)';
         End
        Else
         Begin
           MySql:=' DELETE FROM TAB_AUXILIAR'+
                  ' WHERE TIP_AUX=14'+
                  ' AND   COD_AUX='+DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsString;
         End; // If Trim(sgDtaInicio)<>'99.99.9999' Then
        DMBelShop.SQLC.Execute(MySql,nil,nil);
        sgDtaInicio:='';

        // Atualiza Transacao ======================================================
        DMBelShop.SQLC.Commit(TD);

        DMBelShop.CDS_FluxoFornecedores.DisableControls;
        DMBelShop.CDS_FluxoFornecedores.Close;
        DMBelShop.CDS_FluxoFornecedores.Open;
        DMBelShop.CDS_FluxoFornecedores.EnableControls;

        DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR',sForn,[]);
      Except
        on e : Exception do
        Begin
          // Abandona Transacao ====================================================
          DMBelShop.SQLC.Rollback(TD);

          MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        End; // on e : Exception do
      End; // Try
      DateSeparator:='/';
      DecimalSeparator:=',';
      OdirPanApres.Visible:=False;
      Screen.Cursor:=crDefault;

      DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR',sForn,[]);
      b:=False;
    End; // While b do
  End; // If Key=Vk_F2 Then

  // Localizar Produto =========================================================
  If Key=Vk_F4 Then
  Begin
    If Not DMBelShop.CDS_FluxoFornecedores.IsEmpty Then
    Begin
      sValor:='';
      b:=True;
      While b do
      Begin
        If InputQuery('Localizar Fornecedor','',sValor) then
         Begin
           Try
             StrToInt(sValor);
             sValor:=FormatFloat('000000',StrToInt(sValor));

             If Not DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR', sValor,[]) Then
             Begin
              If Not LocalizaRegistro(DMBelShop.CDS_FluxoFornecedores, 'COD_FORNECEDOR', sValor) Then
               b:=False;
             End; // If Not DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR', sValor,[]) Then
             Break;
           Except
             If Not DMBelShop.CDS_FluxoFornecedores.Locate('NOMEFORNECEDOR', sValor,[]) Then
             Begin
               If Not LocalizaRegistro(DMBelShop.CDS_FluxoFornecedores, 'NOMEFORNECEDOR', sValor) Then
                b:=False;
             End; // If Not DMBelShop.CDS_FluxoFornecedores.Locate('NOMEFORNECEDOR', sValor,[]) Then
             Break;
           End;
         End
        Else // If InputQuery('Localizar Fornecedor','',sValor) then
         Begin
           Break;
         End; // If InputQuery('Localizar Fornecedor','',sValor) then
      End; // While b do

      If Not b Then
      Begin
        DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR',sForn,[]);
        msg('Fornecedor Não Localizado !!','A');
      End;
    End; // If Not DMBelShop.CDS_FluxoFornecedores.IsEmpty Then
  End; // If Key=Vk_F4 Then

  Dbg_FluFornFornec.SetFocus;
end;

procedure TFrmFluxoFornecedor.Bt_FluFornAcertaSaldosClick(Sender: TObject);
Var
  i: Integer;
begin
  DMBelShop.CDS_FluxoFornecedores.Close;

  PC_Principal.ActivePage:=Ts_FluxFornApres;
  PC_PrincipalChange(Self);
  Dbg_FluFornFornec.SetFocus;
  If (Trim(EdtFluFornCodFornAcertar.Text)<>'Cód a Acertar') and (Trim(EdtFluFornCodFornAcertar.Text)<>'') Then
  Begin
    CalculaFluxoCaixaFornecedores('',EdtFluFornCodFornAcertar.Text);
    Exit;
  End;

  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=' SELECT DISTINCT f.cod_fornecedor FROM fl_caixa_fornecedores f ORDER BY 1';
  DMBelShop.CDS_Busca.Open;
  FrmBelShop.Mem_Odir.Lines.Clear;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    FrmBelShop.Mem_Odir.Lines.Add(DMBelShop.CDS_Busca.FieldByName('cod_fornecedor').AsString);

    DMBelShop.CDS_Busca.Next;
  End;

  // Calcula Fluxo de Caixa do Fornecedore =====================================
  For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do
  Begin
    CalculaFluxoCaixaFornecedores('',FrmBelShop.Mem_Odir.Lines[i]);
  End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do

  DMBelShop.CDS_Busca.Close;
  DMBelShop.CDS_FluxoFornecedores.Close;

  msg('Processamento Efetuado com SUCESSO !!','A');
end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornecDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If DMBelShop.CDS_FluxoFornecedores.IsEmpty Then
   Exit;

  // Apresentacao dos Saldos em Débito ------------------------------
  If (Column.FieldName='VLR_SALDO') Then
  Begin
    If DMBelShop.CDS_FluxoFornecedoresVLR_SALDO.AsCurrency<0 then
    Begin
      Dbg_FluFornFornec.Canvas.Font.Style:=[fsBold];
      Dbg_FluFornFornec.Canvas.Font.Color:=clRed;
    End;
  End;

  If (Column.FieldName='LIMITE') Then
  Begin
    If DMBelShop.CDS_FluxoFornecedoresLIMITE.AsString='SIM' then
    Begin
      Dbg_FluFornFornec.Canvas.Font.Style:=[fsBold];
      Dbg_FluFornFornec.Canvas.Font.Color:=clRed;
    End;
  End;
  
  // Apresentacao dos Totais ----------------------------------------
  if not (gdSelected in State) Then
  Begin
    // Total de Créditos
    If DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger=0 Then
    Begin
      Dbg_FluFornFornec.Canvas.Brush.Color:=$00AAFFAA; //clSkyBlue;
    End;

    // Total de Débitos
    If DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger=1 Then
    Begin
      Dbg_FluFornFornec.Canvas.Brush.Color:=$00B9B9FF; //clSkyBlue;
    End;

    If DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger=2 Then
    Begin
      Dbg_FluFornFornec.Canvas.Brush.Color:=clSkyBlue;
    End;
  End; // if not (gdSelected in State) Then

  Dbg_FluFornFornec.Canvas.FillRect(Rect);
  Dbg_FluFornFornec.DefaultDrawDataCell(Rect,Column.Field,state);

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornecTitleClick(Column: TColumn);
begin
  If DMBelShop.CDS_FluxoFornecedores.IsEmpty Then
   Exit;

  With DMBelShop.CDS_FluxoFornecedores do
  Begin
    If IndexDefs.Count>0 Then
     IndexDefs.Delete(0);

   IndexFieldNames:='';
   IndexName:='';
   If (OrderGrid='') or (OrderGrid='Crescente') Then
    Begin
      AddIndex(Column.FieldName,'ORDEM;'+Column.FieldName,[],Column.FieldName); // ,'',0);
      IndexName:= Column.FieldName;
      IndexDefs.Update;

      OrderGrid:='Descendente';
    End
   Else
    Begin
      IndexFieldNames:='ORDEM;'+Column.FieldName;
      OrderGrid:='Crescente';
    End; // If (OrderGrid='') or (OrderGrid='Crescente') Then
  End; // With DMCentralTrocas.CDS_V_AnaliseReposicao do

  DMBelShop.CDS_FluxoFornecedores.RecNo:=3;

end;

procedure TFrmFluxoFornecedor.Bt_FluFornFecharClick(Sender: TObject);
begin
  If (Sender as TJvXPButton).Caption='Voltar' Then
  Begin
    PC_Principal.TabIndex:=0;
    PC_PrincipalChange(Self);
    Dbg_FluFornFornec.SetFocus;
    Exit;
  End;

  If (Sender as TJvXPButton).Caption='Fechar' Then
  Begin
    DMBelShop.CDS_FluxoFornecedor.Close;
    DMBelShop.CDS_FluxoFornHistorico.Close;
    bgSairFF:=True;
    Close;
    Exit;
  End;
end;

procedure TFrmFluxoFornecedor.EdtFluFornCodFornecedorChange(Sender: TObject);
begin
  DMBelShop.CDS_FluxoFornecedor.Close;

  EdtFluFornFornecedor.Clear;

end;

procedure TFrmFluxoFornecedor.EdtFluFornCodFornecedorExit(Sender: TObject);
Var
  MySql: String;
  cValor: Currency;
  sDtaLimite: String;
begin
  EdtFluFornFornecedor.Clear;
  DMBelShop.CDS_FluxoFornecedor.Close;

  If EdtFluFornCodFornecedor.AsInteger=0 Then
   Exit;

  PC_Principal.ActivePage:=Ts_FluxFornApres;
  PC_PrincipalChange(Self);

  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ========================================================
  MySql:=' SELECT DISTINCT'+
         ' CASE'+
         '   WHEN COALESCE(f.nomefornecedor,''0'')=''0'' Then'+
         '     c.des_fornecedor'+
         '   ELSE'+
         '     f.nomefornecedor'+
         ' End nomefornecedor,'+
         ' c.cod_fornecedor codfornecedor'+

         ' FROM FL_CAIXA_FORNECEDORES c'+
         '   LEFT JOIN FORNECEDOR f on c.cod_fornecedor=f.codfornecedor'+

         ' WHERE c.cod_fornecedor='+IntToStr(EdtFluFornCodFornecedor.AsInteger);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('codfornecedor').AsString)='' Then
  Begin
    msg('Fornecedor NÃO Encontrado !!!', 'A');
    Screen.Cursor:=crDefault;
    EdtFluFornCodFornecedor.Clear;
    EdtFluFornCodFornecedor.SetFocus;
    DMBelShop.CDS_BuscaRapida.Close;
    Exit;
  End;
  EdtFluFornFornecedor.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('NomeFornecedor').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  // Verifica se Fornecedor esta na Lista ======================================
  If not DMBelShop.CDS_FluxoFornecedores.Locate('COD_FORNECEDOR',FormatFloat('000000',EdtFluFornCodFornecedor.AsInteger),[]) Then
  Begin
    msg('Fornecedor NÃO Encontrado !!!', 'A');
    Screen.Cursor:=crDefault;
    EdtFluFornCodFornecedor.Clear;
    EdtFluFornCodFornecedor.SetFocus;
    Exit;
  End;

  // Busca Valor da Data Limite de Conta Corrente ==============================
  cValor:=0;
  sDtaLimite:='01.01.1900';
  If DMBelShop.CDS_FluxoFornecedoresLIMITE.AsString='SIM' Then
   sDtaLimite:=DMBelShop.CDS_FluxoFornecedoresDTA_CC.AsString;

  sDtaLimite:=f_Troca('/','.',f_Troca('-','.',sDtaLimite));

  If sDtaLimite<>'01.01.1900' Then
  Begin
    MySql:=' SELECT MIN(ff.dta_caixa) dta_caixa'+
           ' FROM FL_CAIXA_FORNECEDORES ff'+
           ' WHERE ff.cod_historico=0'+
           ' AND   ff.cod_fornecedor='+QuotedStr(FormatFloat('000000',EdtFluFornCodFornecedor.AsInteger))+
           ' AND   ff.dta_caixa>='+QuotedStr(sDtaLimite);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Not DMBelShop.CDS_BuscaRapida.IsEmpty Then
     sDtaLimite:=DMBelShop.CDS_BuscaRapida.FieldByName('Dta_Caixa').AsString;
    DMBelShop.CDS_BuscaRapida.Close;

    sDtaLimite:=f_Troca('/','.',f_Troca('-','.',sDtaLimite));

    // Busca Valor do Saldo Inicial ---------------------------------
    MySql:=' SELECT ff.vlr_saldo'+
           ' FROM fl_caixa_fornecedores ff'+
           ' WHERE ff.cod_historico = 0'+
           ' AND   ff.cod_fornecedor='+QuotedStr(FormatFloat('000000',EdtFluFornCodFornecedor.AsInteger))+
           ' AND   ff.dta_caixa='+QuotedStr(sDtaLimite);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Not DMBelShop.CDS_BuscaRapida.IsEmpty Then
     cValor:=DMBelShop.CDS_BuscaRapida.FieldByName('Vlr_Saldo').AsCurrency;
    DMBelShop.CDS_BuscaRapida.Close;
  End;

  // Busca Conta Corrente ======================================================
  DMBelShop.CDS_FluxoFornecedor.Close;
  DMBelShop.SDS_FluxoFornecedor.Params[0].AsCurrency:=cValor;
  DMBelShop.SDS_FluxoFornecedor.Params[1].AsCurrency:=cValor;
  DMBelShop.SDS_FluxoFornecedor.Params[2].AsString:=
                        FormatFloat('000000',EdtFluFornCodFornecedor.AsInteger);
  DMBelShop.SDS_FluxoFornecedor.Params[3].AsString:=sDtaLimite;
  DMBelShop.CDS_FluxoFornecedor.Open;

  If DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
  Begin
    Screen.Cursor:=crDefault;
    EdtFluFornFornecedor.Clear;
    EdtFluFornCodFornecedor.Clear;

    DMBelShop.CDS_FluxoFornecedor.Close;
    msg('Sem Movimento de Caixa a Listar','A');
    Exit;
  End;
  PC_Principal.ActivePage:=Ts_FluxFornCaixa;
  PC_PrincipalChange(Self);

  Dbg_FluFornCaixa.SetFocus;

  Screen.Cursor:=crDefault;
end;

procedure TFrmFluxoFornecedor.Dbg_FluFornCaixaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If not (gdSelected in State) Then
  Begin
    If DMBelShop.CDS_FluxoFornecedorNUM_SEQ.AsInteger=0 then
    Begin
      Dbg_FluFornCaixa.Canvas.Brush.Color:=clSkyBlue;
      Dbg_FluFornCaixa.Canvas.Font.Style:=[fsBold];
    End;

    If DMBelShop.CDS_FluxoFornecedorNUM_SEQ.AsInteger=999999 then
    Begin
      Dbg_FluFornCaixa.Canvas.Font.Style:=[fsBold];
    End;

    Dbg_FluFornCaixa.Canvas.FillRect(Rect);
    Dbg_FluFornCaixa.DefaultDrawDataCell(Rect,Column.Field,state);
  End;
end;

procedure TFrmFluxoFornecedor.ApplicationEvents1Message(var Msg: tagMSG;var Handled: Boolean);
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

procedure TFrmFluxoFornecedor.Dbg_FluFornCaixaEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_FluFornCaixaEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;
end;

procedure TFrmFluxoFornecedor.Dbg_FluFornCaixaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if ((Shift=[ssCtrl]) and (key=vk_delete)) THEN
   Abort;

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornecEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_FluFornFornecEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmFluxoFornecedor.Dbg_FluFornComprovEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_FluFornComprovEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmFluxoFornecedor.Bt_FluFornBuscaFornecedorClick(Sender: TObject);
Var
  MySql: String;
begin
  EdtFluFornCodFornecedor.Clear;
  EdtFluFornFornecedor.Clear;
  DMBelShop.CDS_FluxoFornecedor.Close;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT DISTINCT'+
         ' CASE'+
         '   WHEN COALESCE(f.nomefornecedor,''0'')=''0'' Then'+
         '     c.des_fornecedor'+
         '   ELSE'+
         '     f.nomefornecedor'+
         ' End nomefornecedor,'+
         ' c.cod_fornecedor codfornecedor'+
         ' FROM FL_CAIXA_FORNECEDORES c'+
         '   LEFT JOIN FORNECEDOR f on c.cod_fornecedor=f.codfornecedor'+
         ' order by 2';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('codfornecedor').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    EdtFluFornCodFornecedor.Clear;
    FreeAndNil(FrmPesquisa);
    EdtFluFornCodFornecedor.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='NomeFornecedor';
  FrmPesquisa.Campo_Codigo:='CodFornecedor';
  FrmPesquisa.Campo_Descricao:='NomeFornecedor';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    EdtFluFornCodFornecedor.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtFluFornCodFornecedorExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmFluxoFornecedor.Dbg_FluFornFornecDblClick(Sender: TObject);
begin
  If (DMBelShop.CDS_FluxoFornecedores.IsEmpty) Or (DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger<3) Then
   Exit;

  EdtFluFornCodFornecedor.Text:=DMBelShop.CDS_FluxoFornecedoresCOD_FORNECEDOR.AsString;
  EdtFluFornCodFornecedorExit(Self);
end;

procedure TFrmFluxoFornecedor.Bt_FluFornSalvaExcelClick(Sender: TObject);
begin
  If Not DMBelShop.CDS_FluxoFornecedor.IsEmpty Then
  Begin
    ExportDBGridExcel(True, Dbg_FluFornCaixa, FrmBelShop);
    Dbg_FluFornCaixa.SetFocus;
  End;
                                 
end;

procedure TFrmFluxoFornecedor.Dbg_FluFornComprovDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If DMBelShop.CDS_FluxoFornHistorico.IsEmpty Then
   Exit;

  If (Column.FieldName='DEB_CRE') Then
  Begin
    If DMBelShop.CDS_FluxoFornHistoricoDEB_CRE.AsString='Crédito' then
     Dbg_FluFornComprov.Canvas.Brush.Color:=$00BBFFDD
    Else
     Dbg_FluFornComprov.Canvas.Brush.Color:=$00D2D2FF;

    Dbg_FluFornComprov.Canvas.FillRect(Rect);
    Dbg_FluFornComprov.DefaultDrawDataCell(Rect,Column.Field,state);
  End;


end;

procedure TFrmFluxoFornecedor.PopM_FluFornSIMClick(Sender: TObject);
begin
  If (DMBelShop.CDS_FluxoFornecedores.IsEmpty) Or (DMBelShop.CDS_FluxoFornecedoresORDEM.AsInteger<3) Then
   Exit;

  If Trim(DMBelShop.CDS_FluxoFornecedoresDTA_CC.AsString)='' Then
  Begin
    ShowMessage('Sem Data Conta Corrente !!');
    Exit;
  End;

  DMBelShop.CDS_FluxoFornecedores.Edit;
  If Trim((Sender as TMenuItem).Name)='PopM_FluFornSIM' Then
   DMBelShop.CDS_FluxoFornecedoresLIMITE.AsString:='SIM';
  If Trim((Sender as TMenuItem).Name)='PopM_FluFornNAO' Then
   DMBelShop.CDS_FluxoFornecedoresLIMITE.AsString:='NAO';
  DMBelShop.CDS_FluxoFornecedores.Post;
end;

procedure TFrmFluxoFornecedor.Bt_FluFornComprovanteClick(Sender: TObject);
Var
  MySql: String;
  s, sDesHist: String;
begin
  EdtFluFornComprovante.Clear;
  Dbg_FluFornComprov.SetFocus;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT c.nomecomprovante Descricao, c.codcomprovante Codigo'+
         ' FROM COMPRV c'+
         ' WHERE c.codloja='+QuotedStr('99')+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Codigo').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    EdtFluFornComprovante.Clear;
    FreeAndNil(FrmPesquisa);
    Bt_FluFornComprovante.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Descricao';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Descricao';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.Dbg_Pesquisa.Columns[0].Width:=400;
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    sDesHist:=FrmPesquisa.EdtCodigo.Text+' - '+Trim(FrmPesquisa.EdtDescricao.Text);
    EdtFluFornComprovante.Text:=sDesHist;

    // Verifica se Já Existe ----------------------------------------
    If DMBelShop.CDS_FluxoFornHistorico.Locate('COD_HISTORICO',Trim(FrmPesquisa.EdtCodigo.Text),[]) Then
    Begin
      Begin
        msg('Comprovante Já Informado !!','A');
        EdtFluFornComprovante.Clear;
        FreeAndNil(FrmPesquisa);
        Bt_FluFornComprovante.SetFocus;
        Exit;
      End;
    End;

    s:='Débito';
    If Rb_FluFornCredito.Checked Then
     s:='Crédito';

    If msg('O Comprovante Selecionado'+cr+' Como '+s+cr+cr+'Esta Correto ?','C')=2 Then
    Begin
      EdtFluFornComprovante.Clear;
      Exit;
    End;

    If Not DML_Historicos('I',FrmPesquisa.EdtCodigo.Text, Copy(s,1,1), Trim(FrmPesquisa.EdtDescricao.Text)) Then
     MessageBox(Handle, pChar(sgMensagemERRO), 'Erro', MB_ICONERROR);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  OdirPanApres.Visible:=False;
  EdtFluFornComprovante.Clear;
  Screen.Cursor:=crDefault;
  FreeAndNil(FrmPesquisa);
end;

procedure TFrmFluxoFornecedor.Rb_FluFornDebitoClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_FluFornCredito);
  AcertaRb_Style(Rb_FluFornDebito);
end;

procedure TFrmFluxoFornecedor.Rb_FluFornDebitoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Rb_FluFornDebitoClick(Self);

end;

procedure TFrmFluxoFornecedor.Bt_FluFornFiltroCompradorClick(Sender: TObject);
Var
  s, MySql: String;
  ii, i: Integer;
  bFiltra: Boolean;
begin

  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(18);

  // Seleciona Comprador =======================================================
  If Bt_FluFornFiltroComprador.Caption='Seleciona Comprador' Then
  Begin
    // Apresenta Compradores ===================================================
    MySql:=' SELECT ''NAO'' PROC, CC.NOMESUBCUSTO comprador, COALESCE(CC.CODCENTROCUSTO,0) codigo'+
           ' FROM CENTROCUSTO CC'+
           ' WHERE  CC.NOMECUSTO=''COMPRAS'''+
           ' AND EXISTS(SELECT 1'+
           '            FROM FORNECEDOR FF'+
           '            WHERE FF.CODCENTROCUSTO=CC.CODCENTROCUSTO)'+
           ' UNION'+
           ' SELECT ''NAO'', ''SEM COMPRADOR'', 0'+
           ' FROM RDB$DATABASE'+
           ' ORDER BY 2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    FrmSolicitacoes.Caption:='SELECIONAR COMPRADOR';
  End; // If Bt_FluFornFiltroComprador.Caption='Seleciona Comprador' Then

  // Seleciona Comprovante =====================================================
  If Bt_FluFornFiltroComprador.Caption='Seleciona Comprovante' Then
  Begin
    // Apresenta Comprovantes ==================================================
    MySql:=' SELECT ''NAO'' PROC, H.COD_HISTORICO, H.DES_HISTORICO,'+
           ' CASE'+
           '   WHEN H.IND_DEBCRE=''D'' THEN'+
           '     ''DÉBITO'''+
           '   ELSE'+
           '     ''CRÉDITO'''+
           ' END DEB_CRE'+
           ' FROM FL_CAIXA_HISTORICOS H'+
           ' WHERE H.COD_HISTORICO<>0'+
           ' AND   H.COD_HISTORICO<>999999'+
           ' ORDER BY 2';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    FrmSolicitacoes.Caption:='SELECIONAR COMPROVANTE';
  End; // If Bt_FluFornFiltroComprador.Caption='Seleciona Comprovante' Then

  FrmSolicitacoes.bgOK:=False;
  FrmSolicitacoes.ShowModal;

  If DMBelShop.CDS_FluxoFornecedor.Filtered Then
  Begin
    DMBelShop.CDS_FluxoFornecedor.Filtered:=False;
    DMBelShop.CDS_FluxoFornecedor.Filter:='';
  End;
  
  If FrmSolicitacoes.bgOK Then
  Begin
    If Bt_FluFornFiltroComprador.Caption='Seleciona Comprador' Then
    Begin
      i:=0;
      DMBelShop.CDS_Busca.First;
      While Not DMBelShop.CDS_Busca.Eof do
      Begin
        If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then
        Begin
          Inc(i);
          s:=s+';'+DMBelShop.CDS_Busca.FieldByName('Codigo').AsString;
        End;

        DMBelShop.CDS_Busca.Next;
      End; // While Not DMBelShop.CDS_Busca.Eof do
      DMBelShop.CDS_Busca.Close;

      If Trim(s)<>'' Then
       s:=s+';';

      FiltraComprador(s,i);
    End; // If Bt_FluFornFiltroComprador.Caption='Seleciona Comprador' Then

    If Bt_FluFornFiltroComprador.Caption='Seleciona Comprovante' Then
    Begin
      i:=0;
      ii:=0;
      s:='';
      bFiltra:=True;
      DMBelShop.CDS_Busca.First;
      While Not DMBelShop.CDS_Busca.Eof do
      Begin
        If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then
         Begin
           Inc(i);

           If Trim(s)='' Then
            s:='COD_HISTORICO='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString)
           Else
            s:=s+' OR COD_HISTORICO='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Historico').AsString);
         End
        Else
         Begin
           inc(ii);
         End;

        DMBelShop.CDS_Busca.Next;
      End; // While Not DMBelShop.CDS_Busca.Eof do
      If (i=DMBelShop.CDS_Busca.RecordCount) Or (ii=DMBelShop.CDS_Busca.RecordCount)  Then
       bFiltra:=False;

      DMBelShop.CDS_Busca.Close;

      DMBelShop.CDS_FluxoFornecedor.Filtered:=False;
      DMBelShop.CDS_FluxoFornecedor.Filter:='';
      If bFiltra Then
      Begin
        DMBelShop.CDS_FluxoFornecedor.Filter:=s;
        DMBelShop.CDS_FluxoFornecedor.Filtered:=True;
      End;
    End; // If Bt_FluFornFiltroComprador.Caption='Seleciona Comprovante' Then
  End; // If FrmSolicitacoes.bgOK Then

  DMBelShop.CDS_Busca.Close;

  FreeAndNil(FrmSolicitacoes);

end;

end.
