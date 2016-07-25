unit UFrmObjetivosFormula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, JvExControls, JvXPCore, JvXPButtons, StdCtrls,
  Clipbrd, // PrintScreen
  ExtCtrls, ComCtrls;
//  Último: ComCtrls;

{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvExControls, JvXPCore, JvXPButtons, Mask,
  Clipbrd, // PrintScreen
  DBCtrls, ToolEdit, CurrEdit, RXCtrls, ComCtrls;
}

type
  TFrmObjetivosFormula = class(TForm)
    PC_Principal: TPageControl;
    Ts_ObjetivosFormulaCompr: TTabSheet;
    Ts_ObjetivosCalculaObjetivo: TTabSheet;
    Panel1: TPanel;
    Gb_ObjetivosFormulaComprovante: TGroupBox;
    EdtObjetivosFormulaDesComprovante: TEdit;
    Bt_ObjetivosFormulaBuscaComprovante: TJvXPButton;
    EdtObjetivosFormulaCodComprovante: TEdit;
    Gb_ObjetivosFormulaCampos: TGroupBox;
    Clbx_ObjetivosFormulaCampos: TRxCheckListBox;
    Panel50: TPanel;
    Bt_ObjetivosFormulaVoltar: TJvXPButton;
    Bt_ObjetivosFormulaTransportar: TJvXPButton;
    Panel2: TPanel;
    Gb_ObjetivosCalculaObjetivo1: TGroupBox;
    EdtObjetivosCalculoDesObjetivo1: TEdit;
    Bt_ObjetivosCalculoBuscaObjetivos1: TJvXPButton;
    EdtObjetivosCalculoCodObjetivo1: TEdit;
    Panel3: TPanel;
    Bt_ObjetivosCalculoVoltar: TJvXPButton;
    Bt_ObjetivosCalculoCalcular: TJvXPButton;
    Gb_ObjetivosCalculaObjetivo2: TGroupBox;
    EdtObjetivosCalculoDesObjetivo2: TEdit;
    Bt_ObjetivosCalculoBuscaObjetivos2: TJvXPButton;
    EdtObjetivosCalculoCodObjetivo2: TEdit;
    Gb_ObjetivosCalculaOperacoes: TGroupBox;
    Pan_ObjetivosCalculaOperacaoAdicao: TPanel;
    Pan_ObjetivosCalculaOperacaoSubtracao: TPanel;
    Pan_ObjetivosCalculaOperacaoDivisao: TPanel;
    Pan_ObjetivosCalculaOperacaoMultiplicacao: TPanel;
    Lb_ObjetivosCalculoOperacao: TLabel;
    Label1: TLabel;
    Ts_ObjetivosFormulaTpEstoque: TTabSheet;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Clbx_ObjetivosFormulaTpEstoque: TRxCheckListBox;
    Panel5: TPanel;
    Bt_ObjetivosFormulaTpEstoqueVoltar: TJvXPButton;
    Bt_ObjetivosFormulaTransportarTpEstoque: TJvXPButton;
    procedure Bt_ObjetivosFormulaVoltarClick(Sender: TObject);
    procedure Bt_ObjetivosFormulaBuscaComprovanteClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_ObjetivosFormulaTransportarClick(Sender: TObject);
    procedure EdtObjetivosFormulaCodComprovanteExit(Sender: TObject);
    procedure EdtObjetivosFormulaCodComprovanteKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Pan_ObjetivosCalculaOperacaoAdicaoClick(Sender: TObject);
    
    // Odir

    Procedure AcertaCorPanel(pan: TPanel);

    // Odir

    procedure Pan_ObjetivosCalculaOperacaoSubtracaoClick(Sender: TObject);
    procedure Pan_ObjetivosCalculaOperacaoMultiplicacaoClick(
      Sender: TObject);
    procedure Pan_ObjetivosCalculaOperacaoDivisaoClick(Sender: TObject);
    procedure Bt_ObjetivosCalculoCalcularClick(Sender: TObject);
    procedure EdtObjetivosCalculoCodObjetivo1Exit(Sender: TObject);
    procedure EdtObjetivosCalculoCodObjetivo2Exit(Sender: TObject);
    procedure Bt_ObjetivosCalculoBuscaObjetivos1Click(Sender: TObject);
    procedure Bt_ObjetivosCalculoBuscaObjetivos2Click(Sender: TObject);
    procedure PC_PrincipalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_ObjetivosCalculoVoltarClick(Sender: TObject);
    procedure Clbx_ObjetivosFormulaCamposClickCheck(Sender: TObject);
    procedure Clbx_ObjetivosFormulaTpEstoqueClickCheck(Sender: TObject);
    procedure Bt_ObjetivosFormulaTransportarTpEstoqueClick(
      Sender: TObject);
    procedure Bt_ObjetivosFormulaTpEstoqueVoltarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    sTipoOperacao: String;
  end;

