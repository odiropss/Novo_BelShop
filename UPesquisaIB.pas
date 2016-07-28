//  // ========== EFETUA A CONEXÃO ===============================================
//  FrmPesquisaIB:=TFrmPesquisaIB.Create(Self);
//  FrmPesquisaIB.IB_Tabela.DataBase:=DM.IBDatabase;
//  FrmPesquisaIB.IB_Tabela.Transaction:=DM.IBTransaction;
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
//  FrmPesquisaIB.IB_Tabela.Close;
//  FrmPesquisaIB.IB_Tabela.SQL.Clear;
//  FrmPesquisaIB.IB_Tabela.SQL.Add(MySql);
//  FrmPesquisaIB.IB_Tabela.Open;
//
//  Screen.Cursor:=crDefault;
//
//  // ============== Verifica Existencia de Dados ===============================
//  If FrmPesquisaIB.IB_Tabela.Eof Then
//  Begin
//    msg('Sem Operador a Listar !!','A');
//    Edit3.SetFocus;
//    Exit;
//  End;
//
//  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
//  FrmPesquisaIB.Campo_Pesquisa:='Des_Pessoa';
//  FrmPesquisaIB.Campo_Codigo:='Cod_Pessoa';
//  FrmPesquisaIB.Campo_Descricao:='Des_Pessoa';
//
//  FrmPesquisaIB.EdtDescricao.Text:= Edit de Pesquida no Form MAE
//
//  // Campos Qualquer de Retorno ================================================
//  // Variavel de Entrada  - Variavel de Retorno
//  // Campo_Retorno1       - Retorno1
//  // Campo_Retorno2       - Retorno2
//  // Campo_Retorno3       - Retorno3
//  FrmPesquisaIB.Campo_Retorno1:='Dta_Cadastro';
//  FrmPesquisaIB.Campo_Retorno2:='Cod_Cidade';
//  FrmPesquisaIB.Campo_Retorno3:='';
//
//  // ============= ABRE FORM DE PESQUISA =======================================
//  FrmPesquisaIB.ShowModal;
//
//  // ============= RETORNO =====================================================
//  If Trim(FrmPesquisaIB.EdtCodigo.Text)<>'' Then
//   Begin
//     EdtFabricante.Text:=FrmPesquisaIB.EdtCodigo.Text;
//     Edit3.Text:=FrmPesquisaIB.EdtDescricao.Text;
//   End
//  Else
//   Begin
//     EdtFabricante.Clear;
//     Edit3.Clear;
//   End;
//
//  // ============= If Trim(FrmPesquisaIB.EdtCodigo.Text)<>'' Then (COM RETORNO) ===
//  // ============= If Trim(FrmPesquisaIB.EdtCodigo.Text)='' Then (SEM RETORNO) ===

unit UPesquisaIB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBClient, DBLocal, DBLocalI, DB, IBCustomDataSet, IBQuery,
  Clipbrd, // PrintScreen
  JvExControls, JvXPCore, JvXPButtons, Grids, DBGrids, StdCtrls, Qt, ExtCtrls;
//  Último: ExtCtrls;

{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Qt,
  FMTBcd, DBClient, Provider, SqlExpr, DBXpress, JvExControls, JvXPCore,
  Clipbrd, // PrintScreen
  JvXPButtons, IBCustomDataSet, IBQuery, DBLocal, DBLocalI;
}

type
  TFrmPesquisaIB = class(TForm)
    Panel1: TPanel;
    EdtDescricao: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    EdtCodigo: TEdit;
    DS_Tabela: TDataSource;
    Bt_PesquisaOK: TJvXPButton;
    Bt_PesquisaRetorna: TJvXPButton;
    IB_Tabela: TIBQuery;
    IBCDS_Pesquisa: TIBClientDataSet;
    procedure EdtDescricaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_PesquisaOKClick(Sender: TObject);
    procedure Bt_PesquisaRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
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
  end;

var
  FrmPesquisaIB: TFrmPesquisaIB;

implementation

{$R *.dfm}

// Rolagem no Grid com Mouse >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmPesquisaIB.MouseAppEventsMessage(var Msg: TMsg; var Handled: Boolean);
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

