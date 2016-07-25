unit UFrmControleEstoques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, JvExControls, JvXPCore, JvXPButtons, ExtCtrls,
  ComCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, JvExStdCtrls, JvCheckBox,
  jpeg, Grids, DBGrids, DBGridJul, DBXpress;

type
  TFrmControleEstoques = class(TForm)
    CorCaptionForm: TJvGradientCaption;
    Panel10: TPanel;
    Bt_ContEstFechaVolttar: TJvXPButton;
    PC_ContEstPrincipal: TPageControl;
    Ts_ContEstSolic: TTabSheet;
    Ts_ContEstSimulador: TTabSheet;
    Bt_ContEstSimulador: TJvXPButton;
    Pan_ContEstParametros: TPanel;
    Gb_ContEstParametros: TGroupBox;
    Lab_ParamCurvaE: TLabel;
    Lab_ParamCurvaD: TLabel;
    Lab_ParamCurvaC: TLabel;
    Lab_ParamCurvaB: TLabel;
    Lab_ParamCurvaA: TLabel;
    Label64: TLabel;
    Label189: TLabel;
    Label187: TLabel;
    Label83: TLabel;
    Label82: TLabel;
    Label81: TLabel;
    Label46: TLabel;
    Label53: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label47: TLabel;
    Label45: TLabel;
    Label44: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Ckb_ParamCurvaSelectA: TJvCheckBox;
    Ckb_ParamCurvaSelectB: TJvCheckBox;
    Ckb_ParamCurvaSelectC: TJvCheckBox;
    Ckb_ParamCurvaSelectD: TJvCheckBox;
    Ckb_ParamCurvaSelectE: TJvCheckBox;
    EdtParamCurvaALimite: TCurrencyEdit;
    EdtParamCurvaBLimite: TCurrencyEdit;
    EdtParamCurvaCLimite: TCurrencyEdit;
    EdtParamCurvaDLimite: TCurrencyEdit;
    EdtParamCurvaELimite: TCurrencyEdit;
    EdtParamCurvaADiasEst: TCurrencyEdit;
    EdtParamCurvaBDiasEst: TCurrencyEdit;
    EdtParamCurvaCDiasEst: TCurrencyEdit;
    EdtParamCurvaDDiasEst: TCurrencyEdit;
    EdtParamCurvaEDiasEst: TCurrencyEdit;
    EdtParamCurvaAEstMinino: TCurrencyEdit;
    EdtParamCurvaBEstMinino: TCurrencyEdit;
    EdtParamCurvaCEstMinino: TCurrencyEdit;
    EdtParamCurvaDEstMinino: TCurrencyEdit;
    EdtParamCurvaEEstMinino: TCurrencyEdit;
    Bt_ContEstParametrosSalvar: TJvXPButton;
    Gb_ContEstTipoEstoques: TGroupBox;
    Cbx_ContEstEstTipo: TComboBox;
    GroupBox1: TGroupBox;
    Cbx_ContEstTipoApres: TComboBox;
    Dbg_ContEstSimulador: TDBGridJul;
    Bt_ContEstSalvaExcel: TJvXPButton;
    Bt_ContEstClipboard: TJvXPButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Pan_ContEstSimulador: TPanel;
    OdirPanApres: TPanel;
    Lab_Lojas: TLabel;
    Lab_Titulo: TLabel;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_ContEstFechaVolttarClick(Sender: TObject);
    procedure PC_ContEstPrincipalChange(Sender: TObject);

    // Odir ====================================================================
    Procedure InicializaFiltros;

    // Odir ====================================================================

    procedure Ckb_ParamCurvaSelectAClick(Sender: TObject);
    procedure Ckb_ParamCurvaSelectAKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_ContEstParametrosSalvarClick(Sender: TObject);
    procedure Bt_ContEstSalvaExcelClick(Sender: TObject);
    procedure Bt_ContEstClipboardClick(Sender: TObject);
    procedure Bt_ContEstSimuladorClick(Sender: TObject);
    procedure Dbg_ContEstSimuladorDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Dbg_ContEstSimuladorTitleClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControleEstoques: TFrmControleEstoques;

  TD : TTransactionDesc; // Ponteiro de Transação
  bgSairEst: Boolean;

  OrderGrid: String;    // Ordenar Grid

implementation

uses DK_Procs1, UDMBelShop, UDMConexoes, UDMVirtual, UFrmBelShop,
  UFrmSelectEmpProcessamento, DB;

{$R *.dfm}

// Odir ========================================================================
Procedure TFrmControleEstoques.InicializaFiltros;
Var
  i: Integer;
  MySql, s: String;
