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
  Commctrl, // SHOW HINT EM FORMA DE BAL�O
  ToolEdit, CurrEdit, Grids, DBGrids, DBGridJul, Math, JvRadioButton, db,
  dxSkinsdxStatusBarPainter, dxStatusBar, DBCtrls, JvExMask, JvToolEdit,
  JvMaskEdit, JvDBControls;

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
    Rb_GraficoLojasNomeVlr: TJvRadioButton;
    Rb_GraficoLojasVlr: TJvRadioButton;
    Rb_GraficoFornVlr: TJvRadioButton;
    Rb_GraficoFornNomeVlr: TJvRadioButton;
    Rb_GraficoSetoresVlr: TJvRadioButton;
    Rb_GraficoSetoresNomeVlr: TJvRadioButton;
    Dbg_Produtos: TDBGrid;
    dxStatusBar3: TdxStatusBar;
    dxStatusBar3Container10: TdxStatusBarContainerControl;
    dxStatusBar3Container11: TdxStatusBarContainerControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure Bt_GraficosMinMaxClick(Sender: TObject);

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    // Hint em Fortma de Bal�o
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Bal�o
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

    Procedure BuscaLojaSidicomEstMinMax(sCodProdLx, sCodLojaLx: String;
                                        Var sCodProdSid: String;
                                        Var sCodLojaSid: String;
                                        Var sEstMin: String;
                                        Var sEstMax: String);

    Procedure GravaEstMinimoMaximo(sCodLojaLx, sCodProdLx,
                                   sCodLojaSid, sCodProdSid,
                                   sEstMin, sEstMax: String);

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure Bt_BuscaFornecedorClick(Sender: TObject);
    procedure Bt_BuscaSetorClick(Sender: TObject);
    procedure Bt_GraficoLojasMinMaxClick(Sender: TObject);
    procedure DtEdt_DtaInicioExit(Sender: TObject);
    procedure Cbx_LojasChange(Sender: TObject);
    procedure Rb_GraficoLojasNomeClick(Sender: TObject);
    procedure Rb_GraficoLojasNomeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_GraficoLojasGirarClick(Sender: TObject);
    procedure Dbg_ProdutosColEnter(Sender: TObject);
    procedure Dbg_ProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Dbg_ProdutosDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure Dbg_ProdutosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DtEdt_DtaInicioEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
   THackDBGrid = class(TDBGrid);

const
  // Show Hint em Forma de Bal�o
  TTS_BALLOON = $40;
  TTM_SETTITLE = (WM_USER + 32);
  //////////////////////////////

var
  FrmAnaliseFornecedores: TFrmAnaliseFornecedores;

  // Show Hint em Forma de Bal�o
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  TD : TTransactionDesc; // Ponteiro de Transa��o

  bgSair,
  bgMontaCheck: Boolean;

  sgDtaIniPadrao, sgDtaFimPadrao, 
  sOrderGrid,    // Ordenar Grid
  sgCodLoja, sgCodForn, sgCodSetor: String; // Usar para Montagem dos Graficos

  // Series de Graficos Pizza
  gsPizzaLojas: TPieSeries;
  gsPizzaForn: TPieSeries;
  gsPizzaSetores: TPieSeries;

  iPanHeight, // Posi��o Inicial do Painel Pan_Solicitacoes
  iGraHeight, iGraLeft, iGraWidth, iGraTop: Integer; // Posi��o Inicial do Graficos

  mMemoColLojas: TMemo; // Nome das Coluans de Lojas

implementation

uses DK_Procs1, UDMBelShop, UDMVirtual, UPesquisa, UDMLinx, SqlExpr;

{$R *.dfm}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir _ INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Codigo Loja SIDICOM e Estoques Minimo/Maximo >>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.BuscaLojaSidicomEstMinMax(sCodProdLx, sCodLojaLx: String;
                                                            Var sCodProdSid: String;
                                                            Var sCodLojaSid: String;
                                                            Var sEstMin: String;
                                                            Var sEstMax: String);
Var
  MySql: String;
Begin
  // Busca Codigo do Produtos SIDICOM ==========================================
  MySql:=' SELECT TRIM(pr.cod_auxiliar) PROD_SIDICOM'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE pr.cod_produto='+sCodProdLx;
  DMBelShop.SQLQuery1.Close;
  DMBelShop.SQLQuery1.SQL.Clear;
  DMBelShop.SQLQuery1.SQL.Add(MySql);
  DMBelShop.SQLQuery1.Open;
  sCodProdSid:=Trim(DMBelShop.SQLQuery1.FieldByName('Prod_Sidicom').AsString);
  DMBelShop.SQLQuery1.Close;

  // Busca Codigo da Loja Linx =================================================
  MySql:=' SELECT l.cod_loja'+
         ' FROM LINXLOJAS l'+
         ' WHERE l.empresa='+sCodLojaLx;
  DMBelShop.SQLQuery1.Close;
  DMBelShop.SQLQuery1.SQL.Clear;
  DMBelShop.SQLQuery1.SQL.Add(MySql);
  DMBelShop.SQLQuery1.Open;
  sCodLojaSid:=Trim(DMBelShop.SQLQuery1.FieldByName('Cod_Loja').AsString);
  DMBelShop.SQLQuery1.Close;

  // Busca Estoque Minimo/Maximo =============================================
  MySql:=' SELECT c.est_minimo, c.est_maximo'+
         ' FROM ES_FINAN_CURVA_ABC c'+
         ' WHERE c.cod_loja='+QuotedStr(sCodLojaSid)+
         ' AND   c.cod_produto='+QuotedStr(sCodProdSid);
  DMBelShop.SQLQuery1.Close;
  DMBelShop.SQLQuery1.SQL.Clear;
  DMBelShop.SQLQuery1.SQL.Add(MySql);
  DMBelShop.SQLQuery1.Open;
  sEstMin:=Trim(DMBelShop.SQLQuery1.FieldByName('Est_Minimo').AsString);
  sEstMax:=Trim(DMBelShop.SQLQuery1.FieldByName('Est_Maximo').AsString);
  DMBelShop.SQLQuery1.Close;
End; // Busca Codigo Loja SIDICOM e Estoques Minimo/Maximo >>>>>>>>>>>>>>>>>>>>>

// Grava Estoque Minimo/Maximo na Tabela ES_FINAN_CURVA_ABC >>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.GravaEstMinimoMaximo(sCodLojaLx, sCodProdLx,
                                                       sCodLojaSid, sCodProdSid,
                                                       sEstMin, sEstMax: String);
