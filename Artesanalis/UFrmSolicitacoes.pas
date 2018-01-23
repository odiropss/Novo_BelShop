unit UFrmSolicitacoes;

{
Formulário: FrmSolicitacoes
                Padrão  Pagamentos
ClientHeight =  464     198
ClientWidth  =  700     362
==============================================
  // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) ==============
  FrmSolicitacoes:=TFrmSolicitacoes.Create(Self);
  AbreSolicitacoes(0);

  // Cria ClientDataSet Virtual - CDS_V_ProfSeleciona ========================
  If DMSalao.CDS_V_ProfSeleciona.Active Then
   DMSalao.CDS_V_ProfSeleciona.Close;

  DMSalao.CDS_V_ProfSeleciona.CreateDataSet;
  DMSalao.CDS_V_ProfSeleciona.Open;

  FrmSolicitacoes.EdtSolicExpDoctoOrigem.Value:=EdtGeraOCBuscaDocto.Value;
  FrmSolicitacoes.EdtSolicExpLoja.Text:=DMBelShop.IBQ_AComprarCOD_EMPRESA.AsString+' - '+
                                        DMBelShop.IBQ_AComprarDES_EMPRESA.AsString;

  FrmSolicitacoes.EdtSolicExpDoctoDestino.Value:=0;
  FrmSolicitacoes.EdtSolicExpTpExportacao.Text:='TODOS OS PRODUTOS';
  FrmSolicitacoes.EdtSolicExpTpExportacao.Color:=clRed;

  FrmSolicitacoes.Ckb_SolicExpExcProduto.Checked:=True;
  FrmSolicitacoes.Ckb_SolicExpExcProdutoClick(Self);

  FrmSolicitacoes.Ckb_SolicExpSoProduto.Checked:=False;
  FrmSolicitacoes.Ckb_SolicExpSoProdutoClick(Self);

  bgProcessar:=False;
  FrmSolicitacoes.ShowModal;

  If bgProcessar Then
  Begin
    EdtGeraOCBuscaDoctoExit(Self);
  End; // If bgProcessar Then
  FreeAndNil(FrmSolicitacoes);

TabIndex:
   0 = Contas a Pagar - Data e Valor de Pagamento - Ts_Pagamento
   1 =
   2 =
   3 =
   4 =
   5 =
   6 =
   7 =
   8 =
   9 =
  10 =
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, JvExControls, JvXPCore, JvXPButtons, ExtCtrls,
  StdCtrls, Mask, ToolEdit, CurrEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ComCtrls;

type
  TFrmSolicitacoes = class(TForm)
    PC_Principal: TPageControl;
    Ts_Pagamento: TTabSheet;
    Panel1: TPanel;
    Bt_OK: TJvXPButton;
    Bt_Retornar: TJvXPButton;
    Gb_DtaPagto: TGroupBox;
    DtEdt_DtaPagto: TcxDateEdit;
    Gb_VlrPagto: TGroupBox;
    EdtVlrPagto: TCurrencyEdit;
    procedure Bt_OKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_RetornarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PC_PrincipalChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    // Odir ====================================================================

    Procedure AbreSolicitacoes(index: Integer);

    // Odir ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
    bgProcessado: Boolean;
  end;

var
  FrmSolicitacoes: TFrmSolicitacoes;

implementation

uses DK_Procs1;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) >>>>>>>>>>>>>>>>
Procedure TFrmSolicitacoes.AbreSolicitacoes(index: Integer);
Var
  i: Integer;
  TS: TTabSheet;
Begin

  For i:=0 to FrmSolicitacoes.PC_Principal.ControlCount-1 do
  Begin
    FrmSolicitacoes.PC_Principal.TabIndex:=i;

    TS:=FrmSolicitacoes.PC_Principal.ActivePage;

    ts.TabVisible:=False;
    If TS.PageIndex=index Then
     ts.TabVisible:=True;
  End; // For i:=0 to FrmSolicitacoes.PC_Principal.ControlCount-1 do

End; // Abre Form de Solicitações (Enviar o TabIndex a Manter Ativo) >>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmSolicitacoes.Bt_OKClick(Sender: TObject);
begin
  bgProcessado:=True;

  Close;
end;

procedure TFrmSolicitacoes.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  bgProcessado:=False;

end;

procedure TFrmSolicitacoes.Bt_RetornarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSolicitacoes.FormShow(Sender: TObject);
begin
  AutoSize:=True;
  PC_PrincipalChange(Self);
end;

procedure TFrmSolicitacoes.PC_PrincipalChange(Sender: TObject);
begin
  Try
    CorSelecaoTabSheet(PC_Principal);
  Except
  End;

  // Pagamentos ================================================================
  If (PC_Principal.ActivePage=Ts_Pagamento) And (Ts_Pagamento.CanFocus) Then
  Begin
    DtEdt_DtaPagto.SetFocus;
  End; // If (PC_Principal.ActivePage=Ts_Pagamento) And (Ts_Pagamento.CanFocus) Then

end;

procedure TFrmSolicitacoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

end.
