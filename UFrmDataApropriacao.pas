unit UFrmDataApropriacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxGroupBox, Grids, DBGrids, DBGridJul, StdCtrls, Mask, ToolEdit,
  CurrEdit, cxTrackBar, JvExControls, JvXPCore, JvXPButtons, ExtCtrls, IBQuery,
  DBXpress,
  Clipbrd; // PrintScreen
//  Último: Clipbrd

type
  TFrmDataApropriacao = class(TForm)
    Gb_AproprDtaApropriacao: TcxGroupBox;
    Dte_AproprDtaApropriacao: TcxDateEdit;
    Panel8: TPanel;
    Bt_AproprFechar: TJvXPButton;
    Bt_AproprOK: TJvXPButton;
    Gb_AproprFornecedor: TGroupBox;
    EdtAproprCodFornecedor: TCurrencyEdit;
    Dbg_AproprFornecedores: TDBGridJul;
    Lb_AproprDtaApropriacao: TLabel;
    Lb_Partes: TLabel;
    Bt_AproprBuscaFornecedor: TJvXPButton;
    Lb_Apres: TLabel;
    procedure Bt_AproprFecharClick(Sender: TObject);
    procedure EdtAproprCodFornecedorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_AproprOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Dbg_AproprFornecedoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    // Odir

    Procedure AtualizaFluxoCaixa;
    Procedure NegociacoesCredDeb(Tipo:String);

    // Odir

    procedure Bt_AproprBuscaFornecedorClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDataApropriacao: TFrmDataApropriacao;

  IBQ_ConsultaCreDeb : TIBQuery;

  TD: TTransactionDesc;

implementation

uses UDMBelShop, UDMConexoes, UDMVirtual, UFrmBelShop, DK_Procs1, UPesquisaIB,
  DB;

{$R *.dfm}

// Odir

// Negociações Cretidos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmDataApropriacao.NegociacoesCredDeb(Tipo: String);
Var
  MySql: String;
  sNumSeq: String;
