unit UFrmConciliacaoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, ExtCtrls,
  DBXpress, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, StdCtrls, JvExStdCtrls, JvCheckBox, ComCtrls, Grids,
  DBGrids, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Mask,
  ToolEdit, CurrEdit, RXCtrls, DBCtrls, DBClient, DB, jpeg, AppEvnts,
  DBGridJul;

type
  TFrmConciliacaoCaixa = class(TForm)
    PC_Principal: TPageControl;
    Ts_ConciliacaoCaixa: TTabSheet;
    Pan_ConcFechaCaixaSolic: TPanel;
    Label158: TLabel;
    Label194: TLabel;
    EdtConcFechaCaixaCodLoja: TCurrencyEdit;
    Bt_ConcFechaCaixaBuscaLoja: TJvXPButton;
    EdtConcFechaCaixaDesLoja: TEdit;
    DtEdtConcFechaCaixaData: TcxDateEdit;
    OdirPanApres: TPanel;
    Pan_ConcFechaCaixaSituacao: TPanel;
    PC_ConcFechaCaixa: TPageControl;
    Ts_ConcFechaCaixaOper: TTabSheet;
    Ts_ConcFechaCaixaDoctos: TTabSheet;
    Gb_ConcFechaCaixaLancamentos: TGroupBox;
    Dbg_ConcFechaCaixaDoctos: TDBGrid;
    Dbg_ConcFechaCaixaTotal: TDBGrid;
    StatusBar5: TStatusBar;
    Pan_ConcFechaCaixaLanc: TPanel;
    Gb_ConcFechaCaixaOper: TGroupBox;
    Gb_ConcFechaCaixaFPagto: TGroupBox;
    Gb_ConcFechaCaixaLanc: TGroupBox;
    Dbg_ConcFechaCaixaLanc: TDBGrid;
    Pan_ConcFechaCaixaTotal: TPanel;
    Bt_ConcFechaCaixaTransf: TJvXPButton;
    Label1: TLabel;
    EdtConcFechaCaixaTotal: TCurrencyEdit;
    EdtConcFechaCaixaCodOper: TCurrencyEdit;
    Bt_ConcFechaCaixaBuscaOper: TJvXPButton;
    EdtConcFechaCaixaDesOper: TEdit;
    Bt_ConcFechaCaixaBuscaForma: TJvXPButton;
    EdtConcFechaCaixaDesForma: TEdit;
    EdtConcFechaCaixaCodForma: TEdit;
    Panel121: TPanel;
    Bt_ConcFechaCaixaFechar: TJvXPButton;
    Bt_ConcFechaCaixaVerifica: TJvXPButton;
    Bt_ConcFechaCaixaSituacao: TJvXPButton;
    Label2: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    EdtConcFechaCaixaSelOper: TEdit;
    Ts_ConcFechaCaixaResultado: TTabSheet;
    Bt_ConcFechaCaixaObs: TJvXPButton;
    ApplicationEvents1: TApplicationEvents;
    PC_ApresResultado: TPageControl;
    Ts_ApresResultado: TTabSheet;
    Ts_ApresResultadoFiltros: TTabSheet;
    Dbg_ConcFechaCaixaResultado: TDBGrid;
    Gb_Credito: TGroupBox;
    Label5: TLabel;
    Bt_BuscaCredito: TJvXPButton;
    Dbg_Credito: TDBGridJul;
    Pan_ConcFechaCaixaResultadoSolic: TPanel;
    Bt_ConcFechaCaixaResultadoSalvaExcel: TJvXPButton;
    Bt_ConcFechaCaixaResultadoClipboard: TJvXPButton;
    Panel3: TPanel;
    Label4: TLabel;
    Label16: TLabel;
    DtEdt_ConcFechaCaixaResultadoInicio: TcxDateEdit;
    DtEdt_ConcFechaCaixaResultadoFim: TcxDateEdit;
    Bt_ConcFechaCaixaResultadoBusca: TJvXPButton;
    Rb_ConcFechaCaixaResultadoLoja: TRadioButton;
    Rb_ConcFechaCaixaResultadoGeral: TRadioButton;
    EdtCodCredito: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PC_PrincipalChange(Sender: TObject);
    procedure EdtConcFechaCaixaCodLojaChange(Sender: TObject);
    procedure EdtConcFechaCaixaCodLojaExit(Sender: TObject);
    procedure Bt_ConcFechaCaixaBuscaLojaClick(Sender: TObject);
    procedure DtEdtConcFechaCaixaDataEnter(Sender: TObject);
    procedure DtEdtConcFechaCaixaDataExit(Sender: TObject);

    //==========================================================================
    // Odir ====================================================================
    //==========================================================================

    // DIVERSOS ////////////////////////////////////////////////////////////////
    function AlinhaEditDireita(Var Edt: TEdit): Boolean;

    Function ConsistePeriodo: Boolean;

    // DIVERSOS ////////////////////////////////////////////////////////////////

    // CONCILIAÇÃO DE CAIXA DIA ////////////////////////////////////////////////
    Function  FechaConcCaixaBuscaMovtoCaixaDia(sCodLoja, sDesLoja: String): Boolean;
    Function  FechaConcCaixaTotalDebitos: Boolean;
    Function  FechaConcCaixaOperadores: Boolean;
    Function  FechaConcCaixaPlanoContas: Boolean;
    Function  FechaConcCaixaMovtosCreditos: Boolean;

    Procedure FechaConcCaixaDiaHabilita(bFechado: Boolean);

    // Busca Movtos do Caixa do Operador =======================================
    Procedure BuscaMovtosCaixaOperador;

    // Totalizadores gCDS_V_Geral.Vlr_Informado ================================
    procedure gCDS_V_GeralAfterScroll(DataSet: TDataSet);
    procedure gCDS_V_GeralAfterOpen(DataSet: TDataSet);
    procedure gCDS_V_GeralAfterDelete(DataSet: TDataSet);

    // Atualiza Valor Informado no Credito =====================================
    Function FechaConcCaixaAtualizaVlrInformado(iNumSeq: Integer): Boolean;

    procedure FechaConcCaixaBuscaCreditos;
    ////////////////////////////////////////////////////////////////////////////

    //==========================================================================
    // Odir ====================================================================
    //==========================================================================

    procedure DtEdtConcFechaCaixaDataKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DtEdtConcFechaCaixaDataPropertiesChange(Sender: TObject);
    procedure Dbg_ConcFechaCaixaDoctosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ConcFechaCaixaTotalDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_ConcFechaCaixaVerificaClick(Sender: TObject);
    procedure Bt_ConcFechaCaixaSituacaoClick(Sender: TObject);
    procedure Bt_ConcFechaCaixaFecharClick(Sender: TObject);
    procedure Dbg_ConcFechaCaixaDoctosColEnter(Sender: TObject);
    procedure PC_ConcFechaCaixaChange(Sender: TObject);
    procedure Dbg_ConcFechaCaixaLancEnter(Sender: TObject);
    procedure Dbg_ConcFechaCaixaLancExit(Sender: TObject);
    procedure Dbg_ConcFechaCaixaLancKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ConcFechaCaixaLancKeyPress(Sender: TObject;
      var Key: Char);
    procedure Dbg_ConcFechaCaixaLancKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtConcFechaCaixaCodOperChange(Sender: TObject);
    procedure EdtConcFechaCaixaCodOperExit(Sender: TObject);
    procedure Bt_ConcFechaCaixaBuscaOperClick(Sender: TObject);
    procedure Bt_ConcFechaCaixaBuscaFormaClick(Sender: TObject);
    procedure EdtConcFechaCaixaCodFormaChange(Sender: TObject);
    procedure EdtConcFechaCaixaCodFormaExit(Sender: TObject);
    procedure EdtConcFechaCaixaCodFormaKeyPress(Sender: TObject;
      var Key: Char);
    procedure Bt_ConcFechaCaixaTransfClick(Sender: TObject);
    procedure Dbg_ConcFechaCaixaDoctosDblClick(Sender: TObject);
    procedure EdtConcFechaCaixaSelOperChange(Sender: TObject);
    procedure Bt_ConcFechaCaixaResultadoBuscaClick(Sender: TObject);
    procedure DtEd_ConcFechaCaixaResultadoInicioPropertiesChange(
      Sender: TObject);
    procedure Rb_ConcFechaCaixaResultadoLojaClick(Sender: TObject);
    procedure Dbg_ConcFechaCaixaResultadoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Bt_ConcFechaCaixaResultadoClipboardClick(Sender: TObject);
    procedure Bt_ConcFechaCaixaResultadoSalvaExcelClick(Sender: TObject);
    procedure Rb_ConcFechaCaixaResultadoLojaKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Rb_ConcFechaCaixaResultadoGeralKeyUp(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Dbg_ConcFechaCaixaDoctosKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Bt_ConcFechaCaixaObsClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure Dbg_ConcFechaCaixaDoctosEnter(Sender: TObject);
    procedure Dbg_ConcFechaCaixaTotalEnter(Sender: TObject);
    procedure Dbg_ConcFechaCaixaResultadoEnter(Sender: TObject);
    procedure PC_ApresResultadoChange(Sender: TObject);
    procedure Bt_BuscaCreditoClick(Sender: TObject);
    procedure Dbg_CreditoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCreditoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    gCDS_V_Geral: TClientDataSet;
    gDS: TDataSource;
  end;

var
  FrmConciliacaoCaixa: TFrmConciliacaoCaixa;

  // Cria Ponteiro de transacão ================================================
  TD: TTransactionDesc;

  bgSairCaixa: Boolean;
  sgCodOper, sgCodLoja, sgCodCred: String;

  bgVlrNegativo: Boolean;

implementation

uses DK_Procs1, UDMBelShop, UDMConexoes, UDMVirtual, UFrmBelShop,
  UPesquisa, UFrmPeriodoApropriacao, UFrmSolicitacoes,
  UFrmSelectEmpProcessamento, UDMBancosConciliacao, ComConst;

{$R *.dfm}

//==============================================================================
// Odir - INICIO ===============================================================
//==============================================================================

// Consiste Período >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmConciliacaoCaixa.ConsistePeriodo: Boolean;
Begin
  Result:=False;

  Try
    StrToDate(DtEdt_ConcFechaCaixaResultadoInicio.Text);
  Except
    msg('Data Inicial do Período Inválida !!','A');
    DtEdt_ConcFechaCaixaResultadoInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_ConcFechaCaixaResultadoFim.Text);
  Except
    msg('Data Final do Período Inválida !!','A');
    DtEdt_ConcFechaCaixaResultadoFim.SetFocus;
    Exit;
  End;

  If DtEdt_ConcFechaCaixaResultadoFim.Date<DtEdt_ConcFechaCaixaResultadoInicio.Date Then
  Begin
    msg('Período Inválido !!','A');
    DtEdt_ConcFechaCaixaResultadoInicio.SetFocus;
    Exit;
  End;

  Result:=True;
End; // Consiste Período >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// DIVERSOS - Alinha Edit a Direita >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
function TFrmConciliacaoCaixa.AlinhaEditDireita(Var Edt: TEdit): Boolean;
var
  n: Integer;
  c: TCanvas;
  h: HWND;
begin
  Result := False;
  Try
    c := TCanvas.Create;
    c.Handle := GetDeviceContext(h);
    c.Font := Edt.Font;
    n := round((Edt.Width - c.TextWidth(Trim(Edt.Text)) - 8) / c.TextWidth( ' '));
    Edt.Text := stringofchar(' ', n) + Trim(Edt.Text);
    Result := True;
  Except
  End;
End; // DIVERSOS - Alinha Edit a Direita >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conciliação de Caixa Dia - Busca Movimentos de Débitos >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmConciliacaoCaixa.FechaConcCaixaBuscaCreditos;
Var
  MySql: String;
  iNrEmpProc: Integer;
  sEmpresas, sCreditos: String;
