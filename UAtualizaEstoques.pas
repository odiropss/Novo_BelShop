unit UAtualizaEstoques;
// Controle de Processamento: @ODIR_AtuaLizaEstoquesProc.txt
// OpssAqui
//OdirRetornar
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
    Procedure LimpaOBS;
    Procedure MenssagemAnterior(sCodLj: String);

    Function ConexaoEmpIndividual(sDataBase, sTransaction, sProcedimento: String): Boolean;
            // Procedimento: (A) Abrir Conexão (F) Fechar COnexão

    Procedure CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery;
                          bMatriz, bCriaIBQ: Boolean);
                        // sDataBase    = Database a Conectar
                        // sTransaction = Transaction a Conectar
                        // IBQ_Free     = Nome do TIBQuery a Destruir e Reconstruir
                        // bMatriz      = Se Conexão é Matriz
                        // Se Destruir e Reconstruir IBQuery

    // OdirApagar - 26/01/2019 - Não Rodea Mais- Todas tem Inventario
    // Procedure AtualizaEstoquesMovtosLinx(sCodLinx, sCodBelShop, sDtaInicioLinx: String);

    //OdirApagar - 06/06/2019
    //Procedure SaldosTransfere_Linx_Sidicom;
    //Procedure AtualizaListaPrecosEcommerce;

    // Utilizado em MIX de Fornecedores/Produtos
    Procedure Tabela_ES_PRODUTOS_MIX; // Busca Dados de ES_FINAN_CURVA_ABC que Estejão em LINXPRODUTOS
    Procedure Tabela_ES_FAT_PERIODO; // Ultimos 4 Meses de Faturamento

    Procedure AtualizaEstgoques;

    // Odir ====================================================================
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualizaEstoques: TFrmAtualizaEstoques;

  bgConexaoLocal: Boolean; // Se Conexão com o Servidor da Matriz é Local - Verifica a Existencia do Arquivo "ConexaoExterna.ini"

  sgDtaInicioProc,
  sgDataAtual, sgHoraAtual,
  sgMsgAnterior: String;

  IBQ_Consulta: TIBQuery;

  TD : TTransactionDesc; // Ponteiro de Transação

  tgMySqlErro: TStringList; // Arquivo de Processamento e Erros

implementation

uses UDMAtualizaEstoques, UDMConexoes, DK_Procs1, DB;

{$R *.dfm}

// Odir >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Estoque das Lojas: Table ESTOQUE ainda SIDICOM >>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaEstoques.AtualizaEstgoques;
Var
  MySql: String;

  sCodEmpresa: String;
  iCodLinx: Integer;

