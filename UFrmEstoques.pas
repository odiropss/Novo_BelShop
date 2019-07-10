unit UFrmEstoques;
//OdirRetornar

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
  DateUtils,
  JvXPCheckCtrls,
  AppEvnts;

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
    Panel66: TPanel;
    Bt_EstoquesFechar: TJvXPButton;
    Dbg_Estoques: TDBGrid;
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
    Bt_EstoquesSaldos: TJvXPButton;
    CkB_EstoquesCurvaA: TJvXPCheckbox;
    CkB_EstoquesCurvaB: TJvXPCheckbox;
    CkB_EstoquesCurvaC: TJvXPCheckbox;
    CkB_EstoquesCurvaD: TJvXPCheckbox;
    CkB_EstoquesCurvaE: TJvXPCheckbox;
    Bt_Odir: TJvTransparentButton;
    Bt_EstoquesFiltroComprador: TJvXPButton;
    Panel1: TPanel;
    Ts_NivelAtendimento: TTabSheet;
    Panel2: TPanel;
    Bt_NivelAtendFechar: TJvXPButton;
    Gb_NivelAtendCurva: TGroupBox;
    Gb_NivelAtendLojas: TGroupBox;
    Panel3: TPanel;
    Bt_NivelAtendSalvaClipboardCurvas: TJvXPButton;
    Panel4: TPanel;
    Bt_NivelAtendSalvaClipboardLojas: TJvXPButton;
    Dbg_NivelAtendCurva: TDBGrid;
    Dbg_NivelAtendLojas: TDBGrid;
    Bt_NivelAtendBusca: TJvXPButton;
    ApplicationEvents1: TApplicationEvents;
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

    // Odir Retirou - 19/12/2017 - Parametros Somente para Atualização de Estoque Mínimo
    // Procedure Recalculo_V_Estoques_Aggregates;

    Procedure AtualizaEstoques;
    Procedure SetaCurvas;

    Procedure NivelAtendimentoCalcula(sLjSelect, sLjNaoSelect: String; iLjSelect, iLjNaoSelect: Integer);

    // Odir ====================================================================

    procedure Dbg_EstoquesEnter(Sender: TObject);
    procedure Dbg_EstoquesExit(Sender: TObject);
    procedure Dbg_EstoquesKeyPress(Sender: TObject; var Key: Char);
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
    procedure Bt_EstoquesSaldosClick(Sender: TObject);
    procedure CkB_EstoquesCurvaAClick(Sender: TObject);
    procedure Bt_NivelAtendSalvaClipboardCurvasClick(Sender: TObject);
    procedure Bt_NivelAtendBuscaClick(Sender: TObject);
    procedure Dbg_NivelAtendCurvaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_NivelAtendCurvaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_NivelAtendCurvaCellClick(Column: TColumn);
    procedure Dbg_NivelAtendLojasCellClick(Column: TColumn);
    procedure Dbg_NivelAtendLojasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure Dbg_NivelAtendCurvaEnter(Sender: TObject);
    procedure Dbg_NivelAtendLojasEnter(Sender: TObject);
    procedure Ts_EstoquesFiltrosExit(Sender: TObject);

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

  sgFiltros,
  sgFiltroComp, // Compradores
  sgFiltroCurvas: String;

  // Guarda Valores Digitados no Parametros da Curva ABC
  igDiasEstA, igDiasEstB, igDiasEstC, igDiasEstD, igDiasEstE,
  igEstMinA, igEstMinB, igEstMinC, igEstMinD, igEstMinE: Integer;

implementation

uses DK_Procs1, UDMVirtual, UFrmBelShop, UFrmSelectEmpProcessamento,
     UFrmSolicitacoes, SysConst, UDMBelShop,
  VarUtils,
  UFrmPeriodoApropriacao;

{$R *.dfm}

//==============================================================================
// Odir - INICIO ===============================================================
//==============================================================================

// Calcula Nivel de Atendimento da Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmEstoques.NivelAtendimentoCalcula(sLjSelect, sLjNaoSelect: String; iLjSelect, iLjNaoSelect: Integer);
Var
  MySql,
  sPercTotal: String;

  hHrInicio, hHrFim: String;
