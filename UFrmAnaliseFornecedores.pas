unit UFrmAnaliseFornecedores;
// IfThen
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
  ToolEdit, CurrEdit, Grids, DBGrids, DBGridJul, Math, JvRadioButton, db,
  dxSkinsdxStatusBarPainter, dxStatusBar, DBCtrls, JvExMask, JvToolEdit,
  JvMaskEdit, JvDBControls, AppEvnts;

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
    ApplicationEvents1: TApplicationEvents;
    Bt_MultiAlteracoes: TJvXPButton;
    Bt_GruposLojas: TJvXPButton;
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

    Procedure BuscaLojaSidicomEstMinMax(sCodProdLx, sCodLojaLx: String;
                                        Var sCodProdSid: String;
                                        Var sCodLojaSid: String;
                                        Var sEstMin: String;
                                        Var sEstMax: String);

    Procedure GravaEstMinimoMaximo(sCodLojaLx, sCodProdLx,
                                   sCodLojaSid, sCodProdSid,
                                   sEstMin, sEstMax: String);

    Procedure MixMultiplasAlteracoes;

    Function  AtualizaProduto: Boolean;
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
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure DtEdt_DtaInicioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_MultiAlteracoesClick(Sender: TObject);
    procedure Dbg_ProdutosTitleClick(Column: TColumn);
    procedure Bt_GruposLojasClick(Sender: TObject);
    procedure Dbg_ProdutosExit(Sender: TObject);
    procedure Dbg_ProdutosEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
   THackDBGrid = class(TDBGrid);

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

  TD : TTransactionDesc; // Ponteiro de Transação Normal
//  TD1: TTransactionDesc; // Ponteiro de Transação Para Faturamento

  bgSair,
  bgEnterTab,
  bgMontaCheck, // Se Cria CheckBox no DBGrid
  bgMultiSelect // Libera MiltiSelect
  : Boolean;

  sgDtaIniPadrao, sgDtaFimPadrao,
  sOrderGrid,    // Ordenar Grid
  sgCodLoja, sgCodForn, sgCodSetor: String; // Usar para Montagem dos Graficos

  // Series de Graficos Pizza
  gsPizzaLojas: TPieSeries;
  gsPizzaForn: TPieSeries;
  gsPizzaSetores: TPieSeries;

  iPanHeight, // Posição Inicial do Painel Pan_Solicitacoes
  iGraHeight, iGraLeft, iGraWidth, iGraTop: Integer; // Posição Inicial do Graficos

  mMemoColLojas: TMemo; // Nome das Coluans de Lojas

  sgOrderGrid: String=''; // Ordenar pela Coluna do DBGrid

  MyKey: Char;

implementation

uses DK_Procs1, UDMBelShop, UDMVirtual, UPesquisa, UDMLinx, SqlExpr,
  UFrmSolicitacoes, UFrmBelShop;

{$R *.dfm}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir _ INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Estoque Minimo do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmAnaliseFornecedores.AtualizaProduto: Boolean;
Var
  sCodProdSid, // Var sCodProdSid
  sCodLojaSid, // Var sCodLojaSid
  sEstMin,     // Var sEstMin
  sEstMax      // Var sEstMax
  : String;
Begin
  Result:=False;

  // Verifica Estoque Minimo Negativo ==========================================
  If DMVirtual.CDS_V_MixAnaliseForn.FieldByName(Dbg_Produtos.SelectedField.FieldName).NewValue<0 Then
  Begin
    msg('Impossível Alterar !!'+cr+cr+'Estoque Mínimo Negativo !!','A');
    DMVirtual.CDS_V_MixAnaliseForn.Cancel;
    Exit;
  End; // If DMVirtual.CDS_V_MixAnaliseForn.FieldByName(Dbg_Produtos.SelectedField.FieldName).NewValue<0 Then

  // Verifica Produto Descontinua ==============================================
  If (DMVirtual.CDS_V_MixAnaliseForn.FieldByName(Dbg_Produtos.SelectedField.FieldName).OldValue='0') And
     (DMVirtual.CDS_V_MixAnaliseForn.FieldByName(Dbg_Produtos.SelectedField.FieldName).NewValue>0) And
     (DMVirtual.CDS_V_MixAnaliseFornID_COLECAO.AsString='197')  Then
  Begin
    msg('Impossível Alterar !!'+cr+cr+'Produto Descontinuado !!','A');
    DMVirtual.CDS_V_MixAnaliseForn.Cancel;
    Exit;
  End; // If (DMVirtual.CDS_V_MixAnaliseForn.FieldByName(Dbg_Produtos.SelectedField.FieldName).OldValue='0') And

  // Busca Codigo Loja SIDICOM e Estoques Minimo/Maximo ======================
  BuscaLojaSidicomEstMinMax(DMVirtual.CDS_V_MixAnaliseFornCOD_PRODUTO.AsString,   // sCodProdLx
                            Copy(Trim(Dbg_Produtos.SelectedField.FieldName),5,2), // sCodLojaLx
                            sCodProdSid, // Var sCodProdSid
                            sCodLojaSid, // Var sCodLojaSid
                            sEstMin,     // Var sEstMin
                            sEstMax);    // Var sEstMax

  If sEstMin='' Then
  Begin
    msg('Produto Não Vinculado no'+cr+'Controle de Estoque Minimo/Máximo !!','A');
    DMVirtual.CDS_V_MixAnaliseForn.Cancel;
    Exit;
  End;

  sEstMin:=DMVirtual.CDS_V_MixAnaliseForn.FieldByName(Dbg_Produtos.SelectedField.FieldName).NewValue;

  GravaEstMinimoMaximo(Copy(Trim(Dbg_Produtos.SelectedField.FieldName),5,2), // sCodLojaLx
                       Trim(DMVirtual.CDS_V_MixAnaliseFornCOD_PRODUTO.AsString), // sCodProdLx
                       sCodLojaSid, sCodProdSid, sEstMin, sEstMax);

  DMVirtual.CDS_V_MixAnaliseForn.Edit;
  DMVirtual.CDS_V_MixAnaliseForn.FieldByName(Dbg_Produtos.SelectedField.FieldName).AsInteger:=StrToInt(sEstMin);
  DMVirtual.CDS_V_MixAnaliseForn.Post;

  Result:=True;
