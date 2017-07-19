unit UFrmPrioridadesReposicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGradientCaption, AppEvnts, JvExControls, JvXPCore,
  JvXPButtons, ExtCtrls, StdCtrls, Grids, DBGrids, JvExStdCtrls,
  JvCheckBox, Mask, JvExMask, JvToolEdit, ToolEdit, CurrEdit, JvRadioButton;

type
  TFrmPrioridadesReposicao = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    CorCaptionForm: TJvGradientCaption;
    Panel38: TPanel;
    Bt_Fechar: TJvXPButton;
    Panel1: TPanel;
    Pan_Produtos: TPanel;
    Pan_Prioridades: TPanel;
    Panel6: TPanel;
    PanManutPrioridade: TPanel;
    EdtDesPrioridade: TEdit;
    Label1: TLabel;
    EdtDtaInicial: TJvDateEdit;
    EdtDtaFinal: TJvDateEdit;
    CkB_Ativo: TJvCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bt_PrioridadeSalvar: TJvXPButton;
    Bt_PrioridadeDesfazer: TJvXPButton;
    Dbg_Prioridades: TDBGrid;
    Panel2: TPanel;
    Dbg_Produto: TDBGrid;
    Label75: TLabel;
    EdtCodProdLinx: TCurrencyEdit;
    Label183: TLabel;
    Label74: TLabel;
    EdtCodProduto: TCurrencyEdit;
    Bt_BuscaProdtudo: TJvXPButton;
    Bt_ProdutoExcluir: TJvXPButton;
    JvRadioButton1: TJvRadioButton;
    JvRadioButton2: TJvRadioButton;
    JvRadioButton3: TJvRadioButton;
    Label5: TLabel;
    EdtCodPrioridade: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure Dbg_PrioridadesEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrioridadesReposicao: TFrmPrioridadesReposicao;

  bgSairPR: Boolean;

implementation

uses DK_Procs1, UDMBelShop;

{$R *.dfm}

procedure TFrmPrioridadesReposicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSairPR Then
   Begin
     Action :=caHide;// caFree;
   End
  Else
   Begin
     msg('Para Fechar Tecle no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmPrioridadesReposicao.FormCreate(Sender: TObject);
begin
  // Acertar Erro na Rolagem do Mouse ==========================================
  Application.OnMessage := ApplicationEvents1Message;

  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

//  //============================================================================
//  // Show Hint em Forma de Balão ===============================================
//  //============================================================================
//  CreateToolTips(Self.Handle);
//  AddToolTip(Bt_FluFornComprovante.Handle, @ti, TipoDoIcone, 'Selecione o Comprovante'+#13+'a Incluir', 'INCLUIR !!');
//
//  CreateToolTips(Self.Handle);
//  AddToolTip(Bt_FluFornBuscaFornecedor.Handle, @ti, TipoDoIcone, 'Selecionar o'+#13+'Fornecedor', 'SELECIONAR !!');
//
//  CreateToolTips(Self.Handle);
//  AddToolTip(Bt_FluFornSalvaMemoria.Handle, @ti, TipoDoIcone, 'Salvar Resultado'+#13+'em Memória', 'CONTA CORRENTE !!');
//  // Show Hint em Forma de Balão ===============================================
//  //============================================================================

end;

procedure TFrmPrioridadesReposicao.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
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

procedure TFrmPrioridadesReposicao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmPrioridadesReposicao.FormShow(Sender: TObject);
begin
  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmPrioridadesReposicao);

  // Cor Form
  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

  bgSairPR:=False;

  EdtDesPrioridade.SetFocus;

end;

procedure TFrmPrioridadesReposicao.Bt_FecharClick(Sender: TObject);
begin
//  DMBelShop.CDS_FluxoFornecedor.Close;
//  DMBelShop.CDS_FluxoFornHistorico.Close;
  bgSairPR:=True;
  Close;
  Exit;

end;

procedure TFrmPrioridadesReposicao.Dbg_PrioridadesEnter(
  Sender: TObject);
begin
  // DBGRID - (ERRO) Acerta Rolagem do Mouse ===================================
  ApplicationEvents1.OnActivate:=Dbg_PrioridadesEnter;
  Application.OnMessage := ApplicationEvents1Message;
  ApplicationEvents1.Activate;

end;

end.