Begin
  // Busca Creditos/Débitos ====================================================
  MySql:=' SELECT'+
         ' mf.codfornecedor, f.nomefornecedor,'+
         ' mf.dataentrada,'+
         ' mf.codcomprovante,'+
         ' CASE'+
         '   WHEN mf.codcomprovante IN (''913'', ''916'' ,''955'') Then'+
         '    ''C'''+
         '   WHEN mf.codcomprovante IN (''900'') Then'+
         '    ''D'''+
         ' End Tp_DebCre,'+
         ' mf.codfilial,'+
         ' mf.observacao,'+
         ' mf.chavenf, mf.numero, mf.serie,'+
         ' ABS(COALESCE(mf.totnota,0.00)) Vlr_Total';

  MySqlDML:=' FROM MFOR mf, FORNECED f'+
            ' WHERE  mf.codfornecedor=f.codfornecedor'+
            ' AND    mf.codcomprovante in (''900'',''913'', ''916'' ,''955'')'+
            ' AND    mf.DATAENTRADA >='+QuotedStr(f_Troca('/','.',F_Troca('-','.',Dte_AproprDtaApropriacao.Text)));

  MySqlSelect:=' AND    mf.CODFORNECEDOR in ('+sgFornecedores+')';

  MySqlOrderBy:=' ORDER BY mf.codfornecedor, mf.dataentrada';

  // Total de Registros ========================================================
  IBQ_ConsultaCreDeb.Close;
  IBQ_ConsultaCreDeb.SQL.Clear;
  IBQ_ConsultaCreDeb.SQL.Add('SELECT COUNT(mf.codfornecedor) TotReg'+MySqlDML+MySqlSelect);
  IBQ_ConsultaCreDeb.Open;

  FrmBelShop.MontaProgressBar(True, FrmDataApropriacao);
  pgProgBar.Properties.Max:=IBQ_ConsultaCreDeb.FieldByName('TotReg').AsInteger;
  pgProgBar.Position:=0;

  // Busca Comprovantes ========================================================
  IBQ_ConsultaCreDeb.Close;
  IBQ_ConsultaCreDeb.SQL.Clear;
  IBQ_ConsultaCreDeb.SQL.Add(MySql+MySqlDML+MySqlSelect+MySqlOrderBy);
  IBQ_ConsultaCreDeb.Open;

  IBQ_ConsultaCreDeb.DisableControls;
  While Not IBQ_ConsultaCreDeb.Eof do
  Begin
    Application.ProcessMessages;

    // Busca Num_seq do Dia do Fornecedor -------------------------
    MySql:=' select coalesce(max(cf.num_seq)+1 ,1) Num_Seq'+
           ' from FL_CAIXA_FORNECEDORES cf'+
           ' where cf.dta_caixa='+QuotedStr(IBQ_ConsultaCreDeb.FieldByName('DATAENTRADA').AsString)+
           ' and cf.cod_fornecedor='+QuotedStr(IBQ_ConsultaCreDeb.FieldByName('CODFORNECEDOR').AsString)+
           ' and cf.num_seq>0'+
           ' and cf.num_seq<999999';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    sNumSeq:=Trim(DMBelShop.CDS_Busca.FieldByName('Num_Seq').AsString);
    DMBelShop.CDS_Busca.Close;

    // Insere Caixa -----------------------------------------------
    MySql:='Insert Into FL_CAIXA_fORNECEDORES ('+
           ' COD_FORNECEDOR, DES_FORNECEDOR, DTA_CAIXA, NUM_SEQ,'+
           ' NUM_CHAVENF, COD_EMPRESA, COD_HISTORICO, TXT_OBS,'+
           ' NUM_DOCUMENTO, NUM_SERIE, TIP_DEBCRE, VLR_CAIXA, VLR_SALDO)'+
           ' Values ('+
           QuotedStr(IBQ_ConsultaCreDeb.FieldByName('CODFORNECEDOR').AsString)+', '+
           QuotedStr(IBQ_ConsultaCreDeb.FieldByName('NOMEFORNECEDOR').AsString)+', '+
           QuotedStr(IBQ_ConsultaCreDeb.FieldByName('DATAENTRADA').AsString)+', '+
           sNumSeq+', '+
           QuotedStr(IBQ_ConsultaCreDeb.FieldByName('CHAVENF').AsString)+', '+
           QuotedStr(IBQ_ConsultaCreDeb.FieldByName('CODFILIAL').AsString)+', '+
           QuotedStr(IBQ_ConsultaCreDeb.FieldByName('CODCOMPROVANTE').AsString)+', '+
           QuotedStr(AnsiUpperCase(IBQ_ConsultaCreDeb.FieldByName('OBSERVACAO').AsString))+', '+
           QuotedStr(IBQ_ConsultaCreDeb.FieldByName('NUMERO').AsString)+', '+
           QuotedStr(IBQ_ConsultaCreDeb.FieldByName('SERIE').AsString)+', '+
           QuotedStr(IBQ_ConsultaCreDeb.FieldByName('TP_DEBCRE').AsString)+', '+
           QuotedStr(IBQ_ConsultaCreDeb.FieldByName('VLR_TOTAL').AsString)+', '+
           ' 0)';
    DMBelShop.SQLC.Execute(MySql, nil, nil);
    bgProcessar:=True;

    pgProgBar.Position:=IBQ_ConsultaCreDeb.RecNo;

    IBQ_ConsultaCreDeb.Next;
  End; // While Not IBQ_ConsultaCreDeb.Eof do
  IBQ_ConsultaCreDeb.EnableControls;

  FrmBelShop.MontaProgressBar(False, FrmDataApropriacao);

  IBQ_ConsultaCreDeb.Close;
  IBQ_ConsultaCreDeb.Free;

End;

// Atualiza Fluxo de Caixa >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmDataApropriacao.AtualizaFluxoCaixa;
Var
  MySql: String;
  sDataBase, sTransaction: String;
  b, bSiga: Boolean;
  sMensagem: String;