procedure TFrmPesquisaIB.EdtDescricaoChange(Sender: TObject);
begin

  IBCDS_Pesquisa.Filtered:=False;
  IBCDS_Pesquisa.Filter:='UPPER('+Campo_Pesquisa+') LIKE ''%'+EdtDescricao.Text+'%''';
  IBCDS_Pesquisa.Filtered:=True;

end;

procedure TFrmPesquisaIB.FormShow(Sender: TObject);
begin

  EdtCodigo.Clear;
  EdtDescricao.SetFocus;

  Label1.Caption:='Campo de Pesquisa: '+Campo_Pesquisa;
end;

procedure TFrmPesquisaIB.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If (Key=#13) Then
   Bt_PesquisaOKClick(Sender);
end;

procedure TFrmPesquisaIB.DBGrid1TitleClick(Column: TColumn);
begin
  Campo_Pesquisa:=Column.FieldName;
  Label1.Caption:='Campo de Pesquisa: '+Campo_Pesquisa;
  EdtDescricao.SetFocus;

end;

procedure TFrmPesquisaIB.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key=Key_Enter Then
   Bt_PesquisaOKClick(Sender);
end;

procedure TFrmPesquisaIB.DBGrid1DblClick(Sender: TObject);
begin
  Bt_PesquisaOKClick(Sender);
end;

procedure TFrmPesquisaIB.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key=VK_Escape Then
  Begin
    EdtDescricao.Text:='';
    EdtCodigo.Text:='';
    Close;
  End;
end;

procedure TFrmPesquisaIB.Bt_PesquisaOKClick(Sender: TObject);
begin
//  EdtCodigo.Text:=IB_Tabela.FieldByName(Campo_Codigo).AsString;
//  EdtDescricao.Text:=IB_Tabela.FieldByName(Campo_Descricao).AsString;
//
//  If Campo_Retorno1<>'' Then
//   Retorno1:=IB_Tabela.FieldByName(Campo_Retorno1).AsString;
//
//  If Campo_Retorno2<>'' Then
//   Retorno2:=IB_Tabela.FieldByName(Campo_Retorno2).AsString;
//
//  If Campo_Retorno3<>'' Then
//   Retorno3:=IB_Tabela.FieldByName(Campo_Retorno3).AsString;

  EdtCodigo.Text:=IBCDS_Pesquisa.FieldByName(Campo_Codigo).AsString;
  EdtDescricao.Text:=IBCDS_Pesquisa.FieldByName(Campo_Descricao).AsString;

  If Campo_Retorno1<>'' Then
   Retorno1:=IBCDS_Pesquisa.FieldByName(Campo_Retorno1).AsString;

  If Campo_Retorno2<>'' Then
   Retorno2:=IBCDS_Pesquisa.FieldByName(Campo_Retorno2).AsString;

  If Campo_Retorno3<>'' Then
   Retorno3:=IBCDS_Pesquisa.FieldByName(Campo_Retorno3).AsString;

  Close;

end;

procedure TFrmPesquisaIB.Bt_PesquisaRetornaClick(Sender: TObject);
begin

  EdtDescricao.Text:='';
  EdtCodigo.Text:='0';

  Close;

end;

procedure TFrmPesquisaIB.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  Application.OnMessage := MouseAppEventsMessage;
end;

procedure TFrmPesquisaIB.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';
end;

procedure TFrmPesquisaIB.DBGrid1CellClick(Column: TColumn);
begin
//  EdtCodigo.Text:=IBCDS_Pesquisa.FieldByName(Campo_Codigo).AsString;
//  EdtDescricao.Text:=IBCDS_Pesquisa.FieldByName(Campo_Descricao).AsString;
//
//  If Campo_Retorno1<>'' Then
//   Retorno1:=IBCDS_Pesquisa.FieldByName(Campo_Retorno1).AsString;
//
//  If Campo_Retorno2<>'' Then
//   Retorno2:=IBCDS_Pesquisa.FieldByName(Campo_Retorno2).AsString;
//
//  If Campo_Retorno3<>'' Then
//   Retorno3:=IBCDS_Pesquisa.FieldByName(Campo_Retorno3).AsString;
//
end;

end.