Begin
{
(100 - ((SOMA DE ITENS COM SALDO<1))*(100.000 / TOTAL DE ITENS)) * ((PERCENTUAL DA CURVA DO ITEM) / 100.000)

EXMPLOS
CURVA A - 50 %
(100 - ((2500))*(100.000 / 15000)) * ((50) / 100.000) = 42,50 %

CURVA B - 30 %
(100 - ((6000))*(100.000 / 15000)) * ((30) / 100.000) = 32 %

CURVA C - 4 %
(100 - ((8500))*(100.000 / 15000)) * ((4) / 100.000) = 1,96 %

CURVA D - 1 %
(100 - ((5500))*(100.000 / 15000)) * ((1) / 100.000) = 0,67 %

MEDIA TOTAL: 42,50 + 32 + 1,96 + 0,67 = 77,13
}

  OdirPanApres.Caption:='AGUARDE !! Fase 1/3 - Calculando Níveis de Atendimentos...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmEstoques.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmEstoques.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmEstoques;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  OdirPanApres.Refresh;
  Refresh;

  Screen.Cursor:=crAppStart;

  hHrInicio:='';
  hHrFim:='';
  hHrInicio:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

  // Percentual Média Total do Nivel de Atendimento das Lojas ==================
  MySql:=' Select'+
         ' ROUND((Cast(sum(Total.Nivel_Atendimento) as Numeric(12,2))/count(distinct Total.cod_loja_linx)),2) Media_Total'+

         ' from (select l.cod_loja_linx, l.ind_curva,'+
         '       CAST(((100 - ((SUM(case when l.qtd_estoque<1 Then 1 Else 0 End))*(100.000 / count(L.cod_loja_linx)))) *'+
         '       ((CAST(Case'+
         '                When l.ind_curva=''A'' Then'+
         '                   (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=1)'+ // Curva ABC
         '                When l.ind_curva=''B'' Then'+
         '                   (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=2)'+ // Curva ABC
         '                When l.ind_curva=''C'' Then'+
         '                   (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=3)'+ // Curva ABC
         '                When l.ind_curva=''D'' Then'+
         '                   (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=4)'+ // Curva ABC
         '                When l.ind_curva=''E'' Then'+
         '                   (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=5)'+ // Curva ABC
         '                Else'+
         '                   1'+
         '             End AS integer)) / 100.000)'+
         '       ) as Numeric(12,2)) Nivel_Atendimento'+

         '       From LINX_PRODUTOS_LOJAS l, LINXLOJAS j'+
         '       Where l.cod_loja_linx=j.empresa'+
         '       And   l.dta_processa between '+QuotedStr(sgDtaI)+' and '+QuotedStr(sgDtaF);

         If Not bgTodasEmpresas Then
         Begin
            If iLjNaoSelect>=iLjSelect Then
            Begin
              MySql:=
               MySql+'       And   l.cod_loja_linx IN ('+sLjSelect+')';
            End; // If iLjNaoSelect>iLjSelect Then

            If iLjNaoSelect<iLjSelect Then
            Begin
              MySql:=
               MySql+'       And   l.cod_loja_linx NOT IN ('+sLjNaoSelect+')';
            End; // If iLjNaoSelect>iLjSelect Then
         End; // If Not bgTodasEmpresas Then

  MySql:=
   MySql+ '       And   Not exists (Select 1'+
          '                         From LINXPRODUTOS pr'+
          '                         Where pr.cod_produto=l.cod_produto'+
          '                         And ( (pr.desativado=''S'')'+
          '                               OR (COALESCE(pr.id_setor,0) IN (17, 20, 25))'+ // Setor: 17-IMOBILIZADOS 20-MOVEIS SALÃO 25 - USO E CONSUMO
          '                               OR (COALESCE(pr.id_linha ,0) IN (33))'+ // Linha: 33 - Brindes
          '                               OR (COALESCE(pr.id_colecao ,0) = 197)'+ // Coleção: 197 - DESCONTINUADOS
          '                               OR (COALESCE(pr.id_colecao ,0) IN (294, 587))'+ // Coleção: 294 - BRINDE 587 - KIDS
          '                               OR (COALESCE(pr.cod_fornecedor,0) IN (6, 1014, 260)) ))'+ // Fornecedor Não

          '       Group By 1,2) Total';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Media_Total').AsString)='' Then
  Begin
    msg('Sem Loja a Listar no Período'+cr+cr+'de '+sgDtaI+' a '+sgDtaF+' !!','A');
    DMBelShop.CDS_BuscaRapida.Close;
    OdirPanApres.Visible:=False;
    Screen.Cursor:=crDefault;
    Exit;
  End;
  sPercTotal:=DMBelShop.CDS_BuscaRapida.FieldByName('Media_Total').AsString;
  DMBelShop.CDS_BuscaRapida.Close;

  OdirPanApres.Caption:='AGUARDE !! Fase 2/3 - Calculando Níveis de Atendimentos...';
  OdirPanApres.Refresh;
  Refresh;

  // Nivel de Atendimento por Lojas ============================================
  MySql:=' select total.nome_emp, Cast(sum(Total.Nivel_Atendimento) as Numeric(12,2)) Nivel_Atendimento, 0 Ordem'+

         ' from (select l.cod_loja_linx, j.nome_emp, l.ind_curva,'+
         '       CAST(((100 - ((SUM(case when l.qtd_estoque<1 Then 1 Else 0 End))*(100.000 / count(L.cod_loja_linx)))) *'+
         '       ((CAST(Case'+
         '                When l.ind_curva=''A'' Then'+
         '                   (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=1)'+ // Curva ABC
         '                When l.ind_curva=''B'' Then'+
         '                   (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=2)'+ // Curva ABC
         '                When l.ind_curva=''C'' Then'+
         '                   (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=3)'+ // Curva ABC
         '                When l.ind_curva=''D'' Then'+
         '                   (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=4)'+ // Curva ABC
         '                When l.ind_curva=''E'' Then'+
         '                   (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=5)'+ // Curva ABC
         '                Else'+
         '                   1'+
         '             End AS integer)) / 100.000)'+
         '       ) as Numeric(12,2)) Nivel_Atendimento'+

         '       From LINX_PRODUTOS_LOJAS l, LINXLOJAS j'+
         '       Where l.cod_loja_linx=j.empresa'+
         '       And   l.dta_processa between '+QuotedStr(sgDtaI)+' and '+QuotedStr(sgDtaF);

         If Not bgTodasEmpresas Then
         Begin
            If iLjNaoSelect>=iLjSelect Then
            Begin
              MySql:=
               MySql+'       And   l.cod_loja_linx IN ('+sLjSelect+')';
            End; // If iLjNaoSelect>iLjSelect Then

            If iLjNaoSelect<iLjSelect Then
            Begin
              MySql:=
               MySql+'       And   l.cod_loja_linx NOT IN ('+sLjNaoSelect+')';
            End; // If iLjNaoSelect>iLjSelect Then
         End; // If Not bgTodasEmpresas Then

  MySql:=
   MySql+ '       And   Not exists (Select 1'+
          '                         From LINXPRODUTOS pr'+
          '                         Where pr.cod_produto=l.cod_produto'+
          '                         And ( (pr.desativado=''S'')'+
          '                               OR (COALESCE(pr.id_setor,0) IN (17, 20, 25))'+ // Setor: 17-IMOBILIZADOS 20-MOVEIS SALÃO 25 - USO E CONSUMO
          '                               OR (COALESCE(pr.id_linha ,0) IN (33))'+ // Linha: 33 - Brindes
          '                               OR (COALESCE(pr.id_colecao ,0) = 197)'+ // Coleção: 197 - DESCONTINUADOS
          '                               OR (COALESCE(pr.id_colecao ,0) IN (294, 587))'+ // Coleção: 294 - BRINDE 587 - KIDS
          '                               OR (COALESCE(pr.cod_fornecedor,0) IN (6, 1014, 260)) ))'+ // Fornecedor Não

         '       Group By 1,2,3'+
         '       Order By 2,1,3) Total'+
         ' Group By 1'+

         ' UNION '+

         ' SELECT ''MÉDIA DA EMPRESA'', '+f_Troca(',','.',sPercTotal)+', 1'+
         ' FROM RDB$DATABASE'+

         ' Order By 3, 2 desc';
  DMBelShop.CDS_NivelAtendLojas.Close;
  DMBelShop.SDS_NivelAtendLojas.CommandText:=MySql;
  DMBelShop.CDS_NivelAtendLojas.Open;
  DMBelShop.CDS_NivelAtendLojas.First;

  OdirPanApres.Caption:='AGUARDE !! Fase 3/3 - Calculando Níveis de Atendimentos...';
  OdirPanApres.Refresh;
  Refresh;

  // Nivel de Atendimento por Curva nas Lojas ==================================
  MySql:=' Select l.cod_loja_linx, j.nome_emp, l.ind_curva,'+
         ' Cast(('+
         ' (100 - ((SUM(case when l.qtd_estoque<1 Then 1 Else 0 End))*(100.000 / count(L.cod_loja_linx)))) *'+
         ' ((CAST(Case'+
         '          When l.ind_curva=''A'' Then'+
         '             (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=1)'+ // Curva ABC
         '          When l.ind_curva=''B'' Then'+
         '             (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=2)'+ // Curva ABC
         '          When l.ind_curva=''C'' Then'+
         '             (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=3)'+ // Curva ABC
         '          When l.ind_curva=''D'' Then'+
         '             (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=4)'+ // Curva ABC
         '          When l.ind_curva=''E'' Then'+
         '             (select p.des_aux from tab_auxiliar p where p.tip_aux=2 and p.cod_aux=5)'+ // Curva ABC
         '          Else'+
         '             1'+
         '       End AS integer)) / 100.000)'+
         ' ) as Numeric(12,2)) Nivel_Atendimento'+

         ' From LINX_PRODUTOS_LOJAS l, LINXLOJAS j'+
         ' Where l.cod_loja_linx=j.empresa'+
         ' And   l.dta_processa between '+QuotedStr(sgDtaI)+' and '+QuotedStr(sgDtaF);

         If Not bgTodasEmpresas Then
         Begin
            If iLjNaoSelect>=iLjSelect Then
            Begin
              MySql:=
               MySql+'       And   l.cod_loja_linx IN ('+sLjSelect+')';
            End; // If iLjNaoSelect>iLjSelect Then

            If iLjNaoSelect<iLjSelect Then
            Begin
              MySql:=
               MySql+'       And   l.cod_loja_linx NOT IN ('+sLjNaoSelect+')';
            End; // If iLjNaoSelect>iLjSelect Then
         End; // If Not bgTodasEmpresas Then

  MySql:=
   MySql+ '       And   Not exists (Select 1'+
          '                         From LINXPRODUTOS pr'+
          '                         Where pr.cod_produto=l.cod_produto'+
          '                         And ( (pr.desativado=''S'')'+
          '                               OR (COALESCE(pr.id_setor,0) IN (17, 20, 25))'+ // Setor: 17-IMOBILIZADOS 20-MOVEIS SALÃO 25 - USO E CONSUMO
          '                               OR (COALESCE(pr.id_linha ,0) IN (33))'+ // Linha: 33 - Brindes
          '                               OR (COALESCE(pr.id_colecao ,0) = 197)'+ // Coleção: 197 - DESCONTINUADOS
          '                               OR (COALESCE(pr.id_colecao ,0) IN (294, 587))'+ // Coleção: 294 - BRINDE 587 - KIDS
          '                               OR (COALESCE(pr.cod_fornecedor,0) IN (6, 1014, 260)) ))'+ // Fornecedor Não

          ' Group By 1,2,3'+

         // Titulo com Período Solicitado ---------------------------
         ' UNION'+

         ' Select 0, ''# PERIODO DE '+f_Troca('.','/',f_Troca('-','/',sgDtaI))+' A '+
                                      f_Troca('.','/',f_Troca('-','/',sgDtaF))+' #'', NUll, NULL'+
         ' From RDB$DATABASE'+

         // Linha em Branco -----------------------------------------
         ' UNION'+

         ' Select 0, ''##'', NULL, NULL'+
         ' From RDB$DATABASE'+

         ' UNION'+

         // Titulo das Colunas das Lojas ----------------------------
         ' Select 0, lo.nome_emp, ''Curva'', NULL'+
         ' From LINXLOJAS lo';

         If Not bgTodasEmpresas Then
         Begin
            If iLjNaoSelect>=iLjSelect Then
            Begin
              MySql:=
               MySql+' Where lo.empresa IN ('+sLjSelect+')';
            End; // If iLjNaoSelect>iLjSelect Then

            If iLjNaoSelect<iLjSelect Then
            Begin
              MySql:=
               MySql+' Where lo.empresa NOT IN ('+sLjNaoSelect+')';
            End; // If iLjNaoSelect>iLjSelect Then
         End; // If Not bgTodasEmpresas Then

  MySql:=
   MySql+' Order By 2,1,3';
  DMBelShop.CDS_NivelAtendCurvas.Close;
  DMBelShop.SDS_NivelAtendCurvas.CommandText:=MySql;
  DMBelShop.CDS_NivelAtendCurvas.Open;
  DMBelShop.CDS_NivelAtendCurvas.First;

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  // APRESENTA O RESULTA DO TEMPO FINAL
  hHrFim:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
  msg('TEMPO: '+TimeToStr(StrToTime(hHrFim)-StrToTime(hHrInicio)),'A');

  hHrInicio:='';
  hHrFim:='';

end; // Calcula Nivel de Atendimento da Lojas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Acerta Seleção das Curvas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmEstoques.SetaCurvas;
Begin
  Gb_EstoquesLimiteCurvaA.Font.Color:=clBlue;
  Gb_EstoquesLimiteCurvaB.Font.Color:=clBlue;
  Gb_EstoquesLimiteCurvaC.Font.Color:=clBlue;
  Gb_EstoquesLimiteCurvaD.Font.Color:=clBlue;
  Gb_EstoquesLimiteCurvaE.Font.Color:=clBlue;

  CkB_EstoquesCurvaA.Checked:=True;
  CkB_EstoquesCurvaB.Checked:=True;
  CkB_EstoquesCurvaC.Checked:=True;
  CkB_EstoquesCurvaD.Checked:=True;
  CkB_EstoquesCurvaE.Checked:=True;