var
  FrmObjetivosFormula: TFrmObjetivosFormula;

implementation

// Odirapagar 22/05/2014
// Retira do Uses: Uf_Conecta, uj_001, uj_002,

uses UDMBelShop, DK_Procs1, UPesquisa, UFrmBelShop, Math, DB;

{$R *.dfm}

// odir

Procedure TFrmObjetivosFormula.AcertaCorPanel(pan: TPanel);
Begin
  If pan.Caption='+' Then
  Begin
    sTipoOperacao:='+';
    pan.Color:=clLime;
//    Pan_ObjetivosCalculaOperacaoAdicao.Color:=$0080FFFF;
    Pan_ObjetivosCalculaOperacaoDivisao.Color:=$0080FFFF;
    Pan_ObjetivosCalculaOperacaoMultiplicacao.Color:=$0080FFFF;
    Pan_ObjetivosCalculaOperacaoSubtracao.Color:=$0080FFFF;

    Lb_ObjetivosCalculoOperacao.Caption:='Adiciona com...';
    Gb_ObjetivosCalculaObjetivo2.Caption:=' Informe o Objetivo para Adicionar ';
  End;

  If pan.Caption='-' Then
  Begin
    sTipoOperacao:='-';
    pan.Color:=clLime;
    Pan_ObjetivosCalculaOperacaoAdicao.Color:=$0080FFFF;
    Pan_ObjetivosCalculaOperacaoDivisao.Color:=$0080FFFF;
    Pan_ObjetivosCalculaOperacaoMultiplicacao.Color:=$0080FFFF;
//    Pan_ObjetivosCalculaOperacaoSubtracao.Color:=$0080FFFF;

    Lb_ObjetivosCalculoOperacao.Caption:='Subtraido de...';
    Gb_ObjetivosCalculaObjetivo2.Caption:=' Informe o Objetivo para Subtrair ';
  End;

  If pan.Caption='*' Then
  Begin
    sTipoOperacao:='*';
    pan.Color:=clLime;
    Pan_ObjetivosCalculaOperacaoAdicao.Color:=$0080FFFF;
    Pan_ObjetivosCalculaOperacaoDivisao.Color:=$0080FFFF;
//    Pan_ObjetivosCalculaOperacaoMultiplicacao.Color:=$0080FFFF;
    Pan_ObjetivosCalculaOperacaoSubtracao.Color:=$0080FFFF;

    Lb_ObjetivosCalculoOperacao.Caption:='Multiplicado por...';
    Gb_ObjetivosCalculaObjetivo2.Caption:=' Informe o Objetivo para Multiplicar ';
  End;
  
  If pan.Caption='/' Then
  Begin
    sTipoOperacao:='/';
    pan.Color:=clLime;
    Pan_ObjetivosCalculaOperacaoAdicao.Color:=$0080FFFF;
