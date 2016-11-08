unit UFrmGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxContainer,
  cxEdit, StdCtrls, Spin, acPNG, JvExStdCtrls, JvRadioButton,
  DbChart, Chart, Series, TeeProcs, TeEngine, // Grafico
  JvCheckBox, RXCtrls, cxGroupBox, JvExControls, JvXPCore, JvXPButtons,
  Clipbrd, // PrintScreen
  ExtCtrls, cxPC, DBClient, FMTBcd, DB, SqlExpr, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;
//  Último: SqlExpr;

{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, StdCtrls, JvExStdCtrls,
  JvCheckBox, JvRadioButton, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxPC,
  DbChart, Chart, Series, TeeProcs, TeEngine, // Grafico
  Clipbrd, // PrintScreen
  cxContainer, cxEdit, cxGroupBox, RXCtrls, DB, DBClient, Spin, acPNG,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;
}

type
  TFrmGrafico = class(TForm)
    PC_Grafico: TcxPageControl;
    Ts_Solicitacaoes: TcxTabSheet;
    Ts_Grafico: TcxTabSheet;
    DbGrafico: TDBChart;
    Panel93: TPanel;
    Bt_GraficoVoltar: TJvXPButton;
    Pan_GraficoTpArquivo: TPanel;
    Label118: TLabel;
    Rb_GraficoTpBMP: TJvRadioButton;
    Rb_GraficoTpWMF: TJvRadioButton;
    Rb_GraficoTpClipboard: TJvRadioButton;
    Panel1: TPanel;
    Bt_SolicitacaoSair: TJvXPButton;
    Gb_Solicitacoes: TcxGroupBox;
    Gb_ItensApres: TcxGroupBox;
    Gb_Resultado: TcxGroupBox;
    Bt_SolicitacaoGrafico: TJvXPButton;
    CLbx_ItensApres: TRxCheckListBox;
    CLbx_Resultados: TRxCheckListBox;
    Label1: TLabel;
    EdtLocalizaForn: TEdit;
    Bt_GraficoDescr: TJvXPButton;
    Pan_SelecTudo: TPanel;
    Cbk_SelectTodos: TJvCheckBox;
    Bt_GraficoSalvar: TJvXPButton;
    Panel2: TPanel;
    Pan_Grafico: TPanel;
    Gb_GraficoTpGrafico: TGroupBox;
    Gb_GraficoDiversos: TGroupBox;
    Ckb_GraficoValorVertical: TJvCheckBox;
    Gb_GraficoTpApres: TGroupBox;
    Cbx_GraficoTpApres: TComboBox;
    Cbx_GraficoTipo: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Ckb_GraficoMouse: TJvCheckBox;
    Gb_GraficoNrItens: TGroupBox;
    SpeNrItens: TSpinEdit;
    Gb_GraficoTpVisul: TGroupBox;
    Label113: TLabel;
    Sb_Grafico3D: TScrollBar;
    Ckb_Grafico3D: TJvCheckBox;
    Label116: TLabel;
    Panel4: TPanel;
    Bt_GraficoUltimo: TJvXPButton;
    Bt_GraficoAnterior: TJvXPButton;
    Bt_GraficoPrimeiro: TJvXPButton;
    Bt_GraficoProximo: TJvXPButton;
    Lb_NumPages: TLabel;
    Panel3: TPanel;
    Bt_GraficoZoomN: TJvXPButton;
    Bt_GraficoZoomM: TJvXPButton;
    Bt_GraficoSlides: TJvXPButton;
    procedure Bt_GraficoVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Cbx_GraficoTpApresChange(Sender: TObject);
    procedure Sb_Grafico3DChange(Sender: TObject);
    procedure Ckb_Grafico3DClick(Sender: TObject);
    procedure Ckb_Grafico3DKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_GraficoValorVerticalClick(Sender: TObject);
    procedure Ckb_GraficoValorVerticalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_GraficoMouseClick(Sender: TObject);

    // Odir ====================================================================
    
    Procedure FechaSeriesGraficos;
    Procedure ApresentaGrafico;
    Procedure Grafico(CDS: TClientDataSet; TipoGraf, Titulo: String);
    
    // Odir ====================================================================

    procedure Ckb_GraficoMouseKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Rb_GraficoTpBMPClick(Sender: TObject);
    procedure Rb_GraficoTpBMPKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_SolicitacaoSairClick(Sender: TObject);
    procedure Bt_SolicitacaoGraficoClick(Sender: TObject);
    procedure CLbx_ResultadosClick(Sender: TObject);
    procedure EdtLocalizaFornChange(Sender: TObject);
    procedure CLbx_ItensApresClick(Sender: TObject);
    procedure DbGraficoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Bt_GraficoDescrClick(Sender: TObject);
    procedure Cbk_SelectTodosClick(Sender: TObject);
    procedure DbGraficoPageChange(Sender: TObject);
    procedure Cbx_GraficoTipoChange(Sender: TObject);
    procedure SpeNrItensChange(Sender: TObject);
    procedure Bt_GraficoZoomMClick(Sender: TObject);
    procedure Bt_GraficoZoomNClick(Sender: TObject);
    procedure Bt_GraficoPrimeiroClick(Sender: TObject);
    procedure Bt_GraficoProximoClick(Sender: TObject);
    procedure Bt_GraficoAnteriorClick(Sender: TObject);
    procedure Bt_GraficoUltimoClick(Sender: TObject);
    procedure Bt_GraficoSalvarClick(Sender: TObject);
    procedure Bt_GraficoSlidesClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGrafico: TFrmGrafico;

  // Dados de Aoresentacao
  sgTitulo, sgResultado: String;
  
  // Series de Graficos
  gsBarra:TBarSeries;
  gsLinha:TLineSeries;
  gsPizza:TPieSeries;

  // Grafico Mouse
  OldX,OldY:Longint;
  CrossHairColor:TColor;
  CrossHairStyle:TPenStyle;

  sgColunaApres: String;
  
