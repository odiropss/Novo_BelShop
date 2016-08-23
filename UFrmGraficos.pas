unit UFrmGraficos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, CurrEdit, Grids, DBGrids, ExtCtrls,
  IBDatabase, IBQuery, IBCustomDataSet,
  JvExControls, JvXPCore, JvXPButtons,
  MMSystem, JvExStdCtrls, JvRadioButton, JvCheckBox, DBClient,
  Series, TeeProcs, TeEngine, Chart, DbChart, JvExExtCtrls, JvExtComponent,
  JvClock; // Graficos

type
  TFrmGrafico = class(TForm)
    Pan_Principal: TPanel;
    DbGrafico: TDBChart;
    Panel2: TPanel;
    Bt_Iniciar: TJvXPButton;
    Bt_Para: TJvXPButton;
    PanGrafico: TPanel;
    Ckb_Grafico3D: TJvCheckBox;
    Sb_Grafico3D: TScrollBar;
    Label113: TLabel;
    Label116: TLabel;
    Label1: TLabel;
    Rb_GraficoTpBarras: TJvRadioButton;
    Rb_GraficoTpLinha: TJvRadioButton;
    Rb_GraficoTpPizza: TJvRadioButton;
    Shape1: TShape;
    Shape3: TShape;
    Pan_Relogio: TPanel;
    Relogio: TJvClock;
    Pan_RelTempo: TPanel;
    Label2: TLabel;
    Lab_RelReprocessa: TLabel;
    Bt_Configuracoes: TJvXPButton;
    Pan_Legenda: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_IniciarClick(Sender: TObject);

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Procedure ProcessaVendasLojas;

    Function  BuscaObjetivos: Boolean; // Busca Objetivo
    Procedure BuscaVendas; // Busca Vendas

    Procedure AtualizaGrupos; // Atualiza Grupos no CDS_V_Grafico

    Procedure FechaSeriesGraficos;
    Procedure MontaGrafico;
    Procedure Grafico(CDS: TClientDataSet; TipoGraf, Titulo: String);
    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Rb_GraficoTpBarrasClick(Sender: TObject);
    procedure Rb_GraficoTpBarrasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ckb_Grafico3DClick(Sender: TObject);
    procedure Ckb_Grafico3DKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Sb_Grafico3DChange(Sender: TObject);
    procedure Bt_ConfiguracoesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGrafico: TFrmGrafico;

  dDtaHoje: TDate;
  bgConexaoLocal: Boolean; // Se Conexão com o Servidor da Matriz é Local - Verifica a Existencia do Arquivo "ConexaoExterna.ini"

  sgParametro, // Guarda Paramentro de Entrada no Sistema. "Comercial" = Apresenta Faturamento do Dia Anterior
  sgNConectadas, // Lojas Não Conectas, Rodar Novamente no Caso de sgParametro='Comercial'
  sgPeriodo,
  sgDtaInicio, sgDtaFim,
  sgNomeMes: String;

  mgLojas: TMemo; // Guarda Lojas não Conectadas para Tentar Novamente (sgParametro='Comercial')

  wgDiaH, wgMesH, wgAnoH: Word;

  igNumDiasUteisHoje: Integer; // Dias Uteis até a Data Final
  igNumDiasUteis: Integer;  // Dias Uteis No Mês Atual
  sgDiaSemanaMes: String;

  bgParaMemo, // Se para While Quando mgLojas Estiver Vazio;
  bgSiga, // Se para o Processamento
  bgSair, bgExiste: Boolean;

  sgTitulo: String;
  sgTempoPausa: String;

  IBQ_Filial  : TIBQuery;
  IBQ_MPMS    : TIBQuery;

  // Series de Graficos
  gsBarra:TBarSeries;
  gsLinha:TLineSeries;
  gsPizza:TPieSeries;

  cgR1_VlrTot, cgR1_VlrObj,
  cgR2_VlrTot, cgR2_VlrObj,
  cgR3_VlrTot, cgR3_VlrObj,
  cgRE_VlrTot, cgRE_VlrObj: Currency;

  sgR1, // => Codigo das Lojas que Participam do Resultado 1 = Total de Vendas Loja e Salão
  sgR2, // => Codigo das Lojas que Participam do Resultado 2 = Total de Vendas Loja e Salão
  sgR3, // => Codigo das Lojas que Participam do Resultado 3 = Total de Vendas Salão
  sgRE, // => Codigo das Lojas que == NÃO == Participam do Resultado Total da Empresa = Total de Vendas Loja e Salão
  sgCodObjetivo, sgPerLimite: String;

implementation

uses UDMConexoes, UDMGraficos, DK_Procs1;

{$R *.dfm}

//==============================================================================
// Odir INICIO =================================================================
//==============================================================================

// Atualiza Grupos no CDS_V_Grafico >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGrafico.AtualizaGrupos;
Var
  sCodLoja: String;
