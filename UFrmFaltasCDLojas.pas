unit UFrmFaltasCDLojas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, JvExControls, JvXPCore, JvXPButtons,
  StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
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
  Mask, ToolEdit, CurrEdit, CheckLst, RXCtrls;
//  Último: ExtCtrls;

{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExControls, JvXPCore, JvXPButtons, StdCtrls,
  ExtCtrls, Grids, DBGrids;
}

type
  TFrmFaltasCDLojas = class(TForm)
    Pan_FaltasCDLojasOpcoes: TPanel;
    Bt_FaltasCDLojasFechar: TJvXPButton;
    Dbg_FaltasCDLojas: TDBGrid;
    Pan_FaltasCDLojas: TPanel;
    Pan_FaltasCDLojas1: TPanel;
    Label3: TLabel;
    DtEdt_FaltasCDLojasDtaInicio: TcxDateEdit;
    Label2: TLabel;
    DtEdt_FaltasCDLojasDtaFim: TcxDateEdit;
    Bt_FaltasCDLojasBuscaMovtos: TJvXPButton;
    Pan_FaltasCDLojasSalvar: TPanel;
    Bt_FaltasCDLojasSalvaExcel: TJvXPButton;
    Bt_FaltasCDLojasClipboard: TJvXPButton;
    Cbx_ConsultaNfeSituacaoProd: TComboBox;
    Label4: TLabel;
    Clbx_FaltasCDLojasLojas: TRxCheckListBox;
    Clbx_FaltasCDLojasForn: TRxCheckListBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_FaltasCDLojasFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DtEdt_FaltasCDLojasDtaInicioPropertiesChange(
      Sender: TObject);
    procedure Clbx_FaltasCDLojasLojasClick(Sender: TObject);
    procedure Bt_FaltasCDLojasBuscaMovtosClick(Sender: TObject);

    // Odir


    // Odir

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFaltasCDLojas: TFrmFaltasCDLojas;

implementation

uses UDMBelShop, UFrmBelShop, DK_Procs1;

{$R *.dfm}

procedure TFrmFaltasCDLojas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FrmBelShop.FechaTudo;
end;

procedure TFrmFaltasCDLojas.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

end;

procedure TFrmFaltasCDLojas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmFaltasCDLojas.Bt_FaltasCDLojasFecharClick(Sender: TObject);
begin
  DMBelShop.CDS_FaltasCDLojas.Close;
  DMBelShop.CDS_FaltasCDLojas.Filter:='';
  DMBelShop.CDS_FaltasCDLojas.Filtered:=False;

  Clbx_FaltasCDLojasForn.Items.Clear;
  Clbx_FaltasCDLojasLojas.Items.Clear;

  Close;
end;

procedure TFrmFaltasCDLojas.FormShow(Sender: TObject);
begin
  // Coloca BitMaps em Componentes =============================================
  BitMaps(FrmFaltasCDLojas);

  DtEdt_FaltasCDLojasDtaInicio.SetFocus;
end;

procedure TFrmFaltasCDLojas.DtEdt_FaltasCDLojasDtaInicioPropertiesChange(Sender: TObject);
begin
  DMBelShop.CDS_FaltasCDLojas.Close;
  DMBelShop.CDS_FaltasCDLojas.Filter:='';
  DMBelShop.CDS_FaltasCDLojas.Filtered:=False;

  Clbx_FaltasCDLojasForn.Items.Clear;
  Clbx_FaltasCDLojasLojas.Items.Clear;
end;

procedure TFrmFaltasCDLojas.Clbx_FaltasCDLojasLojasClick(Sender: TObject);
begin

  If Not DMBelShop.CDS_FaltasCDLojas.IsEmpty Then
  Begin

    DMBelShop.CDS_FaltasCDLojas.Filter:='';
    DMBelShop.CDS_FaltasCDLojas.Filtered:=False;
  End; // If Not DMBelShop.CDS_FaltasCDLojas.IsEmpty Then

end;

procedure TFrmFaltasCDLojas.Bt_FaltasCDLojasBuscaMovtosClick(Sender: TObject);
Var
  MySql: String;
  sDtaI, sDtaF: String;
  i: Integer;
begin
  Screen.Cursor:=crAppStart;

  DMBelShop.CDS_FaltasCDLojas.Close;
  DMBelShop.CDS_FaltasCDLojas.Filter:='';
  DMBelShop.CDS_FaltasCDLojas.Filtered:=False;

  Clbx_FaltasCDLojasForn.Items.Clear;
  Clbx_FaltasCDLojasLojas.Items.Clear;

  sDtaI:=f_Troca('/','.',f_Troca('-','.',DtEdt_FaltasCDLojasDtaInicio.Text));
  sDtaF:=f_Troca('/','.',f_Troca('-','.',DtEdt_FaltasCDLojasDtaFim.Text));

  // Busca Lopjas ==============================================================
  MySql:=' SELECT'+
         ' DISTINCT se.cod_loja||''-''||em.razao_social Loja'+
         ' FROM ES_ESTOQUES_SEM se, EMP_CONEXOES em'+
         ' WHERE se.cod_loja=em.cod_filial'+
         ' AND se.dta_movto Between '+QuotedStr(sDtaI)+' AND '+QuotedStr(sDtaF)+
         ' AND se.ind_curva IS NOT NULL'+
         ' ORDER BY 1';
  DMBelShop.CDS_BuscaRapida.Close;
  DMBelShop.SDS_BuscaRapida.CommandText:=MySql;
  DMBelShop.CDS_BuscaRapida.Open;

  If Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Loja').AsString)='' Then
  Begin
    msg('Sem Movimentos no Período Solicitado !!', 'A');
    DMBelShop.CDS_BuscaRapida.Close;
    Exit;
  End;

  // Adiciona Dados ============================================================
  Clbx_FaltasCDLojasLojas.Items.Clear;

  DMBelShop.CDS_BuscaRapida.First;
  DMBelShop.CDS_BuscaRapida.DisableControls;
  While Not DMBelShop.CDS_BuscaRapida.Eof do
  Begin
    Clbx_FaltasCDLojasLojas.Items.Add(Trim(DMBelShop.CDS_BuscaRapida.FieldByName('Loja').AsString));

    DMBelShop.CDS_BuscaRapida.Next;
  End; // While Not DMBelShop.CDS_BuscaRapida.Eof do
  DMBelShop.CDS_BuscaRapida.EnableControls;
  DMBelShop.CDS_BuscaRapida.Close;

  // Coloca Todos Como Selecionados =============================================
  For i:=0 to Clbx_FaltasCDLojasLojas.Items.Count-1 do
   Clbx_FaltasCDLojasLojas.Checked[i]:=True;

  Screen.Cursor:=crDefault;
end;

end.