End; // Acerta Seleção das Curvas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Estoque dos Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmEstoques.AtualizaEstoques;
Var
  MySql: String;
Begin

  OdirPanApres.Caption:='AGUARDE !! Localizando Saldo dos Produtos...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmEstoques.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmEstoques.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmEstoques;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.cod_auxiliar Cod_SIDICOM, d.Quantidade'+
         ' FROM LINXPRODUTOS p, LINXPRODUTOSDETALHES d'+
         ' WHERE p.cod_produto=d.cod_produto'+
         ' AND   TRIM(COALESCE(p.cod_auxiliar,''''))<>'''''+
         ' AND   CHAR_LENGTH(p.cod_auxiliar)<=6'+
         ' AND   d.quantidade>0'+
         ' AND   p.desativado=''N'''+
         ' AND   p.id_linha<>33'+    // Brindes
         ' AND   p.id_colecao<>294'+ // Brindes
         ' AND   d.cod_loja='+QuotedStr(sgCodEmp)+
         ' ORDER BY 1';
  DMBelShop.CDS_Busca.Close;
  DMBelShop.SDS_Busca.CommandText:=MySql;
  DMBelShop.CDS_Busca.Open;

  FrmBelShop.MontaProgressBar(True, FrmEstoques);
  pgProgBar.Properties.Max:=DMBelShop.CDS_Busca.RecordCount;
  pgProgBar.Position:=0;

  OdirPanApres.Caption:='AGUARDE !! Atualizando Saldo dos Produtos...';

  DMBelShop.CDS_Busca.DisableControls;
  DMVirtual.CDS_V_Estoques.DisableControls;
  While Not DMBelShop.CDS_Busca.Eof do
  Begin
    Application.ProcessMessages;

    If DMVirtual.CDS_V_Estoques.Locate('COD_PRODUTO',Trim(DMBelShop.CDS_Busca.FieldByName('Cod_SIDICOM').AsString),[]) Then
    Begin
      DMVirtual.CDS_V_Estoques.Edit;
      DMVirtual.CDS_V_EstoquesQTD_ESTOQUE.AsInteger:=DMBelShop.CDS_Busca.FieldByName('Quantidade').AsInteger;
      DMVirtual.CDS_V_Estoques.Post;
    End;

    pgProgBar.Position:=DMBelShop.CDS_Busca.RecNo;

    DMBelShop.CDS_Busca.Next;
  End; // While Not DMBelShop.CDS_Busca.Eof do
  DMBelShop.CDS_Busca.Close;
  DMBelShop.CDS_Busca.EnableControls;
  DMVirtual.CDS_V_Estoques.EnableControls;

  FrmBelShop.MontaProgressBar(False, FrmEstoques);

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;
End; // Atualiza Estoque dos Produtos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Odir Retirou - 19/12/2017 - Parametros Somente para Atualização de Estoque Mínimo
// Recalcula Campos Aggregates em CDS_V_Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Procedure TFrmEstoques.Recalculo_V_Estoques_Aggregates;
//Begin
//  // DEMANDAS FECHA
//  DMVirtual.CDS_V_EstoquesDM_CURVA_A.Active:=False;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_B.Active:=False;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_C.Active:=False;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_D.Active:=False;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_E.Active:=False;
//
//  DMVirtual.CDS_V_EstoquesDM_CURVA_A_PC.Active:=False;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_B_PC.Active:=False;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_C_PC.Active:=False;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_D_PC.Active:=False;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_E_PC.Active:=False;
//
//  DMVirtual.CDS_V_EstoquesDM_CURVA_A_PV.Active:=False;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_B_PV.Active:=False;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_C_PV.Active:=False;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_D_PV.Active:=False;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_E_PV.Active:=False;
//
//  // ESTOQUES FECHA
//  DMVirtual.CDS_V_EstoquesEST_CURVA_A.Active:=False;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_B.Active:=False;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_C.Active:=False;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_D.Active:=False;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_E.Active:=False;
//
//  DMVirtual.CDS_V_EstoquesEST_CURVA_A_PC.Active:=False;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_B_PC.Active:=False;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_C_PC.Active:=False;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_D_PC.Active:=False;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_E_PC.Active:=False;
//
//  DMVirtual.CDS_V_EstoquesEST_CURVA_A_PV.Active:=False;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_B_PV.Active:=False;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_C_PV.Active:=False;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_D_PV.Active:=False;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_E_PV.Active:=False;
//
//  // DEMANDAS REABRE
//  DMVirtual.CDS_V_EstoquesDM_CURVA_A.Active:=True;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_B.Active:=True;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_C.Active:=True;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_D.Active:=True;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_E.Active:=True;
//
//  DMVirtual.CDS_V_EstoquesDM_CURVA_A_PC.Active:=True;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_B_PC.Active:=True;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_C_PC.Active:=True;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_D_PC.Active:=True;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_E_PC.Active:=True;
//
//  DMVirtual.CDS_V_EstoquesDM_CURVA_A_PV.Active:=True;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_B_PV.Active:=True;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_C_PV.Active:=True;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_D_PV.Active:=True;
//  DMVirtual.CDS_V_EstoquesDM_CURVA_E_PV.Active:=True;
//
//  // ESTOQUE REABRE
//  DMVirtual.CDS_V_EstoquesEST_CURVA_A.Active:=True;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_B.Active:=True;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_C.Active:=True;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_D.Active:=True;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_E.Active:=True;
//
//  DMVirtual.CDS_V_EstoquesEST_CURVA_A_PC.Active:=True;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_B_PC.Active:=True;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_C_PC.Active:=True;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_D_PC.Active:=True;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_E_PC.Active:=True;
//
//  DMVirtual.CDS_V_EstoquesEST_CURVA_A_PV.Active:=True;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_B_PV.Active:=True;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_C_PV.Active:=True;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_D_PV.Active:=True;
//  DMVirtual.CDS_V_EstoquesEST_CURVA_E_PV.Active:=True;
//End; // Recalcula Campos Aggregates em CDS_V_Estoques >>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita/ Desbilita Componentes /////////////////////////////////////////////
Procedure TFrmEstoques.HabilitaComponentes(bLib: Boolean);
Begin
  Gb_EstoquesLimiteCurvaA.Enabled:=bLib;
  Gb_EstoquesLimiteCurvaB.Enabled:=bLib;
  Gb_EstoquesLimiteCurvaC.Enabled:=bLib;
  Gb_EstoquesLimiteCurvaD.Enabled:=bLib;
  Gb_EstoquesLimiteCurvaE.Enabled:=bLib;

  Dbg_Estoques.Enabled:=bLib;

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

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;

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
  If (Sender is TJvXPButton) Then
  Begin
    If Trim((Sender as TJvXPButton).Name)='Bt_EstoquesFechar' Then
    Begin
      FrmBelShop.PC_Filtros.Parent:=FrmBelShop.Ts_Filtros;
      DMVirtual.CDS_V_Estoques.Close;
    End; // If Trim((Sender as TJvXPButton).Name)='Bt_EstoquesFechar' Then

    If Trim((Sender as TJvXPButton).Name)='Bt_NivelAtendFechar' Then
    Begin
      DMBelShop.CDS_NivelAtendCurvas.Close;
      DMBelShop.CDS_NivelAtendLojas.Close;
    End; // If Trim((Sender as TJvXPButton).Name)='Bt_EstoquesFechar' Then
  End; // If (Sender is TJvXPButton) Then

  bgSairEstoques:=True;

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
    If i=1 Then i:=13;
    i:=i-1;

    sMes4:=ArrayNroMes[i];
    If i=1 Then i:=13;
    i:=i-1;

    sMes3:=ArrayNroMes[i];
    If i=1 Then i:=13;
    i:=i-1;

    sMes2:=ArrayNroMes[i];
    If i=1 Then i:=13;
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
  Begin
    FrmBelShop.EdtFiltroCodForn.SetFocus;
  End;

//  If (PC_EstoquesPrincipal.ActivePage=Ts_NivelAtendimento) And (Ts_NivelAtendimento.CanFocus) Then
//  Begin
//    Bt_NivelAtendBuscaClick(Self);
//  End;

end;

procedure TFrmEstoques.Dbg_EstoquesEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_EstoquesEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

  bEnterTab:=False;
end;

procedure TFrmEstoques.Dbg_EstoquesExit(Sender: TObject);
begin
  bEnterTab:=True;
end;

// Odir Retirou - 19/12/2017 - Parametros Somente para Atualização de Estoque Mínimo
procedure TFrmEstoques.Dbg_EstoquesKeyPress(Sender: TObject;var Key: Char);
begin
  If Key=#13 Then
  Begin
    DMVirtual.CDS_V_Estoques.Next;
  End; // If Key=#13 Then

end;