End; // Atualiza Estoque Minimo do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Efetua MultiAlterações de MIX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.MixMultiplasAlteracoes;
Var
  MySql: String;

  s, sLjOrigLX,
  sColOrig, sColDest,
  sCodProdSID, sEstMin, sEstMax: String;

  mMemoLjSID, mMemoLjLX: TMemo; // Guarda Codigo das Lojas Linx e Sidicom

  i, ii,
  iPos, iRecNo: Integer;
Begin
  OdirPanApres.Caption:='AGUARDE !! Efetuando Multiplas Alterações ...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmAnaliseFornecedores;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  iRecNo:=DMVirtual.CDS_V_MixAnaliseForn.RecNo;

  // Pega Loja Origem ==========================================================
  iPos:=Pos('-',FrmSolicitacoes.EdtMixLoja.Text);
  sLjOrigLX:=Trim(Copy(FrmSolicitacoes.EdtMixLoja.Text,iPos+1,3));
  sColOrig:='LOJA'+sLjOrigLX;

  // Guarda Codigo das Lojas Linx e Sidicom ====================================
  mMemoLjLX:=TMemo.Create(Self);
  mMemoLjLX.Visible:=False;
  mMemoLjLX.Parent:=FrmBelShop;
  mMemoLjLX.Width:=500;
  mMemoLjLX.Lines.Clear;

  mMemoLjSID:=TMemo.Create(Self);
  mMemoLjSID.Visible:=False;
  mMemoLjSID.Parent:=FrmBelShop;
  mMemoLjSID.Width:=500;
  mMemoLjSID.Lines.Clear;

  For i:=0 to FrmSolicitacoes.Lbx_MixLojas.Items.Count-1 do
  Begin
    iPos:=Pos('-',FrmSolicitacoes.Lbx_MixLojas.Items[i]);

    // Codigo da Loja Linx
    s:=Trim(Copy(FrmSolicitacoes.Lbx_MixLojas.Items[i],iPos+1,3));
    mMemoLjLX.Lines.Add(s);

    // Codigo da Loja Sidicom
    MySql:=' SELECT l.cod_loja'+
           ' FROM LINXLOJAS l'+
           ' WHERE l.empresa='+s;
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    mMemoLjSID.Lines.Add(Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString));
    DMBelShop.CDS_BuscaRapida.Close;
  End; // For i:=0 to FrmSolicitacoes.Lbx_MixLojas.Items.Count-1 do

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

    DMVirtual.CDS_V_MixAnaliseForn.First;
    While Not DMVirtual.CDS_V_MixAnaliseForn.Eof do
    Begin
      OdirPanApres.Caption:='AGUARDE !! Efetuando Multiplas Alterações Produto: '+Trim(DMVirtual.CDS_V_MixAnaliseFornNOME.AsString);
      OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
      OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Width-OdirPanApres.Width)/2));
      OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Height-OdirPanApres.Height)/2))-20;
      Application.ProcessMessages;

      If DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger=1 Then
      Begin
        // Acerta MIX das Lojas ================================================
        For i:=0 to mMemoLjLX.Lines.Count-1 do
        Begin
          sColDest:='Loja'+mMemoLjLX.Lines[i];

          // Acerta Indidicador de Mix
          DMVirtual.CDS_V_MixAnaliseForn.Edit;
          DMVirtual.CDS_V_MixAnaliseForn.FieldByName(sColDest).AsInteger:=
                 DMVirtual.CDS_V_MixAnaliseForn.FieldByName(sColOrig).AsInteger;
          DMVirtual.CDS_V_MixAnaliseForn.Post;

          MySql:=' SELECT mx.codproduto, mx.est_minimo, mx.est_maximo'+
                 ' FROM ES_PRODUTOS_MIX mx'+
                 ' WHERE mx.cod_produto='+DMVirtual.CDS_V_MixAnaliseFornCOD_PRODUTO.AsString+
                 ' AND   mx.empresa='+sLjOrigLX;
          DMBelShop.CDS_Busca.Close;
          DMBelShop.SDS_Busca.CommandText:=MySql;
          DMBelShop.CDS_Busca.Open;
          sCodProdSID:=DMBelShop.CDS_Busca.FieldByName('CodProduto').AsString;
          sEstMin    :=DMBelShop.CDS_Busca.FieldByName('Est_Minimo').AsString;
          sEstMax    :=DMBelShop.CDS_Busca.FieldByName('Est_Maximo').AsString;
          DMBelShop.CDS_Busca.Close;

          // Acerta Tabela ES_PRODUTOS_MIX
          MySql:=' UPDATE ES_PRODUTOS_MIX mx'+
                 ' SET mx.ind_mix='+DMVirtual.CDS_V_MixAnaliseForn.FieldByName(sColOrig).AsString+
                 ' , mx.est_minimo='+sEstMin+
                 ' , mx.est_maximo='+sEstMax+
                 ' WHERE mx.empresa='+mMemoLjLX.Lines[i]+
                 ' AND   mx.cod_produto='+DMVirtual.CDS_V_MixAnaliseFornCOD_PRODUTO.AsString;
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End; // For i:=0 to mMemoLjLX.Lines.Count-1 do

        // Acerta Tabela ES_FINAN_CURVA_ABC
        For ii:=0 to mMemoLjSID.Lines.Count-1 do
        Begin
          MySql:=' UPDATE ES_FINAN_CURVA_ABC cv'+
                 ' SET cv.est_minimo='+sEstMin+
                 ',    cv.est_maximo='+sEstMax+
                 ',    cv.usu_altera='+Cod_Usuario+
                 ',    cv.dta_altera=current_date'+

                 ' WHERE cv.cod_loja='+QuotedStr(mMemoLjSID.Lines[ii])+
                 ' AND   cv.cod_produto='+QuotedStr(sCodProdSID);
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End; // For ii:=0 to mMemoLjSID.Lines.Count-1 do

        DMVirtual.CDS_V_MixAnaliseForn.Edit;
        DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger:=0;
        DMVirtual.CDS_V_MixAnaliseForn.Post;
      End; // If DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger=1 Then

      DMVirtual.CDS_V_MixAnaliseForn.Next;
    End; // While Not DMVirtual.CDS_V_MixAnaliseForn.Eof do

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    msg('MultiAlterações Efetuadas com SUCESSO !!','A');
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação
  DMVirtual.CDS_V_MixAnaliseForn.First;
  DMVirtual.CDS_V_MixAnaliseForn.RecNo:=iRecNo;

  DateSeparator:='/';
  DecimalSeparator:=',';

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  FreeAndNil(mMemoLjSID);
  FreeAndNil(mMemoLjLX);

  Application.ProcessMessages;