//    Pan_ObjetivosCalculaOperacaoDivisao.Color:=$0080FFFF;
    Pan_ObjetivosCalculaOperacaoMultiplicacao.Color:=$0080FFFF;
    Pan_ObjetivosCalculaOperacaoSubtracao.Color:=$0080FFFF;

    Lb_ObjetivosCalculoOperacao.Caption:='Dividido com...';
    Gb_ObjetivosCalculaObjetivo2.Caption:=' Informe o Objetivo para Dividir ';
  End;
End;

procedure TFrmObjetivosFormula.Bt_ObjetivosFormulaVoltarClick(
  Sender: TObject);
begin
  Close;
end;

procedure TFrmObjetivosFormula.Bt_ObjetivosFormulaBuscaComprovanteClick(
  Sender: TObject);
Var
  MySql: String;
  i: Integer;
Begin
  For i:=0 to Clbx_ObjetivosFormulaCampos.Items.Count-1 do
   Clbx_ObjetivosFormulaCampos.Checked[i]:=False;

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:='select c.DES_COMPROV, c.COD_COMPROV'+
         ' from FIN_COMPROVANTES c'+
         ' where c.cod_comprov<9000'+
         ' order by DES_COMPROV';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;
    
  // ============== Verifica Existencia de Dados ===============================
  If DMBelShop.CDS_Pesquisa.Eof Then
  Begin
    msg('Sem Registro a Listar !!','A');
    DMBelShop.CDS_Pesquisa.Close;
    EdtObjetivosFormulaCodComprovante.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='DES_COMPROV';
  FrmPesquisa.Campo_Codigo:='COD_COMPROV';
  FrmPesquisa.Campo_Descricao:='DES_COMPROV';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If Trim(FrmPesquisa.EdtCodigo.Text)<>'' Then
  Begin
    EdtObjetivosFormulaCodComprovante.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtObjetivosFormulaDesComprovante.Text:=FrmPesquisa.EdtDescricao.Text;
    SelectNext(ActiveControl,True,True);
  End;

  FrmPesquisa.Free;
end;

procedure TFrmObjetivosFormula.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmObjetivosFormula.Bt_ObjetivosFormulaTransportarClick(
  Sender: TObject);
Var
  i: Integer;
  b: Boolean;
begin
  If Trim(EdtObjetivosFormulaCodComprovante.Text)=''  Then
  Begin
    msg('Favor Informar o Comprovante !!','A');
    EdtObjetivosFormulaCodComprovante.SetFocus;
    Exit;
  End;

  Try
    i:=StrToInt(EdtObjetivosFormulaCodComprovante.Text);
    If i=0 Then
    Begin
      msg('Favor Informar o Comprovante !!','A');
      EdtObjetivosFormulaCodComprovante.SetFocus;
      Exit;
    End;
  Except
    msg('Favor Informar o Comprovante !!','A');
    EdtObjetivosFormulaCodComprovante.SetFocus;
    Exit;
  End;
  
  b:=False;
  For i:=0 to Clbx_ObjetivosFormulaCampos.Items.Count-1 do
  Begin
    If Clbx_ObjetivosFormulaCampos.Checked[i] Then
    Begin
      b:=True;
      Break;
    End;
  End; // For i:=0 to Clbx_ObjetivosFormulaCampos.Items.Count-1 do

  If Not b Then
  Begin
    msg('Favor Informar o Item ''Calcular por...'' !!','A');
    Clbx_ObjetivosFormulaCampos.SetFocus;
    Exit;
  End;

  bgProcessar:=True;
  Close;
end;

procedure TFrmObjetivosFormula.EdtObjetivosFormulaCodComprovanteExit(
  Sender: TObject);
Var
  MySql: String;
  i: Integer;