Begin
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
    If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='1' Then
    Begin
      EdtParamCurvaALimite.Value   :=DMBelShop.CDS_BuscaRapida.FieldByName('Per_Curva').AsInteger;
      EdtParamCurvaADiasEst.Value  :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
      EdtParamCurvaAEstMinino.Value:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;
    End;

    If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='2' Then
    Begin
      EdtParamCurvaBLimite.Value   :=DMBelShop.CDS_BuscaRapida.FieldByName('Per_Curva').AsInteger;
      EdtParamCurvaBDiasEst.Value  :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
      EdtParamCurvaBEstMinino.Value:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;
    End;

    If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='3' Then
    Begin
      EdtParamCurvaCLimite.Value   :=DMBelShop.CDS_BuscaRapida.FieldByName('Per_Curva').AsInteger;
      EdtParamCurvaCDiasEst.Value  :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
      EdtParamCurvaCEstMinino.Value:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;
    End;

    If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='4' Then
    Begin
      EdtParamCurvaDLimite.Value   :=DMBelShop.CDS_BuscaRapida.FieldByName('Per_Curva').AsInteger;
      EdtParamCurvaDDiasEst.Value  :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
      EdtParamCurvaDEstMinino.Value:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;
    End;

    If DMBelShop.CDS_BuscaRapida.FieldByName('Cod_Curva').AsString='5' Then
    Begin
      EdtParamCurvaELimite.Value   :=DMBelShop.CDS_BuscaRapida.FieldByName('Per_Curva').AsInteger;
      EdtParamCurvaEDiasEst.Value  :=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Dias').AsInteger;
      EdtParamCurvaEEstMinino.Value:=DMBelShop.CDS_BuscaRapida.FieldByName('Qtd_Min').AsInteger;
    End;

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.Close;

  // Inicializa Tabelas Virtuais para Filtros ==================================
  try
    DMVirtual.CDS_V_Produtos.Close;
    DMVirtual.CDS_V_Produtos.CreateDataSet;
    DMVirtual.CDS_V_Produtos.Open;
  Except
    DMVirtual.CDS_V_Produtos.Open;
    DMVirtual.CDS_V_Produtos.EmptyDataSet;
  End;

  try
    DMVirtual.CDS_V_Fornecedores.Close;
    DMVirtual.CDS_V_Fornecedores.CreateDataSet;
    DMVirtual.CDS_V_Fornecedores.Open;
  Except
    DMVirtual.CDS_V_Fornecedores.Open;
    DMVirtual.CDS_V_Fornecedores.EmptyDataSet;
  End;
  FrmBelShop.MontaSelectFornecedores;

  try
    DMVirtual.CDS_V_GruposProdutos.Close;
    DMVirtual.CDS_V_GruposProdutos.CreateDataSet;
    DMVirtual.CDS_V_GruposProdutos.Open;
  Except
    DMVirtual.CDS_V_GruposProdutos.Open;
    DMVirtual.CDS_V_GruposProdutos.EmptyDataSet;
  End;

  try
    DMVirtual.CDS_V_SubGruposProdutos.Close;
    DMVirtual.CDS_V_SubGruposProdutos.CreateDataSet;
    DMVirtual.CDS_V_SubGruposProdutos.Open;
  Except
    DMVirtual.CDS_V_SubGruposProdutos.Open;
    DMVirtual.CDS_V_SubGruposProdutos.EmptyDataSet;
  End;

  try
    DMVirtual.CDS_V_Aplicacao.Close;
    DMVirtual.CDS_V_Aplicacao.CreateDataSet;
    DMVirtual.CDS_V_Aplicacao.Open;
  Except
    DMVirtual.CDS_V_Aplicacao.Open;
    DMVirtual.CDS_V_Aplicacao.EmptyDataSet;
  End;

  try
    DMVirtual.CDS_V_FamiliaPrecos.Close;
    DMVirtual.CDS_V_FamiliaPrecos.CreateDataSet;
    DMVirtual.CDS_V_FamiliaPrecos.Open;
  Except
    DMVirtual.CDS_V_FamiliaPrecos.Open;
    DMVirtual.CDS_V_FamiliaPrecos.EmptyDataSet;
  End;

  try
    DMVirtual.CDS_V_GrupoST.Close;
    DMVirtual.CDS_V_GrupoST.CreateDataSet;
    DMVirtual.CDS_V_GrupoST.Open;
  Except
    DMVirtual.CDS_V_GrupoST.Open;
    DMVirtual.CDS_V_GrupoST.EmptyDataSet;
  End;

  // Cadastro de Grupos ST =====================================================
  try
    DMVirtual.CDS_GruposST.Close;
    DMVirtual.CDS_GruposST.CreateDataSet;
    DMVirtual.CDS_GruposST.Open;
  Except
    DMVirtual.CDS_GruposST.Open;
    DMVirtual.CDS_GruposST.EmptyDataSet;
  End;

  For i:=0 to 20 do
  Begin
    If i= 0 Then s:='Não usa';
    If i= 1 Then s:='Autopeças';
    If i= 2 Then s:='Ração';
    If i= 3 Then s:='Colchões';
    If i= 4 Then s:='Cosméticos';
    If i= 5 Then s:='Arroz beneficiado';
    If i= 6 Then s:='Correias de Transmissão e Rolamentos';
    If i= 7 Then s:='Tintas e Vernizes';
    If i= 8 Then s:='Sucos de Frutas e Bebidas não Alcoólicas';
    If i= 9 Then s:='Ferramentas';
    If i=10 Then s:='Materiais Elétricos';
    If i=11 Then s:='Mat. Construção, Acabamento, Bricolagem ou Adorno';
    If i=12 Then s:='Bicicletas';
    If i=13 Then s:='Brinquedos';
    If i=14 Then s:='Material de Limpeza';
    If i=15 Then s:='Produtos Alimentícios';
    If i=16 Then s:='Artefatos de Uso Doméstico';
    If i=17 Then s:='Bebidas Quentes';
    If i=18 Then s:='Artigos de Papelaria';
    If i=19 Then s:='Instrumentos Musicais';
    If i=20 Then s:='Prod. Eletronicos, Eletroeletronicos, Eletrodomésticos';

    DMVirtual.CDS_GruposST.Insert;
    DMVirtual.CDS_GruposSTCod_GrupoST.AsInteger:=i;
    DMVirtual.CDS_GruposSTDes_GrupoST.AsString:=AnsiUpperCase(s);
    DMVirtual.CDS_GruposST.Post;
  End; // For i:=1 to 20 do

  //============================================================================
  // PageControl de Filtros - INICIO ===========================================
  //============================================================================
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
  // Filtro Produtos de Não Compra
  FrmBelShop.Painel_FiltroNaoCompra.Visible:=True;
  // Filtro para Busca Pelo Nome
  FrmBelShop.Gb_CalculoFiltroNome.Visible:=True;
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
  FrmBelShop.TS_FiltroAplicacao.TabVisible:=True;

  //-----------------------------------------------------------------
  // Filtro de Familia de Preços ------------------------------------
  //-----------------------------------------------------------------
  FrmBelShop.TS_FiltroFamiliaPreco.TabVisible:=True;

  //-----------------------------------------------------------------
  // Filtro de Grupos ST --------------------------------------------
  //-----------------------------------------------------------------
  FrmBelShop.TS_FiltroGrupoST.TabVisible:=True;

  //-----------------------------------------------------------------
  // Grupo de Comprovantes ------------------------------------------
  //-----------------------------------------------------------------
  FrmBelShop.TS_FiltroComprovantes.TabVisible:=False;

  //-----------------------------------------------------------------
  // Posiciona o PC_Filtros em seu Parent ---------------------------
  //-----------------------------------------------------------------
  FrmBelShop.PC_Filtros.Parent:=Ts_ContEstSolic;
  FrmBelShop.PC_Filtros.TabIndex:=0;
  FrmBelShop.PC_FiltrosChange(Self);
  //============================================================================
  // PageControl de Filtros - FIM ==============================================
  //============================================================================

