unit UFrmProducaoCadastro;

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
  JvXPCore, JvXPButtons, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls, DBXpress;

type
  TFrmProducaoCadastro = class(TForm)
    Gb_Principal: TGroupBox;
    Pan_ProducaoSolic: TPanel;
    Gb_ProducaoCod: TGroupBox;
    EdtProducaoCod: TCurrencyEdit;
    Gb_ProducaoDesc: TGroupBox;
    EdtProducaoDesc: TEdit;
    Bt_ProducaoSalvar: TJvXPButton;
    Bt_ProducaoAbandonar: TJvXPButton;
    Bt_ProducaoExcluir: TJvXPButton;
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    Gb_MateriaPrimaCod: TGroupBox;
    EdtMateriaPrimaCod: TCurrencyEdit;
    Gb_MateriaPrimaDesc: TGroupBox;
    EdtMateriaPrimaDesc: TEdit;
    Bt_MateriaPrimaBusca: TJvXPButton;
    Gb_MateriaPrimaPerc: TGroupBox;
    EdtMateriaPrimaPerc: TCurrencyEdit;
    Gb_Producao: TGroupBox;
    Dbg_Producao: TDBGrid;
    Bt_MateriaPrimaSalvar: TJvXPButton;
    Bt_MateriaPrimaAbandonar: TJvXPButton;
    Bt_MateriaPrimaExcluir: TJvXPButton;
    Gb_MateriaPrima: TGroupBox;
    Dbg_MateriaPrima: TDBGrid;
    StB_Producao: TdxStatusBar;
    OdirPanApres: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    // Odir ====================================================================

    Procedure HabilitaComponetes(bHabilita: Boolean; bTodos: Boolean = True);
    Procedure LimpaComponentes(bTodos: Boolean = True);

    Function  DMLProducao(sTipo: String): Boolean;
                       // sTipo:
                       // (IAP) Incluir ou Alterar Produção
                       // (EXP) Excluir Produção
                       // (IAM) Incluir ou Alterar Materia-Prima na Produção
                       // (EXM) Excluir Materia-Prima da Produção
    // Odir ====================================================================

    procedure EdtProducaoCodEnter(Sender: TObject);
    procedure EdtProducaoCodExit(Sender: TObject);
    procedure Bt_ProducaoSalvarClick(Sender: TObject);
    procedure Bt_ProducaoAbandonarClick(Sender: TObject);
    procedure Bt_ProducaoExcluirClick(Sender: TObject);
    procedure Dbg_ProducaoDblClick(Sender: TObject);
    procedure Dbg_ProducaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtMateriaPrimaCodEnter(Sender: TObject);
    procedure EdtMateriaPrimaCodExit(Sender: TObject);
    procedure Dbg_MateriaPrimaDblClick(Sender: TObject);
    procedure Bt_MateriaPrimaBuscaClick(Sender: TObject);
    procedure Dbg_ProducaoCellClick(Column: TColumn);
    procedure Bt_MateriaPrimaAbandonarClick(Sender: TObject);
    procedure Bt_MateriaPrimaSalvarClick(Sender: TObject);
    procedure Bt_MateriaPrimaExcluirClick(Sender: TObject);
    procedure Dbg_MateriaPrimaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dbg_ProducaoEnter(Sender: TObject);
    procedure Dbg_ProducaoExit(Sender: TObject);
    procedure Dbg_MateriaPrimaEnter(Sender: TObject);
    procedure Dbg_MateriaPrimaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProducaoCadastro: TFrmProducaoCadastro;

  TD: TTransactionDesc;

  bgAlterar, // Se é Alteração de Produção
  bgAlterarMP, // Se é Alteração de Materia-Prima
  bgSairProducao: Boolean;

  sgMensagem: String;

implementation

uses DK_Procs1, UDMArtesanalis, DB, UPesquisa;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manipuação de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function  TFrmProducaoCadastro.DMLProducao(sTipo: String): Boolean;
Var
  sCod, MySql: String;
