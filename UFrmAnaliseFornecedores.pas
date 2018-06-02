unit UFrmAnaliseFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, DbChart,
  JvGradientCaption, JvExControls, JvXPCore, JvXPButtons, DBXpress,
  StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  JvCombobox, JvExStdCtrls, JvHtControls, JvListBox, JvComboListBox, Mask,
  Commctrl, // SHOW HINT EM FORMA DE BALÃO
  ToolEdit, CurrEdit, Grids, DBGrids, DBGridJul, Math;

type
  TFrmAnaliseFornecedores = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    Panel10: TPanel;
    Bt_Fechar: TJvXPButton;
    Pan_Solicitacoes: TPanel;
    DbGrafico_Lojas: TDBChart;
    DbGrafico_Fornecedores: TDBChart;
    DbGrafico_Setores: TDBChart;
    Gb_Lojas: TGroupBox;
    Gb_Fornecedores: TGroupBox;
    Gb_Setores: TGroupBox;
    Bt_MinimizarGraficos: TJvXPButton;
    EdtDesFornecedor: TEdit;
    Bt_BuscaFornecedor: TJvXPButton;
    EdtDesSetor: TEdit;
    Bt_BuscaSetor: TJvXPButton;
    Panel1: TPanel;
    DtEdt_DtaInicio: TcxDateEdit;
    DtEdt_DtaFim: TcxDateEdit;
    Label85: TLabel;
    Label1: TLabel;
    Cbx_Lojas: TJvHTComboBox;
    EdtCodFornecedor: TCurrencyEdit;
    EdtCodSetor: TCurrencyEdit;
    Dbg_Produtos: TDBGridJul;
    Bt_MinimizarGraficoLojas: TJvXPButton;
    Bt_MinimizarGraficoForn: TJvXPButton;
    Bt_MinimizarGraficoSetores: TJvXPButton;
    Button1: TButton;
    OdirPanApres: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure Bt_MinimizarGraficosClick(Sender: TObject);

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente

    // Graficos
    Procedure FechaSeriesGraficos;
    Procedure CriaSeriesGraficos;
    Procedure AcertaGraficos;

    Procedure AtualizaGraficos;
    Procedure GraficosLojas;

    Function  PeriodoConsiste: Boolean;

    Procedure FaturamentoPeriodo;

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure Bt_BuscaFornecedorClick(Sender: TObject);
    procedure Bt_BuscaSetorClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Bt_MinimizarGraficoLojasClick(Sender: TObject);
    procedure Dbg_ProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ProdutosDblClick(Sender: TObject);
    procedure DtEdt_DtaInicioExit(Sender: TObject);
    procedure Cbx_LojasChange(Sender: TObject);
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
  FrmAnaliseFornecedores: TFrmAnaliseFornecedores;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  TD : TTransactionDesc; // Ponteiro de Transação

  bgSair: Boolean;

  sOrderGrid,    // Ordenar Grid
  sgCodLoja, sgCodForn, sgCodSetor: String; // Usar para Montagem dos Graficos

  // Series de Graficos Pizza
  gsPizzaLojas: TPieSeries;
  gsPizzaForn: TPieSeries;
  gsPizzaSetores: TPieSeries;

  iPanHeight, // Posição Inicial do Painel Pan_Solicitacoes
  iGraHeight, iGraLeft, iGraWidth, iGraTop: Integer; // Posição Inicial do Graficos

implementation

uses DK_Procs1, UDMBelShop, UDMVirtual, UPesquisa, DB;

{$R *.dfm}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir _ INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Grafico das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.GraficosLojas;
Var
  MySql: String;
  i: Integer;
  CgCor: TColor;
