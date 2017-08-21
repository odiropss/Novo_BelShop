unit UFrmRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvOutlookBar, JvExControls, JvXPCore, JvXPButtons, ExtCtrls,
  ComCtrls, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  jpeg, Grids, DBGrids, Mask, ToolEdit, CurrEdit;

type
  TFrmRelatorios = class(TForm)
    PC_Relatorios: TPageControl;
    Ts_MateriaPrima: TTabSheet;
    Ts_Produtos: TTabSheet;
    Ts_PessoasEntidades: TTabSheet;
    Ts_Despesas: TTabSheet;
    Ts_LancamentoNotas: TTabSheet;
    Pan_Baixo: TPanel;
    Pan_Opcoes: TPanel;
    Bt_Retornar: TJvXPButton;
    Pan_OutLook: TPanel;
    OutLook: TJvOutlookBar;
    Ts_PedidosVendas: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Gb_Pessoa: TGroupBox;
    EdtDesPessoa: TEdit;
    EdtCodPessoa: TCurrencyEdit;
    Bt_BuscaPessoa: TJvXPButton;
    Gb_Periodo: TGroupBox;
    Label83: TLabel;
    DtaEdtInicio: TcxDateEdit;
    DtaEdtFim: TcxDateEdit;
    Dbg_Pedidos: TDBGrid;
    Bt_Salvar: TJvXPButton;
    Bt_Buscar: TJvXPButton;
    Bt_Imprimir: TJvXPButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure OutLookPages0Buttons0Click(Sender: TObject);
    procedure Bt_RetornarClick(Sender: TObject);

    // ODIR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    // Todas as TabSheet's Invisiveis
    Procedure DesabilitaTodasTabSheets(PC: TPageControl);

    Procedure BotaoHabilita(bBuscar, bSalvar, bImprimir: Boolean);

    // ODIR >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure OutLookClick(Sender: TObject);
    procedure OutLookButtonClick(Sender: TObject; Index: Integer);
    procedure PC_RelatoriosChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorios: TFrmRelatorios;

implementation

uses UDMArtesanalis, DK_Procs1;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - INICIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita e/ou Desabilita Botões >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmRelatorios.BotaoHabilita(bBuscar, bSalvar, bImprimir: Boolean);
Begin
   Bt_Buscar.Enabled  :=bBuscar;
   Bt_Salvar.Enabled  :=bSalvar;
   Bt_Imprimir.Enabled:=bImprimir;
End; // Habilita e/ou Desabilita Botões >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Desabilita Todas as TabSheet de um PageControl >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmRelatorios.DesabilitaTodasTabSheets(PC: TPageControl);
Var
  i: Integer;
Begin
  // Desabilita TabSheets ======================================================
  For i:=0 to FrmRelatorios.ComponentCount-1 do
  Begin
    If FrmRelatorios.Components[i] is TTabSheet Then
    Begin
      If (FrmRelatorios.Components[i] as TTabSheet).Parent=PC Then
      Begin
        (FrmRelatorios.Components[i] as TTabSheet).TabVisible:=False;
      End;
    End; // If FrmRelatorios.Components[i] is TTabSheet Then
  End; // For i:=0 to FrmRelatorios.ComponentCount-1 do

//OdirAPapgar
//  // Desabilita Botoes de Calculo ==============================================
//  Bt_ProfINSSTXSCalcular.Visible:=False;
//  Bt_ProfINSSTXSExcel.Visible:=False;
//  Bt_ProfINSSTXSClipboard.Visible:=False;
//
//  Bt_MovtosRHRetornar.Visible:=True;
//  Bt_Fechar.Visible:=False;

End; // Desabilita Todas as TabSheet de um PageControl >>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// ODIR - FIM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmRelatorios.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('RELATÓRIOS');

end;

procedure TFrmRelatorios.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