Begin
  cgR1_VlrTot:=0;
  cgR1_VlrObj:=0;
  cgR2_VlrTot:=0;
  cgR2_VlrObj:=0;
  cgR3_VlrTot:=0;
  cgR3_VlrObj:=0;
  cgRE_VlrTot:=0;
  cgRE_VlrObj:=0;


  DMGraficos.CDS_V_Grafico.First;
  While Not DMGraficos.CDS_V_Grafico.Eof do
  Begin
    sCodLoja:=DMGraficos.CDS_V_GraficoCOD_LOJA.AsString;
    sCodLoja:=Copy(sCodLoja,5,Length(sCodLoja));

    If StrToIntDef(sCodLoja,0)<>0 Then
    Begin
      If Pos(sCodLoja, sgR1)<>0 Then
      Begin
        cgR1_VlrTot:=cgR1_VlrTot+DMGraficos.CDS_V_GraficoVLR_TOTAL.AsCurrency;
        cgR1_VlrObj:=cgR1_VlrObj+DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsCurrency;
      End;

      If Pos(sCodLoja, sgR2)<>0 Then
      Begin
        cgR2_VlrTot:=cgR2_VlrTot+DMGraficos.CDS_V_GraficoVLR_TOTAL.AsCurrency;
        cgR2_VlrObj:=cgR2_VlrObj+DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsCurrency;
      End;

      If Pos(sCodLoja, sgR3)=0 Then
      Begin
        cgR3_VlrTot:=cgR3_VlrTot+DMGraficos.CDS_V_GraficoVLR_SALAO.AsCurrency;
        cgR3_VlrObj:=cgR3_VlrObj+DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsCurrency;
      End;

      If Pos(sCodLoja, sgRE)=0 Then
      Begin
        cgRE_VlrTot:=cgRE_VlrTot+DMGraficos.CDS_V_GraficoVLR_TOTAL.AsCurrency;
        cgRE_VlrObj:=cgRE_VlrObj+DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsCurrency;
      End;
    End; // If StrToIntDef(DMGraficos.CDS_V_GraficoCOD_LOJA.AsString,0)<>0 Then

    DMGraficos.CDS_V_Grafico.Next;
  End; // While Not DMGraficos.CDS_V_Grafico.Eof do

  // Atualiza Resultado Grupo R1 ===============================================
  If DMGraficos.CDS_V_Grafico.Locate('COD_LOJA','Bel_R1',[]) Then
   Begin
     DMGraficos.CDS_V_Grafico.Edit;
   End
  Else
   Begin
     DMGraficos.CDS_V_Grafico.Insert;
     DMGraficos.CDS_V_GraficoCOD_LOJA.AsString:='Bel_R1';

     DMGraficos.CDS_V_GraficoVLR_TOTAL.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsCurrency:=0;

     DMGraficos.CDS_V_GraficoVLR_SALAO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoPER_SALAO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoCONECTADO.AsString:='S';
   End;

  DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsCurrency :=cgR1_VlrObj;
  DMGraficos.CDS_V_GraficoVLR_TOTAL.AsCurrency    :=cgR1_VlrTot;

  DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=0;
  If (DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat<>0) and (DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat<>0) Then
  Begin
    cgR1_VlrObj:=(((DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat*100)/DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat)-100);
    DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=Round_5(cgR1_VlrObj,2);
  End;
  DMGraficos.CDS_V_Grafico.Post;

  // Atualiza Resultado Grupo R2 ===============================================
  If DMGraficos.CDS_V_Grafico.Locate('COD_LOJA','Bel_R2',[]) Then
   Begin
     DMGraficos.CDS_V_Grafico.Edit;
   End
  Else
   Begin
     DMGraficos.CDS_V_Grafico.Insert;
     DMGraficos.CDS_V_GraficoCOD_LOJA.AsString:='Bel_R2';

     DMGraficos.CDS_V_GraficoVLR_TOTAL.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsCurrency:=0;

     DMGraficos.CDS_V_GraficoVLR_SALAO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoPER_SALAO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoCONECTADO.AsString:='S';
   End;

  DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsCurrency :=cgR2_VlrObj;
  DMGraficos.CDS_V_GraficoVLR_TOTAL.AsCurrency    :=cgR2_VlrTot;

  DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=0;
  If (DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat<>0) and (DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat<>0) Then
  Begin
    cgR2_VlrObj:=(((DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat*100)/DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat)-100);
    DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=Round_5(cgR2_VlrObj,2);
  End;
  DMGraficos.CDS_V_Grafico.Post;

  // Atualiza Resultado Grupo R3 ===============================================
  If DMGraficos.CDS_V_Grafico.Locate('COD_LOJA','Bel_R3',[]) Then
   Begin
     DMGraficos.CDS_V_Grafico.Edit;
   End
  Else
   Begin
     DMGraficos.CDS_V_Grafico.Insert;
     DMGraficos.CDS_V_GraficoCOD_LOJA.AsString:='Bel_R3';

     DMGraficos.CDS_V_GraficoVLR_TOTAL.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsCurrency:=0;

     DMGraficos.CDS_V_GraficoVLR_SALAO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoPER_SALAO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoCONECTADO.AsString:='S';
   End;

  DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsCurrency :=cgR3_VlrObj;
  DMGraficos.CDS_V_GraficoVLR_TOTAL.AsCurrency    :=cgR3_VlrTot;

  DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=0;
  If (DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat<>0) and (DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat<>0) Then
  Begin
    cgR3_VlrObj:=(((DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat*100)/DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat)-100);
    DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=Round_5(cgR3_VlrObj,2);
  End;
  DMGraficos.CDS_V_Grafico.Post;

  // Atualiza Resultado Grupo RE ===============================================
  If DMGraficos.CDS_V_Grafico.Locate('COD_LOJA','Bel_RE',[]) Then
   Begin
     DMGraficos.CDS_V_Grafico.Edit;
   End
  Else
   Begin
     DMGraficos.CDS_V_Grafico.Insert;
     DMGraficos.CDS_V_GraficoCOD_LOJA.AsString:='Bel_RE';

     DMGraficos.CDS_V_GraficoVLR_TOTAL.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsCurrency:=0;

     DMGraficos.CDS_V_GraficoVLR_SALAO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoPER_SALAO.AsCurrency:=0;
     DMGraficos.CDS_V_GraficoCONECTADO.AsString:='S';
   End;

  DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsCurrency :=cgRE_VlrObj;
  DMGraficos.CDS_V_GraficoVLR_TOTAL.AsCurrency    :=cgRE_VlrTot;

  DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=0;
  If (DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat<>0) and (DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat<>0) Then
  Begin
    cgRE_VlrObj:=(((DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat*100)/DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat)-100);
    DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=Round_5(cgRE_VlrObj,2);
  End;
  DMGraficos.CDS_V_Grafico.Post;

  DMGraficos.CDS_V_Grafico.First;

End; // Atualiza Grupos no CDS_V_Grafico >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Vendas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGrafico.BuscaVendas;
Var
  s, sCodLoja, IBDB, IBT: String;
  MySql: String;
  b, bConectou: Boolean;

  i, iRecNo: Integer;
  tHrPausaInicio, tHrPausaFim: TTime;
  c: Currency;
