{
 - Tamanho Padrão do Form:
          Width  = 565
          Height = 388
    - Automaticos os Doia a Baixo;      
    ClientHeight = 350
    ClientWidth  = 549

}

//  // ========== EFETUA A CONEXÃO ===============================================
//  FrmPesquisa:=TFrmPesquisa.Create(Self);
//
//  // ========== EXECUTA QUERY PARA PESQUISA ====================================
//  Screen.Cursor:=crSQLWait;
//
//  MySql:='Select p.Cod_Pessoa, p.Des_Pessoa'+
//
//         ' From ps_Fornecedores p'+
//
//         ' where Exists (select 1'+
//         ' from AC_ITENS_COT ic, ce_pars_calculo pl'+
//         ' where ic.cod_item=pl.cod_item'+
//         ' And p.cod_Pessoa=pl.cod_pessoa'+
//         ' and pl.cod_unidade='+Unid+
//         ' And ic.Num_seq='+EdtSequencia_Origem.Text+')'+
//
//         ' Order by p.Des_Pessoa';
//  DMBelShopPedidos.CDS_Pesquisa.Close;
//  DMBelShopPedidos.SQLQ_Pesquisa.Close;
//  DMBelShopPedidos.SQLQ_Pesquisa.SQL.Clear;
//  DMBelShopPedidos.SQLQ_Pesquisa.SQL.Add(MySql);
//  DMBelShopPedidos.CDS_Pesquisa.Open;
//
//  Screen.Cursor:=crDefault;
//
//  // ============== Verifica Existencia de Dados ===============================
//  If DMBelShopPedidos.CDS_Pesquisa.Eof Then
//  Begin
//    msg('Sem Operador a Listar !!','A');
//    Edit3.SetFocus;
//    Exit;
//  End;
//
//  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
//  FrmPesquisa.Campo_Pesquisa:='Des_Pessoa';
//  FrmPesquisa.Campo_Codigo:='Cod_Pessoa';
//  FrmPesquisa.Campo_Descricao:='Des_Pessoa';
//
//  FrmPesquisa.EdtDescricao.Text:= Edit de Pesquida no Form MAE
//
//  // Campos Qualquer de Retorno ================================================
//  // Variavel de Entrada  - Variavel de Retorno
//  // Campo_Retorno1       - Retorno1
//  // Campo_Retorno2       - Retorno2
//  // Campo_Retorno3       - Retorno3
//  FrmPesquisa.Campo_Retorno1:='Dta_Cadastro';
//  FrmPesquisa.Campo_Retorno2:='Cod_Cidade';
//  FrmPesquisa.Campo_Retorno3:='';
//
//  // ============= ABRE FORM DE PESQUISA =======================================
//  FrmPesquisa.ShowModal;
//  DMBelShopPedidos.CDS_Pesquisa.Close;
//
//  // ============= RETORNO =====================================================
//  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
//   Begin
//     EdtFabricante.Text:=FrmPesquisa.EdtCodigo.Text;
//     Edit3.Text:=FrmPesquisa.EdtDescricao.Text;
//   End
//  Else
//   Begin
//     EdtFabricante.Clear;
//     Edit3.Clear;
//   End; //   If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
//
//  // ============= If Trim(FrmPesquisa.EdtCodigo.Text)<>'' Then (COM RETORNO) ===
//  // ============= If Trim(FrmPesquisa.EdtCodigo.Text)='' Then (SEM RETORNO) ===

unit UPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, Grids, DBGrids, StdCtrls,
  Clipbrd, StrUtils, Math,
  DB, // ==> Qt, Trocado
  ExtCtrls, AppEvnts;

        {

   // SHOW HINT EM FORMA DE BALÃO

}
type
  TFrmPesquisa = class(TForm)
    Panel1: TPanel;
    EdtDescricao: TEdit;
    Label1: TLabel;
    Dbg_Pesquisa: TDBGrid;
    Panel2: TPanel;
    EdtCodigo: TEdit;
    Bt_PesquisaOK: TJvXPButton;
    Bt_PesquisaRetorna: TJvXPButton;
    ApplicationEvents1: TApplicationEvents;
    procedure EdtDescricaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Dbg_PesquisaTitleClick(Column: TColumn);
    procedure Dbg_PesquisaDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_PesquisaOKClick(Sender: TObject);
    procedure Bt_PesquisaRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    // Odir ====================================================================

    // Acerta Celulas em Dbg_Pesquisa ==========================================
    Procedure Dbg_PesquisaPesquisaDoctosOC;
    // Odir ====================================================================

    procedure Dbg_PesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Campo_Pesquisa: String;
    Campo_Codigo: String;
    Campo_Descricao: String;
    Campo_Retorno1: String;
    Campo_Retorno2: String;
    Campo_Retorno3: String;
    Retorno1: String;
    Retorno2: String;
    Retorno3: String;

    bgIncluirNovo: Boolean;
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

uses DK_Procs1, UDMBelShopPedidos;

{$R *.dfm}

