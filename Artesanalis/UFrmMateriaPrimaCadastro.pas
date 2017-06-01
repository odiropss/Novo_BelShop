unit UFrmMateriaPrimaCadastro;

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
  dxSkinsdxStatusBarPainter, dxStatusBar, Grids, DBGrids, JvExControls,
  JvXPCore, JvXPButtons, StdCtrls, Mask, ToolEdit,
  Commctrl, // SHOW HINT EM FORMA DE BAL�O
  CurrEdit, ExtCtrls, DBXpress;

type
  TFrmMateriaPrimaCadastro = class(TForm)
    Gb_Principal: TGroupBox;
    Pan_MateriaPrimaSolic: TPanel;
    Gb_MateriaPrimaCod: TGroupBox;
    EdtMateriaPrimaCod: TCurrencyEdit;
    Gb_MateriaPrimaDesc: TGroupBox;
    EdtMateriaPrimaDesc: TEdit;
    Gb_MateriaPrimaUnid: TGroupBox;
    Gb_MateriaPrimaCusto: TGroupBox;
    EdtMateriaPrimaCusto: TCurrencyEdit;
    Pan_MateriaPrima: TPanel;
    Dbg_MateriaPrima: TDBGrid;
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    StB_MateriaPrima: TdxStatusBar;
    OdirPanApres: TPanel;
    EdtMateriaPrimaUnid: TEdit;
    Gb_MateriaPrimaCustoMedio: TGroupBox;
    EdtMateriaPrimaCustoMedio: TCurrencyEdit;
    Gb_MateriaPrimaQtdSaldo: TGroupBox;
    EdtMateriaPrimaQtdSaldo: TCurrencyEdit;
    Bt_MateriaPrimaSalvar: TJvXPButton;
    Bt_MateriaPrimaAbandonar: TJvXPButton;
    Bt_MateriaPrimaExcluir: TJvXPButton;
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtMateriaPrimaCodEnter(Sender: TObject);
    procedure EdtMateriaPrimaCodExit(Sender: TObject);
    procedure Bt_MateriaPrimaAbandonarClick(Sender: TObject);
    procedure Dbg_MateriaPrimaDblClick(Sender: TObject);
    procedure Bt_MateriaPrimaSalvarClick(Sender: TObject);

    // Odir ====================================================================

    // Hint em Fortma de Bal�o
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Bal�o
    Procedure FocoToControl(Sender: TControl); // Posiciona no Componente

    Function  DMLMateriaPrima(sTipo: String): Boolean;
                           // sTipo:
                           // (IA) Incluir ou Alterar
                           // (EX) Excluir

    // Odir ====================================================================

    procedure Bt_MateriaPrimaExcluirClick(Sender: TObject);
    procedure Dbg_MateriaPrimaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Dbg_MateriaPrimaEnter(Sender: TObject);
    procedure Dbg_MateriaPrimaExit(Sender: TObject);
    procedure EdtMateriaPrimaCustoExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    bgTransportar: Boolean;
  end;

const 
  // Show Hint em Forma de Bal�o
  TTS_BALLOON = $40; 
  TTM_SETTITLE = (WM_USER + 32); 
  //////////////////////////////

var
  FrmMateriaPrimaCadastro: TFrmMateriaPrimaCadastro;

  // Show Hint em Forma de Bal�o
  hTooltip: Cardinal; 
  ti: TToolInfo; 
  buffer : array[0..255] of char;
  ///////////////////////////////

  TD: TTransactionDesc;

  bgAlterar,
  bgSairMateria: Boolean;

  sgMensagem: String;

implementation

uses UDMArtesanalis, DK_Procs1, DB;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manipua��o de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmMateriaPrimaCadastro.DMLMateriaPrima(sTipo: String): Boolean;
Var
  MySql: String;