begin
  For i:=0 to Clbx_ObjetivosFormulaCampos.Items.Count-1 do
   Clbx_ObjetivosFormulaCampos.Checked[i]:=False;
  
  EdtObjetivosFormulaDesComprovante.Clear;
     
  Try
    i:=StrToInt(EdtObjetivosFormulaCodComprovante.Text);
    If i=0 Then
    Begin
      EdtObjetivosFormulaCodComprovante.SetFocus;
      Exit;
    End;
  Except
    EdtObjetivosFormulaCodComprovante.Text:='0';
    EdtObjetivosFormulaCodComprovante.SetFocus;
    Exit;
  End;
  
  If (Trim(EdtObjetivosFormulaCodComprovante.Text)<>'') And (EdtObjetivosFormulaCodComprovante.Text<>'0') Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Comprovante =======================================================
    MySql:='select c.des_comprov, c.cod_comprov'+
           ' from FIN_COMPROVANTES c'+
           ' where c.cod_comprov<9000'+
           ' and c.cod_comprov='+
           QuotedStr(EdtObjetivosFormulaCodComprovante.Text);
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    Screen.Cursor:=crDefault;

    If DMBelShop.CDS_Busca.Eof Then
    Begin
      msg('Comprovante NÃO Encontrado !!!', 'A');
      EdtObjetivosFormulaDesComprovante.Clear;
      EdtObjetivosFormulaCodComprovante.SetFocus;
      DMBelShop.CDS_Busca.Close;
      Exit;
    End;

    EdtObjetivosFormulaDesComprovante.Text:=DMBelShop.CDS_Busca.FieldByName('Des_Comprov').AsString;

    DMBelShop.CDS_Busca.Close;

  End;
end;

procedure TFrmObjetivosFormula.EdtObjetivosFormulaCodComprovanteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key=Vk_Return Then
  Begin
    try
      EdtObjetivosFormulaCodComprovante.Text := FormatFloat('000',StrToInt(EdtObjetivosFormulaCodComprovante.Text));
    except
    End;
  End;

end;

procedure TFrmObjetivosFormula.Pan_ObjetivosCalculaOperacaoAdicaoClick(Sender: TObject);
begin
 AcertaCorPanel(Pan_ObjetivosCalculaOperacaoAdicao);
end;

procedure TFrmObjetivosFormula.Pan_ObjetivosCalculaOperacaoSubtracaoClick(
  Sender: TObject);
begin
 AcertaCorPanel(Pan_ObjetivosCalculaOperacaoSubtracao);

end;

procedure TFrmObjetivosFormula.Pan_ObjetivosCalculaOperacaoMultiplicacaoClick(
  Sender: TObject);
begin
 AcertaCorPanel(Pan_ObjetivosCalculaOperacaoMultiplicacao);

end;

procedure TFrmObjetivosFormula.Pan_ObjetivosCalculaOperacaoDivisaoClick(
  Sender: TObject);
begin
 AcertaCorPanel(Pan_ObjetivosCalculaOperacaoDivisao);

end;

procedure TFrmObjetivosFormula.Bt_ObjetivosCalculoCalcularClick(Sender: TObject);
Var
  MySql: String;
begin

  If Trim(EdtObjetivosCalculoDesObjetivo1.Text)='' Then
  Begin
    msg('SEM Objetivo Selecionado !!','A');
    EdtObjetivosCalculoCodObjetivo1.SetFocus;
    Exit;
  End;
  
  If Trim(EdtObjetivosCalculoDesObjetivo2.Text)='' Then
  Begin
    msg('SEM Objetivo Selecionado !!','A');
    EdtObjetivosCalculoCodObjetivo2.SetFocus;
    Exit;
  End;

  If Trim(sTipoOperacao)='' Then
  Begin
    msg('Favor Seleiconar o Tipo de Operação !!','A');
    Gb_ObjetivosCalculaOperacoes.SetFocus;
    Exit;
  End;

  // Verifica se Objetivo Tem Valores ==========================================
  MySql:='select m.Cod_Filial'+
         ' from FIN_OBJETIVOS_METAS m'+
         ' where m.des_ano='+CurrToStr(FrmBelShop.EdtFinanObjetivosAno.Value)+
         ' and m.cod_objetivo='+EdtObjetivosCalculoCodObjetivo1.Text;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If DMBelShop.CDS_BuscaRapida.IsEmpty Then
  Begin
    msg('Objetivo Selecionado Nâo Contém Valores !!','A');
    DMBelShop.CDS_BuscaRapida.Close;
    EdtObjetivosCalculoCodObjetivo1.SetFocus;
    Exit;
  End;
  DMBelShop.CDS_BuscaRapida.Close;

  MySql:='select m.Cod_Filial'+
         ' from FIN_OBJETIVOS_METAS m'+
         ' where m.des_ano='+CurrToStr(FrmBelShop.EdtFinanObjetivosAno.Value)+
         ' and m.cod_objetivo='+EdtObjetivosCalculoCodObjetivo2.Text;
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If DMBelShop.CDS_BuscaRapida.IsEmpty Then
  Begin
    msg('Objetivo Selecionado Nâo Contém Valores !!','A');
    DMBelShop.CDS_BuscaRapida.Close;
    EdtObjetivosCalculoCodObjetivo2.SetFocus;
    Exit;
  End;
  DMBelShop.CDS_BuscaRapida.Close;
  
  If msg('Deseja Realmente Calcular o'+cr+cr+'Objetivo Selecionado ?','C')=2 Then
  Begin
    EdtObjetivosCalculoCodObjetivo1.SetFocus;
    Exit;
  End;

  bgProcessar:=True;
  Close;