End; // Efetua MultiAlterações de MIX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
  sIndMix: String;
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

    MySql:=' UPDATE ES_FINAN_CURVA_ABC cv'+
           ' SET cv.est_minimo='+sEstMin+
           ',    cv.est_maximo='+sEstMax+
           ',    cv.usu_altera='+Cod_Usuario+
           ',    cv.dta_altera=current_date'+
           ' WHERE cv.cod_loja='+QuotedStr(sCodLojaSid)+
           ' AND   cv.cod_produto='+QuotedStr(sCodProdSid);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    sIndMix:='0';
    If StrToInt(sEstMin)>0 Then
     sIndMix:='1';

    MySql:=' UPDATE ES_PRODUTOS_MIX mx'+
           ' SET mx.est_minimo='+sEstMin+
           ' ,   mx.est_maximo='+sEstMax+
           ' ,   mx.ind_mix='+sIndMix+
           ' WHERE mx.empresa='+sCodLojaLx+
           ' AND   mx.cod_produto='+sCodProdLx;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      MessageBox(Handle, pChar(e.message=cr+cr+'Entrar em Contato com o Odir !!'), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try da Transação

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

  // Não Monta CheckBox no DBGrid ==============================================
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
         ' ORDER BY 2';
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
                                               Copy(Trim(DMBelShop.SQLQuery1.FieldByName('Nome_Abrev').AsString),1,6);

    DMBelShop.SQLQuery1.Next;
  End; // While Not DMBelShop.SQLQuery1.Eof do
  DMBelShop.SQLQuery1.First;

  Dbg_Produtos.Refresh;

  MySql:=' SELECT'+
         ' TRIM(pr.cod_auxiliar) COD_AUXILIAR,'+ // 1
         ' pr.cod_produto,'+ // 2
         ' TRIM(pr.nome) NOME,'; // 3

         // Se Todas as Lojas
         If Trim(sgCodLoja)='' Then
          MySql:=
           MySql+' (SELECT mx.ind_curva FROM ES_PRODUTOS_MIX mx'+
                 '  WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=2) ABC,'+ // ABC da Empresa // 4
                 ' CAST(COALESCE((SELECT SUM(COALESCE(fa.vlr_fat,0.00))'+
                 '                FROM ES_FAT_PERIODO fa'+
                 '                WHERE fa.cod_produto=pr.cod_produto)'+
                 ' , 0.00) AS NUMERIC(12,2)) Fat_Periodo,'; // 5

         // Se Uma Loja
         If Trim(sgCodLoja)<>'' Then
          MySql:=
           MySql+' (SELECT mx.ind_curva FROM ES_PRODUTOS_MIX mx'+
                 '  WHERE mx.cod_produto=pr.cod_produto AND mx.empresa=23) ABC,'+ // ABC da Loja // 4
                 ' CAST(COALESCE((SELECT SUM(COALESCE(fa.vlr_fat,0.00))'+
                 '                 FROM ES_FAT_PERIODO fa'+
                 '                 WHERE fa.cod_produto=pr.cod_produto'+
                 '                 AND   fa.empresa='+sgCodLoja+')'+
                 ' , 0.00) AS NUMERIC(12,2)) Fat_Periodo,'; // 5

  MySql:=
   MySql+' TRIM(pr.desc_setor) DESC_SETOR,'+ // 6
         ' TRIM(pr.desc_colecao) DESC_COLECAO,'; // 7

  // Monta MIX Das Lojas =======================================================
  DMBelShop.SQLQuery1.First;
  For i:=1 to 35 do
  Begin
    If DMBelShop.SQLQuery1.Locate('Empresa',i,[]) Then
     MySql:=
      MySql+' (SELECT mx.est_minimo FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.empresa='+IntToStr(i)+')  LOJA'+IntToStr(i)+','
//      MySql+' (SELECT mx.ind_mix FROM ES_PRODUTOS_MIX mx WHERE mx.cod_produto=pr.cod_produto AND mx.empresa='+IntToStr(i)+')  LOJA'+IntToStr(i)+','
    Else
     MySql:=
      MySql+' 0 LOJA'+IntToStr(i)+',';
  End; // For i:=1 to 35 do

  MySql:=
   MySql+' pr.id_colecao,'+
         ' pr.cod_fornecedor,'+
         ' (SELECT fo.nome_cliente FROM LINXCLIENTESFORNEC fo WHERE fo.cod_cliente=pr.cod_fornecedor) Forn'+

         ' FROM lINXPRODUTOS pr'+

         ' WHERE pr.id_linha<>33'+ // Brindes
         ' AND   id_colecao<>294'+ // Brindes
         ' AND   pr.desativado=''N'''+
         ' AND   TRIM(COALESCE(pr.cod_auxiliar,''''))<>'''''+
         ' AND   CHAR_LENGTH(pr.cod_auxiliar)<=6';

         If Trim(sgCodForn)<>'' Then
          MySql:=
           MySql+' AND   pr.cod_fornecedor='+sgCodForn;

         If Trim(sgCodSetor)<>'' Then
          MySql:=
           MySql+' And   pr.id_setor='+sgCodSetor;

  MySql:=
   MySql+' ORDER BY 4, 5 DESC';
  DMBelShop.SQLQuery3.Close;
  DMBelShop.SQLQuery3.SQL.Clear;
  DMBelShop.SQLQuery3.SQL.Add(MySql);
  DMBelShop.SQLQuery3.Open;

  // Inicializa ClientDataSet Virtual
  If DMVirtual.CDS_V_MixAnaliseForn.Active Then
   DMVirtual.CDS_V_MixAnaliseForn.Close;

  DMVirtual.CDS_V_MixAnaliseForn.CreateDataSet;
  DMVirtual.CDS_V_MixAnaliseForn.IndexFieldNames:='';
  DMVirtual.CDS_V_MixAnaliseForn.Open;

  DMBelShop.SQLQuery3.DisableControls;
  While not DMBelShop.SQLQuery3.Eof do
  Begin
    Application.ProcessMessages;

    DMVirtual.CDS_V_MixAnaliseForn.Append;
    For i:=0 to DMBelShop.SQLQuery3.FieldCount-1 do
     DMVirtual.CDS_V_MixAnaliseForn.Fields[i].Assign(DMBelShop.SQLQuery3.Fields[i]);
    DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger:=0;

    DMVirtual.CDS_V_MixAnaliseForn.Post;

    DMBelShop.SQLQuery3.Next;
  End;
  DMBelShop.SQLQuery3.EnableControls;
  DMBelShop.SQLQuery3.Close;

  // Monta CheckBox no DBGrid ==================================================
  bgMontaCheck:=True;

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
  sCodForns: String;
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

  // Busca Fornecedores ========================================================
  If Trim(sgCodForn)='' Then
  Begin
    // Busca os Fornecedores Top 15 ============================================
    MySql:=' SELECT FIRST 15'+
           ' fo.cod_cliente Cod_Forn,'+
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
    DMBelShop.SQLQuery1.Close;
    DMBelShop.SQLQuery1.SQL.Clear;
    DMBelShop.SQLQuery1.SQL.Add(MySql);
    DMBelShop.SQLQuery1.Open;

    sCodForns:='';
    While Not DMBelShop.SQLQuery1.Eof do
    Begin
      If Trim(sCodForns)='' Then
       sCodForns:=DMBelShop.SQLQuery1.FieldByName('Cod_Forn').AsString
      Else
       sCodForns:=sCodForns+','+DMBelShop.SQLQuery1.FieldByName('Cod_Forn').AsString;

      DMBelShop.SQLQuery1.Next;
    End; // While Not DMBelShop.SQLQuery1.Eof do
    DMBelShop.SQLQuery1.Close;

    // Busca Faaturamento dos Fornecedores Top 15 e Outros =====================
    MySql:=' SELECT'+
           ' fo.nome_cliente FORNECEDOR,'+
           ' CAST(SUM(fa.vlr_fat) AS NUMERIC(12,2)) TOT_FAT'+
           ' FROM ES_FAT_PERIODO fa, LINXPRODUTOS pr, lINXCLIENTESFORNEC fo'+
           ' WHERE fa.cod_produto=pr.cod_produto'+
           ' AND   pr.cod_fornecedor=fo.cod_cliente'+
           ' AND   pr.cod_fornecedor IN ('+sCodForns+')';

           If Trim(sgCodLoja)<>'' Then
            MySql:=
             MySql+' AND fa.empresa='+sgCodLoja;

           If Trim(sgCodSetor)<>'' Then
            MySql:=
             MySql+' AND pr.id_setor='+sgCodSetor;

    MySql:=
     MySql+' GROUP BY 1'+

           ' UNION'+

           ' SELECT '+
           ' ''OUTROS FORNECEDORES'' FORNECEDOR,'+
           ' CAST(SUM(fa.vlr_fat) AS NUMERIC(12,2)) TOT_FAT'+
           ' FROM ES_FAT_PERIODO fa, LINXPRODUTOS pr, lINXCLIENTESFORNEC fo'+
           ' WHERE fa.cod_produto=pr.cod_produto'+
           ' AND   pr.cod_fornecedor=fo.cod_cliente'+
           ' AND   pr.cod_fornecedor NOT IN ('+sCodForns+')';

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

  // Busca Faturamentos de Fornecedor ==========================================
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
     MySql+' GROUP BY 1'+
           ' ORDER BY 2 DESC';
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

//  If (sgDtaIniPadrao=DateToStr(DtEdt_DtaInicio.Date)) and (sgDtaFimPadrao=DateToStr(DtEdt_DtaFim.Date)) Then
//  Begin
//    // Verifica se Transação esta Ativa
//    If DMBelShop.SQLC.InTransaction Then
//     DMBelShop.SQLC.Rollback(TD1);
//  End;

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

//  // Verifica se Transação esta Ativa
//  If DMBelShop.SQLC.InTransaction Then
//   DMBelShop.SQLC.Rollback(TD1);
//
//  // Monta Transacao Geral do Formulario =======================================
//  // NUNCA COMITAR - ROLLBACK NO FECHAMENTO DO FORM ============================
//  TD1.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//  TD1.IsolationLevel:=xilREADCOMMITTED;
//  DMBelShop.SQLC.StartTransaction(TD1);

  OdirPanApres.Caption:='AGUARDE 30 Segundos !! Calculando Faturamento do Período Solicitado...';
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
         ' AND  (((mv.operacao=''S'') AND (mv.tipo_transacao=''V''))'+ // Saídas Vendas
         '       OR'+
         '       ((mv.operacao=''DS'') AND (mv.tipo_transacao IS NULL)))'+ // Entradas Devoluções
         ' AND  mv.cancelado=''N'''+
         ' AND  mv.excluido =''N'''+
         ' AND  mv.empresa  <>2'+ // Sem Venda do CD - Empresa=2
         ' AND  mv.data_lancamento BETWEEN '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaInicio.Date))))+
                                            ' AND '+
                                            QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaFim.Date))))+
         ' AND  pr.id_linha<>33'+ // Brindes
         ' AND  pr.id_colecao<>294'+ // Brindes
         ' AND  pr.desativado=''N'''+
         ' AND   TRIM(COALESCE(pr.cod_auxiliar,''''))<>'''''+
         ' AND   CHAR_LENGTH(pr.cod_auxiliar)<=6'+

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

  DMVirtual.CDS_V_MixAnaliseForn.Close;

