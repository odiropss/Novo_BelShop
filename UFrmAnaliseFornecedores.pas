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
  ToolEdit, CurrEdit, Grids, DBGrids, DBGridJul, Math, JvRadioButton;

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
    Bt_GraficosMinMax: TJvXPButton;
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
    Bt_GraficoLojasMinMax: TJvXPButton;
    Bt_GraficoFornMinMax: TJvXPButton;
    Bt_GraficoSetoresMinMax: TJvXPButton;
    OdirPanApres: TPanel;
    Rb_GraficoLojasNome: TJvRadioButton;
    Rb_GraficoLojasPerc: TJvRadioButton;
    Rb_GraficoLojasNomePerc: TJvRadioButton;
    Rb_GraficoFornNome: TJvRadioButton;
    Rb_GraficoFornPerc: TJvRadioButton;
    Rb_GraficoFornNomePerc: TJvRadioButton;
    Rb_GraficoSetoresNome: TJvRadioButton;
    Rb_GraficoSetoresPerc: TJvRadioButton;
    Rb_GraficoSetoresNomePerc: TJvRadioButton;
    Bt_GraficoLojasGirar: TJvXPButton;
    Bt_GraficoFornGirar: TJvXPButton;
    Bt_GraficoSetoresGirar: TJvXPButton;
    Label2: TLabel;
    Bt_BuscaMixProdutos: TJvXPButton;
    Rb_GraficoLojasNomeVlr: TJvRadioButton;
    Rb_GraficoLojasVlr: TJvRadioButton;
    Rb_GraficoFornVlr: TJvRadioButton;
    Rb_GraficoFornNomeVlr: TJvRadioButton;
    Rb_GraficoSetoresVlr: TJvRadioButton;
    Rb_GraficoSetoresNomeVlr: TJvRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure Bt_GraficosMinMaxClick(Sender: TObject);

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
    Procedure GraficosFornecedores;
    Procedure GraficosSetores;

    Function  PeriodoConsiste: Boolean;

    Procedure FaturamentoPeriodo;

    Procedure MixProdutos;

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure Bt_BuscaFornecedorClick(Sender: TObject);
    procedure Bt_BuscaSetorClick(Sender: TObject);
    procedure Bt_GraficoLojasMinMaxClick(Sender: TObject);
    procedure Dbg_ProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ProdutosDblClick(Sender: TObject);
    procedure DtEdt_DtaInicioExit(Sender: TObject);
    procedure Cbx_LojasChange(Sender: TObject);
    procedure Rb_GraficoLojasNomeClick(Sender: TObject);
    procedure Rb_GraficoLojasNomeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_GraficoLojasGirarClick(Sender: TObject);
    procedure Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_BuscaMixProdutosClick(Sender: TObject);
    procedure Dbg_ProdutosKeyPress(Sender: TObject; var Key: Char);
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

  mMemoColLojas: TMemo; // Nome das Coluans de Lojas

implementation

uses DK_Procs1, UDMBelShop, UDMVirtual, UPesquisa, DB, UDMLinx;

{$R *.dfm}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir _ INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Mix de Produtos por Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.MixProdutos;
Var
  MySql: String;
  i: Integer;
