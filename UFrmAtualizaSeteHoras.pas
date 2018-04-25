unit UFrmAtualizaSeteHoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, IBQuery, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DateUtils,
  Math, WinInet;

type

  TFrmAtualizaSeteHoras = class(TForm)
    Mem_Odir: TMemo;
    procedure FormCreate(Sender: TObject);

    // ODIR ====================================================================

    Procedure Linx_Produtos_Lojas;

    Procedure Demanda4Meses;

    Procedure MontaSqlsSidicomLinx;
    Procedure BuscaMovtosDebCreSIDICOM;
    Procedure BuscaMovtosDebCreLINX;
    Procedure CalculaFluxoCaixaFornecedores(sDt: String=''; sCodForn: String ='');

    Procedure CentroCustos;

    Procedure CodigoBarras;

    Procedure AcertaEstoqueLoja;

    // ODIR ====================================================================

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualizaSeteHoras: TFrmAtualizaSeteHoras;

  bgConexaoLocal: Boolean; // Se Conexão com o Servidor da Matriz é Local - Verifica a Existencia do Arquivo "ConexaoExterna.ini"

  // Cria Ponteiro de transacão
  TD:  TTransactionDesc;
  TD1: TTransactionDesc;

  IBQ_ConsultaFilial: TIBQuery;

  igDiasUteis, igDiasUteis_18: Integer;

  MySqlSelect, MySqlLinx: String;

  sgCompDeb, sgCompCre: String;

  sgDtaInicio, sgDtaFim, sgDtaIniLINX, sgDtaProcCC,
  sgCodForn,
  sgCodEmpLINX, sgCodEmp, sgDesLoja: String;

  bgProcessar,
  bgAchoFornCC: Boolean; // Se Encontrou Fornecedor com Negociação (Hist: 900, 955)

  Flags : Cardinal; // Verifica Internet Ativo - Encerra Necessario

implementation

uses DK_Procs1, UDMConexoes, uj_001, uj_002, UDMAtualizaSeteHoras;

{$R *.dfm}
//==============================================================================
// ODIR - INICIO ===============================================================
//==============================================================================


// Atualiza Produtos Trabalhados Pelas Lojs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.Linx_Produtos_Lojas;

Begin
End; // Atualiza Produtos Trabalhados Pelas Lojs >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Iguala Todos os Produtos de Todas a Lojas com o CD >>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.AcertaEstoqueLoja;
Var
  MySql: String;
  sCodLoja: String;
Begin
  // Verifica se Transação esta Ativa
  If DMAtualizaSeteHoras.SQLC.InTransaction Then
   DMAtualizaSeteHoras.SQLC.Rollback(TD);

  MySql:=' SELECT e.cod_filial'+
         ' FROM EMP_CONEXOES e'+
         ' WHERE e.ind_ativo=''SIM'''+
         ' ORDER BY 1';
  DMAtualizaSeteHoras.CDS_Lojas.Close;
  DMAtualizaSeteHoras.SDS_Lojas.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_Lojas.Open;

  DMAtualizaSeteHoras.CDS_Lojas.DisableControls;
  While Not DMAtualizaSeteHoras.CDS_Lojas.Eof do
  Begin
    // Monta Transacao =========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
    Try // Try da Transação
      DateSeparator:='.';
      DecimalSeparator:='.';

      sCodLoja:=DMAtualizaSeteHoras.CDS_Lojas.FieldByName('Cod_Filial').AsString;

      // Insere Produtos do CD na Loja =========================================
      MySql:=' INSERT INTO ESTOQUE'+
             ' SELECT'+
             QuotedStr(sCodLoja)+' CODFILIAL,'+
             ' e.CODPRODUTO,'+
             ' 0.0000 SALDOATUAL,'+
             ' 0.0000 PEDIDOPENDENTE,'+
             ' 0 ZONAENDERECO,'+
             ' ''000'' CORREDOR,'+
             ' ''000'' PRATELEIRA,'+
             ' ''0000'' GAVETA,'+
             ' 0.00 CUSMEDVALOR,'+
             ' 0.0000 CUSTOMEDIO,'+
             ' 0.0000 LASTPRECOCOMPRA,'+
             ' 0.0000 LASTCUSTOMEDIO,'+
             ' 0.0000 ESTOQUEIDEAL,'+
             ' 0.0000 ESTOQUEMAXIMO,'+
             ' e.DATAALTERACADASTRO,'+
             ' e.DATAALTERAESTOQUE,'+
             ' e.DATAALTERAESTOQUE_PED,'+
             ' e.PRINCIPALFOR,'+
             ' 0.0000 SALDO_FINAL_SIDICOM,'+
             ' e.DTA_ATUALIZACAO,'+
             ' e.HRA_ATUALIZACAO'+

             ' FROM ESTOQUE e'+

             ' WHERE e.codfilial=''99'''+
             ' AND NOT EXISTS (SELECT 1'+
             '                 FROM ESTOQUE e9'+
             '                 WHERE e9.codfilial='+QuotedStr(sCodLoja)+
             '                 AND  e9.codproduto=e.codproduto)';
      DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

      // Exclui Produtos a mais no Cadastro em Relação ao CD ===================
      MySql:=' DELETE FROM ESTOQUE e'+
             ' WHERE e.codfilial='+QuotedStr(sCodLoja)+
             ' AND NOT EXISTS (SELECT 1'+
             '                 FROM ESTOQUE e9'+
             '                 WHERE e9.codfilial=''99'''+
             '                 AND   e9.codproduto=e.codproduto)';
      DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ======================================================
      DMAtualizaSeteHoras.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
    Except // Except da Transação
      on e : Exception do
      Begin
        // Abandona Transacao ====================================================
        DMAtualizaSeteHoras.SQLC.Rollback(TD);

        TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
        TD.IsolationLevel:=xilREADCOMMITTED;
        DMAtualizaSeteHoras.SQLC.StartTransaction(TD);

        MySql:=' INSERT INTO ES_PROCESSADOS  (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
               ' VALUES ('+
               QuotedStr(sCodLoja)+', '+ // COD_LOJA
               '0, '+                    // COD_LINX
               ' CURRENT_TIMESTAMP,'+    // DTA_PROC
               QuotedStr('ERR')+', '+    // Erro AcertaEstoqueLoja
               QuotedStr(MySql)+')'+     // OBS
               'MATCHING (COD_LOJA)';
        DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

        DMAtualizaSeteHoras.SQLC.Commit(TD); // AcertaEstoqueLoja

        DateSeparator:='/';
        DecimalSeparator:=',';
        Exit;
      End; // on e : Exception do
    End; // Try da Transação

    DMAtualizaSeteHoras.CDS_Lojas.Next;
  End; // While Not DMAtualizaSeteHoras.CDS_Lojas.Eof do
  DMAtualizaSeteHoras.CDS_Lojas.EnableControls;
  DMAtualizaSeteHoras.CDS_Lojas.Close;

end; // Igual Todos os Produtos de Todas a Lojas com o CD >>>>>>>>>>>>>>>>>>>>>>

// Busca Codigo de Barras >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.CodigoBarras;
Var
   bSiga: Boolean;
   i: Integer;
   MySql: String;