Begin

  // Solicita Lojas ============================================================
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False;

  FrmSelectEmpProcessamento.ShowModal;

  iNrEmpProc:=FrmSelectEmpProcessamento.iNrEmpProc;

  FrmSelectEmpProcessamento.Free;
  FrmSelectEmpProcessamento:=nil;

  // Verifica se Processa Todas as Empresas ====================================
  sEmpresas:='';
  bgTodasEmpresas:=True;
  DMBelShop.CDS_EmpProcessa.First;
  DMBelShop.CDS_EmpProcessa.DisableControls;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    Application.ProcessMessages;

    If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
     Begin
       // Atualiza sEmpresa para Sql ---------------------------------
       If sEmpresas='' Then
        sEmpresas:=QuotedStr(DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString)
       Else
        sEmpresas:=sEmpresas+', '+QuotedStr(DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString);
     End
    Else // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
     Begin
       bgTodasEmpresas:=False;
     End; // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do
  DMBelShop.CDS_EmpProcessa.EnableControls;
  DMBelShop.CDS_EmpProcessa.First;

  If Trim(sEmpresas)='' Then
  Begin
    msg('SEM Loja Selecionada !!','A');
    Exit;
  End;

  // Creditos Selecionados =====================================================
  sCreditos:='';
  If Not DMVirtual.CDS_V_Creditos.IsEmpty Then
  Begin
    DMVirtual.CDS_V_Creditos.First;
    While Not DMVirtual.CDS_V_Creditos.Eof do
    Begin
      Refresh;

      If sCreditos='' Then
       sCreditos:=QuotedStr(DMVirtual.CDS_V_CreditosCod_Credito.AsString)
      Else
       sCreditos:=sCreditos+', '+
                     QuotedStr(DMVirtual.CDS_V_CreditosCod_Credito.AsString);

      DMVirtual.CDS_V_Creditos.Next;
    End; // While Not DMVirtual.CDS_V_Creditos.Eof do
    DMVirtual.CDS_V_Creditos.First;
  End; // If Not DMVirtual.CDS_V_Creditos.IsEmpty Then

  OdirPanApres.Caption:='AGUARDE !! Busca Movimentos de Créditos';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmConciliacaoCaixa.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmConciliacaoCaixa.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmConciliacaoCaixa;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  sgDtaI:=f_Troca('/','.',DtEdt_ConcFechaCaixaResultadoInicio.Text);
  sgDtaI:=f_Troca('-','.',sgDtaI);
  sgDtaF:=f_Troca('/','.',DtEdt_ConcFechaCaixaResultadoFim.Text);
  sgDtaF:=f_Troca('-','.',sgDtaF);

  If Rb_ConcFechaCaixaResultadoGeral.Checked Then
  Begin
    MySql:=' SELECT ''00'' cod_loja,'+
           ' ''Relação de Créditos Lojas: ''';

           If bgTodasEmpresas Then
            MySql:=
             MySql+'||''TODAS'' razao_social,'
           Else
            MySql:=
             MySql+'||''Bel_: ''||'''+f_Troca('''','',sEmpresas)+''' razao_social,';

    MySql:=
     MySql+''''' cod_credito,'+
           ' ''Período de ''||'+
           QuotedStr(DtEdt_ConcFechaCaixaResultadoInicio.Text)+'|| '' a '' ||'+
           QuotedStr(DtEdt_ConcFechaCaixaResultadoFim.Text)+' des_credito,'+
           ' SUM(c1.vlr_credito) Vlr_Tot_Sidicom,'+
           ' SUM(c1.vlr_informado) Vlr_Tot_Informado,'+
           ' 0 Indice'+
           ' FROM fin_conciliacao_caixa c1'+
           ' WHERE  c1.num_seqreg>6499';

           If Not bgTodasEmpresas Then
            MySql:=
             MySql+' AND    c1.cod_loja IN ('+sEmpresas+')';

    MySql:=
     MySql+' AND    c1.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF)+
           ' AND    c1.cod_credito<9000'+

           'UNION'+

           ' SELECT '''', '''', c.cod_credito,'+
           ' CASE'+
           '   WHEN (TRIM(c.des_credito)='''') OR (TRIM(c.des_credito)=''***'') THEN'+
           '    ''Sem Informação'''+
           '   ELSE'+
           '    TRIM(c.des_credito)'+
           ' END des_credito,'+
           ' SUM(c.vlr_credito) Vlr_Tot_Sidicom,'+
           ' SUM(c.vlr_informado) Vlr_Tot_Informado,'+
           ' 1 Indice'+

           ' FROM FIN_CONCILIACAO_CAIXA c'+
           ' WHERE  c.num_seqreg>6499';

           If Not bgTodasEmpresas Then
            MySql:=
             MySql+' AND    c.cod_loja IN ('+sEmpresas+')';

    MySql:=
     MySql+' AND    c.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF)+
           ' AND    c.cod_credito<9000';

           If Trim(sCreditos)<>'' Then
            MySql:=
             MySql+' AND    c.cod_credito in ('+sCreditos+')';

    MySql:=
     MySql+' GROUP BY 3,4,7'+
           ' ORDER BY 7,4';
  End; // If Rb_ConcFechaCaixaResultadoGeral.Checked Then

  If Rb_ConcFechaCaixaResultadoLoja.Checked Then
  Begin
    MySql:=' SELECT '''' Cod_Loja, '''' Razao_Social,'+
           ' '''' Cod_Credito, '''' des_credito,'+
           ' 0.00 Vlr_Tot_Sidicom, 0.00 Vlr_Tot_Informado,'+
           ' 0 Indice, c2.cod_loja'+
           ' FROM fin_conciliacao_caixa c2'+
           ' WHERE  c2.num_seqreg>6499';

           If Not bgTodasEmpresas Then
            MySql:=
             MySql+' AND    c2.cod_loja IN ('+sEmpresas+')';

    MySql:=
     MySql+' AND    c2.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF)+
           ' AND    c2.cod_credito<9000'+
           ' GROUP BY c2.cod_loja'+

           ' UNION'+

           ' SELECT '''' Cod_Loja, ''Relação de Créditos'' Razao_Social,'+
           ' '''' Cod_Credito,'+
           ' ''Período de ''||'+
           QuotedStr(DtEdt_ConcFechaCaixaResultadoInicio.Text)+'||'' a ''||'+
           QuotedStr(DtEdt_ConcFechaCaixaResultadoFim.Text)+' des_credito,'+
           ' 0.00 Vlr_Tot_Sidicom,'+
           ' 0.00 Vlr_Tot_Informado,'+
           ' 0 Indice, c2.cod_loja'+
           ' FROM fin_conciliacao_caixa c2'+
           ' WHERE  c2.num_seqreg>6499';

           If Not bgTodasEmpresas Then
            MySql:=
             MySql+' AND    c2.cod_loja IN ('+sEmpresas+')';

    MySql:=
     MySql+' AND    c2.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF)+
           ' AND    c2.cod_credito<9000'+
           ' GROUP BY c2.cod_loja'+

           ' UNION'+

           ' SELECT ''Bel_''||c.cod_loja, e.razao_social,'+
           ' '''' cod_credito, '''' des_credito,'+
           ' SUM(c.vlr_credito) Vlr_Tot_Sidicom,'+
           ' SUM(c.vlr_informado) Vlr_Tot_Informado,'+
           ' 2 Indice, c.cod_loja'+
           ' FROM fin_conciliacao_caixa c, emp_conexoes e'+
           ' WHERE  c.cod_loja=e.cod_filial'+
           ' AND    c.num_seqreg>6499';

           If Not bgTodasEmpresas Then
            MySql:=
             MySql+' AND    c.cod_loja IN ('+sEmpresas+')';

    MySql:=
     MySql+' AND    c.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF)+
           ' AND    c.cod_credito<9000'+
           ' GROUP BY 1,2,7,8'+

           ' UNION'+

           ' SELECT '''' cod_loja, '''' razao_social,'+
           ' c1.cod_credito,'+
           ' CASE'+
           '   WHEN (TRIM(c1.des_credito)='''') OR (TRIM(c1.des_credito)=''***'') THEN'+
           '    ''Sem Informação'''+
           '   ELSE'+
           '    TRIM(c1.des_credito)'+
           ' END des_credito,'+
           ' SUM(c1.vlr_credito) Vlr_Tot_Sidicom,'+
           ' SUM(c1.vlr_informado) Vlr_Tot_Informado,'+
           ' 3 Indice, c1.cod_loja'+
           ' FROM fin_conciliacao_caixa c1'+
           ' WHERE  c1.num_seqreg>6499';

           If Not bgTodasEmpresas Then
            MySql:=
             MySql+' AND    c1.cod_loja IN ('+sEmpresas+')';

    MySql:=
     MySql+' AND    c1.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF)+
           ' AND    c1.cod_credito<9000';

           If Trim(sCreditos)<>'' Then
            MySql:=
             MySql+' AND    c1.cod_credito in ('+sCreditos+')';

    MySql:=
     MySql+' GROUP BY 3,4,7,8'+
           ' ORDER BY 8, 7, 1,2,4';
  End; // If Rb_ConcFechaCaixaResultadoLoja.Checked Then

  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If DMBelShop.CDS_BuscaRapida.Eof Then
  Begin
    DMBelShop.CDS_BuscaRapida.Close;
    msg('Sem Movto de Crédito no Período !!','A');
    Exit;
  End;

  TFloatField(DMBelShop.CDS_BuscaRapida.FieldByName('Vlr_Tot_SIDICOM')).DisplayFormat:='0.,00';
  TFloatField(DMBelShop.CDS_BuscaRapida.FieldByName('Vlr_Tot_INFORMADO')).DisplayFormat:='0.,00';

  Dbg_ConcFechaCaixaResultado.DataSource:=DMBelShop.DS_BuscaRapida;

  OdirPanApres.Visible:=False;
  DMBelShop.CDS_BuscaRapida.First;


End; // Conciliação de Caixa Dia - Atualiza Valor Informado no Credito >>>>>>>>>

// Conciliação de Caixa Dia - Atualiza Valor Informado no Credito >>>>>>>>>>>>>>
Function TFrmConciliacaoCaixa.FechaConcCaixaAtualizaVlrInformado(iNumSeq: Integer): Boolean;
Var
  s, MySql: String;
  i: Integer;
Begin
  Result:=False;

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

    s:='NAO';
    If EdtConcFechaCaixaTotal.Value<>0 Then
     s:='SIM';

    // Atualiza Valor Informado no Credito =====================================
    If (bgVlrNegativo) and (EdtConcFechaCaixaTotal.Value>0) Then
     EdtConcFechaCaixaTotal.Value:=EdtConcFechaCaixaTotal.Value*-1;
     
    MySql:=' UPDATE FIN_CONCILIACAO_CAIXA cd'+
           ' SET cd.vlr_informado='+QuotedStr(f_Troca(',','.',VarToStr(EdtConcFechaCaixaTotal.Value)))+
           ', cd.IND_INFORMADO='+QuotedStr(s)+
           ', cd.USU_ALTERA='+QuotedStr(Cod_Usuario)+
           ', cd.DTA_ALTERA=current_timestamp'+
           ' WHERE cd.num_seqreg='+IntToStr(iNumSeq);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Exclui Valores Digitados no Credito FIN_CONCILIACAO_CAIXA_SOMA ==========
    MySql:=' DELETE FROM FIN_CONCILIACAO_CAIXA_SOMA vi'+
           ' WHERE vi.cod_loja='+QuotedStr(FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger))+
           ' AND   vi.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtEdtConcFechaCaixaData.Text)))+
           ' AND   vi.cod_operador='+VarToStr(EdtConcFechaCaixaCodOper.Value)+
           ' AND   vi.cod_credito='+EdtConcFechaCaixaCodForma.Text;
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Inclui Novos Valores Digitados no Credito FIN_CONCILIACAO_CAIXA_SOMA ====
    i:=0;
    gCDS_V_Geral.First;
    gCDS_V_Geral.DisableControls;
    While Not gCDS_V_Geral.Eof do
    Begin
      Application.ProcessMessages;

      Inc(i);

      If gCDS_V_Geral.FieldByName('VLR_INFORMADO').AsCurrency<>0 Then
      Begin
        MySql:=' INSERT INTO FIN_CONCILIACAO_CAIXA_SOMA'+
               ' (NUM_SEQ, COD_LOJA, DTA_CAIXA, COD_OPERADOR, COD_CREDITO, VLR_INFORMADO, USU_INCLUI, DTA_INCLUI)'+
               ' VALUES ('+
               IntToStr(i)+', '+ // NUM_SEQ
               QuotedStr(FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger))+', '+ // COD_LOJA
               QuotedStr(f_Troca('/','.',f_Troca('-','.',DtEdtConcFechaCaixaData.Text)))+', '+ // DTA_CAIXA
               QuotedStr(FormatFloat('00',EdtConcFechaCaixaCodOper.AsInteger))+', '+ // COD_OPERADOR
               QuotedStr(EdtConcFechaCaixaCodForma.Text)+', '+ // COD_CREDITO
               QuotedStr(f_Troca(',','.',gCDS_V_Geral.FieldByName('VLR_INFORMADO').AsString))+', '+ // VLR_INFORMADO
               QuotedStr(Cod_Usuario)+', '+ // USU_INCLUI
               'current_timestamp)';
        DMBelShop.SQLC.Execute(MySql,nil,nil);
      End; // If gCDS_V_Geral.FieldByName('VLR_INFORMADO').AsCurrency<>0 Then

      gCDS_V_Geral.Next;
    End; // While Not gCDS_V_Geral.Eof do
    gCDS_V_Geral.EnableControls;
    gCDS_V_Geral.First;

    // Atualiza Transacao ======================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;
    Result:=True;

    i:=DMConciliacao.CDS_ConcCaixa.RecNo;
    DMConciliacao.CDS_ConcCaixa.Close;
    DMConciliacao.CDS_ConcCaixaTotais.Close;
    DMConciliacao.CDS_ConcCaixa.Open;
    DMConciliacao.CDS_ConcCaixaTotais.Open;
    DMConciliacao.CDS_ConcCaixa.RecNo:=i;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try


End; // Conciliação de Caixa Dia - Atualiza Valor Informado no Credito >>>>>>>>>

// Conciliação de Caixa Dia - Totalizadores gCDS_V_Geral.Vlr_Informado >>>>>>>>>
procedure TFrmConciliacaoCaixa.gCDS_V_GeralAfterScroll(DataSet: TDataSet);
Begin
  Try
     EdtConcFechaCaixaTotal.Value:=gCDS_V_Geral.Aggregates[0].Value;
  Except
  End;
End; // Conciliação de Caixa Dia - Totalizadores gCDS_V_Geral.Vlr_Informado >>>>

procedure TFrmConciliacaoCaixa.gCDS_V_GeralAfterOpen(DataSet: TDataSet);
Begin
  TCurrencyField(gCDS_V_Geral.FieldByName('Vlr_Informado')).DisplayFormat:='0,.00';
End; // Conciliação de Caixa Dia - Totalizadores gCDS_V_Geral.Vlr_Informado >>>>

procedure TFrmConciliacaoCaixa.gCDS_V_GeralAfterDelete(DataSet: TDataSet);
Begin
  If gCDS_V_Geral.IsEmpty Then
  Begin
    gCDS_V_Geral.Append;
    gCDS_V_Geral.FieldByName('VLR_INFORMADO').AsCurrency:=0;
    gCDS_V_Geral.Post;
    gCDS_V_Geral.Last;
  End
End; // Conciliação de Caixa Dia - Totalizadores gCDS_V_Geral.Vlr_Informado >>>>

// Conciliação de Caixa Dia - Busca Movtos do Caixa do Operador >>>>>>>>>>>>>>>>
Procedure TFrmConciliacaoCaixa.BuscaMovtosCaixaOperador;
Var
  MySql: String;