procedure TFrmEstoques.Dbg_EstoquesColEnter(Sender: TObject);
begin
  cgVlrAcumulado1:=DMVirtual.CDS_V_EstoquesEST_IDEAL.AsCurrency;

  if (THackDBGrid(Dbg_Estoques).SelectedIndex = 0) Or
     (THackDBGrid(Dbg_Estoques).SelectedIndex = 1) Or
     (THackDBGrid(Dbg_Estoques).SelectedIndex = 2) then
  begin
    THackDBGrid(Dbg_Estoques).FixedCols:=4;
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
    Dbg_Estoques.Columns[10].ReadOnly:=False;
    Dbg_Estoques.Columns[11].ReadOnly:=False;

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
    Dbg_Estoques.Columns[10].ReadOnly:=False;
    Dbg_Estoques.Columns[11].ReadOnly:=False;

    DMVirtual.CDS_V_Estoques.IndexName:='';
    DMVirtual.CDS_V_Estoques.IndexName:='NovaORDEM';
  End; // If Not bOriginal Then

  // Recalcula Campos Aggregates ===============================================
  // Odir Retirou - 19/12/2017 - Parametros Somente para Atualização de Estoque Mínimo
  // DMVirtual.CDS_V_Estoques.Close;

  // Odir Retirou - 19/12/2017 - Parametros Somente para Atualização de Estoque Mínimo
  // Recalculo_V_Estoques_Aggregates;
  //
  // DMVirtual.CDS_V_Estoques.Open;

  // Acerta Seleção das Curvas =================================================
  SetaCurvas;

  If DMVirtual.CDS_V_Estoques.IsEmpty Then
  Begin
    msg('Sem Produto a Listar !!'+cr+cr+'Filtro Será Retirado !!','A');
    // Odir Retirou - 19/12/2017 - Parametros Somente para Atualização de Estoque Mínimo
    // DMVirtual.CDS_V_Estoques.Close;

    DMVirtual.CDS_V_Estoques.Filter:='';
    DMVirtual.CDS_V_Estoques.Filtered:=False;

    // Odir Retirou - 19/12/2017 - Parametros Somente para Atualização de Estoque Mínimo
    // Recalculo_V_Estoques_Aggregates;
    // DMVirtual.CDS_V_Estoques.Open;
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

  //============================================================================
  // Utiliza SIDICOM ===========================================================
  //============================================================================
   bgUsaSIDICOM:=False;
  // Utiliza SIDICOM ===========================================================
  //============================================================================

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

//Odirapagar - 03/07/2019
//  If DMVirtual.CDS_V_GruposProdutos.Active Then
//   DMVirtual.CDS_V_GruposProdutos.Close;
//
//  DMVirtual.CDS_V_GruposProdutos.CreateDataSet;
//  DMVirtual.CDS_V_GruposProdutos.IndexFieldNames:='';
//  DMVirtual.CDS_V_GruposProdutos.Filtered:=False;
//  DMVirtual.CDS_V_GruposProdutos.Filter:='';
//  DMVirtual.CDS_V_GruposProdutos.Open;
//
//  If DMVirtual.CDS_V_SubGruposProdutos.Active Then
//   DMVirtual.CDS_V_SubGruposProdutos.Close;
//
//  DMVirtual.CDS_V_SubGruposProdutos.CreateDataSet;
//  DMVirtual.CDS_V_SubGruposProdutos.IndexFieldNames:='';
//  DMVirtual.CDS_V_SubGruposProdutos.Filtered:=False;
//  DMVirtual.CDS_V_SubGruposProdutos.Filter:='';
//  DMVirtual.CDS_V_SubGruposProdutos.Open;

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
  // Codigo do Produto
  FrmBelShop.Label75.Visible:=False;
  FrmBelShop.EdtFiltroCodProdLinx.Visible:=False;
  FrmBelShop.Label183.Visible:=False;
  FrmBelShop.Label74.Caption:='Linx';

  // Filtro nao Produtos de Não Compra
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
  FrmBelShop.TS_FiltroGrupos.TabVisible:=False;

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
  // BLOQUEAR TECLA Ctrl+Del ===================================================
  if ((Shift=[ssCtrl]) and (key=vk_delete)) THEN
   Abort;

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

    Dbg_Estoques.Columns[10].ReadOnly:=False;
    Dbg_Estoques.Columns[11].ReadOnly:=False;

    DMVirtual.CDS_V_EstoquesNUM_LINHA.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesCOD_PRODUTO.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesIND_CURVA.Alignment:=taCenter;
    DMVirtual.CDS_V_EstoquesQTD_VD_M1.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesQTD_VD_M2.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesQTD_VD_M3.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesQTD_VD_M4.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesQTD_VD_M5.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesQTD_MEDIA_MES.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesEST_IDEAL.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesEST_MAXIMO.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesQTD_ESTOQUE.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesPER_PARTICIPACAO.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesPC_CUSTO.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesPC_VENDA.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesPER_MARGEM.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesCOD_FORNECEDOR.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesVLR_VENDAS_ANO.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesVLR_VENDAS_4M.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesQTD_VENDAS_ANO.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesQTD_VENDAS_4M.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesQTD_TRANSITO.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesQTD_DISPONIVEL.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesQTD_ESTOCAGEM_ANO.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesQTD_ESTOCAGEM_4M.Alignment:=taRightJustify;
    DMVirtual.CDS_V_EstoquesDTA_INCLUSAO.Alignment:=taCenter;
    DMVirtual.CDS_V_EstoquesNUM_DIASUTEIS.Alignment:=taRightJustify;
  End; // If Dbg_Estoques.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] Then

end;

procedure TFrmEstoques.PopM_InformarLojaTrabalharClick(Sender: TObject);
Var
  MySql: String;

  cVlrAcum: Currency;

  i: Integer;

  sDiasUteis, sGenProd, sGenOrdem: String;
  hHrInicio, hHrFim: String;