// Acerta Celulas em Dbg_Pesquisa >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmPesquisa.Dbg_PesquisaPesquisaDoctosOC;
Begin
  FrmPesquisa.AutoSize:=False;
  FrmPesquisa.Width:=790;
  FrmPesquisa.AutoSize:=True;

  Dbg_Pesquisa.Columns[0].Alignment:=taRightJustify;
  Dbg_Pesquisa.Columns[0].Title.Alignment:=taRightJustify;
  Dbg_Pesquisa.Columns[0].Title.Caption:='Nº Docto';
  Dbg_Pesquisa.Columns[0].Width:=66;
  Dbg_Pesquisa.Columns[0].Color:=clYellow;
  Dbg_Pesquisa.Columns[0].Font.Style:=[fsBold];

  Dbg_Pesquisa.Columns[1].Alignment:=taCenter;
  Dbg_Pesquisa.Columns[1].Title.Alignment:=taCenter;
  Dbg_Pesquisa.Columns[1].Title.Caption:='Data Docto';
  Dbg_Pesquisa.Columns[1].Width:=74;

  Dbg_Pesquisa.Columns[2].Alignment:=taLeftJustify;
  Dbg_Pesquisa.Columns[2].Title.Alignment:=taLeftJustify;
  Dbg_Pesquisa.Columns[2].Title.Caption:='Nome Fornecedor';
  Dbg_Pesquisa.Columns[2].Width:=310;
  Dbg_Pesquisa.Columns[2].Color:=clYellow;
  Dbg_Pesquisa.Columns[2].Font.Style:=[fsBold];

  Dbg_Pesquisa.Columns[3].Alignment:=taRightJustify;
  Dbg_Pesquisa.Columns[3].Title.Alignment:=taRightJustify;
  Dbg_Pesquisa.Columns[3].Title.Caption:='Cód Forn';
  Dbg_Pesquisa.Columns[3].Width:=60;

  Dbg_Pesquisa.Columns[4].Alignment:=taLeftJustify;
  Dbg_Pesquisa.Columns[4].Title.Alignment:=taLeftJustify;
  Dbg_Pesquisa.Columns[4].Title.Caption:='Comprador';
  Dbg_Pesquisa.Columns[4].Width:=150;

  Dbg_Pesquisa.Columns[5].Alignment:=taCenter;
  Dbg_Pesquisa.Columns[5].Title.Alignment:=taCenter;
  Dbg_Pesquisa.Columns[5].Title.Caption:='Situação';
  Dbg_Pesquisa.Columns[5].Width:=70;

End; // Acerta Celulas em Dbg_Pesquisa >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmPesquisa.EdtDescricaoChange(Sender: TObject);
begin
 Try
   DMBelShopPedidos.CDS_Pesquisa.Filtered:=False;
   DMBelShopPedidos.CDS_Pesquisa.Filter:=AnsiUpperCase(Campo_Pesquisa)+' LIKE ''%'+AnsiUpperCase(EdtDescricao.Text)+'%''';
   DMBelShopPedidos.CDS_Pesquisa.Filtered:=True;
 Except
   DMBelShopPedidos.CDS_Pesquisa.Filtered:=False;
   DMBelShopPedidos.CDS_Pesquisa.Filter:=AnsiUpperCase(Campo_Pesquisa)+'='+QuotedStr(AnsiUpperCase(EdtDescricao.Text));
   DMBelShopPedidos.CDS_Pesquisa.Filtered:=True;
 End;

 DMBelShopPedidos.CDS_Pesquisa.Locate(Campo_pesquisa,EdtDescricao.Text,[]);
end;

procedure TFrmPesquisa.FormShow(Sender: TObject);
begin

  EdtCodigo.Clear;
  EdtDescricao.SetFocus;

  Label1.Caption:='Campo de Pesquisa: '+Campo_Pesquisa;
end;

procedure TFrmPesquisa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If (Key=#13) Then
   Bt_PesquisaOKClick(Sender);
end;

procedure TFrmPesquisa.Dbg_PesquisaTitleClick(Column: TColumn);
begin
  Campo_Pesquisa:=Column.FieldName;
  Label1.Caption:='Campo de Pesquisa: '+Campo_Pesquisa;
  EdtDescricao.SetFocus;

end;

procedure TFrmPesquisa.Dbg_PesquisaDblClick(Sender: TObject);
begin
  Bt_PesquisaOKClick(Sender);
end;

procedure TFrmPesquisa.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key=VK_Escape Then
  Begin
    EdtDescricao.Text:='';
    EdtCodigo.Text:='';
    Close;
  End;
end;

procedure TFrmPesquisa.Bt_PesquisaOKClick(Sender: TObject);
begin
  EdtCodigo.Text:=DMBelShopPedidos.CDS_Pesquisa.FieldByName(Campo_Codigo).AsString;
  EdtDescricao.Text:=DMBelShopPedidos.CDS_Pesquisa.FieldByName(Campo_Descricao).AsString;

  If Campo_Retorno1<>'' Then
   Retorno1:=DMBelShopPedidos.CDS_Pesquisa.FieldByName(Campo_Retorno1).AsString;

  If Campo_Retorno2<>'' Then
   Retorno2:=DMBelShopPedidos.CDS_Pesquisa.FieldByName(Campo_Retorno2).AsString;

  If Campo_Retorno3<>'' Then
   Retorno3:=DMBelShopPedidos.CDS_Pesquisa.FieldByName(Campo_Retorno3).AsString;

  Close;

end;

procedure TFrmPesquisa.Bt_PesquisaRetornaClick(Sender: TObject);
begin

  EdtDescricao.Text:='';
  EdtCodigo.Text:='0';

  Close;

end;

procedure TFrmPesquisa.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  bgIncluirNovo:=False;

  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  Application.OnMessage := ApplicationEvents1Message;
end;

procedure TFrmPesquisa.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmPesquisa.Dbg_PesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Não Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  If key=Vk_Return Then
   Bt_PesquisaOKClick(Sender);

end;

procedure TFrmPesquisa.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
  // (ERRO) ACERTA ROLAGEM DO MOUSE (SCROLL)
  If Msg.message = WM_MOUSEWHEEL then // primeiramente verificamos se é o evento a ser tratado...
  Begin
    // If (ActiveControl is TDBGrid) Or (ActiveControl is TDBGridJul) then // If Somente DBGRID *** Testa se Classe é TDBGRID
    If (ActiveControl is TDBGrid) then // If Somente DBGRID *** Testa se Classe é TDBGRID
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

end.