Begin
  MySql:=' SELECT c.cod_filial, c.cod_linx'+
         ' FROM EMP_CONEXOES c'+
         ' WHERE ((c.dta_inicio_linx IS NOT NULL AND c.ind_ativo=''SIM'')'+
         '        OR'+
         '        (c.cod_filial=''99''))'+
         ' ORDER BY c.tip_emp desc, c.ind_domingo, c.cod_linx';
  DMAtualizaEstoques.CDS_EmpProcessa.Close;
  DMAtualizaEstoques.SDS_EmpProcessa.CommandText:=MySql;
  DMAtualizaEstoques.CDS_EmpProcessa.Open;

  // Inicia Processamento ======================================================
  DMAtualizaEstoques.CDS_EmpProcessa.First;
  While Not DMAtualizaEstoques.CDS_EmpProcessa.Eof do
  Begin
    // Guarda Momento da Atualização ===========================================
    sgDataAtual:=f_Troca('/','.',f_Troca('-','.',DateToStr(Date)));
    sgHoraAtual:=TimeToStr(Time);

    sCodEmpresa   :=DMAtualizaEstoques.CDS_EmpProcessaCOD_FILIAL.AsString;
    iCodLinx      :=DMAtualizaEstoques.CDS_EmpProcessaCOD_LINX.AsInteger;
    sgDtaInicioProc:=DateTimeToStr(Now);

    Try
      // Verifica se Transação esta Ativa
      If DMAtualizaEstoques.SQLC.InTransaction Then
       DMAtualizaEstoques.SQLC.Rollback(TD);

      // Monta Transacao  -------------------------------------
      TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
      TD.IsolationLevel:=xilREADCOMMITTED;
      DMAtualizaEstoques.SQLC.StartTransaction(TD);

      DateSeparator:='.';
      DecimalSeparator:='.';

      // Deleta Estoques da Loja ------------------------------------
      MySql:=' DELETE FROM ESTOQUE e'+
             ' WHERE e.codfilial='+QuotedStr(sCodEmpresa);
      DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

      // Atualiza Estoques da Loja ----------------------------------
      MySql:=' INSERT INTO ESTOQUE'+
             ' (CODFILIAL, CODPRODUTO, SALDOATUAL, PEDIDOPENDENTE, ZONAENDERECO,'+
             '  CORREDOR, PRATELEIRA, GAVETA, CUSMEDVALOR, CUSTOMEDIO, LASTPRECOCOMPRA,'+
             ' LASTCUSTOMEDIO, ESTOQUEIDEAL, ESTOQUEMAXIMO, DATAALTERACADASTRO,'+
             ' DATAALTERAESTOQUE, DATAALTERAESTOQUE_PED, PRINCIPALFOR,'+
             ' SALDO_FINAL_SIDICOM, DTA_ATUALIZACAO, HRA_ATUALIZACAO)'+

             ' SELECT '+
             QuotedStr(sCodEmpresa)+' CODFILIAL,'+
             ' pr.codproduto CODPRODUTO,'+
             ' COALESCE(lpd.quantidade,0.0000) SALDOATUAL,'+
             ' 0.0000 PEDIDOPENDENTE,'+
             ' COALESCE(en.zonaendereco, 0) ZONAENDERECO,'+
             ' COALESCE(en.corredor, ''000'') CORREDOR,'+
             ' COALESCE(en.prateleira, ''000'') PRATELEIRA,'+
             ' COALESCE(en.gaveta, ''0000'') GAVETA,'+
             ' lpd.custo_medio CUSMEDVALOR,'+
             ' lpd.custo_medio CUSTOMEDIO,'+
             ' 0.0000 LASTPRECOCOMPRA,'+
             ' lpd.custo_medio LASTCUSTOMEDIO,'+
             ' 0 ESTOQUEIDEAL,'+
             ' 0 ESTOQUEMAXIMO,'+
             ' lp.dt_update DATAALTERACADASTRO,'+
             ' lp.dt_update DATAALTERAESTOQUE,'+
             ' lp.dt_update DATAALTERAESTOQUE_PED,'+
             ' pr.principalfor PRINCIPALFOR,'+
             ' 0.0000 SALDO_FINAL_SIDICOM, '+
             QuotedStr(sgDataAtual)+' DTA_ATUALIZACAO, '+
             QuotedStr(sgHoraAtual)+' HRA_ATUALIZACAO'+

             ' FROM LINXPRODUTOSDETALHES lpd'+
             '           LEFT JOIN LINXPRODUTOS lp   ON lp.cod_produto = lpd.cod_produto'+
             '           LEFT JOIN PRODUTO pr        ON pr.codproduto = lp.cod_auxiliar'+
             '           LEFT JOIN PROD_ENDERECO en  ON en.cod_produto = lp.cod_produto'+
             '                                      AND en.cod_linx=lpd.empresa'+
             ' WHERE COALESCE(pr.codproduto,'''')<>'''''+
             ' AND lpd.empresa='+IntToStr(iCodLinx);
      DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

      MenssagemAnterior(sCodEmpresa);
      MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
             ' VALUES ('+
             QuotedStr(sCodEmpresa)+', '+
             IntToStr(iCodLinx)+', '+
             ' CURRENT_TIMESTAMP,'+
             QuotedStr('LcI')+', '+ // Linx Com Inventário
             QuotedStr(Trim(sgMsgAnterior)+' -> OK')+')'+
             'MATCHING (COD_LOJA)';
      DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

      DMAtualizaEstoques.SQLC.Commit(TD); // Linx Com Inventário

      tgMySqlErro.Add('Atualiza Estoques - OK  - '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
      tgMySqlErro.Add('Loja LINX: '+IntToStr(iCodLinx)+' SIDICOM: '+sCodEmpresa);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');

      DateSeparator:='/';
      DecimalSeparator:=',';
    Except
      on e : Exception do
      Begin
        DMAtualizaEstoques.SQLC.Rollback(TD); // Linx Com Inventário
        DMAtualizaEstoques.IBQ_EstoqueLoja.Close;

        tgMySqlErro.Add('Atualiza Estoques - ERRO  -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
        tgMySqlErro.Add('Loja LINX: '+IntToStr(iCodLinx)+' SIDICOM: '+sCodEmpresa);
        tgMySqlErro.Add('ERROR: '+e.message);
        tgMySqlErro.Add(MySql);
        tgMySqlErro.Add('==================================');
        tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');

        TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
        TD.IsolationLevel:=xilREADCOMMITTED;
        DMAtualizaEstoques.SQLC.StartTransaction(TD);

        MenssagemAnterior(sCodEmpresa);
        MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
               ' VALUES ('+
               QuotedStr(sCodEmpresa)+', '+
               IntToStr(iCodLinx)+', '+
               ' CURRENT_TIMESTAMP,'+
               QuotedStr('LcI')+', '+ // Linx Com Inventário
               QuotedStr(Trim(sgMsgAnterior)+' -> Atualiza ESTOQUE: '+e.message+' - '+MySql)+')'+
               'MATCHING (COD_LOJA)';
        DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

        DMAtualizaEstoques.SQLC.Commit(TD); // Linx Com Inventário

        DateSeparator:='/';
        DecimalSeparator:=',';

      End; // on e : Exception do
    End; // Try

    DateSeparator:='/';
    DecimalSeparator:=',';

    DMAtualizaEstoques.CDS_EmpProcessa.Next;
  End; // While Not DMAtualizaEstoques.CDS_EmpProcessa.Eof do
  DMAtualizaEstoques.CDS_EmpProcessa.Close;
  // Atualiza Estoques =========================================================
  //============================================================================

End; // Atualiza Estoque das Lojas: Table ESTOQUE ainda SIDICOM >>>>>>>>>>>>>>>>

// Busca Messagem Anterior na Obs do Processamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaEstoques.MenssagemAnterior(sCodLj: String);
Var
  MySql: String;
Begin
  MySql:=' SELECT TRIM(e.obs) obs'+
         ' FROM ES_PROCESSADOS e'+
         ' WHERE e.cod_loja='+QuotedStr(sCodLj);
  DMAtualizaEstoques.SQLQuery1.Close;
  DMAtualizaEstoques.SQLQuery1.SQL.Clear;
  DMAtualizaEstoques.SQLQuery1.SQL.Add(MySql);
  DMAtualizaEstoques.SQLQuery1.Open;
  sgMsgAnterior:=Trim(DMAtualizaEstoques.SQLQuery1.FieldByname('Obs').AsString);
  DMAtualizaEstoques.SQLQuery1.Close;
End; // Busca Messagem Anterior na Obs do Processamento >>>>>>>>>>>>>>>>>>>>>>>>

// Limpa Obs do Processamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaEstoques.LimpaOBS;
Var
  MySql: String;
Begin
  sgMsgAnterior:='';

  // Verifica se Transação esta Ativa
  If DMAtualizaEstoques.SQLC.InTransaction Then
   DMAtualizaEstoques.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaEstoques.SQLC.StartTransaction(TD);
  Try // Try da Transação
    MySql:=' UPDATE ES_PROCESSADOS e'+
           ' SET e.obs=NULL';
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMAtualizaEstoques.SQLC.Commit(TD);

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMAtualizaEstoques.SQLC.Rollback(TD);
    End; // on e : Exception do
  End; // Try da Transação
End; // Limpa Obs do Processamento >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Faturamento dos Ultimos 4 Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaEstoques.Tabela_ES_FAT_PERIODO;
Var
  MySql: String;
  sDtaInicio, sDtaFim: String;
Begin
  sgDtaInicioProc:=DateTimeToStr(Now);

  // Acerta Periodo ============================================================
  sDtaInicio:=DateToStr(PrimeiroUltimoDia(IncMonth(Date,-4),'P'));
  sDtaFim   :=DateToStr(Date-1);

  // Verifica se Transação esta Ativa
  If DMAtualizaEstoques.SQLC.InTransaction Then
   DMAtualizaEstoques.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaEstoques.SQLC.StartTransaction(TD);
  Try // Try da Transação
    MySql:=' DELETE FROM ES_FAT_PERIODO';
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    MySql:=' INSERT INTO ES_FAT_PERIODO'+
           ' (EMPRESA, COD_LOJA, COD_PRODUTO, CODPRODUTO, VLR_FAT, DTA_INICIO, DTA_FIM)'+
           ' SELECT'+
           ' mv.empresa EMPRESA,'+
           ' mv.cod_loja COD_LOJA,'+
           ' mv.cod_produto COD_PRODUTO,'+

           ' CASE'+
           '   WHEN CHAR_LENGTH(TRIM(COALESCE(pr.cod_auxiliar, '''')))<>6 THEN'+
           '     NULL'+
           '   ELSE'+
           '     pr.cod_auxiliar'+
           ' END CODPRODUTO,'+

           ' SUM(CASE'+
           '       WHEN mv.operacao=''DS'' THEN'+
           '         -mv.valor_total'+
           '       ELSE'+
           '         mv.valor_total'+
           '      END) VLR_FAT,'+

           ' CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicio)))+' AS DATE) DTA_INICIO,'+
           ' CAST('+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaFim)))+' AS DATE) DTA_FIM'+

           ' FROM LINXMOVIMENTO mv, LINXPRODUTOS pr'+
           ' WHERE mv.cod_produto=pr.cod_produto'+

           ' AND ('+
           '      ((mv.operacao=''S'') AND ((mv.tipo_transacao=''V'') OR (COALESCE(mv.tipo_transacao,'''')='''')))'+ // Saídas Vendas
           '       OR'+
           '       ((mv.operacao=''DS'') AND (mv.tipo_transacao is null))'+ // Entradas Devoluções
           '     )'+
           ' AND  mv.cancelado=''N'''+
           ' AND  mv.excluido =''N'''+
           ' AND  mv.data_lancamento BETWEEN '+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicio)))+
                                              ' AND '+
                                              QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaFim)))+
           ' AND  pr.id_linha<>33'+ // Brindes
           ' AND  pr.id_colecao<>294'+ // Brindes

           ' GROUP BY 1,2,3,4';
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMAtualizaEstoques.SQLC.Commit(TD);

    tgMySqlErro.Add('Tabela_ES_FAT_PERIODO - OK  - '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
    tgMySqlErro.Add('==================================');
    tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');

  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMAtualizaEstoques.SQLC.Rollback(TD);

      tgMySqlErro.Add('Tabela_ES_FAT_PERIODO - ERRO  -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');
    End; // on e : Exception do
  End; // Try da Transação


End; // Atualiza Faturamento dos Ultimos 4 Meses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Atualiza Tabela ES_PRODUTOS_MIX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaEstoques.Tabela_ES_PRODUTOS_MIX;
Var
  MySql: String;
Begin
  sgDtaInicioProc:=DateTimeToStr(Now);

  // Verifica se Transação esta Ativa
  If DMAtualizaEstoques.SQLC.InTransaction Then
   DMAtualizaEstoques.SQLC.Rollback(TD);

  // Monta Transacao ===========================================================
  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
  TD.IsolationLevel:=xilREADCOMMITTED;
  DMAtualizaEstoques.SQLC.StartTransaction(TD);
  Try // Try da Transação
    MySql:=' DELETE FROM ES_PRODUTOS_MIX';
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    MySql:=' INSERT INTO ES_PRODUTOS_MIX'+
           ' SELECT'+
           ' lj.cod_loja COD_LOJA,'+
           ' lj.empresa EMPRESA,'+
           ' cv.cod_produto CODPRODUTO,'+
           ' pr.cod_produto COD_PRODUTO,'+
           ' COALESCE(cv.ind_curva,''E'') IND_CURVA,'+
           ' CASE'+
           '   WHEN COALESCE(cv.est_minimo,0)<1 THEN'+
           '     0'+
           '   ELSE'+
           '     1'+
           ' END IND_MIX,'+
           ' cv.est_minimo EST_MINIMO,'+
           ' cv.est_maximo EST_MAXIMO,'+
           ' CURRENT_DATE DTA_ATUALIZACAO'+

           ' FROM LINXPRODUTOS pr'+
           '      LEFT JOIN ES_FINAN_CURVA_ABC cv ON cv.cod_prod_linx=pr.cod_produto'+
           '      LEFT JOIN LINXLOJAS lj          ON lj.empresa=cv.cod_linx';
    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);

    // Atualiza Transacao ======================================================
    DMAtualizaEstoques.SQLC.Commit(TD);

    tgMySqlErro.Add('Tabela_ES_PRODUTOS_MIX - OK  - '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
    tgMySqlErro.Add('==================================');
    tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');
  Except // Except da Transação
    on e : Exception do
    Begin
      // Abandona Transacao ====================================================
      DMAtualizaEstoques.SQLC.Rollback(TD);

      tgMySqlErro.Add('Tabela_ES_PRODUTOS_MIX - ERRO  -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
      tgMySqlErro.Add('ERROR: '+e.message);
      tgMySqlErro.Add(MySql);
      tgMySqlErro.Add('==================================');
      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');
    End; // on e : Exception do
  End; // Try da Transação
End; // Atualiza Tabela ES_Produtos_MIX >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//OdirApagar - 06/06/2019
//// Atualiza Lista de Preços do E-Commerce no SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>>>>
//Procedure TFrmAtualizaEstoques.AtualizaListaPrecosEcommerce;
//Var
//  MySql, MySqlDescLP10, MySqlDescLP6: String;
//
//  sCodProdSidicom, sCodBarras, sPcCusto, sPcVenda, sMargem: String;
//
//  iCodProdLinx: Integer;
//  b: Boolean;
//Begin
//  sgDtaInicioProc:=DateTimeToStr(Now);
//
//  sgDataAtual:=DateToStr(DataHoraServidorFI(DMAtualizaEstoques.SDS_DtaHoraServidor));
//  sgHoraAtual:=TimeToStr(DataHoraServidorFI(DMAtualizaEstoques.SDS_DtaHoraServidor));
//
//  Try // Try da Transação
//    // Conecata SIDICOM ========================================================
//    ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A');
//    CriaQueryIB('IBDB_99', 'IBT_99', IBQ_Consulta, False, True);
//
//    // Verifica se Transação esta Ativa
//    If DMConexoes.IBT_99.Active Then
//     DMConexoes.IBT_99.Rollback;
//
//    // Monta Transacao  -------------------------------------
//    DMConexoes.IBT_99.StartTransaction;
//
//    DateSeparator:='.';
//    DecimalSeparator:='.';
//
//    // Busca Preços Linx =======================================================
//    MySql:=' SELECT DISTINCT'+
//           ' pl.cod_produto, pl.cod_auxiliar,'+
//           ' COALESCE(dl.preco_custo,0.0000) preco_custo,'+
//           ' COALESCE(dl.preco_venda,0.0000) preco_venda,'+
//           ' CAST(CASE COALESCE(dl.preco_venda,0.000)'+
//           '   WHEN 0.0000 THEN'+
//           '     0.0000'+
//           '   ELSE'+
//           '     (((dl.preco_venda/dl.preco_custo)-1)*100)'+
//           ' END AS NUMERIC(12,4)) margem,'+
//
//           ' pl.cod_barra cod_barra_PR, dl.cod_barra cod_barra_DE, bl.cod_barra cod_barra_CB'+
//
//           ' FROM LINXPRODUTOS pl'+
//           '   LEFT JOIN LINXPRODUTOSDETALHES dl  ON dl.cod_produto=pl.cod_produto'+
////OdirApagar - 01/11/2018
////           '                                     AND dl.empresa=2'+
//           '   LEFT JOIN LINXPRODUTOSCODBAR bl    ON dl.cod_produto=bl.cod_produto'+
//
//           ' WHERE pl.desativado=''N'''+
//           ' AND   dl.preco_venda<>0'+
//
//           ' AND   TRIM(COALESCE(pl.cod_auxiliar,''''))<>'''''+
//           ' AND   CHAR_LENGTH(pl.cod_auxiliar)<=6'+
//
//           ' ORDER BY 1, 4 desc';
//    DMAtualizaEstoques.CDS_LojaLinx.Close;
//    DMAtualizaEstoques.SDS_LojaLinx.CommandText:=MySql;
//    DMAtualizaEstoques.CDS_LojaLinx.Open;
//
//    sCodProdSidicom:='';
//    sCodBarras:='';
//    sPcCusto:='';
//    sPcVenda:='';
//    sMargem:='';
//    iCodProdLinx:=0;
//    While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
//    Begin
//
//      If sCodProdSidicom<>Trim(DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_auxiliar').AsString) Then
//      Begin
//        // Inicializa Variaveis ================================================
//        iCodProdLinx   :=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_produto').AsInteger;
//        sCodProdSidicom:=Trim(DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_auxiliar').AsString);
//        sPcCusto       :=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('preco_custo').AsString;
//        sPcVenda       :=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('preco_venda').AsString;
//        sMargem        :=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('margem').AsString;
//        sCodBarras:='';
//
//        If (DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_barra_PR').AsString)<>'' Then
//         sCodBarras:=
//          sCodBarras+' OR TRIM(CODBARRA) LIKE '+QuotedStr('%'+DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_barra_PR').AsString);
//
//        If (DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_barra_DE').AsString)<>'' Then
//         sCodBarras:=
//          sCodBarras+' OR TRIM(CODBARRA) LIKE '+QuotedStr('%'+DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_barra_DE').AsString);
//
//        If (DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_barra_CB').AsString)<>'' Then
//         sCodBarras:=
//          sCodBarras+' OR TRIM(CODBARRA) LIKE '+QuotedStr('%'+DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_barra_CB').AsString);
//
//        // Analisa se o Proximo é o Mesmo Coidog Linx ==========================
//        b:=True;
//        While b do
//        Begin
//          DMAtualizaEstoques.CDS_LojaLinx.Next;
//          If DMAtualizaEstoques.CDS_LojaLinx.Eof Then
//           Break;
//
//          If iCodProdLinx<>DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_produto').AsInteger Then
//           Begin
//             DMAtualizaEstoques.CDS_LojaLinx.Prior;
//             Break;
//           End
//          Else
//           Begin
//             If (DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_barra_PR').AsString)<>'' Then
//              sCodBarras:=
//               sCodBarras+' OR TRIM(CODBARRA) LIKE '+QuotedStr('%'+DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_barra_PR').AsString);
//
//             If (DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_barra_DE').AsString)<>'' Then
//              sCodBarras:=
//               sCodBarras+' OR TRIM(CODBARRA) LIKE '+QuotedStr('%'+DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_barra_DE').AsString);
//
//             If (DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_barra_CB').AsString)<>'' Then
//              sCodBarras:=
//               sCodBarras+' OR TRIM(CODBARRA) LIKE '+QuotedStr('%'+DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_barra_CB').AsString);
//           End; // If iCodProdLinx<>DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_produto').AsInteger Then
//        End; // While b do
//
//        // Busca CódigO do Produto no SIDICOM ==================================
//        sCodBarras:='('+Trim(Copy(sCodBarras, 4, Length(sCodBarras)));
//
//        MySql:=' SELECT P.CODPRODUTO'+
//               ' FROM PRODUTO P'+
//               ' WHERE '+sCodBarras;
//
//               If Trim(sCodProdSidicom)<>'' Then
//                MySql:=
//                 MySql+' OR CODPRODUTO='+QuotedStr(sCodProdSidicom);
//
//        MySql:=
//         MySql+')'+
//
//               ' UNION'+
//
//               ' SELECT B.CODPRODUTO'+
//               ' FROM PRODUTOSBARRA B'+
//               ' WHERE '+sCodBarras;
//
//               If Trim(sCodProdSidicom)<>'' Then
//                MySql:=
//                 MySql+' OR CODPRODUTO='+QuotedStr(sCodProdSidicom);
//        MySql:=
//         MySql+')';
//        IBQ_Consulta.Close;
//        IBQ_Consulta.SQL.Clear;
//        IBQ_Consulta.SQL.Add(MySql);
//        IBQ_Consulta.Open;
//        sCodProdSidicom:=IBQ_Consulta.FieldByName('CodProduto').AsString;
//        IBQ_Consulta.Close;
//
//        // Atualiza Lista de Preços (0010) E-Commecer no SIDICOM ===============
//        If Trim(sCodProdSidicom)<>'' Then
//        Begin
//          // E-Commerce: Busca Desconto e Desconto Maximo Original -------------
//          MySqlDescLP10:='';
//          MySql:=' SELECT'+
//                 ' ''UPDATE LISTAPRE''||'+
//                 ' '' SET DESCONTO = ''||lp.desconto||'+
//                 ' '' , DESCONTOMAX = ''||lp.descontomax||'+
//                 ' '' WHERE (CODLISTA = ''''0010'''')''||'+
//                 ' '' AND  (CODPRODUTO = ''''''||lp.codproduto||'''''')'' DML'+
//                 ' FROM LISTAPRE lp'+
//                 ' WHERE lp.codlista=''0010'''+
//                 ' AND lp.codproduto = '+QuotedStr(sCodProdSidicom);
//          IBQ_Consulta.Close;
//          IBQ_Consulta.SQL.Clear;
//          IBQ_Consulta.SQL.Add(MySql);
//          IBQ_Consulta.Open;
//          If Trim(IBQ_Consulta.FieldByName('DML').AsString)<>'' Then
//           MySqlDescLP10:=IBQ_Consulta.FieldByName('DML').AsString;
//          IBQ_Consulta.Close;
//
//          // Lista: 0006: Busca Desconto e Desconto Maximo Original ------------
//          MySqlDescLP6:='';
//          MySql:=' SELECT'+
//                 ' ''UPDATE LISTAPRE''||'+
//                 ' '' SET DESCONTO = ''||lp.desconto||'+
//                 ' '' , DESCONTOMAX = ''||lp.descontomax||'+
//                 ' '' WHERE (CODLISTA = ''''0006'''')''||'+
//                 ' '' AND  (CODPRODUTO = ''''''||lp.codproduto||'''''')'' DML'+
//                 ' FROM LISTAPRE lp'+
//                 ' WHERE lp.codlista=''0006'''+
//                 ' AND lp.codproduto = '+QuotedStr(sCodProdSidicom);
//          IBQ_Consulta.Close;
//          IBQ_Consulta.SQL.Clear;
//          IBQ_Consulta.SQL.Add(MySql);
//          IBQ_Consulta.Open;
//          If Trim(IBQ_Consulta.FieldByName('DML').AsString)<>'' Then
//           MySqlDescLP6:=IBQ_Consulta.FieldByName('DML').AsString;
//          IBQ_Consulta.Close;
//
//          // UPDATE OR INSERT INTO LISTAPRE E-COMMERCE -------------------------
//          MySql:=' UPDATE OR INSERT INTO LISTAPRE'+
//                 ' (CODLISTA, CODPRODUTO, PRECOCOMPRA, MARGEM, PRECOVENDA,'+
//                 ' DATAALTERACAO, HORAALTERACAO, DESCONTO,'+
//                 ' DESCONTOMAX, DESATIVADO, PRECODOLAR, ACRECIMOLISTA,'+
//                 ' CUSTOSLISTA)'+
//                 ' VALUES ('+
//                 QuotedStr('0010')+', '+ // CODLISTA
//                 QuotedStr(sCodProdSidicom)+', '+ // CODPRODUTO
//                 f_Troca(',','.',sPcCusto)+', '+ // PRECOCOMPRA
//                 f_Troca(',','.',sMargem)+', '+ // MARGEM
//                 f_Troca(',','.',sPcVenda)+', '+ // PRECOVENDA
//                 QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDataAtual)))+' ,'+ // DATAALTERACAO
//                 QuotedStr(sgHoraAtual)+' ,'+ // HORAALTERACAO
//                 ' 10.00,'+ // DESCONTO
//                 ' 10.00, '+ // DESCONTOMAX
//                 QuotedStr('0')+', '+ // DESATIVADO
//                 ' 0.00,'+ // PRECODOLAR
//                 ' 0.00,'+ // ACRECIMOLISTA
//                 ' 0.00)'+ // CUSTOSLISTA
//
//                 ' MATCHING (CODLISTA, CODPRODUTO)';
//          IBQ_Consulta.Close;
//          IBQ_Consulta.SQL.Clear;
//          IBQ_Consulta.SQL.Add(MySql);
//          IBQ_Consulta.ExecSQL;
//
//          // UPDATE OR INSERT INTO LISTAPRE LISTA-0006 -------------------------
//          MySql:=' UPDATE OR INSERT INTO LISTAPRE'+
//                 ' (CODLISTA, CODPRODUTO, PRECOCOMPRA, MARGEM, PRECOVENDA,'+
//                 ' DATAALTERACAO, HORAALTERACAO, DESCONTO,'+
//                 ' DESCONTOMAX, DESATIVADO, PRECODOLAR, ACRECIMOLISTA,'+
//                 ' CUSTOSLISTA)'+
//                 ' VALUES ('+
//                 QuotedStr('0006')+', '+ // CODLISTA
//                 QuotedStr(sCodProdSidicom)+', '+ // CODPRODUTO
//                 f_Troca(',','.',sPcCusto)+', '+ // PRECOCOMPRA
//                 f_Troca(',','.',sMargem)+', '+ // MARGEM
//                 f_Troca(',','.',sPcVenda)+', '+ // PRECOVENDA
//                 QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDataAtual)))+' ,'+ // DATAALTERACAO
//                 QuotedStr(sgHoraAtual)+' ,'+ // HORAALTERACAO
//                 ' 0.00,'+ // DESCONTO
//                 ' 15.00, '+ // DESCONTOMAX
//                 QuotedStr('0')+', '+ // DESATIVADO
//                 ' 0.00,'+ // PRECODOLAR
//                 ' 0.00,'+ // ACRECIMOLISTA
//                 ' 0.00)'+ // CUSTOSLISTA
//
//                 ' MATCHING (CODLISTA, CODPRODUTO)';
//          IBQ_Consulta.Close;
//          IBQ_Consulta.SQL.Clear;
//          IBQ_Consulta.SQL.Add(MySql);
//          IBQ_Consulta.ExecSQL;
//
//          // Retorna Desocntos Originais do Produto na Lista --------
//          If Trim(MySqlDescLP10)<>'' Then
//          Begin
//            IBQ_Consulta.Close;
//            IBQ_Consulta.SQL.Clear;
//            IBQ_Consulta.SQL.Add(MySqlDescLP10);
//            IBQ_Consulta.ExecSQL;
//          End; // If Trim(MySqlDescLP10)<>'' Then
//
//          If Trim(MySqlDescLP6)<>'' Then
//          Begin
//            IBQ_Consulta.Close;
//            IBQ_Consulta.SQL.Clear;
//            IBQ_Consulta.SQL.Add(MySqlDescLP6);
//            IBQ_Consulta.ExecSQL;
//          End; // If Trim(MySqlDescLP6)<>'' Then
//
//          // Atualiza Lista:0006 no BELSHOP.FDB ==================================
//          // AtualizaLista0006_BELSHOP(MySql, MySqlDescLP6);
//        End; // If Trim(sCodProdSidicom)<>'' Then
//      End; // If sCodProdSidicom<>Trim(DMAtualizaEstoques.CDS_LojaLinx.FieldByName('cod_auxiliar').AsString) Then
//
////      If DMAtualizaEstoques.CDS_LojaLinx.RecNo mod 1000=0 Then
////      Begin
////        DMConexoes.IBT_99.Commit;
////
////        DMConexoes.IBT_99.StartTransaction;
////      End; // if DMAtualizaEstoques.CDS_LojaLinx.RecNo mod 1000=0 Then
//
//      DMAtualizaEstoques.CDS_LojaLinx.Next;
//    End; // While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
//
//    DMConexoes.IBT_99.Commit;
//
//    tgMySqlErro.Add('AtualizaListaPrecosEcommerce - OK  - '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//    tgMySqlErro.Add('==================================');
//    tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');
//
//    DateSeparator:='/';
//    DecimalSeparator:=',';
//  Except
//    on e : Exception do
//    Begin
//      DMConexoes.IBT_99.Rollback;
//
//      tgMySqlErro.Add('AtualizaListaPrecosEcommerce - ERROA -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//      tgMySqlErro.Add('ERROR: '+e.message);
//      tgMySqlErro.Add(MySql);
//      tgMySqlErro.Add('==================================');
//      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');
//
//      // Monta Transacao ===========================================================
//      TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//      TD.IsolationLevel:=xilREADCOMMITTED;
//      DMAtualizaEstoques.SQLC.StartTransaction(TD);
//
//      MenssagemAnterior('99');
//      MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, obs)'+
//             ' VALUES ('+
//             QuotedStr('99')+', '+
//             '2, '+
//             ' CURRENT_TIMESTAMP,'+
//             QuotedStr(Trim(sgMsgAnterior)+' -> Lista de Preços: '+e.message+' - '+MySql)+')'+
//             'MATCHING (COD_LOJA)';
//      DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//      DMAtualizaEstoques.SQLC.Commit(TD); // Linx Com Inventário
//
//      DateSeparator:='/';
//      DecimalSeparator:=',';
//
//    End; // on e : Exception do
//  End; // Try
//
//  DMAtualizaEstoques.IBQ_EstoqueLoja.Close;
//  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
//End; // Atualiza Lista de Preços do E-Commerce no SIDICOM >>>>>>>>>>>>>>>>>>>>>>

//OdirApagar - 06/06/2019
//// Transfere Saldo Linx para Sidicom CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//Procedure TFrmAtualizaEstoques.SaldosTransfere_Linx_Sidicom;
//Var
//  MySql: String;
//  sHora: String;
//Begin
//  sgDtaInicioProc:=DateTimeToStr(Now);
//
//  sgDataAtual:=DateTimeToStr(DataHoraServidorFI(DMAtualizaEstoques.SDS_DtaHoraServidor));
//
//  // Conecata SIDICOM ========================================================
//  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'A');
//  CriaQueryIB('IBDB_99', 'IBT_99', IBQ_Consulta, False, True);
//
//  // Verifica se Transação esta Ativa
//  If DMConexoes.IBT_99.Active Then
//   DMConexoes.IBT_99.Rollback;
//
//  // Monta Transacao  -------------------------------------
//  DMConexoes.IBT_99.StartTransaction;
//
//  DateSeparator:='.';
//  DecimalSeparator:='.';
//
//  // Busca Saldos Linx =======================================================
//  MySql:=' SELECT ''UPDATE ESTOQUE e''||'+
//         ' '' SET e.saldoatual  =''''''||COALESCE(es.saldoatual,0.0000)||''''''''||'+
//         ' '', e.dataalteraestoque='''+QuotedStr(f_Troca('/','.',f_Troca('-','.',sgDataAtual)))+'''''||'+
//         ' '' WHERE e.codfilial =''''''||es.codfilial||''''''''||'+
//         ' '' AND   e.codproduto=''''''||es.codproduto||'''''''' MDL'+
//         ' FROM ESTOQUE es'+
//         ' WHERE es.codfilial=''99'''+
//         ' AND   es.codproduto is not null'+
//         ' ORDER BY es.codproduto';
//  DMAtualizaEstoques.CDS_LojaLinx.Close;
//  DMAtualizaEstoques.SDS_LojaLinx.CommandText:=MySql;
//  DMAtualizaEstoques.CDS_LojaLinx.Open;
//
//  While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
//  Begin
//    Try // Try da Transação CD-99
//      IBQ_Consulta.Close;
//      IBQ_Consulta.SQL.Clear;
//      IBQ_Consulta.SQL.Add(DMAtualizaEstoques.CDS_LojaLinx.FieldByName('MDL').AsString);
//      IBQ_Consulta.ExecSQL;
//    Except // Try da Transação CD-99
//      on e : Exception do
//      Begin
//        tgMySqlErro.Add('SaldosTransfere_Linx_Sidicom - ERRO -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//        tgMySqlErro.Add('Erro no UpDate - Mas Continua...');
//        tgMySqlErro.Add('ERROR: '+e.message);
//        tgMySqlErro.Add(DMAtualizaEstoques.CDS_LojaLinx.FieldByName('MDL').AsString);
//        tgMySqlErro.Add('==================================');
//        tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');
//
//        // Monta Transacao ===========================================================
//        TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//        TD.IsolationLevel:=xilREADCOMMITTED;
//        DMAtualizaEstoques.SQLC.StartTransaction(TD);
//
//        Try // Try da Transação Grava Erro CD-99
//          MenssagemAnterior('99');
//          MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, obs)'+
//                 ' VALUES ('+
//                 QuotedStr('99')+', '+
//                 '2, '+
//                 ' CURRENT_TIMESTAMP,'+
//                 QuotedStr(Trim(sgMsgAnterior)+' -> Transfere Saldos Linx Sidicom: '+
//                                'ERRO: '+e.message+' SQL: '+
//                                DMAtualizaEstoques.CDS_LojaLinx.FieldByName('MDL').AsString)+')'+
//                 'MATCHING (COD_LOJA)';
//          DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//          DMAtualizaEstoques.SQLC.Commit(TD); // Linx Com Inventário
//        Except // Try da Transação Grava Erro CD-99
//          DMAtualizaEstoques.SQLC.Rollback(TD);
//        End; // Try da Transação Grava Erro CD-99
//      End; // on e : Exception do
//    End; // Try da Transação CD-99
//
////    If DMAtualizaEstoques.CDS_LojaLinx.RecNo mod 1000=0 Then
////    Begin
////      DMConexoes.IBT_99.Commit;
////
////      DMConexoes.IBT_99.StartTransaction;
////    End; // if DMAtualizaEstoques.CDS_LojaLinx.RecNo mod 1000=0 Then
//
//    DMAtualizaEstoques.CDS_LojaLinx.Next;
//  End; // While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
//
//  DMConexoes.IBT_99.Commit;
//
//  tgMySqlErro.Add('SaldosTransfere_Linx_Sidicom - OK  - '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//  tgMySqlErro.Add('==================================');
//  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');
//
//  DateSeparator:='/';
//  DecimalSeparator:=',';
//
//  DMAtualizaEstoques.IBQ_EstoqueLoja.Close;
//  ConexaoEmpIndividual('IBDB_99', 'IBT_99', 'F');
//End; // Transfere Saldo Linx para Sidicom CD >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// OdirApagar - INICIO - 26/01/2019 - Não Rodea Mais- Todas tem Inventario
// Atualiza Tabela ESTOQUE no Banco de Dados BELSHOP.FDB de Todas as Lojas >>>>>
//Procedure TFrmAtualizaEstoques.AtualizaEstoquesMovtosLinx(sCodLinx, sCodBelShop, sDtaInicioLinx: String);
//Var
//  MySql: String;
//
//  i: Integer;
//
//  sDtaAtualiza,
//  sDML, sValues,
//  sCodProd, sQtdSaldo: String;
//Begin
//
//  sgDtaInicioProc:=DateTimeToStr(Now);
//
//  sDtaAtualiza:=f_Troca('/','.',f_Troca('-','.',DateToStr(Date)));
//
//  // Verifica se Transação esta Ativa
//  If DMAtualizaEstoques.SQLC.InTransaction Then
//   DMAtualizaEstoques.SQLC.Rollback(TD);
//
//  // Monta Transacao ===========================================================
//  TD.TransactionID:=Cardinal('10'+FormatDateTime('ddmmyyyy',date)+FormatDateTime('hhnnss',time));
//  TD.IsolationLevel:=xilREADCOMMITTED;
//  DMAtualizaEstoques.SQLC.StartTransaction(TD);
//  Try // Try da Transação
//    DateSeparator:='.';
//    DecimalSeparator:='.';
//
//    //==========================================================================
//    // Atualiza Todos os Produtos na Tabela ESTOQUE ============================
//    //==========================================================================
//    sDML:=' UPDATE OR INSERT INTO ESTOQUE ('+
//          ' CODFILIAL, CODPRODUTO, SALDOATUAL, PEDIDOPENDENTE,'+
//          ' ZONAENDERECO, CORREDOR, PRATELEIRA, GAVETA,'+
//          ' CUSMEDVALOR, CUSTOMEDIO, LASTPRECOCOMPRA, LASTCUSTOMEDIO,'+
//          ' ESTOQUEIDEAL, ESTOQUEMAXIMO,'+
//          ' DATAALTERACADASTRO, DATAALTERAESTOQUE, DATAALTERAESTOQUE_PED,'+
//          ' PRINCIPALFOR, SALDO_FINAL_SIDICOM, DTA_ATUALIZACAO, HRA_ATUALIZACAO)'+
//          ' VALUES (';
//
//    MySql:=' SELECT '+
//           QuotedStr(sCodBelShop)+' codfilial,'+
//           ' CAST(LPAD(lp.cod_auxiliar,6,0) AS VARCHAR(6)) codproduto,'+
//           ' COALESCE(lpd.quantidade,0.0000) saldoatual,'+
//           ' 0.0000 pedidopendente,'+
//           ' COALESCE(es.zonaendereco, 0) zonaendereco,'+
//           ' COALESCE(es.corredor, ''000'') corredor,'+
//           ' COALESCE(es.prateleira, ''000'') prateleira,'+
//           ' COALESCE(es.gaveta, ''0000'') gaveta,'+
//           ' lpd.custo_medio cusmedvalor, lpd.custo_medio customedio,'+
//           ' COALESCE((SELECT FIRST 1 m.valor_liquido'+
//           '           FROM LINXMOVIMENTO m'+
//           '           WHERE m.empresa = '+sCodLinx+
//           '           AND   m.operacao = ''E'''+
//           '           AND   ((m.tipo_transacao=''S'') OR (m.tipo_transacao=''E'') OR (m.tipo_transacao IS NULL))'+
//           '           AND   m.cancelado=''N'''+
//           '           AND   m.excluido=''N'''+
//           '           AND   m.cod_produto = lpd.cod_produto'+
//           '           ORDER BY m.data_lancamento DESC), 0.0000) lastprecocompra,'+
//           ' lpd.custo_medio lastcustomedio,'+
//           ' COALESCE(es.estoqueideal, 0.0000) estoqueideal,'+
//           ' COALESCE(es.estoquemaximo, 0.0000) estoquemaximo,'+
//           ' lp.dt_update dataalteracadastro,'+
//           ' lp.dt_update dataalteraestoque,'+
//           ' lp.dt_update dataalteraestoque_ped,'+
//           ' pr.principalfor principalfor, '+
//           ' COALESCE(es.saldo_final_sidicom, 0.00000)  saldo_final_sidicom,'+
//           QuotedStr(sgDataAtual)+' DTA_ATUALIZACAO, '+
//           ' current_time HRA_ATUALIZACAO'+
//
//           ' FROM LINXPRODUTOSDETALHES lpd'+
//           '          LEFT JOIN LINXPRODUTOS lp  ON lp.cod_produto = lpd.cod_produto'+
//           '          LEFT JOIN PRODUTO pr       ON pr.codproduto = CAST(LPAD(lp.cod_auxiliar,6,0) AS VARCHAR(6))'+
//           '          LEFT JOIN ESTOQUE es       ON es.codproduto = pr.codproduto'+
//           '                                    AND es.codfilial='+QuotedStr(sCodBelShop)+ //  --==>>> sidicom
//
//           ' WHERE lpd.empresa = '+sCodLinx+
//
//           ' AND   TRIM(COALESCE(lp.cod_auxiliar,''''))<>'''''+
//           ' AND   CHAR_LENGTH(lp.cod_auxiliar)<=6'+
//
//           ' ORDER BY lp.cod_auxiliar, lpd.quantidade';
//    DMAtualizaEstoques.CDS_LojaLinx.Close;
//    DMAtualizaEstoques.SDS_LojaLinx.CommandText:=MySql;
//    DMAtualizaEstoques.CDS_LojaLinx.Open;
//
//    While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
//    Begin
//      If sCodProd=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('CodProduto').AsString Then
//       sQtdSaldo:=CurrToStr(StrToCurr(sQtdSaldo)+DMAtualizaEstoques.CDS_LojaLinx.FieldByName('SaldoAtual').AsCurrency)
//      Else
//       sQtdSaldo:=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('SaldoAtual').AsString;
//
//      sValues:='';
//      For i:=0 to DMAtualizaEstoques.CDS_LojaLinx.FieldCount-1 do
//      Begin
//        // ULTIMO CAMPO - HRA_ATUALIZACAO ============================
//        If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
//         Begin
//           sValues:=
//            sValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)+')';
//         End // If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
//
//        // Saldo do Produto (SALDOATUAL) ============================
//        Else
//        If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='SALDOATUAL' Then
//        Begin
//          sValues:=
//           sValues+QuotedStr(sQtdSaldo)+', ';
//        End // If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
//
//        Else
//         Begin
//           // Grava Resto do Registro
//           If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)<>'' Then
//            sValues:=
//             sValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)+', '
//           Else
//            sValues:=
//             sValues+'NULL, ';
//         End;
//      End; // For i:=0 to DMAtualizaEstoques.CDS_LojaLinx.FieldCount-1 do
//
//      // UPDATE OR INSERT INTO MCLI ==================================
//      MySql:=sDML+sValues+' MATCHING (CODFILIAL, CODPRODUTO)';
//      DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//      sCodProd:=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('CodProduto').AsString;
//
//      DMAtualizaEstoques.CDS_LojaLinx.Next;
//    End; // While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
//    DMAtualizaEstoques.CDS_LojaLinx.Close;
//
//    // Zera Produtos que não Foram Utilizados ========================
//    MySql:=' UPDATE ESTOQUE es'+
//           ' SET es.saldoatual=0.0000'+
//           ' WHERE es.codfilial='+QuotedStr(sCodBelShop)+
//           ' AND   es.saldoatual<>0.0000'+
//           ' AND   es.dta_atualizacao<'+QuotedStr(sDtaAtualiza);
//    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//    // Atualiza Todos os Produtos na Tabela ESTOQUE ============================
//    //==========================================================================
//
//    // Limpar Arquivo Work =====================================================
//    MySql:=' DELETE FROM W_LINX_MOVTOS';
//
//    // Insere Movimentos no Arquivo Work =======================================
//    MySql:=' INSERT INTO W_LINX_MOVTOS'+
//           ' SELECT'+
//           ' CAST(LPAD(p.cod_auxiliar,6,0) AS VARCHAR(6)) codproduto,'+
//           ' COALESCE((SUM(d.custo_medio)/count(p.cod_auxiliar)),0.0000) cusmedvalor,'+
//           ' COALESCE(SUM(CASE'+
//           '                WHEN m.operacao in (''E'', ''DS'') THEN'+
//           '                  COALESCE(m.quantidade, 0.0000)'+
//           '                WHEN m.operacao in (''S'', ''DE'') THEN'+
//           '                  COALESCE(-m.quantidade, 0.0000)'+
//           '              END),'+
//           ' 0.00) qtd_movto'+
//
//           ' FROM LINXMOVIMENTO m'+
//           '      LEFT JOIN LINXPRODUTOS p          ON m.cod_produto=p.cod_produto'+
//           '      LEFT JOIN LINXPRODUTOSDETALHES d  ON m.cod_produto=d.cod_produto'+
//           '                                       AND m.empresa    =d.empresa'+
//
//           ' WHERE m.operacao in (''E'', ''DS'', ''S'', ''DE'')'+
//           ' AND   m.cancelado=''N'''+
//           ' AND   m.excluido =''N'''+
//
//           ' AND   TRIM(COALESCE(p.cod_auxiliar,''''))<>'''''+
//           ' AND   CHAR_LENGTH(p.cod_auxiliar)<=6'+
//
//           ' AND   m.data_lancamento>='+QuotedStr(f_Troca('/','.',f_Troca('-','.',sDtaInicioLinx)))+
//           ' AND   m.empresa='+sCodLinx+
//
//           ' GROUP BY 1';
//    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//    // Atualiza Custo Médio ====================================================
//    MySql:=' UPDATE ESTOQUE e'+
//           ' SET e.cusmedvalor=COALESCE((SELECT lm.cusmedvalor'+
//           '                             FROM W_LINX_MOVTOS lm'+
//           '                             WHERE lm.codproduto=e.codproduto), 0.0000)'+
//           ', e.dta_atualizacao='+QuotedStr(sgDataAtual)+
//           ', e.hra_atualizacao='+QuotedStr(sgHoraAtual)+
//           ' WHERE e.codfilial ='+QuotedStr(sCodBelShop);
//    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//    //==========================================================================
//    // Atualiza Estoques e Outros Valores ======================================
//    // Saldo_Final_Sidicom >= 0 ================================================
//    //==========================================================================
//    MySql:=' UPDATE ESTOQUE e'+
//           ' SET e.saldoatual=e.saldo_final_sidicom+COALESCE((SELECT lm.qtd_movto'+
//           '                                                  FROM W_LINX_MOVTOS lm'+
//           '                                                  WHERE lm.codproduto=e.codproduto), 0.0000),'+
//           ' e.pedidopendente=0.0000,'+
//           ' e.zonaendereco=0,'+
//           ' e.corredor=''000'','+
//           ' e.prateleira=''000'','+
//           ' e.gaveta=''0000'','+
//           ' e.estoqueideal=0.0000,'+
//           ' e.estoquemaximo=0.0000,'+
//           ' e.customedio=e.cusmedvalor,'+
//           ' e.lastcustomedio=e.cusmedvalor,'+
//           ' e.dataalteracadastro=current_timestamp,'+
//           ' e.dataalteraestoque=current_timestamp,'+
//           ' e.dataalteraestoque_ped=current_timestamp,'+
//           ' e.dta_atualizacao='+QuotedStr(sgDataAtual)+','+
//           ' e.hra_atualizacao='+QuotedStr(sgHoraAtual)+
//
//           ' WHERE e.saldo_final_sidicom >= 0.00'+
//           ' AND   e.codfilial='+QuotedStr(sCodBelShop);
//    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//    //==========================================================================
//    // Atualiza Estoques e Outros Valores ======================================
//    // Saldo_Final_Sidicom < 0 =================================================
//    //==========================================================================
//    MySql:=' UPDATE ESTOQUE e'+
//           ' SET e.saldoatual=COALESCE((SELECT lm.qtd_movto'+
//           '                            FROM W_LINX_MOVTOS lm'+
//           '                            WHERE lm.codproduto=e.codproduto), 0.0000),'+
//           ' e.pedidopendente=0.0000,'+
//           ' e.zonaendereco=0,'+
//           ' e.corredor=''000'','+
//           ' e.prateleira=''000'','+
//           ' e.gaveta=''0000'','+
//           ' e.estoqueideal=0.0000,'+
//           ' e.estoquemaximo=0.0000,'+
//           ' e.customedio=e.cusmedvalor,'+
//           ' e.lastcustomedio=e.cusmedvalor,'+
//           ' e.dataalteracadastro=current_timestamp,'+
//           ' e.dataalteraestoque=current_timestamp,'+
//           ' e.dataalteraestoque_ped=current_timestamp,'+
//           ' e.dta_atualizacao='+QuotedStr(sgDataAtual)+','+
//           ' e.hra_atualizacao='+QuotedStr(sgHoraAtual)+
//
//           ' WHERE e.saldo_final_sidicom < 0.00'+
//           ' AND   e.codfilial='+QuotedStr(sCodBelShop);
//    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//    // Limpar Arquivo Work =====================================================
//    MySql:=' DELETE FROM W_LINX_MOVTOS';
//    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//    // Zera Produtos que não Foram Utilizados ==================================
//    MySql:=' UPDATE ESTOQUE es'+
//           ' SET es.saldoatual=0.0000'+
//           ' WHERE es.codfilial='+QuotedStr(sCodBelShop)+
//           ' AND   es.saldoatual<>0.0000'+
//           ' AND   es.dta_atualizacao<'+QuotedStr(sgDataAtual);
//    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//    MenssagemAnterior(sCodBelShop);
//    MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
//           ' VALUES ('+
//           QuotedStr(sCodBelShop)+', '+
//           sCodLinx+', '+
//           'CURRENT_TIMESTAMP,'+
//           QuotedStr('LsI')+', '+ // Linx Sem Inventário
//           QuotedStr(Trim(sgMsgAnterior)+' -> OK')+')'+
//           'MATCHING (COD_LOJA)';
//    DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//    // Atualiza Transacao ======================================================
//    DMAtualizaEstoques.SQLC.Commit(TD); // AtualizaEstoquesMovtosLinx
//
//    tgMySqlErro.Add('AtualizaEstoquesMovtosLinx - OK  - '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//    tgMySqlErro.Add('Loja LINX: '+sCodLinx+' SIDICOM: '+sCodBelShop);
//    tgMySqlErro.Add('==================================');
//    tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');
//
//    DateSeparator:='/';
//    DecimalSeparator:=',';
//  Except // Except da Transação
//    on e : Exception do
//    Begin
//      // Abandona Transacao ====================================================
//      DMAtualizaEstoques.SQLC.Rollback(TD); // AtualizaEstoquesMovtosLinx
//
//      tgMySqlErro.Add('AtualizaEstoquesMovtosLinx - ERRO  -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//      tgMySqlErro.Add('Loja LINX: '+sCodLinx+' SIDICOM: '+sCodBelShop);
//      tgMySqlErro.Add('ERROR: '+e.message);
//      tgMySqlErro.Add(MySql);
//      tgMySqlErro.Add('==================================');
//      tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');
//
//      TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
//      TD.IsolationLevel:=xilREADCOMMITTED;
//      DMAtualizaEstoques.SQLC.StartTransaction(TD);
//
//      MenssagemAnterior(sCodBelShop);
//      MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
//             ' VALUES ('+
//             QuotedStr(sCodBelShop)+', '+
//             sCodLinx+', '+
//             ' CURRENT_TIMESTAMP,'+
//             QuotedStr('LsI')+', '+ // Linx Sem Inventário
//             QuotedStr(Trim(sgMsgAnterior)+' -> Atualiza ESTOQUE: '+e.message+' - '+MySql)+')'+
//             'MATCHING (COD_LOJA)';
//      DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//      DMAtualizaEstoques.SQLC.Commit(TD); // AtualizaEstoquesMovtosLinx
//
//      DateSeparator:='/';
//      DecimalSeparator:=',';
//    End; // on e : Exception do
//  End; // Try da Transação
//
//End; // Atualiza Tabela ESTOQUE no Banco de Dados BELSHOP.FDB de Todas as Lojas >>>>>
// OdirApagar - FIM - 26/01/2019 - Não Rodea Mais- Todas tem Inventario

// Cria Componente IBQuery para Conexão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Procedure TFrmAtualizaEstoques.CriaQueryIB(sDataBase, sTransaction: String; Var IBQ_Free: TIBQuery; bMatriz, bCriaIBQ: Boolean);
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

End; // Cria Componente IBQuery para Conexão >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// Conecta Lojas SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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

               // Abre Conexão --------------------------------------
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

               // Fecha Conexão --------------------------------------
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

         // Abre Conexão --------------------------------------
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

         // Fecha Conexão -------------------------------------
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

End; // Conecta Lojas SIDICOM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

procedure TFrmAtualizaEstoques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(tgMySqlErro);

  Application.Terminate;
  Exit;

end;

procedure TFrmAtualizaEstoques.FormCreate(Sender: TObject);
begin
  tgMySqlErro:=TStringList.Create;
  tgMySqlErro.Clear;
  tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');

  // Limpa Obs do Processamento em PAtualizaEstoques
  LimpaOBS;

  Bt_AtualizarClick(Self);
end;

procedure TFrmAtualizaEstoques.Bt_AtualizarClick(Sender: TObject);
var
  bSiga: Boolean;

  MySql: String;

  sTipo: String; // Tipo de Processamento:
                 // Sdm = Sidicom
                 // LsI = Linx Sem Inventário
                 // LcI = Linx Com Inventário

  sCodEmpresa,
  sDtaLinx, sDtaInventLinx,
  sDML, sValues,
  sCodProd,
  sPcUltCompra,

  sQtdSaldo: String;

  i, iCodLinx: Integer;

begin
//=========  ===========  ===============  ================================  ============================================
// Cod Linx	 Data Inicio  Data Inventario	 Variaveis Utilizadas              O Que Fazer
// ========  ===========  ===============  ================================  ============================================
//    SEM	        SEM	          SEM	       iCodLinx=0                        Busca Estoques no SIDICOM Direto
//---------  -----------  ---------------  --------------------------------  --------------------------------------------
//    COM	        COM	          SEM	       iCodLinx<>0 e sDtaInventLinx=''   Só Atualiza Estoques com Movtos Ent/Sai Linx
//---------  -----------  ---------------  --------------------------------  --------------------------------------------
//    COM	        COM	          COM	       iCodLinx<>0 e sDtaInventLinx<>''  Busca Estoques no LINX Direto
// ========  ===========  ===============  ================================  ============================================

  //============================================================================
  // Atualiza Tabela ES_FAT_PERIODO ============================================
  //============================================================================
// OpssAqui
  Tabela_ES_FAT_PERIODO;
  // Atualiza Tabela ES_FAT_PERIODO ============================================
  //============================================================================

  //============================================================================
  // Atualiza Tabela ES_PRODUTOS_MIX ===========================================
  //============================================================================
// OpssAqui
  Tabela_ES_PRODUTOS_MIX;
  // Atualiza Tabela ES_PRODUTOS_MIX ===========================================
  //============================================================================

  // ===========================================================================
  // Atualiza Lista de Preços (0010) do E-Commece no SIDICOM CD ================
  // ===========================================================================
// OpssAqui
//OdirApagar - 06/06/2019
//  AtualizaListaPrecosEcommerce;
  // Atualiza Lista de Preços (0010) do E-Commece no SIDICOM CD ================
  // ===========================================================================

// OpssAqui
  //============================================================================
  // Atualiza Estoques =========================================================
  //============================================================================
  If bgCod_Auxiliar Then
   AtualizaEstgoques;
  // Atualiza Estoques =========================================================
  //============================================================================

// OdirApagar - 10/06/2019 - Substituido pela Procedure Acima ==================
// FIM DO SIDICOM
//  //============================================================================
//  // Atualiza Estoques =========================================================
//  //============================================================================
//  MySql:=' SELECT c.cod_filial, c.cod_linx,'+
//         '        c.endereco_ip, c.endereco_ip_externo,'+
//         '        c.pasta_base_dados, c.des_base_dados,'+
//         '        c.cod_emp, c.razao_social, c.tip_emp,'+
//         '        c.ind_ativo, c.dta_inicio_linx, c.dta_inventario_linx,'+
//         '        ''IBDB_''||c.cod_filial "DATABASE",'+
//         '        ''IBT_''||c.cod_filial  "TRANSACAO",'+
//         '        c.ind_domingo'+
//
//         ' FROM EMP_CONEXOES c'+
//
//         ' WHERE ((c.dta_inicio_linx IS NOT NULL AND c.ind_ativo=''SIM'')'+
//         '        OR'+
//         '        (c.cod_filial=''99''))'+
//
//         ' ORDER BY c.ind_domingo, c.dta_inicio_linx, c.cod_filial';
//  DMAtualizaEstoques.CDS_EmpProcessa.Close;
//  DMAtualizaEstoques.SDS_EmpProcessa.CommandText:=MySql;
//  DMAtualizaEstoques.CDS_EmpProcessa.Open;
//
//  // Inicia Processamento ======================================================
//  DMAtualizaEstoques.CDS_EmpProcessa.First;
//  While Not DMAtualizaEstoques.CDS_EmpProcessa.Eof do
//  Begin
//    // Guarda Momento da Atualização ===========================================
//    sgDataAtual:=f_Troca('/','.',f_Troca('-','.',DateToStr(Date)));
//    sgHoraAtual:=TimeToStr(Time);
//
//    iCodLinx:=DMAtualizaEstoques.CDS_EmpProcessaCOD_LINX.AsInteger;
//    sDtaLinx      :=DMAtualizaEstoques.CDS_EmpProcessaDTA_INICIO_LINX.AsString;
//    sDtaInventLinx:=DMAtualizaEstoques.CDS_EmpProcessaDTA_INVENTARIO_LINX.AsString;
//
//    sCodEmpresa   :=DMAtualizaEstoques.CDS_EmpProcessaCOD_FILIAL.AsString;
//
//
//    // =========================================================================
//    // LINX SEM INVENTARIO - LINX DIRETO =======================================
//    // Atualiza Estoques (LINX) com Movtos Ent/Sai Linx ========================
//    // =========================================================================
//    sTipo:='';
//    bSoAtualMovtoLinx:=False;
//
//    sgDtaInicioProc:=DateTimeToStr(Now);
//    If Not bSoAtualMovtoLinx Then
//    Begin
//      bSiga:=True;
//
//      // Entra no Processamento ================================================
//      If bSiga Then
//      Begin
//        // =====================================================================
//        // Busca ESTOQUE =======================================================
//        // =====================================================================
//        DateSeparator:='.';
//        DecimalSeparator:='.';
//
//        // =====================================================================
//        // LINX COM INVENTARIO - LINX DIRETO ===================================
//        // =====================================================================
//        If (iCodLinx<>0) and (sDtaInventLinx<>'') Then
//        Begin
//          MySql:=' SELECT '+
//                 QuotedStr(sCodEmpresa)+' CODFILIAL,'+
//                 ' pr.codproduto CODPRODUTO,'+
//                 ' COALESCE(lpd.quantidade,0.0000) SALDOATUAL,'+
//                 ' 0.0000 PEDIDOPENDENTE,';
//
//                 If iCodLinx=2 Then
//                  MySql:=
//                   MySql+' COALESCE(es.zonaendereco, 0) ZONAENDERECO,'+
//                         ' COALESCE(es.corredor, ''000'') CORREDOR,'+
//                         ' COALESCE(es.prateleira, ''000'') PRATELEIRA,'+
//                         ' COALESCE(es.gaveta, ''0000'') GAVETA,'
//                 Else
//                  MySql:=
//                   MySql+' 0 ZONAENDERECO,'+
//                         ' ''000'' CORREDOR,'+
//                         ' ''000'' PRATELEIRA,'+
//                         ' ''0000'' GAVETA,';
//
//          MySql:=
//           MySql+' lpd.custo_medio CUSMEDVALOR, lpd.custo_medio CUSTOMEDIO,'+
//                 ' 0.0000 LASTPRECOCOMPRA,'+
//                 ' lpd.custo_medio LASTCUSTOMEDIO,'+
//                 ' 0 ESTOQUEIDEAL, 0 ESTOQUEMAXIMO,'+
//                 ' lp.dt_update DATAALTERACADASTRO,'+
//                 ' lp.dt_update DATAALTERAESTOQUE,'+
//                 ' lp.dt_update DATAALTERAESTOQUE_PED,'+
//                 ' pr.principalfor PRINCIPALFOR, '+
//                 QuotedStr(sgDataAtual)+' DTA_ATUALIZACAO, '+
//                 QuotedStr(sgHoraAtual)+' HRA_ATUALIZACAO'+
//
//                 ' FROM LINXPRODUTOSDETALHES lpd'+
//                 '          LEFT JOIN LINXPRODUTOS lp  ON lp.cod_produto = lpd.cod_produto'+
//                 '          LEFT JOIN PRODUTO pr       ON pr.codproduto = CAST(LPAD(TRIM(lp.cod_auxiliar),6,0) AS VARCHAR(6))';
//
//                 If iCodLinx=2 Then
//                  MySql:=
//                   MySql+'          LEFT join ESTOQUE es       ON es.codproduto=pr.codproduto'+
//                         '                                    AND es.codfilial='+QuotedStr(sCodEmpresa);
//
//          MySql:=
//           MySql+' WHERE lpd.empresa = '+IntToStr(iCodLinx)+
//                 ' AND   TRIM(COALESCE(lp.cod_auxiliar,''''))<>'''''+
//                 ' AND   CHAR_LENGTH(lp.cod_auxiliar)<=6'+
//
//                 ' ORDER BY lp.cod_auxiliar, lpd.quantidade';
//          DMAtualizaEstoques.CDS_LojaLinx.Close;
//          DMAtualizaEstoques.SDS_LojaLinx.CommandText:=MySql;
//
//          Try
//            DMAtualizaEstoques.CDS_LojaLinx.Open;;
//          Except
//            on e : Exception do
//            Begin
//              tgMySqlErro.Add('CDS_LojaLinx - ERRO ABERTURA -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//              tgMySqlErro.Add('Loja LINX: '+IntToStr(iCodLinx)+' SIDICOM: '+sCodEmpresa);
//              tgMySqlErro'.Add('ERROR: '+e.message);
//              tgMySqlErro.Add(MySql);
//              tgMySqlErro.Add('==================================');
//              tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');
//            End; // on e : Exception do
//          End;
//
//          sTipo:='LcI'; // Linx Com Inventário
//        End; // If iCodLinx<>0 Then // LINX <<<<<<<<<<<<<<<<<<<<<<<
//        // =====================================================================
//        // LINX COM INVENTARIO - LINX DIRETO ===================================
//        // =====================================================================
//
//        // Processamento =======================================================
//        If bSiga Then
//        Begin
//          Try
//            // Verifica se Transação esta Ativa
//            If DMAtualizaEstoques.SQLC.InTransaction Then
//             DMAtualizaEstoques.SQLC.Rollback(TD);
//
//            // Monta Transacao  -------------------------------------
//            TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
//            TD.IsolationLevel:=xilREADCOMMITTED;
//            DMAtualizaEstoques.SQLC.StartTransaction(TD);
//
//            DateSeparator:='.';
//            DecimalSeparator:='.';
//
//            // Atualiza Estoques da Loja ----------------------------
//            sDML:=' UPDATE OR INSERT INTO ESTOQUE ('+
//                  ' CODFILIAL, CODPRODUTO, SALDOATUAL, PEDIDOPENDENTE,'+
//                  ' ZONAENDERECO, CORREDOR, PRATELEIRA, GAVETA,'+
//                  ' CUSMEDVALOR, CUSTOMEDIO, LASTPRECOCOMPRA, LASTCUSTOMEDIO,'+
//                  ' ESTOQUEIDEAL, ESTOQUEMAXIMO,'+
//                  ' DATAALTERACADASTRO, DATAALTERAESTOQUE, DATAALTERAESTOQUE_PED,'+
//                  ' PRINCIPALFOR,';
//
//                  If iCodLinx=0 Then // Guarda Último Saldo de Estoque no SIDICOM
//                   sDML:=
//                    sDML+' SALDO_FINAL_SIDICOM,';
//
//            sDML:=
//             sDML+' DTA_ATUALIZACAO, HRA_ATUALIZACAO)'+
//                  ' VALUES (';
//
//            // Atualiza Estoques da Loja ----------------------------------
//            // =================================================================
//            // LINX COM INVENTARIO - LINX DIRETO ===============================
//            // =================================================================
//            If (iCodLinx<>0) And (sDtaInventLinx<>'') Then
//            Begin
//              While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
//              Begin
//                If sCodProd=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('CodProduto').AsString Then
//                 sQtdSaldo:=CurrToStr(StrToCurr(sQtdSaldo)+DMAtualizaEstoques.CDS_LojaLinx.FieldByName('SaldoAtual').AsCurrency)
//                Else
//                 sQtdSaldo:=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('SaldoAtual').AsString;
//
//                sValues:='';
//                For i:=0 to DMAtualizaEstoques.CDS_LojaLinx.FieldCount-1 do
//                Begin
//                  // ULTIMO CAMPO - HRA_ATUALIZACAO ============================
//                  If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
//                   Begin
//                     sValues:=sValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)+')';
//                   End // If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
//
//                  // Saldo Saldo do Produto (SALDOATUAL) =======================
//                  Else
//                  If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].FieldName)='SALDOATUAL' Then
//                  Begin
//                    sValues:=
//                     sValues+QuotedStr(sQtdSaldo)+', ';
//                  End // If Trim(DMAtualizaEstoques.IBQ_EstoqueLoja.Fields[i].FieldName)='HRA_ATUALIZACAO' Then
//                  Else
//                   Begin
//                     // Grava Resto do Registro
//                     If Trim(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)<>'' Then
//                      sValues:=sValues+QuotedStr(DMAtualizaEstoques.CDS_LojaLinx.Fields[i].AsString)+', '
//                     Else
//                      sValues:=sValues+'NULL, ';
//                   End;
//                End; // For i:=0 to DMAtualizaEstoques.CDS_LojaLinx.FieldCount-1 do
//
//                // UPDATE OR INSERT INTO MCLI ==================================
//                MySql:=sDML+sValues+' MATCHING (CODFILIAL, CODPRODUTO)';
//                DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//                sCodProd:=DMAtualizaEstoques.CDS_LojaLinx.FieldByName('CodProduto').AsString;
//
////                If DMAtualizaEstoques.CDS_LojaLinx.RecNo mod 1000=0 Then
////                Begin
////                  DMAtualizaEstoques.SQLC.Commit(TD); // Linx Com Inventário
////
////                  TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
////                  TD.IsolationLevel:=xilREADCOMMITTED;
////                  DMAtualizaEstoques.SQLC.StartTransaction(TD);
////                End; // if DMAtualizaEstoques.CDS_LojaLinx.RecNo mod 1000=0 Then
//
//                DMAtualizaEstoques.CDS_LojaLinx.Next;
//              End; // While Not DMAtualizaEstoques.CDS_LojaLinx.Eof do
//
//              DMAtualizaEstoques.CDS_LojaLinx.Close;
//            End; // If iCodLinx<>0 Then // LINX <<<<<<<<<<<<<<<<<<
//            // =================================================================
//            // LINX COM INVENTARIO - LINX DIRETO ===============================
//            // =================================================================
//
//            // Zera Saldo dos Produtos que não Foram Utilizados ================
//            MySql:=' UPDATE ESTOQUE es'+
//                   ' SET es.saldoatual=0.0000'+
//                   ' WHERE es.codfilial='+QuotedStr(sCodEmpresa)+
//                   ' AND   es.saldoatual<>0.0000'+
//                   ' AND   es.dta_atualizacao<'+QuotedStr(sgDataAtual);
//            DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//            MenssagemAnterior(sCodEmpresa);
//            MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
//                   ' VALUES ('+
//                   QuotedStr(sCodEmpresa)+', '+
//                   IntToStr(iCodLinx)+', '+
//                   ' CURRENT_TIMESTAMP,'+
//                   QuotedStr(sTipo)+', '+ // Linx Com Inventário
//                   QuotedStr(Trim(sgMsgAnterior)+' -> OK')+')'+
//                   'MATCHING (COD_LOJA)';
//            DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//            DMAtualizaEstoques.SQLC.Commit(TD); // Linx Com Inventário
//
//            tgMySqlErro.Add('Atualiza Estoques - OK  - '+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//            tgMySqlErro.Add('Loja LINX: '+IntToStr(iCodLinx)+' SIDICOM: '+sCodEmpresa);
//            tgMySqlErro.Add('==================================');
//            tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');
//
//            DateSeparator:='/';
//            DecimalSeparator:=',';
//          Except
//            on e : Exception do
//            Begin
//              DMAtualizaEstoques.SQLC.Rollback(TD); // Linx Com Inventário
//              DMAtualizaEstoques.IBQ_EstoqueLoja.Close;
//
//              tgMySqlErro.Add('Atualiza Estoques - ERRO  -'+sgDtaInicioProc+' a '+DateTimeToStr(Now));
//              tgMySqlErro.Add('Loja LINX: '+IntToStr(iCodLinx)+' SIDICOM: '+sCodEmpresa);
//              tgMySqlErro.Add('ERROR: '+e.message);
//              tgMySqlErro.Add(MySql);
//              tgMySqlErro.Add('==================================');
//              tgMySqlErro.SaveToFile(sgPath_Local+'@ODIR_AtuaLizaEstoquesProc.txt');
//
//              TD.TransactionID:=Cardinal(FormatDateTime('ddmmyyyy',now)+FormatDateTime('hhnnss',now));
//              TD.IsolationLevel:=xilREADCOMMITTED;
//              DMAtualizaEstoques.SQLC.StartTransaction(TD);
//
//              MenssagemAnterior(sCodEmpresa);
//              MySql:=' UPDATE OR INSERT INTO ES_PROCESSADOS (cod_loja, cod_linx, dta_proc, Tipo, obs)'+
//                     ' VALUES ('+
//                     QuotedStr(sCodEmpresa)+', '+
//                     IntToStr(iCodLinx)+', '+
//                     ' CURRENT_TIMESTAMP,'+
//                     QuotedStr(sTipo)+', '+ // Linx Com Inventário
//                     QuotedStr(Trim(sgMsgAnterior)+' -> Atualiza ESTOQUE: '+e.message+' - '+MySql)+')'+
//                     'MATCHING (COD_LOJA)';
//              DMAtualizaEstoques.SQLC.Execute(MySql,nil,nil);
//
//              DMAtualizaEstoques.SQLC.Commit(TD); // Linx Com Inventário
//
//              DateSeparator:='/';
//              DecimalSeparator:=',';
//
//            End; // on e : Exception do
//          End; // Try
//        End; // If bSiga Then // Processamento =================================
//
//        DateSeparator:='/';
//        DecimalSeparator:=',';
//      End; // If bSiga Then // Entra no Processamento ==========================
//    End; // If Not bSoAtualMovtoLinx Then
//
//    DMAtualizaEstoques.CDS_EmpProcessa.Next;
//  End; // While Not DMAtualizaEstoques.CDS_EmpProcessa.Eof do
//  DMAtualizaEstoques.CDS_EmpProcessa.Close;
//  // Atualiza Estoques =========================================================
//  //============================================================================

  // ===========================================================================
  // Atualiza Saldo LINX Para SIDICOM CD =======================================
  // ===========================================================================
// OpssAqui
//  SaldosTransfere_Linx_Sidicom;
  // Atualiza Saldo LINX Para SIDICOM CD =======================================
  // ===========================================================================

// =============================================================================
// FIM DO PROCESSO =============================================================
// =============================================================================

   Close;
end;

end.
