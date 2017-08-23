unit UAtualizaEstoques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvXPCore, JvXPButtons, IBQuery, IBDatabase, DBXpress,
  WinInet;

type
  TFrmAtualizaEstoques = class(TForm)
    Bt_Atualizar: TJvXPButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Bt_AtualizarClick(Sender: TObject);

    // Odir ====================================================================
    Function ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String): Boolean;
            // Procedimento: (A) Abrir Conex�o (F) Fechar COnex�o

    Procedure CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery;
                          bMatriz, bCriaIBQ: Boolean);
                        // sDataBase    = Database a Conectar
                        // sTransaction = Transaction a Conectar
                        // IBQ_Free     = Nome do TIBQuery a Destruir e Reconstruir
                        // bMatriz      = Se Conex�o � Matriz
                        // Se Destruir e Reconstruir IBQuery

    Procedure AtualizaEstoquesMovtosLinx(sCodLinx, sCodBelShop, sDtaInicioLinx: String);

    Procedure SaldosTransfere_Linx_Sidicom;

    // Odir ====================================================================
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualizaEstoques: TFrmAtualizaEstoques;

  bgConexaoLocal: Boolean; // Se Conex�o com o Servidor da Matriz � Local - Verifica a Existencia do Arquivo "ConexaoExterna.ini"

  sgDataAtual, sgHoraAtual: String;

  IBQ_Consulta: TIBQuery;

  TD : TTransactionDesc; // Ponteiro de Transa��o

  tgMySqlErro: TStringList; // Arquivo de Erros

implementation

uses UDMAtualizaEstoques, UDMConexoes, DK_Procs1, DB;

{$R *.dfm}

// Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Procedure TFrmAtualizaEstoques.SaldosTransfere_Linx_Sidicom;
Var
  MySql: String;
Begin
  sgDataAtual:=DateTimeToStr(DataHoraServidorFI(DMAtualizaEstoques.SDS_DtaHoraServidor));

  Try // Try da Transa��o
    // Conecata SIDICOM ========================================================
    ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A');
    CriaQueryIB('IBDB_99', 'IBT_99', IBQ_Consulta, False, True);

    // Verifica se Transa��o esta Ativa
    If DMConexoes.IBT_99.Active Then
     DMConexoes.IBT_99.Rollback;

    // Monta Transacao  -------------------------------------
    DMConexoes.IBT_99.StartTransaction;

    DateSeparator:='.';
    DecimalSeparator:='.';

    // Busca Saldos Linx =======================================================
    MySql:=' SELECT ''UPDATE ESTOQUE e''||'+
           ' '' SET e.saldoatual  =''''''||es.saldoatual||''''''''||'+
           ' '', e.dataalteraestoque='''+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDataAtual)))+'''''||'+
           ' '' WHERE e.codfilial =''''''||es.codfilial||''''''''||'+
           ' '' AND   e.codproduto=''''''||es.codproduto||'''''''' MDL'+
           ' FROM ESTOQUE es'+
           ' WHERE es.codfilial=''99''';
    DMAtualizaEstoques.CDS_LojaLinx.Close;
    DMAtualizaEstoques.SDS_LojaLinx.CommandText:=MySql;
    DMAtualizaEstoques.CDS_LojaLinx.Open;

    While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
    Begin
      IBQ_Consulta.Close;
      IBQ_Consulta.SQL.Clear;
      IBQ_Consulta.SQL.Add(DMAtualizaEstoques.CDS_LojaLinx.FieldByName('MDL').AsString);
      IBQ_Consulta.ExecSQL;

      If DMAtualizaEstoques.CDS_LojaLinx.RecNo mod 1000=0 Then
      Begin
        DMConexoes.IBT_99.Commit;

        DMConexoes.IBT_99.StartTransaction;
      End; // if DMAtualizaEstoques.CDS_LojaLinx.RecNo mod 1000=0 Then

      DMAtualizaEstoques.CDS_LojaLinx.Next;
    End; // While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do

    DMConexoes.IBT_99.Commit;

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except
    on e : Exception do
    Begin
      DMConexoes.IBT_99.Rollback;

      // Monta Transacao ===========================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaEstoques.SQLC.StartTransaction(TD);

      MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
             ' VALUES ('+
             QuotedStr('99')+', '+
             '2, '+
             ' CURRENT_TIMESTAMP,'+
             QuotedStr('Err')+', '+ // Linx Com Invent�rio
             QuotedStr(e.message+' - '+MySql)+')'+
             'MATCHING (COD_LOJA)';
      DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

      DMAtualizaEstoques.SQLC.Commit(TD); // Linx Com Invent�rio

      DateSeparator:='/';
      DecimalSeparator:=',';

    End; // on e : Exception do
  End; // Try

  DMAtualizaEstoques.IBQ_EstoqueLoja.Close;
  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
End; // Procedure TFrmAtualizaEstoques.SaldoLinx_Sidicom >>>>>>>>>>>>>>>>>>>>>>>

Procedure TFrmAtualizaEstoques.AtualizaEstoquesMovtosLinx(sCodLinx, sCodBelShop, sDtaInicioLinx: String);
Var
  MySql: String;

  i: Integer;

  sDtaAtualiza,
  sDML, sValues,
  sCodProd, sQtdSaldo: String;
