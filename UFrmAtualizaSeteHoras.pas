unit UFrmAtualizaSeteHoras;
//OdirRetornar

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
    Procedure Demanda4Meses;
    Procedure ProdutosCompradores;

    Procedure MontaSqlsSidicomLinx;

   // OdirApagar - 02/05/2018 -- SIDICOM Desativado
   // Procedure BuscaMovtosDebCreSIDICOM;
   // Procedure BuscaMovtosDebCreLINX_OLD;
    Procedure BuscaMovtosDebCreLINX;
    Procedure CalculaFluxoCaixaFornecedores(sDt: String=''; sCodForn: String ='');

    // OdirApagar - 07/06/2019 -- SIDICOM Desativado
    // Procedure CodigoBarras;

    // OdirApagar - 07/06/2019 -- SIDICOM Desativado
    // Procedure AcertaEstoqueLoja; // Iguala Todos os Produtos de Todas a Lojas com o CD


    Procedure SidicomDataBackup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

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

  bgRodaCCorrente: Boolean; // Se Roda o Processametno do Conta Corrente

  igDiasUteis : Integer;

  MySqlSelect, MySqlLinx: String;

  sgCompDeb, sgCompCre: String;

  sgDtaInicio, sgDtaFim, sgDtaIniLINX, sgDtaProcCC,
  sgCodForn,
  sgCodEmpLINX, sgCodEmp, sgDesLoja: String;

  bgExcSemMovto, // Executa uma Unica Vez
  bgProcessar,
  bgAchoFornCC: Boolean; // Se Encontrou Fornecedor com Negociação (Hist: 900, 955)

  Flags : Cardinal; // Verifica Internet Ativo - Encerra Necessario

  tgMySqlErro: TStringList; // Arquivo de Processamento e Erros
  sgDtaInicioProc: String;

implementation

uses DK_Procs1, UDMConexoes, uj_001, uj_002, UDMAtualizaSeteHoras;

{$R *.dfm}
//==============================================================================
// ODIR - INICIO ===============================================================
//==============================================================================

// Acerta Data de Backup do Sidicom >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
procedure TFrmAtualizaSeteHoras.SidicomDataBackup;
Var
  MySql: String;
  sDta, sHora: String;