Begin
  // Inicializa Client CDS_V_Estoques ==========================================
  If DMVirtual.CDS_V_Estoques.Active Then
  Begin
    DMVirtual.CDS_V_Estoques.Close;
  End;
  Stb_Estoques.Panels[0].Text:='LOJA:';

  DMVirtual.CDS_V_Estoques.IndexName:='';
  DMVirtual.CDS_V_Estoques.Filtered:=False;
  DMVirtual.CDS_V_Estoques.Filter:='';

  Dbg_Estoques.Columns[10].ReadOnly:=True;
  Dbg_Estoques.Columns[11].ReadOnly:=True;

  // Solicita Empresas =========================================================
  sgOutrasEmpresa:='(99)';
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False;

  FrmSelectEmpProcessamento.Bt_SelectEmpProcMarcaTodos.Visible:=False;
  FrmSelectEmpProcessamento.Bt_SelectEmpProcDesMarcaTodos.Visible:=False;

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
  igCodLojaLinx:=0;
  Stb_Estoques.Panels[0].Text:='LOJA: Bel_??';
  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
    Begin
      sgCodEmp:=DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString;
      igCodLojaLinx:=DMBelShop.CDS_EmpProcessaCOD_LINX.AsInteger;

      Stb_Estoques.Panels[0].Text:='LOJA: Bel_'+IntToStr(igCodLojaLinx)+' - '+DMBelShop.CDS_EmpProcessaRAZAO_SOCIAL.AsString;

      Break;
    End; // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do

  If sgCodEmp='' Then
  Begin
    Dbg_Estoques.SetFocus;
    Exit;
  End; // If sgCodEmp='' Then

  OdirPanApres.Caption:='AGUARDE !! Processando '+Stb_Estoques.Panels[0].Text;
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmEstoques.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmEstoques.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmEstoques;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Screen.Cursor:=crAppStart;
  Refresh;

  hHrInicio:='';
  hHrFim:='';
  hHrInicio:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

  // Quantidade de Registros ===================================================
  MySql:=' SELECT first 1 fc.cod_linx'+
         ' FROM ES_FINAN_CURVA_ABC fc, LINXPRODUTOS pr'+
         ' WHERE fc.cod_prod_linx=pr.cod_produto'+
         ' AND   fc.cod_prod_linx is not null'+
         ' AND NOT (COALESCE(pr.id_setor,0) in (17, 20, 25))'+ // Setor:     17-IMOBILIZADOS 20-MOVEIS SALÃO 25 - USO E CONSUMO
         ' AND NOT (COALESCE(pr.id_linha ,0) in (33))'+ // Linha: 33 - Brindes
         ' AND NOT (COALESCE(pr.id_colecao ,0) in ( 294, 587))'+ // Coleção: 294 - BRINDE 587 - KIDS
         ' AND NOT (COALESCE(pr.cod_fornecedor,0) in (6, 1014, 260))'+ // Fornecedor Não
         ' AND   fc.cod_linx='+IntToStr(igCodLojaLinx);
  DMBelShop.SQLQ_Busca.Close;
  DMBelShop.SQLQ_Busca.SQL.Clear;
  DMBelShop.SQLQ_Busca.SQL.Add(MySql);
  DMBelShop.SQLQ_Busca.Open;

  If DMBelShop.SQLQ_Busca.IsEmpty Then
  Begin
    Screen.Cursor:=crDefault;
    OdirPanApres.Visible:=False;
    DMBelShop.SQLQ_Busca.Close;
    msg('Sem Produto a Listar !!','A');
    Exit;
  End;
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

  // Dias Úteis da Loja
  MySql:=' SELECT FIRST 1 COALESCE(d.Dias_Uteis, 0) Dias_Uteis'+
         ' FROM ES_DEMANDAS_4MESES d'+
         ' WHERE d.Dias_Uteis>0'+
         ' AND   d.cod_linx='+IntToStr(igCodLojaLinx);
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
         ' pr.cod_produto COD_PRODUTO,'+
         ' TRIM(pr.nome) DES_PRODUTO,'+
         ' TRIM(fc.ind_curva) IND_CURVA,'+

         ' CAST(COALESCE(e4.vlr_venda_m1,0.00) AS NUMERIC(12,2)) VLR_VD_M1,'+
         ' CAST(COALESCE(e4.vlr_venda_m2,0.00) AS NUMERIC(12,2)) VLR_VD_M2,'+
         ' CAST(COALESCE(e4.vlr_venda_m3,0.00) AS NUMERIC(12,2)) VLR_VD_M3,'+
         ' CAST(COALESCE(e4.vlr_venda_m4,0.00) AS NUMERIC(12,2)) VLR_VD_M4,'+
         ' CAST(COALESCE(e4.vlr_venda_m5,0.00) AS NUMERIC(12,2)) VLR_VD_M5,'+
         ' COALESCE(e4.vlr_venda,0) VLR_VENDAS_4M,'+

         ' 0.00 VLR_VENDAS_ANO,'+

         ' CAST(COALESCE(e4.qtd_venda_m1,0) AS INTEGER) QTD_VD_M1,'+
         ' CAST(COALESCE(e4.qtd_venda_m2,0) AS INTEGER) QTD_VD_M2,'+
         ' CAST(COALESCE(e4.qtd_venda_m3,0) AS INTEGER) QTD_VD_M3,'+
         ' CAST(COALESCE(e4.qtd_venda_m4,0) AS INTEGER) QTD_VD_M4,'+
         ' CAST(COALESCE(e4.qtd_venda_m5,0) AS INTEGER) QTD_VD_M5,'+
         ' CAST(COALESCE(e4.qtd_venda,0) AS INTEGER)  QTD_VENDAS_4M,'+

         ' COALESCE(CAST(((COALESCE(e4.qtd_venda_m1,0.0000)+'+
         '                 COALESCE(e4.qtd_venda_m2,0.0000)+'+
         '                 COALESCE(e4.qtd_venda_m3,0.0000)+'+
         '                 COALESCE(e4.qtd_venda_m4,0.0000))/4)'+
         '          AS NUMERIC(12,4))'+
         ' , 0) QTD_MEDIA_MES,'+

         ' 0 QTD_ESTOCAGEM_4M,'+ // Estocagem 4 meses
         ' 0 QTD_VENDAS_ANO,'+
         ' 0 QTD_ESTOCAGEM_ANO,'+

         ' COALESCE(fc.per_participacao,0.0000) PER_PARTICIPACAO,';

  MySqlSelect:=
         ' CAST(pd.quantidade AS INTEGER) QTD_ESTOQUE,'+
         ' COALESCE(fc.qtd_transito,0) QTD_TRANSITO,'+
         ' (CAST(pd.quantidade AS INTEGER) + COALESCE(fc.qtd_transito,0)) QTD_DISPONIVEL,'+

         ' CAST(COALESCE(fc.est_minimo,0) AS INTEGER) EST_IDEAL,'+
         ' CAST(COALESCE(fc.est_maximo,0) AS INTEGER) EST_MAXIMO,'+

         ' CAST(COALESCE(pd.preco_venda,0.0000) AS NUMERIC(15,4)) PC_VENDA,'+
         ' CAST(COALESCE(pd.preco_custo,0.0000) AS NUMERIC(15,4)) PC_CUSTO,'+
         ' 0.0000 PER_MARGEM,'+

         ' pr.dt_inclusao DTA_INCLUSAO,'+
         ' pr.id_setor COD_SETOR,'+
         ' TRIM(pr.desc_setor) NOME_SETOR,'+
         ' pr.id_linha COD_LINHA,'+
         ' TRIM(pr.desc_linha) NOME_LINHA,'+
         ' pr.id_marca COD_MARCA,'+
         ' TRIM(pr.desc_marca) NOME_MARCA,'+
         ' pr.id_colecao COD_COLECAO,'+
         ' TRIM(pr.desc_colecao) NOME_COLECAO,'+

         ' TRIM(pr.cod_fornecedor) COD_FORNECEDOR,'+
         ' TRIM(fo.nome_cliente) DES_FORNECEDOR,'+
         ' 0 COD_COMPRADOR,'+
         ' NULL DES_COMPRADOR,'+

         ' GEN_ID('+sGenOrdem+',1)+12 ORDENAR,'+
         ' COALESCE(fc.num_dias_uteis,0) NUM_DIASUTEIS,'+
         ' 0 NUM_LINHA';

  MySqlClausula2:=
         ' FROM ES_FINAN_CURVA_ABC fc'+
         '     LEFT JOIN LINXPRODUTOS pr          ON pr.cod_produto=fc.cod_prod_linx'+
         '     LEFT JOIN LINXPRODUTOSDETALHES pd  ON pd.cod_produto=fc.cod_prod_linx'+
         '                                       AND pd.empresa=fc.cod_linx'+
         '     LEFT JOIN ES_DEMANDAS_4MESES e4    ON e4.cod_linx =fc.cod_linx'+
         '                                       AND e4.cod_prod_linx=fc.cod_prod_linx'+
         '     LEFT JOIN LINXCLIENTESFORNEC fo    ON fo.cod_cliente=pr.cod_fornecedor'+

         ' WHERE fc.cod_linx='+IntToStr(igCodLojaLinx)+
         ' AND   pr.desativado=''N'''+
         ' AND   NOT (COALESCE(pr.id_setor, 0) in (17, 20, 25))'+ // Setor: 17-IMOBILIZADOS 20-MOVEIS SALÃO 25 - USO E CONSUMO
         ' AND   NOT (COALESCE(pr.id_linha, 0) in (33))'+ // Linha: 33 - Brindes
         ' AND   NOT (COALESCE(pr.id_colecao, 0) in (294, 587))'+ // Coleção: 294 - BRINDE 587 - KIDS
         ' AND   NOT (COALESCE(pr.cod_fornecedor, 0) in (6, 1014, 260))'+ // Fornecedor Não

         ' ORDER BY fc.ind_curva, fc.per_participacao desc';
  DMVirtual.CDS_V_Estoques.Close;
  DMVirtual.CDS_V_Estoques.Filtered:=False;
  DMVirtual.CDS_V_Estoques.Filter:='';
  DMVirtual.SQLQ_Busca.SQL.Clear;
  DMVirtual.SQLQ_Busca.SQL.Add(MySql+MySqlSelect+MySqlClausula2);
  DMVirtual.CDS_V_Estoques.Open;

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
  Dbg_Estoques.Columns[10].Font.Style:=[fsBold];
  Dbg_Estoques.Columns[10].ReadOnly:=False;
  Dbg_Estoques.Columns[11].Font.Style:=[fsBold];
  Dbg_Estoques.Columns[11].ReadOnly:=False;

  // Se Atualiza Valores de Estoques ===========================================
  DMVirtual.bSeProcessa2:=False;

  // Fecha Apresentações =======================================================
  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

  Refresh;

  THackDBGrid(Dbg_Estoques).FixedCols:=4;
  THackDBGrid(Dbg_Estoques).SelectedIndex:=10;
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

  // Fecha Demonstrativo =======================================================
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);

  // Busca Valores da Curva ABC ================================================
  MySql:=' SELECT t.cod_aux Cod_Curva,'+
         ' Coalesce(t.des_aux,0) Per_Curva,'+
         ' Coalesce(t.vlr_aux,0) Qtd_Dias,'+
         ' Coalesce(t.vlr_aux1,0) Qtd_Min'+
         ' FROM TAB_AUXILIAR t'+
         ' WHERE t.tip_aux=2'+ // Curva ABC
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
  sLjLinx: String;
begin
  // Altera os Estoques Mínimos em Outras Lojas ================================
  If DMVirtual.CDS_V_Estoques.IsEmpty Then
   Exit;

  If Trim(sgFiltros)='' Then
  Begin
    If msg('Todos os FORNECEDORES ESTÃO Selecionados ??'+cr+cr+'DESEJA CONTINUAR ??','C')=2 Then
     Exit;
  End;

  If Application.MessageBox('Deseja REALMENTE Replicar'+cr+cr+'TODOS OS ESTOQUE Mínimos'+cr+cr+'do FILTRO Selecionado para'+cr+cr+'Outra(s) Loja(s) ??', 'ATENÇÃO !!', 292) = Idno Then
   Exit;

  sgOutrasEmpresa:='(''99'')';
  sgEmpresaNao:='('+IntToStr(igCodLojaLinx)+')';
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False;
  FrmSelectEmpProcessamento.Gb_SelectEmpProc.Caption:='SELECIONE AS LOJAS A REPLICAR OS ESTOQUES Mínimos';

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
  sLjLinx:='';
  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
    Begin
      If sLjLinx='' Then
       sLjLinx:=QuotedStr(DMBelShop.CDS_EmpProcessaCOD_LINX.AsString)
      Else
       sLjLinx:=sLjLinx+', '+QuotedStr(DMBelShop.CDS_EmpProcessaCOD_LINX.AsString);
    End; // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do

  If Application.MessageBox(pChar('Deseja REALMENTE Replicar'+cr+cr+
                                  'TODOS OS ESTOQUE Mínimos'+cr+cr+
                                  'do FILTRO Selecionado para'+cr+cr+
                                  'a(s) Loja(s):'+cr+cr+
                                  sLjLinx+cr+cr+' ?????????'), 'ATENÇÃO !!', 292) = Idno Then
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
             ' WHERE e.cod_prod_linx='+DMVirtual.CDS_V_EstoquesCOD_PRODUTO.AsString+
             ' AND   e.cod_linx IN ('+sLjLinx+')';
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

    msg('Estoque(s) Minimo(s) Replicado(s) com SUCESSO'+cr+'para a(s) Loja(s): '+cr+sLjLinx,'A');
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

  sLjLinx:='';
  DMVirtual.CDS_V_Estoques.First;
  THackDBGrid(Dbg_Estoques).FixedCols:=4;
  Dbg_Estoques.SetFocus;