Begin

  sDtaAtualiza:=f_Troca('/','.',f_Troca('-','.',DateToStr(Date)));

  // Verifica se Transa��o esta Ativa
  If DMAtualizaEstoques.SQLC.InTransaction Then
   DMAtualizaEstoques.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaEstoques.SQLC.StartTransaction(TD);
  Try // Try da Transa��o
    DateSeparator:='.';
    DecimalSeparator:='.';

    //==========================================================================
    // Atualiza Todos os Produtos na Tabela ESTOQUE ============================
    //==========================================================================
    sDML:=' UPDATE OR INSERT INTO ESTOQUE ('+
          ' CODFILIAL, CODPRODUTO, SALDOATUAL, PEDIDOPENDENTE,'+
          ' ZONAENDERECO, CORREDOR, PRATELEIRA, GAVETA,'+
          ' CUSMEDVALOR, CUSTOMEDIO, LASTPRECOCOMPRA, LASTCUSTOMEDIO,'+
          ' ESTOQUEIDEAL, ESTOQUEMAXIMO,'+
          ' DATAALTERACADASTRO, DATAALTERAESTOQUE, DATAALTERAESTOQUE_PED,'+
          ' PRINCIPALFOR, SALDO_FINAL_SIDICOM, DTA_ATUALIZACAO, HRA_ATUALIZACAO)'+
          ' VALUES (';

    MySql:=' SELECT '+
           QuotedStr(sCodBelShop)+' codfilial,'+
           ' CAST(LPAD(lp.cod_auxiliar,6,0) AS VARCHAR(6)) codproduto,'+
           ' lpd.quantidade saldoatual, 0.0000 pedidopendente,'+
           ' COALESCE(es.zonaendereco, 0) zonaendereco,'+
           ' COALESCE(es.corredor, ''000'') corredor,'+
           ' COALESCE(es.prateleira, ''000'') prateleira,'+
           ' COALESCE(es.gaveta, ''0000'') gaveta,'+
           ' lpd.custo_medio cusmedvalor, lpd.custo_medio customedio,'+
           ' COALESCE((SELECT FIRST 1 m.valor_liquido'+
           '           FROM LINXMOVIMENTO m'+
           '           WHERE m.empresa = '+sCodLinx+
           '           AND   m.operacao = ''E'''+
           '           AND   ((m.tipo_transacao=''S'') OR (m.tipo_transacao=''E'') OR (m.tipo_transacao IS NULL))'+
           '           AND   m.cancelado=''N'''+
           '           AND   m.excluido=''N'''+
           '           AND   m.cod_produto = lpd.cod_produto'+
           '           ORDER BY m.data_lancamento DESC), 0.0000) lastprecocompra,'+
           ' lpd.custo_medio lastcustomedio,'+
           ' COALESCE(es.estoqueideal, 0.0000) estoqueideal,'+
           ' COALESCE(es.estoquemaximo, 0.0000) estoquemaximo,'+
           ' lp.dt_update dataalteracadastro,'+
           ' lp.dt_update dataalteraestoque,'+
           ' lp.dt_update dataalteraestoque_ped,'+
           ' pr.principalfor principalfor, '+
           ' COALESCE(es.saldo_final_sidicom, 0.00000)  saldo_final_sidicom,'+
           QuotedStr(sgDataAtual)+' DTA_ATUALIZACAO, '+
           ' current_time HRA_ATUALIZACAO'+

           ' FROM LINXPRODUTOSDETALHES lpd'+
           '          LEFT JOIN LINXPRODUTOS lp  ON lp.cod_produto = lpd.cod_produto'+
           '          LEFT JOIN PRODUTO pr       ON pr.codproduto = CAST(LPAD(lp.cod_auxiliar,6,0) AS VARCHAR(6))'+
           '          LEFT JOIN ESTOQUE es       ON es.codproduto = pr.codproduto'+
           '                                    AND es.codfilial='+QuotedStr(sCodBelShop)+ //  --==>>> sidicom

           ' WHERE lpd.empresa = '+sCodLinx+
           ' AND   lp.cod_auxiliar IS NOT NULL'+
           ' AND   Char_length(lp.cod_auxiliar)<=6'+

           ' ORDER BY lp.cod_auxiliar, lpd.quantidade';
    DMAtualizaEstoques.CDS_LojaLinx.Close;
    DMAtualizaEstoques.SDS_LojaLinx.CommandText:=MySql;

    Try
     DMAtualizaEstoques.CDS_LojaLinx.Open;
    Except
      tgMySqlErro.Add('1 - Loja BelShop: '+sCodBelShop);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('');
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'ODIR_ERRO.txt');
    End;

    While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
    Begin
      If sCodProd=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('CodProduto').AsString Then
       sQtdSaldo:=CurrToStr(StrToCurr(sQtdSaldo)+DMAtualizaEstoques.CDS_LojaLinx.FieldByName('SaldoAtual').AsCurrency)
      Else
       sQtdSaldo:=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('SaldoAtual').AsString;

      sValues:='';
      For i:=0 to DMAtualizaEstoques.CDS_LojaLinx.FieldCount-1 do
      Begin
        // ULTIMO CAMPO - HRA_ATUALIZACAO ============================
        If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
         Begin
           sValues:=
            sValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)+')';
         End // If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then

        // Saldo do Produto (SALDOATUAL) ============================
        Else
        If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='SALDOATUAL' Then
        Begin
          sValues:=
           sValues+QuotedStr(sQtdSaldo)+', ';
        End // If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then

        Else
         Begin
           // Grava Resto do Registro
           If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)<>'' Then
            sValues:=
             sValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)+', '
           Else
            sValues:=
             sValues+'NULL, ';
         End;
      End; // For i:=0 to DMAtualizaEstoques.CDS_LojaLinx.FieldCount-1 do

      // UPDATE OR INSERT INTO MCLI ==================================
      MySql:=sDML+sValues+' MATCHING (CODFILIAL, CODPRODUTO)';
      DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

      sCodProd:=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('CodProduto').AsString;

      DMAtualizaEstoques.CDS_LojaLinx.Next;
    End; // While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
    DMAtualizaEstoques.CDS_LojaLinx.Close;

    // Zera Produtos que n�o Foram Utilizados ========================
    MySql:=' UPDATE ESTOQUE es'+
           ' SET es.saldoatual=0.0000'+
           ' WHERE es.codfilial='+QuotedStr(sCodBelShop)+
           ' AND   es.saldoatual<>0.0000'+
           ' AND   es.dta_atualizacao<'+QuotedStr(sDtaAtualiza);
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
    // Atualiza Todos os Produtos na Tabela ESTOQUE ============================
    //==========================================================================

    // Limpar Arquivo Work =====================================================
    MySql:=' DELETE FROM W_LINX_MOVTOS';

    // Insere Movimentos no Arquivo Work =======================================
    MySql:=' INSERT INTO W_LINX_MOVTOS'+
           ' SELECT'+
           ' CAST(LPAD(p.cod_auxiliar,6,0) AS VARCHAR(6)) codproduto,'+
           ' COALESCE((SUM(d.custo_medio)/count(p.cod_auxiliar)),0.0000) cusmedvalor,'+
           ' COALESCE(SUM(CASE'+
           '                WHEN m.operacao in (''E'', ''DS'') THEN'+
           '                  COALESCE(m.quantidade, 0.0000)'+
           '                WHEN m.operacao in (''S'', ''DE'') THEN'+
           '                  COALESCE(-m.quantidade, 0.0000)'+
           '              END),'+
           ' 0.00) qtd_movto'+

           ' FROM LINXMOVIMENTO m'+
           '      LEFT JOIN LINXPRODUTOS p          ON m.cod_produto=p.cod_produto'+
           '      LEFT JOIN LINXPRODUTOSDETALHES d  ON m.cod_produto=d.cod_produto'+
           '                                       AND m.empresa    =d.empresa'+

           ' WHERE m.operacao in (''E'', ''DS'', ''S'', ''DE'')'+
           ' AND   m.cancelado=''N'''+
           ' AND   m.excluido =''N'''+
