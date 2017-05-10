unit UFrmProdutoCadastro;

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
  JvXPCore, JvXPButtons, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls,
  DBXpress;

type
  TFrmProdutoCadastro = class(TForm)
    Gb_Principal: TGroupBox;
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    Bt_ProdutoSalvar: TJvXPButton;
    Bt_ProdutoAbandonar: TJvXPButton;
    Bt_ProdutoExcluir: TJvXPButton;
    Pan_ProdutoSolic: TPanel;
    Gb_Produto: TGroupBox;
    EdtProdutoDesc: TEdit;
    Gb_ProdutoVlrUnit: TGroupBox;
    EdtProdutoVlrUnit: TCurrencyEdit;
    Dbg_Produto: TDBGrid;
    EdtProdutoCod: TCurrencyEdit;
    Bt_ProdutoBusca: TJvXPButton;
    Gb_Unidade: TGroupBox;
    EdtUnidadeDesc: TEdit;
    EdtUnidadeCod: TCurrencyEdit;
    Bt_UnidadeBusca: TJvXPButton;
    Gb_UnidadeQtd: TGroupBox;
    EdtUnidadeQtd: TCurrencyEdit;
    Gb_Producao: TGroupBox;
    EdtProducaoDesc: TEdit;
    EdtProducaoCod: TCurrencyEdit;
    Bt_ProducaoBusca: TJvXPButton;
    StB_Produto: TdxStatusBar;
    OdirPanApres: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);

    // Odir ====================================================================

    Procedure LimpaComponentes(bCodProd: Boolean = True);

    Function  DMLProduto(sTipo: String): Boolean;
                      // sTipo:
                      // (IA) Incluir ou Alterar Produto
                      // (EX) Excluir Produto

    // Odir ====================================================================

    procedure EdtProdutoCodExit(Sender: TObject);
    procedure Dbg_ProdutoExit(Sender: TObject);
    procedure Dbg_ProdutoEnter(Sender: TObject);
    procedure Dbg_ProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtProdutoCodChange(Sender: TObject);
    procedure Bt_ProdutoBuscaClick(Sender: TObject);
    procedure Bt_ProdutoAbandonarClick(Sender: TObject);
    procedure EdtUnidadeCodExit(Sender: TObject);
    procedure EdtUnidadeCodChange(Sender: TObject);
    procedure Bt_UnidadeBuscaClick(Sender: TObject);
    procedure EdtProducaoCodChange(Sender: TObject);
    procedure EdtProducaoCodExit(Sender: TObject);
    procedure Bt_ProducaoBuscaClick(Sender: TObject);
    procedure Bt_ProdutoExcluirClick(Sender: TObject);
    procedure Dbg_ProdutoDblClick(Sender: TObject);
    procedure Bt_ProdutoSalvarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdutoCadastro: TFrmProdutoCadastro;

  TD: TTransactionDesc;

  bgAlterar,
  bgSairProduto: Boolean;

  sgMensagem: String;

implementation

uses UDMArtesanalis, DK_Procs1, UPesquisa, DB;

{$R *.dfm}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manipuação de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmProdutoCadastro.DMLProduto(sTipo: String): Boolean;
Var
  MySql: String;