//  // Verifica se Transação esta Ativa
//  If DMBelShop.SQLC.InTransaction Then
//   DMBelShop.SQLC.Rollback(TD1);

  // Fecha Memo de Nome das Colunas de Lojas ===================================
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
  bgEnterTab:=True;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;

  // Se Monta CheckBox no DBGrid ===============================================
  bgMontaCheck:=False;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Balão ///////////////////////////////////////////////
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficosMinMax.Handle, @ti, TipoDoIcone, 'Minimizar/Maximizar', 'GRÃFICOS');

  // Grafico de Lojas ----------------------------------------------------------
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoLojasMinMax.Handle, @ti, TipoDoIcone, 'Maximizar/Minimizar', 'GRÃFICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoLojasGirar.Handle, @ti, TipoDoIcone, 'Girar', 'GRÃFICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoLojasNome.Handle, @ti, TipoDoIcone, 'Apresenta Nomes', 'GRÃFICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoLojasNomePerc.Handle, @ti, TipoDoIcone, 'Apresenta Nomes/Percentuais', 'GRÃFICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoLojasNomeVlr.Handle, @ti, TipoDoIcone, 'Apresenta Nomes/Valores', 'GRÃFICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoLojasPerc.Handle, @ti, TipoDoIcone, 'Apresenta Percentuais', 'GRÃFICO LOJAS');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoLojasVlr.Handle, @ti, TipoDoIcone, 'Apresenta Valores', 'GRÃFICO LOJAS');

  // Grafico de Fornecedores ---------------------------------------------------
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoFornMinMax.Handle, @ti, TipoDoIcone, 'Maximizar/Minimizar', 'GRÃFICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoFornGirar.Handle, @ti, TipoDoIcone, 'Girar', 'GRÃFICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoFornNome.Handle, @ti, TipoDoIcone, 'Apresenta Nomes', 'GRÃFICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoFornNomePerc.Handle, @ti, TipoDoIcone, 'Apresenta Nomes/Percentuais', 'GRÃFICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoFornNomeVlr.Handle, @ti, TipoDoIcone, 'Apresenta Nomes/Valores', 'GRÃFICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoFornPerc.Handle, @ti, TipoDoIcone, 'Apresenta Percentuais', 'GRÃFICO FORNECEDORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoFornVlr.Handle, @ti, TipoDoIcone, 'Apresenta Valores', 'GRÃFICO FORNECEDORES');

  // Grafico de Setores --------------------------------------------------------
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoSetoresMinMax.Handle, @ti, TipoDoIcone, 'Maximizar/Minimizar', 'GRÃFICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_GraficoSetoresGirar.Handle, @ti, TipoDoIcone, 'Girar', 'GRÃFICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoSetoresNome.Handle, @ti, TipoDoIcone, 'Apresenta Nomes', 'GRÃFICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoSetoresNomePerc.Handle, @ti, TipoDoIcone, 'Apresenta Nomes/Percentuais', 'GRÃFICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoSetoresNomeVlr.Handle, @ti, TipoDoIcone, 'Apresenta Nomes/Valores', 'GRÃFICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoSetoresPerc.Handle, @ti, TipoDoIcone, 'Apresenta Percentuais', 'GRÃFICO SETORES');

  CreateToolTips(Self.Handle);
  AddToolTip(Rb_GraficoSetoresVlr.Handle, @ti, TipoDoIcone, 'Apresenta Valores', 'GRÃFICO SETORES');
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
  DtEdt_DtaFim.Date   :=StrToDate(DateToStr(Date-1));
  sgDtaIniPadrao      :=DateToStr(DtEdt_DtaInicio.Date);
  sgDtaFimPadrao      :=DateToStr(DtEdt_DtaFim.Date);