Begin

  bgParaMemo:=False;
  If (mgLojas<>nil) AND (mgLojas.Lines.Count>0) and (sgParametro='Comercial') Then
   bgParaMemo:=True;

  FrmGrafico.Refresh;

  DMGraficos.CDS_V_Grafico.First;
  While Not DMGraficos.CDS_V_Grafico.Eof do
  Begin
    Application.ProcessMessages;

    If Not bgSiga Then
    Begin
      msg('Sistema Parado Pelo Usuário !!','A');
      Break;
    End;

    iRecNo:=DMGraficos.CDS_V_Grafico.RecNo;

    If (mgLojas<>nil) And (sgParametro='Comercial') Then
    Begin
      If (mgLojas.Lines.Count>0) and (bgParaMemo) Then
       Begin
         DMGraficos.CDS_V_Grafico.Locate('COD_LOJA','Bel_'+mgLojas.Lines[0],[]);
         mgLojas.Lines.Delete(0);
       End
      Else if (bgParaMemo) Then
       Begin
         Break;
       End;
    End;

    sCodLoja:=DMGraficos.CDS_V_GraficoCOD_LOJA.AsString;
    sCodLoja:=Copy(sCodLoja,5,Length(sCodLoja));

    If StrToIntDef(sCodLoja,0)<>0 Then // Não Processa Grupos
    Begin
      IBDB:='IBDB_'+sCodLoja;
      IBT :='IBT_'+sCodLoja;
      Caption:='Demonstrativo Grafico'+' - Em Processamento: Bel_'+sCodLoja;

      bConectou:=False;
      If ConexaoEmpIndividual(IBDB, IBT, 'A') Then
      Begin
        // Monta IBQuery =======================================================
        Try
          DMGraficos.CriaQueryIB(IBDB, IBT, IBQ_Filial, True);
        Except
          on e : Exception do
          Begin
            MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
          End; // on e : Exception do
        End;

        Try
          b:=False;
          While Not b do
          Begin
            b:=IBTransacao('S', IBT);
          End; // While Not b do

          // Faturamento do Mes das Lojas ======================================
          MySql:=' SELECT'+
                 ' COALESCE(SUM(COALESCE(mp.valtotal,0)),0) VLR_TOTAL,'+
                 ' COALESCE(SUM(CASE'+
                 '                WHEN pr.principalfor IN (''000500'',''000883'') THEN'+
                 '                   COALESCE(mp.valtotal,0)'+
                 '              ELSE'+
                 '                   0'+
                 '              END),0) VLR_SALAO'+

                 ' FROM MCLI mo, MCLIPRO mp, PRODUTO pr'+
                 ' WHERE mo.chavenf=mp.chavenf'+
                 ' AND   mp.codproduto=pr.codproduto'+
                 ' AND   mo.codfilial='+QuotedStr(sCodLoja);

                 If sCodLoja='99' Then
                  MySql:=MySql+' AND mo.codcomprovante IN (''001'',''007'')'+
                               ' AND mo.clienteoufilial=''0''' // Somente Cliente
                 Else
                  MySql:=MySql+' AND   mo.codcomprovante IN (''002'',''007'')';

          MySql:=
           MySql+' AND   mo.datacomprovante BETWEEN '+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaInicio)))+
                                              ' AND '+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaFim)));
          IBQ_Filial.Close;
          IBQ_Filial.SQL.Clear;
          IBQ_Filial.SQL.Add(MySql);
          IBQ_Filial.Open;

          bConectou:=True;

          // Busca Objetivos da Loja Conectada =================================
          If DMGraficos.CDS_V_GraficoCONECTADO.AsString='N' Then
          Begin
            MySql:=' SELECT om.cod_objetivo, ob.des_objetivo,'+
                   ' COALESCE(om.obj_mes'+FormatFloat('00',wgMesH)+',0) Objetivo,'+

                   ' ROUND((COALESCE(om.obj_mes'+FormatFloat('00',wgMesH)+',0)/'+
                                            IntToStr(igNumDiasUteis)+'),2) Objetivo_Dia,'+

                   ' ROUND(((ROUND((COALESCE(om.obj_mes'+FormatFloat('00',wgMesH)+',0)/'+
                                            IntToStr(igNumDiasUteis)+'),2))*'+
                                            IntToStr(igNumDiasUteisHoje)+'),2) Objetivo_Hoje'+

                   ' FROM FIN_OBJETIVOS_METAS om'+
                   ' WHERE om.cod_objetivo in ('+sgCodObjetivo+', 5)'+
                   ' AND   om.des_ano='+VarToStr(wgAnoH)+
                   ' AND   om.cod_filial='+QuotedStr(sCodLoja);
            DMGraficos.CDS_Busca.Close;
            DMGraficos.SDS_Busca.CommandText:=MySql;
            DMGraficos.CDS_Busca.Open;

            While Not DMGraficos.CDS_Busca.Eof do
            Begin
              DMGraficos.CDS_V_Grafico.Edit;

              // Atualiza Valor Total de Venda =================================
              If DMGraficos.CDS_Busca.FieldByName('Cod_Objetivo').AsInteger=7 Then
              Begin
                DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat:=DMGraficos.CDS_Busca.FieldByName('Objetivo_Hoje').AsFloat;
                DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=0;
                If (DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat<>0) and (DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat<>0) Then
                Begin
                  c:=(((DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat*100)/DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat)-100);
                  DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=Round_5(c,2);
                End;
              End; // If DMGraficos.CDS_Busca.FieldByName('Cod_Objetivo').AsInteger=7 Then

              // Atualiza Valor Total de Venda Salao ===========================
              If DMGraficos.CDS_Busca.FieldByName('Cod_Objetivo').AsInteger=5 Then
              Begin
                DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsFloat:=DMGraficos.CDS_Busca.FieldByName('Objetivo_Hoje').AsFloat;
                DMGraficos.CDS_V_GraficoPER_SALAO.AsFloat:=0;
                If (DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsFloat<>0) and (DMGraficos.CDS_V_GraficoVLR_SALAO.AsFloat<>0) Then
                Begin
                  c:=(((DMGraficos.CDS_V_GraficoVLR_SALAO.AsFloat*100)/DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsFloat)-100);
                  DMGraficos.CDS_V_GraficoPER_SALAO.AsFloat:=Round_5(c,2);
                End;
              End; // If DMGraficos.CDS_Busca.FieldByName('Cod_Objetivo').AsInteger=5 Then

              DMGraficos.CDS_V_GraficoCONECTADO.AsString:='S';
              DMGraficos.CDS_V_Grafico.Post;

              DMGraficos.CDS_Busca.Next;
            End; // While Not DMGraficos.CDS_Busca.Eof do
            DMGraficos.CDS_Busca.Close;
          End; // If DMGraficos.CDS_V_GraficoCONECTADO.AsString='N' Then

          DMGraficos.CDS_V_Grafico.Edit;

          // Atualiza Valor Total de Venda =====================================
          DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=0;
          DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat:=IBQ_Filial.FieldByName('VLR_TOTAL').AsFloat;

          If (DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat<>0) and (DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat<>0) Then
          Begin
            c:=(((DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat*100)/DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat)-100);
            DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=Round_5(c,2);
          End;

          // Atualiza Valor Total do Salão =====================================
          DMGraficos.CDS_V_GraficoPER_SALAO.AsFloat:=0;
          DMGraficos.CDS_V_GraficoVLR_SALAO.AsFloat:=IBQ_Filial.FieldByName('VLR_SALAO').AsFloat;

          If (DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsFloat<>0) and (DMGraficos.CDS_V_GraficoVLR_SALAO.AsFloat<>0) Then
          Begin
            c:=(((DMGraficos.CDS_V_GraficoVLR_SALAO.AsFloat*100)/DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsFloat)-100);
            DMGraficos.CDS_V_GraficoPER_SALAO.AsFloat:=Round_5(c,2);
          End;

          DMGraficos.CDS_V_Grafico.Post;
          IBQ_Filial.Close;

          // Commita Transação =================================================
          b:=False;
          While Not b do
          Begin
            b:=IBTransacao('C', IBT);
          End; // While Not b do

        Except
          On e : Exception do
          Begin
            bConectou:=False;

            // Rollback Transacao ==============================================
            b:=False;
            While Not b do
            Begin
              b:=IBTransacao('R', IBT);
            End; // While Not b do
          End;
        End; // Try

        // Fecha Conexão =======================================================
        FreeAndNil(IBQ_Filial);
        ConexaoEmpIndividual(IBDB, IBT, 'F');
      End; // If ConexaoEmpIndividual(IBDB, IBT, 'A') Then

      // Atualiza Grupo de Resultados Totais ===================================
      If Not bConectou Then
      Begin
        If (mgLojas<>nil) And (sgParametro='Comercial') Then
         mgLojas.Lines.Add(sCodLoja);

        DMGraficos.CDS_V_Grafico.Edit;
        DMGraficos.CDS_V_GraficoVLR_TOTAL.AsCurrency:=0.00;
        DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsCurrency:=0.00;
        DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsCurrency:=0.00;
        DMGraficos.CDS_V_GraficoVLR_SALAO.AsCurrency:=0.00;
        DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsCurrency:=0.00;
        DMGraficos.CDS_V_GraficoPER_SALAO.AsCurrency:=0.00;
        DMGraficos.CDS_V_GraficoCONECTADO.AsString:='N';
        DMGraficos.CDS_V_Grafico.Post;
      End;

      AtualizaGrupos;

      // Monta e Apresenta Gráfico =============================================
      MontaGrafico;

      DMGraficos.CDS_V_Grafico.RecNo:=iRecNo;
    End; // If StrToIntDef(sCodLoja,0)<>0 Then // Não Processa Grupos

    DbGrafico.Refresh;
    DMGraficos.CDS_V_Grafico.Next;
  End; // While Not DMGraficos.CDS_V_Grafico.Eof do

  Caption:='Demonstrativo Grafico';

  // Atualiza Último Processamento =============================================
  s:=sgTitulo;

  If sgParametro='Comercial' Then
   s:=s+' (Processamento Até o Dia '+sgDtaFim+')'
  Else
   s:=s+' (Último Processamento em '+DateTimeToStr(DataHoraServidorFI(DMGraficos.SDS_DtaHoraServidor))+')';
  DbGrafico.Title.Text.Clear;
  DbGrafico.Title.Text.Add(s);

  // Pausa Para Reprocessamento ================================================
  If sgParametro='' Then
  Begin
    If (sgTempoPausa<>'') and (Length(sgTempoPausa)=8) and (sgTempoPausa<>'00:00:00') and (bgSiga) Then
    Begin
      Pan_Relogio.Visible:=True;
      tHrPausaInicio:=now;
      tHrPausaFim:=tHrPausaInicio+StrToTime(sgTempoPausa);
      Refresh;
      While tHrPausaInicio<tHrPausaFim do
      Begin
        Application.ProcessMessages;

        If Not bgSiga Then
        Begin
          msg('Sistema Parado Pelo Usuário !!','A');
          Break;
        End;

        tHrPausaInicio:=now;
        Lab_RelReprocessa.Caption:=TimeToStr(tHrPausaInicio-tHrPausaFim);
        Refresh;
      End; // While tHrPausaInicio<tHrPausaFim do
      Pan_Relogio.Visible:=False;
    End; // If igTempoPausa<>0 Then
  End; // If sgParametro='' Then

  Refresh;