Begin

  sMensagem:='';

  // Fornecedores Selecionados =================================================
  sgFornecedores:='';
  If Not DMVirtual.CDS_V_Fornecedores.IsEmpty Then
  Begin
    DMVirtual.CDS_V_Fornecedores.First;
    While Not DMVirtual.CDS_V_Fornecedores.Eof do
    Begin
      Refresh;

      If sgFornecedores='' Then
       sgFornecedores:=
                  QuotedStr(DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString)
      Else
       sgFornecedores:=sgFornecedores+', '+
                 QuotedStr(DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString);

      DMVirtual.CDS_V_Fornecedores.Next;
    End; // While Not DMVirtual.CDS_V_Fornecedores.Eof do
    DMVirtual.CDS_V_Fornecedores.First;

  End; // If Not DMVirtual.CDS_V_Fornecedores.IsEmpty Then


  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMBelShop.SQLC.StartTransaction(TD);
  Try
    Screen.Cursor:=crSQLWait;

    DateSeparator:='.';
    DecimalSeparator:='.';

    // Busca Fornecedores com Creditos para Busca de Déditos ===================
    If sgFornecedores='' Then
    Begin
      MySql:=' Select distinct ff.cod_fornecedor'+
             ' From FL_CAIXA_FORNECEDORES ff'+
             ' Where ff.cod_historico=900'+
             ' And ff.dta_caixa >='+QuotedStr(f_Troca('/','.',Dte_AproprDtaApropriacao.Text))+
             ' Order by ff.cod_fornecedor';
     DMBelShop.CDS_Busca.Close;
     DMBelShop.SDS_Busca.CommandText:=MySql;
     DMBelShop.CDS_Busca.Open;

     While Not DMBelShop.CDS_Busca.Eof do
     Begin
       Refresh;

        If sgFornecedores='' Then
         sgFornecedores:=QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)
        Else
         sgFornecedores:=
          sgFornecedores+', '+QuotedStr(DMBelShop.CDS_Busca.FieldByName('Cod_Fornecedor').AsString);

       DMBelShop.CDS_Busca.Next;
     End; // While Not DMBelShop.CDS_Busca.Eof do

     DMBelShop.CDS_Busca.Close;
    End; // If sgFornecedores='' Then

    // Exclui Movtos do Caixa a Serem Atualizados -------------------
    MySql:=' Delete from FL_CAIXA_FORNECEDORES ff'+
           ' Where ff.COD_FORNECEDOR in ('+sgFornecedores+')'+
           ' And ff.dta_caixa >='+QuotedStr(f_Troca('/','.',F_Troca('-','.',Dte_AproprDtaApropriacao.Text)));
    DMBelShop.SQLC.Execute(MySql,nil,nil);


    // =========================================================================
    // Busca Débitos/Créditos BelShop_CD.FDB ===================================
    // =========================================================================

    Lb_Apres.Caption:=Lb_Apres.Caption+cr+cr+'Loja: Bel_99';
    Lb_Partes.Caption:='Parte 1/2';

    // Conecta IBDB_MPMS --------------------------------------------
    If (Trim(sgTpConexao)='') Or (Trim(sgTpConexao)='NetBEUI') Then
     MySql:=' Select (''\\''||';

    If (Trim(sgTpConexao)='TCP/IP') Then
     MySql:=' Select (';

    // Se Conexão Externa -------------------------------------------
    If (Not bgConexaoLocal) Then
    Begin
      MySql:=MySql+' Case '+
                   '    When Trim(emp.Endereco_IP_Externo)<>'''' Then'+
                   '       emp.ENDERECO_IP_EXTERNO'+
                   '    Else'+
                   '       emp.ENDERECO_IP'+
                   ' End';
    End;

    // Se Conexão Local ---------------------------------------------
    If (bgConexaoLocal) Then
    Begin
      MySql:=MySql+'emp.ENDERECO_IP'
    End;

    If (Trim(sgTpConexao)='') Or (Trim(sgTpConexao)='NetBEUI') Then
     MySql:=MySql+'||''\''||emp.pasta_base_dados||''\''||emp.des_base_dados) Banco';

    If (Trim(sgTpConexao)='TCP/IP') Then
     MySql:=MySql+'||'':''||emp.pasta_base_dados||''\''||emp.des_base_dados) Banco';

    MySql:=MySql+' from EMP_CONEXOES emp'+
                 ' WHERE emp.tip_emp=''M''';
    DMBelShop.CDS_Busca.Close;
    DMBelShop.SDS_Busca.CommandText:=MySql;
    DMBelShop.CDS_Busca.Open;

    DMConexoes.IBDB_MPMS.Connected:=False;;
    DMConexoes.IBT_MPMS.Active:=False;;
    DMConexoes.IBDB_MPMS.DatabaseName:=DMBelShop.CDS_Busca.FieldByName('Banco').AsString;
    DMBelShop.CDS_Busca.Close;

    b:=True;
    While b do
    Begin
      Try
        DMConexoes.IBDB_MPMS.Connected:=True;
        Break;
      Except
      End;
    End; // While b do

    // Monta Query de Consulta --------------------------------------
    FrmBelShop.CriaQueryIB('IBDB_MPMS','IBT_MPMS',IBQ_ConsultaCreDeb, True, True);

    // Processa Creditos --------------------------------------------
    NegociacoesCredDeb('C');

    // ===========================================================================
    // Busca Débitos/Créditos Outras Lojas =======================================
    // ===========================================================================
    Lb_Partes.Caption:='Parte 2/2';

    // Busca Conexão das Empresas -----------------------------------
    If (Trim(sgTpConexao)='') Or (Trim(sgTpConexao)='NetBEUI') Then
     MySql:=' Select EMP.Cod_Filial, emp.Razao_Social, (''\\''||';

    If (Trim(sgTpConexao)='TCP/IP') Then
     MySql:=' Select EMP.Cod_Filial, emp.Razao_Social, (';

    // Se Conexão Externa -------------------------------------------
    If (Not bgConexaoLocal) Then
    Begin
      MySql:=MySql+' Case '+
                   '    When Trim(emp.Endereco_IP_Externo)<>'''' Then'+
                   '       emp.ENDERECO_IP_EXTERNO'+
                   '    Else'+
                   '       emp.ENDERECO_IP'+
                   ' End';
    End;

    // Se Conexão Local ---------------------------------------------
    If (bgConexaoLocal) Then
    Begin
      MySql:=MySql+'emp.ENDERECO_IP'
    End;

    If (Trim(sgTpConexao)='') Or (Trim(sgTpConexao)='NetBEUI') Then
     MySql:=MySql+'||''\''||emp.pasta_base_dados||''\''||emp.des_base_dados) Banco';

    If (Trim(sgTpConexao)='TCP/IP') Then
     MySql:=MySql+'||'':''||emp.pasta_base_dados||''\''||emp.des_base_dados) Banco';

    MySql:=MySql+' From EMP_CONEXOES emp'+
                 ' Where emp.Ind_Ativo=''SIM'''+
                 ' Order by emp.Cod_Emp';
    DMBelShop.CDS_While.Close;
    DMBelShop.SDS_While.CommandText:=MySql;
    DMBelShop.CDS_While.Open;

    Lb_Apres.Visible:=True;

    While Not DMBelShop.CDS_While.Eof do
    Begin
      Screen.Cursor:=crSQLWait;

      Lb_Apres.Caption:='Aguarde !!'+cr+cr+'Atualizando Comprovantes'+cr+cr+'900, 913, 916, 955'+cr+cr+
                        'Loja: Bel_'+DMBelShop.CDS_While.FieldByName('Cod_Filial').AsString;
      Refresh;

      sDataBase:='IBDB_'+DMBelShop.CDS_While.FieldByName('Cod_Filial').AsString;
      sTransaction:='IBT_'+DMBelShop.CDS_While.FieldByName('Cod_Filial').AsString;

      // Abre Conexão da Empresa ------------------------------------
      bSiga:=True;
      If Not ConexaoEmpIndividual(sDataBase, sTransaction,'A') Then
      Begin
        if Trim(sMensagem)='' Then
         sMensagem:='Lojas não Conectadas:';

        sMensagem:=sMensagem+' Bel_'+DMBelShop.CDS_While.FieldByName('Cod_Filial').AsString;
        bSiga:=False;
      End; // If Not ConexaoEmpIndividual(sDataBase, sTransaction,'A') Then

      If bSiga Then
      Begin
        // Monta Query de Consulta ----------------------------------
        FrmBelShop.CriaQueryIB(sDataBase,sTransaction,IBQ_ConsultaCreDeb, True, True);

        // Processa Creditos ----------------------------------------
        NegociacoesCredDeb('D');

        // Fecha Conexão da Empresa ---------------------------------
        ConexaoEmpIndividual(sDataBase, sTransaction,'F');

        Screen.Cursor:=crDefault;
      End; // If bSiga Then

      DMBelShop.CDS_While.Next;
    End; // While Not DMBelShop.CDS_While.Eof do

    // Fecha Transacao ----------------------------------------------
    DMBelShop.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    Screen.Cursor:=crDefault;

    Lb_Apres.Visible:=False;

  Except
    on e : Exception do
    Begin
      DMBelShop.SQLC.Rollback(TD);

      Lb_Apres.Visible:=False;
      bgProcessar:=False;

      DateSeparator:='/';
      DecimalSeparator:=',';
      Screen.Cursor:=crDefault;

      MessageBox(Handle, pChar('Mensagem de erro do sistema:'+#13+e.message), 'Erro', MB_ICONERROR);
      Exit;
    End;
  End;

  // FIM =======================================================================
  msg('Atualização Efetuada com Sucesso !!','A');

  If Trim(sMensagem)<>'' Then
   MessageBox(Handle, pChar(sMensagem), 'ATENÇÃO !!', MB_ICONERROR);

  Lb_Partes.Caption:='Parte 0/2';

End;

procedure TFrmDataApropriacao.Bt_AproprFecharClick(Sender: TObject);
begin

  Try
    If DMVirtual.CDS_V_Fornecedores.Active Then
    Begin
      DMVirtual.CDS_V_Fornecedores.EmptyDataSet;
    End;
  Except
  End;

  Close;
end;

procedure TFrmDataApropriacao.EdtAproprCodFornecedorExit(Sender: TObject);
Var
  MySql: String;
begin

  If EdtAproprCodFornecedor.Value<>0 Then
  Begin
    Screen.Cursor:=crSQLWait;

    // Busca Fornecedores =======================================================
    MySql:='select f.nomefornecedor, f.codfornecedor'+
           ' from produto p, forneced f'+
           ' where p.principalfor=f.codfornecedor'+
           ' and COALESCE(p.situacaopro,0)=0'+
           ' and f.codfornecedor='+VarToStr(EdtAproprCodFornecedor.Value);
    FrmBelShop.IBQ_Matriz.Close;
    FrmBelShop.IBQ_Matriz.SQL.Clear;
    FrmBelShop.IBQ_Matriz.SQL.Add(MySql);
    FrmBelShop.IBQ_Matriz.Open;

    Screen.Cursor:=crDefault;

    If Trim(FrmBelShop.IBQ_Matriz.FieldByName('codfornecedor').AsString)='' Then
    Begin
     msg('Fornecedor NÃO Encontrado !!!', 'A');
     FrmBelShop.IBQ_Matriz.Close;
     EdtAproprCodFornecedor.Clear;
     EdtAproprCodFornecedor.SetFocus;
     Exit;
    End;

    If DMVirtual.CDS_V_Fornecedores.Locate('Cod_Fornecedor',FrmBelShop.IBQ_Matriz.FieldByName('CodFornecedor').AsString,[]) Then
    Begin
      Begin
        msg('Fornecedor Já Informado !!','A');
        EdtAproprCodFornecedor.Clear;
        EdtAproprCodFornecedor.SetFocus;
        FrmBelShop.IBQ_Matriz.Close;
        Exit;
      End;
    End;

    DMVirtual.CDS_V_Fornecedores.Insert;
    DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString:=
                    FrmBelShop.IBQ_Matriz.FieldByName('CodFornecedor').AsString;
    DMVirtual.CDS_V_FornecedoresDes_Fornecedor.AsString:=
                   FrmBelShop.IBQ_Matriz.FieldByName('NomeFornecedor').AsString;
    DMVirtual.CDS_V_Fornecedores.Post;


    EdtAproprCodFornecedor.Text:='0';
    EdtAproprCodFornecedor.SetFocus;

    FrmBelShop.IBQ_Matriz.Close;
  End;
end;

procedure TFrmDataApropriacao.FormShow(Sender: TObject);
begin
  try
    DMVirtual.CDS_V_Fornecedores.CreateDataSet;
    DMVirtual.CDS_V_Fornecedores.Open;
  Except
    DMVirtual.CDS_V_Fornecedores.EmptyDataSet;
    DMVirtual.CDS_V_Fornecedores.Open;
  End;
end;

procedure TFrmDataApropriacao.Bt_AproprOKClick(Sender: TObject);
begin

  EdtAproprCodFornecedor.SetFocus;

  If Trim(Dte_AproprDtaApropriacao.Text)='' Then
  Begin
    If msg('Data de Aprorpiação Inválida !!'+cr+cr+'Deseja Fechar ??','C')=2 Then
    Begin
      Dte_AproprDtaApropriacao.SetFocus;
      Exit;
    End;

    Bt_AproprFecharClick(Self);
    Exit;
  End;

  If DMVirtual.CDS_V_Fornecedores.IsEmpty Then
  Begin
    If msg('Deseja Atualizar Conta Corrente'+cr+'Para TODOS os Fornecedores ??','C')=2 Then
    Begin
      EdtAproprCodFornecedor.SetFocus;
      Exit;
    End;
  End;

  // Processa Atualização ======================================================
  Lb_Apres.Visible:=True;
  Lb_Apres.Caption:='Atualizando Comprovantes '+cr+cr+'900, 913, 916, 955, 957, 011';

  AtualizaFluxoCaixa;

  sgFornecedores:='';
  Lb_Apres.Visible:=False;

  Close;
end;

procedure TFrmDataApropriacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  End;

end;

procedure TFrmDataApropriacao.Dbg_AproprFornecedoresKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key=VK_Delete Then
 Begin
   If Not DMVirtual.CDS_V_Fornecedores.IsEmpty Then
    DMVirtual.CDS_V_Fornecedores.Delete;
 End; // if Key=VK_Delete Then

 Dbg_AproprFornecedores.SetFocus;

end;

procedure TFrmDataApropriacao.Bt_AproprBuscaFornecedorClick(Sender: TObject);
Var
  MySql: String;
begin

  // ========== EFETUA A CONEXÃO ===============================================
  FrmPesquisaIB:=TFrmPesquisaIB.Create(Self);

  FrmPesquisaIB.IBCDS_Pesquisa.DBConnection:=FrmBelShop.IBQ_Matriz.Database;
  FrmPesquisaIB.IBCDS_Pesquisa.DBTransaction:=FrmBelShop.IBQ_Matriz.Transaction;

  // ========== EXECUTA QUERY PARA PESQUISA ====================================
  Screen.Cursor:=crSQLWait;

  MySql:='select distinct f.nomefornecedor, f.codfornecedor'+
         ' from PRODUTO p, FORNECED f'+
         ' where p.principalfor=f.codfornecedor'+
         ' and COALESCE(p.situacaopro,0)=0'+
         ' order by f.nomefornecedor';
  FrmPesquisaIB.IBCDS_Pesquisa.Close;
  FrmPesquisaIB.IBCDS_Pesquisa.CommandText:=MySql;
  FrmPesquisaIB.IBCDS_Pesquisa.Open;

  Screen.Cursor:=crDefault;

  // ============== Verifica Existencia de Dados ===============================
  If FrmPesquisaIB.IBCDS_Pesquisa.Eof Then
  Begin
    msg('Sem Registro a Listar !!','A');
    EdtAproprCodFornecedor.Clear;
    EdtAproprCodFornecedor.SetFocus;
    Exit;
  End;

  // ============= INFORMA O CAMPOS PARA PESQUISA E RETORNO ====================
  FrmPesquisaIB.Campo_pesquisa:='NomeFornecedor';
  FrmPesquisaIB.Campo_Codigo:='CodFornecedor';
  FrmPesquisaIB.Campo_Descricao:='NomeFornecedor';
  FrmPesquisaIB.EdtDescricao.Clear;

  // ============= ABRE FORM DE PESQUISA =======================================
  FrmPesquisaIB.ShowModal;

  // ============= RETORNO =====================================================
  If (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'') and (Trim(FrmPesquisaIB.EdtCodigo.Text)<>'0')Then
  Begin
    If DMVirtual.CDS_V_Fornecedores.Locate('Cod_Fornecedor',FrmPesquisaIB.EdtCodigo.Text,[]) Then
    Begin
      Begin
        msg('Fornecedor Já Informado !!','A');
        EdtAproprCodFornecedor.Clear;
        EdtAproprCodFornecedor.SetFocus;
        Exit;
      End;
    End;

    DMVirtual.CDS_V_Fornecedores.Insert;
    DMVirtual.CDS_V_FornecedoresCod_Fornecedor.AsString:=FrmPesquisaIB.EdtCodigo.Text;
    DMVirtual.CDS_V_FornecedoresDes_Fornecedor.AsString:=FrmPesquisaIB.EdtDescricao.Text;
    DMVirtual.CDS_V_Fornecedores.Post;
  End; // If Trim(FrmPesquisaIB.EdtCodigo.Text)<>'' Then

  FrmPesquisaIB.Free;

end;

procedure TFrmDataApropriacao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=44   Then
   Clipboard.AsText:='';

end;

procedure TFrmDataApropriacao.FormCreate(Sender: TObject);
begin
  // Coloca Icone no Form ======================================================
  Icon:=Application.Icon;

end;

end.