Var
  MySql: String;
Begin
  OdirPanApres.Caption:='AGUARDE !! Salvando Mix Do Produto...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmAnaliseFornecedores;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica se Transa��o esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' UPDATE ES_FINAN_CURVA_ABC cv'+
           ' SET cv.est_minimo='+sEstMin+
           ',    cv.est_maximo='+sEstMax+
           ' WHERE cv.cod_loja='+QuotedStr(sCodLojaSid)+
           ' AND   cv.cod_produto='+QuotedStr(sCodProdSid);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    MySql:=' UPDATE ES_PRODUTOS_MIX mx'+
           ' SET mx.est_minimo='+sEstMin+
           ' ,   mx.est_maximo='+sEstMax+
           ' WHERE mx.empresa='+sCodLojaLx+
           ' AND   mx.cod_produto='+sCodProdLx;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);
  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      MessageBox(Handle, pChar(e.message=cr+cr+'Entrar em Contato com o Odir !!'), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transa��o

  DateSeparator:='/';
  DecimalSeparator:=',';

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

End; // Grava Estoque Minimo/Maximo na Tabela ES_FINAN_CURVA_ABC >>>>>>>>>>>>>>>

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

  // N�o Monta CheckBox no DBGrid ==============================================
   bgMontaCheck:=False;

  // Acerta CDS_AnaliseForn ====================================================
  DMVirtual.CDS_V_MixAnaliseForn.Close;

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
  DMBelShop.SQLQuery1.Close;
  DMBelShop.SQLQuery1.SQL.Clear;
  DMBelShop.SQLQuery1.SQL.Add(MySql);
  DMBelShop.SQLQuery1.Open;

  DMBelShop.SQLQuery1.First;
  DMBelShop.SQLQuery1.DisableControls;
  While Not DMBelShop.SQLQuery1.Eof do
  Begin
    mMemoColLojas.Lines.Add('LOJA'+Trim(DMBelShop.SQLQuery1.FieldByName('Empresa').AsString));

    // DBGrid.Coluna Visivel / Nome
    For i:=0 to Dbg_Produtos.Columns.Count-1 do
    Begin
      If Dbg_Produtos.Columns[i].FieldName='LOJA'+Trim(DMBelShop.SQLQuery1.FieldByName('Empresa').AsString) Then
      Begin
        Dbg_Produtos.Columns[i].Visible:=True;
        Break;
      End;
    End;

    DMVirtual.CDS_V_MixAnaliseForn.FieldByName('LOJA'+Trim(DMBelShop.SQLQuery1.FieldByName('Empresa').AsString)).DisplayLabel:=
                                               Trim(DMBelShop.SQLQuery1.FieldByName('Nome_Abrev').AsString);

    DMBelShop.SQLQuery1.Next;
  End; // While Not DMBelShop.SQLQuery1.Eof do
  DMBelShop.SQLQuery1.First;

  Dbg_Produtos.Refresh;

  MySql:=' SELECT'+
         ' TRIM(pr.cod_auxiliar) COD_AUXILIAR,'+
         ' pr.cod_produto,'+
         ' TRIM(pr.nome) NOME,';

         // Se Todas as Lojas
         If Trim(sgCodLoja)='' Then
          MySql:=
           MySql+' (SELECT mx.ind_curva FROM ES_PRODUTOS_MIX mx'+
                 '  WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=2) ABC,'+ // ABC da Empresa
                 ' CAST(COALESCE((SELECT SUM(COALESCE(fa.vlr_fat,0.00))'+
                 '                FROM ES_FAT_PERIODO fa'+
                 '                WHERE fa.cod_produto=pr.cod_produto)'+
                 ' , 0.00) AS NUMERIC(12,2)) Fat_Periodo,';

         // Se Uma Loja
         If Trim(sgCodLoja)<>'' Then
          MySql:=
           MySql+' (SELECT mx.ind_curva FROM ES_PRODUTOS_MIX mx'+
                 '  WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=23) ABC,'+ // ABC da Loja
                 ' CAST(COALESCE((SELECT SUM(COALESCE(fa.vlr_fat,0.00))'+
                 '                 FROM ES_FAT_PERIODO fa'+
                 '                 WHERE fa.cod_produto=pr.cod_produto'+
                 '                 AND   fa.empresa='+sgCodLoja+')'+
                 ' , 0.00) AS NUMERIC(12,2)) Fat_Periodo,';

  MySql:=
   MySql+' TRIM(pr.desc_setor) DESC_SETOR,'+
         ' TRIM(pr.desc_colecao) DESC_COLECAO,';

  // Monta MIX Das Lojas =======================================================
  DMBelShop.SQLQuery1.First;
  For i:=1 to 35 do
  Begin
    If DMBelShop.SQLQuery1.Locate('Empresa',i,[]) Then
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
  If Not DMBelShop.IBDB_BelShop.Connected Then
   DMBelShop.IBDB_BelShop.Connected:=True;
  DMBelShop.IBDS_Busca.Close;
  DMBelShop.IBDS_Busca.SelectSQL.Clear;
  DMBelShop.IBDS_Busca.SelectSQL.Add(MySql);
  DMBelShop.IBDS_Busca.Open;

  // Inicializa ClientDataSet Virtual
  If DMVirtual.CDS_V_MixAnaliseForn.Active Then
   DMVirtual.CDS_V_MixAnaliseForn.Close;

  DMVirtual.CDS_V_MixAnaliseForn.CreateDataSet;
  DMVirtual.CDS_V_MixAnaliseForn.IndexFieldNames:='';
  DMVirtual.CDS_V_MixAnaliseForn.Open;

  DMBelShop.IBDS_Busca.DisableControls;
  While not DMBelShop.IBDS_Busca.Eof do
  Begin
    Application.ProcessMessages;

    DMVirtual.CDS_V_MixAnaliseForn.Insert;
    For i:=0 to DMBelShop.IBDS_Busca.FieldCount-1 do
     DMVirtual.CDS_V_MixAnaliseForn.Fields[i].Assign(DMBelShop.IBDS_Busca.Fields[i]);

    DMVirtual.CDS_V_MixAnaliseForn.Post;

    DMBelShop.IBDS_Busca.Next;
  End;
  DMBelShop.IBDS_Busca.EnableControls;
  DMBelShop.IBDS_Busca.Close;

  // Monta CheckBox no DBGrid ==================================================
   bgMontaCheck:=True;

  DMVirtual.CDS_V_MixAnaliseForn.IndexFieldNames:='ABC;NOME';
  DMVirtual.CDS_V_MixAnaliseForn.First;
  Dbg_Produtos.SetFocus;
   
  OdirPanApres.Visible:=False;
End; // Busca Mix de Produtos por Loja >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Grafico dos Setores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.GraficosSetores;
Var
  MySql: String;
  i: Integer;
  CgCor: TColor;
Begin
  OdirPanApres.Caption:='AGUARDE !! Montado Gr�fico de Setores...';
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
           ' FROM ES_FAT_PERIODO fa, LINXPRODUTOS pr'+
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
           ' FROM ES_FAT_PERIODO fa, LINXPRODUTOS pr'+
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
           ' FROM ES_FAT_PERIODO fa, LINXPRODUTOS pr'+
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
  DMBelShop.SQLQuery1.Close;
  DMBelShop.SQLQuery1.SQL.Clear;
  DMBelShop.SQLQuery1.SQL.Add(MySql);
  DMBelShop.SQLQuery1.Open;

  // Inicializa Grafico Setores ================================================
  gsPizzaSetores.Clear;
  Rb_GraficoSetoresNome.Enabled:=False;
  Rb_GraficoSetoresNomePerc.Enabled:=False;
  Rb_GraficoSetoresNomeVlr.Enabled:=False;

  Rb_GraficoSetoresPerc.Checked:=True;
  Rb_GraficoLojasNomeClick(Rb_GraficoSetoresPerc);

  // Sem Movimentos ============================================================
  If DMBelShop.SQLQuery1.IsEmpty Then
   gsPizzaSetores.Add(0, 'Sem Movtos', clWindow);

  i:=25;
  DMBelShop.SQLQuery1.DisableControls;
  While Not DMBelShop.SQLQuery1.Eof do
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
      If DMBelShop.SQLQuery1.FieldByName('Setor').AsString='OUTROS SETORES' Then
       CgCor:=clWindow
      Else
       CgCor:=clGreen;
    End; // If Trim(sgCodSetor)<>'' Then

    gsPizzaSetores.Add(DMBelShop.SQLQuery1.FieldByName('Tot_Fat').AsCurrency,
                       DMBelShop.SQLQuery1.FieldByName('Setor').AsString, CgCor);

    DMBelShop.SQLQuery1.Next;
  End; // While Not DMBelShop.SQLQuery1.Eof do
  DMBelShop.SQLQuery1.EnableControls;
  DMBelShop.SQLQuery1.Close;

  OdirPanApres.Visible:=False;

End; // Grafico dos Setores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Grafico dos Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.GraficosFornecedores;
Var
  MySql: String;
  i: Integer;
  CgCor: TColor;
Begin
  OdirPanApres.Caption:='AGUARDE !! Montado Gr�fico de Fornecedores...';
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
           ' FROM ES_FAT_PERIODO fa, LINXPRODUTOS pr, lINXCLIENTESFORNEC fo'+
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
           ' FROM ES_FAT_PERIODO fa, LINXPRODUTOS pr, lINXCLIENTESFORNEC fo'+
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
           ' FROM ES_FAT_PERIODO fa, LINXPRODUTOS pr, lINXCLIENTESFORNEC fo'+
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
  DMBelShop.SQLQuery1.Close;
  DMBelShop.SQLQuery1.SQL.Clear;
  DMBelShop.SQLQuery1.SQL.Add(MySql);
  DMBelShop.SQLQuery1.Open;

  // Inicializa Grafico Fornecedores ===========================================
  gsPizzaForn.Clear;
  Rb_GraficoFornNome.Enabled:=False;
  Rb_GraficoFornNomePerc.Enabled:=False;
  Rb_GraficoFornNomeVlr.Enabled:=False;

  Rb_GraficoFornPerc.Checked:=True;
  Rb_GraficoLojasNomeClick(Rb_GraficoFornPerc);

  // Sem Movimentos ============================================================
  If DMBelShop.SQLQuery1.IsEmpty Then
   gsPizzaForn.Add(0, 'Sem Movtos', clWindow);

  i:=25;
  DMBelShop.SQLQuery1.DisableControls;
  While Not DMBelShop.SQLQuery1.Eof do
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
      If DMBelShop.SQLQuery1.FieldByName('Fornecedor').AsString='OUTROS FORNECEDORES' Then
       CgCor:=clWindow
      Else
       CgCor:=clGreen;
    End; // If Trim(sgCodForn)<>'' Then

    gsPizzaForn.Add(DMBelShop.SQLQuery1.FieldByName('Tot_Fat').AsCurrency,
                    DMBelShop.SQLQuery1.FieldByName('Fornecedor').AsString, CgCor);

    DMBelShop.SQLQuery1.Next;
  End; // While Not DMBelShop.SQLQuery1.Eof do
  DMBelShop.SQLQuery1.EnableControls;
  DMBelShop.SQLQuery1.Close;

  OdirPanApres.Visible:=False;

End; // Grafico dos Fornecedores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Grafico das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.GraficosLojas;
Var
  MySql: String;
  i: Integer;
  CgCor: TColor;
Begin
  OdirPanApres.Caption:='AGUARDE !! Montado Gr�fico de Lojas...';
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
           ' FROM ES_FAT_PERIODO f, LINXLOJAS_ABREVIATURAS a';

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
           ' FROM ES_FAT_PERIODO f, LINXLOJAS_ABREVIATURAS a';

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
           ' FROM ES_FAT_PERIODO f, LINXLOJAS_ABREVIATURAS a';

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
  DMBelShop.SQLQuery1.Close;
  DMBelShop.SQLQuery1.SQL.Clear;
  DMBelShop.SQLQuery1.SQL.Add(MySql);
  DMBelShop.SQLQuery1.Open;

  // Inicializa Grafico de Lojas ===============================================
  gsPizzaLojas.Clear;
  Rb_GraficoLojasNome.Enabled:=False;
  Rb_GraficoLojasNomePerc.Enabled:=False;
  Rb_GraficoLojasNomeVlr.Enabled:=False;

  Rb_GraficoLojasPerc.Checked:=True;
  Rb_GraficoLojasNomeClick(Rb_GraficoLojasPerc);

  // Sem Movimentos ============================================================
  If DMBelShop.SQLQuery1.IsEmpty Then
   gsPizzaLojas.Add(0, 'Sem Movtos', clWindow);

  i:=25;
  DMBelShop.SQLQuery1.DisableControls;
  While Not DMBelShop.SQLQuery1.Eof do
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
      If DMBelShop.SQLQuery1.FieldByName('nome_abrev').AsString='OUTRAS LOJAS' Then
       CgCor:=clWindow
      Else
       CgCor:=clGreen;
    End; // If Trim(sgCodLoja)<>'' Then

    gsPizzaLojas.Add(DMBelShop.SQLQuery1.FieldByName('Tot_Fat').AsCurrency,
                     DMBelShop.SQLQuery1.FieldByName('nome_abrev').AsString, CgCor);

    DMBelShop.SQLQuery1.Next;
  End; // While Not DMBelShop.SQLQuery1.Eof do
  DMBelShop.SQLQuery1.EnableControls;
  DMBelShop.SQLQuery1.Close;

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

// Show Hint em Forma de Bal�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
end; // Show Hint em Forma de Bal�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Bal�o - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>>>>>>
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

end; // Show Hint em Forma de Bal�o - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Bal�o - Posiciona do Componente >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Bal�o - Posiciona do Componente >>>>>>>>>>>>>>>>>>

// Busca faturamento dos produtos no Periodo >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.FaturamentoPeriodo;
Var
  MySql: String;
  s: String;
Begin
  MySql:=' SELECT FIRST 1 f.empresa'+
         ' FROM ES_FAT_PERIODO f'+
         ' WHERE f.dta_inicio='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaInicio.Date))))+
         ' AND   f.dta_fim='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaFim.Date))));
  DMBelShop.SQLQuery1.Close;
  DMBelShop.SQLQuery1.SQL.Clear;
  DMBelShop.SQLQuery1.SQL.Add(MySql);
  DMBelShop.SQLQuery1.Open;
  s:=DMBelShop.SQLQuery1.FieldByName('Empresa').AsString;
  DMBelShop.SQLQuery1.Close;

  If Trim(s)<>'' Then
   Exit;

  OdirPanApres.Caption:='AGUARDE 30 Segundos !! Calculando Faturamento do Per�odo Solicitado...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmAnaliseFornecedores;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  MySql:=' DELETE FROM ES_FAT_PERIODO';
  DMBelShop.SQLC.Execute(MySql,nil,nil);

  MySql:=' INSERT INTO ES_FAT_PERIODO'+
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
         ' AND  (((mv.operacao=''S'') AND (mv.tipo_transacao=''V''))'+ // Sa�das Vendas
         '       OR'+
         '       ((mv.operacao=''DS'') AND (mv.tipo_transacao IS NULL)))'+ // Entradas Devolu��es
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

  // Verifica Per�odo ==========================================================
  If (Trim(DtEdt_DtaInicio.Text)<>'') Or (Trim(DtEdt_DtaFim.Text)<>'') Then
  Begin
    Try
      StrToDate(DtEdt_DtaInicio.Text);
    Except
      msg('Data Inicial do Per�odo Inv�lida !!','A');
      DtEdt_DtaInicio.SetFocus;
      Exit;
    End;

    Try
      StrToDate(DtEdt_DtaFim.Text);
    Except
      msg('Data Final do Per�odo Inv�lida !!','A');
      DtEdt_DtaFim.SetFocus;
      Exit;
    End;

    If DtEdt_DtaFim.Date<DtEdt_DtaInicio.Date Then
    Begin
      msg('Per�odo Inv�lido !!','A');
      DtEdt_DtaInicio.Clear;
      DtEdt_DtaFim.Clear;
      DtEdt_DtaInicio.SetFocus;
      Exit;
    End;
  End
  Else // If (Trim(DtEdt_DtaInicio.Text)<>'') Or (Trim(DtEdt_DtaFim.Text)<>'') Then
  Begin
    msg('Per�odo Inv�lido !!','A');
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
  gsPizzaLojas.Marks.Style:=smsLabel; // Descri��o/Percentual
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
//  // Linhas Laterais, Ch�o e Fundo =============================================
//  DbGrafico_Lojas.LeftAxis.Grid.Visible:=True;
//  DbGrafico_Lojas.BottomAxis.Grid.Visible:=True;

  // Titulo ====================================================================
  DbGrafico_Lojas.Title.Text.Clear;
  DbGrafico_Lojas.Title.Text.Add('GR�FICO DAS LOJAS');
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

  // Linhas Laterais, Ch�o e Fundo =============================================
