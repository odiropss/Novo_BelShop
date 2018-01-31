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
//  DMArtesanalis.CDS_Pesquisa.Close;
//  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
//  DMArtesanalis.CDS_Pesquisa.Open;
//
//  Screen.Cursor:=crDefault;
//
//  // ============== Verifica Existencia de Dados ===============================
//  If FrmPesquisa.DMArtesanalis.CDS_Pesquisa.Eof Then
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
//  DMArtesanalis.CDS_Pesquisa.Close;
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
  Clipbrd,
  Qt, ExtCtrls;

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
    Bt_PesquisaNovo: TJvXPButton;
    procedure EdtDescricaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Dbg_PesquisaTitleClick(Column: TColumn);
    procedure Dbg_PesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_PesquisaDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_PesquisaOKClick(Sender: TObject);
    procedure Bt_PesquisaRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    // Odir ====================================================================

    // Dbg_Pesquisa para Pesquisa de Documentos de OC ==============================
    Procedure Dbg_PesquisaPesquisaDoctosOC;
    procedure Dbg_PesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_PesquisaNovoClick(Sender: TObject);

    // Odir ====================================================================
  private
    { Private declarations }
    // Rolagem no Grid com Mouse
    procedure MouseAppEventsMessage(var Msg: TMsg; var Handled: Boolean);

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

uses UDMArtesanalis, DK_Procs1;

{$R *.dfm}

// Dbg_Pesquisa para Pesquisa de Documentos de OC ==============================
Procedure TFrmPesquisa.Dbg_PesquisaPesquisaDoctosOC;
Begin
  FrmPesquisa.AutoSize:=False;
  FrmPesquisa.Width:=700;
  FrmPesquisa.AutoSize:=True;

  Dbg_Pesquisa.Columns[0].Alignment:=taRightJustify;
  Dbg_Pesquisa.Columns[0].Title.Alignment:=taRightJustify;
  Dbg_Pesquisa.Columns[0].Title.Caption:='Nº Docto';
  Dbg_Pesquisa.Columns[0].Width:=70;
  Dbg_Pesquisa.Columns[0].Color:=clYellow;
  Dbg_Pesquisa.Columns[0].Font.Style:=[fsBold];

  Dbg_Pesquisa.Columns[1].Alignment:=taLeftJustify;
  Dbg_Pesquisa.Columns[1].Title.Alignment:=taLeftJustify;
  Dbg_Pesquisa.Columns[1].Title.Caption:='Comprador';
  Dbg_Pesquisa.Columns[1].Width:=100;

  Dbg_Pesquisa.Columns[2].Alignment:=taLeftJustify;
  Dbg_Pesquisa.Columns[2].Title.Alignment:=taLeftJustify;
  Dbg_Pesquisa.Columns[2].Title.Caption:='Origem do Docto';
  Dbg_Pesquisa.Columns[2].Width:=300;
  Dbg_Pesquisa.Columns[2].Color:=clYellow;
  Dbg_Pesquisa.Columns[2].Font.Style:=[fsBold];

  Dbg_Pesquisa.Columns[3].Alignment:=taCenter;
  Dbg_Pesquisa.Columns[3].Title.Alignment:=taCenter;
  Dbg_Pesquisa.Columns[3].Title.Caption:='Data Docto';
  Dbg_Pesquisa.Columns[3].Width:=80;

  Dbg_Pesquisa.Columns[4].Alignment:=taRightJustify;
  Dbg_Pesquisa.Columns[4].Title.Alignment:=taRightJustify;
  Dbg_Pesquisa.Columns[4].Title.Caption:='Cód Comprador';
  Dbg_Pesquisa.Columns[4].Width:=100;
End;

// Rolagem no Grid com Mouse >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmPesquisa.MouseAppEventsMessage(var Msg: TMsg; var Handled: Boolean);
var
  Sentido: SmallInt;
begin
 // primeiramente verificamos se é o evento a ser tratado...
 if Msg.message = WM_MOUSEWHEEL then
 Begin
   if ActiveControl is TDBGrid then   // <=== AQUI você testa se classe é TDBGRID
   begin
     Msg.message := WM_KEYDOWN;
     Msg.lParam := 0;
     Sentido := HiWord(Msg.wParam);
     if Sentido > 0 then
      Msg.wParam := VK_UP
     else
      Msg.wParam := VK_DOWN;
   end; // if ActiveControl is TDBGrid then
 End; // if Msg.message = WM_MOUSEWHEEL then
end; // // Rolagem no Grid com Mouse >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmPesquisa.EdtDescricaoChange(Sender: TObject);
begin
 Try
   DMArtesanalis.CDS_Pesquisa.Filtered:=False;
   DMArtesanalis.CDS_Pesquisa.Filter:=AnsiUpperCase(Campo_Pesquisa)+' LIKE ''%'+AnsiUpperCase(EdtDescricao.Text)+'%''';
   DMArtesanalis.CDS_Pesquisa.Filtered:=True;
 Except
   DMArtesanalis.CDS_Pesquisa.Filtered:=False;
   DMArtesanalis.CDS_Pesquisa.Filter:=AnsiUpperCase(Campo_Pesquisa)+'='+QuotedStr(AnsiUpperCase(EdtDescricao.Text));
   DMArtesanalis.CDS_Pesquisa.Filtered:=True;
 End;

 DMArtesanalis.CDS_Pesquisa.Locate(Campo_pesquisa,EdtDescricao.Text,[]);
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

procedure TFrmPesquisa.Dbg_PesquisaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If key=Key_Enter Then
   Bt_PesquisaOKClick(Sender);
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
  EdtCodigo.Text   :=DMArtesanalis.CDS_Pesquisa.FieldByName(Campo_Codigo).AsString;
  EdtDescricao.Text:=DMArtesanalis.CDS_Pesquisa.FieldByName(Campo_Descricao).AsString;

  If Campo_Retorno1<>'' Then
   Retorno1:=DMArtesanalis.CDS_Pesquisa.FieldByName(Campo_Retorno1).AsString;

  If Campo_Retorno2<>'' Then
   Retorno2:=DMArtesanalis.CDS_Pesquisa.FieldByName(Campo_Retorno2).AsString;

  If Campo_Retorno3<>'' Then
   Retorno3:=DMArtesanalis.CDS_Pesquisa.FieldByName(Campo_Retorno3).AsString;

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

  Application.OnMessage := MouseAppEventsMessage;

  bgIncluirNovo:=False;

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


end;

procedure TFrmPesquisa.Bt_PesquisaNovoClick(Sender: TObject);
begin
  if msg('Deseja Realmente Incluir ??','C')=2 Then
   Exit;

  bgIncluirNovo:=True;

  Bt_PesquisaRetornaClick(Self);
end;

end.