Begin
  EdtConcFechaCaixaTotal.Value:=0;
  If gCDS_V_Geral<>nil Then
  Begin
    gCDS_V_Geral.Free;
    gCDS_V_Geral:=nil;
    gDS.Free;
    gDS:=nil;
  End;

  try
    gCDS_V_Geral:=TClientDataSet.Create(Self);
  Except
    gCDS_V_Geral.EmptyDataSet;
  End;
  gDS:=TDataSource.Create(Self);

  gCDS_V_Geral.FieldDefs.Clear;

  gCDS_V_Geral.FieldDefs.Add('Vlr_Informado',ftCurrency);

  with gCDS_V_Geral.Aggregates.Add do
    begin
      AggregateName := 'Vlr_Total';
      Expression := 'SUM(Vlr_Informado)';
      //GroupingLevel := 0;
      //IndexName := 'MyIndex';
      Active := True;
    end;
  gCDS_V_Geral.AggregatesActive:=True;

  gCDS_V_Geral.AfterScroll:=gCDS_V_GeralAfterScroll;
  gCDS_V_Geral.AfterPost:=gCDS_V_GeralAfterOpen;
  gCDS_V_Geral.AfterDelete:=gCDS_V_GeralAfterDelete;
  gCDS_V_Geral.CreateDataSet;

  gCDS_V_Geral.Open;


  gDS.DataSet:=gCDS_V_Geral;
  Dbg_ConcFechaCaixaLanc.DataSource:=gDS;

  MySql:=' SELECT Cast(s.vlr_informado as Numeric(12,2)) vlr_informado'+
         ' FROM FIN_CONCILIACAO_CAIXA_SOMA s'+
         ' WHERE s.cod_loja='+QuotedStr(FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger))+
         ' AND   s.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtEdtConcFechaCaixaData.Text)))+
         ' AND   s.cod_operador='+VarToStr(EdtConcFechaCaixaCodOper.Value)+
         ' AND   s.cod_credito='+EdtConcFechaCaixaCodForma.Text+
         ' ORDER BY s.num_seq';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('vlr_informado').AsString)='' Then
   Begin
     gCDS_V_Geral.Append;
     gCDS_V_Geral.FieldByName('VLR_INFORMADO').AsCurrency:=0.00;
     gCDS_V_Geral.Post;
   End
  Else
   Begin
     gCDS_V_Geral.Data:=DMBelShop.CDS_BuscaRapida.Data;
     gCDS_V_Geral.Last;
   End;

  DMBelShop.CDS_BuscaRapida.Close;
End; // Conciliação de Caixa Dia - Busca Movtos do Caixa do Operador >>>>>>>>>>>

// Conciliação de Caixa Dia - Habilita Caixa Aberta/Fechada >>>>>>>>>>>>>>>>>>>>
Procedure TFrmConciliacaoCaixa.FechaConcCaixaDiaHabilita(bFechado: Boolean);
Begin
  Bt_ConcFechaCaixaSituacao.Enabled:=True;

  Pan_ConcFechaCaixaSituacao.Caption:='';
  Pan_ConcFechaCaixaSituacao.Font.Color:=clWhite;

  If bFechado Then
   Begin
     Dbg_ConcFechaCaixaDoctos.ReadOnly:=True;
     Pan_ConcFechaCaixaSituacao.Caption:='Caixa Fechado';
     Pan_ConcFechaCaixaSituacao.Color:=clBlue;
     Bt_ConcFechaCaixaSituacao.Caption:='Abrir Caixa';
   End
  Else
   Begin
     Dbg_ConcFechaCaixaDoctos.ReadOnly:=False;
     Pan_ConcFechaCaixaSituacao.Caption:='Caixa Aberto';
     Pan_ConcFechaCaixaSituacao.Color:=clRed;
     Bt_ConcFechaCaixaSituacao.Caption:='Fechar Caixa';
   End;
End; // Conciliação de Caixa Dia - Habilita Caixa Aberta/Fechada >>>>>>>>>>>>>>>

// Fechamento de Caixa Dia - Busca Plano de Contas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmConciliacaoCaixa.FechaConcCaixaPlanoContas: Boolean;
Var
  MySql: String;
  i: Integer;
  sDta: String;
Begin
  Result:=False;

  sDta:=f_Troca('/', '.',DtEdtConcFechaCaixaData.Text);
  sDta:=f_Troca('-', '.',sDta);

  // Busca Cadastro de Créditos ================================================
  MySql:=' SELECT f.codforma,'+
         ' CASE'+
         '   When Trim(f.nomeforma)<>'''' Then'+
         '      f.nomeforma'+
         '   Else'+
         '      ''Sem Informação'''+
         ' END nomeforma'+
         ' FROM FORMAPGTO f'+
         ' order by 2';
  FrmBelShop.IBQ_ConsultaFilial.Close;
  FrmBelShop.IBQ_ConsultaFilial.SQL.Clear;
  FrmBelShop.IBQ_ConsultaFilial.SQL.Add(MySql);

  // Abre Query ---------------------------------------------------
  i:=0;
  bgSiga:=False;
  While Not bgSiga do
  Begin
    Try
      FrmBelShop.IBQ_ConsultaFilial.Open;
      bgSiga:=True;
    Except
      Inc(i);
    End; // Try

    If i>10 Then
    Begin
      FrmBelShop.IBQ_ConsultaFilial.Close;
      OdirPanApres.Visible:=False;
      msg('Conexão Perdida !!'+cr+'Loja: '+sCodFilial+' !!','A');
      Break;
    End; // If i>10 Then
  End; // While Not bSiga do

  // Atualiza Contas ===========================================================
  If bgSiga Then // Query Executada
  Begin

    // Verifica se Transação esta Ativa
    If DMBelShop.SQLC.InTransaction Then
     DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
      DateSeparator:='.';
      DecimalSeparator:='.';

      // Busca Cadastro de Operadores -------------------------------
      MySql:=' SELECT cx.cod_operador'+
             ' FROM FIN_CONCILIACAO_CAIXAS cx'+
             ' WHERE cx.cod_loja='+QuotedStr(sCodFilial)+
             ' AND   cx.dta_caixa='+QuotedStr(sDta);
      DMBelShop.CDS_Busca.Close;
      DMBelShop.SDS_Busca.CommandText:=MySql;
      DMBelShop.CDS_Busca.Open;

      DMBelShop.CDS_Busca.First;
      DMBelShop.CDS_Busca.DisableControls;
      While Not DMBelShop.CDS_Busca.Eof do
      Begin
        FrmBelShop.IBQ_ConsultaFilial.First;
        FrmBelShop.IBQ_ConsultaFilial.DisableControls;
        While Not FrmBelShop.IBQ_ConsultaFilial.Eof do
        Begin
          Application.ProcessMessages;

          // Conciliação do Caixa da Loja --------------------------------
          MySql:=' SELECT cx.cod_credito'+
                 ' FROM FIN_CONCILIACAO_CAIXA cx'+
                 ' WHERE cx.cod_loja='+QuotedStr(sCodFilial)+
                 ' AND   cx.dta_caixa='+QuotedStr(sDta)+
                 ' AND   cx.Cod_Credito='+FrmBelShop.IBQ_ConsultaFilial.FieldByName('CodForma').AsString+
                 ' AND   cx.Cod_Operador='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('cod_operador').AsString);
          DMBelShop.CDS_BuscaRapida.Close;
          DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
          DMBelShop.CDS_BuscaRapida.Open;

          If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('cod_credito').AsString)='' Then
           Begin
             MySql:=' INSERT INTO FIN_CONCILIACAO_CAIXA'+
                    ' (NUM_SEQREG, NUM_SEQ, COD_LOJA, DTA_CAIXA, COD_OPERADOR,'+
                    '  COD_CREDITO, DES_CREDITO, USU_INCLUI)'+
                    ' VALUES ('+
                    'GEN_ID(GEN_CONCILIACAO_CAIXA,1), '+ //  NUM_SEQREG
                    '1, '+ // NUM_SEQ
                    QuotedStr(sCodFilial)+', '+ // COD_LOJA
                    QuotedStr(sDta)+', '+ // DTA_CAIXA
                    QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Operador').AsString)+', '+ // COD_OPERADOR
                    QuotedStr(FrmBelShop.IBQ_ConsultaFilial.FieldByName('CodForma').AsString)+', '+ // COD_CREDITO
                    QuotedStr(Trim(FrmBelShop.IBQ_ConsultaFilial.FieldByName('NomeForma').AsString))+', '+ // DES_CREDITO
                    QuotedStr(Cod_Usuario)+')'; // USU_INCLUI
           End
          Else // If not DMBelShop.CDS_BuscaRapida.Locate('cod_credito',FrmBelShop.IBQ_ConsultaFilial.FieldByName('CodForma').AsInteger,[]) Then
           Begin
             MySql:=' UPDATE FIN_CONCILIACAO_CAIXA cx'+
                    ' Set cx.Vlr_Credito=0'+
                    ', cx.DES_CREDITO='+QuotedStr(Trim(FrmBelShop.IBQ_ConsultaFilial.FieldByName('NomeForma').AsString))+
                    ', cx.USU_ALTERA='+QuotedStr(Cod_Usuario)+
                    ', cx.DTA_ALTERA=current_timestamp'+
                    ' WHERE cx.cod_loja='+QuotedStr(sCodFilial)+
                    ' AND   cx.dta_caixa='+QuotedStr(sDta)+
                    ' AND   cx.Cod_Credito='+FrmBelShop.IBQ_ConsultaFilial.FieldByName('CodForma').AsString+
                    ' AND   cx.Cod_Operador='+QuotedStr(DMBelShop.CDS_Busca.FieldByName('cod_operador').AsString);
           End;  // If not DMBelShop.CDS_BuscaRapida.Locate('cod_credito',FrmBelShop.IBQ_ConsultaFilial.FieldByName('CodForma').AsInteger,[]) Then
          DMBelShop.SQLC.Execute(MySql,nil,nil);

          FrmBelShop.IBQ_ConsultaFilial.Next;
        End; // While Not FrmBelShop.IBQ_ConsultaFilial.Eof do
        FrmBelShop.IBQ_ConsultaFilial.EnableControls;
        DMBelShop.CDS_BuscaRapida.Close;

        DMBelShop.CDS_Busca.Next;
      End; // While Not DMBelShop.CDS_Busca.Eof do
      DMBelShop.CDS_Busca.EnableControls;
      DMBelShop.CDS_Busca.Close;

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      Result:=True;
      DateSeparator:='/';
      DecimalSeparator:=',';
    Except
      on e : Exception do
      Begin
        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        OdirPanApres.Visible:=False;

        bgSiga:=False;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try
  End; // If bSiga Then // Query Executada
  FrmBelShop.IBQ_ConsultaFilial.Close;

End; // Fechamento de Caixa Dia - Busca Plano de Contas >>>>>>>>>>>>>>>>>>>>>>>>

// Conciliação de Caixa Dia - Busca Operadores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function  TFrmConciliacaoCaixa.FechaConcCaixaOperadores: Boolean;
Var
  MySql: String;
  i: Integer;
  sDta: String;
