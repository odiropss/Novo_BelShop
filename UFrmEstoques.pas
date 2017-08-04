unit UFrmEstoques;

// LojaBel_17

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, DBGridJul, jpeg, ExtCtrls, Grids, DBGrids,
  JvExControls, JvXPCore, JvXPButtons, StdCtrls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, JvExStdCtrls, JvRadioButton, Mask, ToolEdit,
  CurrEdit, ComCtrls, MMSystem, StrUtils, DB,
  IBQuery, JvCheckBox, FMTBcd, Provider, DBClient, SqlExpr, Math,
  DBXpress, Commctrl, dxSkinsdxStatusBarPainter, dxStatusBar, Menus,
  JvExComCtrls, JvAnimate, JvButton, JvTransparentButton, DBCtrls, cxDBEdit,
  DateUtils;

type
  TFrmEstoques = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    PC_EstoquesPrincipal: TPageControl;
    Ts_Estoques: TTabSheet;
    Pan_Estoques: TPanel;
    Gb_EstoquesLimiteCurvaA: TGroupBox;
    Label81: TLabel;
    EdtEstoquesLimiteCurvaA: TCurrencyEdit;
    Gb_EstoquesLimiteCurvaB: TGroupBox;
    Label82: TLabel;
    EdtEstoquesLimiteCurvaB: TCurrencyEdit;
    Gb_EstoquesLimiteCurvaC: TGroupBox;
    Label83: TLabel;
    EdtEstoquesLimiteCurvaC: TCurrencyEdit;
    Gb_EstoquesLimiteCurvaD: TGroupBox;
    Label187: TLabel;
    EdtEstoquesLimiteCurvaD: TCurrencyEdit;
    Gb_EstoquesLimiteCurvaE: TGroupBox;
    Label189: TLabel;
    EdtEstoquesLimiteCurvaE: TCurrencyEdit;
    Gb_EstoquesSituacaoProd: TGroupBox;
    Cbx_EstoquesSituacaoProd: TComboBox;
    Panel66: TPanel;
    Bt_EstoquesFechar: TJvXPButton;
    Dbg_Estoques: TDBGrid;
    Dbg_EstoquesDemFinan: TDBGrid;
    Ts_EstoquesFiltros: TTabSheet;
    Bt_Filtros: TPanel;
    Bt_FiltrosVoltar: TJvXPButton;
    Bt_FiltrosOK: TJvXPButton;
    Bt_EstoquesFiltros: TJvXPButton;
    Stb_Estoques: TdxStatusBar;
    OdirPanApres: TPanel;
    Pan_EstoquesProdNovo: TPanel;
    PopM_Estoques: TPopupMenu;
    PopM_InformarLojaTrabalhar: TMenuItem;
    N29: TMenuItem;
    PopM_EstoquesParametros: TMenuItem;
    N28: TMenuItem;
    PopM_EstoquesAlterarTodosEstMnimos: TMenuItem;
    N1: TMenuItem;
    PopM_EstoquesReplicarEstMinLojas: TMenuItem;
    Label1: TLabel;
    Bt_Odir: TJvTransparentButton;
    Bt_EstoquesDemonstrativo: TJvXPButton;
    Dbg_EstoquesPrev: TDBGrid;
    Bt_EstoquesFiltroComprador: TJvXPButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_EstoquesFecharClick(Sender: TObject);
    procedure PC_EstoquesPrincipalChange(Sender: TObject);

    // Odir ====================================================================
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balao
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente

    Procedure MontaFiltros(sTipo: String);
                        // sTipo=EST - Controle de Estoques

    Procedure HabilitaComponentes(bLib: Boolean);

    Procedure Recalculo_V_Estoques_Aggregates;
    // Odir ====================================================================

    procedure Dbg_EstoquesEnter(Sender: TObject);
    procedure Dbg_EstoquesExit(Sender: TObject);
    procedure Bt_EstoquesDemonstrativoClick(Sender: TObject);
    procedure Dbg_EstoquesKeyPress(Sender: TObject; var Key: Char);
    procedure Dbg_EstoquesDemFinanDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_EstoquesColEnter(Sender: TObject);
    procedure Bt_FiltrosOKClick(Sender: TObject);
    procedure Bt_FiltrosVoltarClick(Sender: TObject);
    procedure Bt_EstoquesFiltrosClick(Sender: TObject);
    procedure Dbg_EstoquesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_EstoquesTitleClick(Column: TColumn);
    procedure Dbg_EstoquesColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure Dbg_EstoquesDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure Dbg_EstoquesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_EstoquesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PopM_InformarLojaTrabalharClick(Sender: TObject);
    procedure PopM_EstoquesParametrosClick(Sender: TObject);
    procedure PopM_EstoquesAlterarTodosEstMnimosClick(Sender: TObject);
    procedure PopM_EstoquesReplicarEstMinLojasClick(Sender: TObject);
    procedure Bt_OdirClick(Sender: TObject);
    procedure Bt_EstoquesFiltroCompradorClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
   THackDBGrid = class(TDBGrid);

var
  FrmEstoques: TFrmEstoques;

  // Show Hint em Forma de Balao
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  // Cria Ponteiro de transação ================================================
  TD: TTransactionDesc;

  bgSairEstoques: Boolean;

  bgIndexCriado: Boolean;
  sgFiltros: String;

  // Guarda Valores Digitados no Parametros da Curva ABC
  igDiasEstA, igDiasEstB, igDiasEstC, igDiasEstD, igDiasEstE,
  igEstMinA, igEstMinB, igEstMinC, igEstMinD, igEstMinE: Integer;

implementation

uses DK_Procs1, UDMVirtual, UFrmBelShop, UFrmSelectEmpProcessamento,
     UFrmSolicitacoes, SysConst, UDMBelShop;

{$R *.dfm}

//==============================================================================
// Odir - INICIO ===============================================================
//==============================================================================

// Recalcula Campos Aggregates em CDS_V_Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmEstoques.Recalculo_V_Estoques_Aggregates;
Begin
  // DEMANDAS FECHA
  DMVirtual.CDS_V_EstoquesDM_CURVA_A.Active:=False;
  DMVirtual.CDS_V_EstoquesDM_CURVA_B.Active:=False;
  DMVirtual.CDS_V_EstoquesDM_CURVA_C.Active:=False;
  DMVirtual.CDS_V_EstoquesDM_CURVA_D.Active:=False;
  DMVirtual.CDS_V_EstoquesDM_CURVA_E.Active:=False;

  DMVirtual.CDS_V_EstoquesDM_CURVA_A_PC.Active:=False;
  DMVirtual.CDS_V_EstoquesDM_CURVA_B_PC.Active:=False;
  DMVirtual.CDS_V_EstoquesDM_CURVA_C_PC.Active:=False;
  DMVirtual.CDS_V_EstoquesDM_CURVA_D_PC.Active:=False;
  DMVirtual.CDS_V_EstoquesDM_CURVA_E_PC.Active:=False;

  DMVirtual.CDS_V_EstoquesDM_CURVA_A_PV.Active:=False;
  DMVirtual.CDS_V_EstoquesDM_CURVA_B_PV.Active:=False;
  DMVirtual.CDS_V_EstoquesDM_CURVA_C_PV.Active:=False;
  DMVirtual.CDS_V_EstoquesDM_CURVA_D_PV.Active:=False;
  DMVirtual.CDS_V_EstoquesDM_CURVA_E_PV.Active:=False;

  // ESTOQUES FECHA
  DMVirtual.CDS_V_EstoquesEST_CURVA_A.Active:=False;
  DMVirtual.CDS_V_EstoquesEST_CURVA_B.Active:=False;
  DMVirtual.CDS_V_EstoquesEST_CURVA_C.Active:=False;
  DMVirtual.CDS_V_EstoquesEST_CURVA_D.Active:=False;
  DMVirtual.CDS_V_EstoquesEST_CURVA_E.Active:=False;

  DMVirtual.CDS_V_EstoquesEST_CURVA_A_PC.Active:=False;
  DMVirtual.CDS_V_EstoquesEST_CURVA_B_PC.Active:=False;
  DMVirtual.CDS_V_EstoquesEST_CURVA_C_PC.Active:=False;
  DMVirtual.CDS_V_EstoquesEST_CURVA_D_PC.Active:=False;
  DMVirtual.CDS_V_EstoquesEST_CURVA_E_PC.Active:=False;

  DMVirtual.CDS_V_EstoquesEST_CURVA_A_PV.Active:=False;
  DMVirtual.CDS_V_EstoquesEST_CURVA_B_PV.Active:=False;
  DMVirtual.CDS_V_EstoquesEST_CURVA_C_PV.Active:=False;
  DMVirtual.CDS_V_EstoquesEST_CURVA_D_PV.Active:=False;
  DMVirtual.CDS_V_EstoquesEST_CURVA_E_PV.Active:=False;

  // DEMANDAS REABRE
  DMVirtual.CDS_V_EstoquesDM_CURVA_A.Active:=True;
  DMVirtual.CDS_V_EstoquesDM_CURVA_B.Active:=True;
  DMVirtual.CDS_V_EstoquesDM_CURVA_C.Active:=True;
  DMVirtual.CDS_V_EstoquesDM_CURVA_D.Active:=True;
  DMVirtual.CDS_V_EstoquesDM_CURVA_E.Active:=True;

  DMVirtual.CDS_V_EstoquesDM_CURVA_A_PC.Active:=True;
  DMVirtual.CDS_V_EstoquesDM_CURVA_B_PC.Active:=True;
  DMVirtual.CDS_V_EstoquesDM_CURVA_C_PC.Active:=True;
  DMVirtual.CDS_V_EstoquesDM_CURVA_D_PC.Active:=True;
  DMVirtual.CDS_V_EstoquesDM_CURVA_E_PC.Active:=True;

  DMVirtual.CDS_V_EstoquesDM_CURVA_A_PV.Active:=True;
  DMVirtual.CDS_V_EstoquesDM_CURVA_B_PV.Active:=True;
  DMVirtual.CDS_V_EstoquesDM_CURVA_C_PV.Active:=True;
  DMVirtual.CDS_V_EstoquesDM_CURVA_D_PV.Active:=True;
  DMVirtual.CDS_V_EstoquesDM_CURVA_E_PV.Active:=True;

  // ESTOQUE REABRE
  DMVirtual.CDS_V_EstoquesEST_CURVA_A.Active:=True;
  DMVirtual.CDS_V_EstoquesEST_CURVA_B.Active:=True;
  DMVirtual.CDS_V_EstoquesEST_CURVA_C.Active:=True;
  DMVirtual.CDS_V_EstoquesEST_CURVA_D.Active:=True;
  DMVirtual.CDS_V_EstoquesEST_CURVA_E.Active:=True;

  DMVirtual.CDS_V_EstoquesEST_CURVA_A_PC.Active:=True;
  DMVirtual.CDS_V_EstoquesEST_CURVA_B_PC.Active:=True;
  DMVirtual.CDS_V_EstoquesEST_CURVA_C_PC.Active:=True;
  DMVirtual.CDS_V_EstoquesEST_CURVA_D_PC.Active:=True;
  DMVirtual.CDS_V_EstoquesEST_CURVA_E_PC.Active:=True;

  DMVirtual.CDS_V_EstoquesEST_CURVA_A_PV.Active:=True;
  DMVirtual.CDS_V_EstoquesEST_CURVA_B_PV.Active:=True;
  DMVirtual.CDS_V_EstoquesEST_CURVA_C_PV.Active:=True;
  DMVirtual.CDS_V_EstoquesEST_CURVA_D_PV.Active:=True;
  DMVirtual.CDS_V_EstoquesEST_CURVA_E_PV.Active:=True;
End; // Recalcula Campos Aggregates em CDS_V_Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita/ Desbilita Componentes /////////////////////////////////////////////
Procedure TFrmEstoques.HabilitaComponentes(bLib: Boolean);
Begin
  Gb_EstoquesLimiteCurvaA.Enabled:=bLib;
  Gb_EstoquesLimiteCurvaB.Enabled:=bLib;
  Gb_EstoquesLimiteCurvaC.Enabled:=bLib;
  Gb_EstoquesLimiteCurvaD.Enabled:=bLib;
  Gb_EstoquesLimiteCurvaE.Enabled:=bLib;

  Gb_EstoquesSituacaoProd.Enabled:=bLib;

  Dbg_Estoques.Enabled:=bLib;
  Dbg_EstoquesPrev.Enabled:=bLib;

  Bt_EstoquesFiltros.Enabled:=bLib;
  Bt_EstoquesFechar.Enabled:=bLib;
End;

// Show Hint em Forma de Balao >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmEstoques.CreateToolTips(hWnd: Cardinal);
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
end; // Show Hint em Forma de Balao >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balao - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>>>>>>
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
end; // Show Hint em Forma de Balao - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balao - Posiciona do Componente >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmEstoques.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Balao - Posiciona do Componente >>>>>>>>>>>>>>>>>>

// Monta Filtros >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmEstoques.MontaFiltros(sTipo: String);
Var
  i, iReg: Integer;
  sCod: String;
  bUsou: Boolean; // Se Uso o filtro