Begin
  bSiga:=False;
  sgCodEmp:='99';

  // Conecta Loja =======================================================
  If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
   Begin
     // Cria Query da Empresa ------------------------------------
     CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True);
     bSiga:=True;
   End
  Else
   Begin
     bSiga:=False;
   End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

  If bSiga Then
  Begin
    // Abre Query -----------------------------------------------
    i:=0;
    bSiga:=False;
    While Not bSiga do
    Begin
      Try
        MySql:=' SELECT CODBARRA, CODPRODUTO, UNIDADEPORCAIXA, ETIQUETAS_SN'+
               ' FROM PRODUTOSBARRA';
        IBQ_ConsultaFilial.Close;
        IBQ_ConsultaFilial.SQL.Clear;
        IBQ_ConsultaFilial.SQL.Add(MySql);
        IBQ_ConsultaFilial.Open;

        bSiga:=True;
      Except
        Inc(i);
      End; // Try

      If i>2 Then
      Begin
        Break;
      End; // If i>10 Then
    End; // While Not bSiga do

    // Processamento ===========================================================
    If bSiga Then // Query Executada
    Begin
      // Monta Transacao =======================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
      Try
        DateSeparator:='.';
        DecimalSeparator:='.';

        // Exclui Centro de Custos =============================================
        MySql:=' DELETE FROM PRODUTOSBARRA';
        DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

        While Not IBQ_ConsultaFilial.Eof do
        Begin
          // Insere Centro de Custos -------------------------------------------
          MySql:=' INSERT INTO PRODUTOSBARRA'+
                 ' (CODBARRA, CODPRODUTO, UNIDADEPORCAIXA, ETIQUETAS_SN)'+

                 ' VALUES ('+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODBARRA').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODPRODUTO').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('UNIDADEPORCAIXA').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('ETIQUETAS_SN').AsString)+')';
          DMAtualizaSeteHoras.SQLC.Execute(MySql, nil, nil);

          IBQ_ConsultaFilial.Next;
        End; // While Not IBQ_ConsultaFilial.Eof do
        IBQ_ConsultaFilial.Close;

        // Fecha Transacao =================================================
        DMAtualizaSeteHoras.SQLC.Commit(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

      Except
        on e : Exception do
        Begin
          DMAtualizaSeteHoras.SQLC.Rollback(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // on e : Exception do
      End; // Try
    End; // If bSiga Then
    ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F')
  End; // If bSiga Then

end; // Atualiza Centro de Custos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta SQL's Para Busca SIDICOM / LINX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.MontaSqlsSidicomLinx;
Var
  MySql: String;
Begin
  //============================================================================
  // Monta Select de Busca de Débitos e Créditos (SIDICOM) =====================
  MySqlSelect:=' SELECT'+
               ' mf.codfornecedor,'+
               ' f.nomefornecedor,'+
               ' REPLACE(REPLACE(REPLACE(TRIM(f.numerocgcmf), ''/'', ''''),''.'',''''),''-'','''') Doc_Forn,'+
               ' mf.datacomprovante,'+
               ' mf.dataentrada,'+
               ' mf.codcomprovante,'+

               ' CASE'+
               '   WHEN mf.codcomprovante IN ('+sgCompCre+') Then'+
               '    ''C'''+
               '   WHEN mf.codcomprovante IN ('+sgCompDeb+') Then'+
               '    ''D'''+
               ' End Tp_DebCre,'+

               ' mf.codfilial,'+

               // OdirApagar - 04/09/02017
               // ' mf.observacao,'+
               ' NULL observacao,'+

               ' TRIM(mf.chavenf) chavenf,'+
               ' CAST(SUBSTRING(mf.numero FROM 1 FOR 12) AS VARCHAR(12)) numero,'+
               ' Trim(mf.serie) serie,'+
               ' ABS(COALESCE(mf.totnota,0.00)) Vlr_Total'+

               ' FROM MFOR mf, FORNECED f'+
               ' WHERE  mf.codfornecedor=f.codfornecedor'+
               ' AND    mf.codfilial=:CodLoja'+
               ' AND    mf.codcomprovante in ('+sgCompCre+', '+sgCompDeb+')'+
               ' AND    mf.dataentrada>='+QuotedStr(sgDtaInicio);

               If Trim(sgCodForn)<>'' Then
                MySqlSelect:=
                 MySqlSelect+' AND mf.codfornecedor = :CodForn';

  MySqlSelect:=
   MySqlSelect+' ORDER BY mf.codfornecedor, mf.dataentrada';
  // Monta Select de Busca de Debitos e Créditos (SIDICOM) =====================
  //============================================================================

  //============================================================================
  // Monta Select de Busca de Debitos e Créditos (LINX) ========================
  //============================================================================

  //----------------------------------------------------------------------------
  // DEVOLUÇÕES – Devolução de Saída de Entrada de Fornecedor ------------------
  //----------------------------------------------------------------------------
  // OPERACAO	    TIPO_TRANSACAO	CFOP	DESC_CFOP
  // DE	(Saída)         Null            5411	Devolução de compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária
  // DE (Saída)         Null            6411	Devolução de compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária

  // Não Existe Devolução de Entrada para Fornecedor
  //------------------------------------------------
  // DS (Entrada)	Null            1202	Devolução de venda de mercadoria adquirida ou recebida de terceiros
  // DS (Entrada)	Null            1411	Devolução de venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária
  // DS (Entrada)	Null            2411	Devolução de venda de mercadoria adquirida ou recebida de terceiros em operação com mercadoria sujeita ao regime de substituição tributária
  //----------------------------
  // COMPROVANTES
  //----------------------------
  // 011	DEVOLUÇÃO A FORNECEDOR - Débito
  //----------------------------

  //----------------------------------------------------------------------------
  // CONSERTOS - Consertos de  Saída de Entrada de Fornecedor ------------------
          //----------------------------------------------------------------------------
  // OPERACAO	    TIPO_TRANSACAO	CFOP	DESC_CFOP
  // N	(Entrada)	      E		1915	Entrada de mercadoria ou bem recebido para conserto ou reparo
  // N	(Entrada)	      E		2915	Entrada de mercadoria ou bem recebido para conserto ou reparo
  // N	(Saída)		      S		5915	Remessa de mercadoria ou bem para conserto ou reparo
  // N	(Saída)		      S		6915	Remessa de mercadoria ou bem para conserto ou reparo
  //----------------------------
  // COMPROVANTES
  //----------------------------
  // 048	ENTRADA DE CONSERTO    - Crédito
  // 042	REMESSSA PARA CONSERTO - Débito
  //----------------------------

  //----------------------------------------------------------------------------
  // BONIFICAÇÕES - Bonificações de  Saída de Entrada de Fornecedor ------------
  //----------------------------------------------------------------------------
  // OPERACAO	TIPO_TRANSACAO	CFOP	DESC_CFOP
  // E	(Entrada)       Null	1910	Entrada de bonificação, doação ou brinde
  // E	(Entrada)       Null  	2910	Entrada de bonificação, doação ou brinde
  // S	(Saída)		Null    5910	Remessa em bonificação, doação ou brinde
  // S	(Saída)		Null    6910	Remessa em bonificação, doação ou brinde
  //----------------------------
  // COMPROVANTES
  //----------------------------
  // 027	REMESSA DE BONIFICAÇÃO - Débito
  // 913	BONIF DE MERCADORIAS	 - Crédito
  // 916	BONIF DE MERCADORIAS	 - Crédito
  //----------------------------------------------------------------------------


  // Saida - DEVOLUÇÕES – Devolução de Saída de Entrada de Fornecedor ------------------
  // 5411 - Devolução de compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária
  // 6411 - Devolução de compra para comercialização em operação com mercadoria sujeita ao regime de substituição tributária
  MySqlLinx:=' SELECT'+
             ' fl.cod_cliente codfornecedor,'+
             ' fl.nome_cliente nomefornecedor,'+
             ' CAST(ml.data_documento AS DATE) datacomprovante,'+
             ' CAST(ml.data_lancamento AS DATE) dataentrada,'+
             ' ''011'' codcomprovante,'+
             ' ''D'' tp_debcre,'+
             ' ml.empresa codfilial,'+
             // OdirApagar - 04/09/02017
             // ' CAST(SUBSTRING(ml.obs FROM 1 FOR 200) AS VARCHAR(200)) observacao,'+
             ' NULL observacao,'+

             ' TRIM(ml.chave_nf) chavenf,'+
             ' CAST(SUBSTRING(ml.documento FROM 1 FOR 12) AS VARCHAR(12)) numero,'+
             ' CAST(TRIM(ml.serie) AS VARCHAR(4)) serie,'+
             ' CAST((ROUND((SUM(ml.valor_total)), 2)) AS NUMERIC(18,2)) vlr_total,'+
             ' fs.codfornecedor Cod_Forn_Sidicom'+

             ' FROM LINXMOVIMENTO ml'+
             '      LEFT JOIN LINXCLIENTESFORNEC fl  ON fl.cod_cliente = ml.codigo_cliente'+
             '                                      AND fl.tipo_cliente IN (''A'', ''F'')'+
             '      LEFT JOIN FORNECEDOR fs ON REPLACE(REPLACE(REPLACE(TRIM(fs.numerocgcmf), ''/'', ''''), ''.'', ''''), ''-'', '''') ='+
             '                                 REPLACE(REPLACE(REPLACE(TRIM(fl.doc_cliente), ''/'', ''''), ''.'', ''''), ''-'', '''')'+

             ' WHERE ml.operacao = ''DE'''+ // Saida de Devolução de Entrada
             ' AND   ml.tipo_transacao IS NULL'+
             ' AND   ml.cancelado = ''N'''+
             ' AND   ml.excluido = ''N'''+
             ' AND   TRIM(ml.id_cfop) IN (''5411'', ''6411'')'+
             ' AND   fl.cod_cliente is not null'+

             ' AND   ml.empresa = :CodEmpLINX'+
             ' AND   CAST(ml.data_lancamento AS DATE) >= :DtaInicioLinx';

             If Trim(sgCodForn)<>'' Then
              MySql:=
                MySql+' AND   ml.codigo_cliente = :CodForn';
  MySqlLinx:=
   MySqlLinx+' GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13'+

             ' UNION'+ // <<====

             // E - Operações ee Entrada de Mercadorias por Bonificações de Fornecedor
             //-----------------------------------------------------------------------
             // 1910	- Entrada de bonificação, doação ou brinde
             // 2910	- Entrada de bonificação, doação ou brinde

             // S - Operações ee Saida   de Mercadorias por Bonificações de Fornecedor
             //-----------------------------------------------------------------------
             // 5910	- Remessa em bonificação, doação ou brinde
             // 6910	- Remessa em bonificação, doação ou brinde

             ' SELECT'+
             ' fl.cod_cliente codfornecedor,'+
             ' fl.nome_cliente nomefornecedor,'+
             ' CAST(ml.data_documento AS DATE) datacomprovante,'+
             ' CAST(ml.data_lancamento AS DATE) dataentrada,'+

             ' CASE'+
             '   WHEN (TRIM(ml.id_cfop) = ''1910'') OR (TRIM(ml.id_cfop) = ''2910'') THEN'+
             '     ''913'''+
             '   WHEN (TRIM(ml.id_cfop) = ''5910'') OR (TRIM(ml.id_cfop) = ''6910'') THEN'+
             '     ''027'''+
             ' END codcomprovante,'+

             ' CASE'+
             '   WHEN (TRIM(ml.id_cfop) = ''1910'') OR (TRIM(ml.id_cfop) = ''2910'') THEN'+
             '     ''C'''+
             '   WHEN (TRIM(ml.id_cfop) = ''5910'') OR (TRIM(ml.id_cfop) = ''6910'') THEN'+
             '     ''D'''+
             ' END tp_debcre,'+

             ' ml.empresa codfilial,'+

             // OdirApagar - 04/09/02017
             // ' CAST(SUBSTRING(ml.obs FROM 1 FOR 200) AS VARCHAR(200)) observacao,'+
             ' NULL observacao,'+

             ' TRIM(ml.chave_nf) chavenf,'+
             ' CAST(SUBSTRING(ml.documento FROM 1 FOR 12) AS VARCHAR(12)) numero,'+
             ' CAST(TRIM(ml.serie) AS VARCHAR(4)) serie,'+
             ' CAST((ROUND((SUM(ml.valor_total)), 2)) AS NUMERIC(18,2)) vlr_total,'+
             ' fs.codfornecedor Cod_Forn_Sidicom'+

             ' FROM LINXMOVIMENTO ml'+
             '      LEFT JOIN linxclientesfornec fl  ON fl.cod_cliente = ml.codigo_cliente'+
             '                                      AND fl.tipo_cliente IN (''A'', ''F'')'+
             '      LEFT JOIN fornecedor fs ON REPLACE(REPLACE(REPLACE(TRIM(fs.numerocgcmf), ''/'', ''''), ''.'', ''''), ''-'', '''') ='+
             '                                 REPLACE(REPLACE(REPLACE(TRIM(fl.doc_cliente), ''/'', ''''), ''.'', ''''), ''-'', '''')'+

             ' WHERE ml.cancelado = ''N'''+
             ' AND   ml.excluido = ''N'''+
             ' AND   COALESCE(ml.tipo_transacao, '''') <> ''J'''+ // NÃO Pode Ajustes de Estoques

             ' AND   ('+
             '        ((TRIM(ml.id_cfop) IN (''1910'', ''2910''))'+
             '          AND'+
             '         (ml.operacao = ''E''))'+ // Operação de Entrada de Mercadorias Bonificadas
             '       OR'+
             '        ((TRIM(ml.id_cfop) IN (''5910'', ''6910''))'+
             '          AND (ml.operacao = ''S''))'+ // Operação de Saida de Mercadorias Bonificadas
             '      )'+
             ' AND   fl.cod_cliente is not null'+

             ' AND   CAST(ml.data_lancamento AS DATE) >= :DtaInicioLinx'+
             ' AND   ml.empresa = :CodEmpLinx';

             If Trim(sgCodForn)<>'' Then
              MySql:=
                MySql+' AND   ml.codigo_cliente = :CodForn';

  MySqlLinx:=
   MySqlLinx+' GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13'+
             ' ORDER BY 1, 4';
  // Monta Select de Busca de Debitos e Créditos (LINX) ========================
  //============================================================================

end; // Monta SQL's Para Busca SIDICOM / LINX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Centro de Custos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.CentroCustos;
Var
   bSiga: Boolean;
   i: Integer;
   MySql: String;
Begin
  bSiga:=False;
  sgCodEmp:='99';

  // Conecta Loja =======================================================
  If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
   Begin
     // Cria Query da Empresa ------------------------------------
     CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True);
     bSiga:=True;
   End
  Else
   Begin
     bSiga:=False;
   End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

  If bSiga Then
  Begin
    // Abre Query -----------------------------------------------
    i:=0;
    bSiga:=False;
    While Not bSiga do
    Begin
      Try
        MySql:=' SELECT S.CODCENTROCUSTO, S.CODCUSTO, C.NOMECUSTO,'+
               '        S.CODSUBCUSTO, S.NOMESUBCUSTO'+
               ' FROM CUSTO C, CUSTOSUB S'+
               ' WHERE C.CODCUSTO = S.CODCUSTO';
        IBQ_ConsultaFilial.Close;
        IBQ_ConsultaFilial.SQL.Clear;
        IBQ_ConsultaFilial.SQL.Add(MySql);
        IBQ_ConsultaFilial.Open;

        bSiga:=True;
      Except
        Inc(i);
      End; // Try

      If i>2 Then
      Begin
        Break;
      End; // If i>10 Then
    End; // While Not bSiga do

    // Processamento ===========================================================
    If bSiga Then // Query Executada
    Begin
      // Monta Transacao =======================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
      Try
        DateSeparator:='.';
        DecimalSeparator:='.';

        // Exclui Centro de Custos =============================================
        MySql:=' DELETE FROM CENTROCUSTO';
        DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

        While Not IBQ_ConsultaFilial.Eof do
        Begin
          // Insere Centro de Custos -------------------------------------------
          MySql:=' INSERT INTO CENTROCUSTO ('+
                 ' CODCENTROCUSTO, CODCUSTO, NOMECUSTO, CODSUBCUSTO, NOMESUBCUSTO)'+

                 ' VALUES ('+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODCENTROCUSTO').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODCUSTO').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('NOMECUSTO').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODSUBCUSTO').AsString)+', '+
                 QuotedStr(IBQ_ConsultaFilial.FieldByName('NOMESUBCUSTO').AsString)+')';
          DMAtualizaSeteHoras.SQLC.Execute(MySql, nil, nil);

          IBQ_ConsultaFilial.Next;
        End; // While Not IBQ_ConsultaFilial.Eof do
        IBQ_ConsultaFilial.Close;

        // Fecha Transacao =================================================
        DMAtualizaSeteHoras.SQLC.Commit(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

      Except
        on e : Exception do
        Begin
          DMAtualizaSeteHoras.SQLC.Rollback(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // on e : Exception do
      End; // Try
    End; // If bSiga Then
    ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F')
  End; // If bSiga Then

end; // Atualiza Centro de Custos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Calcula Demanda de 4 Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.Demanda4Meses;
Var
  MySql: String;
  dDtaHoje, dDtaInicio, dDtaFim, dDtaCalculo: TDate;
  sMes1, sMes2, sMes3, sMes4, sMes5: String;
  i, ii: Integer;
  e: Extended;
Begin
  dDtaHoje  :=DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor);
  dDtaInicio:=IncMonth(dDtaHoje,-4);
  dDtaInicio:=PrimUltDia(dDtaInicio,'P');
  dDtaFim   :=dDtaHoje-1;

  sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',DateToStr(dDtaInicio)));
  sgDtaFim   :=f_Troca('/','.',f_Troca('-','.',DateToStr(dDtaFim)));

  igDiasUteis   :=DiasUteisBelShop(dDtaInicio, dDtaFim, False, True);
  igDiasUteis_18:=DiasUteisBelShop(StrToDate('13/12/2016'), dDtaFim, False, True);

  // Calcula os Meses de Demandas Vendas =======================================
  i:=0;
  dDtaCalculo:=dDtaInicio;
  while dDtaCalculo<=dDtaFim do
  Begin
    Inc(i);
    if i=1 Then sMes1:=FormatFloat('00',MonthOf(dDtaCalculo));
    if i=2 Then sMes2:=FormatFloat('00',MonthOf(dDtaCalculo));
    if i=3 Then sMes3:=FormatFloat('00',MonthOf(dDtaCalculo));
    if i=4 Then sMes4:=FormatFloat('00',MonthOf(dDtaCalculo));
    if i=5 Then sMes5:=FormatFloat('00',MonthOf(dDtaCalculo));

    dDtaCalculo:=IncMonth(dDtaCalculo,1);
  End;

  // Verifica se Transação esta Ativa
  If DMAtualizaSeteHoras.SQLC.InTransaction Then
   DMAtualizaSeteHoras.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    MySql:=' DELETE FROM ES_DEMANDAS_4MESES';
    DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

    MySql:=' INSERT INTO ES_DEMANDAS_4MESES'+
           ' SELECT dem.codfilial, dem.codproduto,'+

           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+QuotedStr(sMes1)+' Then'+
           '       CAST(dem.quant_ref AS INTEGER)'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS INTEGER) qtd_venda_M1,'+

           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+QuotedStr(sMes2)+' Then'+
           '       CAST(dem.quant_ref AS INTEGER)'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS INTEGER) qtd_venda_M2,'+

           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+QuotedStr(sMes3)+' Then'+
           '       CAST(dem.quant_ref AS INTEGER)'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS INTEGER) qtd_venda_M3,'+

           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+QuotedStr(sMes4)+' Then'+
           '       CAST(dem.quant_ref AS INTEGER)'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS INTEGER) qtd_venda_M4,'+

           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+QuotedStr(sMes5)+' Then'+
           '       CAST(dem.quant_ref AS INTEGER)'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS INTEGER) qtd_venda_M5,'+

           ' CAST(SUM(dem.quant_ref) AS INTEGER) qtd_venda,'+

           ' CASE'+
           '   WHEN dem.codfilial=''18'' THEN'+
           '     CAST((SUM(CAST(dem.quant_ref AS NUMERIC(12,4))) / '+IntToStr(igDiasUteis_18)+') AS NUMERIC(12,4))'+
           '   Else'+
           '     CAST((SUM(CAST(dem.quant_ref AS NUMERIC(12,4))) / '+IntToStr(igDiasUteis)+') AS NUMERIC(12,4))'+
           ' End  qtd_venda_dia,'+

           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+QuotedStr(sMes1)+' Then'+
           '       CAST(dem.preco AS NUMERIC(12,2))'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS NUMERIC(12,2)) vlr_venda_M1,'+

           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+QuotedStr(sMes2)+' Then'+
           '       CAST(dem.preco AS NUMERIC(12,2))'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS NUMERIC(12,2)) vlr_venda_M2,'+

           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+QuotedStr(sMes3)+' Then'+
           '       CAST(dem.preco AS NUMERIC(12,2))'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS NUMERIC(12,2)) vlr_venda_M3,'+

           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+QuotedStr(sMes4)+' Then'+
           '       CAST(dem.preco AS NUMERIC(12,2))'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS NUMERIC(12,2)) vlr_venda_M4,'+

           ' CAST(SUM('+
           '   CASE'+
           '     When Cast(lpad(extract(month from dem.dta_ref),2,''0'') as varchar(2))='+QuotedStr(sMes5)+' Then'+
           '       CAST(dem.preco AS NUMERIC(12,2))'+
           '     Else'+
           '       0'+
           '   End)'+
           ' AS NUMERIC(12,2)) vlr_venda_M5,'+

           ' CAST(SUM(dem.preco) AS NUMERIC(12,2)) vlr_venda,'+

           ' case'+
           '   when dem.codfilial=''18'' Then'+
           '      CAST((SUM(CAST(dem.preco AS NUMERIC(12,4))) / '+IntToStr(igDiasUteis_18)+') AS NUMERIC(12,2))'+
           '   Else'+
           '      CAST((SUM(CAST(dem.preco AS NUMERIC(12,4))) / '+IntToStr(igDiasUteis)+') AS NUMERIC(12,2))'+
           ' End vlr_venda_dia,'+

           ' '+QuotedStr(sgDtaInicio)+' periodo_inicio,'+
           ' '+QuotedStr(sgDtaFim)+'    periodo_fim,'+

           ' case'+
           '   when dem.codfilial=''18'' Then'+
           '      '+IntToStr(igDiasUteis_18)+
           '   Else'+
           '      '+IntToStr(igDiasUteis)+
           ' End dias_uteis,'+

           ' CURRENT_DATE dta_atualizacao,'+
           ' CURRENT_TIME hra_atualizacao'+

           ' FROM MOVTOS_EMPRESAS dem'+
           ' WHERE dem.ind_tipo = ''DM'''+
           ' AND   dem.dta_ref >= '+QuotedStr(sgDtaInicio)+
           ' AND   dem.dta_ref <='+QuotedStr(sgDtaFim)+
           ' GROUP BY 1, 2';
    DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMAtualizaSeteHoras.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMAtualizaSeteHoras.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
    End; // on e : Exception do
  End; // Try