Begin
  // Busca Faturamentos Todas da Lojas =========================================
  If Trim(sgCodLoja)='' Then
  Begin
    MySql:=' SELECT a.nome_abrev, CAST(SUM(f.vlr_fat) AS NUMERIC(12,2)) TOT_FAT'+
           ' FROM W_FAT_PERIODO f, LINXLOJAS_ABREVIATURAS a';

           // Ser Forncedor/Setor
           If (Trim(sgCodForn)<>'') Or (Trim(sgCodSetor)<>'') Then
            MySql:=
             MySql+' , LINXPRODUTOS p';

    MySql:=
     MySql+' WHERE f.empresa=a.empresa';

           // Ser Forncedor/Setor
           If (Trim(sgCodForn)<>'') Or (Trim(sgCodSetor)<>'') Then
            MySql:=
             MySql+' AND   f.cod_produto=p.cod_produto';

           // Ser Forncedor
           If Trim(sgCodForn)<>'' Then
            MySql:=
             MySql+' AND   p.cod_fornecedor='+sgCodForn;

           // Ser Setor
           If Trim(sgCodSetor)<>'' Then
            MySql:=
             MySql+' AND   p.id_setor='+sgCodSetor;

     MySql:=
      MySql+' GROUP BY 1';
  End; // If Trim(sgCodLoja)='' Then

  // Busca Faturamentos de Uma Loja ============================================
  If Trim(sgCodLoja)<>'' Then
  Begin
    MySql:=' SELECT ''OUTRAS LOJAS'' nome_abrev, CAST(SUM(f.vlr_fat) AS NUMERIC(12,2)) TOT_FAT'+
           ' FROM W_FAT_PERIODO f, LINXLOJAS_ABREVIATURAS a';

           // Ser Forncedor/Setor
           If (Trim(sgCodForn)<>'') Or (Trim(sgCodSetor)<>'') Then
            MySql:=
             MySql+' , LINXPRODUTOS p';

    MySql:=
     MySql+' WHERE f.empresa=a.empresa'+
           ' AND   f.empresa<>'+sgCodLoja;

           // Ser Forncedor/Setor
           If (Trim(sgCodForn)<>'') Or (Trim(sgCodSetor)<>'') Then
            MySql:=
             MySql+' AND   f.cod_produto=p.cod_produto';

           // Ser Forncedor
           If Trim(sgCodForn)<>'' Then
            MySql:=
             MySql+' AND   p.cod_fornecedor='+sgCodForn;

           // Ser Setor
           If Trim(sgCodSetor)<>'' Then
            MySql:=
             MySql+' AND   p.id_setor='+sgCodSetor;

    MySql:=
     MySql+' UNION'+

           ' SELECT a.nome_abrev, CAST(SUM(f.vlr_fat) AS NUMERIC(12,2))'+
           ' FROM W_FAT_PERIODO f, LINXLOJAS_ABREVIATURAS a';

           // Ser Forncedor/Setor
           If (Trim(sgCodForn)<>'') Or (Trim(sgCodSetor)<>'') Then
            MySql:=
             MySql+' , LINXPRODUTOS p';

    MySql:=
     MySql+' WHERE f.empresa=a.empresa'+
           ' AND   f.empresa='+sgCodLoja;

           // Ser Forncedor/Setor
           If (Trim(sgCodForn)<>'') Or (Trim(sgCodSetor)<>'') Then
            MySql:=
             MySql+' AND   f.cod_produto=p.cod_produto';

           // Ser Forncedor
           If Trim(sgCodForn)<>'' Then
            MySql:=
             MySql+' AND   p.cod_fornecedor='+sgCodForn;

           // Ser Setor
           If Trim(sgCodSetor)<>'' Then
            MySql:=
             MySql+' AND   p.id_setor='+sgCodSetor;

     MySql:=
      MySql+' GROUP BY 1';
  End; // If Trim(sgCodLoja)<>'' Then
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  gsPizzaLojas.Clear;

  i:=25;
  DMBelShop.CDS_BuscaRapida.DisableControls;
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    // Todas as Lojas -----------------------------------------------
    If DMBelShop.CDS_BuscaRapida.RecordCount>2 Then
    Begin
      If i=0 Then
       i:=25;

      // Inc(i);
      i:=i-1;
      CgCor:=ArrayCores_Global[i];
    End; // If DMBelShop.CDS_BuscaRapida.RecordCount2 Then

    // Uma Loja -----------------------------------------------------
    If DMBelShop.CDS_BuscaRapida.RecordCount=2 Then
    Begin
      If DMBelShop.CDS_BuscaRapida.FieldByName('nome_abrev').AsString='OUTRAS LOJAS' Then
       CgCor:=clWindow
      Else
       CgCor:=clGreen;
    End; // If DMBelShop.CDS_BuscaRapida.RecordCount=2 Then

    gsPizzaLojas.Add(DMBelShop.CDS_BuscaRapida.FieldByName('Tot_Fat').AsCurrency,
                     DMBelShop.CDS_BuscaRapida.FieldByName('nome_abrev').AsString, CgCor);

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.EnableControls;
  DMBelShop.CDS_BuscaRapida.Close;