// OdirApaggar - 30/05/2018
//  DbGrafico_Fornecedores.LeftAxis.Grid.Visible:=True;
//  DbGrafico_Fornecedores.BottomAxis.Grid.Visible:=True;

  // Titulo ====================================================================
  DbGrafico_Fornecedores.Title.Text.Clear;
  DbGrafico_Fornecedores.Title.Text.Add('GR�FICO DOS FORNECEDORES');
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
  // Linhas Laterais, Ch�o e Fundo =============================================
//  DbGrafico_Setores.LeftAxis.Grid.Visible:=True;
//  DbGrafico_Setores.BottomAxis.Grid.Visible:=True;

  // Titulo ====================================================================
  DbGrafico_Setores.Title.Text.Clear;
  DbGrafico_Setores.Title.Text.Add('GR�FICO DOS SETORES');
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
     msg('Para Sair Tecle no Bot�o <Fechar>...','A');
     Action := caNone;
   End;

  // Verifica se Transa��o esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Fecha Memo de Nome das Colunas de Lojas ===================================
  FreeAndNil(mMemoColLojas);

  // Fecha Series dos Graficos =================================================
  FechaSeriesGraficos;
end;

procedure TFrmAnaliseFornecedores.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Bal�o
Var
  MySql: String;
begin
  // Se Monta CheckBox no DBGrid ===============================================
  bgMontaCheck:=False;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Bal�o ///////////////////////////////////////////////
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficosMinMax.Handle, @ti, TipoDoIcone, 'Minimizar/Maximizar', 'GR�FICOS');

  // Grafico de Lojas ----------------------------------------------------------
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoLojasMinMax.Handle, @ti, TipoDoIcone, 'Maximizar/Minimizar', 'GR�FICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoLojasGirar.Handle, @ti, TipoDoIcone, 'Girar', 'GR�FICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoLojasNome.Handle, @ti, TipoDoIcone, 'Apresenta Nomes', 'GR�FICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoLojasNomePerc.Handle, @ti, TipoDoIcone, 'Apresenta Nomes/Percentuais', 'GR�FICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoLojasNomeVlr.Handle, @ti, TipoDoIcone, 'Apresenta Nomes/Valores', 'GR�FICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoLojasPerc.Handle, @ti, TipoDoIcone, 'Apresenta Percentuais', 'GR�FICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoLojasVlr.Handle, @ti, TipoDoIcone, 'Apresenta Valores', 'GR�FICO LOJAS');

  // Grafico de Fornecedores ---------------------------------------------------
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoFornMinMax.Handle, @ti, TipoDoIcone, 'Maximizar/Minimizar', 'GR�FICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoFornGirar.Handle, @ti, TipoDoIcone, 'Girar', 'GR�FICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoFornNome.Handle, @ti, TipoDoIcone, 'Apresenta Nomes', 'GR�FICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoFornNomePerc.Handle, @ti, TipoDoIcone, 'Apresenta Nomes/Percentuais', 'GR�FICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoFornNomeVlr.Handle, @ti, TipoDoIcone, 'Apresenta Nomes/Valores', 'GR�FICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoFornPerc.Handle, @ti, TipoDoIcone, 'Apresenta Percentuais', 'GR�FICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoFornVlr.Handle, @ti, TipoDoIcone, 'Apresenta Valores', 'GR�FICO FORNECEDORES');

  // Grafico de Setores --------------------------------------------------------
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoSetoresMinMax.Handle, @ti, TipoDoIcone, 'Maximizar/Minimizar', 'GR�FICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoSetoresGirar.Handle, @ti, TipoDoIcone, 'Girar', 'GR�FICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoSetoresNome.Handle, @ti, TipoDoIcone, 'Apresenta Nomes', 'GR�FICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoSetoresNomePerc.Handle, @ti, TipoDoIcone, 'Apresenta Nomes/Percentuais', 'GR�FICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoSetoresNomeVlr.Handle, @ti, TipoDoIcone, 'Apresenta Nomes/Valores', 'GR�FICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoSetoresPerc.Handle, @ti, TipoDoIcone, 'Apresenta Percentuais', 'GR�FICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoSetoresVlr.Handle, @ti, TipoDoIcone, 'Apresenta Valores', 'GR�FICO SETORES');
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
  DMBelShop.SQLQuery1.Close;
  DMBelShop.SQLQuery1.SQL.Clear;
  DMBelShop.SQLQuery1.SQL.Add(MySql);
  DMBelShop.SQLQuery1.Open;

  Cbx_Lojas.Items.Clear;
  Cbx_Lojas.Items.Add('=== TODAS AS LOJAS ===');

  DMBelShop.SQLQuery1.DisableControls;
  While Not DMBelShop.SQLQuery1.Eof do
  Begin
    Cbx_Lojas.Items.Add(DMBelShop.SQLQuery1.FieldByName('Loja').AsString);

    DMBelShop.SQLQuery1.Next;
  End; // While Not DMBelShop.SQLQuery1.Eof do
  DMBelShop.SQLQuery1.EnableControls;
  DMBelShop.SQLQuery1.Close;

  // Acerta Periodo ============================================================
  DtEdt_DtaInicio.Date:=StrToDate(DateToStr(PrimeiroUltimoDia(IncMonth(Date,-4),'P')));
  DtEdt_DtaFim.Date   :=StrToDate(DateToStr(Date));
  sgDtaIniPadrao      :=DateToStr(DtEdt_DtaInicio.Date);
  sgDtaFimPadrao      :=DateToStr(DtEdt_DtaFim.Date);

  // Verifica se Transa��o esta Ativa
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
end;