Begin
  // sTipo:
  // (IAP) Incluir ou Alterar Produção
  // (EXP) Excluir Produção
  // (IAM) Incluir ou Alterar Materia-Prima na Produção
  // (EXM) Excluir Materia-Prima da Produção

  Result:=True;
  sgMensagem:='';

  OdirPanApres.Caption:='AGUARDE !! Atualizando Produção !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmProducaoCadastro.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmProducaoCadastro.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmProducaoCadastro;
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

    sCod:=IntToStr(EdtProducaoCod.AsInteger);
    If sCod='0' Then
    Begin
      MySql:=' SELECT COALESCE(MAX(p.cod_aux)+1 ,1) Cod'+
             ' FROM TAB_AUXILIAR p'+
             ' WHERE p.tip_aux=1';
      DMArtesanalis.CDS_BuacaRapida.Close;
      DMArtesanalis.SQLQ_BuacaRapida.SQL.Clear;
      DMArtesanalis.SQLQ_BuacaRapida.SQL.Add(MySql);
      DMArtesanalis.CDS_BuacaRapida.Open;
      sCod:=DMArtesanalis.CDS_BuacaRapida.FieldByName('Cod').AsString;
      DMArtesanalis.CDS_BuacaRapida.Close;
    End; // If sCod='0'Then

    // (IAP) Incluir ou Alterar Produção =======================================
    If sTipo='IAP' Then
    Begin
      MySql:=' UPDATE OR INSERT INTO TAB_AUXILIAR'+
             ' (TIP_AUX, COD_AUX, DES_AUX, DES_AUX1, VLR_AUX, VLR_AUX1)'+
             ' VALUES ('+
             ' 1,'+ // TIP_AUX
             sCod+', '+ // COD_AUX
             QuotedStr(Trim(EdtProducaoDesc.Text))+', '+ // DES_AUX
             ' NULL, NULL, NULL)'+ // DES_AUX1, VLR_AUX, VLR_AUX1
             ' MATCHING (TIP_AUX, COD_AUX)';
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='IAP' Then

    // (EXP) Excluir Produção ==================================================
    If sTipo='EXP' Then
    Begin
      MySql:=' DELETE FROM PRODUCAO p'+
             ' WHERE  p.cod_producao='+IntToStr(EdtProducaoCod.AsInteger);
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);

      MySql:=' DELETE FROM TAB_AUXILIAR p'+
             ' WHERE p.tip_aux=1'+
             ' AND   p.cod_aux='+IntToStr(EdtProducaoCod.AsInteger);
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='EXP' Then

    // (IAM) Incluir ou Alterar Materia-Prima na Produção ======================
    If sTipo='IAM' Then
    Begin
      MySql:=' UPDATE OR INSERT INTO PRODUCAO'+
             ' (COD_PRODUCAO, COD_MATERIAPRIMA, PER_UTILIZACAO)'+
             ' VALUES ('+
             IntToStr(EdtProducaoCod.AsInteger)+', '+ // COD_PRODUCAO
             IntToStr(EdtMateriaPrimaCod.AsInteger)+', '+ // COD_MATERIAPRIMA
             QuotedStr(f_Troca(',','.',VarToStr(EdtMateriaPrimaPerc.Value)))+')'+ // PER_UTILIZACAO
             ' MATCHING (COD_PRODUCAO, COD_MATERIAPRIMA)';
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='IAP' Then

    // (EXM) Excluir Materia-Prima da Produção =================================
    If sTipo='EXM' Then
    Begin
      MySql:=' DELETE FROM PRODUCAO p'+
             ' WHERE  p.cod_producao='+IntToStr(EdtProducaoCod.AsInteger)+
             ' AND    p.cod_materiaPrima='+IntToStr(EdtMateriaPrimaCod.AsInteger);
      DMArtesanalis.SQLC.Execute(MySql,nil,nil);
    End; // If sTipo='EXP' Then

    // Atualiza Transacao ======================================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    // Reabre Unidade ==========================================================
    DMArtesanalis.CDS_ProducaoMatPrima.DisableControls;
    DMArtesanalis.CDS_Producao.DisableControls;
    DMArtesanalis.CDS_ProducaoMatPrima.Close;
    DMArtesanalis.CDS_Producao.Close;
    DMArtesanalis.CDS_Producao.Open;
    DMArtesanalis.CDS_ProducaoMatPrima.Open;
    DMArtesanalis.CDS_Producao.EnableControls;
    DMArtesanalis.CDS_ProducaoMatPrima.EnableControls;

    DMArtesanalis.CDS_Producao.Locate('DES_PRODUCAO', Trim(EdtProducaoDesc.Text),[]);
    DMArtesanalis.CDS_ProducaoMatPrima.Locate('DES_MATERIAPRIMA', Trim(EdtMateriaPrimaDesc.Text),[]);

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
End; // Manipuação de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Procedure TFrmProducaoCadastro.LimpaComponentes(bTodos: Boolean = True);
Begin
  If bTodos Then
  Begin
    EdtProducaoCod.AsInteger:=0;
    EdtProducaoDesc.Clear;
  End; // If bTodos Then

  EdtMateriaPrimaCod.AsInteger:=0;
  EdtMateriaPrimaDesc.Clear;
  EdtMateriaPrimaPerc.Value:=0.00