Begin
  sDta :=DateToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor));
  sHora:=TimeToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor));

  Try // Try da Transação
    // Conecata SIDICOM ========================================================
    ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A');
    CriaQueryIB('IBDB_99', 'IBT_99', IBQ_ConsultaFilial, True);

    // Verifica se Transação esta Ativa
    If DMConexoes.IBT_99.Active Then
     DMConexoes.IBT_99.Rollback;

    // Monta Transacao  -------------------------------------
    DMConexoes.IBT_99.StartTransaction;

    DateSeparator:='.';
    DecimalSeparator:='.';

    // Busca Saldos Linx =======================================================
    MySql:=' UPDATE OR INSERT INTO EMPRESA'+
           ' (CODEMPRESA, DATASISTEMA, DATABACKUP, DATA_ATUALIZACAO_CONTRATO)'+
           ' VALUES ('+
           QuotedStr('390926')+', '+ // CODEMPRESA
           QuotedStr(f_Troca('/','.',f_Troca('-','.',sDta)))+', '+ // DATASISTEMA
           QuotedStr(f_Troca('/','.',f_Troca('-','.',sDta))+' '+sHora)+', '+ // DATABACKUP
           QuotedStr(f_Troca('/','.',f_Troca('-','.',sDta))+' '+sHora)+')'+ // DATA_ATUALIZACAO_CONTRATO
           ' MATCHING (CODEMPRESA)';
    IBQ_ConsultaFilial.Close;
    IBQ_ConsultaFilial.SQL.Clear;
    IBQ_ConsultaFilial.SQL.Add(MySql);
    IBQ_ConsultaFilial.ExecSQL;

    DMConexoes.IBT_99.Commit;

    DateSeparator:='/';
    DecimalSeparator:=',';

    tgMySqlErro.Add('SidicomDataBackup - OK - '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
    tgMySqlErro.Add('==================================');
    tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');
  Except
    on e : Exception do
    Begin
      DMConexoes.IBT_99.Rollback;
      DateSeparator:='/';
      DecimalSeparator:=',';

      tgMySqlErro.Add('SidicomDataBackup - ERRO  -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');
    End; // on e : Exception do
  End; // Try

  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
End; // Acerta Data de Backup do Sidicom >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// OdirApagar - 07/06/2019 -- SIDICOM Desativado
//// Iguala Todos os Produtos de Todas a Lojas com o CD >>>>>>>>>>>>>>>>>>>>>>>>>>
//Procedure TFrmAtualizaSeteHoras.AcertaEstoqueLoja;
//Var
//  MySql: String;
//  sCodLoja: String;
//Begin
//  // Verifica se Transação esta Ativa
//  If DMAtualizaSeteHoras.SQLC.InTransaction Then
//   DMAtualizaSeteHoras.SQLC.Rollback(TD);
//
//  MySql:=' SELECT e.cod_filial'+
//         ' FROM EMP_CONEXOES e'+
//         //OpssAqui
//         // Somente Uma Loja
//         // ' WHERE e.cod_linx=28'+ // Blumenau
//         ' WHERE e.ind_ativo=''SIM'''+
//         ' AND   e.dta_inicio_linx IS NOT NULL'+
//         ' ORDER BY 1';
//  DMAtualizaSeteHoras.CDS_Lojas.Close;
//  DMAtualizaSeteHoras.SDS_Lojas.CommandText:=MySql;
//  DMAtualizaSeteHoras.CDS_Lojas.Open;
//
//  DMAtualizaSeteHoras.CDS_Lojas.DisableControls;
//  While Not DMAtualizaSeteHoras.CDS_Lojas.Eof do
//  Begin
//    // Monta Transacao =========================================================
//    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//    TD.IsolationLevel:=xilREADCOMMITTED;
//    DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
//    Try // Try da Transação
//      DateSeparator:='.';
//      DecimalSeparator:='.';
//
//      sCodLoja:=DMAtualizaSeteHoras.CDS_Lojas.FieldByName('Cod_Filial').AsString;
//
//      // Insere Produtos do CD na Loja =========================================
//      MySql:=' INSERT INTO ESTOQUE'+
//             ' SELECT'+
//             QuotedStr(sCodLoja)+' CODFILIAL,'+
//             ' e.CODPRODUTO,'+
//             ' 0.0000 SALDOATUAL,'+
//             ' 0.0000 PEDIDOPENDENTE,'+
//             ' 0 ZONAENDERECO,'+
//             ' ''000'' CORREDOR,'+
//             ' ''000'' PRATELEIRA,'+
//             ' ''0000'' GAVETA,'+
//             ' 0.00 CUSMEDVALOR,'+
//             ' 0.0000 CUSTOMEDIO,'+
//             ' 0.0000 LASTPRECOCOMPRA,'+
//             ' 0.0000 LASTCUSTOMEDIO,'+
//             ' 0.0000 ESTOQUEIDEAL,'+
//             ' 0.0000 ESTOQUEMAXIMO,'+
//             ' e.DATAALTERACADASTRO,'+
//             ' e.DATAALTERAESTOQUE,'+
//             ' e.DATAALTERAESTOQUE_PED,'+
//             ' e.PRINCIPALFOR,'+
//             ' 0.0000 SALDO_FINAL_SIDICOM,'+
//             ' e.DTA_ATUALIZACAO,'+
//             ' e.HRA_ATUALIZACAO'+
//
//             ' FROM ESTOQUE e'+
//
//             ' WHERE e.codfilial=''99'''+
//             ' AND NOT EXISTS (SELECT 1'+
//             '                 FROM ESTOQUE e9'+
//             '                 WHERE e9.codfilial='+QuotedStr(sCodLoja)+
//             '                 AND  e9.codproduto=e.codproduto)';
//      DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);
//
//      // Exclui Produtos a mais no Cadastro em Relação ao CD ===================
//      MySql:=' DELETE FROM ESTOQUE e'+
//             ' WHERE e.codfilial='+QuotedStr(sCodLoja)+
//             ' AND NOT EXISTS (SELECT 1'+
//             '                 FROM ESTOQUE e9'+
//             '                 WHERE e9.codfilial=''99'''+
//             '                 AND   e9.codproduto=e.codproduto)';
//      DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);
//
//      // Atualiza Transacao ======================================================
//      DMAtualizaSeteHoras.SQLC.Commit(TD);
//
//      DateSeparator:='/';
//      DecimalSeparator:=',';
//
//      tgMySqlErro.Add('AcertaEstoqueLoja: Loja '+sCodLoja+' - OK - '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//      tgMySqlErro.Add('==================================');
//      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');
//    Except // Except da Transação
//      on e : Exception do
//      Begin
//        // Abandona Transacao ====================================================
//        DMAtualizaSeteHoras.SQLC.Rollback(TD);
//
//        DateSeparator:='/';
//        DecimalSeparator:=',';
//
//        tgMySqlErro.Add('AcertaEstoqueLoja: Loja '+sCodLoja+' - ERRO  -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//        tgMySqlErro.Add('ERROR: '+e.message);
//        tgMySqlErro.Add(MySql);
//        tgMySqlErro.Add('==================================');
//        tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');
//      End; // on e : Exception do
//    End; // Try da Transação
//
//    DMAtualizaSeteHoras.CDS_Lojas.Next;
//  End; // While Not DMAtualizaSeteHoras.CDS_Lojas.Eof do
//  DMAtualizaSeteHoras.CDS_Lojas.EnableControls;
//  DMAtualizaSeteHoras.CDS_Lojas.Close;
//
//end; // Igual Todos os Produtos de Todas a Lojas com o CD >>>>>>>>>>>>>>>>>>>>>>

// OdirApagar - 07/06/2019 -- SIDICOM Desativado
//// Busca Codigo de Barras no SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Procedure TFrmAtualizaSeteHoras.CodigoBarras;
//Var
//   bSiga: Boolean;
//   i: Integer;
//   MySql: String;
//Begin
//  bSiga:=False;
//  sgCodEmp:='99';
//
//  // Conecta Loja =======================================================
//  If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
//   Begin
//     // Cria Query da Empresa ------------------------------------
//     CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True);
//     bSiga:=True;
//   End
//  Else
//   Begin
//     bSiga:=False;
//   End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
//
//  If bSiga Then
//  Begin
//    // Abre Query -----------------------------------------------
//    i:=0;
//    bSiga:=False;
//    While Not bSiga do
//    Begin
//      Try
//        MySql:=' SELECT CODBARRA, CODPRODUTO, UNIDADEPORCAIXA, ETIQUETAS_SN'+
//               ' FROM PRODUTOSBARRA';
//        IBQ_ConsultaFilial.Close;
//        IBQ_ConsultaFilial.SQL.Clear;
//        IBQ_ConsultaFilial.SQL.Add(MySql);
//        IBQ_ConsultaFilial.Open;
//
//        bSiga:=True;
//      Except
//        Inc(i);
//      End; // Try
//
//      If i>2 Then
//      Begin
//        Break;
//      End; // If i>10 Then
//    End; // While Not bSiga do
//
//    // Processamento ===========================================================
//    If bSiga Then // Query Executada
//    Begin
//      // Monta Transacao =======================================================
//      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//      TD.IsolationLevel:=xilREADCOMMITTED;
//      DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
//      Try
//        DateSeparator:='.';
//        DecimalSeparator:='.';
//
//        // Exclui Centro de Custos =============================================
//        MySql:=' DELETE FROM PRODUTOSBARRA';
//        DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);
//
//        While Not IBQ_ConsultaFilial.Eof do
//        Begin
//          // Insere Centro de Custos -------------------------------------------
//          MySql:=' INSERT INTO PRODUTOSBARRA'+
//                 ' (CODBARRA, CODPRODUTO, UNIDADEPORCAIXA, ETIQUETAS_SN)'+
//
//                 ' VALUES ('+
//                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODBARRA').AsString)+', '+
//                 QuotedStr(IBQ_ConsultaFilial.FieldByName('CODPRODUTO').AsString)+', '+
//                 QuotedStr(IBQ_ConsultaFilial.FieldByName('UNIDADEPORCAIXA').AsString)+', '+
//                 QuotedStr(IBQ_ConsultaFilial.FieldByName('ETIQUETAS_SN').AsString)+')';
//          DMAtualizaSeteHoras.SQLC.Execute(MySql, nil, nil);
//
//          IBQ_ConsultaFilial.Next;
//        End; // While Not IBQ_ConsultaFilial.Eof do
//        IBQ_ConsultaFilial.Close;
//
//        // Fecha Transacao =================================================
//        DMAtualizaSeteHoras.SQLC.Commit(TD);
//
//        DateSeparator:='/';
//        DecimalSeparator:=',';
//
//        tgMySqlErro.Add('CodigoBarras - OK - '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//        tgMySqlErro.Add('==================================');
//        tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');
//      Except
//        on e : Exception do
//        Begin
//          DMAtualizaSeteHoras.SQLC.Rollback(TD);
//
//          DateSeparator:='/';
//          DecimalSeparator:=',';
//
//          tgMySqlErro.Add('CodigoBarras - ERRO  -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//          tgMySqlErro.Add('ERROR: '+e.message);
//          tgMySqlErro.Add(MySql);
//          tgMySqlErro.Add('==================================');
//          tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');
//        End; // on e : Exception do
//      End; // Try
//    End; // If bSiga Then
//    ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F')
//  End; // If bSiga Then
//
//end; // Busca Codigo de Barras no SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Monta SQL's Para Busca SIDICOM / LINX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.MontaSqlsSidicomLinx;
Var
  MySql: String;
Begin
  //============================================================================
  // Monta Select de Busca de Debitos e Créditos (LINX) ========================
  //============================================================================
  // Todos Cfops dos Fornecedores que estão no Conta Corrente ==================
  MySql:=' SELECT'+
         ' fo.cod_fornecedor COD_FORNECEDOR,'+ // 1'+
         ' fo.des_fornecedor DES_FORNECEDOR,'+ // 2'+
         ' fo.cod_vinculado COD_VINCULADO,'+ // 3'+
         ' fo.des_vinculado DES_VINCULADO,'+ // 4'+

         ' CAST((ROUND((SUM('+ // 5
         '    CASE'+
         '       WHEN (CAST(COALESCE(mf.id_cfop,''0'') AS INTEGER)=6603) or (CAST(COALESCE(mf.id_cfop,''0'') AS INTEGER)=5603) THEN'+ // Ressarcimento ICMS_ST
         '          COALESCE(mf.valor_icms_st,0.00)'+
         '       ELSE'+
         '          COALESCE(mf.valor_total,0.00)'+
         '    END'+
         ' )), 2)) AS NUMERIC(18,2)) VLR_ORIGEM,'+

         ' CAST(mf.data_documento AS DATE) DTA_ORIGEM,'+ // 6'+
         ' CAST(mf.data_lancamento AS DATE) DTA_CAIXA,'+ // 7'+
         ' mf.data_lancamento,'+ // 8'+
         ' 0  NUM_SEQ,'+ // 9'+
         ' TRIM(mf.chave_nf) NUM_CHAVENF,'+ // 10'+
         ' mf.empresa COD_EMPRESA,'+ // 11'+
         ' hi.cod_historico COD_HISTORICO,'+ // 12'+
         ' NULL TXT_OBS,'+ // 13'+
         ' CAST(SUBSTRING(mf.documento FROM 1 FOR 12) AS VARCHAR(12)) NUM_DOCUMENTO,'+ // 14'+
         ' CAST(TRIM(mf.serie) AS VARCHAR(4)) NUM_SERIE,'+ // 15'+

         // Percentual de Redução -------------------------------
         ' COALESCE((SELECT r.per_reducao'+
         '           FROM FL_CAIXA_PERC_REDUCAO r'+
         '           WHERE r.cod_fornecedor = fo.cod_vinculado'+
         '           AND   r.cod_comprovante = hi.cod_historico'+
         '           AND   r.dta_incio<=CAST(mf.data_lancamento AS DATE)'+
         '           AND   COALESCE(r.dta_fim, CAST(''31.12.3000'' AS DATE))>=CAST(mf.data_lancamento AS DATE))'+
         ' ,0.00) PER_REDUCAO,'+ // 16'+

         ' hi.ind_debcre TIP_DEBCRE,'+ // 17'+

         ' CAST((ROUND((SUM('+ // 18
         '    CASE'+
         '       WHEN (CAST(COALESCE(mf.id_cfop,''0'') AS INTEGER)=6603) or (CAST(COALESCE(mf.id_cfop,''0'') AS INTEGER)=5603) THEN'+ // Ressarcimento ICMS_ST
         '          COALESCE(mf.valor_icms_st,0.00)'+
         '       ELSE'+
         '          COALESCE(mf.valor_total,0.00)'+
         '    END'+
         ' )), 2)) AS NUMERIC(18,2)) VLR_CAIXA,'+ // 18'+

         ' 0.00 VLR_SALDO,'+ // 19'+

         ' fr.doc_cliente,'+ // 20'+

// OdirApagar - 07/06/2019 -- SIDICOM Desativado
//         // Fornecedor Sidicom ----------------------------------
//         ' COALESCE((SELECT max(fs.codfornecedor) codfornecedor'+
//         '           FROM FORNECEDOR fs'+
//         '           WHERE REPLACE(REPLACE(REPLACE(TRIM(fs.numerocgcmf), ''/'', ''''), ''.'', ''''), ''-'', '''') ='+
//         '                 REPLACE(REPLACE(REPLACE(TRIM(fr.doc_cliente), ''/'', ''''), ''.'', ''''), ''-'', ''''))'+
//         ' , ''000000'') CODFORNECEDOR,'+ // 21'+
         // Fornecedor Sidicom ----------------------------------
         ' ''000000'' CODFORNECEDOR,'+ // 21'+

         ' mf.empresa COD_LOJA_LINX,'+ // 22'+
         ' mf.cod_loja COD_LOJA_SIDICOM'+ // 23'+

         ' FROM LINXMOVIMENTO mf, TAB_AUXILIAR cf,'+
         '      FL_CAIXA_HISTORICOS hi, LINXCLIENTESFORNEC fr,'+
         '      (SELECT DISTINCT ff.cod_fornecedor, ff.des_fornecedor,'+
         '                       ff.cod_vinculado, ff.des_vinculado'+
         '       FROM FL_CAIXA_FORNECEDORES ff'+
         '       WHERE ff.num_seq NOT IN (0,999999)) fo'+

         ' WHERE CAST(TRIM(COALESCE(mf.id_cfop,''0'')) AS INTEGER)=cf.cod_aux'+
         ' AND   mf.codigo_cliente=fo.cod_vinculado'+
         ' AND   CAST(cf.des_aux as INTEGER)=hi.cod_historico'+
         ' AND   mf.codigo_cliente=fr.cod_cliente'+
         ' AND   cf.tip_aux=25'+ // CONTA CORRENTE FORNECEDORES - CFops Utilizados
         ' AND   mf.cancelado= ''N'''+
         ' AND   mf.excluido = ''N'''+
         ' AND   COALESCE(mf.tipo_transacao, '''') <> ''J'''+ // NÃO Pode Ajustes de Estoques

         ' AND   mf.empresa = :CodEmpLinx'+ // Codigo da Empresa Linx
         ' AND   CAST(mf.data_lancamento AS DATE) >= :DtaInicioLinx'; // Data Inicio do Limite

         // Se Parametro sgCodForn ------------------------------
         If Trim(sgCodForn)<>'' Then
          MySql:=
           MySql+' AND   mf.codigo_cliente=:CodForn';

  MySql:=
   MySql+' GROUP BY 1,2,3,4,6,7,8,10,11,12,14,15,16,17,20,21,22,23';

  // Cfops 5923 - Perdas dos Fornecedores que estão no Conta Corrente ==========
  MySqlLinx:=
   MySqlLinx+' UNION'+

             ' SELECT '+

             ' CASE'+
             '    WHEN COALESCE((SELECT FIRST 1 ff.cod_fornecedor '+
             '                   FROM FL_CAIXA_FORNECEDORES ff '+
             '                   WHERE ff.cod_vinculado=fr.cod_cliente'+
             '                   AND   ff.num_seq NOT IN (0,999999)),0)<>0 THEN'+
             '      (SELECT FIRST 1 ff.cod_fornecedor'+
             '       FROM FL_CAIXA_FORNECEDORES ff'+
             '       WHERE ff.cod_vinculado=fr.cod_cliente'+
             '       AND   ff.num_seq NOT IN (0,999999))'+
             '    ELSE'+
             '      fr.cod_cliente'+
             ' END COD_FORNECEDOR,'+ // 1

             ' CASE'+
             '    WHEN COALESCE((SELECT FIRST 1 ff.des_fornecedor '+
             '                   FROM FL_CAIXA_FORNECEDORES ff '+
             '                   WHERE ff.cod_vinculado=fr.cod_cliente'+
             '                   AND   ff.num_seq NOT IN (0,999999)),'''')<>'''' THEN'+
             '      (SELECT FIRST 1 ff.des_fornecedor'+
             '       FROM FL_CAIXA_FORNECEDORES ff'+
             '       WHERE ff.cod_vinculado=fr.cod_cliente'+
             '       AND   ff.num_seq NOT IN (0,999999))'+
             '    ElSE'+
             '     fr.nome_cliente'+
             ' END DES_FORNECEDOR,'+ // 2

             ' fr.cod_cliente COD_VINCULADO,'+ // 3
             ' fr.nome_cliente DES_VINCULADO,'+ // 4

             ' CAST((ROUND((SUM(mf.valor_total)), 2)) AS NUMERIC(18,2)) VLR_ORIGEM,'+ // 5
             ' CAST(mf.data_documento AS DATE) DTA_ORIGEM,'+ // 6
             ' CAST(mf.data_lancamento AS DATE) DTA_CAIXA,'+ // 7
             ' mf.data_lancamento,'+ // 8
             ' 0  NUM_SEQ,'+ // 9
             ' TRIM(mf.chave_nf) NUM_CHAVENF,'+ // 10
             ' mf.empresa COD_EMPRESA,'+ // 11
             ' hi.cod_historico COD_HISTORICO,'+ // 12
             ' NULL TXT_OBS,'+ // 13
             ' CAST(SUBSTRING(mf.documento FROM 1 FOR 12) AS VARCHAR(12)) NUM_DOCUMENTO,'+ // 14
             ' CAST(TRIM(mf.serie) AS VARCHAR(4)) NUM_SERIE,'+ // 15

             // Percentual de Redução
             ' COALESCE((SELECT r.per_reducao'+
             '           FROM FL_CAIXA_PERC_REDUCAO r'+
             '           WHERE r.cod_fornecedor = fr.cod_cliente'+
             '           AND   r.cod_comprovante = hi.cod_historico'+
             '           AND   r.dta_incio<=CAST(mf.data_lancamento AS DATE)'+
             '           AND   COALESCE(r.dta_fim, CAST(''31.12.3000'' AS DATE))>=CAST(mf.data_lancamento AS DATE))'+
             ' ,0.00) PER_REDUCAO,'+ // 16

             ' hi.ind_debcre TIP_DEBCRE,'+ // 17
             ' CAST((ROUND((SUM(mf.valor_total)), 2)) AS NUMERIC(18,2)) VLR_CAIXA,'+ // 18
             ' 0.00 VLR_SALDO,'+ // 19

             ' fr.doc_cliente,'+ // 20

// OdirApagar - 07/06/2019 -- SIDICOM Desativado
//             // Fornecedor Sidicom
//             ' COALESCE((SELECT max(fs.codfornecedor) codfornecedor'+
//             '           FROM FORNECEDOR fs'+
//             '           WHERE REPLACE(REPLACE(REPLACE(TRIM(fs.numerocgcmf), ''/'', ''''), ''.'', ''''), ''-'', '''') ='+
//             '                 REPLACE(REPLACE(REPLACE(TRIM(fr.doc_cliente), ''/'', ''''), ''.'', ''''), ''-'', ''''))'+
//             ' , ''000000'') CODFORNECEDOR,'+ // 21
             // Fornecedor Sidicom ----------------------------------
             ' ''000000'' CODFORNECEDOR,'+ // 21
                         
             ' mf.empresa COD_LOJA_LINX,'+ // 22
             ' mf.cod_loja COD_LOJA_SIDICOM'+ // 23

             ' FROM LINXMOVIMENTO mf, LINXPRODUTOS pr,'+
             '      TAB_AUXILIAR cf, FL_CAIXA_HISTORICOS hi,'+
             '      LINXCLIENTESFORNEC fr'+

             ' WHERE mf.cod_produto=pr.cod_produto'+
             ' AND   CAST(TRIM(COALESCE(mf.id_cfop,''0'')) AS INTEGER)=cf.cod_aux'+
             ' AND   CAST(cf.des_aux as INTEGER)=hi.cod_historico'+
             ' AND   pr.cod_fornecedor=fr.cod_cliente'+
             ' AND   cf.tip_aux=25'+ // CONTA CORRENTE FORNECEDORES - CFops Utilizados
             ' AND   cf.cod_aux=5927'+
             ' AND   mf.cancelado=''N'''+
             ' AND   mf.excluido =''N'''+
             ' AND   mf.codigo_cliente=13'+
             ' AND   COALESCE(mf.tipo_transacao, '''') <> ''J'''+ // NÃO Pode Ajustes de Estoques

             ' AND   mf.empresa = :CodEmpLinx'+ // Codigo da Empresa Linx
             ' AND   CAST(mf.data_lancamento AS DATE) >= :DtaInicioLinx'; // Data Inicio do Limite

             // Se Parametro sgCodForn ------------------------------
             If Trim(sgCodForn)<>'' Then
              MySqlLinx:=
               MySqlLinx+' AND   mf.codigo_cliente = :CodForn';

  MySqlLinx:=
   MySqlLinx+' GROUP BY 1,2,3,4,6,7,8,10,11,12,14,15,16,17,20,21,22,23'+
             ' ORDER BY 1,3';
  // Monta Select de Busca de Debitos e Créditos (LINX) ========================
  //============================================================================

  MySqlLinx:= MySql + MySqlLinx;
end; // Monta SQL's Para Busca SIDICOM / LINX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Produtos / Compradores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.ProdutosCompradores;
Var
  MySql: String;
Begin
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

    MySql:=' DELETE FROM PRODUTOS_COMPRADORES';
    DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

    MySql:=' INSERT INTO PRODUTOS_COMPRADORES'+
           ' (CODPRODUTO, COD_PRODUTO, DES_PRODUTO, COD_COMPRADOR, DES_COMPRADOR,'+
           '  COD_FORNECEDOR, DES_FORNECEDOR, ID_SETOR, DESC_SETOR, ID_COLECAO,'+
           '  DESC_COLECAO, DESATIVADO, NUM_ORDENS, CD_COMPRA, QTD_VENDA15DD)'+

           ' SELECT'+
           ' cp.cod_item CODPRODUTO,'+
           ' pr.cod_produto COD_PRODUTO,'+
           ' pr.nome DES_PRODUTO,'+
           ' cp.cod_comprador COD_COMPRADOR,'+
           ' cp.des_usuario DES_COMPRADOR,'+
           ' pr.cod_fornecedor COD_FORNECEDOR,'+
           ' fo.nome_cliente DES_FORNECEDOR,'+
           ' pr.id_setor ID_SETOR,'+
           ' pr.desc_setor DESC_SETOR,'+
           ' pr.id_colecao ID_COLECAO,'+
           ' pr.desc_colecao DESC_COLECAO,'+
           ' pr.desativado DESATIVADO,'+
           ' cp.num_ordens NUM_ORDENS,'+
           ' cp.oc_cd CD_COMPRA,'+
           ' CAST(((SUM(COALESCE(dm.qtd_venda_dia,0.0000))) * 15) AS INTEGER) QTD_VENDAS15DD'+

           ' FROM LINXPRODUTOS pr,'+
           '      LINXCLIENTESFORNEC fo,'+
           '      ES_DEMANDAS_4MESES dm,'+
           '      (SELECT DISTINCT co.cod_Item,'+
           '                       co.cod_comprador,'+
           '                       co.num_ordens,'+
           '                       co.des_usuario,'+
           '                       co.oc_cd'+
           '               FROM (SELECT oc.cod_item,'+
           '                            oc.cod_comprador,'+
           '                            us.des_usuario,'+
           '                            CASE'+
           '                              WHEN oc.cod_empresa=''99'' THEN'+
           '                                ''S'''+
           '                              ELSE'+
           '                                ''N'''+
           '                            END OC_CD,'+
           '                            COUNT(oc.num_seq) NUM_ORDENS'+
           '                     FROM OC_COMPRAR oc,'+
           '                          PS_USUARIOS us,'+
           '                          EMP_CONEXOES em'+
           '                     WHERE oc.cod_comprador=us.cod_usuario'+
           '                     AND   oc.cod_empresa=em.cod_filial'+
           '                     AND   oc.cod_comprador<>0'+
           '                     AND   em.cod_linx<>0'+
           '                     AND   em.dta_inicio_linx IS NOT NULL'+
           '                     AND   em.dta_inventario_linx IS NOT NULL'+
           '                     AND   ((COALESCE(oc.num_oc_gerada,0)<>0)'+
           '                            or'+ // Manuela Sem OC: Loreal-47 Wella-1298-164 Delly-356 (Códigos Sidicom)
           '                            (oc.cod_comprador=205 AND COALESCE(oc.num_oc_gerada,0)=0'+
           '                             AND oc.cod_fornecedor in (''000047'', ''001298'', ''000164'', ''000356'')))'+
           '                     GROUP BY 1,2,3,4) co) cp'+

           ' WHERE pr.cod_auxiliar=cp.cod_item'+
           ' AND   pr.cod_fornecedor=fo.cod_cliente'+
           ' AND   pr.cod_auxiliar=dm.codproduto'+

           ' GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14';
    DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMAtualizaSeteHoras.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    tgMySqlErro.Add('ProdutosCompradores - OK - '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
    tgMySqlErro.Add('==================================');
    tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');
  Except
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMAtualizaSeteHoras.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      tgMySqlErro.Add('ProdutosCompradores - ERRO  -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');
    End; // on e : Exception do
  End; // Try

End; // Atualiza Produtos / Compradores >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Calcula Demanda de 4 Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.Demanda4Meses;
Var
  MySql: String;

  dDtaHoje, dDtaInicio, dDtaFim, dDtaCalculo: TDate;

  sCodLjSID, sCodLjLinx,
  sMes1, sMes2, sMes3, sMes4, sMes5: String;

  i: Integer;
  bDomingo: Boolean;
Begin
  dDtaHoje  :=DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor);
  dDtaInicio:=IncMonth(dDtaHoje,-4);
  dDtaInicio:=PrimUltDia(dDtaInicio,'P');
  dDtaFim   :=dDtaHoje-1;

  sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',DateToStr(dDtaInicio)));
  sgDtaFim   :=f_Troca('/','.',f_Troca('-','.',DateToStr(dDtaFim)));

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

  MySql:=' SELECT e.cod_filial, e.cod_linx, e.ind_domingo'+
         ' FROM EMP_CONEXOES e'+
         ' WHERE e.ind_ativo=''SIM'''+
         ' AND   e.dta_inicio_linx IS NOT NULL'+
         //OpssAqui
         // Somente Uma Loja
         // ' AND   e.cod_linx=28'+ // Blumenaur
         ' ORDER BY 3,2';
  DMAtualizaSeteHoras.CDS_Lojas.Close;
  DMAtualizaSeteHoras.SDS_Lojas.CommandText:=MySql;
  DMAtualizaSeteHoras.CDS_Lojas.Open;

  DMAtualizaSeteHoras.CDS_Lojas.DisableControls;
  While Not DMAtualizaSeteHoras.CDS_Lojas.Eof do
  Begin
    // Monta Transacao ===========================================================
    TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
    TD.IsolationLevel:=xilREADCOMMITTED;
    DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
    Try
      DateSeparator:='.';
      DecimalSeparator:='.';

      sCodLjSID  :=DMAtualizaSeteHoras.CDS_Lojas.FieldByName('Cod_Filial').AsString;
      sCodLjLinx :=DMAtualizaSeteHoras.CDS_Lojas.FieldByName('Cod_Linx').AsString;
      bDomingo   :=(DMAtualizaSeteHoras.CDS_Lojas.FieldByName('Ind_Domingo').AsString='S');
      igDiasUteis:=DiasUteisBelShop(dDtaInicio, dDtaFim, bDomingo, True);

      MySql:=' DELETE'+
             ' FROM ES_DEMANDAS_4MESES d4'+
             ' WHERE d4.cod_linx='+sCodLjLinx;
      DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

      MySql:=' INSERT INTO ES_DEMANDAS_4MESES'+
             ' (CODFILIAL, COD_LINX, CODPRODUTO, COD_PROD_LINX, QTD_VENDA_M1,'+
             '  QTD_VENDA_M2, QTD_VENDA_M3, QTD_VENDA_M4, QTD_VENDA_M5,'+
             '  QTD_VENDA, QTD_VENDA_DIA, VLR_VENDA_M1, VLR_VENDA_M2,'+
             '  VLR_VENDA_M3, VLR_VENDA_M4, VLR_VENDA_M5, VLR_VENDA, VLR_VENDA_DIA,'+
             '  PERIODO_INICIO, PERIODO_FIM, DIAS_UTEIS, DTA_ATUALIZACAO, HRA_ATUALIZACAO)'+

             ' SELECT dem.codfilial, emp.cod_linx, dem.codproduto, dem.cod_prod_linx,'+

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


             ' CAST((SUM(CAST(dem.quant_ref AS NUMERIC(12,4))) / '+IntToStr(igDiasUteis)+') AS NUMERIC(12,4)) qtd_venda_dia,'+

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

             ' CAST((SUM(CAST(dem.preco AS NUMERIC(12,4))) / '+IntToStr(igDiasUteis)+') AS NUMERIC(12,2)) vlr_venda_dia, '+

             QuotedStr(sgDtaInicio)+' periodo_inicio, '+
             QuotedStr(sgDtaFim)+' periodo_fim, '+
             IntToStr(igDiasUteis)+' dias_uteis,'+

             ' CURRENT_DATE dta_atualizacao,'+
             ' CURRENT_TIME hra_atualizacao'+

             ' FROM MOVTOS_EMPRESAS dem, EMP_CONEXOES emp'+
             ' WHERE dem.codfilial=emp.cod_filial'+
             ' AND   dem.cod_linx=emp.cod_linx'+
             ' AND   dem.ind_tipo = ''DM'''+
             ' AND   dem.dta_ref >= '+QuotedStr(sgDtaInicio)+
             ' AND   dem.dta_ref <='+QuotedStr(sgDtaFim)+
             ' AND   dem.codfilial='+QuotedStr(sCodLjSID)+
             ' AND   dem.cod_linx='+sCodLjLinx+

             ' GROUP BY 1, 2, 3, 4';
      DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

      // Atualiza Transacao ======================================================
      DMAtualizaSeteHoras.SQLC.Commit(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      tgMySqlErro.Add('Demanda4Meses OK - Loja Linx: '+sCodLjLinx+' Proc: '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');

    Except
      on e : Exception do
      Begin
        // Abandona Transacao ====================================================
        DMAtualizaSeteHoras.SQLC.Rollback(TD);

        DateSeparator:='/';
        DecimalSeparator:=',';

        tgMySqlErro.Add('Demanda4Meses ERRO - Loja Linx: '+sCodLjLinx+' Proc: '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
        tgMySqlErro.Add('ERROR: '+e.message);
        tgMySqlErro.Add(MySql);
        tgMySqlErro.Add('==================================');
        tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');

      End; // on e : Exception do
    End; // Try

    DMAtualizaSeteHoras.CDS_Lojas.Next;
  End; // While Not DMAtualizaSeteHoras.CDS_Lojas.Eof do
  DMAtualizaSeteHoras.CDS_Lojas.EnableControls;
  DMAtualizaSeteHoras.CDS_Lojas.Close;

End; // Calcula Demanda de 4 Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Busca Movtos de Debito/Credito de Fornecedores LINX - NOVO >>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.BuscaMovtosDebCreLINX;
Var
   i: Integer;
   MySql: String;
   sCodFornLINX, sNomeFornLINX, // Fornecedor Linx de Vinculo
   sCodFornVinc, sNomeFornVinc, // Fornecedor Linx Vinculado
   sNumSeq, sPercRed,
   sDtaMovtoLinx: String;
Begin

  // Acerta Data do Movto em Relação a Data de Início da Loja ==================
  sDtaMovtoLinx:=sgDtaIniLINX;

//opss === ATENÇÃO === Comentar para Buscar todo o Movto Linx Depois Retornar
  If StrToDate(f_Troca('.','/',f_Troca('-','/',sDtaMovtoLinx)))<StrToDate(f_Troca('.','/',f_Troca('-','/',sgDtaInicio))) Then
   sDtaMovtoLinx:=sgDtaInicio;

  sDtaMovtoLinx:=f_Troca('/','.',f_Troca('-','.',sDtaMovtoLinx));

  // Acerta Data de Processamento das Conta Correntes ==========================
  If StrToDate(f_Troca('.','/',f_Troca('-','/',sgDtaProcCC)))>StrToDate(f_Troca('.','/',f_Troca('-','/',sDtaMovtoLinx))) Then
   sgDtaProcCC:=sDtaMovtoLinx;

  // Monta Transacao =======================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Acerta Códigos Vinculados = NULL ========================================
    MySql:=' UPDATE FL_CAIXA_FORNECEDORES f'+
           ' SET f.cod_vinculado=f.cod_fornecedor'+
           ' ,   f.des_vinculado=f.des_fornecedor'+
           ' WHERE ((f.cod_vinculado IS NULL) OR (COALESCE(TRIM(f.des_vinculado),'''')=''''))'+
           ' AND   f.num_seq NOT IN (0,999999)';
    DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

    // Busca Movtos Debitos / Creditos =========================================
    DMAtualizaSeteHoras.CDS_MovtoLinx.Close;
    DMAtualizaSeteHoras.SDS_MovtoLinx.CommandText:=MySqlLinx;
    DMAtualizaSeteHoras.SDS_MovtoLinx.Params.ParamByName('CodEmpLINX').AsString:=sgCodEmpLINX;
    DMAtualizaSeteHoras.SDS_MovtoLinx.Params.ParamByName('DtaInicioLinx').AsString:=sDtaMovtoLinx;
    try
    If Trim(sgCodForn)<>'' Then
     DMAtualizaSeteHoras.SDS_MovtoLinx.Params.ParamByName('CodForn').AsString:=sgCodForn;
    except
      on e : Exception do
      Begin
        tgMySqlErro.Add('BuscaMovtosDebCreLINX: Loja '+sgCodEmpLINX+' - ERRO  -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
        tgMySqlErro.Add('ERROR: '+e.message);
        tgMySqlErro.Add(MySql);
        tgMySqlErro.Add('==================================');
        tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');
      End; // on e : Exception do
    End;
    DMAtualizaSeteHoras.CDS_MovtoLinx.Open;

    If Trim(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('Cod_Fornecedor').AsString)='' Then
    Begin
      // Fecha Transacao =================================================
      DMAtualizaSeteHoras.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      DMAtualizaSeteHoras.CDS_MovtoLinx.Close;
      Exit;
    End;

//opss - Retornar
    // Guarda Codigo do Fornecedor =============================================
    MySql:=' SELECT DISTINCT f.cod_fornecedor, f.cod_vinculado'+
           ' FROM FL_CAIXA_FORNECEDORES f'+
           ' WHERE f.cod_empresa='+sgCodEmpLINX+
           ' AND   f.dta_caixa>='+QuotedStr(sDtaMovtoLinx)+
           ' AND   f.num_seq NOT IN (0,999999)'+
           ' AND   EXISTS (SELECT 1'+
           '               FROM TAB_AUXILIAR cf, fl_caixa_historicos hi'+
           '               WHERE cf.tip_aux=25'+ // CONTA CORRENTE FORNECEDORES - CFops Utilizados
           '               AND   CAST(cf.des_aux AS INTEGER)=hi.cod_historico'+
           '               AND   hi.cod_historico=f.cod_historico)';

           If Trim(sgCodForn)<>'' Then
            MySql:=
             MySql+' AND f.cod_vinculado in ('+QuotedStr(sgCodForn)+')';
    DMAtualizaSeteHoras.CDS_Busca.Close;
    DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
    DMAtualizaSeteHoras.CDS_Busca.Open;

    While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
    Begin
      sCodFornLINX:=DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_fornecedor').AsString;
      sCodFornVinc:=DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_vinculado').AsString;

      // Guarda Fornecedor a Processar Conta Correte ------------
      bgProcessar:=True;
      For i:=0 to Mem_Odir.Lines.Count-1 do
      Begin
         If Mem_Odir.Lines[i]=sCodFornLINX+'-'+sDtaMovtoLinx Then
         Begin
           bgProcessar:=False;
           Break;
         End;
      End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do

      If bgProcessar Then
      Begin
        Mem_Odir.Lines.Add(sCodFornLINX+'-'+sDtaMovtoLinx);
      End;

      // Exclui Lançamentos para Substituição e Inclução ------
      MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES f'+
             ' WHERE f.cod_empresa='+sgCodEmpLINX+
             ' AND   f.dta_caixa>='+QuotedStr(sDtaMovtoLinx)+
             ' AND   f.cod_vinculado='+sCodFornVinc+
             ' AND   f.num_seq NOT IN (0,999999)'+
             ' AND   EXISTS (SELECT 1'+
             '               FROM TAB_AUXILIAR cf, fl_caixa_historicos hi'+
             '               WHERE cf.tip_aux=25'+ // CONTA CORRENTE FORNECEDORES - CFops Utilizados
             '               AND   CAST(cf.des_aux AS INTEGER)=hi.cod_historico'+
             '               AND   hi.cod_historico=f.cod_historico)';
      DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

      DMAtualizaSeteHoras.CDS_Busca.Next;
    End; // While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
    DMAtualizaSeteHoras.CDS_Busca.Close;

    sgDtaFim     :='';
    sCodFornLINX :='';
    sNomeFornLINX:='';
    sCodFornVinc :='';
    sNomeFornVinc:='';
    While Not DMAtualizaSeteHoras.CDS_MovtoLinx.Eof do
    Begin
      sgDtaFim     :=DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('DTA_CAIXA').AsString;
      sCodFornLINX :=Trim(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('COD_FORNECEDOR').AsString);
      sNomeFornLINX:=Trim(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('DES_FORNECEDOR').AsString);

      sCodFornVinc :=DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('COD_VINCULADO').AsString;
      sNomeFornVinc:=DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('DES_VINCULADO').AsString;
      If Trim(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('COD_VINCULADO').AsString)='' Then
      Begin
        sCodFornVinc :=DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('COD_FORNECEDOR').AsString;
        sNomeFornVinc:=DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('DES_FORNECEDOR').AsString;
      End;

      //========================================================================
      // Insere Conta Corrente =================================================
      //========================================================================
      // Busca Num_Seq do Dia do Fornecedor -----------------------
      MySql:=' SELECT cf.num_seq'+
             ' FROM FL_CAIXA_FORNECEDORES cf'+
             ' WHERE cf.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaFim)))+
             ' AND   cf.cod_fornecedor='+QuotedStr(sCodFornLINX)+
             ' AND   cf.num_seq NOT IN (0,999999)'+
             ' ORDER BY cf.Num_Seq';
      DMAtualizaSeteHoras.CDS_Busca.Close;
      DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
      DMAtualizaSeteHoras.CDS_Busca.Open;

      sNumSeq:=IntToStr(DMAtualizaSeteHoras.CDS_Busca.RecordCount+1);
      DMAtualizaSeteHoras.CDS_Busca.First;
      DMAtualizaSeteHoras.CDS_Busca.DisableControls;
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
      DMAtualizaSeteHoras.CDS_Busca.EnableControls;

      // Percentual de Redução --------------------------------------
      sPercRed:=f_Troca(',','.',ZerosCentavos(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('PER_REDUCAO').AsString,2));

      // Insere Caixa ---------------------------------------------
      MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES ('+
             ' COD_FORNECEDOR, DES_FORNECEDOR,'+
             ' COD_VINCULADO, DES_VINCULADO,'+
             ' VLR_ORIGEM, DTA_ORIGEM, DTA_CAIXA, NUM_SEQ,'+
             ' NUM_CHAVENF, COD_EMPRESA, COD_HISTORICO, TXT_OBS,'+
             ' NUM_DOCUMENTO, NUM_SERIE, PER_REDUCAO, TIP_DEBCRE, VLR_CAIXA, VLR_SALDO,'+
             ' CODFORNECEDOR, COD_LOJA_LINX, COD_LOJA_SIDICOM)'+
             ' VALUES ('+
             sCodFornLINX+', '+ // COD_FORNECEDOR (LINX) - Fornecedor de Vinculo
             QuotedStr(sNomeFornLINX)+', '+ // DES_FORNECEDOR (LINX) - Fornecedor de Vinculo
             sCodFornVinc+', '+ // COD_VINCULADO (LINX) - Fornecedor Vinculado
             QuotedStr(sNomeFornVinc)+', '+ // DES_VINCULADO (LINX) - Fornecedor Vinculado
             DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('VLR_ORIGEM').AsString+', '+ // VLR_ORIGEM
             QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('DTA_ORIGEM').AsString)+', '+ // DTA_ORIGEM
             QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('DTA_CAIXA').AsString)+', '+ // DTA_CAIXA
             sNumSeq+', '+ // NUM_SEQ
             QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('NUM_CHAVENF').AsString)+', '+ // NUM_CHAVENF
             sgCodEmpLINX+', '+ // COD_EMPRESA
             DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('COD_HISTORICO').AsString+', '+ // COD_HISTORICO
             QuotedStr(AnsiUpperCase(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('TXT_OBS').AsString))+', '+ // TXT_OBS
             QuotedStr(Trim(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('NUM_DOCUMENTO').AsString))+', '+ // NUM_DOCUMENTO
             QuotedStr(Trim(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('NUM_SERIE').AsString))+', '+ // NUM_SERIE
             sPercRed+', '+ // PER_REDUCAO,
             QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('TIP_DEBCRE').AsString)+', '+ // TIP_DEBCRE

             'CAST(('+DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('VLR_CAIXA').AsString+
                    '-(('+sPercRed+' * '+DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('VLR_CAIXA').AsString+
                    ') / 100)) AS NUMERIC(12,2)), '+ // VLR_CAIXA

             f_Troca(',','.',ZerosCentavos(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('VLR_SALDO').AsString,2))+', '+ // VLR_SALDO
             QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('CODFORNECEDOR').AsString)+', '+ // CODFORNECEDOR VARCHAR(6)
             sgCodEmpLINX+', '+ // COD_LOJA_LINX INTEGER
             QuotedStr(sgCodEmp)+')'; // COD_LOJA_SIDICOM VARCHAR(2)
      DMAtualizaSeteHoras.SQLC.Execute(MySql, nil, nil);

      // Guarda Fornecedor a Processar Conta Correte --------------
      bgProcessar:=True;
      For i:=0 to Mem_Odir.Lines.Count-1 do
      Begin
         If Mem_Odir.Lines[i]=sCodFornLINX+'-'+sDtaMovtoLinx Then
         Begin
           bgProcessar:=False;
           Break;
         End;
      End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do

      If bgProcessar Then
      Begin
        Mem_Odir.Lines.Add(sCodFornLINX+'-'+sDtaMovtoLinx);
      End;
      // Insere Conta Corrente =================================================
      //========================================================================
                                              
      DMAtualizaSeteHoras.CDS_MovtoLinx.Next;
    End; // While Not DMAtualizaSeteHoras.CDS_MovtoLinx.Eof do
    DMAtualizaSeteHoras.CDS_MovtoLinx.Close;

    // Fecha Transacao =================================================
    DMAtualizaSeteHoras.SQLC.Commit(TD);

    DateSeparator:='/';
    DecimalSeparator:=',';

    tgMySqlErro.Add('BuscaMovtosDebCreLINX: Loja '+sgCodEmpLINX+' - OK - '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
    tgMySqlErro.Add('==================================');
    tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');

  Except
    on e : Exception do
    Begin
      DMAtualizaSeteHoras.SQLC.Rollback(TD);

      DateSeparator:='/';
      DecimalSeparator:=',';

      tgMySqlErro.Add('BuscaMovtosDebCreLINX: Loja '+sgCodEmpLINX+' - ERRO  -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');
    End; // on e : Exception do
  End; // Try

End; // Busca Movtos de Debito/Credito de Fornecedores LINX - NOVO >>>>>>>>>>>>>

// OdirApagar Substituido
//// Busca Movtos de Debito/Credito de Fornecedores LINX >>>>>>>>>>>>>>>>>>>>>>>>>
//Procedure TFrmAtualizaSeteHoras.BuscaMovtosDebCreLINX_OLD;
//Var
//   i: Integer;
//   MySql: String;
//   sCodFornLINX, sNomeFornLINX, // Fornecedor Linx de Vinculo
//   sCodFornVinc, sNomeFornVinc, // Fornecedor Linx Vinculado
//   sNumSeq, sPercRed,
//   sDtaMovtoLinx: String;
//Begin
//
//  // Acerta Data do Movto em Relação a Data de Início da Loja ==================
//  sDtaMovtoLinx:=sgDtaIniLINX;
//
////opss === ATENÇÃO === Comentar para Buscar todo o Movto Linx Depois retornar
////  If StrToDate(f_Troca('.','/',f_Troca('-','/',sDtaMovtoLinx)))<StrToDate(f_Troca('.','/',f_Troca('-','/',sgDtaInicio))) Then
////   sDtaMovtoLinx:=sgDtaInicio;
//
//  sDtaMovtoLinx:=f_Troca('/','.',f_Troca('-','.',sDtaMovtoLinx));
//
//  // Acerta Data de Processamento das Conta Correntes ==========================
//  If StrToDate(f_Troca('.','/',f_Troca('-','/',sgDtaProcCC)))>StrToDate(f_Troca('.','/',f_Troca('-','/',sDtaMovtoLinx))) Then
//   sgDtaProcCC:=sDtaMovtoLinx;
//
//  // Busca Movtos Debitos / Creditos ===========================================
//  DMAtualizaSeteHoras.CDS_MovtoLinx.Close;
//  DMAtualizaSeteHoras.SDS_MovtoLinx.CommandText:=MySqlLinx;
//  DMAtualizaSeteHoras.SDS_MovtoLinx.Params.ParamByName('CodEmpLINX').AsString:=sgCodEmpLINX;
//  DMAtualizaSeteHoras.SDS_MovtoLinx.Params.ParamByName('DtaInicioLinx').AsString:=sDtaMovtoLinx;
//  If Trim(sgCodForn)<>'' Then
//   DMAtualizaSeteHoras.SDS_MovtoLinx.Params.ParamByName('CodForn').AsString:=sgCodForn;
//  DMAtualizaSeteHoras.CDS_MovtoLinx.Open;
//
//  If Trim(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('codfornecedor').AsString)='' Then
//  Begin
//    DMAtualizaSeteHoras.CDS_MovtoLinx.Close;
//    Exit;
//  End;
//
//  // Monta Transacao =======================================================
//  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//  TD.IsolationLevel:=xilREADCOMMITTED;
//  DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
//  Try
//    DateSeparator:='.';
//    DecimalSeparator:='.';
//
//    // Acerta Códigos Vinculados = NULL ========================================
//    MySql:=' UPDATE FL_CAIXA_FORNECEDORES f'+
//           ' SET f.cod_vinculado=f.cod_fornecedor'+
//           ' ,   f.des_vinculado=f.des_fornecedor'+
//           ' WHERE f.cod_vinculado IS NULL';
//    DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);
//
//    // Guarda Codigo do Fornecedor =========================================
//    // Exclui Lançamentos para Substituição e Inclusão =========================
////OdirApagar - 02/05/2018 -- cod_vinculado
////    MySql:=' SELECT DISTINCT f.cod_fornecedor'+
//    MySql:=' SELECT DISTINCT f.cod_fornecedor, f.cod_vinculado'+
//           ' FROM FL_CAIXA_FORNECEDORES f'+
//           ' WHERE f.cod_empresa='+QuotedStr(sgCodEmpLINX)+
//           ' AND   f.dta_caixa>='+QuotedStr(sDtaMovtoLinx);
//
////OdirApagar - 02/05/2018 -- cod_vinculado
////           If Trim(sgCodForn)<>'' Then
////            MySql:=
////             MySql+' AND f.cod_fornecedor in ('+QuotedStr(sgCodForn)+')';
//
//           If Trim(sgCodForn)<>'' Then
//            MySql:=
//             MySql+' AND f.cod_vinculado in ('+QuotedStr(sgCodForn)+')';
//    DMAtualizaSeteHoras.CDS_Busca.Close;
//    DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
//    DMAtualizaSeteHoras.CDS_Busca.Open;
//
//    While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
//    Begin
//      sCodFornLINX:=DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_fornecedor').AsString;
//      sCodFornVinc:=DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_vinculado').AsString;
//
//      // Guarda Fornecedor a Processar Conta Correte ------------
//      bgProcessar:=True;
//      For i:=0 to Mem_Odir.Lines.Count-1 do
//      Begin
//         If Mem_Odir.Lines[i]=sCodFornLINX Then
//         Begin
//           bgProcessar:=False;
//           Break;
//         End;
//      End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do
//
//      If bgProcessar Then
//      Begin
//        Mem_Odir.Lines.Add(sCodFornLINX);
//      End;
//
//      // Exclui Lançamentos para Substituição e Inclução ------
//      MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES f'+
////OdirApagar - 02/05/2018 -- cod_vinculado
////             ' WHERE f.cod_fornecedor = '+QuotedStr(sCodFornLINX)+
//             ' WHERE f.cod_vinculado = '+QuotedStr(sCodFornVinc)+
//             ' AND   f.dta_caixa>='+QuotedStr(sDtaMovtoLinx)+
//             ' AND ((f.cod_historico=0 or f.cod_historico=999999)'+
//             '      OR'+
//             '      (f.cod_empresa='+QuotedStr(sgCodEmpLINX)+'))'+
//             ' AND  f.cod_historico not in (900,955)';
//      DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);
//
//      DMAtualizaSeteHoras.CDS_Busca.Next;
//    End; // While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
//    DMAtualizaSeteHoras.CDS_Busca.Close;
//
//    sgDtaFim     :='';
//    sCodFornLINX :='';
//    sNomeFornLINX:='';
//    sCodFornVinc :='';
//    sNomeFornVinc:='';
//    While Not DMAtualizaSeteHoras.CDS_MovtoLinx.Eof do
//    Begin
//      sgDtaFim     :=DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('dataentrada').AsString;
//      sCodFornVinc :=DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('codfornecedor').AsString;
//      sNomeFornVinc:=DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('nomefornecedor').AsString;
//
//      // Busca Fornecedor de Vinculo -------------------------------
//      sCodFornLINX :=sCodFornVinc;
//      sNomeFornLINX:=sNomeFornVinc;
//      MySql:=' SELECT f.cod_fornecedor, f.des_fornecedor'+
//             ' FROM FL_CAIXA_FORNECEDORES f'+
//             ' WHERE f.cod_vinculado='+sCodFornVinc;
//      DMAtualizaSeteHoras.CDS_Busca.Close;
//      DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
//      DMAtualizaSeteHoras.CDS_Busca.Open;
//
//      If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)<>'' Then
//      Begin
//        sCodFornLINX :=Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('Cod_Fornecedor').AsString);
//        sNomeFornLINX:=Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('Des_Fornecedor').AsString);
//      End;
//      DMAtualizaSeteHoras.CDS_Busca.Close;
//
//      // Verifica se Tem Historico de Negociação (900, 955) ---
////OdirApagar - 02/05/2018 -- cod_vinculado
////;      MySql:=' SELECT FIRST 1 f.cod_fornecedor'+
//      MySql:=' SELECT FIRST 1 f.cod_vinculado cod_fornecedor'+
//             ' FROM FL_CAIXA_FORNECEDORES f'+
//             ' WHERE f.cod_historico  in (900,955)'+
////OdirApagar - 02/05/2018 -- cod_vinculado
////             ' AND   f.cod_fornecedor='+sCodFornLINX;
//             ' AND   f.cod_vinculado='+sCodFornVinc;
//      DMAtualizaSeteHoras.CDS_Busca.Close;
//      DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
//      DMAtualizaSeteHoras.CDS_Busca.Open;
//      bgAchoFornCC:=True;
//      If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_fornecedor').AsString)='' Then
//       bgAchoFornCC:=False;
//      DMAtualizaSeteHoras.CDS_Busca.Close;
//
//      //========================================================================
//      If bgAchoFornCC Then
//      Begin
//        // Busca Num_Seq do Dia do Fornecedor -----------------------
//        MySql:=' SELECT cf.num_seq'+
//               ' FROM FL_CAIXA_FORNECEDORES cf'+
//               ' WHERE cf.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaFim)))+
////OdirApagar - 02/05/2018 -- cod_vinculado
////               ' AND   cf.cod_fornecedor='+QuotedStr(sCodFornLINX)+
//               ' AND   cf.cod_vinculado='+QuotedStr(sCodFornVinc)+
//               ' AND   cf.num_seq>0'+
//               ' AND   cf.num_seq<999999'+
//               ' ORDER BY cf.Num_Seq';
//        DMAtualizaSeteHoras.CDS_Busca.Close;
//        DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
//        DMAtualizaSeteHoras.CDS_Busca.Open;
//        i:=1;
//        sNumSeq:=IntToStr(DMAtualizaSeteHoras.CDS_Busca.RecordCount+1);
//        While not DMAtualizaSeteHoras.CDS_Busca.Eof do
//        Begin
//          If DMAtualizaSeteHoras.CDS_Busca.RecNo<>DMAtualizaSeteHoras.CDS_Busca.FieldByName('Num_Seq').AsInteger Then
//          Begin
//            sNumSeq:=IntToStr(DMAtualizaSeteHoras.CDS_Busca.RecNo);
//            Break;
//          End;
//
//          DMAtualizaSeteHoras.CDS_Busca.Next;
//        End; // While not DMAtualizaSeteHoras.CDS_Busca.Eof do
//        DMAtualizaSeteHoras.CDS_Busca.Close;
//
//        // Busca Percentual de Redução ------------------------------
//        MySql:=' SELECT r.per_reducao'+
//               ' FROM FL_CAIXA_PERC_REDUCAO r'+
////OdirApagar - 02/05/2018 -- cod_vinculado
////               ' WHERE r.cod_fornecedor ='+sCodFornLINX+
//               ' WHERE r.cod_fornecedor ='+sCodFornVinc+
//               ' AND   r.cod_comprovante='+QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('CODCOMPROVANTE').AsString)+
//               ' AND   CAST('+QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('DATAENTRADA').AsString)+' AS DATE)'+
//               '                 BETWEEN r.dta_incio AND COALESCE(r.dta_fim, CAST(''31.12.3000'' AS DATE))';
//        DMAtualizaSeteHoras.CDS_Busca.Close;
//        DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
//        DMAtualizaSeteHoras.CDS_Busca.Open;
//        sPercRed:='0.00';
//        If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('per_reducao').AsString)<>'' Then
//         sPercRed:=f_Troca(',','.',DMAtualizaSeteHoras.CDS_Busca.FieldByName('per_reducao').AsString);
//        DMAtualizaSeteHoras.CDS_Busca.Close;
//
//        // Insere Caixa ---------------------------------------------
//        MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES ('+
//               ' COD_FORNECEDOR, DES_FORNECEDOR,'+
//               ' COD_VINCULADO, DES_VINCULADO,'+
//               ' VLR_ORIGEM, DTA_ORIGEM, DTA_CAIXA, NUM_SEQ,'+
//               ' NUM_CHAVENF, COD_EMPRESA, COD_HISTORICO, TXT_OBS,'+
//               ' NUM_DOCUMENTO, NUM_SERIE, PER_REDUCAO, TIP_DEBCRE, VLR_CAIXA, VLR_SALDO,'+
//               ' CODFORNECEDOR, COD_LOJA_LINX, COD_LOJA_SIDICOM)'+
//               ' VALUES ('+
//               sCodFornLINX+', '+ // COD_FORNECEDOR (LINX) - Fornecedor de Vinculo
//               QuotedStr(sNomeFornLINX)+', '+ // DES_FORNECEDOR (LINX) - Fornecedor de Vinculo
//               sCodFornVinc+', '+ // COD_VINCULADO (LINX)
//               QuotedStr(sNomeFornVinc)+', '+ // DES_VINCULADO (LINX)
//               DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('VLR_TOTAL').AsString+', '+ // VLR_ORIGEM
//               QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('DATACOMPROVANTE').AsString)+', '+ // DTA_ORIGEM
//               QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('DATAENTRADA').AsString)+', '+ // DTA_CAIXA
//               sNumSeq+', '+ // NUM_SEQ
//               QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('CHAVENF').AsString)+', '+ // NUM_CHAVENF
//               QuotedStr(sgCodEmpLINX)+', '+ // COD_EMPRESA
//               QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('CODCOMPROVANTE').AsString)+', '+ // COD_HISTORICO,
//               QuotedStr(AnsiUpperCase(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('OBSERVACAO').AsString))+', '+ // TXT_OBS
//               QuotedStr(Trim(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('NUMERO').AsString))+', '+ // NUM_DOCUMENTO
//               QuotedStr(Trim(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('SERIE').AsString))+', '+ // NUM_SERIE
//               sPercRed+', '+ // PER_REDUCAO,
//               QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('TP_DEBCRE').AsString)+', '+ // TIP_DEBCRE
//               'CAST(('+DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('VLR_TOTAL').AsString+
//                      '-(('+sPercRed+' * '+DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('VLR_TOTAL').AsString+
//                      ') / 100)) AS NUMERIC(12,2)),'+ // VLR_CAIXA
//               ' 0.00,'+ // VLR_SALDO
//               QuotedStr(DMAtualizaSeteHoras.CDS_MovtoLinx.FieldByName('Cod_Forn_Sidicom').AsString)+', '+ // CODFORNECEDOR VARCHAR(6)
//               QuotedStr(sgCodEmpLINX)+', '+ // COD_LOJA_LINX INTEGER
//               QuotedStr(sgCodEmp)+')'; // COD_LOJA_SIDICOM VARCHAR(2)
//        DMAtualizaSeteHoras.SQLC.Execute(MySql, nil, nil);
//
//        // Guarda Fornecedor a Processar Conta Correte --------------
//        bgProcessar:=True;
//        For i:=0 to Mem_Odir.Lines.Count-1 do
//        Begin
//           If Mem_Odir.Lines[i]=sCodFornLINX Then
//           Begin
//             bgProcessar:=False;
//             Break;
//           End;
//        End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do
//
//        If bgProcessar Then
//        Begin
//          Mem_Odir.Lines.Add(sCodFornLINX);
//        End;
//      End; // If bgAchoFornCC Then
//      //========================================================================
//
//      DMAtualizaSeteHoras.CDS_MovtoLinx.Next;
//    End; // While Not DMAtualizaSeteHoras.CDS_MovtoLinx.Eof do
//    DMAtualizaSeteHoras.CDS_MovtoLinx.Close;
//
//    // Fecha Transacao =================================================
//    DMAtualizaSeteHoras.SQLC.Commit(TD);
//
//    DateSeparator:='/';
//    DecimalSeparator:=',';
//
//  Except
//    on e : Exception do
//    Begin
//      DMAtualizaSeteHoras.SQLC.Rollback(TD);
//
//      // Monta Transacao ===========================================================
//      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//      TD.IsolationLevel:=xilREADCOMMITTED;
//      DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
//
//      MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
//             ' VALUES ('+
//             QuotedStr('80')+', '+
//             '2, '+
//             ' CURRENT_TIMESTAMP,'+
//             QuotedStr('CCr')+', '+ // Linx Com Inventário
//             QuotedStr('Conta Corrente: '+e.message+' - '+MySql)+')'+
//             'MATCHING (COD_LOJA)';
//      DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);
//
//      DMAtualizaSeteHoras.SQLC.Commit(TD); // Linx Com Inventário
//
//      DateSeparator:='/';
//      DecimalSeparator:=',';
//    End; // on e : Exception do
//  End; // Try
//
//end; // Busca Movtos de Debito/Credito de Fornecedores LINX >>>>>>>>>>>>>>>>>>>>

//OdirApagar - 02/05/2018 -- SIDICOM Desativado
//000000000000000000000000000000000000000000000000000000000000000000000000000000
// Busca Movtos de Debito/Credito de Fornecedores SIDICOM >>>>>>>>>>>>>>>>>>>>>>
//Procedure TFrmAtualizaSeteHoras.BuscaMovtosDebCreSIDICOM;
//Var
//   bSiga: Boolean;
//   i: Integer;
//   MySql: String;
//   sCodForn, sDocForn,
//   sCodFornLINX, sNomeFornLINX, // Fornecedor Linx de Vinculo
//   sCodFornVinc, sNomeFornVinc, // Fornecedor Linx de Vinculo
//   sNumSeq, sPercRed: String;
//Begin
//  bSiga:=False;
//
//  // Conecta Loja =======================================================
//  If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
//   Begin
//     // Cria Query da Empresa ------------------------------------
//     CriaQueryIB('IBDB_'+sgCodEmp,'IBT_'+sgCodEmp, IBQ_ConsultaFilial, True);
//     bSiga:=True;
//   End
//  Else
//   Begin
//     bSiga:=False;
//   End; // If ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'A') Then
//
//  If bSiga Then
//  Begin
//    // Busca Movtos Debitos / Creditos =========================================
//    i:=0;
//    bSiga:=False;
//    While Not bSiga do
//    Begin
//      Try
//        IBQ_ConsultaFilial.Close;
//        IBQ_ConsultaFilial.SQL.Clear;
//        IBQ_ConsultaFilial.SQL.Add(MySqlSelect);
//        IBQ_ConsultaFilial.ParamByName('CodLoja').AsString:=sgCodEmp;
//
//        If Trim(sgCodForn)<>'' Then
//         IBQ_ConsultaFilial.ParamByName('CodForn').AsString:=sgCodForn;
//
//        IBQ_ConsultaFilial.Open;
//
//        bSiga:=True;
//      Except
//        Inc(i);
//      End; // Try
//
//      If i>2 Then
//      Begin
//        Break;
//      End; // If i>10 Then
//    End; // While Not bSiga do
//
//    // Processamento ===========================================================
//    If bSiga Then // Query Executada
//    Begin
//      // Monta Transacao =======================================================
//      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//      TD.IsolationLevel:=xilREADCOMMITTED;
//      DMAtualizaSeteHoras.SQLC.StartTransaction(TD);
//      Try
//        DateSeparator:='.';
//        DecimalSeparator:='.';
//
//        // Guarda Codigo do Fornecedor =========================================
//        // Exclui Lançamentos para Substituição e Inclução =====================
////OdirApagar - 02/05/2018 -- cod_vinculado
////        MySql:=' SELECT DISTINCT f.cod_fornecedor'+
//        MySql:=' SELECT DISTINCT f.cod_vinculado cod_fornecedor'+
//               ' FROM FL_CAIXA_FORNECEDORES f'+
//               ' WHERE f.cod_loja_sidicom='+QuotedStr(sgCodEmp)+
//               ' AND   f.dta_caixa>='+QuotedStr(sgDtaInicio);
//
////OdirApagar - 02/05/2018 -- cod_vinculado
////               If Trim(sgCodForn)<>'' Then
////                MySql:=
////                 MySql+' AND f.cod_fornecedor in ('+QuotedStr(sgCodForn)+')';
//               If Trim(sgCodForn)<>'' Then
//                MySql:=
//                 MySql+' AND f.cod_vinculado in ('+QuotedStr(sgCodForn)+')';
//        DMAtualizaSeteHoras.CDS_Busca.Close;
//        DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
//        DMAtualizaSeteHoras.CDS_Busca.Open;
//
//        While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
//        Begin
//          sCodForn:=DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_fornecedor').AsString;
//
//          // Guarda Fornecedor a Processar Conta Correte ------------
//          bgProcessar:=True;
//          For i:=0 to Mem_Odir.Lines.Count-1 do
//          Begin
//             If Mem_Odir.Lines[i]=sCodForn Then
//             Begin
//               bgProcessar:=False;
//               Break;
//             End;
//          End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do
//
//          If bgProcessar Then
//          Begin
//            Mem_Odir.Lines.Add(sCodForn);
//          End;
//
//          // Exclui Lançamentos para Substituição e Inclução ------
//          MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES f'+
////OdirApagar - 02/05/2018 -- cod_vinculado
////                 ' WHERE f.cod_fornecedor='+sCodForn+
//                 ' WHERE f.cod_vinculado='+sCodForn+
//                 ' AND   f.dta_caixa>='+QuotedStr(sgDtaInicio)+
//                 ' AND ((f.cod_historico=0 or f.cod_historico=999999)'+
//                 '      OR'+
//                 '      (f.cod_loja_sidicom='+QuotedStr(sgCodEmp)+'))'+
//                 ' AND  f.cod_historico not in (900,955)';
//          DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);
//
//          DMAtualizaSeteHoras.CDS_Busca.Next;
//        End; // While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
//        DMAtualizaSeteHoras.CDS_Busca.Close;
//
//        sCodForn     :='';
//        sgDtaFim     :='';
//        sDocForn     :='';
//        sCodFornLINX :='';
//        sNomeFornLINX:='';
//        While Not IBQ_ConsultaFilial.Eof do
//        Begin
//          sgDtaFim:=IBQ_ConsultaFilial.FieldByName('dataentrada').AsString;
//
//          If sCodForn<>IBQ_ConsultaFilial.FieldByName('codfornecedor').AsString Then
//          Begin
//            sCodForn:=IBQ_ConsultaFilial.FieldByName('codfornecedor').AsString;
//            sDocForn:=IBQ_ConsultaFilial.FieldByName('Doc_Forn').AsString;
//
//            // Busca Código Fornecedor LINX -------------------------
//            MySql:=' SELECT c.nome_cliente, c.cod_cliente'+
//                   ' FROM linxclientesfornec c'+
//                   ' WHERE REPLACE(REPLACE(REPLACE('+
//                   '       TRIM(c.doc_cliente), ''/'', ''''), ''.'', ''''), ''-'', '''') = '+QuotedStr(sDocForn);
//            DMAtualizaSeteHoras.CDS_Busca.Close;
//            DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
//            DMAtualizaSeteHoras.CDS_Busca.Open;
//            sCodFornLINX :='';
//            sNomeFornLINX:='';
//            If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_cliente').AsString)<>'' Then
//            Begin
//              sCodFornLINX :=Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_cliente').AsString);
//              sNomeFornLINX:=Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('nome_cliente').AsString)
//            End; // If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_cliente').AsString)<>'' Then
//            DMAtualizaSeteHoras.CDS_Busca.Close;
//
//            // Verifica se Tem Historico de Negociação (900, 955) ---
//            If sCodFornLINX<>'' Then
//            Begin
////OdirApagar - 02/05/2018 -- cod_vinculado
////              MySql:=' SELECT FIRST 1 f.cod_fornecedor'+
//              MySql:=' SELECT FIRST 1 f.cod_vinculado cod_fornecedor'+
//                     ' FROM FL_CAIXA_FORNECEDORES f'+
//                     ' WHERE f.cod_historico  in (900,955)'+
////OdirApagar - 02/05/2018 -- cod_vinculado
////                     ' AND   f.cod_fornecedor='+sCodFornLINX;
//                     ' AND   f.cod_vinculado='+sCodFornLINX;
//              DMAtualizaSeteHoras.CDS_Busca.Close;
//              DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
//              DMAtualizaSeteHoras.CDS_Busca.Open;
//              If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_fornecedor').AsString)='' Then
//              Begin
//                sCodFornLINX :='';
//                sNomeFornLINX:='';
//              End; // If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('cod_cliente').AsString)<>'' Then
//              DMAtualizaSeteHoras.CDS_Busca.Close;
//            End; // If sCodFornLINX<>'' Then
//          End; // If sCodForn<>IBQ_ConsultaFilial.FieldByName('codfornecedor').AsString Then
//
//          // Só Processa Se Encontrou o Fornecedor no LINX e com Negociação (Hist: 900 ou 955)
//          If sCodFornLINX<>'' Then
//          Begin
//            // Busca Num_Seq do Dia do Fornecedor -------------------
//            MySql:=' SELECT cf.num_seq'+
//                   ' FROM FL_CAIXA_FORNECEDORES cf'+
//                   ' WHERE cf.dta_caixa='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDtaFim)))+
////OdirApagar - 02/05/2018 -- cod_vinculado
////                   ' AND   cf.cod_fornecedor='+QuotedStr(sCodFornLINX)+
//                   ' AND   cf.cod_vinculado='+QuotedStr(sCodFornLINX)+
//                   ' AND   cf.num_seq>0'+
//                   ' AND   cf.num_seq<999999'+
//                   ' ORDER BY cf.Num_Seq';
//            DMAtualizaSeteHoras.CDS_Busca.Close;
//            DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
//            DMAtualizaSeteHoras.CDS_Busca.Open;
//            i:=1;
//            sNumSeq:=IntToStr(DMAtualizaSeteHoras.CDS_Busca.RecordCount+1);
//            While not DMAtualizaSeteHoras.CDS_Busca.Eof do
//            Begin
//              If DMAtualizaSeteHoras.CDS_Busca.RecNo<>DMAtualizaSeteHoras.CDS_Busca.FieldByName('Num_Seq').AsInteger Then
//              Begin
//                sNumSeq:=IntToStr(DMAtualizaSeteHoras.CDS_Busca.RecNo);
//                Break;
//              End;
//
//              DMAtualizaSeteHoras.CDS_Busca.Next;
//            End; // While not DMAtualizaSeteHoras.CDS_Busca.Eof do
//            DMAtualizaSeteHoras.CDS_Busca.Close;
//
//            // Busca Percentual de Redução --------------------------------
//            MySql:=' SELECT r.per_reducao'+
//                   ' FROM FL_CAIXA_PERC_REDUCAO r'+
//                   ' WHERE r.cod_fornecedor ='+sCodFornLINX+
//                   ' AND   r.cod_comprovante='+QuotedStr(IBQ_ConsultaFilial.FieldByName('CODCOMPROVANTE').AsString)+
//                   ' AND   CAST('+QuotedStr(IBQ_ConsultaFilial.FieldByName('DATAENTRADA').AsString)+' AS DATE)'+
//                   '                 BETWEEN r.dta_incio AND COALESCE(r.dta_fim, CAST(''31.12.3000'' AS DATE))';
//            DMAtualizaSeteHoras.CDS_Busca.Close;
//            DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
//            DMAtualizaSeteHoras.CDS_Busca.Open;
//            sPercRed:='0.00';
//            If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('per_reducao').AsString)<>'' Then
//             sPercRed:=f_Troca(',','.',DMAtualizaSeteHoras.CDS_Busca.FieldByName('per_reducao').AsString);
//            DMAtualizaSeteHoras.CDS_Busca.Close;
//
//            // Busca Fornecedor Vinculado -------------------------------
//            sCodFornVinc :=sCodFornLINX;
//            sNomeFornVinc:=sNomeFornLINX;
//            MySql:=' SELECT f.cod_fornecedor, f.des_fornecedor'+
//                   ' FROM FL_CAIXA_FORNECEDORES f'+
//                   ' WHERE f.cod_vinculado='+sCodFornLINX;
//            DMAtualizaSeteHoras.CDS_Busca.Close;
//            DMAtualizaSeteHoras.SDS_Busca.CommandText:=MySql;
//            DMAtualizaSeteHoras.CDS_Busca.Open;
//
//            If Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('Cod_Fornecedor').AsString)<>'' Then
//            Begin
//              sCodFornVinc :=Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('Cod_Fornecedor').AsString);
//              sNomeFornVinc:=Trim(DMAtualizaSeteHoras.CDS_Busca.FieldByName('Des_Fornecedor').AsString);
//            End;
//
//            // Insere Caixa -----------------------------------------------
//            MySql:=' INSERT INTO FL_CAIXA_FORNECEDORES ('+
//                   ' COD_FORNECEDOR, DES_FORNECEDOR,'+
//                   ' COD_VINCULADO, DES_VINCULADO,'+
//                   ' VLR_ORIGEM, DTA_ORIGEM, DTA_CAIXA, NUM_SEQ,'+
//                   ' NUM_CHAVENF, COD_EMPRESA, COD_HISTORICO, TXT_OBS,'+
//                   ' NUM_DOCUMENTO, NUM_SERIE, PER_REDUCAO, TIP_DEBCRE, VLR_CAIXA, VLR_SALDO,'+
//                   ' CODFORNECEDOR, COD_LOJA_LINX, COD_LOJA_SIDICOM)'+
//                   ' VALUES ('+
//                   sCodFornVinc+', '+ // COD_FORNECEDOR (LINX) - Fornecedor de Vinculo
//                   QuotedStr(sNomeFornVinc)+', '+ // DES_FORNECEDOR (LINX) - Fornecedor de Vinculo
//                   sCodFornLINX+', '+ // COD_VINCULADO (LINX)
//                   QuotedStr(sNomeFornLINX)+', '+ // DES_VINCULADO (LINX)
//                   IBQ_ConsultaFilial.FieldByName('VLR_TOTAL').AsString+', '+ // VLR_ORIGEM
//                   QuotedStr(IBQ_ConsultaFilial.FieldByName('DATACOMPROVANTE').AsString)+', '+ // DTA_ORIGEM
//                   QuotedStr(IBQ_ConsultaFilial.FieldByName('DATAENTRADA').AsString)+', '+ // DTA_CAIXA
//                   sNumSeq+', '+ // NUM_SEQ
//                   QuotedStr(IBQ_ConsultaFilial.FieldByName('CHAVENF').AsString)+', '; // NUM_CHAVENF
//
//                   // COD_EMPRESA (LINX ou 50-SIDICOM)
//                   If sgCodEmp='99' Then
//                    MySql:=
//                     MySql+'2, '
//                   Else
//                    MySql:=
//                     MySql+QuotedStr(sgCodEmp)+', ';
//
//            MySql:=
//             MySql+QuotedStr(IBQ_ConsultaFilial.FieldByName('CODCOMPROVANTE').AsString)+', '+ // COD_HISTORICO,
//                   QuotedStr(AnsiUpperCase(IBQ_ConsultaFilial.FieldByName('OBSERVACAO').AsString))+', '+ // TXT_OBS
//                   QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('NUMERO').AsString))+', '+ // NUM_DOCUMENTO
//                   QuotedStr(Trim(IBQ_ConsultaFilial.FieldByName('SERIE').AsString))+', '+ // NUM_SERIE
//                   sPercRed+', '+ // PER_REDUCAO,
//                   QuotedStr(IBQ_ConsultaFilial.FieldByName('TP_DEBCRE').AsString)+', '+ // TIP_DEBCRE
//                   'CAST(('+IBQ_ConsultaFilial.FieldByName('VLR_TOTAL').AsString+
//                          '-(('+sPercRed+' * '+IBQ_ConsultaFilial.FieldByName('VLR_TOTAL').AsString+
//                          ') / 100)) AS NUMERIC(12,2)),'+ // VLR_CAIXA
//                   ' 0.00,'+ // VLR_SALDO
//                   QuotedStr(sCodForn)+', '; // CODFORNECEDOR VARCHAR(6)
//
//                   // COD_LOJA_LINX INTEGER (LINX ou 50-SIDICOM)
//                   If sgCodEmp='99' Then
//                    MySql:=
//                     MySql+'2, '
//                   Else
//                    MySql:=
//                     MySql+'0, ';
//
//            MySql:=
//             MySql+QuotedStr(sgCodEmp)+')'; // COD_LOJA_SIDICOM VARCHAR(2)
//            DMAtualizaSeteHoras.SQLC.Execute(MySql, nil, nil);
//
//            // Guarda Fornecedor a Processar Conta Correte ------------
//            bgProcessar:=True;
//            For i:=0 to Mem_Odir.Lines.Count-1 do
//            Begin
//               If Mem_Odir.Lines[i]=sCodFornLINX Then
//               Begin
//                 bgProcessar:=False;
//                 Break;
//               End;
//            End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do
//
//            If bgProcessar Then
//            Begin
//              Mem_Odir.Lines.Add(sCodFornLINX);
//            End;
//          End; // If sCodFornLINX<>'' Then
//
//          IBQ_ConsultaFilial.Next;
//        End; // While Not IBQ_ConsultaFilial.Eof do
//        IBQ_ConsultaFilial.Close;
//
//        // Fecha Transacao =================================================
//        DMAtualizaSeteHoras.SQLC.Commit(TD);
//
//        DateSeparator:='/';
//        DecimalSeparator:=',';
//
//      Except
//        on e : Exception do
//        Begin
//          DMAtualizaSeteHoras.SQLC.Rollback(TD);
//
//          DateSeparator:='/';
//          DecimalSeparator:=',';
//        End; // on e : Exception do
//      End; // Try
//    End; // If bSiga Then
//
//    ConexaoEmpIndividual('IBDB_'+sgCodEmp, 'IBT_'+sgCodEmp, 'F')
//  End; // If bSiga Then
//end; // Busca Movtos de Debito/Credito de Fornecedores SIDICOM >>>>>>>>>>>>>>>>>

// Calcula Fluxo de Caixo de Fornecedor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaSeteHoras.CalculaFluxoCaixaFornecedores(sDt: String=''; sCodForn: String ='');
Var
  MySql:String;
  cVlrSaldo: Currency;
  iUltimo: Integer;
  sCodigo: String;
Begin
  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaSeteHoras.SQLC.StartTransaction(TD);

  Try
    DateSeparator:='.';
    DecimalSeparator:='.';

    // Exclui Saldos Iniciais e Finais Sem Movimento ===========================
    If bgExcSemMovto Then
    Begin
      MySql:=' DELETE FROM FL_CAIXA_FORNECEDORES cf'+
             ' WHERE cf.num_seq in (0, 999999)'+
             ' AND NOT EXISTS (SELECT 1'+
             '                 FROM fl_caixa_fornecedores f'+
             '                 WHERE f.num_seq NOT IN (0, 999999)'+
             '                 AND   f.dta_caixa=cf.dta_caixa'+
             '                 AND   f.cod_fornecedor=cf.cod_fornecedor)';
      DMAtualizaSeteHoras.SQLC.Execute(MySql,nil,nil);

      bgExcSemMovto:=False;
    End; // If bgExcSemMovto Then

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
     MySql+' ORDER BY c.COD_FORNECEDOR, c.DTA_CAIXA';
    DMAtualizaSeteHoras.CDS_While.Close;
    DMAtualizaSeteHoras.SDS_While.CommandText:=MySql;
    DMAtualizaSeteHoras.CDS_While.Open;

    sCodigo:='0';
    iUltimo:=0;
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
      iUltimo:=DMAtualizaSeteHoras.CDS_Pesquisa.RecNo;
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
        End; // If (DMAtualizaSeteHoras.CDS_Pesquisa.RecNo<>iUltimo) and (DMAtualizaSeteHoras.CDS_Pesquisa.RecNo<>1)Then

        // Verifica Registro de Saldo Final ====================================
        If DMAtualizaSeteHoras.CDS_Pesquisa.RecNo=iUltimo Then
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
        End; // If DMAtualizaSeteHoras.CDS_Pesquisa.RecNo=iUltimo Then

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

  sCodFornCalcCC, sDtaCalcCC: String;
  ii, i: Integer;
begin
  tgMySqlErro:=TStringList.Create;
  tgMySqlErro.Clear;
  tgMySqlErro.Add('==================================');
  tgMySqlErro.Add('Processamento INICIO: '+DateTimeToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor)));
  tgMySqlErro.Add('==================================');
  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');

  //============================================================================
  // Acerta Data de Backup do Sidicom ==========================================
  //============================================================================