implementation

uses DK_Procs1, UDMBelShop, UDMVirtual, Math;

{$R *.dfm}

//==============================================================================
// Odir ========================================================================
//==============================================================================

// Gera Grafico de Objetivos ( TipoGraf=(B)arras (L)inha (P)izza ) >>>>>>>>>>>>>
Procedure TFrmGrafico.Grafico(CDS: TClientDataSet; TipoGraf, Titulo: String);
Var
  iNumSeq, ii, i: Integer;
  sCodApres, sDescApres: String;
  Cor: TColor;
Begin

  // Acerta Grafico ============================================================
  DBGrafico.SeriesList.Clear;
  DBGrafico.AxisVisible:=True;

  // Cor e Largura da Lateral --------------------------------------------------
  DBGrafico.LeftWall.Brush.Color:=clDefault;
  DBGrafico.LeftWall.Brush.Style:=bsSolid;
  DBGrafico.LeftWall.Color:=$0080FFFF;
  DBGrafico.LeftWall.Pen.Width:=2;
  DBGrafico.LeftWall.Dark3D:=True; // Lateral Solida

// odiraqui ////////////////////////////
//  DbGrafico.LeftAxis.Automatic:=False;
//  DbGrafico.LeftAxis.Maximum:=45;
//  DbGrafico.LeftAxis.Minimum:=-30;
////////////////////////////////////////

  DBGrafico.BottomWall.Brush.Color:=clDefault;
  DbGrafico.BottomWall.Brush.Style:=bsSolid;
  DbGrafico.BottomWall.Color:=$0080FFFF;
  DbGrafico.BottomWall.Pen.Width:=2;
  DbGrafico.BottomWall.Dark3D:=True; // Lateral Solida

  DbGrafico.Color:=clAqua;
  DbGrafico.View3DWalls:=True; // 3D nas Laterais

