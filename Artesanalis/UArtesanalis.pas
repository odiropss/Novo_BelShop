unit UArtesanalis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons, JvExButtons,
  JvBitBtn, DBXpress, FMTBcd, Grids, DBGrids, DB, Provider, SqlExpr,
  DBClient, JvGradientCaption, JvExControls, JvXPCore, JvXPButtons,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinsdxStatusBarPainter, dxStatusBar, Mask, ToolEdit, CurrEdit;

type
  TFrmArtesanalis = class(TForm)
    PC_Principal: TPageControl;
    Ts_Unidade: TTabSheet;
    Ts_MateriaPrima: TTabSheet;
    MainMenu1: TMainMenu;
    MenuCalculadora: TMenuItem;
    MenuVersao: TMenuItem;
    MenuSAIR: TMenuItem;
    MenuProducao: TMenuItem;
    MenuMateriaPrima: TMenuItem;
    CorCaptionForm: TJvGradientCaption;
    MenuProduto: TMenuItem;
    MenuUnidade: TMenuItem;
    SubMenuMateriaPrimaCadastro: TMenuItem;
    SubMenuMateriaPrimaEntrada: TMenuItem;
    SubMenuProdutoCadastro: TMenuItem;
    SubMenuProdutoSaldo: TMenuItem;
    SubMenuMateriaPrimaSaldo: TMenuItem;
    SubMenuUnidadeCadastro: TMenuItem;
    Ts_Produto: TTabSheet;
    Ts_Producao: TTabSheet;
    PC_Unidade: TPageControl;
    Ts_UnidadeCadastro: TTabSheet;
    PC_MateriaPrima: TPageControl;
    Ts_MateriaPrimaCadastro: TTabSheet;
    Ts_MateriaPrimaEntrada: TTabSheet;
    Ts_MateriaPrimaSaldo: TTabSheet;
    PageControl1: TPageControl;
    Ts_ProdutoCadastro: TTabSheet;
    Ts_ProdutoSaldo: TTabSheet;
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    Pan_Unidade: TPanel;
    Gb_UnidadeCodigo: TGroupBox;
    Gb_UnidadeDescricao: TGroupBox;
    Gb_UnidadeQuantidade: TGroupBox;
    Bt_UnidadeSalvar: TJvXPButton;
    Bt_UnidadeAbandonar: TJvXPButton;
    Bt_UnidadeExcluir: TJvXPButton;
    EdtUnidadeCod: TCurrencyEdit;
    EdtUnidadeAbrev: TEdit;
    EdtUnidadeQtd: TCurrencyEdit;
    StB_Unidade: TdxStatusBar;
    Gb_Unidade: TGroupBox;
    Dbg_Unidade: TDBGrid;
    OdirPanApres: TPanel;
    MainMenu2: TMainMenu;
    Gb_MateriaPrima: TGroupBox;
    Dbg_MateriaPrima: TDBGrid;
    StB_MateriaPrima: TdxStatusBar;
    Pan_MateriaPrima: TPanel;
    Gb_MateriaPrimaCod: TGroupBox;
    EdtMateriaPrimaCod: TCurrencyEdit;
    Gb_MateriaPrimaDesc: TGroupBox;
    EdtMateriaPrimaDesc: TEdit;
    Gb_MateriaPrimaQtdConv: TGroupBox;
    EdtMateriaPrimaQtdConv: TCurrencyEdit;
    Bt_MateriaPrimaSalvar: TJvXPButton;
    Bt_MateriaPrimaAbandonar: TJvXPButton;
    Bt_MateriaPrimaExcluir: TJvXPButton;
    Gb_MateriaPrimaVlrUnit: TGroupBox;
    EdtMateriaPrimaVlrUnit: TCurrencyEdit;
    Panel3: TPanel;
    PageControl2: TPageControl;
    Ts_ProducaoCadastro: TTabSheet;
    Ts_ProducaoProducao: TTabSheet;
    SubMenuProducaoCadastro: TMenuItem;
    SubMenuProducaoProducao: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Procedure FechaTudo;

    Procedure SelecionaTabSheet(Ts: TTabSheet; bTodas, bMenu: Boolean; sMenuDefaut: String='');

    Procedure HabilitaBotoes(sTipo: String; bHabilita: Boolean);
                          // sTipo:
                          // (Un) Botoes da Ts_Unidade
                          // (Ma) Botoes da Ts_MateriaPrima
                          // (Pr) Botoes da Ts_Produto
                          // (Pc) Botoes da Ts_Producao

    Procedure LimpaEdits(sTipo: String);
                          // sTipo:
                          // (Un) Botoes da Ts_Unidade
                          // (Ma) Botoes da Ts_MateriaPrima
                          // (Pr) Botoes da Ts_Produto
                          // (Pc) Botoes da Ts_Producao

    Function  DMLUnidadea(sTipo: String): Boolean;
                       // sTipo:
                       // (IA) Incluir ou Alterar
                       // (EX) Excluir

    Function  DMLMateriaPrima(sTipo: String): Boolean;
                           // sTipo:
                           // (IA) Incluir ou Alterar
                           // (EX) Excluir

    // Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    procedure SubMenuMateriaPrimaEntradaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuSAIRClick(Sender: TObject);
    procedure SubMenuUnidadeCadastroClick(Sender: TObject);
    procedure SubMenuMateriaPrimaCadastroClick(Sender: TObject);
    procedure SubMenuMateriaPrimaSaldoClick(Sender: TObject);
    procedure SubMenuProdutoCadastroClick(Sender: TObject);
    procedure SubMenuProdutoSaldoClick(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure Dbg_UnidadeDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUnidadeCodEnter(Sender: TObject);
    procedure EdtUnidadeCodExit(Sender: TObject);
    procedure Bt_UnidadeExcluirClick(Sender: TObject);
    procedure Dbg_UnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_UnidadeSalvarClick(Sender: TObject);
    procedure EdtUnidadeCodKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_UnidadeAbandonarClick(Sender: TObject);
    procedure Bt_MateriaPrimaSalvarClick(Sender: TObject);
    procedure Bt_MateriaPrimaExcluirClick(Sender: TObject);
    procedure Dbg_MateriaPrimaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SubMenuProducaoCadastroClick(Sender: TObject);
    procedure SubMenuProducaoProducaoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmArtesanalis: TFrmArtesanalis;

  TD: TTransactionDesc;

  bgAlterar: Boolean;

  sgMensagem: String;

implementation

uses UDMArtesanalis, DK_Procs1, SysConst;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manipuação de Dados - MATERIA-PRIMA >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmArtesanalis.DMLMateriaPrima(sTipo: String): Boolean;
Var
  MySql: String;

  sCodMat, sDescMat, sQtdMat, sVlrUMat: String;
Begin
  // sTipo:
  // (IA) Incluir ou Alterar
  // (EX) Excluir

  Result:=True;
  sgMensagem:='';

  OdirPanApres.Caption:='AGUARDE !! Atualizando Matéria-Prima !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmArtesanalis.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmArtesanalis.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmArtesanalis;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  sCodMat  :=EdtMateriaPrimaCod.Text;
  If sCodMat='' Then sCodMat:='0';

  sDescMat:=EdtMateriaPrimaDesc.Text;
  sQtdMat :=EdtMateriaPrimaQtdConv.Text;
  sVlrUMat:=EdtMateriaPrimaVlrUnit.Text;

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

     // (IA) Incluir ou Alterar -------------------------------------
     If sTipo='IA' Then
     Begin
       MySql:=' UPDATE OR INSERT INTO MATERIAPRIMA (COD_MATERIAPRIMA,'+
              ' DES_MATERIAPRIMA, QTD_CONVERSAO, VLR_UNITATIO)'+
              ' VALUES (';

              If StrToInt(sCodMat)=0 Then
               MySql:=
                MySql+' NULL, '
              Else
               MySql:=
                MySql+sCodMat+', ';

               MySql:=
                MySql+QuotedStr(sDescMat)+', '+
                      sQtdMat+', '+
                      QuotedStr(f_Troca(',','.',sVlrUMat))+')'+
                      ' MATCHING (COD_MATERIAPRIMA)';
     End; // If sTipo='IA' Then

     // (EX) Excluir ------------------------------------------------
     If sTipo='EX' Then
     Begin
       MySql:=' DELETE FROM MATERIAPRIMA ma'+
              ' WHERE  ma.cod_materiaprima='+sCodMat;
     End; // If sTipo='EX' Then

     DMArtesanalis.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ===========================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    // Reabre Unidade -----------------------------------------------
    DMArtesanalis.CDS_MateriaPrima.DisableControls;
    DMArtesanalis.CDS_MateriaPrima.Close;
    DMArtesanalis.CDS_MateriaPrima.Open;
    DMArtesanalis.CDS_MateriaPrima.EnableControls;

    DMArtesanalis.CDS_MateriaPrima.Locate('DES_MATERIAPRIMA', sDescMat,[]);

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

  Except // Except da Transação
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
  End; // Try da Transação
End; // Manipuação de Dados - MATERIA-PRIMA >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manipuação de Dados - UNIDADES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmArtesanalis.DMLUnidadea(sTipo: String): Boolean;
Var
  MySql: String;

  sCodUni, sAbrevUni, sQtdUni: String;
Begin
  // sTipo:
  // (IA) Incluir ou Alterar
  // (EX) Excluir

  Result:=True;
  sgMensagem:='';

  OdirPanApres.Caption:='AGUARDE !! Atualizando Unidade !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmArtesanalis.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmArtesanalis.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmArtesanalis;
  OdirPanApres.BringToFront();
  OdirPanApres.Visible:=True;
  Refresh;

  sCodUni  :=EdtUnidadeCod.Text;
  If sCodUni='' Then sCodUni:='0';

  sAbrevUni:=EdtUnidadeAbrev.Text;
  sQtdUni  :=EdtUnidadeQtd.Text;

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

     // (IA) Incluir ou Alterar -------------------------------------
     If sTipo='IA' Then
     Begin
       MySql:=' UPDATE OR INSERT INTO UNIDADE (cod_unidade, des_unidade, qtd_unidade)'+
              ' VALUES (';

              If StrToInt(sCodUni)=0 Then
               MySql:=
                MySql+' NULL, '
              Else
               MySql:=
                MySql+sCodUni+', ';

               MySql:=
                MySql+QuotedStr(sAbrevUni)+', '+
                      sQtdUni+')'+
                      ' MATCHING (cod_unidade)';
     End; // If sTipo='IA' Then

     // (EX) Excluir ------------------------------------------------
     If sTipo='EX' Then
     Begin
       MySql:=' DELETE FROM UNIDADE u'+
              ' WHERE  u.cod_unidade='+sCodUni;
     End; // If sTipo='EX' Then

     DMArtesanalis.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ===========================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    // Reabre Unidade -----------------------------------------------
    DMArtesanalis.CDS_Unidade.DisableControls;
    DMArtesanalis.CDS_Unidade.Close;
    DMArtesanalis.CDS_Unidade.Open;
    DMArtesanalis.CDS_Unidade.EnableControls;

    DMArtesanalis.CDS_Unidade.Locate('DES_UNIDADE; QTD_UNIDADE', VarArrayOf([sAbrevUni,sQtdUni]),[]);

    OdirPanApres.Visible:=False;

    Screen.Cursor:=crDefault;

  Except // Except da Transação
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
  End; // Try da Transação

End; // Manipuação de Dados - UNIDADES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Edits >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmArtesanalis.LimpaEdits(sTipo: String);
Begin
  // sTipo:
  // (Un) Botoes da Ts_Unidade
  // (Ma) Botoes da Ts_MateriaPrima
  // (Pr) Botoes da Ts_Produto
  // (Pc) Botoes da Ts_Producao

  If sTipo='Un' Then
  Begin
    EdtUnidadeCod.Clear;
    EdtUnidadeAbrev.Clear;
    EdtUnidadeQtd.Clear;
  End; // If sTipo='Un' Then

  If sTipo='Ma' Then
  Begin
    EdtMateriaPrimaCod.Clear;
    EdtMateriaPrimaDesc.Clear;
    EdtMateriaPrimaQtdConv.Clear;
    EdtMateriaPrimaVlrUnit.Clear;
  End; // If sTipo='Ma' Then

End; // Limpa Edits >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Habilita/Desabilita Botões >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmArtesanalis.HabilitaBotoes(sTipo: String; bHabilita: Boolean);
Begin
  // sTipo:
  // (Un) Botoes da Ts_Unidade
  // (Ma) Botoes da Ts_MateriaPrima
  // (Pr) Botoes da Ts_Produto
  // (Pc) Botoes da Ts_Producao

  If sTipo='Un' Then
  Begin
    Bt_UnidadeAbandonar.Enabled:=bHabilita;
    Bt_UnidadeExcluir.Enabled:=bHabilita;
    Bt_UnidadeSalvar.Enabled:=bHabilita;
  End; // If sTipo='Un' Then

  If sTipo='Ma' Then
  Begin
    Bt_MateriaPrimaAbandonar.Enabled:=bHabilita;
    Bt_MateriaPrimaExcluir.Enabled:=bHabilita;
    Bt_MateriaPrimaSalvar.Enabled:=bHabilita;
  End; // If sTipo='Ma' Then

End; // Habilita/Desabilita Botões >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmArtesanalis.FechaTudo;
Var
  i: Integer;
Begin

  // Fecha Componentes DMArtesanalis ===============================================
  For i:=0 to DMArtesanalis.ComponentCount-1 do
  Begin
    If DMArtesanalis.Components[i] is TClientDataSet Then
     If (DMArtesanalis.Components[i] as TClientDataSet).Active Then
     (DMArtesanalis.Components[i] as TClientDataSet).Close;

    If DMArtesanalis.Components[i] is TSQLQuery Then
     If (DMArtesanalis.Components[i] as TSQLQuery).Active Then
     (DMArtesanalis.Components[i] as TSQLQuery).Close;
  End;
end; // Fecha Todos os Client's >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Abre Determinada TabSheet >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmArtesanalis.SelecionaTabSheet(Ts: TTabSheet; bTodas, bMenu: Boolean; sMenuDefaut: String=''); // bTodas = Se Tornat Invisivel Todas
Var
  i: Integer;
Begin
  bgSair:=False;

  // TabVisible=False para Todas TabSheet ======================================
  If bTodas Then
  Begin
    For i:=0 to ComponentCount-1 do
    Begin
      If Components[i] is TTabSheet Then
      Begin
        (Components[i] as TTabSheet).TabVisible:=False;
        (Components[i] as TTabSheet).Highlighted:=False;
      End; // If Components[i] is TTabSheet Then
    End; // For i:=0 to ComponentCount-1 do
  End; // If bTodas Then

  // TabVisible=True para TabSheet Selecionada =================================
  If Ts<>nil Then
  Begin
    For i:=0 to ComponentCount-1 do
    Begin
      If (Components[i] is TTabSheet) Then
      Begin
        If (Components[i] as TTabSheet).Name=ts.Name Then
        Begin
          (Components[i] as TTabSheet).TabVisible:=True;
          (Components[i] as TTabSheet).Highlighted:=True;

        // Coloca O Painel Pan_Solicitacoes no TabSheet Selecionado
        Pan_Solicitacoes.Parent:=Ts;

        End; // If (Components[i] as TTabSheet).Name=ts.Name Then
      End; // If (Components[i] is TTabSheet) Then
    End; // For i:=0 to ComponentCount-1 do
  End; // If Ts<>nil Then

  // Acerta Menus ==============================================================
  For i:=0 to MainMenu1.Items.Count-1 do
  Begin
    If (MainMenu1.Items.Items[i].Name<>'MenuVersao') and (MainMenu1.Items.Items[i].Name<>'MenuCalculadora') Then
     MainMenu1.Items.Items[i].Enabled:=bMenu;

    If bTodas Then
     MainMenu1.Items.Items[i].Default:=False;
  End; // For i:=0 to MainMenu1.Items.Count-1 do

  // Coloca Menu Selecionado em Negrito ============================
  If sMenuDefaut<>'' Then
  Begin
    For i:=0 to MainMenu1.Items.Count-1 do
    Begin
      If MainMenu1.Items.Items[i].Name=sMenuDefaut Then
      Begin
        MainMenu1.Items.Items[i].Default:=True;
        Break;
      End;
    End; // For i:=0 to MainMenu1.Items.Count-1 do
  End; // If sMenuDefaut<>'' Then

  If Ts<>nil Then
   Begin
     Align:=alClient;
   End
  Else
   Begin
     ClientHeight:=0;
     Align:=alNone;
     Height:=57;
   End; // If Ts<>nil Then

  If Not PC_Principal.Visible Then
   PC_Principal.Visible:=True;

  If bMenu Then
  Begin
    bgSair:=True;
    FechaTudo;
  End;

  Refresh;
end; // Abre Determinada TabSheet >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmArtesanalis.FormShow(Sender: TObject);
begin
  FrmArtesanalis.ClientHeight:=0;
  FrmArtesanalis.Align:=alNone;
  FrmArtesanalis.Height:=57;

  CorCaptionForm.Active:=False;
  CorCaptionForm.Active:=True;

end;

procedure TFrmArtesanalis.FormCreate(Sender: TObject);
begin
  // Não Permite Movimentar o Formulário =======================================
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

procedure TFrmArtesanalis.FormResize(Sender: TObject);
begin
  PageControl1.Align:=alNone;
  PageControl1.Align:=alClient;

end;

procedure TFrmArtesanalis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bgSair Then
   Begin
     Action := caFree;

     FechaTudo;
   End
  Else
   Begin
     msg('Para Fechar Tecle Primeiro'+cr+cr+'no Botão <Fechar>...','A');
     Action := caNone;
   End;

end;

procedure TFrmArtesanalis.MenuSAIRClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmArtesanalis.SubMenuUnidadeCadastroClick(Sender: TObject);
begin
  EdtUnidadeCod.Clear;
  EdtUnidadeAbrev.Clear;
  EdtUnidadeQtd.Clear;

  DMArtesanalis.CDS_Unidade.Open;

  SelecionaTabSheet(Ts_Unidade, True, False);
  SelecionaTabSheet(Ts_UnidadeCadastro, False, False, 'MenuUnidade');

  EdtUnidadeCod.SetFocus;

end;

procedure TFrmArtesanalis.SubMenuMateriaPrimaCadastroClick(Sender: TObject);
begin
  EdtMateriaPrimaCod.Clear;
  EdtMateriaPrimaDesc.Clear;
  EdtMateriaPrimaQtdConv.Clear;
  EdtMateriaPrimaVlrUnit.Clear;

  DMArtesanalis.CDS_MateriaPrima.Open;

  SelecionaTabSheet(Ts_MateriaPrima, True, False, 'MenuMateriaPrima');
  SelecionaTabSheet(Ts_MateriaPrimaCadastro, False, False);

  EdtMateriaPrimaCod.SetFocus;

end;

procedure TFrmArtesanalis.SubMenuMateriaPrimaEntradaClick(Sender: TObject);
begin
  SelecionaTabSheet(Ts_MateriaPrima, True, False, 'MenuMateriaPrima');
  SelecionaTabSheet(Ts_MateriaPrimaEntrada, False, False);
end;

procedure TFrmArtesanalis.SubMenuMateriaPrimaSaldoClick(Sender: TObject);
begin
  SelecionaTabSheet(Ts_MateriaPrima, True, False, 'MenuMateriaPrima');
  SelecionaTabSheet(Ts_MateriaPrimaSaldo, False, False);
end;

procedure TFrmArtesanalis.SubMenuProdutoCadastroClick(Sender: TObject);
begin
  SelecionaTabSheet(Ts_Produto, True, False, 'MenuProduto');
  SelecionaTabSheet(Ts_ProdutoCadastro, False, False);
end;

procedure TFrmArtesanalis.SubMenuProdutoSaldoClick(Sender: TObject);
begin
  SelecionaTabSheet(Ts_Produto, True, False, 'MenuProduto');
  SelecionaTabSheet(Ts_ProdutoSaldo, False, False);
end;

procedure TFrmArtesanalis.Bt_FecharClick(Sender: TObject);
begin
  SelecionaTabSheet(nil, True, True);
end;

procedure TFrmArtesanalis.Dbg_UnidadeDblClick(Sender: TObject);
begin
  {
  Usado em:
  =========
  Dbg_Unidade

  Dbg_MateriaPrima
  }

  bgAlterar:=True;

  // Dbg_Unidade ===============================================================
  If Trim((Sender as TDBGrid).Name)='Dbg_Unidade' Then
  Begin
    If DMArtesanalis.CDS_Unidade.IsEmpty Then
     Exit;

    EdtUnidadeCod.AsInteger:=DMArtesanalis.CDS_UnidadeCOD_UNIDADE.AsInteger;
    EdtUnidadeAbrev.Text    :=DMArtesanalis.CDS_UnidadeDES_UNIDADE.AsString;
    EdtUnidadeQtd.AsInteger:=DMArtesanalis.CDS_UnidadeQTD_UNIDADE.AsInteger;
    EdtUnidadeAbrev.SetFocus;
  End; // If Trim((Sender as TDBGrid).Name)='Dbg_Unidade' Then

  // Dbg_MateriaPrima ===========================================================
  If Trim((Sender as TDBGrid).Name)='Dbg_MateriaPrima' Then
  Begin
    If DMArtesanalis.CDS_MateriaPrima.IsEmpty Then
     Exit;

    EdtMateriaPrimaCod.AsInteger    :=DMArtesanalis.CDS_MateriaPrimaCOD_MATERIAPRIMA.AsInteger;
    EdtMateriaPrimaDesc.Text        :=DMArtesanalis.CDS_MateriaPrimaDES_MATERIAPRIMA.AsString;
    EdtMateriaPrimaQtdConv.AsInteger:=DMArtesanalis.CDS_MateriaPrimaQTD_CONVERSAO.AsInteger;
    EdtMateriaPrimaVlrUnit.Value    :=DMArtesanalis.CDS_MateriaPrimaVLR_UNITATIO.AsCurrency;
    EdtMateriaPrimaDesc.SetFocus;
  End; // If Trim((Sender as TDBGrid).Name)='Dbg_MateriaPrima' Then
end;

procedure TFrmArtesanalis.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmArtesanalis.EdtUnidadeCodEnter(Sender: TObject);
begin
  {
  Usado em:
  =========
  EdtUnidadeCod

  EdtMateriaPrimaCod
  }

  // EdtUnidadeCod =============================================================
  If Trim((Sender as TCurrencyEdit).Name)='EdtUnidadeCod' Then
  Begin
    HabilitaBotoes('Un', True);
    LimpaEdits('Un');
  End; // If Trim((Sender as TCurrencyEdit).Name)='EdtUnidadeCod' Then

  // EdtMateriaPrimaCod ========================================================
  If Trim((Sender as TCurrencyEdit).Name)='EdtMateriaPrimaCod' Then
  Begin
    HabilitaBotoes('Ma', True);
    LimpaEdits('Ma');
  End; // If Trim((Sender as TCurrencyEdit).Name)='EdtMateriaPrimaCod' Then

  bgAlterar:=False;
end;

procedure TFrmArtesanalis.EdtUnidadeCodExit(Sender: TObject);
begin
  {
  Usado em:
  =========
  EdtUnidadeCod

  EdtMateriaPrimaCod
  }

  // EdtUnidadeCod =============================================================
  If Trim((Sender as TCurrencyEdit).Name)='EdtUnidadeCod' Then
  Begin
    If EdtUnidadeCod.AsInteger=0 Then
     Exit;

    If DMArtesanalis.CDS_Unidade.Locate('COD_UNIDADE', EdtUnidadeCod.AsInteger,[]) Then
     Begin
       EdtUnidadeAbrev.Text:=DMArtesanalis.CDS_UnidadeDES_UNIDADE.AsString;
       EdtUnidadeQtd.Value :=DMArtesanalis.CDS_UnidadeQTD_UNIDADE.AsInteger;
       bgAlterar:=True;
     End
    Else
     Begin
       msg('Unidade Não Encontrada !!','A');
       bgAlterar:=False;
       EdtUnidadeCod.SetFocus;
     End; // If DMArtesanalis.CDS_Unidade.Locate('COD_UNIDADE', EdtUnidadeCod.AsInteger,[]) Then
  End; // If Trim((Sender as TCurrencyEdit).Name)='EdtUnidadeCod' Then

  // EdtMateriaPrimaCod ========================================================
  If Trim((Sender as TCurrencyEdit).Name)='EdtMateriaPrimaCod' Then
  Begin
    If EdtMateriaPrimaCod.AsInteger=0 Then
     Exit;

    If DMArtesanalis.CDS_MateriaPrima.Locate('COD_MATERIAPRIMA', EdtMateriaPrimaCod.AsInteger,[]) Then
     Begin
       EdtMateriaPrimaDesc.Text    :=DMArtesanalis.CDS_MateriaPrimaDES_MATERIAPRIMA.AsString;
       EdtMateriaPrimaQtdConv.Value:=DMArtesanalis.CDS_MateriaPrimaQTD_CONVERSAO.AsInteger;
       EdtMateriaPrimaVlrUnit.Value:=DMArtesanalis.CDS_MateriaPrimaVLR_UNITATIO.AsInteger;
       bgAlterar:=True;
     End
    Else
     Begin
       msg('Matéria-Prima Não Encontrada !!','A');
       bgAlterar:=False;
       EdtMateriaPrimaCod.SetFocus;
     End; // If DMArtesanalis.CDS_MateriaPrima.Locate('COD_MATERIAPRIMA', EdtMateriaPrimaCod.AsInteger,[]) Then
  End; // If Trim((Sender as TCurrencyEdit).Name)='EdtMateriaPrimaCod' Then

end;

procedure TFrmArtesanalis.Bt_UnidadeExcluirClick(Sender: TObject);
Var
  MySql: String;
begin
  If DMArtesanalis.CDS_Unidade.IsEmpty Then
   Exit;

  If EdtUnidadeCod.AsInteger=0 Then
  Begin
    msg('Favor Selecinar'+cr+cr+'A Unidade a Excluir !!','A');
    EdtUnidadeCod.SetFocus;
    Exit;
  End; // If EdtUnidadeCod.AsInteger=0 Then

  If msg('Deseja Realmente Excluir a'+cr+'Unidade Selecionada ??','C')=2 Then
  Begin
    EdtUnidadeCod.SetFocus;
    Exit;
  End;

  // Consiste Exclusão =========================================================
  sgMensagem:='';
  MySql:=' SELECT pr.Des_Produto'+
         ' FROM PRODUTO pr'+
         ' WHERE pr.cod_unidade='+EdtUnidadeCod.Text;
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;
  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Des_Produto').AsString)<>'' Then
   sgMensagem:='PRODUTOS';
  DMArtesanalis.CDS_Busca.Close;

  If Trim(sgMensagem)<>'' Then
  Begin
    MessageBox(Handle, pChar('Impossível Excluir !!'+cr+'Unidade Já Utilizada em:'+cr+cr+sgMensagem), 'Erro', MB_ICONERROR);
    EdtUnidadeCod.SetFocus;
    Exit;
  End; // If Trim(sgMensagem)<>'' Then

  // Executa DML ===============================================================
  If not DMLUnidadea('EX') Then
   MessageBox(Handle, pChar('Erro ao Excluir a Unidade !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  EdtUnidadeCodEnter(EdtUnidadeCod);
  EdtUnidadeCod.SetFocus;

end;

procedure TFrmArtesanalis.Dbg_UnidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  // Localiza Unidade ==========================================================
  If Key=VK_F4 Then
  Begin
    If Not DMArtesanalis.CDS_Unidade.IsEmpty Then
    Begin
      i:=DMArtesanalis.CDS_Unidade.RecNo;

      s:='';
      If InputQuery('Localizar Unidade','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            If Not DMArtesanalis.CDS_Unidade.Locate('COD_UNIDADE',StrToInt(s),[]) Then
            Begin
              DMArtesanalis.CDS_Unidade.RecNo:=i;
              msg('Unidade Não Encontrada !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMArtesanalis.CDS_Unidade, 'DES_UNIDADE', s) Then
            Begin
              DMArtesanalis.CDS_Unidade.RecNo:=i;
              msg('Unidade Não Encontrada !!','A');
            End;
          End; // Try
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Unidade','',s) then
    End; // If Not DMArtesanalis.CDS_Unidade.IsEmpty Then
  End; //If Key=VK_F4 Then
end;

procedure TFrmArtesanalis.Bt_UnidadeSalvarClick(Sender: TObject);
begin
  // Consiste a Abreviatuara da Unidade ========================================
  If Trim(EdtUnidadeAbrev.Text)='' Then
  Begin
    msg('Favor Informar a'+cr+cr+'Abreviatira da Unidade !!','A');
    EdtUnidadeAbrev.SetFocus;
    Exit;
  End;

  // Consiste a Quantidade da Unidade ==========================================
  If EdtUnidadeQtd.AsInteger=0 Then
  Begin
    msg('Favor Informar a'+cr+cr+'Quantidade da Unidade !!','A');
    EdtUnidadeQtd.SetFocus;
    Exit;
  End;

  // Verifica a Exisatencia da Unidade =========================================
  If (DMArtesanalis.CDS_Unidade.Locate('DES_UNIDADE', EdtUnidadeAbrev.Text,[])) And (Not bgAlterar) Then
  Begin
    If EdtUnidadeQtd.AsInteger=DMArtesanalis.CDS_UnidadeQTD_UNIDADE.AsInteger Then
    Begin
      msg('Unidade Já Cadastra!!','A');
      EdtUnidadeCod.SetFocus;
      Exit;
    End;
  End;

  // Executa DML ===============================================================
  If not DMLUnidadea('IA') Then
   MessageBox(Handle, pChar('Erro ao Incluir/Altera a Unidade !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  EdtUnidadeCodEnter(EdtUnidadeCod);
  EdtUnidadeCod.SetFocus;

end;

procedure TFrmArtesanalis.EdtUnidadeCodKeyPress(Sender: TObject; var Key: Char);
begin
  {
  Usado em:
  =========
  EdtUnidadeCod
  EdtUnidadeQtd

  EdtMateriaPrimaCod
  EdtMateriaPrimaQtdConv
  EdtMateriaPrimaVlrUnit
  }

  If not (key in ['0'..'9']) Then
  Begin
    Key := #0;
    Exit;
  End;
end;

procedure TFrmArtesanalis.Bt_UnidadeAbandonarClick(Sender: TObject);
begin
  {
  Usado em:
  =========
  Bt_UnidadeAbandonar

  Bt_MateriaPrimaAbandonar
  }

  // Bt_UnidadeAbandonar =======================================================
  If Trim((Sender as TJvXPButton).Name)='Bt_UnidadeAbandonar' Then
  Begin
    EdtUnidadeCodEnter(EdtUnidadeCod);
    EdtUnidadeCod.SetFocus;
  End; // If Trim((Sender as TJvXPButton).Name)='Bt_UnidadeAbandonar' Then

  // Bt_MateriaPrimaAbandonar ==================================================
  If Trim((Sender as TJvXPButton).Name)='Bt_MateriaPrimaAbandonar' Then
  Begin
    EdtUnidadeCodEnter(EdtMateriaPrimaCod);
    EdtMateriaPrimaCod.SetFocus;
  End; // If Trim((Sender as TJvXPButton).Name)='Bt_MateriaPrimaAbandonar' Then
   
end;

procedure TFrmArtesanalis.Bt_MateriaPrimaSalvarClick(Sender: TObject);
begin
  // Consiste a Descrição da Matéria-Prima =====================================
  If Trim(EdtMateriaPrimaDesc.Text)='' Then
  Begin
    msg('Favor Informar a'+cr+cr+'Descrição da Matéria-Prima !!','A');
    EdtMateriaPrimaDesc.SetFocus;
    Exit;
  End;

  // Consiste a Quantidade de Conversão ========================================
  If EdtMateriaPrimaQtdConv.AsInteger=0 Then
  Begin
    msg('Favor Informar a'+cr+cr+'Quantidade de Conversão !!','A');
    EdtMateriaPrimaQtdConv.SetFocus;
    Exit;
  End;

  // Consiste o Valor Unitário =================================================
  If EdtMateriaPrimaVlrUnit.AsInteger=0 Then
  Begin
    msg('Favor Informar o'+cr+cr+'Valor Unitário !!','A');
    EdtMateriaPrimaVlrUnit.SetFocus;
    Exit;
  End;

  // Verifica a Exisatencia da Matéria-Prima ===================================
  If (DMArtesanalis.CDS_MateriaPrima.Locate('DES_MATERIAPRIMA', EdtMateriaPrimaDesc.Text,[])) And (Not bgAlterar) Then
  Begin
    msg('Matéria-Prima Já Cadastra!!','A');
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End;

  // Executa DML ===============================================================
  If not DMLMateriaPrima('IA') Then
   MessageBox(Handle, pChar('Erro ao Incluir/Altera a Matéria-Prima !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  EdtUnidadeCodEnter(EdtMateriaPrimaCod);
  EdtMateriaPrimaCod.SetFocus;

end;

procedure TFrmArtesanalis.Bt_MateriaPrimaExcluirClick(Sender: TObject);
Var
  MySql: String;
begin
  If DMArtesanalis.CDS_MateriaPrima.IsEmpty Then
   Exit;

  If EdtMateriaPrimaCod.AsInteger=0 Then
  Begin
    msg('Favor Selecinar'+cr+cr+'A Matéria-Prima a Excluir !!','A');
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End; // If EdtUnidadeCod.AsInteger=0 Then

  If msg('Deseja Realmente Excluir a'+cr+'Matéria-Prima Selecionada ??','C')=2 Then
  Begin
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End;

  // Consiste Exclusão =========================================================
  sgMensagem:='';
  MySql:=' SELECT p.Cod_MateriaPrima'+
         ' FROM PRODUCAO p'+
         ' WHERE p.cod_materiaprima='+EdtMateriaPrimaCod.Text;
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;
  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Cod_MateriaPrima').AsString)<>'' Then
   sgMensagem:='PRODUÇÃO';
  DMArtesanalis.CDS_Busca.Close;

  If Trim(sgMensagem)<>'' Then
  Begin
    MessageBox(Handle, pChar('Impossível Excluir !!'+cr+'Matéria-Prima Já Utilizada em:'+cr+cr+sgMensagem), 'Erro', MB_ICONERROR);
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End; // If Trim(sgMensagem)<>'' Then

  // Executa DML ===============================================================
  If not DMLMateriaPrima('EX') Then
   MessageBox(Handle, pChar('Erro ao Excluir a Matéria-Prima !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  EdtUnidadeCodEnter(EdtMateriaPrimaCod);
  EdtMateriaPrimaCod.SetFocus;

end;

procedure TFrmArtesanalis.Dbg_MateriaPrimaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  // Localiza Unidade ==========================================================
  If Key=VK_F4 Then
  Begin
    If Not DMArtesanalis.CDS_MateriaPrima.IsEmpty Then
    Begin
      i:=DMArtesanalis.CDS_MateriaPrima.RecNo;

      s:='';
      If InputQuery('Localizar Matéria-Prima','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            If Not DMArtesanalis.CDS_MateriaPrima.Locate('COD_MATERIAPRIMA',StrToInt(s),[]) Then
            Begin
              DMArtesanalis.CDS_MateriaPrima.RecNo:=i;
              msg('Matéria-Prima Não Encontrada !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMArtesanalis.CDS_MateriaPrima, 'DES_MATERIAPRIMA', s) Then
            Begin
              DMArtesanalis.CDS_Unidade.RecNo:=i;
              msg('Matéria-Prima Não Encontrada !!','A');
            End;
          End; // Try
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Matéria-Prima','',s) then
    End; // If Not DMArtesanalis.CDS_MateriaPrima.IsEmpty Then
  End; //If Key=VK_F4 Then
end;

procedure TFrmArtesanalis.SubMenuProducaoCadastroClick(Sender: TObject);
begin
  SelecionaTabSheet(Ts_Producao, True, False, 'MenuProducao');
  SelecionaTabSheet(Ts_ProducaoCadastro, False, False);

end;

procedure TFrmArtesanalis.SubMenuProducaoProducaoClick(Sender: TObject);
begin
  SelecionaTabSheet(Ts_Producao, True, False, 'MenuProducao');
  SelecionaTabSheet(Ts_ProducaoProducao, False, False);

end;

end.

