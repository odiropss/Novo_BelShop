unit UFrmPeriodoApropriacao;
{
EdtNumero: Usado em TFrmSalao.Bt_CadProfNovaRenovacaoClick(Sender: TObject);
Lb_Numero: Usado em TFrmSalao.Bt_CadProfNovaRenovacaoClick(Sender: TObject);
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, StdCtrls,
  JvExStdCtrls, JvRadioButton, Mask, JvExMask, JvSpin, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, JvExControls, JvXPCore,
  Clipbrd, // PrintScreen
  JvXPButtons, ExtCtrls, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;
//  Último: ExtCtrls;

type
  TFrmPeriodoApropriacao = class(TForm)
    Panel1: TPanel;
    Panel56: TPanel;
    Bt_PeriodoAproprVoltar: TJvXPButton;
    Bt_PeriodoAproprOK: TJvXPButton;
    Label74: TLabel;
    DtEdt_PeriodoAproprDtaInicio: TcxDateEdit;
    Label75: TLabel;
    DtEdt_PeriodoAproprDtaFim: TcxDateEdit;
    Lb_Informacao: TLabel;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure Bt_PeriodoAproprOKClick(Sender: TObject);
    procedure Bt_PeriodoAproprVoltarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sgTipoProc: String;
  end;

var
  FrmPeriodoApropriacao: TFrmPeriodoApropriacao;

implementation

uses DK_Procs1, UDMAcceraLoreal;

{$R *.dfm}

procedure TFrmPeriodoApropriacao.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

//  // Não Permite Movimentar o Formulário =======================================
//  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

end;

procedure TFrmPeriodoApropriacao.Bt_PeriodoAproprOKClick(Sender: TObject);
Var
  sMensagem: String;
begin
  Try
    StrToDate(DtEdt_PeriodoAproprDtaInicio.Text);
  Except
    msg('Data Inicial do Período Inválida !!','A');
    DtEdt_PeriodoAproprDtaInicio.SetFocus;
    Exit;
  End;

  Try
    StrToDate(DtEdt_PeriodoAproprDtaFim.Text);
  Except
    msg('Data Final do Período Inválida !!','A');
    DtEdt_PeriodoAproprDtaFim.SetFocus;
    Exit;
  End;

  If DtEdt_PeriodoAproprDtaFim.Date<DtEdt_PeriodoAproprDtaInicio.Date Then
  Begin
    msg('Período Inválido !!','A');
    DtEdt_PeriodoAproprDtaInicio.SetFocus;
    Exit;
  End;

  If msg(DtEdt_PeriodoAproprDtaInicio.Text+' a '+DtEdt_PeriodoAproprDtaFim.Text+cr+cr+'O Período Esta CORRETO ??','C')=2 Then
  Begin
    DtEdt_PeriodoAproprDtaInicio.SetFocus;
    Exit;
  End;

  bgSiga:=True;
  Close;
end;

procedure TFrmPeriodoApropriacao.Bt_PeriodoAproprVoltarClick(Sender: TObject);
begin
  bgSiga:=False;
  Close;
end;

procedure TFrmPeriodoApropriacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmPeriodoApropriacao.FormShow(Sender: TObject);
begin
  DtEdt_PeriodoAproprDtaInicio.SetFocus;
end;

end.

