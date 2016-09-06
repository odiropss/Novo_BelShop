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
  JvExComCtrls, JvAnimate, JvButton, JvTransparentButton, DBCtrls, cxDBEdit;

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
    DBE_EstoquesTOT1: TDBEdit;
    DBE_EstoquesTOT2: TDBEdit;
    Label2: TLabel;
    Lab_EstoquesVlrTotAno: TLabel;
    Label3: TLabel;
    Lab_EstoquesVlrTot4Meses: TLabel;
    Bt_EstoquesDemonstrativo: TJvXPButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_EstoquesFecharClick(Sender: TObject);
    procedure PC_EstoquesPrincipalChange(Sender: TObject);

    // Odir ====================================================================
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente

    Procedure MontaFiltros(sTipo: String);
                        // sTipo=EST - Controle de Estoques

    Procedure HabilitaComponentes(bLib: Boolean);
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
    procedure DBE_EstoquesTOT1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
   THackDBGrid = class(TDBGrid);

var
  FrmEstoques: TFrmEstoques;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;

  bgSairEstoques: Boolean;

  bgIndexCriado: Boolean;
  sgFiltros: String;

  // Guarda Valores Digitados no Parametros da Curva ABC
  igDiasEstA, igDiasEstB, igDiasEstC, igDiasEstD, igDiasEstE,
  igEstMinA, igEstMinB, igEstMinC, igEstMinD, igEstMinE: Integer;

implementation

uses DK_Procs1, UDMBelShop, UDMVirtual, UFrmBelShop, UFrmSelectEmpProcessamento,
     UFrmSolicitacoes;

{$R *.dfm}

//==============================================================================
// Odir - INICIO ===============================================================
//==============================================================================

// Habilita/ Desbilita Componentes /////////////////////////////////////////////
Procedure TFrmEstoques.HabilitaComponentes(bLib: Boolean);
Begin
  Pan_Estoques.Enabled:=bLib;
  Dbg_Estoques.Enabled:=bLib;
  Bt_EstoquesFiltros.Enabled:=bLib;
  Bt_EstoquesFechar.Enabled:=bLib;
End;

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
Procedure TFrmEstoques.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>

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

     DMVirtual.CDS_V_Estoques.Close;
     DMVirtual.CDS_V_EstoquesFinan.Close;
   End
  Else
   Begin
     PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
     msg('Para Fechar Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;
end;

procedure TFrmEstoques.FormCreate(Sender: TObject);
const  
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Balão
  CreateToolTips(Self.Handle);
  AddToolTip(Pan_EstoquesProdNovo.Handle, @ti, TipoDoIcone, 'Cadastrado a'+#13+'MENOS de um MÊS !!', 'PRODUTO NOVO !!');

  OrderGrid:='';
  bEnterTab:=True;

  Bt_EstoquesDemonstrativo.Visible:=False;
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

// OdirApagar ??????
//  DMBelShop.CDS_CurvaFinanceira.EnableControls;
//  DMBelShop.CDS_CurvaFinanceira.Close;

//OdirAqui Demonstrativo Desabilitado
//  // Fecha Demonstrativo =======================================================
//  If Bt_EstoquesDemonstrativo.Caption='Fechar Demonstrativo' Then
//   Bt_EstoquesDemonstrativoClick(Self);

  bgSairEstoques:=True;

  FrmBelShop.PC_Filtros.Parent:=FrmBelShop.Ts_Filtros;

  Close;

end;

procedure TFrmEstoques.PC_EstoquesPrincipalChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_EstoquesPrincipal);

  If (PC_EstoquesPrincipal.ActivePage=Ts_Estoques) And (Ts_Estoques.CanFocus) Then
   Dbg_Estoques.SetFocus;

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
  i: integer;
begin

  If DMVirtual.CDS_V_Estoques.IsEmpty Then
   Exit;

  If Bt_EstoquesDemonstrativo.Caption='Abrir Demonstrativo' Then
   Begin
     HabilitaComponentes(False);

     Bt_EstoquesDemonstrativo.Caption:='Fechar Demonstrativo';

     OdirPanApres.Caption:='AGUARDE 20 Segundos !! Calculando Financeiro da Loja Bel_'+sgCodEmp;
     OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
     OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmEstoques.Width-OdirPanApres.Width)/2));
     OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmEstoques.Height-OdirPanApres.Height)/2))-20;
     OdirPanApres.BringToFront();
     OdirPanApres.Visible:=True;
     Refresh;

     MySql:=' SELECT fc.ind_curva,'+
            ' COUNT(fc.cod_produto) QtdItens,'+
            ' Cast(SUM((es.saldoatual+fc.qtd_transito)*lp.precovenda) as Numeric(12,2)) Vlr_Estoque_PV,'+
            ' Cast(SUM(fc.qtd_demandas*lp.precovenda) as Numeric(12,2)) Vlr_Demanda_PV,'+
            ' (((cast(count(fc.cod_produto) as Numeric(12,2))-'+
            '                         Sum(case'+
            '                           When ((fc.qtd_transito+es.saldoatual<=0) and (fc.est_minimo>0)) Then'+
            '                             1'+
            '                         end))/cast(count(fc.cod_produto) as Numeric(12,2)))*100) Nivel_Servico'+
            ' FROM ES_FINAN_CURVA_ABC fc, ESTOQUE es, LISTAPRE lp, PRODUTO pr'+
            ' WHERE fc.cod_produto=es.codproduto'+
            ' AND   fc.cod_produto=lp.codproduto'+
            ' AND   fc.cod_loja=es.codfilial'+
            ' AND   fc.cod_produto=pr.codproduto'+
            ' AND   fc.cod_loja='+sgCodEmp+
            ' AND   lp.codlista='+QuotedStr(FormatFloat('0000',StrToInt(sgCodListaPrePadrao)));

            If Trim(sgGrupos)<>'' Then
             MySql:=
              MySql+' AND '+sgGrupos;

            // Fornecedores --------------------------------------------
            If Trim(sgFornecedores)<>'' Then
             MySql:=
              MySql+' AND pr.principalfor in ('+sgFornecedores+')';

            MySql:=
             MySql+' GROUP BY fc.ind_curva';
     DMBelShop.SQLQuery1.Close;
     DMBelShop.SQLQuery1.SQL.Clear;
     DMBelShop.SQLQuery1.SQL.Add(MySql);
     DMBelShop.SQLQuery1.Open;

     //=========================================================================
     // Cria Client Estoque Financeiro =========================================
     //=========================================================================
     If DMVirtual.CDS_V_EstoquesFinan.Active Then
      DMVirtual.CDS_V_EstoquesFinan.Close;
     DMVirtual.CDS_V_EstoquesFinan.CreateDataSet;
     DMVirtual.CDS_V_EstoquesFinan.EmptyDataSet;

     DMVirtual.CDS_V_EstoquesFinan.Open;

     DMBelShop.SQLQuery1.DisableControls;
     DMVirtual.CDS_V_EstoquesFinan.DisableControls;
     While Not DMBelShop.SQLQuery1.Eof do
     Begin
       DMVirtual.CDS_V_EstoquesFinan.Append;
       DMVirtual.CDS_V_EstoquesFinanIND_CURVA.AsString:=
                          DMBelShop.SQLQuery1.FieldByName('Ind_Curva').AsString;
       DMVirtual.CDS_V_EstoquesFinanQTD_ITENS.AsString:=
                           DMBelShop.SQLQuery1.FieldByName('QtdItens').AsString;
       DMVirtual.CDS_V_EstoquesFinanVLR_ESTOQUE_PV.AsString:=
                     DMBelShop.SQLQuery1.FieldByName('Vlr_Estoque_PV').AsString;
       DMVirtual.CDS_V_EstoquesFinanVLR_DEMANDA_PV.AsString:=
                     DMBelShop.SQLQuery1.FieldByName('Vlr_Demanda_PV').AsString;
       DMVirtual.CDS_V_EstoquesFinanPER_NIVELSERVICO.AsString:=
                     DMBelShop.SQLQuery1.FieldByName('Nivel_Servico').AsString;
       DMVirtual.CDS_V_EstoquesFinan.Post;

       DMBelShop.SQLQuery1.Next;
     End; // While Not DMBelShop.SQLQuery1.Eof do
     DMVirtual.CDS_V_EstoquesFinan.First;
     DMBelShop.SQLQuery1.EnableControls;
     DMVirtual.CDS_V_EstoquesFinan.EnableControls;
     OdirPanApres.Visible:=False;

     FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
     FrmSolicitacoes.AutoSize:=True;
     FrmSolicitacoes.BorderStyle:=bsSingle;
     FrmSolicitacoes.Pan_QualquerCoisa.Visible:=False;

     Dbg_EstoquesDemFinan.Parent:=FrmSolicitacoes.Ts_QualquerCoisa;
     Dbg_EstoquesDemFinan.Top:=104;
     Dbg_EstoquesDemFinan.Left:=63;
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
     Bt_EstoquesDemonstrativo.Caption:='Abrir Demonstrativo';

     FrmSolicitacoes.Close;

     Dbg_EstoquesDemFinan.Visible:=False;
     Dbg_EstoquesDemFinan.Parent:=Ts_Estoques;

     FreeAndNil(FrmSolicitacoes);

     Dbg_Estoques.SetFocus;
   End;
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
    If Trim(DMVirtual.CDS_V_EstoquesFinanIND_CURVA.AsString)='TOTAIS' Then
    Begin
      Dbg_EstoquesDemFinan.Canvas.Brush.Color:=clSkyBlue;
      Dbg_EstoquesDemFinan.Canvas.Font.Style:=[fsBold];
    End;
    Dbg_EstoquesDemFinan.Canvas.FillRect(Rect);
    Dbg_EstoquesDemFinan.DefaultDrawDataCell(Rect,Column.Field,state);
  End;
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
  cVlrVendaAcum: Currency;
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
//odirapagar
//    Dbg_Estoques.Columns[11].ReadOnly:=True;
    Dbg_Estoques.Columns[4].ReadOnly:=True;