End;

Procedure TFrmProducaoCadastro.HabilitaComponetes(bHabilita: Boolean; bTodos: Boolean = True);
Begin
  If bTodos Then
  Begin
    EdtProducaoCod.Enabled :=Not bHabilita;
    EdtProducaoDesc.Enabled:=Not bHabilita;

    Bt_ProducaoSalvar.Enabled   :=Not bHabilita;
    Bt_ProducaoAbandonar.Enabled:=Not bHabilita;
    Bt_ProducaoExcluir.Enabled  :=Not bHabilita;
  End; // If bTodos Then

  EdtMateriaPrimaCod.Enabled :=bHabilita;
  EdtMateriaPrimaDesc.Enabled:=bHabilita;
  EdtMateriaPrimaPerc.Enabled:=bHabilita;

  Bt_MateriaPrimaBusca.Enabled    :=bHabilita;
  Bt_MateriaPrimaSalvar.Enabled   :=bHabilita;
  Bt_MateriaPrimaAbandonar.Enabled:=bHabilita;
  Bt_MateriaPrimaExcluir.Enabled  :=bHabilita;
End;


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmProducaoCadastro.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;
end;

procedure TFrmProducaoCadastro.Bt_FecharClick(Sender: TObject);
begin
  bgSairProducao:=True;

  Close;

end;

procedure TFrmProducaoCadastro.FormShow(Sender: TObject);
begin
  bgSairProducao:=False;

  LimpaComponentes;
  HabilitaComponetes(False);

  EdtProducaoCod.SetFocus;

end;

procedure TFrmProducaoCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Not bgSairProducao Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Botão <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  DMArtesanalis.CDS_Producao.Close;
  DMArtesanalis.CDS_ProducaoMatPrima.Close;

  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('Cadastro de Produção');
end;

procedure TFrmProducaoCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmProducaoCadastro.EdtProducaoCodEnter(Sender: TObject);
begin
  HabilitaComponetes(False);
  LimpaComponentes(True);

  bgAlterar:=False;
end;