//  DbGrafico.BottomAxis.MinorTicks.Visible:=True; // ??????

  // Linhas Laterais, Chão e Fundo ---------------------------------------------
  DbGrafico.LeftAxis.Grid.Visible:=True;
  DbGrafico.BottomAxis.Grid.Visible:=True;

  // 3D ------------------------------------------------------------------------
  DbGrafico.View3D:=False;
  If Ckb_Grafico3D.Checked Then
  Begin
    DbGrafico.View3D:=True;
    DbGrafico.View3DOptions.Orthogonal:=True;
  End;
  Sb_Grafico3D.Enabled:=Ckb_Grafico3D.Checked;

  // Descricao Item da Parte de Baixo ------------------------------------------
  DbGrafico.BottomAxis.Labels:=True;	// Apresenta Label
	DbGrafico.BottomAxis.LabelsAngle:=90; // 1-Horizontal 90-Vertical

  // Movimento do Mouse ========================================================
  Ckb_GraficoMouseClick(self);

  // Cria Serie (Barras) =======================================================
  If TipoGraf='B' Then
  Begin
    gsBarra.ParentChart:=DbGrafico;
    gsBarra.Clear;
    // gsBarra.Marks.Style:=smsLabelValue; // smsValue;
    gsBarra.Marks.Visible:=True;
    // gsBarra.Marks.Transparent:=True;
    // gsBarra.ColorEachPoint:=True;
    DbGrafico.BottomAxis.MinorTicks.Visible:=True;

    // Sb_GraficoRotacao.Position:=DbGrafico.View3DOptions.Rotation;
  End;

  // Cria Serie (Linha) ========================================================
  If TipoGraf='L' Then
  Begin
    gsLinha.ParentChart:=DbGrafico;
    gsLinha.Clear;

    gsLinha.Pointer.Visible:=True;
    gsLinha.Pointer.VertSize:=2;
    gsLinha.Pointer.HorizSize:=2;

    gsLinha.Marks.Visible:=True;
    // gsLinha.Marks.Style:=smsLabelValue; // smsValue;
    // gsLinha.Marks.Transparent:=True;
    // gsLinha.ColorEachPoint:=True;
    
    If Ckb_Grafico3D.Checked Then
     gsLinha.LinePen.Width:=1
    Else
     gsLinha.LinePen.Width:=8;
     
    // DbGrafico.LeftAxis.PosAxis:=100;
    // DbGrafico.LeftAxis.CustomDraw(5,6, 8,true);
    // Sb_GraficoRotacao.Position:=DbGrafico.View3DOptions.Rotation;
   End;

  // Cria Serie (Pizza) ========================================================
  If TipoGraf='P' Then
  Begin
    gsPizza.ParentChart:=DbGrafico;
    gsPizza.Clear;
    // gsPizza.Marks.Style:=smsLabelValue; // smsValue; // smsLabel;
    gsPizza.Marks.Arrow.Color:=clBlack;
    gsPizza.Marks.Arrow.Width:=3;
    gsPizza.Marks.Visible:=True;
    // gsPizza.ColorEachPoint:=True;
    gsPizza.Circled:=False;

    // Sb_GraficoRotacao.Position:=DbGrafico.View3DOptions.Elevation;
  End;

  // Busca Resultado a Apresentar ==============================================
  If Trim(sgResultado)='' Then
  Begin
    For i:=0 to CLbx_Resultados.Items.Count-1 do
    Begin
      If CLbx_Resultados.Checked[i] then
      Begin
        sgResultado:=CLbx_Resultados.Items[i];
        Break;
      End; 
    End; // For i:=0 to CLbx_Resultados.Items.Count-1 do
  End; // If Trim(sgResultado)='' Then
  
  // Titulo --------------------------------------------------------------------
  sgTitulo:=Titulo+' - '+sgResultado;
  DbGrafico.Title.Text.Clear;
  DbGrafico.Title.Text.Add(sgTitulo);

  // Guarda Posicao No ClienteDataSet ==========================================
  iNumSeq:=CDS.RecNo;
  
  // Busca Itens e Apresenta Graficor ==========================================
  For i:=0 to CLbx_ItensApres.Items.Count-1 do
  Begin
    If CLbx_ItensApres.Checked[i] then
    Begin
      ii:=pos(' -> ',CLbx_ItensApres.Items[i]);
      sCodApres:=Trim(Copy(CLbx_ItensApres.Items[i],ii+4,Length(CLbx_ItensApres.Items[i])));
      sDescApres:=Trim(Copy(CLbx_ItensApres.Items[i],1,15));
      CDS.Locate('CODFORNECEDOR', sCodAPres,[]);

      For ii:=0 to CDS.Fields.Count-1 do
      Begin 
        If CDS.Fields[ii].DisplayLabel=sgResultado Then
        Begin
          If CDS.FieldByName(CDS.Fields[ii].FieldName).AsCurrency<0 Then
           Begin
             Cor:=clRed
           End
          Else
           Begin
             Cor:=CorAleatoria;

             While Cor=clRed do
              Cor:=CorAleatoria;
           End;

          If TipoGraf='B' Then
           gsBarra.Add(CDS.FieldByName(CDS.Fields[ii].FieldName).AsCurrency, sDescApres, Cor);

          // Grava Series (Linha) -------------------------------------
          If TipoGraf='L' Then
           gsLinha.Add(CDS.FieldByName(CDS.Fields[ii].FieldName).AsCurrency, sDescApres, Cor);

          // Grava Series (Pizza) -------------------------------------
          If TipoGraf='P' Then
           gsPizza.Add(CDS.FieldByName(CDS.Fields[ii].FieldName).AsCurrency, sDescApres, Cor);
                       
        End; // If CDS.Fields[ii].DisplayLabel=sResultado Then
      End; // For ii:=0 to CDS.Fields.Count-1 do

    End; // If CLbx_ItensApres.Checked[i] then
  End; // For i:=0 to CLbx_Resultados.Items.Count-1 do

  // Retorna Posicao No ClienteDataSet =========================================
  CDS.RecNo:=iNumSeq;
                
  // Monta e Apresenta Gráfico =================================================              
  Cbx_GraficoTpApresChange(Self);
  Ckb_GraficoValorVerticalClick(Self);

  DbGrafico.MaxPointsPerPage:=SpeNrItens.Value;;
  DbGraficoPageChange(DbGrafico);  {<- página / número de páginas repintar}

  If Bt_GraficoPrimeiro.Enabled Then
   Bt_GraficoPrimeiroClick(Self);