end;

procedure TFrmAnaliseFornecedores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If bgEnterTab Then
  Begin
    If Key = #13 Then
    Begin
      Key:=#0;
      SelectNext(ActiveControl,True,True);
    End;
  End; // If bgEnterTab Then

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

  // ========== EFETUA A CONEXÃO ===============================================
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

  // ========== EFETUA A CONEXÃO ===============================================
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

  If (sgDtaIniPadrao<>DateToStr(DtEdt_DtaInicio.Date)) and (sgDtaFimPadrao<>DateToStr(DtEdt_DtaFim.Date)) Then
  Begin
    If msg('Período Informado Está CORRETO ??','C')=2 Then
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
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_ProdutosColEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

  // NAO DEIXA IR APARECER A COLUNA FIXADA
  if (THackDBGrid(Dbg_Produtos).SelectedIndex=0) Or
     (THackDBGrid(Dbg_Produtos).SelectedIndex=1) Or
     (THackDBGrid(Dbg_Produtos).SelectedIndex=2) Then // Index das Colunas Fixadas Sem Indicador
  begin
    THackDBGrid(Dbg_Produtos).LeftCol:=4; // Index da 1º Coluna Não Fixada Contando Indicador
    THackDBGrid(Dbg_Produtos).SelectedIndex:=3; // Index da 1º Coluna Não Fixada Sem Contar Indicador
    Dbg_Produtos.Refresh;
  End; // if (THackDBGrid(Dbg_Produtos).SelectedIndex=0) Or

  //============================================================================
  // Libera MultiSeleção Somente nas Colunas 3,4,5 =============================
  // FAT_PERIODO, DESC_SETOR, DESC_COLECAO =====================================
  //============================================================================
  If ((THackDBGrid(Dbg_Produtos).SelectedIndex in [3, 4, 5])) And (not bgMultiSelect) Then
  Begin
    bgMultiSelect:=True;
    Dbg_Produtos.Options:=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgMultiSelect];
  End; // If  (THackDBGrid(Dbg_Produtos).SelectedIndex in [3, 4, 5]) Then

  If (Not (THackDBGrid(Dbg_Produtos).SelectedIndex in [3, 4, 5])) And (bgMultiSelect) Then
  Begin
    bgMultiSelect:=False;
    Dbg_Produtos.Options:=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs];
  End; // If  (THackDBGrid(Dbg_Produtos).SelectedIndex in [3, 4, 5]) Then
  // Libera MultiSeleção Somente nas Colunas 3,4,5 =============================
  //============================================================================

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;State: TGridDrawState);
Var
  MySql: String;
  i: Integer;

// Cria CheckBox no DBGrid
//  Check: Integer;
//  R: TRect;
begin

// Cria CheckBox no DBGrid
//  inherited;

  //============================================================================
  // Acerta Colunas Fixadas ====================================================
  //============================================================================
  Dbg_ProdutosColEnter(Self);
  // Acerta Colunas Fixadas ====================================================
  //============================================================================

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
   Exit;

  //============================================================================
  // Cor no DBGrid para IND_MULTISEL Marcado ===================================
  //============================================================================
  if not (gdSelected in State) Then // Este comando altera cor da Linha
  Begin
    If DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger=1 Then
    Begin
      Dbg_Produtos.Canvas.Brush.Color:=clSkyBlue;

      Dbg_Produtos.Canvas.FillRect(Rect);
      Dbg_Produtos.DefaultDrawDataCell(Rect,Column.Field,state);
    End;
  End; // if not (gdSelected in State) Then
  // Cor no DBGrid para IND_MULTISEL Marcado ===================================
  //============================================================================

  //============================================================================
  // Cor no DBGrid para EST_MINIMO=0 - Não Pertence ao MIX da Loja =============
  //============================================================================
  For i:=0 to mMemoColLojas.Lines.Count-1 do
  Begin
    If (Column.FieldName=mMemoColLojas.Lines[i]) Then // Este comando altera cor da Celula
    Begin
      If DMVirtual.CDS_V_MixAnaliseForn.FieldByName(mMemoColLojas.Lines[i]).AsInteger<1 Then
      Begin
        Dbg_Produtos.Canvas.Font.Style:=[fsBold];
        Dbg_Produtos.Canvas.Brush.Color:=$009D9DFF; // Cor da Celula
      End;
    End;
  End; // For i:=0 to mMemoColLojas.Lines.Count-1 do
  // Cor no DBGrid para EST_MINIMO=0 - Não Pertence ao MIX da Loja =============
  //============================================================================

  // Funciona Somente com Isto
  Dbg_Produtos.Canvas.FillRect(Rect);
  Dbg_Produtos.DefaultDrawDataCell(Rect,Column.Field,state);

  //============================================================================
  // Desenha CheckBox no DBGrid ================================================
  //============================================================================