end;

procedure TFrmEstoques.Bt_OdirClick(Sender: TObject);
Var
  mMemo: TMemo;
begin

//  Dbg_Estoques.SetFocus;
//
//  If msg('CONTINUAR ??','C')=2 Then
//   Exit;
//
//  If AnsiUpperCase(Des_Login)<>'ODIR' Then
//   EXIT;
//
//  // Cria Componente Memo ======================================================
//  mMemo:=TMemo.Create(Self);
//  mMemo.Visible:=True;
//  mMemo.Parent:=FrmEstoques;
//  mMemo.Height:=410;
//  mMemo.Left:=32;
//  mMemo.Width:=920;
//  mMemo.Top:=96;
//  mMemo.Anchors:=[akLeft,akTop,akRight,akBottom];
//  mMemo.Lines.Clear;
//
//  ShowMessage('0');
//
//  DMBelShop.CDS_Busca.Close;
//  DMBelShop.SDS_Busca.CommandText:='SELECT * FROM ES_FINAN_CURVA_ABC e ORDER BY e.cod_loja, e.cod_produto';
//  DMBelShop.CDS_Busca.Open;
//
//  Bt_Odir.Caption:=IntToStr(DMBelShop.CDS_Busca.RecordCount);
//
//  sgCodigo:='';
//  sgDescricao:='';
//  While Not DMBelShop.CDS_Busca.Eof do
//  Begin
//    Application.ProcessMessages;
//
//    sgDescricao:=DMBelShop.CDS_Busca.FieldByName('cod_loja').AsString+' - '+
//                 DMBelShop.CDS_Busca.FieldByName('cod_produto').AsString;
//
//    If sgCodigo=sgDescricao Then
//     mMemo.Lines.Add(sgCodigo);
//
//    sgCodigo:=DMBelShop.CDS_Busca.FieldByName('cod_loja').AsString+' - '+
//              DMBelShop.CDS_Busca.FieldByName('cod_produto').AsString;
//
//    Bt_Odir.Caption:=IntToStr(DMBelShop.CDS_Busca.RecordCount)+' - '+IntToStr(DMBelShop.CDS_Busca.RecNo);
//    DMBelShop.CDS_Busca.Next;
//  end;
//  DMBelShop.CDS_Busca.Close;
//  FreeAndNil(mMemo);

end;

procedure TFrmEstoques.Bt_EstoquesFiltroCompradorClick(Sender: TObject);
Var
  MySql: String;
begin

  If DMVirtual.CDS_V_Estoques.IsEmpty Then
   Exit;

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
    // Acerta Seleção das Curvas ===============================================
    SetaCurvas;

    sgFiltroComp:='';
    DMBelShop.CDS_Busca.First;
    While Not DMBelShop.CDS_Busca.Eof do
    Begin
      If DMBelShop.CDS_Busca.FieldByName('PROC').AsString='SIM' Then
      Begin
        If Trim(sgFiltroComp)='' Then
        Begin
          sgFiltroComp:='COD_COMPRADOR='+QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('Codigo').AsString));
          sgCompradores:=Trim(DMBelShop.CDS_Busca.FieldByName('Comprador').AsString);
        End
        Else
        Begin
          sgFiltroComp:=sgFiltroComp+' OR COD_COMPRADOR='+QuotedStr(Trim(DMBelShop.CDS_Busca.FieldByName('Codigo').AsString));
          sgCompradores:=sgCompradores+' / '+Trim(DMBelShop.CDS_Busca.FieldByName('Comprador').AsString);
        End;
      End;

      DMBelShop.CDS_Busca.Next;
    End; // While Not DMBelShop.CDS_Busca.Eof do
    DMBelShop.CDS_Busca.Close;

    DMVirtual.CDS_V_Estoques.DisableControls;

//    DMVirtual.CDS_V_Estoques.Close;

    DMVirtual.CDS_V_Estoques.Filtered:=False;
    DMVirtual.CDS_V_Estoques.Filter:='';

    If (Trim(sgFiltros)<>'') And (Trim(sgFiltroComp)<>'') Then
     Begin
       DMVirtual.CDS_V_Estoques.Filter:=sgFiltros+' AND ('+sgFiltroComp+')';
     End
    ELSE
     If (Trim(sgFiltros)='') And (Trim(sgFiltroComp)<>'') Then
     Begin
       DMVirtual.CDS_V_Estoques.Filter:=sgFiltroComp;
     End
    ELSE
     If (Trim(sgFiltros)<>'') Then
     Begin
       DMVirtual.CDS_V_Estoques.Filter:=sgFiltros;
     End;
    DMVirtual.CDS_V_Estoques.Filtered:=True;

    // Odir Retirou - 19/12/2017 - Parametros Somente para Atualização de Estoque Mínimo
    // Recalculo_V_Estoques_Aggregates;
    // DMVirtual.CDS_V_Estoques.Open;
    DMVirtual.CDS_V_Estoques.EnableControls;

    If DMVirtual.CDS_V_Estoques.IsEmpty Then
    Begin
      msg('Sem Produto a Listar !!'+cr+cr+'Filtro Será Retirado !!','A');

      // Odir Retirou - 19/12/2017 - Parametros Somente para Atualização de Estoque Mínimo
      // DMVirtual.CDS_V_Estoques.Close;

      DMVirtual.CDS_V_Estoques.Filter:='';
      DMVirtual.CDS_V_Estoques.Filtered:=False;

      // Odir Retirou - 19/12/2017 - Parametros Somente para Atualização de Estoque Mínimo
      // Recalculo_V_Estoques_Aggregates;
      // DMVirtual.CDS_V_Estoques.Open;
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

procedure TFrmEstoques.Bt_EstoquesSaldosClick(Sender: TObject);
Var
  hHrInicio, hHrFim: String;
begin
  Dbg_Estoques.SetFocus;

  If DMVirtual.CDS_V_Estoques.IsEmpty Then
   Exit;

  if msg('Atualização de Saldo de Estoque'+cr+'Tempo Previsto: 1 a 4 Minutos'+cr+cr+'Deseja Continuar ???','C')=2 Then
   Exit;

  hHrInicio:='';
  hHrFim:='';
  hHrInicio:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));

  // Atualiza Estoque dos Produtos =============================================
  AtualizaEstoques;

  // APRESENTA O RESULTA DO TEMPO FINAL
  hHrFim:=TimeToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor));
  msg('TEMPO: '+TimeToStr(StrToTime(hHrFim)-StrToTime(hHrInicio)),'A');

  hHrInicio:='';
  hHrFim:='';

  THackDBGrid(Dbg_Estoques).FixedCols:=4;
  THackDBGrid(Dbg_Estoques).SelectedIndex:=10;

  DMVirtual.CDS_V_Estoques.First;

  Application.ProcessMessages;
  Dbg_Estoques.SetFocus;
end;

procedure TFrmEstoques.CkB_EstoquesCurvaAClick(Sender: TObject);
Var
  sA, sB, sC, sD, sE: String;