Begin
  // sTipo=EST - Controle de Estoques

  If sTipo='EST' Then
  Begin
    sgFiltros:='';
  End;

  // Produtos ==================================================================
  sgProdutos:='';
  If Not DMVirtual.CDS_V_Produtos.IsEmpty Then
  Begin
    bUsou:=False;

    FrmBelShop.SelecionaProdutos(True, False);
    iReg:=DMVirtual.CDS_V_Produtos.RecordCount;

    For i:=1 to iReg do
    Begin
      sCod:=Separa_String(sgProdutos+',',i,',');
      If sTipo='EST' Then
      Begin
        If sgFiltros='' Then
        Begin
          sgFiltros:='ORDENAR<13 OR (COD_PRODUTO='+sCod;
          bUsou:=True;
        End
        Else If Not bUsou Then
        Begin
          sgFiltros:=sgFiltros+' OR (COD_PRODUTO='+sCod;
          bUsou:=True;
        End
        Else
        Begin
          sgFiltros:=sgFiltros+' OR COD_PRODUTO='+sCod;
        End
      End;
    End; // For i:=1 to iReg do

    If (sTipo='EST') And (sgFiltros<>'') Then
     sgFiltros:=sgFiltros+')';

    // Se Tem Produto Não Busca Pelo Fornecedor
    If DMVirtual.CDS_V_Fornecedores.Active Then
     DMVirtual.CDS_V_Fornecedores.Close;

    DMVirtual.CDS_V_Fornecedores.CreateDataSet;
    DMVirtual.CDS_V_Fornecedores.IndexFieldNames:='';
    DMVirtual.CDS_V_Fornecedores.Filtered:=False;
    DMVirtual.CDS_V_Fornecedores.Filter:='';
    DMVirtual.CDS_V_Fornecedores.Open;
  End; // If Not DMVirtual.CDS_V_Produtos.IsEmpty Then

  FrmBelShop.SelecionaProdutos(False, True);

  // Fornecedores ==============================================================
  If Not DMVirtual.CDS_V_Fornecedores.IsEmpty Then
  Begin
    bUsou:=False;

    DMVirtual.CDS_V_Fornecedores.First;
    While Not DMVirtual.CDS_V_Fornecedores.Eof do
    Begin
      If sTipo='EST' Then
      Begin
        If sgFiltros='' Then
        Begin
          sgFiltros:='ORDENAR<13 OR (COD_FORNECEDOR='+QuotedStr(DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString);
          bUsou:=True;
        End
        Else If Not bUsou Then
        Begin
          sgFiltros:=sgFiltros+' OR (COD_FORNECEDOR='+QuotedStr(DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString);
          bUsou:=True;
        End
        Else
        Begin
          sgFiltros:=sgFiltros+' OR COD_FORNECEDOR='+QuotedStr(DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString);
        End;
      End;

      DMVirtual.CDS_V_Fornecedores.Next;
    End; // While Not DMVirtual.CDS_V_Fornecedores.Eof do
    DMVirtual.CDS_V_Fornecedores.First;

    If (sTipo='EST') And (sgFiltros<>'') Then
     sgFiltros:=sgFiltros+')';
  End; // If Not DMVirtual.CDS_V_Fornecedores.IsEmpty Then

  If Not DMVirtual.CDS_V_GruposProdutos.IsEmpty Then
  Begin
    DMVirtual.CDS_V_GruposProdutos.First;
    While Not DMVirtual.CDS_V_GruposProdutos.Eof do
    Begin
      If Not DMVirtual.CDS_V_SubGruposProdutos.IsEmpty Then
       Begin
         DMVirtual.CDS_V_SubGruposProdutos.First;
         While Not DMVirtual.CDS_V_SubGruposProdutos.Eof do
         Begin
           If sTipo='EST' Then
           Begin
             If sgFiltros='' Then
              Begin
                sgFiltros:='ORDENAR<13 OR (CODGRUPOSUB='+QuotedStr(DMVirtual.CDS_V_SubGruposProdutosCod_GrupoSub.AsString);
                bUsou:=True;
              End
             Else
              Begin
                If Pos('CODGRUPOSUB', sgFiltros)=0 Then
                 sgFiltros:=sgFiltros+' AND (CODGRUPOSUB='+QuotedStr(DMVirtual.CDS_V_SubGruposProdutosCod_GrupoSub.AsString)
                Else
                 sgFiltros:=sgFiltros+' OR CODGRUPOSUB='+QuotedStr(DMVirtual.CDS_V_SubGruposProdutosCod_GrupoSub.AsString)
              End;
           End;

           DMVirtual.CDS_V_SubGruposProdutos.Next;
         End; // While Not DMVirtual.CDS_V_SubGruposProdutos.Eof do
         DMVirtual.CDS_V_SubGruposProdutos.First;
       End
      Else // If Not DMVirtual.CDS_V_SubGruposProdutos.IsEmpty Then
       Begin
         If sTipo='EST' Then
         Begin
           If sgFiltros='' Then
            Begin
              sgFiltros:='ORDENAR<13 OR (CODGRUPO='+QuotedStr(DMVirtual.CDS_V_GruposProdutosCod_Grupo.AsString);
            End
           Else
            Begin
              If Pos('CODGRUPO', sgFiltros)=0 Then
               sgFiltros:=sgFiltros+' AND (CODGRUPO='+QuotedStr(DMVirtual.CDS_V_GruposProdutosCod_Grupo.AsString)
              Else
               sgFiltros:=sgFiltros+' OR CODGRUPO='+QuotedStr(DMVirtual.CDS_V_GruposProdutosCod_Grupo.AsString);
            End;
         End;
       End; // If Not DMVirtual.CDS_V_SubGruposProdutos.IsEmpty Then

      DMVirtual.CDS_V_GruposProdutos.Next;
    End; // While Not DMVirtual.CDS_V_GruposProdutos.Eof do
    DMVirtual.CDS_V_GruposProdutos.First;

    If (sTipo='EST') And (sgFiltros<>'') Then
     sgFiltros:=sgFiltros+')';
  End; // If Not DMVirtual.CDS_V_GruposProdutos.IsEmpty Then

  //============================================================================
  // Monta Filtros apara para Calculo do Financeiro ============================

  FrmBelShop.MontaSelectFornecedores;

  // Grupos e SubGrupos Selecionados ===========================================
  sgGrupos:='';
  sgSubGrupos:='';
  If Not DMVirtual.CDS_V_GruposProdutos.IsEmpty Then
  Begin

    DMVirtual.CDS_V_GruposProdutos.First;
    While Not DMVirtual.CDS_V_GruposProdutos.Eof do
    Begin
      Refresh;

      If sgGrupos='' Then
       sgGrupos:='(pr.codgrupo='+
                     QuotedStr(DMVirtual.CDS_V_GruposProdutosCod_Grupo.AsString)
      Else
       sgGrupos:=sgGrupos+' Or pr.codgrupo='+
                    QuotedStr(DMVirtual.CDS_V_GruposProdutosCod_Grupo.AsString);

      If Not DMVirtual.CDS_V_SubGruposProdutos.IsEmpty Then
      Begin
        While Not DMVirtual.CDS_V_SubGruposProdutos.Eof do
        Begin
          Refresh;

          If sgSubGrupos='' Then
           sgSubGrupos:=QuotedStr(DMVirtual.CDS_V_SubGruposProdutosCod_GrupoSub.AsString)
          Else
           sgSubGrupos:=sgSubGrupos+', '+
              QuotedStr(DMVirtual.CDS_V_SubGruposProdutosCod_GrupoSub.AsString);

          DMVirtual.CDS_V_SubGruposProdutos.Next;
        End; // While Not DMVirtual.CDS_V_SubGruposProdutos.Eof do
        DMVirtual.CDS_V_SubGruposProdutos.First;

      End; // If Not DMVirtual.CDS_V_SubGruposProdutos.IsEmpty Then

      If sgSubGrupos<>'' Then
       sgGrupos:=sgGrupos+' and pr.codgruposub in ('+sgSubGrupos+')';

      sgSubGrupos:='';

      DMVirtual.CDS_V_GruposProdutos.Next;
    End; // While Not DMVirtual.CDS_V_GruposProdutos.Eof do
    DMVirtual.CDS_V_GruposProdutos.First;

    If sgGrupos<>'' Then
     sgGrupos:=sgGrupos+')';

  End; // If Not DMVirtual.CDS_V_GruposProdutos.IsEmpty Then

End; // Monta Filtros >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//==============================================================================
// Odir - FIM ==================================================================
//==============================================================================