End; // Grafico das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Graficos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.AtualizaGraficos;
Var
  i: Integer;
Begin

  // Busca Loja Selecionada ====================================================
  sgCodLoja:='';
  i:=pos('-',Cbx_Lojas.Text);

  sgCodLoja:='';
  If i<>0 Then
  Begin
    sgCodLoja:=Trim(Copy(Cbx_Lojas.Text,i+1,Length(Cbx_Lojas.Text)));
  End;

  // Codigos de Fornecedor e Setor Selecionados ================================
  sgCodForn :=EdtCodFornecedor.Text;
  sgCodSetor:=EdtCodSetor.Text;

  // ===========================================================================
  // Monta Graficos de Lojas ===================================================
  // ===========================================================================
  GraficosLojas;

End; // Atualiza Graficos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmAnaliseFornecedores.CreateToolTips(hWnd: Cardinal);
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
Procedure TFrmAnaliseFornecedores.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>

//// Busca Mix das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Procedure TFrmAnaliseFornecedores.MixLojas;
//Var
//  MySql: String;
//Begin
//  Screen.Cursor:=crAppStart;
//
//  MySql:=' DELETE FROM W_PRODUTOS_MIX';
//  DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//  MySql:='INSERT INTO W_PRODUTOS_MIX'+
//         ' SELECT'+
//         ' cv.cod_loja,'+
//         ' lj.empresa,'+
//         ' cv.cod_produto CODPRODUTO,'+
//         ' pr.cod_produto,'+
//         ' CASE'+
//         '   WHEN COALESCE(cv.est_minimo,0)<>0 THEN'+
//         '     ''SIM'''+
//         '   ELSE'+
//         '     ''NAO'''+
//         ' END MIX'+
//         ' FROM ES_FINAN_CURVA_ABC cv, LINXPRODUTOS pr, LINXLOJAS lj'+
//         ' WHERE cv.cod_produto=pr.cod_auxiliar'+
//         ' AND   cv.cod_loja=lj.cod_loja';
//  DMBelShop.SQLC.Execute(MySql,nil,nil);
//
//  Screen.Cursor:=crDefault;
//
//End; // Busca Mix das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca faturamento dos produtos no Periodo >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.FaturamentoPeriodo;
Var
  MySql: String;
  s: String;
Begin
  MySql:=' SELECT FIRST 1 f.empresa'+
         ' FROM W_FAT_PERIODO f'+
         ' WHERE f.dta_inicio='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaInicio.Date))))+
         ' AND   f.dta_fim='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaFim.Date))));
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;
  s:=DMBelShop.CDS_BuscaRapida.FieldByName('Empresa').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  If Trim(s)<>'' Then
   Exit;

  OdirPanApres.Caption:='AGUARDE !! Calculando Faturamento do Período Solicitado...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmAnaliseFornecedores;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  MySql:=' DELETE FROM W_FAT_PERIODO';
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  MySql:=' INSERT INTO W_FAT_PERIODO'+
         ' (EMPRESA, COD_LOJA, COD_PRODUTO, CODPRODUTO, VLR_FAT, DTA_INICIO, DTA_FIM)'+
         ' SELECT'+
         ' mv.empresa EMPRESA,'+
         ' mv.cod_loja COD_LOJA,'+
         ' mv.cod_produto COD_PRODUTO,'+
         ' pr.cod_auxiliar CODPRODUTO,'+

         ' SUM(CASE'+
         '       WHEN ((mv.operacao=''S'') AND (mv.tipo_transacao=''V'')) THEN'+
         '         mv.valor_total'+
         '       ELSE'+
         '         -mv.valor_total'+
         '      END) VLR_FAT,'+

         ' CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaInicio.Date))))+' AS DATE) DTA_INICIO,'+
         ' CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaFim.Date))))+' AS DATE) DTA_FIM'+

         ' FROM LINXMOVIMENTO mv, LINXPRODUTOS pr'+
         ' WHERE mv.cod_produto=pr.cod_produto'+
         ' AND  ((mv.operacao=''S'') AND (mv.tipo_transacao=''V'')'+ // Saídas Vendas
         '       OR'+
         '       (mv.operacao=''DS'') AND (mv.tipo_transacao IS NULL))'+ // Entradas Devoluções
         ' AND  mv.cancelado=''N'''+
         ' AND  mv.excluido =''N'''+
         ' AND  mv.empresa  <>2'+ // Sem Venda do CD - Empresa=2
         ' AND  mv.data_lancamento BETWEEN '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaInicio.Date))))+
                                            ' AND '+
                                            QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaFim.Date))))+
         ' AND  pr.id_linha<>33'+ // Brindes
         ' AND  pr.id_colecao<>294'+ // Brindes
         ' AND  pr.desativado=''N'''+
         ' AND  pr.cod_auxiliar IS NOT NULL'+

         ' GROUP BY 1,2,3,4';
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