End; // Calcula Demanda de 4 Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//000000000000000000000000000000000000000000000000000000000000000000000000000000
// Busca Movtos de Debito/Credito de Fornecedores LINX >>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.BuscaMovtosDebCreLINX;
Var
   i: Integer;
   MySql: String;
   sCodFornLINX, sNomeFornLINX,
   sNumSeq, sPercRed,
   sDtaMovtoLinx: String;
Begin

  // Acerta Data do Movto em Relação a Data de Início da Loja ==================
  sDtaMovtoLinx:=sgDtaIniLINX;

//opss
  If StrToDate(f_Troca('.','/',f_Troca('-','/',sDtaMovtoLinx)))<StrToDate(f_Troca('.','/',f_Troca('-','/',sgDtaInicio))) Then
   sDtaMovtoLinx:=sgDtaInicio;

  sDtaMovtoLinx:=f_Troca('/','.',f_Troca('-','.',sDtaMovtoLinx));

  // Acerta Data de Processamento das Conta Correntes ==========================
  If StrToDate(f_Troca('.','/',f_Troca('-','/',sgDtaProcCC)))>StrToDate(f_Troca('.','/',f_Troca('-','/',sDtaMovtoLinx))) Then
   sgDtaProcCC:=sDtaMovtoLinx;

  // Busca Movtos Debitos / Creditos ===========================================
  DMAtualizaSeteHoras.CDS_MovtoLinx.Close;
  DMAtualizaSeteHoras.SDS_MovtoLinx.CommandText:=MySqlLinx;
  DMAtualizaSeteHoras.SDS_MovtoLinx.Params.ParamByName('CodEmpLINX').AsString:=sgCodEmpLINX;
  DMAtualizaSeteHoras.SDS_MovtoLinx.Params.ParamByName('DtaInicioLinx').AsString:=sDtaMovtoLinx;
  If Trim(sgCodForn)<>'' Then
   DMAtualizaSeteHoras.CDS_MovtoLinx.Params.ParamByName('CodForn').AsString:=sgCodForn;
  DMAtualizaSeteHoras.CDS_MovtoLinx.Open;

  If Trim(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('codfornecedor').AsString)='' Then
  Begin
    DMAtualizaSeteHoras.CDS_MovtoLinx.Close;
    Exit;
  End;

  // Monta Transacao =======================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Guarda Codigo do Fornecedor =========================================
    // Exclui Lançamentos para Substituição e Inclução =========================
    MySql:=' SELECT DISTINCT f.cod_fornecedor'+
           ' FROM FL_CAIXA_FORNECEDORES f'+
           ' WHERE f.cod_empresa='+QuotedStr(sgCodEmpLINX)+
           ' AND   f.dta_caixa>='+QuotedStr(sDtaMovtoLinx);

           If Trim(sgCodForn)<>'' Then
            MySql:=
             MySql+' AND f.cod_fornecedor in ('+QuotedStr(sgCodForn)+')';
    DMAtualizaSeteHoras.CDS_Busca.Close;
    DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
    DMAtualizaSeteHoras.CDS_Busca.Open;

    While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
    Begin
      sCodFornLINX:=DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_fornecedor').AsString;

      // Guarda Fornecedor a Processar Conta Correte ------------
      bgProcessar:=True;
      For i:=0 to Mem_Odir.Lines.Count-1 do
      Begin
         If Mem_Odir.Lines[i]=sCodFornLINX Then
         Begin
           bgProcessar:=False;
           Break;
         End;
      End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do

      If bgProcessar Then
      Begin
        Mem_Odir.Lines.Add(sCodFornLINX);
      End;

      // Exclui Lançamentos para Substituição e Inclução ------
      MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES f'+
             ' WHERE f.cod_fornecedor = '+QuotedStr(sCodFornLINX)+
             ' AND   f.dta_caixa>='+QuotedStr(sDtaMovtoLinx)+
             ' AND ((f.cod_historico=0 or f.cod_historico=999999)'+
             '      OR'+
             '      (f.cod_empresa='+QuotedStr(sgCodEmpLINX)+'))'+
             ' AND  f.cod_historico not in (900,955)';
      DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

      DMAtualizaSeteHoras.CDS_Busca.Next;
    End; // While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
    DMAtualizaSeteHoras.CDS_Busca.Close;

    sgDtaFim     :='';
    sCodFornLINX :='';
    sNomeFornLINX:='';
    While Not DMAtualizaSeteHoras.CDS_MovtoLinx.Eof do
    Begin
      sgDtaFim     :=DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('dataentrada').AsString;
      sCodFornLINX :=DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('codfornecedor').AsString;
      sNomeFornLINX:=DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('nomefornecedor').AsString;

      // Verifica se Tem Historico de Negociação (900, 955) ---
      MySql:=' SELECT FIRST 1 f.cod_fornecedor'+
             ' FROM FL_CAIXA_FORNECEDORES f'+
             ' WHERE f.cod_historico  in (900,955)'+
             ' AND   f.cod_fornecedor='+sCodFornLINX;
      DMAtualizaSeteHoras.CDS_Busca.Close;
      DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
      DMAtualizaSeteHoras.CDS_Busca.Open;
      bgAchoFornCC:=True;
      If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_fornecedor').AsString)='' Then
       bgAchoFornCC:=False;
      DMAtualizaSeteHoras.CDS_Busca.Close;

      //========================================================================
      If bgAchoFornCC Then
      Begin
        // Busca Num_Seq do Dia do Fornecedor -----------------------
        MySql:=' SELECT cf.num_seq'+
               ' FROM FL_CAIXA_FORNECEDORES cf'+
               ' WHERE cf.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaFim)))+
               ' AND   cf.cod_fornecedor='+QuotedStr(sCodFornLINX)+
               ' AND   cf.num_seq>0'+
               ' AND   cf.num_seq<999999'+
               ' ORDER BY cf.Num_Seq';
        DMAtualizaSeteHoras.CDS_Busca.Close;
        DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
        DMAtualizaSeteHoras.CDS_Busca.Open;
        i:=1;
        sNumSeq:=IntToStr(DMAtualizaSeteHoras.CDS_Busca.RecordCount+1);
        While not DMAtualizaSeteHoras.CDS_Busca.Eof do
        Begin
          If DMAtualizaSeteHoras.CDS_Busca.RecNo<>DMAtualizaSeteHoras.CDS_Busca.FieldByName('Num_Seq').AsInteger Then
          Begin
            sNumSeq:=IntToStr(DMAtualizaSeteHoras.CDS_Busca.RecNo);
            Break;
          End;

          DMAtualizaSeteHoras.CDS_Busca.Next;
        End; // While not DMAtualizaSeteHoras.CDS_Busca.Eof do
        DMAtualizaSeteHoras.CDS_Busca.Close;

        // Busca Percentual de Redução ------------------------------
        MySql:=' SELECT r.per_reducao'+
               ' FROM FL_CAIXA_PERC_REDUCAO r'+
               ' WHERE r.cod_fornecedor ='+sCodFornLINX+
               ' AND   r.cod_comprovante='+QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('CODCOMPROVANTE').AsString)+
               ' AND   CAST('+QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('DATAENTRADA').AsString)+' AS DATE)'+
               '                 BETWEEN r.dta_incio AND COALESCE(r.dta_fim, CAST(''31.12.3000'' AS DATE))';
        DMAtualizaSeteHoras.CDS_Busca.Close;
        DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
        DMAtualizaSeteHoras.CDS_Busca.Open;
        sPercRed:='0.00';
        If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('per_reducao').AsString)<>'' Then
         sPercRed:=f_Troca(',','.',DMAtualizaSeteHoras.CDS_Busca.FieldByName('per_reducao').AsString);
        DMAtualizaSeteHoras.CDS_Busca.Close;

        // Insere Caixa ---------------------------------------------
        MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES ('+
               ' COD_FORNECEDOR, DES_FORNECEDOR, VLR_ORIGEM, DTA_ORIGEM, DTA_CAIXA, NUM_SEQ,'+
               ' NUM_CHAVENF, COD_EMPRESA, COD_HISTORICO, TXT_OBS,'+
               ' NUM_DOCUMENTO, NUM_SERIE, PER_REDUCAO, TIP_DEBCRE, VLR_CAIXA, VLR_SALDO,'+
               ' CODFORNECEDOR, COD_LOJA_LINX, COD_LOJA_SIDICOM)'+
               ' VALUES ('+
               sCodFornLINX+', '+ // COD_FORNECEDOR (LINX)
               QuotedStr(sNomeFornLINX)+', '+ // DES_FORNECEDOR (LINX)
               DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('VLR_TOTAL').AsString+', '+ // VLR_ORIGEM
               QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('DATACOMPROVANTE').AsString)+', '+ // DTA_ORIGEM
               QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('DATAENTRADA').AsString)+', '+ // DTA_CAIXA
               sNumSeq+', '+ // NUM_SEQ
               QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('CHAVENF').AsString)+', '+ // NUM_CHAVENF
               QuotedStr(sgCodEmpLINX)+', '+ // COD_EMPRESA
               QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('CODCOMPROVANTE').AsString)+', '+ // COD_HISTORICO,
               QuotedStr(AnsiUpperCase(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('OBSERVACAO').AsString))+', '+ // TXT_OBS
               QuotedStr(Trim(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('NUMERO').AsString))+', '+ // NUM_DOCUMENTO
               QuotedStr(Trim(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('SERIE').AsString))+', '+ // NUM_SERIE
               sPercRed+', '+ // PER_REDUCAO,
               QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('TP_DEBCRE').AsString)+', '+ // TIP_DEBCRE
               'CAST(('+DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('VLR_TOTAL').AsString+
                      '-(('+sPercRed+' * '+DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('VLR_TOTAL').AsString+
                      ') / 100)) AS NUMERIC(12,2)),'+ // VLR_CAIXA
               ' 0.00,'+ // VLR_SALDO
               QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('Cod_Forn_Sidicom').AsString)+', '+ // CODFORNECEDOR VARCHAR(6)
               QuotedStr(sgCodEmpLINX)+', '+ // COD_LOJA_LINX INTEGER
               QuotedStr(sgCodEmp)+')'; // COD_LOJA_SIDICOM VARCHAR(2)
        DMAtualizaSeteHoras.SQLC.Execute(MySql, nil, nil);

        // Guarda Fornecedor a Processar Conta Correte --------------
        bgProcessar:=True;
        For i:=0 to Mem_Odir.Lines.Count-1 do
        Begin
           If Mem_Odir.Lines[i]=sCodFornLINX Then
           Begin
             bgProcessar:=False;
             Break;
           End;
        End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do

        If bgProcessar Then
        Begin
          Mem_Odir.Lines.Add(sCodFornLINX);
        End;
      End; // If bgAchoFornCC Then
      //========================================================================

      DMAtualizaSeteHoras.CDS_MovtoLinx.Next;
    End; // While Not DMAtualizaSeteHoras.CDS_MovtoLinx.Eof do
    DMAtualizaSeteHoras.CDS_MovtoLinx.Close;

    // Fecha Transacao =================================================
    DMAtualizaSeteHoras.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
    Screen.Cursor:=crDefault;

  Except
    on e : Exception do
    Begin
      DMAtualizaSeteHoras.SQLC.Rollback(TD);

      // Monta Transacao ===========================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaSeteHoras.SQLC.StartTransaction(TD);

      MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
             ' VALUES ('+
             QuotedStr('80')+', '+
             '2, '+
             ' CURRENT_TIMESTAMP,'+
             QuotedStr('LPr')+', '+ // Linx Com Inventário
             QuotedStr('ListPreco'+e.message+' - '+MySql)+')'+
             'MATCHING (COD_LOJA)';
      DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

      DMAtualizaSeteHoras.SQLC.Commit(TD); // Linx Com Inventário

      DateSeparator:='/';
      DecimalSeparator:=',';
    End; // on e : Exception do
  End; // Try