procedure TFrmEstoques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairEstoques Then
   Begin
     Action := caHide; // caFree;

     FrmBelShop.FechaTudo;

     sgCompradores:='';

     DMVirtual.CDS_V_Estoques.Close;
     DMBelShop.CDS_EstoquePrevisao.Close;
     DMVirtual.CDS_V_EstoquesFinan.Close;
   End
  Else
   Begin
     PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
     msg('Para Sair Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;
end;

procedure TFrmEstoques.FormCreate(Sender: TObject);
const  
  TipoDoIcone = 1; // Show Hint em Forma de Balao
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Balao
  CreateToolTips(Self.Handle);
  AddToolTip(Pan_EstoquesProdNovo.Handle, @ti, TipoDoIcone, 'Cadastrado a'+#13+'MENOS de um MÊS !!', 'PRODUTO NOVO !!');

  OrderGrid:='';
  bEnterTab:=True;

  Ts_EstoquesFiltros.TabVisible:=False;

  THackDBGrid(Dbg_Estoques).FixedCols:=4;
end;

procedure TFrmEstoques.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If bEnterTab Then
  Begin
    If Key = #13 Then
    Begin
      Key:=#0;
      SelectNext(ActiveControl,True,True);
    End;
  End;
end;

procedure TFrmEstoques.FormShow(Sender: TObject);
begin
  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairEstoques:=False;

  PC_EstoquesPrincipal.TabIndex:=0;
  PC_EstoquesPrincipalChange(Self);

end;

procedure TFrmEstoques.Bt_EstoquesFecharClick(Sender: TObject);
begin

// OdirApagar - OdirDuvida
//  DMBelShop.CDS_CurvaFinanceira.EnableControls;
//  DMBelShop.CDS_CurvaFinanceira.Close;

  // Fecha Demonstrativo =======================================================
  If Bt_EstoquesDemonstrativo.Caption='Fechar Demonstrativo' Then
   Bt_EstoquesDemonstrativoClick(Self);

  bgSairEstoques:=True;

  FrmBelShop.PC_Filtros.Parent:=FrmBelShop.Ts_Filtros;

  Close;

end;

procedure TFrmEstoques.PC_EstoquesPrincipalChange(Sender: TObject);
Var
  i: Integer;
begin
  CorSelecaoTabSheet(PC_EstoquesPrincipal);

  If (PC_EstoquesPrincipal.ActivePage=Ts_Estoques) And (Ts_Estoques.CanFocus) Then
  Begin
    // Acerta Nome dos Meses de Demanda ==========================================
    i:=MonthOf(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
    sMes5:=ArrayNroMes[i];
    i:=i-1;
    sMes4:=ArrayNroMes[i];
    i:=i-1;
    sMes3:=ArrayNroMes[i];
    i:=i-1;
    sMes2:=ArrayNroMes[i];
    i:=i-1;
    sMes1:=ArrayNroMes[i];
    For i:=0 to DMVirtual.CDS_V_Estoques.Fields.Count-1 do
    Begin
      // Altera Nome da Coluna para Valores de Venda de Cada Mes
      If DMVirtual.CDS_V_Estoques.Fields[i].FieldName='VLR_VD_M1' Then
       DMVirtual.CDS_V_Estoques.Fields[i].DisplayLabel:='$ Vd '+sMes1;

      If DMVirtual.CDS_V_Estoques.Fields[i].FieldName='VLR_VD_M2' Then
       DMVirtual.CDS_V_Estoques.Fields[i].DisplayLabel:='$ Vd '+sMes2;

      If DMVirtual.CDS_V_Estoques.Fields[i].FieldName='VLR_VD_M3' Then
       DMVirtual.CDS_V_Estoques.Fields[i].DisplayLabel:='$ Vd '+sMes3;

      If DMVirtual.CDS_V_Estoques.Fields[i].FieldName='VLR_VD_M4' Then
       DMVirtual.CDS_V_Estoques.Fields[i].DisplayLabel:='$ Vd '+sMes4;

      If DMVirtual.CDS_V_Estoques.Fields[i].FieldName='VLR_VD_M5' Then
       DMVirtual.CDS_V_Estoques.Fields[i].DisplayLabel:='$ Vd '+sMes5;

      // Altera Nome da Coluna para Quantidades de Venda de Cada Mes
      If DMVirtual.CDS_V_Estoques.Fields[i].FieldName='QTD_VD_M1' Then
       DMVirtual.CDS_V_Estoques.Fields[i].DisplayLabel:='Qt Vd '+sMes1;

      If DMVirtual.CDS_V_Estoques.Fields[i].FieldName='QTD_VD_M2' Then
       DMVirtual.CDS_V_Estoques.Fields[i].DisplayLabel:='Qt Vd '+sMes2;

      If DMVirtual.CDS_V_Estoques.Fields[i].FieldName='QTD_VD_M3' Then
       DMVirtual.CDS_V_Estoques.Fields[i].DisplayLabel:='Qt Vd '+sMes3;

      If DMVirtual.CDS_V_Estoques.Fields[i].FieldName='QTD_VD_M4' Then
       DMVirtual.CDS_V_Estoques.Fields[i].DisplayLabel:='Qt Vd '+sMes4;

      If DMVirtual.CDS_V_Estoques.Fields[i].FieldName='QTD_VD_M5' Then
       DMVirtual.CDS_V_Estoques.Fields[i].DisplayLabel:='Qt Vd '+sMes5;

    End; // For i:=0 to DMVirtual.CDS_V_Estoques.Fields.Count-1 do

    sMes5:='';
    sMes4:='';
    sMes3:='';
    sMes2:='';
    sMes1:='';

    Dbg_Estoques.SetFocus;
  End; // If (PC_EstoquesPrincipal.ActivePage=Ts_Estoques) And (Ts_Estoques.CanFocus) Then

  If (Ts_EstoquesFiltros.TabVisible) and (PC_EstoquesPrincipal.ActivePage=Ts_EstoquesFiltros) And (Ts_EstoquesFiltros.CanFocus) Then
   FrmBelShop.EdtFiltroCodForn.SetFocus;
end;

procedure TFrmEstoques.Dbg_EstoquesEnter(Sender: TObject);
begin
  bEnterTab:=False;
end;

procedure TFrmEstoques.Dbg_EstoquesExit(Sender: TObject);
begin
  bEnterTab:=True;
end;

procedure TFrmEstoques.Bt_EstoquesDemonstrativoClick(Sender: TObject);
Var
  MySql: String;

  sDM,  sDM_PC,  sDM_PV,
  sEST, sEST_PC, sEST_PV: String;

  itDM, itEST: Integer;

  ctDM_PC,  ctDM_PV,
  ctEST_PC, ctEST_PV: Currency;
begin

  Screen.Cursor:=crAppStart;

  If Bt_EstoquesDemonstrativo.Caption='Abrir Demonstrativo' Then
   Begin
     Dbg_Estoques.SetFocus;

     If DMVirtual.CDS_V_Estoques.IsEmpty Then
     Begin
       Screen.Cursor:=crDefault;
       Exit;
     End;

     HabilitaComponentes(False);

     Bt_EstoquesDemonstrativo.Caption:='Fechar Demonstrativo';

     // Monta Select de Totais Curva A =========================================
     sEST   :=DMVirtual.CDS_V_EstoquesEST_CURVA_A.AsString;
     sEST_PC:=DMVirtual.CDS_V_EstoquesEST_CURVA_A_PC.AsString;
     sEST_PV:=DMVirtual.CDS_V_EstoquesEST_CURVA_A_PV.AsString;
     sDM    :=DMVirtual.CDS_V_EstoquesDM_CURVA_A.AsString;
     sDM_PC :=DMVirtual.CDS_V_EstoquesDM_CURVA_A_PC.AsString;
     sDM_PV :=DMVirtual.CDS_V_EstoquesDM_CURVA_A_PV.AsString;

     itEST   :=StrToInt(sEST);
     ctEST_PC:=StrToCurr(sEST_PC);
     ctEST_PV:=StrToCurr(sEST_PV);
     itDM    :=StrToInt(sDM);
     ctDM_PC :=StrToCurr(sDM_PC);
     ctDM_PV :=StrToCurr(sDM_PV);

     MySql:=' SELECT'+
            ' ''A'' CLASSE,'+
            sDM+' DM,'+
            f_Troca(',','.',sDM_PC)+' DM_PC,'+
            f_Troca(',','.',sDM_PV)+' DM_PV,'+
            sEST+' EST,'+
            f_Troca(',','.',sEST_PC)+' EST_PC,'+
            f_Troca(',','.',sEST_PV)+' EST_PV,'+
            IntToStr(StrToInt(sEST)-StrToInt(sDM))+' DIF_EST_DM,'+
            f_Troca(',','.',CurrToStr(StrToCurr(sEST_PC)-StrToCurr(sDM_PC)))+' DIF_EST_DM_PC,'+
            f_Troca(',','.',CurrToStr(StrToCurr(sEST_PV)-StrToCurr(sDM_PV)))+' DIF_EST_DM_PV'+
            ' FROM RDB$DATABASE';

     // Monta Select de Totais Curva B =========================================
     sEST   :=DMVirtual.CDS_V_EstoquesEST_CURVA_B.AsString;
     sEST_PC:=DMVirtual.CDS_V_EstoquesEST_CURVA_B_PC.AsString;
     sEST_PV:=DMVirtual.CDS_V_EstoquesEST_CURVA_B_PV.AsString;
     sDM    :=DMVirtual.CDS_V_EstoquesDM_CURVA_B.AsString;
     sDM_PC :=DMVirtual.CDS_V_EstoquesDM_CURVA_B_PC.AsString;
     sDM_PV :=DMVirtual.CDS_V_EstoquesDM_CURVA_B_PV.AsString;

     itEST   :=itEST + StrToInt(sEST);
     ctEST_PC:=ctEST_PC + StrToCurr(sEST_PC);
     ctEST_PV:=ctEST_PV + StrToCurr(sEST_PV);
     itDM    :=itDM + StrToInt(sDM);
     ctDM_PC :=ctDM_PC + StrToCurr(sDM_PC);
     ctDM_PV :=ctDM_PV + StrToCurr(sDM_PV);

     MySql:=
      MySql+' UNION '+
            ' SELECT'+
            ' ''B'' CLASSE,'+
            sDM+' DM,'+
            f_Troca(',','.',sDM_PC)+' DM_PC,'+
            f_Troca(',','.',sDM_PV)+' DM_PV,'+
            sEST+' EST,'+
            f_Troca(',','.',sEST_PC)+' EST_PC,'+
            f_Troca(',','.',sEST_PV)+' EST_PV,'+
            IntToStr(StrToInt(sEST)-StrToInt(sDM))+' DIF_EST_DM,'+
            f_Troca(',','.',CurrToStr(StrToCurr(sEST_PC)-StrToCurr(sDM_PC)))+' DIF_EST_DM_PC,'+
            f_Troca(',','.',CurrToStr(StrToCurr(sEST_PV)-StrToCurr(sDM_PV)))+' DIF_EST_DM_PV'+
            ' FROM RDB$DATABASE';

     // Monta Select de Totais Curva C =========================================
     sEST   :=DMVirtual.CDS_V_EstoquesEST_CURVA_C.AsString;
     sEST_PC:=DMVirtual.CDS_V_EstoquesEST_CURVA_C_PC.AsString;
     sEST_PV:=DMVirtual.CDS_V_EstoquesEST_CURVA_C_PV.AsString;
     sDM    :=DMVirtual.CDS_V_EstoquesDM_CURVA_C.AsString;
     sDM_PC :=DMVirtual.CDS_V_EstoquesDM_CURVA_C_PC.AsString;
     sDM_PV :=DMVirtual.CDS_V_EstoquesDM_CURVA_C_PV.AsString;

     itEST   :=itEST + StrToInt(sEST);
     ctEST_PC:=ctEST_PC + StrToCurr(sEST_PC);
     ctEST_PV:=ctEST_PV + StrToCurr(sEST_PV);
     itDM    :=itDM + StrToInt(sDM);
     ctDM_PC :=ctDM_PC + StrToCurr(sDM_PC);
     ctDM_PV :=ctDM_PV + StrToCurr(sDM_PV);

     MySql:=
      MySql+' UNION '+
            ' SELECT'+
            ' ''C'' CLASSE,'+
            sDM+' DM,'+
            f_Troca(',','.',sDM_PC)+' DM_PC,'+
            f_Troca(',','.',sDM_PV)+' DM_PV,'+
            sEST+' EST,'+
            f_Troca(',','.',sEST_PC)+' EST_PC,'+
            f_Troca(',','.',sEST_PV)+' EST_PV,'+
            IntToStr(StrToInt(sEST)-StrToInt(sDM))+' DIF_EST_DM,'+
            f_Troca(',','.',CurrToStr(StrToCurr(sEST_PC)-StrToCurr(sDM_PC)))+' DIF_EST_DM_PC,'+
            f_Troca(',','.',CurrToStr(StrToCurr(sEST_PV)-StrToCurr(sDM_PV)))+' DIF_EST_DM_PV'+
            ' FROM RDB$DATABASE';

     // Monta Select de Totais Curva D =========================================
     sEST   :=DMVirtual.CDS_V_EstoquesEST_CURVA_D.AsString;
     sEST_PC:=DMVirtual.CDS_V_EstoquesEST_CURVA_D_PC.AsString;
     sEST_PV:=DMVirtual.CDS_V_EstoquesEST_CURVA_D_PV.AsString;
     sDM    :=DMVirtual.CDS_V_EstoquesDM_CURVA_D.AsString;
     sDM_PC :=DMVirtual.CDS_V_EstoquesDM_CURVA_D_PC.AsString;
     sDM_PV :=DMVirtual.CDS_V_EstoquesDM_CURVA_D_PV.AsString;

     itEST   :=itEST + StrToInt(sEST);
     ctEST_PC:=ctEST_PC + StrToCurr(sEST_PC);
     ctEST_PV:=ctEST_PV + StrToCurr(sEST_PV);
     itDM    :=itDM + StrToInt(sDM);
     ctDM_PC :=ctDM_PC + StrToCurr(sDM_PC);
     ctDM_PV :=ctDM_PV + StrToCurr(sDM_PV);

     MySql:=
      MySql+' UNION '+
            ' SELECT'+
            ' ''D'' CLASSE,'+
            sDM+' DM,'+
            f_Troca(',','.',sDM_PC)+' DM_PC,'+
            f_Troca(',','.',sDM_PV)+' DM_PV,'+
            sEST+' EST,'+
            f_Troca(',','.',sEST_PC)+' EST_PC,'+
            f_Troca(',','.',sEST_PV)+' EST_PV,'+
            IntToStr(StrToInt(sEST)-StrToInt(sDM))+' DIF_EST_DM,'+
            f_Troca(',','.',CurrToStr(StrToCurr(sEST_PC)-StrToCurr(sDM_PC)))+' DIF_EST_DM_PC,'+
            f_Troca(',','.',CurrToStr(StrToCurr(sEST_PV)-StrToCurr(sDM_PV)))+' DIF_EST_DM_PV'+
            ' FROM RDB$DATABASE';

     // Monta Select de Totais Curva E =========================================
     sEST   :=DMVirtual.CDS_V_EstoquesEST_CURVA_E.AsString;
     sEST_PC:=DMVirtual.CDS_V_EstoquesEST_CURVA_E_PC.AsString;
     sEST_PV:=DMVirtual.CDS_V_EstoquesEST_CURVA_E_PV.AsString;
     sDM    :=DMVirtual.CDS_V_EstoquesDM_CURVA_E.AsString;
     sDM_PC :=DMVirtual.CDS_V_EstoquesDM_CURVA_E_PC.AsString;
     sDM_PV :=DMVirtual.CDS_V_EstoquesDM_CURVA_E_PV.AsString;

     itEST   :=itEST + StrToInt(sEST);
     ctEST_PC:=ctEST_PC + StrToCurr(sEST_PC);
     ctEST_PV:=ctEST_PV + StrToCurr(sEST_PV);
     itDM    :=itDM + StrToInt(sDM);
     ctDM_PC :=ctDM_PC + StrToCurr(sDM_PC);
     ctDM_PV :=ctDM_PV + StrToCurr(sDM_PV);

     MySql:=
      MySql+' UNION '+
            ' SELECT'+
            ' ''E'' CLASSE,'+
            sDM+' DM,'+
            f_Troca(',','.',sDM_PC)+' DM_PC,'+
            f_Troca(',','.',sDM_PV)+' DM_PV,'+
            sEST+' EST,'+
            f_Troca(',','.',sEST_PC)+' EST_PC,'+
            f_Troca(',','.',sEST_PV)+' EST_PV,'+
            IntToStr(StrToInt(sEST)-StrToInt(sDM))+' DIF_EST_DM,'+
            f_Troca(',','.',CurrToStr(StrToCurr(sEST_PC)-StrToCurr(sDM_PC)))+' DIF_EST_DM_PC,'+
            f_Troca(',','.',CurrToStr(StrToCurr(sEST_PV)-StrToCurr(sDM_PV)))+' DIF_EST_DM_PV'+
            ' FROM RDB$DATABASE';

     // Monta Select de Totais Curvas ==========================================
     MySql:=
      MySql+' UNION '+
            ' SELECT'+
            ' ''TOTAIS'' CLASSE,'+
            IntToStr(itDM)+' DM,'+
            f_Troca(',','.',CurrToStr(ctDM_PC))+' DM_PC,'+
            f_Troca(',','.',CurrToStr(ctDM_PV))+' DM_PV,'+
            IntToStr(itEST)+' EST,'+
            f_Troca(',','.',CurrToStr(ctEST_PC))+' EST_PC,'+
            f_Troca(',','.',CurrToStr(ctEST_PV))+' EST_PV,'+
            IntToStr(itEST-itDM)+' DIF_EST_DM,'+
            f_Troca(',','.',CurrToStr(ctEST_PC-ctDM_PC))+' DIF_EST_DM_PC,'+
            f_Troca(',','.',CurrToStr(ctEST_PV-ctDM_PV))+' DIF_EST_DM_PV'+
            ' FROM RDB$DATABASE';
     DMBelShop.CDS_Busca.Close;
     DMBelShop.SDS_Busca.CommandText:=MySql;
     DMBelShop.CDS_Busca.Open;

     // Atualiza Client Estoque Fisico/Financeiro ==============================
     If DMVirtual.CDS_V_EstoquesFinan.Active Then
      DMVirtual.CDS_V_EstoquesFinan.Close;

     DMVirtual.CDS_V_EstoquesFinan.CreateDataSet;
     DMVirtual.CDS_V_EstoquesFinan.EmptyDataSet;
     DMVirtual.CDS_V_EstoquesFinan.Data:=DMBelShop.CDS_Busca.Data;
     DMBelShop.CDS_Busca.Close;

     // Libera para Salvar em Memória ==========================================
     Bt_EstoquesFiltroComprador.Caption:='Salvar em Memória';

     // Abre Apresentação Fisico / Financeiro ==================================
     FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
     FrmSolicitacoes.Bt_QualquerCoisaSalvar.Visible:=False;
     FrmSolicitacoes.Bt_QualquerCoisaVoltar.Visible:=False;

     FrmSolicitacoes.Pan_QualquerCoisa.Caption:='';
     If Trim(sgCompradores)<>'' Then
      FrmSolicitacoes.Pan_QualquerCoisa.Caption:='COMPRADOR(ES): '+sgCompradores
     Else
      FrmSolicitacoes.Pan_QualquerCoisa.Caption:='TOODS OS COMPRADORES';

     // Ajusta Tamanho do Form =================================================
     FrmSolicitacoes.AutoSize    :=False;
     FrmSolicitacoes.ClientHeight:=260; // nr1.AsInteger;// 250;
     FrmSolicitacoes.ClientWidth :=875; // nr2.AsInteger;// 860;
     FrmSolicitacoes.AutoSize    :=True;
     FrmSolicitacoes.BorderStyle :=bsSingle;

     Dbg_EstoquesDemFinan.Parent:=FrmSolicitacoes.Ts_QualquerCoisa;
     Dbg_EstoquesDemFinan.Top:=30;
     Dbg_EstoquesDemFinan.Left:=2;
     Dbg_EstoquesDemFinan.Visible:=True;
     FrmBelShop.AbreSolicitacoes(19);

     FrmSolicitacoes.Caption:='DEMONSTRATIVO DE ESTOQUES';
     FrmSolicitacoes.Ts_QualquerCoisa.Caption:='Físico/Financeiro';

     FrmSolicitacoes.Parent:=nil;
     FrmSolicitacoes.Parent:=FrmEstoques;
     FrmSolicitacoes.Show;
     Dbg_EstoquesDemFinan.SetFocus;
   End
  Else
   Begin
     HabilitaComponentes(True);
     Dbg_Estoques.SetFocus;

     // Retornar para Compradores ==============================================
     Bt_EstoquesFiltroComprador.Caption:='Seleciona Comprador';

     Bt_EstoquesDemonstrativo.Caption:='Abrir Demonstrativo';

     FrmSolicitacoes.Pan_QualquerCoisa.Caption:='';
     FrmSolicitacoes.Close;

     Dbg_EstoquesDemFinan.Visible:=False;
     Dbg_EstoquesDemFinan.Parent:=Ts_Estoques;

     FreeAndNil(FrmSolicitacoes);

     Dbg_Estoques.SetFocus;
   End;

  Screen.Cursor:=crDefault;

end;

procedure TFrmEstoques.Dbg_EstoquesKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key=#13 Then
  Begin
    DMVirtual.CDS_V_Estoques.Next;
  End; // If Key=#13 Then

end;

procedure TFrmEstoques.Dbg_EstoquesDemFinanDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If not (gdSelected in State) Then
  Begin
    If Trim(DMVirtual.CDS_V_EstoquesFinanCLASSE.AsString)='TOTAIS' Then
    Begin
      Dbg_EstoquesDemFinan.Canvas.Brush.Color:=clSkyBlue;
      Dbg_EstoquesDemFinan.Canvas.Font.Style:=[fsBold];
    End;
    Dbg_EstoquesDemFinan.Canvas.FillRect(Rect);
    Dbg_EstoquesDemFinan.DefaultDrawDataCell(Rect,Column.Field,state);
  End;

  // Alinhamento
  DMVirtual.CDS_V_EstoquesFinanCLASSE.Alignment:=taCenter;

end;

procedure TFrmEstoques.Dbg_EstoquesColEnter(Sender: TObject);
begin
  cgVlrAcumulado1:=DMVirtual.CDS_V_EstoquesEST_IDEAL.AsCurrency;

  if (THackDBGrid(Dbg_Estoques).SelectedIndex = 0) Or
     (THackDBGrid(Dbg_Estoques).SelectedIndex = 1) Or
     (THackDBGrid(Dbg_Estoques).SelectedIndex = 2) then
  begin
    THackDBGrid(Dbg_Estoques).LeftCol:=4;
    THackDBGrid(Dbg_Estoques).SelectedIndex:=3;
    Dbg_Estoques.Refresh;
  end;
end;

procedure TFrmEstoques.Bt_FiltrosOKClick(Sender: TObject);
Var
  bOriginal:Boolean;
begin

  Ts_EstoquesFiltros.SetFocus;

  // Monta Filtro ==============================================================
  OdirPanApres.Caption:='AGUARDE !! Montando Filtros...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmEstoques.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmEstoques.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;
  Screen.Cursor:=crAppStart;

  // Retorna Valores Originais se Não Houve Filtro =============================
  bOriginal:=(Trim(sgFiltros)<>'');
  If bOriginal Then
  Begin
    Dbg_Estoques.Columns[9].ReadOnly:=False;
    Dbg_Estoques.Columns[10].ReadOnly:=False;

    DMVirtual.CDS_V_Estoques.IndexName:='';
    DMVirtual.CDS_V_Estoques.IndexName:='NovaORDEM';
  End; // If bOriginal Then

  // Monta o Filtro ============================================================
  MontaFiltros('EST');

  // Incorpora Filtro de Likes =================================================
  If Trim(sgLikeProdutos)<>'' Then
  Begin
    sgLikeProdutos:=f_Troca('pr.apresentacao', 'DES_PRODUTO', sgLikeProdutos);

    If Trim(sgFiltros)<>'' Then
     sgFiltros:=sgFiltros+' AND '+Trim(sgLikeProdutos)
    Else
     sgFiltros:=Trim(sgLikeProdutos);
  End;
  sgLikeProdutos:='';

  // Verifica a Existencia de Registros ========================================
  DMVirtual.CDS_V_Estoques.Filtered:=False;
  DMVirtual.CDS_V_Estoques.Filter:=sgFiltros;
  If sgFiltros<>'' Then
  Begin
    DMVirtual.CDS_V_Estoques.Filtered:=True;
  End;

  If DMVirtual.CDS_V_Estoques.IsEmpty Then
  Begin
    msg('Sem Produto Selecionado !!','A');
    DMVirtual.CDS_V_Estoques.Filtered:=False;
    DMVirtual.CDS_V_Estoques.Filter:='';

    DMVirtual.CDS_V_Estoques.IndexName:='';
    DMVirtual.CDS_V_Estoques.IndexName:='NovaORDEM';

    sgFiltros:='';
  End; // If DMVirtual.CDS_V_Estoques.IsEmpty Then
  DMVirtual.CDS_V_Estoques.First;

  // Guarda Valores Originais se Houve Filtro ==================================
  bOriginal:=(Trim(sgFiltros)='');
  If Not bOriginal Then
  Begin
    Dbg_Estoques.Columns[9].ReadOnly:=False;
    Dbg_Estoques.Columns[10].ReadOnly:=False;

    DMVirtual.CDS_V_Estoques.IndexName:='';
    DMVirtual.CDS_V_Estoques.IndexName:='NovaORDEM';
  End; // If Not bOriginal Then

  // Recalcula Campos Aggregates ===============================================
  DMVirtual.CDS_V_Estoques.Close;
  DMBelShop.CDS_EstoquePrevisao.Close;

  Recalculo_V_Estoques_Aggregates;
  DMVirtual.CDS_V_Estoques.Open;
  DMBelShop.CDS_EstoquePrevisao.Open;

  If DMVirtual.CDS_V_Estoques.IsEmpty Then
  Begin
    msg('Sem Produto a Listar !!'+cr+cr+'Filtro Será Retirado !!','A');
    DMVirtual.CDS_V_Estoques.Close;
    DMBelShop.CDS_EstoquePrevisao.Close;

    DMVirtual.CDS_V_Estoques.Filter:='';
    DMVirtual.CDS_V_Estoques.Filtered:=False;
    Recalculo_V_Estoques_Aggregates;
    DMVirtual.CDS_V_Estoques.Open;
    DMBelShop.CDS_EstoquePrevisao.Open;
  End;

  Ts_EstoquesFiltros.TabVisible:=False;
  Ts_Estoques.TabVisible:=True;

  OdirPanApres.Visible:=False;
  Refresh;
  Screen.Cursor:=crDefault;

  // Fixa Colunas ==============================================================
  THackDBGrid(Dbg_Estoques).FixedCols:=4;
  Dbg_Estoques.SetFocus;

end;

procedure TFrmEstoques.Bt_FiltrosVoltarClick(Sender: TObject);
begin
  Ts_EstoquesFiltros.TabVisible:=False;
  Ts_Estoques.TabVisible:=True;

  Dbg_Estoques.SetFocus;
end;

procedure TFrmEstoques.Bt_EstoquesFiltrosClick(Sender: TObject);
begin
  Dbg_Estoques.SetFocus;

  If DMVirtual.CDS_V_Estoques.IsEmpty Then
   Exit;

  // Fecha Demonstrativo =======================================================
  If Bt_EstoquesDemonstrativo.Caption='Fechar Demonstrativo' Then
   Bt_EstoquesDemonstrativoClick(Self);

  //============================================================================
  // PageControl de Filtros - INICIO ===========================================
  //============================================================================
  // Inicializa Tabelas Virtuais para Filtros ==================================
  If DMVirtual.CDS_V_Fornecedores.Active Then
   DMVirtual.CDS_V_Fornecedores.Close;

  DMVirtual.CDS_V_Fornecedores.CreateDataSet;
  DMVirtual.CDS_V_Fornecedores.IndexFieldNames:='';
  DMVirtual.CDS_V_Fornecedores.Filtered:=False;
  DMVirtual.CDS_V_Fornecedores.Filter:='';
  DMVirtual.CDS_V_Fornecedores.Open;

  If DMVirtual.CDS_V_Produtos.Active Then
   DMVirtual.CDS_V_Produtos.Close;

  DMVirtual.CDS_V_Produtos.CreateDataSet;
  DMVirtual.CDS_V_Produtos.IndexFieldNames:='';
  DMVirtual.CDS_V_Produtos.Filtered:=False;
  DMVirtual.CDS_V_Produtos.Filter:='';
  DMVirtual.CDS_V_Produtos.Open;

  If DMVirtual.CDS_V_GruposProdutos.Active Then
   DMVirtual.CDS_V_GruposProdutos.Close;

  DMVirtual.CDS_V_GruposProdutos.CreateDataSet;
  DMVirtual.CDS_V_GruposProdutos.IndexFieldNames:='';
  DMVirtual.CDS_V_GruposProdutos.Filtered:=False;
  DMVirtual.CDS_V_GruposProdutos.Filter:='';
  DMVirtual.CDS_V_GruposProdutos.Open;

  If DMVirtual.CDS_V_SubGruposProdutos.Active Then
   DMVirtual.CDS_V_SubGruposProdutos.Close;

  DMVirtual.CDS_V_SubGruposProdutos.CreateDataSet;
  DMVirtual.CDS_V_SubGruposProdutos.IndexFieldNames:='';
  DMVirtual.CDS_V_SubGruposProdutos.Filtered:=False;
  DMVirtual.CDS_V_SubGruposProdutos.Filter:='';
  DMVirtual.CDS_V_SubGruposProdutos.Open;

  //-----------------------------------------------------------------
  // Filtro de Fornecedores -----------------------------------------
  //-----------------------------------------------------------------
  FrmBelShop.TS_FiltroFornecedor.Visible:=True;
  // Curva ABC no Fornecedor
  FrmBelShop.Painel_FiltroOC.Visible:=False;
  // Obs para Utilização no Movto de Comprovantes
  FrmBelShop.Label_MovtoComprovForn.Visible:=False;
  FrmBelShop.Label_MovtoComprovForn.Top:=FrmBelShop.Painel_FiltroOC.Top;

  //-----------------------------------------------------------------
  // Filtro de Produtos ---------------------------------------------
  //-----------------------------------------------------------------
  FrmBelShop.TS_FiltroProdutos.TabVisible:=True;
  // Filtor nao Produtos de Não Compra
  FrmBelShop.Painel_FiltroNaoCompra.Visible:=False;
  // Filtro para Busca Pelo Nome
  FrmBelShop.Gb_CalculoFiltroNome.Visible:=True;
  FrmBelShop.EdtCalculoFiltroNome1.Clear;
  FrmBelShop.EdtCalculoFiltroNome2.Clear;
  FrmBelShop.EdtCalculoFiltroNome3.Clear;
  FrmBelShop.EdtCalculoFiltroNome4.Clear;

  //-----------------------------------------------------------------
  // Filtro de Grupos e SubGrupos -----------------------------------
  //-----------------------------------------------------------------
  FrmBelShop.TS_FiltroGrupos.TabVisible:=True;

  //-----------------------------------------------------------------
  // Filtro de Aplicações dos Produtos ------------------------------
  //-----------------------------------------------------------------
  FrmBelShop.TS_FiltroAplicacao.TabVisible:=False;

  //-----------------------------------------------------------------
  // Filtro de Familia de Preços ------------------------------------
  //-----------------------------------------------------------------
  FrmBelShop.TS_FiltroFamiliaPreco.TabVisible:=False;

  //-----------------------------------------------------------------
  // Filtro de Grupos ST --------------------------------------------
  //-----------------------------------------------------------------
  FrmBelShop.TS_FiltroGrupoST.TabVisible:=False;

  //-----------------------------------------------------------------
  // Grupo de Comprovantes ------------------------------------------
  //-----------------------------------------------------------------
  FrmBelShop.TS_FiltroComprovantes.TabVisible:=False;

  //-----------------------------------------------------------------
  // Posiciona o PC_Filtros em seu Parent ---------------------------
  //-----------------------------------------------------------------
  FrmBelShop.PC_Filtros.Parent:=Ts_EstoquesFiltros;
  FrmBelShop.PC_Filtros.TabIndex:=0;
  FrmBelShop.PC_FiltrosChange(Self);
  //============================================================================
  // PageControl de Filtros - FIM ==============================================
  //============================================================================

  // Abre Filtros ==============================================================
  Ts_Estoques.TabVisible:=False;
  Ts_EstoquesFiltros.TabVisible:=True;
  PC_EstoquesPrincipalChange(Self);

  // Posociona na Coluna do Estoque Minimo =====================================
  THackDBGrid(Dbg_Estoques).LeftCol:=4;
  THackDBGrid(Dbg_Estoques).SelectedIndex:=3;
  Dbg_Estoques.Refresh;


end;

procedure TFrmEstoques.Dbg_EstoquesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
  sValor, sCodProd: String;
  b: Boolean;
  iIndex: Integer;
begin

  // Localizar Produto Código SIDICOM ==========================================
  If Key=Vk_F4 Then
  Begin
    If Not DMVirtual.CDS_V_Estoques.IsEmpty Then
    Begin
      iIndex:=DMVirtual.CDS_V_Estoques.RecNo;
      sValor:='';
      b:=True;
      While b do
      Begin
        If InputQuery('Localizar Produto (Cod Sidicom)','',sValor) then
         Begin
           Try
             StrToInt(sValor);
             sValor:=FormatFloat('000000',StrToInt(sValor));

             If Not DMVirtual.CDS_V_Estoques.Locate('COD_PRODUTO', sValor,[]) Then
             Begin
              If Not LocalizaRegistro(DMVirtual.CDS_V_Estoques, 'COD_PRODUTO', sValor) Then
               b:=False;
             End; // If Not DMVirtual.CDS_V_Estoques.Locate('COD_PRODUTO', sValor,[]) Then
             Break;
           Except
             If Not DMVirtual.CDS_V_Estoques.Locate('DES_PRODUTO', sValor,[]) Then
             Begin
               If Not LocalizaRegistro(DMVirtual.CDS_V_Estoques, 'DES_PRODUTO', sValor) Then
                b:=False;
             End; // If Not DMVirtual.CDS_V_Estoques.Locate('DES_PRODUTO', sValor,[]) Then
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
        DMVirtual.CDS_V_Estoques.RecNo:=iIndex;
        msg('Produto Não Localizado !!','A');
      End;
    End; // If Not DMVirtual.CDS_V_Estoques.IsEmpty Then
  End; // If Key=Vk_F4 Then

  // Localizar Produto Código LINX =============================================
  If Key=Vk_F3 Then
  Begin
    If Not DMVirtual.CDS_V_Estoques.IsEmpty Then
    Begin
      iIndex:=DMVirtual.CDS_V_Estoques.RecNo;
      sValor:='';
      b:=True;
      While b do
      Begin
        If InputQuery('Localizar Produto (Cod Linx)','',sValor) then
         Begin
           Try
             StrToInt(sValor);
             sValor:=FormatFloat('000000',StrToInt(sValor));

             // Busca Codigo Linx ------------------------
             sCodProd:=DMBelShop.LINX_BuscaCodigoSIDICOM(sValor);

             If Trim(sCodProd)<>'' Then
             Begin
               If Not DMVirtual.CDS_V_Estoques.Locate('COD_PRODUTO', sCodProd,[]) Then
               Begin
                If Not LocalizaRegistro(DMVirtual.CDS_V_Estoques, 'COD_PRODUTO', sCodProd) Then
                 b:=False;
               End; // If Not DMVirtual.CDS_V_Estoques.Locate('COD_PRODUTO', sValor,[]) Then
             End; // If Trim(sCodProd)<>'' Then
             Break;
           Except
             If Trim(sValor)<>'' Then
             Begin
               If Not DMVirtual.CDS_V_Estoques.Locate('DES_PRODUTO', sValor,[]) Then
               Begin
                 If Not LocalizaRegistro(DMVirtual.CDS_V_Estoques, 'DES_PRODUTO', sValor) Then
                  b:=False;
               End; // If Not DMVirtual.CDS_V_Estoques.Locate('DES_PRODUTO', sValor,[]) Then
             End; // If Trim(sValor)<>'' Then
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
        DMVirtual.CDS_V_Estoques.RecNo:=iIndex;
        msg('Produto Não Localizado !!','A');
      End;
    End; // If Not DMVirtual.CDS_V_Estoques.IsEmpty Then
  End; // If Key=Vk_F5 Then

end;

procedure TFrmEstoques.Dbg_EstoquesTitleClick(Column: TColumn);
begin
// Retirado em 28/04/2016 - Talves Volte
//--------------------------------------
//  If DMVirtual.CDS_V_Estoques.IsEmpty Then
//   Exit;
//
//  If Column.FieldName='IND_CURVA' Then
//  Begin
//    DMVirtual.CDS_V_Estoques.IndexName:='';
//    DMVirtual.CDS_V_Estoques.IndexName:='NovaORDEM';
//    DMVirtual.CDS_V_Estoques.First;
//    Exit;
//  End; // If Column.FieldName='IND_CURVA' Then
//
//  If (OrderGrid='') or (OrderGrid='Crescente') Then
//   Begin
//     OrderByGrid(DMVirtual.CDS_V_Estoques, Dbg_Estoques, Column.FieldName, False);
//     OrderGrid:='Decrescente';
//   End
//  Else
//   Begin
//     OrderByGrid(DMVirtual.CDS_V_Estoques, Dbg_Estoques, Column.FieldName, True);
//     OrderGrid:='Crescente';
//   End;
end;

procedure TFrmEstoques.Dbg_EstoquesColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  // Acerta Colunas Fixadas -----------------------------------------
  Dbg_EstoquesColEnter(Self);

end;

procedure TFrmEstoques.Dbg_EstoquesDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin

  If Not DMVirtual.CDS_V_Estoques.IsEmpty Then
  Begin
    if (THackDBGrid(Dbg_Estoques).SelectedIndex = 0) Or
       (THackDBGrid(Dbg_Estoques).SelectedIndex = 1) Or
       (THackDBGrid(Dbg_Estoques).SelectedIndex = 2) then
    begin
      THackDBGrid(Dbg_Estoques).FixedCols:=4;
      THackDBGrid(Dbg_Estoques).LeftCol:=4;
      THackDBGrid(Dbg_Estoques).SelectedIndex:=3;
      Dbg_Estoques.Refresh;
    end;
  End;

end;

procedure TFrmEstoques.Dbg_EstoquesKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  // Acerta Posição na Celula ================================================
  if (Key = VK_Left) and (THackDBGrid(Dbg_Estoques).SelectedIndex = 3) then
  Begin
    Key := VK_Clear;
    Dbg_Estoques.Refresh;
  End;

end;

procedure TFrmEstoques.Dbg_EstoquesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If DMVirtual.CDS_V_Estoques.IsEmpty Then
   Exit;

  If Dbg_Estoques.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] Then
  Begin
    // Cor da linha selecionada
    If Rect.Top = TStringGrid(Dbg_Estoques).CellRect(DataCol,TStringGrid(Dbg_Estoques).Row).Top Then
    Begin
      With Dbg_Estoques do
      Begin
        Canvas.FillRect(Rect);
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
        Canvas.Brush.Color:=clSkyBlue;
      End;
    End;

    If gdSelected in State Then
    Begin
      //Cor da Célula selecionada
      With Dbg_Estoques do
      Begin
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
        Canvas.Brush.Color:=clWhite;//  -->> Cor da Celula
        Canvas.Font.Color := clBlack;
      End;
    End;

    If (Column.FieldName='PER_MARGEM') Then // Este comando altera cor da Celula
    Begin
      If DMVirtual.CDS_V_EstoquesPER_MARGEM.AsCurrency<50.00 Then
      Begin
        Dbg_Estoques.Canvas.Font.Color:=clWhite; // Cor da Fonte
        Dbg_Estoques.Canvas.Brush.Color:=clRed;  // Cor da Celula
      End;
    End;

    Dbg_Estoques.Canvas.FillRect(Rect);
    Dbg_Estoques.DefaultDrawDataCell(Rect,Column.Field,State);

    Dbg_Estoques.Columns[9].ReadOnly:=False;
    Dbg_Estoques.Columns[10].ReadOnly:=False;

    DMVirtual.CDS_V_EstoquesDTA_INCLUSAO.Alignment:=taCenter;
    DMVirtual.CDS_V_EstoquesCODGRUPO.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesCODSUBGRUPO.Alignment:=taRightJustify;
  End;

end;

procedure TFrmEstoques.PopM_InformarLojaTrabalharClick(Sender: TObject);
Var
  MySql: String;

  cVlrAcum: Currency;

  i, iNumReg, iSeqProd: Integer;

  sDiasUteis, sGenProd, sGenOrdem: String;
  hHrInicio, hHrFim: String;
Begin

  // Fecha Demonstrativo =======================================================
  If Bt_EstoquesDemonstrativo.Caption='Fechar Demonstrativo' Then
   Bt_EstoquesDemonstrativoClick(Self);

  // Inicializa Client CDS_V_Estoques ==========================================
  If DMVirtual.CDS_V_Estoques.Active Then
  Begin
    DMVirtual.CDS_V_Estoques.Close;
    DMBelShop.CDS_EstoquePrevisao.Close;
  End;

  DMVirtual.CDS_V_Estoques.CreateDataSet;
  DMVirtual.CDS_V_Estoques.IndexName:='';
  DMVirtual.CDS_V_Estoques.Filtered:=False;
  DMVirtual.CDS_V_Estoques.Filter:='';
  DMVirtual.CDS_V_Estoques.EmptyDataSet;

  Dbg_Estoques.Columns[9].ReadOnly:=True;
  Dbg_Estoques.Columns[10].ReadOnly:=True;

  // Solicita Empresas =========================================================
  sgOutrasEmpresa:='(99)';
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False;

  FrmSelectEmpProcessamento.ShowModal;

  igNrEmpProc:=FrmSelectEmpProcessamento.iNrEmpProc;

  FreeAndNil(FrmSelectEmpProcessamento);

  // Verifica se Existe Empresa a Processar ====================================
  If DMBelShop.CDS_EmpProcessa.Eof Then
  Begin
    Dbg_Estoques.SetFocus;
    Exit;
  End;

  // Somente uma Loja ==========================================================
  If igNrEmpProc>1 Then
  Begin
    msg('É Permitido Somente uma Loja por Vez !!','A');
    Dbg_Estoques.SetFocus;
    Exit;
  End; // If igNrEmpProc>1 Then

  // Verifica se Existe Empresa a Processar ====================================
  sgCodEmp:='';
  Stb_Estoques.Panels[0].Text:='LOJA: Bel_??';
  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
    Begin
      sgCodEmp:=DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString;
      Stb_Estoques.Panels[0].Text:='LOJA: Bel_'+DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString+' - '+
                                                DMBelShop.CDS_EmpProcessaRAZAO_SOCIAL.AsString;
      Break;
    End; // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do

  If sgCodEmp='' Then
  Begin
    Dbg_Estoques.SetFocus;
    Exit;
  End; // If sgCodEmp='' Then

  OdirPanApres.Caption:='AGUARDE !! Localizando Produtos/Estoques/Demandas da Loja Bel_'+sgCodEmp;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmEstoques.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmEstoques.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  Screen.Cursor:=crAppStart;

  hHrInicio:='';
  hHrFim:='';
  hHrInicio:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

  // Quantidade de Registros ===================================================
  MySql:=' SELECT COUNT(fc.cod_produto) NumReg' +
         ' FROM ES_FINAN_CURVA_ABC fc'+
         ' WHERE fc.cod_loja='+QuotedStr(sgCodEmp);
  DMBelShop.SQLQ_Busca.Close;
  DMBelShop.SQLQ_Busca.SQL.Clear;
  DMBelShop.SQLQ_Busca.SQL.Add(MySql);
  DMBelShop.SQLQ_Busca.Open;

  If DMBelShop.SQLQ_Busca.IsEmpty Then
  Begin
    Screen.Cursor:=crDefault;
    DMBelShop.SQLQ_Busca.Close;
    msg('Sem Produto a Listar !!','A');
    Exit;
  End;

  iNumReg:=DMBelShop.SQLQ_Busca.FieldByName('NumReg').AsInteger;
  DMBelShop.SQLQ_Busca.Close;

  // Abre Transação para Sequence's ============================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);

  // Cria Sequence's ===========================================================
  sGenProd :='Gen_Prod'+'10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time);
  sGenOrdem:='Gen_Ordem'+'10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time);

  MySql:=' CREATE SEQUENCE '+sGenProd;
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  MySql:=' ALTER SEQUENCE '+sGenProd+' RESTART WITH 0';
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  MySql:=' CREATE SEQUENCE '+sGenOrdem;
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  MySql:=' ALTER SEQUENCE '+sGenOrdem+' RESTART WITH 0';
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  MySql:=' SELECT FIRST 1 COALESCE(d.Dias_Uteis, 0) Dias_Uteis'+
         ' FROM ES_DEMANDAS_4MESES d'+
         ' WHERE d.Dias_Uteis>0';
  DMBelShop.CDS_Busca1.Close;
  DMBelShop.SDS_Busca1.CommandText:=MySql;
  DMBelShop.CDS_Busca1.Open;
  sDiasUteis:='1';
  If Trim(DMBelShop.CDS_Busca1.FieldByName('Dias_Uteis').AsString)<>'' then
   sDiasUteis:=Trim(DMBelShop.CDS_Busca1.FieldByName('Dias_Uteis').AsString);
  DMBelShop.CDS_Busca1.Close;

  // Busca Movtos ==============================================================
  MySql:=' SELECT'+
         ' GEN_ID('+sGenProd+',1) SEQ,'+
         ' pr.codproduto COD_PRODUTO,'+
         ' TRIM(pr.apresentacao) DES_PRODUTO,'+
         ' TRIM(fc.ind_curva) IND_CURVA,'+

         ' CAST(COALESCE(e4.vlr_venda_m1,0.00) AS NUMERIC(12,2)) VLR_VD_M1,'+
         ' CAST(COALESCE(e4.vlr_venda_m2,0.00) AS NUMERIC(12,2)) VLR_VD_M2,'+
         ' CAST(COALESCE(e4.vlr_venda_m3,0.00) AS NUMERIC(12,2)) VLR_VD_M3,'+
         ' CAST(COALESCE(e4.vlr_venda_m4,0.00) AS NUMERIC(12,2)) VLR_VD_M4,'+
         ' CAST(COALESCE(e4.vlr_venda_m5,0.00) AS NUMERIC(12,2)) VLR_VD_M5,'+ //* Mes Corrente */

         ' COALESCE(CAST((COALESCE(e4.vlr_venda_m1,0.00)+'+
         '                COALESCE(e4.vlr_venda_m2,0.00)+'+
         '                COALESCE(e4.vlr_venda_m3,0.00)+'+
         '                COALESCE(e4.vlr_venda_m4,0.00))'+
         '          AS NUMERIC(12,2))'+
         ' ,0.00) VLR_VENDAS_4M,'+

         // ' CAST(COALESCE(e4.vlr_venda,0.00) AS NUMERIC(12,2)) VLR_VENDAS_4M,'+ //* Inclui Mes Corrente */

         ' COALESCE(CAST(((COALESCE(e4.vlr_venda_m1,0.00)+'+
         '                 COALESCE(e4.vlr_venda_m2,0.00)+'+
         '                 COALESCE(e4.vlr_venda_m3,0.00)+'+
         '                 COALESCE(e4.vlr_venda_m4,0.00))/4)'+
         '          AS NUMERIC(12,2))'+
         ' ,0.00) VLR_MEDIA_MES,'+

         ' COALESCE(CAST(((COALESCE(e4.vlr_venda_m1,0.00)+'+
         '                 COALESCE(e4.vlr_venda_m2,0.00)+'+
         '                 COALESCE(e4.vlr_venda_m3,0.00)+'+
         '                 COALESCE(e4.vlr_venda_m4,0.00)+'+
         '                 COALESCE(e4.vlr_venda_m5,0.00))/'+sDiasUteis+')'+
         '          AS NUMERIC(12,2))'+
         ' ,0.00) VLR_MEDIA_DIA,'+

         ' CAST(COALESCE(e4.qtd_venda_m1,0) AS INTEGER) QTD_VD_M1,'+
         ' CAST(COALESCE(e4.qtd_venda_m2,0) AS INTEGER) QTD_VD_M2,'+
         ' CAST(COALESCE(e4.qtd_venda_m3,0) AS INTEGER) QTD_VD_M3,'+
         ' CAST(COALESCE(e4.qtd_venda_m4,0) AS INTEGER) QTD_VD_M4,'+
         ' CAST(COALESCE(e4.qtd_venda_m5,0) AS INTEGER) QTD_VD_M5,'+

         ' COALESCE(CAST((COALESCE(e4.qtd_venda_m1,0)+'+
         '                COALESCE(e4.qtd_venda_m2,0)+'+
         '                COALESCE(e4.qtd_venda_m3,0)+'+
         '                COALESCE(e4.qtd_venda_m4,0))'+
         '           AS INTEGER)'+
         ' , 0) QTD_VENDAS_4M,'+

         ' COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.0000)+'+
         '                 COALESCE(e4.qtd_venda_m2,0.0000)+'+
         '                 COALESCE(e4.qtd_venda_m3,0.0000)+'+
         '                 COALESCE(e4.qtd_venda_m4,0.0000))/4)'+
         '          AS NUMERIC(12,4))'+
         ' , 0) QTD_MEDIA_MES,'+

         ' COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.0000)+'+
         '                 COALESCE(e4.qtd_venda_m2,0.0000)+'+
         '                 COALESCE(e4.qtd_venda_m3,0.0000)+'+
         '                 COALESCE(e4.qtd_venda_m4,0.0000)+'+
         '                 COALESCE(e4.qtd_venda_m5,0.0000))/'+sDiasUteis+')'+
         '         AS NUMERIC(12,4))'+
         ' , 0) QTD_MEDIA_DIA,'+

         ' CAST(CASE'+
         '       WHEN ((COALESCE(e4.qtd_venda,0)<=0) OR (COALESCE(e4.qtd_venda_dia,0)<=0)) THEN'+
         '         0'+
         '       ELSE'+
         '        (e4.qtd_venda_dia)*fc.num_dias_estocagem'+
         ' END AS INTEGER) QTD_ESTCAGEM_4M,'+ // Estocagem 4 meses

         ' CAST(COALESCE(fc.vlr_demandas,0.00) AS NUMERIC(12,2)) VLR_VENDAS_ANO,'+ //* Antigo VLR_DEMANDAS */
         ' CAST(COALESCE(fc.qtd_demandas,0) AS INTEGER) QTD_VENDAS_ANO,'+

         ' CAST(CASE'+
         '       WHEN ((COALESCE(fc.qtd_demandas,0)<=0) OR (COALESCE(fc.num_dias_uteis,0)=0)) THEN'+
         '         0'+
         '       ELSE'+
         '        (fc.qtd_demandas/fc.num_dias_uteis)*fc.num_dias_estocagem'+
         ' END AS INTEGER) QTD_ESTOCAGEM_ANO,'+ // Antigo QTD_DEMANDA

         ' COALESCE(fc.per_participacao,0.0000) PER_PARTICIPACAO,';

  MySqlSelect:=
         ' CAST(COALESCE(es.saldoatual,0) as INTEGER) QTD_ESTOQUE,'+
         ' CAST(COALESCE(fc.qtd_transito,0) as INTEGER) QTD_TRANSITO,'+
         ' CAST(COALESCE(es.saldoatual,0)+COALESCE(fc.qtd_transito,0) AS INTEGER) QTD_DISPONIVEL,'+

         ' CAST(COALESCE(fc.est_minimo,0) AS INTEGER) EST_IDEAL,'+
         ' CAST(COALESCE(fc.est_maximo,0) AS INTEGER) EST_MAXIMO,'+

         ' CAST(COALESCE(pr.precovenda,0.0000) AS NUMERIC(15,4)) PC_VENDA,'+
         ' CAST((COALESCE(es.saldoatual,0)+COALESCE(fc.qtd_transito,0)) * COALESCE(pr.precovenda,0.0000) AS NUMERIC(12,2)) VLR_DISP_PC_VENDA,'+
         ' CAST(COALESCE(es.saldoatual,0) * COALESCE(pr.precovenda,0.0000) AS NUMERIC(12,2)) VLR_EST_PC_VENDA,'+

         ' CAST(COALESCE(pr.precocompra,0.0000) AS NUMERIC(15,4)) PC_CUSTO,'+
         ' CAST((COALESCE(es.saldoatual,0)+COALESCE(fc.qtd_transito,0)) * COALESCE(pr.precocompra,0.0000) AS NUMERIC(12,2)) VLR_DISP_PC_CUSTO,'+
         ' CAST(COALESCE(es.saldoatual,0) * COALESCE(pr.precocompra,0.0000) AS NUMERIC(12,2)) VLR_EST_PC_CUSTO,'+

         // ' CAST((((COALESCE(pr.precovenda,0.00)/COALESCE(pr.precocompra,0.00))*100)-100) AS NUMERIC(12,4)) PER_MARGEM,'+
         '  CAST(COALESCE(pr.margem,0.0000) AS NUMERIC(12,4)) PER_MARGEM,'+

         ' pr.datainclusao DTA_INCLUSAO,'+
         ' TRIM(pr.codgrupo)     CODGRUPO,'+
         ' TRIM(pr.nomegrupo)    NOMEGRUPO,'+
         ' TRIM(pr.codsubgrupo)  CODSUBGRUPO,'+
         ' TRIM(pr.nomesubgrupo) NOMESUBGRUPO,'+
         ' TRIM(pr.codgruposub)  CODGRUPOSUB,'+

         ' CAST(LPAD('+
         '   CASE'+
         '      WHEN pr.situacaopro=0 THEN ''Ativo'''+
         '      WHEN pr.situacaopro=1 THEN ''Bloqueado'''+
         '      WHEN pr.situacaopro=2 THEN ''Excluido'''+
         '      WHEN pr.situacaopro=3 THEN ''Não Compra'''+
         '      WHEN pr.situacaopro=4 THEN ''Não Venda'''+
         '      ELSE ''Sem Informação'''+
         '   END'+
         '  ,20, '' '') AS VARCHAR(20)) IND_SITUACAO,'+

         ' TRIM(pr.principalfor) COD_FORNECEDOR,'+
         ' TRIM(pr.nomefornecedor) DES_FORNECEDOR,'+
         ' TRIM(fo.codcentrocusto) COD_COMPRADOR,'+
         ' TRIM(cp.nomesubcusto) DES_COMPRADOR,'+

         ' 0.00 VLR_VENDAS_ACUM,'+ // Não Usado
         ' GEN_ID('+sGenOrdem+',1)+12 ORDENAR,'+
         ' ''NAO'' ALTERACAO,'+
         ' 0.00 VLR_VENDAS_ACUM_OK,'+ // Não Usado
         ' COALESCE(fc.num_dias_uteis,0) NUM_DIASUTEIS,'+
         ' COALESCE('+sDiasUteis+',0)    DIAS_UTEIS_4M,'+
         ' 0 NUM_LINHA,'+

         // SOMA EST CURVAS - INICIO
         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''A'' Then'+
         '                  COALESCE(es.saldoatual,0)'+
         '               Else'+
         '                  0'+
         ' END AS INTEGER),0) EST_CurvaA,'+

         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''B'' Then'+
         '                  COALESCE(es.saldoatual,0)'+
         '               Else'+
         '                  0'+
         ' END AS INTEGER),0) EST_CurvaB,'+

         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''C'' Then'+
         '                  COALESCE(es.saldoatual,0)'+
         '               Else'+
         '                  0'+
         ' END AS INTEGER),0) EST_CurvaC,'+

         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''D'' Then'+
         '                 COALESCE(es.saldoatual,0)'+
         '               Else'+
         '                 0'+
         ' END AS INTEGER),0) EST_CurvaD,'+

         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''E'' Then'+
         '                 COALESCE(es.saldoatual,0)'+
         '               Else'+
         '                 0'+
         ' END AS INTEGER),0) EST_CurvaE,'+
         // SOMA EST CURVAS - FIM

         // SOMA EST CURVAS * PC - INICIO
         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''A'' Then'+
         '                 COALESCE(es.saldoatual,0) * COALESCE(pr.precocompra,0.0000)'+
         '               Else'+
         '                 0'+
         ' End AS NUMERIC(12,2)),2) EST_CurvaA_PC,'+

         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''B'' Then'+
         '                 COALESCE(es.saldoatual,0) * COALESCE(pr.precocompra,0.0000)'+
         '               Else'+
         '                 0'+
         ' End AS NUMERIC(12,2)),2) EST_CurvaB_PC,'+

         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''C'' Then'+
         '                 COALESCE(es.saldoatual,0) * COALESCE(pr.precocompra,0.0000)'+
         '               Else'+
         '                 0'+
         ' End AS NUMERIC(12,2)),2) EST_CurvaC_PC,'+

         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''D'' Then'+
         '                 COALESCE(es.saldoatual,0) * COALESCE(pr.precocompra,0.0000)'+
         '               Else'+
         '                 0'+
         ' End AS NUMERIC(12,2)),2) EST_CurvaD_PC,'+

         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''E'' Then'+
         '                 COALESCE(es.saldoatual,0) * COALESCE(pr.precocompra,0.0000)'+
         '               Else'+
         '                 0'+
         ' End AS NUMERIC(12,2)),2) EST_CurvaE_PC,'+
         // SOMA EST CURVAS * PC - FIM

         // SOMA EST CURVAS * PV - INICIO
         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''A'' Then'+
         '                 COALESCE(es.saldoatual,0) * COALESCE(pr.precovenda,0.0000)'+
         '               Else'+
         '                 0'+
         ' End AS NUMERIC(12,2)),2) EST_CurvaA_PV,'+

         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''B'' Then'+
         '                 COALESCE(es.saldoatual,0) * COALESCE(pr.precovenda,0.0000)'+
         '               Else'+
         '                 0'+
         ' End AS NUMERIC(12,2)),2) EST_CurvaB_PV,'+

         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''C'' Then'+
         '                 COALESCE(es.saldoatual,0) * COALESCE(pr.precovenda,0.0000)'+
         '               Else'+
         '                 0'+
         ' End AS NUMERIC(12,2)),2) EST_CurvaC_PV,'+

         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''D'' Then'+
         '                 COALESCE(es.saldoatual,0) * COALESCE(pr.precovenda,0.0000)'+
         '               Else'+
         '                 0'+
         ' End AS NUMERIC(12,2)),2) EST_CurvaD_PV,'+

         ' ROUND(CAST(CASE'+
         '               When fc.ind_curva=''E'' Then'+
         '                 COALESCE(es.saldoatual,0) * COALESCE(pr.precovenda,0.0000)'+
         '               Else'+
         '                 0'+
         ' End AS NUMERIC(12,2)),2) EST_CurvaE_PV,'+
         // SOMA EST CURVAS * PV - FIM

         // SOMA DM CURVAS - INICIO
         ' ROUND(CASE'+
         '          When fc.ind_curva=''A'' THEN'+
         '            COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m2,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m3,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m4,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m5,0.0000))/'+sDiasUteis+')'+
         '                     AS NUMERIC(12,2))'+
         '            , 0) *  fc.num_dias_estocagem'+
         '          Else'+
         '            0'+
         ' END,0) DM_CurvaA,'+

         ' ROUND(CASE'+
         '          When fc.ind_curva=''B'' THEN'+
         '            COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m2,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m3,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m4,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m5,0.0000))/'+sDiasUteis+')'+
         '                     AS NUMERIC(12,2))'+
         '            , 0) *  fc.num_dias_estocagem'+
         '          Else'+
         '            0'+
         ' END,0) DM_CurvaB,'+

         ' ROUND(CASE'+
         '          When fc.ind_curva=''C'' THEN'+
         '            COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m2,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m3,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m4,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m5,0.0000))/'+sDiasUteis+')'+
         '                     AS NUMERIC(12,2))'+
         '            , 0) *  fc.num_dias_estocagem'+
         '          Else'+
         '            0'+
         ' END,0) DM_CurvaC,'+

         ' ROUND(CASE'+
         '          When fc.ind_curva=''D'' THEN'+
         '            COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m2,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m3,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m4,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m5,0.0000))/'+sDiasUteis+')'+
         '                     AS NUMERIC(12,2))'+
         '            , 0) *  fc.num_dias_estocagem'+
         '          Else'+
         '            0'+
         ' END,0) DM_CurvaD,'+

         ' ROUND(CASE'+
         '          When fc.ind_curva=''E'' THEN'+
         '            COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m2,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m3,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m4,0.0000)+'+
         '                            COALESCE(e4.qtd_venda_m5,0.0000))/'+sDiasUteis+')'+
         '                     AS NUMERIC(12,2))'+
         '            , 0) *  fc.num_dias_estocagem'+
         '          Else'+
         '            0'+
         ' END,0) DM_CurvaE,';
         // SOMA DM CURVAS - INICIO

                  // SOMA DM CURVAS * PC - INICIO
  MySqlClausula1:=' ROUND(CASE'+
                  '          When fc.ind_curva=''A'' THEN'+
                  '            Round((COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m2,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m3,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m4,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m5,0.00))/'+sDiasUteis+')'+
                  '                            AS NUMERIC(12,2))'+
                  '                   , 0) *  fc.num_dias_estocagem),0) * COALESCE(pr.precocompra,0.00)'+
                  '          Else'+
                  '            0'+
                  ' END,2) DM_CurvaA_PC,'+

                  ' ROUND(CASE'+
                  '          When fc.ind_curva=''B'' THEN'+
                  '            Round((COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m2,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m3,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m4,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m5,0.00))/'+sDiasUteis+')'+
                  '                            AS NUMERIC(12,2))'+
                  '                   , 0) *  fc.num_dias_estocagem),0) * COALESCE(pr.precocompra,0.00)'+
                  '          Else'+
                  '            0'+
                  ' END,2) DM_CurvaB_PC,'+

                  ' ROUND(CASE'+
                  '          When fc.ind_curva=''C'' THEN'+
                  '            Round((COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m2,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m3,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m4,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m5,0.00))/'+sDiasUteis+')'+
                  '                            AS NUMERIC(12,2))'+
                  '                   , 0) *  fc.num_dias_estocagem),0) * COALESCE(pr.precocompra,0.00)'+
                  '          Else'+
                  '            0'+
                  ' END,2) DM_CurvaC_PC,'+

                  ' ROUND(CASE'+
                  '          When fc.ind_curva=''D'' THEN'+
                  '            Round((COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m2,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m3,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m4,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m5,0.00))/'+sDiasUteis+')'+
                  '                            AS NUMERIC(12,2))'+
                  '                   , 0) *  fc.num_dias_estocagem),0) * COALESCE(pr.precocompra,0.00)'+
                  '          Else'+
                  '            0'+
                  ' END,2) DM_CurvaD_PC,'+

                  ' ROUND(CASE'+
                  '          When fc.ind_curva=''E'' THEN'+
                  '            Round((COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m2,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m3,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m4,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m5,0.00))/'+sDiasUteis+')'+
                  '                            AS NUMERIC(12,2))'+
                  '                   , 0) *  fc.num_dias_estocagem),0) * COALESCE(pr.precocompra,0.00)'+
                  '          Else'+
                  '            0'+
                  ' END,2) DM_CurvaE_PC,'+
                  // SOMA DM CURVAS * PC - FIM

                  // SOMA DM CURVAS * PV - INICIO
                  ' ROUND(CASE'+
                  '          When fc.ind_curva=''A'' THEN'+
                  '            Round((COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m2,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m3,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m4,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m5,0.00))/'+sDiasUteis+')'+
                  '                            AS NUMERIC(12,2))'+
                  '                   , 0) *  fc.num_dias_estocagem),0) * COALESCE(pr.precovenda,0.00)'+
                  '          Else'+
                  '            0'+
                  ' END,2) DM_CurvaA_PV,'+

                  ' ROUND(CASE'+
                  '          When fc.ind_curva=''B'' THEN'+
                  '            Round((COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m2,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m3,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m4,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m5,0.00))/'+sDiasUteis+')'+
                  '                            AS NUMERIC(12,2))'+
                  '                   , 0) *  fc.num_dias_estocagem),0) * COALESCE(pr.precovenda,0.00)'+
                  '          Else'+
                  '            0'+
                  ' END,2) DM_CurvaB_PV,'+

                  ' ROUND(CASE'+
                  '          When fc.ind_curva=''C'' THEN'+
                  '            Round((COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m2,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m3,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m4,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m5,0.00))/'+sDiasUteis+')'+
                  '                            AS NUMERIC(12,2))'+
                  '                   , 0) *  fc.num_dias_estocagem),0) * COALESCE(pr.precovenda,0.00)'+
                  '          Else'+
                  '            0'+
                  ' END,2) DM_CurvaC_PV,'+

                  ' ROUND(CASE'+
                  '          When fc.ind_curva=''D'' THEN'+
                  '            Round((COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m2,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m3,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m4,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m5,0.00))/'+sDiasUteis+')'+
                  '                            AS NUMERIC(12,2))'+
                  '                   , 0) *  fc.num_dias_estocagem),0) * COALESCE(pr.precovenda,0.00)'+
                  '          Else'+
                  '            0'+
                  ' END,2) DM_CurvaD_PV,'+

                  ' ROUND(CASE'+
                  '          When fc.ind_curva=''E'' THEN'+
                  '            Round((COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m2,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m3,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m4,0.00)+'+
                  '                                   COALESCE(e4.qtd_venda_m5,0.00))/'+sDiasUteis+')'+
                  '                            AS NUMERIC(12,2))'+
                  '                   , 0) *  fc.num_dias_estocagem),0) * COALESCE(pr.precovenda,0.00)'+
                  '          Else'+
                  '            0'+
                  ' END,2) DM_CurvaE_PV';
                  // SOMA DM CURVAS * PV - FIM

  MySqlClausula2:=' FROM ES_FINAN_CURVA_ABC fc'+
                  '     LEFT JOIN PRODUTO pr             ON pr.codproduto=fc.cod_produto'+
                  '     LEFT JOIN ESTOQUE es             ON es.codfilial =fc.cod_loja'+  // QuotedStr(sgCodEmp)+
                  '                                     AND es.codproduto=fc.cod_produto'+
                  '     LEFT JOIN ES_DEMANDAS_4MESES e4  ON e4.codfilial =fc.cod_loja'+
                  '                                     AND e4.codproduto=fc.cod_produto'+
                  '     LEFT JOIN FORNECEDOR fo          ON fo.codfornecedor=pr.principalfor'+
                  '     LEFT JOIN CENTROCUSTO cp         ON cp.codcentrocusto=fo.codcentrocusto'+
                  '                                     AND cp.nomecusto=''COMPRAS'''+

                  ' WHERE fc.cod_loja='+QuotedStr(sgCodEmp);

                  // Situacao dos Produtos -----------------------------
                  If Cbx_EstoquesSituacaoProd.ItemIndex=0 Then
                   MySqlClausula2:=
                    MySqlClausula2+' AND Coalesce(pr.situacaopro,0)=0';

                  If Cbx_EstoquesSituacaoProd.ItemIndex=1 Then
                   MySqlClausula2:=
                    MySqlClausula2+' AND Coalesce(pr.situacaopro,3)=3';

                  If Cbx_EstoquesSituacaoProd.ItemIndex=2 Then
                   MySqlClausula2:=
                    MySqlClausula2+' AND Coalesce(pr.situacaopro,0) in (0,3)';

  MySqlClausula2:=
   MySqlClausula2+' AND   NOT ((pr.principalfor IN (''010000'', ''000300'', ''000500'', ''001072'', ''000883''))'+
                  '            OR'+
                  '            (pr.codaplicacao =''0016''))'+ // Brindes

                  ' ORDER BY fc.ind_curva, fc.per_participacao desc, fc.vlr_demandas desc';
  DMBelShop.CDS_SQLQ_Busca.close;
  DMBelShop.SQLQ_Busca.SQL.Clear;
  DMBelShop.SQLQ_Busca.SQL.Add(MySql+MySqlSelect+MySqlClausula1+MySqlClausula2);
  DMBelShop.CDS_SQLQ_Busca.Open;

  // Apresenta Produtos ========================================================
  DMVirtual.CDS_V_Estoques.Data:=DMBelShop.CDS_SQLQ_Busca.Data;
  DMBelShop.CDS_SQLQ_Busca.close;

  // Drop Sequence's ===========================================================
  MySql:=' DROP SEQUENCE '+sGenProd;
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  MySql:=' DROP SEQUENCE '+sGenOrdem;
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  // Rollback nas Sequence's ===================================================
  DMBelShop.SQLC.Rollback(TD);

  // Indexa DMVirtual.CDS_V_Estoques. ==========================================
  bgIndexCriado:=False;
  For i:=0 to DMVirtual.CDS_V_Estoques.IndexDefs.Count-1 do
  Begin
   if DMVirtual.CDS_V_Estoques.IndexDefs[i].Name='NovaORDEM' Then
   Begin
     bgIndexCriado:=True;
   End;
  End;

  If Not bgIndexCriado Then
  Begin
    With DMVirtual.CDS_V_Estoques.IndexDefs.AddIndexDef do
    Begin
      Name := 'NovaORDEM';
      Fields := 'ORDENAR';
      Options := [];
    End;
  End; // If Not bgIndexCriado Then
  DMVirtual.CDS_V_Estoques.IndexName:='';
  DMVirtual.CDS_V_Estoques.IndexName:='NovaORDEM';

  DMVirtual.CDS_V_Estoques.First;

  // Ajusta Coluna EST_IDEAL ===================================================
  DMVirtual.bSeProcessa1:=True;
  Dbg_Estoques.Columns[9].Font.Style:=[fsBold];
  Dbg_Estoques.Columns[9].ReadOnly:=False;
  Dbg_Estoques.Columns[10].Font.Style:=[fsBold];
  Dbg_Estoques.Columns[10].ReadOnly:=False;

  // Se Atualiza Valores de Estoques ===========================================
  DMVirtual.bSeProcessa2:=False;

  // Fecha Apresentações =======================================================
  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  Refresh;

  THackDBGrid(Dbg_Estoques).FixedCols:=4;
  THackDBGrid(Dbg_Estoques).SelectedIndex:=9;
  Dbg_Estoques.SetFocus;

  // Apresenta Estoques e Demanda Prevista =====================================
  DMVirtual.CDS_V_EstoquesAfterScroll(DMVirtual.CDS_V_Estoques);

  // APRESENTA O RESULTA DO TEMPO FINAL
  hHrFim:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
  msg('TEMPO: '+TimeToStr(StrToTime(hHrFim)-StrToTime(hHrInicio)),'A');


end;

procedure TFrmEstoques.PopM_EstoquesParametrosClick(Sender: TObject);
Var
  Mysql: String;

  iDiasEstA, iDiasEstB, iDiasEstC, iDiasEstD, iDiasEstE,
  iEstMinA,  iEstMinB,  iEstMinC,  iEstMinD,  iEstMinE: Integer;

  bOriginal: Boolean;
begin
  If Not bgInd_Admin Then
  Begin
    msg('Opção Somente para o'+cr+cr+'Administrador do Sistema !!','A');
    Exit;
  End;

  // Fecha Demonstrativo =======================================================
  If Bt_EstoquesDemonstrativo.Caption='Fechar Demonstrativo' Then
   Bt_EstoquesDemonstrativoClick(Self);

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);

  // Busca Valores da Curva ABC ================================================
  MySql:=' SELECT t.cod_aux Cod_Curva,'+
         ' Coalesce(t.des_aux,0) Per_Curva,'+
         ' Coalesce(t.vlr_aux,0) Qtd_Dias,'+
         ' Coalesce(t.vlr_aux1,0) Qtd_Min'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux=2'+
         ' ORDER BY t.cod_aux';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    Application.ProcessMessages;

    // Curva A
    If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='1' Then
    Begin
      FrmSolicitacoes.EdtParamCurvaALimite.Value   :=DMBelShop.CDS_BuscaRapida.FieldByName('Per_Curva').AsInteger;

      If bOriginal Then
       Begin
         FrmSolicitacoes.EdtParamCurvaADiasEst.Value  :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
         FrmSolicitacoes.EdtParamCurvaAEstMinino.Value:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;

         iDiasEstA:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
         iEstMinA :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;
       End
      Else
       Begin
         FrmSolicitacoes.EdtParamCurvaADiasEst.Value  :=igDiasEstA;
         FrmSolicitacoes.EdtParamCurvaAEstMinino.Value:=igEstMinA;

         iDiasEstA:=igDiasEstA;
         iEstMinA :=igEstMinA;
       End; // If bOriginal Then
    End; // If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='1' Then

    // Curva B
    If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='2' Then
    Begin
      FrmSolicitacoes.EdtParamCurvaBLimite.Value   :=DMBelShop.CDS_BuscaRapida.FieldByName('Per_Curva').AsInteger;

      If bOriginal Then
       Begin
         FrmSolicitacoes.EdtParamCurvaBDiasEst.Value  :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
         FrmSolicitacoes.EdtParamCurvaBEstMinino.Value:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;

         iDiasEstB:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
         iEstMinB :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;
       End
      Else
       Begin
         FrmSolicitacoes.EdtParamCurvaBDiasEst.Value  :=igDiasEstB;
         FrmSolicitacoes.EdtParamCurvaBEstMinino.Value:=igEstMinB;

         iDiasEstB:=igDiasEstB;
         iEstMinB :=igEstMinB;
       End; // If bOriginal Then
    End; // If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='2' Then

    // Curva C
    If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='3' Then
    Begin
      FrmSolicitacoes.EdtParamCurvaCLimite.Value   :=DMBelShop.CDS_BuscaRapida.FieldByName('Per_Curva').AsInteger;

      If bOriginal Then
       Begin
         FrmSolicitacoes.EdtParamCurvaCDiasEst.Value  :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
         FrmSolicitacoes.EdtParamCurvaCEstMinino.Value:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;

         iDiasEstC:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
         iEstMinC :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;
       End
      Else
       Begin
         FrmSolicitacoes.EdtParamCurvaCDiasEst.Value  :=igDiasEstC;
         FrmSolicitacoes.EdtParamCurvaCEstMinino.Value:=igEstMinC;

         iDiasEstC:=igDiasEstC;
         iEstMinC :=igEstMinC;
       End; // If bOriginal Then
    End; // If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='3' Then

    //Curva D
    If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='4' Then
    Begin
      FrmSolicitacoes.EdtParamCurvaDLimite.Value   :=DMBelShop.CDS_BuscaRapida.FieldByName('Per_Curva').AsInteger;

      If bOriginal Then
       Begin
         FrmSolicitacoes.EdtParamCurvaDDiasEst.Value  :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
         FrmSolicitacoes.EdtParamCurvaDEstMinino.Value:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;

         iDiasEstD:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
         iEstMinD :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;
       End
      Else
       Begin
         FrmSolicitacoes.EdtParamCurvaDDiasEst.Value  :=igDiasEstD;
         FrmSolicitacoes.EdtParamCurvaDEstMinino.Value:=igEstMinD;

         iDiasEstD:=igDiasEstD;
         iEstMinD :=igEstMinD;
       End; // If bOriginal Then
    End; // If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='4' Then

    // Curva E
    If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='5' Then
    Begin
      FrmSolicitacoes.EdtParamCurvaELimite.Value   :=DMBelShop.CDS_BuscaRapida.FieldByName('Per_Curva').AsInteger;

      If bOriginal Then
       Begin
         FrmSolicitacoes.EdtParamCurvaEDiasEst.Value  :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
         FrmSolicitacoes.EdtParamCurvaEEstMinino.Value:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;

         iDiasEstE:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
         iEstMinE :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;
       End
      Else
       Begin
         FrmSolicitacoes.EdtParamCurvaEDiasEst.Value  :=igDiasEstE;
         FrmSolicitacoes.EdtParamCurvaEEstMinino.Value:=igEstMinE;

         iDiasEstE:=igDiasEstE;
         iEstMinE :=igEstMinE;
       End; // If bOriginal Then
    End; // If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='5' Then

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.Close;

  // Monta FrmSolicitacoes =====================================================
  FrmBelShop.AbreSolicitacoes(19);

  FrmSolicitacoes.Caption:='Parâmetros';
  FrmSolicitacoes.Ts_QualquerCoisa.Caption:='Parametros de Estoque';

  FrmSolicitacoes.EdtParamCurvaALimite.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaALimite.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaBLimite.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaBLimite.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaCLimite.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaCLimite.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaDLimite.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaDLimite.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaELimite.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaELimite.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaADiasEst.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaADiasEst.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaBDiasEst.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaBDiasEst.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaCDiasEst.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaCDiasEst.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaDDiasEst.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaDDiasEst.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaEDiasEst.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaEDiasEst.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaAEstMinino.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaAEstMinino.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaBEstMinino.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaBEstMinino.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaCEstMinino.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaCEstMinino.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaDEstMinino.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaDEstMinino.Color:=$00E0E0E0;

  FrmSolicitacoes.EdtParamCurvaEEstMinino.Enabled:=False;
  FrmSolicitacoes.EdtParamCurvaEEstMinino.Color:=$00E0E0E0;

  FrmSolicitacoes.Ckb_ParamCurvaSelectA.Enabled:=False;
  FrmSolicitacoes.Ckb_ParamCurvaSelectB.Enabled:=False;
  FrmSolicitacoes.Ckb_ParamCurvaSelectC.Enabled:=False;
  FrmSolicitacoes.Ckb_ParamCurvaSelectD.Enabled:=False;
  FrmSolicitacoes.Ckb_ParamCurvaSelectE.Enabled:=False;

  FrmSolicitacoes.Bt_QualquerCoisaSalvar.Visible:=False;

  // Transfere Painel dos Parametros da Curva ABC para Form de Solicitações ====
  FrmSolicitacoes.Gb_ParamCurvaABCDados.Parent:=FrmSolicitacoes.Ts_QualquerCoisa;

  // Abre FrmSolicitacoes ======================================================
  FrmSolicitacoes.ShowModal;

  // Destroi FrmSolicitacoes ===================================================
  FreeAndNil(FrmSolicitacoes);

end;

procedure TFrmEstoques.PopM_EstoquesAlterarTodosEstMnimosClick(Sender: TObject);
Var
  sEstMinimo: String;
  b: Boolean;
  iIndex: Integer;
begin
  // Altera os Estoques Mínimos ================================================
  If DMVirtual.CDS_V_Estoques.IsEmpty Then
   Exit;

  If Trim(sgFiltros)='' Then
  Begin
    If msg('Todos os FORNECEDORES ESTÃO Selecionados ??'+cr+cr+'DESEJA CONTINUAR ??','C')=2 Then
     Exit;
  End;

  If Trim(sgFiltros)<>'' Then
  Begin
    If msg('Existe(m) FORNECEDOR(ES) Selecionados !!'+cr+cr+'DESEJA CONTINUAR ??','C')=2 Then
     Exit;
  End;

  If msg('Deseja Realmente Alterar O ESTOQUE Mínimo'+cr+cr+'DE TODOS OS PRODUTOS SELECIONADOS ??','C')=2 Then
   Exit;

  // Solicita o Estoque Mínimo =================================================
  sEstMinimo:='';
  b:=True;
  While b do
  Begin
    sEstMinimo:=InputBoxInteiro('Estoque Mínimo de Todos os Produtos Selecionados', 'Informe o Novo Est. Mínimo',sEstMinimo);

    If Trim(sEstMinimo)='' Then
     Exit;

    Try
      StrToInt(sEstMinimo);

      If msg('O NOVO Estoque Mínimo: '+sEstMinimo+cr+cr+'Esta CORRETO ??','C')=2 Then
       Exit;

      Break;
    Except
      Exit;
    End;
  End; // While b do

  // Altera Estoque Minimo =====================================================
  iIndex:=DMVirtual.CDS_V_Estoques.RecNo;

  DMVirtual.CDS_V_Estoques.First;
  DMVirtual.CDS_V_Estoques.DisableControls;
  While Not DMVirtual.CDS_V_Estoques.Eof do
  Begin
    Application.ProcessMessages;

    DMVirtual.CDS_V_Estoques.Edit;
    DMVirtual.CDS_V_EstoquesEST_IDEAL.AsInteger:=StrToInt(sEstMinimo);
    DMVirtual.CDS_V_Estoques.Post;

    DMVirtual.CDS_V_Estoques.Next;
  End; // While Not DMVirtual.CDS_V_Estoques.Eof do

  DMVirtual.CDS_V_Estoques.EnableControls;
  DMVirtual.CDS_V_Estoques.RecNo:=iIndex;

  THackDBGrid(Dbg_Estoques).FixedCols:=4;
  Dbg_Estoques.SetFocus;

end;

procedure TFrmEstoques.PopM_EstoquesReplicarEstMinLojasClick(Sender: TObject);
Var
  MySql: String;
begin
  // Altera os Estoques Mínimos em Outras Lojas ================================
  If DMVirtual.CDS_V_Estoques.IsEmpty Then
   Exit;

  If Trim(sgFiltros)='' Then
  Begin
    If msg('Todos os FORNECEDORES ESTÃO Selecionados ??'+cr+cr+'DESEJA CONTINUAR ??','C')=2 Then
     Exit;
  End;

  If Application.MessageBox('Deseja REALMENTE Replicar'+cr+cr+'TODOS OS ESTOQUE MínimoS'+cr+cr+'do FILTRO Selecionado para'+cr+cr+'Outra(s) Loja(s) ??', 'ATENÇÃO !!', 292) = Idno Then
   Exit;

  sgOutrasEmpresa:='(99)';
  sgEmpresaNao:='('+sgCodEmp+')';
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False;
  FrmSelectEmpProcessamento.Gb_SelectEmpProc.Caption:='SELECIONE AS LOJAS A REPLICAR OS ESTOQUES MínimoS';

  FrmSelectEmpProcessamento.ShowModal;

  igNrEmpProc:=FrmSelectEmpProcessamento.iNrEmpProc;

  FreeAndNil(FrmSelectEmpProcessamento);

  If igNrEmpProc<1 Then
  Begin
    msg('Sem Loja Selecionada !!','A');
    Dbg_Estoques.SetFocus;
    Exit;
  End; // If igNrEmpProc<1 Then

  // Verifica se Existe Empresa a Processar ====================================
  sgCodLojas:='';
  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
    Begin
      If sgCodLojas='' Then
       sgCodLojas:=QuotedStr(DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString)
      Else
       sgCodLojas:=sgCodLojas+', '+QuotedStr(DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString);
    End; // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do

  If Application.MessageBox(pChar('Deseja REALMENTE Replicar'+cr+cr+'TODOS OS ESTOQUE MínimoS'+cr+cr+'do FILTRO Selecionado para'+cr+cr+'a(s) Loja(s):'+cr+cr+sgCodLojas+cr+cr+' ?????????'), 'ATENÇÃO !!', 292) = Idno Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Replicando Estoques Mínimo...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmEstoques.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmEstoques.Height-OdirPanApres.Height)/2))-20;
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

    DMVirtual.CDS_V_Estoques.First;

    FrmBelShop.MontaProgressBar(True, FrmEstoques);
    pgProgBar.Properties.Max:=DMVirtual.CDS_V_Estoques.RecordCount;
    pgProgBar.Position:=0;

    While Not DMVirtual.CDS_V_Estoques.Eof do
    Begin
      Application.ProcessMessages;
      
      MySql:=' UPDATE ES_FINAN_CURVA_ABC e'+
             ' SET e.est_minimo='+DMVirtual.CDS_V_EstoquesEST_IDEAL.AsString+
             ', e.USU_ALTERA='+QuotedStr(Cod_Usuario)+
             ', e.DTA_ALTERA=current_timestamp'+
             ' WHERE e.cod_produto='+QuotedStr(DMVirtual.CDS_V_EstoquesCOD_PRODUTO.AsString)+
             ' AND   e.cod_loja IN ('+sgCodLojas+')';
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      pgProgBar.Position:=DMVirtual.CDS_V_Estoques.RecNo;

      DMVirtual.CDS_V_Estoques.Next;
    End; // While Not DMVirtual.CDS_V_Estoques.Eof do
    FrmBelShop.MontaProgressBar(False, FrmEstoques);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

    msg('Estoque(s) Minimo(s) Replicado(s) com SUCESSO'+cr+'para a(s) Loja(s): '+cr+sgCodLojas,'A');
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;
      FrmBelShop.MontaProgressBar(False, FrmEstoques);

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

  sgCodLojas:='';
  DMVirtual.CDS_V_Estoques.First;
  THackDBGrid(Dbg_Estoques).FixedCols:=4;
  Dbg_Estoques.SetFocus;