End; // Busca faturamento dos produtos no Periodo >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Consiste Periodo >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAnaliseFornecedores.PeriodoConsiste: Boolean;
Begin
  Result:=False;

  // Verifica Período ==========================================================
  If (Trim(DtEdt_DtaInicio.Text)<>'') Or (Trim(DtEdt_DtaFim.Text)<>'') Then
  Begin
    Try
      StrToDate(DtEdt_DtaInicio.Text);
    Except
      msg('Data Inicial do Período Inválida !!','A');
      DtEdt_DtaInicio.SetFocus;
      Exit;
    End;

    Try
      StrToDate(DtEdt_DtaFim.Text);
    Except
      msg('Data Final do Período Inválida !!','A');
      DtEdt_DtaFim.SetFocus;
      Exit;
    End;

    If DtEdt_DtaFim.Date<DtEdt_DtaInicio.Date Then
    Begin
      msg('Período Inválido !!','A');
      DtEdt_DtaInicio.Clear;
      DtEdt_DtaFim.Clear;
      DtEdt_DtaInicio.SetFocus;
      Exit;
    End;
  End
  Else // If (Trim(DtEdt_DtaInicio.Text)<>'') Or (Trim(DtEdt_DtaFim.Text)<>'') Then
  Begin
    msg('Período Inválido !!','A');
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End; // If (Trim(DtEdt_DtaInicio.Text)<>'') Or (Trim(DtEdt_DtaFim.Text)<>'') Then

  Result:=True;
End; // Consiste Periodo >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Cria Series dos Graficos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.CriaSeriesGraficos;
Begin

  // Cria Serie do Grafico Lojas ===============================================
  gsPizzaLojas:=TPieSeries.Create(Self);

  gsPizzaLojas.ParentChart:=DbGrafico_Lojas;
  gsPizzaLojas.Clear;
  gsPizzaLojas.Marks.Style:=smsLabelPercent; // Descrição/Percentual
  gsPizzaLojas.Marks.Arrow.Color:=clBlack;
  gsPizzaLojas.Marks.Arrow.Width:=3;
  gsPizzaLojas.Marks.Visible:=True;
  gsPizzaLojas.Circled:=False;

  // Cria Serie do Grafico Fornecedores ========================================
  gsPizzaForn:=TPieSeries.Create(Self);

  gsPizzaForn.ParentChart:=DbGrafico_Fornecedores;
  gsPizzaForn.Clear;
  gsPizzaForn.Marks.Style:=smsLabel;
  gsPizzaForn.Marks.Arrow.Color:=clBlack;
  gsPizzaForn.Marks.Arrow.Width:=3;
  gsPizzaForn.Marks.Visible:=True;
  gsPizzaForn.Circled:=False;

  // Cria Serie do Grafico Setores =============================================
  gsPizzaSetores:=TPieSeries.Create(Self);

  gsPizzaSetores.ParentChart:=DbGrafico_Setores;
  gsPizzaSetores.Clear;
  gsPizzaSetores.Marks.Style:=smsLabel;
  gsPizzaSetores.Marks.Arrow.Color:=clBlack;
  gsPizzaSetores.Marks.Arrow.Width:=3;
  gsPizzaSetores.Marks.Visible:=True;
  gsPizzaSetores.Circled:=False;