Begin
  // sTipo:
  // (IA) Incluir ou Alterar Produto
  // (EX) Excluir Produto

  Result:=True;
  sgMensagem:='';

  OdirPanApres.Caption:='AGUARDE !! Atualizando Produto !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmProdutoCadastro.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmProdutoCadastro.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmProdutoCadastro;
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

    // (IA) Incluir ou Alterar -------------------------------------
    If sTipo='IA' Then
    Begin
      MySql:=' UPDATE OR INSERT INTO PRODUTO'+
             ' (COD_PRODUTO, DES_PRODUTO, COD_UNIDADE, COD_PRODUCAO, VLR_UNITATIO)'+
             ' VALUES ('+
             IntToStr(EdtProdutoCod.AsInteger)+', '+ // COD_PRODUTO
             QuotedStr(EdtProdutoDesc.Text)+', '+ // DES_PRODUTO
             IntToStr(EdtUnidadeCod.AsInteger)+', '+ // COD_UNIDADE
             IntToStr(EdtProducaoCod.AsInteger)+', '+ // COD_PRODUCAO
             QuotedStr(f_Troca(',','.',VarToStr(EdtProdutoVlrUnit.Value)))+')'+ // VLR_UNITATIO
             ' MATCHING (COD_PRODUTO)';
    End; // If sTipo='IA' Then

    // (EX) Excluir ------------------------------------------------
    If sTipo='EX' Then
    Begin
      MySql:=' DELETE FROM PRODUTO pr'+
             ' WHERE  pr.cod_produto='+IntToStr(EdtProdutoCod.AsInteger);
    End; // If sTipo='EX' Then

    DMArtesanalis.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ===========================================
    DMArtesanalis.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    // Reabre Unidade -----------------------------------------------
    DMArtesanalis.CDS_Produto.DisableControls;
    DMArtesanalis.CDS_Produto.Close;
    DMArtesanalis.CDS_Produto.Open;
    DMArtesanalis.CDS_Produto.EnableControls;

    DMArtesanalis.CDS_Produto.Locate('COD_PRODUTO', EdtProdutoCod.AsInteger,[]);

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

Procedure TFrmProdutoCadastro.LimpaComponentes(bCodProd: Boolean = True);
Var
  i: Integer;
Begin

  // Fecha Componentes DMArtesanalis ===============================================
  For i:=0 to FrmProdutoCadastro.ComponentCount-1 do
  Begin
    If FrmProdutoCadastro.Components[i] is TEdit Then
     (FrmProdutoCadastro.Components[i] as TEdit).Clear;

    If FrmProdutoCadastro.Components[i] is TCurrencyEdit Then
    Begin
      If (FrmProdutoCadastro.Components[i] as TCurrencyEdit).Name='EdtProdutoCod' Then
       Begin
         If bCodProd Then
          (FrmProdutoCadastro.Components[i] as TCurrencyEdit).Value:=0;
       End
      Else
       Begin
         (FrmProdutoCadastro.Components[i] as TCurrencyEdit).Value:=0;
       End;
    End;
  End;

End;

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Fim >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmProdutoCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Not bgSairProduto Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Botão <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  DMArtesanalis.CDS_Produto.Close;

  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('Cadastro de Produto');

end;

procedure TFrmProdutoCadastro.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

procedure TFrmProdutoCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmProdutoCadastro.FormShow(Sender: TObject);
begin
  bgSairProduto:=False;

  LimpaComponentes();

  EdtProdutoCod.SetFocus;
end;

procedure TFrmProdutoCadastro.Bt_FecharClick(Sender: TObject);
begin
  bgSairProduto:=True;

  Close;
end;

procedure TFrmProdutoCadastro.EdtProdutoCodExit(Sender: TObject);
Var
  MySql: String;