Begin
  Result:=False;

  sDta:=f_Troca('/', '.',DtEdtConcFechaCaixaData.Text);
  sDta:=f_Troca('-', '.',sDta);

  MySql:=' SELECT cx.codcaixa, cx.nomecaixa'+
         ' FROM CAIXA cx'+
         ' ORDER BY 1';
  FrmBelShop.IBQ_ConsultaFilial.Close;
  FrmBelShop.IBQ_ConsultaFilial.SQL.Clear;
  FrmBelShop.IBQ_ConsultaFilial.SQL.Add(MySql);

  // Abre Query ---------------------------------------------------
  i:=0;
  bgSiga:=False;
  While Not bgSiga do
  Begin
    Try
      FrmBelShop.IBQ_ConsultaFilial.Open;
      bgSiga:=True;
    Except
      Inc(i);
    End; // Try

    If i>10 Then
    Begin
      FrmBelShop.IBQ_ConsultaFilial.Close;
      OdirPanApres.Visible:=False;
      msg('Conexão Perdida !!'+cr+'Loja: '+sCodFilial+' !!','A');
      Break;
    End; // If i>10 Then
  End; // While Not bSiga do

  // Atualiza Contas ===========================================================
  If bgSiga Then // Query Executada
  Begin
    // Verifica se Transação esta Ativa
    If DMBelShop.SQLC.InTransaction Then
     DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
      DateSeparator:='.';
      DecimalSeparator:='.';

      FrmBelShop.IBQ_ConsultaFilial.DisableControls;
      While Not FrmBelShop.IBQ_ConsultaFilial.Eof do
      Begin
        Application.ProcessMessages;

        // Conciliação do Caixa da Loja --------------------------------
        MySql:=' SELECT cx.cod_operador'+
               ' FROM FIN_CONCILIACAO_CAIXAS cx'+
               ' WHERE cx.cod_loja='+QuotedStr(sCodFilial)+
               ' AND   cx.dta_caixa='+QuotedStr(sDta)+
               ' AND   cx.cod_operador='+QuotedStr(FrmBelShop.IBQ_ConsultaFilial.FieldByName('CodCaixa').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Operador').AsString)='' Then
        Begin
          MySql:=' INSERT INTO FIN_CONCILIACAO_CAIXAS'+
                 ' (NUM_SEQ, COD_LOJA, DTA_CAIXA, COD_OPERADOR, DES_OPERADOR)'+
                 ' VALUES ('+

                 '(SELECT COALESCE(MAX(cx.num_seq)+1 ,1) FROM fin_conciliacao_caixas cx)'+', '+ // NUM_SEQ
                 QuotedStr(sCodFilial)+', '+ // COD_LOJA
                 QuotedStr(sDta)+', '+ // DTA_CAIXA
                 QuotedStr(FrmBelShop.IBQ_ConsultaFilial.FieldByName('CodCaixa').AsString)+', '+ // COD_OPERADOR
                 QuotedStr(Trim(FrmBelShop.IBQ_ConsultaFilial.FieldByName('nomecaixa').AsString))+')'; // DES_OPERADOR
          DMBelShop.SQLC.Execute(MySql,nil,nil);
        End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Operador').AsString)='' Then Then
        DMBelShop.CDS_BuscaRapida.Close;

        FrmBelShop.IBQ_ConsultaFilial.Next;
      End; // While Not FrmBelShop.IBQ_ConsultaFilial.Eof do
      FrmBelShop.IBQ_ConsultaFilial.EnableControls;

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      Result:=True;
      DateSeparator:='/';
      DecimalSeparator:=',';

    Except
      on e : Exception do
      Begin
        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        OdirPanApres.Visible:=False;

        bgSiga:=False;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try
  End; // If bSiga Then // Query Executada
  FrmBelShop.IBQ_ConsultaFilial.Close;

End; // Conciliação de Caixa Dia - Busca Operadores >>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conciliação de Caixa Dia - Busca Total de Déditos >>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmConciliacaoCaixa.FechaConcCaixaTotalDebitos: Boolean;
Var
  MySql: String;
  i: Integer;
  sDta: String;
  sTotDebitos: String;
Begin
  Result:=False;

  sDta:=f_Troca('/', '.',DtEdtConcFechaCaixaData.Text);
  sDta:=f_Troca('-', '.',sDta);

  MySql:=' Select sum(Coalesce(m.totnota,0)) Tot_Debitos'+
         ' From MCLI m, COMPRV c'+
         ' Where m.codcomprovante=c.codcomprovante'+
         ' And m.codcomprovante='+QuotedStr('002');

         If sCodFilial<>'11' Then
          MySql:=
           MySql+' And m.codfilial='+QuotedStr(sCodFilial)
         Else
          MySql:=
           MySql+' And m.codfilial='+QuotedStr('02');

  MySql:=
   MySql+' And m.datacomprovante='+QuotedStr(sDta);
  FrmBelShop.IBQ_ConsultaFilial.Close;
  FrmBelShop.IBQ_ConsultaFilial.SQL.Clear;
  FrmBelShop.IBQ_ConsultaFilial.SQL.Add(MySql);

  // Abre Query ---------------------------------------------------
  i:=0;
  bgSiga:=False;
  While Not bgSiga do
  Begin
    Try
      FrmBelShop.IBQ_ConsultaFilial.Open;
      bgSiga:=True;
    Except
      Inc(i);
    End; // Try

    If i>10 Then
    Begin
      FrmBelShop.IBQ_ConsultaFilial.Close;
      OdirPanApres.Visible:=False;
      msg('Conexão Perdida !!'+cr+'Loja: '+sCodFilial+' !!','A');
      Break;
    End; // If i>10 Then
  End; // While Not bSiga do

  // Atualiza Contas ===========================================================
  If bgSiga Then // Query Executada
  Begin
     sTotDebitos:=FrmBelShop.IBQ_ConsultaFilial.FieldByName('Tot_Debitos').AsString;
     If sTotDebitos='' Then
      sTotDebitos:='0';

    // Verifica se Transação esta Ativa
    If DMBelShop.SQLC.InTransaction Then
     DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao ===========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
      DateSeparator:='.';
      DecimalSeparator:='.';

      MySql:=' SELECT cx.cod_credito'+
             ' FROM FIN_CONCILIACAO_CAIXA cx'+
             ' where cx.Cod_Credito=''9999'''+
             ' And   cx.cod_loja='+QuotedStr(sCodFilial)+
             ' And   cx.dta_caixa='+QuotedStr(sDta);
      DMBelShop.CDS_BuscaRapida.Close;
      DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
      DMBelShop.CDS_BuscaRapida.Open;

      If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('cod_credito').AsString)='' Then
       Begin
         MySql:=' INSERT INTO FIN_CONCILIACAO_CAIXA'+
                ' (NUM_SEQREG, NUM_SEQ, COD_LOJA, DTA_CAIXA, COD_OPERADOR,'+
                '  COD_CREDITO, DES_CREDITO,  VLR_CREDITO, VLR_INFORMADO, VLR_DIFERENCA,'+
                '  IND_INFORMADO, IND_FECHADO, USU_INCLUI)'+
                ' VALUES ('+
                'GEN_ID(GEN_CONCILIACAO_CAIXA,1), '+ // NUM_SEQREG
                '9999, '+ // NUM_SEQ
                QuotedStr(sCodFilial)+', '+ // COD_LOJA
                QuotedStr(sDta)+', '+ // DTA_CAIXA
                QuotedStr('9999')+', '+ // COD_OPERADOR
                QuotedStr('9999')+', '+ // COD_CREDITO
                QuotedStr('Débitos/Crébitos do Dia')+', '+ // DES_CREDITO
                f_Troca(',','.',sTotDebitos)+', '+ // VLR_CREDITO
                '0,'+ // VLR_INFORMADO
                '0-'+f_Troca(',','.',sTotDebitos)+', '+ // VLR_DIFERENCA
                QuotedStr('NAO')+', '+ // IND_INFORMADO
                QuotedStr('NAO')+', '+ // IND_FECHADO
                QuotedStr(Cod_Usuario)+')'; // USU_INCLUI
         DMBelShop.SQLC.Execute(MySql,nil,nil);
       End
      Else // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('cod_credito').AsString)='' Then
       Begin
         MySql:=' UPDATE FIN_CONCILIACAO_CAIXA cx'+
                ' Set cx.VLR_CREDITO='+f_Troca(',','.',sTotDebitos)+
                ', cx.VLR_DIFERENCA=cx.VLR_INFORMADO-'+f_Troca(',','.',sTotDebitos)+
                ', cx.USU_ALTERA='+QuotedStr(Cod_Usuario)+
                ', cx.DTA_ALTERA=current_timestamp'+
                ' WHERE cx.Cod_Loja='+QuotedStr(sCodFilial)+
                ' AND   cx.Dta_Caixa='+QuotedStr(sDta)+
                ' AND   cx.Cod_Credito=''9999''';
         DMBelShop.SQLC.Execute(MySql,nil,nil);
       End; // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('cod_credito').AsString)='' Then

      DMBelShop.CDS_BuscaRapida.Close;

      // Exclui Movimentos Sem Forma de Pagamento Anteriores (cod_credito=999) ==
      MySql:=' DELETE FROM FIN_CONCILIACAO_CAIXA cx'+
             ' WHERE cx.cod_credito=999'+
             ' AND   cx.cod_loja='+QuotedStr(sCodFilial)+
             ' AND   cx.dta_caixa='+QuotedStr(sDta);
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      Result:=True;
      DateSeparator:='/';
      DecimalSeparator:=',';
    Except
      on e : Exception do
      Begin
        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        OdirPanApres.Visible:=False;

        bgSiga:=False;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try
  End; // If bSiga Then // Query Executada
  FrmBelShop.IBQ_ConsultaFilial.Close;

End; // Conciliação de Caixa Dia - Busca Total de Déditos >>>>>>>>>>>>>>>>>>>>>>

// Conciliação de Caixa Dia - Busca Movtos de Créditos >>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmConciliacaoCaixa.FechaConcCaixaMovtosCreditos: Boolean;
Var
  MySql: String;
  i: Integer;
  sDta, sVlrTotal: String;
Begin
  Result:=False;

  sDta:=f_Troca('/', '.',DtEdtConcFechaCaixaData.Text);
  sDta:=f_Troca('-', '.',sDta);

  MySql:=' SELECT'+
         ' mv.codcaixa Cod_Operador, cx.nomecaixa Des_Operador,'+

         ' CASE'+
         '   WHEN fo.nomeforma is Null THEN'+
         '    ''999'''+
         '   ELSE'+
         '     TRIM(mf.codforma)'+
         ' END CodForma,'+

         ' CASE'+
         '   WHEN fo.nomeforma is Null THEN'+
         '     ''DOCTO SEM FORMA DE PAGTO'''+
         '   ELSE'+
         '     TRIM(fo.nomeforma)'+
         ' END NomeForma,'+
         ' SUM(COALESCE(mf.valordaforma,0)) Vlr_Total'+

         ' FROM MCLI mv'+
         '   LEFT JOIN MCLIFORMA mf  ON mf.chavenf=mv.chavenf'+
         '   LEFT JOIN FORMAPGTO fo  ON fo.codforma=mf.codforma'+
         '   LEFT JOIN CAIXA     cx  ON cx.codcaixa=mv.codcaixa'+

         ' WHERE mv.datadocumento='+QuotedStr(sDta)+
         ' AND   mv.codcomprovante='+QuotedStr('002');

         If sCodFilial<>'11' Then
          MySql:=
           MySql+' AND   mv.codfilial='+QuotedStr(sCodFilial)
         Else
          MySql:=
           MySql+' AND   mv.codfilial='+QuotedStr('02');

  MySql:=
   MySql+' GROUP BY 1,2,3,4'+
         ' ORDER BY 1,3';
  FrmBelShop.IBQ_ConsultaFilial.Close;
  FrmBelShop.IBQ_ConsultaFilial.SQL.Clear;
  FrmBelShop.IBQ_ConsultaFilial.SQL.Add(MySql);

  // Abre Query ---------------------------------------------------
  i:=0;
  bgSiga:=False;
  While Not bgSiga do
  Begin
    Try
      FrmBelShop.IBQ_ConsultaFilial.Open;
      bgSiga:=True;
    Except
      Inc(i);
    End; // Try

    If i>10 Then
    Begin
      FrmBelShop.IBQ_ConsultaFilial.Close;
      OdirPanApres.Visible:=False;
      msg('Conexão Perdida !!'+cr+'Loja: '+sCodFilial+' !!','A');
      Break;
    End; // If i>10 Then
  End; // While Not bSiga do

  // Atualiza Contas =========================================================
  If bgSiga Then // Query Executada
  Begin

    // Verifica se Transação esta Ativa
    If DMBelShop.SQLC.InTransaction Then
     DMBelShop.SQLC.Rollback(TD);

    // Monta Transacao ===========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMBelShop.SQLC.StartTransaction(TD);
    Try
      DateSeparator:='.';
      DecimalSeparator:='.';

      FrmBelShop.IBQ_ConsultaFilial.DisableControls;
      While Not FrmBelShop.IBQ_ConsultaFilial.Eof do
      Begin
        Application.ProcessMessages;

        sVlrTotal:=Trim(f_Troca(',','.',FrmBelShop.IBQ_ConsultaFilial.FieldByName('Vlr_Total').AsString));
        If sVlrTotal='' Then
         sVlrTotal:='0';

        // Conciliação do Caixa da Loja --------------------------------
        MySql:=' SELECT cx.cod_credito'+
               ' FROM FIN_CONCILIACAO_CAIXA cx'+
               ' WHERE cx.cod_loja='+QuotedStr(sCodFilial)+
               ' AND   cx.dta_caixa='+QuotedStr(sDta)+
               ' AND   cx.cod_operador='+QuotedStr(FrmBelShop.IBQ_ConsultaFilial.FieldByName('Cod_Operador').AsString)+
               ' AND   cx.cod_credito='+QuotedStr(FrmBelShop.IBQ_ConsultaFilial.FieldByName('CodForma').AsString);
        DMBelShop.CDS_BuscaRapida.Close;
        DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
        DMBelShop.CDS_BuscaRapida.Open;

        If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('cod_credito').AsString)='' Then
         Begin
           MySql:=' INSERT INTO FIN_CONCILIACAO_CAIXA'+
                  ' (NUM_SEQREG, NUM_SEQ, COD_LOJA, DTA_CAIXA, COD_OPERADOR,'+
                  '  COD_CREDITO, DES_CREDITO, VLR_CREDITO,'+
                  ' USU_INCLUI)'+

                  ' VALUES ('+
                  'GEN_ID(GEN_CONCILIACAO_CAIXA,1), '+ // NUM_SEQREG
                  '1, '+ // NUM_SEQ
                  QuotedStr(sCodFilial)+', '+ // COD_LOJA
                  QuotedStr(sDta)+', '+ // DTA_CAIXA
                  QuotedStr(FrmBelShop.IBQ_ConsultaFilial.FieldByName('Cod_Operador').AsString)+', '+ // COD_OPERADOR
                  FrmBelShop.IBQ_ConsultaFilial.FieldByName('CodForma').AsString+', '+ // COD_CREDITO
                  QuotedStr(Trim(FrmBelShop.IBQ_ConsultaFilial.FieldByName('NomeForma').AsString))+', '+ // DES_CREDITO
                  f_Troca(',','.',sVlrTotal)+', '+ // VLR_CREDITO
                  QuotedStr(Cod_Usuario)+')'; // USU_INCLUI
         End // If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('cod_credito').AsString)='' Then
        Else
         Begin
           MySql:=' UPDATE FIN_CONCILIACAO_CAIXA'+
                  ' SET VLR_CREDITO='+f_Troca(',','.',sVlrTotal)+
                  ', DES_CREDITO='+QuotedStr(Trim(FrmBelShop.IBQ_ConsultaFilial.FieldByName('NomeForma').AsString))+
                  ', USU_ALTERA='+QuotedStr(Cod_Usuario)+
                  ', DTA_ALTERA=current_timestamp'+

                  ' WHERE COD_LOJA='+QuotedStr(sCodFilial)+
                  ' AND   DTA_CAIXA='+QuotedStr(sDta)+
                  ' AND   COD_CREDITO='+FrmBelShop.IBQ_ConsultaFilial.FieldByName('codForma').AsString+
                  ' AND   COD_OPERADOR='+QuotedStr(FrmBelShop.IBQ_ConsultaFilial.FieldByName('Cod_Operador').AsString);
         End; // If not DMBelShop.CDS_BuscaRapida.Locate('cod_credito',FrmBelShop.IBQ_ConsultaFilial.FieldByName('CodForma').AsInteger,[]) Then
        DMBelShop.SQLC.Execute(MySql,nil,nil);

        FrmBelShop.IBQ_ConsultaFilial.Next;
      End; // While Not FrmBelShop.IBQ_ConsultaFilial.Eof do
      FrmBelShop.IBQ_ConsultaFilial.EnableControls;
      DMBelShop.CDS_BuscaRapida.Close;

      // Atualiza Transacao =======================================
      DMBelShop.SQLC.Commit(TD);

      Result:=True;
      DateSeparator:='/';
      DecimalSeparator:=',';
    Except
      on e : Exception do
      Begin
        // Abandona Transacao =====================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        OdirPanApres.Visible:=False;

        bgSiga:=False;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      End; // on e : Exception do
    End; // Try
  End; // If bSiga Then // Query Executada
  FrmBelShop.IBQ_ConsultaFilial.Close;