End; // Cria Series dos Graficos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Acerta Formatos de Apresenta dos Graficos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.AcertaGraficos;
Begin
  //============================================================================
  // Acerta Grafico das Lojas ==================================================
  //============================================================================
  DbGrafico_Lojas.SeriesList.Clear;
  DbGrafico_Lojas.AxisVisible:=True;

  // Cor e Largura da Lateral ==================================================
  DbGrafico_Lojas.LeftWall.Brush.Color:=clDefault;
  DbGrafico_Lojas.LeftWall.Brush.Style:=bsSolid;
  DbGrafico_Lojas.LeftWall.Color:=$0080FFFF;
  DbGrafico_Lojas.LeftWall.Pen.Width:=2;

  // Lateral Solida ============================================================
  DbGrafico_Lojas.LeftWall.Dark3D:=True;

  // 3D nas Laterais ===========================================================
  DbGrafico_Lojas.View3DWalls:=True;
  DbGrafico_Lojas.View3DOptions.Orthogonal:=True;

  // OdirApaggar - 30/05/2018
//  // Linhas Laterais, Chão e Fundo =============================================
//  DbGrafico_Lojas.LeftAxis.Grid.Visible:=True;
//  DbGrafico_Lojas.BottomAxis.Grid.Visible:=True;

  // Titulo ====================================================================
  DbGrafico_Lojas.Title.Text.Clear;
  DbGrafico_Lojas.Title.Text.Add('GRÁFICO DAS LOJAS');
  // Acerta Grafico das Lojas ==================================================
  //============================================================================

  //============================================================================
  // Acerta Grafico dos Fornecedores ===========================================
  //============================================================================
  DbGrafico_Fornecedores.SeriesList.Clear;
  DbGrafico_Fornecedores.AxisVisible:=True;

  // Cor e Largura da Lateral ==================================================
  DbGrafico_Fornecedores.LeftWall.Brush.Color:=clDefault;
  DbGrafico_Fornecedores.LeftWall.Brush.Style:=bsSolid;
  DbGrafico_Fornecedores.LeftWall.Color:=$0080FFFF;
  DbGrafico_Fornecedores.LeftWall.Pen.Width:=2;

  // Lateral Solida ============================================================
  DbGrafico_Fornecedores.LeftWall.Dark3D:=True;

  // 3D nas Laterais ===========================================================
  DbGrafico_Fornecedores.View3DWalls:=True;
  DbGrafico_Fornecedores.View3DOptions.Orthogonal:=True;

  // Linhas Laterais, Chão e Fundo =============================================
// OdirApaggar - 30/05/2018
//  DbGrafico_Fornecedores.LeftAxis.Grid.Visible:=True;
//  DbGrafico_Fornecedores.BottomAxis.Grid.Visible:=True;

  // Titulo ====================================================================
  DbGrafico_Fornecedores.Title.Text.Clear;
  DbGrafico_Fornecedores.Title.Text.Add('GRÁFICO DOS FORNECEDORES');
  // Acerta Grafico dos Fornecedores ===========================================
  //============================================================================

  //============================================================================
  // Acerta Grafico dos Setores ================================================
  //============================================================================
  DbGrafico_Setores.SeriesList.Clear;
  DbGrafico_Setores.AxisVisible:=True;

  // Cor e Largura da Lateral ==================================================
  DbGrafico_Setores.LeftWall.Brush.Color:=clDefault;
  DbGrafico_Setores.LeftWall.Brush.Style:=bsSolid;
  DbGrafico_Setores.LeftWall.Color:=$0080FFFF;
  DbGrafico_Setores.LeftWall.Pen.Width:=2;

  // Lateral Solida ============================================================
  DbGrafico_Setores.LeftWall.Dark3D:=True;

  // 3D nas Laterais ===========================================================
  DbGrafico_Setores.View3DWalls:=True;
  DbGrafico_Setores.View3DOptions.Orthogonal:=True;

// OdirApaggar - 30/05/2018
  // Linhas Laterais, Chão e Fundo =============================================
//  DbGrafico_Setores.LeftAxis.Grid.Visible:=True;
//  DbGrafico_Setores.BottomAxis.Grid.Visible:=True;

  // Titulo ====================================================================
  DbGrafico_Setores.Title.Text.Clear;
  DbGrafico_Setores.Title.Text.Add('GRÁFICO DOS SETORES');
  // Acerta Grafico dos Setores ================================================
  //============================================================================