begin
  If EdtProdutoCod.AsInteger=0 Then
    LimpaComponentes();

  If EdtProdutoCod.AsInteger<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    LimpaComponentes(False);

    // Busca Produtos ============================================================
    MySql:=' SELECT pr.cod_produto, pr.des_produto,'+
           ' pr.cod_unidade, un.des_unidade, un.qtd_unidade,'+
           ' pr.cod_producao, pd.des_aux des_producao,'+
           ' pr.vlr_unitatio'+
           ' FROM PRODUTO pr, UNIDADE un, TAB_AUXILIAR pd'+
           ' WHERE pr.cod_unidade=un.cod_unidade'+
           ' AND   pr.cod_producao=pd.cod_aux'+
           ' AND   pd.tip_aux=1'+
           ' AND   pr.cod_produto='+IntToStr(EdtProdutoCod.AsInteger);
    DMArtesanalis.CDS_Busca.Close;
    DMArtesanalis.SQLQ_Busca.SQL.Clear;
    DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
    DMArtesanalis.CDS_Busca.Open;

    Screen.Cursor:=crDefault;

    If Trim(DMArtesanalis.CDS_Busca.FieldByName('Cod_Produto').AsString)<>'' Then
    Begin

      DMArtesanalis.CDS_Produto.Locate('COD_PRODUTO',DMArtesanalis.CDS_Busca.FieldByName('Cod_Produto').AsInteger,[]);

      EdtProdutoDesc.Text     :=DMArtesanalis.CDS_Busca.FieldByName('des_produto').AsString;
      EdtProdutoVlrUnit.Value :=DMArtesanalis.CDS_Busca.FieldByName('vlr_unitatio').AsCurrency;

      EdtUnidadeCod.AsInteger :=DMArtesanalis.CDS_Busca.FieldByName('cod_unidade').AsInteger;
      EdtUnidadeDesc.Text     :=DMArtesanalis.CDS_Busca.FieldByName('des_unidade').AsString;
      EdtUnidadeQtd.Value     :=DMArtesanalis.CDS_Busca.FieldByName('qtd_unidade').AsCurrency;

      EdtProducaoCod.AsInteger:=DMArtesanalis.CDS_Busca.FieldByName('cod_producao').AsInteger;
      EdtProducaoDesc.Text  :=DMArtesanalis.CDS_Busca.FieldByName('des_producao').AsString;

    End;
    DMArtesanalis.CDS_Busca.Close;

    EdtProdutoDesc.SetFocus;
  End; // If EdtProdutoCod.AsInteger<>0 Then
end;