end;

procedure TFrmObjetivosFormula.EdtObjetivosCalculoCodObjetivo1Exit(
  Sender: TObject);
Var
  MySql: String;
  i: Integer;
begin
  
  EdtObjetivosCalculoDesObjetivo1.Clear;
     
  Try
    i:=StrToInt(EdtObjetivosCalculoCodObjetivo1.Text);
    If i=0 Then
    Begin
      EdtObjetivosCalculoCodObjetivo1.SetFocus;
      Exit;
    End;
  Except
    EdtObjetivosCalculoCodObjetivo1.Text:='0';
    EdtObjetivosCalculoCodObjetivo1.SetFocus;
    Exit;
  End;
  
  If (Trim(EdtObjetivosCalculoCodObjetivo1.Text)<>'') And (EdtObjetivosCalculoCodObjetivo1.Text<>'0') Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Objetivo ==========================================================
    MySql:='select o.cod_objetivo, o.des_objetivo'+
           ' from FIN_OBJETIVOS o'+
           ' where o.cod_objetivo='+EdtObjetivosCalculoCodObjetivo1.Text+
           ' and o.cod_objetivo<>'+DMBelShop.CDS_ObjetivosCOD_OBJETIVO.AsString;
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    Screen.Cursor:=crDefault;

    If DMBelShop.CDS_Busca.Eof Then
    Begin
      msg('Objetivo NÃO Encontrado !!!', 'A');
      EdtObjetivosCalculoDesObjetivo1.Clear;
      EdtObjetivosCalculoCodObjetivo1.SetFocus;
      DMBelShop.CDS_Busca.Close;
      Exit;
    End;

    EdtObjetivosCalculoDesObjetivo1.Text:=DMBelShop.CDS_Busca.FieldByName('Des_Objetivo').AsString;

    DMBelShop.CDS_Busca.Close;

  End;
end;

procedure TFrmObjetivosFormula.EdtObjetivosCalculoCodObjetivo2Exit(
  Sender: TObject);
Var
  MySql: String;
  i: Integer;