End; // Acerta Formatos de Apresenta dos Graficos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Fecha Series de Graficos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.FechaSeriesGraficos;
Begin
  Try
    If gsPizzaLojas<>nil Then
     FreeAndNil(gsPizzaLojas);
  Except
  End;

  Try
    If gsPizzaForn<>nil Then
     FreeAndNil(gsPizzaForn);
  Except
  End;

  Try
    If gsPizzaSetores<>nil Then
     FreeAndNil(gsPizzaSetores);
  Except
  End;
End; // Fecha Series de Graficos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmAnaliseFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSair Then
   Begin
     Action := caHide; // caFree;
   End
  Else
   Begin
     msg('Para Sair Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Fecha Series dos Graficos =================================================
  FechaSeriesGraficos;
end;

procedure TFrmAnaliseFornecedores.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
Var
  MySql: String;
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Balão ///////////////////////////////////////////////
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_MinimizarGraficoLojas.Handle, @ti, TipoDoIcone, 'Maximizar/Minimivar', 'GRÃFICO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_MinimizarGraficoForn.Handle, @ti, TipoDoIcone, 'Maximizar/Minimivar', 'GRÃFICO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_MinimizarGraficoSetores.Handle, @ti, TipoDoIcone, 'Maximizar/Minimivar', 'GRÃFICO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_MinimizarGraficos.Handle, @ti, TipoDoIcone, 'Minimivar/Maximizar', 'GRÃFICOS');
  //////////////////////////////////////////////////////////////////////////////

  // Acerta Graficos ===========================================================
  AcertaGraficos;

  // Cria Serie do Grafico Lojas ===============================================
  CriaSeriesGraficos;

  with gsPizzaForn do
  Begin
    Clear;
    Add(20, 'JAN', clRed);
    Add(100, 'FEV', clWindow);
  end;

  with gsPizzaSetores do
  Begin
    Clear;
    Add(20, 'JAN', clRed);
    Add(50, 'FEV', cl3DLight);
    Add(20, 'MAR', clBlue);
    Add(50, 'JUN', clGray);
    Add(21, 'SET', clMaroon);
    Add(25, 'OUT', clGray);
  end;

  // Busca Lojas ===============================================================
  MySql:=' SELECT l.nome_emp||''-''||l.empresa Loja'+
         ' FROM LINXLOJAS l'+
         ' WHERE l.empresa NOT IN (2, 5)'+ // Mostardeiro
         ' ORDER BY 1';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  Cbx_Lojas.Items.Clear;
  Cbx_Lojas.Items.Add('=== TODAS AS LOJAS ===');

  DMBelShop.CDS_BuscaRapida.DisableControls;
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    Cbx_Lojas.Items.Add(DMBelShop.CDS_BuscaRapida.FieldByName('Loja').AsString);

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.EnableControls;
  DMBelShop.CDS_BuscaRapida.Close;

  // Acerta Periodo ============================================================
//  DtEdt_DtaInicio.Date:=PrimUltDia(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor),'P');
//  DtEdt_DtaFim.Date   :=StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)));

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  
end;

procedure TFrmAnaliseFornecedores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmAnaliseFornecedores.FormShow(Sender: TObject);
begin
  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSair:=False;

  msg('MÓDULO EM DESEMVOLVIMENTO !!','A');

end;

procedure TFrmAnaliseFornecedores.Bt_FecharClick(Sender: TObject);
begin
  DMVirtual.CDS_V_AnaliseForn.Close;

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  bgSair:=True;
  Close;

end;

procedure TFrmAnaliseFornecedores.Bt_MinimizarGraficosClick(  Sender: TObject);
begin
  If Pan_Solicitacoes.Height=50 Then
   Pan_Solicitacoes.Height:=308
  Else
   Pan_Solicitacoes.Height:=50;
end;

procedure TFrmAnaliseFornecedores.Bt_BuscaFornecedorClick(Sender: TObject);
Var
  MySql: String;
begin

  EdtCodFornecedor.Clear;
  EdtDesFornecedor.Clear;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ======================================================
  MySql:=' SELECT fo.nome_cliente Fornecedor, fo.cod_cliente Codigo'+
         ' FROM LINXCLIENTESFORNEC fo'+
         ' WHERE fo.tipo_cliente IN (''F'',''A'',''J'')'+
         ' AND   EXISTS(SELECT 1'+
         '              FROM LINXPRODUTOS pr'+
         '              WHERE pr.cod_fornecedor = fo.cod_cliente'+
         '              AND   pr.desativado = ''N'')'+
         ' order by fo.nome_cliente';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Codigo').AsString)='' Then
  Begin
    msg('Sem Registro a Listar !!','A');
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Fornecedor';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Fornecedor';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    EdtCodFornecedor.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtDesFornecedor.Text:=FrmPesquisa.EdtDescricao.Text;
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);