End; // Gera Grafico ( TipoGraf=(B)arras (L)inha (P)izza ) >>>>>>>>>>>>>>>>>>>>>

// Apresenta Grafico >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGrafico.ApresentaGrafico;
Var
  sTipoGrafico: String;
Begin
    // Cria Serie do Grafico ===================================================
    If Cbx_GraficoTipo.ItemIndex=0 Then
    Begin
      gsBarra:=TBarSeries.Create(Self);
      sTipoGrafico:='B';
    End;

    If Cbx_GraficoTipo.ItemIndex=1 Then
    Begin
      gsLinha:=TLineSeries.Create(Self);
      sTipoGrafico:='L';
    End;

    If Cbx_GraficoTipo.ItemIndex=2 Then
    Begin
      gsPizza:=TPieSeries.Create(Self);
      sTipoGrafico:='P';
    End;

   // Apresenta o Grafico ----------------------------------------
   If Gb_ItensApres.Caption=' Fornecedores a Apresentar ' Then
    Grafico(DMVirtual.CDS_V_MargemLucroForn, sTipoGrafico, 'Sintético de Fornecedores');
End; // Apresenta Grafico >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Fecha Series de Graficos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGrafico.FechaSeriesGraficos;
Begin
  // Series do Grafico =========================================================
  Try
    If gsBarra<>nil Then
     FreeAndNil(gsBarra); 
  Except
  End;
    
  Try
    If gsLinha<>nil Then
     FreeAndNil(gsLinha); 
  Except
  End;

  Try
    If gsPizza<>nil Then
     FreeAndNil(gsPizza); 
  Except
  End;
End; // Fecha Series de Graficos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmGrafico.Bt_GraficoVoltarClick(Sender: TObject);
begin
  // Retorno ao TabSheet Ts_Solicitacaoes ======================================
  Ts_Solicitacaoes.TabVisible:=True;
  Ts_Grafico.TabVisible:=False;
  PC_Grafico.ActivePageIndex:=0;

  CLbx_ItensApres.SetFocus;
end;

procedure TFrmGrafico.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  Ts_Grafico.TabVisible:=False;
  PC_Grafico.ActivePageIndex:=0;
end;

procedure TFrmGrafico.Cbx_GraficoTpApresChange(Sender: TObject);

   Procedure ApresGrafico(CBX: TComboBox; Serie: TBarSeries; SerStyle: TSeriesMarksStyle); Overload;
   Begin
     If CBX.ItemIndex=0 Then
     Begin
       Serie.Marks.Style:=SerStyle;
       Serie.Marks.Visible:=True;
     End;
   End;

   Procedure ApresGrafico(CBX: TComboBox; Serie: TLineSeries; SerStyle: TSeriesMarksStyle); Overload;
   Begin
     If CBX.ItemIndex=1 Then
     Begin
       Serie.Marks.Style:=SerStyle;
       Serie.Marks.Visible:=True;
     End;
   End;

   Procedure ApresGrafico(CBX: TComboBox; Serie: TPieSeries; SerStyle: TSeriesMarksStyle); Overload;
   Begin
     If CBX.ItemIndex=2 Then
     Begin
       Serie.Marks.Style:=SerStyle;
       Serie.Marks.Visible:=True;
     End;
   End;