//odirapagar - 02/09/2016
//    FrmBelShop.MontaProgressBar(True, FrmEstoques);
//    pgProgBar.Properties.Max:=DMVirtual.CDS_V_Estoques.RecordCount;
//    pgProgBar.Position:=0;
//
//    DMVirtual.CDS_V_Estoques.First;
//    DMVirtual.CDS_V_Estoques.DisableControls;
//    While Not DMVirtual.CDS_V_Estoques.Eof do
//    Begin
//      Application.ProcessMessages;
//
//      pgProgBar.Position:=DMVirtual.CDS_V_Estoques.RecNo;
//
//      DMVirtual.CDS_V_Estoques.Edit;
//      DMVirtual.CDS_V_EstoquesVLR_VENDAS_ACUM.AsCurrency:=DMVirtual.CDS_V_EstoquesVLR_VENDAS_ACUM_OK.AsCurrency;
//      DMVirtual.CDS_V_EstoquesVLR_VENDAS_ACUM_OK.AsCurrency:=0;
//      DMVirtual.CDS_V_Estoques.Post;
//
//      DMVirtual.CDS_V_Estoques.Next;
//    End; // While Not DMVirtual.CDS_V_Estoques.Eof do
//    DMVirtual.CDS_V_Estoques.EnableControls;
//    DMVirtual.CDS_V_Estoques.First;
//
//    FrmBelShop.MontaProgressBar(False, FrmEstoques);

//odirapagar
//    Dbg_Estoques.Columns[11].ReadOnly:=False;
    Dbg_Estoques.Columns[4].ReadOnly:=False;

    DMVirtual.CDS_V_Estoques.IndexName:='';
    DMVirtual.CDS_V_Estoques.IndexName:='NovaORDEM';
  End; // If bOriginal Then

  // Monta o Filtro ============================================================
  MontaFiltros('EST');

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
//odirapagar
//    Dbg_Estoques.Columns[11].ReadOnly:=True;
    Dbg_Estoques.Columns[4].ReadOnly:=True;

//odirapagar - 02/09/2016
//    cVlrVendaAcum:=0;
//
//    FrmBelShop.MontaProgressBar(True, FrmEstoques);
//    pgProgBar.Properties.Max:=DMVirtual.CDS_V_Estoques.RecordCount;
//    pgProgBar.Position:=0;
//
//    DMVirtual.CDS_V_Estoques.First;
//    DMVirtual.CDS_V_Estoques.DisableControls;
//    While Not DMVirtual.CDS_V_Estoques.Eof do
//    Begin
//      Application.ProcessMessages;
//
//      pgProgBar.Position:=DMVirtual.CDS_V_Estoques.RecNo;
//
//      DMVirtual.CDS_V_Estoques.Edit;
//      cVlrVendaAcum:=cVlrVendaAcum+DMVirtual.CDS_V_EstoquesVLR_DEMANDAS.AsCurrency;
//      DMVirtual.CDS_V_EstoquesVLR_VENDAS_ACUM_OK.AsCurrency:=DMVirtual.CDS_V_EstoquesVLR_VENDAS_ACUM.AsCurrency;
//      DMVirtual.CDS_V_EstoquesVLR_VENDAS_ACUM.AsCurrency:=cVlrVendaAcum;
//      DMVirtual.CDS_V_Estoques.Post;
//
//      DMVirtual.CDS_V_Estoques.Next;
//    End; // While Not DMVirtual.CDS_V_Estoques.Eof do
//    DMVirtual.CDS_V_Estoques.EnableControls;
//    DMVirtual.CDS_V_Estoques.First;
//
//    FrmBelShop.MontaProgressBar(False, FrmEstoques);