end;

procedure TFrmEstoques.Bt_OdirClick(Sender: TObject);
Var
  mMemo: TMemo;
begin
  Dbg_Estoques.SetFocus;

  If msg('CONTINUAR ??','C')=2 Then
   Exit;

  If AnsiUpperCase(Des_Login)<>'ODIR' Then
   EXIT;

  // Cria Componente Memo ======================================================
  mMemo:=TMemo.Create(Self);
  mMemo.Visible:=True;
  mMemo.Parent:=FrmEstoques;
  mMemo.Height:=410;
  mMemo.Left:=32;
  mMemo.Width:=920;
  mMemo.Top:=96;
  mMemo.Anchors:=[akLeft,akTop,akRight,akBottom];
  mMemo.Lines.Clear;

  ShowMessage('0');

  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:='SELECT * FROM ES_FINAN_CURVA_ABC e ORDER BY e.cod_loja, e.cod_produto';
  DMBelShop.CDS_Busca.Open;

  Bt_Odir.Caption:=IntToStr(DMBelShop.CDS_Busca.RecordCount);

  sgCodigo:='';
  sgDescricao:='';
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    Application.ProcessMessages;

    sgDescricao:=DMBelShop.CDS_Busca.FieldByName('cod_loja').AsString+' - '+
                 DMBelShop.CDS_Busca.FieldByName('cod_produto').AsString;

    If sgCodigo=sgDescricao Then
     mMemo.Lines.Add(sgCodigo);

    sgCodigo:=DMBelShop.CDS_Busca.FieldByName('cod_loja').AsString+' - '+
              DMBelShop.CDS_Busca.FieldByName('cod_produto').AsString;

    Bt_Odir.Caption:=IntToStr(DMBelShop.CDS_Busca.RecordCount)+' - '+IntToStr(DMBelShop.CDS_Busca.RecNo);
    DMBelShop.CDS_Busca.Next;
  end;
  DMBelShop.CDS_Busca.Close;
  FreeAndNil(mMemo);

