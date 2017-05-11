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
    Pan_Docto: TPanel;
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
    Bt_NovoFornecedor: TJvXPButton;
    EdtNumSeqDocto: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);

    // Odir ====================================================================

    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl);

    Procedure HabilitaDocto(bHabilita: Boolean);
    Procedure HabilitaBotoes(bHabilita: Boolean);
    Procedure LimpaDocto;
    Procedure LimpaProduto;

    Procedure BuscaDoctosMesmoNumero(sMySql: String);

    // Odir ====================================================================

    procedure EdtNumDoctoChange(Sender: TObject);
    procedure EdtNumDoctoExit(Sender: TObject); // Posiciona no Componente

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

// Busca Doctos com Mesmo Numero para Seleção >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovimentos.BuscaDoctosMesmoNumero(sMySql: String);
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  FrmPesquisa.Caption:='SELECIONE O DOCTO';

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=sMySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Fornecedor';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Fornecedor';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  EdtCodFornecedor.AsInteger:=0;
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtCodFornecedor.Text:=FrmPesquisa.EdtCodigo.Text;
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
End; // Busca Doctos com Mesmo Numero para Seleção >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita Dados do Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovimentos.HabilitaDocto(bHabilita: Boolean);
Var
  i: Integer;
Begin

  For i:=0 to FrmMovimentos.ComponentCount-1 do
  Begin
    If FrmMovimentos.Components[i] is TEdit Then
     (FrmMovimentos.Components[i] as TEdit).Enabled:=bHabilita;

    If FrmMovimentos.Components[i] is TCurrencyEdit Then
     (FrmMovimentos.Components[i] as TCurrencyEdit).Enabled:=bHabilita;

    If FrmMovimentos.Components[i] is TcxDateEdit Then
     (FrmMovimentos.Components[i] as TcxDateEdit).Enabled:=bHabilita;
  End; // For i:=0 to FrmMovimentos.ComponentCount-1 do

End; // Habilita Dados do Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita Botoes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovimentos.HabilitaBotoes(bHabilita: Boolean);
Begin
  Bt_Salvar.Enabled   :=bHabilita;
  Bt_Abandonar.Enabled:=Not bHabilita;
  Bt_Excluir.Enabled  :=bHabilita;

  Bt_BuscaFornecedor.Enabled:=bHabilita;
  Bt_NovoFornecedor.Enabled :=bHabilita;

  Bt_IncluiProduto.Enabled:=bHabilita;
  Bt_ExcluiProduto.Enabled:=bHabilita;
End; // Habilita Botoes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Todo o Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovimentos.LimpaDocto;
Var
  i: Integer;
Begin

  For i:=0 to FrmMovimentos.ComponentCount-1 do
  Begin
    If FrmMovimentos.Components[i] is TEdit Then
     (FrmMovimentos.Components[i] as TEdit).Clear;

    If FrmMovimentos.Components[i] is TCurrencyEdit Then
     (FrmMovimentos.Components[i] as TCurrencyEdit).Value:=0;

    If FrmMovimentos.Components[i] is TcxDateEdit Then
     (FrmMovimentos.Components[i] as TcxDateEdit).Clear;
  End; // For i:=0 to FrmMovimentos.ComponentCount-1 do

end; // Limpa Todo o Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Somente Digitação do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovimentos.LimpaProduto;
Begin
  EdtSeqProduto.Value:=0;
  EdtCodProduto.Value:=0;
  EdtDesProduto.Clear;
  EdtQtdProduto.Value:=0;
  EdtVltUnitProduto.Value:=0;
  EdtVlrTotalProduto.Value:=0;