procedure TFrmAnaliseFornecedores.Bt_FecharClick(Sender: TObject);
begin
  DMVirtual.CDS_V_MixAnaliseForn.Close;

  // Verifica se Transa��o esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  bgSair:=True;
  Close;

end;

procedure TFrmAnaliseFornecedores.Bt_GraficosMinMaxClick(  Sender: TObject);
begin
  If Pan_Solicitacoes.Height=50 Then
   Pan_Solicitacoes.Height:=312
  Else
   Pan_Solicitacoes.Height:=50;
end;

procedure TFrmAnaliseFornecedores.Bt_BuscaFornecedorClick(Sender: TObject);
Var
  MySql: String;
  bSiga: Boolean;
begin
  Dbg_Produtos.SetFocus;

  DMVirtual.CDS_V_MixAnaliseForn.Close;

  EdtCodFornecedor.Clear;
  EdtDesFornecedor.Clear;

  bSiga:=True;

  // ========== EFETUA A CONEX�O ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ======================================================
  MySql:=' SELECT fo.nome_cliente Fornecedor, fo.cod_cliente Codigo'+
         ' FROM LINXCLIENTESFORNEC fo'+
         ' WHERE EXISTS(SELECT 1'+
         '              FROM ES_FAT_PERIODO fa, LINXPRODUTOS pr'+
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

  DMVirtual.CDS_V_MixAnaliseForn.Close;

  EdtCodSetor.Clear;
  EdtDesSetor.Clear;

  bSiga:=True;

  // ========== EFETUA A CONEX�O ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Fornecedores ======================================================
  MySql:=' SELECT DISTINCT pr.desc_setor SETOR, pr.id_setor CODIGO'+
         ' FROM LINXPRODUTOS pr'+
         ' WHERE EXISTS(SELECT 1'+
         '              FROM ES_FAT_PERIODO fa'+
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

        Rb_GraficoLojasNome.Enabled:=True;
        Rb_GraficoLojasNomePerc.Enabled:=True;
        Rb_GraficoLojasNomeVlr.Enabled:=True;

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
        Rb_GraficoLojasNome.Enabled:=False;
        Rb_GraficoLojasNomePerc.Enabled:=False;
        Rb_GraficoLojasNomeVlr.Enabled:=False;

        Rb_GraficoLojasPerc.Checked:=True;
        Rb_GraficoLojasNomeClick(Rb_GraficoLojasPerc);

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
      If msg('Per�odo Inv�lido !!'+cr+cr+'Deseja Sair do M�dulo ??','C')=1 Then
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
      msg('Per�odo Inv�lido !!','A');
      DtEdt_DtaInicio.SetFocus;
      Exit;
    End; // If not b Then
  End; // If (Sender as TcxDateEdit).Name='DtEdt_DtaFim') Then

  If Not PeriodoConsiste Then
   Exit;

  If (sgDtaIniPadrao<>DateToStr(DtEdt_DtaInicio.Date)) and (sgDtaFimPadrao<>DateToStr(DtEdt_DtaFim.Date)) Then
  Begin
    If msg('Per�odo Informado Est� CORRETO ??','C')=2 Then
    Begin
      DtEdt_DtaInicio.SetFocus;
      Exit;
    End;
  End; // If (sgDtaIniPadrao<>DateToStr(DtEdt_DtaInicio.Date)) and (sgDtaFimPadrao<>DateToStr(DtEdt_DtaFim.Date)) Then

  // Busca Faturamento dos Produtos no Periodo =================================
  FaturamentoPeriodo;

  If Cbx_Lojas.ItemIndex=-1 Then
   Cbx_Lojas.ItemIndex:=0;

  Cbx_LojasChange(Self);

  DtEdt_DtaInicio.TabStop:=False;
  DtEdt_DtaFim.TabStop   :=False;

  Dbg_Produtos.SetFocus;