begin
  
  EdtObjetivosCalculoDesObjetivo2.Clear;
     
  Try
    i:=StrToInt(EdtObjetivosCalculoCodObjetivo2.Text);
    If i=0 Then
    Begin
      EdtObjetivosCalculoCodObjetivo2.SetFocus;
      Exit;
    End;
  Except
    EdtObjetivosCalculoCodObjetivo2.Text:='0';
    EdtObjetivosCalculoCodObjetivo2.SetFocus;
    Exit;
  End;
  
  If (Trim(EdtObjetivosCalculoCodObjetivo2.Text)<>'') And (EdtObjetivosCalculoCodObjetivo2.Text<>'0') Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Objetivo ==========================================================
    MySql:='select o.cod_objetivo, o.des_objetivo'+
           ' from FIN_OBJETIVOS o'+
           ' where o.cod_objetivo='+EdtObjetivosCalculoCodObjetivo2.Text+
           ' And o.cod_objetivo<>'+DMBelShop.CDS_ObjetivosCOD_OBJETIVO.AsString;
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    Screen.Cursor:=crDefault;

    If DMBelShop.CDS_Busca.Eof Then
    Begin
      msg('Objetivo NÃO Encontrado !!!', 'A');
      EdtObjetivosCalculoDesObjetivo2.Clear;
      EdtObjetivosCalculoCodObjetivo2.SetFocus;
      DMBelShop.CDS_Busca.Close;
      Exit;
    End;

    EdtObjetivosCalculoDesObjetivo2.Text:=DMBelShop.CDS_Busca.FieldByName('Des_Objetivo').AsString;

    DMBelShop.CDS_Busca.Close;

  End;
end;

procedure TFrmObjetivosFormula.Bt_ObjetivosCalculoBuscaObjetivos1Click(
  Sender: TObject);
Var
  MySql: String;
Begin

  EdtObjetivosCalculoDesObjetivo1.Clear;
  
  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:='select o.cod_objetivo, o.des_objetivo'+
         ' from FIN_OBJETIVOS o'+
         ' Where o.cod_objetivo<>'+DMBelShop.CDS_ObjetivosCOD_OBJETIVO.AsString+
         ' order by o.des_objetivo';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;
    
  // ============== Verifica Existencia de Dados ===============================
  If DMBelShop.CDS_Pesquisa.Eof Then
  Begin
    msg('Sem Registro a Listar !!','A');
    DMBelShop.CDS_Pesquisa.Close;
    EdtObjetivosCalculoCodObjetivo1.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='DES_OBJETIVO';
  FrmPesquisa.Campo_Codigo:='COD_OBJETIVO';
  FrmPesquisa.Campo_Descricao:='DES_OBJETIVO';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If Trim(FrmPesquisa.EdtCodigo.Text)<>'' Then
  Begin
    EdtObjetivosCalculoCodObjetivo1.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtObjetivosCalculoDesObjetivo1.Text:=FrmPesquisa.EdtDescricao.Text;
    SelectNext(ActiveControl,True,True);
  End;

  FrmPesquisa.Free;
end;

procedure TFrmObjetivosFormula.Bt_ObjetivosCalculoBuscaObjetivos2Click(
  Sender: TObject);
Var
  MySql: String;
Begin

  EdtObjetivosCalculoDesObjetivo2.Clear;
  
  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:='select o.cod_objetivo, o.des_objetivo'+
         ' from FIN_OBJETIVOS o'+
         ' Where o.cod_objetivo<>'+DMBelShop.CDS_ObjetivosCOD_OBJETIVO.AsString+
         ' order by o.des_objetivo';
  DMBelShop.CDS_Pesquisa.Close;
  DMBelShop.CDS_Pesquisa.Filtered:=False;
  DMBelShop.SDS_Pesquisa.CommandText:=MySql;
  DMBelShop.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;
    
  // ============== Verifica Existencia de Dados ===============================
  If DMBelShop.CDS_Pesquisa.Eof Then
  Begin
    msg('Sem Registro a Listar !!','A');
    DMBelShop.CDS_Pesquisa.Close;
    EdtObjetivosCalculoCodObjetivo2.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='DES_OBJETIVO';
  FrmPesquisa.Campo_Codigo:='COD_OBJETIVO';
  FrmPesquisa.Campo_Descricao:='DES_OBJETIVO';
  FrmPesquisa.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMBelShop.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If Trim(FrmPesquisa.EdtCodigo.Text)<>'' Then
  Begin
    EdtObjetivosCalculoCodObjetivo2.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtObjetivosCalculoDesObjetivo2.Text:=FrmPesquisa.EdtDescricao.Text;
    SelectNext(ActiveControl,True,True);
  End;

  FrmPesquisa.Free;