begin
                                     
  // Apresenta Grafico =========================================================

  // Sem Apresentação -----------------------------------------------
  If Cbx_GraficoTpApres.ItemIndex=0 Then
  Begin
    If Cbx_GraficoTipo.ItemIndex=0 Then gsBarra.Marks.Visible:=False;
    If Cbx_GraficoTipo.ItemIndex=1 Then gsLinha.Marks.Visible:=False;
    If Cbx_GraficoTipo.ItemIndex=2 Then gsPizza.Marks.Visible:=False;
    Exit;
  End;           

  // Descrição ------------------------------------------------------
  If Cbx_GraficoTpApres.ItemIndex=1 Then
  Begin
    ApresGrafico(Cbx_GraficoTipo, gsBarra, smsLabel);
    ApresGrafico(Cbx_GraficoTipo, gsLinha, smsLabel);
    ApresGrafico(Cbx_GraficoTipo, gsPizza, smsLabel);
    Exit;
  End;

  // Descrição, % Sobre Valor Total Individual ----------------------
  If Cbx_GraficoTpApres.ItemIndex=2 Then
  Begin
    ApresGrafico(Cbx_GraficoTipo, gsBarra, smsLabelPercent);
    ApresGrafico(Cbx_GraficoTipo, gsLinha, smsLabelPercent);
    ApresGrafico(Cbx_GraficoTipo, gsPizza, smsLabelPercent);
    Exit;
  End;
  
  // Descrição, % Sobre Total Individual, Valor Total Individual ----
  If Cbx_GraficoTpApres.ItemIndex=3 Then
  Begin
    ApresGrafico(Cbx_GraficoTipo, gsBarra, smsLabelPercentTotal);
    ApresGrafico(Cbx_GraficoTipo, gsLinha, smsLabelPercentTotal);
    ApresGrafico(Cbx_GraficoTipo, gsPizza, smsLabelPercentTotal);
    Exit;
  End;

  // Descrição, Value Individual ------------------------------------
  If Cbx_GraficoTpApres.ItemIndex=4 Then
  Begin
    ApresGrafico(Cbx_GraficoTipo, gsBarra, smsLabelValue);
    ApresGrafico(Cbx_GraficoTipo, gsLinha, smsLabelValue);
    ApresGrafico(Cbx_GraficoTipo, gsPizza, smsLabelValue);
    Exit;
  End;

  // % Sobre Total Individual ---------------------------------------
  If Cbx_GraficoTpApres.ItemIndex=5 Then
  Begin
    ApresGrafico(Cbx_GraficoTipo, gsBarra, smsPercent);
    ApresGrafico(Cbx_GraficoTipo, gsLinha, smsPercent);
    ApresGrafico(Cbx_GraficoTipo, gsPizza, smsPercent);
    Exit;
  End;

  // % Sobre Total Individual, Valor Total Individual ---------------
  If Cbx_GraficoTpApres.ItemIndex=6 Then
  Begin
    ApresGrafico(Cbx_GraficoTipo, gsBarra, smsPercentTotal);
    ApresGrafico(Cbx_GraficoTipo, gsLinha, smsPercentTotal);
    ApresGrafico(Cbx_GraficoTipo, gsPizza, smsPercentTotal);
    Exit;
  End;
  
  // Valor Individual -----------------------------------------------
  If Cbx_GraficoTpApres.ItemIndex=7 Then
  Begin
    ApresGrafico(Cbx_GraficoTipo, gsBarra, smsValue);
    ApresGrafico(Cbx_GraficoTipo, gsLinha, smsValue);
    ApresGrafico(Cbx_GraficoTipo, gsPizza, smsValue);
    Exit;
  End;

end;

procedure TFrmGrafico.Sb_Grafico3DChange(Sender: TObject);
begin
  DbGrafico.Chart3DPercent:=Sb_Grafico3D.Position;

end;

procedure TFrmGrafico.Ckb_Grafico3DClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_Grafico3D);

  If Ckb_Grafico3D.Checked Then
   Begin
     Sb_Grafico3D.Enabled:=True;

     If Cbx_GraficoTipo.ItemIndex=1 Then // Grafico Linha
      gsLinha.LinePen.Width:=1;
   End
  Else
   Begin
     Sb_Grafico3D.Enabled:=False;

     If Cbx_GraficoTipo.ItemIndex=1 Then // Grafico Linha
      gsLinha.LinePen.Width:=8;
   End;

  DbGrafico.View3D:=Ckb_Grafico3D.Checked;

  // Verifica de nao de pizza ==================================================
  If Not Cbx_GraficoTipo.ItemIndex=2 Then // Grafico Pizza
   DbGrafico.View3DOptions.Orthogonal:=True;

end;

procedure TFrmGrafico.Ckb_Grafico3DKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Ckb_Grafico3DClick(Self);
end;

procedure TFrmGrafico.Ckb_GraficoValorVerticalClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_GraficoValorVertical);
  
  If Ckb_GraficoValorVertical.Checked Then
   DbGrafico.LeftAxis.Visible:=True
  Else
   DbGrafico.LeftAxis.Visible:=False;


end;

procedure TFrmGrafico.Ckb_GraficoValorVerticalKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Ckb_GraficoValorVerticalClick(Self);
end;