end;

procedure TFrmAnaliseFornecedores.Cbx_LojasChange(Sender: TObject);
begin
  // Atualiza Graficos =========================================================
  AtualizaGraficos;

  If Trim(sgCodForn)<>'' Then
  Begin

    Dbg_Produtos.SetFocus;

    // Busca Mix de Produdos =====================================================
    MixProdutos;

    // Fixar Colunas no DBGrid ===================================================
    THackDBGrid(Dbg_Produtos).FixedCols:=4; // Considerar o Indicador
  End;
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

    Rb_GraficoLojasNome.Color:=$00EAFFFF;
    If Rb_GraficoLojasNome.Checked Then
    Begin
      Rb_GraficoLojasNome.Color:=clAqua;
      gsPizzaLojas.Marks.Style:=smsLabel;
    End;

    Rb_GraficoLojasNomePerc.Color:=$00EAFFFF;
    If Rb_GraficoLojasNomePerc.Checked Then
    Begin
      Rb_GraficoLojasNomePerc.Color:=clAqua;
      gsPizzaLojas.Marks.Style:=smsLabelPercent;
    End;

    Rb_GraficoLojasPerc.Color:=$00EAFFFF;
    If Rb_GraficoLojasPerc.Checked Then
    Begin
      Rb_GraficoLojasPerc.Color:=clAqua;
      gsPizzaLojas.Marks.Style:=smsPercent;
    End;

    Rb_GraficoLojasVlr.Color:=$00EAFFFF;
    If Rb_GraficoLojasVlr.Checked Then
    Begin
      Rb_GraficoLojasVlr.Color:=clAqua;
      gsPizzaLojas.Marks.Style:=smsValue;
    End;

    Rb_GraficoLojasNomeVlr.Color:=$00EAFFFF;
    If Rb_GraficoLojasNomeVlr.Checked Then
    Begin
      Rb_GraficoLojasNomeVlr.Color:=clAqua;
      gsPizzaLojas.Marks.Style:=smsLabelValue;
    End;
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

    Rb_GraficoFornNomePerc.Color:=$00EAFFFF;
    If Rb_GraficoFornNomePerc.Checked Then
    Begin
      Rb_GraficoFornNomePerc.Color:=clAqua;
      gsPizzaForn.Marks.Style:=smsLabelPercent;
    End;

    Rb_GraficoFornPerc.Color:=$00EAFFFF;
    If Rb_GraficoFornPerc.Checked Then
    Begin
      Rb_GraficoFornPerc.Color:=clAqua;
      gsPizzaForn.Marks.Style:=smsPercent;
    End;

    Rb_GraficoFornNome.Color:=$00EAFFFF;
    If Rb_GraficoFornNome.Checked Then
    Begin
      Rb_GraficoFornNome.Color:=clAqua;
      gsPizzaForn.Marks.Style:=smsLabel;
    End;

    Rb_GraficoFornVlr.Color:=$00EAFFFF;
    If Rb_GraficoFornVlr.Checked Then
    Begin
      Rb_GraficoFornVlr.Color:=clAqua;
      gsPizzaForn.Marks.Style:=smsValue;
    End;

    Rb_GraficoFornNomeVlr.Color:=$00EAFFFF;
    If Rb_GraficoFornNomeVlr.Checked Then
    Begin
      Rb_GraficoFornNomeVlr.Color:=clAqua;
      gsPizzaForn.Marks.Style:=smsLabelValue;
    End;
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

    Rb_GraficoSetoresNome.Color:=$00EAFFFF;
    If Rb_GraficoSetoresNome.Checked Then
    Begin
      Rb_GraficoSetoresNome.Color:=clAqua;
      gsPizzaSetores.Marks.Style:=smsLabel;
    End;

    Rb_GraficoSetoresNomePerc.Color:=$00EAFFFF;
    If Rb_GraficoSetoresNomePerc.Checked Then
    Begin
      Rb_GraficoSetoresNomePerc.Color:=clAqua;
      gsPizzaSetores.Marks.Style:=smsLabelPercent;
    End;

    Rb_GraficoSetoresPerc.Color:=$00EAFFFF;
    If Rb_GraficoSetoresPerc.Checked Then
    Begin
      Rb_GraficoSetoresPerc.Color:=clAqua;
      gsPizzaSetores.Marks.Style:=smsPercent;
    End;

    Rb_GraficoSetoresVlr.Color:=$00EAFFFF;
    If Rb_GraficoSetoresVlr.Checked Then
    Begin
      Rb_GraficoSetoresVlr.Color:=clAqua;
      gsPizzaSetores.Marks.Style:=smsValue;
    End;

    Rb_GraficoSetoresNomeVlr.Color:=$00EAFFFF;
    If Rb_GraficoSetoresNomeVlr.Checked Then
    Begin
      Rb_GraficoSetoresNomeVlr.Color:=clAqua;
      gsPizzaSetores.Marks.Style:=smsLabelValue;
    End;
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