End; // Conciliação de Caixa Dia - Busca Movtos de Créditos >>>>>>>>>>>>>>>>>>>>

// Fechamento de Caixa Dia - Busca Movtos do Caixa do Dia da Loja >>>>>>>>>>>>>>
Function TFrmConciliacaoCaixa.FechaConcCaixaBuscaMovtoCaixaDia(sCodLoja, sDesLoja: String): Boolean;
Begin
  Result:=False;
  sCodFilial:=FormatFloat('00',StrToInt(sCodLoja));

  // Conecta Empresa individual ================================================
  If ConexaoEmpIndividual('IBDB_'+sCodFilial, 'IBT_'+sCodFilial, 'A') Then
   Begin
     bgSiga:=True;
   End
  Else // If ConexaoEmpIndividual('IBDB_'+sCodFilial, 'IBT_'+sCodFilial, 'A') Then
   Begin
     Refresh;
     bgSiga:=False;
   End; // If ConexaoEmpIndividual('IBDB_'+sCodFilial, 'IBT_'+sCodFilial, 'A') Then

  If not bgSiga Then
  Begin
    msg('ERRO na Conexão da Loja: Bel_'+sCodFilial,'A');
    Exit;
  End;

  // Inicia Processamento ======================================================
  If bgSiga Then // Empresa Conectada
  Begin
    // Cria Query da Empresa ----------------------------------------
    FrmBelShop.CriaQueryIB('IBDB_'+sCodFilial,'IBT_'+sCodFilial,FrmBelShop.IBQ_ConsultaFilial, True, True);

    // Conciliação de Caixa Dia - Busca Total de Déditos -------------
    OdirPanApres.Caption:='AGUARDE !! Parte 1/4 - Busca Total de Déditos da Loja: '+sCodFilial+' - '+sDesLoja;
    OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
    OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmConciliacaoCaixa.Width-OdirPanApres.Width)/2));
    OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmConciliacaoCaixa.Height-OdirPanApres.Height)/2))-20;
    OdirPanApres.Font.Style:=[fsBold];
    OdirPanApres.Parent:=FrmConciliacaoCaixa;
    OdirPanApres.BringToFront();
    OdirPanApres.Visible:=True;
    Refresh;
    Screen.Cursor:=crAppStart;

    If Not FechaConcCaixaTotalDebitos Then
     Exit;

    // Conciliação de Caixa Dia - Busca Operadores -------------------
    If bgSiga Then
    Begin
      OdirPanApres.Caption:='AGUARDE !! Parte 2/4 - Busca Operadores da Loja: '+sCodFilial+' - '+sDesLoja;
      OdirPanApres.Visible:=True;
      Refresh;

      If Not FechaConcCaixaOperadores Then
      Begin
        Screen.Cursor:=crDefault;
        Exit;
      End;
    End;

    // Conciliação de Caixa Dia - Busca Plano de Contas --------------
    If bgSiga Then
    Begin
      OdirPanApres.Caption:='AGUARDE !! Parte 3/4 - Busca Plano de Contas da Loja: '+sCodFilial+' - '+sDesLoja;
      OdirPanApres.Visible:=True;
      Refresh;

      If Not FechaConcCaixaPlanoContas Then
      Begin
        Screen.Cursor:=crDefault;
        Exit;
      End;
    End;

    // Conciliação de Caixa Dia - Busca Movtos de Créditos -----------
    If bgSiga Then
    Begin
      OdirPanApres.Caption:='AGUARDE !! Parte 4/4 - Busca Movtos de Créditos da Loja: '+sCodFilial+' - '+sDesLoja;
      OdirPanApres.Visible:=True;
      Refresh;

      If Not FechaConcCaixaMovtosCreditos Then
      Begin
        Screen.Cursor:=crDefault;
        Exit;
      End;

      Result:=True;
    End; // If bgSiga Then
  End; //If bSiga Then // Empresa Conectada

  // Fecha Conexão =========================================================
  ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F');

  OdirPanApres.Visible:=False;
  Screen.Cursor:=crDefault;

End; // Fechamento de Caixa Dia - Busca Movtos do Caixa do Dia da Loja >>>>>>>>>

//==============================================================================
// Odir - FIM ==================================================================
//==============================================================================

procedure TFrmConciliacaoCaixa.FormKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TFrmConciliacaoCaixa.FormShow(Sender: TObject);
begin
  bEnterTab:=True;
  bgSairCaixa:=False;

  try
    DMVirtual.CDS_V_Creditos.CreateDataSet;
    DMVirtual.CDS_V_Creditos.Open;
  Except
    DMVirtual.CDS_V_Creditos.EmptyDataSet;
    DMVirtual.CDS_V_Creditos.Open;
  End;

  If (PC_Principal.ActivePage=Ts_ConciliacaoCaixa) And (Ts_ConciliacaoCaixa.CanFocus) Then
   EdtConcFechaCaixaCodLoja.SetFocus;

end;

procedure TFrmConciliacaoCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Not bgSairCaixa Then
  Begin
    DMVirtual.CDS_V_Creditos.Close;
    PC_ConcFechaCaixa.TabIndex:=0;
    PC_ConcFechaCaixaChange(Self);
    msg('Para Fechar Tecle no Botão <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  FrmBelShop.FechaTudo;
  DMConciliacao.FechaTudoConciliacao;

  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);
end;

procedure TFrmConciliacaoCaixa.PC_PrincipalChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Principal);

  If (PC_Principal.ActivePage=Ts_ConciliacaoCaixa) And (Ts_ConciliacaoCaixa.CanFocus) Then
   EdtConcFechaCaixaCodLoja.SetFocus;

end;

procedure TFrmConciliacaoCaixa.EdtConcFechaCaixaCodLojaChange(Sender: TObject);
begin
  EdtConcFechaCaixaDesLoja.Clear;
  EdtConcFechaCaixaCodOper.Clear;
  EdtConcFechaCaixaDesOper.Clear;
  EdtConcFechaCaixaCodForma.Clear;
  EdtConcFechaCaixaDesForma.Clear;
  DtEdtConcFechaCaixaData.Clear;

  Pan_ConcFechaCaixaSituacao.Caption:='';
  Pan_ConcFechaCaixaSituacao.Color:=clBtnFace;
  Pan_ConcFechaCaixaSituacao.Font.Color:=clWindowText;

  Bt_ConcFechaCaixaSituacao.Enabled:=False;
  Bt_ConcFechaCaixaSituacao.Caption:='';

  sgCodOper:='';
  sgCodLoja:='';
  sgCodCred:='';

  DMConciliacao.FechaTudoConciliacao;

end;

procedure TFrmConciliacaoCaixa.EdtConcFechaCaixaCodLojaExit(Sender: TObject);
Var
  MySql: String;
begin

  EdtConcFechaCaixaDesLoja.Clear;
         
  If EdtConcFechaCaixaCodLoja.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
           ' From EMP_CONEXOES'+
           ' Where (IND_ATIVO='+QuotedStr('SIM')+' Or COD_FILIAL='+QuotedStr('98')+')'+
           ' And COD_FILIAL='+QuotedStr(FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger));
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('RAZAO_SOCIAL').AsString)='' Then
    Begin
      msg('Loja NÃO Encontrada !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtConcFechaCaixaCodLoja.Clear;
      EdtConcFechaCaixaCodLoja.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;

    EdtConcFechaCaixaDesLoja.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('Razao_Social').AsString;
    DtEdtConcFechaCaixaData.SetFocus;

    DMBelShop.CDS_BuscaRapida.Close;

    Screen.Cursor:=crDefault;
  End;

end;

procedure TFrmConciliacaoCaixa.Bt_ConcFechaCaixaBuscaLojaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtConcFechaCaixaCodLoja.Clear;
  EdtConcFechaCaixaDesLoja.Clear;
  EdtConcFechaCaixaCodOper.Clear;
  EdtConcFechaCaixaDesOper.Clear;
  EdtConcFechaCaixaCodForma.Clear;
  EdtConcFechaCaixaDesForma.Clear;

  Pan_ConcFechaCaixaSituacao.Caption:='';
  Pan_ConcFechaCaixaSituacao.Color:=clBtnFace;
  Pan_ConcFechaCaixaSituacao.Font.Color:=clWindowText;

  Bt_ConcFechaCaixaSituacao.Enabled:=False;
  Bt_ConcFechaCaixaSituacao.Caption:='';

  DMConciliacao.FechaTudoConciliacao;

  EdtConcFechaCaixaCodLoja.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' Select COD_FILIAL, RAZAO_SOCIAL'+
         ' From EMP_CONEXOES'+
         ' Where (IND_ATIVO='+QuotedStr('SIM')+' Or COD_FILIAL='+QuotedStr('98')+')'+
         ' Order by RAZAO_SOCIAL';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('RAZAO_SOCIAL').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Loja a Listar !!','A');
    EdtConcFechaCaixaCodLoja.SetFocus;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Razao_Social';
  FrmPesquisa.Campo_Codigo:='Cod_Filial';
  FrmPesquisa.Campo_Descricao:='Razao_Social';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtConcFechaCaixaCodLoja.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtConcFechaCaixaCodLojaExit(Self);
     DtEdtConcFechaCaixaData.SetFocus;
   End
  Else
   Begin
     EdtConcFechaCaixaCodLoja.SetFocus;
   End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmConciliacaoCaixa.DtEdtConcFechaCaixaDataEnter(Sender: TObject);
begin
  If Trim(EdtConcFechaCaixaDesLoja.Text)='' Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtConcFechaCaixaCodLoja.SetFocus;
    Exit;
  End;

end;

procedure TFrmConciliacaoCaixa.DtEdtConcFechaCaixaDataExit(Sender: TObject);
Var
  sDta: String;
  MySql: String;
  bFechado: Boolean;
begin
  PC_ConcFechaCaixa.TabIndex:=0;
  PC_ConcFechaCaixaChange(Self);
  If Trim(DtEdtConcFechaCaixaData.Text)='' Then
  Begin
    EdtConcFechaCaixaCodLoja.Clear;
    EdtConcFechaCaixaDesLoja.Clear;
    EdtConcFechaCaixaCodLoja.SetFocus;
    Exit;
  End;

  If DtEdtConcFechaCaixaData.Date<StrToDate('01/01/2014') Then
  Begin
    msg('Data Inválida !!'+cr+cr+'Ano Menor que 2014 !!','A');
    DtEdtConcFechaCaixaData.SetFocus;
    Exit;
  End;

  If DataHoraServidorFI(DMBelShop.SDS_DtaHoraServidor)<DtEdtConcFechaCaixaData.Date Then
  Begin
    msg('Data Inválida !!'+cr+cr+'Maior que Hoje !!','A');
    DtEdtConcFechaCaixaData.SetFocus;
    Exit;
  End;

  // Busca Doctos da Loja ======================================================
  sDta:=f_Troca('/','.',DtEdtConcFechaCaixaData.Text);
  sDta:=f_Troca('-','.',sDta);

  sCodFilial:=FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger);

  // Verifica Fechamento do Caixa ==============================================
  MySql:=' select c.Num_SeqReg, c.ind_fechado'+
         ' from FIN_CONCILIACAO_CAIXA c'+
         ' where c.cod_credito=9999'+
         ' and c.cod_loja='+QuotedStr(sCodFilial)+
         ' and c.dta_caixa='+QuotedStr(sDta);
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Not DMBelShop.CDS_BuscaRapida.IsEmpty Then
  Begin
    If DMBelShop.CDS_BuscaRapida.FieldByName('Num_SeqReg').AsInteger<6500 Then
    Begin
      msg('Impossível Alterar !!'+cr+cr+'Caixa Sistema Anterior !!','A');
      EdtConcFechaCaixaCodLoja.SetFocus;
      Exit;
    End;
  End; // If Not DMBelShop.CDS_BuscaRapida.IsEmpty Then

  If DMBelShop.CDS_BuscaRapida.FieldByName('Ind_Fechado').AsString='SIM' Then
   bFechado:=True
  Else
   bFechado:=False;
  DMBelShop.CDS_BuscaRapida.Close;

  FechaConcCaixaDiaHabilita(bFechado);

  // Busca Dados da Loja =======================================================
  If Not bFechado Then
  Begin
    If msg('Deseja Buscar Movimento do'+cr+cr+'CAIXA no SIDICOM ???','C')=1 Then
    Begin
      If Not FechaConcCaixaBuscaMovtoCaixaDia(EdtConcFechaCaixaCodLoja.Text, EdtConcFechaCaixaDesLoja.Text) Then
      Begin
        EdtConcFechaCaixaCodLoja.SetFocus;
        Exit;
      End;
    End;
  End; // If Not bFechado Then

  // Apresenta Movimentos ======================================================
  MySql:=' SELECT'+
         ' cx.num_seqreg, cx.NUM_SEQ, cx.COD_LOJA, cx.DTA_CAIXA, cx.COD_OPERADOR, op.des_operador,'+
         ' cx.COD_CREDITO, cx.DES_CREDITO,'+
         ' Cast(cx.VLR_CREDITO as Numeric(15,2)) VLR_CREDITO,'+
         ' Cast(cx.VLR_INFORMADO as Numeric(15,2)) VLR_INFORMADO,'+
         ' Cast(cx.VLR_DIFERENCA as Numeric(15,2)) VLR_DIFERENCA,'+
         ' CASE'+
         '   when cx.ind_informado=''SIM'' and cx.vlr_diferenca>0 and cx.cod_credito<>9998 Then'+
         '     ''Valor Informado MENOR que Valor de Crédito'''+
         '   when CX.ind_informado=''SIM'' and cx.vlr_diferenca<0 and cx.cod_credito<>9998 Then'+
         '     ''Valor Informado MAIOR que Valor de Crédito'''+
         '   when CX.ind_informado=''SIM'' and cx.cod_credito<>9998 Then'+
         '     ''Valores Informados e de Créditos FECHADOS'''+
         '   When cx.cod_credito<>9998 Then'+
         '     ''Valor NÃO Informado'''+
         '   when cx.vlr_diferenca>0 and cx.cod_credito=9998 Then'+
         '     ''Valor Informado MENOR que Valor de Crédito'''+
         '   when cx.vlr_diferenca<0 and cx.cod_credito=9998 Then'+
         '     ''Valor Informado MAIOR que Valor de Crédito'''+
         '   when cx.cod_credito=9998 Then'+
         '     ''Valores Informados e de Créditos FECHADOS'''+
         ' END obs,'+
         ' cx.IND_INFORMADO,'+
         ' cx.IND_FECHADO, cx.USU_INCLUI, cx.DTA_INCLUI, cx.USU_ALTERA, cx.DTA_ALTERA'+

         ' FROM FIN_CONCILIACAO_CAIXA cx'+
         '    LEFT JOIN FIN_CONCILIACAO_CAIXAS op  ON op.cod_loja=cx.cod_loja'+
         '                                        AND op.dta_caixa=cx.dta_caixa'+
         '                                        AND op.cod_operador=cx.cod_operador'+

         ' WHERE cx.cod_credito<9999'+
         ' AND   cx.Cod_Loja ='+QuotedStr(FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger))+
         ' AND   cx.dta_caixa='+QuotedStr(sDta)+
         ' ORDER BY cx.cod_operador, cx.COD_CREDITO, cx.NUM_SEQ';
  DMConciliacao.CDS_ConcCaixa.Close;
  DMConciliacao.SDS_ConcCaixa.CommandText:=MySql;
  DMConciliacao.CDS_ConcCaixa.Open;

  If DMConciliacao.CDS_ConcCaixa.IsEmpty Then
  Begin
    DMConciliacao.CDS_ConcCaixa.Close;
    msg('Caixa Sem Movimento !!','A');
    EdtConcFechaCaixaCodLoja.SetFocus;
    Exit;
  End;

  Dbg_ConcFechaCaixaDoctos.SelectedIndex:=5;

  MySql:=' SELECT cx.cod_credito, cx.des_credito,'+
         ' cx.vlr_credito, cx.vlr_informado, cx.vlr_diferenca,'+
         ' CASE'+
         '   when cx.obs_texto is not null Then'+
         '     cx.obs_texto'+
         '   when cx.vlr_diferenca>0 Then'+
         '     ''Vlr Débito MENOR que Vlr Crédito'''+
         '   when cx.vlr_diferenca<0 Then'+
         '     ''Vlr Débito MAIOR que Vlr Crédito'''+
         ' ELSE'+
         '     ''Vlr Débitos e Créditos FECHADOS'''+
         ' END obs,'+
         ' cx.IND_INFORMADO, cx.USU_INCLUI'+

         ' FROM FIN_CONCILIACAO_CAIXA cx'+
         ' Where cx.cod_credito=9999'+
         ' and   cx.Cod_Loja ='+QuotedStr(FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger))+
         ' and   cx.dta_caixa='+QuotedStr(sDta)+

         ' Order by cx.IND_INFORMADO desc, cx.DES_CREDITO';
  DMConciliacao.CDS_ConcCaixaTotais.Close;
  DMConciliacao.SDS_ConcCaixaTotais.CommandText:=MySql;
  DMConciliacao.CDS_ConcCaixaTotais.Open;

  PC_ConcFechaCaixa.TabIndex:=0;
  PC_ConcFechaCaixaChange(Self);

  Dbg_ConcFechaCaixaDoctos.SetFocus;