Begin
  OdirPanApres.Caption:='AGUARDE !! Localizando MIX de Produtos...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmAnaliseFornecedores;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  DMLinx.CDS_AnaliseForn.Close;

  // Acerta CDS_AnaliseForn ====================================================
  Dbg_Produtos.Columns.Items[0].Visible:=False; // Cod_Auxiliar
  For i:=6 to Dbg_Produtos.Columns.Count-3 do
   Dbg_Produtos.Columns.Items[i].Visible:=False;

  // Cria Nomes das Colunas do DBGrid ==========================================
  FreeAndNil(mMemoColLojas);

  mMemoColLojas:=TMemo.Create(Self);
  mMemoColLojas.Visible:=False;
  mMemoColLojas.Parent:=FrmAnaliseFornecedores;
  mMemoColLojas.Width:=100;
  mMemoColLojas.Lines.Clear;

  // Monta Nome das Colunas ====================================================
  MySql:=' SELECT l.Empresa, a.Nome_Abrev'+
         ' FROM LINXLOJAS l, LINXLOJAS_ABREVIATURAS a'+
         ' WHERE l.empresa=a.empresa'+
         ' AND   l.empresa NOT IN (2,5)'+
         ' ORDER BY 1';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  DMBelShop.CDS_BuscaRapida.First;
  DMBelShop.CDS_BuscaRapida.DisableControls;
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    mMemoColLojas.Lines.Add('LOJA'+Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Empresa').AsString));

    // DBGrid.Coluna Visivel / Nome
    For i:=0 to Dbg_Produtos.Columns.Count-1 do
    Begin
      If Dbg_Produtos.Columns[i].FieldName='LOJA'+Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Empresa').AsString) Then
      Begin
        Dbg_Produtos.Columns[i].Visible:=True;
        Break;
      End;
    End;

    DMLinx.CDS_AnaliseForn.FieldByName('LOJA'+Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Empresa').AsString)).DisplayLabel:=
                                              Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Nome_Abrev').AsString);

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.First;

  Dbg_Produtos.Refresh;

  // Busca Mix de Produtos =====================================================
  MySql:=' SELECT'+
         ' TRIM(pr.cod_auxiliar) COD_AUXILIAR,'+
         ' pr.cod_produto,'+
         ' TRIM(pr.nome) NOME,'+
         ' TRIM(pr.desc_setor) DESC_SETOR,'+
         ' TRIM(pr.desc_colecao) DESC_COLECAO,';

         // Se Todas as Lojas
         If Trim(sgCodLoja)='' Then
          MySql:=
           MySql+' (SELECT mx.ind_curva FROM ES_PRODUTOS_MIX mx'+
                 '  WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=2) ABC,'+ // ABC da Empresa
                 ' CAST(COALESCE((SELECT SUM(COALESCE(fa.vlr_fat,0.00))'+
                 '                FROM w_fat_periodo fa'+
                 '                WHERE fa.cod_produto=pr.cod_produto)'+
                 ' , 0.00) AS NUMERIC(12,2)) Fat_Periodo,';

         // Se Uma Loja
         If Trim(sgCodLoja)<>'' Then
          MySql:=
           MySql+' (SELECT mx.ind_curva FROM ES_PRODUTOS_MIX mx'+
                 '  WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=23) ABC,'+ // ABC da Loja
                 ' CAST(COALESCE((SELECT SUM(COALESCE(fa.vlr_fat,0.00))'+
                 '                 FROM w_fat_periodo fa'+
                 '                 WHERE fa.cod_produto=pr.cod_produto'+
                 '                 AND   fa.empresa='+sgCodLoja+')'+
                 ' , 0.00) AS NUMERIC(12,2)) Fat_Periodo,';

  // Monta MIX Das Lojas =======================================================
  DMBelShop.CDS_BuscaRapida.First;
  For i:=1 to 35 do
  Begin
    If DMBelShop.CDS_BuscaRapida.Locate('Empresa',i,[]) Then
     MySql:=
      MySql+' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.empresa='+IntToStr(i)+')  LOJA'+IntToStr(i)+','
    Else
     MySql:=
      MySql+' 0 LOJA'+IntToStr(i)+',';
  End; // For i:=1 to 35 do

  MySql:=
   MySql+' pr.cod_fornecedor,'+
         ' (SELECT fo.nome_cliente FROM LINXCLIENTESFORNEC fo WHERE fo.cod_cliente=pr.cod_fornecedor) Forn'+

         ' FROM lINXPRODUTOS pr'+

         ' WHERE pr.id_linha<>33'+ // Brindes
         ' AND   id_colecao<>294'+ // Brindes
         ' AND   pr.desativado=''N'''+
         ' AND   pr.cod_auxiliar IS NOT NULL';

         If Trim(sgCodForn)<>'' Then
          MySql:=
           MySql+' AND   pr.cod_fornecedor='+sgCodForn;

         If Trim(sgCodSetor)<>'' Then
          MySql:=
           MySql+' And   pr.id_setor='+sgCodSetor;
  DMLinx.CDS_AnaliseForn.Close;
  DMLinx.SDS_AnaliseForn.CommandText:=MySql;
  DMLinx.CDS_AnaliseForn.Open;

  If DMLinx.CDS_AnaliseForn.Eof Then
  Begin
    msg('Sem Produto Selecionado !!','A');
    DMLinx.CDS_AnaliseForn.Close;
  End;

  OdirPanApres.Visible:=False;

End; // Busca Mix de Produtos por Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Grafico dos Setores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.GraficosSetores;
Var
  MySql: String;
  i: Integer;
  CgCor: TColor;
Begin
  OdirPanApres.Caption:='AGUARDE !! Montado Gráfico de Setores...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmAnaliseFornecedores;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Busca Faturamentos Todas os Setores =======================================
  If Trim(sgCodSetor)='' Then
  Begin
    MySql:=' SELECT pr.desc_setor SETOR,'+
           ' CAST(SUM(fa.vlr_fat) AS NUMERIC(12,2)) TOT_FAT'+
           ' FROM W_FAT_PERIODO fa, LINXPRODUTOS pr'+
           ' WHERE fa.cod_produto=pr.cod_produto';

           If Trim(sgCodLoja)<>'' Then
            MySql:=
             MySql+' AND fa.empresa='+sgCodLoja;

           If Trim(sgCodForn)<>'' Then
            MySql:=
             MySql+' AND pr.cod_fornecedor='+sgCodForn;
    MySql:=
     MySql+' GROUP BY 1';
  End; // If Trim(sgCodForn)='' Then

  // Busca Faturamentos de Um Setor ============================================
  If Trim(sgCodSetor)<>'' Then
  Begin
    MySql:=' SELECT ''OUTROS SETORES'' SETOR,'+
           ' CAST(SUM(fa.vlr_fat) AS NUMERIC(12,2)) TOT_FAT'+
           ' FROM W_FAT_PERIODO fa, LINXPRODUTOS pr'+
           ' WHERE fa.cod_produto=pr.cod_produto'+
           ' AND   pr.id_setor<>'+sgCodSetor;

           If Trim(sgCodLoja)<>'' Then
            MySql:=
             MySql+' AND fa.empresa='+sgCodLoja;

           If Trim(sgCodForn)<>'' Then
            MySql:=
             MySql+' AND pr.cod_fornecedor='+sgCodForn;

    MySql:=
     MySql+' UNION'+

           ' SELECT pr.desc_setor SETOR,'+
           ' CAST(SUM(fa.vlr_fat) AS NUMERIC(12,2)) TOT_FAT'+
           ' FROM W_FAT_PERIODO fa, LINXPRODUTOS pr'+
           ' WHERE fa.cod_produto=pr.cod_produto'+
           ' AND   pr.id_setor='+sgCodSetor;

           If Trim(sgCodLoja)<>'' Then
            MySql:=
             MySql+' AND fa.empresa='+sgCodLoja;

           If Trim(sgCodForn)<>'' Then
            MySql:=
             MySql+' AND pr.cod_fornecedor='+sgCodForn;
    MySql:=
     MySql+' GROUP BY 1';
  End; // If Trim(sgCodLoja)<>'' Then
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  // Inicializa Grafico Setores ================================================
  gsPizzaSetores.Clear;
  Rb_GraficoSetoresNome.Enabled:=False;
  Rb_GraficoSetoresNomePerc.Enabled:=False;
  Rb_GraficoSetoresNomeVlr.Enabled:=False;

  Rb_GraficoSetoresPerc.Checked:=True;

  Rb_GraficoLojasNomeClick(Rb_GraficoSetoresPerc);

  // Sem Movimentos ============================================================
  If DMBelShop.CDS_BuscaRapida.IsEmpty Then
   gsPizzaSetores.Add(0, 'Sem Movtos', clWindow);

  i:=25;
  DMBelShop.CDS_BuscaRapida.DisableControls;
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    // Todas os Setores ========================================================
    If Trim(sgCodSetor)='' Then
    Begin
      If i=0 Then
       i:=25;

      // Inc(i);
      i:=i-1;
      CgCor:=ArrayCores_Global[i];
    End; // If Trim(sgCodSetor)='' Then

    // Uma Setor ===============================================================
    If Trim(sgCodSetor)<>'' Then
    Begin
      If DMBelShop.CDS_BuscaRapida.FieldByName('Setor').AsString='OUTROS SETORES' Then
       CgCor:=clWindow
      Else
       CgCor:=clGreen;
    End; // If Trim(sgCodSetor)<>'' Then

    gsPizzaSetores.Add(DMBelShop.CDS_BuscaRapida.FieldByName('Tot_Fat').AsCurrency,
                       DMBelShop.CDS_BuscaRapida.FieldByName('Setor').AsString, CgCor);

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do

  DMBelShop.CDS_BuscaRapida.EnableControls;
  DMBelShop.CDS_BuscaRapida.Close;

  OdirPanApres.Visible:=False;

End; // Grafico dos Setores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Grafico dos Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.GraficosFornecedores;
Var
  MySql: String;
  i: Integer;
  CgCor: TColor;
Begin
  OdirPanApres.Caption:='AGUARDE !! Montado Gráfico de Fornecedores...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmAnaliseFornecedores;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Busca Faturamentos Todas os Fornecedores - Tops 15 ========================
  If Trim(sgCodForn)='' Then
  Begin
    MySql:=' SELECT FIRST 15'+
           ' fo.nome_cliente FORNECEDOR,'+
           ' CAST(SUM(fa.vlr_fat) AS NUMERIC(12,2)) TOT_FAT'+
           ' FROM W_FAT_PERIODO fa, LINXPRODUTOS pr, lINXCLIENTESFORNEC fo'+
           ' WHERE fa.cod_produto=pr.cod_produto'+
           ' AND   pr.cod_fornecedor=fo.cod_cliente';

           If Trim(sgCodLoja)<>'' Then
            MySql:=
             MySql+' AND fa.empresa='+sgCodLoja;

           If Trim(sgCodSetor)<>'' Then
            MySql:=
             MySql+' AND pr.id_setor='+sgCodSetor;
    MySql:=
     MySql+' GROUP BY 1'+
           ' ORDER BY 2 DESC';
  End; // If Trim(sgCodLoja)='' Then

  // Busca Faturamentos de Um Fornecedor =======================================
  If Trim(sgCodForn)<>'' Then
  Begin
    MySql:=' SELECT ''OUTROS FORNECEDORES'' FORNECEDOR,'+
           ' CAST(SUM(fa.vlr_fat) AS NUMERIC(12,2)) TOT_FAT'+
           ' FROM W_FAT_PERIODO fa, LINXPRODUTOS pr, lINXCLIENTESFORNEC fo'+
           ' WHERE fa.cod_produto=pr.cod_produto'+
           ' AND   pr.cod_fornecedor=fo.cod_cliente'+
           ' AND   pr.cod_fornecedor<>'+sgCodForn;

           If Trim(sgCodLoja)<>'' Then
            MySql:=
             MySql+' AND fa.empresa='+sgCodLoja;

           If Trim(sgCodSetor)<>'' Then
            MySql:=
             MySql+' AND pr.id_setor='+sgCodSetor;

    MySql:=
     MySql+' UNION'+

           ' SELECT fo.nome_cliente FORNECEDOR,'+
           ' CAST(SUM(fa.vlr_fat) AS NUMERIC(12,2)) TOT_FAT'+
           ' FROM W_FAT_PERIODO fa, LINXPRODUTOS pr, lINXCLIENTESFORNEC fo'+
           ' WHERE fa.cod_produto=pr.cod_produto'+
           ' AND   pr.cod_fornecedor=fo.cod_cliente'+
           ' AND   pr.cod_fornecedor='+sgCodForn;

           If Trim(sgCodLoja)<>'' Then
            MySql:=
             MySql+' AND fa.empresa='+sgCodLoja;

           If Trim(sgCodSetor)<>'' Then
            MySql:=
             MySql+' AND pr.id_setor='+sgCodSetor;
    MySql:=
     MySql+' GROUP BY 1';
  End; // If Trim(sgCodLoja)<>'' Then
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  // Inicializa Grafico Fornecedores ===========================================
  gsPizzaForn.Clear;
  Rb_GraficoFornNome.Enabled:=False;
  Rb_GraficoFornNomePerc.Enabled:=False;
  Rb_GraficoFornNomeVlr.Enabled:=False;

  Rb_GraficoFornPerc.Checked:=True;
  Rb_GraficoLojasNomeClick(Rb_GraficoFornPerc);

  // Sem Movimentos ============================================================
  If DMBelShop.CDS_BuscaRapida.IsEmpty Then
   gsPizzaForn.Add(0, 'Sem Movtos', clWindow);

  i:=25;
  DMBelShop.CDS_BuscaRapida.DisableControls;
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    // Todas os Fornecedores ===================================================
    If Trim(sgCodForn)='' Then
    Begin
      If i=0 Then
       i:=25;

      // Inc(i);
      i:=i-1;
      CgCor:=ArrayCores_Global[i];
    End; // If Trim(sgCodForn)='' Then

    // Uma Fornecedor ==========================================================
    If Trim(sgCodForn)<>'' Then
    Begin
      If DMBelShop.CDS_BuscaRapida.FieldByName('Fornecedor').AsString='OUTROS FORNECEDORES' Then
       CgCor:=clWindow
      Else
       CgCor:=clGreen;
    End; // If Trim(sgCodForn)<>'' Then

    gsPizzaForn.Add(DMBelShop.CDS_BuscaRapida.FieldByName('Tot_Fat').AsCurrency,
                    DMBelShop.CDS_BuscaRapida.FieldByName('Fornecedor').AsString, CgCor);

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.EnableControls;
  DMBelShop.CDS_BuscaRapida.Close;

  OdirPanApres.Visible:=False;

End; // Grafico dos Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Grafico das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.GraficosLojas;
Var
  MySql: String;
  i: Integer;
  CgCor: TColor;
Begin
  OdirPanApres.Caption:='AGUARDE !! Montado Gráfico de Lojas...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmAnaliseFornecedores;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

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

  // Sem Movimentos ============================================================
  If DMBelShop.CDS_BuscaRapida.IsEmpty Then
   gsPizzaLojas.Add(0, 'Sem Movtos', clWindow);

  i:=25;
  DMBelShop.CDS_BuscaRapida.DisableControls;
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    // Todas as Lojas ==========================================================
    If Trim(sgCodLoja)='' Then
    Begin
      If i=0 Then
       i:=25;

      // Inc(i);
      i:=i-1;
      CgCor:=ArrayCores_Global[i];
    End; // If Trim(sgCodLoja)='' Then

    // Uma Loja ================================================================
    If Trim(sgCodLoja)<>'' Then
    Begin
      If DMBelShop.CDS_BuscaRapida.FieldByName('nome_abrev').AsString='OUTRAS LOJAS' Then
       CgCor:=clWindow
      Else
       CgCor:=clGreen;
    End; // If Trim(sgCodLoja)<>'' Then

    gsPizzaLojas.Add(DMBelShop.CDS_BuscaRapida.FieldByName('Tot_Fat').AsCurrency,
                     DMBelShop.CDS_BuscaRapida.FieldByName('nome_abrev').AsString, CgCor);

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.EnableControls;
  DMBelShop.CDS_BuscaRapida.Close;

  OdirPanApres.Visible:=False;

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
  sgCodSetor:=EdtCodSetor.Text;
  sgCodForn :=EdtCodFornecedor.Text;

  // ===========================================================================
  // Monta Graficos de Lojas ===================================================
  // ===========================================================================
  GraficosLojas;

  // ===========================================================================
  // Monta Graficos de Forneceores =============================================
  // ===========================================================================
  GraficosFornecedores;

  // ===========================================================================
  // Monta Graficos de Setores =================================================
  // ===========================================================================
  GraficosSetores;

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

  OdirPanApres.Caption:='AGUARDE 30 Segundos !! Calculando Faturamento do Período Solicitado...';
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
  gsPizzaLojas.Marks.Style:=smsLabel; // Descrição/Percentual
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
     If msg('Deseja Realmente Sair !!','C')=2 Then
     Begin
       Action := caNone;
       bgSair := False;
       Exit;
     End;
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

  FreeAndNil(mMemoColLojas);

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
  AddToolTip(Bt_GraficoLojasMinMax.Handle, @ti, TipoDoIcone, 'Maximizar/Minimizar', 'GRÃFICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoFornMinMax.Handle, @ti, TipoDoIcone, 'Maximizar/Minimizar', 'GRÃFICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoSetoresMinMax.Handle, @ti, TipoDoIcone, 'Maximizar/Minimizar', 'GRÃFICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficosMinMax.Handle, @ti, TipoDoIcone, 'Minimizar/Maximizar', 'GRÃFICOS');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoFornGirar.Handle, @ti, TipoDoIcone, 'Girar', 'GRÃFICOS FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoLojasGirar.Handle, @ti, TipoDoIcone, 'Girar', 'GRÃFICOS LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoSetoresGirar.Handle, @ti, TipoDoIcone, 'Girar', 'GRÃFICOS SETORES');
  //////////////////////////////////////////////////////////////////////////////

  // Acerta Graficos ===========================================================
  AcertaGraficos;

  // Cria Serie do Grafico Lojas ===============================================
  CriaSeriesGraficos;

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
  DMLinx.CDS_AnaliseForn.Close;

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  bgSair:=True;
  Close;

end;

procedure TFrmAnaliseFornecedores.Bt_GraficosMinMaxClick(  Sender: TObject);
begin
  If Pan_Solicitacoes.Height=50 Then
   Pan_Solicitacoes.Height:=308
  Else
   Pan_Solicitacoes.Height:=50;
end;

procedure TFrmAnaliseFornecedores.Bt_BuscaFornecedorClick(Sender: TObject);
Var
  MySql: String;
  bSiga: Boolean;
begin
  Dbg_Produtos.SetFocus;

  DMLinx.CDS_AnaliseForn.Close;

  EdtCodFornecedor.Clear;
  EdtDesFornecedor.Clear;

  bSiga:=True;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ======================================================
  MySql:=' SELECT fo.nome_cliente Fornecedor, fo.cod_cliente Codigo'+
         ' FROM LINXCLIENTESFORNEC fo'+
         ' WHERE EXISTS(SELECT 1'+
         '              FROM W_FAT_PERIODO fa, LINXPRODUTOS pr'+
         '              WHERE fa.cod_produto=pr.cod_produto'+
         '              AND   pr.cod_fornecedor=fo.cod_cliente)'+
         ' ORDER BY fo.nome_cliente';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('Codigo').AsString)='' Then
  Begin
    msg('Sem Fornecedor a Listar !!','A');
    FreeAndNil(FrmPesquisa);
    bSiga:=False;
  End;

  If bSiga Then
  Begin
    // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ==================
    FrmPesquisa.Campo_pesquisa:='Fornecedor';
    FrmPesquisa.Campo_Codigo:='Codigo';
    FrmPesquisa.Campo_Descricao:='Fornecedor';
    FrmPesquisa.EdtDescricao.Clear;

    // ============= ABRE FORM DE PESQUISA =====================================
    FrmPesquisa.ShowModal;

    // ============= RETORNO ===================================================
    If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
    Begin
      EdtCodFornecedor.Text:=FrmPesquisa.EdtCodigo.Text;
      EdtDesFornecedor.Text:=FrmPesquisa.EdtDescricao.Text;
    End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  End; // If bSiga Then
  FreeAndNil(FrmPesquisa);

  Cbx_LojasChange(Self);
end;

procedure TFrmAnaliseFornecedores.Bt_BuscaSetorClick(Sender: TObject);
Var
  MySql: String;
  bSiga: Boolean;
begin
  Dbg_Produtos.SetFocus;

  DMLinx.CDS_AnaliseForn.Close;

  EdtCodSetor.Clear;
  EdtDesSetor.Clear;

  bSiga:=True;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ======================================================
  MySql:=' SELECT DISTINCT pr.desc_setor SETOR, pr.id_setor CODIGO'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE EXISTS(SELECT 1'+
         '              FROM W_FAT_PERIODO fa'+
         '              WHERE fa.cod_produto=pr.cod_produto)'+
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
    bSiga:=False;
  End;

  If bSiga Then
  Begin
    // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ==================
    FrmPesquisa.Campo_pesquisa:='Setor';
    FrmPesquisa.Campo_Codigo:='Codigo';
    FrmPesquisa.Campo_Descricao:='Setor';
    FrmPesquisa.EdtDescricao.Clear;

    // ============= ABRE FORM DE PESQUISA =====================================
    FrmPesquisa.ShowModal;

    // ============= RETORNO ===================================================
    If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
    Begin
      EdtCodSetor.Text:=FrmPesquisa.EdtCodigo.Text;
      EdtDesSetor.Text:=FrmPesquisa.EdtDescricao.Text;
    End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  End; // If bSiga Then
  FreeAndNil(FrmPesquisa);

  Cbx_LojasChange(Self);
end;

procedure TFrmAnaliseFornecedores.Bt_GraficoLojasMinMaxClick(Sender: TObject);
begin

  // Mazimina Grafico ==========================================================
  If Dbg_Produtos.Align=alClient Then
  Begin
    iPanHeight:=Pan_Solicitacoes.Height;

    Dbg_Produtos.Align    :=alNone;
    Pan_Solicitacoes.Align:=alClient;
    Pan_Solicitacoes.BringToFront;

    If (Sender is TJvXPButton) Then
    Begin
      If (Sender as TJvXPButton).Name='Bt_GraficoLojasMinMax' Then
      Begin
        iGraHeight:=DbGrafico_Lojas.Height;
        iGraLeft  :=DbGrafico_Lojas.Left;
        iGraWidth :=DbGrafico_Lojas.Width;
        iGraTop   :=DbGrafico_Lojas.Top;

        DbGrafico_Lojas.Align:=alClient;
        DbGrafico_Lojas.BringToFront;
      End; // If (Sender as TJvXPButton).Name='Bt_GraficoLojasMinMax' Then

      If (Sender as TJvXPButton).Name='Bt_GraficoFornMinMax' Then
      Begin
        iGraHeight:=DbGrafico_Fornecedores.Height;
        iGraLeft  :=DbGrafico_Fornecedores.Left;
        iGraWidth :=DbGrafico_Fornecedores.Width;
        iGraTop   :=DbGrafico_Fornecedores.Top;

        Rb_GraficoFornNome.Enabled:=True;
        Rb_GraficoFornNomePerc.Enabled:=True;
        Rb_GraficoFornNomeVlr.Enabled:=True;

        DbGrafico_Fornecedores.Align:=alClient;
        DbGrafico_Fornecedores.BringToFront;
      End; // If (Sender as TJvXPButton).Name='Bt_GraficoFornMinMax' Then

      If (Sender as TJvXPButton).Name='Bt_GraficoSetoresMinMax' Then
      Begin
        iGraHeight:=DbGrafico_Setores.Height;
        iGraLeft  :=DbGrafico_Setores.Left;
        iGraWidth :=DbGrafico_Setores.Width;
        iGraTop   :=DbGrafico_Setores.Top;

        Rb_GraficoSetoresNome.Enabled:=True;
        Rb_GraficoSetoresNomePerc.Enabled:=True;
        Rb_GraficoSetoresNomeVlr.Enabled:=True;

        DbGrafico_Setores.Align:=alClient;
        DbGrafico_Setores.BringToFront;
      End; // If (Sender as TJvXPButton).Name='Bt_GraficoSetoresMinMax' Then
    End; // If (Sender is TJvXPButton) Then

    Exit;
  End;

  // Minimiza Grafico ==========================================================
  If Dbg_Produtos.Align=alNone Then
  Begin
    Pan_Solicitacoes.Align :=alTop;
    Pan_Solicitacoes.Height:=iPanHeight;

    If (Sender is TJvXPButton) Then
    Begin
      If (Sender as TJvXPButton).Name='Bt_GraficoLojasMinMax' Then
      Begin
        DbGrafico_Lojas.Align :=alNone;
        DbGrafico_Lojas.Height:=iGraHeight;
        DbGrafico_Lojas.Left  :=iGraLeft;
        DbGrafico_Lojas.Width :=iGraWidth;
        DbGrafico_Lojas.Top   :=iGraTop;
      End; // If (Sender as TJvXPButton).Name='Bt_GraficoLojasMinMax' Then

      If (Sender as TJvXPButton).Name='Bt_GraficoFornMinMax' Then
      Begin
        Rb_GraficoFornNome.Enabled:=False;
        Rb_GraficoFornNomePerc.Enabled:=False;
        Rb_GraficoFornNomeVlr.Enabled:=False;

        Rb_GraficoFornPerc.Checked:=True;
        Rb_GraficoLojasNomeClick(Rb_GraficoFornPerc);

        DbGrafico_Fornecedores.Align :=alNone;
        DbGrafico_Fornecedores.Height:=iGraHeight;
        DbGrafico_Fornecedores.Left  :=iGraLeft;
        DbGrafico_Fornecedores.Width :=iGraWidth;
        DbGrafico_Fornecedores.Top   :=iGraTop;
      End; // If (Sender as TJvXPButton).Name='Bt_GraficoFornMinMax' Then

      If (Sender as TJvXPButton).Name='Bt_GraficoSetoresMinMax' Then
      Begin
        Rb_GraficoSetoresNome.Enabled:=False;
        Rb_GraficoSetoresNomePerc.Enabled:=False;
        Rb_GraficoSetoresNomeVlr.Enabled:=False;

        Rb_GraficoSetoresPerc.Checked:=True;
        Rb_GraficoLojasNomeClick(Rb_GraficoSetoresPerc);

        DbGrafico_Setores.Align :=alNone;
        DbGrafico_Setores.Height:=iGraHeight;
        DbGrafico_Setores.Left  :=iGraLeft;
        DbGrafico_Setores.Width :=iGraWidth;
        DbGrafico_Setores.Top   :=iGraTop;
      End; // If (Sender as TJvXPButton).Name='Bt_GraficoSetoresMinMax' Then

    End; // If (Sender is TJvXPButton) Then
    Dbg_Produtos.Align:=alClient;

    Exit;
  End;
end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosDrawColumnCell(Sender: TObject;
           const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
  MySql: String;
  i: Integer;

  Check: Integer;
  R: TRect;
begin
  inherited;

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  // Desenha um checkbox no dbgrid =============================================
  For i:=0 to mMemoColLojas.Lines.Count-1 do
  Begin
    If Column.FieldName=mMemoColLojas.Lines[i] Then
    Begin
      TDBGrid(Sender).Canvas.FillRect(Rect);

      If ((Sender as TDBGrid).DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger = 1) Then
        Check := DFCS_CHECKED
      else
        Check := 0;

      R := Rect;
      InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    End;
  End; // For i:=0 to mMemoColLojas.Lines.Count-1 do

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosDblClick(Sender: TObject);
//Var
//  MySql: String;
//  i: Integer;
begin
//  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
//    Exit;
//
//  // Alterar Mix ===============================================================
//  For i:=0 to mMemoColLojas.Lines.Count-1 do
//  Begin
//    If (Sender as TDBGrid).SelectedField.FieldName=mMemoColLojas.Lines[i] Then
//    Begin
//      (Sender as TDBGrid).DataSource.Dataset.Edit;
//
//      (Sender as TDBGrid).DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger :=
//        IfThen ((Sender as TDBGrid).DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger = 1, 0, 1);
//
//      (Sender as TDBGrid).DataSource.Dataset.Post;
//
//      Break;
//    End;
//  End; // For i:=0 to mMemoColLojas.Lines.Count-1 do

end;

procedure TFrmAnaliseFornecedores.DtEdt_DtaInicioExit(Sender: TObject);
Var
  b: Boolean;
begin
  // Limpa Graficos ============================================================
  gsPizzaForn.Clear;
  gsPizzaLojas.Clear;
  gsPizzaSetores.Clear;

  // Validade Dta do Inicio do Periodo =========================================
  If (Sender as TcxDateEdit).Name='DtEdt_DtaInicio' Then
  Begin
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
    End; // If not b Then

    DtEdt_DtaFim.SetFocus;
    Exit;
  End; // If (Sender as TcxDateEdit).Name='DtEdt_DtaInicio') Then

  If (Sender as TcxDateEdit).Name='DtEdt_DtaFim' Then
  Begin
    b:=True;
    Try
      StrToDate(DtEdt_DtaFim.Text);
    Except
      b:=False;
    End;

    If not b Then
    Begin
      msg('Período Inválido !!','A');
      DtEdt_DtaInicio.SetFocus;
      Exit;
    End; // If not b Then
  End; // If (Sender as TcxDateEdit).Name='DtEdt_DtaFim') Then

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
  DMLinx.CDS_AnaliseForn.Close;

  AtualizaGraficos;
end;

procedure TFrmAnaliseFornecedores.Rb_GraficoLojasNomeClick(Sender: TObject);
begin
  If ((Sender as TJvRadioButton).Name='Rb_GraficoLojasNome') Or
     ((Sender as TJvRadioButton).Name='Rb_GraficoLojasPerc') Or
     ((Sender as TJvRadioButton).Name='Rb_GraficoLojasNomePerc') Or
     ((Sender as TJvRadioButton).Name='Rb_GraficoLojasVlr') Or
     ((Sender as TJvRadioButton).Name='Rb_GraficoLojasNomeVlr') Then
  Begin
    AcertaRb_Style(Rb_GraficoLojasNome);
    AcertaRb_Style(Rb_GraficoLojasNomePerc);
    AcertaRb_Style(Rb_GraficoLojasPerc);
    AcertaRb_Style(Rb_GraficoLojasVlr);
    AcertaRb_Style(Rb_GraficoLojasNomeVlr);

    If Rb_GraficoLojasNome.Checked     Then gsPizzaLojas.Marks.Style:=smsLabel;
    If Rb_GraficoLojasNomePerc.Checked Then gsPizzaLojas.Marks.Style:=smsLabelPercent;
    If Rb_GraficoLojasPerc.Checked     Then gsPizzaLojas.Marks.Style:=smsPercent;
    If Rb_GraficoLojasVlr.Checked      Then gsPizzaLojas.Marks.Style:=smsValue;
    If Rb_GraficoLojasNomeVlr.Checked  Then gsPizzaLojas.Marks.Style:=smsLabelValue;
  End; // If (Sender as TJvRadioButton).Name='Rb_GraficoLojasNome' Then

  If ((Sender as TJvRadioButton).Name='Rb_GraficoFornNome') Or
     ((Sender as TJvRadioButton).Name='Rb_GraficoFornPerc') Or
     ((Sender as TJvRadioButton).Name='Rb_GraficoFornNomePerc') Or
     ((Sender as TJvRadioButton).Name='Rb_GraficoFornVlr') Or
     ((Sender as TJvRadioButton).Name='Rb_GraficoFornNomeVlr') Then
  Begin
    AcertaRb_Style(Rb_GraficoFornNomePerc);
    AcertaRb_Style(Rb_GraficoFornPerc);
    AcertaRb_Style(Rb_GraficoFornNome);
    AcertaRb_Style(Rb_GraficoFornVlr);
    AcertaRb_Style(Rb_GraficoFornNomeVlr);

    If Rb_GraficoFornNomePerc.Checked Then gsPizzaForn.Marks.Style:=smsLabelPercent;
    If Rb_GraficoFornPerc.Checked     Then gsPizzaForn.Marks.Style:=smsPercent;
    If Rb_GraficoFornNome.Checked     Then gsPizzaForn.Marks.Style:=smsLabel;
    If Rb_GraficoFornVlr.Checked      Then gsPizzaForn.Marks.Style:=smsValue;
    If Rb_GraficoFornNomeVlr.Checked  Then gsPizzaForn.Marks.Style:=smsLabelValue;
  End; // If (Sender as TJvRadioButton).Name='Rb_GraficoFornNome' Then

  If ((Sender as TJvRadioButton).Name='Rb_GraficoSetoresNome') Or
     ((Sender as TJvRadioButton).Name='Rb_GraficoSetoresPerc') Or
     ((Sender as TJvRadioButton).Name='Rb_GraficoSetoresNomePerc') Or
     ((Sender as TJvRadioButton).Name='Rb_GraficoSetoresVlr') Or
     ((Sender as TJvRadioButton).Name='Rb_GraficoSetoresNomeVlr') Then
  Begin
    AcertaRb_Style(Rb_GraficoSetoresNome);
    AcertaRb_Style(Rb_GraficoSetoresNomePerc);
    AcertaRb_Style(Rb_GraficoSetoresPerc);
    AcertaRb_Style(Rb_GraficoSetoresVlr);
    AcertaRb_Style(Rb_GraficoSetoresNomeVlr);

    If Rb_GraficoSetoresNome.Checked     Then gsPizzaSetores.Marks.Style:=smsLabel;
    If Rb_GraficoSetoresNomePerc.Checked Then gsPizzaSetores.Marks.Style:=smsLabelPercent;
    If Rb_GraficoSetoresPerc.Checked     Then gsPizzaSetores.Marks.Style:=smsPercent;
    If Rb_GraficoSetoresVlr.Checked      Then gsPizzaSetores.Marks.Style:=smsValue;
    If Rb_GraficoSetoresNomeVlr.Checked  Then gsPizzaSetores.Marks.Style:=smsLabelValue;
  End; // If (Sender as TJvRadioButton).Name='Rb_GraficoSetoresNome' Then
end;

procedure TFrmAnaliseFornecedores.Rb_GraficoLojasNomeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Rb_GraficoLojasNomeClick(Self);

end;

procedure TFrmAnaliseFornecedores.Bt_GraficoLojasGirarClick(Sender: TObject);
begin
  Dbg_Produtos.SetFocus;

  If (Sender as TJvXPButton).Name='Bt_GraficoLojasGirar' Then
   gsPizzaLojas.Rotate(300);

  If (Sender as TJvXPButton).Name='Bt_GraficoFornGirar' Then
   gsPizzaForn.Rotate(300);

  If (Sender as TJvXPButton).Name='Bt_GraficoSetoresGirar' Then
   gsPizzaSetores.Rotate(300);

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  MySql: String;
  i: Integer;
begin

  // Bloquei Ctrl + Delete =====================================================
  If (((Shift = [ssCtrl]) And (key = vk_delete))) Or (key = vk_space) Then
   Abort;

  If DMLinx.CDS_AnaliseForn.IsEmpty Then
   Exit;

  // Altera Mix da Loja =========================================================
  If key=VK_F6 Then
  Begin
    // Alterar Mix ===============================================================
    For i:=0 to mMemoColLojas.Lines.Count-1 do
    Begin
      // Coluna Selecionada
      If Dbg_Produtos.SelectedField.FieldName=mMemoColLojas.Lines[i] Then
      Begin
        Dbg_Produtos.DataSource.Dataset.Edit;

        Dbg_Produtos.DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger :=
          IfThen (Dbg_Produtos.DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger = 1, 0, 1);

        Dbg_Produtos.DataSource.Dataset.Post;

        Break;
      End;
    End; // For i:=0 to mMemoColLojas.Lines.Count-1 do
  End; // If key=VK_F6 Then
end;

procedure TFrmAnaliseFornecedores.Bt_BuscaMixProdutosClick(Sender: TObject);
begin
  Dbg_Produtos.SetFocus;

  DMLinx.CDS_AnaliseForn.Close;

  If Trim(sgCodForn)='' Then
  Begin
    msg('Favor Informar o Fornecedor !!','A');
    Exit;
  End;

  // Busca Mix de Produdos =====================================================
  MixProdutos;

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosKeyPress(Sender: TObject;var Key: Char);
begin
 if (Key = ' ') then
   Abort;

end;

end.