begin

  sgFiltroCurvas:='';
  If DMVirtual.CDS_V_Estoques.IsEmpty Then
  Begin
    SetaCurvas;
    Exit;
  End;

  // Monta Filtro de Cusvas ====================================================
  Screen.Cursor:=crArrow;
  If (Sender is TJvXPCheckbox) Then
  Begin
    If CkB_EstoquesCurvaA.State=cbGrayed Then CkB_EstoquesCurvaA.State:=cbUnchecked;
    If CkB_EstoquesCurvaB.State=cbGrayed Then CkB_EstoquesCurvaB.State:=cbUnchecked;
    If CkB_EstoquesCurvaC.State=cbGrayed Then CkB_EstoquesCurvaC.State:=cbUnchecked;
    If CkB_EstoquesCurvaD.State=cbGrayed Then CkB_EstoquesCurvaD.State:=cbUnchecked;
    If CkB_EstoquesCurvaE.State=cbGrayed Then CkB_EstoquesCurvaE.State:=cbUnchecked;

    // Monta Select das Curvas =================================================
    Gb_EstoquesLimiteCurvaA.Font.Color:=clBlue;
    Gb_EstoquesLimiteCurvaB.Font.Color:=clBlue;
    Gb_EstoquesLimiteCurvaC.Font.Color:=clBlue;
    Gb_EstoquesLimiteCurvaD.Font.Color:=clBlue;
    Gb_EstoquesLimiteCurvaE.Font.Color:=clBlue;

    If CkB_EstoquesCurvaA.Checked Then sA:=' IND_CURVA=''A''' Else Gb_EstoquesLimiteCurvaA.Font.Color:=clRed;
    If CkB_EstoquesCurvaB.Checked Then sB:=' IND_CURVA=''B''' Else Gb_EstoquesLimiteCurvaB.Font.Color:=clRed;
    If CkB_EstoquesCurvaC.Checked Then sC:=' IND_CURVA=''C''' Else Gb_EstoquesLimiteCurvaC.Font.Color:=clRed;
    If CkB_EstoquesCurvaD.Checked Then sD:=' IND_CURVA=''D''' Else Gb_EstoquesLimiteCurvaD.Font.Color:=clRed;
    If CkB_EstoquesCurvaE.Checked Then sE:=' IND_CURVA=''E''' Else Gb_EstoquesLimiteCurvaE.Font.Color:=clRed;

    // Curva A ------------------------------------------------------
    If sA<>'' Then
    Begin
      sgFiltroCurvas:=sA;
    End; // If sA<>'' Then

    // Curva B ------------------------------------------------------
    If sB<>'' Then
    Begin
     If Trim(sgFiltroCurvas)='' Then
      sgFiltroCurvas:=sB
     Else
      sgFiltroCurvas:=sgFiltroCurvas+' OR '+sB;
    End; // If sB<>'' Then

    // Curva C ------------------------------------------------------
    If sC<>'' Then
    Begin
     If Trim(sgFiltroCurvas)='' Then
      sgFiltroCurvas:=sC
     Else
      sgFiltroCurvas:=sgFiltroCurvas+' OR '+sC;
    End; // If sC<>'' Then

    // Curva D ------------------------------------------------------
    If sD<>'' Then
    Begin
     If Trim(sgFiltroCurvas)='' Then
      sgFiltroCurvas:=sD
     Else
      sgFiltroCurvas:=sgFiltroCurvas+' OR '+sD;
    End; // If sD<>'' Then

    // Curva E ------------------------------------------------------
    If sE<>'' Then
    Begin
     If Trim(sgFiltroCurvas)='' Then
      sgFiltroCurvas:=sE
     Else
      sgFiltroCurvas:=sgFiltroCurvas+' OR '+sE;
    End; // If sE<>'' Then

    // Acerta Seleção das Curvas ===============================================
    If ((Not CkB_EstoquesCurvaA.Checked) And (Not CkB_EstoquesCurvaB.Checked) And (Not CkB_EstoquesCurvaC.Checked) And
        (Not CkB_EstoquesCurvaD.Checked) And (Not CkB_EstoquesCurvaE.Checked)) OR
       ((CkB_EstoquesCurvaA.Checked) And (CkB_EstoquesCurvaB.Checked) And (CkB_EstoquesCurvaC.Checked) And
        (CkB_EstoquesCurvaD.Checked) And (CkB_EstoquesCurvaE.Checked)) Then
    Begin
      SetaCurvas;
      sgFiltroCurvas:='';
    End;

    // Executa Filtros =========================================================
    DMVirtual.CDS_V_Estoques.DisableControls;
    DMVirtual.CDS_V_Estoques.Filtered:=False;
    DMVirtual.CDS_V_Estoques.Filter:='';

    // Filtros: Filtros, Compradores e Curvas
    If (Trim(sgFiltros)<>'') And (Trim(sgFiltroComp)<>'') And (Trim(sgFiltroCurvas)<>'')  Then
     Begin
       DMVirtual.CDS_V_Estoques.Filter:=sgFiltros+' AND ('+sgFiltroComp+')'+' AND ('+sgFiltroCurvas+')';
     End
    ELSE // Filtros: Curvas
     If (Trim(sgFiltros)='') And (Trim(sgFiltroComp)='') And (Trim(sgFiltroCurvas)<>'')  Then
     Begin
       DMVirtual.CDS_V_Estoques.Filter:=sgFiltroCurvas;
     End
    ELSE // Filtros: Compradores e Curvas
     If (Trim(sgFiltros)='') And (Trim(sgFiltroComp)<>'') And (Trim(sgFiltroCurvas)<>'')  Then
     Begin
       DMVirtual.CDS_V_Estoques.Filter:='('+sgFiltroComp+')'+' AND ('+sgFiltroCurvas+')';
     End
    ELSE // Filtros: Compradores
     If (Trim(sgFiltros)='') And (Trim(sgFiltroComp)<>'') And (Trim(sgFiltroCurvas)='')  Then
     Begin
       DMVirtual.CDS_V_Estoques.Filter:='('+sgFiltroComp+')';
     End
    ELSE // Filtros: Filtros
     If (Trim(sgFiltros)<>'') And (Trim(sgFiltroComp)='') And (Trim(sgFiltroCurvas)='')  Then
     Begin
       DMVirtual.CDS_V_Estoques.Filter:='('+sgFiltros+')';
     End
    ELSE // Filtros: Filtros e Curvas
     If (Trim(sgFiltros)<>'') And (Trim(sgFiltroComp)='') And (Trim(sgFiltroCurvas)<>'')  Then
     Begin
       DMVirtual.CDS_V_Estoques.Filter:='('+sgFiltros+')'+' AND ('+sgFiltroCurvas+')';
     End
    ELSE // Filtros: Filtros e Compradores
     If (Trim(sgFiltros)<>'') And (Trim(sgFiltroComp)<>'') And (Trim(sgFiltroCurvas)='')  Then
     Begin
       DMVirtual.CDS_V_Estoques.Filter:='('+sgFiltros+')'+' AND ('+sgFiltroComp+')';
     End;

    DMVirtual.CDS_V_Estoques.Filtered:=True;

    // Se Não Entrado Nada das Curvas Selecionadas Retorna Todas as Curvas
    If DMVirtual.CDS_V_Estoques.IsEmpty Then
    Begin
      SetaCurvas;
      DMVirtual.CDS_V_Estoques.Filtered:=False;
      DMVirtual.CDS_V_Estoques.EnableControls;
      CkB_EstoquesCurvaAClick(CkB_EstoquesCurvaA);
      Exit;
    End;
    DMVirtual.CDS_V_Estoques.EnableControls;

    THackDBGrid(Dbg_Estoques).FixedCols:=4;
    Dbg_EstoquesColEnter(Self);
    Dbg_Estoques.Refresh;
    Refresh;
    Dbg_Estoques.SetFocus;
    Screen.Cursor:=crDefault;
  End; // If (Sender is TJvXPCheckbox) Then
end;

procedure TFrmEstoques.Bt_NivelAtendSalvaClipboardCurvasClick(Sender: TObject);
begin
  If (Sender is TJvXPButton) Then
  Begin
    If Trim((Sender as TJvXPButton).Name)='Bt_NivelAtendSalvaClipboardCurvas' Then
    Begin
      If DMBelShop.CDS_NivelAtendCurvas.IsEmpty Then
       Exit;

      DBGridClipboard(Dbg_NivelAtendCurva);
    End; // If Trim((Sender as TJvXPButton).Name)='Bt_NivelAtendSalvaClipboardCurvas' Then

    If Trim((Sender as TJvXPButton).Name)='Bt_NivelAtendSalvaClipboardLojas' Then
    Begin
      If DMBelShop.CDS_NivelAtendLojas.IsEmpty Then
       Exit;

      DBGridClipboard(Dbg_NivelAtendLojas);
    End; // If Trim((Sender as TJvXPButton).Name)='Bt_NivelAtendSalvaClipboardCurvas' Then
  End; // If (Sender is TJvXPButton) Then
end;

procedure TFrmEstoques.Bt_NivelAtendBuscaClick(Sender: TObject);
Var
  MySql: String;

  b: Boolean;
  sDtaMin, sDtaMax,
  sLjSelect, sLjNaoSelect: String;

  wDia, wMes, wAno: Word;

  iLjSelect, iLjNaoSelect: Integer;