//odirapagar
//    Dbg_Estoques.Columns[11].ReadOnly:=False;
    Dbg_Estoques.Columns[4].ReadOnly:=False;

    DMVirtual.CDS_V_Estoques.IndexName:='';
    DMVirtual.CDS_V_Estoques.IndexName:='NovaORDEM';
  End; // If Not bOriginal Then

  // Recalcula Campos Aggregates ===============================================
  DMVirtual.CDS_V_Estoques.Close;
  DMVirtual.CDS_V_EstoquesVLR_TOT_VENDAS_ANO.Active:=False;
  DMVirtual.CDS_V_EstoquesVLR_TOT_VENDAS_ANO.Active:=True;
  DMVirtual.CDS_V_EstoquesVLR_TOT_VENDAS_4M.Active:=False;
  DMVirtual.CDS_V_EstoquesVLR_TOT_VENDAS_4M.Active:=True;
  DMVirtual.CDS_V_Estoques.Open;

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
  If DMVirtual.CDS_V_Estoques.IsEmpty Then
   Exit;

//odirapagar - 02/09/2016   
//  If (sgFiltros='') And (DMVirtual.CDS_V_Estoques.IsEmpty) Then
//   Exit;

//OdirAqui Demonstrativo Desabilitado
//  // Fecha Demonstrativo =======================================================
//  If Bt_EstoquesDemonstrativo.Caption='Fechar Demonstrativo' Then
//   Bt_EstoquesDemonstrativoClick(Self);

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
  FrmBelShop.Gb_CalculoFiltroNome.Visible:=False;
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
  sValor: String;
  b: Boolean;
  iIndex: Integer;
begin

  // Localizar Produto =========================================================
  If Key=Vk_F4 Then
  Begin
    If Not DMVirtual.CDS_V_Estoques.IsEmpty Then
    Begin
      iIndex:=DMVirtual.CDS_V_Estoques.RecNo;
      sValor:='';
      b:=True;
      While b do
      Begin
        If InputQuery('Localizar Produto','',sValor) then
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
  // Acerta Posicição na Celula ================================================
  if (Key = VK_Left) and (THackDBGrid(Dbg_Estoques).SelectedIndex = 3) then
  Begin
    Key := VK_Clear;
    Dbg_Estoques.Refresh;
  End;

end;

procedure TFrmEstoques.Dbg_EstoquesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If Dbg_Estoques.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] Then
  Begin
    //Cor da linha selecionada
    If Rect.Top = TStringGrid(Dbg_Estoques).CellRect(DataCol,TStringGrid(Dbg_Estoques).Row).Top Then
    Begin
      With Dbg_Estoques do
      Begin
        Canvas.FillRect(Rect);
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
        Canvas.Brush.Color:=clSkyBlue;
        DefaultDrawDataCell(Rect,Column.Field,State)
      End;
    End;

    If gdSelected in State Then
    Begin
      //Cor da célula selecionada
      With Dbg_Estoques do
      Begin
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
        Canvas.Brush.Color:=clWhite;//  -->> Cor da Celula
        Canvas.Font.Color := clBlack;
        Canvas.FillRect(Rect);
        DefaultDrawDataCell(Rect,Column.Field,State)
      End;
    End;
    Dbg_Estoques.Columns[4].ReadOnly:=False;
    DMVirtual.CDS_V_EstoquesDTA_INCLUSAO.Alignment:=taCenter;
    DMVirtual.CDS_V_EstoquesCODGRUPO.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesCODSUBGRUPO.Alignment:=taRightJustify;
  End;

end;

procedure TFrmEstoques.PopM_InformarLojaTrabalharClick(Sender: TObject);
Var
  MySql: String;
  cVlrAcum: Currency;
  i, iNumReg,
  iSeqProd: Integer;

  //OdirApagar - 02/09/2016
  //, iSeqOrdem: Integer;
  sGenProd, sGenOrdem: String;

  hHrInicio, hHrFim: String;
Begin
  Lab_EstoquesVlrTotAno.Caption:='0,00';
  Lab_EstoquesVlrTot4Meses.Caption:='0,00';

//OdirAqui Demonstrativo Desabilitado
//  // Fecha Demonstrativo =======================================================
//  If Bt_EstoquesDemonstrativo.Caption='Fechar Demonstrativo' Then
//   Bt_EstoquesDemonstrativoClick(Self);

  // Inicializa Client CDS_V_Estoques ==========================================
  If DMVirtual.CDS_V_Estoques.Active Then
   DMVirtual.CDS_V_Estoques.Close;

  DMVirtual.CDS_V_Estoques.CreateDataSet;
  DMVirtual.CDS_V_Estoques.IndexName:='';
  DMVirtual.CDS_V_Estoques.Filtered:=False;
  DMVirtual.CDS_V_Estoques.Filter:='';
  DMVirtual.CDS_V_Estoques.EmptyDataSet;

//odirapagar
//  Dbg_Estoques.Columns[11].ReadOnly:=True;
  Dbg_Estoques.Columns[4].ReadOnly:=True;

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

  OdirPanApres.Caption:='AGUARDE !! Localizando Produtos/Est.Mínimos/Demandas da Loja Bel_'+sgCodEmp;
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

  // Busca Movtos ==============================================================
  MySql:=' SELECT'+
         ' GEN_ID('+sGenProd+',1) SEQ,'+