procedure TFrmGrafico.Ckb_GraficoMouseClick(Sender: TObject);
begin
  AcertaCkb_SN(Ckb_GraficoMouse);
  
  If Ckb_GraficoMouse.Checked Then
  Begin
    OldX:=-1;                          { initialize variables }
    CrossHairColor:=clYellow;
    CrossHairStyle:=psSolid;
  End;

end;

procedure TFrmGrafico.Ckb_GraficoMouseKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Ckb_GraficoMouseClick(Self);
end;

procedure TFrmGrafico.Rb_GraficoTpBMPClick(Sender: TObject);
begin
  AcertaRb_Style(Rb_GraficoTpBMP);
  AcertaRb_Style(Rb_GraficoTpWMF);
  AcertaRb_Style(Rb_GraficoTpClipboard);

end;

procedure TFrmGrafico.Rb_GraficoTpBMPKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Rb_GraficoTpBMPClick(Self);
end;

procedure TFrmGrafico.Bt_SolicitacaoSairClick(Sender: TObject);
begin
  FechaSeriesGraficos;

  sgColunaApres:='';
  Close;
end;

procedure TFrmGrafico.Bt_SolicitacaoGraficoClick(Sender: TObject);
Var
  i: Integer;
  bSiga: Boolean;
begin
  
  // Verifica Seleção de Fornecedor ============================================
  bSiga:=False;
  For i:=0 to CLbx_ItensApres.Items.Count-1 do
  Begin
    if CLbx_ItensApres.Checked[i] Then
    Begin
      bSiga:=True;
      Break;
    End;
  End; // For i:=0 to CLbx_Resultados.Items.Count-1 do

  If Not bSiga Then
  Begin
    msg('Favor Selecionar Fornecedor(s)','A');
    Exit;
  End;
   
  // Verifica Seleção de Resultado =============================================
  bSiga:=False;
  For i:=0 to CLbx_Resultados.Items.Count-1 do
  Begin
    if CLbx_Resultados.Checked[i] Then
    Begin
      bSiga:=True;
      Break;
    End;
  End; // For i:=0 to CLbx_Resultados.Items.Count-1 do

  If Not bSiga Then
  Begin
    msg('Favor Selecionar O Resultado a Apresentar','A');
    Exit;
  End;

  // Fecha Series do Grafico ===================================================
  FechaSeriesGraficos;

  // Apresenta Grafico =======================================================
  ApresentaGrafico;
    
  If Cbx_GraficoTpApres.Text<>'Sem Apresentação' Then
   Cbx_GraficoTpApresChange(Self);

  Ts_Grafico.TabVisible:=True;
  Ts_Solicitacaoes.TabVisible:=False;
  PC_Grafico.ActivePageIndex:=1;
end;

procedure TFrmGrafico.CLbx_ResultadosClick(Sender: TObject);
Var
  ii, i: Integer;
begin
  ii:=CLbx_Resultados.ItemIndex;

  For i:=0 to CLbx_Resultados.Items.Count-1 do
   CLbx_Resultados.Checked[i]:=False;

  CLbx_Resultados.Checked[ii]:=True;

  sgResultado:='';
   
end;

procedure TFrmGrafico.EdtLocalizaFornChange(Sender: TObject);
Var
  i: Integer;
begin

  For i:=0 to CLbx_ItensApres.Items.Count-1 do
  Begin
    if pos(AnsiUpperCase(EdtLocalizaForn.Text),AnsiUpperCase(CLbx_ItensApres.Items[i]))>0 Then
    Begin
      CLbx_ItensApres.ItemIndex:=i;
      Break;
    End;
  End; // For i:=0 to CLbx_Resultados.Items.Count-1 do
end;

procedure TFrmGrafico.CLbx_ItensApresClick(Sender: TObject);
begin
  If CLbx_ItensApres.Checked[CLbx_ItensApres.ItemIndex] Then
   CLbx_ItensApres.Checked[CLbx_ItensApres.ItemIndex]:=False
  Else
   CLbx_ItensApres.Checked[CLbx_ItensApres.ItemIndex]:=True;
end;

procedure TFrmGrafico.DbGraficoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  { This procedure draws the crosshair lines }
  Procedure DrawCross(AX,AY:Integer);
  begin
    With DbGrafico,Canvas do
    begin
      Pen.Color:=CrossHairColor;
      Pen.Style:=CrossHairStyle;
      Pen.Mode:=pmXor;
      Pen.Width:=2;
      MoveTo(ax,ChartRect.Top-Height3D);
      LineTo(ax,ChartRect.Bottom-Height3D);
      MoveTo(ChartRect.Left+Width3D,ay);
      LineTo(ChartRect.Right+Width3D,ay);
    end;
  end;