end;

procedure TFrmAnaliseFornecedores.Bt_BuscaSetorClick(Sender: TObject);
Var
  MySql: String;
begin

  EdtCodSetor.Clear;
  EdtDesSetor.Clear;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ======================================================
  MySql:=' SELECT DISTINCT p.desc_setor Setor,  p.id_setor Codigo'+
         ' FROM LINXPRODUTOS p'+
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
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Setor';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Setor';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    EdtCodSetor.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtDesSetor.Text:=FrmPesquisa.EdtDescricao.Text;
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmAnaliseFornecedores.Button1Click(Sender: TObject);
Var
  hHrInicio, hHrFim: String;
begin
  hHrInicio:='';
  hHrFim:='';
  hHrInicio:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

  DMVirtual.CDS_V_AnaliseForn.Open;

  // APRESENTA O RESULTA DO TEMPO FINAL
  hHrFim:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
  msg('TEMPO: '+TimeToStr(StrToTime(hHrFim)-StrToTime(hHrInicio)),'A');

  hHrInicio:='';
  hHrFim:='';
  
end;

procedure TFrmAnaliseFornecedores.Bt_MinimizarGraficoLojasClick(Sender: TObject);
begin
  If Dbg_Produtos.Align=alClient Then
  Begin
    iPanHeight:=Pan_Solicitacoes.Height;

    Dbg_Produtos.Align    :=alNone;
    Pan_Solicitacoes.Align:=alClient;
    Pan_Solicitacoes.BringToFront;

    If (Sender is TJvXPButton) Then
    Begin
      If (Sender as TJvXPButton).Name='Bt_MinimizarGraficoLojas' Then
      Begin
        iGraHeight:=DbGrafico_Lojas.Height;
        iGraLeft  :=DbGrafico_Lojas.Left;
        iGraWidth :=DbGrafico_Lojas.Width;
        iGraTop   :=DbGrafico_Lojas.Top;

        DbGrafico_Lojas.Align:=alClient;
        DbGrafico_Lojas.BringToFront;
      End; // If (Sender as TJvXPButton).Name='Bt_MinimizarGraficoLojas' Then

      If (Sender as TJvXPButton).Name='Bt_MinimizarGraficoForn' Then
      Begin
        iGraHeight:=DbGrafico_Fornecedores.Height;
        iGraLeft  :=DbGrafico_Fornecedores.Left;
        iGraWidth :=DbGrafico_Fornecedores.Width;
        iGraTop   :=DbGrafico_Fornecedores.Top;

        DbGrafico_Fornecedores.Align:=alClient;
        DbGrafico_Fornecedores.BringToFront;
      End; // If (Sender as TJvXPButton).Name='Bt_MinimizarGraficoForn' Then

      If (Sender as TJvXPButton).Name='Bt_MinimizarGraficoSetores' Then
      Begin
        iGraHeight:=DbGrafico_Setores.Height;
        iGraLeft  :=DbGrafico_Setores.Left;
        iGraWidth :=DbGrafico_Setores.Width;
        iGraTop   :=DbGrafico_Setores.Top;

        DbGrafico_Setores.Align:=alClient;
        DbGrafico_Setores.BringToFront;
      End; // If (Sender as TJvXPButton).Name='Bt_MinimizarGraficoSetores' Then

    End; // If (Sender is TJvXPButton) Then

    Exit;
  End;

  If Dbg_Produtos.Align=alNone Then
  Begin
    Pan_Solicitacoes.Align :=alTop;
    Pan_Solicitacoes.Height:=iPanHeight;

    If (Sender is TJvXPButton) Then
    Begin
      If (Sender as TJvXPButton).Name='Bt_MinimizarGraficoLojas' Then
      Begin
        DbGrafico_Lojas.Align :=alNone;
        DbGrafico_Lojas.Height:=iGraHeight;
        DbGrafico_Lojas.Left  :=iGraLeft;
        DbGrafico_Lojas.Width :=iGraWidth;
        DbGrafico_Lojas.Top   :=iGraTop;
      End; // If (Sender as TJvXPButton).Name='Bt_MinimizarGraficoLojas' Then

      If (Sender as TJvXPButton).Name='Bt_MinimizarGraficoForn' Then
      Begin
        DbGrafico_Fornecedores.Align :=alNone;
        DbGrafico_Fornecedores.Height:=iGraHeight;
        DbGrafico_Fornecedores.Left  :=iGraLeft;
        DbGrafico_Fornecedores.Width :=iGraWidth;
        DbGrafico_Fornecedores.Top   :=iGraTop;
      End; // If (Sender as TJvXPButton).Name='Bt_MinimizarGraficoForn' Then

      If (Sender as TJvXPButton).Name='Bt_MinimizarGraficoSetores' Then
      Begin
        DbGrafico_Setores.Align :=alNone;
        DbGrafico_Setores.Height:=iGraHeight;
        DbGrafico_Setores.Left  :=iGraLeft;
        DbGrafico_Setores.Width :=iGraWidth;
        DbGrafico_Setores.Top   :=iGraTop;
      End; // If (Sender as TJvXPButton).Name='Bt_MinimizarGraficoSetores' Then

    End; // If (Sender is TJvXPButton) Then
    Dbg_Produtos.Align:=alClient;

    Exit;
  End;