Begin
  // sTipo:
  // (IA) Incluir ou Alterar
  // (EX) Excluir

  Result:=True;
  sgMensagem:='';

  OdirPanApres.Caption:='AGUARDE !! Atualizando Mat�ria-Prima !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmMateriaPrimaCadastro.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmMateriaPrimaCadastro.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmMateriaPrimaCadastro;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  // Verifica se Transa��o esta Ativa
  If DMArtesanalis.SQLC.InTransaction Then
   DMArtesanalis.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMArtesanalis.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    Screen.Cursor:=crAppStart;
    DateSeparator:='.';
    DecimalSeparator:='.';

    // (IA) Incluir ou Alterar -------------------------------------
    If sTipo='IA' Then
    Begin
      MySql:=' UPDATE OR INSERT INTO MATERIAPRIMA'+
             ' (COD_MATERIAPRIMA, DES_MATERIAPRIMA, DES_UNIDADE,'+
             '  PRECO_CUSTO, CUSTO_MEDIO, QTD_ESTOQUE)'+

             ' VALUES (';

             // COD_MATERIAPRIMA
             If EdtMateriaPrimaCod.AsInteger=0 Then
              MySql:=
               MySql+' NULL, '
             Else
              MySql:=
               MySql+IntToStr(EdtMateriaPrimaCod.AsInteger)+', ';

      MySql:=
       MySql+QuotedStr(Trim(EdtMateriaPrimaDesc.Text))+', '+ // DES_MATERIAPRIMA
             QuotedStr(Trim(EdtMateriaPrimaUnid.Text))+', '+ // DES_UNIDADE
             QuotedStr(f_Troca(',','.',FloatToStr(EdtMateriaPrimaCusto.Value)))+', '+ // PRECO_CUSTO
             QuotedStr(f_Troca(',','.',FloatToStr(EdtMateriaPrimaCustoMedio.Value)))+', '+ // CUSTO_MEDIO
             QuotedStr(f_Troca(',','.',FloatToStr(EdtMateriaPrimaQtdSaldo.Value)))+')'+ // QTD_ESTOQUE
             ' MATCHING (COD_MATERIAPRIMA)';
    End; // If sTipo='IA' Then

    // (EX) Excluir ------------------------------------------------
    If sTipo='EX' Then
    Begin
      MySql:=' DELETE FROM MATERIAPRIMA ma'+
             ' WHERE  ma.cod_materiaprima='+IntToStr(EdtMateriaPrimaCod.AsInteger);
    End; // If sTipo='EX' Then

    DMArtesanalis.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ===========================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    // Reabre Materia-Prima ----------------------------------------
    DMArtesanalis.CDS_MateriaPrima.DisableControls;
    DMArtesanalis.CDS_MateriaPrima.Close;
    DMArtesanalis.CDS_MateriaPrima.Open;
    DMArtesanalis.CDS_MateriaPrima.EnableControls;

    DMArtesanalis.CDS_MateriaPrima.Locate('DES_MATERIAPRIMA', Trim(EdtMateriaPrimaDesc.Text),[]);

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMArtesanalis.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      OdirPanApres.Visible:=False;

      Screen.Cursor:=crDefault;
      sgMensagem:=e.message;

      Result:=False;
    End; // on e : Exception do
  End; // Try da Transa��o
End; // Manipua��o de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Bal�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmMateriaPrimaCadastro.CreateToolTips(hWnd: Cardinal);
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
end; // Show Hint em Forma de Bal�o >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Bal�o - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>>>>>>
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
end; // Show Hint em Forma de Bal�o - Usado no FormCreate >>>>>>>>>>>>>>>>>>>>>>

// Show Hint em Forma de Bal�o - Posiciona do Componente >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmMateriaPrimaCadastro.FocoToControl(Sender: TControl);
Var
 NewPos: TPoint;
Begin
  NewPos.X:=Sender.Left+(Sender.Width div 2);
  NewPos.y:=Sender.Top+(Sender.Height div 2);

  If Sender.Parent<>Nil Then
   NewPos:=Sender.Parent.ClientToScreen(NewPos);

  SetCursorPos(NewPos.x,NewPos.y)
End; // Show Hint em Forma de Bal�o - Posiciona do Componente >>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmMateriaPrimaCadastro.FormShow(Sender: TObject);
begin
  bgSairMateria:=False;

  EdtMateriaPrimaCod.AsInteger:=0;
  EdtMateriaPrimaDesc.Clear;
  EdtMateriaPrimaUnid.Clear;
  EdtMateriaPrimaCusto.Value:=0.00;
  EdtMateriaPrimaCustoMedio.Value:=0.00;
  EdtMateriaPrimaQtdSaldo.Value:=0.0000;

  EdtMateriaPrimaCod.SetFocus;
end;

procedure TFrmMateriaPrimaCadastro.Bt_FecharClick(Sender: TObject);
begin
  bgSairMateria:=True;
  bgTransportar:=False;

  Close;
end;

procedure TFrmMateriaPrimaCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Not bgSairMateria Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Bot�o <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  DMArtesanalis.CDS_MateriaPrima.Close;

  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('Cadastro de Mat�ria-Prima');
end;