//         ' GEN_ID(GEN_ODIR,1) SEQ,'+
         ' pr.codproduto COD_PRODUTO,'+
         ' pr.apresentacao DES_PRODUTO,'+
         ' fc.ind_curva,'+
         ' CAST(COALESCE(fc.vlr_demandas,0.00) AS NUMERIC(12,2)) VLR_VENDAS_ANO,'+ //* Antigo VLR_DEMANDAS */
         ' CAST(COALESCE(e4.vlr_venda,0.00) AS NUMERIC(12,2)) VLR_VENDAS_4M,'+     //* 4 Meses */
         ' COALESCE(fc.qtd_demandas,0) qtd_vendas_ano,'+
         ' COALESCE(e4.qtd_venda,0) qtd_vendas_4m,'+

         ' CAST(CASE'+
         '       WHEN ((COALESCE(fc.qtd_demandas,0)<=0) OR (COALESCE(fc.num_dias_uteis,0)=0)) THEN'+
         '         0'+
         '       ELSE'+
         '        (fc.qtd_demandas/fc.num_dias_uteis)*fc.num_dias_estocagem'+
         ' END AS INTEGER) QTD_ESTOCAGEM_ANO,'+ // Antigo QTD_DEMANDA

         ' CAST(CASE'+
         '       WHEN ((COALESCE(e4.qtd_venda,0)<=0) OR (COALESCE(e4.qtd_venda_dia,0)<=0)) THEN'+
         '         0'+
         '       ELSE'+
         '        (e4.qtd_venda_dia)*fc.num_dias_estocagem'+
         ' END AS INTEGER)  QTD_ESTCAGEM_4M,'+ // Estocagem 4 meses

         ' fc.per_participacao,'+
         ' CAST(COALESCE(es.saldoatual,0) as INTEGER) QTD_ESTOQUE,'+
         ' fc.qtd_transito,'+
         ' CAST(COALESCE(es.saldoatual,0)+COALESCE(fc.qtd_transito,0) AS INTEGER) QTD_DISPONIVEL,'+
         ' COALESCE(fc.est_minimo,0) EST_IDEAL,'+
         ' COALESCE(es.estoquemaximo,0) EST_MAXIMO,'+
         ' COALESCE(pr.precovenda,0.00) VLR_PC_VENDA,'+

         ' CAST((COALESCE(es.saldoatual,0)+COALESCE(fc.qtd_transito,0)) *'+
         '       COALESCE(pr.precovenda,0.00) AS NUMERIC(12,2)) VLR_TOTAL_VENDA,'+

         ' pr.datainclusao DTA_INCLUSAO,'+
         ' pr.codgrupo,'+
         ' pr.nomegrupo,'+
         ' pr.codsubgrupo,'+
         ' pr.nomesubgrupo,'+
         ' pr.codgruposub,'+

         ' CAST(LPAD('+
         '   CASE'+
         '      WHEN pr.situacaopro=0 THEN ''Ativo'''+
         '      WHEN pr.situacaopro=1 THEN ''Bloqueado'''+
         '      WHEN pr.situacaopro=2 THEN ''Excluido'''+
         '      WHEN pr.situacaopro=3 THEN ''Não Compra'''+
         '      WHEN pr.situacaopro=4 THEN ''Não Venda'''+
         '      ELSE ''Sem Informação'''+
         '   END'+
         ',20, '' '') AS VARCHAR(20)) IND_SITUACAO,'+

         ' pr.principalfor COD_FORNECEDOR,'+
         ' pr.nomefornecedor DES_FORNECEDOR,'+
         ' 0.00 VLR_VENDAS_ACUM,'+ // Não Usado
//         ' GEN_ID(GEN_ODIR1,1)+12 ORDENAR,'+
         ' GEN_ID('+sGenOrdem+',1)+12 ORDENAR,'+
         ' ''NAO'' ALTERACAO,'+
         ' 0.00 VLR_VENDAS_ACUM_OK,'+ // Não Usado
         ' fc.num_dias_uteis NUM_DIASUTEIS,'+
         ' e4.dias_uteis DIAS_UTEIS_4M,'+
         ' 0 NUM_LINHA'+

         ' FROM ES_FINAN_CURVA_ABC fc'+
         '     LEFT JOIN PRODUTO pr             ON pr.codproduto=fc.cod_produto'+
         '     LEFT JOIN ESTOQUE es             ON es.codfilial=fc.cod_loja'+  // QuotedStr(sgCodEmp)+
         '                                     AND es.codproduto=fc.cod_produto'+
         '     LEFT JOIN ES_DEMANDAS_4MESES e4  ON e4.codfilial=fc.cod_loja'+
         '                                     AND e4.codproduto=fc.cod_produto'+

         ' WHERE fc.cod_loja='+QuotedStr(sgCodEmp);

         // Situacao dos Produtos -----------------------------
         If Cbx_EstoquesSituacaoProd.ItemIndex=0 Then
          MySql:=
           MySql+' AND Coalesce(pr.situacaopro,0)=0';

         If Cbx_EstoquesSituacaoProd.ItemIndex=1 Then
          MySql:=
           MySql+' AND Coalesce(pr.situacaopro,3)=3';

         If Cbx_EstoquesSituacaoProd.ItemIndex=2 Then
          MySql:=
           MySql+' AND Coalesce(pr.situacaopro,0) in (0,3)';

  MySql:=
   MySql+' AND   NOT ((pr.principalfor IN (''010000'', ''000300'', ''000500'', ''001072'', ''000883''))'+
         '            OR'+
         '            (pr.codaplicacao =''0016''))'+ // Brindes

         ' ORDER BY fc.ind_curva, fc.per_participacao desc, fc.vlr_demandas desc';
  DMBelShop.CDS_SQLQ_Busca.close;
  DMBelShop.SQLQ_Busca.SQL.Clear;
  DMBelShop.SQLQ_Busca.SQL.Add(MySql);
  DMBelShop.CDS_SQLQ_Busca.Open;
  DMVirtual.CDS_V_Estoques.Data:=DMBelShop.CDS_SQLQ_Busca.Data;
  DMBelShop.CDS_SQLQ_Busca.close;

  // Drop Sequence's ===========================================================
  MySql:=' DROP SEQUENCE '+sGenProd;
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  MySql:=' DROP SEQUENCE '+sGenOrdem;
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  // Rollback nas Sequence's ===================================================
  DMBelShop.SQLC.Rollback(TD);

{
  // Atualiza Client de Estoques ===============================================
  iSeqProd:=0;
  iSeqOrdem:=12;
  igNrDias:=0;

  FrmBelShop.MontaProgressBar(True, FrmEstoques);
  pgProgBar.Properties.Max:=iNumReg;
  pgProgBar.Position:=0;
  cVlrAcum:=0;

  DMVirtual.bSeProcessa2:=True;

  DMVirtual.CDS_V_Estoques.DisableControls;
  iNumReg:=0;
  While not DMVirtual.CDS_V_Estoques.Eof do
  Begin
    Application.ProcessMessages;

    Inc(iNumReg);
    Inc(iSeqProd);
    Inc(iSeqOrdem);
    cVlrAcum:=cVlrAcum+DMVirtual.CDS_V_Estoques.FieldByName('VLR_DEMANDAS').AsCurrency;
    DMVirtual.CDS_V_Estoques.Edit;
    DMVirtual.CDS_V_EstoquesSEQ.AsInteger:=iSeqProd;
    DMVirtual.CDS_V_EstoquesVLR_VENDAS_ACUM.AsCurrency:=cVlrAcum;
    DMVirtual.CDS_V_EstoquesORDENAR.AsInteger:=iSeqOrdem;
    DMVirtual.CDS_V_Estoques.Post;

    pgProgBar.Position:=iNumReg;

    DMVirtual.CDS_V_Estoques.Next;
  End;
  DMVirtual.CDS_V_Estoques.EnableControls;


  DMVirtual.CDS_V_Estoques.First;
  FrmBelShop.MontaProgressBar(False, FrmEstoques);
 }
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
//odirapagar
//  Dbg_Estoques.Columns[11].Font.Style:=[fsBold];
//  Dbg_Estoques.Columns[11].ReadOnly:=False;
  Dbg_Estoques.Columns[4].Font.Style:=[fsBold];
  Dbg_Estoques.Columns[4].ReadOnly:=False;

  // Se Atualiza Valores de Estoques ===========================================
  DMVirtual.bSeProcessa2:=False;

  // Fecha Apresentações =======================================================
  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  Refresh;

  THackDBGrid(Dbg_Estoques).FixedCols:=4;