end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosDrawColumnCell(Sender: TObject;
           const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  // Desenha um checkbox no dbgrid
  if Column.FieldName = 'LOJA1' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if ((Sender as TDBGrid).DataSource.Dataset.FieldByName('LOJA1').AsInteger = 1) then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosDblClick(Sender: TObject);
begin
  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  (Sender as TDBGrid).DataSource.Dataset.Edit;

  If (Sender as TDBGrid).SelectedField.FieldName='LOJA1' Then //-- DataSource.Dataset.seFieldByName('LOJA1').FieldName='LOJA1' Then
  Begin
    (Sender as TDBGrid).DataSource.Dataset.FieldByName('LOJA1').AsInteger :=
      IfThen ((Sender as TDBGrid).DataSource.Dataset.FieldByName('LOJA1').AsInteger = 1, 0, 1);
  End;

  (Sender as TDBGrid).DataSource.Dataset.Post;
end;

procedure TFrmAnaliseFornecedores.DtEdt_DtaInicioExit(Sender: TObject);
Var
  b: Boolean;
begin
  // Validade Dta do Inicio do Periodo =========================================
  b:=True;
  Try
    StrToDate(DtEdt_DtaInicio.Text);
  Except
    b:=False;
  End;

  If not b Then
  Begin
    If msg('Período Inválido !!'+cr+cr+'Deseja Sair do Módulo ??','C')=1 Then
    Begin
      Bt_FecharClick(Self);
      Exit;
    End;

    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  // Validade Dta do Fim  do Periodo ===========================================
  b:=True;
  Try
    StrToDate(DtEdt_DtaFim.Text);
  Except
    b:=False;
  End;

  If not b Then
  Begin
    msg('Período Inválido !!','A');
    DtEdt_DtaFim.SetFocus;
    Exit;
  End;

  If Not PeriodoConsiste Then
   Exit;

  If msg('Período Informado Está CORRETO ??','C')=2 Then
  Begin
    DtEdt_DtaInicio.Clear;
    DtEdt_DtaFim.Clear;
    DtEdt_DtaInicio.SetFocus;
    Exit;
  End;

  // Busca Faturamento dos Produtos no Periodo =================================
  FaturamentoPeriodo;

  If Cbx_Lojas.ItemIndex=-1 Then
   Cbx_Lojas.ItemIndex:=0;

  Cbx_LojasChange(Self);

end;

procedure TFrmAnaliseFornecedores.Cbx_LojasChange(Sender: TObject);
begin
  // Atualiza Graficos =========================================================
  AtualizaGraficos;
end;

end.