procedure TFrmMateriaPrimaCadastro.EdtMateriaPrimaCodEnter(Sender: TObject);
begin
  Bt_MateriaPrimaAbandonar.Enabled:=True;
  Bt_MateriaPrimaExcluir.Enabled:=True;
  Bt_MateriaPrimaSalvar.Enabled:=True;

  EdtMateriaPrimaCod.Clear;
  EdtMateriaPrimaDesc.Clear;
  EdtMateriaPrimaUnid.Clear;
  EdtMateriaPrimaCusto.Value:=0.00;
  EdtMateriaPrimaCustoMedio.Value:=0.00;
  EdtMateriaPrimaQtdSaldo.Value:=0.0000;

  bgAlterar:=False;
end;

procedure TFrmMateriaPrimaCadastro.EdtMateriaPrimaCodExit(Sender: TObject);
begin

  If EdtMateriaPrimaCod.AsInteger=0 Then
   Exit;

  If DMArtesanalis.CDS_MateriaPrima.Locate('COD_MATERIAPRIMA', EdtMateriaPrimaCod.AsInteger,[]) Then
  Begin
    EdtMateriaPrimaDesc.Text       :=DMArtesanalis.CDS_MateriaPrimaDES_MATERIAPRIMA.AsString;
    EdtMateriaPrimaUnid.Text       :=DMArtesanalis.CDS_MateriaPrimaDES_UNIDADE.AsString;
    EdtMateriaPrimaCusto.Value     :=DMArtesanalis.CDS_MateriaPrimaPRECO_CUSTO.AsCurrency;
    EdtMateriaPrimaCustoMedio.Value:=DMArtesanalis.CDS_MateriaPrimaCUSTO_MEDIO.AsCurrency;
    EdtMateriaPrimaQtdSaldo.Value  :=DMArtesanalis.CDS_MateriaPrimaQTD_ESTOQUE.AsFloat;
    bgAlterar:=True;
  End; // If DMArtesanalis.CDS_MateriaPrima.Locate('COD_MATERIAPRIMA', EdtMateriaPrimaCod.AsInteger,[]) Then
//  End
//  Else
//   Begin
//     msg('Mat�ria-Prima N�o Encontrada !!','A');
//     bgAlterar:=False;
//     EdtMateriaPrimaCod.SetFocus;
//   End; // If DMArtesanalis.CDS_MateriaPrima.Locate('COD_MATERIAPRIMA', EdtMateriaPrimaCod.AsInteger,[]) Then
end;

procedure TFrmMateriaPrimaCadastro.Bt_MateriaPrimaAbandonarClick(Sender: TObject);
begin
  EdtMateriaPrimaCodEnter(Self);
  EdtMateriaPrimaCod.SetFocus;
end;

procedure TFrmMateriaPrimaCadastro.Dbg_MateriaPrimaDblClick(Sender: TObject);
begin
  If DMArtesanalis.CDS_MateriaPrima.IsEmpty Then
   Exit;

  EdtMateriaPrimaCod.AsInteger:=DMArtesanalis.CDS_MateriaPrimaCOD_MATERIAPRIMA.AsInteger;
  EdtMateriaPrimaCodExit(Self);
  EdtMateriaPrimaDesc.SetFocus;

end;