end;

procedure TFrmObjetivosFormula.PC_PrincipalChange(Sender: TObject);
begin
  If (PC_Principal.ActivePage=Ts_ObjetivosFormulaCompr) And (Ts_ObjetivosFormulaCompr.CanFocus) Then
   EdtObjetivosFormulaCodComprovante.SetFocus;

  If (PC_Principal.ActivePage=Ts_ObjetivosCalculaObjetivo) And (Ts_ObjetivosCalculaObjetivo.CanFocus) Then
   EdtObjetivosCalculoCodObjetivo1.SetFocus;

  If (PC_Principal.ActivePage=Ts_ObjetivosFormulaTpEstoque) And (Ts_ObjetivosFormulaTpEstoque.CanFocus) Then
   Clbx_ObjetivosFormulaTpEstoque.SetFocus;

  CorSelecaoTabSheet(PC_Principal);


end;

procedure TFrmObjetivosFormula.FormShow(Sender: TObject);
begin

  PC_PrincipalChange(Self);

end;

procedure TFrmObjetivosFormula.Bt_ObjetivosCalculoVoltarClick(
  Sender: TObject);
begin
  Close;

end;

procedure TFrmObjetivosFormula.Clbx_ObjetivosFormulaCamposClickCheck(
  Sender: TObject);
Var
  i, iIndex: Integer;
  b: Boolean;
begin
  b:=True;
  Try
    i:=StrToInt(EdtObjetivosFormulaCodComprovante.Text);

    If i=0 Then
     b:=False;
  Except
     b:=False;
  End;
  
  If not b Then
  Begin
    For i:=0 to Clbx_ObjetivosFormulaCampos.Items.Count-1 do
     Clbx_ObjetivosFormulaCampos.Checked[i]:=False;
     
    msg('Favor Informar o Comprovante !!','A');
    EdtObjetivosFormulaCodComprovante.SetFocus;
    Exit;
  End;

  iIndex:=Clbx_ObjetivosFormulaCampos.ItemIndex;

  For i:=0 to Clbx_ObjetivosFormulaCampos.Items.Count-1 do
   Clbx_ObjetivosFormulaCampos.Checked[i]:=False;

  Clbx_ObjetivosFormulaCampos.Checked[iIndex]:=True;
end;

procedure TFrmObjetivosFormula.Clbx_ObjetivosFormulaTpEstoqueClickCheck(Sender: TObject);
Var
  i, iIndex: Integer;
begin

  iIndex:=Clbx_ObjetivosFormulaTpEstoque.ItemIndex;

  For i:=0 to Clbx_ObjetivosFormulaTpEstoque.Items.Count-1 do
   Clbx_ObjetivosFormulaTpEstoque.Checked[i]:=False;

  Clbx_ObjetivosFormulaTpEstoque.Checked[iIndex]:=True;

end;

procedure TFrmObjetivosFormula.Bt_ObjetivosFormulaTransportarTpEstoqueClick(
  Sender: TObject);
Var
  i: Integer;
  b: Boolean;
begin
  b:=False;
  For i:=0 to Clbx_ObjetivosFormulaTpEstoque.Items.Count-1 do
  Begin
    If Clbx_ObjetivosFormulaTpEstoque.Checked[i] Then
    Begin
      b:=True;
      Break;
    End;
  End; // For i:=0 to Clbx_ObjetivosFormulaTpEstoque.Items.Count-1 do

  If Not b Then
  Begin
    msg('Favor Informar o Tipo de Estoque !!','A');
    Clbx_ObjetivosFormulaTpEstoque.SetFocus;
    Exit;
  End;
  
  bgProcessar:=True;
  Close;
end;

procedure TFrmObjetivosFormula.Bt_ObjetivosFormulaTpEstoqueVoltarClick(
  Sender: TObject);
begin
  Close;

end;

procedure TFrmObjetivosFormula.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmObjetivosFormula.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

end.