//odirapagar
//  THackDBGrid(Dbg_Estoques).SelectedIndex:=11;
  THackDBGrid(Dbg_Estoques).SelectedIndex:=4;
  Dbg_Estoques.SetFocus;

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

//OdirAqui Demonstrativo Desabilitado
//  // Fecha Demonstrativo =======================================================
//  If Bt_EstoquesDemonstrativo.Caption='Fechar Demonstrativo' Then
//   Bt_EstoquesDemonstrativoClick(Self);

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

//OdirApagar - Não Processa Mais Por Aqui
//  If bgProcessar Then // Nunca Processa
//  Begin
//    If igDiasEstA=0 Then igDiasEstA:=FrmSolicitacoes.EdtParamCurvaADiasEst.AsInteger;
//    If igEstMinA=0  Then igEstMinA :=FrmSolicitacoes.EdtParamCurvaAEstMinino.AsInteger;
//    If igDiasEstB=0 Then igDiasEstB:=FrmSolicitacoes.EdtParamCurvaBDiasEst.AsInteger;
//    If igEstMinB=0  Then igEstMinB :=FrmSolicitacoes.EdtParamCurvaBEstMinino.AsInteger;
//    If igDiasEstC=0 Then igDiasEstC:=FrmSolicitacoes.EdtParamCurvaCDiasEst.AsInteger;
//    If igEstMinC=0  Then igEstMinC :=FrmSolicitacoes.EdtParamCurvaCEstMinino.AsInteger;
//    If igDiasEstD=0 Then igDiasEstD:=FrmSolicitacoes.EdtParamCurvaDDiasEst.AsInteger;
//    If igEstMinD=0  Then igEstMinD :=FrmSolicitacoes.EdtParamCurvaDEstMinino.AsInteger;
//    If igDiasEstE=0 Then igDiasEstE:=FrmSolicitacoes.EdtParamCurvaEDiasEst.AsInteger;
//    If igEstMinE=0  Then igEstMinE :=FrmSolicitacoes.EdtParamCurvaEEstMinino.AsInteger;
//
//    // Verifica se Altera Algum Valor na Curva A ===============================
//    If iDiasEstA=FrmSolicitacoes.EdtParamCurvaADiasEst.AsInteger Then
//     Begin
//       iDiasEstA:=-1;
//     End
//    Else
//     Begin
//       iDiasEstA:=FrmSolicitacoes.EdtParamCurvaADiasEst.AsInteger;
//       igDiasEstA:=FrmSolicitacoes.EdtParamCurvaADiasEst.AsInteger;
//     End;
//
//    If iEstMinA=FrmSolicitacoes.EdtParamCurvaAEstMinino.AsInteger Then
//     Begin
//       iEstMinA:=-1;
//     End
//    Else
//     Begin
//       iEstMinA:=FrmSolicitacoes.EdtParamCurvaAEstMinino.AsInteger;
//       igEstMinA:=FrmSolicitacoes.EdtParamCurvaAEstMinino.AsInteger;
//     End;
//
//    // Verifica se Altera Algum Valor na Curva B ===============================
//    If iDiasEstB=FrmSolicitacoes.EdtParamCurvaBDiasEst.AsInteger Then
//     Begin
//       iDiasEstB:=-1;
//     End
//    Else
//     Begin
//       iDiasEstB:=FrmSolicitacoes.EdtParamCurvaBDiasEst.AsInteger;
//       igDiasEstB:=FrmSolicitacoes.EdtParamCurvaBDiasEst.AsInteger;
//     End;
//
//    If iEstMinB=FrmSolicitacoes.EdtParamCurvaBEstMinino.AsInteger Then
//     Begin
//       iEstMinB:=-1;
//     End
//    Else
//     Begin
//       iEstMinB:=FrmSolicitacoes.EdtParamCurvaBEstMinino.AsInteger;
//       igEstMinB:=FrmSolicitacoes.EdtParamCurvaBEstMinino.AsInteger;
//     End;
//
//    // Verifica se Altera Algum Valor na Curva C ===============================
//    If iDiasEstC=FrmSolicitacoes.EdtParamCurvaCDiasEst.AsInteger Then
//     Begin
//       iDiasEstC:=-1;
//     End
//    Else
//     Begin
//       iDiasEstC:=FrmSolicitacoes.EdtParamCurvaCDiasEst.AsInteger;
//       igDiasEstC:=FrmSolicitacoes.EdtParamCurvaCDiasEst.AsInteger;
//     End;
//
//    If iEstMinC =FrmSolicitacoes.EdtParamCurvaCEstMinino.AsInteger Then
//     Begin
//       iEstMinC:=-1;
//     End
//    Else
//     Begin
//       iEstMinC:=FrmSolicitacoes.EdtParamCurvaCEstMinino.AsInteger;
//       igEstMinC:=FrmSolicitacoes.EdtParamCurvaDDiasEst.AsInteger;
//     End;
//
//    // Verifica se Altera Algum Valor na Curva D ===============================
//    If iDiasEstD=FrmSolicitacoes.EdtParamCurvaDDiasEst.AsInteger Then
//     Begin
//       iDiasEstD:=-1;
//     End
//    Else
//     Begin
//       iDiasEstD:=FrmSolicitacoes.EdtParamCurvaDDiasEst.AsInteger;
//       igDiasEstD:=FrmSolicitacoes.EdtParamCurvaDDiasEst.AsInteger;
//     End;
//
//    If iEstMinD=FrmSolicitacoes.EdtParamCurvaDEstMinino.AsInteger Then
//     Begin
//       iEstMinD:=-1;
//     End
//    Else
//     Begin
//       iEstMinD:=FrmSolicitacoes.EdtParamCurvaDEstMinino.AsInteger;
//       igEstMinD:=FrmSolicitacoes.EdtParamCurvaDEstMinino.AsInteger;
//     End;
//
//    // Verifica se Altera Algum Valor na Curva E ===============================
//    If iDiasEstE=FrmSolicitacoes.EdtParamCurvaEDiasEst.AsInteger Then
//     Begin
//       iDiasEstE:=-1;
//     End
//    Else
//     Begin
//       iDiasEstE:=FrmSolicitacoes.EdtParamCurvaEDiasEst.AsInteger;
//       igDiasEstE:=FrmSolicitacoes.EdtParamCurvaEDiasEst.AsInteger;
//     End;
//
//    If iEstMinE =FrmSolicitacoes.EdtParamCurvaEEstMinino.AsInteger Then
//     Begin
//       iEstMinE:=-1;
//     End
//    Else
//     Begin
//       iEstMinE:=FrmSolicitacoes.EdtParamCurvaEEstMinino.AsInteger;
//       igEstMinE:=FrmSolicitacoes.EdtParamCurvaEEstMinino.AsInteger;
//     End;
//
//    // Altera os Parametros de Necessario ======================================
//    bgSiga:=False;
//    If (iDiasEstA>=0) Or (iDiasEstB>=0) Or (iDiasEstC>=0) Or (iDiasEstD>=0) Or (iDiasEstE>=0) Or
//       (iEstMinA>=0)  Or (iEstMinB>=0)  Or (iEstMinC>=0)  Or (iEstMinD>=0)  Or (iEstMinE>=0) Then
//    Begin
//      bgSiga:=True;
//    End;
//
//    If (bgSiga) and (msg('Deseja Alterar os Parâmetros'+cr+cr+'de Curva ABC do Gerenciador ???','C')=1) Then
//    Begin
//      If msg('Deseja REALMENTE Alterar os Parâmetros'+cr+cr+'de Curva ABC do Gerenciador ???','C')=1 Then
//      Begin
//        // Verifica se Transação esta Ativa
//        If DMBelShop.SQLC.InTransaction Then
//         DMBelShop.SQLC.Rollback(TD);
//
//        // Monta Transacao =========================================================
//        TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//        TD.IsolationLevel:=xilREADCOMMITTED;
//        DMBelShop.SQLC.StartTransaction(TD);
//        Try
//          Screen.Cursor:=crAppStart;
//          DateSeparator:='.';
//          DecimalSeparator:='.';
//
//          // Salva Valores da Curva abc ============================================
//          MySql:=' DELETE From TAB_AUXILIAR'+
//                 ' WHERE tip_aux=2';
//          DMBelShop.SQLC.Execute(MySql, nil, nil);
//
//          MySql:=' INSERT into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, VLR_AUX, VLR_AUX1)'+
//                 ' VALUES (2, 1, '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaALimite.AsInteger))+', '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaADiasEst.AsInteger))+', '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaAEstMinino.AsInteger))+')';
//          DMBelShop.SQLC.Execute(MySql, nil, nil);
//
//          MySql:=' INSERT into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, VLR_AUX, VLR_AUX1)'+
//                 ' Values (2, 2, '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaBLimite.AsInteger))+', '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaBDiasEst.AsInteger))+', '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaBEstMinino.AsInteger))+')';
//          DMBelShop.SQLC.Execute(MySql, nil, nil);
//
//          MySql:=' INSERT into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, VLR_AUX, VLR_AUX1)'+
//                 ' Values (2, 3, '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaCLimite.AsInteger))+', '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaCDiasEst.AsInteger))+', '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaCEstMinino.AsInteger))+')';
//          DMBelShop.SQLC.Execute(MySql, nil, nil);
//
//          MySql:=' INSERT into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, VLR_AUX, VLR_AUX1)'+
//                 ' Values (2, 4, '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaDLimite.AsInteger))+', '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaDDiasEst.AsInteger))+', '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaDEstMinino.AsInteger))+')';
//          DMBelShop.SQLC.Execute(MySql, nil, nil);
//
//          MySql:=' INSERT into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, VLR_AUX, VLR_AUX1)'+
//                 ' Values (2, 5, '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaELimite.AsInteger))+', '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaEDiasEst.AsInteger))+', '+
//                 QuotedStr(IntToStr(FrmSolicitacoes.EdtParamCurvaEEstMinino.AsInteger))+')';
//          DMBelShop.SQLC.Execute(MySql, nil, nil);
//
//          // Atualiza Transacao ====================================================
//          DMBelShop.SQLC.Commit(TD);
//
//          DateSeparator:='/';
//          DecimalSeparator:=',';
//          Screen.Cursor:=crDefault;
//
//        Except
//          on e : Exception do
//          Begin
//            // Abandona Transacao =====================================
//            DMBelShop.SQLC.Rollback(TD);
//
//            DateSeparator:='/';
//            DecimalSeparator:=',';
//            Screen.Cursor:=crDefault;
//
//            MessageBox(Handle, pChar('PARAMETROS Não Foram Salvos !!'+cr+cr+'Erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
//            exit;
//          End; // on e : Exception do
//        End; // Try
//      End; // If msg('Deseja REALMENTE Alterar os Parâmetros'+cr+cr+'de Curva ABC do Gerenciador ???','C')=1 Then
//    End; // If (bgSiga) and (msg('Deseja Alterar os Parâmetros'+cr+cr+'de Curva ABC do Gerenciador ???','C')=1) Then
//  End; // If bgProcessar Then

  // Destroi FrmSolicitacoes ===================================================
  FreeAndNil(FrmSolicitacoes);

