unit UFrmMovimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinsdxStatusBarPainter, JvExControls, JvXPCore, JvXPButtons,
  dxStatusBar, Grids, DBGrids, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls,
  DBXpress;

type
  TFrmMovimentos = class(TForm)
    Gb_Principal: TGroupBox;
    Pan_MateriaPrimaSolic: TPanel;
    Gb_MateriaPrimaCod: TGroupBox;
    EdtMateriaPrimaCod: TCurrencyEdit;
    Gb_MateriaPrimaDesc: TGroupBox;
    EdtMateriaPrimaDesc: TEdit;
    Gb_MateriaPrimaUnid: TGroupBox;
    EdtMateriaPrimaUnid: TEdit;
    Gb_MateriaPrimaCusto: TGroupBox;
    EdtMateriaPrimaCusto: TCurrencyEdit;
    Gb_MateriaPrimaCustoMedio: TGroupBox;
    EdtMateriaPrimaCustoMedio: TCurrencyEdit;
    Gb_MateriaPrimaQtdSaldo: TGroupBox;
    EdtMateriaPrimaQtdSaldo: TCurrencyEdit;
    Pan_MateriaPrima: TPanel;
    Dbg_MateriaPrima: TDBGrid;
    StB_MateriaPrima: TdxStatusBar;
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    Bt_Salvar: TJvXPButton;
    Bt_Abandonar: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    OdirPanApres: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovimentos: TFrmMovimentos;

  TD: TTransactionDesc;

  bgSairMovtos: Boolean;

  sgMensagem: String;

implementation

uses DK_Procs1, UDMArtesanalis, UPesquisa;

{$R *.dfm}

procedure TFrmMovimentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Not bgSairMovtos Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Botão <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('Movimentos de Entrada');

end;

procedure TFrmMovimentos.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

procedure TFrmMovimentos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmMovimentos.FormShow(Sender: TObject);
begin
  bgSairMovtos:=False;

//  EdtMateriaPrimaCod.AsInteger:=0;
//  EdtMateriaPrimaDesc.Clear;
//  EdtMateriaPrimaUnid.Clear;
//  EdtMateriaPrimaCusto.Value:=0.00;
//  EdtMateriaPrimaCustoMedio.Value:=0.00;
//  EdtMateriaPrimaQtdSaldo.Value:=0.0000;
//
//  EdtMateriaPrimaCod.SetFocus;

end;

procedure TFrmMovimentos.Bt_FecharClick(Sender: TObject);
begin
  bgSairMovtos:=True;

  Close;

end;

end.