//odirapagar - 22/05/2017
//           ' AND   m.soma_relatorio=''S'''+
           ' AND   p.cod_auxiliar IS NOT NULL'+
           ' AND   Char_length(p.cod_auxiliar)<=6'+
           ' AND   m.data_lancamento>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicioLinx)))+
           ' AND   m.empresa='+sCodLinx+

           ' GROUP BY 1';
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    // Atualiza Custo M�dio ====================================================
    MySql:=' UPDATE ESTOQUE e'+
           ' SET e.cusmedvalor=COALESCE((SELECT lm.cusmedvalor'+
           '                             FROM W_LINX_MOVTOS lm'+
           '                             WHERE lm.codproduto=e.codproduto), 0.0000)'+
           ', e.dta_atualizacao='+QuotedStr(sgDataAtual)+
           ', e.hra_atualizacao='+QuotedStr(sgHoraAtual)+
           ' WHERE e.codfilial ='+QuotedStr(sCodBelShop);
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    //==========================================================================
    // Atualiza Estoques e Outros Valores ======================================
    // Saldo_Final_Sidicom >= 0 ================================================
    //==========================================================================
    MySql:=' UPDATE ESTOQUE e'+
           ' SET e.saldoatual=e.saldo_final_sidicom+COALESCE((SELECT lm.qtd_movto'+
           '                                                  FROM W_LINX_MOVTOS lm'+
           '                                                  WHERE lm.codproduto=e.codproduto), 0.0000),'+
           ' e.pedidopendente=0.0000,'+
           ' e.zonaendereco=0,'+
           ' e.corredor=''000'','+
           ' e.prateleira=''000'','+
           ' e.gaveta=''0000'','+
           ' e.estoqueideal=0.0000,'+
           ' e.estoquemaximo=0.0000,'+
           ' e.customedio=e.cusmedvalor,'+
           ' e.lastcustomedio=e.cusmedvalor,'+
           ' e.dataalteracadastro=current_timestamp,'+
           ' e.dataalteraestoque=current_timestamp,'+
           ' e.dataalteraestoque_ped=current_timestamp,'+
           ' e.dta_atualizacao='+QuotedStr(sgDataAtual)+','+
           ' e.hra_atualizacao='+QuotedStr(sgHoraAtual)+

           ' WHERE e.saldo_final_sidicom >= 0.00'+
           ' AND   e.codfilial='+QuotedStr(sCodBelShop);
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    //==========================================================================
    // Atualiza Estoques e Outros Valores ======================================
    // Saldo_Final_Sidicom < 0 =================================================
    //==========================================================================
    MySql:=' UPDATE ESTOQUE e'+
           ' SET e.saldoatual=COALESCE((SELECT lm.qtd_movto'+
           '                            FROM W_LINX_MOVTOS lm'+
           '                            WHERE lm.codproduto=e.codproduto), 0.0000),'+
           ' e.pedidopendente=0.0000,'+
           ' e.zonaendereco=0,'+
           ' e.corredor=''000'','+
           ' e.prateleira=''000'','+
           ' e.gaveta=''0000'','+
           ' e.estoqueideal=0.0000,'+
           ' e.estoquemaximo=0.0000,'+
           ' e.customedio=e.cusmedvalor,'+
           ' e.lastcustomedio=e.cusmedvalor,'+
           ' e.dataalteracadastro=current_timestamp,'+
           ' e.dataalteraestoque=current_timestamp,'+
           ' e.dataalteraestoque_ped=current_timestamp,'+
           ' e.dta_atualizacao='+QuotedStr(sgDataAtual)+','+
           ' e.hra_atualizacao='+QuotedStr(sgHoraAtual)+

           ' WHERE e.saldo_final_sidicom < 0.00'+
           ' AND   e.codfilial='+QuotedStr(sCodBelShop);
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    // Limpar Arquivo Work =====================================================
    MySql:=' DELETE FROM W_LINX_MOVTOS';
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    // Zera Produtos que n�o Foram Utilizados ==================================
    MySql:=' UPDATE ESTOQUE es'+
           ' SET es.saldoatual=0.0000'+
           ' WHERE es.codfilial='+QuotedStr(sCodBelShop)+
           ' AND   es.saldoatual<>0.0000'+
           ' AND   es.dta_atualizacao<'+QuotedStr(sgDataAtual);
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
           ' VALUES ('+
           QuotedStr(sCodBelShop)+', '+
           sCodLinx+', '+
           'CURRENT_TIMESTAMP,'+
           QuotedStr('LsI')+', '+ // Linx Sem Invent�rio
           '''OK'')'+
           'MATCHING (COD_LOJA)';
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMAtualizaEstoques.SQLC.Commit(TD); // AtualizaEstoquesMovtosLinx

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except // Except da Transa��o
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMAtualizaEstoques.SQLC.Rollback(TD); // AtualizaEstoquesMovtosLinx

      TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaEstoques.SQLC.StartTransaction(TD);

      MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
             ' VALUES ('+
             QuotedStr(sCodBelShop)+', '+
             sCodLinx+', '+
             ' CURRENT_TIMESTAMP,'+
             QuotedStr('LsI')+', '+ // Linx Sem Invent�rio
             QuotedStr(e.message+' - '+MySql)+')'+
             'MATCHING (COD_LOJA)';
      DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

      DMAtualizaEstoques.SQLC.Commit(TD); // AtualizaEstoquesMovtosLinx

      DateSeparator:='/';
      DecimalSeparator:=',';
      Exit;
    End; // on e : Exception do
  End; // Try da Transa��o

End; // Procedure AtualizaEstoquesMovtosLinx(sCodLinx, sCodBelShop, sDtaInicioLinx: String);

Procedure TFrmAtualizaEstoques.CriaQueryIB(sDataBase, sTransaction: String;
                                           Var IBQ_Free: TIBQuery;
                                           bMatriz, bCriaIBQ: Boolean);
Var
  i: Integer;
  iOk: Integer;
Begin

  iOk:=0;

  If bCriaIBQ Then
  Begin
    Try
      If IBQ_Free <> Nil Then
       IBQ_Free.Free;
    Except
    End;

    IBQ_Free:=TIBQuery.Create(Self);
    IBQ_Free.FetchAll;
  End;

  IBQ_Free.Close;

  For i:=0 to DMConexoes.ComponentCount-1 do
  Begin
    If DMConexoes.Components[i] is TIBDatabase Then
    Begin
      If (DMConexoes.Components[i] as TIBDatabase).Name=sDataBase Then
      Begin
        IBQ_Free.Database:=(DMConexoes.Components[i] as TIBDatabase);
        Inc(iOk);
      End;
    End;

    If DMConexoes.Components[i] is TIBTransaction Then
    Begin
      If (DMConexoes.Components[i] as TIBTransaction).Name=sTransaction Then
      Begin
        IBQ_Free.Transaction:=(DMConexoes.Components[i] as TIBTransaction);
        Inc(iOk);
      End;
    End;

    If iOk = 2 Then
    Begin
      Break;
    End;
  End;

End;

Function TFrmAtualizaEstoques.ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String): Boolean;
Var
  i, ii: Integer;
  b: Boolean;
Begin
  Result:=False;
  b:=False;

  i:=0;
  ii:=0;
  While Not b do
  Begin
    Try
      If ii=0 Then
       Begin
         For i:=0 to DMConexoes.ComponentCount-1 do
         Begin
           If DMConexoes.Components[i] is TIBDatabase Then
           Begin
             If (DMConexoes.Components[i] as TIBDatabase).Name=sDataBase Then
             Begin

               // Abre Conex�o --------------------------------------
               If sProcedimento='A' Then
               Begin
                 If (DMConexoes.Components[i] as TIBDatabase).Connected Then
                  (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

                 Try 
                   (DMConexoes.Components[i] as TIBDatabase).Connected:=True;
                   Result:=True;
                   ii:=99;
                   Break;
                 Except
                 End;
               End; // If sProcedimento='A' Then

               // Fecha Conex�o --------------------------------------
               If sProcedimento='F' Then
               Begin
                 (DMConexoes.Components[i] as TIBDatabase).Connected:=False;
                 Result:=True;
                 ii:=99;
                 Break;
               End; // If sProcedimento='A' Then

             End;
           End; // If DMConexoes.Components[i] is TIBDatabase Then
         End; // For i:=0 to DMConexoes.ComponentCount-1 do
       End
      Else // If ii=0 Then
       Begin

         // Abre Conex�o --------------------------------------
         If sProcedimento='A' Then
         Begin
           If (DMConexoes.Components[i] as TIBDatabase).Connected Then
            (DMConexoes.Components[i] as TIBDatabase).Connected:=False;

           Try 
             (DMConexoes.Components[i] as TIBDatabase).Connected:=True;
             Result:=True;
             ii:=99;
             Break;
           Except
           End;
         End; // If sProcedimento='A' Then

         // Fecha Conex�o -------------------------------------
         If sProcedimento='F' Then
         Begin
           (DMConexoes.Components[i] as TIBDatabase).Connected:=False;
           Result:=True;
           ii:=99;
           Break;
         End; // If sProcedimento='A' Then

       End;
    Except
      Inc(ii);
    End; // Try

    If (ii=0) or (ii>1) Then
     Break;
  End; // While Not b do

End;

procedure TFrmAtualizaEstoques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(tgMySqlErro);

  Application.Terminate;
  Exit;

end;

procedure TFrmAtualizaEstoques.FormCreate(Sender: TObject);
begin
  tgMySqlErro:=TStringList.Create;

  Bt_AtualizarClick(Self);
end;

procedure TFrmAtualizaEstoques.Bt_AtualizarClick(Sender: TObject);
var
  bSiga: Boolean;

  MySql: String;

  sTipo: String; // Tipo de Processamento:
                 // Sdm = Sidicom
                 // LsI = Linx Sem Invent�rio
                 // LcI = Linx Com Invent�rio


  sCodEmpresa,
  sDtaLinx, sDtaInventLinx,
  sDML, sValues,
  sCodProd, sQtdSaldo: String;

  i, iCodLinx: Integer;

  // S� Atualiza Estoques com Movtos Ent/Sai Linx
  bSoAtualMovtoLinx: Boolean;
begin
//=========  ===========  ===============  ================================  ============================================
// Cod Linx	 Data Inicio  Data Inventario	 Variaveis Utilizadas              O Que Fazer
// ========  ===========  ===============  ================================  ============================================
//    SEM	        SEM	          SEM	       iCodLinx=0                        Busca Estoques no SIDICOM Direto
//---------  -----------  ---------------  --------------------------------  --------------------------------------------
//    COM	        COM	          SEM	       iCodLinx<>0 e sDtaInventLinx=''   S� Atualiza Estoques com Movtos Ent/Sai Linx
//---------  -----------  ---------------  --------------------------------  --------------------------------------------
//    COM	        COM	          COM	       iCodLinx<>0 e sDtaInventLinx<>''  Busca Estoques no LINX Direto
// ========  ===========  ===============  ================================  ============================================

  tgMySqlErro.Clear;
  tgMySqlErro.SaveToFile(sgPath_Local+'ODIR_ERRO.txt');

  MySql:=' SELECT c.cod_filial, c.cod_linx,'+
         '        c.endereco_ip, c.endereco_ip_externo,'+
         '        c.pasta_base_dados, c.des_base_dados,'+
         '        c.cod_emp, c.razao_social, c.tip_emp,'+
         '        c.ind_ativo, c.dta_inicio_linx, c.dta_inventario_linx,'+
         '        ''IBDB_''||c.cod_filial "DATABASE",'+
         '        ''IBT_''||c.cod_filial  "TRANSACAO"'+

         ' FROM EMP_CONEXOES c'+

         ' WHERE ((c.ind_ativo=''SIM'')'+
         '        OR'+
         '        (c.cod_filial=''99'')'+
         '        OR'+
         '        (c.cod_filial=''50''))'+
         ' ORDER BY c.cod_filial';
  DMAtualizaEstoques.CDS_EmpProcessa.Close;
  DMAtualizaEstoques.SDS_EmpProcessa.CommandText:=MySql;
  DMAtualizaEstoques.CDS_EmpProcessa.Open;

// If Not DMAtualizaEstoques.CDS_EmpProcessa.Active Then
//  DMAtualizaEstoques.CDS_EmpProcessa.Open;

  // Inicia Processamento ======================================================
  DMAtualizaEstoques.CDS_EmpProcessa.First;
  While Not DMAtualizaEstoques.CDS_EmpProcessa.Eof do
  Begin
    // Guarda Momento da Atualiza��o ===========================================
    sgDataAtual:=f_Troca('/','.',f_Troca('-','.',DateToStr(Date)));
    sgHoraAtual:=TimeToStr(Time);

    // Inicializa Vari�veis da Loja ============================================
    Try
     iCodLinx:=DMAtualizaEstoques.CDS_EmpProcessaCOD_LINX.AsInteger;
    Except
      iCodLinx:=0;
    End;
    sDtaLinx      :=DMAtualizaEstoques.CDS_EmpProcessaDTA_INICIO_LINX.AsString;
    sDtaInventLinx:=DMAtualizaEstoques.CDS_EmpProcessaDTA_INVENTARIO_LINX.AsString;

    sCodEmpresa   :=DMAtualizaEstoques.CDS_EmpProcessaCOD_FILIAL.AsString;

// Odir Roda Uma Loja Linx
//    iCodLinx      :=15;
//    sDtaLinx      :='17/03/2017';
//    sDtaInventLinx:='09/05/2017';
//    sCodEmpresa   :='04';

    // =========================================================================
    // LINX SEM INVENTARIO - LINX DIRETO =======================================
    // Atualiza Estoques (LINX) com Movtos Ent/Sai Linx ========================
    // =========================================================================
    sTipo:='';
    bSoAtualMovtoLinx:=False;
    If (iCodLinx<>0) and (sDtaInventLinx='') Then
    Begin
      AtualizaEstoquesMovtosLinx(IntToStr(iCodLinx), sCodEmpresa, sDtaLinx);

      bSoAtualMovtoLinx:=True;
    End; // If (iCodLinx<>0) and (sDtaInventLinx='') Then

    If Not bSoAtualMovtoLinx Then
    Begin
      // =======================================================================
      // SIDICOM DIRETO ========================================================
      // =======================================================================
      bSiga:=True;
      If iCodLinx=0 Then
      Begin
        Try
          If ConexaoEmpIndividual('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, 'A') Then
           Begin
             bSiga:=True;
           End
          Else
           Begin
             bSiga:=False;
           End; // If ConexaoEmpIndividual('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, 'A') Then
        Except
          bSiga:=False;
        End; // Try
      End; // If iCodLinx=0 Then
      // =======================================================================
      // SIDICOM DIRETO ========================================================
      // =======================================================================

      // Entra no Processamento ================================================
      If bSiga Then
      Begin
        // =====================================================================
        // Busca ESTOQUE =======================================================
        // =====================================================================
        DateSeparator:='.';
        DecimalSeparator:='.';

        // =====================================================================
        // SIDICOM DIRETO ======================================================
        // =====================================================================
        If iCodLinx=0 Then
        Begin
          // Cria Query da Empresa --------------------------------------
//odirapagar          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, IBQ_Consulta, False, True);

          If DMAtualizaEstoques.IBQ_EstoqueLoja.Active Then
           DMAtualizaEstoques.IBQ_EstoqueLoja.Close;

          CriaQueryIB('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, DMAtualizaEstoques.IBQ_EstoqueLoja, False, True);

          MySql:=' SELECT'+
                 ' e.codfilial, e.codproduto, e.saldoatual, e.pedidopendente,'+
                 ' e.zonaendereco, e.corredor, e.prateleira, e.gaveta,'+
                 ' e.cusmedvalor, e.customedio, e.lastprecocompra, e.lastcustomedio,'+
                 ' e.estoqueideal, e.estoquemaximo,'+
                 ' e.dataalteracadastro, e.dataalteraestoque, e.dataalteraestoque_ped,'+
                 ' coalesce(p.principalfor,''000000'') principalfor,'+
                 ' e.saldoatual SALDO_FINAL_SIDICOM,'+
                 QuotedStr(sgDataAtual)+' DTA_ATUALIZACAO, '+
                 QuotedStr(sgHoraAtual)+' HRA_ATUALIZACAO'+
                 ' FROM ESTOQUE e'+
                 '      LEFT JOIN PRODUTO p on e.codproduto=p.codproduto'+
                 ' WHERE e.codfilial='+QuotedStr(sCodEmpresa);
          DMAtualizaEstoques.IBQ_EstoqueLoja.Close;
          DMAtualizaEstoques.IBQ_EstoqueLoja.SQL.Clear;
          DMAtualizaEstoques.IBQ_EstoqueLoja.SQL.Add(MySql);

          // Abre Query no Banco de Dados da Loja -----------------------
          i:=0;
          bSiga:=False;
          While Not bSiga do
          Begin
            Try
              DMAtualizaEstoques.IBQ_EstoqueLoja.Open;
              bSiga:=True;
            Except
              Inc(i);

              tgMySqlErro.Add('2 - Loja BelShop: '+sCodEmpresa);
              tgMySqlErro.Add(MySql);
              tgMySqlErro.Add('');
              tgMySqlErro.Add('==================================');
              tgMySqlErro.SaveToFile(sgPath_Local+'ODIR_ERRO.txt');
            End; // Try

            If i>2 Then
             Break;
          End; // While Not bSiga do

          sTipo:='Sdm'; // Sidicom
        End; // If iCodLinx=0 Then
        // =====================================================================
        // SIDICOM DIRETO ======================================================
        // =====================================================================

        // =====================================================================
        // LINX COM INVENTARIO - LINX DIRETO ===================================
        // =====================================================================
        If (iCodLinx<>0) and (sDtaInventLinx<>'') Then
        Begin
          MySql:=' SELECT '+
                 QuotedStr(sCodEmpresa)+' codfilial,'+
                 ' CAST(LPAD(lp.cod_auxiliar,6,0) AS VARCHAR(6)) codproduto,'+
                 ' lpd.quantidade saldoatual, 0.0000 pedidopendente,'+
                 ' 0 zonaendereco, ''000'' corredor, ''000'' prateleira, ''0000'' gaveta,'+
                 ' lpd.custo_medio cusmedvalor, lpd.custo_medio customedio,'+
                 ' COALESCE((SELECT FIRST 1 m.valor_liquido'+
                 '           FROM LINXMOVIMENTO m'+
                 '           WHERE m.empresa = '+IntToStr(iCodLinx)+
                 '           AND   m.operacao = ''E'''+
                 '           AND   ((m.tipo_transacao=''S'') OR (m.tipo_transacao=''E'') OR (m.tipo_transacao IS NULL))'+
                 '           AND   m.cancelado=''N'''+
                 '           AND   m.excluido=''N'''+
                 '           AND   m.cod_produto = lpd.cod_produto'+
                 '           ORDER BY m.data_lancamento DESC), 0.0000) lastprecocompra,'+
                 ' lpd.custo_medio lastcustomedio,'+
                 ' 0 estoqueideal, 0 estoquemaximo,'+
                 ' lp.dt_update dataalteracadastro,'+
                 ' lp.dt_update dataalteraestoque,'+
                 ' lp.dt_update dataalteraestoque_ped,'+
                 ' pr.principalfor principalfor, '+
                 QuotedStr(sgDataAtual)+' DTA_ATUALIZACAO, '+
                 QuotedStr(sgHoraAtual)+' HRA_ATUALIZACAO'+

                 ' FROM LINXPRODUTOSDETALHES lpd'+
                 '          LEFT JOIN LINXPRODUTOS lp ON lp.cod_produto = lpd.cod_produto'+
                 '          LEFT JOIN PRODUTO pr ON pr.codproduto = CAST(LPAD(lp.cod_auxiliar,6,0) AS VARCHAR(6))'+
                 ' WHERE lpd.empresa = '+IntToStr(iCodLinx)+
                 ' AND   lp.cod_auxiliar IS NOT NULL'+
                 ' AND   Char_length(lp.cod_auxiliar)<=6'+

                 ' ORDER BY lp.cod_auxiliar, lpd.quantidade';
          DMAtualizaEstoques.CDS_LojaLinx.Close;
          DMAtualizaEstoques.SDS_LojaLinx.CommandText:=MySql;

          Try
            DMAtualizaEstoques.CDS_LojaLinx.Open;;
          Except
            tgMySqlErro.Add('3 - Loja Linx: '+IntToStr(iCodLinx));
            tgMySqlErro.Add(MySql);
            tgMySqlErro.Add('');
            tgMySqlErro.Add('==================================');
            tgMySqlErro.SaveToFile(sgPath_Local+'ODIR_ERRO.txt');
          End;

          sTipo:='LcI'; // Linx Com Invent�rio
        End; // If (iCodLinx<>0) and (sDtaInventLinx<>'') Then
        // =====================================================================
        // LINX COM INVENTARIO - LINX DIRETO ===================================
        // =====================================================================

        // Processamento =======================================================
        If bSiga Then
        Begin
          Try
            // Verifica se Transa��o esta Ativa
            If DMAtualizaEstoques.SQLC.InTransaction Then
             DMAtualizaEstoques.SQLC.Rollback(TD);

            // Monta Transacao  -------------------------------------
            TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
            TD.IsolationLevel:=xilREADCOMMITTED;
            DMAtualizaEstoques.SQLC.StartTransaction(TD);

            DateSeparator:='.';
            DecimalSeparator:='.';

            // Atualiza Estoques da Loja ----------------------------
            sDML:=' UPDATE OR INSERT INTO ESTOQUE ('+
                  ' CODFILIAL, CODPRODUTO, SALDOATUAL, PEDIDOPENDENTE,'+
                  ' ZONAENDERECO, CORREDOR, PRATELEIRA, GAVETA,'+
                  ' CUSMEDVALOR, CUSTOMEDIO, LASTPRECOCOMPRA, LASTCUSTOMEDIO,'+
                  ' ESTOQUEIDEAL, ESTOQUEMAXIMO,'+
                  ' DATAALTERACADASTRO, DATAALTERAESTOQUE, DATAALTERAESTOQUE_PED,'+
                  ' PRINCIPALFOR,';

                  If iCodLinx=0 Then // Guarda �ltimo Saldo de Estoque no SIDICOM
                   sDML:=
                    sDML+' SALDO_FINAL_SIDICOM,';

            sDML:=
             sDML+' DTA_ATUALIZACAO, HRA_ATUALIZACAO)'+
                  ' VALUES (';

            // Atualiza Estoques da Loja ----------------------------------
            // =================================================================
            // SIDICOM DIRETO ==================================================
            // =================================================================
            If iCodLinx=0 Then
            Begin
              While Not DMAtualizaEstoques.IBQ_EstoqueLoja.Eof do
              Begin
                sValues:='';
                For i:=0 to DMAtualizaEstoques.IBQ_EstoqueLoja.FieldCount-1 do
                Begin
                  // ULTIMO CAMPO - HRA_ATUALIZACAO ============================
                  If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
                  Begin
                    sValues:=
                     sValues+QuotedStr(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString)+')';
                  End // If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then

                  // Grava Resto do Registro ===================================
                  Else
                   Begin
                     If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString)<>'' Then
                      sValues:=
                       sValues+QuotedStr(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].AsString)+', '
                     Else
                      sValues:=
                       sValues+'NULL, ';
                   End;
                End; // For i:=0 to DMAtualizaEstoques.IBQ_EstoqueLoja.FieldCount-1 do

                // UPDATE OR INSERT INTO MCLI ==================================
                MySql:=sDML+sValues+' MATCHING (CODFILIAL, CODPRODUTO)';
                DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

                DMAtualizaEstoques.IBQ_EstoqueLoja.Next;
              End; // While Not DMAtualizaEstoques.IBQ_EstoqueLoja.Eof do
              DMAtualizaEstoques.IBQ_EstoqueLoja.Close;
            End; // If iCodLinx=0 Then
            // =================================================================
            // SIDICOM DIRETO ==================================================
            // =================================================================

            // =================================================================
            // LINX COM INVENTARIO - LINX DIRETO ===============================
            // =================================================================
            If (iCodLinx<>0) And (sDtaInventLinx<>'') Then
            Begin
              While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
              Begin
                If sCodProd=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('CodProduto').AsString Then
                 sQtdSaldo:=CurrToStr(StrToCurr(sQtdSaldo)+DMAtualizaEstoques.CDS_LojaLinx.FieldByName('SaldoAtual').AsCurrency)
                Else
                 sQtdSaldo:=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('SaldoAtual').AsString;

                sValues:='';
                For i:=0 to DMAtualizaEstoques.CDS_LojaLinx.FieldCount-1 do
                Begin
                  // ULTIMO CAMPO - HRA_ATUALIZACAO ============================
                  If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
                   Begin
                     sValues:=sValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)+')';
                   End // If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then

                  // Saldo Saldo do Produto (SALDOATUAL) =======================
                  Else
                  If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='SALDOATUAL' Then
                  Begin
                    sValues:=
                     sValues+QuotedStr(sQtdSaldo)+', ';
                  End // If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then

                  Else
                   Begin
                     // Grava Resto do Registro
                     If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)<>'' Then
                      sValues:=sValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)+', '
                     Else
                      sValues:=sValues+'NULL, ';
                   End;
                End; // For i:=0 to DMAtualizaEstoques.CDS_LojaLinx.FieldCount-1 do

                // UPDATE OR INSERT INTO MCLI ==================================
                MySql:=sDML+sValues+' MATCHING (CODFILIAL, CODPRODUTO)';
                DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

                sCodProd:=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('CodProduto').AsString;

                DMAtualizaEstoques.CDS_LojaLinx.Next;
              End; // While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
              DMAtualizaEstoques.CDS_LojaLinx.Close;
            End; // If (iCodLinx<>0) And (sDtaInventLinx<>'') Then
            // =================================================================
            // LINX COM INVENTARIO - LINX DIRETO ===============================
            // =================================================================

            // Zera Saldo dos Produtos que n�o Foram Utilizados ================
            MySql:=' UPDATE ESTOQUE es'+
                   ' SET es.saldoatual=0.0000'+
                   ' WHERE es.codfilial='+QuotedStr(sCodEmpresa)+
                   ' AND   es.saldoatual<>0.0000'+
                   ' AND   es.dta_atualizacao<'+QuotedStr(sgDataAtual);
            DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

            MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
                   ' VALUES ('+
                   QuotedStr(sCodEmpresa)+', '+
                   IntToStr(iCodLinx)+', '+
                   ' CURRENT_TIMESTAMP,'+
                   QuotedStr(sTipo)+', '+ // Linx Com Invent�rio
                   '''OK'')'+
                   'MATCHING (COD_LOJA)';
            DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

            DMAtualizaEstoques.SQLC.Commit(TD); // Linx Com Invent�rio

            DateSeparator:='/';
            DecimalSeparator:=',';
          Except
            on e : Exception do
            Begin
              DMAtualizaEstoques.SQLC.Rollback(TD); // Linx Com Invent�rio
              DMAtualizaEstoques.IBQ_EstoqueLoja.Close;

              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
              TD.IsolationLevel:=xilREADCOMMITTED;
              DMAtualizaEstoques.SQLC.StartTransaction(TD);

              MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
                     ' VALUES ('+
                     QuotedStr(sCodEmpresa)+', '+
                     IntToStr(iCodLinx)+', '+
                     ' CURRENT_TIMESTAMP,'+
                     QuotedStr(sTipo)+', '+ // Linx Com Invent�rio
                     QuotedStr(e.message+' - '+MySql)+')'+
                     'MATCHING (COD_LOJA)';
              DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

              DMAtualizaEstoques.SQLC.Commit(TD); // Linx Com Invent�rio

              DateSeparator:='/';
              DecimalSeparator:=',';

            End; // on e : Exception do
          End; // Try
        End; // If bSiga Then // Processamento =================================

        DateSeparator:='/';
        DecimalSeparator:=',';

        // Fecha Conex�o =======================================================
        // =====================================================================
        // SIDICOM DIRETO ======================================================
        // =====================================================================
        If iCodLinx=0 Then // SIDICOM
         ConexaoEmpIndividual('IBDB_'+sCodEmpresa, 'IBT_'+sCodEmpresa, 'F');
      End; // If bSiga Then // Entra no Processamento ==========================
    End; // If Not bSoAtualMovtoLinx Then

    DMAtualizaEstoques.CDS_EmpProcessa.Next;
  End; // While Not DMAtualizaEstoques.CDS_EmpProcessa.Eof do
  DMAtualizaEstoques.CDS_EmpProcessa.Close;

  // ===========================================================================
  // Atualiza Saldo LINX Para SIDICOM CD =======================================
  // ===========================================================================
  SaldosTransfere_Linx_Sidicom;
  // Atualiza Saldo LINX Para SIDICOM CD =======================================
  // ===========================================================================

// =============================================================================
// FIM DO PROCESSO =============================================================
// =============================================================================

   Close;
end;

end.
