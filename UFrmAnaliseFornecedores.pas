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
  ToolEdit, CurrEdit, Grids, DBGrids, DBGridJul;

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
    Bt_Minimizar: TJvXPButton;
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
    DBGridJul1: TDBGridJul;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure Bt_MinimizarClick(Sender: TObject);

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // Graficos
    Procedure FechaSeriesGraficos;
    Procedure CriaSeriesGraficos;
    Procedure AcertaGraficos;

    Function  PeriodoConsiste: Boolean;

    Procedure FaturamentoPeriodo;

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure DtEdt_DtaInicioExit(Sender: TObject);
    procedure DtEdt_DtaFimPropertiesChange(Sender: TObject);
    procedure Bt_BuscaFornecedorClick(Sender: TObject);
    procedure Bt_BuscaSetorClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAnaliseFornecedores: TFrmAnaliseFornecedores;

  TD : TTransactionDesc; // Ponteiro de Transação
  bgSair: Boolean;
  sOrderGrid: String;    // Ordenar Grid

  // Series de Graficos Pizza
  gsPizzaLojas: TPieSeries;
  gsPizzaForn: TPieSeries;
  gsPizzaSetores: TPieSeries;

implementation

uses DK_Procs1, UDMBelShop, UDMVirtual, UPesquisa;

{$R *.dfm}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir _ INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca faturamento dos produtos no Periodo >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAnaliseFornecedores.FaturamentoPeriodo;
Var
  MySql: String;
Begin
  Screen.Cursor:=crAppStart;
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
         ' AND  mv.data_lancamento BETWEEN '+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaFim.Date))))+
                                            ' AND '+
                                            QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdt_DtaFim.Date))))+
         ' AND  pr.id_linha<>33'+ // Brindes
         ' AND  pr.id_colecao<>294'+ // Brindes
         ' AND  pr.desativado=''N'''+
         ' AND  pr.cod_auxiliar IS NOT NULL'+

         ' GROUP BY 1,2,3,4';
  DMBelShop.SQLC.Execute(MySql,nil,nil);
  DMBelShop.SQLC.Commit(td);

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
  gsPizzaLojas.Marks.Style:=smsLabel;
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

  // Linhas Laterais, Chão e Fundo =============================================
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
Var
  MySql: String;
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Acerta Graficos ===========================================================
  AcertaGraficos;

  // Cria Serie do Grafico Lojas ===============================================
  CriaSeriesGraficos;

  // Busca Lojas ===============================================================
  MySql:=' SELECT l.nome_emp||''-''||l.empresa Loja'+
         ' FROM LINXLOJAS l'+
         ' WHERE l.empresa NOT IN (5)'+ // Mostardeiro
         ' ORDER BY 1';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  Cbx_Lojas.Items.Clear;
  Cbx_Lojas.Items.Add('TODAS AS LOJAS');

  DMBelShop.CDS_BuscaRapida.DisableControls;
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    Cbx_Lojas.Items.Add(DMBelShop.CDS_BuscaRapida.FieldByName('Loja').AsString);

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.EnableControls;
  DMBelShop.CDS_BuscaRapida.Close;

// OdirApagar - 29/05/2018  
//  // Acerta Periodo ============================================================
//  DtEdt_DtaInicio.Date:=PrimUltDia(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor),'P');
//  DtEdt_DtaFim.Date   :=StrToDate(DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)));
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
  bgSair:=True;
  Close;

end;

procedure TFrmAnaliseFornecedores.Bt_MinimizarClick(  Sender: TObject);
begin
  If Pan_Solicitacoes.Height=50 Then
   Pan_Solicitacoes.Height:=308
  Else
   Pan_Solicitacoes.Height:=50;
end;

procedure TFrmAnaliseFornecedores.DtEdt_DtaInicioExit(Sender: TObject);
begin
  DtEdt_DtaFim.SetFocus;
end;

procedure TFrmAnaliseFornecedores.DtEdt_DtaFimPropertiesChange(Sender: TObject);
begin

  If Length(DtEdt_DtaFim.Text)<10 Then
  Begin
    Exit;
  End;

  If Not PeriodoConsiste Then
   Exit;
//OPSS
//  // Verifica se Transação esta Ativa
//  If DMBelShop.SQLC.InTransaction Then
//   DMBelShop.SQLC.Rollback(TD);
//
//  // Monta Transacao ===========================================================
//  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//  TD.IsolationLevel:=xilREADCOMMITTED;
//  DMBelShop.SQLC.StartTransaction(TD);
//
//  // Busca Faturamento dos produtos no Periodo =================================
//  FaturamentoPeriodo;
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
begin
  DMVirtual.CDS_V_AnaliseForn.Open;
end;

end.