end;

procedure TFrmEstoques.Bt_EstoquesFiltroCompradorClick(Sender: TObject);
Var
  sFiltroComp, MySql: String;
begin

  If DMVirtual.CDS_V_Estoques.IsEmpty Then
   Exit;

  If Bt_EstoquesFiltroComprador.Caption='Salvar em Memória' Then
  Begin
    Dbg_EstoquesDemFinan.SetFocus;
    DBGridClipboard(Dbg_EstoquesDemFinan);
    Exit;
  End;

  Dbg_Estoques.SetFocus;

  If Trim(sgFiltros)<>'' Then
  Begin
    If msg('Existe Filtro Anterior !!'+cr+cr+'DESEJA RETIRÁ-LO ??','C')=1 Then
     sgFiltros:='';
  End;

  // Seleciona Comprador =======================================================
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmBelShop.AbreSolicitacoes(18);

  sgCompradores:='';

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
  FrmSolicitacoes.bgOK:=False;
  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  // Monta Filtro ==============================================================
  OdirPanApres.Caption:='AGUARDE !! Analisando Filtro Compradores...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmEstoques.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmEstoques.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;
  Screen.Cursor:=crAppStart;

  If bgProcessar Then
  Begin
    sFiltroComp:='';
    DMBelShop.CDS_Busca.First;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then
      Begin
        If Trim(sFiltroComp)='' Then
        Begin
          sFiltroComp:='COD_COMPRADOR='+QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('Codigo').AsString));
          sgCompradores:=Trim(DMBelShop.CDS_Busca.FieldByName('Comprador').AsString);
        End
        Else
        Begin
          sFiltroComp:=sFiltroComp+' OR COD_COMPRADOR='+QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('Codigo').AsString));
          sgCompradores:=sgCompradores+' / '+Trim(DMBelShop.CDS_Busca.FieldByName('Comprador').AsString);
        End;
      End;

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    DMVirtual.CDS_V_Estoques.DisableControls;
    DMVirtual.CDS_V_Estoques.Close;
    DMBelShop.CDS_EstoquePrevisao.Close;

    DMVirtual.CDS_V_Estoques.Filtered:=False;
    DMVirtual.CDS_V_Estoques.Filter:='';

    If (Trim(sgFiltros)<>'') And (Trim(sFiltroComp)<>'') Then
     DMVirtual.CDS_V_Estoques.Filter:=sgFiltros+' AND ('+sFiltroComp+')'

    Else If (Trim(sgFiltros)='') And (Trim(sFiltroComp)<>'') Then
     DMVirtual.CDS_V_Estoques.Filter:=sFiltroComp

    Else
     DMVirtual.CDS_V_Estoques.Filter:=sgFiltros;

    DMVirtual.CDS_V_Estoques.Filtered:=True;

    Recalculo_V_Estoques_Aggregates;
    DMVirtual.CDS_V_Estoques.Open;
    DMBelShop.CDS_EstoquePrevisao.Open;
    DMVirtual.CDS_V_Estoques.EnableControls;

    If DMVirtual.CDS_V_Estoques.IsEmpty Then
    Begin
      msg('Sem Produto a Listar !!'+cr+cr+'Filtro Será Retirado !!','A');
      DMVirtual.CDS_V_Estoques.Close;
      DMBelShop.CDS_EstoquePrevisao.Close;

      DMVirtual.CDS_V_Estoques.Filter:='';
      DMVirtual.CDS_V_Estoques.Filtered:=False;
      Recalculo_V_Estoques_Aggregates;
      DMVirtual.CDS_V_Estoques.Open;
      DMBelShop.CDS_EstoquePrevisao.Open;
    End;
  End; // If FrmSolicitacoes.bgOK Then

  If DMBelShop.CDS_Busca.Active Then
   DMBelShop.CDS_Busca.Close;

  FreeAndNil(FrmSolicitacoes);

  THackDBGrid(Dbg_Estoques).FixedCols:=4;
  Dbg_EstoquesColEnter(Self);
  Dbg_Estoques.SetFocus;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

end;

end.