procedure TFrmAnaliseFornecedores.Dbg_ProdutosColEnter(Sender: TObject);
Var
 i: Integer;
begin
  // NAO DEIXA IR APARECER A COLUNA FIXADA
  if (THackDBGrid(Dbg_Produtos).SelectedIndex=0) Or
     (THackDBGrid(Dbg_Produtos).SelectedIndex=1) Or
     (THackDBGrid(Dbg_Produtos).SelectedIndex=2) Then // Index das Colunas Fixadas Sem Indicador
  begin
    THackDBGrid(Dbg_Produtos).LeftCol:=4; // Index da 1� Coluna N�o Fixada Contando Indicador
    THackDBGrid(Dbg_Produtos).SelectedIndex:=3; // Index da 1� Coluna N�o Fixada Sem Contar Indicador
    Dbg_Produtos.Refresh;
  End; // if (THackDBGrid(Dbg_Produtos).SelectedIndex=0) Or
end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;State: TGridDrawState);
Var
  MySql: String;
  i: Integer;

  Check: Integer;
  R: TRect;
begin

  inherited;

  // Acerta Colunas Fixadas ====================================================
  Dbg_ProdutosColEnter(Self);

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  // Desenha Checkbox no DBGrid ================================================
If bgMontaCheck Then
Begin
  For i:=0 to mMemoColLojas.Lines.Count-1 do
  Begin
    If Column.FieldName=mMemoColLojas.Lines[i] Then
    Begin
      // Altera Cor Quando for MIX =============================================
      If ((Sender as TDBGrid).DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger = 1) Then
      Begin
        Dbg_Produtos.Canvas.Brush.Color:=$00C6FFC6;
      End;
      TDBGrid(Sender).Canvas.FillRect(Rect);

      // Monta Check ===========================================================
      If ((Sender as TDBGrid).DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger = 1) Then
       Begin
         Check := DFCS_CHECKED;
       End
      Else
       Begin
         Check := 0;
       End; //If ((Sender as TDBGrid).DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger = 1) Then

      R := Rect;
      InflateRect(R, -2, -2); // Diminue o tamanho do CheckBox
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);

    End; // If Column.FieldName=mMemoColLojas.Lines[i] Then
  End; // For i:=0 to mMemoColLojas.Lines.Count-1 do