end;

procedure TFrmConciliacaoCaixa.DtEdtConcFechaCaixaDataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key=VK_F9 Then
   Bt_ConcFechaCaixaBuscaLojaClick(Self);

end;

procedure TFrmConciliacaoCaixa.DtEdtConcFechaCaixaDataPropertiesChange(Sender: TObject);
begin
  Pan_ConcFechaCaixaSituacao.Caption:='';
  Pan_ConcFechaCaixaSituacao.Color:=clBtnFace;
  Pan_ConcFechaCaixaSituacao.Font.Color:=clWindowText;

  Bt_ConcFechaCaixaSituacao.Enabled:=False;
  Bt_ConcFechaCaixaSituacao.Caption:='';

  DMConciliacao.CDS_ConcCaixa.Close;
  DMConciliacao.CDS_ConcCaixaTotais.Close;

end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaDoctosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If Not DMConciliacao.CDS_ConcCaixa.IsEmpty Then
  Begin
    if not (gdSelected in State) Then
    Begin
      if DMConciliacao.CDS_ConcCaixaCOD_CREDITO.AsString='9998' then
       Dbg_ConcFechaCaixaDoctos.Canvas.Brush.Color:=clSkyBlue;
    End;

    If (Column.FieldName='VLR_DIFERENCA') Then
    Begin
      if DMConciliacao.CDS_ConcCaixaVLR_DIFERENCA.AsCurrency<>0 then
      Begin
        Dbg_ConcFechaCaixaDoctos.Canvas.Font.Color:=clWhite;
        Dbg_ConcFechaCaixaDoctos.Canvas.Brush.Color:=clRed;
      End;
    End;

    If (Column.FieldName='VLR_INFORMADO') Then
    Begin
      if DMConciliacao.CDS_ConcCaixaVLR_INFORMADO.AsCurrency<>0 then
       Dbg_ConcFechaCaixaDoctos.Canvas.Font.Style:=[fsBold];
    End;

    Dbg_ConcFechaCaixaDoctos.Canvas.FillRect(Rect);
    Dbg_ConcFechaCaixaDoctos.DefaultDrawDataCell(Rect,Column.Field,state);
  End; // If Not DMConciliacao.CDS_ConcCaixa.IsEmpty Then
end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaTotalDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If (Column.FieldName='VLR_DIFERENCA') Then
  Begin
    if DMConciliacao.CDS_ConcCaixaTotaisVLR_DIFERENCA.AsCurrency<>0 then
    Begin
      Dbg_ConcFechaCaixaTotal.Canvas.Brush.Color:=clRed;
      Dbg_ConcFechaCaixaTotal.Canvas.Font.Color:=clWhite;
    End;
  End;

  Dbg_ConcFechaCaixaTotal.Canvas.FillRect(Rect);
  Dbg_ConcFechaCaixaTotal.DefaultDrawDataCell(Rect,Column.Field,state);

end;

procedure TFrmConciliacaoCaixa.Bt_ConcFechaCaixaVerificaClick(Sender: TObject);
begin
  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  If EdtConcFechaCaixaCodLoja.AsInteger=0 Then
  Begin
    msg('Informe a Loja a Verificar'+cr+cr+'os Movtos de Caixa','A');
    EdtConcFechaCaixaCodLoja.SetFocus;
    Exit;
  End;

  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  FrmSolicitacoes.Caption:='CONCILIAÇÃO DE CAIXA DIA';
  FrmSolicitacoes.sgCodLoja:=FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger);
  FrmSolicitacoes.sgTpFechaCaixa:='C';
  FrmSolicitacoes.dgDtaCalendario:=DtEdtConcFechaCaixaData.Date;

  FrmBelShop.AbreSolicitacoes(5);

  FrmSolicitacoes.ShowModal;
  FrmSolicitacoes.Free;
  FrmSolicitacoes:=nil;

end;

procedure TFrmConciliacaoCaixa.Bt_ConcFechaCaixaSituacaoClick(Sender: TObject);
Var
  MySql: String;
  sDta, s: String;
begin
  OdirPanApres.Caption:='AGUARDE !! Verificando Fechamento do Caixa...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmConciliacaoCaixa.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmConciliacaoCaixa.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmConciliacaoCaixa;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica Fechamento do Caixa ==============================================
  If Bt_ConcFechaCaixaSituacao.Caption='Fechar Caixa' Then
   Begin
     s:='NAO';
     DMConciliacao.CDS_ConcCaixa.First;
     DMConciliacao.CDS_ConcCaixa.DisableControls;
     While Not DMConciliacao.CDS_ConcCaixa.Eof do
     Begin
       If DMConciliacao.CDS_ConcCaixaIND_INFORMADO.AsString='SIM' Then
       Begin
         s:='SIM';
         Break;
       End;
       DMConciliacao.CDS_ConcCaixa.Next;
     End; // While Not DMConciliacao.CDS_ConcCaixa.Eof do
     DMConciliacao.CDS_ConcCaixa.EnableControls;
     DMConciliacao.CDS_ConcCaixa.First;

     If s='NAO' Then
     Begin
       OdirPanApres.Visible:=False;
       msg('Impossível Fechar Caixa do Dia'+cr+cr+'SEM Lançamento Informado !!','A');
       Exit;
     End;

     s:='SIM'
   End
  Else
   Begin
     s:='NAO';
   End;

  sDta:=f_Troca('/','.',DtEdtConcFechaCaixaData.Text);
  sDta:=f_Troca('-','.',sDta);

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

    MySql:=' UPDATE FIN_CONCILIACAO_CAIXA c'+
           ' SET c.ind_fechado='+QuotedStr(s)+
           ', c.USU_ALTERA='+QuotedStr(Cod_Usuario)+
           ', c.DTA_ALTERA=current_timestamp'+
           ' WHERE c.cod_loja='+QuotedStr(sCodFilial)+
           ' AND   c.dta_caixa='+QuotedStr(sDta);
    DMBelShop.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao =======================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;
    OdirPanApres.Visible:=False;

  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      OdirPanApres.Visible:=False;
      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      exit;
    End; // on e : Exception do
  End; // Try

  FechaConcCaixaDiaHabilita(s='SIM');

end;

procedure TFrmConciliacaoCaixa.Bt_ConcFechaCaixaFecharClick(
  Sender: TObject);
begin
  bgSairCaixa:=True;
  Close;
end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaDoctosColEnter(
  Sender: TObject);
begin
  If Not DMConciliacao.CDS_ConcCaixa.IsEmpty Then
   Dbg_ConcFechaCaixaDoctos.SelectedIndex:=5;
end;

procedure TFrmConciliacaoCaixa.PC_ConcFechaCaixaChange(Sender: TObject);
begin
//  If Trim(EdtConcFechaCaixaDesLoja.Text)='' Then
//  Begin
//    msg('Favor Informar a Loja !!','A');
//    PC_ConcFechaCaixa.TabIndex:=0;
//    PC_ConcFechaCaixaChange(Self);
//    EdtConcFechaCaixaCodLoja.SetFocus;
//    Exit;
//  End;

  DMBelShop.CDS_BuscaRapida.Close;
  CorSelecaoTabSheet(PC_ConcFechaCaixa);

  If PC_ConcFechaCaixa.TabIndex=0 Then
  Begin
    Dbg_ConcFechaCaixaDoctos.SetFocus;
    Exit;
  End; // PC_ConcFechaCaixa.TabIndex=0

  If PC_ConcFechaCaixa.TabIndex=1 Then
  Begin
    // Nao Permite digitação com Caixa Fechado =================================
    If Pan_ConcFechaCaixaSituacao.Caption='Caixa Fechado' Then
    Begin
      EdtConcFechaCaixaCodOper.Clear;
      EdtConcFechaCaixaDesOper.Clear;
      EdtConcFechaCaixaCodForma.Clear;
      EdtConcFechaCaixaDesForma.Clear;
      EdtConcFechaCaixaTotal.Value:=0;

      If gCDS_V_Geral<>nil Then
      Begin
        gCDS_V_Geral.Free;
        gCDS_V_Geral:=nil;
        gDS.Free;
        gDS:=nil;
      End;

      Pan_ConcFechaCaixaLanc.Enabled:=False;
      msg('Caixa Fechado !!','A');
      Exit;
    End; // If Pan_ConcFechaCaixaSituacao.Caption='Caixa Fechado' Then

    Pan_ConcFechaCaixaLanc.Enabled:=True;
    If Trim(EdtConcFechaCaixaDesLoja.Text)=''  Then
    Begin
      EdtConcFechaCaixaCodLoja.SetFocus;
      Exit;
    End;

    If Trim(EdtConcFechaCaixaDesOper.Text)=''  Then
    Begin
      EdtConcFechaCaixaCodOper.SetFocus;
      Exit;
    End;

    If Trim(EdtConcFechaCaixaDesForma.Text)=''  Then
    Begin
      EdtConcFechaCaixaCodForma.SetFocus;
      Exit;
    End;

    If gCDS_V_Geral<>nil Then
    Begin
      DMConciliacao.CDS_ConcCaixa.First;
      if not DMConciliacao.CDS_ConcCaixa.Locate('COD_CREDITO;COD_LOJA;COD_OPERADOR',VarArrayOf([sgCodCred, sgCodLoja, sgCodOper]),[]) Then
       Begin
         EdtConcFechaCaixaCodForma.SetFocus;
       End
      Else
       Begin
         Dbg_ConcFechaCaixaLanc.SetFocus;
       End;
    End;
  End; // If PC_ConcFechaCaixa.TabIndex=1 Then

  If PC_ConcFechaCaixa.TabIndex=2 Then
  Begin
    DtEdt_ConcFechaCaixaResultadoInicio.SetFocus;
    Exit;
  End; // PC_ConcFechaCaixa.TabIndex=2

end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaLancEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_ConcFechaCaixaLancEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

  bEnterTab:=False;
end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaLancExit(Sender: TObject);
begin
  bEnterTab:=True;

end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaLancKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key=40 Then
  Begin
    MyKey:=#40;
    Dbg_ConcFechaCaixaLancKeyPress(Self, MyKey);
  End;

end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaLancKeyPress(
  Sender: TObject; var Key: Char);