//  If bgMontaCheck Then
//  Begin
//    For i:=0 to mMemoColLojas.Lines.Count-1 do
//    Begin
//      If Column.FieldName=mMemoColLojas.Lines[i] Then
//      Begin
//        // Altera Cor Quando for MIX =============================================
//        If ((Sender as TDBGrid).DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger = 1) Then
//        Begin
//          Dbg_Produtos.Canvas.Brush.Color:=$00C6FFC6;
//        End;
//        TDBGrid(Sender).Canvas.FillRect(Rect);
//
//        // Monta Check ===========================================================
//        If ((Sender as TDBGrid).DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger = 1) Then
//         Begin
//           Check := DFCS_CHECKED;
//         End
//        Else
//         Begin
//           Check := 0;
//         End; //If ((Sender as TDBGrid).DataSource.Dataset.FieldByName(mMemoColLojas.Lines[i]).AsInteger = 1) Then
//
//        R := Rect;
//        InflateRect(R, -2, -2); // Diminue o tamanho do CheckBox
//        DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
//
//      End; // If Column.FieldName=mMemoColLojas.Lines[i] Then
//    End; // For i:=0 to mMemoColLojas.Lines.Count-1 do
//  End; // If bgMontaCheck Then
  // Desenha CheckBox no DBGrid ================================================
  //============================================================================

  //============================================================================
  // Fixar Colunas no DBGrid ===================================================
  //============================================================================
  THackDBGrid(Dbg_Produtos).FixedCols:=4; // Considerar o Indicador
  // Fixar Colunas no DBGrid ===================================================
  //============================================================================

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  // Acerta Colunas Fixadas ====================================================
  Dbg_ProdutosColEnter(Self);

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  i, iRecNo: Integer;
  MySql: String;

  sValor,
  sCodLojaSid, sCodProdSid,
  sEstMin, sEstMax: String;

  b, bGravar: Boolean;
begin
  If DMVirtual.CDS_V_MixAnaliseForn.IsEmpty Then
   Exit;

  //============================================================================
  // Bloquei <Ctrl + Delete> ou  <Shift> ou <Insert>  ==========================
  //============================================================================
  If (((Shift=[ssCtrl]) And (key=vk_delete))) Or (Shift=[ssShift]) Or (key=vk_space) Or (key=vk_insert) Then
   Abort;
  // Bloquei <Ctrl + Delete> ou  <Shift> ou <Insert>  ==========================
  //============================================================================

  //============================================================================
  // Seta Para Baixa=Enter =====================================================
  //============================================================================
//  if (key in [vk_down]) Then
  if key in [vk_down, vk_up, vk_left, vk_right, vk_tab] then //key := 0;  ou key := #13; <Enter>
  Begin
    If ((THackDBGrid(Dbg_Produtos).SelectedIndex>5) And (THackDBGrid(Dbg_Produtos).SelectedIndex<36)) And
      (DMVirtual.CDS_V_MixAnaliseForn.State=dsEdit) Then
    Begin
      DMVirtual.CDS_V_MixAnaliseForn.Cancel;
//      key := 0;
//       If Not AtualizaProduto Then
//        Exit;
//
//      If DMVirtual.CDS_V_MixAnaliseForn.RecNo<>DMVirtual.CDS_V_MixAnaliseForn.RecordCount Then
//       DMVirtual.CDS_V_MixAnaliseForn.Next;
//
//      key := 0;
    End; // If ((THackDBGrid(Dbg_Produtos).SelectedIndex>5) And (THackDBGrid(Dbg_Produtos).SelectedIndex<36)) And

//    If (THackDBGrid(Dbg_Produtos).SelectedIndex>5) And (THackDBGrid(Dbg_Produtos).SelectedIndex<36) Then
//    Begin
//      MyKey:=#13;
//      Dbg_ProdutosKeyPress(Dbg_Produtos, MyKey);
////      Exit;
////      If Not AtualizaProduto Then
////       Exit;
////
////      If DMVirtual.CDS_V_MixAnaliseForn.RecNo<>DMVirtual.CDS_V_MixAnaliseForn.RecordCount Then
////       DMVirtual.CDS_V_MixAnaliseForn.Next;
////      key := 0;
//    End; // If (THackDBGrid(Dbg_Produtos).SelectedIndex>5) And (THackDBGrid(Dbg_Produtos).SelectedIndex<36) Then