End; // Busca Vendas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Gera Grafico de Objetivos ( TipoGraf=(B)arras (L)inha (P)izza ) >>>>>>>>>>>>>
Procedure TFrmGrafico.Grafico(CDS: TClientDataSet; TipoGraf, Titulo: String);
Var
  i: Integer;
  cPerMetaAceita: Currency;
  s : String;
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

  // Valores Eixo Veritical ----------------------------------------------------
  DbGrafico.LeftAxis.Visible:=False;

  // Linhas Laterais, Chão e Fundo ---------------------------------------------
  DbGrafico.LeftAxis.Grid.Visible:=True;
  DbGrafico.BottomAxis.Grid.Visible:=True;

  // 3D ------------------------------------------------------------------------
  DbGrafico.View3D:=False;
  If Ckb_Grafico3D.Checked Then
  Begin
    DbGrafico.View3D:=True;
    DbGrafico.View3DOptions.Orthogonal:=True;
    DbGrafico.Chart3DPercent:=Sb_Grafico3D.Position;
  End;
  Sb_Grafico3D.Enabled:=Ckb_Grafico3D.Checked;

  // Descricao Item da Parte de Baixo ------------------------------------------
  DbGrafico.BottomAxis.Labels:=True;	// Apresenta Label
	DbGrafico.BottomAxis.LabelsAngle:=90; // 1-Horizontal 90-Vertical

  // Cria Serie (Barras) =======================================================
  If TipoGraf='B' Then
  Begin
    gsBarra.ParentChart:=DbGrafico;
    gsBarra.Clear;
    gsBarra.Marks.Style:=smsValue;
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
    gsLinha.Marks.Style:=smsValue;
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
    gsPizza.Marks.Style:=smsLabel;
    gsPizza.Marks.Arrow.Color:=clBlack;
    gsPizza.Marks.Arrow.Width:=3;
    gsPizza.Marks.Visible:=True;
    // gsPizza.ColorEachPoint:=True;
    gsPizza.Circled:=False;

    // Sb_GraficoRotacao.Position:=DbGrafico.View3DOptions.Elevation;
  End;

  // Titulo --------------------------------------------------------------------
  s:=DbGrafico.Title.Text.GetText;
  If (s='') Or (s=#$D#$A) Then
  Begin
    DbGrafico.Title.Text.Clear;
    DbGrafico.Title.Text.Add(Titulo);
  End;

  // Acerta Meta Aceitável =====================================================
  cPerMetaAceita:=StrToCurr(sgPerLimite);
  cPerMetaAceita:=cPerMetaAceita-100;

  // Monta o Grafico ===========================================================
  CDS.First;
  While Not CDS.Eof do
  Begin
    // VERMELHO - Meta Abaixo do Limite Aceitável ==============================
    If CDS.FieldByName('PER_ALCANCADO').AsCurrency<0 Then
    Begin
      Cor:=clRed;
    End;

    // AZUL FORTE - Meta no Limite Aceitável ===================================
    If (CDS.FieldByName('PER_ALCANCADO').AsCurrency<0) and (CDS.FieldByName('PER_ALCANCADO').AsCurrency>=cPerMetaAceita) Then
    Begin
      Cor:=$00CACAFF;
    End;

    // AZUL - Meta Alcançada ===================================================
    If CDS.FieldByName('PER_ALCANCADO').AsCurrency=0Then
    Begin
      Cor:=$00FFFF80;
    End;

    // VERDE - Acima da Meta Alcançada =========================================
    If CDS.FieldByName('PER_ALCANCADO').AsCurrency>0 Then
    Begin
      Cor:=$0080FF80;
    End;

    // PRETA - Conexão nâo Realizada ===========================================
    If (CDS.FieldByName('PER_ALCANCADO').AsCurrency=0) And (CDS.FieldByName('VLR_TOTAL').AsCurrency=0) Then
    Begin
      Cor:=clBlack;
    End;

    If TipoGraf='B' Then
     gsBarra.Add(CDS.FieldByName('PER_ALCANCADO').AsCurrency, CDS.FieldByName('COD_LOJA').AsString, Cor);

    // Grava Series (Linha) -------------------------------------
    If TipoGraf='L' Then
     gsLinha.Add(CDS.FieldByName('PER_ALCANCADO').AsCurrency, CDS.FieldByName('COD_LOJA').AsString, Cor);

    // Grava Series (Pizza) -------------------------------------
    If TipoGraf='P' Then
     gsPizza.Add(CDS.FieldByName('PER_ALCANCADO').AsCurrency, CDS.FieldByName('COD_LOJA').AsString, Cor);

    CDS.Next;
  End; // While Not CDS.Eof do

End; // Gera Grafico ( TipoGraf=(B)arras (L)inha (P)izza ) >>>>>>>>>>>>>>>>>>>>>

// Apresenta Grafico >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGrafico.MontaGrafico;
Var
  sTipoGrafico: String;
Begin
  FechaSeriesGraficos;

  // Cria Serie do Grafico ===================================================
  If Rb_GraficoTpBarras.Checked Then
  Begin
    gsBarra:=TBarSeries.Create(Self);
    sTipoGrafico:='B';
  End;

  If Rb_GraficoTpLinha.Checked Then
  Begin
    gsLinha:=TLineSeries.Create(Self);
    sTipoGrafico:='L';
  End;

  If Rb_GraficoTpPizza.Checked Then
  Begin
    gsPizza:=TPieSeries.Create(Self);
    sTipoGrafico:='P';
  End;

  // Apresenta o Grafico ----------------------------------------
  If sgTitulo='' Then
  Begin
    sgTitulo:='(%) Metas Vendas Mês de '+sgNomeMes+' de '+VarToStr(wgAnoH);
  End;

  Grafico(DMGraficos.CDS_V_Grafico, sTipoGrafico, sgTitulo);
End; // Apresenta Grafico >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Objetivos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmGrafico.BuscaObjetivos: Boolean;
Var
  tsArquivo: TStringList;
  s: String;
  MySql: String;
  i: Integer;
  c: Currency;
Begin
  Result:=False;

  If Not (FileExists(IncludeTrailingPathDelimiter(sgPath_Local)+'ObjetivoGrafico.ini')) Then
  Begin
    msg('Arquivo de Configuração Não Existe'+cr+cr+'Favor Criá-lo !!','A');
    Exit;
  End;

  tsArquivo:= TStringList.Create;
  Try
    { Carrega o conteúdo do arquivo texto para a   memória }
    tsArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sgPath_Local)+'ObjetivoGrafico.ini');

    { Realiza um loop em toda a lista }
    s:='';
    sgCodObjetivo:=''; // Linha(0)
    sgTempoPausa:=''; // Linha(1)
    sgPerLimite  :=''; // Linha(2)
    sgR1:=''; // Linha(3)
    sgR2:=''; // Linha(4)
    sgR3:=''; // Linha(5)
    sgRE:=''; // Linha(6)
    For i := 0 to tsArquivo.Count - 1 do
    Begin
      s:=tsArquivo[i];

      If Trim(s)<>'' Then
      Begin
        If i=0 Then sgCodObjetivo:=Trim(s);
        If i=1 Then sgTempoPausa :=Trim(s);
        If i=2 Then sgPerLimite  :=Trim(s);
        If i=3 Then sgR1:=Trim(s);
        If i=4 Then sgR2:=Trim(s);
        If i=5 Then sgR3:=Trim(s);
        If i=6 Then sgRE:=Trim(s);
      End;
    End; // For i := 0 to tsArquivo.Count - 1 do

  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsArquivo);
  End; // Try
  tsArquivo.Free;

  If Trim(sgCodObjetivo)='' Then
  Begin
    msg('Arquivo de Configuração Não Existe'+cr+cr+'Favor Criá-lo !!','A');
    Exit;
  End;

  If (Trim(sgPerLimite)='') or (Trim(sgPerLimite)='0') Then
   sgPerLimite:='99';

  // Busca Objetivo ============================================================
  MySql:=' SELECT ''Bel_''||em.cod_filial Cod_loja, ob.cod_objetivo, ob.des_objetivo,'+
         ' COALESCE(om.obj_mes'+FormatFloat('00',wgMesH)+',0) Objetivo,'+

         ' ROUND((COALESCE(om.obj_mes'+FormatFloat('00',wgMesH)+',0)/'+
                                  IntToStr(igNumDiasUteis)+'),2) Objetivo_Dia,'+

         ' ROUND(((ROUND((COALESCE(om.obj_mes'+FormatFloat('00',wgMesH)+',0)/'+
                                  IntToStr(igNumDiasUteis)+'),2))*'+
                                  IntToStr(igNumDiasUteisHoje)+'),2) Objetivo_Hoje'+

         ' FROM EMP_CONEXOES em'+
         '     LEFT JOIN FIN_OBJETIVOS_METAS om  ON om.cod_filial=em.cod_filial'+
         '                                      AND om.cod_objetivo in ('+sgCodObjetivo+', 5)'+
         '                                      AND om.des_ano='+VarToStr(wgAnoH)+
         '     LEFT JOIN FIN_OBJETIVOS       ob  ON ob.cod_objetivo=om.cod_objetivo'+

         ' WHERE ((em.ind_ativo=''SIM'') or (em.tip_emp=''M''))'+
         ' AND   em.cod_filial not in(''98'')'+
         ' ORDER BY 1,2';
  DMGraficos.CDS_Busca.Close;
  DMGraficos.SDS_Busca.CommandText:=MySql;
  DMGraficos.CDS_Busca.Open;

  If Not DMGraficos.CDS_V_Grafico.Active Then
  Begin
    DMGraficos.CDS_V_Grafico.CreateDataSet;
  End;
  DMGraficos.CDS_V_Grafico.IndexFieldNames:='COD_LOJA';
  DMGraficos.CDS_V_Grafico.Open;

  While Not DMGraficos.CDS_Busca.Eof do
  Begin
    If Not DMGraficos.CDS_V_Grafico.Locate('COD_LOJA',DMGraficos.CDS_Busca.FieldByName('Cod_Loja').AsString,[]) Then
     Begin
       DMGraficos.CDS_V_Grafico.Insert;
       DMGraficos.CDS_V_GraficoCOD_LOJA.AsString:=DMGraficos.CDS_Busca.FieldByName('Cod_Loja').AsString;

       DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat:=0;
       DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat:=0;
       DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=0;

       DMGraficos.CDS_V_GraficoVLR_SALAO.AsFloat:=0;
       DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsFloat:=0;
       DMGraficos.CDS_V_GraficoPER_SALAO.AsFloat:=0;
       DMGraficos.CDS_V_GraficoCONECTADO.AsString:='S';
     End
    Else
     Begin
       DMGraficos.CDS_V_Grafico.Edit;
     End;

    // Atualiza Valor Total de Venda ===========================================
    If DMGraficos.CDS_Busca.FieldByName('Cod_Objetivo').AsInteger=7 Then
    Begin
      DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat:=DMGraficos.CDS_Busca.FieldByName('Objetivo_Hoje').AsFloat;

      If (DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat<>0) and (DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat<>0) Then
      Begin
        c:=(((DMGraficos.CDS_V_GraficoVLR_TOTAL.AsFloat*100)/DMGraficos.CDS_V_GraficoVLR_OBJETIVO.AsFloat)-100);
        DMGraficos.CDS_V_GraficoPER_ALCANCADO.AsFloat:=Round_5(c,2);
      End;
    End; // If DMGraficos.CDS_Busca.FieldByName('Cod_Objetivo').AsInteger=7 Then

    // Atualiza Valor Total de Venda Salao =====================================
    If DMGraficos.CDS_Busca.FieldByName('Cod_Objetivo').AsInteger=5 Then
    Begin
      DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsFloat:=DMGraficos.CDS_Busca.FieldByName('Objetivo_Hoje').AsFloat;

      If (DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsFloat<>0) and (DMGraficos.CDS_V_GraficoVLR_SALAO.AsFloat<>0) Then
      Begin
        c:=(((DMGraficos.CDS_V_GraficoVLR_SALAO.AsFloat*100)/DMGraficos.CDS_V_GraficoVLR_SALAO_OBJETIVO.AsFloat)-100);
       DMGraficos.CDS_V_GraficoPER_SALAO.AsFloat:=Round_5(c,2);
      End;
    End; // If DMGraficos.CDS_Busca.FieldByName('Cod_Objetivo').AsInteger=5 Then

    DMGraficos.CDS_V_Grafico.Post;

    DMGraficos.CDS_Busca.Next;
  End; // While Not DMGraficos.CDS_Busca.Eof do
  DMGraficos.CDS_Busca.Close;

  // Atualiza Grupo de Resultados Totais =======================================
  AtualizaGrupos;

  Result:=True;