procedure TFrmMateriaPrimaCadastro.Bt_MateriaPrimaSalvarClick(Sender: TObject);
begin
  // Consiste a Descri��o da Mat�ria-Prima =====================================
  If Trim(EdtMateriaPrimaDesc.Text)='' Then
  Begin
    msg('Favor Informar a'+cr+cr+'Descri��o da Mat�ria-Prima !!','A');
    EdtMateriaPrimaDesc.SetFocus;
    Exit;
  End;

  // Consiste a Unidade ========================================================
  If Trim(EdtMateriaPrimaUnid.Text)='' Then
  Begin
    msg('Favor Informar a'+cr+cr+'Unidade da Mat�ria-Prima !!','A');
    EdtMateriaPrimaUnid.SetFocus;
    Exit;
  End;

  // Executa DML ===============================================================
  If not DMLMateriaPrima('IA') Then
  Begin
    MessageBox(Handle, pChar('Erro ao Incluir/Altera a Mat�ria-Prima !!'+#13+sgMensagem), 'ATEN��O !!', MB_ICONERROR);

    If bgTransportar Then
     Exit;
  End;

  If bgTransportar Then
  Begin
    Bt_FecharClick(Self);
    bgTransportar:=True;
    Exit;
  End; // If bgTransportar Then

  EdtMateriaPrimaCodEnter(Self);
  EdtMateriaPrimaCod.SetFocus;
end;

procedure TFrmMateriaPrimaCadastro.Bt_MateriaPrimaExcluirClick(Sender: TObject);
Var
  MySql: String;
begin
  If DMArtesanalis.CDS_MateriaPrima.IsEmpty Then
   Exit;

  If EdtMateriaPrimaCod.AsInteger=0 Then
  Begin
    msg('Favor Selecinar'+cr+cr+'A Mat�ria-Prima a Excluir !!','A');
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End; // If EdtMateriaPrimaCod.AsInteger=0 Then

  If msg('Deseja Realmente Excluir a'+cr+'Mat�ria-Prima Selecionada ??','C')=2 Then
  Begin
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End;

  // Consiste Exclus�o =========================================================
  sgMensagem:='';
  MySql:=' SELECT pd.cod_produto, pr.des_produto'+
         ' FROM PRODUCAO pd, PRODUTO pr'+
         ' WHERE pd.cod_produto=pr.cod_produto'+
         ' AND   pd.cod_materiaprima='+IntToStr(EdtMateriaPrimaCod.AsInteger);
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;
  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Cod_Produto').AsString)<>'' Then
   sgMensagem:=Trim(DMArtesanalis.CDS_Busca.FieldByName('Des_Produto').AsString);
  DMArtesanalis.CDS_Busca.Close;

  If Trim(sgMensagem)<>'' Then
  Begin
    MessageBox(Handle, pChar('Imposs�vel Excluir !!'+cr+cr+'Mat�ria-Prima J� Utilizada no Produto: '+cr+sgMensagem), 'Erro', MB_ICONERROR);
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End; // If Trim(sgMensagem)<>'' Then

  // Executa DML ===============================================================
  If not DMLMateriaPrima('EX') Then
   MessageBox(Handle, pChar('Erro ao Excluir a Mat�ria-Prima !!'+#13+sgMensagem), 'ATEN��O !!', MB_ICONERROR);

  EdtMateriaPrimaCodEnter(Self);
  EdtMateriaPrimaCod.SetFocus;
end;

procedure TFrmMateriaPrimaCadastro.Dbg_MateriaPrimaKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
begin
  // N�o Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  // Localiza Materia-Prima ====================================================
  If Key=VK_F4 Then
  Begin
    If Not DMArtesanalis.CDS_MateriaPrima.IsEmpty Then
    Begin
      i:=DMArtesanalis.CDS_MateriaPrima.RecNo;

      s:='';
      If InputQuery('Localizar Mat�ria-Prima','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            If Not DMArtesanalis.CDS_MateriaPrima.Locate('COD_MATERIAPRIMA',StrToInt(s),[]) Then
            Begin
              DMArtesanalis.CDS_MateriaPrima.RecNo:=i;
              msg('Mat�ria-Prima N�o Encontrada !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMArtesanalis.CDS_MateriaPrima, 'DES_MATERIAPRIMA', s) Then
            Begin
              DMArtesanalis.CDS_MateriaPrima.RecNo:=i;
              msg('Mat�ria-Prima N�o Encontrada !!','A');
            End;
          End; // Try
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Mat�ria-Prima','',s) then
    End; // If Not DMArtesanalis.CDS_MateriaPrima.IsEmpty Then
  End; //If Key=VK_F4 Then
end;

procedure TFrmMateriaPrimaCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;
end;

procedure TFrmMateriaPrimaCadastro.FormCreate(Sender: TObject);
const  
  TipoDoIcone = 1; // Show Hint em Forma de Bal�o
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Bal�o
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_MateriaPrimaSalvar.Handle, @ti, TipoDoIcone, 'Incluir/Alterar', 'MAT�RIA-PRIMA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_MateriaPrimaAbandonar.Handle, @ti, TipoDoIcone, 'Abandonar', 'MAT�RIA-PRIMA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_MateriaPrimaExcluir.Handle, @ti, TipoDoIcone, 'Excluir', 'MAT�RIA-PRIMA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Fechar.Handle, @ti, TipoDoIcone, 'Fechar', 'MAT�RIA-PRIMA');

end;

procedure TFrmMateriaPrimaCadastro.Dbg_MateriaPrimaEnter(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clMoneyGreen;
end;

procedure TFrmMateriaPrimaCadastro.Dbg_MateriaPrimaExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clWindow;
end;

procedure TFrmMateriaPrimaCadastro.EdtMateriaPrimaCustoExit(Sender: TObject);
begin
  EdtMateriaPrimaCustoMedio.Value:=EdtMateriaPrimaCusto.Value;
end;

end.
