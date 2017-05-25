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
  cxDropDownEdit, cxCalendar, cxDBEdit,  MaskUtils, ACBrBase, ACBrValidador;

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
    Gb_Pessoa: TGroupBox;
    EdtDesPessoa: TEdit;
    EdtCodPessoa: TCurrencyEdit;
    Bt_BuscaPessoa: TJvXPButton;
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
    Bt_NovaPessoa: TJvXPButton;
    EdtNumSeqDocto: TCurrencyEdit;
    GroupBox1: TGroupBox;
    CBx_TipoDocto: TComboBox;
    Button1: TButton;
    ACBrValidador: TACBrValidador;
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

    Function  DMLPessoas(sNomePessoa: String; sCodPessoa: String = 'NULL';
                         sTipoPessoa: String= 'F'): Boolean;

    // Odir ====================================================================

    procedure EdtNumDoctoExit(Sender: TObject);
    procedure EdtCodPessoaChange(Sender: TObject);
    procedure Bt_AbandonarClick(Sender: TObject);
    procedure Dbg_ProdutosEnter(Sender: TObject);
    procedure Dbg_ProdutosExit(Sender: TObject);
    procedure EdtCodProdutoEnter(Sender: TObject);
    procedure EdtCodPessoaExit(Sender: TObject);
    procedure Bt_BuscaPessoaClick(Sender: TObject);
    procedure Bt_NovaPessoaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject); // Posiciona no Componente

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

uses DK_Procs1, UDMArtesanalis, UPesquisa, DB;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manipulaçao Cadastro de Pessoas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmMovimentos.DMLPessoas(sNomePessoa: String; sCodPessoa: String = 'NULL';
                                   sTipoPessoa: String= 'F'): Boolean;
Var
  MySql: String;
Begin
  Result:=False;

  OdirPanApres.Caption:='AGUARDE !! Atualizando Cadastro de Pessoas !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmMovimentos.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmMovimentos.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmMovimentos;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica se Transação esta Ativa
  If DMArtesanalis.SQLC.InTransaction Then
   DMArtesanalis.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMArtesanalis.SQLC.StartTransaction(TD);
  Try // Try da Transação
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

//    MySql:='UPDATE OR INSERT INTO PESSOAS (TIPO, COD_PESSOA, DES_PESSOA, NUM_CNPJCPF)'
//                       VALUES ('F', 1, 'ODIR PAULO', '25697137087')
//                     MATCHING (COD_PESSOA);
//

    // Atualiza Transacao ======================================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;
    Result:=True;
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMArtesanalis.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;

      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End; // on e : Exception do
  End; // Try da Transação

End; // Manipulaçao Cadastro de Pessoas >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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

    If FrmMovimentos.Components[i] is TComboBox Then
     (FrmMovimentos.Components[i] as TComboBox).Enabled:=bHabilita;
  End; // For i:=0 to FrmMovimentos.ComponentCount-1 do

  EdtSeqProduto.Enabled:=False;
End; // Habilita Dados do Docto >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita Botoes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMovimentos.HabilitaBotoes(bHabilita: Boolean);
Begin
  Bt_Salvar.Enabled   :=bHabilita;
  Bt_Abandonar.Enabled:=Not bHabilita;
  Bt_Excluir.Enabled  :=bHabilita;

  Bt_BuscaPessoa.Enabled:=bHabilita;
  Bt_NovaPessoa.Enabled :=bHabilita;

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

    If FrmMovimentos.Components[i] is TComboBox Then
     (FrmMovimentos.Components[i] as TComboBox).ItemIndex:=-1;
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
  DMArtesanalis.MemoRetiraNomeForm('MATÉRIA-PRIMA - Movimentações');

end;