End;

procedure TFrmControleEstoques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairEst Then
   Begin
     Action := caFree;

     //--FechaTudoModelo;
   End
  Else
   Begin
     PC_ContEstPrincipal.ActivePage:=Ts_ContEstSolic;
     PC_ContEstPrincipalChange(Self);
     msg('Para Fechar Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmControleEstoques.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Inicializa Filtros ========================================================
  InicializaFiltros;
end;

procedure TFrmControleEstoques.FormKeyPress(Sender: TObject; var Key: Char);
begin

  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;
end;

procedure TFrmControleEstoques.FormShow(Sender: TObject);
begin
  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairEst:=False;
  PC_ContEstPrincipalChange(Self);
end;

procedure TFrmControleEstoques.Bt_ContEstFechaVolttarClick(Sender: TObject);
begin
  If Bt_ContEstFechaVolttar.Caption='Voltar' Then
  Begin
    PC_ContEstPrincipal.ActivePage:=Ts_ContEstSolic;
    PC_ContEstPrincipalChange(Self);
    Exit;
  End;

  // Fecha Clients =============================================================
  DMVirtual.CDS_V_Produtos.Close;
  DMVirtual.CDS_V_Fornecedores.Close;
  DMVirtual.CDS_V_GruposProdutos.Close;
  DMVirtual.CDS_V_SubGruposProdutos.Close;
  DMVirtual.CDS_V_Aplicacao.Close;
  DMVirtual.CDS_V_FamiliaPrecos.Close;
  DMVirtual.CDS_V_GrupoST.Close;
  DMVirtual.CDS_GruposST.Close;
  DMVirtual.CDS_V_EstoqueLojas.Close;

  // Retorna Parent do Filtro ==================================================
  FrmBelShop.PC_Filtros.Parent:=FrmBelShop.Pan_OC;
  FrmBelShop.PC_Filtros.TabIndex:=0;

  bgSairEst:=True;
  Close;
end;

procedure TFrmControleEstoques.PC_ContEstPrincipalChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_ContEstPrincipal);

  Bt_ContEstFechaVolttar.Caption:='Fechar';
  Bt_ContEstSimulador.Visible:=False;
  Bt_ContEstSalvaExcel.Visible:=True;
  Bt_ContEstClipboard.Visible:=True;
  If (PC_ContEstPrincipal.ActivePage=Ts_ContEstSolic) And (Ts_ContEstSolic.CanFocus) Then
  Begin
    Bt_ContEstClipboard.Visible:=False;
    Bt_ContEstSalvaExcel.Visible:=False;
    Bt_ContEstSimulador.Visible:=True;

    Cbx_ContEstEstTipo.SetFocus;
  End;

  If (PC_ContEstPrincipal.ActivePage=Ts_ContEstSimulador) And (Ts_ContEstSimulador.CanFocus) Then
  Begin
    Bt_ContEstFechaVolttar.Caption:='Voltar';
    Dbg_ContEstSimulador.SetFocus;
  End;

end;

procedure TFrmControleEstoques.Ckb_ParamCurvaSelectAClick(Sender: TObject);
begin

  Lab_ParamCurvaA.Color:=$00E1E1E1;
  Lab_ParamCurvaB.Color:=$00E1E1E1;
  Lab_ParamCurvaC.Color:=$00E1E1E1;
  Lab_ParamCurvaD.Color:=$00E1E1E1;
  Lab_ParamCurvaE.Color:=$00E1E1E1;

  If Ckb_ParamCurvaSelectA.Checked Then Lab_ParamCurvaA.Color:=clYellow;
  If Ckb_ParamCurvaSelectB.Checked Then Lab_ParamCurvaB.Color:=clYellow;
  If Ckb_ParamCurvaSelectC.Checked Then Lab_ParamCurvaC.Color:=clYellow;
  If Ckb_ParamCurvaSelectD.Checked Then Lab_ParamCurvaD.Color:=clYellow;
  If Ckb_ParamCurvaSelectE.Checked Then Lab_ParamCurvaE.Color:=clYellow;

end;

procedure TFrmControleEstoques.Ckb_ParamCurvaSelectAKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Ckb_ParamCurvaSelectAClick(Self);

end;

procedure TFrmControleEstoques.Bt_ContEstParametrosSalvarClick(Sender: TObject);
Var
  MySql: String;