procedure TFrmProdutoCadastro.Dbg_ProdutoExit(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clWindow;
end;

procedure TFrmProdutoCadastro.Dbg_ProdutoEnter(Sender: TObject);
begin
  (Sender as TDBGrid).Color:=clMoneyGreen;
end;

procedure TFrmProdutoCadastro.Dbg_ProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  s: String;
  i: Integer;
Begin
  // Não Permite Excluir Registro Pelo Grid ====================================
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  // Localiza Materia-Prima ====================================================
  If Key=VK_F4 Then
  Begin
    If Not DMArtesanalis.CDS_Produto.IsEmpty Then
    Begin
      i:=DMArtesanalis.CDS_Produto.RecNo;

      s:='';
      If InputQuery('Localizar Produto','',s) then
      Begin
        if Trim(s)<>'' then
        Begin
          Try
            StrToInt(s);
            If Not DMArtesanalis.CDS_Produto.Locate('COD_PRODUTO',StrToInt(s),[]) Then
            Begin
              DMArtesanalis.CDS_Produto.RecNo:=i;
              msg('Produto Não Encontrado !!','A');
            End;
          Except
            s:=AnsiUpperCase(s);
            If Not LocalizaRegistro(DMArtesanalis.CDS_Produto, 'DES_PRODUTO', s) Then
            Begin
              DMArtesanalis.CDS_Produto.RecNo:=i;
              msg('Produto Não Encontrado !!','A');
            End;
          End; // Try
        End; // if Trim(s)<>'' then
      End; // If InputQuery('Localizar Produto','',s) then
    End; // If Not DMArtesanalis.CDS_Produto.IsEmpty Then
  End; //If Key=VK_F4 Then
end;

procedure TFrmProdutoCadastro.EdtProdutoCodChange(Sender: TObject);
begin
  LimpaComponentes(False);
end;

procedure TFrmProdutoCadastro.Bt_ProdutoBuscaClick(Sender: TObject);
Var
  MySql: String;
begin

  LimpaComponentes();

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT pr.des_produto, pr.cod_produto'+
         ' FROM PRODUTO pr'+
         ' ORDER BY pr.des_produto';
  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMArtesanalis.CDS_Pesquisa.FieldByName('Des_Produto').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Pesquisa.Close;
    msg('Sem Produto a Listar !!','A');
    EdtProdutoCod.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Produto';
  FrmPesquisa.Campo_Codigo:='Cod_Produto';
  FrmPesquisa.Campo_Descricao:='Des_Produto';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtProdutoCod.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtProdutoCodExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmProdutoCadastro.Bt_ProdutoAbandonarClick(Sender: TObject);
begin
  LimpaComponentes();
  EdtProdutoCod.SetFocus;
end;

procedure TFrmProdutoCadastro.EdtUnidadeCodExit(Sender: TObject);
Var
  MySql: String;
begin
  If EdtUnidadeCod.AsInteger=0 Then
  Begin
    EdtUnidadeCod.AsInteger:=0;
    EdtUnidadeDesc.Clear;
    EdtUnidadeQtd.Value:=0.00;
  End; // If EdtUnidadeCod.AsInteger=0 Then

  If EdtProdutoCod.AsInteger=0 Then
  Begin
    EdtUnidadeCod.AsInteger:=0;
    EdtUnidadeDesc.Clear;
    EdtUnidadeQtd.Value:=0.00;

    EdtProdutoCod.SetFocus;
    Exit;
  End; // If EdtProdutoCod.AsInteger=0 Then

  If EdtUnidadeCod.AsInteger<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Unidade ===========================================================
    MySql:=' SELECT un.des_unidade, un.cod_unidade, un.qtd_unidade'+
           ' FROM UNIDADE un'+
           ' WHERE un.cod_unidade='+IntToStr(EdtUnidadeCod.AsInteger);
    DMArtesanalis.CDS_Busca.Close;
    DMArtesanalis.SQLQ_Busca.SQL.Clear;
    DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
    DMArtesanalis.CDS_Busca.Open;

    EdtUnidadeCod.AsInteger:=0;
    EdtUnidadeDesc.Clear;
    EdtUnidadeQtd.Value:=0.00;

    Screen.Cursor:=crDefault;

    If Trim(DMArtesanalis.CDS_Busca.FieldByName('Cod_Unidade').AsString)='' Then
    Begin
      DMArtesanalis.CDS_Busca.Close;
      msg('Unidade Não Encontrada !!','A');
      EdtUnidadeCod.SetFocus;
      FreeAndNil(FrmPesquisa);
      Exit;
    End;

    EdtUnidadeCod.AsInteger:=DMArtesanalis.CDS_Busca.FieldByName('cod_unidade').AsInteger;
    EdtUnidadeDesc.Text    :=DMArtesanalis.CDS_Busca.FieldByName('des_unidade').AsString;
    EdtUnidadeQtd.Value    :=DMArtesanalis.CDS_Busca.FieldByName('qtd_unidade').AsCurrency;

    DMArtesanalis.CDS_Busca.Close;

    EdtProducaoCod.SetFocus;
  End; // If EdtUnidadeCod.AsInteger<>0 Then
end;

procedure TFrmProdutoCadastro.EdtUnidadeCodChange(Sender: TObject);
begin
  EdtUnidadeDesc.Clear;
  EdtUnidadeQtd.Value:=0.00;

  If EdtProdutoCod.AsInteger=0 Then
  Begin
    EdtProdutoCod.SetFocus;
    Exit;
  End; // If EdtProdutoCod.AsInteger=0 Then

end;

procedure TFrmProdutoCadastro.Bt_UnidadeBuscaClick(Sender: TObject);
Var
  MySql: String;
begin

  If EdtProdutoCod.AsInteger=0 Then
  Begin
    EdtProdutoCod.SetFocus;
    Exit;
  End; // If EdtProdutoCod.AsInteger=0 Then

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT un.des_unidade, un.qtd_unidade, un.cod_unidade'+
         ' FROM UNIDADE un'+
         ' ORDER BY un.des_unidade';
  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMArtesanalis.CDS_Pesquisa.FieldByName('des_unidade').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Pesquisa.Close;
    msg('Sem Unidade a Listar !!','A');
    EdtUnidadeCod.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Unidade';
  FrmPesquisa.Campo_Codigo:='Cod_Unidade';
  FrmPesquisa.Campo_Descricao:='Des_Unidade';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtUnidadeCod.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtUnidadeCodExit(Self);
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmProdutoCadastro.EdtProducaoCodChange(Sender: TObject);
begin
  EdtProducaoDesc.Clear;

  If EdtProdutoCod.AsInteger=0 Then
  Begin
    EdtProdutoCod.SetFocus;
    Exit;
  End; // If EdtProdutoCod.AsInteger=0 Then

end;

procedure TFrmProdutoCadastro.EdtProducaoCodExit(Sender: TObject);
Var
  MySql: String;
begin
  If EdtProducaoCod.AsInteger=0 Then
  Begin
    EdtProducaoCod.AsInteger:=0;
    EdtProducaoDesc.Clear;
  End; // If EdtProducaoCod.AsInteger=0 Then

  If EdtProdutoCod.AsInteger=0 Then
  Begin
    EdtProducaoCod.AsInteger:=0;
    EdtProducaoDesc.Clear;

    EdtProdutoCod.SetFocus;
    Exit;
  End; // If EdtProdutoCod.AsInteger=0 Then

  If EdtProducaoCod.AsInteger<>0 Then
  Begin
    Screen.Cursor:=crAppStart;

    // Busca Produção ==========================================================
    MySql:=' SELECT pd.cod_aux cod_producao, pd.des_aux des_producao'+
           ' FROM TAB_AUXILIAR pd'+
           ' WHERE pd.cod_aux='+IntToStr(EdtProducaoCod.AsInteger);
    DMArtesanalis.CDS_Busca.Close;
    DMArtesanalis.SQLQ_Busca.SQL.Clear;
    DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
    DMArtesanalis.CDS_Busca.Open;

    EdtProducaoCod.AsInteger:=0;
    EdtProducaoDesc.Clear;

    Screen.Cursor:=crDefault;

    If Trim(DMArtesanalis.CDS_Busca.FieldByName('Cod_Producao').AsString)='' Then
    Begin
      DMArtesanalis.CDS_Busca.Close;
      msg('Producao Não Encontrada !!','A');
      EdtProducaoCod.SetFocus;
      FreeAndNil(FrmPesquisa);
      Exit;
    End;

    EdtProducaoCod.AsInteger:=DMArtesanalis.CDS_Busca.FieldByName('Cod_Producao').AsInteger;
    EdtProducaoDesc.Text    :=DMArtesanalis.CDS_Busca.FieldByName('Des_Producao').AsString;

    DMArtesanalis.CDS_Busca.Close;

    Dbg_Produto.SetFocus;
  End; // If EdtProducaoCod.AsInteger<>0 Then

end;

procedure TFrmProdutoCadastro.Bt_ProducaoBuscaClick(Sender: TObject);
Var
  MySql: String;
begin

  If EdtProdutoCod.AsInteger=0 Then
  Begin
    EdtProdutoCod.SetFocus;
    Exit;
  End; // If EdtProdutoCod.AsInteger=0 Then

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT pd.des_aux des_producao, pd.cod_aux cod_producao'+
         ' FROM TAB_AUXILIAR pd'+
         ' ORDER BY pd.des_aux';
  DMArtesanalis.CDS_Pesquisa.Close;
  DMArtesanalis.CDS_Pesquisa.Filtered:=False;
  DMArtesanalis.SDS_Pesquisa.CommandText:=MySql;
  DMArtesanalis.CDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If Trim(DMArtesanalis.CDS_Pesquisa.FieldByName('des_producao').AsString)='' Then
  Begin
    DMArtesanalis.CDS_Pesquisa.Close;
    msg('Sem Producao a Listar !!','A');
    EdtProducaoCod.SetFocus;
    FreeAndNil(FrmPesquisa);
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisa.Campo_pesquisa:='Des_Producao';
  FrmPesquisa.Campo_Codigo:='Cod_Producao';
  FrmPesquisa.Campo_Descricao:='Des_Producao';
  //FrmPesquisa.EdtDescricao.Text:=FrmAcessos.EdtDescPessoa.Text;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisa.ShowModal;
  DMArtesanalis.CDS_Pesquisa.Close;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then
  Begin
    EdtProducaoCod.Text:=FrmPesquisa.EdtCodigo.Text;
    EdtProducaoCodExit(Self);

    Dbg_Produto.SetFocus;
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmProdutoCadastro.Bt_ProdutoExcluirClick(Sender: TObject);
begin
  If DMArtesanalis.CDS_Produto.IsEmpty Then
   Exit;

  If EdtProdutoCod.AsInteger=0 Then
  Begin
    msg('Favor Selecinar'+cr+cr+'O Produto a Excluir !!','A');
    EdtProdutoCod.SetFocus;
    Exit;
  End; // If EdtProdutoCod.AsInteger=0 Then

  If msg('Deseja Realmente Excluir o'+cr+'Prodtudo Selecionado ??','C')=2 Then
  Begin
    EdtProdutoCod.SetFocus;
    Exit;
  End;

  // (EXP) Excluir Produto =====================================================
  If not DMLProduto('EX') Then
   MessageBox(Handle, pChar('Erro ao Excluir o Produto !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  LimpaComponentes();
  EdtProdutoCod.SetFocus;

end;

procedure TFrmProdutoCadastro.Dbg_ProdutoDblClick(Sender: TObject);
begin
  If DMArtesanalis.CDS_Produto.IsEmpty Then
   Exit;

  LimpaComponentes();

  EdtProdutoCod.AsInteger :=DMArtesanalis.CDS_ProdutoCOD_PRODUTO.AsInteger;
  EdtProdutoDesc.Text     :=DMArtesanalis.CDS_ProdutoDES_PRODUTO.AsString;
  EdtProdutoVlrUnit.Value :=DMArtesanalis.CDS_ProdutoVLR_UNITATIO.AsCurrency;

  EdtUnidadeCod.AsInteger :=DMArtesanalis.CDS_ProdutoCOD_UNIDADE.AsInteger;
  EdtUnidadeDesc.Text     :=DMArtesanalis.CDS_ProdutoDES_UNIDADE.AsString;
  EdtUnidadeQtd.Value     :=DMArtesanalis.CDS_ProdutoQTD_UNIDADE.AsCurrency;

  EdtProducaoCod.AsInteger:=DMArtesanalis.CDS_ProdutoCOD_PRODUCAO.AsInteger;
  EdtProducaoDesc.Text  :=DMArtesanalis.CDS_ProdutoDES_PRODUCAO.AsString;

  EdtProdutoDesc.SetFocus;

end;

procedure TFrmProdutoCadastro.Bt_ProdutoSalvarClick(Sender: TObject);
begin
  // Consiste a Código do Produto ==============================================
  If EdtProdutoCod.AsInteger=0 Then
  Begin
    msg('Favor Informar o'+cr+cr+'Código do Produto !!','A');
    EdtProdutoCod.SetFocus;
    Exit;
  End;

  // Consiste a Descrição Produto ==============================================
  If Trim(EdtProdutoDesc.Text)='' Then
  Begin
    msg('Favor Informar a'+cr+cr+'Descrição da Produto !!','A');
    EdtProducaoDesc.SetFocus;
    Exit;
  End;

  // (IAP) Incluir ou Alterar Produção =========================================
  If not DMLProduto('IA') Then
   MessageBox(Handle, pChar('Erro ao Incluir/Altera o Produto !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  LimpaComponentes();
  EdtProdutoCod.SetFocus;
end;

end.