begin
  if not Ckb_GraficoMouse.Checked Then
   Exit;
   
  if (OldX<>-1) then
  begin
    DrawCross(OldX,OldY);  { draw old crosshair }
    OldX:=-1;
  end;

  { check if mouse is inside Chart rectangle }
  if PtInRect(DbGrafico.ChartRect, Point(X-DbGrafico.Width3D,Y+DbGrafico.Height3D)) Then
  begin
    DrawCross(x,y);  { draw crosshair at current position }
    { store old position }
    OldX:=x;
    OldY:=y;
    { set label text }
//    With Linha do
//    begin
//      GetCursorValues(tmpX,tmpY);  { <-- get values under mouse cursor }
////      Label3.Caption:=GetVertAxis.LabelValue(tmpY)+
////                      ' '+
////                      GetHorizAxis.LabelValue(tmpX);
//    end;
  end;


end;

procedure TFrmGrafico.Bt_GraficoDescrClick(Sender: TObject);
begin
  Gb_GraficoTpGrafico.SetFocus;

  If DbGrafico.BottomAxis.Labels Then
   DbGrafico.BottomAxis.Labels:=False
  Else
   DbGrafico.BottomAxis.Labels:=True
end;

procedure TFrmGrafico.Cbk_SelectTodosClick(Sender: TObject);
Var
  i: Integer;
begin

  If Cbk_SelectTodos.Checked Then
  Begin
    If msg('Deseja Realmente Selecionar TODOS ??','C')=2 Then
    Begin
      Cbk_SelectTodos.Checked:=False;
      Exit;
    End;
  End;

  AcertaCkb_Style(Cbk_SelectTodos);

  For i:=0 to CLbx_ItensApres.Items.Count-1 do
   CLbx_ItensApres.Checked[i]:=Cbk_SelectTodos.Checked;

end;

procedure TFrmGrafico.DbGraficoPageChange(Sender: TObject);
begin
  DbGrafico.UndoZoom;
  Lb_NumPages.Caption:='Página: '+IntToStr(DbGrafico.Page)+'/'+IntToStr(DbGrafico.NumPages);

  {Mostrar o número da página atual e o número total de páginas}
  {(Como um relatório)}
  {Ativar ou desativar os botões}  
  Bt_GraficoAnterior.Enabled:=DbGrafico.Page > 1;
  Bt_GraficoProximo.Enabled:=DbGrafico.Page < DbGrafico.NumPages;
  Bt_GraficoUltimo.Enabled:=Bt_GraficoProximo.Enabled;
  Bt_GraficoPrimeiro.Enabled:=Bt_GraficoAnterior.Enabled;

end;

procedure TFrmGrafico.Cbx_GraficoTipoChange(Sender: TObject);
begin
  FechaSeriesGraficos;
  ApresentaGrafico;
  
end;

procedure TFrmGrafico.SpeNrItensChange(Sender: TObject);
begin
   {Alterar o número máximo de pontos por página}
   {Um valor de zero significa "Não há páginas. Mostrar todos os pontos"}
  DbGrafico.MaxPointsPerPage:=SpeNrItens.Value;;
  DbGraficoPageChange(DbGrafico);  {<- página / número de páginas repintar}

end;

procedure TFrmGrafico.Bt_GraficoZoomMClick(Sender: TObject);
Var
  i: Integer;
begin
  Cbx_GraficoTpApres.SetFocus;

  i:=DbGrafico.SeriesList.Count;
  DbGrafico.ZoomPercent(115);
  i:=DbGrafico.SeriesList.Count;
  DbGrafico.LeftAxis.Minimum:=0;

  SpeNrItens.Value:=i;
end;                 

procedure TFrmGrafico.Bt_GraficoZoomNClick(Sender: TObject);
begin
  Cbx_GraficoTpApres.SetFocus;

  DbGrafico.ZoomPercent(85);
  DbGrafico.LeftAxis.Minimum:=0;

  SpeNrItens.Value:=15;
  DbGraficoPageChange(DbGrafico);  {<- página / número de páginas repintar}
end;

procedure TFrmGrafico.Bt_GraficoPrimeiroClick(Sender: TObject);
begin
  Cbx_GraficoTpApres.SetFocus;

  DbGrafico.Page:=1;  { Ir para a primeira página }
end;