procedure TFrmProducaoCadastro.EdtProducaoCodExit(Sender: TObject);
begin
  If EdtProducaoCod.AsInteger=0 Then
  Begin
    HabilitaComponetes(False);
    LimpaComponentes(False);
    Exit;
  End;

  If DMArtesanalis.CDS_Producao.Locate('COD_PRODUCAO', EdtProducaoCod.AsInteger,[]) Then
   Begin
     EdtProducaoDesc.Text:=DMArtesanalis.CDS_ProducaoDES_PRODUCAO.AsString;
     HabilitaComponetes(True, False);
     bgAlterar:=True;
   End
  Else
   Begin
     msg('Produção Não Encontrada !!','A');
     bgAlterar:=False;
     EdtProducaoCod.SetFocus;
   End; // If DMArtesanalis.CDS_Producao.Locate('COD_PRODUCAO', EdtProducaoCod.AsInteger,[]) Then

end;

procedure TFrmProducaoCadastro.Bt_ProducaoSalvarClick(Sender: TObject);
begin
  // Consiste a Descrição Produção =============================================
  If Trim(EdtProducaoDesc.Text)='' Then
  Begin
    msg('Favor Informar a'+cr+cr+'Descrição da Produção !!','A');
    EdtProducaoDesc.SetFocus;
    Exit;
  End;

  // Verifica a Existencia da Produção ========================================
  If (DMArtesanalis.CDS_Producao.Locate('DES_PRODUCAO', EdtProducaoDesc.Text,[])) And (Not bgAlterar) Then
  Begin
    msg('Produção Já Cadastra!!','A');
    EdtProducaoCod.SetFocus;
    Exit;
  End;

  EdtMateriaPrimaCod.AsInteger:=0;
  EdtMateriaPrimaDesc.Clear;
  EdtMateriaPrimaPerc.Value:=0.00;

  // (IAP) Incluir ou Alterar Produção =========================================
  If not DMLProducao('IAP') Then
   MessageBox(Handle, pChar('Erro ao Incluir/Altera a Produção !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  EdtProducaoCodEnter(Self);
  EdtProducaoCod.SetFocus;
end;

procedure TFrmProducaoCadastro.Bt_ProducaoAbandonarClick(Sender: TObject);
begin
  EdtProducaoCodEnter(Self);
  EdtProducaoCod.SetFocus;
end;

procedure TFrmProducaoCadastro.Bt_ProducaoExcluirClick(Sender: TObject);
Var
  MySql: String;
begin
  If DMArtesanalis.CDS_Producao.IsEmpty Then
   Exit;

  If EdtProducaoCod.AsInteger=0 Then
  Begin
    msg('Favor Selecinar'+cr+cr+'A Produção a Excluir !!','A');
    EdtProducaoCod.SetFocus;
    Exit;
  End;

  If msg('Deseja Realmente Excluir a'+cr+'Produção Selecionada ??','C')=2 Then
  Begin
    EdtProducaoCod.SetFocus;
    Exit;
  End;

  // Consiste Exclusão =========================================================
  sgMensagem:='';
  MySql:=' SELECT p.des_produto'+
         ' FROM PRODUTO p'+
         ' WHERE p.cod_producao='+IntToStr(EdtProducaoCod.AsInteger);
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;
  If Trim(DMArtesanalis.CDS_Busca.FieldByName('Des_Produto').AsString)<>'' Then
   sgMensagem:=Trim(DMArtesanalis.CDS_Busca.FieldByName('Des_Produto').AsString);
  DMArtesanalis.CDS_Busca.Close;

  If Trim(sgMensagem)<>'' Then
  Begin
    MessageBox(Handle, pChar('Impossível Excluir !!'+cr+'Produção Utilizada no Protudo:'+cr+cr+sgMensagem), 'Erro', MB_ICONERROR);
    EdtProducaoCod.SetFocus;
    Exit;
  End; // If Trim(sgMensagem)<>'' Then

  // (EXP) Excluir Produção ====================================================
  If not DMLProducao('EXP') Then
   MessageBox(Handle, pChar('Erro ao Excluir a Produção !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  EdtProducaoCodEnter(Self);
  EdtProducaoCod.SetFocus;
end;

procedure TFrmProducaoCadastro.Dbg_ProducaoDblClick(Sender: TObject);
begin
  {
  Usado em:

  Dbg_ProducaoCellClick
  }

  If (EdtProducaoCod.AsInteger=DMArtesanalis.CDS_ProducaoCOD_PRODUCAO.AsInteger) or
     (DMArtesanalis.CDS_Producao.IsEmpty) Then
   Exit;


  EdtProducaoCodEnter(Self);

  EdtProducaoCod.AsInteger    :=DMArtesanalis.CDS_ProducaoCOD_PRODUCAO.AsInteger;
  EdtProducaoDesc.Text        :=DMArtesanalis.CDS_ProducaoDES_PRODUCAO.AsString;

  EdtProducaoCodExit(Self);
end;

procedure TFrmProducaoCadastro.Dbg_ProducaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
begin
  // Não Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  If EdtProducaoCod.AsInteger<>0 Then
  Begin
    DMArtesanalis.CDS_Producao.DisableControls;
    DMArtesanalis.CDS_Producao.Locate('COD_PRODUCAO', EdtProducaoCod.AsInteger,[]);
    DMArtesanalis.CDS_Producao.EnableControls;
    Exit;
  End;

  // Localiza Produção ====================================================
  If Key=VK_F4 Then
  Begin
    If Not DMArtesanalis.CDS_Producao.IsEmpty Then
    Begin
      i:=DMArtesanalis.CDS_Producao.RecNo;

      s:='';
      If InputQuery('Localizar Produção','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            If Not DMArtesanalis.CDS_Producao.Locate('COD_PRODUCAO',StrToInt(s),[]) Then
            Begin
              DMArtesanalis.CDS_Producao.RecNo:=i;
              msg('Produção Não Encontrada !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMArtesanalis.CDS_Producao, 'DES_PRODUCAO', s) Then
            Begin
              DMArtesanalis.CDS_Producao.RecNo:=i;
              msg('Produção Não Encontrada !!','A');
            End;
          End; // Try
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Produção','',s) then
    End; // If Not DMArtesanalis.CDS_Producao.IsEmpty Then
  End; //If Key=VK_F4 Then

end;

procedure TFrmProducaoCadastro.EdtMateriaPrimaCodEnter(Sender: TObject);
begin
  bgAlterarMP:=False;

end;

procedure TFrmProducaoCadastro.EdtMateriaPrimaCodExit(Sender: TObject);
Var
  MySql: String;
begin
  If EdtMateriaPrimaCod.AsInteger=0 Then
   Exit;

  If DMArtesanalis.CDS_ProducaoMatPrima.Locate('COD_MATERIAPRIMA', EdtMateriaPrimaCod.AsInteger,[]) Then
  Begin
    EdtMateriaPrimaDesc.Text:=DMArtesanalis.CDS_ProducaoMatPrimaDES_MATERIAPRIMA.AsString;
    EdtMateriaPrimaPerc.Text:=DMArtesanalis.CDS_ProducaoMatPrimaPER_UTILIZACAO.AsString;
    bgAlterarMP:=True;
    Exit;
  End;

  MySql:=' SELECT m.Cod_MateriaPrima, m.Des_MateriaPrima'+
         ' FROM MATERIAPRIMA m'+
         ' WHERE m.cod_materiaprima='+IntToStr(EdtMateriaPrimaCod.AsInteger);
  DMArtesanalis.CDS_BuacaRapida.Close;
  DMArtesanalis.SQLQ_BuacaRapida.SQL.Clear;
  DMArtesanalis.SQLQ_BuacaRapida.SQL.Add(MySql);
  DMArtesanalis.CDS_BuacaRapida.Open;

  EdtMateriaPrimaDesc.Text:=Trim(DMArtesanalis.CDS_BuacaRapida.FieldByName('Des_MateriaPrima').AsString);
  DMArtesanalis.CDS_BuacaRapida.Close;

  bgAlterarMP:=True;
  If EdtMateriaPrimaDesc.Text='' Then
  Begin
    msg('Matéria-Prima Não Encontrada !!','A');
    LimpaComponentes(False);
    EdtMateriaPrimaCod.SetFocus;
    bgAlterarMP:=False;
  End;
end;

procedure TFrmProducaoCadastro.Dbg_MateriaPrimaDblClick(Sender: TObject);
begin
  If (DMArtesanalis.CDS_Producao.IsEmpty) Or
     (DMArtesanalis.CDS_ProducaoMatPrima.IsEmpty) Or
     (EdtProducaoCod.AsInteger=0) Then
   Exit;

  EdtMateriaPrimaCod.AsInteger:=DMArtesanalis.CDS_ProducaoMatPrimaCOD_MATERIAPRIMA.AsInteger;
  EdtMateriaPrimaDesc.Text    :=DMArtesanalis.CDS_ProducaoMatPrimaDES_MATERIAPRIMA.AsString;
  EdtMateriaPrimaPerc.Value   :=DMArtesanalis.CDS_ProducaoMatPrimaPER_UTILIZACAO.AsCurrency;

  EdtMateriaPrimaCod.SetFocus;

end;

procedure TFrmProducaoCadastro.Bt_MateriaPrimaBuscaClick(Sender: TObject);
Var
  MySql: String;
begin

  Dbg_Producao.Enabled:=False;
  bgAlterarMP:=False;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  EdtMateriaPrimaCod.Clear;
  EdtMateriaPrimaCod.SetFocus;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT m.Des_MateriaPrima MateriaPrima, m.Cod_MateriaPrima Codigo'+
         ' FROM MATERIAPRIMA m'+
         ' WHERE NOT EXISTS(SELECT 1'+
         '                  FROM producao p'+
         '                  WHERE p.cod_producao='+IntToStr(EdtProducaoCod.AsInteger)+
         '                  AND   p.cod_materiaprima=m.cod_materiaprima)'+
         ' ORDER BY m.des_materiaprima';
  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMArtesanalis.CDS_Pesquisa.FieldByName('Codigo').AsString)='' Then
  Begin
    msg('Sem Materia-Prima a Listar !!','A');
    DMArtesanalis.CDS_Pesquisa.Close;
    FreeAndNil(FrmPesquisa);
    Dbg_Producao.Enabled:=True;
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End;

  // Dbg_Pesquisa para Pesquisa de Documentos de OC ============================
  // FrmPesquisa.Dbg_PesquisaPesquisaDoctosOC;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Materiaprima';
  FrmPesquisa.Campo_Codigo:='Codigo';
  FrmPesquisa.Campo_Descricao:='Materiaprima';
  FrmPesquisa.EdtDescricao.Clear;
//  FrmPesquisa.Campo_Retorno1:='';
//  FrmPesquisa.Campo_Retorno2:='';
//  FrmPesquisa.Campo_Retorno3:='';


  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then
  Begin
    If DMArtesanalis.CDS_ProducaoMatPrima.Locate('COD_MATERIAPRIMA',FrmPesquisa.EdtCodigo.Text,[]) Then
    Begin
      msg('Matéria-Prima Já Informada !!','A');
      LimpaComponentes(False);
      FreeAndNil(FrmPesquisa);
      EdtMateriaPrimaCod.SetFocus;
      Exit;
    End;

    EdtMateriaPrimaCod.Text :=FrmPesquisa.EdtCodigo.Text;
    EdtMateriaPrimaDesc.Text:=FrmPesquisa.EdtDescricao.Text;
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtCodigo.Text)<>'0')Then

  FreeAndNil(FrmPesquisa);

  EdtMateriaPrimaCodExit(Self);

  Dbg_Producao.Enabled:=True;

  EdtMateriaPrimaPerc.SetFocus;

end;

procedure TFrmProducaoCadastro.Dbg_ProducaoCellClick(Column: TColumn);
begin
  If EdtProducaoCod.AsInteger<>0 Then
  Begin
    DMArtesanalis.CDS_Producao.DisableControls;
    DMArtesanalis.CDS_Producao.Locate('COD_PRODUCAO', EdtProducaoCod.AsInteger,[]);
    DMArtesanalis.CDS_Producao.EnableControls;
  End;
end;

procedure TFrmProducaoCadastro.Bt_MateriaPrimaAbandonarClick(Sender: TObject);
begin
  LimpaComponentes(False);
end;

procedure TFrmProducaoCadastro.Bt_MateriaPrimaSalvarClick(Sender: TObject);
begin
  // Consiste o Percentual da Matéria-Prima ====================================
  If EdtMateriaPrimaPerc.Value<=0.00000 Then
  Begin
    msg('Favor Informar o'+cr+cr+'Percentual de Utilização !!','A');
    EdtMateriaPrimaPerc.SetFocus;
    Exit;
  End;

  // (IAM) Incluir ou Alterar Materia-Prima na Produção ========================
  If not DMLProducao('IAM') Then
   MessageBox(Handle, pChar('Erro ao Incluir/Altera a Matéria-Prima !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  LimpaComponentes(False);
  EdtMateriaPrimaCod.SetFocus;
end;

procedure TFrmProducaoCadastro.Bt_MateriaPrimaExcluirClick(Sender: TObject);
begin
  If (DMArtesanalis.CDS_Producao.IsEmpty) Or (DMArtesanalis.CDS_ProducaoMatPrima.IsEmpty) Then
   Exit;

  If EdtMateriaPrimaCod.AsInteger=0 Then
  Begin
    msg('Favor Selecinar'+cr+cr+'A Matéria-Prima a Excluir !!','A');
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End;

  If msg('Deseja Realmente Excluir a'+cr+'Matéria-Prima Selecionada ??','C')=2 Then
  Begin
    EdtMateriaPrimaCod.SetFocus;
    Exit;
  End;

  // (EXM) Excluir Materia-Prima da Produção ===================================
  If not DMLProducao('EXM') Then
   MessageBox(Handle, pChar('Erro ao Excluir a Matéria-Prima !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  LimpaComponentes(False);
  EdtMateriaPrimaCod.SetFocus;
end;

procedure TFrmProducaoCadastro.Dbg_MateriaPrimaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
begin
  // Não Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  // Localiza Materia-Prima ====================================================
  If Key=VK_F4 Then
  Begin
    If Not DMArtesanalis.CDS_ProducaoMatPrima.IsEmpty Then
    Begin
      i:=DMArtesanalis.CDS_ProducaoMatPrima.RecNo;

      s:='';
      If InputQuery('Localizar Matéria-Prima','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            If Not DMArtesanalis.CDS_ProducaoMatPrima.Locate('COD_MATERIAPRIMA',StrToInt(s),[]) Then
            Begin
              DMArtesanalis.CDS_ProducaoMatPrima.RecNo:=i;
              msg('Matéria-Prima Não Encontrada !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMArtesanalis.CDS_ProducaoMatPrima, 'DES_MATERIAPRIMA', s) Then
            Begin
              DMArtesanalis.CDS_ProducaoMatPrima.RecNo:=i;
              msg('Matéria-Prima Não Encontrada !!','A');
            End;
          End; // Try
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Matéria-Prima','',s) then
    End; // If Not DMArtesanalis.CDS_ProducaoMatPrima.IsEmpty Then
  End; //If Key=VK_F4 Then
end;

procedure TFrmProducaoCadastro.Dbg_ProducaoEnter(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clMoneyGreen;
end;

procedure TFrmProducaoCadastro.Dbg_ProducaoExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clWindow;
end;

procedure TFrmProducaoCadastro.Dbg_MateriaPrimaEnter(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clMoneyGreen;
end;

procedure TFrmProducaoCadastro.Dbg_MateriaPrimaExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clWindow;
end;

end.

