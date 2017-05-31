unit UFrmPessoaCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExControls, JvXPCore, JvXPButtons, ExtCtrls, Mask,
  Commctrl, // SHOW HINT EM FORMA DE BALÃO
  DBCtrls, DBXpress, DB, ACBrBase, ACBrValidador;

type
  TFrmCadastroPessoa = class(TForm)
    Gb_Pessoas: TGroupBox;
    Pan_Solicitacoes: TPanel;
    Bt_Fechar: TJvXPButton;
    Bt_Salvar: TJvXPButton;
    Bt_Abandonar: TJvXPButton;
    Bt_Excluir: TJvXPButton;
    Bt_BuscaPessoa: TJvXPButton;
    Bt_NovaPessoa: TJvXPButton;
    Pan_Dados: TPanel;
    Label2: TLabel;
    Dbe_Codigo: TDBEdit;
    Label1: TLabel;
    Dbe_Tipo: TDBEdit;
    Label14: TLabel;
    Label3: TLabel;
    Dbe_Nome: TDBEdit;
    Label5: TLabel;
    Dbe_Endereco: TDBEdit;
    Label8: TLabel;
    Dbe_Bairro: TDBEdit;
    Label12: TLabel;
    Dbe_Fone: TDBEdit;
    Label10: TLabel;
    Dbe_Cidade: TDBEdit;
    Label13: TLabel;
    Dbe_EMail: TDBEdit;
    Label11: TLabel;
    Dbe_UF: TDBEdit;
    Label9: TLabel;
    Dbe_CEP: TDBEdit;
    Dbe_Complemento: TDBEdit;
    Label7: TLabel;
    Label6: TLabel;
    Dbe_Numero: TDBEdit;
    Dbe_CnpjCpf: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label4: TLabel;
    ACBrValidador: TACBrValidador;
    OdirPanApres: TPanel;

    // Odir ====================================================================

    // Hint em Fortma de Balão
    Procedure CreateToolTips(hWnd: Cardinal); // Cria Show Hint em Forma de Balão
    Procedure FocoToControl(Sender: TControl);

    Function DMLPessoas(sTipo: String): Boolean;
                     // sTipo:
                     // (IA) Incluir ou Alterar
                     // (EX) Excluir

    // Odir ====================================================================

    procedure Bt_BuscaPessoaClick(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_AbandonarClick(Sender: TObject);
    procedure Bt_NovaPessoaClick(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
    procedure Dbe_CnpjCpfExit(Sender: TObject);
    procedure Dbe_CnpjCpfEnter(Sender: TObject);
    procedure Bt_SalvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Dbe_CnpjCpfKeyPress(Sender: TObject; var Key: Char);
    procedure Dbe_CEPKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    bgTransportar: Boolean;
    sgCodPesTransportar: String;
  end;

const
  // Show Hint em Forma de Balão
  TTS_BALLOON = $40;
  TTM_SETTITLE = (WM_USER + 32);
  //////////////////////////////

var
  FrmCadastroPessoa: TFrmCadastroPessoa;

  // Show Hint em Forma de Balão
  hTooltip: Cardinal;
  ti: TToolInfo;
  buffer : array[0..255] of char;
  ///////////////////////////////

  TD: TTransactionDesc;

  sgMensagem: String;
  bgSairPessoa: Boolean;

implementation

uses UDMArtesanalis, UPesquisa, DK_Procs1;

{$R *.dfm}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// Odir - Inicio >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Manipuação de Dados >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Function TFrmCadastroPessoa.DMLPessoas(sTipo: String): Boolean;
Var
  MySql: String;
Begin

  // sTipo:
  // (IA) Incluir ou Alterar
  // (EX) Excluir

  Result:=True;
  sgMensagem:='';

  OdirPanApres.Caption:='AGUARDE !! Atualizando Pessoas !!';
  OdirPanApres.Width:=Length(OdirPanApres.Caption)*10;
  OdirPanApres.Left:=ParteInteiro(FloatToStr((FrmCadastroPessoa.Width-OdirPanApres.Width)/2));
  OdirPanApres.Top:=ParteInteiro(FloatToStr((FrmCadastroPessoa.Height-OdirPanApres.Height)/2))-20;
  OdirPanApres.Font.Style:=[fsBold];
  OdirPanApres.Parent:=FrmCadastroPessoa;
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
      MySql:=' UPDATE OR INSERT INTO PESSOAS'+
             ' (TIPO, COD_PESSOA, DES_PESSOA, NUM_CNPJCPF, ENDERECO, NUMERO,'+
             '  COMPLEMENTO, BAIRRO, CEP, CIDADE, UF, FONE, EMAIL)'+
             ' VALUES ('+
             QuotedStr(DMArtesanalis.CDS_PessoasTIPO.AsString)+', '; // TIPO

             // COD_PESSOA
             If Trim(DMArtesanalis.CDS_PessoasCOD_PESSOA.AsString)='' Then
              MySql:=
               MySql+' NULL,'
             Else
              MySql:=
               MySql+QuotedStr(DMArtesanalis.CDS_PessoasCOD_PESSOA.AsString)+', ';

      MySql:=
       MySql+QuotedStr(DMArtesanalis.CDS_PessoasDES_PESSOA.AsString)+', '+ // DES_PESSOA
             QuotedStr(DMArtesanalis.CDS_PessoasNUM_CNPJCPF.AsString)+', '+ // NUM_CNPJCPF
             QuotedStr(DMArtesanalis.CDS_PessoasENDERECO.AsString)+', '+ // ENDERECO
             QuotedStr(DMArtesanalis.CDS_PessoasNUMERO.AsString)+', '+ // NUMERO
             QuotedStr(DMArtesanalis.CDS_PessoasCOMPLEMENTO.AsString)+', '+ // COMPLEMENTO
             QuotedStr(DMArtesanalis.CDS_PessoasBAIRRO.AsString)+', '+ // BAIRRO
             QuotedStr(DMArtesanalis.CDS_PessoasCEP.AsString)+', '+ // CEP
             QuotedStr(DMArtesanalis.CDS_PessoasCIDADE.AsString)+', '+ // CIDADE
             QuotedStr(DMArtesanalis.CDS_PessoasUF.AsString)+', '+ // UF
             QuotedStr(DMArtesanalis.CDS_PessoasFONE.AsString)+', '+ // FONE
             QuotedStr(DMArtesanalis.CDS_PessoasEMAIL.AsString)+')'+ // EMAIL
             ' MATCHING (COD_PESSOA)';
    End; // If sTipo='IA' Then

    // (EX) Excluir ------------------------------------------------
    If sTipo='EX' Then
    Begin
      MySql:=' DELETE FROM PESSOAS p'+
             ' WHERE  p.cod_pessoa='+Dbe_Codigo.Text;
    End; // If sTipo='EX' Then

    DMArtesanalis.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ===========================================
    DMArtesanalis.SQLC.Commit(TD);

    If bgTransportar Then
    Begin
      sgCodPesTransportar:=Trim(Dbe_Codigo.Text);

      If sgCodPesTransportar='' Then
      Begin
        MySql:=' SELECT GEN_ID(GEN_PESSOAS_ID,0) ID'+
               ' FROM RDB$DATABASE';
        DMArtesanalis.CDS_BuscaRapida.Close;
        DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
        DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
        DMArtesanalis.CDS_BuscaRapida.Open;
        sgCodPesTransportar:=DMArtesanalis.CDS_BuscaRapida.FieldByName('ID').AsString;
        DMArtesanalis.CDS_BuscaRapida.Close;
      End; // If sgCodPesTransportar='' Then
    End;

    DateSeparator:='/';
    DecimalSeparator:=',';

    OdirPanApres.Visible:=False;

    DMArtesanalis.CDS_Pessoas.CancelUpdates;
    DMArtesanalis.CDS_Pessoas.Close;

    Screen.Cursor:=crDefault;

    If Not bgTransportar Then
    Begin
      If sTipo='IA' Then
       msg('Cadastro Efetuado com SUCESSO !!','A');

      If sTipo='EX' Then
       msg('Exclusão Efetuada com SUCESSO !!','A');
    End;

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

// Show Hint em Forma de Balão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmCadastroPessoa.CreateToolTips(hWnd: Cardinal);
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
Procedure TFrmCadastroPessoa.FocoToControl(Sender: TControl);
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

procedure TFrmCadastroPessoa.Bt_BuscaPessoaClick(Sender: TObject);
Var
  MySql: String;
begin

  If (DMArtesanalis.CDS_Pessoas.State=dsInsert) Or (DMArtesanalis.CDS_Pessoas.State=dsEdit) Then
   DMArtesanalis.CDS_Pessoas.CancelUpdates;

  DMArtesanalis.CDS_Pessoas.Close;

  Pan_Dados.Enabled:=False;
  Bt_Excluir.Enabled:=False;

  FrmPesquisa:=TFrmPesquisa.Create(Self);

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crAppStart;

  MySql:=' SELECT p.des_pessoa Nome,'+
         ' CASE'+
         '   When p.Tipo=''F'' Then ''FORNECEDOR'''+
         '   When p.Tipo=''C'' Then ''CLIENTE'''+
         '   Else ''AMBOS'''+
         ' END Tipo,'+
         ' p.cod_pessoa Codigo'+
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
    Bt_BuscaPessoa.SetFocus;
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
    MySql:=' SELECT *'+
           ' FROM PESSOAS p'+
           ' WHERE p.Cod_Pessoa='+FrmPesquisa.EdtCodigo.Text;
    DMArtesanalis.CDS_Pessoas.Close;
    DMArtesanalis.SQLQ_Pessoas.SQL.Clear;;
    DMArtesanalis.SQLQ_Pessoas.SQL.Add(MySql);
    DMArtesanalis.CDS_Pessoas.Open;

    DMArtesanalis.CDS_Pessoas.Edit;
    Pan_Dados.Enabled:=True;

    If Length(Dbe_CnpjCpf.Text)=14 Then
     DMArtesanalis.CDS_PessoasNUM_CNPJCPF.EditMask:='99.999.999/9999-99;0;_';

    If Length(Dbe_CnpjCpf.Text)=11 Then
     DMArtesanalis.CDS_PessoasNUM_CNPJCPF.EditMask:='999.999.999.-99;0;_';

    Bt_Excluir.Enabled:=True; 
    Dbe_Tipo.SetFocus;
  End; // If (Trim(FrmPesquisa.EdtCodigo.Text)<>'') and (Trim(FrmPesquisa.EdtDescricao.Text)<>'') Then

  FreeAndNil(FrmPesquisa);
end;

procedure TFrmCadastroPessoa.Bt_FecharClick(Sender: TObject);
begin
  Bt_BuscaPessoa.SetFocus;

  If (DMArtesanalis.CDS_Pessoas.State=dsInsert) Or (DMArtesanalis.CDS_Pessoas.State=dsEdit) Then
   DMArtesanalis.CDS_Pessoas.CancelUpdates;

  DMArtesanalis.CDS_Pessoas.Close;

  bgTransportar:=False;
  bgSairPessoa:=True;

  Close;

end;

procedure TFrmCadastroPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Not bgSairPessoa Then
  Begin
    msg('Para Fechar Tecle '+cr+cr+'no Botão <Fechar>...','A');
    Action := caNone;
    Exit;
  End;

  // Permite Sair do Sistema ===================================================
  DMArtesanalis.MemoRetiraNomeForm('Cadastro - PESSOAS');
end;

procedure TFrmCadastroPessoa.FormShow(Sender: TObject);
begin
  bgSairPessoa:=False;

  Bt_BuscaPessoa.SetFocus;
end;

procedure TFrmCadastroPessoa.FormCreate(Sender: TObject);
const
  TipoDoIcone = 1; // Show Hint em Forma de Balão
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

  // Show Hint em Forma de Balão
  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Salvar.Handle, @ti, TipoDoIcone, 'Incluir/Alterar', 'PESSOA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Abandonar.Handle, @ti, TipoDoIcone, 'Abandonar', 'PESSOA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Excluir.Handle, @ti, TipoDoIcone, 'Excluir', 'PESSOA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_Fechar.Handle, @ti, TipoDoIcone, 'Fechar', 'PESSOA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_BuscaPessoa.Handle, @ti, TipoDoIcone, 'Buscar', 'PESSOA');

  CreateToolTips(Self.Handle);
  AddToolTip(Bt_NovaPessoa.Handle, @ti, TipoDoIcone, 'Novo', 'PESSOA');

end;

procedure TFrmCadastroPessoa.Bt_AbandonarClick(Sender: TObject);
begin
  If (DMArtesanalis.CDS_Pessoas.State=dsInsert) Or (DMArtesanalis.CDS_Pessoas.State=dsEdit) Then
   DMArtesanalis.CDS_Pessoas.CancelUpdates;

  DMArtesanalis.CDS_Pessoas.Close;

  Pan_Dados.Enabled:=False;

  Bt_BuscaPessoa.SetFocus;

End;

procedure TFrmCadastroPessoa.Bt_NovaPessoaClick(Sender: TObject);
Var
  MySql: String;
begin
  If (DMArtesanalis.CDS_Pessoas.State=dsInsert) Or (DMArtesanalis.CDS_Pessoas.State=dsEdit) Then
   DMArtesanalis.CDS_Pessoas.CancelUpdates;

  MySql:=' SELECT *'+
         ' FROM PESSOAS p'+
         ' WHERE p.Cod_Pessoa<0';
  DMArtesanalis.CDS_Pessoas.Close;
  DMArtesanalis.SQLQ_Pessoas.SQL.Clear;;
  DMArtesanalis.SQLQ_Pessoas.SQL.Add(MySql);
  DMArtesanalis.CDS_Pessoas.Open;

  DMArtesanalis.CDS_Pessoas.Insert;

  Pan_Dados.Enabled:=True;
  Bt_Excluir.Enabled:=False;

  Dbe_Tipo.SetFocus;

end;

procedure TFrmCadastroPessoa.Bt_ExcluirClick(Sender: TObject);
Var
  sTabela, MySql: String;
begin
  Bt_BuscaPessoa.SetFocus;

  If (Not (DMArtesanalis.CDS_Pessoas.State=dsEdit)) Then
   Exit;

  // Consiste Exclusão ========================================================
  sgMensagem:='';
  MySql:=' SELECT TABELAS.RDB$RELATION_NAME Tabela'+

         ' FROM RDB$RELATIONS TABELAS,'+
         '      RDB$RELATION_FIELDS CAMPOS,'+
         '      RDB$FIELDS DADOSCAMPO,'+
         '      RDB$TYPES TIPOS'+

         ' WHERE CAMPOS.RDB$FIELD_NAME = ''COD_PESSOA'''+
         ' AND TABELAS.RDB$RELATION_NAME<>''PESSOAS'''+
         ' AND TABELAS.RDB$RELATION_NAME = CAMPOS.RDB$RELATION_NAME'+
         ' AND CAMPOS.RDB$FIELD_SOURCE = DADOSCAMPO.RDB$FIELD_NAME'+
         ' AND DADOSCAMPO.RDB$FIELD_TYPE = TIPOS.RDB$TYPE'+
         ' AND TABELAS.RDB$SYSTEM_FLAG = 0'+

         ' GROUP BY TABELAS.RDB$RELATION_NAME, CAMPOS.RDB$FIELD_NAME'+
         ' ORDER BY 1';
  DMArtesanalis.CDS_Busca.Close;
  DMArtesanalis.SQLQ_Busca.SQL.Clear;
  DMArtesanalis.SQLQ_Busca.SQL.Add(MySql);
  DMArtesanalis.CDS_Busca.Open;

  While not DMArtesanalis.CDS_Busca.Eof do
  Begin
    sTabela:=DMArtesanalis.CDS_Busca.FieldByName('Tabela').AsString;

    MySql:=' SELECT d.num_docto'+
           ' FROM '+sTabela+' d'+
           ' WHERE d.cod_pessoa='+Dbe_Codigo.Text;
    DMArtesanalis.CDS_BuscaRapida.Close;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Clear;
    DMArtesanalis.SQLQ_BuscaRapida.SQL.Add(MySql);
    DMArtesanalis.CDS_BuscaRapida.Open;

    If not DMArtesanalis.CDS_BuscaRapida.Eof Then
    Begin
      MessageBox(Handle, pChar('Impossível Excluir !!'+cr+cr+'Pessoa Já Utilizada em '+sTabela), 'Erro', MB_ICONERROR);
      DMArtesanalis.CDS_BuscaRapida.Close;
      DMArtesanalis.CDS_Busca.Close;
      Dbe_Tipo.SetFocus;
      Exit;
    End; // If Trim(sgMensagem)<>'' Then

    DMArtesanalis.CDS_BuscaRapida.Close;

    DMArtesanalis.CDS_Busca.Next;
  End; // While not DMArtesanalis.CDS_Busca.Eof do
  DMArtesanalis.CDS_Busca.Close;

  If msg('Deseja Realmente Excluir a'+cr+'Pessoa Selecionada ??','C')=2 Then
  Begin
    Dbe_Tipo.SetFocus;
    Exit;
  End;

  // Executa DML ===============================================================
  If not DMLPessoas('EX') Then
   MessageBox(Handle, pChar('Erro ao Excluir a Pessoa !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);


end;

procedure TFrmCadastroPessoa.Dbe_CnpjCpfExit(Sender: TObject);
begin

  If Trim(Dbe_CnpjCpf.Text)='' Then
   Exit;

  ACBrValidador.Documento:=DMArtesanalis.CDS_PessoasNUM_CNPJCPF.Text;

  If Length(Dbe_CnpjCpf.Text)=14 Then
   Begin
     DMArtesanalis.CDS_PessoasNUM_CNPJCPF.EditMask:='99.999.999/9999-99;0;_';

     ACBrValidador.TipoDocto:=docCNPJ;
     If Not ACBrValidador.Validar Then
     Begin
       msg('CNPJ Inválido !!','A');
       Dbe_CnpjCpf.SetFocus;
       Exit;
     End;
   End
  Else   If Length(Dbe_CnpjCpf.Text)=11 Then
   Begin
     DMArtesanalis.CDS_PessoasNUM_CNPJCPF.EditMask:='999.999.999.-99;0;_';

     ACBrValidador.TipoDocto:=docCPF;
     If Not ACBrValidador.Validar Then
     Begin
       msg('CPF Inválido !!','A');
       Dbe_CnpjCpf.SetFocus;
       Exit;
     End;
   End
  Else
   Begin
     msg('Número do CNPJ/CEP Inválido !!','A');
     Dbe_CnpjCpf.SetFocus;
     Exit;
   End;
end;

procedure TFrmCadastroPessoa.Dbe_CnpjCpfEnter(Sender: TObject);
begin
  DMArtesanalis.CDS_PessoasNUM_CNPJCPF.EditMask:='';

end;

procedure TFrmCadastroPessoa.Bt_SalvarClick(Sender: TObject);
begin
  Bt_BuscaPessoa.SetFocus;

  If (Not (DMArtesanalis.CDS_Pessoas.State=dsInsert)) And (Not (DMArtesanalis.CDS_Pessoas.State=dsEdit)) Then
   Exit;

  If Pos(Dbe_Tipo.Text,'A C F')=0 Then
  Begin
    msg('Tipo de Pessoa Inválido !!'+cr+cr+'"A" Ambos'+cr+'"C" Cliente'+cr+'"F" Fornecedor','A');
    Dbe_Tipo.SetFocus;
    Exit;
  End;

  If Trim(Dbe_Nome.Text)='' Then
  Begin
    msg('Favor Informar o Nome da Pessoa !!','A');
    Dbe_Nome.SetFocus;
    Exit;
  End;

  If Trim(Dbe_CnpjCpf.Text)='' Then
  Begin
    If msg('Pessoa SEM CNPJ/CPF !!'+cr+cr+'Manter SEM Informação ??','C')=2 Then
    Begin
      Dbe_CnpjCpf.SetFocus;
      Exit;
    End;
  End;

  // Executa DML ===============================================================
  sgCodPesTransportar:='';
  If not DMLPessoas('IA') Then
  Begin
    MessageBox(Handle, pChar('Erro ao Incluir/Altera a Pessoa !!'+#13+sgMensagem), 'ATENÇÃO !!', MB_ICONERROR);

    If bgTransportar Then
     Exit;
  End;

  If bgTransportar Then
  Begin
    Bt_FecharClick(Self);
    bgTransportar:=True;
    Exit;
  End; // If bgTransportar Then

end;

procedure TFrmCadastroPessoa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmCadastroPessoa.Dbe_CnpjCpfKeyPress(Sender: TObject; var Key: Char);
begin
  If not (key in ['0'..'9','.','/','-']) Then
  Begin
    Key := #0;
    Exit;
  End;

end;

procedure TFrmCadastroPessoa.Dbe_CEPKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not (key in ['0'..'9','-']) Then
  Begin
    Key := #0;
    Exit;
  End;

end;

end.