End; // Busca Objetivos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Fecha Series de Graficos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGrafico.FechaSeriesGraficos;
Var
  ii, i: Integer;
Begin
  Try
    FreeAndNil(gsBarra);
  Except
  End;

  Try
    FreeAndNil(gsLinha);
  Except
  End;

  Try
    FreeAndNil(gsPizza);
  Except
  End;
End; // Fecha Series de Graficos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Processa Venda das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmGrafico.ProcessaVendasLojas;
Var
  MySql: String;
  sDta, sPrimDiaMes, sUltDiaMes : String;
  i: Integer;
begin
  While bgSiga do
  Begin
    Screen.Cursor:=crAppStart;

    Refresh;

    // Verifica Lojas a Processar Se sgParametro='Comercial' ===================
    If (sgParametro='Comercial') Then
    Begin
      // Memo de Lojas Não processadas ------------------------------
      If (mgLojas=nil) Then
      Begin
        mgLojas:=TMemo.Create(Self);
        mgLojas.Visible:=False;
        mgLojas.Parent:=FrmGrafico;
        mgLojas.Width:=500;
      End; // If (mgLojas=nil) Then
      mgLojas.Lines.Clear;
    End; // If (sgParametro='Comercial') Then

    If Not bgSiga Then
    Begin
      msg('Sistema Parado Pelo Usuário !!','A');
      Break;
    End;

    // Atualiza Periodo (MES Corrente) =========================================
    sgDtaFim:=DateToStr(DataHoraServidorFI(DMGraficos.SDS_DtaHoraServidor));
    sgDtaInicio:=DateToStr(PrimUltDia(StrToDate(sgDtaFim),'P'));

    // Acerta Ultimo dia Calculo Comercial =====================================
    If sgParametro='Comercial' Then
    Begin
      sDta:=DateToStr(DataHoraServidorFI(DMGraficos.SDS_DtaHoraServidor)-1);

      While DiaSemanaAbrev(StrToDateTime(sDta))='Dom' do
        sDta:=DateToStr(StrToDate(sDta)-1);

      sgDtaFim:=sDta;
    End;

    DecodeDate(StrToDate(sgDtaFim), wgAnoH, wgMesH, wgDiaH);
    i:=wgMesH;
    sgNomeMes:=LongMonthNames[i];

    // Verifica Dias Uteis =====================================================
    sgPeriodo:='PERÍODO DE '+sgDtaInicio+' A '+sgDtaFim;
    igNumDiasUteis:=0;
    igNumDiasUteisHoje:=0;

    If sgParametro='Comercial' Then sPrimDiaMes:=DateToStr(PrimUltDia(StrToDate(sgDtaInicio),'P'));
    If sgParametro='' Then sPrimDiaMes:=sgDtaInicio;

    sUltDiaMes:=DateToStr(PrimUltDia(StrToDate(sgDtaFim),'U'));
    While StrToDate(sPrimDiaMes)<=StrToDate(sUltDiaMes) do
    Begin
      sgDiaSemanaMes:='1';
      If (DiaSemanaAbrev(StrToDateTime(sPrimDiaMes))='Dom') Then
       Begin
         sgDiaSemanaMes:='0';
       End
      Else // If (DiaSemanaAbrev(StrToDateTime(sPrimDiaMes))='Dom') Then
       Begin
         MySql:=' Select f.Dta_Feriado'+
                ' From FIN_FERIADOS_ANO f'+
                ' Where f.Ind_Ativo=''SIM'''+
                ' And f.Dta_Feriado='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sPrimDiaMes)));
         DMGraficos.CDS_BuscaRapida.Close;
         DMGraficos.SDS_BuscaRapida.CommandText:=MySql;
         DMGraficos.CDS_BuscaRapida.Open;

         If Trim(DMGraficos.CDS_BuscaRapida.FieldByName('Dta_Feriado').AsString)<>'' Then
          sgDiaSemanaMes:='0';

         DMGraficos.CDS_BuscaRapida.Close;
       End; // If (DiaSemanaAbrev(StrToDateTime(sPrimDiaMes))='Dom') Then

      If sgDiaSemanaMes<>'0' Then
      Begin
        Inc(igNumDiasUteis);
      End; // If sDiaSemana<>'0' Then

      If (StrToDate(sPrimDiaMes)<=StrToDate(sgDtaFim)) And (sgDiaSemanaMes<>'0') Then
      Begin
        Inc(igNumDiasUteisHoje);
      End; // If StrToDate(sPrimDiaMes)<=StrToDate(sgDtaFim) do

      sPrimDiaMes:=DateToStr(StrToDate(sPrimDiaMes)+1);
    End; // While StrToDate(sgDtaInicio)<=StrToDate(sgDtaFim) do

    // Busca Objetivo ==========================================================
    If Not BuscaObjetivos Then
    Begin
      msg('Sem Objetivo a Ser Calculado !!','A');
      Bt_IniciarClick(Self);
      Break;
      Exit;
    End;

    // Busca Vendas ============================================================
    BuscaVendas;

    Screen.Cursor:=crDefault;
    Refresh;

    If (sgParametro='Comercial') Then
    Begin
      If mgLojas.Lines.Count<1 Then
      Begin
        Timer1.Enabled:=True;
        Break;
      End;
    End; // If (sgParametro='Comercial') Then
  End; // While bgSiga do
  Screen.Cursor:=crDefault;