//OdirApagar - Não Rodar amis o Demonstrativo
//  // Acerta Totalizadores ======================================================
//  If DMVirtual.CDS_V_Estoques.IsEmpty Then
//   Exit;
//
//  If (bgSiga) And (bgProcessar) Then
//  Begin
//    Ts_Estoques.Enabled:=False;
//
//    // Acerta Totalizador Curva A ==============================================
//    DMVirtual.CDS_V_Estoques.DisableControls;
//    If (iDiasEstA>=0) Or (iEstMinA>=0) Then
//    Begin
//      DMVirtual.CDS_V_Estoques.Filtered:=False;
//      If sgFiltros='' Then
//       DMVirtual.CDS_V_Estoques.Filter:='IND_CURVA=''A'''
//      Else
//       DMVirtual.CDS_V_Estoques.Filter:=sgFiltros+' AND IND_CURVA=''A''';
//      DMVirtual.CDS_V_Estoques.Filtered:=True;
//
//      // Apresenta o Processamento =================================================
//      OdirPanApres.Caption:='AGUARDE !! Atualizando Classificação Curva A...';
//      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
//      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmEstoques.Width-OdirPanApres.Width)/2));
//      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmEstoques.Height-OdirPanApres.Height)/2))-100;
//      OdirPanApres.BringToFront();
//      OdirPanApres.Visible:=True;
//      Refresh;
//
//      FrmBelShop.MontaProgressBar(True, FrmEstoques);
//      pgProgBar.Properties.Max:=DMVirtual.CDS_V_Estoques.RecordCount;
//      pgProgBar.Position:=0;
//
//      DMVirtual.CDS_V_Estoques.First;
//      While Not DMVirtual.CDS_V_Estoques.Eof do
//      Begin
//        Application.ProcessMessages;
//        pgProgBar.Position:=DMVirtual.CDS_V_Estoques.RecNo;
//
//        If Trim(DMVirtual.CDS_V_EstoquesCOD_PRODUTO.AsString)<>'' Then
//        Begin
//          DMVirtual.CDS_V_Estoques.Edit;
//          If iDiasEstA>=0 Then
//           DMVirtual.CDS_V_EstoquesQTD_DEMANDA.AsCurrency:=
//                     (DMVirtual.CDS_V_EstoquesQTD_DEMANDAS.AsCurrency/
//                      DMVirtual.CDS_V_EstoquesNUM_DIASUTEIS.AsInteger)*iDiasEstA;
//
//          If (iEstMinA>=0) And (DMVirtual.CDS_V_EstoquesEST_IDEAL.AsInteger>0) Then
//           DMVirtual.CDS_V_EstoquesEST_IDEAL.AsCurrency:=iEstMinA;
//
//          DMVirtual.CDS_V_Estoques.Post;
//        End; // If Trim(DMVirtual.CDS_V_EstoquesCOD_PRODUTO.AsString)<>'' Then
//
//        DMVirtual.CDS_V_Estoques.Next;
//      End; // While Not DMVirtual.CDS_V_Estoques.Eof do
//      FrmBelShop.MontaProgressBar(False, FrmEstoques);
//    End; // If (iDiasEstA>=0) Or (iEstMinA>=0) Then
//
//    // Acerta Totalizador Curva B ==============================================
//    If (iDiasEstB>=0) Or (iEstMinB>=0) Then
//    Begin
//      DMVirtual.CDS_V_Estoques.Filtered:=False;
//      If sgFiltros='' Then
//       DMVirtual.CDS_V_Estoques.Filter:='IND_CURVA=''B'''
//      Else
//       DMVirtual.CDS_V_Estoques.Filter:=sgFiltros+' AND IND_CURVA=''B''';
//      DMVirtual.CDS_V_Estoques.Filtered:=True;
//
//      OdirPanApres.Caption:='AGUARDE !! Atualizando Classificação Curva B...';
//      Refresh;
//      FrmBelShop.MontaProgressBar(True, FrmEstoques);
//      pgProgBar.Properties.Max:=DMVirtual.CDS_V_Estoques.RecordCount;
//      pgProgBar.Position:=0;
//
//      DMVirtual.CDS_V_Estoques.First;
//      While Not DMVirtual.CDS_V_Estoques.Eof do
//      Begin
//        Application.ProcessMessages;
//        pgProgBar.Position:=DMVirtual.CDS_V_Estoques.RecNo;
//
//        If Trim(DMVirtual.CDS_V_EstoquesCOD_PRODUTO.AsString)<>'' Then
//        Begin
//          DMVirtual.CDS_V_Estoques.Edit;
//          If iDiasEstB>=0 Then
//           DMVirtual.CDS_V_EstoquesQTD_DEMANDA.AsCurrency:=
//                     (DMVirtual.CDS_V_EstoquesQTD_DEMANDAS.AsCurrency/
//                      DMVirtual.CDS_V_EstoquesNUM_DIASUTEIS.AsInteger)*iDiasEstB;
//
//          If (iEstMinB>=0) And (DMVirtual.CDS_V_EstoquesEST_IDEAL.AsInteger>0) Then
//           DMVirtual.CDS_V_EstoquesEST_IDEAL.AsCurrency:=iEstMinB;
//
//          DMVirtual.CDS_V_Estoques.Post;
//        End; // If Trim(DMVirtual.CDS_V_EstoquesCOD_PRODUTO.AsString)<>'' Then
//
//        DMVirtual.CDS_V_Estoques.Next;
//      End; // While Not DMVirtual.CDS_V_Estoques.Eof do
//      FrmBelShop.MontaProgressBar(False, FrmEstoques);
//    End; // If (iDiasEstB>=0) Or (iEstMinB>=0) Then
//
//    // Acerta Totalizador Curva C ==============================================
//    If (iDiasEstC>=0) Or (iEstMinC>=0) Then
//    Begin
//      DMVirtual.CDS_V_Estoques.Filtered:=False;
//      If sgFiltros='' Then
//       DMVirtual.CDS_V_Estoques.Filter:='IND_CURVA=''C'''
//      Else
//       DMVirtual.CDS_V_Estoques.Filter:=sgFiltros+' AND IND_CURVA=''C''';
//      DMVirtual.CDS_V_Estoques.Filtered:=True;
//
//      OdirPanApres.Caption:='AGUARDE !! Atualizando Classificação Curva C...';
//      Refresh;
//      FrmBelShop.MontaProgressBar(True, FrmEstoques);
//      pgProgBar.Properties.Max:=DMVirtual.CDS_V_Estoques.RecordCount;
//      pgProgBar.Position:=0;
//
//      DMVirtual.CDS_V_Estoques.First;
//      While Not DMVirtual.CDS_V_Estoques.Eof do
//      Begin
//        Application.ProcessMessages;
//        pgProgBar.Position:=DMVirtual.CDS_V_Estoques.RecNo;
//
//        If Trim(DMVirtual.CDS_V_EstoquesCOD_PRODUTO.AsString)<>'' Then
//        Begin
//          DMVirtual.CDS_V_Estoques.Edit;
//          If iDiasEstC>=0 Then
//           DMVirtual.CDS_V_EstoquesQTD_DEMANDA.AsCurrency:=
//                     (DMVirtual.CDS_V_EstoquesQTD_DEMANDAS.AsCurrency/
//                      DMVirtual.CDS_V_EstoquesNUM_DIASUTEIS.AsInteger)*iDiasEstC;
//
//          If (iEstMinC>=0) And (DMVirtual.CDS_V_EstoquesEST_IDEAL.AsInteger>0) Then
//           DMVirtual.CDS_V_EstoquesEST_IDEAL.AsCurrency:=iEstMinC;
//
//          DMVirtual.CDS_V_Estoques.Post;
//        End; // If Trim(DMVirtual.CDS_V_EstoquesCOD_PRODUTO.AsString)<>'' Then
//
//        DMVirtual.CDS_V_Estoques.Next;
//      End; // While Not DMVirtual.CDS_V_Estoques.Eof do
//      FrmBelShop.MontaProgressBar(False, FrmEstoques);
//    End; // If (iDiasEstC>=0) Or (iEstMinC>=0) Then
//
//    // Acerta Totalizador Curva D ==============================================
//    If (iDiasEstD>=0) Or (iEstMinD>=0) Then
//    Begin
//      DMVirtual.CDS_V_Estoques.Filtered:=False;
//      If sgFiltros='' Then
//       DMVirtual.CDS_V_Estoques.Filter:='IND_CURVA=''D'''
//      Else
//       DMVirtual.CDS_V_Estoques.Filter:=sgFiltros+' AND IND_CURVA=''D''';
//      DMVirtual.CDS_V_Estoques.Filtered:=True;
//
//      OdirPanApres.Caption:='AGUARDE !! Atualizando Classificação Curva D...';
//      Refresh;
//      FrmBelShop.MontaProgressBar(True, FrmEstoques);
//      pgProgBar.Properties.Max:=DMVirtual.CDS_V_Estoques.RecordCount;
//      pgProgBar.Position:=0;
//
//      DMVirtual.CDS_V_Estoques.First;
//      While Not DMVirtual.CDS_V_Estoques.Eof do
//      Begin
//        Application.ProcessMessages;
//        pgProgBar.Position:=DMVirtual.CDS_V_Estoques.RecNo;
//
//        If Trim(DMVirtual.CDS_V_EstoquesCOD_PRODUTO.AsString)<>'' Then
//        Begin
//          DMVirtual.CDS_V_Estoques.Edit;
//          If iDiasEstD>=0 Then
//           DMVirtual.CDS_V_EstoquesQTD_DEMANDA.AsCurrency:=
//                     (DMVirtual.CDS_V_EstoquesQTD_DEMANDAS.AsCurrency/
//                      DMVirtual.CDS_V_EstoquesNUM_DIASUTEIS.AsInteger)*iDiasEstD;
//
//          If (iEstMinD>=0) And (DMVirtual.CDS_V_EstoquesEST_IDEAL.AsInteger>0) Then
//           DMVirtual.CDS_V_EstoquesEST_IDEAL.AsCurrency:=iEstMinD;
//
//          DMVirtual.CDS_V_Estoques.Post;
//        End; // If Trim(DMVirtual.CDS_V_EstoquesCOD_PRODUTO.AsString)<>'' Then
//
//        DMVirtual.CDS_V_Estoques.Next;
//      End; // While Not DMVirtual.CDS_V_Estoques.Eof do
//      FrmBelShop.MontaProgressBar(False, FrmEstoques);
//    End; // If (iDiasEstD>=0) Or (iEstMinD>=0) Then
//
//    // Acerta Totalizador Curva E ==============================================
//    If (iDiasEstE>=0) Or (iEstMinE>=0) Then
//    Begin
//      DMVirtual.CDS_V_Estoques.Filtered:=False;
//      If sgFiltros='' Then
//       DMVirtual.CDS_V_Estoques.Filter:='IND_CURVA=''E'''
//      Else
//       DMVirtual.CDS_V_Estoques.Filter:=sgFiltros+' AND IND_CURVA=''E''';
//      DMVirtual.CDS_V_Estoques.Filtered:=True;
//
//      OdirPanApres.Caption:='AGUARDE !! Atualizando Classificação Curva E...';
//      Refresh;
//      FrmBelShop.MontaProgressBar(True, FrmEstoques);
//      pgProgBar.Properties.Max:=DMVirtual.CDS_V_Estoques.RecordCount;
//      pgProgBar.Position:=0;
//
//      DMVirtual.CDS_V_Estoques.First;
//      While Not DMVirtual.CDS_V_Estoques.Eof do
//      Begin
//        Application.ProcessMessages;
//        pgProgBar.Position:=DMVirtual.CDS_V_Estoques.RecNo;
//
//        If Trim(DMVirtual.CDS_V_EstoquesCOD_PRODUTO.AsString)<>'' Then
//        Begin
//          DMVirtual.CDS_V_Estoques.Edit;
//          If iDiasEstE>=0 Then
//           DMVirtual.CDS_V_EstoquesQTD_DEMANDA.AsCurrency:=
//                     (DMVirtual.CDS_V_EstoquesQTD_DEMANDAS.AsCurrency/
//                      DMVirtual.CDS_V_EstoquesNUM_DIASUTEIS.AsInteger)*iDiasEstE;
//
//          If (iEstMinE>=0) And (DMVirtual.CDS_V_EstoquesEST_IDEAL.AsInteger>0) Then
//           DMVirtual.CDS_V_EstoquesEST_IDEAL.AsCurrency:=iEstMinE;
//
//          DMVirtual.CDS_V_Estoques.Post;
//        End; // If Trim(DMVirtual.CDS_V_EstoquesCOD_PRODUTO.AsString)<>'' Then
//
//        DMVirtual.CDS_V_Estoques.Next;
//      End; // While Not DMVirtual.CDS_V_Estoques.Eof do
//      FrmBelShop.MontaProgressBar(False, FrmEstoques);
//      OdirPanApres.Visible:=False;
//    End; // If (iDiasEstE>=0) Or (iEstMinE>=0) Then
//
//    // Salva Resultados dos ClientDataSet's ====================================
//    DMVirtual.CDS_V_Estoques.Filtered:=False;
//
//    If sgFiltros<>'' Then
//     Begin
//       DMVirtual.CDS_V_Estoques.Filter:=sgFiltros;
//       DMVirtual.CDS_V_Estoques.Filtered:=True;
//     End
//    Else
//     Begin
//       DMVirtual.CDS_V_Estoques.Filter:='';
//     End;
//    DMVirtual.CDS_V_Estoques.First;
//
//    DMVirtual.CDS_V_Estoques.EnableControls;
//
//    // Acerta Totalizador Geral ================================================
//    Ts_Estoques.Enabled:=True;
//
//    msg('Novos Parametros'+cr+cr+'Calculados com SUCESSO !!','A');
//  End; // If (bgSiga) And (bgProcessar) Then

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

  If msg('Deseja Realmente Alterar O ESTOQUE MÍNIMO'+cr+cr+'DE TODOS OS PRODUTOS SELECIONADOS ??','C')=2 Then
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

  If Application.MessageBox('Deseja REALMENTE Replicar'+cr+cr+'TODOS OS ESTOQUE MÍNIMOS'+cr+cr+'do FILTRO Selecionado para'+cr+cr+'Outra(s) Loja(s) ??', 'ATENÇÃO !!', 292) = Idno Then
   Exit;

  sgOutrasEmpresa:='(99)';
  sgEmpresaNao:='('+sgCodEmp+')';
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False;
  FrmSelectEmpProcessamento.Gb_SelectEmpProc.Caption:='SELECIONE AS LOJAS A REPLICAR OS ESTOQUES MÍNIMOS';

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

  If Application.MessageBox(pChar('Deseja REALMENTE Replicar'+cr+cr+'TODOS OS ESTOQUE MÍNIMOS'+cr+cr+'do FILTRO Selecionado para'+cr+cr+'a(s) Loja(s):'+cr+cr+sgCodLojas+cr+cr+' ?????????'), 'ATENÇÃO !!', 292) = Idno Then
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

procedure TFrmEstoques.DBE_EstoquesTOT1Change(Sender: TObject);
begin
  Lab_EstoquesVlrTotAno.Caption:='0,00';
  Lab_EstoquesVlrTot4Meses.Caption:='0,00';
  If trim(DBE_EstoquesTOT1.Text)<>'' Then
   Lab_EstoquesVlrTotAno.Caption:=Formatfloat('R$ #,##0.00',StrToFloat(DBE_EstoquesTOT1.Text));

  If trim(DBE_EstoquesTOT2.Text)<>'' Then
   Lab_EstoquesVlrTot4Meses.Caption:=Formatfloat('R$ #,##0.00',StrToFloat(DBE_EstoquesTOT2.Text));

end;

end.