procedure TFrmMovimentos.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Balão
  CreateToolTips(Self.Handle);
  AddToolTip(EdtCodProduto.Handle, @ti, TipoDoIcone, 'LOCALIZAR Tecle <F9>', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Salvar.Handle, @ti, TipoDoIcone, 'Incluir/Alterar', 'DOCUMENTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Abandonar.Handle, @ti, TipoDoIcone, 'Abandonar', 'DOCUMENTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Excluir.Handle, @ti, TipoDoIcone, 'Excluir', 'DOCUMENTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaPessoa.Handle, @ti, TipoDoIcone, 'Buscar', 'PESSOA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NovaPessoa.Handle, @ti, TipoDoIcone, 'Incluir', 'PESSOA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_IncluiProduto.Handle, @ti, TipoDoIcone, 'Incluir', 'PRODUTO');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_ExcluiProduto.Handle, @ti, TipoDoIcone, 'Excluir', 'PRODUTO');

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
  HabilitaDocto(False);

  EdtCodPessoa.Enabled:=True;
  Bt_BuscaPessoa.Enabled:=True;
  Bt_NovaPessoa.Enabled:=True;

  EdtNumDocto.Enabled:=True;

  // Incicializa Itens de Materia-Prima ========================================
  If DMArtesanalis.CDS_V_DoctoItens.Active Then
   DMArtesanalis.CDS_V_DoctoItens.Close;

  DMArtesanalis.CDS_V_DoctoItens.CreateDataSet;
  DMArtesanalis.CDS_V_DoctoItens.Open;
  
  EdtCodPessoa.SetFocus;
end;

procedure TFrmMovimentos.Bt_FecharClick(Sender: TObject);
begin
  bgSairMovtos:=True;

  Close;

end;

procedure TFrmMovimentos.EdtNumDoctoExit(Sender: TObject);
Var
  MySql: String;
  s: String;
begin

  If EdtCodPessoa.Value=0 Then
  Begin
    msg('Favor Informar o Fornecedor !!','A');
    EdtCodPessoa.SetFocus;
    Exit;
  End;

  EdtNumSeqDocto.AsInteger:=0;
  If EdtNumDocto.AsInteger<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Docto =============================================================
    MySql:=' SELECT dc.num_docto, dc.dta_docto Emissao,'+
           '        dc.des_pessoa Fornecedor, dc.vlr_total, dc.cod_pessoa Codigo'+
           ' FROM DOCTOS dc'+
           ' WHERE dc.num_docto='+IntToStr(EdtNumDocto.AsInteger)+
           ' AND dc.Cod_Pessoa='+IntToStr(EdtCodPessoa.AsInteger)+
           ' ORDER BY dc.des_pessoa';
    DMArtesanalis.CDS_Busca.Close;
    DMArtesanalis.SQLQ_Busca.SQL.Clear;
    DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
    DMArtesanalis.CDS_Busca.Open;

    Screen.Cursor:=crDefault;
    Bt_IncluiProduto.Enabled:=False;
    Bt_ExcluiProduto.Enabled:=False;
    If Trim(DMArtesanalis.CDS_Busca.FieldByName('num_docto').AsString)='' Then
    Begin
      DMArtesanalis.CDS_Busca.Close;
      HabilitaDocto(True);

      Bt_IncluiProduto.Enabled:=True;
      Bt_ExcluiProduto.Enabled:=True;

      CBx_TipoDocto.SetFocus;

      Exit;
    End;

    If DMArtesanalis.CDS_Busca.RecordCount=1 Then
    Begin
      MySql:=' SELECT dc.num_seq_docto, dc.tipo, dc.num_docto, dc.num_serie, dc.dta_docto,'+
             '        dc.cod_pessoa, dc.des_pessoa, dc.vlr_produtos, dc.vlr_total,'+
             '        di.num_seq, di.cod_produto, di.des_produto,'+
             '        di.qtd_movto, di.vlr_unitatio, di.vlr_total'+
             ' FROM DOCTOS dc, DOCTOS_ITENS di'+
             ' WHERE dc.num_seq_docto=di.num_seq_docto'+
             ' AND   dc.num_docto='+DMArtesanalis.CDS_Busca.FieldByName('num_docto').AsString+
             ' AND   dc.cod_pessoa='+DMArtesanalis.CDS_Busca.FieldByName('Codigo').AsString+
             ' ORDER BY di.num_seq';
      DMArtesanalis.CDS_Busca.Close;
      DMArtesanalis.SQLQ_Busca.SQL.Clear;
      DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
      DMArtesanalis.CDS_Busca.Open;

      EdtCodPessoa.Text:=DMArtesanalis.CDS_Busca.FieldByName('cod_pessoa').AsString;
      EdtDesPessoa.Text:=DMArtesanalis.CDS_Busca.FieldByName('des_pessoa').AsString;

      EdtNumSeqDocto.AsInteger:=DMArtesanalis.CDS_Busca.FieldByName('num_seq_docto').AsInteger;

      // Tipo de Documento
      If Trim(DMArtesanalis.CDS_Busca.FieldByName('Tipo').AsString)='E'  Then  s:='Documento   de Entrada';
      If Trim(DMArtesanalis.CDS_Busca.FieldByName('Tipo').AsString)='S'  Then  s:='Documento   de Saída';
      If Trim(DMArtesanalis.CDS_Busca.FieldByName('Tipo').AsString)='DE' Then  s:='Devolução   de Entrada';
      If Trim(DMArtesanalis.CDS_Busca.FieldByName('Tipo').AsString)='DS' Then  s:='Devolução   de Saída';
      If Trim(DMArtesanalis.CDS_Busca.FieldByName('Tipo').AsString)='BE' Then  s:='Bonificação de Entrada';
      If Trim(DMArtesanalis.CDS_Busca.FieldByName('Tipo').AsString)='BS' Then  s:='Bonificação de Saída';
      CBx_TipoDocto.ItemIndex := CBx_TipoDocto.Items.IndexOf(s);

      EdtSerieDocto.Text   :=DMArtesanalis.CDS_Busca.FieldByName('num_serie').AsString;
      DtEdt_DtaDocto.Date  :=DMArtesanalis.CDS_Busca.FieldByName('dta_docto').AsDateTime;
      EdtVlrProdutos.Value :=DMArtesanalis.CDS_Busca.FieldByName('vlr_produtos').AsCurrency;
      EdtVlrTotal.Value    :=DMArtesanalis.CDS_Busca.FieldByName('vlr_total').AsCurrency;

      While Not DMArtesanalis.CDS_Busca.Eof do
      Begin
        DMArtesanalis.CDS_V_DoctoItens.Append;
        DMArtesanalis.CDS_V_DoctoItensNUM_SEQ_DOCTO.AsString:=DMArtesanalis.CDS_Busca.FieldByName('NUM_SEQ_DOCTO').AsString;
        DMArtesanalis.CDS_V_DoctoItensNUM_SEQ.AsString      :=DMArtesanalis.CDS_Busca.FieldByName('NUM_SEQ').AsString;
        DMArtesanalis.CDS_V_DoctoItensCOD_PRODUTO.AsString  :=DMArtesanalis.CDS_Busca.FieldByName('COD_PRODUTO').AsString;
        DMArtesanalis.CDS_V_DoctoItensDES_PRODUTO.AsString  :=DMArtesanalis.CDS_Busca.FieldByName('DES_PRODUTO').AsString;
        DMArtesanalis.CDS_V_DoctoItensQTD_MOVTO.AsString    :=DMArtesanalis.CDS_Busca.FieldByName('QTD_MOVTO').AsString;
        DMArtesanalis.CDS_V_DoctoItensVLR_UNITATIO.AsString :=DMArtesanalis.CDS_Busca.FieldByName('VLR_UNITATIO').AsString;
        DMArtesanalis.CDS_V_DoctoItensVLR_TOTAL.AsString    :=DMArtesanalis.CDS_Busca.FieldByName('VLR_TOTAL').AsString;

        DMArtesanalis.CDS_V_DoctoItens.Post;

        DMArtesanalis.CDS_Busca.Next;
      End; // While Not DMArtesanalis.CDS_Busca.Eof do
      DMArtesanalis.CDS_V_DoctoItens.First;

      HabilitaBotoes(False);
      Bt_Excluir.Enabled:=True;

      HabilitaDocto(False);

      Dbg_Produtos.SetFocus;
    End; // If DMArtesanalis.CDS_Busca.RecordCount=1 Then
    DMArtesanalis.CDS_Busca.Close;
  End; // If EdtNumDocto.AsInteger<>0 Then

end;

procedure TFrmMovimentos.EdtCodPessoaChange(Sender: TObject);
begin
  // Incicializa Itens de Materia-Prima ========================================
  If DMArtesanalis.CDS_V_DoctoItens.Active Then
   DMArtesanalis.CDS_V_DoctoItens.Close;

  DMArtesanalis.CDS_V_DoctoItens.CreateDataSet;
  DMArtesanalis.CDS_V_DoctoItens.Open;

end;

procedure TFrmMovimentos.Bt_AbandonarClick(Sender: TObject);
begin
  FormShow(Self);
end;

procedure TFrmMovimentos.Dbg_ProdutosEnter(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clMoneyGreen;
end;

procedure TFrmMovimentos.Dbg_ProdutosExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clWindow;
end;

procedure TFrmMovimentos.EdtCodProdutoEnter(Sender: TObject);
begin
  FocoToControl(EdtCodProduto);
end;

procedure TFrmMovimentos.EdtCodPessoaExit(Sender: TObject);
Var
  MySql: String;
begin
  If EdtCodPessoa.asInteger=0 Then
   Exit;

  Screen.Cursor:=crAppStart;

  EdtDesPessoa.Clear;

  MySql:=' SELECT p.des_pessoa nome'+
         ' FROM PESSOAS p'+
         ' WHERE p.cod_pessoa='+IntToStr(EdtCodPessoa.AsInteger);
  DMArtesanalis.CDS_BuscaRapida.Close;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
  DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
  DMArtesanalis.CDS_BuscaRapida.Open;

  If Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Nome').AsString)='' Then
  Begin
    Screen.Cursor:=crDefault;
    DMArtesanalis.CDS_BuscaRapida.Close;
    msg('Cliente/Fornecedor Não Encontrado !!','A');
    EdtCodPessoa.SetFocus;
    Exit;
  End;
  EdtDesPessoa.Text:=Trim(DMArtesanalis.CDS_BuscaRapida.FieldByName('Nome').AsString);
  DMArtesanalis.CDS_BuscaRapida.Close;

  Screen.Cursor:=crDefault;
  EdtNumDocto.SetFocus;

end;

procedure TFrmMovimentos.Bt_BuscaPessoaClick(Sender: TObject);
Var
  MySql: String;
begin

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.des_pessoa Nome, p.cod_pessoa Codigo'+
         ' FROM PESSOAS p'+
         ' ORDER BY p.des_pessoa';
  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMArtesanalis.CDS_Pesquisa.FieldByName('Nome').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Pesquisa.Close;
    msg('Sem Cliente/Fornecedor a Listar !!','A');
    EdtCodPessoa.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Nome';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Nome';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtCodPessoa.AsInteger:=StrToInt(FrmPesquisa.EdtCodigo.Text);
    EdtCodPessoaExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmMovimentos.Bt_NovaPessoaClick(Sender: TObject);
Var
  b, bValidou: Boolean;
  sNome, sCnpjCpf, sSetFocus: String;
begin
  b:=True;
  sNome    :='';
  sCnpjCpf :='';
  sSetFocus:='';
  While b do
  Begin
    bValidou:=True;
    If InputQuery2Values('CADASTRO CLIENTE/FORNECEDOR', 'Nome', 'CNPJ/CPF (Somente Números)', sNome, sCnpjCpf, sSetFocus) Then
     Begin
       Try
         If Trim(sNome)='' Then
         Begin
           EdtCodPessoa.SetFocus;
           Break;
         End;

         // Efetua Validações
         If StrToIntDef(sNome,999999)<>999999 Then
         Begin
           sSetFocus:='Edit1';
           bValidou:=False;
           msg('Nome Inválido !!','A');
         End
         Else If (Length(sCnpjCpf)<>14) and (Length(sCnpjCpf)<>11) Then // Verifica CNPJ / CPF
          Begin
            sSetFocus:='Edit2';
            bValidou:=False;
            msg('Número do Documento Inválido !!','A');
          End
         Else If (Length(sCnpjCpf)=14) Then // Valida CNPJ
          Begin
            ACBrValidador.TipoDocto:=docCNPJ;
            ACBrValidador.Documento:=sCnpjCpf;

            If Not ACBrValidador.Validar Then
            Begin
              msg('CNPJ Inválido !!','A');
              bValidou:=False;
              sSetFocus:='Edit2';
            End;
          End
         Else If (Length(sCnpjCpf)=11) Then // Valida CPF
          Begin
            ACBrValidador.TipoDocto:=docCPF;
            ACBrValidador.Documento:=sCnpjCpf;

            If Not ACBrValidador.Validar Then
            Begin
              msg('CPF Inválido !!','A');
              bValidou:=False;
              sSetFocus:='Edit2';
            End;
          End; // Efetua Validações

         If bValidou Then
         Begin
//            DMLPessoas
           Break;
         End;

       Except
       End;
     End
    Else // If InputQuery('Informe o Desconto','',sVlrDesc) then
     Begin
       EdtCodPessoa.SetFocus;
       Break;
     End; // If InputQuery('Informe o Desconto','',sVlrDesc) then
  End; // While b do

end;

procedure TFrmMovimentos.Button1Click(Sender: TObject);
Var
  s1, s2: String;
begin
  InputQuery2Values('CADASTRO CLIENTE/FORNECEDOR', 'Nome', 'CNPJ / CPF', s1, s2, 'Edit2');
end;

end.