End; // Processa Venda das Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmGrafico.FormCreate(Sender: TObject);
begin
  sgParametro:=Trim(ParamStr(1));

  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

procedure TFrmGrafico.FormShow(Sender: TObject);
Begin
  FrmGrafico.WindowState:=wsMaximized;
  FrmGrafico.Align:=alClient;

  bgSair:=False;
  dDtaHoje:=StrToDate(DateToStr(DataHoraServidorFI(DMGraficos.SDS_DtaHoraServidor)));

  If sgParametro='Comercial' Then
  Begin
    Sb_Grafico3D.Position:=8;

    Bt_Iniciar.Visible:=False;
    Bt_Para.Visible:=False;
    Bt_Configuracoes.Caption:='Sair';
    PanGrafico.Enabled:=True;
  End;

  Timer1.Enabled:=False;
  ProcessaVendasLojas;
end;

procedure TFrmGrafico.Bt_IniciarClick(Sender: TObject);
begin
  If sgParametro='' Then
  Begin
    If Bt_Iniciar.Visible Then
     Begin
       Bt_Para.Visible:=True;
       Bt_Iniciar.Visible:=False;
       PanGrafico.Enabled:=False;
       Pan_Relogio.Visible:=False;

       bgSiga:=True;
       bgSair:=False;

       // Processamento Vendas da Lojas
       ProcessaVendasLojas;
     End // If Bt_Iniciar.Visible Then
    Else
     Begin
       Pan_Legenda.Visible:=False;
       Bt_Iniciar.Visible:=True;

       Bt_Para.Visible:=False;
       PanGrafico.Enabled:=True;
       Pan_Legenda.Visible:=True;

       Pan_Relogio.Visible:=False;

       bgSair:=True;
       bgSiga:=False;
     End; // If Bt_Iniciar.Visible Then
  End; // If sgParametro='' Then