end; // Busca Movtos de Debito/Credito de Fornecedores LINX >>>>>>>>>>>>>>>>>>>>

//000000000000000000000000000000000000000000000000000000000000000000000000000000
// Busca Movtos de Debito/Credito de Fornecedores SIDICOM >>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.BuscaMovtosDebCreSIDICOM;
Var
   bSiga: Boolean;
   i: Integer;
   MySql: String;
   sCodForn, sDocForn,
   sCodFornLINX, sNomeFornLINX,
   sNumSeq, sPercRed: String;
Begin
  bSiga:=False;

  // Conecta Loja =======================================================
  If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
   Begin
     // Cria Query da Empresa ------------------------------------
     CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True);
     bSiga:=True;
   End
  Else
   Begin
     bSiga:=False;
   End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then

  If bSiga Then
  Begin
    // Busca Movtos Debitos / Creditos =========================================
    i:=0;
    bSiga:=False;
    While Not bSiga do
    Begin
      Try
        IBQ_ConsultaFilial.Close;
        IBQ_ConsultaFilial.SQL.Clear;
        IBQ_ConsultaFilial.SQL.Add(MySqlSelect);
        IBQ_ConsultaFilial.ParamByName('CodLoja').AsString:=sgCodEmp;

        If Trim(sgCodForn)<>'' Then
         IBQ_ConsultaFilial.ParamByName('CodForn').AsString:=sgCodForn;

        IBQ_ConsultaFilial.Open;

        bSiga:=True;
      Except
        Inc(i);
      End; // Try

      If i>2 Then
      Begin
        Break;
      End; // If i>10 Then
    End; // While Not bSiga do

    // Processamento ===========================================================
    If bSiga Then // Query Executada
    Begin
      // Monta Transacao =======================================================
      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
      Try
        DateSeparator:='.';
        DecimalSeparator:='.';

        // Guarda Codigo do Fornecedor =========================================
        // Exclui Lançamentos para Substituição e Inclução =====================
        MySql:=' SELECT DISTINCT f.cod_fornecedor'+
               ' FROM FL_CAIXA_FORNECEDORES f'+
               ' WHERE f.cod_loja_sidicom='+QuotedStr(sgCodEmp)+
               ' AND   f.dta_caixa>='+QuotedStr(sgDtaInicio);

               If Trim(sgCodForn)<>'' Then
                MySql:=
                 MySql+' AND f.cod_fornecedor in ('+QuotedStr(sgCodForn)+')';
        DMAtualizaSeteHoras.CDS_Busca.Close;
        DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
        DMAtualizaSeteHoras.CDS_Busca.Open;

        While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
        Begin
          sCodForn:=DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_fornecedor').AsString;

          // Guarda Fornecedor a Processar Conta Correte ------------
          bgProcessar:=True;
          For i:=0 to Mem_Odir.Lines.Count-1 do
          Begin
             If Mem_Odir.Lines[i]=sCodForn Then
             Begin
               bgProcessar:=False;
               Break;
             End;
          End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do

          If bgProcessar Then
          Begin
            Mem_Odir.Lines.Add(sCodForn);
          End;

          // Exclui Lançamentos para Substituição e Inclução ------
          MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES f'+
                 ' WHERE f.cod_fornecedor='+sCodForn+
                 ' AND   f.dta_caixa>='+QuotedStr(sgDtaInicio)+
                 ' AND ((f.cod_historico=0 or f.cod_historico=999999)'+
                 '      OR'+
                 '      (f.cod_loja_sidicom='+QuotedStr(sgCodEmp)+'))'+
                 ' AND  f.cod_historico not in (900,955)';
          DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

          DMAtualizaSeteHoras.CDS_Busca.Next;
        End; // While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
        DMAtualizaSeteHoras.CDS_Busca.Close;

        sCodForn     :='';
        sgDtaFim     :='';
        sDocForn     :='';
        sCodFornLINX :='';
        sNomeFornLINX:='';
        While Not IBQ_ConsultaFilial.Eof do
        Begin
          sgDtaFim:=IBQ_ConsultaFilial.FieldByName('dataentrada').AsString;

          If sCodForn<>IBQ_ConsultaFilial.FieldByName('codfornecedor').AsString Then
          Begin
            sCodForn:=IBQ_ConsultaFilial.FieldByName('codfornecedor').AsString;
            sDocForn:=IBQ_ConsultaFilial.FieldByName('Doc_Forn').AsString;

            // Busca Código Fornecedor LINX -------------------------
            MySql:=' SELECT c.nome_cliente, c.cod_cliente'+
                   ' FROM linxclientesfornec c'+
                   ' WHERE REPLACE(REPLACE(REPLACE('+
                   '       TRIM(c.doc_cliente), ''/'', ''''), ''.'', ''''), ''-'', '''') = '+QuotedStr(sDocForn);
            DMAtualizaSeteHoras.CDS_Busca.Close;
            DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
            DMAtualizaSeteHoras.CDS_Busca.Open;
            sCodFornLINX :='';
            sNomeFornLINX:='';
            If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_cliente').AsString)<>'' Then
            Begin
              sCodFornLINX :=Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_cliente').AsString);
              sNomeFornLINX:=Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('nome_cliente').AsString)
            End; // If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_cliente').AsString)<>'' Then
            DMAtualizaSeteHoras.CDS_Busca.Close;

            // Verifica se Tem Historico de Negociação (900, 955) ---
            If sCodFornLINX<>'' Then
            Begin
              MySql:=' SELECT FIRST 1 f.cod_fornecedor'+
                     ' FROM FL_CAIXA_FORNECEDORES f'+
                     ' WHERE f.cod_historico  in (900,955)'+
                     ' AND   f.cod_fornecedor='+sCodFornLINX;
              DMAtualizaSeteHoras.CDS_Busca.Close;
              DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
              DMAtualizaSeteHoras.CDS_Busca.Open;
              If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_fornecedor').AsString)='' Then
              Begin
                sCodFornLINX :='';
                sNomeFornLINX:='';
              End; // If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_cliente').AsString)<>'' Then
              DMAtualizaSeteHoras.CDS_Busca.Close;
            End; // If sCodFornLINX<>'' Then
          End; // If sCodForn<>IBQ_ConsultaFilial.FieldByName('codfornecedor').AsString Then

          // Só Processa Se Encontrou o Fornecedor no LINX e com Negociação (Hist: 900 ou 955)
          If sCodFornLINX<>'' Then
          Begin
            // Busca Num_Seq do Dia do Fornecedor -------------------
            MySql:=' SELECT cf.num_seq'+
                   ' FROM FL_CAIXA_FORNECEDORES cf'+
                   ' WHERE cf.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaFim)))+
                   ' AND   cf.cod_fornecedor='+QuotedStr(sCodFornLINX)+
                   ' AND   cf.num_seq>0'+
                   ' AND   cf.num_seq<999999'+
                   ' ORDER BY cf.Num_Seq';
            DMAtualizaSeteHoras.CDS_Busca.Close;
            DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
            DMAtualizaSeteHoras.CDS_Busca.Open;
            i:=1;
            sNumSeq:=IntToStr(DMAtualizaSeteHoras.CDS_Busca.RecordCount+1);
            While not DMAtualizaSeteHoras.CDS_Busca.Eof do
            Begin
              If DMAtualizaSeteHoras.CDS_Busca.RecNo<>DMAtualizaSeteHoras.CDS_Busca.FieldByName('Num_Seq').AsInteger Then
              Begin
                sNumSeq:=IntToStr(DMAtualizaSeteHoras.CDS_Busca.RecNo);
                Break;
              End;

              DMAtualizaSeteHoras.CDS_Busca.Next;
            End; // While not DMAtualizaSeteHoras.CDS_Busca.Eof do
            DMAtualizaSeteHoras.CDS_Busca.Close;

            // Busca Percentual de Redução --------------------------------
            MySql:=' SELECT r.per_reducao'+
                   ' FROM FL_CAIXA_PERC_REDUCAO r'+
                   ' WHERE r.cod_fornecedor ='+sCodFornLINX+
                   ' AND   r.cod_comprovante='+QuotedStr(IBQ_ConsultaFilial.FieldByName('CODCOMPROVANTE').AsString)+
                   ' AND   CAST('+QuotedStr(IBQ_ConsultaFilial.FieldByName('DATAENTRADA').AsString)+' AS DATE)'+
                   '                 BETWEEN r.dta_incio AND COALESCE(r.dta_fim, CAST(''31.12.3000'' AS DATE))';
            DMAtualizaSeteHoras.CDS_Busca.Close;
            DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
            DMAtualizaSeteHoras.CDS_Busca.Open;
            sPercRed:='0.00';
            If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('per_reducao').AsString)<>'' Then
             sPercRed:=f_Troca(',','.',DMAtualizaSeteHoras.CDS_Busca.FieldByName('per_reducao').AsString);
            DMAtualizaSeteHoras.CDS_Busca.Close;

            // Insere Caixa -----------------------------------------------
            MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES ('+
                   ' COD_FORNECEDOR, DES_FORNECEDOR, VLR_ORIGEM, DTA_ORIGEM, DTA_CAIXA, NUM_SEQ,'+
                   ' NUM_CHAVENF, COD_EMPRESA, COD_HISTORICO, TXT_OBS,'+
                   ' NUM_DOCUMENTO, NUM_SERIE, PER_REDUCAO, TIP_DEBCRE, VLR_CAIXA, VLR_SALDO,'+
                   ' CODFORNECEDOR, COD_LOJA_LINX, COD_LOJA_SIDICOM)'+
                   ' VALUES ('+
                   sCodFornLINX+', '+ // COD_FORNECEDOR (LINX)
                   QuotedStr(sNomeFornLINX)+', '+ // DES_FORNECEDOR (LINX)
                   IBQ_ConsultaFilial.FieldByName('VLR_TOTAL').AsString+', '+ // VLR_ORIGEM
                   QuotedStr(IBQ_ConsultaFilial.FieldByName('DATACOMPROVANTE').AsString)+', '+ // DTA_ORIGEM
                   QuotedStr(IBQ_ConsultaFilial.FieldByName('DATAENTRADA').AsString)+', '+ // DTA_CAIXA
                   sNumSeq+', '+ // NUM_SEQ
                   QuotedStr(IBQ_ConsultaFilial.FieldByName('CHAVENF').AsString)+', '; // NUM_CHAVENF

                   // COD_EMPRESA (LINX ou 50-SIDICOM)
                   If sgCodEmp='99' Then
                    MySql:=
                     MySql+'2, '
                   Else
                    MySql:=
                     MySql+QuotedStr(sgCodEmp)+', ';

            MySql:=
             MySql+QuotedStr(IBQ_ConsultaFilial.FieldByName('CODCOMPROVANTE').AsString)+', '+ // COD_HISTORICO,
                   QuotedStr(AnsiUpperCase(IBQ_ConsultaFilial.FieldByName('OBSERVACAO').AsString))+', '+ // TXT_OBS
                   QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('NUMERO').AsString))+', '+ // NUM_DOCUMENTO
                   QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('SERIE').AsString))+', '+ // NUM_SERIE
                   sPercRed+', '+ // PER_REDUCAO,
                   QuotedStr(IBQ_ConsultaFilial.FieldByName('TP_DEBCRE').AsString)+', '+ // TIP_DEBCRE
                   'CAST(('+IBQ_ConsultaFilial.FieldByName('VLR_TOTAL').AsString+
                          '-(('+sPercRed+' * '+IBQ_ConsultaFilial.FieldByName('VLR_TOTAL').AsString+
                          ') / 100)) AS NUMERIC(12,2)),'+ // VLR_CAIXA
                   ' 0.00,'+ // VLR_SALDO
                   QuotedStr(sCodForn)+', '; // CODFORNECEDOR VARCHAR(6)

                   // COD_LOJA_LINX INTEGER (LINX ou 50-SIDICOM)
                   If sgCodEmp='99' Then
                    MySql:=
                     MySql+'2, '
                   Else
                    MySql:=
                     MySql+'0, ';

            MySql:=
             MySql+QuotedStr(sgCodEmp)+')'; // COD_LOJA_SIDICOM VARCHAR(2)
            DMAtualizaSeteHoras.SQLC.Execute(MySql, nil, nil);

            // Guarda Fornecedor a Processar Conta Correte ------------
            bgProcessar:=True;
            For i:=0 to Mem_Odir.Lines.Count-1 do
            Begin
               If Mem_Odir.Lines[i]=sCodFornLINX Then
               Begin
                 bgProcessar:=False;
                 Break;
               End;
            End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do

            If bgProcessar Then
            Begin
              Mem_Odir.Lines.Add(sCodFornLINX);
            End;
          End; // If sCodFornLINX<>'' Then

          IBQ_ConsultaFilial.Next;
        End; // While Not IBQ_ConsultaFilial.Eof do
        IBQ_ConsultaFilial.Close;

        // Fecha Transacao =================================================
        DMAtualizaSeteHoras.SQLC.Commit(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';
        Screen.Cursor:=crDefault;

      Except
        on e : Exception do
        Begin
          DMAtualizaSeteHoras.SQLC.Rollback(TD);

          DateSeparator:='/';
          DecimalSeparator:=',';
        End; // on e : Exception do
      End; // Try
    End; // If bSiga Then

    ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F')
  End; // If bSiga Then
end; // Busca Movtos de Debito/Credito de Fornecedores SIDICOM >>>>>>>>>>>>>>>>>

// Calcula Fluxo de Caixo de Fornecedor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.CalculaFluxoCaixaFornecedores(sDt: String=''; sCodForn: String ='');
Var
  MySql:String;
  cVlrSaldo: Currency;
  iUltmio: Integer;
  sCodigo: String;
Begin
  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaSeteHoras.SQLC.StartTransaction(TD);

  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Busca Fornecedores ========================================================
    MySql:=' SELECT distinct c.COD_FORNECEDOR, c.DTA_CAIXA'+
           ' FROM FL_CAIXA_FORNECEDORES c';

           If Trim(sDt)<>'' Then
            MySql:=
             MySql+' WHERE c.DTA_CAIXA>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDt)));

           If (Trim(sCodForn)<>'') and (Trim(sDt)<>'') Then
            MySql:=
             MySql+' And c.COD_FORNECEDOR='+sCodForn;

           If (Trim(sCodForn)<>'') and (Trim(sDt)='') Then
            MySql:=
             MySql+' WHERE c.COD_FORNECEDOR='+sCodForn;

    MySql:=
     MySql+' ORDER BY c.COD_FORNECEDOR';
    DMAtualizaSeteHoras.CDS_While.Close;
    DMAtualizaSeteHoras.SDS_While.CommandText:=MySql;
    DMAtualizaSeteHoras.CDS_While.Open;

    sCodigo:='0';
    While Not DMAtualizaSeteHoras.CDS_While.Eof do
    Begin
      If sCodigo<>DMAtualizaSeteHoras.CDS_While.FieldByName('Cod_Fornecedor').AsString Then
       cVlrSaldo:=0;

      // Busca Fluxo de Caixa Fornecedores =========================================
      MySql:=' SELECT cx.COD_FORNECEDOR, cx.DES_FORNECEDOR, cx.DTA_CAIXA, cx.NUM_SEQ,'+
             '        cx.TIP_DEBCRE, cx.VLR_CAIXA, cx.VLR_SALDO'+

             ' FROM FL_CAIXA_FORNECEDORES cx'+

             ' WHERE cx.DTA_CAIXA='+QuotedStr(DMAtualizaSeteHoras.CDS_While.FieldByName('Dta_Caixa').AsString)+
             ' And   cx.COD_FORNECEDOR='+QuotedStr(DMAtualizaSeteHoras.CDS_While.FieldByName('Cod_Fornecedor').AsString)+
             ' ORDER BY cx.DTA_CAIXA, NUM_SEQ';
      DMAtualizaSeteHoras.CDS_Pesquisa.Close;
      DMAtualizaSeteHoras.SDS_Pesquisa.CommandText:=MySql;
      DMAtualizaSeteHoras.CDS_Pesquisa.Open;

      DMAtualizaSeteHoras.CDS_Pesquisa.Last;
      iUltmio:=DMAtualizaSeteHoras.CDS_Pesquisa.RecNo;
      DMAtualizaSeteHoras.CDS_Pesquisa.First;

      While Not DMAtualizaSeteHoras.CDS_Pesquisa.Eof do
      Begin
        Refresh;

        // Verifica Registro de Saldo Inicial ==================================
        If DMAtualizaSeteHoras.CDS_Pesquisa.RecNo=1 Then
        Begin
          If DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>0 Then
           Begin
             // Busca Saldo Final do Dia Anterior ---------------------
             MySql:='SELECT Max(c.DTA_CAIXA) DtAnterior, c.vlr_saldo'+

                    ' FROM FL_CAIXA_FORNECEDORES c'+

                    ' WHERE c.num_seq=999999'+
                    ' AND   c.DTA_CAIXA<'+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                    ' And   c.COD_FORNECEDOR='+QuotedStr(DMAtualizaSeteHoras.CDS_While.FieldByName('COD_FORNECEDOR').AsString)+

                    ' GROUP BY c.vlr_saldo'+
                    ' ORDER BY DtAnterior desc';
             DMAtualizaSeteHoras.CDS_Busca.Close;
             DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
             DMAtualizaSeteHoras.CDS_Busca.Open;

             MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES ('+
                    ' COD_FORNECEDOR, DES_FORNECEDOR, DTA_CAIXA, NUM_SEQ,'+
                    ' COD_HISTORICO, PER_REDUCAO, VLR_SALDO)'+
                    ' Values ('+
                    QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Cod_Fornecedor').AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Des_Fornecedor').AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+', '+
                    QuotedStr('0')+', '+
                    QuotedStr('0')+', '+
                    ' NULL, ';

                   If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('DtAnterior').AsString)='' Then
                    Begin
                      MySql:=
                       MySql+QuotedStr('0')+')';
                      cVlrSaldo:=0;
                    End
                   Else // If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('DtAnterior').AsString)='' Then
                    Begin
                      MySql:=
                       MySql+QuotedStr(DMAtualizaSeteHoras.CDS_Busca.FieldByName('Vlr_Saldo').AsString)+')';
                      cVlrSaldo:=DMAtualizaSeteHoras.CDS_Busca.FieldByName('Vlr_Saldo').AsCurrency;
                    End;
             DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

             DMAtualizaSeteHoras.CDS_Busca.Close;
           End
          Else // If DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>0 Then
           Begin
             If DMAtualizaSeteHoras.CDS_While.RecNo=1 Then
              Begin
                cVlrSaldo:=DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Vlr_Saldo').AsCurrency;
              End
             Else // If DMAtualizaSeteHoras.CDS_While.RecNo=1 Then
              Begin
                // Atualiza Saldo Incial --------------------------------
                 MySql:=' UPDATE FL_CAIXA_FORNECEDORES'+
                        ' SET Vlr_Saldo='+QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)));

                        If (DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger=0) Or
                           (DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger=999999) Then
                        Begin
                          MySql:=
                           MySql+', Per_Reducao=null';
                        End;

                 MySql:=
                  MySql+' WHERE DTA_CAIXA='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                        ' AND Num_Seq='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsString)+
                        ' AND COD_FORNECEDOR='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('COD_FORNECEDOR').AsString);
                 DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);
              End; // If DMAtualizaSeteHoras.CDS_While.RecNo=1 Then
           End; // If DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>0 Then
        End; // If DMAtualizaSeteHoras.CDS_Pesquisa.RecNo=1 Then

        // Atualiza Movtos =====================================================
        If (DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>0) and
           (DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999) Then
        Begin
          // Atualiza Movto --------------------------------------
          MySql:='UPDATE FL_CAIXA_FORNECEDORES';

          If DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('TIP_DEBCRE').AsString='C' Then
           cVlrSaldo:=
            cVlrSaldo+DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Vlr_Caixa').AsCurrency
          Else
           cVlrSaldo:=
            cVlrSaldo-DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Vlr_Caixa').AsCurrency;

          MySql:=
           MySql+' SET Vlr_Saldo='+QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)))+
                 ' WHERE DTA_CAIXA='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                 ' And   NUM_SEQ='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsString)+
                 ' And   COD_FORNECEDOR='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('COD_FORNECEDOR').AsString);
          DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);
        End; // If (DMAtualizaSeteHoras.CDS_Pesquisa.RecNo<>iUltmio) and (DMAtualizaSeteHoras.CDS_Pesquisa.RecNo<>1)Then

        // Verifica Registro de Saldo Final ====================================
        If DMAtualizaSeteHoras.CDS_Pesquisa.RecNo=iUltmio Then
        Begin
          If DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999 Then
           Begin
             // Insere Saldo Final ----------------------------------
             MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES ('+
                    ' COD_FORNECEDOR, DES_FORNECEDOR, DTA_CAIXA, NUM_SEQ,'+
                    ' COD_HISTORICO, PER_REDUCAO, VLR_SALDO)'+
                    ' VALUES ('+
                    QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Cod_Fornecedor').AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Des_Fornecedor').AsString)+', '+
                    QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+', '+
                    QuotedStr('999999')+', '+
                    QuotedStr('999999')+', '+
                    ' NULL,'+ // PER_REDUCAO
                    QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)))+')';
             DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);
           End
          Else // If DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999 Then
           Begin
             // Atualiza Movto --------------------------------------
             MySql:=' UPDATE FL_CAIXA_FORNECEDORES'+
                    ' SET Vlr_Saldo='+QuotedStr(f_Troca(',','.',CurrToStr(cVlrSaldo)));

                    If (DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger=0) Or
                       (DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger=999999) Then
                    Begin
                      MySql:=
                       MySql+', Per_Reducao=null';
                    End;

             MySql:=
              MySql+' WHERE DTA_CAIXA='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Dta_Caixa').AsString)+
                    ' AND Num_Seq='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsString)+
                    ' AND COD_FORNECEDOR='+QuotedStr(DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('COD_FORNECEDOR').AsString);
             DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);
           End; // If DMAtualizaSeteHoras.CDS_Pesquisa.FieldByName('Num_Seq').AsInteger<>999999 Then
        End; // If DMAtualizaSeteHoras.CDS_Pesquisa.RecNo=iUltmio Then

        DMAtualizaSeteHoras.CDS_Pesquisa.Next;
      End; // While Not DMAtualizaSeteHoras.CDS_Pesquisa.Eof do

      sCodigo:=DMAtualizaSeteHoras.CDS_While.FieldByName('Cod_Fornecedor').AsString;

      DMAtualizaSeteHoras.CDS_While.Next;
    End; // While Not DMAtualizaSeteHoras.CDS_While.Eof do
    DMAtualizaSeteHoras.CDS_Pesquisa.Close;

    // Fecha Transacao =========================================================
    DMAtualizaSeteHoras.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';
  Except
    on e : Exception do
    Begin
      DMAtualizaSeteHoras.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';
    End;
  End;
End; // Calcula Fluxo de Caixo de Fornecedor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//==============================================================================
// ODIR - FIM ==================================================================
//==============================================================================

procedure TFrmAtualizaSeteHoras.FormCreate(Sender: TObject);
Var
  Flags : Cardinal;

  MySql: String;
  i: Integer;
begin

  //============================================================================
  // Atualiza Codigos de Barras ================================================
  //============================================================================
//opss
  CodigoBarras;
  // Atualiza Codigos de Barras ================================================
  //============================================================================

  //============================================================================
  // Atualiza Demanda 4 Meses ==================================================
  //============================================================================
//opss
  Demanda4Meses;
  // Atualiza Demanda 4 Meses ==================================================
  //============================================================================

  //============================================================================
  // VERIFICA SE A INTERNET ESTA CONECTADA =====================================
  //============================================================================
  if not InternetGetConnectedState(@Flags, 0) then
  Begin
    Application.Terminate;
    Exit;
  End;

//opss
  //============================================================================
  // ATUALIZA CONTA CORRENTE FORNECEDORES ======================================
  //============================================================================
  // Verifica Parametro Enviado ================================================
  // OBS: Enviar Somente Um Código por Vez
  //======================================
  sgCodForn:='';
  for i := 1 to ParamCount do
  Begin
    sgCodForn:=LowerCase(ParamStr(i));
  End;

  // Inicializa Data Inicial ===================================================
  sgDtaProcCC:=DateToStr(Date);
  sgDtaInicio:=DateToStr(IncMonth(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor),-4));
  sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',sgDtaInicio));

  // Busca Comprovantes ========================================================
  MySql:=' SELECT LPAD(h.cod_historico, 3, ''0'') cod_comprv, h.ind_debcre'+
         ' FROM FL_CAIXA_HISTORICOS h'+
         ' WHERE h.cod_historico <> 0'+
         ' AND   h.cod_historico <> 999999'+
         ' AND   h.cod_historico <> 900'+
         ' AND   h.cod_historico <> 955';
  DMAtualizaSeteHoras.CDS_BuscaRapida.Close;
  DMAtualizaSeteHoras.SDS_BuscaRapida.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_BuscaRapida.Open;

  sgCompCre:='';
  sgCompDeb:='';
  While Not DMAtualizaSeteHoras.CDS_BuscaRapida.Eof do
  Begin
    If DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('ind_debcre').AsString='D' Then
    Begin
      If Trim(sgCompDeb)='' Then
       sgCompDeb:=QuotedStr(DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('cod_comprv').AsString)
      Else
       sgCompDeb:=sgCompDeb+', '+QuotedStr(DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('cod_comprv').AsString);
    End;

    If DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('ind_debcre').AsString='C' Then
    Begin
      If Trim(sgCompCre)='' Then
       sgCompCre:=QuotedStr(DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('cod_comprv').AsString)
      Else
       sgCompCre:=sgCompCre+', '+QuotedStr(DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('cod_comprv').AsString);
    End;

    DMAtualizaSeteHoras.CDS_BuscaRapida.Next;
  End; // While Not DMAtualizaSeteHoras.CDS_BuscaRapida.Eof do
  DMAtualizaSeteHoras.CDS_BuscaRapida.Close;

  // Monta SQL's Para Busca SIDICOM / LINX =====================================
  MontaSqlsSidicomLinx;

  // Limpa Codigos de Fornecedores =============================================
  Mem_Odir.Lines.Clear;

  // Busca Lojas ===============================================================
  MySql:=' SELECT e.cod_filial, e.cod_linx, e.dta_inicio_linx'+
         ' FROM EMP_CONEXOES e'+
         //opss somente uma loja
         // ' WHERE e.cod_linx=2'+
         ' WHERE ((e.ind_ativo = ''SIM'') OR (e.cod_filial = ''99''))'+

         ' ORDER BY 1';// desc';
  DMAtualizaSeteHoras.CDS_Lojas.Close;
  DMAtualizaSeteHoras.SDS_Lojas.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_Lojas.Open;

  DMAtualizaSeteHoras.CDS_Lojas.First;
  While Not DMAtualizaSeteHoras.CDS_Lojas.Eof do
  Begin
    sgCodEmp    :=DMAtualizaSeteHoras.CDS_Lojas.FieldByName('COD_FILIAL').AsString;
    sgCodEmpLINX:=DMAtualizaSeteHoras.CDS_Lojas.FieldByName('COD_LINX').AsString;
    sgDtaIniLINX:=DMAtualizaSeteHoras.CDS_Lojas.FieldByName('DTA_INICIO_LINX').AsString;

    // Busca Débitos/Crétidos no SIDICOM =======================================
    If sgCodEmpLINX='0' Then
    Begin
      //========================================================================
      // Quando Busca Por Codigo no SIDICOM Altera o Código para LINX ==========
      If Trim(sgCodForn)<>'' Then
      Begin
        MySql:=' SELECT'+
               ' REPLACE(REPLACE(REPLACE(TRIM(f.doc_cliente), ''/'', ''''), ''.'', ''''), ''-'', '''') Doc_Forn'+
               ' FROM LINXCLIENTESFORNEC f'+
               ' WHERE f.cod_cliente='+sgCodForn;
        DMAtualizaSeteHoras.CDS_BuscaRapida.Close;
        DMAtualizaSeteHoras.SDS_BuscaRapida.CommandText:=MySql;
        DMAtualizaSeteHoras.CDS_BuscaRapida.Open;
        sgCodForn:=DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('Doc_Forn').AsString;
        DMAtualizaSeteHoras.CDS_BuscaRapida.Close;

        If Trim(sgCodForn)<>'' Then
        Begin
          MySql:=' SELECT fo.codfornecedor'+
                 ' FROM FORNECEDOR fo'+
                 ' WHERE REPLACE(REPLACE(REPLACE(fo.numerocgcmf, ''/'', ''''), ''.'', ''''), ''-'', '''') = '+QuotedStr(sgCodForn);
          DMAtualizaSeteHoras.CDS_BuscaRapida.Close;
          DMAtualizaSeteHoras.SDS_BuscaRapida.CommandText:=MySql;
          DMAtualizaSeteHoras.CDS_BuscaRapida.Open;
          sgCodForn:=DMAtualizaSeteHoras.CDS_BuscaRapida.FieldByName('codfornecedor').AsString;
          DMAtualizaSeteHoras.CDS_BuscaRapida.Close;
        End; // If Trim(sgCodForn)<>'' Then
      End; // If Trim(sgCodForn)<>'' Then
      // Quando Busca Por Codigo no SIDICOM Altera o Código para LINX ==========
      //=========================================================================

      BuscaMovtosDebCreSIDICOM;
    End; // If sgCodEmpLINX='0' Then

    // Busca Débitos/Crétidos no LINX ==========================================
    If sgCodEmpLINX<>'0' Then
    Begin
      BuscaMovtosDebCreLINX;
    End;

    DMAtualizaSeteHoras.CDS_Lojas.Next;
  End; // While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
  DMAtualizaSeteHoras.CDS_Lojas.Close;

  // Calcula Fluxo de Caixa do Fornecedore =====================================
  For i:=0 to Mem_Odir.Lines.Count-1 do
  Begin
    CalculaFluxoCaixaFornecedores(sgDtaProcCC,Mem_Odir.Lines[i])
  End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do
  // ATUALIZA CONTA CORRENTE FORNECEDORES ======================================
  //============================================================================

  //============================================================================
  // Atualiza Centro de Custos =================================================
  //============================================================================
//opss
// OdirApagar 23/04/2018 - Comprador (Sidicom) Será subatituído pelo Linx
//  CentroCustos;

  //============================================================================
  // Igual Todos os Produtos de Todas a Lojas com o CD =========================
  //============================================================================
//opss
  AcertaEstoqueLoja;

  // Encerra Programa ==========================================================
  Application.Terminate;
  Exit;

end;

end.

