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
  DBXpress, ComCtrls, JvExComCtrls, JvDateTimePicker, JvDBDateTimePicker,
  Commctrl, // SHOW HINT EM FORMA DE BALÃO
  JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,
  JvDBDatePickerEdit, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit;

type
  TFrmMovimentos = class(TForm)
    Gb_Principal: TGroupBox;
    Pan_Nota: TPanel;
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    Bt_Salvar: TJvXPButton;
    Bt_Abandonar: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    OdirPanApres: TPanel;
    Gb_SerieDocto: TGroupBox;
    EdtSerieDocto: TEdit;
    Gb_VlrProdutos: TGroupBox;
    EdtVlrProdutos: TCurrencyEdit;
    Gb_NumDocto: TGroupBox;
    EdtNumDocto: TCurrencyEdit;
    Gb_DtaDocto: TGroupBox;
    DtEdt_DtaDocto: TcxDateEdit;
    Gb_Fornecedor: TGroupBox;
    EdtDesFornecedor: TEdit;
    EdtCodFornecedor: TCurrencyEdit;
    Bt_BuscaFornecedor: TJvXPButton;
    Gb_VlrTotal: TGroupBox;
    EdtVlrTotal: TCurrencyEdit;
    Rb_Produtos: TRadioGroup;
    Pan_Produto: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdtSeqProduto: TCurrencyEdit;
    EdtCodProduto: TCurrencyEdit;
    EdtDesProduto: TEdit;
    EdtQtdProduto: TCurrencyEdit;
    EdtVltUnitProduto: TCurrencyEdit;
    EdtVlrTotalProduto: TCurrencyEdit;
    Dbg_Produtos: TDBGrid;
    Bt_IncluiProduto: TJvXPButton;
    Bt_ExcluiProduto: TJvXPButton;
    StB_Movtos: TdxStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);

    // Odir ====================================================================

    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente

    // Odir ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const 
  // Show Hint em Forma de Balão
  TTS_BALLOON = $40; 
  TTM_SETTITLE = (WM_USER + 32); 
  //////////////////////////////

var
  FrmMovimentos: TFrmMovimentos;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal; 
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  TD: TTransactionDesc;

  bgSairMovtos: Boolean;

  sgMensagem: String;

implementation

uses DK_Procs1, UDMArtesanalis, UPesquisa;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmMovimentos.CreateToolTips(hWnd: Cardinal);
begin
  hToolTip := CreateWindowEx(0, 'Tooltips_Class32', nil, TTS_ALWAYSTIP or TTS_BALLOON,
  Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),Integer(CW_USEDEFAULT),
  Integer(CW_USEDEFAULT), hWnd, 0, hInstance, nil);

  if hToolTip <> 0 then
  begin
    SetWindowPos(hToolTip, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or  SWP_NOSIZE or SWP_NOACTIVATE);
    ti.cbSize := SizeOf(TToolInfo);
    ti.uFlags := TTF_SUBCLASS;
    ti.hInst := hInstance;
  end;
end; // Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure AddToolTip(hwnd: dword; lpti: PToolInfo; IconType: Integer; Text, Title: PChar);
var
  Item: THandle;
  Rect: TRect;
begin

  Item := hWnd;

  if (Item <> 0) and (GetClientRect(Item, Rect)) then
  begin
    lpti.hwnd := Item;
    lpti.Rect := Rect;
    lpti.lpszText := Text;
    SendMessage(hToolTip, TTM_ADDTOOL, 0, Integer(lpti));
    FillChar(buffer, sizeof(buffer), #0);
    lstrcpy(buffer, Title);

    if (IconType > 3) or (IconType < 0) then
      IconType := 0;

    SendMessage(hToolTip, TTM_SETTITLE, IconType, Integer(@buffer));
  end;
end; // Show Hint em Forma de Balão - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovimentos.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Balão - Posiciona do Componente >>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmMovimentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Not bgSairMovtos Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Botão <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('MATÉRIA-PRIMA - Documento de ENTRADA');

end;

procedure TFrmMovimentos.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Balão
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Salvar.Handle, @ti, TipoDoIcone, 'Incluir/Alterar', 'DOCUMENTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Abandonar.Handle, @ti, TipoDoIcone, 'Abandonar', 'DOCUMENTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Excluir.Handle, @ti, TipoDoIcone, 'Excluir', 'DOCUMENTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaFornecedor.Handle, @ti, TipoDoIcone, 'Busca', 'FORNECEDOR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_IncluiProduto.Handle, @ti, TipoDoIcone, 'Incluirr', 'PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ExcluiProduto.Handle, @ti, TipoDoIcone, 'Excluir', 'PRODUTO !!');
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