end;

procedure TFrmGrafico.FormResize(Sender: TObject);
begin
  Pan_Principal.Align:=alClient;
end;

procedure TFrmGrafico.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  If sgParametro='' Then
  Begin
    If bgSair Then
     Begin
       Action := caFree;

       FechaSeriesGraficos;
       DMGraficos.FechaTudoGraficos;
     End
    Else
     Begin
       PlaySound(PChar('SystemHand'), 0, SND_ASYNC);
       msg('Para Fechar 1º Tecle em Parar...','A');
       Action := caNone;
     End;
  End; // If sgParametro='' Then
end;

procedure TFrmGrafico.Rb_GraficoTpBarrasClick(Sender: TObject);
begin

  If DbGrafico.SeriesList.Count<1 Then
   Exit;

  AcertaRb_Style(Rb_GraficoTpBarras);
  AcertaRb_Style(Rb_GraficoTpLinha);
  AcertaRb_Style(Rb_GraficoTpPizza);

  MontaGrafico;
end;

procedure TFrmGrafico.Rb_GraficoTpBarrasKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Rb_GraficoTpBarrasClick(Self);
end;

procedure TFrmGrafico.Ckb_Grafico3DClick(Sender: TObject);
begin
  If DbGrafico.SeriesList.Count<1 Then
   Exit;

  AcertaCkb_Style(Ckb_Grafico3D);

  If Ckb_Grafico3D.Checked Then
   Begin
     Sb_Grafico3D.Enabled:=True;
   End
  Else
   Begin
     Sb_Grafico3D.Enabled:=False;
   End;

  DbGrafico.View3D:=Ckb_Grafico3D.Checked;

  // Verifica de nao de pizza ==================================================
  If Not Rb_GraficoTpPizza.Checked Then
   DbGrafico.View3DOptions.Orthogonal:=True;