End; // Limpa Somente Digitação do Produto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
  AddToolTip(Bt_NovoFornecedor.Handle, @ti, TipoDoIcone, 'Incluir', 'FORNECEDOR !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_IncluiProduto.Handle, @ti, TipoDoIcone, 'Incluir', 'PRODUTO !!');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ExcluiProduto.Handle, @ti, TipoDoIcone, 'Excluir', 'PRODUTO !!');

  // Limpa Tela ================================================================
  LimpaDocto;
  LimpaProduto;
  HabilitaBotoes(False);
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

  LimpaDocto;
  LimpaProduto;
  HabilitaBotoes(False);

  EdtNumDocto.SetFocus;

end;

procedure TFrmMovimentos.Bt_FecharClick(Sender: TObject);
begin
  bgSairMovtos:=True;

  Close;

end;

procedure TFrmMovimentos.EdtNumDoctoChange(Sender: TObject);
begin
  If EdtNumDocto.AsInteger=0 Then
  Begin
    LimpaDocto;
    LimpaProduto;
    HabilitaBotoes(False);
    HabilitaDocto(False);
  End;

end;

procedure TFrmMovimentos.EdtNumDoctoExit(Sender: TObject);
Var
  MySql: String;
  sCodForn: String;
begin
  If EdtNumDocto.AsInteger=0 Then
  Begin
    LimpaDocto;
    LimpaProduto;
    HabilitaBotoes(False);
    HabilitaDocto(False);
    EdtNumDocto.Enabled:=True;

    Exit;
  End;

  If EdtNumDocto.AsInteger<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Docto =============================================================
    MySql:=' SELECT dc.num_docto, dc.dta_docto Emissao,'+
           '        dc.des_pessoa Fornecedor, dc.cod_pessoa Codigo'+
           ' FROM DOCTOS dc'+
           ' WHERE dc.tipo=''E'''+
           ' AND   dc.num_docto='+IntToStr(EdtNumDocto.AsInteger);

           If EdtCodFornecedor.AsInteger<>0 Then
            MySql:=
             MySql+' AND dc.Cod_Pessoa='+IntToStr(EdtCodFornecedor.AsInteger);

    MySql:=
     MySql+' ORDER BY dc.des_pessoa';
    DMArtesanalis.CDS_Busca.Close;
    DMArtesanalis.SQLQ_Busca.SQL.Clear;
    DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
    DMArtesanalis.CDS_Busca.Open;

    Screen.Cursor:=crDefault;
    If Trim(DMArtesanalis.CDS_Busca.FieldByName('num_docto').AsString)='' Then
    Begin
      DMArtesanalis.CDS_Busca.Close;
      EdtSerieDocto.SetFocus;
      Exit;
    End;

    If DMArtesanalis.CDS_Busca.RecordCount=1 Then
    Begin
//      EdtProdutoDesc.Text       :=DMArtesanalis.CDS_Busca.FieldByName('DES_PRODUTO').AsString;
//      EdtProdutoUnidade.Text    :=DMArtesanalis.CDS_Busca.FieldByName('DES_UNIDADE').AsString;
//
//      EdtProdutoPcCusto.Value   :=DMArtesanalis.CDS_Busca.FieldByName('PRECO_CUSTO').AsFloat;
//      EdtProdutoCustoMedio.Value:=DMArtesanalis.CDS_Busca.FieldByName('CUSTO_MEDIO').AsFloat;
//      EdtProdutoPcVenda.Value   :=DMArtesanalis.CDS_Busca.FieldByName('PRECO_VENDA').AsFloat;
//      EdtProdutoPercMargem.Value:=DMArtesanalis.CDS_Busca.FieldByName('PER_MARGEM').AsFloat;
//      EdtProdutoVlrMatgem.Value :=DMArtesanalis.CDS_Busca.FieldByName('VLR_MARGEM').AsFloat;
//      EdtProdutoQtdSaldo.Value  :=DMArtesanalis.CDS_Busca.FieldByName('QTD_ESTOQUE').AsFloat;
//
//      ProducaoBusca;
//
//      Bt_ProdutoSalvar.Enabled   :=True;
//      Bt_ProdutoAbandonar.Enabled:=True;
//      Bt_ProdutoExcluir.Enabled  :=True;
    End; // If DMArtesanalis.CDS_Busca.RecordCount=1 Then

    // Busca Doctos Com o Mesmo Número =========================================
    If DMArtesanalis.CDS_Busca.RecordCount>1 Then
    Begin
      DMArtesanalis.CDS_Busca.Close;

      BuscaDoctosMesmoNumero(MySql);

      EdtNumDoctoExit(Self);
      Exit;
    End; // If DMArtesanalis.CDS_Busca.RecordCount>1 Then

  End; // If EdtNumDocto.AsInteger<>0 Then

end;

end.