//OpssAqui
  sgDtaInicioProc:=DateTimeToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor));
  SidicomDataBackup;
  // Acerta Data de Backup do Sidicom ==========================================
  //============================================================================

  //============================================================================
  // Atualiza Codigos de Barras ================================================
  //============================================================================
//OpssAqui
// OdirApagar - 07/06/2019 -- SIDICOM Desativado
//  sgDtaInicioProc:=DateTimeToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor));
//  CodigoBarras;
  // Atualiza Codigos de Barras ================================================
  //============================================================================

  //============================================================================
  // Atualiza Demanda 4 Meses ==================================================
  //============================================================================
//OpssAqui <<=== Alterar Para Uma Loja se Necessário
  sgDtaInicioProc:=DateTimeToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor));
  Demanda4Meses;
  // Atualiza Demanda 4 Meses ==================================================
  //============================================================================

  //============================================================================
  // Atualiza Produtos / Fornecedores / Vendas 15 Dias =========================
  // RODAR APÓS ATUALIZA DEMANDA 4 MESES =======================================
  //============================================================================
//OpssAqui
  sgDtaInicioProc:=DateTimeToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor));
  ProdutosCompradores;
  // RODAR APÓS ATUALIZA DEMANDA 4 MESES =======================================
  // Atualiza Produtos / Fornecedores / Vendas 15 Dias =========================
  //============================================================================