end;

procedure TFrmGrafico.Ckb_Grafico3DKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Ckb_Grafico3DClick(Self);

end;

procedure TFrmGrafico.Sb_Grafico3DChange(Sender: TObject);
begin
  If DbGrafico.SeriesList.Count<1 Then
   Exit;

  DbGrafico.Chart3DPercent:=Sb_Grafico3D.Position;
end;

procedure TFrmGrafico.Bt_ConfiguracoesClick(Sender: TObject);
Var
  tsArquivo: TStringList;
  s, MySql: String;
  b: Boolean;
  i: Integer;

  sCodObjetivo, sHoraPausa, sPerLimite: string;
begin

  If sgParametro='Comercial' Then
  Begin
    Application.Terminate;
    exit;
  End;

  // If sgParametro='' Then ====================================================
  bgExiste:=True;
  If Not (FileExists(IncludeTrailingPathDelimiter(sgPath_Local)+'ObjetivoGrafico.ini')) Then
  Begin
    bgExiste:=False;
    Try
      tsArquivo:= TStringList.Create;
      tsArquivo.SaveToFile(IncludeTrailingPathDelimiter(sgPath_Local)+'ObjetivoGrafico.ini');
    Finally // Try
      { Libera a instancia da lista da memória }
      FreeAndNil(tsArquivo);
    End; // Try
    tsArquivo.Free;
  End; // If Not (FileExists(IncludeTrailingPathDelimiter(sgPath_Local)+'ObjetivoGrafico.ini')) Then

  tsArquivo:= TStringList.Create;
  Try
    { Carrega o conteúdo do arquivo texto para a   memória }
    tsArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sgPath_Local)+'ObjetivoGrafico.ini');

    { Realiza um loop em toda a lista }
    s:='';
    sCodObjetivo:=''; // Linha(0)
    sHoraPausa  :=''; // Linha(1)
    sPerLimite  :=''; // Linha(2)
    sgR1:=''; // Linha(3)
    sgR2:=''; // Linha(4)
    sgR3:=''; // Linha(5)
    sgRE:=''; // Linha(6)
    For i := 0 to tsArquivo.Count - 1 do
    Begin
      s:=tsArquivo[i];

      If Trim(s)<>'' Then
      Begin
        If i=0 Then sCodObjetivo:=Trim(s);
        If i=1 Then sHoraPausa:=Trim(s);
        If i=2 Then sPerLimite:=Trim(s);
        If i=3 Then sgR1:=Trim(s);
        If i=4 Then sgR2:=Trim(s);
        If i=5 Then sgR3:=Trim(s);
        If i=6 Then sgRE:=Trim(s);
      End;
    End; // For i := 0 to tsArquivo.Count - 1 do

  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsArquivo);
  End; // Try
  tsArquivo.Free;

  // Solicita Configuração =====================================================
  sCodObjetivo:=InputBoxInteiro('OBJETIVO', 'Código do Objetivo', sCodObjetivo);

  If Trim(sCodObjetivo)='' Then
   Exit;

  b:=True;
  While b do
  Begin
    sHoraPausa:=InputBoxHora('PAUSA', 'Tempo de Pausa ', sHoraPausa);

    If Trim(sHoraPausa)='' Then
     Begin
       msg('Tempo de Pasua Inválido !!','A');
     End
    Else
     Begin
       b:=False;
     End
  End; // While b do

  b:=True;
  While b do
  Begin
    sPerLimite:=InputBoxInteiro('METAS', 'Limite Mínimo Aceitável do Percentual das Metas', sPerLimite);

    If (Trim(sPerLimite)='') or (Trim(sPerLimite)='0') Then
     sPerLimite:='100';

    If (StrToInt(sPerLimite)>100) Or (StrToInt(sPerLimite)<1)Then
     Begin
       msg('Percentual Inválido !!','A');
     End
    Else
     Begin
       b:=False;
     End
  End; // While b do

  sgR1:=InputBox('GRUPO R1: Resultado Total Lojas', 'Código das Lojas', sgR1);
  sgR2:=InputBox('GRUPO R2: Resultado Total Lojas', 'Código das Lojas', sgR2);
  sgR3:=InputBox('GRUPO R3: Resultado Salão Lojas', 'Código das Lojas que NÃO PARTICIPAM', sgR3);
  sgRE:=InputBox('GRUPO RE: Resultado EMPRESA', 'Código das Lojas que NÃO PARTICIPAM', sgRE);

  // Grava Configuração
  tsArquivo:= TStringList.Create;
  Try
    { Carrega o conteúdo do arquivo texto para a   memória }
    tsArquivo.LoadFromFile(IncludeTrailingPathDelimiter(sgPath_Local)+'ObjetivoGrafico.ini');

    For i:=0 to tsArquivo.Count - 1 do
     tsArquivo.Delete(0);

    tsArquivo.Add(sCodObjetivo);
    tsArquivo.Add(sHoraPausa);
    tsArquivo.Add(sPerLimite);
    tsArquivo.Add(sgR1);
    tsArquivo.Add(sgR2);
    tsArquivo.Add(sgR3);
    tsArquivo.Add(sgRE);

    tsArquivo.SaveToFile(IncludeTrailingPathDelimiter(sgPath_Local)+'ObjetivoGrafico.ini');
  Finally // Try
    { Libera a instancia da lista da memória }
    FreeAndNil(tsArquivo);
  End; // Try
  tsArquivo.Free;
  // If sgParametro='' Then ====================================================

end;

procedure TFrmGrafico.Timer1Timer(Sender: TObject);
begin
  If sgParametro='Comercial' Then
  Begin
    If dDtaHoje<StrToDate(DateToStr(DataHoraServidorFI(DMGraficos.SDS_DtaHoraServidor))) Then
     FormShow(Self);
  End;
end;

end.