procedure TFrmGrafico.Bt_GraficoProximoClick(Sender: TObject);
begin
  Cbx_GraficoTpApres.SetFocus;

  DbGrafico.NextPage;  { <-- Ir seguinte página }

end;

procedure TFrmGrafico.Bt_GraficoAnteriorClick(Sender: TObject);
begin
  Cbx_GraficoTpApres.SetFocus;

  DbGrafico.PreviousPage; { <-- Ir à página anterior }

end;

procedure TFrmGrafico.Bt_GraficoUltimoClick(Sender: TObject);
begin
  Cbx_GraficoTpApres.SetFocus;

  DbGrafico.Page:=DbGrafico.NumPages;  { Ir para a última página }

end;

procedure TFrmGrafico.Bt_GraficoSalvarClick(Sender: TObject);
Var
  SaveDialog: TSaveDialog;
begin

  Cbx_GraficoTpApres.SetFocus;

  // Salva em Memória ==========================================================
  If Rb_GraficoTpClipboard.Checked Then
  Begin
    DbGrafico.CopyToClipboardMetafile(True); 

    msg('Arquivo Salvo em Memória'+#13+'Use < Ctrl + V > para Busca da Memória !','A');
    Exit;
  End; // If Rb_GraficoTpClipboard.Checked Then

  SaveDialog:=TSaveDialog.Create(SaveDialog);

  // Salva em BMP ==============================================================
  If Rb_GraficoTpBMP.Checked Then
  Begin
    With SaveDialog do
    Begin
      Options := [ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
      DefaultExt := 'BMP';
      Filter := 'Arquivo (*.BMP)|*.BMP';
      FilterIndex := 1;
      Title := 'Salvar Arquivo';

      If Execute then
       Begin
         DbGrafico.SaveToMetafile(SaveDialog.FileName);
       End
      Else // if Execute then
       Begin
         Free;
         Exit;
       End; // if Execute then

      Free;
    End; // With SaveDialog do
  End; //If Rb_GraficoTpBMP.Checked Then

  // Salva em WMF ==============================================================
  If Rb_GraficoTpWMF.Checked Then
  Begin
    With SaveDialog do
    Begin
      Options := [ofPathMustExist, ofHideReadOnly, ofOverwritePrompt];
      DefaultExt := 'WMF';
      Filter := 'Arquivo (*.WMF)|*.WMF';
      FilterIndex := 1;
      Title := 'Salvar Arquivo';

      If Execute then
       Begin
         DbGrafico.SaveToMetafile(SaveDialog.FileName);
       End
      Else // If Execute then
      Begin
        Free;
        Exit;
      End; // If Execute then

      Free;
    End; // With SaveDialog do
  End; //If Rb_GraficoTpBMP.Checked Then

end;

procedure TFrmGrafico.Bt_GraficoSlidesClick(Sender: TObject);
begin
  Cbx_GraficoTpApres.SetFocus;

  If DbGrafico.NumPages>1 Then
  Begin
    If Bt_GraficoPrimeiro.Enabled Then
     Begin
       Bt_GraficoPrimeiroClick(Self);

       DbGrafico.Title.Text.Clear;
       DbGrafico.Title.Color:=clYellow;
       DbGrafico.Title.Text.Add('SLIDE PÁGINA: '+IntToStr(DbGrafico.Page)+' ( '+sgTitulo+' )');
       Refresh;

       Sleep(3000);
     End
    Else
     Begin
       DbGrafico.Title.Text.Clear;
       DbGrafico.Title.Color:=clYellow;
       DbGrafico.Title.Text.Add('SLIDE PÁGINA: '+IntToStr(DbGrafico.Page)+' ( '+sgTitulo+' )');
       Refresh;

       Sleep(3000);
     End;

    Screen.Cursor:=crAppStart;
    While Bt_GraficoProximo.Enabled do
    Begin
      Bt_GraficoProximoClick(Self);

      DbGrafico.Title.Text.Clear;
      DbGrafico.Title.Color:=clYellow;
      DbGrafico.Title.Text.Add('SLIDE PÁGINA: '+IntToStr(DbGrafico.Page)+' ( '+sgTitulo+' )');
      Refresh;

      Sleep(3000);
    End; // While Bt_GraficoProximo.Enabled do

    msg('Fim da Apresentação dos Slides !!','A');

    // Retorna Titulo ----------------------------------------------------------
    DbGrafico.Title.Text.Clear;
    DbGrafico.Title.Text.Add(sgTitulo);
    DbGrafico.Title.Color:=clWhite;
    Refresh;
    
    Screen.Cursor:=crDefault;
  End;
end;

procedure TFrmGrafico.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

end.