begin
  If (key=#13) Or (key=#40) Then
  Begin
    If gCDS_V_Geral.FieldByName('VLR_INFORMADO').AsCurrency<>0 Then
     Begin
       If gCDS_V_Geral.RecNo=gCDS_V_Geral.RecordCount Then
        Begin
          gCDS_V_Geral.Append;
          gCDS_V_Geral.FieldByName('VLR_INFORMADO').AsCurrency:=0;
          gCDS_V_Geral.Post;
          gCDS_V_Geral.Last;
        End
       Else
        Begin
          gCDS_V_Geral.Next;
        End; // If gCDS_V_Geral.RecNo=gCDS_V_Geral.RecordCount Then
      End
     Else // If gCDS_V_Geral.FieldByName('VLR_INFORMADO').AsCurrency<>0 Then
      Begin
        gCDS_V_Geral.Next;
      End; // If gCDS_V_Geral.FieldByName('VLR_INFORMADO').AsCurrency<>0 Then
  End; // If key=#13 Then

end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaLancKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If (key=40) And (Trim(gCDS_V_Geral.FieldByName('VLR_INFORMADO').AsString)='')Then
  Begin
    gCDS_V_Geral.Delete;
  End;

end;

procedure TFrmConciliacaoCaixa.EdtConcFechaCaixaCodOperChange(Sender: TObject);
begin
  EdtConcFechaCaixaDesOper.Clear;
  EdtConcFechaCaixaCodForma.Clear;
  EdtConcFechaCaixaDesForma.Clear;

  sgCodOper:='';
  sgCodLoja:='';
  sgCodCred:='';
  EdtConcFechaCaixaTotal.Value:=0;

  If gCDS_V_Geral<>nil Then
  Begin
    gCDS_V_Geral.Free;
    gCDS_V_Geral:=nil;
    gDS.Free;
    gDS:=nil;
  End;

end;

procedure TFrmConciliacaoCaixa.EdtConcFechaCaixaCodOperExit(
  Sender: TObject);
Var
  MySql: String;
begin
  If Trim(EdtConcFechaCaixaDesForma.Text)<>'' Then
   Exit;

  If EdtConcFechaCaixaCodLoja.Value=0 Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtConcFechaCaixaCodLoja.SetFocus;
    Exit;
  End;

  If Trim(DtEdtConcFechaCaixaData.Text)='' Then
  Begin
    msg('Favor Informar a Data do Caixa !!','A');
    DtEdtConcFechaCaixaData.SetFocus;
    Exit;
  End;

  EdtConcFechaCaixaDesOper.Clear;
  EdtConcFechaCaixaCodForma.Clear;
  EdtConcFechaCaixaDesForma.Clear;
  EdtConcFechaCaixaTotal.Value:=0;

  If gCDS_V_Geral<>nil Then
  Begin
    gCDS_V_Geral.Free;
    gCDS_V_Geral:=nil;
    gDS.Free;
    gDS:=nil;
  End;

  If EdtConcFechaCaixaCodOper.Value<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Lojas =============================================================
    MySql:=' SELECT op.des_operador'+
           ' FROM FIN_CONCILIACAO_CAIXAS op'+
           ' WHERE op.COD_LOJA='+QuotedStr(FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger))+
           ' AND op.DTA_CAIXA='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtEdtConcFechaCaixaData.Text)))+
           ' AND op.COD_OPERADOR='+VarToStr(EdtConcFechaCaixaCodOper.Value);
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;

    If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('des_operador').AsString)='' Then
    Begin
      msg('Operador de Caixa NÃO Encontrado !!!', 'A');
      Screen.Cursor:=crDefault;
      EdtConcFechaCaixaCodOper.Clear;
      EdtConcFechaCaixaCodOper.SetFocus;
      DMBelShop.CDS_BuscaRapida.Close;
      Exit;
    End;

    EdtConcFechaCaixaDesOper.Text:=DMBelShop.CDS_BuscaRapida.FieldByName('des_operador').AsString;
    EdtConcFechaCaixaCodForma.SetFocus;

    DMBelShop.CDS_BuscaRapida.Close;

    Screen.Cursor:=crDefault;
  End;

end;

procedure TFrmConciliacaoCaixa.Bt_ConcFechaCaixaBuscaOperClick(
  Sender: TObject);
Var
  MySql: String;
begin
  If EdtConcFechaCaixaCodLoja.Value=0 Then
  Begin
    msg('Favor Informar a Loja !!','A');
    EdtConcFechaCaixaCodLoja.SetFocus;
    Exit;
  End;

  If Trim(DtEdtConcFechaCaixaData.Text)='' Then
  Begin
    msg('Favor Informar a Data do Caixa !!','A');
    DtEdtConcFechaCaixaData.SetFocus;
    Exit;
  End;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtConcFechaCaixaCodOper.Clear;
  EdtConcFechaCaixaDesOper.Clear;
  EdtConcFechaCaixaCodForma.Clear;
  EdtConcFechaCaixaDesForma.Clear;
  EdtConcFechaCaixaTotal.Value:=0;

  If gCDS_V_Geral<>nil Then
  Begin
    gCDS_V_Geral.Free;
    gCDS_V_Geral:=nil;
    gDS.Free;
    gDS:=nil;
  End;

  EdtConcFechaCaixaCodOper.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT op.des_operador, op.cod_operador'+
         ' FROM FIN_CONCILIACAO_CAIXAS op'+
         ' WHERE op.COD_LOJA='+QuotedStr(FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger))+
         ' AND op.DTA_CAIXA='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtEdtConcFechaCaixaData.Text)))+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('des_operador').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Operador de Caixa a Listar !!','A');
    EdtConcFechaCaixaCodOper.SetFocus;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='des_operador';
  FrmPesquisa.Campo_Codigo:='cod_operador';
  FrmPesquisa.Campo_Descricao:='des_operador';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtConcFechaCaixaCodOper.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtConcFechaCaixaCodOperExit(Self);
   End
  Else
   Begin
     EdtConcFechaCaixaCodOper.SetFocus;
   End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;

end;

procedure TFrmConciliacaoCaixa.Bt_ConcFechaCaixaBuscaFormaClick(
  Sender: TObject);
Var
  MySql: String;
begin
  If EdtConcFechaCaixaCodOper.Value=0 Then
  Begin
    msg('Favor Informar o Operador de Caixa !!','A');
    EdtConcFechaCaixaCodOper.SetFocus;
    Exit;
  End;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtConcFechaCaixaCodForma.Clear;
  EdtConcFechaCaixaDesForma.Clear;
  EdtConcFechaCaixaTotal.Value:=0;

  If gCDS_V_Geral<>nil Then
  Begin
    gCDS_V_Geral.Free;
    gCDS_V_Geral:=nil;
    gDS.Free;
    gDS:=nil;
  End;

  EdtConcFechaCaixaCodForma.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT cd.des_credito, cd.cod_credito'+
         ' FROM fin_conciliacao_caixa cd'+
         ' WHERE cd.cod_credito<999'+
         ' AND   cd.cod_loja='+QuotedStr(FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger))+
         ' AND   cd.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DtEdtConcFechaCaixaData.Text)))+
         ' AND   cd.cod_operador='+VarToStr(EdtConcFechaCaixaCodOper.Value)+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('cod_credito').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Movto de Caixa a Listar !!','A');
    EdtConcFechaCaixaCodForma.SetFocus;
    FrmPesquisa.Free;
    FrmPesquisa:=nil;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='des_credito';
  FrmPesquisa.Campo_Codigo:='cod_credito';
  FrmPesquisa.Campo_Descricao:='des_credito';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
   Begin
     EdtConcFechaCaixaCodForma.Text:=FrmPesquisa.EdtCodigo.Text;
     EdtConcFechaCaixaCodFormaExit(Self);
   End
  Else
   Begin
     EdtConcFechaCaixaCodForma.SetFocus;
   End;

  FrmPesquisa.Free;
  FrmPesquisa:=nil;
end;

procedure TFrmConciliacaoCaixa.EdtConcFechaCaixaCodFormaChange(Sender: TObject);
begin
  EdtConcFechaCaixaDesForma.Clear;

  sgCodOper:='';
  sgCodLoja:='';
  sgCodCred:='';
  EdtConcFechaCaixaTotal.Value:=0;

  If gCDS_V_Geral<>nil Then
  Begin
    gCDS_V_Geral.Free;
    gCDS_V_Geral:=nil;
    gDS.Free;
    gDS:=nil;
  End;

end;

procedure TFrmConciliacaoCaixa.EdtConcFechaCaixaCodFormaExit(Sender: TObject);
begin
  If EdtConcFechaCaixaCodOper.Value=0 Then
  Begin
    msg('Favor Informar o Operador de Caixa !!','A');
    EdtConcFechaCaixaCodOper.SetFocus;
    Exit;
  End;

  EdtConcFechaCaixaDesForma.Clear;
  EdtConcFechaCaixaTotal.Value:=0;

  If gCDS_V_Geral<>nil Then
  Begin
    gCDS_V_Geral.Free;
    gCDS_V_Geral:=nil;
    gDS.Free;
    gDS:=nil;
  End;

  If Trim(EdtConcFechaCaixaCodForma.Text)='' Then
   Exit;

  If StrToInt(EdtConcFechaCaixaCodForma.Text)<999 Then
   Begin
     Screen.Cursor:=crAppStart;

     // Busca Lojas =============================================================
     sgCodOper:=FormatFloat('00',EdtConcFechaCaixaCodOper.AsInteger);
     sgCodLoja:=FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger);
     sgCodCred:=EdtConcFechaCaixaCodForma.Text;
     if not DMConciliacao.CDS_ConcCaixa.Locate('COD_CREDITO;COD_LOJA;COD_OPERADOR',VarArrayOf([sgCodCred, sgCodLoja, sgCodOper]),[]) Then
     Begin
       msg('Operador/Forma de Pagamento'+cr+'NÃO Encontrado !!!', 'A');
       Screen.Cursor:=crDefault;
       EdtConcFechaCaixaCodForma.Clear;
       EdtConcFechaCaixaCodOper.SetFocus;
       Exit;
     End;

     EdtConcFechaCaixaDesForma.Text:=DMConciliacao.CDS_ConcCaixaDES_CREDITO.AsString;

     bgVlrNegativo:=False;
     If DMConciliacao.CDS_ConcCaixaVLR_CREDITO.AsCurrency<0 Then
      bgVlrNegativo:=True;

     // Busca Movtos ============================================================
     BuscaMovtosCaixaOperador;

     Dbg_ConcFechaCaixaLanc.SetFocus;

     Screen.Cursor:=crDefault;
   End
  Else // If StrToInt(EdtConcFechaCaixaCodForma.Text)<999 Then
   Begin
     EdtConcFechaCaixaCodForma.Clear;
     EdtConcFechaCaixaCodOper.SetFocus;
   End; // If StrToInt(EdtConcFechaCaixaCodForma.Text)<999 Then

end;

procedure TFrmConciliacaoCaixa.EdtConcFechaCaixaCodFormaKeyPress(Sender: TObject; var Key: Char);
begin
  If not (key in ['0'..'9']) then
  Begin
    Key := #0;
    Exit;
  End;
end;

procedure TFrmConciliacaoCaixa.Bt_ConcFechaCaixaTransfClick(Sender: TObject);
Var
 iNumSeqReg: Integer;
begin

  If (gCDS_V_Geral=nil) Or (gCDS_V_Geral.IsEmpty) Then
   Exit;
   
  gCDS_V_Geral.Last;
  gCDS_V_Geral.First;

  DMConciliacao.CDS_ConcCaixa.First;
  if not DMConciliacao.CDS_ConcCaixa.Locate('COD_CREDITO;COD_LOJA;COD_OPERADOR',VarArrayOf([sgCodCred, sgCodLoja, sgCodOper]),[]) Then
   Begin
     msg('Problema de Localização da'+cr+'Forma de Pagamento !!'+cr+cr+'Entrar em Contato com o Odir !!','A');
     Exit;
   End
  Else
   Begin
     iNumSeqReg:=DMConciliacao.CDS_ConcCaixaNUM_SEQREG.AsInteger;

     // Atualiza Vlr_Informa no Credito ========================================
     If FechaConcCaixaAtualizaVlrInformado(iNumSeqReg) Then
     Begin
       EdtConcFechaCaixaCodForma.Clear;
       EdtConcFechaCaixaCodForma.SetFocus;
     End;
   End;

end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaDoctosDblClick(
  Sender: TObject);
begin
  If DMConciliacao.CDS_ConcCaixaCOD_CREDITO.AsInteger<999 Then
  Begin
    PC_ConcFechaCaixa.TabIndex:=1;
    CorSelecaoTabSheet(PC_ConcFechaCaixa);

    EdtConcFechaCaixaCodOper.Value:=DMConciliacao.CDS_ConcCaixaCOD_OPERADOR.AsInteger;
    EdtConcFechaCaixaCodOperExit(Self);

    EdtConcFechaCaixaCodForma.Text:=DMConciliacao.CDS_ConcCaixaCOD_CREDITO.AsString;
    EdtConcFechaCaixaCodFormaExit(Self);
  End; // If DMConciliacao.CDS_ConcCaixaCOD_CREDITO.AsInteger<999 Then

end;

procedure TFrmConciliacaoCaixa.EdtConcFechaCaixaSelOperChange(
  Sender: TObject);
begin
  If (DMConciliacao.CDS_ConcCaixa.IsEmpty) Or (Trim(EdtConcFechaCaixaSelOper.Text)='') Then
   Exit;

  Try
    StrToInt(EdtConcFechaCaixaSelOper.Text);
    DMConciliacao.CDS_ConcCaixa.Locate('COD_OPERADOR', EdtConcFechaCaixaSelOper.Text,[]);
  Except
    LocalizaRegistro(DMConciliacao.CDS_ConcCaixa, 'DES_OPERADOR', EdtConcFechaCaixaSelOper.Text);
  End;
end;

procedure TFrmConciliacaoCaixa.Bt_ConcFechaCaixaResultadoBuscaClick(Sender: TObject);
begin
  PC_ApresResultado.TabIndex:=0;
  Dbg_ConcFechaCaixaResultado.SetFocus;

  DMBelShop.CDS_BuscaRapida.Close;
  Dbg_ConcFechaCaixaResultado.DataSource:=nil;

  // Busca Movimentos de Debitos ===============================================
  If ConsistePeriodo Then
   FechaConcCaixaBuscaCreditos;