//    If Not (THackDBGrid(Dbg_Produtos).SelectedIndex>5) And (THackDBGrid(Dbg_Produtos).SelectedIndex<36) Then
//    Begin
//      If DMVirtual.CDS_V_MixAnaliseForn.RecNo=DMVirtual.CDS_V_MixAnaliseForn.RecordCount Then
//       key := 0;
//    End; // If (THackDBGrid(Dbg_Produtos).SelectedIndex>5) And (THackDBGrid(Dbg_Produtos).SelectedIndex<36) Then
  End; // if (key in [vk_down]) Then
  // Seta Para Baixa=Enter =====================================================
  //============================================================================

  //============================================================================
  // Acerta Colunas Fixadas ====================================================
  //============================================================================
  if (Key = VK_Left) and (THackDBGrid(Dbg_Produtos).SelectedIndex=3) Then // Index (Inciando por 0) da 1ª Coluna Não Fixada Sem Contar Indicador
  Begin
    Key := VK_Clear;
  End;
  // Acerta Colunas Fixadas ====================================================
  //============================================================================

  // Fixar Colunas no DBGrid ===================================================
  THackDBGrid(Dbg_Produtos).FixedCols:=4; // Considerar o Indicador

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
      msg('Produto Não Localizado !!','A');
    End;
  End; // If Key=Vk_F4 Then
  // Localizar Produto =========================================================
  //============================================================================

  //============================================================================
  // Apresenta Estoque Minimo/Maximo ===========================================
  //============================================================================
  If key=VK_F5 Then
  Begin
    // Verifica se é Uma Coluna de Indicação de MIX ============================
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

    // Não é Uma Coluna de Indicação de MIX -------------------------
    If Not b Then
     Exit;

    // Produto Não Esta no MIX =================================================
    If DMVirtual.CDS_V_MixAnaliseForn.FieldByName(Dbg_Produtos.SelectedField.FieldName).AsInteger=0 Then
    Begin
      msg('Produto Não Pertence ao Mix da Loja !!','A');
      Exit;
    End;

    If Trim(DMVirtual.CDS_V_MixAnaliseFornCOD_AUXILIAR.AsString)='' Then
    Begin
      msg('Produto Não Vinculado no'+cr+'Controle de Estoque Minimo/Máximo !!','A');
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
      msg('Produto Não Vinculado no'+cr+'Controle de Estoque Minimo/Máximo !!','A');
      Exit;
    End;

    b:=True;
    bGravar:=False;
    While b do
    Begin
      //                   Caption do Form                               Titul1o           Titulo2          Valor1   Valor2   SetFucos  Botao1    Botao2
      If InputQuery2Values('<Tab> Mudar de Campo <Enter> Salva', 'Estoque Mínimo (Use <Tab> para Mover)', 'Estoque Máximo (Use <Tab> para Mover)', sEstMin, sEstMax, sEstMin, 'Salvar', 'Voltar') Then
       Begin
         Try
           StrToInt(sEstMin);
           StrToInt(sEstMax);

           If StrToInt(sEstMin)=0 Then
            Begin
              msg('Estoque Mínino Igual a 0 (ZERO) !!'+cr+cr+'Para Retira do MIX da Loja'+cr+'Volte e Tecle <F2> ou <F3>','A');
            End
           Else
            Begin
              bGravar:=True;
              Break;
            End;
         Except
           msg('Estoque Mínino/Máximo'+cr+cr+'Deve Ser Um Valor INTEIRO !!','A');
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

      DMVirtual.CDS_V_MixAnaliseForn.Edit;
      DMVirtual.CDS_V_MixAnaliseForn.FieldByName(Dbg_Produtos.SelectedField.FieldName).AsInteger:=StrToInt(sEstMin);
      DMVirtual.CDS_V_MixAnaliseForn.Post;
    End; // If bGravar Then
  End; // If key=VK_F5 Then
  // Apresenta Estoque Minimo/Maximo ===========================================
  //============================================================================

  //============================================================================
  // Marca Produto para MultiAlterações ========================================
  //============================================================================
  If key=VK_F6 Then
  Begin
    OdirPanApres.Caption:='AGUARDE !! Marcando MultiAlterações...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmAnaliseFornecedores;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;

    iRecNo:=DMVirtual.CDS_V_MixAnaliseForn.RecNo;
    DMVirtual.CDS_V_MixAnaliseForn.First;
    DMVirtual.CDS_V_MixAnaliseForn.DisableControls;
    While Not DMVirtual.CDS_V_MixAnaliseForn.Eof do
    Begin
      // Altera Apresentação
      If DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger=0 Then
      Begin
        DMVirtual.CDS_V_MixAnaliseForn.Edit;
        DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger:=1;
        DMVirtual.CDS_V_MixAnaliseForn.Post;
      End;

      DMVirtual.CDS_V_MixAnaliseForn.Next;
    End; // While Not DMVirtual.CDS_V_MixAnaliseForn.Eof do
    DMVirtual.CDS_V_MixAnaliseForn.EnableControls;
    Dbg_Produtos.Options:=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines];
    Dbg_Produtos.Options:=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgMultiSelect];

    DMVirtual.CDS_V_MixAnaliseForn.RecNo:=iRecNo;
    OdirPanApres.Visible:=False;
  End; // If key=VK_F6 Then
  // Desmarca Produto para MultiAlterações =====================================
  //============================================================================

  //============================================================================
  // Marca/Desmarca Produto para MultiAlterações ===============================
  //============================================================================
  If key=VK_F7 Then
  Begin
    DMVirtual.CDS_V_MixAnaliseForn.Edit;
    If DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger=1 Then
     DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger:=0
    Else
     DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger:=1;
    DMVirtual.CDS_V_MixAnaliseForn.Post;
  End; // If key=VK_F7 Then
  // Marca/Desmarca Produto para MultiAlterações ===============================
  //============================================================================

  //============================================================================
  // Marca/Desmarca Produto Selecionados para MultiAlterações ==================
  //============================================================================
  If key=VK_F8 Then
  Begin
    iRecNo:=DMVirtual.CDS_V_MixAnaliseForn.RecNo;
    For i:=0 to Dbg_Produtos.SelectedRows.Count - 1 do
    Begin
      // Posiciona na Linha Selecionada
      Dbg_Produtos.Datasource.Dataset.Bookmark:=Dbg_Produtos.SelectedRows[i];

      // Altera Apresentação
      If DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger=0 Then
      Begin
        DMVirtual.CDS_V_MixAnaliseForn.Edit;
        DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger:=1;
        DMVirtual.CDS_V_MixAnaliseForn.Post;
      End
    End; // For i:=0 to Dbg_Produtos.SelectedRows.Count - 1 do
    Dbg_Produtos.Options:=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines];
    Dbg_Produtos.Options:=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgMultiSelect];

    DMVirtual.CDS_V_MixAnaliseForn.RecNo:=iRecNo;
  End; // If key=VK_F8 Then
  // Marca/Desmarca Produto Selecionados para MultiAlterações ==================
  //============================================================================

  //============================================================================
  // Desmarca Produto Selecionados para MultiAlterações ========================
  //============================================================================
  If key=VK_F9 Then
  Begin
    OdirPanApres.Caption:='AGUARDE !! Desmarcando MultiAlterações...';
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmAnaliseFornecedores.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmAnaliseFornecedores;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;

    iRecNo:=DMVirtual.CDS_V_MixAnaliseForn.RecNo;
    DMVirtual.CDS_V_MixAnaliseForn.First;
    DMVirtual.CDS_V_MixAnaliseForn.DisableControls;
    While Not DMVirtual.CDS_V_MixAnaliseForn.Eof do
    Begin
      // Altera Apresentação
      If DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger=1 Then
      Begin
        DMVirtual.CDS_V_MixAnaliseForn.Edit;
        DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger:=0;
        DMVirtual.CDS_V_MixAnaliseForn.Post;
      End;

      DMVirtual.CDS_V_MixAnaliseForn.Next;
    End; // While Not DMVirtual.CDS_V_MixAnaliseForn.Eof do
    DMVirtual.CDS_V_MixAnaliseForn.EnableControls;
    Dbg_Produtos.Options:=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines];
    Dbg_Produtos.Options:=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgMultiSelect];

    DMVirtual.CDS_V_MixAnaliseForn.RecNo:=iRecNo;
    OdirPanApres.Visible:=False;
  End; // If key=VK_F9 Then
  // Desmarca Produto Selecionados para MultiAlterações ========================
  //============================================================================

  // Fixar Colunas no DBGrid ===================================================
  THackDBGrid(Dbg_Produtos).FixedCols:=4; // Considerar o Indicador

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = ' ') then
   Abort;

  If ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
   Exit;

  // Vai para o Proximo Produtos
  If (Key=#13) Then
  Begin
    If ((THackDBGrid(Dbg_Produtos).SelectedIndex>5) And (THackDBGrid(Dbg_Produtos).SelectedIndex<36)) And
      (DMVirtual.CDS_V_MixAnaliseForn.State=dsEdit) Then
    Begin
       If Not AtualizaProduto Then
        Exit;
    End; // If ((THackDBGrid(Dbg_Produtos).SelectedIndex>5) And (THackDBGrid(Dbg_Produtos).SelectedIndex<36)) And

    If DMVirtual.CDS_V_MixAnaliseForn.RecNo<>DMVirtual.CDS_V_MixAnaliseForn.RecordCount Then
     DMVirtual.CDS_V_MixAnaliseForn.Next;
  End; // If (Key=#13) Then
end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  // Acerta Colunas Fixadas -----------------------------------------
  Dbg_ProdutosColEnter(Self);

  // Fixar Colunas no DBGrid ===================================================
  THackDBGrid(Dbg_Produtos).FixedCols:=4; // Considerar o Indicador

end;

procedure TFrmAnaliseFornecedores.DtEdt_DtaInicioEnter(Sender: TObject);
begin
  bgEnterTab:=True;
  DtEdt_DtaInicio.TabStop:=True;
  DtEdt_DtaFim.TabStop   :=True;
end;

procedure TFrmAnaliseFornecedores.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // (ERRO) ACERTA ROLAGEM DO MOUSE (SCROLL)
  If Msg.message = WM_MOUSEWHEEL then // primeiramente verificamos se é o evento a ser tratado...
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

procedure TFrmAnaliseFornecedores.DtEdt_DtaInicioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If key=VK_F2 Then
  Begin
    DtEdt_DtaInicio.Date:=StrToDate(sgDtaIniPadrao);
    DtEdt_DtaFim.Date   :=StrToDate(sgDtaFimPadrao);
  End; // If key=VK_F2 Then
end;

procedure TFrmAnaliseFornecedores.Bt_MultiAlteracoesClick(Sender: TObject);
Var
  i: integer;
  b: Boolean;
begin
  Dbg_Produtos.SetFocus;

  If DMVirtual.CDS_V_MixAnaliseForn.IsEmpty Then
   Exit;

  // Verifica se Existe Produto Selecionado ====================================
  i:=DMVirtual.CDS_V_MixAnaliseForn.RecNo;

  DMVirtual.CDS_V_MixAnaliseForn.First;
  DMVirtual.CDS_V_MixAnaliseForn.DisableControls;
  b:=False;
  While Not DMVirtual.CDS_V_MixAnaliseForn.Eof do
  Begin
    If DMVirtual.CDS_V_MixAnaliseFornIND_MULTISEL.AsInteger=1 Then
    Begin
      b:=True;
      Break;
    End;
    DMVirtual.CDS_V_MixAnaliseForn.Next;
  End; // While Not DMVirtual.CDS_V_MixAnaliseForn.Eof do
  DMVirtual.CDS_V_MixAnaliseForn.RecNo:=i;
  DMVirtual.CDS_V_MixAnaliseForn.EnableControls;

  If Not b Then
  Begin
    msg('Sem Produtos Selecionado !!','A');
    Dbg_Produtos.SetFocus;
    Exit;
  End; // If Not b Then

  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmSolicitacoes.Caption:='MultiAlterações';
  FrmBelShop.AbreSolicitacoes(27);

  For i:=0 to Cbx_Lojas.Items.Count-1 do
  Begin
    If i<>0 Then
     FrmSolicitacoes.Lbx_MixLojasSel.Items.Add(Cbx_Lojas.Items[i]);
  End; // For i:=0 to Cbx_Lojas.Items.Count-1 do

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    MixMultiplasAlteracoes;
  End; // If bgProcessar Then
  FreeAndNil(FrmSolicitacoes);

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosTitleClick(Column: TColumn);
begin

  If (Column.FieldName<>'COD_PRODUTO') And (Column.FieldName<>'NOME') Then
  Begin
    If (sgOrderGrid='') or (sgOrderGrid='Crescente') Then
     Begin
       OrderByGrid(DMVirtual.CDS_V_MixAnaliseForn, Dbg_Produtos, Column.FieldName, False);
       sgOrderGrid:='Decescente';
     End
    Else
     Begin
       OrderByGrid(DMVirtual.CDS_V_MixAnaliseForn, Dbg_Produtos, Column.FieldName, True);
       sgOrderGrid:='Crescente';
     End; // If (sgOrderGrid='') or (sgOrderGrid='Crescente') Then
  End; // If (Column.FieldName<>'COD_PRODUTO') And (Column.FieldName<>'NOME') Then
end;

procedure TFrmAnaliseFornecedores.Bt_GruposLojasClick(Sender: TObject);
begin
  Dbg_Produtos.SetFocus;

  msg('Opção em Desenvolvimento ...','A');
  Exit;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmSolicitacoes.Caption:='Cadastros';
  FrmBelShop.AbreSolicitacoes(28);

  // Mota Grupo de Lojas e Lojas =============================================== 

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    ShowMessage('Proc')
  End; // If bgProcessar Then
  FreeAndNil(FrmSolicitacoes);

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosExit(Sender: TObject);
begin
  bgEnterTab:=True;

end;

procedure TFrmAnaliseFornecedores.Dbg_ProdutosEnter(Sender: TObject);
begin
  bgEnterTab:=False;

end;

end.