begin
  Dbg_NivelAtendCurva.SetFocus;

  b:=True;
  While b do
  Begin
    bgSiga:=False;
    FrmPeriodoApropriacao:=TFrmPeriodoApropriacao.Create(Self);

    // Ajusta Período para 30 Dias ===============================================
    FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date:=StrToDate(
                  DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)-1));
    FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date:=
                IncMonth(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date,-1);

    FrmPeriodoApropriacao.ShowModal;
    sgDtaI:=DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaInicio.Date);
    sgDtaF:=DateToStr(FrmPeriodoApropriacao.DtEdt_PeriodoAproprDtaFim.Date);
    sgDtaI:=f_Troca('/','.',f_Troca('-','.',sgDtaI));
    sgDtaF:=f_Troca('/','.',f_Troca('-','.',sgDtaF));
    FreeAndNil(FrmPeriodoApropriacao);

    // Verifica se Prossegue Processamento =======================================
    If Not bgSiga Then
     Exit;

    // Verifica o Período ========================================================
    DecodeDate(IncMonth(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor),-1), wAno, wMes, wDia);
    sDtaMin:=DateToStr(EncodeDate(wAno, wMes, 1));
    sDtaMin:=f_Troca('/','.',f_Troca('-','.',sDtaMin));
    sDtaMax:=DateToStr(DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)-1);
    sDtaMax:=f_Troca('/','.',f_Troca('-','.',sDtaMax));

    MySql:=' SELECT'+
           ' CASE'+
           '   WHEN (((CAST('+QuotedStr(sgDtaI)+' AS DATE) BETWEEN CAST('+QuotedStr(sDtaMin)+' AS DATE) AND CAST('+QuotedStr(sDtaMax)+' AS DATE))'+
           '           AND'+
           '          (CAST('+QuotedStr(sgDtaF)+' AS DATE) BETWEEN CAST('+QuotedStr(sDtaMin)+' AS DATE) AND CAST('+QuotedStr(sDtaMax)+' AS DATE)))) THEN'+
           '      ''SIM'''+
           '   ELSE'+
           '     ''NAO'''+
           ' END PERIODO'+
           ' FROM RDB$DATABASE';
    DMBelShop.SQLQuery1.Close;
    DMBelShop.SQLQuery1.SQL.Clear;
    DMBelShop.SQLQuery1.SQL.Add(MySql);
    DMBelShop.SQLQuery1.Open;
    bgSiga:=(DMBelShop.SQLQuery1.FieldByName('Periodo').AsString='SIM');
    DMBelShop.SQLQuery1.Close;

    b:=False;
    If Not bgSiga Then
    Begin
      msg('Erro no Período !!'+cr+cr+'Deve ser Entre: '+cr+sDtaMin+' a '+sDtaMax,'A');
      b:=True;
    End;
  End; // While b do

  // Apresentas Loja Para Seleção ==============================================
  sgEmpresaNao:='(''89'',''96'',''97'',''98'')';
  sgOutrasEmpresa:='(''99'')';
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False;
  FrmSelectEmpProcessamento.Gb_SelectEmpProc.Caption:='SELECIONE AS LOJAS A PROCESSAR';

  FrmSelectEmpProcessamento.ShowModal;

  igNrEmpProc:=FrmSelectEmpProcessamento.iNrEmpProc;

  FreeAndNil(FrmSelectEmpProcessamento);

  If igNrEmpProc<1 Then
  Begin
    msg('Sem Loja Selecionada !!','A');
    Dbg_NivelAtendCurva.SetFocus;
    Exit;
  End; // If igNrEmpProc<1 Then

  DMBelShop.CDS_NivelAtendCurvas.Close;
  DMBelShop.CDS_NivelAtendLojas.Close;

  // Verifica se Existe Empresa a Processar ====================================
  bgTodasEmpresas:=True;
  sLjSelect:='';
  sLjNaoSelect:='';
  iLjSelect:=0;
  iLjNaoSelect:=0;
  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
     Begin
       If sLjSelect='' Then
        sLjSelect:=DMBelShop.CDS_EmpProcessaCOD_LINX.AsString
       Else
        sLjSelect:=sLjSelect+', '+DMBelShop.CDS_EmpProcessaCOD_LINX.AsString;

       Inc(iLjSelect);
     End
    Else // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
     Begin
       If sLjNaoSelect='' Then
        sLjNaoSelect:=DMBelShop.CDS_EmpProcessaCOD_LINX.AsString
       Else
        sLjNaoSelect:=sLjNaoSelect+', '+DMBelShop.CDS_EmpProcessaCOD_LINX.AsString;

       bgTodasEmpresas:=False;
       Inc(iLjNaoSelect);
     End; // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do

  // Calcula Nivel de Atendimentodas Lojas Selecionadas ========================
  NivelAtendimentoCalcula(sLjSelect, sLjNaoSelect, iLjSelect, iLjNaoSelect);

end;

procedure TFrmEstoques.Dbg_NivelAtendCurvaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then // Este comando altera cor da Linha
  Begin
    If (DMBelShop.CDS_NivelAtendCurvasCOD_LOJA_LINX.AsString='0') And
       (DMBelShop.CDS_NivelAtendCurvasIND_CURVA.AsString='Curva') Then
    Begin
      Dbg_NivelAtendCurva.Canvas.Brush.Color:=clYellow;
      Dbg_NivelAtendCurva.Canvas.Font.Style:=[fsBold];
    End;
  End; // if not (gdSelected in State) Then

  Dbg_NivelAtendCurva.Canvas.FillRect(Rect);
  Dbg_NivelAtendCurva.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMBelShop.CDS_NivelAtendCurvasCOD_LOJA_LINX.Alignment:=taRightJustify;
  DMBelShop.CDS_NivelAtendCurvasIND_CURVA.Alignment:=taCenter;
  DMBelShop.CDS_NivelAtendCurvasNIVEL_ATENDIMENTO.Alignment:=taRightJustify;

end;

procedure TFrmEstoques.Dbg_NivelAtendCurvaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // BLOQUEAR TECLA Ctrl+Del ===================================================
  // Usado em:
  // Dbg_NivelAtendLojasKeyDown
  if ((Shift=[ssCtrl]) and (key=vk_delete)) THEN
   Abort;

end;

procedure TFrmEstoques.Dbg_NivelAtendCurvaCellClick(Column: TColumn);
begin
  If (DMBelShop.CDS_NivelAtendCurvas.Active) And (Not DMBelShop.CDS_NivelAtendCurvas.IsEmpty) And
     (DMBelShop.CDS_NivelAtendLojas.Active)  And (Not DMBelShop.CDS_NivelAtendLojas.IsEmpty)  Then
  Begin
    DMBelShop.CDS_NivelAtendLojas.Locate('NOME_EMP', DMBelShop.CDS_NivelAtendCurvasNOME_EMP.AsString,[]);
  End; //   If (CDS_NivelAtendCurvas.Active) And (Not CDS_NivelAtendCurvas.IsEmpty) And ...

end;

procedure TFrmEstoques.Dbg_NivelAtendLojasCellClick(Column: TColumn);
begin
  If (DMBelShop.CDS_NivelAtendCurvas.Active) And (Not DMBelShop.CDS_NivelAtendCurvas.IsEmpty) And
     (DMBelShop.CDS_NivelAtendLojas.Active)  And (Not DMBelShop.CDS_NivelAtendLojas.IsEmpty)  Then
  Begin
    DMBelShop.CDS_NivelAtendCurvas.Locate('NOME_EMP', DMBelShop.CDS_NivelAtendLojasNOME_EMP.AsString,[]);
  End; //   If (CDS_NivelAtendCurvas.Active) And (Not CDS_NivelAtendCurvas.IsEmpty) And ...

end;

procedure TFrmEstoques.Dbg_NivelAtendLojasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) Then // Este comando altera cor da Linha
  Begin
    If (DMBelShop.CDS_NivelAtendLojasNOME_EMP.AsString='MÉDIA DA EMPRESA') Then
    Begin
      Dbg_NivelAtendLojas.Canvas.Brush.Color:=clYellow;
      Dbg_NivelAtendLojas.Canvas.Font.Style:=[fsBold];
    End;
  End; // if not (gdSelected in State) Then

  Dbg_NivelAtendLojas.Canvas.FillRect(Rect);
  Dbg_NivelAtendLojas.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMBelShop.CDS_NivelAtendLojasNIVEL_ATENDIMENTO.Alignment:=taRightJustify;

end;

procedure TFrmEstoques.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // (ERRO) ACERTA ROLAGEM DO MOUSE (SCROLL)
  If Msg.message = WM_MOUSEWHEEL then // primeiramente verificamos se é o evento a ser tratado...
  Begin
    If (ActiveControl is TDBGrid) Or (ActiveControl is TDBGridJul) then // If Somente DBGRID *** Testa se Classe é TDBGRID
    Begin
      Msg.message := WM_KEYDOWN;
      Msg.lParam := 0;
      Sentido := HiWord(Msg.wParam);
      if Sentido > 0 then
       Msg.wParam := VK_UP
      else
       Msg.wParam := VK_DOWN;
    End; // If (ActiveControl is TDBGrid) Or (ActiveControl is TDBGridJul) then // If Somente DBGRID *** Testa se Classe é TDBGRID
  End; // if Msg.message = WM_MOUSEWHEEL then

end;

procedure TFrmEstoques.Dbg_NivelAtendCurvaEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_NivelAtendCurvaEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmEstoques.Dbg_NivelAtendLojasEnter(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_NivelAtendLojasEnter; // Nome do Evento do DBGRID
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmEstoques.Ts_EstoquesFiltrosExit(Sender: TObject);
begin
  //============================================================================
  // Utiliza SIDICOM ===========================================================
  //============================================================================
  bgUsaSIDICOM:=UtilizaSIDICOM(DMBelShop.SQLQuery1);
  // Utiliza SIDICOM ===========================================================
  //============================================================================

  //============================================================================
  // Retorna Componentes dos Filtros ===========================================
  //============================================================================
  // Codigo do Produto
  FrmBelShop.Label75.Visible:=True;
  FrmBelShop.EdtFiltroCodProdLinx.Visible:=True;
  FrmBelShop.Label183.Visible:=True;
  FrmBelShop.Label74.Caption:='Sidicom';

end;

end.