end;

procedure TFrmConciliacaoCaixa.DtEd_ConcFechaCaixaResultadoInicioPropertiesChange(Sender: TObject);
begin
  DMBelShop.CDS_BuscaRapida.Close;
  Dbg_ConcFechaCaixaResultado.DataSource:=nil;

end;

procedure TFrmConciliacaoCaixa.Rb_ConcFechaCaixaResultadoLojaClick(Sender: TObject);
begin
  DMBelShop.CDS_BuscaRapida.Close;
  Dbg_ConcFechaCaixaResultado.DataSource:=nil;

  AcertaRb_Style(Rb_ConcFechaCaixaResultadoGeral);
  AcertaRb_Style(Rb_ConcFechaCaixaResultadoLoja);



end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaResultadoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If Not DMBelShop.CDS_BuscaRapida.IsEmpty Then
  Begin
    if not (gdSelected in State) Then
    Begin
      if (Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString)<>'') and
         (Copy(Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Loja').AsString),1,19)<>'Relação de Créditos') Then
      Begin
        Dbg_ConcFechaCaixaResultado.Canvas.Font.Style:=[fsBold];
        Dbg_ConcFechaCaixaResultado.Canvas.Brush.Color:=clSkyBlue;
      End;
    End;

    Dbg_ConcFechaCaixaResultado.Canvas.FillRect(Rect);
    Dbg_ConcFechaCaixaResultado.DefaultDrawDataCell(Rect,Column.Field,state);
  End; // If Not DMBelShop.CDS_BuscaRapida.IsEmpty Then

end;

procedure TFrmConciliacaoCaixa.Bt_ConcFechaCaixaResultadoClipboardClick(
  Sender: TObject);
begin
  PC_ApresResultado.TabIndex:=0;
  If DMBelShop.CDS_BuscaRapida.IsEmpty Then
   Exit;

  DBGridClipboard(Dbg_ConcFechaCaixaResultado);
  Dbg_ConcFechaCaixaResultado.SetFocus;

end;

procedure TFrmConciliacaoCaixa.Bt_ConcFechaCaixaResultadoSalvaExcelClick(
  Sender: TObject);
begin
  PC_ApresResultado.TabIndex:=0;
  If DMBelShop.CDS_BuscaRapida.IsEmpty Then
   Exit;

  ExportDBGridExcel(True, Dbg_ConcFechaCaixaResultado, FrmConciliacaoCaixa);
  Dbg_ConcFechaCaixaResultado.SetFocus;

end;

procedure TFrmConciliacaoCaixa.Rb_ConcFechaCaixaResultadoLojaKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_ConcFechaCaixaResultadoLojaClick(Self);
end;

procedure TFrmConciliacaoCaixa.Rb_ConcFechaCaixaResultadoGeralKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Rb_ConcFechaCaixaResultadoLojaClick(Self);

end;

procedure TFrmConciliacaoCaixa.FormCreate(Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaDoctosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
Var
 cValorTotal: Currency;
 sCodCredito: String;
 iIndex: Integer;
begin
  // Total do Credito Solicitado ===============================================
  If Key=Vk_F4 Then
  Begin
    If Not DMConciliacao.CDS_ConcCaixa.IsEmpty Then
    Begin
      iIndex     :=DMConciliacao.CDS_ConcCaixa.RecNo;
      sCodCredito:=DMConciliacao.CDS_ConcCaixaCOD_CREDITO.AsString;
      cValorTotal:=0;

      DMConciliacao.CDS_ConcCaixa.First;
      DMConciliacao.CDS_ConcCaixa.DisableControls;
      While Not DMConciliacao.CDS_ConcCaixa.Eof do
      Begin
        If sCodCredito=DMConciliacao.CDS_ConcCaixaCOD_CREDITO.AsString Then
         cValorTotal:=cValorTotal+DMConciliacao.CDS_ConcCaixaVLR_INFORMADO.AsCurrency;

        DMConciliacao.CDS_ConcCaixa.Next;
      End; // While Not DMConciliacao.CDS_ConcCaixa.Eof do
      DMConciliacao.CDS_ConcCaixa.EnableControls;
      DMConciliacao.CDS_ConcCaixa.RecNo:=iIndex;

      Application.MessageBox(PChar(DMConciliacao.CDS_ConcCaixaDES_CREDITO.AsString+cr+cr+
                                   'Valor Total: '+FormatFloat('0,.00',cValorTotal)), 'Total do Crédito', 64);
    End; // If Not DMConciliacao.CDS_CMExtratos.IsEmpty Then
  End; // If Key=Vk_F4 Then

end;

procedure TFrmConciliacaoCaixa.Bt_ConcFechaCaixaObsClick(Sender: TObject);
Var
  s, MySql: String;
  bGravar: Boolean;
begin

  Dbg_ConcFechaCaixaTotal.SetFocus;

  If DMConciliacao.CDS_ConcCaixaTotais.IsEmpty Then
   Exit;

  If Pan_ConcFechaCaixaSituacao.Caption='Caixa Fechado' Then
  Begin
    msg('Impossível Alterar !!'+cr+cr+'Caixa FECHADO !!','A');
    Exit;
  End;

  // Apresenta Observação ======================================================
  s:=DMConciliacao.CDS_ConcCaixaTotaisOBS.AsString;
  bGravar:=False;
  If InputQueryOdir('CONCILIAÇÃO DE CAIXA', 'Informe a Observação do Caixa',s, 500) Then
   bGravar:=True;

  If bGravar Then
  Begin
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

      If Trim(s)='' Then
      Begin
        If DMConciliacao.CDS_ConcCaixaTotaisVLR_DIFERENCA.AsCurrency>0 Then
         s:='Vlr Débito MENOR que Vlr Crédito'
        Else If DMConciliacao.CDS_ConcCaixaTotaisVLR_DIFERENCA.AsCurrency<0 Then
         s:='Vlr Débito MAIOR que Vlr Crédito'
        ELSE
         s:='Vlr Débitos e Créditos FECHADOS';
      End; // If Trim(s)='' Then

      MySql:=' UPDATE FIN_CONCILIACAO_CAIXA cx'+
             ' SET cx.OBS_TEXTO='+QuotedStr(s)+
             ' WHERE cx.cod_credito=9999'+
             ' AND   cx.Cod_Loja ='+QuotedStr(FormatFloat('00',EdtConcFechaCaixaCodLoja.AsInteger))+
             ' AND   cx.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',DateToStr(DtEdtConcFechaCaixaData.Date))));
      DMBelShop.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ======================================================
      DMBelShop.SQLC.Commit(TD);

      DMConciliacao.CDS_ConcCaixaTotais.Close;
      DMConciliacao.CDS_ConcCaixaTotais.Open;
      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;
    Except
      on e : Exception do
      Begin
        // Abandona Transacao ====================================================
        DMBelShop.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

        MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
        Exit;
      End; // on e : Exception do
    End; // Try
  End; // If bGravar Then
end;

procedure TFrmConciliacaoCaixa.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // primeiramente verificamos se é o evento a ser tratado...
  If Msg.message = WM_MOUSEWHEEL then
  Begin
//    If ActiveControl is TDBGrid then // If Somente DBGRID *** Testa se Classe é TDBGRID
//    Begin
      Msg.message := WM_KEYDOWN;
      Msg.lParam := 0;
      Sentido := HiWord(Msg.wParam);
      if Sentido > 0 then
       Msg.wParam := VK_UP
      else
       Msg.wParam := VK_DOWN;
//    End; // If ActiveControl is TDBGrid then // If Somente DBGRID *** Testa se Classe é TDBGRID
  End; // if Msg.message = WM_MOUSEWHEEL then

end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaDoctosEnter(
  Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_ConcFechaCaixaDoctosEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaTotalEnter(
  Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_ConcFechaCaixaTotalEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmConciliacaoCaixa.Dbg_ConcFechaCaixaResultadoEnter(Sender: TObject);
begin
  ApplicationEvents1.OnActivate:=Dbg_ConcFechaCaixaResultadoEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

procedure TFrmConciliacaoCaixa.PC_ApresResultadoChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_Principal);

  If (PC_ApresResultado.ActivePage=Ts_ApresResultadoFiltros) And (Ts_ApresResultadoFiltros.CanFocus) Then
   EdtCodCredito.SetFocus;

end;

procedure TFrmConciliacaoCaixa.Bt_BuscaCreditoClick(Sender: TObject);
Var
  MySql: String;
begin
  If Not ConsistePeriodo Then
   Exit;

  sgDtaI:=f_Troca('/','.',DtEdt_ConcFechaCaixaResultadoInicio.Text);
  sgDtaI:=f_Troca('-','.',sgDtaI);
  sgDtaF:=f_Troca('/','.',DtEdt_ConcFechaCaixaResultadoFim.Text);
  sgDtaF:=f_Troca('-','.',sgDtaF);

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  // Busca Aplicações ==========================================================
  MySql:=' SELECT DISTINCT TRIM(c1.des_credito) des_credito, c1.cod_credito'+
         ' FROM FIN_CONCILIACAO_CAIXA c1'+
         ' WHERE  c1.num_seqreg>6499'+
         ' AND    c1.cod_credito<>999'+
         ' AND    c1.cod_credito<9000'+
         ' AND    c1.des_credito<>''Sem Informação'''+
         ' AND    c1.des_credito<>'''''+
         ' AND    c1.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF)+
         ' ORDER BY 1';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;
    
  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMBelShop.CDS_Pesquisa.FieldByName('cod_credito').AsString)='' Then
  Begin
    DMBelShop.CDS_Pesquisa.Close;
    msg('Sem Registro a Listar !!','A');
    FreeAndNil(FrmPesquisa);
    EdtCodCredito.Clear;
    EdtCodCredito.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Credito';
  FrmPesquisa.Campo_Codigo:='Cod_Credito';
  FrmPesquisa.Campo_Descricao:='Des_Credito';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;

  // ============= RETORNO =====================================================
  If Trim(FrmPesquisa.EdtCodigo.Text)<>'' Then
  Begin
    If DMVirtual.CDS_V_Creditos.Locate('Cod_Credito',FrmPesquisa.EdtCodigo.Text,[]) Then
    Begin
      Begin
        msg('Crédito Já Informada !!','A');
        EdtCodCredito.Clear;
        FreeAndNil(FrmPesquisa);
        EdtCodCredito.SetFocus;
        Exit;
      End;
    End;

    DMVirtual.CDS_V_Creditos.Insert;
    DMVirtual.CDS_V_CreditosCod_Credito.AsString:=FrmPesquisa.EdtCodigo.Text;
    DMVirtual.CDS_V_CreditosDes_Credito.AsString:=FrmPesquisa.EdtDescricao.Text;
    DMVirtual.CDS_V_Creditos.Post;

  End; // If Trim(FrmPesquisa.EdtCodigo.Text)<>'' Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmConciliacaoCaixa.Dbg_CreditoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key=VK_Delete Then
  Begin
    If Not DMVirtual.CDS_V_Creditos.IsEmpty Then
     DMVirtual.CDS_V_Creditos.Delete;
  End; // If Key=VK_Delete Then

  Dbg_Credito.SetFocus;

end;

procedure TFrmConciliacaoCaixa.EdtCodCreditoExit(Sender: TObject);
Var
  MySql: String;
begin
  sgDtaI:=f_Troca('/','.',DtEdt_ConcFechaCaixaResultadoInicio.Text);
  sgDtaI:=f_Troca('-','.',sgDtaI);
  sgDtaF:=f_Troca('/','.',DtEdt_ConcFechaCaixaResultadoFim.Text);
  sgDtaF:=f_Troca('-','.',sgDtaF);

  If Not ConsistePeriodo Then
   Exit;

  If Trim(EdtCodCredito.Text)<>'' Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Aplicaçoes ========================================================
    MySql:=' SELECT distinct TRIM(c1.des_credito) des_credito, c1.cod_credito'+
           ' FROM FIN_CONCILIACAO_CAIXA c1'+
           ' WHERE c1.num_seqreg>6499'+
           ' AND   c1.cod_credito<>999'+
           ' AND   c1.cod_credito<9000'+
           ' AND   c1.des_credito<>''Sem Informação'''+
           ' AND   c1.des_credito<>'''''+
           ' AND   c1.cod_credito='+EdtCodCredito.Text+
           ' AND   c1.dta_caixa BETWEEN '+QuotedStr(sgDtaI)+' AND '+QuotedStr(sgDtaF);
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    Screen.Cursor:=crDefault;

    If Trim(DMBelShop.CDS_Busca.FieldByName('cod_credito').AsString)='' Then
    Begin
      msg('Crédito NÃO Encontrado !!!', 'A');
      DMBelShop.CDS_Busca.Close;
      EdtCodCredito.Clear;
      EdtCodCredito.SetFocus;
      Exit;
    End;

    If DMVirtual.CDS_V_Creditos.Locate('Cod_Credito',DMBelShop.CDS_Busca.FieldByName('cod_credito').AsString,[]) Then
    Begin
      Begin
        msg('Crédito Já Informado !!','A');
        DMBelShop.CDS_Busca.Close;
        EdtCodCredito.Clear;
        EdtCodCredito.SetFocus;
        Exit;
      End;
    End;

    DMVirtual.CDS_V_Creditos.Insert;
    DMVirtual.CDS_V_CreditosCod_Credito.AsString:=DMBelShop.CDS_Busca.FieldByName('cod_credito').AsString;
    DMVirtual.CDS_V_CreditosDes_Credito.AsString:=DMBelShop.CDS_Busca.FieldByName('des_credito').AsString;
    DMVirtual.CDS_V_Creditos.Post;

    DMBelShop.CDS_Busca.Close;
    EdtCodCredito.Clear;
    EdtCodCredito.SetFocus;
  End; // If Trim(EdtCodCredito.Text)<>'' Then
end;

end.