// OdirApagar - 31/10/2018
//  //============================================================================
//  // VERIFICA SE A INTERNET ESTA CONECTADA =====================================
//  //============================================================================
//  if not InternetGetConnectedState(@Flags, 0) then
//  Begin
//    Application.Terminate;
//    Exit;
//  End;
//  // VERIFICA SE A INTERNET ESTA CONECTADA =====================================
//  //============================================================================

  //============================================================================
  // ATUALIZA CONTA CORRENTE FORNECEDORES ======================================
  //============================================================================
//OpssAqui
// Não Rodar: Alterar Para FALSE
  bgRodaCCorrente:=True;
  If bgRodaCCorrente Then
  Begin
    //======================================
    // Verifica Parametro Enviado
    // OBS: Enviar Somente Um Código por Vez
    //======================================
    //OpssAqui ===>> TIRA O CODIGO
    sgCodForn:='';
    for i := 1 to ParamCount do
    Begin
      sgCodForn:=LowerCase(ParamStr(i));
    End;

    // Inicializa Data Inicial ===================================================
    sgDtaProcCC:=DateToStr(Date);
    sgDtaInicio:=DateToStr(IncMonth(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor),-4));
    sgDtaInicio:=f_Troca('/','.',f_Troca('-','.',sgDtaInicio));

    // Monta SQL's Para Busca SIDICOM / LINX =====================================
    MontaSqlsSidicomLinx;

    // Busca Lojas ===============================================================
    MySql:=' SELECT e.cod_filial, e.cod_linx, e.dta_inicio_linx, e.ind_domingo'+
           ' FROM EMP_CONEXOES e'+
           ' WHERE ((e.ind_ativo = ''SIM'') OR (e.cod_filial = ''99''))'+
           ' AND   e.dta_inicio_linx IS NOT NULL'+
           ' ORDER BY 4, 2';
    DMAtualizaSeteHoras.CDS_Lojas.Close;
    DMAtualizaSeteHoras.SDS_Lojas.CommandText:=MySql;
    DMAtualizaSeteHoras.CDS_Lojas.Open;

    bgExcSemMovto:=True;
    DMAtualizaSeteHoras.CDS_Lojas.First;
    While Not DMAtualizaSeteHoras.CDS_Lojas.Eof do
    Begin
      sgCodEmp    :=DMAtualizaSeteHoras.CDS_Lojas.FieldByName('COD_FILIAL').AsString;
      sgCodEmpLINX:=DMAtualizaSeteHoras.CDS_Lojas.FieldByName('COD_LINX').AsString;
      sgDtaIniLINX:=DMAtualizaSeteHoras.CDS_Lojas.FieldByName('DTA_INICIO_LINX').AsString;

      // Limpa Codigos de Fornecedores ===========================================
      Mem_Odir.Lines.Clear;

      // Busca Débitos/Crétidos no LINX ==========================================
      If sgCodEmpLINX<>'0' Then
      Begin
        sgDtaInicioProc:=DateTimeToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor));
        BuscaMovtosDebCreLINX;
      End;

      // Calcula Fluxo de Caixa do Fornecedore =====================================
      For i:=0 to Mem_Odir.Lines.Count-1 do
      Begin
        ii:=pos('-',Mem_Odir.Lines[i]);

        sCodFornCalcCC:=Trim(Copy(Mem_Odir.Lines[i],1,ii-1));
        sDtaCalcCC:=Trim(Copy(Mem_Odir.Lines[i],ii+1, Length(Mem_Odir.Lines[i])));

        If Trim(sCodFornCalcCC)<>'' Then
         CalculaFluxoCaixaFornecedores(sDtaCalcCC, sCodFornCalcCC);
      End; // For i:=0 to FrmBelShop.Mem_Odir.Lines.Count-1 do
      Mem_Odir.Lines.Clear;

      DMAtualizaSeteHoras.CDS_Lojas.Next;
    End; // While Not DMAtualizaSeteHoras.CDS_Busca.Eof do
    DMAtualizaSeteHoras.CDS_Lojas.Close;
  End; // If bgRodaCCorrente Then
  // ATUALIZA CONTA CORRENTE FORNECEDORES ======================================
  //============================================================================

// OdirApagar - 07/06/2019 -- SIDICOM Desativado
//  //============================================================================
//  // Iguala Todos os Produtos de Todas a Lojas com o CD ========================
//  //============================================================================
////OpssAqui <<=== ALterar Somente Uma Loja
//  sgDtaInicioProc:=DateTimeToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor));
//  AcertaEstoqueLoja;
//  // Igual Todos os Produtos de Todas a Lojas com o CD =========================
//  //============================================================================

  tgMySqlErro.Add('==================================');
  tgMySqlErro.Add('Processamento FIM: '+DateTimeToStr(DataHoraServidorFI(DMAtualizaSeteHoras.SDS_DtaHoraServidor)));
  tgMySqlErro.Add('==================================');
  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_Sete_Horas_Proc.txt');

  // Encerra Programa ==========================================================
  Application.Terminate;
  Exit;

end;

procedure TFrmAtualizaSeteHoras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(tgMySqlErro);

  Application.Terminate;
  Exit;

end;

end.