End; // If bgMontaCheck Then
end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  // Acerta Colunas Fixadas ====================================================
  Dbg_ProdutosColEnter(Self);

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  i: Integer;

  sValor,
  sCodLojaSid, sCodProdSid,
  sEstMin, sEstMax: String;

  b, bGravar: Boolean;
begin
  //============================================================================
  // Acerta Colunas Fixadas ====================================================
  //============================================================================
  if (Key = VK_Left) and (THackDBGrid(Dbg_Produtos).SelectedIndex=4) Then // Index da 1� Coluna N�o Fixada Sem Contar Indicador
  Begin
    Key := VK_Clear;
  End;
  // Acerta Colunas Fixadas ====================================================
  //============================================================================

  //============================================================================
  // Bloquei Ctrl + Delete =====================================================
  //============================================================================
  If (((Shift = [ssCtrl]) And (key = vk_delete))) Or (key = vk_space) Then
   Abort;
  // Bloquei Ctrl + Delete =====================================================
  //============================================================================

  If DMVirtual.CDS_V_MixAnaliseForn.IsEmpty Then
   Exit;

  //============================================================================
  // Altera Mix da Loja (Entrega CD) ===========================================
  //============================================================================
  If key=VK_F2 Then
  Begin
    // Alterar Mix =============================================================
    For i:=0 to mMemoColLojas.Lines.Count-1 do
    Begin
      // Coluna Selecionada
      If Dbg_Produtos.SelectedField.FieldName=mMemoColLojas.Lines[i] Then
      Begin
        Dbg_Produtos.DataSource.Dataset.Edit;
        Dbg_Produtos.DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger :=
          IfThen (Dbg_Produtos.DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger = 1, 0, 1);
        Dbg_Produtos.DataSource.Dataset.Post;

        // Grava Novos Estoques Minino e Maximo ================================
        sCodProdSid:=Trim(DMVirtual.CDS_V_MixAnaliseFornCOD_AUXILIAR.AsString);


        // Busca Codigo Loja SIDICOM e Estoques Minimo/Maximo ======================
        BuscaLojaSidicomEstMinMax(DMVirtual.CDS_V_MixAnaliseFornCOD_PRODUTO.AsString,   // sCodProdLx
                                  Copy(Trim(Dbg_Produtos.SelectedField.FieldName),5,2), // sCodLojaLx
                                  sCodProdSid, // Var sCodProdSid
                                  sCodLojaSid, // Var sCodLojaSid
                                  sEstMin,     // Var sEstMin
                                  sEstMax);    // Var sEstMax

        // Zera Variaveil de Estoque Minimo ====================================
        sEstMin:='0';

        // Coloca Produto no MIX da Loja - Solicita Estoques Minimo e Maximo ===
        If Dbg_Produtos.DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger=1 Then
        Begin
          b:=True;
          bGravar:=False;
          While b do
          Begin
            //                   Caption do Form                               Titul1o           Titulo2          Valor1   Valor2   SetFucos  Botao1    Botao2
            If InputQuery2Values('Inform o Estoque M�nimo e M�ximo', 'Estoque M�nimo (Use <Tab> para Mover)', 'Estoque M�ximo (Use <Tab> para Mover)', sEstMin, sEstMax, sEstMin, 'Salvar', 'Voltar') Then
             Begin
               Try
                 StrToInt(sEstMin);
                 StrToInt(sEstMax);

                 If StrToInt(sEstMin)=0 Then
                  Begin
                    msg('Estoque M�nino Igual a 0 (ZERO) !!'+cr+cr+'Favor Informar um Estoque V�lido !!','A');
                  End
                 Else
                  Begin
                    bGravar:=True;
                    Break;
                  End;
               Except
                 msg('Estoque M�nino/M�ximo'+cr+cr+'Deve Ser Um Valor INTEIRO !!','A');
               End;
             End
            Else
             Begin
               If StrToInt(sEstMin)=0 Then
                Begin
                  msg('Estoque M�nino Igual a 0 (ZERO) !!'+cr+cr+'Favor Informar um Estoque V�lido !!','A');
                End
               Else
                Begin
                  bGravar:=True;
                  Break;
                End;
             End; // If InputQuery2Values('<Tab> Mudar de Campo <Enter> Salva', 'Estoque M�nimo', 'Estoque M�ximo', sEstMin, sEstMax, sEstMin, 'Salvar', 'Voltar') Then
          End; // While b do
        End; // If (Dbg_Produtos.DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger=1 Then

        // Retira/Coloca do MIX da Loja - Estoques Minimo e  Maximo ============
        GravaEstMinimoMaximo(Copy(Trim(Dbg_Produtos.SelectedField.FieldName),5,2), // sCodLojaLx
                             Trim(DMVirtual.CDS_V_MixAnaliseFornCOD_PRODUTO.AsString), // sCodProdLx
                             sCodLojaSid, sCodProdSid, sEstMin, sEstMax);

        Break;
      End; // If Dbg_Produtos.SelectedField.FieldName=mMemoColLojas.Lines[i] Then
    End; // For i:=0 to mMemoColLojas.Lines.Count-1 do
  End; // If key=VK_F2 Then
  // Altera Mix da Loja (Entrega CD) ===========================================
  //============================================================================

  //============================================================================
  // Altera Mix da Loja (Entrega CD) ===========================================
  //============================================================================
  If key=VK_F3 Then
  Begin
    // Verifica se � Uma Coluna de Indica��o de MIX ============================
    b:=False;
    For i:=0 to mMemoColLojas.Lines.Count-1 do
    Begin
      // Coluna Selecionada
      If Dbg_Produtos.SelectedField.FieldName=mMemoColLojas.Lines[i] Then
      Begin
        b:=True;
        Break;
      End;
    End; // For i:=0 to mMemoColLojas.Lines.Count-1 do

    // N�o � Uma Coluna de Indica��o de MIX -------------------------
    If Not b Then
     Exit;

    msg('Fun��o em Desenvolvimento !!','A');
  End; // If key=VK_F3 Then
  // Altera Mix da Loja (Entrega CD) ===========================================
  //============================================================================

  //============================================================================
  // Localizar Produto =========================================================
  //============================================================================
  If Key=Vk_F4 Then
  Begin
    i:=DMVirtual.CDS_V_MixAnaliseForn.RecNo;
    sValor:='';
    b:=True;
    While b do
    Begin
      If InputQuery('Localizar Produto','',sValor) then
       Begin
         Try
           StrToInt(sValor);

           If Not DMVirtual.CDS_V_MixAnaliseForn.Locate('COD_PRODUTO', sValor,[]) Then
           Begin
            If Not LocalizaRegistro(DMVirtual.CDS_V_MixAnaliseForn, 'NOME', sValor) Then
             b:=False;
           End; // If Not DMVirtual.CDS_V_MixAnaliseForn.Locate('COD_PRODUTO', sValor,[]) Then
           Break;
         Except
           If Not DMVirtual.CDS_V_MixAnaliseForn.Locate('NOME', sValor,[]) Then
           Begin
             If Not LocalizaRegistro(DMVirtual.CDS_V_MixAnaliseForn, 'NOME', sValor) Then
              b:=False;
           End; // If Not DMVirtual.CDS_V_MixAnaliseForn..Locate('NOME', sValor,[]) Then
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
      DMVirtual.CDS_V_MixAnaliseForn.RecNo:=i;
      msg('Produto N�o Localizado !!','A');
    End;
  End; // If Key=Vk_F4 Then
  // Localizar Produto =========================================================
  //============================================================================

  //============================================================================
  // Apresenta Estoque Minino/Maximo ===========================================
  //============================================================================
  If key=VK_F6 Then
  Begin
    // Verifica se � Uma Coluna de Indica��o de MIX ============================
    b:=False;
    For i:=0 to mMemoColLojas.Lines.Count-1 do
    Begin
      // Coluna Selecionada
      If Dbg_Produtos.SelectedField.FieldName=mMemoColLojas.Lines[i] Then
      Begin
        b:=True;
        Break;
      End;
    End; // For i:=0 to mMemoColLojas.Lines.Count-1 do

    // N�o � Uma Coluna de Indica��o de MIX -------------------------
    If Not b Then
     Exit;

    // Produto N�o Esta no MIX =================================================
    If DMVirtual.CDS_V_MixAnaliseForn.FieldByName(Dbg_Produtos.SelectedField.FieldName).AsInteger=0 Then
    Begin
      msg('Produto N�o Pertence ao Mix da Loja !!','A');
      Exit;
    End;

    If Trim(DMVirtual.CDS_V_MixAnaliseFornCOD_AUXILIAR.AsString)='' Then
    Begin
      msg('Produto N�o Vinculado no'+cr+'Controle de Estoque Minimo/M�ximo !!','A');
      Exit;
    End;

    sCodProdSid:=Trim(DMVirtual.CDS_V_MixAnaliseFornCOD_AUXILIAR.AsString);

    // Busca Codigo Loja SIDICOM e Estoques Minimo/Maximo ======================
    BuscaLojaSidicomEstMinMax(DMVirtual.CDS_V_MixAnaliseFornCOD_PRODUTO.AsString,   // sCodProdLx
                              Copy(Trim(Dbg_Produtos.SelectedField.FieldName),5,2), // sCodLojaLx
                              sCodProdSid, // Var sCodProdSid
                              sCodLojaSid, // Var sCodLojaSid
                              sEstMin,     // Var sEstMin
                              sEstMax);    // Var sEstMax

    If sEstMin='' Then
    Begin
      msg('Produto N�o Vinculado no'+cr+'Controle de Estoque Minimo/M�ximo !!','A');
      Exit;
    End;

    b:=True;
    bGravar:=False;
    While b do
    Begin
      //                   Caption do Form                               Titul1o           Titulo2          Valor1   Valor2   SetFucos  Botao1    Botao2
      If InputQuery2Values('<Tab> Mudar de Campo <Enter> Salva', 'Estoque M�nimo (Use <Tab> para Mover)', 'Estoque M�ximo (Use <Tab> para Mover)', sEstMin, sEstMax, sEstMin, 'Salvar', 'Voltar') Then
       Begin
         Try
           StrToInt(sEstMin);
           StrToInt(sEstMax);

           If StrToInt(sEstMin)=0 Then
            Begin
              msg('Estoque M�nino Igual a 0 (ZERO) !!'+cr+cr+'Para Retira do MIX da Loja'+cr+'Volte e Tecle <F2> ou <F3>','A');
            End
           Else
            Begin
              bGravar:=True;
              Break;
            End;
         Except
           msg('Estoque M�nino/M�ximo'+cr+cr+'Deve Ser Um Valor INTEIRO !!','A');
         End;
       End
      Else
       Begin
         Break;
       End;
    End; // While b do

    If bGravar Then
    Begin
      GravaEstMinimoMaximo(Copy(Trim(Dbg_Produtos.SelectedField.FieldName),5,2), // sCodLojaLx
                           Trim(DMVirtual.CDS_V_MixAnaliseFornCOD_PRODUTO.AsString), // sCodProdLx
                           sCodLojaSid, sCodProdSid, sEstMin, sEstMax);
    End; // If bGravar Then
  End; // If key=VK_F6 Then
  // Apresenta Estoque Minino/Maximo ===========================================
  //============================================================================
end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = ' ') then
   Abort;

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  // Acerta Colunas Fixadas -----------------------------------------
  Dbg_ProdutosColEnter(Self);

end;

procedure TFrmAnaliseFornecedores.DtEdt_DtaInicioEnter(Sender: TObject);
begin
  DtEdt_DtaInicio.TabStop:=True;
  DtEdt_DtaFim.TabStop   :=True;
end;

end.