begin
  // Consiste Percentuais da Curva ABC =========================================
  If (EdtParamCurvaALimite.AsInteger + EdtParamCurvaBLimite.AsInteger + EdtParamCurvaCLimite.AsInteger +
      EdtParamCurvaDLimite.AsInteger + EdtParamCurvaELimite.AsInteger)<>100 Then
  Begin
    msg('Total da Distribuição dos Percentuais'+cr+cr+'da Curva ABC NÃO Fecham 100% !!','A');
    EdtParamCurvaALimite.SetFocus;
    Exit;
  End;

  if msg('As Alterações nos PÂRAMETROS'+cr+cr+'Estão Corretas ??','C')=2 Then
  Begin
    EdtParamCurvaALimite.SetFocus;
    Exit;
  End;

  // Verifica se Transação esta Ativa
  If DMBelShop.SQLC.InTransaction Then
   DMBelShop.SQLC.Rollback(TD);

  // Monta Transacao =========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Salva Valores da Curva ABC ============================================
    MySql:=' DELETE From TAB_AUXILIAR'+
           ' WHERE tip_aux=2';
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    MySql:=' INSERT into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, VLR_AUX, VLR_AUX1)'+
           ' VALUES (2, 1, '+
           QuotedStr(IntToStr(EdtParamCurvaALimite.AsInteger))+', '+
           QuotedStr(IntToStr(EdtParamCurvaADiasEst.AsInteger))+', '+
           QuotedStr(IntToStr(EdtParamCurvaAEstMinino.AsInteger))+')';
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    MySql:=' INSERT into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, VLR_AUX, VLR_AUX1)'+
           ' Values (2, 2, '+
           QuotedStr(IntToStr(EdtParamCurvaBLimite.AsInteger))+', '+
           QuotedStr(IntToStr(EdtParamCurvaBDiasEst.AsInteger))+', '+
           QuotedStr(IntToStr(EdtParamCurvaBEstMinino.AsInteger))+')';
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    MySql:=' INSERT into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, VLR_AUX, VLR_AUX1)'+
           ' Values (2, 3, '+
           QuotedStr(IntToStr(EdtParamCurvaCLimite.AsInteger))+', '+
           QuotedStr(IntToStr(EdtParamCurvaCDiasEst.AsInteger))+', '+
           QuotedStr(IntToStr(EdtParamCurvaCEstMinino.AsInteger))+')';
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    MySql:=' INSERT into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, VLR_AUX, VLR_AUX1)'+
           ' Values (2, 4, '+
           QuotedStr(IntToStr(EdtParamCurvaDLimite.AsInteger))+', '+
           QuotedStr(IntToStr(EdtParamCurvaDDiasEst.AsInteger))+', '+
           QuotedStr(IntToStr(EdtParamCurvaDEstMinino.AsInteger))+')';
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    MySql:=' INSERT into TAB_AUXILIAR (TIP_AUX, COD_AUX, DES_AUX, VLR_AUX, VLR_AUX1)'+
           ' Values (2, 5, '+
           QuotedStr(IntToStr(EdtParamCurvaELimite.AsInteger))+', '+
           QuotedStr(IntToStr(EdtParamCurvaEDiasEst.AsInteger))+', '+
           QuotedStr(IntToStr(EdtParamCurvaEEstMinino.AsInteger))+')';
    DMBelShop.SQLC.Execute(MySql, nil, nil);

    // Atualiza Transacao ====================================================
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;
    msg('PARAMETROS Salvos com SUCESSO !!','A');
  Except
    on e : Exception do
    Begin
      // Abandona Transacao =====================================
      DMBelShop.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('PARAMETROS Não Foram Salvos !!'+cr+cr+'Erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
    End; // on e : Exception do
  End; // Try

end;

procedure TFrmControleEstoques.Bt_ContEstSalvaExcelClick(Sender: TObject);
begin
  If DMVirtual.CDS_V_EstoqueLojas.IsEmpty Then
   Exit;

  ExportDBGridExcel(True, Dbg_ContEstSimulador, FrmControleEstoques);
end;

procedure TFrmControleEstoques.Bt_ContEstClipboardClick(Sender: TObject);
begin
  If DMVirtual.CDS_V_EstoqueLojas.IsEmpty Then
   Exit;

  DBGridClipboard(Dbg_ContEstSimulador);
end;

procedure TFrmControleEstoques.Bt_ContEstSimuladorClick(Sender: TObject);
Var
  MySql: String;
  sDiaEstA, sDiaEstB, sDiaEstC, sDiaEstD, sDiaEstE: String;
  iQtdEstoque, iQtdVendas, iEstPrevisto: Integer;
  cVlrEstoque, cVlrPrevisto: Currency;
begin
  Cbx_ContEstEstTipo.SetFocus;

  // Solicita Lojas ============================================================
  sgOutrasEmpresa:='(50,99)';
  FrmSelectEmpProcessamento:=TFrmSelectEmpProcessamento.Create(Self);
  FrmSelectEmpProcessamento.bUsarMatriz:=False;
  FrmSelectEmpProcessamento.ShowModal;
  FreeAndNil(FrmSelectEmpProcessamento);

  // Verifica se Processa Todas as Empresas ====================================
  sgEmpresas:='';
  bgTodasEmpresas:=True;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
     Begin
       // Atualiza sgEmpresa para Sql ---------------------------------
       If sgEmpresas='' Then
        sgEmpresas:=QuotedStr(DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString)
       Else
        sgEmpresas:=sgEmpresas+', '+QuotedStr(DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString);
     End
    Else // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
     Begin
       bgTodasEmpresas:=False;
     End; // If DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do

  If sgEmpresas='' Then
  Begin
    EdtParamCurvaADiasEst.SetFocus;
    Exit;
  End; // If sgEmpresas='' Then

  Screen.Cursor:=crAppStart;

  PC_ContEstPrincipal.ActivePage:=Ts_ContEstSimulador;
  PC_ContEstPrincipalChange(Self);
  Dbg_ContEstSimulador.SetFocus;

  // Seleção de Curvas =========================================================
  sgCurvas:='';
  If Ckb_ParamCurvaSelectA.Checked Then sgCurvas:=QuotedStr('A');
  If Ckb_ParamCurvaSelectB.Checked Then If sgCurvas='' Then sgCurvas:=QuotedStr('B') Else sgCurvas:=sgCurvas+', '+QuotedStr('B');
  If Ckb_ParamCurvaSelectC.Checked Then If sgCurvas='' Then sgCurvas:=QuotedStr('C') Else sgCurvas:=sgCurvas+', '+QuotedStr('C');
  If Ckb_ParamCurvaSelectD.Checked Then If sgCurvas='' Then sgCurvas:=QuotedStr('D') Else sgCurvas:=sgCurvas+', '+QuotedStr('D');
  If Ckb_ParamCurvaSelectE.Checked Then If sgCurvas='' Then sgCurvas:=QuotedStr('E') Else sgCurvas:=sgCurvas+', '+QuotedStr('E');

  If (Ckb_ParamCurvaSelectA.Checked) AND (Ckb_ParamCurvaSelectB.Checked) AND (Ckb_ParamCurvaSelectC.Checked) AND
     (Ckb_ParamCurvaSelectD.Checked) AND (Ckb_ParamCurvaSelectE.Checked) Then
   sgCurvas:='';

  // Dias de Estocagem =========================================================
  sDiaEstA:=EdtParamCurvaADiasEst.Text;
  sDiaEstB:=EdtParamCurvaBDiasEst.Text;
  sDiaEstC:=EdtParamCurvaCDiasEst.Text;
  sDiaEstD:=EdtParamCurvaDDiasEst.Text;
  sDiaEstE:=EdtParamCurvaEDiasEst.Text;

  // Produtos Selecionados =====================================================
  FrmBelShop.SelecionaProdutos(True, True);

  // Monta Resto dosa Filtros ==================================================
  DMBelShop.MontaFiltros();

  // Acerta TabSheet Ts_ApresentaGrid ==========================================
  MySql:=' SELECT FIRST 1 d.dias_uteis, d.periodo_inicio, d.periodo_fim'+
         ' FROM ES_DEMANDAS_4MESES d';
  DMBelShop.SQLQuery1.Close;
  DMBelShop.SQLQuery1.SQL.Clear;
  DMBelShop.SQLQuery1.SQL.Add(MySql);
  DMBelShop.SQLQuery1.Open;

  If bgTodasEmpresas Then
   Lab_Lojas.Caption:='TODAS AS LOJAS'
  Else
   Lab_Lojas.Caption:='LOJA(S): Bel_'+f_Troca('''','',sgEmpresas);

  igNrDias   :=DMBelShop.SQLQuery1.FieldByName('Dias_Uteis').AsInteger;
  // Coloca Barra na Data
  sgDtaInicio:=f_Troca('.','/',f_Troca('-','/',DMBelShop.SQLQuery1.FieldByName('Periodo_Inicio').AsString));
  sgDtaFim   :=f_Troca('.','/',f_Troca('-','/',DMBelShop.SQLQuery1.FieldByName('Periodo_Fim').AsString));
  DMBelShop.SQLQuery1.Close;

  Lab_Titulo.Caption:='SIMULADOR ESTOQUE FISICO/FINANCEIRO';
  If DMVirtual.CDS_V_Fornecedores.RecordCount=1 Then
   Lab_Titulo.Caption:=Lab_Titulo.Caption+' - Fornecedor: '+
                                          DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString+'-'+
                                          DMVirtual.CDS_V_FornecedoresDes_Fornecedor.AsString;


  // Monta SQL de Busca Estoques ===============================================
  MySql:=' SELECT';

  // Analitico ou Sintetico
  If Cbx_ContEstTipoApres.ItemIndex=0 Then
   MySql:=
    MySql+' ''Bel_''||e.codfilial loja,'  // Analitico
  Else
   MySql:=
    MySql+' ''BelShop'' Loja,'; // Sintetico

  MySql:=
   MySql+' CAST(SUM(COALESCE(e.saldoatual,0)) AS INTEGER) Qtd_Estoque,'+
         ' CAST(SUM(COALESCE(e.saldoatual,0) * COALESCE(p.precovenda,0.00)) AS NUMERIC(12,2)) Vlr_Estoque,'+
         ' CAST(SUM(COALESCE(dm.qtd_venda,0)) AS INTEGER) Qtd_Vendas,'+
         // ' CAST(SUM(COALESCE(dm.qtd_venda_dia,0)) AS INTEGER) qtd_dia,'+

         ' CAST(SUM(CASE'+
         '             WHEN p.classeabc=''A'' THEN'+
         '               CASE'+
         '                 WHEN ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstA+')<COALESCE(ef.est_minimo,0) THEN'+
         '                   COALESCE(ef.est_minimo,0)'+
         '                 ELSE'+
         '                   (CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstA+
         '                END'+

         '             WHEN p.classeabc=''B'' THEN'+
         '               CASE'+
         '                 WHEN ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstB+')<COALESCE(ef.est_minimo,0) THEN'+
         '                   COALESCE(ef.est_minimo,0)'+
         '                 ELSE'+
         '                   (CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstB+
         '                END'+

         '             WHEN p.classeabc=''C'' THEN'+
         '               CASE'+
         '                 WHEN ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstC+')<COALESCE(ef.est_minimo,0) THEN'+
         '                   COALESCE(ef.est_minimo,0)'+
         '                 ELSE'+
         '                   (CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstC+
         '                END'+

         '             WHEN p.classeabc=''D'' THEN'+
         '               CASE'+
         '                 WHEN ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstD+')<COALESCE(ef.est_minimo,0) THEN'+
         '                   COALESCE(ef.est_minimo,0)'+
         '                 ELSE'+
         '                   (CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstD+
         '                END'+

         '             ELSE'+ // p.classeabc='E'
         '               CASE'+
         '                 WHEN ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstE+')<COALESCE(ef.est_minimo,0) THEN'+
         '                   COALESCE(ef.est_minimo,0)'+
         '                 ELSE'+
         '                   (CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstE+
         '                END'+
         '          END)'+
         ' AS INTEGER) Est_Previsto,';

   MySqlSelect:=
         ' CAST(SUM(CASE'+
         '             WHEN p.classeabc=''A'' THEN'+
         '               CASE'+
         '                WHEN ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstA+')<COALESCE(ef.est_minimo,0) THEN'+
         '                  COALESCE(ef.est_minimo,0)*COALESCE(p.precovenda,0.00)'+
         '               ELSE'+
         '                 ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstA+')*COALESCE(p.precovenda,0.00)'+
         '               END'+

         '             WHEN p.classeabc=''B'' THEN'+
         '               CASE'+
         '                WHEN ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstB+')<COALESCE(ef.est_minimo,0) THEN'+
         '                  COALESCE(ef.est_minimo,0)*COALESCE(p.precovenda,0.00)'+
         '               ELSE'+
         '                 ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstB+')*COALESCE(p.precovenda,0.00)'+
         '               END'+

         '             WHEN p.classeabc=''C'' THEN'+
         '               CASE'+
         '                WHEN ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstC+')<COALESCE(ef.est_minimo,0) THEN'+
         '                  COALESCE(ef.est_minimo,0)*COALESCE(p.precovenda,0.00)'+
         '               ELSE'+
         '                  ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstC+')*COALESCE(p.precovenda,0.00)'+
         '               END'+

         '             WHEN p.classeabc=''D'' THEN'+
         '               CASE'+
         '                WHEN ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstD+')<COALESCE(ef.est_minimo,0) THEN'+
         '                  COALESCE(ef.est_minimo,0)*COALESCE(p.precovenda,0.00)'+
         '               ELSE'+
         '                  ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstD+')*COALESCE(p.precovenda,0.00)'+
         '               END'+

         '             ELSE'+ // p.classeabc='E'
         '               CASE'+
         '                WHEN ((CAST(COALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstE+')<COALESCE(ef.est_minimo,0) THEN'+
         '                  COALESCE(ef.est_minimo,0)*COALESCE(p.precovenda,0.00)'+
         '               ELSE'+
         '                  ((CAST(cOALESCE(dm.qtd_venda_dia,0) AS INTEGER))*'+sDiaEstE+')*COALESCE(p.precovenda,0.00)'+
         '               END'+
         '          END)'+
         ' AS NUMERIC(12,2)) vlr_Previsto';

   MySqlClausula1:=
         ' FROM ESTOQUE e'+
         '    LEFT JOIN PRODUTO p              ON p.codproduto=e.codproduto'+
         '    LEFT JOIN ES_DEMANDAS_4MESES dm  ON dm.codfilial=:CodLoja'+
         '                                    AND dm.codproduto=e.codproduto'+
         '    LEFT JOIN ES_FINAN_CURVA_ABC ef  ON ef.cod_loja=:CodLoja'+
         '                                    AND ef.cod_produto=e.codproduto'+
         ' WHERE e.codfilial=:CodLoja';

         // Situacao do Produto -------------------------------------
         If Not FrmBelShop.Ckb_FiltroProdNaoCompra.Checked Then
          MySqlClausula1:=
           MySqlClausula1+' AND Coalesce(p.situacaopro,0)=0'
         Else
          MySqlClausula1:=
           MySqlClausula1+' AND Coalesce(p.situacaopro,0) in (0,3)';

         // Fornecedores --------------------------------------------
         If Trim(sgFornecedores)<>'' Then
          MySqlClausula1:=
           MySqlClausula1+' AND e.principalfor IN ('+sgFornecedores+')'
         Else
          MySqlClausula1:=
           MySqlClausula1+' AND e.principalfor Not IN (''000300'', ''000500'', ''000883'', ''010000'', ''001072'')';

         // Produtos Codigos e/ou Produtos Like ---------------------
         sgLikeProdutos:=f_Troca('pr.','p.',sgLikeProdutos);
         If (Trim(sgProdutos)<>'') And (Trim(sgLikeProdutos)<>'') Then
          MySqlClausula1:=
           MySqlClausula1+' AND (e.CodProduto in ('+sgProdutos+') Or '+sgLikeProdutos+')'
         Else If Trim(sgProdutos)<>'' Then
          MySqlClausula1:=
           MySqlClausula1+' AND e.CodProduto in ('+sgProdutos+')'
         Else If Trim(sgLikeProdutos)<>'' Then
          MySqlClausula1:=
           MySqlClausula1+' AND '+sgLikeProdutos;

         // Grupos / SubGrupos --------------------------------------
         If sgGrupos<>'' Then
          MySqlClausula1:=
           MySqlClausula1+' and '+f_Troca('pr.','p.',sgGrupos);

         // Aplicacoes ----------------------------------------------
         If Trim(sgAplicacoes)<>'' Then
          MySqlClausula1:=
           MySqlClausula1+' and p.CodAplicacao in '+sgAplicacoes;

         // Familias Preços -----------------------------------------
         If Trim(sgFamiliaPrecos)<>'' Then
          MySqlClausula1:=
           MySqlClausula1+' and p.CodFamiliaPreco in '+sgFamiliaPrecos;

         // Grupos ST -----------------------------------------------
         If Trim(sgGruposST)<>'' Then
          MySqlClausula1:=
           MySqlClausula1+' and p.grupostmva in '+sgGruposST;

         // Curvas --------------------------------------------------
         If sgCurvas<>'' Then
          MySqlClausula1:=
           MySqlClausula1+' AND p.classeabc IN ('+sgCurvas+')';

         // Estoques (Com Estoque)
         If Cbx_ContEstEstTipo.ItemIndex=1 Then
          MySqlClausula1:=
           MySqlClausula1+' AND e.saldoatual>0';

         // Estoques (Sem Estoque) ----------------------------------
         If Cbx_ContEstEstTipo.ItemIndex=2 Then
          MySqlClausula1:=
           MySqlClausula1+' AND e.saldoatual<=0';

         // Analitico: Tem Group By ---------------------------------
         If Cbx_ContEstTipoApres.ItemIndex=0 Then
          MySqlClausula1:=
           MySqlClausula1+' GROUP BY 1';
  DMBelShop.SQLQuery1.Close;
  DMBelShop.SQLQuery1.SQL.Clear;
  DMBelShop.SQLQuery1.SQL.Add(MySql+MySqlSelect+MySqlClausula1);

  OdirPanApres.Caption:='AGUARDE !! Localizando Estoques ...';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmControleEstoques.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmControleEstoques.Height-OdirPanApres.Height)/2));
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  try
    DMVirtual.CDS_V_EstoqueLojas.Close;
    DMVirtual.CDS_V_EstoqueLojas.CreateDataSet;
    DMVirtual.CDS_V_EstoqueLojas.Open;
  Except
    DMVirtual.CDS_V_EstoqueLojas.Open;
    DMVirtual.CDS_V_EstoqueLojas.EmptyDataSet;
  End;
  DMVirtual.CDS_V_EstoqueLojas.Open;

  iQtdEstoque :=0;
  iQtdVendas  :=0;
  iEstPrevisto:=0;
  cVlrEstoque :=0;
  cVlrPrevisto:=0;

  DMBelShop.CDS_EmpProcessa.First;
  While Not DMBelShop.CDS_EmpProcessa.Eof do
  Begin
    Refresh;

    if DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then
    Begin
      DMBelShop.SQLQuery1.Close;
      DMBelShop.SQLQuery1.ParamByName('CodLoja').AsString:=DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString;
      DMBelShop.SQLQuery1.Open;

      If Not DMBelShop.SQLQuery1.Eof Then
       Begin
         DMVirtual.CDS_V_EstoqueLojas.Append;
         DMVirtual.CDS_V_EstoqueLojasCOD_LOJA.AsString:=
                         Trim(DMBelShop.SQLQuery1.FieldByName('LOJA').AsString);
         DMVirtual.CDS_V_EstoqueLojasQTD_ESTOQUE.AsString:=
                  Trim(DMBelShop.SQLQuery1.FieldByName('QTD_ESTOQUE').AsString);
         DMVirtual.CDS_V_EstoqueLojasVLR_ESTOQUE.AsString:=
                  Trim(DMBelShop.SQLQuery1.FieldByName('VLR_ESTOQUE').AsString);
         DMVirtual.CDS_V_EstoqueLojasQTD_VENDAS.AsString:=
                   Trim(DMBelShop.SQLQuery1.FieldByName('QTD_VENDAS').AsString);
         DMVirtual.CDS_V_EstoqueLojasEST_SIMULADO.AsString:=
                 Trim(DMBelShop.SQLQuery1.FieldByName('EST_PREVISTO').AsString);
         DMVirtual.CDS_V_EstoqueLojasVLR_SIMULADO.AsString:=
                 Trim(DMBelShop.SQLQuery1.FieldByName('VLR_PREVISTO').AsString);


         DMVirtual.CDS_V_EstoqueLojasPER_SIMULADOR.AsCurrency:=0.00;
         If DMVirtual.CDS_V_EstoqueLojasVLR_SIMULADO.AsInteger>0 Then
          DMVirtual.CDS_V_EstoqueLojasPER_SIMULADOR.AsCurrency:=
                       (DMVirtual.CDS_V_EstoqueLojasVLR_ESTOQUE.AsInteger*100)/
                             DMVirtual.CDS_V_EstoqueLojasVLR_SIMULADO.AsInteger;

         DMVirtual.CDS_V_EstoqueLojasDIA_UTEIS.AsInteger:=igNrDias;
         DMVirtual.CDS_V_EstoqueLojasDTA_INICIO.AsString:=sgDtaInicio;
         DMVirtual.CDS_V_EstoqueLojasDTA_FIM.AsString:=sgDtaFim;
         DMVirtual.CDS_V_EstoqueLojas.Post;

         iQtdEstoque :=iQtdEstoque +DMBelShop.SQLQuery1.FieldByName('QTD_ESTOQUE').AsInteger;
         iQtdVendas  :=iQtdVendas  +DMBelShop.SQLQuery1.FieldByName('QTD_VENDAS').AsInteger;
         iEstPrevisto:=iEstPrevisto+DMBelShop.SQLQuery1.FieldByName('EST_PREVISTO').AsInteger;
         cVlrEstoque :=cVlrEstoque +DMBelShop.SQLQuery1.FieldByName('VLR_ESTOQUE').AsCurrency;
         cVlrPrevisto:=cVlrPrevisto+DMBelShop.SQLQuery1.FieldByName('VLR_PREVISTO').AsCurrency;
       End
      Else
       Begin
         DMVirtual.CDS_V_EstoqueLojas.Append;
         DMVirtual.CDS_V_EstoqueLojasCOD_LOJA.AsString:=
                             Trim(DMBelShop.CDS_EmpProcessaCOD_FILIAL.AsString);
         DMVirtual.CDS_V_EstoqueLojasQTD_ESTOQUE.AsInteger:=0;
         DMVirtual.CDS_V_EstoqueLojasVLR_ESTOQUE.AsCurrency:=0.00;
         DMVirtual.CDS_V_EstoqueLojasQTD_VENDAS.AsInteger:=0;
         DMVirtual.CDS_V_EstoqueLojasEST_SIMULADO.AsInteger:=0;
         DMVirtual.CDS_V_EstoqueLojasVLR_SIMULADO.AsCurrency:=0.00;
         DMVirtual.CDS_V_EstoqueLojasPER_SIMULADOR.AsCurrency:=0.00;
         DMVirtual.CDS_V_EstoqueLojasDIA_UTEIS.AsInteger:=igNrDias;
         DMVirtual.CDS_V_EstoqueLojasDTA_INICIO.AsString:=sgDtaInicio;
         DMVirtual.CDS_V_EstoqueLojasDTA_FIM.AsString:=sgDtaFim;

         DMVirtual.CDS_V_EstoqueLojas.Post;
       End; // If Not DMBelShop.SQLQuery1.Eof Then
    End; // if DMBelShop.CDS_EmpProcessaPROC.AsString='SIM' Then

    DMBelShop.CDS_EmpProcessa.Next;
  End; // While Not DMBelShop.CDS_EmpProcessa.Eof do
  DMBelShop.SQLQuery1.Close;

  OdirPanApres.Visible:=False;

  If DMVirtual.CDS_V_EstoqueLojas.RecordCount<1 Then
  Begin
    Screen.Cursor:=crDefault;
    msg('Sem Movimentação de Estoque a Listar !!','A');
    PC_ContEstPrincipal.ActivePage:=Ts_ContEstSolic;
    PC_ContEstPrincipalChange(Self);
    Lab_Lojas.Caption:='';
    Lab_Titulo.Caption:='';
    Cbx_ContEstEstTipo.SetFocus;
    Exit;
  End;

  // Insere Totais =============================================================
  If DMVirtual.CDS_V_EstoqueLojas.RecordCount>1 Then
  Begin
    DMVirtual.CDS_V_EstoqueLojas.Append;
    DMVirtual.CDS_V_EstoqueLojasCOD_LOJA.AsString          :='TOTAIS';
    DMVirtual.CDS_V_EstoqueLojasQTD_ESTOQUE.AsInteger  :=iQtdEstoque;
    DMVirtual.CDS_V_EstoqueLojasVLR_ESTOQUE.AsCurrency :=cVlrEstoque;
    DMVirtual.CDS_V_EstoqueLojasQTD_VENDAS.AsInteger   :=iQtdVendas;
    DMVirtual.CDS_V_EstoqueLojasEST_SIMULADO.AsInteger :=iEstPrevisto;
    DMVirtual.CDS_V_EstoqueLojasVLR_SIMULADO.AsCurrency:=cVlrPrevisto;

    DMVirtual.CDS_V_EstoqueLojasPER_SIMULADOR.AsCurrency:=0.00;
    If DMVirtual.CDS_V_EstoqueLojasVLR_SIMULADO.AsInteger>0 Then
     DMVirtual.CDS_V_EstoqueLojasPER_SIMULADOR.AsCurrency:=
                       (DMVirtual.CDS_V_EstoqueLojasVLR_ESTOQUE.AsInteger*100)/
                             DMVirtual.CDS_V_EstoqueLojasVLR_SIMULADO.AsInteger;

    DMVirtual.CDS_V_EstoqueLojas.Post;
  End; // If DMVirtual.CDS_V_EstoqueLojas.RecordCount>1 Then
  DMVirtual.CDS_V_EstoqueLojas.First;

  Screen.Cursor:=crDefault;
  Dbg_ContEstSimulador.SetFocus;

end;

procedure TFrmControleEstoques.Dbg_ContEstSimuladorDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If not (gdSelected in State) Then
  Begin
    if Trim(DMVirtual.CDS_V_EstoqueLojasCOD_LOJA.AsString)='TOTAIS' Then
     Dbg_ContEstSimulador.Canvas.Brush.Color:=clSkyBlue;
  End;

  If (Column.FieldName='PER_SIMULADOR') Then //----> Este comando altera cor da Celula
  Begin
    Dbg_ContEstSimulador.Canvas.Font.Color:=clWhite; //-->> Cor da Fonte
    Dbg_ContEstSimulador.Canvas.Brush.Color:=clRed; //-->> Cor da Celula
    
    If ((100-DMVirtual.CDS_V_EstoqueLojasPER_SIMULADOR.AsCurrency)<=20) And
       ((100-DMVirtual.CDS_V_EstoqueLojasPER_SIMULADOR.AsCurrency)>=-20) Then
    Begin
      Dbg_ContEstSimulador.Canvas.Font.Style:=[fsBold];
      Dbg_ContEstSimulador.Canvas.Font.Color:=clWhite; //-->> Cor da Fonte
      Dbg_ContEstSimulador.Canvas.Brush.Color:=clBlue; //-->> Cor da Celula
    End;
  End;

  Dbg_ContEstSimulador.Canvas.FillRect(Rect);
  Dbg_ContEstSimulador.DefaultDrawDataCell(Rect,Column.Field,state);

  // Alinhamento
  DMVirtual.CDS_V_EstoqueLojasCOD_LOJA.Alignment:=taCenter;
  DMVirtual.CDS_V_EstoqueLojasQTD_ESTOQUE.Alignment:=taRightJustify;
  DMVirtual.CDS_V_EstoqueLojasVLR_ESTOQUE.Alignment:=taRightJustify;
  DMVirtual.CDS_V_EstoqueLojasQTD_VENDAS.Alignment:=taRightJustify;
  DMVirtual.CDS_V_EstoqueLojasEST_SIMULADO.Alignment:=taRightJustify;
  DMVirtual.CDS_V_EstoqueLojasVLR_SIMULADO.Alignment:=taRightJustify;
  DMVirtual.CDS_V_EstoqueLojasPER_SIMULADOR.Alignment:=taRightJustify;
  DMVirtual.CDS_V_EstoqueLojasDIA_UTEIS.Alignment:=taRightJustify;
  DMVirtual.CDS_V_EstoqueLojasDTA_INICIO.Alignment:=taCenter;
  DMVirtual.CDS_V_EstoqueLojasDTA_FIM.Alignment:=taCenter;

end;

procedure TFrmControleEstoques.Dbg_ContEstSimuladorTitleClick(Column: TColumn);
begin
  If (OrderGrid='') or (OrderGrid='Crescente') Then
   Begin
     OrderByGrid(DMVirtual.CDS_V_EstoqueLojas, Dbg_ContEstSimulador, Column.FieldName, False);
     OrderGrid:='Decrescente';
   End
  Else
   Begin
     OrderByGrid(DMVirtual.CDS_V_EstoqueLojas, Dbg_ContEstSimulador, Column.FieldName, True);
     OrderGrid:='Crescente';
   End;

end;

end.