procedure TFrmRelatorios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmRelatorios.OutLookPages0Buttons0Click(Sender: TObject);
begin
  // Desabilita Todas as TabSheets e Botoes ====================================
  DesabilitaTodasTabSheets(PC_Relatorios);
  BotaoHabilita(False, False, False);


  If (Sender is TJvOutlookBarButton) Then
  Begin
    // Habilita TabSheet =======================================================
    If (Sender as TJvOutlookBarButton).Caption='&Matérias-Primas' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_MateriaPrima;
      Ts_MateriaPrima.TabVisible:=True;
    End;

    If (Sender as TJvOutlookBarButton).Caption='&Produtos' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_Produtos;
      Ts_Produtos.TabVisible:=True;
    End;

    If (Sender as TJvOutlookBarButton).Caption='&Pessoas/Entidades' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_PessoasEntidades;
      Ts_PessoasEntidades.TabVisible:=True;
    End;

    If (Sender as TJvOutlookBarButton).Caption='&Despesas' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_Despesas;
      Ts_Despesas.TabVisible:=True;
    End;

    If (Sender as TJvOutlookBarButton).Caption='&Lançamento de Notas' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_LancamentoNotas;
      Ts_LancamentoNotas.TabVisible:=True;
    End;

    If (Sender as TJvOutlookBarButton).Caption='&Pedidos de Vendas' Then
    Begin
      PC_Relatorios.ActivePage:=Ts_PedidosVendas;
      Ts_PedidosVendas.TabVisible:=True;
    End;
  End; // If (Sender is TComboBoxJul) Then

  PC_RelatoriosChange(Self);

end;

procedure TFrmRelatorios.Bt_RetornarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelatorios.OutLookClick(Sender: TObject);
Var
  ii, i: Integer;
begin
  For i:=0 to OutLook.Pages.Count-1 do
  Begin
    For ii:=0 to OutLook.Pages[i].Buttons.Count-1 do
    Begin
      OutLook.Pages[i].Buttons[ii].Down:=False;
    End;
  End; // For i:=0 to OutLook.Pages.Count-1 do
end;

procedure TFrmRelatorios.OutLookButtonClick(Sender: TObject;Index: Integer);
begin
  OutLook.Pages[OutLook.ActivePageIndex].Buttons[index].Down:=True;

end;

procedure TFrmRelatorios.PC_RelatoriosChange(Sender: TObject);
begin
  CorSelecaoTabSheet(PC_ProfMovtosRH);

  // Taxa Sindicato ==========================================================
  If (PC_ProfMovtosRH.ActivePage=Ts_ProfTaxaSindicato) And (Ts_ProfTaxaSindicato.CanFocus) Then
  Begin
    Gb_INSS_PSLocaliza.Parent:=Ts_ProfTaxaSindicato;
    sgINSS_PS:='S';

    MySql:= ' SELECT p.mes_cobranca_sindicato Mes FROM parametros p';
    DMBelShop.CDS_BuscaRapida.Close;
    DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
    DMBelShop.CDS_BuscaRapida.Open;
    Cbx_INSS_PSMes.ItemIndex:=Cbx_INSS_PSMes.Items.IndexOf(DMBelShop.CDS_BuscaRapida.FieldByName('Mes').AsString);
    Cbx_INSS_PSMesChange(Self);
    DMBelShop.CDS_BuscaRapida.Close;

    Cbx_INSS_PSMes.Enabled:=False;
    Cbx_INSS_PSMes.Color:=$00E0E0E0;
  End; // If (PC_ProfCobrancas.ActivePage=Ts_ProfTaxaSindicato) And (Ts_ProfTaxaSindicato.CanFocus) Then

end;

procedure TFrmRelatorios.FormShow(Sender: TObject);
begin
  // Todas as TabSheet's Invisiveis ============================================
  DesabilitaTodasTabSheets(PC_Relatorios);

  BotaoHabilita(False, False, False);

end;

end.
